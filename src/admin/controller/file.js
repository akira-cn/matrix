'use strict';

import Base from './base.js';

export default class extends Base {
  
  async __before(){
    this.userInfo = await this.session('userInfo');
    if(this.userInfo){
      this.assign('user', this.userInfo);
      return Promise.resolve();
    }
    this.redirect('/admin/user');   
    return Promise.reject(); 
  }
  
  async deleteAction(){
    let {id} = this.get();
    let model = this.model("images");
    let fs = require('fs');

    if(id){
      let images = await model.where({id: ['in', id]}).select();
      //console.log(images);
      for(var i = 0; i < images.length; i++){
        let path = think.RESOURCE_PATH + images[i].url;
        //console.log(path);
        if(!/^http(s):\/\//.test(path) && fs.existsSync(path)){
          fs.unlink(path);
        }
      }
      let affectedRows = await model
        .where({id: ['in', id]})
        .delete();
    }

    return this.redirect('/admin/index/images'); 
  }

  async uploadAction(){
    let file = this.file('file');
    let fs = require( 'fs' );
    let src = file.path;

    let url = '/static/upload/' 
      + md5(Math.random()+Date.now()+'').slice(0,16)
      + require('path').parse(src).ext; 

    let moment = require('moment');

    let res = await new Promise(async (resolve) => {
      let qcdn = think.config('qcdn');
      let qiniuConf = think.config('qiniu');
      if(qcdn){
        let cdn = require('qcdn');
        let url = await cdn(src);
        
        let datetime = moment().format('YYYY-MM-DD HH:mm:ss');

        resolve({
          url: url,
          size: file.size,
          filename: file.originalFilename,
          uploadTime: datetime,
          userId: this.userInfo.id     
        });
      }else if(qiniuConf){
        let qiniu = require('node-qiniu');
        qiniu.config({
          access_key: qiniuConf.access_key,
          secret_key: qiniuConf.secret_key
        });

        let bucket = qiniu.bucket('h5jun');

        let des = 'matrix' + url;

        bucket.putFile(des, src, (err, reply) => {
          if(!err){
            let url = qiniuConf.domain +'/'+ des;
            
            let datetime = moment().format('YYYY-MM-DD HH:mm:ss');

            resolve({
              url: url,
              size: file.size,
              filename: file.originalFilename,
              uploadTime: datetime,
              userId: this.userInfo.id              
            });
          }else{
            reject(err);
          }
        });        
      }else{
        let des = think.RESOURCE_PATH + url;
        
        let readStream = fs.createReadStream(src);
        let writeStream = fs.createWriteStream(des);

        readStream.pipe(writeStream);
        readStream.on('end', () => {
          writeStream.end();

          let datetime = moment().format('YYYY-MM-DD HH:mm:ss');
          
          resolve({
            url: url,
            size: file.size,
            filename: file.originalFilename,
            uploadTime: datetime,
            userId: this.userInfo.id
          });
        });
      }
    });

    //console.log(res);
    let model = this.model('images');
    let insertId = await model.add(res);

    if(insertId){
      return this.json({error: '', url: res.url});
    }else{
      return this.json({error: 'upload error'});
    }
  }
}
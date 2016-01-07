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

    if(id){
      let images = await model.where({id: ['in', id]}).select();
      //console.log(images);
      for(var i = 0; i < images.length; i++){
        let path = think.RESOURCE_PATH + images[i].url;
        //console.log(path);
        require('fs').unlink(path);
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

    let url = "/static/upload/" 
      + md5(Math.random()+Date.now()+'').slice(0,16)
      + require('path').parse(src).ext; 
    //+ file.originalFilename;

    let des = think.RESOURCE_PATH + url;

    let res = await new Promise(function(resolve){
      let readStream = fs.createReadStream(src);
      let writeStream = fs.createWriteStream(des);

      readStream.pipe(writeStream);
      readStream.on('end', function() {
        writeStream.end();

        let moment = require('moment');
        let datetime = moment().format('YYYY-MM-DD[T]HH:mm:ss');
        
        resolve({
          url: url,
          size: file.size,
          filename: file.originalFilename,
          uploadTime: datetime
        });
      });
    });

    //console.log(res);
    let model = this.model('images');
    let insertId = await model.add(res);

    if(insertId){
      return this.json({error: ''});
    }else{
      return this.json({error: 'upload error'});
    }
  }
}
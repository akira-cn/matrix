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
    let upload = this.service('uploader').getInstance();

    let file = this.file('file');
    let src = file.path;
    let moment = require('moment');

    let res = await new Promise(async (resolve) => {
      let qcdn = think.config('qcdn');
      let qiniuConf = think.config('qiniu');

      let url = await upload(src);
      
      let datetime = moment().format('YYYY-MM-DD HH:mm:ss');

      resolve({
        url: url,
        size: file.size,
        filename: file.originalFilename,
        uploadTime: datetime,
        userId: this.userInfo.id     
      });
    });

    let model = this.model('images');
    let insertId = await model.add(res);

    if(insertId){
      return this.json({error: '', url: res.url});
    }else{
      return this.json({error: 'upload error'});
    }
  }
}
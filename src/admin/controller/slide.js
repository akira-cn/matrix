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

  async saveAction(){
    let {sid, title, theme, slide_content} = this.post();

    //console.log(title, theme, slide_content); 
    let model = this.model("slideshare");
    let moment = require('moment');
    let datetime = moment().format('YYYY-MM-DD[T]HH:mm:ss');

    let record = {
      title: title,
      theme: theme,
      content: slide_content,
      updateTime: datetime,
      userId: this.userInfo.id,
      createTime: datetime
    };
    //console.log(record);

    if(!sid){
      let insertId = await model.add(record);
    }else{
      let affectedRows = await model
        .where({id: sid})
        .update(record);
    }

    return this.redirect('/admin');
  }
  
  async deleteAction(){
    let {id} = this.get();
    let model = this.model("slideshare");
    let moment = require('moment');
    let datetime = moment().format('YYYY-MM-DD[T]HH:mm:ss');

    if(id){
      let affectedRows = await model
        .where({id: ['in', id]})
        .update({state: 2, updateTime: datetime});
    }

    return this.redirect('/admin');
  }
  
  async recoverAction(){
    let {id} = this.get();
    let model = this.model("slideshare");
    let moment = require('moment');
    let datetime = moment().format('YYYY-MM-DD[T]HH:mm:ss');

    if(id){
      let affectedRows = await model
        .where({id: ['in', id]})
        .update({state: 0, updateTime: datetime});
    }

    return this.redirect('/admin/index/trash');    
  }

  async publishAction(){
    let {id} = this.get();
    let model = this.model("slideshare");
    let moment = require('moment');
    let datetime = moment().format('YYYY-MM-DD[T]HH:mm:ss');

    if(id){
      let data = await model.where({id}).find();
      if(data){
        //console.log(data);
        let affectedRows = await model
          .where({id: ['in', id]})
          .update({state: 0|!data.state, updateTime: datetime});
        }
    }

    return this.redirect('/admin');    
  }

  async destoryAction(){
    let {id} = this.get();
    let model = this.model("slideshare");

    if(id){
      let affectedRows = await model
        .where({id: ['in', id]})
        .delete();
    }

    return this.redirect('/admin/index/trash');     
  }

  async previewAction(){
    let {id} = this.get();
    if(id){
      let model = this.model("slideshare");
      let slide = await model.where({id}).find();
      //console.log(slide);
      this.assign({slide});
    }
    return this.display();
  }
}
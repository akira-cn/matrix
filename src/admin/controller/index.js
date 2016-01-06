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

  async indexAction(){
    let page = this.get('page') || 1;
    let model = this.model('slideshare');
    let slides = await model.page(page, 10)
      .field('slideshare.id, title, theme, state, updateTime, createTime, content, name')
      .join({
        table:'user',
        join:'inner',
        as: 'u',
        on: ['userId', 'u.id']
      })
      .order('createTime DESC')
      .where({userId: this.userInfo.id, state:["<>", 2]})
      .countSelect();

    this.assign({
      slides: slides.data||[],
      pages: slides.totalPages,
      page: slides.currentPage
    });
    return this.display();
  }
  
  async trashAction(){
    let model = this.model('slideshare');
    let slides = await model.page(1, 10)
      .field('slideshare.id, title, theme, state, updateTime, createTime, content, name')
      .join({
        table:'user',
        join:'inner',
        as: 'u',
        on: ['userId', 'u.id']
      })
      .order('createTime DESC')
      .where({userId: this.userInfo.id, state:["=", 2]})
      .countSelect();

    this.assign({
      slides: slides.data||[],
      pages: slides.totalPages,
      page: slides.currentPage
    });
    return this.display();
  }

  settingsAction(){
    return this.display();
  }

  async editAction(){
    let {id} = this.get();
    let slide_data = '';

    if(id){
      let model = this.model('slideshare');
      let slide = await model.where({id: id}).find();
      slide_data = slide;
    }

    this.assign({slide_data});
    return this.display();
  }

  demoAction(){
    return this.display();
  }
}
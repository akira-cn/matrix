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
    return Promise.reject('Required login --> redirecting.'); 
  }
  
  async indexAction(){
    let page = this.get('page') || 1;
    let num = this.get('num') || 10;
    let q = this.get('q');

    let condition = {
      userId: this.userInfo.id, 
      state:["<>", 2]
    };

    if(q){
      condition.title = ['like', '%' + q + '%'];
    }

    let model = this.model('slideshare');
    let slides = await model.page(page, num)
      .field('slideshare.id, title, theme, state, updateTime, createTime, content, name')
      .join({
        table:'user',
        join:'inner',
        as: 'u',
        on: ['userId', 'u.id']
      })
      .order('createTime DESC')
      .where(condition)
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

  async imagesAction(){
    let model = this.model('images');
    let list = await model.page(1, 10)
      .where({userId: this.userInfo.id})
      .order('uploadTime DESC')
      .countSelect();

    this.assign({
      list:list.data || [],
      pages: list.totalPages,
      page: list.currentPage
    });

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
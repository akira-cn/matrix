'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    let model = this.model('slideshare');
    let slides = await model.field('id, title, updateTime').where({state: 1}).select();
    this.assign('slides', slides);
    return this.display();
  }
  async uuaploginAction(){
    let http = this.http;
    let uuap = require('uuap');
    let userInfo = await uuap.getUserInfo(http.req, http.res);

    return this.json(userInfo);
  }
}
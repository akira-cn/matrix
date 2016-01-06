'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async showAction(){
    //auto render template file index_index.html
    let id = this.get('id');
    let model = this.model('slideshare');
    let slide = await model.field('title, theme, content').where({id: id, state: 1}).find();
    this.assign('slide', slide);
    return this.display();
  }
}
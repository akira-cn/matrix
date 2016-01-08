'use strict';

import Base from './base.js';

export default class extends Base {
  /**
   * index action
   * @return {Promise} []
   */
  async indexAction(){
    //auto render template file index_index.html
    let userInfo = await this.session('userInfo');
    if(userInfo){
      this.redirect('/admin');
    }else{
      return this.display();
    }
  }
  async loginAction(){
    let http = this.http;
    let uuap = require('uuap');
    let userInfo = await uuap.getUserInfo(http.req, http.res);
    userInfo.passwd = '--uuap--';
    let model = this.model('user');
    let result = await model
      .where({name: userInfo.userName})
      .thenAdd({
        name: userInfo.userName,
        passwd: userInfo.passwd
      });

    await this.session('userInfo', {
      name: userInfo.userName,
      passwd: userInfo.passwd,
      id: result.id,
      uuap: true
    });
    return this.redirect('/admin');
  }
  async logoutAction(){
    let http = this.http;
    let uuap = require('uuap');
    await this.session('userInfo', '');
    uuap.logout(http.req, http.res)
    return this.redirect('/');
  }
}
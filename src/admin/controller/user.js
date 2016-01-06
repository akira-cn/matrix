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
    let {username, passwd, remember} = this.post();
    //console.log(username, passwd, remember);
    if(username && passwd){
      let model = this.model('user');
      let user = await model.where({name:username}).find();

      if(user.name === username && user.passwd === md5(passwd)){
        //console.log('login');
        await this.session('userInfo', user);
        return this.redirect('/admin');
      }
    }
    return this.redirect('/admin/user');
  }
  async logoutAction(){
    await this.session('userInfo', '');
    return this.redirect('/admin/user');
  }

  async passwdAction(){
    let userInfo = await this.session('userInfo');
    if(!userInfo){
      return this.redirect('/admin/user');
    }
    let {pwd, pwd2} = this.post();

    let result = {validate_result:'error'};

    if(pwd === pwd2){
      let model = this.model('user');
      let passwd = md5(pwd);
      let affectedRows = await model.where({name:userInfo.name})
        .update({passwd: passwd}); 
      //console.log(affectedRows);
      if(affectedRows){
        userInfo.passwd = passwd;
        await this.session('userInfo', userInfo);

        this.assign({validate_result:'success'});
      }
    }

    return this.action('admin/index', 'settings');
  }
}
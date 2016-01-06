'use strict';
/**
 * logic
 * @param  {} []
 * @return {}     []
 */
export default class extends think.logic.base {
  loginAction(){
    if(!this.isPost()){
      return think.statusAction(403, this.http); 
    }
  }
}
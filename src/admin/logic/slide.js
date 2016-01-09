'use strict';
/**
 * logic
 * @param  {} []
 * @return {}     []
 */
export default class extends think.logic.base {
  async saveAction(){
    if(!this.isPost()){
      return think.statusAction(403, this.http); 
    }
    let rules = {
      title: "required",
      slide_content: "required"
    }
    let flag = this.validate(rules);

    if(!flag){
      //this.assign('validate_err', this.errors().title || this.errors().slide_content);
      //return this.action('admin/index', 'edit');
      return this.json({err: this.errors().title || this.errors().slide_content})
    }
  }
}
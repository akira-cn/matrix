'use strict';

export default {
  /**
    {
      type:'qiniu',
      qiniu:{
          ...
      },
      file: {},
      qcdn: {}
    }
   */
  getInstance(){
    let conf = think.config('uploader');
    let instance = require(__dirname + '/uploaders/' + conf.type).bind(null, conf[conf.type]);

    return instance;
  }
}
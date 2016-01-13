'use strict';

export default (opts, src) => {
  let qiniu = require('node-qiniu');
  qiniu.config({
    access_key: opts.access_key,
    secret_key: opts.secret_key
  });

  let bucket = qiniu.bucket(opts.bucket);

  let des = 'matrix/' + require('path').parse(src).base;

  return new Promise((resolve,reject) => {
    bucket.putFile(des, src, (err, reply) => {
      if(!err){
        let url = opts.domain +'/'+ des;
        resolve(url);
      }else{
        reject(err);
      }
    }); 
  });
}
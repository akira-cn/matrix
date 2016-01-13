'use strict';

export default async (opts, src) => {
  let url = '/static/upload/' 
    + require('path').parse(src).base;

  let des = think.RESOURCE_PATH + url;

  let fs = require('fs');
  
  await new Promise((resolve, reject)=>{
    let upload_dir = think.RESOURCE_PATH + '/static/upload';
    fs.stat(upload_dir, (err, st) => {
      if(err){
        fs.mkdirSync(upload_dir, 0o777);
      }
      resolve();
    });
  });

  let readStream = fs.createReadStream(src);
  let writeStream = fs.createWriteStream(des);

  readStream.pipe(writeStream);

  return new Promise((resolve, reject) => {
    readStream.on('end', () => {
      writeStream.end();
      resolve(url); 
    });
  });
}
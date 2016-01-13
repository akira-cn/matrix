'use strict';

export default (opts, src) => {
  let qcdn = require('qcdn');
  return qcdn(src);
}
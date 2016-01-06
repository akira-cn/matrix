'use strict';

/**
 * session configs
 */
export default {
  name: 'thinkjs',
  type: 'file',
  secret: '$B9*JD)Q',
  timeout: 7 * 24 * 3600,
  cookie: { // cookie options
    length: 32,
    httponly: true
  },
  adapter: {
    file: {
      path: think.getPath('common', 'runtime') + '/session',
    }
  }
};
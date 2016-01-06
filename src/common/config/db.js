'use strict';
/**
 * db config
 * @type {Object}
 */
export default {
  /*type: 'mysql',
  host: '127.0.0.1',
  port: '3306',
  name: 'work_slide',
  user: 'root',
  pwd: '209315',
  prefix: '',
  encoding: 'utf8',
  nums_per_page: 10,
  log_sql: true,
  log_connect: true,
  cache: {
    on: true,
    type: '',
    timeout: 3600
  },
  adapter: {
    mysql: {},
    mongo: {}
  }*/

  type: 'sqlite',
  name: 'matrix',
  prefix: '',
  encoding: 'utf8',
  nums_per_page: 10,
  cache: {
    on: true,
    type: '',
    timeout: 3600
  },
  adapter: {
    mysql: {
      host: '127.0.0.1',
      port: '',
      user: 'root',
      pwd: 'root'
    },
    sqlite: {
      path: think.ROOT_PATH + '/sqlite'
    }
  }
};
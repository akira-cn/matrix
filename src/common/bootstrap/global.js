/**
 * this file will be loaded before server started
 * you can define global functions used in controllers, models, templates
 */

/**
 * use global.xxx to define global functions
 * 
 * global.fn1 = function(){
 *     
 * }
 */

global.md5 = function(str) {
  return require('crypto').createHash('md5').update(str, 'utf8').digest('hex');
}

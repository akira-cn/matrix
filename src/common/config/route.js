'use strict';
var route = []
if(think.config('uuap')){
  route = [
    ["admin/user/logout", "admin/uuap/logout"],
    ["admin/user", "admin/uuap/login"],
  ];
}
export default route;

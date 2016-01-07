# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: work_slide
# Generation Time: 2016-01-07 06:23:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `filename` text NOT NULL,
  `size` int(11) NOT NULL,
  `uploadTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table slideshare
# ------------------------------------------------------------

DROP TABLE IF EXISTS `slideshare`;

CREATE TABLE `slideshare` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `theme` varchar(64) NOT NULL DEFAULT '',
  `state` int(11) DEFAULT '0' COMMENT '0-草稿,1-发布,2-删除',
  `updateTime` datetime NOT NULL,
  `content` text,
  `userId` int(11) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `slideshare` WRITE;
/*!40000 ALTER TABLE `slideshare` DISABLE KEYS */;

INSERT INTO `slideshare` (`id`, `title`, `theme`, `state`, `updateTime`, `content`, `userId`, `createTime`)
VALUES
	(96,'我是前端攻城狮','black',1,'2016-01-06 17:18:18','# 我是前端攻城狮\r\n\r\n前端开发的历史、现状与未来\r\n\r\n---\r\n@html,chat:123456\r\n\r\n<h2>现场互动</h2>\r\n<div id=\"qrcode\"></div>\r\n<style>\r\n#qrcode{\r\n  margin: auto;\r\n  text-align: center;  \r\n  width: 340px;\r\n  height: 340px;      \r\n}\r\n</style>\r\n\r\n---\r\n@html,stage:#09c\r\n\r\n<style>\r\n.self-intro .avatar {\r\n  display: inline-block;\r\n  width: 150px;\r\n  height: 150px;\r\n  border-radius: 100px;\r\n  background: url(http://www.zhongzhiyuntu.com/index/img/yy.jpg) no-repeat center center;\r\n  background-size: 213px;\r\n}\r\n.self-intro .name {\r\n  display: inline-block;\r\n  padding-left: 30px;\r\n  position: relative;\r\n  top: -45px;\r\n}\r\n</style>\r\n<div class=\"self-intro\">\r\n    <span class=\"avatar\"></span>\r\n    <h2 class=\"name\">月影（十年踪迹）</h2>\r\n</div>\r\n<ul class=\"contact-list\">\r\n    <li>360奇舞团 团长</li>\r\n    <li>爆米兔H5创意平台创始人</li>\r\n    <li>w3ctech顾问</li>\r\n</ul>\r\n---\r\n#什么是前端？\r\n---\r\n@html\r\n<style>\r\nul.timeline{\r\n  display: table;\r\n  width: 100%;\r\n  margin-top: 55px;\r\n}\r\n\r\nul.timeline:after{\r\n  content: \' \';\r\n  background: url(https://dn-h5jun.qbox.me/timeline_arraw.png) no-repeat;\r\n  background-size: 100% 100%;\r\n  display: block;\r\n  height: 26px;\r\n  background-position: -60px, 0;\r\n}\r\n\r\nul.timeline.next:after{\r\n  background-position: 60px, 0;\r\n  margin: 0 60px 0 -60px;\r\n}\r\n\r\nul.timeline li{\r\n  display: table-cell;\r\n  width: 12%;\r\n  font-size: 14px;\r\n  list-style-type: none;\r\n  display: inline-block;\r\n  margin: 0 15px;\r\n  min-height: 150px;\r\n  vertical-align: top;\r\n}\r\n</style>\r\n<h2>前端20年：1994 - 2014</h2>\r\n<ul class=\"timeline\">\r\n  <li>\r\n    <h2>1994:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"0\">w3c成立</p>\r\n  </li>\r\n  <li>\r\n    <h2>1997:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"1\">html4.0发布</p>\r\n  </li>\r\n  <li>\r\n    <h2>1999:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"2\">MSIE 5.0</p>\r\n    <p class=\"fragment\" data-fragment-index=\"2\"><em>Ajax</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2001:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"3\"><em>MSIE 6.0</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2004:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"4\">Firefox 1.0</p>\r\n    <p class=\"fragment\" data-fragment-index=\"4\"><em>Web 2.0</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2006:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"5\"><em>jQuery</em></p>\r\n  </li>\r\n</ul>\r\n\r\n<ul class=\"timeline next\">\r\n  <li>\r\n    <h2>2014:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"11\"><em>HTML5.0 定稿</em></p>\r\n    <p class=\"fragment\" data-fragment-index=\"11\"><em>Chrome 39</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2011:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"10\"><em>Android 4.0</em></p>\r\n    <p class=\"fragment\" data-fragment-index=\"10\"><em>Bootstrap</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2010:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"9\">iPhone 4</p>\r\n    <p class=\"fragment\" data-fragment-index=\"9\"><em>Zepto</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2009:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"8\"><em>Android 1.6 (G3)</em></p>\r\n    <p class=\"fragment\" data-fragment-index=\"8\"><em>Node.js</em></p>\r\n  </li>\r\n  <li>\r\n    <h2>2008:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"7\"><em>HTML 5.0 草案</em></p>\r\n    <p class=\"fragment\" data-fragment-index=\"7\"><em>Chrome 版本1</em></p>\r\n    <p class=\"fragment\" data-fragment-index=\"7\">Android</p>\r\n  </li>\r\n  <li>\r\n    <h2>2007:</h2>\r\n    <p class=\"fragment\" data-fragment-index=\"6\">Webkit for iOS</p>\r\n  </li>\r\n</ul>\r\n---\r\n## 网站 2005\r\n![](https://dn-h5jun.qbox.me/site2005.jpg)\r\n---\r\n## 网站 2009\r\n![](https://dn-h5jun.qbox.me/site2009.png)\r\n---\r\n## 网站 2014\r\n![](https://dn-h5jun.qbox.me/site2014.jpg)\r\n---\r\n## 前端工程师 2005\r\n![](https://dn-h5jun.qbox.me/fe2005.png)\r\n---\r\n## 前端工程师 2009\r\n![](https://dn-h5jun.qbox.me/fe2009.png)\r\n---\r\n## 前端工程师 2014\r\n![](https://dn-h5jun.qbox.me/fe2014.png)\r\n---\r\n@echart:radar/dark,template\r\n\r\n{\r\n  title : {\r\n      text: \'FE 2003 2009 2014\',\r\n      subtext: \'Web 1.0、Web 2.0、Web 2.0+\'\r\n  },\r\n  tooltip : {\r\n      trigger: \'axis\'\r\n  },\r\n  legend: {\r\n      orient : \'vertical\',\r\n      x : \'right\',\r\n      y : \'bottom\',\r\n      data:[\'FE2003\', \'FE2009\', \'FE2014\']\r\n  },\r\n  toolbox: {\r\n      show : true,\r\n      feature : {\r\n          mark : {show: true},\r\n          dataView : {show: true, readOnly: true},\r\n          restore : {show: true},\r\n          saveAsImage : {show: true}\r\n      }\r\n  },\r\n  polar : [\r\n     {\r\n         indicator : [\r\n             { text: \'HTML\', max: 100},\r\n             { text: \'Design\', max: 100},\r\n             { text: \'Tools\', max: 100},\r\n             { text: \'CSS\', max: 100},\r\n             { text: \'Mobile\', max: 100},\r\n             { text: \'Standards\', max: 100},\r\n             { text: \'JavaScript\', max: 100},\r\n             { text: \'HTTP\', max: 100},\r\n             { text: \'Performance\', max: 100},\r\n          ]\r\n      }\r\n  ],\r\n  calculable : true,\r\n  series : [\r\n      {\r\n          name: \'Web 1.0 时代\',\r\n          type: \'radar\',\r\n          data : [\r\n              {\r\n                  value : [60, 10, 10, 60, 10, 10, 60, 10, 10],\r\n                  name : \'FE2003\'\r\n              }\r\n          ]\r\n      },\r\n      {\r\n          name: \'Web 2.0 时代\',\r\n          type: \'radar\',\r\n          data : [\r\n              {\r\n                  value : [80, 40, 30, 80, 60, 50, 80, 20, 20],\r\n                  name : \'FE2009\'\r\n              }\r\n          ]\r\n      },\r\n      {\r\n          name: \'HTML5 时代\',\r\n          type: \'radar\',\r\n          data : [\r\n              {\r\n                  value : [95, 70, 70, 95, 80, 80, 95, 70, 70],\r\n                  name : \'FE2014\'\r\n              }\r\n          ]\r\n      }\r\n  ]\r\n}\r\n---\r\n## JavaScript 排名\r\n![](https://dn-h5jun.qbox.me/js_rank.png)\r\n---\r\n@echart, template\r\n{\r\n  title : {\r\n      text: \'软件工程师收入 2014\',\r\n      subtext: \'数据来源：github 2014年\'\r\n  },\r\n  tooltip : {\r\n      trigger: \'axis\'\r\n  },\r\n  legend: {\r\n      data:[\'收入2014\']\r\n  },\r\n  toolbox: {\r\n      show : true,\r\n      feature : {\r\n          mark : {show: true},\r\n          dataView : {show: true, readOnly: false},\r\n          magicType : {show: true, type: [\'line\', \'bar\']},\r\n          restore : {show: true},\r\n          saveAsImage : {show: true}\r\n      }\r\n  },\r\n  calculable : true,\r\n  xAxis : [\r\n      {\r\n          type : \'category\',\r\n          data : [\'Per\',\'C#\',\'C\',\'JS\',\'C++\',\'Java\',\'Lua\',\'Python\',\'OC\',\'Ruby\']\r\n      }\r\n  ],\r\n  yAxis : [\r\n      {\r\n          type : \'value\'\r\n      }\r\n  ],\r\n  series : [\r\n      {\r\n          name:\'收入2014\',\r\n          type:\'bar\',\r\n          data:[82.51, 89.07, 90.13, 91.46, 93.5, 94.91, 96.93, 100.72, 108.23, 109.46],\r\n          markPoint : {\r\n              data : [\r\n                  {type : \'max\', name: \'最大值\'},\r\n                  {type : \'min\', name: \'最小值\'}\r\n              ]\r\n          },\r\n          markLine : {\r\n              data : [\r\n                  {type : \'average\', name: \'平均值\'}\r\n              ]\r\n          }\r\n      }\r\n  ]\r\n}\r\n---\r\n## 前端工程师成长之路\r\n<img src=\"https://dn-h5jun.qbox.me/occupation.png\" style=\"width:600px\"/>\r\n---\r\n@echart, template\r\n{\r\n  title : {\r\n      text: \'前端人才需求\',\r\n      subtext: \'数据来源：奇舞团\'\r\n  },\r\n  tooltip : {\r\n      trigger: \'axis\'\r\n  },\r\n  legend: {\r\n      data:[\'前端人才需求\']\r\n  },\r\n  toolbox: {\r\n      show : true,\r\n      feature : {\r\n          mark : {show: true},\r\n          dataView : {show: true, readOnly: false},\r\n          magicType : {show: true, type: [\'line\', \'bar\']},\r\n          restore : {show: true},\r\n          saveAsImage : {show: true}\r\n      }\r\n  },\r\n  calculable : true,\r\n  xAxis : [\r\n      {\r\n          type : \'category\',\r\n          data : [\'2010\', \'2011\',\'2012#\',\'2013\',\'2014\']\r\n      }\r\n  ],\r\n  yAxis : [\r\n      {\r\n          type : \'value\'\r\n      }\r\n  ],\r\n  series : [\r\n      {\r\n          itemStyle: {\r\n            normal: {\r\n              color: \'rgb(69,153,43)\',\r\n            },\r\n            emphasis: {\r\n              color: \'rgb(69,153,43)\',\r\n            }\r\n          },\r\n          name:\'人才需求\',\r\n          type:\'bar\',\r\n          data:[3, 7, 18, 35, 76],\r\n          markLine : {\r\n              itemStyle:{\r\n                  normal:{\r\n                      lineStyle:{\r\n                          type: \'dashed\'\r\n                      }\r\n                  }\r\n              },\r\n              data : [\r\n                  [{type : \'min\'}, {type : \'max\'}]\r\n              ]\r\n          }\r\n      }\r\n  ]\r\n}\r\n---\r\n## 前端行业未来要素\r\n<img src=\"https://dn-h5jun.qbox.me/fe_future.png\" style=\"width:600px\"/>\r\n---\r\n# 前端 - HTML5\r\n---\r\n## 交互 + 外观 + 内容\r\n![](https://dn-h5jun.qbox.me/html_js_css.png)\r\n---\r\n## 简单的 HTML5 页面\r\n```html\r\n<!doctype html>\r\n<html>\r\n    <head>\r\n        <meta charset=\"UTF-8\">\r\n        <title>页面标题</title>\r\n    </head>\r\n    <body>\r\n        <h1>这是内容</h1>\r\n    </body>\r\n</html>\r\n```\r\n---\r\n## Canvas 与骨骼动画\r\n<iframe width=\"600\" height=\"600\" data-src=\"http://s.h5jun.com/demo/dragonbones/robot.htm\"></iframe>\r\n---\r\n## HTML5 游戏\r\n<iframe data-src=\"http://my.baomitu.com/games/flappybird2/\" width=\"800\" height=\"600\"></iframe>\r\n---\r\n## 图像算法\r\n<iframe width=\"400\" height=\"400\" data-src=\"http://s.h5jun.com/demo/bobo/shake.html\"></iframe>\r\n---\r\n## 爆米兔\r\n<iframe width=\"400\" height=\"600\" data-src=\"http://s.h5jun.com/demo/baomitu.html\"></iframe>\r\n---\r\n# 如何学好前端？\r\n---\r\n## 前端学习那些事儿\r\n\r\n* 我该学什么？\r\n* 遇到问题怎么办？\r\n* 技术更新太快怎么办？\r\n---\r\n## 入门：前端技术栈\r\n\r\n* HTML\r\n* CSS\r\n* JavaScript\r\n---\r\n![html5](https://dn-h5jun.qbox.me/html5.png)\r\n---\r\n@html\r\n<img src =\"https://dn-h5jun.qbox.me/w3school.png\">\r\n\r\n<img class=\"fragment\" src=\"https://dn-h5jun.qbox.me/ban.png\" style=\"position:absolute;top:50%;left:50%;transform:translate(-50%,-50%)\" width=\"400\">\r\n---\r\n## 比较好的 HTML 教程\r\n\r\n* [webplatform.org 的 HTML 教程](https://docs.webplatform.org/wiki/html/tutorials)\r\n* [CodeCademy HTML & CSS](https://www.codecademy.com/learn/web)\r\n---\r\n[HTML: The Living Standard ✓](https://developers.whatwg.org/) \r\n---\r\n## 学习 HTML 的关键：语义化\r\n\r\n* HTML 中的元素、属性及属性值都拥有某些含义\r\n* 开发者应该遵循*语义*来编写 HTML\r\n---\r\n## CSS\r\n\r\n* CSS 2.1\r\n* CSS 3 Modules\r\n---\r\n## CSS 教程\r\n\r\n* [MDN: 开始学CSS](https://developer.mozilla.org/zh-CN/docs/Web/Guide/CSS/Getting_started)\r\n* [CodeCademy HTML & CSS](https://www.codecademy.com/learn/web)\r\n* [webplatform.org CSS 教程](https://docs.webplatform.org/wiki/css/tutorials)\r\n---\r\n@html\r\n<img src=\"https://dn-h5jun.qbox.me/css-mastery.jpg\" height=\"500\">  \r\n<img src=\"https://dn-h5jun.qbox.me/css-definitive-guide.jpg\" height=\"500\">\r\n---\r\n## [例子](http://code.w3ctech.com/detail/2373)\r\n```html\r\n<div>\r\n    <img src=\"path/to/img.jpg\" alt=\"desc\">\r\n    <p>text description</p>\r\n</div>\r\n<style>\r\n    img { float: left }\r\n    p { margin-left: 10px; }\r\n</style>\r\n```\r\n---\r\n* 为什么 float 元素不会撑开父容器高度?\r\n* 为什么 img 元素底边会有一些间距？\r\n* 为什么我设置的 vertical-align:middle 不起作用？\r\n---\r\n* [CSS 2.1规范](http://www.w3.org/html/ig/zh/wiki/CSS2)\r\n* 知其所以然\r\n---\r\n* [如何阅读W3C规范](http://www.chinaw3c.org/how-to-read-spec-gb.html)\r\n---\r\n## JavaScript\r\n\r\n* 语言特性\r\n* 浏览器中的JavaScript\r\n    * DOM\r\n    * BOM\r\n    * XHR 等\r\n---\r\n## 快速入门教程\r\n\r\n* [MDN: JavaScript 指南（仅语言特性）](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide)\r\n---\r\n@html\r\n<img src=\"https://dn-h5jun.qbox.me/javascript-definitive-guide.jpg\" height=\"500\">  \r\n<img src=\"https://dn-h5jun.qbox.me/professional-javascript.jpg\" height=\"500\">\r\n---\r\n## JavaScript 参考文档\r\n\r\n* [MDN](https://developer.mozilla.org/)\r\n* [ECMA 262](http://www.ecma-international.org/ecma-262/6.0/index.html)\r\n---\r\n# 深入学习\r\n---\r\n## 工程化\r\n\r\n* 开发更快\r\n* 性能更好\r\n* 更易维护\r\n---\r\n## 开发效率\r\n\r\n* 框架\r\n    * [jQuery: write less, do more](http://jquery.com/)\r\n    * [React: A JavaScript Library For Building User Interfaces](https://facebook.github.io/react/)\r\n\r\n* 组件、复用\r\n    * JavaScript Patterns by Stoyan Stefanov\r\n    * Maintainable JavaScript by Nicholas Zakas\r\n\r\n* 工具化\r\n---\r\n## 性能优化\r\n\r\n* HTTP\r\n    * HTTP 权威指南\r\n\r\n* Browser渲染过程\r\n    * [浏览器的工作原理：新式网络浏览器幕后揭秘](http://www.html5rocks.com/zh/tutorials/internals/howbrowserswork/)\r\n\r\n* 一些书\r\n    * Even Faster Web Sites\r\n    * High Performance Browser Networking\r\n---\r\n## 团队协作\r\n\r\n* 代码规范性\r\n    * [Primer by Github](http://primercss.io/guidelines/)\r\n    * [idiomatic.js](https://github.com/rwaldron/idiomatic.js/tree/master/translations/zh_CN)\r\n\r\n* git\r\n    * [git - 简易指南](http://www.bootcss.com/p/git-guide/)\r\n    * [Pro Git](http://git-scm.com/book/zh/v2)\r\n---\r\n## 专业前端团队\r\n\r\n* [百度FEX](http://fex.baidu.com/)\r\n* [淘宝UED](http://ued.taobao.org/blog/)\r\n* [腾讯AlloyTeam](http://www.alloyteam.com/)\r\n* [360奇舞团](http://www.75team.com/)\r\n---\r\n## 学习平台\r\n<img src=\"https://dn-h5jun.qbox.me/recommand_qrcodes2.png\" style=\"width:500px\"/>\r\n---\r\n## Q & A',1,'2016-01-06 17:18:18'),
	(97,'simple','moon',0,'2016-01-06 17:26:50','你好\r\n\r\n---\r\n<span style=\"color:green\">A4</span>\r\n---\r\n再见！',1,'2016-01-06 17:26:50'),
	(98,'分享ppt','black',1,'2016-01-06 17:34:51','#分享ppt\r\n---\r\n测试',1,'2016-01-06 17:34:48');

/*!40000 ALTER TABLE `slideshare` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `passwd` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `passwd`)
VALUES
	(1,'admin','e10adc3949ba59abbe56e057f20f883e');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

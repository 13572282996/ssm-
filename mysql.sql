/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2018-11-27 16:33:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `ID` int(11) NOT NULL auto_increment,
  `Login` varchar(255) default NULL,
  `Pwd` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '111111');

-- ----------------------------
-- Table structure for `buy`
-- ----------------------------
DROP TABLE IF EXISTS `buy`;
CREATE TABLE `buy` (
  `ID` int(11) NOT NULL auto_increment,
  `Client_ID` int(11) default NULL,
  `Thing_ID` int(11) default NULL,
  `InTime` datetime default NULL,
  `Num` int(11) default NULL,
  `state` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Client_ID` (`Client_ID`),
  KEY `Thing_ID` (`Thing_ID`),
  CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`Thing_ID`) REFERENCES `thing` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy
-- ----------------------------
INSERT INTO `buy` VALUES ('12', '6', '2', '2018-11-26 13:57:55', '1', '1');
INSERT INTO `buy` VALUES ('16', '6', '3', '2018-11-27 16:16:30', '1', '0');
INSERT INTO `buy` VALUES ('17', '6', '8', '2018-11-27 16:16:30', '1', '1');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `login` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `sex` varchar(50) default NULL,
  `tel` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `mail` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('6', '王宝强', 'test', '111111', '男', '13051844444', 'mnnbbbbbbb111', '123@123.com');

-- ----------------------------
-- Table structure for `introduce`
-- ----------------------------
DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce` (
  `ID` int(11) NOT NULL auto_increment,
  `Type` varchar(255) default NULL,
  `Content` text,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of introduce
-- ----------------------------
INSERT INTO `introduce` VALUES ('1', '简介', '尊敬的客户您好，感谢您光临上海泉迎贸易有限公司，本公司经营桶装水配送12年，在上海浦东和浦西拥有多个送水站，同时经营多种品牌桶装水。郑重承诺：本公司是【可口可乐冰露、娃哈哈、农夫山泉、雀巢】一级经销商，所销售桶装水保证质量、提供发票、服务周到！<br>\r\n单位客户可提供增值税发票，付款方式可公对公转账、微信/支付宝转账。量大从优，详情请来电咨询！');
INSERT INTO `introduce` VALUES ('2', '联系我们', '<div class=\"contact-us\"> <h1>11111联系我们</h1> <p>地址：北京市朝阳区农展馆南路13号 瑞辰国际中心15层</p> <p>邮编：100051</p> <p>电话：4000-198-198</p> <p>邮件：kefu.list@cct.cn</p> <p>温馨提示：原客户服务电话\"40061-40031\"已升级为全新客户服务电话\"4000-198-198\"<br></p><p><span>原客户服务电话预计2016年7月30日停止使用 <br></span></p><p><span>这里也是哦<br></span></p> </div>');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `ID` int(11) NOT NULL auto_increment,
  `Title` varchar(255) default NULL,
  `Content` text,
  `Form` varchar(255) default NULL,
  `Hot` int(11) default NULL,
  `InTime` datetime default NULL,
  `img` varchar(255) default NULL,
  `NewsType_ID` int(11) default NULL,
  `zan` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `NewsType_ID` (`NewsType_ID`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`NewsType_ID`) REFERENCES `newstype` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('17', '矿泉水、白开水，一篇文章让你会喝水！', '<p>一、纯净水优缺点大比拼</p> \r\n<p>很多人分不清楚纯净水和矿泉水，其实，大家注意看一下瓶子上的标签就OK啦，我们平时喝的大部分桶装水，都是纯净水。</p> \r\n<p>另外要说的是，市场上看到的很多“太空水”和蒸馏水，其实也是纯净水，别被名字的高大上给吓傻了。</p> \r\n<p>制作原理：制作纯净水的水源原则上可以来自任何途径，通过电渗析器法、离子交换器法、反渗透法、蒸馏法或者其他方法，去除杂质，细菌，有机污染物、无机盐和其他任何添加剂。</p> \r\n<p>优点：显而易见，安全可靠，无污染无杂质。</p> \r\n<p>缺点：在去除杂质，化学物和其他成分的时候，把对人体有益的矿物质也给去除了。</p> \r\n<p>推荐指数：喝纯净水补充水分是完全没问题的，因为，人体补充矿物质必经不会以喝水作为主要来源，水中那点矿物质和食物相比，也是微不足道的。但我个人认为要是水中含有钾镁等对心血管有益的矿物质会更好一点。</p> \r\n<p>二、怎么看弱碱性矿泉水、雪山水、富氧水？</p> \r\n<p>弱碱性矿泉水：</p> \r\n<p>市面上有很多矿泉水会标注PH值，PH值多在7.0-8.5之间，有一个很流行的说法是：弱碱水能够解决人们亚健康和促进人体酸碱平衡的保健功能，因为现在很多人都是酸性体质；</p>', '小时代', '4', '2018-11-26 13:57:55', 'file/4/7838bfb5-7e17-41ee-8745-2764aae8361e.jpg', '1', '1');
INSERT INTO `news` VALUES ('18', '云南中草药上市', '<p>云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市云南中草药上市<br></p>', '原创', '0', '2018-11-27 15:51:17', 'file/11/e5a0b7ab-a960-4cd7-bd47-3119a05d7e7e.jpg', '1', '0');
INSERT INTO `news` VALUES ('19', '云南虫草便宜甩卖', '<p>云南虫草便宜甩卖云南虫草便宜甩卖云南虫草便宜甩卖云南虫草便宜甩卖云南虫草便宜甩卖云南虫草便宜甩卖<br></p>', '本站', '0', '2018-11-27 16:12:32', 'file/11/7e0352c2-e8ce-4a41-bf94-f57a599624cb.jpg', '1', '0');
INSERT INTO `news` VALUES ('20', '北京烤鸭的由来', '<p>北京烤鸭的由来北京烤鸭的由来北京烤鸭的由来北京烤鸭的由来<br></p>', '原创', '2', '2018-11-27 16:14:08', 'file/11/30f64dad-356d-48fd-9a95-3c7223ac8513.jpg', '1', '0');

-- ----------------------------
-- Table structure for `newstype`
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype` (
  `ID` int(11) NOT NULL auto_increment,
  `Type` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES ('1', '农产品分布');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `ID` int(11) NOT NULL auto_increment,
  `Thing_ID` int(11) default NULL,
  `Client_ID` int(11) default NULL,
  `Title` varchar(255) default NULL,
  `Content` text,
  `Intime` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `Jin_ID` (`Thing_ID`),
  KEY `Client_ID` (`Client_ID`),
  CONSTRAINT `pinglun_ibfk_3` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pinglun_ibfk_4` FOREIGN KEY (`Thing_ID`) REFERENCES `thing` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', '2', '6', '场影布置的很好', '很迷人，我龟密下次也来你们家办！<br>', '2018-04-06 13:59:13');
INSERT INTO `pinglun` VALUES ('2', '8', '6', '很好吃', '特别香<br>', '2018-11-27 16:30:34');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `ID` int(11) NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `People` varchar(255) default NULL,
  `Tel` varchar(255) default NULL,
  `Address` varchar(255) default NULL,
  `Mid` varchar(255) default NULL,
  `Pwd` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1000', '海南水产专店', '小胡', '13051487777', '南京市秦淮路88号', 'N84745S100', '111111');
INSERT INTO `shop` VALUES ('1001', '云南草药专销', '王宝强', '15951447844', '南京市六合区中合路74号', 'N58441S20', '111111');
INSERT INTO `shop` VALUES ('1002', '长白山虫草专销店', '习大大', '13548447844', '云南省红河市', 'SN8000100', '111111');
INSERT INTO `shop` VALUES ('1003', '聚来德烤鸭店', '王宝强', '13851448777', '北京中南海', 'SN80001200', '111111');

-- ----------------------------
-- Table structure for `thing`
-- ----------------------------
DROP TABLE IF EXISTS `thing`;
CREATE TABLE `thing` (
  `ID` int(11) NOT NULL auto_increment,
  `Name` varchar(255) default NULL,
  `ThingType_ID` int(11) default NULL,
  `ThingType2_ID` int(11) default NULL,
  `Shop_ID` int(11) default NULL,
  `Price` int(11) default NULL,
  `Content` text,
  `Img` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ThingType_ID` (`ThingType_ID`),
  KEY `ThingType2_ID` (`ThingType2_ID`),
  KEY `Shop_ID` (`Shop_ID`),
  CONSTRAINT `thing_ibfk_1` FOREIGN KEY (`ThingType_ID`) REFERENCES `thingtype` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `thing_ibfk_2` FOREIGN KEY (`ThingType2_ID`) REFERENCES `thingtype2` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `thing_ibfk_3` FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thing
-- ----------------------------
INSERT INTO `thing` VALUES ('2', '黑木耳', '1', '1', '1000', '3200', '<p>以独特的视觉感官去领会一场五彩斑斓的森林系设计，超凡脱俗的还真设计，给人犹如走进童话森林般的奇妙感受。童话故事里的甜蜜场景正在上演，载着满满的祝福，名叫happiness的花朵，将会盛开如星光般璀璨耀眼。</p>', 'file/3/1186717b-0d89-48b5-bcdd-0c393dde67b6.jpg');
INSERT INTO `thing` VALUES ('3', '海带', '1', '1', '1000', '6600', '<p>爱上对的人，会使自己对生活对未来更有信心和希望，并会不停的告诉自己，要永远如太阳花一般，向着光明的方向，爱自己更爱携手相伴的爱人，给予爱人光明与温暖……</p><p>摄影师：胡大少<br><br>化妆师：小甜甜，秋雨<br><br>主持人：郭德纲<br></p>', 'file/3/881b78e2-2efc-42e5-bcfd-a84f124d1c66.jpg');
INSERT INTO `thing` VALUES ('4', '雨花石', '1', '1', '1000', '4800', '<p>彩色森林 The Color Forest! 彩色的梦境幻化出五彩斑斓的奇幻森林……</p><p>摄影师：胡大少<br><br>化妆师：小甜甜，秋雨<br><br>主持人：郭德纲<br></p>', 'file/3/bcf347b0-4f79-405f-8cc3-686bda50e4ef.jpg');
INSERT INTO `thing` VALUES ('6', '北京烤鸭', '1', '1', '1000', '3800', '<p>月色朦胧 ，微风掠过湖面 ，漾开层层波心，仿佛声声低吟， 呼唤夜的精灵。来吧 ，随我们去远方吧 ，去到那未知的辽阔 ，去到那陌生的神秘。</p><p>摄影师：胡大少</p><p>化妆师：小甜甜，秋雨</p><p>主持人：郭德纲<br></p>', 'file/3/4ab68537-6adc-4d9a-bc2b-f4822b9d426e.jpg');
INSERT INTO `thing` VALUES ('7', '冬虫夏草', '3', '3', '1002', '500', '<p>冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草冬虫夏草<br></p>', 'file/11/89775c9d-02f2-4f26-bdab-a3f56c6139c9.jpg');
INSERT INTO `thing` VALUES ('8', '北京烤鸭', '4', '5', '1003', '50', '<p>北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭北京烤鸭<br></p>', 'file/11/bcdd1019-6f51-4696-a30a-9dbce6edeaf3.jpg');

-- ----------------------------
-- Table structure for `thingtype`
-- ----------------------------
DROP TABLE IF EXISTS `thingtype`;
CREATE TABLE `thingtype` (
  `ID` int(11) NOT NULL auto_increment,
  `Type` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thingtype
-- ----------------------------
INSERT INTO `thingtype` VALUES ('1', '水果');
INSERT INTO `thingtype` VALUES ('2', '粗粮');
INSERT INTO `thingtype` VALUES ('3', '药草');
INSERT INTO `thingtype` VALUES ('4', '地方美食');

-- ----------------------------
-- Table structure for `thingtype2`
-- ----------------------------
DROP TABLE IF EXISTS `thingtype2`;
CREATE TABLE `thingtype2` (
  `ID` int(11) NOT NULL auto_increment,
  `Type` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thingtype2
-- ----------------------------
INSERT INTO `thingtype2` VALUES ('1', '东北');
INSERT INTO `thingtype2` VALUES ('2', '南方');
INSERT INTO `thingtype2` VALUES ('3', '云南');
INSERT INTO `thingtype2` VALUES ('4', '长白山');
INSERT INTO `thingtype2` VALUES ('5', '北京');

-- ----------------------------
-- View structure for `buy_view`
-- ----------------------------
DROP VIEW IF EXISTS `buy_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buy_view` AS select `buy`.`ID` AS `ID`,`buy`.`Client_ID` AS `Client_ID`,`buy`.`Thing_ID` AS `Thing_ID`,`buy`.`InTime` AS `InTime`,`buy`.`Num` AS `Num`,`buy`.`state` AS `state`,`thing`.`Shop_ID` AS `shopId` from (`buy` join `thing` on((`buy`.`Thing_ID` = `thing`.`ID`))) ;

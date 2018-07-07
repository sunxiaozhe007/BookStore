/*
Navicat MySQL Data Transfer

Source Server         : sunxiaozhe
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-07-07 22:13:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '商品名称',
  `price` float(10,1) NOT NULL COMMENT '商品定价',
  `detail` text COMMENT '商品描述',
  `pic` varchar(64) DEFAULT NULL COMMENT '商品图片',
  `createtime` datetime NOT NULL COMMENT '生产日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('1', '台式机', '3000.0', '该电脑质量非常好！！！！', null, '2015-02-03 13:22:53');
INSERT INTO `items` VALUES ('2', '笔记本', '6000.0', '笔记本性能好，质量好！！！！！', null, '2015-02-09 13:22:57');
INSERT INTO `items` VALUES ('3', '背包', '200.0', '名牌背包，容量大质量好！！！！', null, '2015-02-06 13:23:02');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('0cb05938-7e2c-4cf2-b178-bda8993e1153', '546sdfdsf', '1');
INSERT INTO `orderitem` VALUES ('0cb05938-7e2c-4cf2-b178-bda8993e1153', '5e6b7a65-0460-4d3a-90bd-4d3bc676eb39', '1');
INSERT INTO `orderitem` VALUES ('0cb05938-7e2c-4cf2-b178-bda8993e1153', 'd1421027-b819-4acd-bfae-8e77b2bbd5bc', '1');
INSERT INTO `orderitem` VALUES ('20700574-8be0-48ab-bde8-19c0489e5868', '5435345345', '1');
INSERT INTO `orderitem` VALUES ('20700574-8be0-48ab-bde8-19c0489e5868', 'dfgsdg', '1');
INSERT INTO `orderitem` VALUES ('25c63a54-a6b2-4c23-96b7-5ad2f561d8a5', 'fdsf', '1');
INSERT INTO `orderitem` VALUES ('4f34707e-437d-4e74-adf6-ea6c86e8eba1', '27484ffe-573d-4806-b64a-71d0ec8e187a', '1');
INSERT INTO `orderitem` VALUES ('4f34707e-437d-4e74-adf6-ea6c86e8eba1', '5435345345', '1');
INSERT INTO `orderitem` VALUES ('68f3a187-846e-4b7c-960c-312d7b5072b5', '5435345345', '3');
INSERT INTO `orderitem` VALUES ('9d0f12ef-55b2-46c2-8f1c-54630268871f', 'dfgsdg', '1');
INSERT INTO `orderitem` VALUES ('a265592f-d245-457a-9631-b0582452dc9f', '5e6b7a65-0460-4d3a-90bd-4d3bc676eb39', '1');
INSERT INTO `orderitem` VALUES ('a9320fff-03da-4136-9883-6b584d506833', '27484ffe-573d-4806-b64a-71d0ec8e187a', '1');
INSERT INTO `orderitem` VALUES ('a9320fff-03da-4136-9883-6b584d506833', '546sdfdsf', '3');
INSERT INTO `orderitem` VALUES ('b9b1dd3e-a81c-46d1-81bf-2a60fb1dc5ec', '546sdfdsf', '1');
INSERT INTO `orderitem` VALUES ('be26e9c1-9724-4d52-bc76-31bfe6bbed50', '546sdfdsf', '1');
INSERT INTO `orderitem` VALUES ('cfb529fe-ed19-471f-a63f-840b6f0bb0f5', '558908e4-07b0-4b2c-88a2-4a163f6a5bd3', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0cb05938-7e2c-4cf2-b178-bda8993e1153', '787', 'xxx', 'xxx', 'xxx', '0', '2018-06-20 16:23:35', '17');
INSERT INTO `orders` VALUES ('20700574-8be0-48ab-bde8-19c0489e5868', '76.4', 'xxx', 'xxx', 'xxx', '1', '2018-05-23 21:55:41', '5');
INSERT INTO `orders` VALUES ('25c63a54-a6b2-4c23-96b7-5ad2f561d8a5', '33', '宝鸡', 'sxz', '110', '0', '2018-05-23 21:17:33', '16');
INSERT INTO `orders` VALUES ('4f34707e-437d-4e74-adf6-ea6c86e8eba1', '98.4', 'xxx', 'xxx', 'xxx', '1', '2018-06-20 16:14:12', '17');
INSERT INTO `orders` VALUES ('68f3a187-846e-4b7c-960c-312d7b5072b5', '31.200000000000003', '西安', 'TYY', '110', '1', '2018-06-20 16:18:54', '5');
INSERT INTO `orders` VALUES ('9d0f12ef-55b2-46c2-8f1c-54630268871f', '66', 'xxx', 'xxx', 'xxx', '0', '2018-05-23 21:52:50', '5');
INSERT INTO `orders` VALUES ('a265592f-d245-457a-9631-b0582452dc9f', '666', 'xxx', 'xxx', 'xxx', '0', '2018-06-20 16:19:38', '17');
INSERT INTO `orders` VALUES ('a9320fff-03da-4136-9883-6b584d506833', '187', 'xxx', 'xxx', 'xxx', '0', '2018-06-21 18:03:39', '17');
INSERT INTO `orders` VALUES ('b9b1dd3e-a81c-46d1-81bf-2a60fb1dc5ec', '33', 'xxx', 'xxx', 'xxx', '1', '2018-05-23 21:39:46', '5');
INSERT INTO `orders` VALUES ('be26e9c1-9724-4d52-bc76-31bfe6bbed50', '33', 'xxx', 'xxx', 'xxx', '0', '2018-06-15 14:12:40', '17');
INSERT INTO `orders` VALUES ('cfb529fe-ed19-471f-a63f-840b6f0bb0f5', '30', 'xxx', 'xxx', 'xxx', '1', '2018-05-24 10:59:07', '5');

-- ----------------------------
-- Table structure for `products`
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('23db2bf0-bebd-4abd-866d-42072a8b3a08', 'g\'h\'f\'d\'g', '0', '', '0', null, '分割分割方法');
INSERT INTO `products` VALUES ('27484ffe-573d-4806-b64a-71d0ec8e187a', '看就看', '88', '生活', '86', null, '吗，将很快');
INSERT INTO `products` VALUES ('5435345345', 'java', '10.4', '文学', '25', 'java基础', '好书');
INSERT INTO `products` VALUES ('546sdfdsf', 'c#', '33', '计算机', '42', '.。', '好书');
INSERT INTO `products` VALUES ('558908e4-07b0-4b2c-88a2-4a163f6a5bd3', '操作系统', '30', '计算机', '49', null, '好书');
INSERT INTO `products` VALUES ('5e6b7a65-0460-4d3a-90bd-4d3bc676eb39', 'ssssssss', '666', '生活', '64', null, 'csads');
INSERT INTO `products` VALUES ('7c039434-1ba1-4c72-ac7f-83619e804118', 'hjhj', '66', '生活', '66', null, 'gfhjhfgh');
INSERT INTO `products` VALUES ('d1421027-b819-4acd-bfae-8e77b2bbd5bc', '看就看', '88', '生活', '87', null, '吗，将很快');
INSERT INTO `products` VALUES ('dfgsdg', '化学', '66', '考试', '75', '化学', '好书');
INSERT INTO `products` VALUES ('e1589496-499b-4323-89bc-b95a26aff4a5', 'jjjjjj', '99', '文学', '99', null, 'ffffff');
INSERT INTO `products` VALUES ('f8d5c02e-41c7-4cb3-84e4-822b4b66aaec', 'ggggg', '88', '生活', '88', null, '，，，，，');
INSERT INTO `products` VALUES ('fdsf', '语文', '33', '考试', '38', '语文', '好书');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'TYY', 'TYY', '女', 'sxz@qq.com', '110', '帆帆帆帆', '69079c7e-1118-4989-bd9d-8b6e437f1b63', '1', '普通用户', '2018-06-20 16:18:38');
INSERT INTO `user` VALUES ('6', 'sunxiaozhe', 'sxz123', '男', '985160269@qq.com', '18729238020', '还行', '639c482f-eb2b-458a-a092-c20e7eee9f0e', '1', 'admin', '2018-05-20 14:53:08');
INSERT INTO `user` VALUES ('16', 'sxz', 'sxz123', '男', 'sunxiaozhe007@163.com', '13888888888', 'sadad', '53fe24f4-9734-43a7-a008-a0503d3c0e42', '1', '普通用户', '2018-05-23 21:16:46');
INSERT INTO `user` VALUES ('17', 'apollo', '123456', '女', 'sunxiaozhe007@163.com', '13665699984', '', '3577b6d4-a480-4329-9f66-927e775797bb', '1', '普通用户', '2018-06-20 16:15:25');
INSERT INTO `user` VALUES ('18', 'rirrr', '123456', '女', '1048641670@qq.com', '15594983778', '', 'eb5e51e2-ab4d-4ed4-9292-4d194743ffeb', null, '普通用户', '2018-06-20 23:51:06');
INSERT INTO `user` VALUES ('19', 'rirrr', '123456', '女', '1048641670@qq.com', '15594983778', '', 'b561b712-d70f-42b6-822f-0fc54c0b790a', null, '普通用户', '2018-06-21 00:02:28');
INSERT INTO `user` VALUES ('20', 'rirrr', '123456', '女', 'ljrr2580@163.com', '15594983778', '', '826156e4-56ae-4a84-9f76-89a96005c961', null, '普通用户', '2018-06-21 00:07:46');
INSERT INTO `user` VALUES ('21', 'zz', '1234567', '男', 'sunxiaozhe007@163.com', '13665699984', 'xxx', '36f1a82b-a6ba-48a8-a590-b115a05a0945', null, '普通用户', '2018-06-21 00:17:10');
INSERT INTO `user` VALUES ('22', 'zzzz', '123456789', '男', '985160269@qq.com', '13665699984', 'khkjh', 'd3d5f3f9-009e-497a-9cf1-08c9a7778d38', null, '普通用户', '2018-06-21 00:20:18');
INSERT INTO `user` VALUES ('23', 'zzz', '1234560', '男', 'sunxiaozhe007@163.com', '13665699984', 'kjjhjh', '58ccd066-763a-43ad-bc31-270f2f288f0a', null, '普通用户', '2018-06-21 00:40:51');
INSERT INTO `user` VALUES ('24', 'zahdskjfh', '123456', '男', 'sunxiaozhe007@163.com', '13665699984', 'sef', '474754c1-875f-4739-beeb-cdf4bfa9ecbd', null, '普通用户', '2018-06-21 00:43:56');
INSERT INTO `user` VALUES ('25', 'ljee', '123456', '女', 'ljrr2580@163.com', '15896325', 'sdaf', 'dddd8787-2ea9-4bd6-85d5-bfb88b75595f', null, '普通用户', '2018-06-21 17:22:06');
INSERT INTO `user` VALUES ('26', 'sun', '123456', '男', '985160269@qq.com', '45645646', '48654165415', '0a77f06e-f378-4bf3-bff1-175f403952a9', null, '普通用户', '2018-06-21 17:23:06');

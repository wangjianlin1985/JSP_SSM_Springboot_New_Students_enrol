/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : school_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-02-06 20:15:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_article`
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `articleId` int(11) NOT NULL auto_increment COMMENT '文章id',
  `title` varchar(80) NOT NULL COMMENT '文章标题',
  `articleClassObj` int(11) NOT NULL COMMENT '文章类别',
  `articlePhoto` varchar(60) NOT NULL COMMENT '文章主图',
  `content` varchar(5000) NOT NULL COMMENT '文章内容',
  `author` varchar(20) default NULL COMMENT '作者',
  `comeFrom` varchar(50) default NULL COMMENT '来源',
  `addTime` varchar(20) default NULL COMMENT '添加时间',
  PRIMARY KEY  (`articleId`),
  KEY `articleClassObj` (`articleClassObj`),
  CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`articleClassObj`) REFERENCES `t_articleclass` (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '学校第一大食堂', '1', 'upload/78b9d504-2187-49e2-a6eb-cbbce9a59740.jpg', '学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>\r\n学校第一食堂，很好吃的饭菜<br/>', '--', '学校新闻办', '2017-12-15 12:13:16');
INSERT INTO `t_article` VALUES ('2', '计算机专业主任', '2', 'upload/da46a469-96a5-49cf-823f-5776659765b5.jpg', '很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>\r\n很负责的老师<br/>', '--', '学校人力资源部', '2017-12-15 12:13:16');
INSERT INTO `t_article` VALUES ('3', '学校第二食堂', '1', 'upload/627c2c66-9d22-46ec-9a95-e41b68346be1.jpg', '学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>\r\n学校第二食堂，很好吃的饭菜<br/>', '--', '学生工作处', '2017-12-15 12:13');
INSERT INTO `t_article` VALUES ('4', '学校教务处', '3', 'upload/8f1400b8-200b-4c92-8b6d-fea971222433.jpg', '学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>\r\n学校教务处，新生报到处<br/>', '--', '教导处', '2017-12-15 12:13');
INSERT INTO `t_article` VALUES ('5', '元旦晚会名单征集', '4', 'upload/0bc0dfeb-5342-4ce3-b5bf-a968623cfcf5.jpg', '马上迎来元旦节，新的一年即将开始了！\r\n学校要组织元旦文艺汇演，要参加的同学来报名了！', '--', '学校文艺中心', '2017-11-15 12:14');
INSERT INTO `t_article` VALUES ('6', '学校冬季运动会', '5', 'upload/fc019a3c-049e-45de-be68-3aaec373a577.jpg', '健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>\r\n健身运动会，冬季运动会即将开幕！<br/>', '--', '学校体育馆', '2017-12-15 13:25:52');

-- ----------------------------
-- Table structure for `t_articleclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_articleclass`;
CREATE TABLE `t_articleclass` (
  `classId` int(11) NOT NULL auto_increment COMMENT '类别id',
  `className` varchar(50) NOT NULL COMMENT '类别名称',
  `classDesc` varchar(500) default NULL COMMENT '类别描述',
  PRIMARY KEY  (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_articleclass
-- ----------------------------
INSERT INTO `t_articleclass` VALUES ('1', '学校食品', '学校食品学校食品');
INSERT INTO `t_articleclass` VALUES ('2', '教师介绍', '教师介绍教师介绍');
INSERT INTO `t_articleclass` VALUES ('3', '学校办公室', '学校办公室学校办公室');
INSERT INTO `t_articleclass` VALUES ('4', '校园资讯', '校园资讯校园资讯');
INSERT INTO `t_articleclass` VALUES ('5', '学校活动', '学校活动');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `title` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `userObj` varchar(20) NOT NULL COMMENT '留言人',
  `replyContent` varchar(2000) default NULL COMMENT '回复内容',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我可以了解学校了', '有了这个网站，我可以查询到各种有关咱们学校的新闻', '2017-12-04 17:03:00', 'user1', '很不错的呢！', '2017-12-09 22:39:05');
INSERT INTO `t_leaveword` VALUES ('3', '大家好，初来咋到', '希望大家一起交流', '2017-11-15 19:56:00', 'user2', '--', '--');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(20) NOT NULL COMMENT 'user_name',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '生日',
  `userImage` varchar(60) NOT NULL COMMENT '用户照片',
  `qq` varchar(20) default NULL COMMENT '用户qq',
  `email` varchar(50) default NULL COMMENT '邮箱',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2017-11-01', 'upload/4357665d-4ac8-4e71-98c0-85592a033cd3.jpg', '71516145151', 'dashen@163.com', '2017-11-15 17:27:53');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '张小倩', '女', '2017-11-01', 'upload/NoImage.jpg', '15154141', '15154141@qq.com', '2017-11-15 19:53:34');

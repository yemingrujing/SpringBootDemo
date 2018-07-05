/*
Navicat MySQL Data Transfer

Source Server         : yifei_socks
Source Server Version : 50722
Source Host           : 192.168.168.5:3306
Source Database       : commerce

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-07-05 16:53:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_menu`;
CREATE TABLE `t_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '资源名称',
  `locked` tinyint(2) DEFAULT '0' COMMENT '菜单是否锁定，1：锁定，0 未锁定',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点 ID',
  `url` varchar(128) DEFAULT NULL COMMENT '访问 url 地址',
  `sort` int(6) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- ----------------------------
-- Records of t_admin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `locked` tinyint(2) DEFAULT '0' COMMENT '角色是否锁定，1：锁定 （不可用），0 未锁定（可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role_menu`;
CREATE TABLE `t_admin_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单表';

-- ----------------------------
-- Records of t_admin_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for t_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user`;
CREATE TABLE `t_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户名字',
  `pass_word` varchar(100) NOT NULL COMMENT '登录密码',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `locked` tinyint(2) NOT NULL DEFAULT '0' COMMENT '账号是否锁定，1：锁定，0 未锁定',
  `delete_flag` tinyint(2) DEFAULT '0' COMMENT '是否删除 （0 - 未删除 ，1 - 已删除）',
  `expired_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_date` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user_id` int(11) DEFAULT NULL COMMENT '更新人ID',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='后台登录用户表';

-- ----------------------------
-- Records of t_admin_user
-- ----------------------------
INSERT INTO `t_admin_user` VALUES ('1', 'liaobing', 'E10ADC3949BA59ABBE56E057F20F883E', '13023189972@163.com', null, '0', '0', null, '1', '2018-06-19 14:48:38', '1', null);

-- ----------------------------
-- Table structure for t_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_user_role`;
CREATE TABLE `t_admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `user_id` int(11) NOT NULL COMMENT '后端登录用户ID',
  `role_id` int(11) NOT NULL COMMENT '后端角色Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_admin_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_advertising
-- ----------------------------
DROP TABLE IF EXISTS `t_advertising`;
CREATE TABLE `t_advertising` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ads_code` varchar(50) NOT NULL COMMENT '广告位编码',
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `ad_type` int(2) NOT NULL COMMENT '广告类型 0:图片,1:文字,2:flash',
  `ad_img_url` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `ad_link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `ad_text` varchar(100) DEFAULT NULL COMMENT '广告文字',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '广告开始时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '广告结束时间',
  `publish_status` smallint(1) NOT NULL DEFAULT '1' COMMENT '上下架标识 1上架 0下架',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='广告信息';

-- ----------------------------
-- Records of t_advertising
-- ----------------------------
INSERT INTO `t_advertising` VALUES ('1', 'AD_APP_INDEX_BANNER', '淘美妆上线', '0', 'http://img', 'http://link', '广告文字', '2018-06-22 09:34:15', '2019-08-30 14:48:38', '1', '2018-06-30 14:48:38', '2018-06-15 14:48:38', '1');
INSERT INTO `t_advertising` VALUES ('2', 'AD_APP_INDEX_MENU', '商会介绍', '0', 'http://img', 'http://link', '', '2018-06-15 00:00:00', '2018-06-30 23:59:59', '1', '2018-06-15 17:08:45', '2018-06-15 17:08:45', '1');
INSERT INTO `t_advertising` VALUES ('3', 'AD_APP_INDEX_MENU', '会员', '0', 'http://img', 'http://link', '', '2018-06-15 00:00:00', '2018-06-30 23:59:59', '1', '2018-06-15 17:09:18', '2018-06-15 17:09:18', '1');
INSERT INTO `t_advertising` VALUES ('4', 'AD_APP_INDEX_MENU', '品牌', '0', 'http://img', 'http://link', '', '2018-06-15 00:00:00', '2018-06-30 23:59:59', '1', '2018-06-15 17:09:26', '2018-06-15 17:09:26', '1');
INSERT INTO `t_advertising` VALUES ('5', 'AD_APP_INDEX_MENU', '红人', '0', 'http://img', 'http://link', '', '2018-06-15 00:00:00', '2018-06-30 23:59:59', '1', '2018-06-15 17:26:24', '2018-06-15 17:26:24', '1');
INSERT INTO `t_advertising` VALUES ('6', 'AD_APP_INDEX_INFO_TOUTIAO', '资讯头条', '1', '', 'http://aticle/1.html', '找货：TOP 20面膜出炉 ，全球最好卖的面膜在这儿', '2018-06-19 18:57:43', '2019-06-19 23:59:59', '1', '2018-06-19 18:56:37', '2018-06-19 18:56:37', '1');
INSERT INTO `t_advertising` VALUES ('7', 'AD_APP_INDEX_INFO_TOUTIAO', '资讯头条', '1', '', 'http://aticle/1.html', '科普贴：干性皮肤如何处理', '2018-06-19 18:57:45', '2019-06-19 23:59:59', '1', '2018-06-19 18:57:20', '2018-06-19 18:57:20', '1');
INSERT INTO `t_advertising` VALUES ('8', 'AD_APP_INDEX_GOODS', '芙丽芳丝面膜团购开始了', '1', '', 'http://goods/1.html', '分类：芦荟、蓝莓、香梨', '2018-06-22 00:00:00', '2019-06-22 23:59:59', '1', '2018-06-22 09:32:35', '2018-06-22 09:32:35', '1');

-- ----------------------------
-- Table structure for t_advertising_site
-- ----------------------------
DROP TABLE IF EXISTS `t_advertising_site`;
CREATE TABLE `t_advertising_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告位ID',
  `ads_code` varchar(50) NOT NULL COMMENT '广告位编码  详细见字典表',
  `ads_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '子标题 如更多',
  `title_view_flag` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否显示标题  1显示  0不显示',
  `ads_type` smallint(3) DEFAULT NULL COMMENT '类型 (0:图片,1:文字,2:flash)',
  `view_max_num` int(5) DEFAULT NULL COMMENT '最大显示数量',
  `height` int(5) DEFAULT NULL COMMENT '长度 (高度)',
  `width` int(5) DEFAULT NULL COMMENT '宽度',
  `ads_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='广告位信息表';

-- ----------------------------
-- Records of t_advertising_site
-- ----------------------------
INSERT INTO `t_advertising_site` VALUES ('1', 'AD_APP_INDEX_BANNER', '', '', '0', '0', '6', '280', '750', '手机端APP首页轮播图', '1');
INSERT INTO `t_advertising_site` VALUES ('2', 'AD_APP_INDEX_MENU', '', '', '0', '0', '6', '280', '750', '手机端APP首页分类', '1');
INSERT INTO `t_advertising_site` VALUES ('3', 'AD_APP_INDEX_INFO_TOUTIAO', '资讯头条', '更多', '1', '0', '6', '280', '750', '手机端APP首页资讯头条', '1');
INSERT INTO `t_advertising_site` VALUES ('4', 'AD_APP_INDEX_GOODS', '', null, '0', '0', '1', '280', '750', '手机端首页商品广告', '1');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(11) NOT NULL COMMENT '类目ID',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `title` varchar(300) NOT NULL COMMENT '标题',
  `digest` varchar(500) DEFAULT NULL COMMENT '摘要',
  `main_url` varchar(300) NOT NULL COMMENT '主图封面地址',
  `type` smallint(1) NOT NULL COMMENT '类型 1图文 2链接',
  `article_url` varchar(500) DEFAULT NULL COMMENT '类型为链接得文章保存链接地址',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `source` smallint(1) NOT NULL COMMENT '文章来源 1淘美妆 2微信',
  `comment_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `view_num` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否有效 1有效 0无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `publish_status` smallint(1) NOT NULL DEFAULT '1' COMMENT '上下架标识 1上架 0下架',
  `top_flag` smallint(1) DEFAULT NULL COMMENT '是否置顶 1是 0否',
  `top_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '置顶时间',
  `view_main_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '文章内是否显示图文封面图 1显示 0不现实',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', '1', '1', '文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '1', '3', '2', '1', '2018-06-25 18:37:32', '2018-06-12 16:29:26', '1', '0', '2018-06-12 16:29:26', '0');
INSERT INTO `t_article` VALUES ('2', '1', '1', '测试文章2文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-25 18:37:35', '2018-06-12 16:30:11', '1', '0', '2018-06-12 16:30:11', '0');
INSERT INTO `t_article` VALUES ('3', '1', null, '测试文章3文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:30:18', '2018-06-12 16:30:18', '1', '0', '2018-06-12 16:30:18', '0');
INSERT INTO `t_article` VALUES ('4', '1', null, '测试文章4文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:03', '2018-06-12 16:33:03', '1', '0', '2018-06-12 16:33:03', '0');
INSERT INTO `t_article` VALUES ('5', '1', null, '测试文章5文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:07', '2018-06-12 16:33:07', '1', '0', '2018-06-12 16:33:07', '0');
INSERT INTO `t_article` VALUES ('6', '1', null, '测试文章6文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:12', '2018-06-12 16:33:12', '1', '0', '2018-06-12 16:33:12', '0');
INSERT INTO `t_article` VALUES ('7', '1', null, '测试文章7文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:17', '2018-06-12 16:33:17', '1', '0', '2018-06-12 16:33:17', '0');
INSERT INTO `t_article` VALUES ('8', '1', null, '测试文章8文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:21', '2018-06-12 16:33:21', '1', '0', '2018-06-12 16:33:21', '0');
INSERT INTO `t_article` VALUES ('9', '1', null, '测试文章9文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:26', '2018-06-12 16:33:26', '1', '0', '2018-06-12 16:33:26', '0');
INSERT INTO `t_article` VALUES ('10', '1', null, '测试文章10文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:35', '2018-06-12 16:33:35', '1', '0', '2018-06-12 16:33:35', '0');
INSERT INTO `t_article` VALUES ('11', '1', null, '测试文章11文章测试标题啊啊啊啊啊啊反对反对', '文章测试摘要啵啵啵宝宝f', '', '1', '', 'lxl', '1', '0', '0', '0', '1', '2018-06-12 16:33:42', '2018-06-12 16:33:42', '1', '0', '2018-06-12 16:33:42', '0');
INSERT INTO `t_article` VALUES ('12', '3', '1', '1个中国彩妆品牌到泰国卖彩妆 开会引千人参加', 'LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。', 'http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 16:25:13', '2018-06-26 16:25:13', '1', '0', '2018-06-26 16:25:13', '0');
INSERT INTO `t_article` VALUES ('13', '3', '1', '有个韩国品牌用5年研发1款抗衰老产品 为啥？', '全球抗衰老市场将在2021年达到2160亿美元，同比增长7.5%', 'http://image.pinguan.com/upload/article/201806/5b304c051bf635.65573936.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 16:35:15', '2018-06-26 16:35:15', '1', '0', '2018-06-26 16:35:15', '0');
INSERT INTO `t_article` VALUES ('14', '3', '1', '韩国消费者钱包收紧 韩妆盯上中国人爱去的免税店', '受到中国游客欢迎的网上渠道和免税店正成为韩国化妆品的主要零售渠道。', 'http://image.pinguan.com/upload/article/201806/5b2cbf989b7186.58659775.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 16:44:06', '2018-06-26 16:44:06', '1', '0', '2018-06-26 16:44:06', '0');
INSERT INTO `t_article` VALUES ('16', '3', '1', '倒立敷面膜是什么新玩法？伊贝诗携手孙坚搞事情', '&ldquo;倒立敷面膜&rdquo;打造了一种护肤减压的新方式。', 'http://image.hzpgc.com/upload/article/content/20180622/1529671710978716.png@85q_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 16:59:30', '2018-06-26 16:59:30', '1', '0', '2018-06-26 16:59:30', '0');
INSERT INTO `t_article` VALUES ('17', '3', '1', '涂了防晒霜还被晒伤？你需要先了解防晒的3个常识', '&ldquo;别让你的化妆品防晒打了折扣。', 'http://image.pinguan.com/upload/article/201806/5b2cc3c2a0fe74.81160708.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 17:11:50', '2018-06-26 17:11:50', '1', '0', '2018-06-26 17:11:50', '0');
INSERT INTO `t_article` VALUES ('18', '3', '1', '这12个在电商渠道卖得火热的进口品牌，今悉数布局CS店', '为更高效的化妆品供需对接而生。', 'http://image.pinguan.com/upload/article/201806/5b2ccd3c8bd768.70494038.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 17:13:35', '2018-06-26 17:13:35', '1', '0', '2018-06-26 17:13:35', '0');
INSERT INTO `t_article` VALUES ('19', '3', '1', '卖不好彩妆的店有救了！它帮你把顾客拽回来！', '顾客不进店，彩妆BA是关键。', 'http://image.pinguan.com/upload/article/201806/5b2c5e559450b1.13268763.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 17:14:52', '2018-06-26 17:14:52', '1', '0', '2018-06-26 17:14:52', '0');
INSERT INTO `t_article` VALUES ('20', '3', '1', '特写｜娇兰佳人发力的药妆市场 还有多少玩家在抢', '强大的市场需求给了这一品类在中国市场立足的机会。', 'http://image.pinguan.com/upload/article/201806/5b2b2171d0b330.56302253.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 17:17:38', '2018-06-26 17:17:38', '1', '0', '2018-06-26 17:17:38', '0');
INSERT INTO `t_article` VALUES ('21', '3', '1', '增长原力丨雅诗兰黛/欧莱雅是如何成就百年企业的', '信念的力量强大无比，甚至是最核心的力量。', 'http://image.pinguan.com/upload/article/201806/5b2b7f624d66f3.44572164.jpg@122h_175w_1e_1c_1wh.jpg', '1', '', '淘美妆APP', '1', '0', '0', '0', '1', '2018-06-26 17:19:23', '2018-06-26 17:19:23', '1', '0', '2018-06-26 17:19:23', '0');

-- ----------------------------
-- Table structure for t_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_article_comment`;
CREATE TABLE `t_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `audit_status` smallint(1) NOT NULL COMMENT '审核状态 0初始化 1通过 2不通过',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `top_flag` smallint(1) NOT NULL COMMENT '置顶标识 1置顶 0不置顶',
  `delete_flag` smallint(1) NOT NULL COMMENT '是否有效标识 1有效 0无效',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论点赞总数',
  PRIMARY KEY (`id`),
  KEY `key_n_comment` (`article_id`,`audit_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='文章评论表';

-- ----------------------------
-- Records of t_article_comment
-- ----------------------------
INSERT INTO `t_article_comment` VALUES ('1', '1', '1', '评论内容测试1', '1', '2018-06-12 16:47:06', '2018-06-12 16:38:46', '0', '1', '3');

-- ----------------------------
-- Table structure for t_article_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `t_article_comment_like`;
CREATE TABLE `t_article_comment_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `like_status` smallint(1) DEFAULT NULL COMMENT '点赞状态  1点赞 2取消点赞',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uq_comment_like` (`comment_id`,`user_id`,`like_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='文章评论点赞记录表';

-- ----------------------------
-- Records of t_article_comment_like
-- ----------------------------
INSERT INTO `t_article_comment_like` VALUES ('1', '1', '99999', '1', '2018-06-12 16:38:14', null);
INSERT INTO `t_article_comment_like` VALUES ('2', '1', '99998', '1', '2018-06-12 16:42:20', null);
INSERT INTO `t_article_comment_like` VALUES ('3', '1', '1', '1', '2018-06-12 16:43:53', null);

-- ----------------------------
-- Table structure for t_article_extend
-- ----------------------------
DROP TABLE IF EXISTS `t_article_extend`;
CREATE TABLE `t_article_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `content` text NOT NULL COMMENT '图文详情内容',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='扩展表';

-- ----------------------------
-- Records of t_article_extend
-- ----------------------------
INSERT INTO `t_article_extend` VALUES ('1', '1', '文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:29:26', '2018-06-12 16:29:26');
INSERT INTO `t_article_extend` VALUES ('2', '2', '测试文章2文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:30:11', '2018-06-12 16:30:11');
INSERT INTO `t_article_extend` VALUES ('3', '3', '测试文章3文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:30:18', '2018-06-12 16:30:18');
INSERT INTO `t_article_extend` VALUES ('4', '4', '测试文章4文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:03', '2018-06-12 16:33:03');
INSERT INTO `t_article_extend` VALUES ('5', '5', '测试文章5文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:07', '2018-06-12 16:33:07');
INSERT INTO `t_article_extend` VALUES ('6', '6', '测试文章6文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:12', '2018-06-12 16:33:12');
INSERT INTO `t_article_extend` VALUES ('7', '7', '测试文章7文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:17', '2018-06-12 16:33:17');
INSERT INTO `t_article_extend` VALUES ('8', '8', '测试文章8文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:21', '2018-06-12 16:33:21');
INSERT INTO `t_article_extend` VALUES ('9', '9', '测试文章9文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:26', '2018-06-12 16:33:26');
INSERT INTO `t_article_extend` VALUES ('10', '10', '测试文章10文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:35', '2018-06-12 16:33:35');
INSERT INTO `t_article_extend` VALUES ('11', '11', '测试文章11文章图文详情fafladsfjodafnvdjodocfmdsaocaocadsdfjda短发短发的放大放大offffff', '', '2018-06-12 16:33:42', '2018-06-12 16:33:42');
INSERT INTO `t_article_extend` VALUES ('12', '12', '<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>', '', '2018-06-26 16:25:13', '2018-06-26 16:25:13');
INSERT INTO `t_article_extend` VALUES ('13', '13', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>姑娘们的心底里，早就不认同以25岁来作为“衰老”的分界线了。在这个颜值高于一切的时代，越来越多的年轻消费者率先将“抗衰”这一诉求提上了日程。</p>', '', '2018-06-26 16:35:15', '2018-06-26 16:35:15');
INSERT INTO `t_article_extend` VALUES ('14', '14', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>近日，韩国受最低薪资上涨等因素影响，劳动力需求减少，工作时间缩短，占家庭收入65%的劳动所得减少，导致韩国消费者钱包收紧，尤其是化妆品支出急剧减少。</p>', '', '2018-06-26 16:44:06', '2018-06-26 16:44:06');
INSERT INTO `t_article_extend` VALUES ('16', '16', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>面膜作为最基础、入门级的护肤用品，几乎每个人都会敷。可是，倒立着敷面膜你听说过吗？</p>', '', '2018-06-26 17:00:57', '2018-06-26 17:00:57');
INSERT INTO `t_article_extend` VALUES ('17', '17', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>大海航行靠舵手，万物生长靠太阳……”正如歌曲所唱的那样，阳光是人们生活中不可或缺的一部分。不过，如果长期在阳光下暴晒则会引起皮肤疾病。特别是在烈日炎炎的夏天，如何才能科学地防晒，以防受到紫外线伤害？</p>', '', '2018-06-26 17:13:17', '2018-06-26 17:13:17');
INSERT INTO `t_article_extend` VALUES ('18', '18', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>有人说，马云改变了人们的购物方式，马化腾改变了人们的交流方式。同样的，电商的崛起和社交软件的流行也影响了化妆品行业，影响了消费者的决策和购买方式。  中国作为一个化妆品消费大国，历来是吸引了众多进口品前来掘金，然而由于直接拓展线下渠道的成本很高等原因，有很多进口品选择了首先试水线上，一经成功便开始拓展线下渠道。  这样一来，因为线上的口碑积累，这些品牌无需进一步的宣传便可赢得消费者的青睐，成为化妆品店里的流量品。</p>', '', '2018-06-26 17:15:01', '2018-06-26 17:15:01');
INSERT INTO `t_article_extend` VALUES ('19', '19', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>彩妆消费热度持续升温，但线下门店的日子却没有想象中那么好过。  我们走访市场发现，据多数店老板反应，彩妆顾客不进店已成为制约线下彩妆销售的首要原因。  在彩妆销售势头上升，整体消费提速的大背景下，顾客为何抛弃了原本具备“人货场”优势的线下门店？新一代顾客的彩妆消费又去了哪里呢？</p>', '', '2018-06-26 17:16:19', '2018-06-26 17:16:19');
INSERT INTO `t_article_extend` VALUES ('20', '20', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p> “6·18购物节”的战线因为预售玩法和各种促销活动从一天拉长到了半个月之久。这期间，作为消费主力的女性又开始了囤货大战，其中最受欢迎的护肤产品是——面膜。也让它所代表的“药妆”品类首次杀入天猫美妆品牌单店销量排行榜前十。</p>', '', '2018-06-26 17:19:04', '2018-06-26 17:19:04');
INSERT INTO `t_article_extend` VALUES ('21', '21', '<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>在NBA这个世界最顶级的篮球赛场上，诞生过许多经典语录。其中最广为人知的恐怕源自篮球巨星科比，当有人问他为什么如此成功时，他回答：“你见过洛杉矶凌晨4点的样子吗</p>', '', '2018-06-26 17:20:50', '2018-06-26 17:20:50');

-- ----------------------------
-- Table structure for t_article_like
-- ----------------------------
DROP TABLE IF EXISTS `t_article_like`;
CREATE TABLE `t_article_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `like_status` smallint(1) NOT NULL COMMENT '点赞状态  1点赞 2取消点赞',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='文章点赞记录表';

-- ----------------------------
-- Records of t_article_like
-- ----------------------------
INSERT INTO `t_article_like` VALUES ('1', '1', '1', '1', '2018-06-12 16:34:51', '2018-06-12 16:34:51');

-- ----------------------------
-- Table structure for t_attr_template_config
-- ----------------------------
DROP TABLE IF EXISTS `t_attr_template_config`;
CREATE TABLE `t_attr_template_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性模板配置主键',
  `category_id` int(11) NOT NULL COMMENT '品类ID',
  `key_name` varchar(100) DEFAULT NULL COMMENT '键值对 key_name 如 产地、生产年份、口感、肤质',
  `value_type` smallint(3) DEFAULT NULL COMMENT '键值对 value类型 0 文本框输入 1:单选 2:多选 3:日历控件',
  `ref_type` smallint(3) DEFAULT NULL COMMENT 'value值来源 1:标签库 2:字典配置表 3：品牌表',
  `dict_type` varchar(50) DEFAULT NULL COMMENT 'ref_type =2时 字典表配置属性类型  单选或者多选的配置时,获取属性项目信息',
  `required` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否必填 1是  0否',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='品类属性配置表';

-- ----------------------------
-- Records of t_attr_template_config
-- ----------------------------
INSERT INTO `t_attr_template_config` VALUES ('1', '-1', '品牌', '1', '3', '', '1', '2018-06-21 14:57:49', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('2', '-1', '生产许可证号', '0', '0', '', '1', '2018-06-21 15:08:11', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('3', '-1', '上市时间', '3', '0', '', '0', '2018-06-21 15:08:11', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('4', '-1', '适合肤质', '1', '2', 'GOODS_ATTR_SUITABLE_SKIN', '0', '2018-06-21 15:08:11', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('5', '-1', '保质期', '1', '2', 'GOODS_ATTR_EXP', '0', '2018-06-21 15:08:11', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('6', '-1', '功效', '2', '2', 'GOODS_ATTR_EFFECT', '1', '2018-06-21 15:08:11', '2018-06-25 16:46:42');
INSERT INTO `t_attr_template_config` VALUES ('7', '-1', '产地', '1', '2', 'PRODUCT_ADDRESS', '1', '2018-06-21 17:27:40', '2018-06-25 16:46:42');

-- ----------------------------
-- Table structure for t_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `t_bank_card`;
CREATE TABLE `t_bank_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_card` varchar(30) NOT NULL COMMENT '银行卡号',
  `user_name` varchar(20) NOT NULL COMMENT '用户名字',
  `account_bank` varchar(50) DEFAULT NULL COMMENT '账户归属银行',
  `create_user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `account_territoriality` varchar(100) DEFAULT NULL COMMENT '账户属地开户银行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户绑定银行卡表';

-- ----------------------------
-- Records of t_bank_card
-- ----------------------------

-- ----------------------------
-- Table structure for t_brand_aptitude
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_aptitude`;
CREATE TABLE `t_brand_aptitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL COMMENT '品牌基本信息ID',
  `record_certificate` varchar(150) DEFAULT NULL COMMENT '化妆品备案凭证（多图）',
  `overseas_brand_business_license` varchar(150) DEFAULT NULL COMMENT '境外品牌所有者营业执照 (图）',
  `quarantine_certificate` varchar(150) DEFAULT NULL COMMENT '进口检验检疫证明（多图）',
  `complete_auth_chain` varchar(150) DEFAULT NULL COMMENT '完整授权链 品牌方（选填）代理商（必填）（多图）',
  `trade_mark_paper_internal` varchar(150) DEFAULT NULL COMMENT '商标注册证-国内（多图）（跨境贸易选填）',
  `trade_mark_paper_overseas` varchar(150) DEFAULT NULL COMMENT '商标注册证-海外（多图）',
  `bill_sales` varchar(150) DEFAULT NULL COMMENT '出货单（多图）',
  `customs_declaration` varchar(150) DEFAULT NULL COMMENT '报关单（多图）',
  `cosmetic_permit` varchar(150) DEFAULT NULL COMMENT '化妆品许可证',
  `knowledge_complaint` smallint(1) DEFAULT NULL COMMENT '是否有知识产权投诉权利（0 - 未有，1 - 有）',
  `special_certificate` varchar(150) DEFAULT NULL COMMENT '是否有特证（多图）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='品牌资质表';

-- ----------------------------
-- Records of t_brand_aptitude
-- ----------------------------
INSERT INTO `t_brand_aptitude` VALUES ('3', '3', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', '2018-07-02 18:01:28');
INSERT INTO `t_brand_aptitude` VALUES ('4', '4', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', '2018-07-02 18:01:55');

-- ----------------------------
-- Table structure for t_brand_aptitude_history
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_aptitude_history`;
CREATE TABLE `t_brand_aptitude_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL COMMENT '品牌基本信息ID',
  `record_certificate` varchar(150) DEFAULT NULL COMMENT '化妆品备案凭证（多图）',
  `overseas_brand_business_license` varchar(150) DEFAULT NULL COMMENT '境外品牌所有者营业执照 (图）',
  `quarantine_certificate` varchar(150) DEFAULT NULL COMMENT '进口检验检疫证明（多图）',
  `complete_auth_chain` varchar(150) DEFAULT NULL COMMENT '完整授权链 品牌方（选填）代理商（必填）（多图）',
  `trade_mark_paper_internal` varchar(150) DEFAULT NULL COMMENT '商标注册证-国内（多图）（跨境贸易选填）',
  `trade_mark_paper_overseas` varchar(150) DEFAULT NULL COMMENT '商标注册证-海外（多图）',
  `bill_sales` varchar(150) DEFAULT NULL COMMENT '出货单（多图）',
  `customs_declaration` varchar(150) DEFAULT NULL COMMENT '报关单（多图）',
  `cosmetic_permit` varchar(150) DEFAULT NULL COMMENT '化妆品许可证',
  `knowledge_complaint` smallint(1) DEFAULT NULL COMMENT '是否有知识产权投诉权利（0 - 未有，1 - 有）',
  `special_certificate` varchar(150) DEFAULT NULL COMMENT '是否有特证（多图）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COMMENT='品牌流水历史资质表';

-- ----------------------------
-- Records of t_brand_aptitude_history
-- ----------------------------
INSERT INTO `t_brand_aptitude_history` VALUES ('87', '92', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('88', '93', 'brand/571266e1-fdb1-4a12-86be-2a91744144b1.jpg', '', 'brand/6611f6ad-5d24-4816-9392-82657b18cfe7.jpg', 'brand/d8f273c1-a3ea-456c-ba8b-caae77d7aeca.jpg', 'brand/ec53c3e9-c994-4133-97be-d7b9afeb53fa.jpg', '', '', 'brand/39b25548-0051-479b-844b-51178807094a.jpg', '', '1', 'brand/579ab59e-2473-436f-844c-8016634aec95.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('89', '94', 'brand/9e81058c-378c-4975-b084-415a7cb7db46.jpg', '', 'brand/f72f64ca-d5f0-4917-95f9-b403eebdb8c8.jpg', 'brand/4ad51709-e37b-4d2e-9821-164788a26c7d.jpg,brand/f4786abc-1090-48f2-b26b-51aed87d5a96.jpg', 'brand/df428fc0-cf1c-4cc1-b587-a51c25e5882c.jpg', '', '', 'brand/dde43f58-55c6-4705-b664-141f332b2e70.jpg', '', '1', 'brand/a1b82a04-ac97-429b-b3a1-684054fa2e2c.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('90', '95', 'brand/1963f2d7-8ca1-408d-8063-09d70990ef1c.jpg', '', 'brand/55d315f7-1a73-4535-9a4f-9f2e53da2c47.jpg', 'brand/21127f33-1626-479f-afd4-33880f565a04.jpg', 'brand/9b83cf22-748d-4bc7-b828-c94c255a9a7b.jpg', '', '', 'brand/cbea4e15-9dfc-45bd-8082-65a7111a10ca.jpg', '', '1', 'brand/6aeca476-6e9d-4908-a318-da49727ac8e3.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('91', '96', 'brand/1963f2d7-8ca1-408d-8063-09d70990ef1c.jpg', '', 'brand/55d315f7-1a73-4535-9a4f-9f2e53da2c47.jpg', 'brand/21127f33-1626-479f-afd4-33880f565a04.jpg', 'brand/9b83cf22-748d-4bc7-b828-c94c255a9a7b.jpg', '', '', 'brand/cbea4e15-9dfc-45bd-8082-65a7111a10ca.jpg', '', '1', 'brand/6aeca476-6e9d-4908-a318-da49727ac8e3.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('92', '97', 'brand/10b96a23-ab61-4f77-8c90-54f14fecb48e.jpg', '', 'brand/f4c685ae-5b2d-4669-87f2-4889c6789745.jpg', 'brand/1ac8496e-2af5-4ae6-9cb7-2f90e448894c.jpg', 'brand/92eeddde-71c3-4539-b60b-b66f156a9c76.jpg', '', '', 'brand/324df70f-8d5b-45c3-9f7e-7fe0a5f93cbc.jpg', '', '1', 'brand/84b2e586-9c99-46eb-abb9-b490255e8436.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('93', '98', 'brand/10b96a23-ab61-4f77-8c90-54f14fecb48e.jpg', '', 'brand/f4c685ae-5b2d-4669-87f2-4889c6789745.jpg', 'brand/1ac8496e-2af5-4ae6-9cb7-2f90e448894c.jpg', 'brand/92eeddde-71c3-4539-b60b-b66f156a9c76.jpg', '', '', 'brand/324df70f-8d5b-45c3-9f7e-7fe0a5f93cbc.jpg', '', '1', 'brand/84b2e586-9c99-46eb-abb9-b490255e8436.jpg', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('94', '99', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('95', '100', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('96', '101', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('97', '102', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('98', '103', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('99', '104', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('100', '105', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('101', '106', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('102', '107', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('103', '108', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('104', '109', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('105', '110', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);
INSERT INTO `t_brand_aptitude_history` VALUES ('106', '111', '化妆品备案凭证（多图）', '境外品牌所有者营业执照 (图）', '进口检验检疫证明（多图）', '完整授权链 品牌方（选填）代理商（必填）（多图）', '商标注册证-国内（多图）（跨境贸易选填）', '商标注册证-海外（多图）', '出货单（多图）', '报关单（多图）', null, '1', '是否有特证（多图）', null);

-- ----------------------------
-- Table structure for t_brand_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_basic_info`;
CREATE TABLE `t_brand_basic_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_pool_id` int(11) DEFAULT NULL COMMENT '品牌池Id',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `brand_name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `trade_types` varchar(60) DEFAULT NULL COMMENT '贸易种类（一般贸易，跨境贸易，国货）（数据字典）',
  `country_code` varchar(16) NOT NULL COMMENT '品牌国籍',
  `production_address` varchar(50) DEFAULT NULL COMMENT '产地',
  `tmall_overseas_shop_flag` smallint(1) DEFAULT '0' COMMENT '天猫国际海外旗舰店（0 - 没有，1 - 有）',
  `tmall_shop_flag` smallint(1) DEFAULT '0' COMMENT '天猫旗舰店（0 - 没有，1 - 有）',
  `main_category` varchar(255) DEFAULT NULL COMMENT '主营类目（存JSON串）',
  `auth_channel` varchar(20) DEFAULT NULL COMMENT '授权渠道',
  `channel_type` varchar(20) NOT NULL COMMENT '渠道类型（品牌方/代理商）',
  `channel_company_name` varchar(50) DEFAULT NULL COMMENT '渠道公司名称',
  `brand_auth_expire_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '品牌授权过期时间',
  `sales_amount_on_line` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全球品牌市场销售概况-线上',
  `sales_amount_under_line` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全球品牌市场销售概况-线下',
  `brand_idea` varchar(200) DEFAULT NULL COMMENT '品牌理念',
  `brand_logo` varchar(60) DEFAULT NULL COMMENT '品牌Logo',
  `status` smallint(1) DEFAULT '0' COMMENT '状态（0 - 已过期， 1- 正常）',
  `sort` smallint(3) DEFAULT NULL COMMENT '排序',
  `initials` varchar(1) DEFAULT NULL COMMENT '品牌名字首字母',
  `initiation_amount` decimal(8,2) DEFAULT '0.00' COMMENT '品牌入驻费用',
  `product_images` varchar(255) DEFAULT NULL COMMENT '产品图（多图）',
  `terminal_images` varchar(255) DEFAULT NULL COMMENT '终端形象（多图）',
  `interval_min` decimal(8,2) DEFAULT '0.00' COMMENT '产品价格最小值',
  `interval_max` decimal(8,2) DEFAULT '0.00' COMMENT '产品价格最大值',
  `page_view` int(8) DEFAULT '0' COMMENT '浏览量',
  `follower_num` int(8) DEFAULT '0' COMMENT '关注人数量',
  `delete_flag` smallint(1) DEFAULT NULL COMMENT '删除标识（0-未删除，1-已删除）',
  `is_main_shop` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是主店铺（0,- 否，1- 是）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `remark1` varchar(255) DEFAULT NULL COMMENT '品牌方备注',
  `remark2` varchar(255) DEFAULT NULL COMMENT '运营备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='品牌基本信息';

-- ----------------------------
-- Records of t_brand_basic_info
-- ----------------------------
INSERT INTO `t_brand_basic_info` VALUES ('3', '1', '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-07-04 16:55:15', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '1', null, 'B', '5000.00', '产品图', '终端形象', '0.00', '0.00', '0', '0', null, '0', '2018-07-04 16:55:15', '1', '备注', null);
INSERT INTO `t_brand_basic_info` VALUES ('4', '2', '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-07-04 16:55:17', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '1', null, 'A', '5000.00', '产品图', '终端形象', '0.00', '0.00', '0', '0', null, '0', '2018-07-04 16:55:17', '1', '备注', null);
INSERT INTO `t_brand_basic_info` VALUES ('5', '3', '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-07-05 00:00:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '1', null, 'A', '5000.00', '产品图', '终端形象', '0.00', '0.00', '0', '0', null, '0', '2018-07-05 14:21:12', '1', '备注', null);

-- ----------------------------
-- Table structure for t_brand_basic_info_history
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_basic_info_history`;
CREATE TABLE `t_brand_basic_info_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_pool_id` int(11) DEFAULT NULL COMMENT '品牌池ID',
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `brand_name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `trade_types` varchar(60) DEFAULT NULL COMMENT '贸易种类（一般贸易，跨境贸易，国货）（数据字典）',
  `country_code` varchar(16) NOT NULL COMMENT '品牌国籍',
  `production_address` varchar(50) DEFAULT NULL COMMENT '生产地址',
  `tmall_overseas_shop_flag` smallint(1) DEFAULT '0' COMMENT '天猫国际海外旗舰店（0 - 没有，1 - 有）',
  `tmall_shop_flag` smallint(1) DEFAULT '0' COMMENT '天猫旗舰店（0 - 没有，1 - 有）',
  `main_category` varchar(255) DEFAULT NULL COMMENT '主营类目（存JSON串）',
  `auth_channel` varchar(20) DEFAULT NULL COMMENT '授权渠道（数据字典）',
  `channel_type` varchar(20) NOT NULL COMMENT '渠道类型（品牌方/代理商）',
  `channel_company_name` varchar(50) DEFAULT NULL COMMENT '渠道公司名称',
  `brand_auth_expire_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '品牌授权过期时间',
  `sales_amount_on_line` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全球品牌市场销售概况-线上',
  `sales_amount_under_line` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '全球品牌市场销售概况-线下',
  `brand_idea` varchar(200) DEFAULT NULL COMMENT '品牌理念',
  `brand_logo` varchar(60) DEFAULT NULL COMMENT '品牌Logo',
  `status` smallint(1) DEFAULT '0' COMMENT '审核状态（0-未审核，1-审核中，2-已审核代付费，3-已审核已付费，4 - 延期待付费，5 - 延期已付费，6 -已拒绝，7 - 已失效）',
  `create_user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `sort` smallint(3) DEFAULT NULL COMMENT '排序',
  `initials` varchar(1) DEFAULT NULL COMMENT '品牌名字首字母',
  `initiation_amount` decimal(8,2) DEFAULT '0.00' COMMENT '品牌入驻费用',
  `product_images` varchar(255) DEFAULT NULL COMMENT '产品图（多图）',
  `terminal_images` varchar(255) DEFAULT NULL COMMENT '终端形象（多图）',
  `delete_flag` smallint(1) DEFAULT NULL COMMENT '删除标识（0-未删除，1-已删除）',
  `is_main_shop` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是主店铺（0,- 否，1- 是）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark1` varchar(255) DEFAULT NULL COMMENT '品牌方备注',
  `remark2` varchar(255) DEFAULT NULL COMMENT '运营备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COMMENT='品牌流水历史基本信息';

-- ----------------------------
-- Records of t_brand_basic_info_history
-- ----------------------------
INSERT INTO `t_brand_basic_info_history` VALUES ('55', null, '老婆老婆老婆', '老婆老婆老婆', 'ceneral_trade', '品牌国籍', 'MP57k7k', '0', '0', '主营类目（存JSON串）', 'ceneral_trade', 'agents', null, '2018-07-07 00:00:00', '8000.20', '8000.20', '100字123456123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', '45a874a4-641b-4416-9b1f-1b19a34ec08d.jpg', '0', '1', null, 'L', '500.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('92', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-07-02 18:00:37', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '2', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', '2018-07-02 18:00:37', '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('93', null, 'jgjvjvvj', 'nvnvjvn n vj', 'ceneral_trade', 'Alex', 'vhhvjvjvjv', '1', '1', 'null', '大中华区代理', 'agents', null, '2018-07-07 00:00:00', '8000.20', '8000.20', 'hcvhvhvhvhhv', 'brand/09125654-5554-46a1-bc32-2a4592deb992.jpg', '0', '1', null, 'J', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('94', null, 'guvjvj', 'hvhvjvvjjv', 'ceneral_trade', '中国', 'hvvhvhvjvj', '1', '1', 'null', '大中华区代理', 'agents', null, '2018-07-03 00:00:00', '8000.20', '8000.20', 'vjjvjvvj', 'brand/09125654-5554-46a1-bc32-2a4592deb992.jpg', '0', '1', null, 'G', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('95', null, 'vjvjbj', 'bjbjbbj', 'ceneral_trade', '中国', 'hvvjvj', '1', '1', 'null', '大中华区代理', 'agents', null, '2018-07-03 00:00:00', '8000.20', '8000.20', '100字123456123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', 'brand/09125654-5554-46a1-bc32-2a4592deb992.jpg', '0', '1', null, 'V', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('96', null, 'vjvjbj', 'bjbjbbj', 'ceneral_trade', '中国', 'hvvjvj', '1', '1', 'null', '大中华区代理', 'agents', null, '2018-07-03 00:00:00', '8000.20', '8000.20', '100字123456123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', 'brand/09125654-5554-46a1-bc32-2a4592deb992.jpg', '0', '1', null, 'V', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('97', null, 'hxhxhxhx', 'jxjxhxh', 'ceneral_trade', 'Candy', 'xhhxhxhxhx', '0', '0', 'null', '大中华区代理', 'agents', null, '2018-07-03 00:00:00', '8000.20', '8000.20', '100字123456123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', 'brand/f01a31ad-6eae-4ae3-a044-c94998fc745d.jpg', '0', '1', null, 'H', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('98', null, 'hxhxhxhx', 'jxjxhxh', 'ceneral_trade', 'Candy', 'xhhxhxhxhx', '0', '0', 'null', '大中华区代理', 'agents', null, '2018-07-03 00:00:00', '8000.20', '8000.20', '100字123456123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890', 'brand/f01a31ad-6eae-4ae3-a044-c94998fc745d.jpg', '0', '1', null, 'H', '0.00', null, null, null, '0', null, null, null);
INSERT INTO `t_brand_basic_info_history` VALUES ('99', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('100', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('101', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('102', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('103', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('104', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('105', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('106', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('107', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('108', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('109', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('110', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-03 00:12:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);
INSERT INTO `t_brand_basic_info_history` VALUES ('111', null, '品牌名称', '英文名称', 'ceneral_trade', '品牌国籍', '生产地址', '0', '0', '主营类目（存JSON串）', '授权渠道', 'agents', '渠道公司名称', '2018-03-04 00:00:00', '8000.20', '3000.30', '品牌理念', '/brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '0', '1', null, 'P', '5000.00', '产品图', '终端形象', null, '0', null, '备注', null);

-- ----------------------------
-- Table structure for t_brand_follow
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_follow`;
CREATE TABLE `t_brand_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_pool_id` int(11) NOT NULL COMMENT '品牌池ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='品牌关注人列表';

-- ----------------------------
-- Records of t_brand_follow
-- ----------------------------
INSERT INTO `t_brand_follow` VALUES ('28', '2020', '1');

-- ----------------------------
-- Table structure for t_brand_pool
-- ----------------------------
DROP TABLE IF EXISTS `t_brand_pool`;
CREATE TABLE `t_brand_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `brand_name_en` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `brand_logo` varchar(60) DEFAULT NULL COMMENT '品牌Logo',
  `initials` varchar(1) DEFAULT NULL COMMENT '品牌名字首字母',
  `is_delete` smallint(1) DEFAULT '0' COMMENT '是否删除（0 - 否， 1 - 是）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='品牌池';

-- ----------------------------
-- Records of t_brand_pool
-- ----------------------------
INSERT INTO `t_brand_pool` VALUES ('1', '欧莱雅', 'K', null, 'P', '0', '2018-07-02 18:28:06');
INSERT INTO `t_brand_pool` VALUES ('2', '欧莱雅', 'K', null, 'P', '0', '2018-07-02 18:01:55');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(16) NOT NULL COMMENT '名称',
  `main_id` int(11) DEFAULT NULL COMMENT '一级类目ID',
  `lev` int(1) NOT NULL COMMENT '等级',
  `pid` int(11) DEFAULT NULL COMMENT '父ID',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否有效  1有效 0无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `type` smallint(1) DEFAULT '1' COMMENT '类型 1资讯',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `img_url` varchar(500) DEFAULT NULL COMMENT '类目主图',
  `publish_status` smallint(1) NOT NULL COMMENT '上下架标识 1上架 0下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', '行业资讯', '1', '1', '0', '1', '2018-06-12 16:27:11', '2018-06-12 16:27:11', '1', '1', 'http://', '1');
INSERT INTO `t_category` VALUES ('2', '会员风采', '2', '1', '0', '1', '2018-06-12 16:27:20', '2018-06-12 16:27:20', '1', '2', 'http://', '1');
INSERT INTO `t_category` VALUES ('3', '品牌走访', '3', '1', '0', '1', '2018-06-12 16:27:30', '2018-06-12 16:27:30', '1', '3', 'http://', '1');
INSERT INTO `t_category` VALUES ('4', '活动资讯', '4', '1', '0', '1', '2018-06-12 16:27:37', '2018-06-12 16:27:37', '1', '4', 'http://', '1');
INSERT INTO `t_category` VALUES ('5', '护肤', '5', '1', '0', '1', '2018-07-04 16:57:00', '2018-07-04 16:57:00', '2', '1', '/1.jpg', '1');
INSERT INTO `t_category` VALUES ('6', '彩妆', '6', '1', '0', '1', '2018-07-04 16:57:15', '2018-07-04 16:57:15', '2', '2', '/1.jpg', '1');
INSERT INTO `t_category` VALUES ('7', '个护', '7', '1', '0', '1', '2018-07-04 16:57:21', '2018-07-04 16:57:21', '2', '3', '/1.jpg', '1');

-- ----------------------------
-- Table structure for t_company
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_type` smallint(1) DEFAULT '0' COMMENT '公司类型（公司 - 0 / 个体户 - 1）',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `boss_name` varchar(20) DEFAULT NULL COMMENT '企业老板姓名',
  `boss_telephone` varchar(255) DEFAULT NULL COMMENT '老板电话',
  `boss_email` varchar(20) DEFAULT NULL COMMENT '老板邮箱',
  `boss_we_chat` varchar(30) DEFAULT NULL COMMENT '老板微信',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名字',
  `address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `company_size` varchar(20) DEFAULT NULL COMMENT '公司规模',
  `alipay_account` varchar(20) DEFAULT NULL COMMENT '支付宝账号',
  `company_role` varchar(20) DEFAULT NULL COMMENT '所在公司角色（CEO、财务、运营、商会对接人、其他）',
  `business_licence_url` varchar(50) DEFAULT NULL COMMENT '营业执照地址',
  `commerce_personnel` varchar(20) DEFAULT NULL COMMENT '商会对接人员',
  `credit_code` varchar(50) DEFAULT NULL COMMENT '统一社会信用代码',
  `coc_email` varchar(20) DEFAULT NULL COMMENT '商会对接人员邮箱',
  `coc_telephone` varchar(20) DEFAULT NULL COMMENT '商会对接人员电话',
  `coc_weixin` varchar(20) DEFAULT NULL COMMENT '商会对接人员微信',
  `proxy_brand` varchar(150) DEFAULT NULL COMMENT '代理品牌',
  `autonomy_brand` varchar(150) DEFAULT NULL COMMENT '自主品牌',
  `status` smallint(1) DEFAULT '0' COMMENT '状态（0-填写，1-申请，2-审核中，3-已通过，4-已拒绝）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='公司信息';

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('1', null, '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('4', null, '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('11', '0', '1', '老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名称', '公司地址', '公司规模', '支付宝账号', '公司角色（CEO、财务）', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('13', '0', '13', '老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名称', '公司地址', '公司规模', '支付宝账号', '公司角色（CEO、财务）', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', '2018-06-29 13:57:04');
INSERT INTO `t_company` VALUES ('15', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('16', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('17', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('18', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('19', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('20', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('21', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('22', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('23', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('24', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('25', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('26', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('27', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('28', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('29', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('30', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('31', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('32', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('33', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('34', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('35', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('36', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('37', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('38', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('39', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', '代理品牌', null, '0', null);
INSERT INTO `t_company` VALUES ('40', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', 'CEO', '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('41', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', '老板微信', '套路诺', '来PK婆说', '100', '13023189972', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('42', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('43', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('44', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('45', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('46', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('47', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('48', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('49', '0', '1', '1公司老板姓名', '18046438383', '307422620', null, '1公司名称', '1公司地址', '0', null, null, 'brand/72ff3315-be1a-4dee-97b9-5c84d5b6bf62.jpg', '阿姐lack', null, '噜噜噜', '路吕天露露', 'UK路UK路', null, null, '0', null);
INSERT INTO `t_company` VALUES ('50', '0', '1', '1公司老板姓名', '18046438383', '307422620', null, '1公司名称', '1公司地址', '0', null, null, 'brand/72ff3315-be1a-4dee-97b9-5c84d5b6bf62.jpg', '阿姐lack', null, '噜噜噜', '路吕天露露', 'UK路UK路', null, null, '0', null);
INSERT INTO `t_company` VALUES ('51', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('52', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('53', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('54', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('55', '0', '1', '老婆老婆老婆', '575757', '老婆老婆老婆', null, '套路诺', '来PK婆说', '0', '0', null, '475176a8-ce3c-4e85-9768-61a3e3a18a26.jpg', '时间就是金钱', null, '老婆老婆老婆', '可人咯人咯人咯', '可人咯啦说', null, null, '0', null);
INSERT INTO `t_company` VALUES ('56', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('57', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('58', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('59', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('60', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('61', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('62', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('63', '0', '1', '噢7k7k7k7k', '57576757', '可人咯人咯人咯人', null, '投诉', '他宿舍啦说', '0', null, null, 'brand/5bc30434-d040-4d34-93c4-06efa04d281d.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('64', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('65', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('66', '0', '1', '老板姓名', '18046438383', '邮箱', null, '公司名称', '公司地址', '0', null, null, 'brand/8498048f-61f7-4b6f-b5a5-2a4cf48f250f.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('67', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('68', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('69', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('70', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('71', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('72', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('73', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('74', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('75', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('76', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('77', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('78', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('79', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('80', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('81', '0', '1', '老板姓名', '1804643838', '邮箱', null, '公司名称', '公司地址', '0', null, null, 'brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('82', '0', '1', '老板姓名', '1804643838', '邮箱', null, '公司名称', '公司地址', '0', null, null, 'brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('83', '0', '1', '老板姓名', '1804643838', 'vjjv', null, '公司名称', '公司地址', '0', null, null, 'brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('84', '0', '1', '老板姓名', '1804643838', 'vjjv', null, '公司名称', '公司地址', '0', null, null, 'brand/e371ab44-60d5-41ec-aafb-c42f465eccb1.jpg', '', null, '', '', '', null, null, '0', null);
INSERT INTO `t_company` VALUES ('85', '0', '1', 'hxhxhxhx', '676767', 'hxhxhxhxhx', null, 'hxhxh', 'hxhxhx', '0', null, null, 'brand/3e880328-21ee-459c-a564-68fc37466404.jpg', 'hxhxhxhx', null, 'hxhxhxhc', '76766768', 'xjhchchchc', null, null, '0', null);
INSERT INTO `t_company` VALUES ('86', '0', '1', 'hxhxhxhx', '676767', 'hxhxhxhxhx', null, 'hxhxh', 'hxhxhx', '0', null, null, 'brand/3e880328-21ee-459c-a564-68fc37466404.jpg', 'hxhxhxhx', null, 'hxhxhxhc', '76766768', 'xjhchchchc', null, null, '0', null);
INSERT INTO `t_company` VALUES ('87', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('88', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('89', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('90', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('91', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('92', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('93', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('94', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('95', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('96', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('97', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('98', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);
INSERT INTO `t_company` VALUES ('99', '0', '1', '企业老板姓名', '老板电话', '老板邮箱', '老板微信', '公司名字', '公司地址', '100', '13023189972', 'CEO', '营业执照地址', '商会对接人员', null, '商会对接人员邮箱', '商会对接人员电话', '商会对接人员微信', '代理品牌', '自主品牌', '0', null);

-- ----------------------------
-- Table structure for t_cooperation_mode_introduce
-- ----------------------------
DROP TABLE IF EXISTS `t_cooperation_mode_introduce`;
CREATE TABLE `t_cooperation_mode_introduce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) DEFAULT NULL COMMENT '合作类型（红人，品牌方，会员）',
  `option_type` varchar(60) DEFAULT NULL COMMENT '选项类型（展会，发布会，推广）',
  `text` longtext COMMENT '文本内容',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='合作方式介绍表';

-- ----------------------------
-- Records of t_cooperation_mode_introduce
-- ----------------------------
INSERT INTO `t_cooperation_mode_introduce` VALUES ('1', 'BRAND_PARTY', 'EXHIBITION', '<p>\r\n  <strong><span style=\"font-size:18px;\">试用流程</span></strong>\r\n</p>\r\n<p>\r\n  <span style=\"color:#666666;\">1、成为认证用户</span>\r\n</p>\r\n<p>\r\n  <span style=\"color:#666666;\">申请试用者必须是淘美商会认证用户</span>\r\n</p>\r\n<p>\r\n  <span style=\"color:#666666;\">2、免费申请试用</span>\r\n</p>\r\n<p>\r\n  <span style=\"color:#666666;\">我们将为你提供各类化妆品免费试用机会</span>\r\n</p>\r\n<p>\r\n  <hr />\r\n  <a href=\"http://www.taobao.com\">点击打开链接</a><br />\r\n  \r\n</p>\r\n<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n  <p>\r\n    aaaa\r\n  </p>\r\n</blockquote>', '2018-07-04 15:20:53', '1');
INSERT INTO `t_cooperation_mode_introduce` VALUES ('2', 'MEMBER', 'RELEASE_CONFERENCE', '<p>\\r\\n  <strong><span style=\\\"font-size:18px;\\\">试用流程</span></strong>\\r\\n</p>\\r\\n<p>\\r\\n  <span style=\\\"color:#666666;\\\">1、成为认证用户</span>\\r\\n</p>\\r\\n<p>\\r\\n  <span style=\\\"color:#666666;\\\">申请试用者必须是淘美商会认证用户</span>\\r\\n</p>\\r\\n<p>\\r\\n  <span style=\\\"color:#666666;\\\">2、免费申请试用</span>\\r\\n</p>\\r\\n<p>\\r\\n  <span style=\\\"color:#666666;\\\">我们将为你提供各类化妆品免费试用机会</span>\\r\\n</p>\\r\\n<p>\\r\\n  <hr />\\r\\n  <a href=\\\"http://www.taobao.com\\\">点击打开链接</a><br />\\r\\n  \\r\\n</p>\\r\\n<blockquote style=\\\"margin: 0 0 0 40px; border: none; padding: 0px;\\\">\\r\\n  <p>\\r\\n    aaaa\\r\\n  </p>\\r\\n</blockquote>', '2018-07-04 15:40:23', '-1');

-- ----------------------------
-- Table structure for t_country
-- ----------------------------
DROP TABLE IF EXISTS `t_country`;
CREATE TABLE `t_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_en` varchar(50) DEFAULT NULL COMMENT '英文国家名字',
  `name` varchar(50) NOT NULL COMMENT '中文国家名字',
  `code` varchar(50) DEFAULT NULL COMMENT '国家编码',
  `sort` smallint(3) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='国家表';

-- ----------------------------
-- Records of t_country
-- ----------------------------
INSERT INTO `t_country` VALUES ('1', 'CHN', '中国', 'CHN', '0');

-- ----------------------------
-- Table structure for t_delivery_address
-- ----------------------------
DROP TABLE IF EXISTS `t_delivery_address`;
CREATE TABLE `t_delivery_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `receiver_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货人姓名',
  `receiver_mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '移动号码',
  `receiver_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '固定号码',
  `receiver_province` int(11) DEFAULT NULL COMMENT '省份',
  `receiver_city` int(11) DEFAULT NULL COMMENT '地市',
  `receiver_country` int(11) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户订单收货地址信息表';

-- ----------------------------
-- Records of t_delivery_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_data`;
CREATE TABLE `t_dict_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_type` varchar(30) NOT NULL COMMENT '字典类型',
  `dict_code` varchar(50) NOT NULL COMMENT '字典code',
  `dict_name` varchar(255) NOT NULL COMMENT '字典名称',
  `has_child` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否有子集 0无 1有',
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- ----------------------------
-- Records of t_dict_data
-- ----------------------------
INSERT INTO `t_dict_data` VALUES ('1', 'PAGE_TEMPLATE', 'APP_PAGE_NET_RED_INDEX', '手机端网红首页模板', '0', null);
INSERT INTO `t_dict_data` VALUES ('2', 'PAGE_TEMPLATE', 'APP_PAGE_INDEX', 'APP首页模板', '0', null);
INSERT INTO `t_dict_data` VALUES ('3', 'PAGE_TEMPLATE', 'APP_BOTTOM_TAB', 'APP底部模板', '0', null);
INSERT INTO `t_dict_data` VALUES ('4', 'PAGE_TEMPLATE', 'APP_HEAD', 'APP头部模板', '0', null);
INSERT INTO `t_dict_data` VALUES ('5', 'PAGE_TEMPLATE', 'APP_PAGE_BRANDS_INDEX', 'APP品牌页模板', '0', null);
INSERT INTO `t_dict_data` VALUES ('6', 'PRODUCT_ADDRESS', 'PROD_ADDRESS_OTHER', '其他国家', '0', null);
INSERT INTO `t_dict_data` VALUES ('7', 'PRODUCT_ADDRESS', 'PROD_ADDRESS_CHINA', '中国', '0', null);
INSERT INTO `t_dict_data` VALUES ('8', 'AD', 'AD_APP_INDEX_BANNER', '手机端首页轮播图广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('9', 'AD', 'AD_APP_INDEX_MENU', '手机端首页分类广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('10', 'AD', 'AD_APP_INDEX_INFO_TOUTIAO', '手机端首页资讯头条广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('11', 'AD', 'AD_APP_INDEX_GOODS', '手机端首页商品广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('12', 'AD', 'AD_APP_INDEX_ZIXUN', '手机端首页资讯广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('13', 'AD', 'AD_APP_INDEX_ORDINARY', '手机端首页普通广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('14', 'AD', 'AD_APP_BRANDS_INDEX_BANNER', '手机端品牌首页轮播图广告', '0', null);
INSERT INTO `t_dict_data` VALUES ('15', 'MESSAGE_CHANNEL', 'MESSAGE_CHANNEL_SMS', '短信', '0', null);
INSERT INTO `t_dict_data` VALUES ('16', 'MESSAGE_CHANNEL', 'MESSAGE_CHANNEL_APP_NOTIFICATION_BAR', 'APP通知栏消息', '0', null);
INSERT INTO `t_dict_data` VALUES ('17', 'MESSAGE_CHANNEL', 'MESSAGE_CHANNEL_APP_APPLICATION', 'APP应用消息', '0', null);
INSERT INTO `t_dict_data` VALUES ('18', 'PROMOTIONS_TYPE', 'trial', '试用', '0', null);
INSERT INTO `t_dict_data` VALUES ('19', 'PROMOTIONS_TYPE', 'group_buy', '团购', '0', null);
INSERT INTO `t_dict_data` VALUES ('20', 'TRADE_TYPES', 'CENERAL_TRADE', '一般贸易', '0', null);
INSERT INTO `t_dict_data` VALUES ('21', 'TRADE_TYPES', 'CENERAL_TRADE_COUNTRY', '一般贸易-国货', '0', null);
INSERT INTO `t_dict_data` VALUES ('22', 'TRADE_TYPES', 'CROSS_BORDER_TRADE', '跨境贸易', '0', null);
INSERT INTO `t_dict_data` VALUES ('23', 'CHANNEL_TYPE', 'AGENTS', '代理商', '0', null);
INSERT INTO `t_dict_data` VALUES ('24', 'CHANNEL_TYPE', 'BRAND_SIDE', '品牌方', '0', null);
INSERT INTO `t_dict_data` VALUES ('25', 'USER_CATEGORY', 'MEMBER', '商会会员', '0', null);
INSERT INTO `t_dict_data` VALUES ('26', 'USER_CATEGORY', 'SENSATION', '红人', '0', null);
INSERT INTO `t_dict_data` VALUES ('27', 'USER_CATEGORY', 'BRAND_PARTY', '品牌方', '0', null);
INSERT INTO `t_dict_data` VALUES ('28', 'MEMBER_TYPE', 'PRESIDENT', '会长', '0', null);
INSERT INTO `t_dict_data` VALUES ('29', 'MEMBER_TYPE', 'DIRECTOR_GENERAL', '理事长', '0', null);

-- ----------------------------
-- Table structure for t_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dict_type`;
CREATE TABLE `t_dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_type` varchar(50) NOT NULL COMMENT '字典类型',
  `dict_type_name` varchar(255) NOT NULL COMMENT '字典类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of t_dict_type
-- ----------------------------
INSERT INTO `t_dict_type` VALUES ('1', 'APP', '手机端');
INSERT INTO `t_dict_type` VALUES ('2', 'PC', 'PC端');
INSERT INTO `t_dict_type` VALUES ('3', 'PAGE_TEMPLATE', '页面模板');
INSERT INTO `t_dict_type` VALUES ('4', 'AD', '广告位');
INSERT INTO `t_dict_type` VALUES ('5', 'PRODUCT_ADDRESS', '产地');
INSERT INTO `t_dict_type` VALUES ('6', 'MESSAGE_CHANNEL', '消息推送渠道');
INSERT INTO `t_dict_type` VALUES ('7', 'PROMOTIONS_TYPE', '促销活动类型');
INSERT INTO `t_dict_type` VALUES ('8', 'TRADE_TYPES', '贸易种类');
INSERT INTO `t_dict_type` VALUES ('9', 'CHANNEL_TYPE', '渠道类型');
INSERT INTO `t_dict_type` VALUES ('10', 'USER_CATEGORY', '用户类别');
INSERT INTO `t_dict_type` VALUES ('11', 'MEMBER_TYPE', '会员类型');
INSERT INTO `t_dict_type` VALUES ('12', 'AUTH_CHANNEL', '授权渠道');

-- ----------------------------
-- Table structure for t_goods_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_collect`;
CREATE TABLE `t_goods_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `spu_id` int(11) NOT NULL COMMENT '收藏商品',
  `collect_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  `cancel_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '取消收藏时间',
  `delete_flag` smallint(1) NOT NULL COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品收藏表';

-- ----------------------------
-- Records of t_goods_collect
-- ----------------------------

-- ----------------------------
-- Table structure for t_invoice
-- ----------------------------
DROP TABLE IF EXISTS `t_invoice`;
CREATE TABLE `t_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` int(11) NOT NULL COMMENT '公司ID',
  `invoice_type` smallint(1) DEFAULT NULL COMMENT '发票类型（普票-0，增值税专用发票-1）',
  `invoice_title` varchar(50) DEFAULT NULL COMMENT '发票抬头',
  `duty_paragraph` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `telephone` varchar(16) DEFAULT NULL COMMENT '注册电话',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `register_address` varchar(100) DEFAULT NULL COMMENT '单位注册地址',
  `invoice_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='发票表信息维护表';

-- ----------------------------
-- Records of t_invoice
-- ----------------------------
INSERT INTO `t_invoice` VALUES ('1', '13', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', null);
INSERT INTO `t_invoice` VALUES ('3', '15', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('4', '16', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '公司注册地址', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('5', '17', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('6', '18', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('7', '19', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('8', '20', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('9', '21', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('10', '22', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('11', '23', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('12', '24', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('13', '25', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('14', '26', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('15', '27', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('16', '28', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('17', '29', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('18', '30', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('19', '31', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('20', '32', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('21', '33', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('22', '34', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('23', '35', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('24', '36', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('25', '37', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('26', '38', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('27', '39', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('28', '40', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('29', '41', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('30', '42', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('31', '46', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('32', '47', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('33', '48', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('34', '51', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('35', '52', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('36', '53', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('37', '54', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('38', '55', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('39', '56', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('40', '57', '1', '发票抬头', '老婆老婆老婆', '老婆老婆老婆', '可人咯人咯人咯', '可人咯人咯人咯', '男人', '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('41', '64', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('42', '65', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('43', '67', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('44', '68', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('45', '69', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('46', '70', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('47', '71', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('48', '72', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('49', '73', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('50', '74', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('51', '75', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('52', '76', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('53', '77', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('54', '78', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('55', '79', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('56', '80', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('57', '87', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('58', '88', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('59', '89', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('60', '90', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('61', '91', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('62', '92', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('63', '93', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('64', '94', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('65', '95', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('66', '96', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('67', '97', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('68', '98', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');
INSERT INTO `t_invoice` VALUES ('69', '99', '1', '发票抬头', '纳税人识别号', '注册电话', '银行名称', '银行账号', null, '发票内容', '1');

-- ----------------------------
-- Table structure for t_invoice_history
-- ----------------------------
DROP TABLE IF EXISTS `t_invoice_history`;
CREATE TABLE `t_invoice_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_type` varchar(16) NOT NULL COMMENT '订单类型',
  `order_id` int(11) DEFAULT NULL COMMENT '订单Id',
  `invoice_type` varchar(10) DEFAULT NULL COMMENT '发票类型（增值税专用发票等）',
  `invoice_title` varchar(50) DEFAULT NULL COMMENT '发票抬头',
  `duty_paragraph` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `telephone` varchar(16) DEFAULT NULL COMMENT '注册电话',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `invoice_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '开票状态（0 - 未开票，1 - 已开票）',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='发票表开票历史';

-- ----------------------------
-- Records of t_invoice_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_main_push_brand_product
-- ----------------------------
DROP TABLE IF EXISTS `t_main_push_brand_product`;
CREATE TABLE `t_main_push_brand_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌编码',
  `brand_name` varchar(20) DEFAULT NULL COMMENT '品牌爆款产品名称（选填）',
  `brand_gross_profit` varchar(15) DEFAULT NULL COMMENT '品牌零售毛利预估（选填）',
  `brand_per_ticket_sales` decimal(8,2) DEFAULT NULL COMMENT '单品平均客单价（选填，金额）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='品牌主推产品信息';

-- ----------------------------
-- Records of t_main_push_brand_product
-- ----------------------------
INSERT INTO `t_main_push_brand_product` VALUES ('4', '1', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('6', '32', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('7', '33', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('8', '34', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('9', '35', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('10', '36', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('11', '37', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('12', '39', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('13', '40', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('14', '41', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('15', '42', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('16', '43', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('17', '44', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('18', '45', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('19', '46', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('20', '47', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('21', '48', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('22', '49', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('23', '50', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('24', '51', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('25', '52', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('26', '53', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('27', '55', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('28', '56', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('29', '57', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('30', '59', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('31', '63', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('32', '64', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('33', '65', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('34', '68', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('35', '69', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('36', '70', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('37', '71', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('38', '72', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('39', '73', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('40', '74', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('41', '75', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('42', '76', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('43', '81', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('44', '82', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('45', '84', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('46', '85', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('47', '86', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('48', '87', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('49', '88', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('50', '89', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('51', '90', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('52', '91', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('53', '92', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('54', '93', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('55', '94', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('56', '95', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('57', '96', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('58', '97', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('59', '99', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('60', '100', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('61', '101', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('62', '102', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('63', '103', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('64', '104', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('65', '105', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('66', '106', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('67', '107', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('68', '108', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('69', '109', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('70', '110', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');
INSERT INTO `t_main_push_brand_product` VALUES ('71', '111', '品牌爆款产品名称（选填）', '品牌零售毛利预估（选填）', '100.00');

-- ----------------------------
-- Table structure for t_member_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_member_detail`;
CREATE TABLE `t_member_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `join_member_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入会时间',
  `expire_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '到期时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户入会明细表';

-- ----------------------------
-- Records of t_member_detail
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_config
-- ----------------------------
DROP TABLE IF EXISTS `t_message_config`;
CREATE TABLE `t_message_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息配置主键',
  `push_channel` varchar(50) NOT NULL COMMENT '推送渠道 详细见字典表',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `msg_title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '推送内容',
  `push_type` smallint(2) DEFAULT '1' COMMENT '推送类型 1立即发送 2定时发送',
  `trigger_time` timestamp NULL DEFAULT NULL COMMENT ' 触发时间 推送类型为定时推送时配置推送时间',
  `push_status` smallint(2) DEFAULT NULL COMMENT '推送状态 0未推送 1推送成功  2 部分成功 -1推送失败',
  `sms_template_id` int(11) DEFAULT NULL COMMENT '推送渠道为短信通道  保存短信推送模板ID',
  `device_type` varchar(50) DEFAULT NULL COMMENT '设备类型 all  ios android  推送渠道为 app通知栏消息',
  `receive_type` smallint(1) DEFAULT NULL COMMENT '接收人 1全部 2会员 3品牌方 4网红达人 5指定接收人',
  `create_admin` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delete_flag` smallint(1) DEFAULT NULL COMMENT '删除标识 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息配置表';

-- ----------------------------
-- Records of t_message_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_config_receiver
-- ----------------------------
DROP TABLE IF EXISTS `t_message_config_receiver`;
CREATE TABLE `t_message_config_receiver` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT COMMENT '消息接收人表主键',
  `user_id` int(11) NOT NULL COMMENT '接受用户ID',
  `message_config_id` int(11) NOT NULL COMMENT '消息配置ID',
  `delete_flag` smallint(1) DEFAULT '1' COMMENT '删除标识 0：无效 1：有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息配置接收人';

-- ----------------------------
-- Records of t_message_config_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_message_notice`;
CREATE TABLE `t_message_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员消息主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `msg_title` varchar(255) NOT NULL COMMENT '消息标题',
  `msg_content` varchar(1000) DEFAULT NULL COMMENT '消息内容',
  `link_url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `msg_type` smallint(3) NOT NULL COMMENT '消息类型 1系统消息 2订单消息 3活动消息',
  `read_flag` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已读 0未读 1已读',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `delete_flag` smallint(1) NOT NULL COMMENT '删除标识 0：无效 1：有效',
  `push_channel` varchar(50) NOT NULL COMMENT '推送渠道 详细见字典表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息通知表';

-- ----------------------------
-- Records of t_message_notice
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `total_fee` decimal(30,2) DEFAULT NULL COMMENT '商品总价',
  `payment` decimal(30,2) DEFAULT NULL COMMENT '实付金额',
  `pay_type` smallint(2) DEFAULT '0' COMMENT '支付类型(0支付宝/1微信)',
  `pay_status` smallint(2) DEFAULT '0' COMMENT '付款状态(0未付款/1正在付款/2已付款/3退款/4支付超时)',
  `order_type` smallint(2) DEFAULT '0' COMMENT '订单类型(0普通/1活动/2集采)',
  `order_status` smallint(2) DEFAULT '0' COMMENT '订单状态(0新订单/1未发货/2已发货/3完成/4订单取消/5超时/6退货/7关闭)',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单完成时间',
  `over_time` datetime DEFAULT NULL COMMENT '订单超时时间',
  `close_time` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `user_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `address` int(11) DEFAULT NULL COMMENT '收货地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_address
-- ----------------------------
DROP TABLE IF EXISTS `t_order_address`;
CREATE TABLE `t_order_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `userTel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `area_province` int(11) DEFAULT NULL COMMENT '地址所属省',
  `area_city` int(11) DEFAULT NULL COMMENT '地址所属市',
  `area_country` int(11) DEFAULT NULL COMMENT '地址所属区县',
  `zip_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `de_select` tinyint(4) DEFAULT NULL COMMENT '是否默认地址（0:非默认，1:默认）',
  `flag` tinyint(4) DEFAULT NULL COMMENT '删除状态（0:有效，1:删除）',
  `creat_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户地址信息表';

-- ----------------------------
-- Records of t_order_address
-- ----------------------------
INSERT INTO `t_order_address` VALUES ('1', '1', '光伟', '18356238002', '18356238002', '310000', '310100', '310114', '201800', '中国,上海,上海市,嘉定区', '1', '1', '2018-07-04 16:37:40');

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单id',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌编码',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(30,2) DEFAULT NULL COMMENT '商品单价',
  `act_price` decimal(30,2) DEFAULT NULL COMMENT '活动单价',
  `num` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单详情表';

-- ----------------------------
-- Records of t_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_order_region
-- ----------------------------
DROP TABLE IF EXISTS `t_order_region`;
CREATE TABLE `t_order_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province_id` int(11) DEFAULT NULL COMMENT '省市区ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属地区id',
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省市区名称',
  `merger_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '详细名称',
  `short_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简称',
  `merger_short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level_type` smallint(2) DEFAULT NULL COMMENT '等级类型',
  `city_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行政编码',
  `zip_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `pinyin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '拼音',
  `jianpin` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '简拼',
  `firstchar` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` float DEFAULT NULL COMMENT '经度',
  `lat` float DEFAULT NULL COMMENT '纬度',
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='全国省市区地址表';

-- ----------------------------
-- Records of t_order_region
-- ----------------------------
INSERT INTO `t_order_region` VALUES ('1', '100000', '0', '中国', '中国', '中国', '中国', '0', '', '', 'China', 'CN', 'C', '116.368', '39.9151', '');
INSERT INTO `t_order_region` VALUES ('2', '110000', '100000', '北京', '中国,北京', '北京', '中国,北京', '1', '', '', 'Beijing', 'BJ', 'B', '116.405', '39.905', '');
INSERT INTO `t_order_region` VALUES ('3', '110100', '110000', '北京市', '中国,北京,北京市', '北京', '中国,北京,北京', '2', '010', '100000', 'Beijing', 'BJ', 'B', '116.405', '39.905', '');
INSERT INTO `t_order_region` VALUES ('4', '110101', '110100', '东城区', '中国,北京,北京市,东城区', '东城', '中国,北京,北京,东城', '3', '010', '100000', 'Dongcheng', 'DC', 'D', '116.41', '39.9316', '');
INSERT INTO `t_order_region` VALUES ('5', '110102', '110100', '西城区', '中国,北京,北京市,西城区', '西城', '中国,北京,北京,西城', '3', '010', '100000', 'Xicheng', 'XC', 'X', '116.36', '39.9305', '');
INSERT INTO `t_order_region` VALUES ('6', '110105', '110100', '朝阳区', '中国,北京,北京市,朝阳区', '朝阳', '中国,北京,北京,朝阳', '3', '010', '100000', 'Chaoyang', 'CY', 'C', '116.485', '39.9484', '');
INSERT INTO `t_order_region` VALUES ('7', '110106', '110100', '丰台区', '中国,北京,北京市,丰台区', '丰台', '中国,北京,北京,丰台', '3', '010', '100000', 'Fengtai', 'FT', 'F', '116.286', '39.8585', '');
INSERT INTO `t_order_region` VALUES ('8', '110107', '110100', '石景山区', '中国,北京,北京市,石景山区', '石景山', '中国,北京,北京,石景山', '3', '010', '100000', 'Shijingshan', 'SJS', 'S', '116.223', '39.9056', '');
INSERT INTO `t_order_region` VALUES ('9', '110108', '110100', '海淀区', '中国,北京,北京市,海淀区', '海淀', '中国,北京,北京,海淀', '3', '010', '100000', 'Haidian', 'HD', 'H', '116.298', '39.9593', '');
INSERT INTO `t_order_region` VALUES ('10', '110109', '110100', '门头沟区', '中国,北京,北京市,门头沟区', '门头沟', '中国,北京,北京,门头沟', '3', '010', '102300', 'Mentougou', 'MTG', 'M', '116.101', '39.9404', '');
INSERT INTO `t_order_region` VALUES ('11', '110111', '110100', '房山区', '中国,北京,北京市,房山区', '房山', '中国,北京,北京,房山', '3', '010', '102400', 'Fangshan', 'FS', 'F', '116.143', '39.7479', '');
INSERT INTO `t_order_region` VALUES ('12', '110112', '110100', '通州区', '中国,北京,北京市,通州区', '通州', '中国,北京,北京,通州', '3', '010', '101100', 'Tongzhou', 'TZ', 'T', '116.657', '39.9097', '');
INSERT INTO `t_order_region` VALUES ('13', '110113', '110100', '顺义区', '中国,北京,北京市,顺义区', '顺义', '中国,北京,北京,顺义', '3', '010', '101300', 'Shunyi', 'SY', 'S', '116.654', '40.1302', '');
INSERT INTO `t_order_region` VALUES ('14', '110114', '110100', '昌平区', '中国,北京,北京市,昌平区', '昌平', '中国,北京,北京,昌平', '3', '010', '102200', 'Changping', 'CP', 'C', '116.231', '40.2207', '');
INSERT INTO `t_order_region` VALUES ('15', '110115', '110100', '大兴区', '中国,北京,北京市,大兴区', '大兴', '中国,北京,北京,大兴', '3', '010', '102600', 'Daxing', 'DX', 'D', '116.341', '39.7267', '');
INSERT INTO `t_order_region` VALUES ('16', '110116', '110100', '怀柔区', '中国,北京,北京市,怀柔区', '怀柔', '中国,北京,北京,怀柔', '3', '010', '101400', 'Huairou', 'HR', 'H', '116.632', '40.316', '');
INSERT INTO `t_order_region` VALUES ('17', '110117', '110100', '平谷区', '中国,北京,北京市,平谷区', '平谷', '中国,北京,北京,平谷', '3', '010', '101200', 'Pinggu', 'PG', 'P', '117.121', '40.1406', '');
INSERT INTO `t_order_region` VALUES ('18', '110118', '110100', '密云区', '中国,北京,北京市,密云区', '密云', '中国,北京,北京,密云', '3', '010', '101500', 'Miyun', 'MY', 'M', '116.843', '40.3762', '');
INSERT INTO `t_order_region` VALUES ('19', '110119', '110100', '延庆区', '中国,北京,北京市,延庆区', '延庆', '中国,北京,北京,延庆', '3', '010', '102100', 'Yanqing', 'YQ', 'Y', '115.975', '40.4567', '');
INSERT INTO `t_order_region` VALUES ('20', '110120', '110100', '中关村科技园区', '中国,北京,北京市,中关村科技园区', '中关村科技园区', '中国,北京,北京,中关村科技园区', '3', '010', '100190', 'Zhongguancun', 'ZGC', 'Z', '116.315', '39.9826', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('21', '120000', '100000', '天津', '中国,天津', '天津', '中国,天津', '1', '', '', 'Tianjin', 'TJ', 'T', '117.19', '39.1256', '');
INSERT INTO `t_order_region` VALUES ('22', '120100', '120000', '天津市', '中国,天津,天津市', '天津', '中国,天津,天津', '2', '022', '300000', 'Tianjin', 'TJ', 'T', '117.19', '39.1256', '');
INSERT INTO `t_order_region` VALUES ('23', '120101', '120100', '和平区', '中国,天津,天津市,和平区', '和平', '中国,天津,天津,和平', '3', '022', '300000', 'Heping', 'HP', 'H', '117.215', '39.1172', '');
INSERT INTO `t_order_region` VALUES ('24', '120102', '120100', '河东区', '中国,天津,天津市,河东区', '河东', '中国,天津,天津,河东', '3', '022', '300000', 'Hedong', 'HD', 'H', '117.226', '39.1232', '');
INSERT INTO `t_order_region` VALUES ('25', '120103', '120100', '河西区', '中国,天津,天津市,河西区', '河西', '中国,天津,天津,河西', '3', '022', '300000', 'Hexi', 'HX', 'H', '117.223', '39.1096', '');
INSERT INTO `t_order_region` VALUES ('26', '120104', '120100', '南开区', '中国,天津,天津市,南开区', '南开', '中国,天津,天津,南开', '3', '022', '300000', 'Nankai', 'NK', 'N', '117.151', '39.1382', '');
INSERT INTO `t_order_region` VALUES ('27', '120105', '120100', '河北区', '中国,天津,天津市,河北区', '河北', '中国,天津,天津,河北', '3', '022', '300000', 'Hebei', 'HB', 'H', '117.197', '39.1482', '');
INSERT INTO `t_order_region` VALUES ('28', '120106', '120100', '红桥区', '中国,天津,天津市,红桥区', '红桥', '中国,天津,天津,红桥', '3', '022', '300000', 'Hongqiao', 'HQ', 'H', '117.151', '39.1671', '');
INSERT INTO `t_order_region` VALUES ('29', '120110', '120100', '东丽区', '中国,天津,天津市,东丽区', '东丽', '中国,天津,天津,东丽', '3', '022', '300000', 'Dongli', 'DL', 'D', '117.314', '39.0863', '');
INSERT INTO `t_order_region` VALUES ('30', '120111', '120100', '西青区', '中国,天津,天津市,西青区', '西青', '中国,天津,天津,西青', '3', '022', '300000', 'Xiqing', 'XQ', 'X', '117.009', '39.1412', '');
INSERT INTO `t_order_region` VALUES ('31', '120112', '120100', '津南区', '中国,天津,天津市,津南区', '津南', '中国,天津,天津,津南', '3', '022', '300000', 'Jinnan', 'JN', 'J', '117.385', '38.9914', '');
INSERT INTO `t_order_region` VALUES ('32', '120113', '120100', '北辰区', '中国,天津,天津市,北辰区', '北辰', '中国,天津,天津,北辰', '3', '022', '300000', 'Beichen', 'BC', 'B', '117.132', '39.2213', '');
INSERT INTO `t_order_region` VALUES ('33', '120114', '120100', '武清区', '中国,天津,天津市,武清区', '武清', '中国,天津,天津,武清', '3', '022', '301700', 'Wuqing', 'WQ', 'W', '117.044', '39.3842', '');
INSERT INTO `t_order_region` VALUES ('34', '120115', '120100', '宝坻区', '中国,天津,天津市,宝坻区', '宝坻', '中国,天津,天津,宝坻', '3', '022', '301800', 'Baodi', 'BD', 'B', '117.31', '39.7176', '');
INSERT INTO `t_order_region` VALUES ('35', '120116', '120100', '滨海新区', '中国,天津,天津市,滨海新区', '滨海', '中国,天津,天津,滨海', '3', '022', '300457', 'Binhai', 'BH', 'B', '117.702', '39.0267', '国家级新区');
INSERT INTO `t_order_region` VALUES ('36', '120117', '120100', '宁河区', '中国,天津,天津市,宁河区', '宁河', '中国,天津,天津,宁河', '3', '022', '301500', 'Ninghe', 'NH', 'N', '117.826', '39.3305', '');
INSERT INTO `t_order_region` VALUES ('37', '120118', '120100', '静海区', '中国,天津,天津市,静海区', '静海', '中国,天津,天津,静海', '3', '022', '301600', 'Jinghai', 'JH', 'J', '116.974', '38.9458', '');
INSERT INTO `t_order_region` VALUES ('38', '120119', '120100', '蓟州区', '中国,天津,天津市,蓟州区', '蓟州', '中国,天津,天津,蓟州', '3', '022', '301900', 'Jizhou', 'JZ', 'J', '117.408', '40.0457', '');
INSERT INTO `t_order_region` VALUES ('39', '120120', '120100', '滨海高新区', '中国,天津,天津市,滨海高新区', '滨海高新区', '中国,天津,天津,滨海高新区', '3', '022', '300000', 'Binhaigaoxinqu', 'BHGXQ', 'B', '117.125', '39.0952', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('40', '130000', '100000', '河北省', '中国,河北省', '河北', '中国,河北', '1', '', '', 'Hebei', 'HE', 'H', '114.502', '38.0455', '');
INSERT INTO `t_order_region` VALUES ('41', '130100', '130000', '石家庄市', '中国,河北省,石家庄市', '石家庄', '中国,河北,石家庄', '2', '0311', '050000', 'Shijiazhuang', 'SJZ', 'S', '114.502', '38.0455', '');
INSERT INTO `t_order_region` VALUES ('42', '130102', '130100', '长安区', '中国,河北省,石家庄市,长安区', '长安', '中国,河北,石家庄,长安', '3', '0311', '050000', 'Chang\'an', 'CA', 'C', '114.539', '38.0367', '');
INSERT INTO `t_order_region` VALUES ('43', '130104', '130100', '桥西区', '中国,河北省,石家庄市,桥西区', '桥西', '中国,河北,石家庄,桥西', '3', '0311', '050000', 'Qiaoxi', 'QX', 'Q', '114.47', '38.0322', '');
INSERT INTO `t_order_region` VALUES ('44', '130105', '130100', '新华区', '中国,河北省,石家庄市,新华区', '新华', '中国,河北,石家庄,新华', '3', '0311', '050000', 'Xinhua', 'XH', 'X', '114.463', '38.0509', '');
INSERT INTO `t_order_region` VALUES ('45', '130107', '130100', '井陉矿区', '中国,河北省,石家庄市,井陉矿区', '井陉矿区', '中国,河北,石家庄,井陉矿区', '3', '0311', '050100', 'Jingxingkuangqu', 'JXKQ', 'J', '114.065', '38.0671', '');
INSERT INTO `t_order_region` VALUES ('46', '130108', '130100', '裕华区', '中国,河北省,石家庄市,裕华区', '裕华', '中国,河北,石家庄,裕华', '3', '0311', '050000', 'Yuhua', 'YH', 'Y', '114.531', '38.006', '');
INSERT INTO `t_order_region` VALUES ('47', '130109', '130100', '藁城区', '中国,河北省,石家庄市,藁城区', '藁城', '中国,河北,石家庄,藁城', '3', '0311', '052160', 'Gaocheng', 'GC', 'G', '114.847', '38.0216', '');
INSERT INTO `t_order_region` VALUES ('48', '130110', '130100', '鹿泉区', '中国,河北省,石家庄市,鹿泉区', '鹿泉', '中国,河北,石家庄,鹿泉', '3', '0311', '050200', 'Luquan', 'LQ', 'L', '114.313', '38.0878', '');
INSERT INTO `t_order_region` VALUES ('49', '130111', '130100', '栾城区', '中国,河北省,石家庄市,栾城区', '栾城', '中国,河北,石家庄,栾城', '3', '0311', '051430', 'Luancheng', 'LC', 'L', '114.648', '37.9002', '');
INSERT INTO `t_order_region` VALUES ('50', '130121', '130100', '井陉县', '中国,河北省,石家庄市,井陉县', '井陉', '中国,河北,石家庄,井陉', '3', '0311', '050300', 'Jingxing', 'JX', 'J', '114.143', '38.0369', '');
INSERT INTO `t_order_region` VALUES ('51', '130123', '130100', '正定县', '中国,河北省,石家庄市,正定县', '正定', '中国,河北,石家庄,正定', '3', '0311', '050800', 'Zhengding', 'ZD', 'Z', '114.573', '38.1445', '');
INSERT INTO `t_order_region` VALUES ('52', '130125', '130100', '行唐县', '中国,河北省,石家庄市,行唐县', '行唐', '中国,河北,石家庄,行唐', '3', '0311', '050600', 'Xingtang', 'XT', 'X', '114.553', '38.4365', '');
INSERT INTO `t_order_region` VALUES ('53', '130126', '130100', '灵寿县', '中国,河北省,石家庄市,灵寿县', '灵寿', '中国,河北,石家庄,灵寿', '3', '0311', '050500', 'Lingshou', 'LS', 'L', '114.383', '38.3084', '');
INSERT INTO `t_order_region` VALUES ('54', '130127', '130100', '高邑县', '中国,河北省,石家庄市,高邑县', '高邑', '中国,河北,石家庄,高邑', '3', '0311', '051330', 'Gaoyi', 'GY', 'G', '114.611', '37.6156', '');
INSERT INTO `t_order_region` VALUES ('55', '130128', '130100', '深泽县', '中国,河北省,石家庄市,深泽县', '深泽', '中国,河北,石家庄,深泽', '3', '0311', '052500', 'Shenze', 'SZ', 'S', '115.204', '38.1835', '');
INSERT INTO `t_order_region` VALUES ('56', '130129', '130100', '赞皇县', '中国,河北省,石家庄市,赞皇县', '赞皇', '中国,河北,石家庄,赞皇', '3', '0311', '051230', 'Zanhuang', 'ZH', 'Z', '114.388', '37.6614', '');
INSERT INTO `t_order_region` VALUES ('57', '130130', '130100', '无极县', '中国,河北省,石家庄市,无极县', '无极', '中国,河北,石家庄,无极', '3', '0311', '052460', 'Wuji', 'WJ', 'W', '114.975', '38.1765', '');
INSERT INTO `t_order_region` VALUES ('58', '130131', '130100', '平山县', '中国,河北省,石家庄市,平山县', '平山', '中国,河北,石家庄,平山', '3', '0311', '050400', 'Pingshan', 'PS', 'P', '114.186', '38.2599', '');
INSERT INTO `t_order_region` VALUES ('59', '130132', '130100', '元氏县', '中国,河北省,石家庄市,元氏县', '元氏', '中国,河北,石家庄,元氏', '3', '0311', '051130', 'Yuanshi', 'YS', 'Y', '114.525', '37.7667', '');
INSERT INTO `t_order_region` VALUES ('60', '130133', '130100', '赵县', '中国,河北省,石家庄市,赵县', '赵县', '中国,河北,石家庄,赵县', '3', '0311', '051530', 'Zhaoxian', 'ZX', 'Z', '114.776', '37.7563', '');
INSERT INTO `t_order_region` VALUES ('61', '130181', '130100', '辛集市', '中国,河北省,石家庄市,辛集市', '辛集', '中国,河北,石家庄,辛集', '3', '0311', '052360', 'Xinji', 'XJ', 'X', '115.206', '37.9408', '');
INSERT INTO `t_order_region` VALUES ('62', '130183', '130100', '晋州市', '中国,河北省,石家庄市,晋州市', '晋州', '中国,河北,石家庄,晋州', '3', '0311', '052200', 'Jinzhou', 'JZ', 'J', '115.043', '38.0313', '');
INSERT INTO `t_order_region` VALUES ('63', '130184', '130100', '新乐市', '中国,河北省,石家庄市,新乐市', '新乐', '中国,河北,石家庄,新乐', '3', '0311', '050700', 'Xinle', 'XL', 'X', '114.69', '38.3442', '');
INSERT INTO `t_order_region` VALUES ('64', '130185', '130100', '高新区', '中国,河北省,石家庄市,高新区', '高新区', '中国,河北,石家庄,高新区', '3', '0311', '050000', 'Gaoxinqu', 'GXQ', 'G', '114.648', '38.0424', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('65', '130186', '130100', '经济技术开发区', '中国,河北省,石家庄市,经济技术开发区', '经济技术开发区', '中国,河北,石家庄,经济技术开发区', '3', '0311', '052165', 'Jingjikaifaqu', 'JJKFQ', 'J', '114.659', '38.0212', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('66', '130200', '130000', '唐山市', '中国,河北省,唐山市', '唐山', '中国,河北,唐山', '2', '0315', '063000', 'Tangshan', 'TS', 'T', '118.175', '39.6351', '');
INSERT INTO `t_order_region` VALUES ('67', '130202', '130200', '路南区', '中国,河北省,唐山市,路南区', '路南', '中国,河北,唐山,路南', '3', '0315', '063000', 'Lunan', 'LN', 'L', '118.154', '39.625', '');
INSERT INTO `t_order_region` VALUES ('68', '130203', '130200', '路北区', '中国,河北省,唐山市,路北区', '路北', '中国,河北,唐山,路北', '3', '0315', '063000', 'Lubei', 'LB', 'L', '118.201', '39.6244', '');
INSERT INTO `t_order_region` VALUES ('69', '130204', '130200', '古冶区', '中国,河北省,唐山市,古冶区', '古冶', '中国,河北,唐山,古冶', '3', '0315', '063100', 'Guye', 'GY', 'G', '118.458', '39.7199', '');
INSERT INTO `t_order_region` VALUES ('70', '130205', '130200', '开平区', '中国,河北省,唐山市,开平区', '开平', '中国,河北,唐山,开平', '3', '0315', '063000', 'Kaiping', 'KP', 'K', '118.262', '39.6713', '');
INSERT INTO `t_order_region` VALUES ('71', '130207', '130200', '丰南区', '中国,河北省,唐山市,丰南区', '丰南', '中国,河北,唐山,丰南', '3', '0315', '063300', 'Fengnan', 'FN', 'F', '118.113', '39.5648', '');
INSERT INTO `t_order_region` VALUES ('72', '130208', '130200', '丰润区', '中国,河北省,唐山市,丰润区', '丰润', '中国,河北,唐山,丰润', '3', '0315', '063000', 'Fengrun', 'FR', 'F', '118.13', '39.8244', '');
INSERT INTO `t_order_region` VALUES ('73', '130209', '130200', '曹妃甸区', '中国,河北省,唐山市,曹妃甸区', '曹妃甸', '中国,河北,唐山,曹妃甸', '3', '0315', '063200', 'Caofeidian', 'CFD', 'C', '118.46', '39.2731', '');
INSERT INTO `t_order_region` VALUES ('74', '130223', '130200', '滦县', '中国,河北省,唐山市,滦县', '滦县', '中国,河北,唐山,滦县', '3', '0315', '063700', 'Luanxian', 'LX', 'L', '118.703', '39.7406', '');
INSERT INTO `t_order_region` VALUES ('75', '130224', '130200', '滦南县', '中国,河北省,唐山市,滦南县', '滦南', '中国,河北,唐山,滦南', '3', '0315', '063500', 'Luannan', 'LN', 'L', '118.674', '39.5039', '');
INSERT INTO `t_order_region` VALUES ('76', '130225', '130200', '乐亭县', '中国,河北省,唐山市,乐亭县', '乐亭', '中国,河北,唐山,乐亭', '3', '0315', '063600', 'Laoting', 'LT', 'L', '118.912', '39.4256', '');
INSERT INTO `t_order_region` VALUES ('77', '130227', '130200', '迁西县', '中国,河北省,唐山市,迁西县', '迁西', '中国,河北,唐山,迁西', '3', '0315', '064300', 'Qianxi', 'QX', 'Q', '118.316', '40.1459', '');
INSERT INTO `t_order_region` VALUES ('78', '130229', '130200', '玉田县', '中国,河北省,唐山市,玉田县', '玉田', '中国,河北,唐山,玉田', '3', '0315', '064100', 'Yutian', 'YT', 'Y', '117.739', '39.9005', '');
INSERT INTO `t_order_region` VALUES ('79', '130281', '130200', '遵化市', '中国,河北省,唐山市,遵化市', '遵化', '中国,河北,唐山,遵化', '3', '0315', '064200', 'Zunhua', 'ZH', 'Z', '117.964', '40.1874', '');
INSERT INTO `t_order_region` VALUES ('80', '130283', '130200', '迁安市', '中国,河北省,唐山市,迁安市', '迁安', '中国,河北,唐山,迁安', '3', '0315', '064400', 'Qian\'an', 'QA', 'Q', '118.701', '39.9983', '');
INSERT INTO `t_order_region` VALUES ('81', '130300', '130000', '秦皇岛市', '中国,河北省,秦皇岛市', '秦皇岛', '中国,河北,秦皇岛', '2', '0335', '066000', 'Qinhuangdao', 'QHD', 'Q', '119.587', '39.9425', '');
INSERT INTO `t_order_region` VALUES ('82', '130302', '130300', '海港区', '中国,河北省,秦皇岛市,海港区', '海港', '中国,河北,秦皇岛,海港', '3', '0335', '066000', 'Haigang', 'HG', 'H', '119.61', '39.9345', '');
INSERT INTO `t_order_region` VALUES ('83', '130303', '130300', '山海关区', '中国,河北省,秦皇岛市,山海关区', '山海关', '中国,河北,秦皇岛,山海关', '3', '0335', '066200', 'Shanhaiguan', 'SHG', 'S', '119.776', '39.9787', '');
INSERT INTO `t_order_region` VALUES ('84', '130304', '130300', '北戴河区', '中国,河北省,秦皇岛市,北戴河区', '北戴河', '中国,河北,秦皇岛,北戴河', '3', '0335', '066100', 'Beidaihe', 'BDH', 'B', '119.484', '39.8341', '');
INSERT INTO `t_order_region` VALUES ('85', '130306', '130300', '抚宁区', '中国,河北省,秦皇岛市,抚宁区', '抚宁', '中国,河北,秦皇岛,抚宁', '3', '0335', '066300', 'Funing', 'FN', 'F', '119.245', '39.8754', '');
INSERT INTO `t_order_region` VALUES ('86', '130321', '130300', '青龙满族自治县', '中国,河北省,秦皇岛市,青龙满族自治县', '青龙', '中国,河北,秦皇岛,青龙', '3', '0335', '066500', 'Qinglong', 'QL', 'Q', '118.952', '40.4074', '');
INSERT INTO `t_order_region` VALUES ('87', '130322', '130300', '昌黎县', '中国,河北省,秦皇岛市,昌黎县', '昌黎', '中国,河北,秦皇岛,昌黎', '3', '0335', '066600', 'Changli', 'CL', 'C', '119.166', '39.7088', '');
INSERT INTO `t_order_region` VALUES ('88', '130324', '130300', '卢龙县', '中国,河北省,秦皇岛市,卢龙县', '卢龙', '中国,河北,秦皇岛,卢龙', '3', '0335', '066400', 'Lulong', 'LL', 'L', '118.893', '39.8918', '');
INSERT INTO `t_order_region` VALUES ('89', '130325', '130300', '北戴河新区', '中国,河北省,秦皇岛市,北戴河新区', '北戴河新区', '中国,河北,秦皇岛,北戴河新区', '3', '0335', '066311', 'Beidaihexinqu', 'BDH', 'B', '119.387', '39.7675', '新区');
INSERT INTO `t_order_region` VALUES ('90', '130400', '130000', '邯郸市', '中国,河北省,邯郸市', '邯郸', '中国,河北,邯郸', '2', '0310', '056000', 'Handan', 'HD', 'H', '114.491', '36.6123', '');
INSERT INTO `t_order_region` VALUES ('91', '130402', '130400', '邯山区', '中国,河北省,邯郸市,邯山区', '邯山', '中国,河北,邯郸,邯山', '3', '0310', '056000', 'Hanshan', 'HS', 'H', '114.484', '36.6001', '');
INSERT INTO `t_order_region` VALUES ('92', '130403', '130400', '丛台区', '中国,河北省,邯郸市,丛台区', '丛台', '中国,河北,邯郸,丛台', '3', '0310', '056000', 'Congtai', 'CT', 'C', '114.493', '36.6185', '');
INSERT INTO `t_order_region` VALUES ('93', '130404', '130400', '复兴区', '中国,河北省,邯郸市,复兴区', '复兴', '中国,河北,邯郸,复兴', '3', '0310', '056000', 'Fuxing', 'FX', 'F', '114.459', '36.6113', '');
INSERT INTO `t_order_region` VALUES ('94', '130406', '130400', '峰峰矿区', '中国,河北省,邯郸市,峰峰矿区', '峰峰矿区', '中国,河北,邯郸,峰峰矿区', '3', '0310', '056200', 'Fengfengkuangqu', 'FFKQ', 'F', '114.211', '36.4194', '');
INSERT INTO `t_order_region` VALUES ('95', '130407', '130400', '肥乡区', '中国,河北省,邯郸市,肥乡区', '肥乡', '中国,河北,邯郸,肥乡', '3', '0310', '057550', 'Feixiang', 'FX', 'F', '114.8', '36.5481', '');
INSERT INTO `t_order_region` VALUES ('96', '130408', '130400', '永年区', '中国,河北省,邯郸市,永年区', '永年', '中国,河北,邯郸,永年', '3', '0310', '057150', 'Yongnian', 'YN', 'Y', '114.489', '36.7836', '');
INSERT INTO `t_order_region` VALUES ('97', '130423', '130400', '临漳县', '中国,河北省,邯郸市,临漳县', '临漳', '中国,河北,邯郸,临漳', '3', '0310', '056600', 'Linzhang', 'LZ', 'L', '114.619', '36.3346', '');
INSERT INTO `t_order_region` VALUES ('98', '130424', '130400', '成安县', '中国,河北省,邯郸市,成安县', '成安', '中国,河北,邯郸,成安', '3', '0310', '056700', 'Cheng\'an', 'CA', 'C', '114.67', '36.4441', '');
INSERT INTO `t_order_region` VALUES ('99', '130425', '130400', '大名县', '中国,河北省,邯郸市,大名县', '大名', '中国,河北,邯郸,大名', '3', '0310', '056900', 'Daming', 'DM', 'D', '115.154', '36.2799', '');
INSERT INTO `t_order_region` VALUES ('100', '130426', '130400', '涉县', '中国,河北省,邯郸市,涉县', '涉县', '中国,河北,邯郸,涉县', '3', '0310', '056400', 'Shexian', 'SX', 'S', '113.692', '36.5807', '');
INSERT INTO `t_order_region` VALUES ('101', '130427', '130400', '磁县', '中国,河北省,邯郸市,磁县', '磁县', '中国,河北,邯郸,磁县', '3', '0310', '056500', 'Cixian', 'CX', 'C', '114.374', '36.3739', '');
INSERT INTO `t_order_region` VALUES ('102', '130430', '130400', '邱县', '中国,河北省,邯郸市,邱县', '邱县', '中国,河北,邯郸,邱县', '3', '0310', '057450', 'Qiuxian', 'QX', 'Q', '115.174', '36.8208', '');
INSERT INTO `t_order_region` VALUES ('103', '130431', '130400', '鸡泽县', '中国,河北省,邯郸市,鸡泽县', '鸡泽', '中国,河北,邯郸,鸡泽', '3', '0310', '057350', 'Jize', 'JZ', 'J', '114.874', '36.9237', '');
INSERT INTO `t_order_region` VALUES ('104', '130432', '130400', '广平县', '中国,河北省,邯郸市,广平县', '广平', '中国,河北,邯郸,广平', '3', '0310', '057650', 'Guangping', 'GP', 'G', '114.947', '36.4805', '');
INSERT INTO `t_order_region` VALUES ('105', '130433', '130400', '馆陶县', '中国,河北省,邯郸市,馆陶县', '馆陶', '中国,河北,邯郸,馆陶', '3', '0310', '057750', 'Guantao', 'GT', 'G', '115.299', '36.5372', '');
INSERT INTO `t_order_region` VALUES ('106', '130434', '130400', '魏县', '中国,河北省,邯郸市,魏县', '魏县', '中国,河北,邯郸,魏县', '3', '0310', '056800', 'Weixian', 'WX', 'W', '114.935', '36.3617', '');
INSERT INTO `t_order_region` VALUES ('107', '130435', '130400', '曲周县', '中国,河北省,邯郸市,曲周县', '曲周', '中国,河北,邯郸,曲周', '3', '0310', '057250', 'Quzhou', 'QZ', 'Q', '114.952', '36.7767', '');
INSERT INTO `t_order_region` VALUES ('108', '130481', '130400', '武安市', '中国,河北省,邯郸市,武安市', '武安', '中国,河北,邯郸,武安', '3', '0310', '056300', 'Wu\'an', 'WA', 'W', '114.202', '36.6928', '');
INSERT INTO `t_order_region` VALUES ('109', '130482', '130400', '高新技术产业开发区', '中国,河北省,邯郸市,高新技术产业开发区', '高新技术产业开发区', '中国,河北,邯郸,高新技术产业开发区', '3', '0310', '056000', 'GaoXinKaiFaQu', 'GXKFQ', 'G', '114.566', '36.6752', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('110', '130500', '130000', '邢台市', '中国,河北省,邢台市', '邢台', '中国,河北,邢台', '2', '0319', '054000', 'Xingtai', 'XT', 'X', '114.509', '37.0682', '');
INSERT INTO `t_order_region` VALUES ('111', '130502', '130500', '桥东区', '中国,河北省,邢台市,桥东区', '桥东', '中国,河北,邢台,桥东', '3', '0319', '054000', 'Qiaodong', 'QD', 'Q', '114.507', '37.068', '');
INSERT INTO `t_order_region` VALUES ('112', '130503', '130500', '桥西区', '中国,河北省,邢台市,桥西区', '桥西', '中国,河北,邢台,桥西', '3', '0319', '054000', 'Qiaoxi', 'QX', 'Q', '114.468', '37.0598', '');
INSERT INTO `t_order_region` VALUES ('113', '130521', '130500', '邢台县', '中国,河北省,邢台市,邢台县', '邢台', '中国,河北,邢台,邢台', '3', '0319', '054000', 'Xingtai', 'XT', 'X', '114.566', '37.0456', '');
INSERT INTO `t_order_region` VALUES ('114', '130522', '130500', '临城县', '中国,河北省,邢台市,临城县', '临城', '中国,河北,邢台,临城', '3', '0319', '054300', 'Lincheng', 'LC', 'L', '114.504', '37.4398', '');
INSERT INTO `t_order_region` VALUES ('115', '130523', '130500', '内丘县', '中国,河北省,邢台市,内丘县', '内丘', '中国,河北,邢台,内丘', '3', '0319', '054200', 'Neiqiu', 'NQ', 'N', '114.512', '37.2867', '');
INSERT INTO `t_order_region` VALUES ('116', '130524', '130500', '柏乡县', '中国,河北省,邢台市,柏乡县', '柏乡', '中国,河北,邢台,柏乡', '3', '0319', '055450', 'Baixiang', 'BX', 'B', '114.693', '37.4824', '');
INSERT INTO `t_order_region` VALUES ('117', '130525', '130500', '隆尧县', '中国,河北省,邢台市,隆尧县', '隆尧', '中国,河北,邢台,隆尧', '3', '0319', '055350', 'Longyao', 'LY', 'L', '114.776', '37.3535', '');
INSERT INTO `t_order_region` VALUES ('118', '130526', '130500', '任县', '中国,河北省,邢台市,任县', '任县', '中国,河北,邢台,任县', '3', '0319', '055150', 'Renxian', 'RX', 'R', '114.684', '37.1258', '');
INSERT INTO `t_order_region` VALUES ('119', '130527', '130500', '南和县', '中国,河北省,邢台市,南和县', '南和', '中国,河北,邢台,南和', '3', '0319', '054400', 'Nanhe', 'NH', 'N', '114.684', '37.0049', '');
INSERT INTO `t_order_region` VALUES ('120', '130528', '130500', '宁晋县', '中国,河北省,邢台市,宁晋县', '宁晋', '中国,河北,邢台,宁晋', '3', '0319', '055550', 'Ningjin', 'NJ', 'N', '114.921', '37.617', '');
INSERT INTO `t_order_region` VALUES ('121', '130529', '130500', '巨鹿县', '中国,河北省,邢台市,巨鹿县', '巨鹿', '中国,河北,邢台,巨鹿', '3', '0319', '055250', 'Julu', 'JL', 'J', '115.035', '37.218', '');
INSERT INTO `t_order_region` VALUES ('122', '130530', '130500', '新河县', '中国,河北省,邢台市,新河县', '新河', '中国,河北,邢台,新河', '3', '0319', '051730', 'Xinhe', 'XH', 'X', '115.25', '37.5272', '');
INSERT INTO `t_order_region` VALUES ('123', '130531', '130500', '广宗县', '中国,河北省,邢台市,广宗县', '广宗', '中国,河北,邢台,广宗', '3', '0319', '054600', 'Guangzong', 'GZ', 'G', '115.143', '37.0746', '');
INSERT INTO `t_order_region` VALUES ('124', '130532', '130500', '平乡县', '中国,河北省,邢台市,平乡县', '平乡', '中国,河北,邢台,平乡', '3', '0319', '054500', 'Pingxiang', 'PX', 'P', '115.03', '37.0632', '');
INSERT INTO `t_order_region` VALUES ('125', '130533', '130500', '威县', '中国,河北省,邢台市,威县', '威县', '中国,河北,邢台,威县', '3', '0319', '054700', 'Weixian', 'WX', 'W', '115.264', '36.9768', '');
INSERT INTO `t_order_region` VALUES ('126', '130534', '130500', '清河县', '中国,河北省,邢台市,清河县', '清河', '中国,河北,邢台,清河', '3', '0319', '054800', 'Qinghe', 'QH', 'Q', '115.665', '37.0712', '');
INSERT INTO `t_order_region` VALUES ('127', '130535', '130500', '临西县', '中国,河北省,邢台市,临西县', '临西', '中国,河北,邢台,临西', '3', '0319', '054900', 'Linxi', 'LX', 'L', '115.501', '36.8708', '');
INSERT INTO `t_order_region` VALUES ('128', '130581', '130500', '南宫市', '中国,河北省,邢台市,南宫市', '南宫', '中国,河北,邢台,南宫', '3', '0319', '051800', 'Nangong', 'NG', 'N', '115.391', '37.358', '');
INSERT INTO `t_order_region` VALUES ('129', '130582', '130500', '沙河市', '中国,河北省,邢台市,沙河市', '沙河', '中国,河北,邢台,沙河', '3', '0319', '054100', 'Shahe', 'SH', 'S', '114.498', '36.8577', '');
INSERT INTO `t_order_region` VALUES ('130', '130600', '130000', '保定市', '中国,河北省,保定市', '保定', '中国,河北,保定', '2', '0312', '071000', 'Baoding', 'BD', 'B', '115.482', '38.8677', '');
INSERT INTO `t_order_region` VALUES ('131', '130602', '130600', '竞秀区', '中国,河北省,保定市,竞秀区', '竞秀', '中国,河北,保定,竞秀', '3', '0312', '071052', 'Jingxiu', 'JX', 'J', '115.459', '38.8775', '');
INSERT INTO `t_order_region` VALUES ('132', '130606', '130600', '莲池区', '中国,河北省,保定市,莲池区', '莲池', '中国,河北,保定,莲池', '3', '0312', '071000', 'Lianchi', 'LC', 'L', '115.497', '38.8832', '');
INSERT INTO `t_order_region` VALUES ('133', '130607', '130600', '满城区', '中国,河北省,保定市,满城区', '满城', '中国,河北,保定,满城', '3', '0312', '072150', 'Mancheng', 'MC', 'M', '115.323', '38.9497', '');
INSERT INTO `t_order_region` VALUES ('134', '130608', '130600', '清苑区', '中国,河北省,保定市,清苑区', '清苑', '中国,河北,保定,清苑', '3', '0312', '071100', 'Qingyuan', 'QY', 'Q', '115.493', '38.7671', '');
INSERT INTO `t_order_region` VALUES ('135', '130609', '130600', '徐水区', '中国,河北省,保定市,徐水区', '徐水', '中国,河北,保定,徐水', '3', '0312', '072550', 'Xushui', 'XS', 'X', '115.658', '39.021', '');
INSERT INTO `t_order_region` VALUES ('136', '130623', '130600', '涞水县', '中国,河北省,保定市,涞水县', '涞水', '中国,河北,保定,涞水', '3', '0312', '074100', 'Laishui', 'LS', 'L', '115.715', '39.394', '');
INSERT INTO `t_order_region` VALUES ('137', '130624', '130600', '阜平县', '中国,河北省,保定市,阜平县', '阜平', '中国,河北,保定,阜平', '3', '0312', '073200', 'Fuping', 'FP', 'F', '114.197', '38.8476', '');
INSERT INTO `t_order_region` VALUES ('138', '130626', '130600', '定兴县', '中国,河北省,保定市,定兴县', '定兴', '中国,河北,保定,定兴', '3', '0312', '072650', 'Dingxing', 'DX', 'D', '115.808', '39.2631', '');
INSERT INTO `t_order_region` VALUES ('139', '130627', '130600', '唐县', '中国,河北省,保定市,唐县', '唐县', '中国,河北,保定,唐县', '3', '0312', '072350', 'Tangxian', 'TX', 'T', '114.985', '38.7451', '');
INSERT INTO `t_order_region` VALUES ('140', '130628', '130600', '高阳县', '中国,河北省,保定市,高阳县', '高阳', '中国,河北,保定,高阳', '3', '0312', '071500', 'Gaoyang', 'GY', 'G', '115.779', '38.7', '');
INSERT INTO `t_order_region` VALUES ('141', '130629', '130600', '容城县', '中国,河北省,保定市,容城县', '容城', '中国,河北,保定,容城', '3', '0312', '071700', 'Rongcheng', 'RC', 'R', '115.872', '39.0535', '');
INSERT INTO `t_order_region` VALUES ('142', '130630', '130600', '涞源县', '中国,河北省,保定市,涞源县', '涞源', '中国,河北,保定,涞源', '3', '0312', '074300', 'Laiyuan', 'LY', 'L', '114.691', '39.3539', '');
INSERT INTO `t_order_region` VALUES ('143', '130631', '130600', '望都县', '中国,河北省,保定市,望都县', '望都', '中国,河北,保定,望都', '3', '0312', '072450', 'Wangdu', 'WD', 'W', '115.157', '38.71', '');
INSERT INTO `t_order_region` VALUES ('144', '130632', '130600', '安新县', '中国,河北省,保定市,安新县', '安新', '中国,河北,保定,安新', '3', '0312', '071600', 'Anxin', 'AX', 'A', '115.936', '38.9353', '');
INSERT INTO `t_order_region` VALUES ('145', '130633', '130600', '易县', '中国,河北省,保定市,易县', '易县', '中国,河北,保定,易县', '3', '0312', '074200', 'Yixian', 'YX', 'Y', '115.498', '39.3489', '');
INSERT INTO `t_order_region` VALUES ('146', '130634', '130600', '曲阳县', '中国,河北省,保定市,曲阳县', '曲阳', '中国,河北,保定,曲阳', '3', '0312', '073100', 'Quyang', 'QY', 'Q', '114.701', '38.6215', '');
INSERT INTO `t_order_region` VALUES ('147', '130635', '130600', '蠡县', '中国,河北省,保定市,蠡县', '蠡县', '中国,河北,保定,蠡县', '3', '0312', '071400', 'Lixian', 'LX', 'L', '115.577', '38.4897', '');
INSERT INTO `t_order_region` VALUES ('148', '130636', '130600', '顺平县', '中国,河北省,保定市,顺平县', '顺平', '中国,河北,保定,顺平', '3', '0312', '072250', 'Shunping', 'SP', 'S', '115.135', '38.8385', '');
INSERT INTO `t_order_region` VALUES ('149', '130637', '130600', '博野县', '中国,河北省,保定市,博野县', '博野', '中国,河北,保定,博野', '3', '0312', '071300', 'Boye', 'BY', 'B', '115.47', '38.4564', '');
INSERT INTO `t_order_region` VALUES ('150', '130638', '130600', '雄县', '中国,河北省,保定市,雄县', '雄县', '中国,河北,保定,雄县', '3', '0312', '071800', 'Xiongxian', 'XX', 'X', '116.109', '38.9944', '');
INSERT INTO `t_order_region` VALUES ('151', '130681', '130600', '涿州市', '中国,河北省,保定市,涿州市', '涿州', '中国,河北,保定,涿州', '3', '0312', '072750', 'Zhuozhou', 'ZZ', 'Z', '115.981', '39.4862', '');
INSERT INTO `t_order_region` VALUES ('152', '130682', '130600', '定州市', '中国,河北省,保定市,定州市', '定州', '中国,河北,保定,定州', '3', '0312', '073000', 'Dingzhou', 'DZ', 'D', '114.99', '38.5162', '');
INSERT INTO `t_order_region` VALUES ('153', '130683', '130600', '安国市', '中国,河北省,保定市,安国市', '安国', '中国,河北,保定,安国', '3', '0312', '071200', 'Anguo', 'AG', 'A', '115.323', '38.4139', '');
INSERT INTO `t_order_region` VALUES ('154', '130684', '130600', '高碑店市', '中国,河北省,保定市,高碑店市', '高碑店', '中国,河北,保定,高碑店', '3', '0312', '074000', 'Gaobeidian', 'GBD', 'G', '115.874', '39.3265', '');
INSERT INTO `t_order_region` VALUES ('155', '130685', '130600', '雄安新区', '中国,河北省,保定市,雄安新区', '雄安新区', '中国,河北,保定,雄安新区', '3', '0312', '071000', 'XionganXinQu', 'XAXQ', 'X', '115.976', '38.9955', '国家级新区');
INSERT INTO `t_order_region` VALUES ('156', '130686', '130600', '高新区', '中国,河北省,保定市,高新区', '高新区', '中国,河北,保定,高新区', '3', '0312', '071000', 'Gaoxinqu', 'GXQ', 'G', '115.465', '38.9045', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('157', '130700', '130000', '张家口市', '中国,河北省,张家口市', '张家口', '中国,河北,张家口', '2', '0313', '075000', 'Zhangjiakou', 'ZJK', 'Z', '114.884', '40.8119', '');
INSERT INTO `t_order_region` VALUES ('158', '130702', '130700', '桥东区', '中国,河北省,张家口市,桥东区', '桥东', '中国,河北,张家口,桥东', '3', '0313', '075000', 'Qiaodong', 'QD', 'Q', '114.894', '40.7884', '');
INSERT INTO `t_order_region` VALUES ('159', '130703', '130700', '桥西区', '中国,河北省,张家口市,桥西区', '桥西', '中国,河北,张家口,桥西', '3', '0313', '075000', 'Qiaoxi', 'QX', 'Q', '114.87', '40.8195', '');
INSERT INTO `t_order_region` VALUES ('160', '130705', '130700', '宣化区', '中国,河北省,张家口市,宣化区', '宣化', '中国,河北,张家口,宣化', '3', '0313', '075000', 'Xuanhua', 'XH', 'X', '115.065', '40.6096', '');
INSERT INTO `t_order_region` VALUES ('161', '130706', '130700', '下花园区', '中国,河北省,张家口市,下花园区', '下花园', '中国,河北,张家口,下花园', '3', '0313', '075300', 'Xiahuayuan', 'XHY', 'X', '115.287', '40.5024', '');
INSERT INTO `t_order_region` VALUES ('162', '130708', '130700', '万全区', '中国,河北省,张家口市,万全区', '万全', '中国,河北,张家口,万全', '3', '0313', '076250', 'Wanquan', 'WQ', 'W', '114.741', '40.7669', '');
INSERT INTO `t_order_region` VALUES ('163', '130709', '130700', '崇礼区', '中国,河北省,张家口市,崇礼区', '崇礼', '中国,河北,张家口,崇礼', '3', '0313', '076350', 'Chongli', 'CL', 'C', '115.28', '40.9752', '');
INSERT INTO `t_order_region` VALUES ('164', '130722', '130700', '张北县', '中国,河北省,张家口市,张北县', '张北', '中国,河北,张家口,张北', '3', '0313', '076450', 'Zhangbei', 'ZB', 'Z', '114.714', '41.1598', '');
INSERT INTO `t_order_region` VALUES ('165', '130723', '130700', '康保县', '中国,河北省,张家口市,康保县', '康保', '中国,河北,张家口,康保', '3', '0313', '076650', 'Kangbao', 'KB', 'K', '114.6', '41.8522', '');
INSERT INTO `t_order_region` VALUES ('166', '130724', '130700', '沽源县', '中国,河北省,张家口市,沽源县', '沽源', '中国,河北,张家口,沽源', '3', '0313', '076550', 'Guyuan', 'GY', 'G', '115.689', '41.6696', '');
INSERT INTO `t_order_region` VALUES ('167', '130725', '130700', '尚义县', '中国,河北省,张家口市,尚义县', '尚义', '中国,河北,张家口,尚义', '3', '0313', '076750', 'Shangyi', 'SY', 'S', '113.971', '41.0778', '');
INSERT INTO `t_order_region` VALUES ('168', '130726', '130700', '蔚县', '中国,河北省,张家口市,蔚县', '蔚县', '中国,河北,张家口,蔚县', '3', '0313', '075700', 'Yuxian', 'YX', 'Y', '114.589', '39.8407', '');
INSERT INTO `t_order_region` VALUES ('169', '130727', '130700', '阳原县', '中国,河北省,张家口市,阳原县', '阳原', '中国,河北,张家口,阳原', '3', '0313', '075800', 'Yangyuan', 'YY', 'Y', '114.151', '40.1036', '');
INSERT INTO `t_order_region` VALUES ('170', '130728', '130700', '怀安县', '中国,河北省,张家口市,怀安县', '怀安', '中国,河北,张家口,怀安', '3', '0313', '076150', 'Huai\'an', 'HA', 'H', '114.386', '40.6743', '');
INSERT INTO `t_order_region` VALUES ('171', '130730', '130700', '怀来县', '中国,河北省,张家口市,怀来县', '怀来', '中国,河北,张家口,怀来', '3', '0313', '075400', 'Huailai', 'HL', 'H', '115.518', '40.4154', '');
INSERT INTO `t_order_region` VALUES ('172', '130731', '130700', '涿鹿县', '中国,河北省,张家口市,涿鹿县', '涿鹿', '中国,河北,张家口,涿鹿', '3', '0313', '075600', 'Zhuolu', 'ZL', 'Z', '115.224', '40.3764', '');
INSERT INTO `t_order_region` VALUES ('173', '130732', '130700', '赤城县', '中国,河北省,张家口市,赤城县', '赤城', '中国,河北,张家口,赤城', '3', '0313', '075500', 'Chicheng', 'CC', 'C', '115.832', '40.9144', '');
INSERT INTO `t_order_region` VALUES ('174', '130800', '130000', '承德市', '中国,河北省,承德市', '承德', '中国,河北,承德', '2', '0314', '067000', 'Chengde', 'CD', 'C', '117.939', '40.9762', '');
INSERT INTO `t_order_region` VALUES ('175', '130802', '130800', '双桥区', '中国,河北省,承德市,双桥区', '双桥', '中国,河北,承德,双桥', '3', '0314', '067000', 'Shuangqiao', 'SQ', 'S', '117.943', '40.9747', '');
INSERT INTO `t_order_region` VALUES ('176', '130803', '130800', '双滦区', '中国,河北省,承德市,双滦区', '双滦', '中国,河北,承德,双滦', '3', '0314', '067000', 'Shuangluan', 'SL', 'S', '117.745', '40.9538', '');
INSERT INTO `t_order_region` VALUES ('177', '130804', '130800', '鹰手营子矿区', '中国,河北省,承德市,鹰手营子矿区', '鹰手营子矿区', '中国,河北,承德,鹰手营子矿区', '3', '0314', '067200', 'Yingshouyingzikuangqu', 'YSYZKQ', 'Y', '117.66', '40.5474', '');
INSERT INTO `t_order_region` VALUES ('178', '130821', '130800', '承德县', '中国,河北省,承德市,承德县', '承德', '中国,河北,承德,承德', '3', '0314', '067400', 'Chengde', 'CD', 'C', '118.176', '40.7699', '');
INSERT INTO `t_order_region` VALUES ('179', '130822', '130800', '兴隆县', '中国,河北省,承德市,兴隆县', '兴隆', '中国,河北,承德,兴隆', '3', '0314', '067300', 'Xinglong', 'XL', 'X', '117.501', '40.4171', '');
INSERT INTO `t_order_region` VALUES ('180', '130824', '130800', '滦平县', '中国,河北省,承德市,滦平县', '滦平', '中国,河北,承德,滦平', '3', '0314', '068250', 'Luanping', 'LP', 'L', '117.333', '40.9415', '');
INSERT INTO `t_order_region` VALUES ('181', '130825', '130800', '隆化县', '中国,河北省,承德市,隆化县', '隆化', '中国,河北,承德,隆化', '3', '0314', '068150', 'Longhua', 'LH', 'L', '117.73', '41.3141', '');
INSERT INTO `t_order_region` VALUES ('182', '130826', '130800', '丰宁满族自治县', '中国,河北省,承德市,丰宁满族自治县', '丰宁', '中国,河北,承德,丰宁', '3', '0314', '068350', 'Fengning', 'FN', 'F', '116.649', '41.2048', '');
INSERT INTO `t_order_region` VALUES ('183', '130827', '130800', '宽城满族自治县', '中国,河北省,承德市,宽城满族自治县', '宽城', '中国,河北,承德,宽城', '3', '0314', '067600', 'Kuancheng', 'KC', 'K', '118.492', '40.6083', '');
INSERT INTO `t_order_region` VALUES ('184', '130828', '130800', '围场满族蒙古族自治县', '中国,河北省,承德市,围场满族蒙古族自治县', '围场', '中国,河北,承德,围场', '3', '0314', '068450', 'Weichang', 'WC', 'W', '117.76', '41.9437', '');
INSERT INTO `t_order_region` VALUES ('185', '130881', '130800', '平泉市', '中国,河北省,承德市,平泉市', '平泉', '中国,河北,承德,平泉', '3', '0314', '067500', 'Pingquan', 'PQ', 'P', '118.702', '41.0184', '省直辖');
INSERT INTO `t_order_region` VALUES ('186', '130900', '130000', '沧州市', '中国,河北省,沧州市', '沧州', '中国,河北,沧州', '2', '0317', '061000', 'Cangzhou', 'CZ', 'C', '116.857', '38.3106', '');
INSERT INTO `t_order_region` VALUES ('187', '130902', '130900', '新华区', '中国,河北省,沧州市,新华区', '新华', '中国,河北,沧州,新华', '3', '0317', '061000', 'Xinhua', 'XH', 'X', '116.866', '38.3144', '');
INSERT INTO `t_order_region` VALUES ('188', '130903', '130900', '运河区', '中国,河北省,沧州市,运河区', '运河', '中国,河北,沧州,运河', '3', '0317', '061000', 'Yunhe', 'YH', 'Y', '116.857', '38.3135', '');
INSERT INTO `t_order_region` VALUES ('189', '130921', '130900', '沧县', '中国,河北省,沧州市,沧县', '沧县', '中国,河北,沧州,沧县', '3', '0317', '061000', 'Cangxian', 'CX', 'C', '116.878', '38.2936', '');
INSERT INTO `t_order_region` VALUES ('190', '130922', '130900', '青县', '中国,河北省,沧州市,青县', '青县', '中国,河北,沧州,青县', '3', '0317', '062650', 'Qingxian', 'QX', 'Q', '116.803', '38.5835', '');
INSERT INTO `t_order_region` VALUES ('191', '130923', '130900', '东光县', '中国,河北省,沧州市,东光县', '东光', '中国,河北,沧州,东光', '3', '0317', '061600', 'Dongguang', 'DG', 'D', '116.537', '37.8857', '');
INSERT INTO `t_order_region` VALUES ('192', '130924', '130900', '海兴县', '中国,河北省,沧州市,海兴县', '海兴', '中国,河北,沧州,海兴', '3', '0317', '061200', 'Haixing', 'HX', 'H', '117.498', '38.1396', '');
INSERT INTO `t_order_region` VALUES ('193', '130925', '130900', '盐山县', '中国,河北省,沧州市,盐山县', '盐山', '中国,河北,沧州,盐山', '3', '0317', '061300', 'Yanshan', 'YS', 'Y', '117.231', '38.0565', '');
INSERT INTO `t_order_region` VALUES ('194', '130926', '130900', '肃宁县', '中国,河北省,沧州市,肃宁县', '肃宁', '中国,河北,沧州,肃宁', '3', '0317', '062350', 'Suning', 'SN', 'S', '115.83', '38.4227', '');
INSERT INTO `t_order_region` VALUES ('195', '130927', '130900', '南皮县', '中国,河北省,沧州市,南皮县', '南皮', '中国,河北,沧州,南皮', '3', '0317', '061500', 'Nanpi', 'NP', 'N', '116.702', '38.0411', '');
INSERT INTO `t_order_region` VALUES ('196', '130928', '130900', '吴桥县', '中国,河北省,沧州市,吴桥县', '吴桥', '中国,河北,沧州,吴桥', '3', '0317', '061800', 'Wuqiao', 'WQ', 'W', '116.385', '37.6255', '');
INSERT INTO `t_order_region` VALUES ('197', '130929', '130900', '献县', '中国,河北省,沧州市,献县', '献县', '中国,河北,沧州,献县', '3', '0317', '062250', 'Xianxian', 'XX', 'X', '116.127', '38.1923', '');
INSERT INTO `t_order_region` VALUES ('198', '130930', '130900', '孟村回族自治县', '中国,河北省,沧州市,孟村回族自治县', '孟村', '中国,河北,沧州,孟村', '3', '0317', '061400', 'Mengcun', 'MC', 'M', '117.104', '38.0534', '');
INSERT INTO `t_order_region` VALUES ('199', '130981', '130900', '泊头市', '中国,河北省,沧州市,泊头市', '泊头', '中国,河北,沧州,泊头', '3', '0317', '062150', 'Botou', 'BT', 'B', '116.578', '38.0836', '');
INSERT INTO `t_order_region` VALUES ('200', '130982', '130900', '任丘市', '中国,河北省,沧州市,任丘市', '任丘', '中国,河北,沧州,任丘', '3', '0317', '062550', 'Renqiu', 'RQ', 'R', '116.103', '38.7112', '');
INSERT INTO `t_order_region` VALUES ('201', '130983', '130900', '黄骅市', '中国,河北省,沧州市,黄骅市', '黄骅', '中国,河北,沧州,黄骅', '3', '0317', '061100', 'Huanghua', 'HH', 'H', '117.339', '38.3706', '');
INSERT INTO `t_order_region` VALUES ('202', '130984', '130900', '河间市', '中国,河北省,沧州市,河间市', '河间', '中国,河北,沧州,河间', '3', '0317', '062450', 'Hejian', 'HJ', 'H', '116.099', '38.4455', '');
INSERT INTO `t_order_region` VALUES ('203', '130985', '130900', '渤海新区', '中国,河北省,沧州市,渤海新区', '渤海新区', '中国,河北,沧州,渤海新区', '3', '0317', '061100', 'Bohaixinqu', 'BHXQ', 'B', '117.773', '38.2695', '新区');
INSERT INTO `t_order_region` VALUES ('204', '130986', '130900', '临港经济技术开发区', '中国,河北省,沧州市,临港经济技术开发区', '临港经济技术开发区', '中国,河北,沧州,临港经济技术开发区', '3', '0317', '061000', 'Jingjikaifaqu', 'JJKFQ', 'J', '117.52', '38.3563', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('205', '131000', '130000', '廊坊市', '中国,河北省,廊坊市', '廊坊', '中国,河北,廊坊', '2', '0316', '065000', 'Langfang', 'LF', 'L', '116.714', '39.5292', '');
INSERT INTO `t_order_region` VALUES ('206', '131002', '131000', '安次区', '中国,河北省,廊坊市,安次区', '安次', '中国,河北,廊坊,安次', '3', '0316', '065000', 'Anci', 'AC', 'A', '116.703', '39.5206', '');
INSERT INTO `t_order_region` VALUES ('207', '131003', '131000', '广阳区', '中国,河北省,廊坊市,广阳区', '广阳', '中国,河北,廊坊,广阳', '3', '0316', '065000', 'Guangyang', 'GY', 'G', '116.711', '39.5228', '');
INSERT INTO `t_order_region` VALUES ('208', '131022', '131000', '固安县', '中国,河北省,廊坊市,固安县', '固安', '中国,河北,廊坊,固安', '3', '0316', '065500', 'Gu\'an', 'GA', 'G', '116.299', '39.4383', '');
INSERT INTO `t_order_region` VALUES ('209', '131023', '131000', '永清县', '中国,河北省,廊坊市,永清县', '永清', '中国,河北,廊坊,永清', '3', '0316', '065600', 'Yongqing', 'YQ', 'Y', '116.501', '39.3207', '');
INSERT INTO `t_order_region` VALUES ('210', '131024', '131000', '香河县', '中国,河北省,廊坊市,香河县', '香河', '中国,河北,廊坊,香河', '3', '0316', '065400', 'Xianghe', 'XH', 'X', '117.006', '39.7613', '');
INSERT INTO `t_order_region` VALUES ('211', '131025', '131000', '大城县', '中国,河北省,廊坊市,大城县', '大城', '中国,河北,廊坊,大城', '3', '0316', '065900', 'Daicheng', 'DC', 'D', '116.654', '38.7053', '');
INSERT INTO `t_order_region` VALUES ('212', '131026', '131000', '文安县', '中国,河北省,廊坊市,文安县', '文安', '中国,河北,廊坊,文安', '3', '0316', '065800', 'Wen\'an', 'WA', 'W', '116.458', '38.8732', '');
INSERT INTO `t_order_region` VALUES ('213', '131028', '131000', '大厂回族自治县', '中国,河北省,廊坊市,大厂回族自治县', '大厂', '中国,河北,廊坊,大厂', '3', '0316', '065300', 'Dachang', 'DC', 'D', '116.989', '39.8865', '');
INSERT INTO `t_order_region` VALUES ('214', '131081', '131000', '霸州市', '中国,河北省,廊坊市,霸州市', '霸州', '中国,河北,廊坊,霸州', '3', '0316', '065700', 'Bazhou', 'BZ', 'B', '116.392', '39.1257', '');
INSERT INTO `t_order_region` VALUES ('215', '131082', '131000', '三河市', '中国,河北省,廊坊市,三河市', '三河', '中国,河北,廊坊,三河', '3', '0316', '065200', 'Sanhe', 'SH', 'S', '117.072', '39.9836', '');
INSERT INTO `t_order_region` VALUES ('216', '131083', '131000', '经济技术开发区', '中国,河北省,廊坊市,经济技术开发区', '经济技术开发区', '中国,河北,廊坊,经济技术开发区', '3', '0316', '065001', 'Jingjikaifaqu', 'JJKFQ', 'J', '116.758', '39.5668', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('217', '131100', '130000', '衡水市', '中国,河北省,衡水市', '衡水', '中国,河北,衡水', '2', '0318', '053000', 'Hengshui', 'HS', 'H', '115.666', '37.7351', '');
INSERT INTO `t_order_region` VALUES ('218', '131102', '131100', '桃城区', '中国,河北省,衡水市,桃城区', '桃城', '中国,河北,衡水,桃城', '3', '0318', '053000', 'Taocheng', 'TC', 'T', '115.675', '37.735', '');
INSERT INTO `t_order_region` VALUES ('219', '131103', '131100', '冀州区', '中国,河北省,衡水市,冀州区', '冀州', '中国,河北,衡水,冀州', '3', '0318', '053200', 'Jizhou', 'JZ', 'J', '115.579', '37.5508', '');
INSERT INTO `t_order_region` VALUES ('220', '131121', '131100', '枣强县', '中国,河北省,衡水市,枣强县', '枣强', '中国,河北,衡水,枣强', '3', '0318', '053100', 'Zaoqiang', 'ZQ', 'Z', '115.726', '37.5103', '');
INSERT INTO `t_order_region` VALUES ('221', '131122', '131100', '武邑县', '中国,河北省,衡水市,武邑县', '武邑', '中国,河北,衡水,武邑', '3', '0318', '053400', 'Wuyi', 'WY', 'W', '115.887', '37.8018', '');
INSERT INTO `t_order_region` VALUES ('222', '131123', '131100', '武强县', '中国,河北省,衡水市,武强县', '武强', '中国,河北,衡水,武强', '3', '0318', '053300', 'Wuqiang', 'WQ', 'W', '115.982', '38.0414', '');
INSERT INTO `t_order_region` VALUES ('223', '131124', '131100', '饶阳县', '中国,河北省,衡水市,饶阳县', '饶阳', '中国,河北,衡水,饶阳', '3', '0318', '053900', 'Raoyang', 'RY', 'R', '115.726', '38.2353', '');
INSERT INTO `t_order_region` VALUES ('224', '131125', '131100', '安平县', '中国,河北省,衡水市,安平县', '安平', '中国,河北,衡水,安平', '3', '0318', '053600', 'Anping', 'AP', 'A', '115.519', '38.2339', '');
INSERT INTO `t_order_region` VALUES ('225', '131126', '131100', '故城县', '中国,河北省,衡水市,故城县', '故城', '中国,河北,衡水,故城', '3', '0318', '253800', 'Gucheng', 'GC', 'G', '115.971', '37.3477', '');
INSERT INTO `t_order_region` VALUES ('226', '131127', '131100', '景县', '中国,河北省,衡水市,景县', '景县', '中国,河北,衡水,景县', '3', '0318', '053500', 'Jingxian', 'JX', 'J', '116.269', '37.6926', '');
INSERT INTO `t_order_region` VALUES ('227', '131128', '131100', '阜城县', '中国,河北省,衡水市,阜城县', '阜城', '中国,河北,衡水,阜城', '3', '0318', '053700', 'Fucheng', 'FC', 'F', '116.144', '37.8688', '');
INSERT INTO `t_order_region` VALUES ('228', '131182', '131100', '深州市', '中国,河北省,衡水市,深州市', '深州', '中国,河北,衡水,深州', '3', '0318', '053800', 'Shenzhou', 'SZ', 'S', '115.56', '38.0011', '');
INSERT INTO `t_order_region` VALUES ('229', '140000', '100000', '山西省', '中国,山西省', '山西', '中国,山西', '1', '', '', 'Shanxi', 'SX', 'S', '112.549', '37.857', '');
INSERT INTO `t_order_region` VALUES ('230', '140100', '140000', '太原市', '中国,山西省,太原市', '太原', '中国,山西,太原', '2', '0351', '030000', 'Taiyuan', 'TY', 'T', '112.549', '37.857', '');
INSERT INTO `t_order_region` VALUES ('231', '140105', '140100', '小店区', '中国,山西省,太原市,小店区', '小店', '中国,山西,太原,小店', '3', '0351', '030000', 'Xiaodian', 'XD', 'X', '112.569', '37.7356', '');
INSERT INTO `t_order_region` VALUES ('232', '140106', '140100', '迎泽区', '中国,山西省,太原市,迎泽区', '迎泽', '中国,山西,太原,迎泽', '3', '0351', '030000', 'Yingze', 'YZ', 'Y', '112.563', '37.8633', '');
INSERT INTO `t_order_region` VALUES ('233', '140107', '140100', '杏花岭区', '中国,山西省,太原市,杏花岭区', '杏花岭', '中国,山西,太原,杏花岭', '3', '0351', '030000', 'Xinghualing', 'XHL', 'X', '112.562', '37.8843', '');
INSERT INTO `t_order_region` VALUES ('234', '140108', '140100', '尖草坪区', '中国,山西省,太原市,尖草坪区', '尖草坪', '中国,山西,太原,尖草坪', '3', '0351', '030000', 'Jiancaoping', 'JCP', 'J', '112.487', '37.9419', '');
INSERT INTO `t_order_region` VALUES ('235', '140109', '140100', '万柏林区', '中国,山西省,太原市,万柏林区', '万柏林', '中国,山西,太原,万柏林', '3', '0351', '030000', 'Wanbailin', 'WBL', 'W', '112.516', '37.8592', '');
INSERT INTO `t_order_region` VALUES ('236', '140110', '140100', '晋源区', '中国,山西省,太原市,晋源区', '晋源', '中国,山西,太原,晋源', '3', '0351', '030000', 'Jinyuan', 'JY', 'J', '112.48', '37.7248', '');
INSERT INTO `t_order_region` VALUES ('237', '140121', '140100', '清徐县', '中国,山西省,太原市,清徐县', '清徐', '中国,山西,太原,清徐', '3', '0351', '030400', 'Qingxu', 'QX', 'Q', '112.359', '37.6076', '');
INSERT INTO `t_order_region` VALUES ('238', '140122', '140100', '阳曲县', '中国,山西省,太原市,阳曲县', '阳曲', '中国,山西,太原,阳曲', '3', '0351', '030100', 'Yangqu', 'YQ', 'Y', '112.679', '38.0599', '');
INSERT INTO `t_order_region` VALUES ('239', '140123', '140100', '娄烦县', '中国,山西省,太原市,娄烦县', '娄烦', '中国,山西,太原,娄烦', '3', '0351', '030300', 'Loufan', 'LF', 'L', '111.795', '38.0669', '');
INSERT INTO `t_order_region` VALUES ('240', '140181', '140100', '古交市', '中国,山西省,太原市,古交市', '古交', '中国,山西,太原,古交', '3', '0351', '030200', 'Gujiao', 'GJ', 'G', '112.169', '37.9098', '');
INSERT INTO `t_order_region` VALUES ('241', '140182', '140100', '高新阳曲园区', '中国,山西省,太原市,高新阳曲园区', '阳曲园区', '中国,山西,太原,阳曲园区', '3', '0351', '030100', 'Yangquyuanqu', 'YQYQ', 'Y', '112.56', '37.8008', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('242', '140183', '140100', '高新汾东园区', '中国,山西省,太原市,高新汾东园区', '汾东园区', '中国,山西,太原,汾东园区', '3', '0351', '030032', 'Fendongyuanqu', 'FDYQ', 'F', '112.58', '37.7047', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('243', '140184', '140100', '高新姚村园区', '中国,山西省,太原市,高新姚村园区', '姚村园区', '中国,山西,太原,姚村园区', '3', '0351', '030054', 'Yaocunyuanqu', 'YCYQ', 'Y', '112.395', '37.6465', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('244', '140200', '140000', '大同市', '中国,山西省,大同市', '大同', '中国,山西,大同', '2', '0352', '037000', 'Datong', 'DT', 'D', '113.295', '40.0903', '');
INSERT INTO `t_order_region` VALUES ('245', '140202', '140200', '城区', '中国,山西省,大同市,城区', '城区', '中国,山西,大同,城区', '3', '0352', '037008', 'Chengqu', 'CQ', 'C', '113.298', '40.0757', '');
INSERT INTO `t_order_region` VALUES ('246', '140203', '140200', '矿区', '中国,山西省,大同市,矿区', '矿区', '中国,山西,大同,矿区', '3', '0352', '037003', 'Kuangqu', 'KQ', 'K', '113.177', '40.0368', '');
INSERT INTO `t_order_region` VALUES ('247', '140211', '140200', '南郊区', '中国,山西省,大同市,南郊区', '南郊', '中国,山西,大同,南郊', '3', '0352', '037001', 'Nanjiao', 'NJ', 'N', '113.149', '40.0054', '');
INSERT INTO `t_order_region` VALUES ('248', '140212', '140200', '新荣区', '中国,山西省,大同市,新荣区', '新荣', '中国,山西,大同,新荣', '3', '0352', '037002', 'Xinrong', 'XR', 'X', '113.135', '40.2562', '');
INSERT INTO `t_order_region` VALUES ('249', '140221', '140200', '阳高县', '中国,山西省,大同市,阳高县', '阳高', '中国,山西,大同,阳高', '3', '0352', '038100', 'Yanggao', 'YG', 'Y', '113.75', '40.3626', '');
INSERT INTO `t_order_region` VALUES ('250', '140222', '140200', '天镇县', '中国,山西省,大同市,天镇县', '天镇', '中国,山西,大同,天镇', '3', '0352', '038200', 'Tianzhen', 'TZ', 'T', '114.093', '40.423', '');
INSERT INTO `t_order_region` VALUES ('251', '140223', '140200', '广灵县', '中国,山西省,大同市,广灵县', '广灵', '中国,山西,大同,广灵', '3', '0352', '037500', 'Guangling', 'GL', 'G', '114.282', '39.7608', '');
INSERT INTO `t_order_region` VALUES ('252', '140224', '140200', '灵丘县', '中国,山西省,大同市,灵丘县', '灵丘', '中国,山西,大同,灵丘', '3', '0352', '034400', 'Lingqiu', 'LQ', 'L', '114.237', '39.4404', '');
INSERT INTO `t_order_region` VALUES ('253', '140225', '140200', '浑源县', '中国,山西省,大同市,浑源县', '浑源', '中国,山西,大同,浑源', '3', '0352', '037400', 'Hunyuan', 'HY', 'H', '113.696', '39.6996', '');
INSERT INTO `t_order_region` VALUES ('254', '140226', '140200', '左云县', '中国,山西省,大同市,左云县', '左云', '中国,山西,大同,左云', '3', '0352', '037100', 'Zuoyun', 'ZY', 'Z', '112.703', '40.0134', '');
INSERT INTO `t_order_region` VALUES ('255', '140227', '140200', '大同县', '中国,山西省,大同市,大同县', '大同', '中国,山西,大同,大同', '3', '0352', '037300', 'Datong', 'DT', 'D', '113.612', '40.0401', '');
INSERT INTO `t_order_region` VALUES ('256', '140228', '140200', '经济开发区', '中国,山西省,大同市,经济开发区', '经济开发区', '中国,山西,大同,经济开发区', '3', '0352', '037000', 'Jingjikaifaqu', 'JJKFQ', 'J', '113.395', '40.0705', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('257', '140300', '140000', '阳泉市', '中国,山西省,阳泉市', '阳泉', '中国,山西,阳泉', '2', '0353', '045000', 'Yangquan', 'YQ', 'Y', '113.583', '37.8612', '');
INSERT INTO `t_order_region` VALUES ('258', '140302', '140300', '城区', '中国,山西省,阳泉市,城区', '城区', '中国,山西,阳泉,城区', '3', '0353', '045000', 'Chengqu', 'CQ', 'C', '113.601', '37.8474', '');
INSERT INTO `t_order_region` VALUES ('259', '140303', '140300', '矿区', '中国,山西省,阳泉市,矿区', '矿区', '中国,山西,阳泉,矿区', '3', '0353', '045000', 'Kuangqu', 'KQ', 'K', '113.557', '37.8689', '');
INSERT INTO `t_order_region` VALUES ('260', '140311', '140300', '郊区', '中国,山西省,阳泉市,郊区', '郊区', '中国,山西,阳泉,郊区', '3', '0353', '045000', 'Jiaoqu', 'JQ', 'J', '113.585', '37.9414', '');
INSERT INTO `t_order_region` VALUES ('261', '140321', '140300', '平定县', '中国,山西省,阳泉市,平定县', '平定', '中国,山西,阳泉,平定', '3', '0353', '045200', 'Pingding', 'PD', 'P', '113.658', '37.786', '');
INSERT INTO `t_order_region` VALUES ('262', '140322', '140300', '盂县', '中国,山西省,阳泉市,盂县', '盂县', '中国,山西,阳泉,盂县', '3', '0353', '045100', 'Yuxian', 'YX', 'Y', '113.412', '38.0858', '');
INSERT INTO `t_order_region` VALUES ('263', '140400', '140000', '长治市', '中国,山西省,长治市', '长治', '中国,山西,长治', '2', '0355', '046000', 'Changzhi', 'CZ', 'C', '113.114', '36.1911', '');
INSERT INTO `t_order_region` VALUES ('264', '140402', '140400', '城区', '中国,山西省,长治市,城区', '城区', '中国,山西,长治,城区', '3', '0355', '046000', 'Chengqu', 'CQ', 'C', '113.123', '36.2035', '');
INSERT INTO `t_order_region` VALUES ('265', '140411', '140400', '郊区', '中国,山西省,长治市,郊区', '郊区', '中国,山西,长治,郊区', '3', '0355', '046000', 'Jiaoqu', 'JQ', 'J', '113.127', '36.1992', '');
INSERT INTO `t_order_region` VALUES ('266', '140421', '140400', '长治县', '中国,山西省,长治市,长治县', '长治', '中国,山西,长治,长治', '3', '0355', '047100', 'Changzhi', 'CZ', 'C', '113.048', '36.0472', '');
INSERT INTO `t_order_region` VALUES ('267', '140423', '140400', '襄垣县', '中国,山西省,长治市,襄垣县', '襄垣', '中国,山西,长治,襄垣', '3', '0355', '046200', 'Xiangyuan', 'XY', 'X', '113.052', '36.5353', '');
INSERT INTO `t_order_region` VALUES ('268', '140424', '140400', '屯留县', '中国,山西省,长治市,屯留县', '屯留', '中国,山西,长治,屯留', '3', '0355', '046100', 'Tunliu', 'TL', 'T', '112.892', '36.3158', '');
INSERT INTO `t_order_region` VALUES ('269', '140425', '140400', '平顺县', '中国,山西省,长治市,平顺县', '平顺', '中国,山西,长治,平顺', '3', '0355', '047400', 'Pingshun', 'PS', 'P', '113.436', '36.2001', '');
INSERT INTO `t_order_region` VALUES ('270', '140426', '140400', '黎城县', '中国,山西省,长治市,黎城县', '黎城', '中国,山西,长治,黎城', '3', '0355', '047600', 'Licheng', 'LC', 'L', '113.388', '36.503', '');
INSERT INTO `t_order_region` VALUES ('271', '140427', '140400', '壶关县', '中国,山西省,长治市,壶关县', '壶关', '中国,山西,长治,壶关', '3', '0355', '047300', 'Huguan', 'HG', 'H', '113.207', '36.113', '');
INSERT INTO `t_order_region` VALUES ('272', '140428', '140400', '长子县', '中国,山西省,长治市,长子县', '长子', '中国,山西,长治,长子', '3', '0355', '046600', 'Zhangzi', 'ZZ', 'Z', '112.877', '36.1213', '');
INSERT INTO `t_order_region` VALUES ('273', '140429', '140400', '武乡县', '中国,山西省,长治市,武乡县', '武乡', '中国,山西,长治,武乡', '3', '0355', '046300', 'Wuxiang', 'WX', 'W', '112.863', '36.8369', '');
INSERT INTO `t_order_region` VALUES ('274', '140430', '140400', '沁县', '中国,山西省,长治市,沁县', '沁县', '中国,山西,长治,沁县', '3', '0355', '046400', 'Qinxian', 'QX', 'Q', '112.699', '36.7563', '');
INSERT INTO `t_order_region` VALUES ('275', '140431', '140400', '沁源县', '中国,山西省,长治市,沁源县', '沁源', '中国,山西,长治,沁源', '3', '0355', '046500', 'Qinyuan', 'QY', 'Q', '112.338', '36.5001', '');
INSERT INTO `t_order_region` VALUES ('276', '140481', '140400', '潞城市', '中国,山西省,长治市,潞城市', '潞城', '中国,山西,长治,潞城', '3', '0355', '047500', 'Lucheng', 'LC', 'L', '113.229', '36.3341', '');
INSERT INTO `t_order_region` VALUES ('277', '140500', '140000', '晋城市', '中国,山西省,晋城市', '晋城', '中国,山西,晋城', '2', '0356', '048000', 'Jincheng', 'JC', 'J', '112.851', '35.4976', '');
INSERT INTO `t_order_region` VALUES ('278', '140502', '140500', '城区', '中国,山西省,晋城市,城区', '城区', '中国,山西,晋城,城区', '3', '0356', '048000', 'Chengqu', 'CQ', 'C', '112.853', '35.5018', '');
INSERT INTO `t_order_region` VALUES ('279', '140521', '140500', '沁水县', '中国,山西省,晋城市,沁水县', '沁水', '中国,山西,晋城,沁水', '3', '0356', '048200', 'Qinshui', 'QS', 'Q', '112.187', '35.691', '');
INSERT INTO `t_order_region` VALUES ('280', '140522', '140500', '阳城县', '中国,山西省,晋城市,阳城县', '阳城', '中国,山西,晋城,阳城', '3', '0356', '048100', 'Yangcheng', 'YC', 'Y', '112.415', '35.4861', '');
INSERT INTO `t_order_region` VALUES ('281', '140524', '140500', '陵川县', '中国,山西省,晋城市,陵川县', '陵川', '中国,山西,晋城,陵川', '3', '0356', '048300', 'Lingchuan', 'LC', 'L', '113.281', '35.7753', '');
INSERT INTO `t_order_region` VALUES ('282', '140525', '140500', '泽州县', '中国,山西省,晋城市,泽州县', '泽州', '中国,山西,晋城,泽州', '3', '0356', '048000', 'Zezhou', 'ZZ', 'Z', '112.839', '35.5079', '');
INSERT INTO `t_order_region` VALUES ('283', '140581', '140500', '高平市', '中国,山西省,晋城市,高平市', '高平', '中国,山西,晋城,高平', '3', '0356', '048400', 'Gaoping', 'GP', 'G', '112.923', '35.7971', '');
INSERT INTO `t_order_region` VALUES ('284', '140582', '140500', '经济开发区', '中国,山西省,晋城市,经济开发区', '经济开发区', '中国,山西,晋城,经济开发区', '3', '0356', '048000', 'Jingjikaifaqu', 'JJKFQ', 'J', '112.882', '35.4977', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('285', '140600', '140000', '朔州市', '中国,山西省,朔州市', '朔州', '中国,山西,朔州', '2', '0349', '036000', 'Shuozhou', 'SZ', 'S', '112.433', '39.3313', '');
INSERT INTO `t_order_region` VALUES ('286', '140602', '140600', '朔城区', '中国,山西省,朔州市,朔城区', '朔城', '中国,山西,朔州,朔城', '3', '0349', '036002', 'Shuocheng', 'SC', 'S', '112.432', '39.3198', '');
INSERT INTO `t_order_region` VALUES ('287', '140603', '140600', '平鲁区', '中国,山西省,朔州市,平鲁区', '平鲁', '中国,山西,朔州,平鲁', '3', '0349', '036800', 'Pinglu', 'PL', 'P', '112.288', '39.5116', '');
INSERT INTO `t_order_region` VALUES ('288', '140621', '140600', '山阴县', '中国,山西省,朔州市,山阴县', '山阴', '中国,山西,朔州,山阴', '3', '0349', '036900', 'Shanyin', 'SY', 'S', '112.817', '39.527', '');
INSERT INTO `t_order_region` VALUES ('289', '140622', '140600', '应县', '中国,山西省,朔州市,应县', '应县', '中国,山西,朔州,应县', '3', '0349', '037600', 'Yingxian', 'YX', 'Y', '113.191', '39.5528', '');
INSERT INTO `t_order_region` VALUES ('290', '140623', '140600', '右玉县', '中国,山西省,朔州市,右玉县', '右玉', '中国,山西,朔州,右玉', '3', '0349', '037200', 'Youyu', 'YY', 'Y', '112.469', '39.9901', '');
INSERT INTO `t_order_region` VALUES ('291', '140624', '140600', '怀仁县', '中国,山西省,朔州市,怀仁县', '怀仁', '中国,山西,朔州,怀仁', '3', '0349', '038300', 'Huairen', 'HR', 'H', '113.1', '39.8281', '');
INSERT INTO `t_order_region` VALUES ('292', '140700', '140000', '晋中市', '中国,山西省,晋中市', '晋中', '中国,山西,晋中', '2', '0354', '030600', 'Jinzhong', 'JZ', 'J', '112.736', '37.6965', '');
INSERT INTO `t_order_region` VALUES ('293', '140702', '140700', '榆次区', '中国,山西省,晋中市,榆次区', '榆次', '中国,山西,晋中,榆次', '3', '0354', '030600', 'Yuci', 'YC', 'Y', '112.708', '37.6978', '');
INSERT INTO `t_order_region` VALUES ('294', '140721', '140700', '榆社县', '中国,山西省,晋中市,榆社县', '榆社', '中国,山西,晋中,榆社', '3', '0354', '031800', 'Yushe', 'YS', 'Y', '112.976', '37.0721', '');
INSERT INTO `t_order_region` VALUES ('295', '140722', '140700', '左权县', '中国,山西省,晋中市,左权县', '左权', '中国,山西,晋中,左权', '3', '0354', '032600', 'Zuoquan', 'ZQ', 'Z', '113.379', '37.0824', '');
INSERT INTO `t_order_region` VALUES ('296', '140723', '140700', '和顺县', '中国,山西省,晋中市,和顺县', '和顺', '中国,山西,晋中,和顺', '3', '0354', '032700', 'Heshun', 'HS', 'H', '113.57', '37.3296', '');
INSERT INTO `t_order_region` VALUES ('297', '140724', '140700', '昔阳县', '中国,山西省,晋中市,昔阳县', '昔阳', '中国,山西,晋中,昔阳', '3', '0354', '045300', 'Xiyang', 'XY', 'X', '113.705', '37.6186', '');
INSERT INTO `t_order_region` VALUES ('298', '140725', '140700', '寿阳县', '中国,山西省,晋中市,寿阳县', '寿阳', '中国,山西,晋中,寿阳', '3', '0354', '045400', 'Shouyang', 'SY', 'S', '113.175', '37.889', '');
INSERT INTO `t_order_region` VALUES ('299', '140726', '140700', '太谷县', '中国,山西省,晋中市,太谷县', '太谷', '中国,山西,晋中,太谷', '3', '0354', '030800', 'Taigu', 'TG', 'T', '112.552', '37.4216', '');
INSERT INTO `t_order_region` VALUES ('300', '140727', '140700', '祁县', '中国,山西省,晋中市,祁县', '祁县', '中国,山西,晋中,祁县', '3', '0354', '030900', 'Qixian', 'QX', 'Q', '112.334', '37.3579', '');
INSERT INTO `t_order_region` VALUES ('301', '140728', '140700', '平遥县', '中国,山西省,晋中市,平遥县', '平遥', '中国,山西,晋中,平遥', '3', '0354', '031100', 'Pingyao', 'PY', 'P', '112.176', '37.1892', '');
INSERT INTO `t_order_region` VALUES ('302', '140729', '140700', '灵石县', '中国,山西省,晋中市,灵石县', '灵石', '中国,山西,晋中,灵石', '3', '0354', '031300', 'Lingshi', 'LS', 'L', '111.777', '36.8481', '');
INSERT INTO `t_order_region` VALUES ('303', '140781', '140700', '介休市', '中国,山西省,晋中市,介休市', '介休', '中国,山西,晋中,介休', '3', '0354', '032000', 'Jiexiu', 'JX', 'J', '111.918', '37.0277', '');
INSERT INTO `t_order_region` VALUES ('304', '140800', '140000', '运城市', '中国,山西省,运城市', '运城', '中国,山西,运城', '2', '0359', '044000', 'Yuncheng', 'YC', 'Y', '111.004', '35.0228', '');
INSERT INTO `t_order_region` VALUES ('305', '140802', '140800', '盐湖区', '中国,山西省,运城市,盐湖区', '盐湖', '中国,山西,运城,盐湖', '3', '0359', '044000', 'Yanhu', 'YH', 'Y', '110.998', '35.0151', '');
INSERT INTO `t_order_region` VALUES ('306', '140821', '140800', '临猗县', '中国,山西省,运城市,临猗县', '临猗', '中国,山西,运城,临猗', '3', '0359', '044100', 'Linyi', 'LY', 'L', '110.774', '35.1446', '');
INSERT INTO `t_order_region` VALUES ('307', '140822', '140800', '万荣县', '中国,山西省,运城市,万荣县', '万荣', '中国,山西,运城,万荣', '3', '0359', '044200', 'Wanrong', 'WR', 'W', '110.837', '35.4156', '');
INSERT INTO `t_order_region` VALUES ('308', '140823', '140800', '闻喜县', '中国,山西省,运城市,闻喜县', '闻喜', '中国,山西,运城,闻喜', '3', '0359', '043800', 'Wenxi', 'WX', 'W', '111.223', '35.3555', '');
INSERT INTO `t_order_region` VALUES ('309', '140824', '140800', '稷山县', '中国,山西省,运城市,稷山县', '稷山', '中国,山西,运城,稷山', '3', '0359', '043200', 'Jishan', 'JS', 'J', '110.979', '35.5999', '');
INSERT INTO `t_order_region` VALUES ('310', '140825', '140800', '新绛县', '中国,山西省,运城市,新绛县', '新绛', '中国,山西,运城,新绛', '3', '0359', '043100', 'Xinjiang', 'XJ', 'X', '111.225', '35.6157', '');
INSERT INTO `t_order_region` VALUES ('311', '140826', '140800', '绛县', '中国,山西省,运城市,绛县', '绛县', '中国,山西,运城,绛县', '3', '0359', '043600', 'Jiangxian', 'JX', 'J', '111.567', '35.491', '');
INSERT INTO `t_order_region` VALUES ('312', '140827', '140800', '垣曲县', '中国,山西省,运城市,垣曲县', '垣曲', '中国,山西,运城,垣曲', '3', '0359', '043700', 'Yuanqu', 'YQ', 'Y', '111.672', '35.2992', '');
INSERT INTO `t_order_region` VALUES ('313', '140828', '140800', '夏县', '中国,山西省,运城市,夏县', '夏县', '中国,山西,运城,夏县', '3', '0359', '044400', 'Xiaxian', 'XX', 'X', '111.22', '35.1412', '');
INSERT INTO `t_order_region` VALUES ('314', '140829', '140800', '平陆县', '中国,山西省,运城市,平陆县', '平陆', '中国,山西,运城,平陆', '3', '0359', '044300', 'Pinglu', 'PL', 'P', '111.217', '34.8377', '');
INSERT INTO `t_order_region` VALUES ('315', '140830', '140800', '芮城县', '中国,山西省,运城市,芮城县', '芮城', '中国,山西,运城,芮城', '3', '0359', '044600', 'Ruicheng', 'RC', 'R', '110.695', '34.6938', '');
INSERT INTO `t_order_region` VALUES ('316', '140881', '140800', '永济市', '中国,山西省,运城市,永济市', '永济', '中国,山西,运城,永济', '3', '0359', '044500', 'Yongji', 'YJ', 'Y', '110.445', '34.8656', '');
INSERT INTO `t_order_region` VALUES ('317', '140882', '140800', '河津市', '中国,山西省,运城市,河津市', '河津', '中国,山西,运城,河津', '3', '0359', '043300', 'Hejin', 'HJ', 'H', '110.712', '35.5948', '');
INSERT INTO `t_order_region` VALUES ('318', '140900', '140000', '忻州市', '中国,山西省,忻州市', '忻州', '中国,山西,忻州', '2', '0350', '034000', 'Xinzhou', 'XZ', 'X', '112.734', '38.4177', '');
INSERT INTO `t_order_region` VALUES ('319', '140902', '140900', '忻府区', '中国,山西省,忻州市,忻府区', '忻府', '中国,山西,忻州,忻府', '3', '0350', '034000', 'Xinfu', 'XF', 'X', '112.746', '38.4041', '');
INSERT INTO `t_order_region` VALUES ('320', '140921', '140900', '定襄县', '中国,山西省,忻州市,定襄县', '定襄', '中国,山西,忻州,定襄', '3', '0350', '035400', 'Dingxiang', 'DX', 'D', '112.957', '38.4739', '');
INSERT INTO `t_order_region` VALUES ('321', '140922', '140900', '五台县', '中国,山西省,忻州市,五台县', '五台', '中国,山西,忻州,五台', '3', '0350', '035500', 'Wutai', 'WT', 'W', '113.253', '38.7277', '');
INSERT INTO `t_order_region` VALUES ('322', '140923', '140900', '代县', '中国,山西省,忻州市,代县', '代县', '中国,山西,忻州,代县', '3', '0350', '034200', 'Daixian', 'DX', 'D', '112.959', '39.0672', '');
INSERT INTO `t_order_region` VALUES ('323', '140924', '140900', '繁峙县', '中国,山西省,忻州市,繁峙县', '繁峙', '中国,山西,忻州,繁峙', '3', '0350', '034300', 'Fanshi', 'FS', 'F', '113.263', '39.1889', '');
INSERT INTO `t_order_region` VALUES ('324', '140925', '140900', '宁武县', '中国,山西省,忻州市,宁武县', '宁武', '中国,山西,忻州,宁武', '3', '0350', '036000', 'Ningwu', 'NW', 'N', '112.304', '39.0021', '');
INSERT INTO `t_order_region` VALUES ('325', '140926', '140900', '静乐县', '中国,山西省,忻州市,静乐县', '静乐', '中国,山西,忻州,静乐', '3', '0350', '035100', 'Jingle', 'JL', 'J', '111.942', '38.3602', '');
INSERT INTO `t_order_region` VALUES ('326', '140927', '140900', '神池县', '中国,山西省,忻州市,神池县', '神池', '中国,山西,忻州,神池', '3', '0350', '036100', 'Shenchi', 'SC', 'S', '112.205', '39.09', '');
INSERT INTO `t_order_region` VALUES ('327', '140928', '140900', '五寨县', '中国,山西省,忻州市,五寨县', '五寨', '中国,山西,忻州,五寨', '3', '0350', '036200', 'Wuzhai', 'WZ', 'W', '111.849', '38.9076', '');
INSERT INTO `t_order_region` VALUES ('328', '140929', '140900', '岢岚县', '中国,山西省,忻州市,岢岚县', '岢岚', '中国,山西,忻州,岢岚', '3', '0350', '036300', 'Kelan', 'KL', 'K', '111.574', '38.7045', '');
INSERT INTO `t_order_region` VALUES ('329', '140930', '140900', '河曲县', '中国,山西省,忻州市,河曲县', '河曲', '中国,山西,忻州,河曲', '3', '0350', '036500', 'Hequ', 'HQ', 'H', '111.138', '39.3844', '');
INSERT INTO `t_order_region` VALUES ('330', '140931', '140900', '保德县', '中国,山西省,忻州市,保德县', '保德', '中国,山西,忻州,保德', '3', '0350', '036600', 'Baode', 'BD', 'B', '111.087', '39.0225', '');
INSERT INTO `t_order_region` VALUES ('331', '140932', '140900', '偏关县', '中国,山西省,忻州市,偏关县', '偏关', '中国,山西,忻州,偏关', '3', '0350', '036400', 'Pianguan', 'PG', 'P', '111.509', '39.4361', '');
INSERT INTO `t_order_region` VALUES ('332', '140981', '140900', '原平市', '中国,山西省,忻州市,原平市', '原平', '中国,山西,忻州,原平', '3', '0350', '034100', 'Yuanping', 'YP', 'Y', '112.706', '38.7318', '');
INSERT INTO `t_order_region` VALUES ('333', '141000', '140000', '临汾市', '中国,山西省,临汾市', '临汾', '中国,山西,临汾', '2', '0357', '041000', 'Linfen', 'LF', 'L', '111.518', '36.0841', '');
INSERT INTO `t_order_region` VALUES ('334', '141002', '141000', '尧都区', '中国,山西省,临汾市,尧都区', '尧都', '中国,山西,临汾,尧都', '3', '0357', '041000', 'Yaodu', 'YD', 'Y', '111.579', '36.083', '');
INSERT INTO `t_order_region` VALUES ('335', '141021', '141000', '曲沃县', '中国,山西省,临汾市,曲沃县', '曲沃', '中国,山西,临汾,曲沃', '3', '0357', '043400', 'Quwo', 'QW', 'Q', '111.475', '35.6412', '');
INSERT INTO `t_order_region` VALUES ('336', '141022', '141000', '翼城县', '中国,山西省,临汾市,翼城县', '翼城', '中国,山西,临汾,翼城', '3', '0357', '043500', 'Yicheng', 'YC', 'Y', '111.718', '35.7388', '');
INSERT INTO `t_order_region` VALUES ('337', '141023', '141000', '襄汾县', '中国,山西省,临汾市,襄汾县', '襄汾', '中国,山西,临汾,襄汾', '3', '0357', '041500', 'Xiangfen', 'XF', 'X', '111.442', '35.8771', '');
INSERT INTO `t_order_region` VALUES ('338', '141024', '141000', '洪洞县', '中国,山西省,临汾市,洪洞县', '洪洞', '中国,山西,临汾,洪洞', '3', '0357', '031600', 'Hongtong', 'HT', 'H', '111.675', '36.2542', '');
INSERT INTO `t_order_region` VALUES ('339', '141025', '141000', '古县', '中国,山西省,临汾市,古县', '古县', '中国,山西,临汾,古县', '3', '0357', '042400', 'Guxian', 'GX', 'G', '111.92', '36.2669', '');
INSERT INTO `t_order_region` VALUES ('340', '141026', '141000', '安泽县', '中国,山西省,临汾市,安泽县', '安泽', '中国,山西,临汾,安泽', '3', '0357', '042500', 'Anze', 'AZ', 'A', '112.25', '36.148', '');
INSERT INTO `t_order_region` VALUES ('341', '141027', '141000', '浮山县', '中国,山西省,临汾市,浮山县', '浮山', '中国,山西,临汾,浮山', '3', '0357', '042600', 'Fushan', 'FS', 'F', '111.847', '35.9685', '');
INSERT INTO `t_order_region` VALUES ('342', '141028', '141000', '吉县', '中国,山西省,临汾市,吉县', '吉县', '中国,山西,临汾,吉县', '3', '0357', '042200', 'Jixian', 'JX', 'J', '110.681', '36.0987', '');
INSERT INTO `t_order_region` VALUES ('343', '141029', '141000', '乡宁县', '中国,山西省,临汾市,乡宁县', '乡宁', '中国,山西,临汾,乡宁', '3', '0357', '042100', 'Xiangning', 'XN', 'X', '110.847', '35.9707', '');
INSERT INTO `t_order_region` VALUES ('344', '141030', '141000', '大宁县', '中国,山西省,临汾市,大宁县', '大宁', '中国,山西,临汾,大宁', '3', '0357', '042300', 'Daning', 'DN', 'D', '110.752', '36.4662', '');
INSERT INTO `t_order_region` VALUES ('345', '141031', '141000', '隰县', '中国,山西省,临汾市,隰县', '隰县', '中国,山西,临汾,隰县', '3', '0357', '041300', 'Xixian', 'XX', 'X', '110.939', '36.6926', '');
INSERT INTO `t_order_region` VALUES ('346', '141032', '141000', '永和县', '中国,山西省,临汾市,永和县', '永和', '中国,山西,临汾,永和', '3', '0357', '041400', 'Yonghe', 'YH', 'Y', '110.632', '36.7584', '');
INSERT INTO `t_order_region` VALUES ('347', '141033', '141000', '蒲县', '中国,山西省,临汾市,蒲县', '蒲县', '中国,山西,临汾,蒲县', '3', '0357', '041200', 'Puxian', 'PX', 'P', '111.097', '36.4124', '');
INSERT INTO `t_order_region` VALUES ('348', '141034', '141000', '汾西县', '中国,山西省,临汾市,汾西县', '汾西', '中国,山西,临汾,汾西', '3', '0357', '031500', 'Fenxi', 'FX', 'F', '111.568', '36.6506', '');
INSERT INTO `t_order_region` VALUES ('349', '141081', '141000', '侯马市', '中国,山西省,临汾市,侯马市', '侯马', '中国,山西,临汾,侯马', '3', '0357', '043000', 'Houma', 'HM', 'H', '111.372', '35.619', '');
INSERT INTO `t_order_region` VALUES ('350', '141082', '141000', '霍州市', '中国,山西省,临汾市,霍州市', '霍州', '中国,山西,临汾,霍州', '3', '0357', '031400', 'Huozhou', 'HZ', 'H', '111.755', '36.5638', '');
INSERT INTO `t_order_region` VALUES ('351', '141100', '140000', '吕梁市', '中国,山西省,吕梁市', '吕梁', '中国,山西,吕梁', '2', '0358', '033000', 'Lvliang', 'LL', 'L', '111.134', '37.5244', '');
INSERT INTO `t_order_region` VALUES ('352', '141102', '141100', '离石区', '中国,山西省,吕梁市,离石区', '离石', '中国,山西,吕梁,离石', '3', '0358', '033000', 'Lishi', 'LS', 'L', '111.151', '37.5177', '');
INSERT INTO `t_order_region` VALUES ('353', '141121', '141100', '文水县', '中国,山西省,吕梁市,文水县', '文水', '中国,山西,吕梁,文水', '3', '0358', '032100', 'Wenshui', 'WS', 'W', '112.028', '37.4384', '');
INSERT INTO `t_order_region` VALUES ('354', '141122', '141100', '交城县', '中国,山西省,吕梁市,交城县', '交城', '中国,山西,吕梁,交城', '3', '0358', '030500', 'Jiaocheng', 'JC', 'J', '112.159', '37.5512', '');
INSERT INTO `t_order_region` VALUES ('355', '141123', '141100', '兴县', '中国,山西省,吕梁市,兴县', '兴县', '中国,山西,吕梁,兴县', '3', '0358', '033600', 'Xingxian', 'XX', 'X', '111.127', '38.4632', '');
INSERT INTO `t_order_region` VALUES ('356', '141124', '141100', '临县', '中国,山西省,吕梁市,临县', '临县', '中国,山西,吕梁,临县', '3', '0358', '033200', 'Linxian', 'LX', 'L', '110.993', '37.9527', '');
INSERT INTO `t_order_region` VALUES ('357', '141125', '141100', '柳林县', '中国,山西省,吕梁市,柳林县', '柳林', '中国,山西,吕梁,柳林', '3', '0358', '033300', 'Liulin', 'LL', 'L', '110.889', '37.4293', '');
INSERT INTO `t_order_region` VALUES ('358', '141126', '141100', '石楼县', '中国,山西省,吕梁市,石楼县', '石楼', '中国,山西,吕梁,石楼', '3', '0358', '032500', 'Shilou', 'SL', 'S', '110.835', '36.9973', '');
INSERT INTO `t_order_region` VALUES ('359', '141127', '141100', '岚县', '中国,山西省,吕梁市,岚县', '岚县', '中国,山西,吕梁,岚县', '3', '0358', '035200', 'Lanxian', 'LX', 'L', '111.676', '38.2787', '');
INSERT INTO `t_order_region` VALUES ('360', '141128', '141100', '方山县', '中国,山西省,吕梁市,方山县', '方山', '中国,山西,吕梁,方山', '3', '0358', '033100', 'Fangshan', 'FS', 'F', '111.24', '37.8898', '');
INSERT INTO `t_order_region` VALUES ('361', '141129', '141100', '中阳县', '中国,山西省,吕梁市,中阳县', '中阳', '中国,山西,吕梁,中阳', '3', '0358', '033400', 'Zhongyang', 'ZY', 'Z', '111.179', '37.3572', '');
INSERT INTO `t_order_region` VALUES ('362', '141130', '141100', '交口县', '中国,山西省,吕梁市,交口县', '交口', '中国,山西,吕梁,交口', '3', '0358', '032400', 'Jiaokou', 'JK', 'J', '111.181', '36.9821', '');
INSERT INTO `t_order_region` VALUES ('363', '141181', '141100', '孝义市', '中国,山西省,吕梁市,孝义市', '孝义', '中国,山西,吕梁,孝义', '3', '0358', '032300', 'Xiaoyi', 'XY', 'X', '111.774', '37.1441', '');
INSERT INTO `t_order_region` VALUES ('364', '141182', '141100', '汾阳市', '中国,山西省,吕梁市,汾阳市', '汾阳', '中国,山西,吕梁,汾阳', '3', '0358', '032200', 'Fenyang', 'FY', 'F', '111.788', '37.266', '');
INSERT INTO `t_order_region` VALUES ('365', '150000', '100000', '内蒙古自治区', '中国,内蒙古自治区', '内蒙古', '中国,内蒙古', '1', '', '', 'Inner Mongolia', 'NM', 'I', '111.671', '40.8183', '');
INSERT INTO `t_order_region` VALUES ('366', '150100', '150000', '呼和浩特市', '中国,内蒙古自治区,呼和浩特市', '呼和浩特', '中国,内蒙古,呼和浩特', '2', '0471', '010000', 'Hohhot', 'HHHT', 'H', '111.671', '40.8183', '');
INSERT INTO `t_order_region` VALUES ('367', '150102', '150100', '新城区', '中国,内蒙古自治区,呼和浩特市,新城区', '新城', '中国,内蒙古,呼和浩特,新城', '3', '0471', '010000', 'Xincheng', 'XC', 'X', '111.666', '40.8583', '');
INSERT INTO `t_order_region` VALUES ('368', '150103', '150100', '回民区', '中国,内蒙古自治区,呼和浩特市,回民区', '回民', '中国,内蒙古,呼和浩特,回民', '3', '0471', '010000', 'Huimin', 'HM', 'H', '111.624', '40.8083', '');
INSERT INTO `t_order_region` VALUES ('369', '150104', '150100', '玉泉区', '中国,内蒙古自治区,呼和浩特市,玉泉区', '玉泉', '中国,内蒙古,呼和浩特,玉泉', '3', '0471', '010000', 'Yuquan', 'YQ', 'Y', '111.675', '40.7523', '');
INSERT INTO `t_order_region` VALUES ('370', '150105', '150100', '赛罕区', '中国,内蒙古自治区,呼和浩特市,赛罕区', '赛罕', '中国,内蒙古,呼和浩特,赛罕', '3', '0471', '010020', 'Saihan', 'SH', 'S', '111.702', '40.7921', '');
INSERT INTO `t_order_region` VALUES ('371', '150121', '150100', '土默特左旗', '中国,内蒙古自治区,呼和浩特市,土默特左旗', '土左旗', '中国,内蒙古,呼和浩特,土左旗', '3', '0471', '010100', 'Tuzuoqi', 'TZQ', 'T', '111.149', '40.7223', '');
INSERT INTO `t_order_region` VALUES ('372', '150122', '150100', '托克托县', '中国,内蒙古自治区,呼和浩特市,托克托县', '托克托', '中国,内蒙古,呼和浩特,托克托', '3', '0471', '010200', 'Tuoketuo', 'TKT', 'T', '111.191', '40.2749', '');
INSERT INTO `t_order_region` VALUES ('373', '150123', '150100', '和林格尔县', '中国,内蒙古自治区,呼和浩特市,和林格尔县', '和林格尔', '中国,内蒙古,呼和浩特,和林格尔', '3', '0471', '011500', 'Helingeer', 'HLGE', 'H', '111.822', '40.3789', '');
INSERT INTO `t_order_region` VALUES ('374', '150124', '150100', '清水河县', '中国,内蒙古自治区,呼和浩特市,清水河县', '清水河', '中国,内蒙古,呼和浩特,清水河', '3', '0471', '011600', 'Qingshuihe', 'QSH', 'Q', '111.683', '39.9097', '');
INSERT INTO `t_order_region` VALUES ('375', '150125', '150100', '武川县', '中国,内蒙古自治区,呼和浩特市,武川县', '武川', '中国,内蒙古,呼和浩特,武川', '3', '0471', '011700', 'Wuchuan', 'WC', 'W', '111.458', '41.0929', '');
INSERT INTO `t_order_region` VALUES ('376', '150200', '150000', '包头市', '中国,内蒙古自治区,包头市', '包头', '中国,内蒙古,包头', '2', '0472', '014000', 'Baotou', 'BT', 'B', '109.84', '40.6582', '');
INSERT INTO `t_order_region` VALUES ('377', '150202', '150200', '东河区', '中国,内蒙古自治区,包头市,东河区', '东河', '中国,内蒙古,包头,东河', '3', '0472', '014000', 'Donghe', 'DH', 'D', '110.046', '40.5824', '');
INSERT INTO `t_order_region` VALUES ('378', '150203', '150200', '昆都仑区', '中国,内蒙古自治区,包头市,昆都仑区', '昆都仑', '中国,内蒙古,包头,昆都仑', '3', '0472', '014010', 'Kundulun', 'KDL', 'K', '109.839', '40.6418', '');
INSERT INTO `t_order_region` VALUES ('379', '150204', '150200', '青山区', '中国,内蒙古自治区,包头市,青山区', '青山', '中国,内蒙古,包头,青山', '3', '0472', '014000', 'Qingshan', 'QS', 'Q', '109.901', '40.6433', '');
INSERT INTO `t_order_region` VALUES ('380', '150205', '150200', '石拐区', '中国,内蒙古自治区,包头市,石拐区', '石拐', '中国,内蒙古,包头,石拐', '3', '0472', '014070', 'Shiguai', 'SG', 'S', '110.273', '40.673', '');
INSERT INTO `t_order_region` VALUES ('381', '150206', '150200', '白云鄂博矿区', '中国,内蒙古自治区,包头市,白云鄂博矿区', '白云矿区', '中国,内蒙古,包头,白云矿区', '3', '0472', '014080', 'Baiyunkuangqu', 'BYKQ', 'B', '109.974', '41.7697', '');
INSERT INTO `t_order_region` VALUES ('382', '150207', '150200', '九原区', '中国,内蒙古自治区,包头市,九原区', '九原', '中国,内蒙古,包头,九原', '3', '0472', '014060', 'Jiuyuan', 'JY', 'J', '109.965', '40.6055', '');
INSERT INTO `t_order_region` VALUES ('383', '150221', '150200', '土默特右旗', '中国,内蒙古自治区,包头市,土默特右旗', '土右旗', '中国,内蒙古,包头,土右旗', '3', '0472', '014100', 'Tuyouqi', 'TYQ', 'T', '110.524', '40.5688', '');
INSERT INTO `t_order_region` VALUES ('384', '150222', '150200', '固阳县', '中国,内蒙古自治区,包头市,固阳县', '固阳', '中国,内蒙古,包头,固阳', '3', '0472', '014200', 'Guyang', 'GY', 'G', '110.064', '41.0185', '');
INSERT INTO `t_order_region` VALUES ('385', '150223', '150200', '达尔罕茂明安联合旗', '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', '达茂旗', '中国,内蒙古,包头,达茂旗', '3', '0472', '014500', 'Damaoqi', 'DMQ', 'D', '110.433', '41.6987', '');
INSERT INTO `t_order_region` VALUES ('386', '150300', '150000', '乌海市', '中国,内蒙古自治区,乌海市', '乌海', '中国,内蒙古,乌海', '2', '0473', '016000', 'Wuhai', 'WH', 'W', '106.826', '39.6737', '');
INSERT INTO `t_order_region` VALUES ('387', '150302', '150300', '海勃湾区', '中国,内蒙古自治区,乌海市,海勃湾区', '海勃湾', '中国,内蒙古,乌海,海勃湾', '3', '0473', '016000', 'Haibowan', 'HBW', 'H', '106.822', '39.6696', '');
INSERT INTO `t_order_region` VALUES ('388', '150303', '150300', '海南区', '中国,内蒙古自治区,乌海市,海南区', '海南', '中国,内蒙古,乌海,海南', '3', '0473', '016000', 'Hainan', 'HN', 'H', '106.887', '39.4413', '');
INSERT INTO `t_order_region` VALUES ('389', '150304', '150300', '乌达区', '中国,内蒙古自治区,乌海市,乌达区', '乌达', '中国,内蒙古,乌海,乌达', '3', '0473', '016000', 'Wuda', 'WD', 'W', '106.727', '39.505', '');
INSERT INTO `t_order_region` VALUES ('390', '150400', '150000', '赤峰市', '中国,内蒙古自治区,赤峰市', '赤峰', '中国,内蒙古,赤峰', '2', '0476', '024000', 'Chifeng', 'CF', 'C', '118.957', '42.2753', '');
INSERT INTO `t_order_region` VALUES ('391', '150402', '150400', '红山区', '中国,内蒙古自治区,赤峰市,红山区', '红山', '中国,内蒙古,赤峰,红山', '3', '0476', '024000', 'Hongshan', 'HS', 'H', '118.958', '42.2431', '');
INSERT INTO `t_order_region` VALUES ('392', '150403', '150400', '元宝山区', '中国,内蒙古自治区,赤峰市,元宝山区', '元宝山', '中国,内蒙古,赤峰,元宝山', '3', '0476', '024000', 'Yuanbaoshan', 'YBS', 'Y', '119.289', '42.0401', '');
INSERT INTO `t_order_region` VALUES ('393', '150404', '150400', '松山区', '中国,内蒙古自治区,赤峰市,松山区', '松山', '中国,内蒙古,赤峰,松山', '3', '0476', '024000', 'Songshan', 'SS', 'S', '118.933', '42.2861', '');
INSERT INTO `t_order_region` VALUES ('394', '150421', '150400', '阿鲁科尔沁旗', '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', '阿旗', '中国,内蒙古,赤峰,阿旗', '3', '0476', '025500', 'Aqi', 'AQ', 'A', '120.065', '43.8799', '');
INSERT INTO `t_order_region` VALUES ('395', '150422', '150400', '巴林左旗', '中国,内蒙古自治区,赤峰市,巴林左旗', '左旗', '中国,内蒙古,赤峰,左旗', '3', '0476', '025450', 'Zuoqi', 'ZQ', 'Z', '119.38', '43.9703', '');
INSERT INTO `t_order_region` VALUES ('396', '150423', '150400', '巴林右旗', '中国,内蒙古自治区,赤峰市,巴林右旗', '右旗', '中国,内蒙古,赤峰,右旗', '3', '0476', '025150', 'Youqi', 'YQ', 'Y', '118.665', '43.5339', '');
INSERT INTO `t_order_region` VALUES ('397', '150424', '150400', '林西县', '中国,内蒙古自治区,赤峰市,林西县', '林西', '中国,内蒙古,赤峰,林西', '3', '0476', '025250', 'Linxi', 'LX', 'L', '118.047', '43.6116', '');
INSERT INTO `t_order_region` VALUES ('398', '150425', '150400', '克什克腾旗', '中国,内蒙古自治区,赤峰市,克什克腾旗', '克旗', '中国,内蒙古,赤峰,克旗', '3', '0476', '025350', 'Keqi', 'KQ', 'K', '117.546', '43.265', '');
INSERT INTO `t_order_region` VALUES ('399', '150426', '150400', '翁牛特旗', '中国,内蒙古自治区,赤峰市,翁牛特旗', '翁旗', '中国,内蒙古,赤峰,翁旗', '3', '0476', '024500', 'Wengqi', 'WQ', 'W', '119.03', '42.9315', '');
INSERT INTO `t_order_region` VALUES ('400', '150428', '150400', '喀喇沁旗', '中国,内蒙古自治区,赤峰市,喀喇沁旗', '喀旗', '中国,内蒙古,赤峰,喀旗', '3', '0476', '024400', 'Kaqi', 'KQ', 'K', '118.701', '41.9292', '');
INSERT INTO `t_order_region` VALUES ('401', '150429', '150400', '宁城县', '中国,内蒙古自治区,赤峰市,宁城县', '宁城', '中国,内蒙古,赤峰,宁城', '3', '0476', '024200', 'Ningcheng', 'NC', 'N', '119.344', '41.5966', '');
INSERT INTO `t_order_region` VALUES ('402', '150430', '150400', '敖汉旗', '中国,内蒙古自治区,赤峰市,敖汉旗', '敖汉', '中国,内蒙古,赤峰,敖汉', '3', '0476', '024300', 'Aohan', 'AH', 'A', '119.922', '42.2907', '');
INSERT INTO `t_order_region` VALUES ('403', '150500', '150000', '通辽市', '中国,内蒙古自治区,通辽市', '通辽', '中国,内蒙古,通辽', '2', '0475', '028000', 'Tongliao', 'TL', 'T', '122.263', '43.6174', '');
INSERT INTO `t_order_region` VALUES ('404', '150502', '150500', '科尔沁区', '中国,内蒙古自治区,通辽市,科尔沁区', '科尔沁', '中国,内蒙古,通辽,科尔沁', '3', '0475', '028000', 'Keerqin', 'KEQ', 'K', '122.256', '43.6226', '');
INSERT INTO `t_order_region` VALUES ('405', '150521', '150500', '科尔沁左翼中旗', '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', '科左中旗', '中国,内蒙古,通辽,科左中旗', '3', '0475', '029300', 'Kezuozhongqi', 'KZZQ', 'K', '123.319', '44.1301', '');
INSERT INTO `t_order_region` VALUES ('406', '150522', '150500', '科尔沁左翼后旗', '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', '科左后旗', '中国,内蒙古,通辽,科左后旗', '3', '0475', '028100', 'Kezuohouqi', 'KZHQ', 'K', '122.357', '42.949', '');
INSERT INTO `t_order_region` VALUES ('407', '150523', '150500', '开鲁县', '中国,内蒙古自治区,通辽市,开鲁县', '开鲁', '中国,内蒙古,通辽,开鲁', '3', '0475', '028400', 'Kailu', 'KL', 'K', '121.319', '43.6', '');
INSERT INTO `t_order_region` VALUES ('408', '150524', '150500', '库伦旗', '中国,内蒙古自治区,通辽市,库伦旗', '库伦', '中国,内蒙古,通辽,库伦', '3', '0475', '028200', 'Kulun', 'KL', 'K', '121.776', '42.73', '');
INSERT INTO `t_order_region` VALUES ('409', '150525', '150500', '奈曼旗', '中国,内蒙古自治区,通辽市,奈曼旗', '奈曼', '中国,内蒙古,通辽,奈曼', '3', '0475', '028300', 'Naiman', 'NM', 'N', '120.663', '42.8453', '');
INSERT INTO `t_order_region` VALUES ('410', '150526', '150500', '扎鲁特旗', '中国,内蒙古自治区,通辽市,扎鲁特旗', '扎鲁特', '中国,内蒙古,通辽,扎鲁特', '3', '0475', '029100', 'Zhalute', 'ZLT', 'Z', '120.915', '44.5559', '');
INSERT INTO `t_order_region` VALUES ('411', '150581', '150500', '霍林郭勒市', '中国,内蒙古自治区,通辽市,霍林郭勒市', '霍林郭勒', '中国,内蒙古,通辽,霍林郭勒', '3', '0475', '029200', 'Huolinguole', 'HLGL', 'H', '119.654', '45.5345', '');
INSERT INTO `t_order_region` VALUES ('412', '150600', '150000', '鄂尔多斯市', '中国,内蒙古自治区,鄂尔多斯市', '鄂尔多斯', '中国,内蒙古,鄂尔多斯', '2', '0477', '017000', 'Ordos', 'EEDS', 'O', '109.99', '39.8172', '');
INSERT INTO `t_order_region` VALUES ('413', '150602', '150600', '东胜区', '中国,内蒙古自治区,鄂尔多斯市,东胜区', '东胜', '中国,内蒙古,鄂尔多斯,东胜', '3', '0477', '017000', 'Dongsheng', 'DS', 'D', '109.963', '39.8224', '');
INSERT INTO `t_order_region` VALUES ('414', '150603', '150600', '康巴什区', '中国,内蒙古自治区,鄂尔多斯市,康巴什区', '康巴什', '中国,内蒙古,鄂尔多斯,康巴什', '3', '0477', '017000', 'Kangbashen', 'KBS', 'K', '109.789', '39.6054', '');
INSERT INTO `t_order_region` VALUES ('415', '150621', '150600', '达拉特旗', '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', '达拉特', '中国,内蒙古,鄂尔多斯,达拉特', '3', '0477', '014300', 'Dalate', 'DLT', 'D', '110.033', '40.4001', '');
INSERT INTO `t_order_region` VALUES ('416', '150622', '150600', '准格尔旗', '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', '准格尔', '中国,内蒙古,鄂尔多斯,准格尔', '3', '0477', '017100', 'Zhungeer', 'ZGE', 'Z', '111.236', '39.8678', '');
INSERT INTO `t_order_region` VALUES ('417', '150623', '150600', '鄂托克前旗', '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', '鄂前旗', '中国,内蒙古,鄂尔多斯,鄂前旗', '3', '0477', '016200', 'Eqianqi', 'EQQ', 'E', '107.484', '38.184', '');
INSERT INTO `t_order_region` VALUES ('418', '150624', '150600', '鄂托克旗', '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', '鄂托克', '中国,内蒙古,鄂尔多斯,鄂托克', '3', '0477', '016100', 'Etuoke', 'ETK', 'E', '107.982', '39.0946', '');
INSERT INTO `t_order_region` VALUES ('419', '150625', '150600', '杭锦旗', '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', '杭锦旗', '中国,内蒙古,鄂尔多斯,杭锦旗', '3', '0477', '017400', 'Hangjinqi', 'HJQ', 'H', '108.729', '39.8402', '');
INSERT INTO `t_order_region` VALUES ('420', '150626', '150600', '乌审旗', '中国,内蒙古自治区,鄂尔多斯市,乌审旗', '乌审旗', '中国,内蒙古,鄂尔多斯,乌审旗', '3', '0477', '017300', 'Wushenqi', 'WSQ', 'W', '108.846', '38.5909', '');
INSERT INTO `t_order_region` VALUES ('421', '150627', '150600', '伊金霍洛旗', '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', '伊金霍洛', '中国,内蒙古,鄂尔多斯,伊金霍洛', '3', '0477', '017200', 'Yijinhuoluo', 'YJHL', 'Y', '109.749', '39.5739', '');
INSERT INTO `t_order_region` VALUES ('422', '150700', '150000', '呼伦贝尔市', '中国,内蒙古自治区,呼伦贝尔市', '呼伦贝尔', '中国,内蒙古,呼伦贝尔', '2', '0470', '021000', 'Hulunber', 'HLBE', 'H', '119.758', '49.2153', '');
INSERT INTO `t_order_region` VALUES ('423', '150702', '150700', '海拉尔区', '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', '海拉尔', '中国,内蒙古,呼伦贝尔,海拉尔', '3', '0470', '021000', 'Hailaer', 'HLE', 'H', '119.736', '49.2122', '');
INSERT INTO `t_order_region` VALUES ('424', '150703', '150700', '扎赉诺尔区', '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', '扎赉诺尔', '中国,内蒙古,呼伦贝尔,扎赉诺尔', '3', '0470', '021410', 'Zhalainuoer', 'ZLNE', 'Z', '117.793', '49.4869', '');
INSERT INTO `t_order_region` VALUES ('425', '150721', '150700', '阿荣旗', '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', '阿荣旗', '中国,内蒙古,呼伦贝尔,阿荣旗', '3', '0470', '162750', 'Arongqi', 'ARQ', 'A', '123.459', '48.1258', '');
INSERT INTO `t_order_region` VALUES ('426', '150722', '150700', '莫力达瓦达斡尔族自治旗', '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', '莫旗', '中国,内蒙古,呼伦贝尔,莫旗', '3', '0470', '162850', 'Moqi', 'MQ', 'M', '124.515', '48.4805', '');
INSERT INTO `t_order_region` VALUES ('427', '150723', '150700', '鄂伦春自治旗', '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', '鄂伦春', '中国,内蒙古,呼伦贝尔,鄂伦春', '3', '0470', '022450', 'Elunchun', 'ELC', 'E', '123.726', '50.5978', '');
INSERT INTO `t_order_region` VALUES ('428', '150724', '150700', '鄂温克族自治旗', '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', '鄂温克旗', '中国,内蒙古,呼伦贝尔,鄂温克旗', '3', '0470', '021100', 'Ewenkeqi', 'EWKQ', 'E', '119.757', '49.1428', '');
INSERT INTO `t_order_region` VALUES ('429', '150725', '150700', '陈巴尔虎旗', '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', '陈旗', '中国,内蒙古,呼伦贝尔,陈旗', '3', '0470', '021500', 'Chenqi', 'CQ', 'C', '119.424', '49.3268', '');
INSERT INTO `t_order_region` VALUES ('430', '150726', '150700', '新巴尔虎左旗', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', '新左旗', '中国,内蒙古,呼伦贝尔,新左旗', '3', '0470', '021200', 'Xinzuoqi', 'XZQ', 'X', '118.27', '48.2184', '');
INSERT INTO `t_order_region` VALUES ('431', '150727', '150700', '新巴尔虎右旗', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', '新右旗', '中国,内蒙古,呼伦贝尔,新右旗', '3', '0470', '021300', 'Xinyouqi', 'XYQ', 'X', '116.824', '48.6647', '');
INSERT INTO `t_order_region` VALUES ('432', '150781', '150700', '满洲里市', '中国,内蒙古自治区,呼伦贝尔市,满洲里市', '满洲里', '中国,内蒙古,呼伦贝尔,满洲里', '3', '0470', '021400', 'Manzhouli', 'MZL', 'M', '117.479', '49.5827', '');
INSERT INTO `t_order_region` VALUES ('433', '150782', '150700', '牙克石市', '中国,内蒙古自治区,呼伦贝尔市,牙克石市', '牙克石', '中国,内蒙古,呼伦贝尔,牙克石', '3', '0470', '022150', 'Yakeshi', 'YKS', 'Y', '120.712', '49.2856', '');
INSERT INTO `t_order_region` VALUES ('434', '150783', '150700', '扎兰屯市', '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', '扎兰屯', '中国,内蒙古,呼伦贝尔,扎兰屯', '3', '0470', '162650', 'Zhalantun', 'ZLT', 'Z', '122.738', '48.0136', '');
INSERT INTO `t_order_region` VALUES ('435', '150784', '150700', '额尔古纳市', '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', '额尔古纳', '中国,内蒙古,呼伦贝尔,额尔古纳', '3', '0470', '022250', 'Eerguna', 'EEGN', 'E', '120.191', '50.2425', '');
INSERT INTO `t_order_region` VALUES ('436', '150785', '150700', '根河市', '中国,内蒙古自治区,呼伦贝尔市,根河市', '根河', '中国,内蒙古,呼伦贝尔,根河', '3', '0470', '022350', 'Genhe', 'GH', 'G', '121.522', '50.78', '');
INSERT INTO `t_order_region` VALUES ('437', '150800', '150000', '巴彦淖尔市', '中国,内蒙古自治区,巴彦淖尔市', '巴彦淖尔', '中国,内蒙古,巴彦淖尔', '2', '0478', '015000', 'Bayan Nur', 'BYNE', 'B', '107.417', '40.7574', '');
INSERT INTO `t_order_region` VALUES ('438', '150802', '150800', '临河区', '中国,内蒙古自治区,巴彦淖尔市,临河区', '临河', '中国,内蒙古,巴彦淖尔,临河', '3', '0478', '015000', 'Linhe', 'LH', 'L', '107.427', '40.7583', '');
INSERT INTO `t_order_region` VALUES ('439', '150821', '150800', '五原县', '中国,内蒙古自治区,巴彦淖尔市,五原县', '五原', '中国,内蒙古,巴彦淖尔,五原', '3', '0478', '015100', 'Wuyuan', 'WY', 'W', '108.269', '41.0963', '');
INSERT INTO `t_order_region` VALUES ('440', '150822', '150800', '磴口县', '中国,内蒙古自治区,巴彦淖尔市,磴口县', '磴口', '中国,内蒙古,巴彦淖尔,磴口', '3', '0478', '015200', 'Dengkou', 'DK', 'D', '107.009', '40.3306', '');
INSERT INTO `t_order_region` VALUES ('441', '150823', '150800', '乌拉特前旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', '乌前旗', '中国,内蒙古,巴彦淖尔,乌前旗', '3', '0478', '014400', 'Wuqianqi', 'WQQ', 'W', '108.652', '40.7365', '');
INSERT INTO `t_order_region` VALUES ('442', '150824', '150800', '乌拉特中旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', '乌中旗', '中国,内蒙古,巴彦淖尔,乌中旗', '3', '0478', '015300', 'Wuzhongqi', 'WZQ', 'W', '108.526', '41.5679', '');
INSERT INTO `t_order_region` VALUES ('443', '150825', '150800', '乌拉特后旗', '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', '乌后旗', '中国,内蒙古,巴彦淖尔,乌后旗', '3', '0478', '015500', 'Wuhouqi', 'WHQ', 'W', '106.99', '41.4315', '');
INSERT INTO `t_order_region` VALUES ('444', '150826', '150800', '杭锦后旗', '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', '杭锦后旗', '中国,内蒙古,巴彦淖尔,杭锦后旗', '3', '0478', '015400', 'Hangjinhouqi', 'HJHQ', 'H', '107.151', '40.8863', '');
INSERT INTO `t_order_region` VALUES ('445', '150900', '150000', '乌兰察布市', '中国,内蒙古自治区,乌兰察布市', '乌兰察布', '中国,内蒙古,乌兰察布', '2', '0474', '012000', 'Ulanqab', 'WLCB', 'U', '113.115', '41.0341', '');
INSERT INTO `t_order_region` VALUES ('446', '150902', '150900', '集宁区', '中国,内蒙古自治区,乌兰察布市,集宁区', '集宁', '中国,内蒙古,乌兰察布,集宁', '3', '0474', '012000', 'Jining', 'JN', 'J', '113.115', '41.0353', '');
INSERT INTO `t_order_region` VALUES ('447', '150921', '150900', '卓资县', '中国,内蒙古自治区,乌兰察布市,卓资县', '卓资', '中国,内蒙古,乌兰察布,卓资', '3', '0474', '012300', 'Zhuozi', 'ZZ', 'Z', '112.578', '40.8941', '');
INSERT INTO `t_order_region` VALUES ('448', '150922', '150900', '化德县', '中国,内蒙古自治区,乌兰察布市,化德县', '化德', '中国,内蒙古,乌兰察布,化德', '3', '0474', '013350', 'Huade', 'HD', 'H', '114.011', '41.9043', '');
INSERT INTO `t_order_region` VALUES ('449', '150923', '150900', '商都县', '中国,内蒙古自治区,乌兰察布市,商都县', '商都', '中国,内蒙古,乌兰察布,商都', '3', '0474', '013400', 'Shangdu', 'SD', 'S', '113.578', '41.5621', '');
INSERT INTO `t_order_region` VALUES ('450', '150924', '150900', '兴和县', '中国,内蒙古自治区,乌兰察布市,兴和县', '兴和', '中国,内蒙古,乌兰察布,兴和', '3', '0474', '013650', 'Xinghe', 'XH', 'X', '113.834', '40.8719', '');
INSERT INTO `t_order_region` VALUES ('451', '150925', '150900', '凉城县', '中国,内蒙古自治区,乌兰察布市,凉城县', '凉城', '中国,内蒙古,乌兰察布,凉城', '3', '0474', '013750', 'Liangcheng', 'LC', 'L', '112.496', '40.5335', '');
INSERT INTO `t_order_region` VALUES ('452', '150926', '150900', '察哈尔右翼前旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', '察右前旗', '中国,内蒙古,乌兰察布,察右前旗', '3', '0474', '012200', 'Chayouqianqi', 'CYQQ', 'C', '113.221', '40.7788', '');
INSERT INTO `t_order_region` VALUES ('453', '150927', '150900', '察哈尔右翼中旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', '察右中旗', '中国,内蒙古,乌兰察布,察右中旗', '3', '0474', '013500', 'Chayouzhongqi', 'CYZQ', 'C', '112.635', '41.2774', '');
INSERT INTO `t_order_region` VALUES ('454', '150928', '150900', '察哈尔右翼后旗', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', '察右后旗', '中国,内蒙古,乌兰察布,察右后旗', '3', '0474', '012400', 'Chayouhouqi', 'CYHQ', 'C', '113.192', '41.4355', '');
INSERT INTO `t_order_region` VALUES ('455', '150929', '150900', '四子王旗', '中国,内蒙古自治区,乌兰察布市,四子王旗', '四子王旗', '中国,内蒙古,乌兰察布,四子王旗', '3', '0474', '011800', 'Siziwangqi', 'SZWQ', 'S', '111.707', '41.5331', '');
INSERT INTO `t_order_region` VALUES ('456', '150981', '150900', '丰镇市', '中国,内蒙古自治区,乌兰察布市,丰镇市', '丰镇', '中国,内蒙古,乌兰察布,丰镇', '3', '0474', '012100', 'Fengzhen', 'FZ', 'F', '113.11', '40.4369', '');
INSERT INTO `t_order_region` VALUES ('457', '152200', '150000', '兴安盟', '中国,内蒙古自治区,兴安盟', '兴安盟', '中国,内蒙古,兴安盟', '2', '0482', '137400', 'Hinggan', 'XAM', 'H', '122.07', '46.0763', '');
INSERT INTO `t_order_region` VALUES ('458', '152201', '152200', '乌兰浩特市', '中国,内蒙古自治区,兴安盟,乌兰浩特市', '乌兰浩特', '中国,内蒙古,兴安盟,乌兰浩特', '3', '0482', '137400', 'Wulanhaote', 'WLHT', 'W', '122.064', '46.0624', '');
INSERT INTO `t_order_region` VALUES ('459', '152202', '152200', '阿尔山市', '中国,内蒙古自治区,兴安盟,阿尔山市', '阿尔山', '中国,内蒙古,兴安盟,阿尔山', '3', '0482', '137400', 'Aershan', 'AES', 'A', '119.943', '47.1772', '');
INSERT INTO `t_order_region` VALUES ('460', '152221', '152200', '科尔沁右翼前旗', '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', '科右前旗', '中国,内蒙古,兴安盟,科右前旗', '3', '0482', '137400', 'Keyouqianqi', 'KYQQ', 'K', '121.953', '46.0795', '');
INSERT INTO `t_order_region` VALUES ('461', '152222', '152200', '科尔沁右翼中旗', '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', '科右中旗', '中国,内蒙古,兴安盟,科右中旗', '3', '0482', '029400', 'Keyouzhongqi', 'KYZQ', 'K', '121.468', '45.056', '');
INSERT INTO `t_order_region` VALUES ('462', '152223', '152200', '扎赉特旗', '中国,内蒙古自治区,兴安盟,扎赉特旗', '扎赉特旗', '中国,内蒙古,兴安盟,扎赉特旗', '3', '0482', '137600', 'Zhalaiteqi', 'ZLTQ', 'Z', '122.912', '46.7267', '');
INSERT INTO `t_order_region` VALUES ('463', '152224', '152200', '突泉县', '中国,内蒙古自治区,兴安盟,突泉县', '突泉', '中国,内蒙古,兴安盟,突泉', '3', '0482', '137500', 'Tuquan', 'TQ', 'T', '121.594', '45.3819', '');
INSERT INTO `t_order_region` VALUES ('464', '152500', '150000', '锡林郭勒盟', '中国,内蒙古自治区,锡林郭勒盟', '锡林郭勒盟', '中国,内蒙古,锡林郭勒盟', '2', '0479', '026000', 'Xilin Gol', 'XLGLM', 'X', '116.091', '43.944', '');
INSERT INTO `t_order_region` VALUES ('465', '152501', '152500', '二连浩特市', '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', '二连浩特', '中国,内蒙古,锡林郭勒盟,二连浩特', '3', '0479', '012600', 'Erlianhaote', 'ELHT', 'E', '111.983', '43.653', '');
INSERT INTO `t_order_region` VALUES ('466', '152502', '152500', '锡林浩特市', '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', '锡林浩特', '中国,内蒙古,锡林郭勒盟,锡林浩特', '3', '0479', '026000', 'Xilinhaote', 'XLHT', 'X', '116.086', '43.9334', '');
INSERT INTO `t_order_region` VALUES ('467', '152522', '152500', '阿巴嘎旗', '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', '阿巴嘎旗', '中国,内蒙古,锡林郭勒盟,阿巴嘎旗', '3', '0479', '011400', 'Abagaqi', 'ABGQ', 'A', '114.968', '44.0217', '');
INSERT INTO `t_order_region` VALUES ('468', '152523', '152500', '苏尼特左旗', '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', '东苏旗', '中国,内蒙古,锡林郭勒盟,东苏旗', '3', '0479', '011300', 'Dongsuqi', 'DSQ', 'D', '113.651', '43.8569', '');
INSERT INTO `t_order_region` VALUES ('469', '152524', '152500', '苏尼特右旗', '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', '西苏旗', '中国,内蒙古,锡林郭勒盟,西苏旗', '3', '0479', '011200', 'Xisuqi', 'XSQ', 'X', '112.657', '42.7469', '');
INSERT INTO `t_order_region` VALUES ('470', '152525', '152500', '东乌珠穆沁旗', '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', '东乌旗', '中国,内蒙古,锡林郭勒盟,东乌旗', '3', '0479', '026300', 'Dongwuqi', 'DWQ', 'D', '116.973', '45.5111', '');
INSERT INTO `t_order_region` VALUES ('471', '152526', '152500', '西乌珠穆沁旗', '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', '西乌旗', '中国,内蒙古,锡林郭勒盟,西乌旗', '3', '0479', '026200', 'Xiwuqi', 'XWQ', 'X', '117.61', '44.5962', '');
INSERT INTO `t_order_region` VALUES ('472', '152527', '152500', '太仆寺旗', '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', '太旗', '中国,内蒙古,锡林郭勒盟,太旗', '3', '0479', '027000', 'Taiqi', 'TQ', 'T', '115.283', '41.8773', '');
INSERT INTO `t_order_region` VALUES ('473', '152528', '152500', '镶黄旗', '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', '镶黄旗', '中国,内蒙古,锡林郭勒盟,镶黄旗', '3', '0479', '013250', 'Xianghuangqi', 'XHQ', 'X', '113.845', '42.2393', '');
INSERT INTO `t_order_region` VALUES ('474', '152529', '152500', '正镶白旗', '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', '正镶白旗', '中国,内蒙古,锡林郭勒盟,正镶白旗', '3', '0479', '013800', 'Zhengxiangbaiqi', 'ZXBQ', 'Z', '115.001', '42.3071', '');
INSERT INTO `t_order_region` VALUES ('475', '152530', '152500', '正蓝旗', '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', '正蓝旗', '中国,内蒙古,锡林郭勒盟,正蓝旗', '3', '0479', '027200', 'Zhenglanqi', 'ZLQ', 'Z', '116.004', '42.2523', '');
INSERT INTO `t_order_region` VALUES ('476', '152531', '152500', '多伦县', '中国,内蒙古自治区,锡林郭勒盟,多伦县', '多伦', '中国,内蒙古,锡林郭勒盟,多伦', '3', '0479', '027300', 'Duolun', 'DL', 'D', '116.486', '42.203', '');
INSERT INTO `t_order_region` VALUES ('477', '152900', '150000', '阿拉善盟', '中国,内蒙古自治区,阿拉善盟', '阿拉善盟', '中国,内蒙古,阿拉善盟', '2', '0483', '750300', 'Alxa', 'ALSM', 'A', '105.706', '38.8448', '');
INSERT INTO `t_order_region` VALUES ('478', '152921', '152900', '阿拉善左旗', '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', '阿左旗', '中国,内蒙古,阿拉善盟,阿左旗', '3', '0483', '750300', 'Azuoqi', 'AZQ', 'A', '105.675', '38.8293', '');
INSERT INTO `t_order_region` VALUES ('479', '152922', '152900', '阿拉善右旗', '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', '阿右旗', '中国,内蒙古,阿拉善盟,阿右旗', '3', '0483', '737300', 'Ayouqi', 'AYQ', 'A', '101.667', '39.2153', '');
INSERT INTO `t_order_region` VALUES ('480', '152923', '152900', '额济纳旗', '中国,内蒙古自治区,阿拉善盟,额济纳旗', '额济纳', '中国,内蒙古,阿拉善盟,额济纳', '3', '0483', '735400', 'Ejina', 'EJN', 'E', '101.069', '41.9675', '');
INSERT INTO `t_order_region` VALUES ('481', '210000', '100000', '辽宁省', '中国,辽宁省', '辽宁', '中国,辽宁', '1', '', '', 'Liaoning', 'LN', 'L', '123.429', '41.7968', '');
INSERT INTO `t_order_region` VALUES ('482', '210100', '210000', '沈阳市', '中国,辽宁省,沈阳市', '沈阳', '中国,辽宁,沈阳', '2', '024', '110000', 'Shenyang', 'SY', 'S', '123.429', '41.7968', '');
INSERT INTO `t_order_region` VALUES ('483', '210102', '210100', '和平区', '中国,辽宁省,沈阳市,和平区', '和平', '中国,辽宁,沈阳,和平', '3', '024', '110000', 'Heping', 'HP', 'H', '123.42', '41.79', '');
INSERT INTO `t_order_region` VALUES ('484', '210103', '210100', '沈河区', '中国,辽宁省,沈阳市,沈河区', '沈河', '中国,辽宁,沈阳,沈河', '3', '024', '110000', 'Shenhe', 'SH', 'S', '123.459', '41.7962', '');
INSERT INTO `t_order_region` VALUES ('485', '210104', '210100', '大东区', '中国,辽宁省,沈阳市,大东区', '大东', '中国,辽宁,沈阳,大东', '3', '024', '110000', 'Dadong', 'DD', 'D', '123.47', '41.8054', '');
INSERT INTO `t_order_region` VALUES ('486', '210105', '210100', '皇姑区', '中国,辽宁省,沈阳市,皇姑区', '皇姑', '中国,辽宁,沈阳,皇姑', '3', '024', '110000', 'Huanggu', 'HG', 'H', '123.425', '41.8204', '');
INSERT INTO `t_order_region` VALUES ('487', '210106', '210100', '铁西区', '中国,辽宁省,沈阳市,铁西区', '铁西', '中国,辽宁,沈阳,铁西', '3', '024', '110020', 'Tiexi', 'TX', 'T', '123.377', '41.8027', '');
INSERT INTO `t_order_region` VALUES ('488', '210111', '210100', '苏家屯区', '中国,辽宁省,沈阳市,苏家屯区', '苏家屯', '中国,辽宁,沈阳,苏家屯', '3', '024', '110101', 'Sujiatun', 'SJT', 'S', '123.344', '41.6647', '');
INSERT INTO `t_order_region` VALUES ('489', '210112', '210100', '浑南区', '中国,辽宁省,沈阳市,浑南区', '浑南区', '中国,辽宁,沈阳,浑南', '3', '024', '110000', 'Hunnan', 'HN', 'H', '123.458', '41.7195', '新区');
INSERT INTO `t_order_region` VALUES ('490', '210113', '210100', '沈北新区', '中国,辽宁省,沈阳市,沈北新区', '沈北', '中国,辽宁,沈阳,沈北', '3', '024', '110000', 'Shenbei', 'SB', 'S', '123.527', '42.053', '新区');
INSERT INTO `t_order_region` VALUES ('491', '210114', '210100', '于洪区', '中国,辽宁省,沈阳市,于洪区', '于洪', '中国,辽宁,沈阳,于洪', '3', '024', '110000', 'Yuhong', 'YH', 'Y', '123.308', '41.794', '');
INSERT INTO `t_order_region` VALUES ('492', '210115', '210100', '辽中区', '中国,辽宁省,沈阳市,辽中区', '辽中', '中国,辽宁,沈阳,辽中', '3', '024', '110200', 'Liaozhong', 'LZ', 'L', '122.727', '41.513', '');
INSERT INTO `t_order_region` VALUES ('493', '210123', '210100', '康平县', '中国,辽宁省,沈阳市,康平县', '康平', '中国,辽宁,沈阳,康平', '3', '024', '110500', 'Kangping', 'KP', 'K', '123.354', '42.7508', '');
INSERT INTO `t_order_region` VALUES ('494', '210124', '210100', '法库县', '中国,辽宁省,沈阳市,法库县', '法库', '中国,辽宁,沈阳,法库', '3', '024', '110400', 'Faku', 'FK', 'F', '123.412', '42.5061', '');
INSERT INTO `t_order_region` VALUES ('495', '210181', '210100', '新民市', '中国,辽宁省,沈阳市,新民市', '新民', '中国,辽宁,沈阳,新民', '3', '024', '110300', 'Xinmin', 'XM', 'X', '122.829', '41.9985', '');
INSERT INTO `t_order_region` VALUES ('496', '210182', '210100', '高新区', '中国,辽宁省,沈阳市,高新区', '高新区', '中国,辽宁,沈阳,高新区', '3', '024', '110000', 'Gaoxinqu', 'GXQ', 'G', '123.447', '41.7146', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('497', '210200', '210000', '大连市', '中国,辽宁省,大连市', '大连', '中国,辽宁,大连', '2', '0411', '116000', 'Dalian', 'DL', 'D', '121.619', '38.9146', '');
INSERT INTO `t_order_region` VALUES ('498', '210202', '210200', '中山区', '中国,辽宁省,大连市,中山区', '中山', '中国,辽宁,大连,中山', '3', '0411', '116000', 'Zhongshan', 'ZS', 'Z', '121.645', '38.9186', '');
INSERT INTO `t_order_region` VALUES ('499', '210203', '210200', '西岗区', '中国,辽宁省,大连市,西岗区', '西岗', '中国,辽宁,大连,西岗', '3', '0411', '116000', 'Xigang', 'XG', 'X', '121.612', '38.9147', '');
INSERT INTO `t_order_region` VALUES ('500', '210204', '210200', '沙河口区', '中国,辽宁省,大连市,沙河口区', '沙河口', '中国,辽宁,大连,沙河口', '3', '0411', '116000', 'Shahekou', 'SHK', 'S', '121.58', '38.9054', '');
INSERT INTO `t_order_region` VALUES ('501', '210211', '210200', '甘井子区', '中国,辽宁省,大连市,甘井子区', '甘井子', '中国,辽宁,大连,甘井子', '3', '0411', '116000', 'Ganjingzi', 'GJZ', 'G', '121.566', '38.9502', '');
INSERT INTO `t_order_region` VALUES ('502', '210212', '210200', '旅顺口区', '中国,辽宁省,大连市,旅顺口区', '旅顺口', '中国,辽宁,大连,旅顺口', '3', '0411', '116000', 'Lvshunkou', 'LSK', 'L', '121.262', '38.8512', '');
INSERT INTO `t_order_region` VALUES ('503', '210213', '210200', '金州区', '中国,辽宁省,大连市,金州区', '金州', '中国,辽宁,大连,金州', '3', '0411', '116000', 'Jinzhou', 'JZ', 'J', '121.719', '39.1004', '');
INSERT INTO `t_order_region` VALUES ('504', '210214', '210200', '普兰店区', '中国,辽宁省,大连市,普兰店区', '普兰店', '中国,辽宁,大连,普兰店', '3', '0411', '116200', 'Pulandian', 'PLD', 'P', '121.963', '39.3946', '');
INSERT INTO `t_order_region` VALUES ('505', '210224', '210200', '长海县', '中国,辽宁省,大连市,长海县', '长海', '中国,辽宁,大连,长海', '3', '0411', '116500', 'Changhai', 'CH', 'C', '122.589', '39.2727', '');
INSERT INTO `t_order_region` VALUES ('506', '210281', '210200', '瓦房店市', '中国,辽宁省,大连市,瓦房店市', '瓦房店', '中国,辽宁,大连,瓦房店', '3', '0411', '116300', 'Wafangdian', 'WFD', 'W', '121.981', '39.6284', '');
INSERT INTO `t_order_region` VALUES ('507', '210283', '210200', '庄河市', '中国,辽宁省,大连市,庄河市', '庄河', '中国,辽宁,大连,庄河', '3', '0411', '116400', 'Zhuanghe', 'ZH', 'Z', '122.967', '39.6881', '');
INSERT INTO `t_order_region` VALUES ('508', '210284', '210200', '高新区', '中国,辽宁省,大连市,高新区', '高新区', '中国,辽宁,大连,高新区', '3', '0411', '116000', 'Gaoxinqu', 'GXQ', 'G', '121.512', '38.8447', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('509', '210285', '210200', '经济开发区', '中国,辽宁省,大连市,经济开发区', '经济开发区', '中国,辽宁,大连,经济开发区', '3', '0411', '116000', 'Jingjikaifaqu', 'JJQ', 'J', '121.864', '39.0632', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('510', '210286', '210200', '金普新区', '中国,辽宁省,大连市,金普新区', '金普新区', '中国,辽宁,大连,金普新区', '3', '0411', '116100', 'Jinpuxinqu', 'JPXQ', 'J', '121.79', '39.0555', '国家级新区');
INSERT INTO `t_order_region` VALUES ('511', '210300', '210000', '鞍山市', '中国,辽宁省,鞍山市', '鞍山', '中国,辽宁,鞍山', '2', '0412', '114000', 'Anshan', 'AS', 'A', '122.996', '41.1106', '');
INSERT INTO `t_order_region` VALUES ('512', '210302', '210300', '铁东区', '中国,辽宁省,鞍山市,铁东区', '铁东', '中国,辽宁,鞍山,铁东', '3', '0412', '114000', 'Tiedong', 'TD', 'T', '122.991', '41.0897', '');
INSERT INTO `t_order_region` VALUES ('513', '210303', '210300', '铁西区', '中国,辽宁省,鞍山市,铁西区', '铁西', '中国,辽宁,鞍山,铁西', '3', '0412', '114000', 'Tiexi', 'TX', 'T', '122.97', '41.1198', '');
INSERT INTO `t_order_region` VALUES ('514', '210304', '210300', '立山区', '中国,辽宁省,鞍山市,立山区', '立山', '中国,辽宁,鞍山,立山', '3', '0412', '114031', 'Lishan', 'LS', 'L', '123.029', '41.1501', '');
INSERT INTO `t_order_region` VALUES ('515', '210311', '210300', '千山区', '中国,辽宁省,鞍山市,千山区', '千山', '中国,辽宁,鞍山,千山', '3', '0412', '114000', 'Qianshan', 'QS', 'Q', '122.96', '41.0751', '');
INSERT INTO `t_order_region` VALUES ('516', '210321', '210300', '台安县', '中国,辽宁省,鞍山市,台安县', '台安', '中国,辽宁,鞍山,台安', '3', '0412', '114100', 'Tai\'an', 'TA', 'T', '122.436', '41.4127', '');
INSERT INTO `t_order_region` VALUES ('517', '210323', '210300', '岫岩满族自治县', '中国,辽宁省,鞍山市,岫岩满族自治县', '岫岩', '中国,辽宁,鞍山,岫岩', '3', '0412', '114300', 'Xiuyan', 'XY', 'X', '123.289', '40.28', '');
INSERT INTO `t_order_region` VALUES ('518', '210381', '210300', '海城市', '中国,辽宁省,鞍山市,海城市', '海城', '中国,辽宁,鞍山,海城', '3', '0412', '114200', 'Haicheng', 'HC', 'H', '122.685', '40.8814', '');
INSERT INTO `t_order_region` VALUES ('519', '210382', '210300', '高新区', '中国,辽宁省,鞍山市,高新区', '高新区', '中国,辽宁,鞍山,高新区', '3', '0412', '114000', 'Gaoxinqu', 'GXQ', 'G', '123.053', '41.1058', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('520', '210400', '210000', '抚顺市', '中国,辽宁省,抚顺市', '抚顺', '中国,辽宁,抚顺', '2', '024', '113000', 'Fushun', 'FS', 'F', '123.921', '41.876', '');
INSERT INTO `t_order_region` VALUES ('521', '210402', '210400', '新抚区', '中国,辽宁省,抚顺市,新抚区', '新抚', '中国,辽宁,抚顺,新抚', '3', '024', '113000', 'Xinfu', 'XF', 'X', '123.913', '41.862', '');
INSERT INTO `t_order_region` VALUES ('522', '210403', '210400', '东洲区', '中国,辽宁省,抚顺市,东洲区', '东洲', '中国,辽宁,抚顺,东洲', '3', '024', '113000', 'Dongzhou', 'DZ', 'D', '124.038', '41.8519', '');
INSERT INTO `t_order_region` VALUES ('523', '210404', '210400', '望花区', '中国,辽宁省,抚顺市,望花区', '望花', '中国,辽宁,抚顺,望花', '3', '024', '113000', 'Wanghua', 'WH', 'W', '123.783', '41.8553', '');
INSERT INTO `t_order_region` VALUES ('524', '210411', '210400', '顺城区', '中国,辽宁省,抚顺市,顺城区', '顺城', '中国,辽宁,抚顺,顺城', '3', '024', '113000', 'Shuncheng', 'SC', 'S', '123.945', '41.8832', '');
INSERT INTO `t_order_region` VALUES ('525', '210421', '210400', '抚顺县', '中国,辽宁省,抚顺市,抚顺县', '抚顺', '中国,辽宁,抚顺,抚顺', '3', '024', '113100', 'Fushun', 'FS', 'F', '124.178', '41.7122', '');
INSERT INTO `t_order_region` VALUES ('526', '210422', '210400', '新宾满族自治县', '中国,辽宁省,抚顺市,新宾满族自治县', '新宾', '中国,辽宁,抚顺,新宾', '3', '024', '113200', 'Xinbin', 'XB', 'X', '125.04', '41.7341', '');
INSERT INTO `t_order_region` VALUES ('527', '210423', '210400', '清原满族自治县', '中国,辽宁省,抚顺市,清原满族自治县', '清原', '中国,辽宁,抚顺,清原', '3', '024', '113300', 'Qingyuan', 'QY', 'Q', '124.928', '42.1022', '');
INSERT INTO `t_order_region` VALUES ('528', '210500', '210000', '本溪市', '中国,辽宁省,本溪市', '本溪', '中国,辽宁,本溪', '2', '024', '117000', 'Benxi', 'BX', 'B', '123.771', '41.2979', '');
INSERT INTO `t_order_region` VALUES ('529', '210502', '210500', '平山区', '中国,辽宁省,本溪市,平山区', '平山', '中国,辽宁,本溪,平山', '3', '024', '117000', 'Pingshan', 'PS', 'P', '123.769', '41.2997', '');
INSERT INTO `t_order_region` VALUES ('530', '210503', '210500', '溪湖区', '中国,辽宁省,本溪市,溪湖区', '溪湖', '中国,辽宁,本溪,溪湖', '3', '024', '117000', 'Xihu', 'XH', 'X', '123.768', '41.3292', '');
INSERT INTO `t_order_region` VALUES ('531', '210504', '210500', '明山区', '中国,辽宁省,本溪市,明山区', '明山', '中国,辽宁,本溪,明山', '3', '024', '117000', 'Mingshan', 'MS', 'M', '123.817', '41.3083', '');
INSERT INTO `t_order_region` VALUES ('532', '210505', '210500', '南芬区', '中国,辽宁省,本溪市,南芬区', '南芬', '中国,辽宁,本溪,南芬', '3', '024', '117000', 'Nanfen', 'NF', 'N', '123.745', '41.1006', '');
INSERT INTO `t_order_region` VALUES ('533', '210521', '210500', '本溪满族自治县', '中国,辽宁省,本溪市,本溪满族自治县', '本溪', '中国,辽宁,本溪,本溪', '3', '024', '117100', 'Benxi', 'BX', 'B', '124.127', '41.3006', '');
INSERT INTO `t_order_region` VALUES ('534', '210522', '210500', '桓仁满族自治县', '中国,辽宁省,本溪市,桓仁满族自治县', '桓仁', '中国,辽宁,本溪,桓仁', '3', '024', '117200', 'Huanren', 'HR', 'H', '125.361', '41.268', '');
INSERT INTO `t_order_region` VALUES ('535', '210600', '210000', '丹东市', '中国,辽宁省,丹东市', '丹东', '中国,辽宁,丹东', '2', '0415', '118000', 'Dandong', 'DD', 'D', '124.383', '40.1243', '');
INSERT INTO `t_order_region` VALUES ('536', '210602', '210600', '元宝区', '中国,辽宁省,丹东市,元宝区', '元宝', '中国,辽宁,丹东,元宝', '3', '0415', '118000', 'Yuanbao', 'YB', 'Y', '124.396', '40.1365', '');
INSERT INTO `t_order_region` VALUES ('537', '210603', '210600', '振兴区', '中国,辽宁省,丹东市,振兴区', '振兴', '中国,辽宁,丹东,振兴', '3', '0415', '118000', 'Zhenxing', 'ZX', 'Z', '124.36', '40.1049', '');
INSERT INTO `t_order_region` VALUES ('538', '210604', '210600', '振安区', '中国,辽宁省,丹东市,振安区', '振安', '中国,辽宁,丹东,振安', '3', '0415', '118000', 'Zhen\'an', 'ZA', 'Z', '124.428', '40.1583', '');
INSERT INTO `t_order_region` VALUES ('539', '210624', '210600', '宽甸满族自治县', '中国,辽宁省,丹东市,宽甸满族自治县', '宽甸', '中国,辽宁,丹东,宽甸', '3', '0415', '118200', 'Kuandian', 'KD', 'K', '124.782', '40.7319', '');
INSERT INTO `t_order_region` VALUES ('540', '210681', '210600', '东港市', '中国,辽宁省,丹东市,东港市', '东港', '中国,辽宁,丹东,东港', '3', '0415', '118300', 'Donggang', 'DG', 'D', '124.163', '39.8626', '');
INSERT INTO `t_order_region` VALUES ('541', '210682', '210600', '凤城市', '中国,辽宁省,丹东市,凤城市', '凤城', '中国,辽宁,丹东,凤城', '3', '0415', '118100', 'Fengcheng', 'FC', 'F', '124.067', '40.453', '');
INSERT INTO `t_order_region` VALUES ('542', '210700', '210000', '锦州市', '中国,辽宁省,锦州市', '锦州', '中国,辽宁,锦州', '2', '0416', '121000', 'Jinzhou', 'JZ', 'J', '121.136', '41.1193', '');
INSERT INTO `t_order_region` VALUES ('543', '210702', '210700', '古塔区', '中国,辽宁省,锦州市,古塔区', '古塔', '中国,辽宁,锦州,古塔', '3', '0416', '121000', 'Guta', 'GT', 'G', '121.128', '41.1172', '');
INSERT INTO `t_order_region` VALUES ('544', '210703', '210700', '凌河区', '中国,辽宁省,锦州市,凌河区', '凌河', '中国,辽宁,锦州,凌河', '3', '0416', '121000', 'Linghe', 'LH', 'L', '121.151', '41.115', '');
INSERT INTO `t_order_region` VALUES ('545', '210711', '210700', '太和区', '中国,辽宁省,锦州市,太和区', '太和', '中国,辽宁,锦州,太和', '3', '0416', '121000', 'Taihe', 'TH', 'T', '121.104', '41.1093', '');
INSERT INTO `t_order_region` VALUES ('546', '210726', '210700', '黑山县', '中国,辽宁省,锦州市,黑山县', '黑山', '中国,辽宁,锦州,黑山', '3', '0416', '121400', 'Heishan', 'HS', 'H', '122.121', '41.6942', '');
INSERT INTO `t_order_region` VALUES ('547', '210727', '210700', '义县', '中国,辽宁省,锦州市,义县', '义县', '中国,辽宁,锦州,义县', '3', '0416', '121100', 'Yixian', 'YX', 'Y', '121.24', '41.5346', '');
INSERT INTO `t_order_region` VALUES ('548', '210781', '210700', '凌海市', '中国,辽宁省,锦州市,凌海市', '凌海', '中国,辽宁,锦州,凌海', '3', '0416', '121200', 'Linghai', 'LH', 'L', '121.357', '41.1737', '');
INSERT INTO `t_order_region` VALUES ('549', '210782', '210700', '北镇市', '中国,辽宁省,锦州市,北镇市', '北镇', '中国,辽宁,锦州,北镇', '3', '0416', '121300', 'Beizhen', 'BZ', 'B', '121.799', '41.5954', '');
INSERT INTO `t_order_region` VALUES ('550', '210783', '210700', '松山新区', '中国,辽宁省,锦州市,松山新区', '松山新区', '中国,辽宁,锦州,松山新区', '3', '0416', '121221', 'Songshan', 'SS', 'S', '121.129', '41.0896', '新区');
INSERT INTO `t_order_region` VALUES ('551', '210784', '210700', '龙栖湾新区', '中国,辽宁省,锦州市,龙栖湾新区', '龙栖湾新区', '中国,辽宁,锦州,龙栖湾新区', '3', '0416', '121007', 'Longxiwan', 'LXW', 'L', '121.213', '40.9509', '新区');
INSERT INTO `t_order_region` VALUES ('552', '210785', '210700', '经济技术开发区', '中国,辽宁省,锦州市,经济技术开发区', '经济技术开发区', '中国,辽宁,锦州,经济技术开发区', '3', '0416', '121007', 'Jingjikaifaqu', 'JJ', 'J', '121.066', '40.8439', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('553', '210800', '210000', '营口市', '中国,辽宁省,营口市', '营口', '中国,辽宁,营口', '2', '0417', '115000', 'Yingkou', 'YK', 'Y', '122.235', '40.6674', '');
INSERT INTO `t_order_region` VALUES ('554', '210802', '210800', '站前区', '中国,辽宁省,营口市,站前区', '站前', '中国,辽宁,营口,站前', '3', '0417', '115000', 'Zhanqian', 'ZQ', 'Z', '122.259', '40.6727', '');
INSERT INTO `t_order_region` VALUES ('555', '210803', '210800', '西市区', '中国,辽宁省,营口市,西市区', '西市', '中国,辽宁,营口,西市', '3', '0417', '115000', 'Xishi', 'XS', 'X', '122.206', '40.6664', '');
INSERT INTO `t_order_region` VALUES ('556', '210804', '210800', '鲅鱼圈区', '中国,辽宁省,营口市,鲅鱼圈区', '鲅鱼圈', '中国,辽宁,营口,鲅鱼圈', '3', '0417', '115000', 'Bayuquan', 'BYQ', 'B', '122.133', '40.2687', '');
INSERT INTO `t_order_region` VALUES ('557', '210811', '210800', '老边区', '中国,辽宁省,营口市,老边区', '老边', '中国,辽宁,营口,老边', '3', '0417', '115000', 'Laobian', 'LB', 'L', '122.38', '40.6803', '');
INSERT INTO `t_order_region` VALUES ('558', '210881', '210800', '盖州市', '中国,辽宁省,营口市,盖州市', '盖州', '中国,辽宁,营口,盖州', '3', '0417', '115200', 'Gaizhou', 'GZ', 'G', '122.355', '40.4045', '');
INSERT INTO `t_order_region` VALUES ('559', '210882', '210800', '大石桥市', '中国,辽宁省,营口市,大石桥市', '大石桥', '中国,辽宁,营口,大石桥', '3', '0417', '115100', 'Dashiqiao', 'DSQ', 'D', '122.509', '40.6457', '');
INSERT INTO `t_order_region` VALUES ('560', '210900', '210000', '阜新市', '中国,辽宁省,阜新市', '阜新', '中国,辽宁,阜新', '2', '0418', '123000', 'Fuxin', 'FX', 'F', '121.649', '42.0118', '');
INSERT INTO `t_order_region` VALUES ('561', '210902', '210900', '海州区', '中国,辽宁省,阜新市,海州区', '海州', '中国,辽宁,阜新,海州', '3', '0418', '123000', 'Haizhou', 'HZ', 'H', '121.656', '42.0134', '');
INSERT INTO `t_order_region` VALUES ('562', '210903', '210900', '新邱区', '中国,辽宁省,阜新市,新邱区', '新邱', '中国,辽宁,阜新,新邱', '3', '0418', '123000', 'Xinqiu', 'XQ', 'X', '121.793', '42.0918', '');
INSERT INTO `t_order_region` VALUES ('563', '210904', '210900', '太平区', '中国,辽宁省,阜新市,太平区', '太平', '中国,辽宁,阜新,太平', '3', '0418', '123000', 'Taiping', 'TP', 'T', '121.679', '42.0107', '');
INSERT INTO `t_order_region` VALUES ('564', '210905', '210900', '清河门区', '中国,辽宁省,阜新市,清河门区', '清河门', '中国,辽宁,阜新,清河门', '3', '0418', '123000', 'Qinghemen', 'QHM', 'Q', '121.416', '41.7831', '');
INSERT INTO `t_order_region` VALUES ('565', '210911', '210900', '细河区', '中国,辽宁省,阜新市,细河区', '细河', '中国,辽宁,阜新,细河', '3', '0418', '123000', 'Xihe', 'XH', 'X', '121.68', '42.0253', '');
INSERT INTO `t_order_region` VALUES ('566', '210921', '210900', '阜新蒙古族自治县', '中国,辽宁省,阜新市,阜新蒙古族自治县', '阜新', '中国,辽宁,阜新,阜新', '3', '0418', '123100', 'Fuxin', 'FX', 'F', '121.758', '42.0651', '');
INSERT INTO `t_order_region` VALUES ('567', '210922', '210900', '彰武县', '中国,辽宁省,阜新市,彰武县', '彰武', '中国,辽宁,阜新,彰武', '3', '0418', '123200', 'Zhangwu', 'ZW', 'Z', '122.54', '42.3862', '');
INSERT INTO `t_order_region` VALUES ('568', '211000', '210000', '辽阳市', '中国,辽宁省,辽阳市', '辽阳', '中国,辽宁,辽阳', '2', '0419', '111000', 'Liaoyang', 'LY', 'L', '123.182', '41.2694', '');
INSERT INTO `t_order_region` VALUES ('569', '211002', '211000', '白塔区', '中国,辽宁省,辽阳市,白塔区', '白塔', '中国,辽宁,辽阳,白塔', '3', '0419', '111000', 'Baita', 'BT', 'B', '123.175', '41.2702', '');
INSERT INTO `t_order_region` VALUES ('570', '211003', '211000', '文圣区', '中国,辽宁省,辽阳市,文圣区', '文圣', '中国,辽宁,辽阳,文圣', '3', '0419', '111000', 'Wensheng', 'WS', 'W', '123.185', '41.2627', '');
INSERT INTO `t_order_region` VALUES ('571', '211004', '211000', '宏伟区', '中国,辽宁省,辽阳市,宏伟区', '宏伟', '中国,辽宁,辽阳,宏伟', '3', '0419', '111000', 'Hongwei', 'HW', 'H', '123.193', '41.2185', '');
INSERT INTO `t_order_region` VALUES ('572', '211005', '211000', '弓长岭区', '中国,辽宁省,辽阳市,弓长岭区', '弓长岭', '中国,辽宁,辽阳,弓长岭', '3', '0419', '111000', 'Gongchangling', 'GCL', 'G', '123.42', '41.1518', '');
INSERT INTO `t_order_region` VALUES ('573', '211011', '211000', '太子河区', '中国,辽宁省,辽阳市,太子河区', '太子河', '中国,辽宁,辽阳,太子河', '3', '0419', '111000', 'Taizihe', 'TZH', 'T', '123.182', '41.2534', '');
INSERT INTO `t_order_region` VALUES ('574', '211021', '211000', '辽阳县', '中国,辽宁省,辽阳市,辽阳县', '辽阳', '中国,辽宁,辽阳,辽阳', '3', '0419', '111200', 'Liaoyang', 'LY', 'L', '123.106', '41.2054', '');
INSERT INTO `t_order_region` VALUES ('575', '211081', '211000', '灯塔市', '中国,辽宁省,辽阳市,灯塔市', '灯塔', '中国,辽宁,辽阳,灯塔', '3', '0419', '111300', 'Dengta', 'DT', 'D', '123.339', '41.4261', '');
INSERT INTO `t_order_region` VALUES ('576', '211100', '210000', '盘锦市', '中国,辽宁省,盘锦市', '盘锦', '中国,辽宁,盘锦', '2', '0427', '124000', 'Panjin', 'PJ', 'P', '122.07', '41.1245', '');
INSERT INTO `t_order_region` VALUES ('577', '211102', '211100', '双台子区', '中国,辽宁省,盘锦市,双台子区', '双台子', '中国,辽宁,盘锦,双台子', '3', '0427', '124000', 'Shuangtaizi', 'STZ', 'S', '122.06', '41.1906', '');
INSERT INTO `t_order_region` VALUES ('578', '211103', '211100', '兴隆台区', '中国,辽宁省,盘锦市,兴隆台区', '兴隆台', '中国,辽宁,盘锦,兴隆台', '3', '0427', '124000', 'Xinglongtai', 'XLT', 'X', '122.075', '41.124', '');
INSERT INTO `t_order_region` VALUES ('579', '211104', '211100', '大洼区', '中国,辽宁省,盘锦市,大洼区', '大洼', '中国,辽宁,盘锦,大洼', '3', '0427', '124200', 'Dawa', 'DW', 'D', '122.082', '41.0024', '');
INSERT INTO `t_order_region` VALUES ('580', '211122', '211100', '盘山县', '中国,辽宁省,盘锦市,盘山县', '盘山', '中国,辽宁,盘锦,盘山', '3', '0427', '124100', 'Panshan', 'PS', 'P', '121.998', '41.238', '');
INSERT INTO `t_order_region` VALUES ('581', '211200', '210000', '铁岭市', '中国,辽宁省,铁岭市', '铁岭', '中国,辽宁,铁岭', '2', '024', '112000', 'Tieling', 'TL', 'T', '123.844', '42.2906', '');
INSERT INTO `t_order_region` VALUES ('582', '211202', '211200', '银州区', '中国,辽宁省,铁岭市,银州区', '银州', '中国,辽宁,铁岭,银州', '3', '024', '112000', 'Yinzhou', 'YZ', 'Y', '123.857', '42.2951', '');
INSERT INTO `t_order_region` VALUES ('583', '211204', '211200', '清河区', '中国,辽宁省,铁岭市,清河区', '清河', '中国,辽宁,铁岭,清河', '3', '024', '112000', 'Qinghe', 'QH', 'Q', '124.159', '42.5468', '');
INSERT INTO `t_order_region` VALUES ('584', '211221', '211200', '铁岭县', '中国,辽宁省,铁岭市,铁岭县', '铁岭', '中国,辽宁,铁岭,铁岭', '3', '024', '112600', 'Tieling', 'TL', 'T', '123.773', '42.225', '');
INSERT INTO `t_order_region` VALUES ('585', '211223', '211200', '西丰县', '中国,辽宁省,铁岭市,西丰县', '西丰', '中国,辽宁,铁岭,西丰', '3', '024', '112400', 'Xifeng', 'XF', 'X', '124.73', '42.7376', '');
INSERT INTO `t_order_region` VALUES ('586', '211224', '211200', '昌图县', '中国,辽宁省,铁岭市,昌图县', '昌图', '中国,辽宁,铁岭,昌图', '3', '024', '112500', 'Changtu', 'CT', 'C', '124.112', '42.7843', '');
INSERT INTO `t_order_region` VALUES ('587', '211281', '211200', '调兵山市', '中国,辽宁省,铁岭市,调兵山市', '调兵山', '中国,辽宁,铁岭,调兵山', '3', '024', '112700', 'Diaobingshan', 'DBS', 'D', '123.567', '42.4675', '');
INSERT INTO `t_order_region` VALUES ('588', '211282', '211200', '开原市', '中国,辽宁省,铁岭市,开原市', '开原', '中国,辽宁,铁岭,开原', '3', '024', '112300', 'Kaiyuan', 'KY', 'K', '124.039', '42.5458', '');
INSERT INTO `t_order_region` VALUES ('589', '211300', '210000', '朝阳市', '中国,辽宁省,朝阳市', '朝阳', '中国,辽宁,朝阳', '2', '0421', '122000', 'Chaoyang', 'CY', 'C', '120.451', '41.5768', '');
INSERT INTO `t_order_region` VALUES ('590', '211302', '211300', '双塔区', '中国,辽宁省,朝阳市,双塔区', '双塔', '中国,辽宁,朝阳,双塔', '3', '0421', '122000', 'Shuangta', 'ST', 'S', '120.454', '41.566', '');
INSERT INTO `t_order_region` VALUES ('591', '211303', '211300', '龙城区', '中国,辽宁省,朝阳市,龙城区', '龙城', '中国,辽宁,朝阳,龙城', '3', '0421', '122000', 'Longcheng', 'LC', 'L', '120.437', '41.5926', '');
INSERT INTO `t_order_region` VALUES ('592', '211321', '211300', '朝阳县', '中国,辽宁省,朝阳市,朝阳县', '朝阳', '中国,辽宁,朝阳,朝阳', '3', '0421', '122000', 'Chaoyang', 'CY', 'C', '120.174', '41.4324', '');
INSERT INTO `t_order_region` VALUES ('593', '211322', '211300', '建平县', '中国,辽宁省,朝阳市,建平县', '建平', '中国,辽宁,朝阳,建平', '3', '0421', '122400', 'Jianping', 'JP', 'J', '119.644', '41.4031', '');
INSERT INTO `t_order_region` VALUES ('594', '211324', '211300', '喀喇沁左翼蒙古族自治县', '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', '喀喇沁左翼', '中国,辽宁,朝阳,喀喇沁左翼', '3', '0421', '122300', 'Kalaqinzuoyi', 'KLQZY', 'K', '119.742', '41.128', '');
INSERT INTO `t_order_region` VALUES ('595', '211381', '211300', '北票市', '中国,辽宁省,朝阳市,北票市', '北票', '中国,辽宁,朝阳,北票', '3', '0421', '122100', 'Beipiao', 'BP', 'B', '120.77', '41.802', '');
INSERT INTO `t_order_region` VALUES ('596', '211382', '211300', '凌源市', '中国,辽宁省,朝阳市,凌源市', '凌源', '中国,辽宁,朝阳,凌源', '3', '0421', '122500', 'Lingyuan', 'LY', 'L', '119.401', '41.2456', '');
INSERT INTO `t_order_region` VALUES ('597', '211400', '210000', '葫芦岛市', '中国,辽宁省,葫芦岛市', '葫芦岛', '中国,辽宁,葫芦岛', '2', '0429', '125000', 'Huludao', 'HLD', 'H', '120.856', '40.7556', '');
INSERT INTO `t_order_region` VALUES ('598', '211402', '211400', '连山区', '中国,辽宁省,葫芦岛市,连山区', '连山', '中国,辽宁,葫芦岛,连山', '3', '0429', '125000', 'Lianshan', 'LS', 'L', '120.864', '40.7555', '');
INSERT INTO `t_order_region` VALUES ('599', '211403', '211400', '龙港区', '中国,辽宁省,葫芦岛市,龙港区', '龙港', '中国,辽宁,葫芦岛,龙港', '3', '0429', '125000', 'Longgang', 'LG', 'L', '120.949', '40.7192', '');
INSERT INTO `t_order_region` VALUES ('600', '211404', '211400', '南票区', '中国,辽宁省,葫芦岛市,南票区', '南票', '中国,辽宁,葫芦岛,南票', '3', '0429', '125000', 'Nanpiao', 'NP', 'N', '120.75', '41.1071', '');
INSERT INTO `t_order_region` VALUES ('601', '211421', '211400', '绥中县', '中国,辽宁省,葫芦岛市,绥中县', '绥中', '中国,辽宁,葫芦岛,绥中', '3', '0429', '125200', 'Suizhong', 'SZ', 'S', '120.345', '40.3255', '');
INSERT INTO `t_order_region` VALUES ('602', '211422', '211400', '建昌县', '中国,辽宁省,葫芦岛市,建昌县', '建昌', '中国,辽宁,葫芦岛,建昌', '3', '0429', '125300', 'Jianchang', 'JC', 'J', '119.838', '40.8245', '');
INSERT INTO `t_order_region` VALUES ('603', '211481', '211400', '兴城市', '中国,辽宁省,葫芦岛市,兴城市', '兴城', '中国,辽宁,葫芦岛,兴城', '3', '0429', '125100', 'Xingcheng', 'XC', 'X', '120.725', '40.6149', '');
INSERT INTO `t_order_region` VALUES ('604', '220000', '100000', '吉林省', '中国,吉林省', '吉林', '中国,吉林', '1', '', '', 'Jilin', 'JL', 'J', '125.325', '43.8868', '');
INSERT INTO `t_order_region` VALUES ('605', '220100', '220000', '长春市', '中国,吉林省,长春市', '长春', '中国,吉林,长春', '2', '0431', '130000', 'Changchun', 'CC', 'C', '125.325', '43.8868', '');
INSERT INTO `t_order_region` VALUES ('606', '220102', '220100', '南关区', '中国,吉林省,长春市,南关区', '南关', '中国,吉林,长春,南关', '3', '0431', '130000', 'Nanguan', 'NG', 'N', '125.35', '43.864', '');
INSERT INTO `t_order_region` VALUES ('607', '220103', '220100', '宽城区', '中国,吉林省,长春市,宽城区', '宽城', '中国,吉林,长春,宽城', '3', '0431', '130000', 'Kuancheng', 'KC', 'K', '125.326', '43.9018', '');
INSERT INTO `t_order_region` VALUES ('608', '220104', '220100', '朝阳区', '中国,吉林省,长春市,朝阳区', '朝阳', '中国,吉林,长春,朝阳', '3', '0431', '130000', 'Chaoyang', 'CY', 'C', '125.288', '43.8334', '');
INSERT INTO `t_order_region` VALUES ('609', '220105', '220100', '二道区', '中国,吉林省,长春市,二道区', '二道', '中国,吉林,长春,二道', '3', '0431', '130000', 'Erdao', 'ED', 'E', '125.374', '43.865', '');
INSERT INTO `t_order_region` VALUES ('610', '220106', '220100', '绿园区', '中国,吉林省,长春市,绿园区', '绿园', '中国,吉林,长春,绿园', '3', '0431', '130000', 'Lvyuan', 'LY', 'L', '125.256', '43.8805', '');
INSERT INTO `t_order_region` VALUES ('611', '220112', '220100', '双阳区', '中国,吉林省,长春市,双阳区', '双阳', '中国,吉林,长春,双阳', '3', '0431', '130600', 'Shuangyang', 'SY', 'S', '125.656', '43.528', '');
INSERT INTO `t_order_region` VALUES ('612', '220113', '220100', '九台区', '中国,吉林省,长春市,九台区', '九台', '中国,吉林,长春,九台', '3', '0431', '130500', 'Jiutai', 'JT', 'J', '125.84', '44.1516', '');
INSERT INTO `t_order_region` VALUES ('613', '220122', '220100', '农安县', '中国,吉林省,长春市,农安县', '农安', '中国,吉林,长春,农安', '3', '0431', '130200', 'Nong\'an', 'NA', 'N', '125.185', '44.4327', '');
INSERT INTO `t_order_region` VALUES ('614', '220182', '220100', '榆树市', '中国,吉林省,长春市,榆树市', '榆树', '中国,吉林,长春,榆树', '3', '0431', '130400', 'Yushu', 'YS', 'Y', '126.557', '44.8252', '');
INSERT INTO `t_order_region` VALUES ('615', '220183', '220100', '德惠市', '中国,吉林省,长春市,德惠市', '德惠', '中国,吉林,长春,德惠', '3', '0431', '130300', 'Dehui', 'DH', 'D', '125.705', '44.5372', '');
INSERT INTO `t_order_region` VALUES ('616', '220184', '220100', '长春新区', '中国,吉林省,长春市,长春新区', '长春新区', '中国,吉林,长春,长春新区', '3', '0431', '130000', 'ChangChunXinQu', 'CCXQ', 'C', '125.339', '43.8704', '国家级新区');
INSERT INTO `t_order_region` VALUES ('617', '220185', '220100', '高新技术产业开发区', '中国,吉林省,长春市,高新技术产业开发区', '高新区', '中国,吉林,长春,高新区', '3', '0431', '130000', 'Gaoxinqu', 'GXQ', 'G', '125.257', '43.821', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('618', '220186', '220100', '经济技术开发区', '中国,吉林省,长春市,经济技术开发区', '经济技术开发区', '中国,吉林,长春,经济技术开发区', '3', '0431', '130000', 'Jingjikaifaqu', 'JJ', 'J', '125.417', '43.8675', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('619', '220187', '220100', '汽车产业开发区', '中国,吉林省,长春市,汽车产业开发区', '汽车产业开发区', '中国,吉林,长春,汽车产业开发区', '3', '0431', '130000', 'Qichechanyekaifaqu', 'QC', 'Q', '125.227', '43.8468', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('620', '220188', '220100', '兴隆综合保税区', '中国,吉林省,长春市,兴隆综合保税区', '兴隆综合保税区', '中国,吉林,长春,兴隆综合保税区', '3', '0431', '130000', 'Baoshuiqu', 'BS', 'B', '125.484', '43.9545', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('621', '220200', '220000', '吉林市', '中国,吉林省,吉林市', '吉林', '中国,吉林,吉林', '2', '0432', '132000', 'Jilin', 'JL', 'J', '126.553', '43.8436', '');
INSERT INTO `t_order_region` VALUES ('622', '220202', '220200', '昌邑区', '中国,吉林省,吉林市,昌邑区', '昌邑', '中国,吉林,吉林,昌邑', '3', '0432', '132000', 'Changyi', 'CY', 'C', '126.574', '43.8818', '');
INSERT INTO `t_order_region` VALUES ('623', '220203', '220200', '龙潭区', '中国,吉林省,吉林市,龙潭区', '龙潭', '中国,吉林,吉林,龙潭', '3', '0432', '132000', 'Longtan', 'LT', 'L', '126.562', '43.9105', '');
INSERT INTO `t_order_region` VALUES ('624', '220204', '220200', '船营区', '中国,吉林省,吉林市,船营区', '船营', '中国,吉林,吉林,船营', '3', '0432', '132000', 'Chuanying', 'CY', 'C', '126.541', '43.8334', '');
INSERT INTO `t_order_region` VALUES ('625', '220211', '220200', '丰满区', '中国,吉林省,吉林市,丰满区', '丰满', '中国,吉林,吉林,丰满', '3', '0432', '132000', 'Fengman', 'FM', 'F', '126.562', '43.8224', '');
INSERT INTO `t_order_region` VALUES ('626', '220221', '220200', '永吉县', '中国,吉林省,吉林市,永吉县', '永吉', '中国,吉林,吉林,永吉', '3', '0432', '132100', 'Yongji', 'YJ', 'Y', '126.496', '43.672', '');
INSERT INTO `t_order_region` VALUES ('627', '220281', '220200', '蛟河市', '中国,吉林省,吉林市,蛟河市', '蛟河', '中国,吉林,吉林,蛟河', '3', '0432', '132500', 'Jiaohe', 'JH', 'J', '127.344', '43.727', '');
INSERT INTO `t_order_region` VALUES ('628', '220282', '220200', '桦甸市', '中国,吉林省,吉林市,桦甸市', '桦甸', '中国,吉林,吉林,桦甸', '3', '0432', '132400', 'Huadian', 'HD', 'H', '126.746', '42.9721', '');
INSERT INTO `t_order_region` VALUES ('629', '220283', '220200', '舒兰市', '中国,吉林省,吉林市,舒兰市', '舒兰', '中国,吉林,吉林,舒兰', '3', '0432', '132600', 'Shulan', 'SL', 'S', '126.965', '44.4058', '');
INSERT INTO `t_order_region` VALUES ('630', '220284', '220200', '磐石市', '中国,吉林省,吉林市,磐石市', '磐石', '中国,吉林,吉林,磐石', '3', '0432', '132300', 'Panshi', 'PS', 'P', '126.062', '42.9463', '');
INSERT INTO `t_order_region` VALUES ('631', '220285', '220200', '高新区', '中国,吉林省,吉林市,高新区', '高新区', '中国,吉林,吉林,高新区', '3', '0432', '132000', 'Gaoxinqu', 'GXQ', 'G', '126.547', '43.8247', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('632', '220300', '220000', '四平市', '中国,吉林省,四平市', '四平', '中国,吉林,四平', '2', '0434', '136000', 'Siping', 'SP', 'S', '124.371', '43.1703', '');
INSERT INTO `t_order_region` VALUES ('633', '220302', '220300', '铁西区', '中国,吉林省,四平市,铁西区', '铁西', '中国,吉林,四平,铁西', '3', '0434', '136000', 'Tiexi', 'TX', 'T', '124.374', '43.1746', '');
INSERT INTO `t_order_region` VALUES ('634', '220303', '220300', '铁东区', '中国,吉林省,四平市,铁东区', '铁东', '中国,吉林,四平,铁东', '3', '0434', '136000', 'Tiedong', 'TD', 'T', '124.41', '43.1624', '');
INSERT INTO `t_order_region` VALUES ('635', '220322', '220300', '梨树县', '中国,吉林省,四平市,梨树县', '梨树', '中国,吉林,四平,梨树', '3', '0434', '136500', 'Lishu', 'LS', 'L', '124.336', '43.3072', '');
INSERT INTO `t_order_region` VALUES ('636', '220323', '220300', '伊通满族自治县', '中国,吉林省,四平市,伊通满族自治县', '伊通', '中国,吉林,四平,伊通', '3', '0434', '130700', 'Yitong', 'YT', 'Y', '125.306', '43.3443', '');
INSERT INTO `t_order_region` VALUES ('637', '220381', '220300', '公主岭市', '中国,吉林省,四平市,公主岭市', '公主岭', '中国,吉林,四平,公主岭', '3', '0434', '136100', 'Gongzhuling', 'GZL', 'G', '124.823', '43.5045', '');
INSERT INTO `t_order_region` VALUES ('638', '220382', '220300', '双辽市', '中国,吉林省,四平市,双辽市', '双辽', '中国,吉林,四平,双辽', '3', '0434', '136400', 'Shuangliao', 'SL', 'S', '123.501', '43.521', '');
INSERT INTO `t_order_region` VALUES ('639', '220400', '220000', '辽源市', '中国,吉林省,辽源市', '辽源', '中国,吉林,辽源', '2', '0437', '136200', 'Liaoyuan', 'LY', 'L', '125.145', '42.9027', '');
INSERT INTO `t_order_region` VALUES ('640', '220402', '220400', '龙山区', '中国,吉林省,辽源市,龙山区', '龙山', '中国,吉林,辽源,龙山', '3', '0437', '136200', 'Longshan', 'LS', 'L', '125.136', '42.8971', '');
INSERT INTO `t_order_region` VALUES ('641', '220403', '220400', '西安区', '中国,吉林省,辽源市,西安区', '西安', '中国,吉林,辽源,西安', '3', '0437', '136200', 'Xi\'an', 'XA', 'X', '125.149', '42.927', '');
INSERT INTO `t_order_region` VALUES ('642', '220421', '220400', '东丰县', '中国,吉林省,辽源市,东丰县', '东丰', '中国,吉林,辽源,东丰', '3', '0437', '136300', 'Dongfeng', 'DF', 'D', '125.532', '42.6783', '');
INSERT INTO `t_order_region` VALUES ('643', '220422', '220400', '东辽县', '中国,吉林省,辽源市,东辽县', '东辽', '中国,吉林,辽源,东辽', '3', '0437', '136600', 'Dongliao', 'DL', 'D', '124.986', '42.9249', '');
INSERT INTO `t_order_region` VALUES ('644', '220500', '220000', '通化市', '中国,吉林省,通化市', '通化', '中国,吉林,通化', '2', '0435', '134000', 'Tonghua', 'TH', 'T', '125.937', '41.7212', '');
INSERT INTO `t_order_region` VALUES ('645', '220502', '220500', '东昌区', '中国,吉林省,通化市,东昌区', '东昌', '中国,吉林,通化,东昌', '3', '0435', '134000', 'Dongchang', 'DC', 'D', '125.955', '41.7285', '');
INSERT INTO `t_order_region` VALUES ('646', '220503', '220500', '二道江区', '中国,吉林省,通化市,二道江区', '二道江', '中国,吉林,通化,二道江', '3', '0435', '134000', 'Erdaojiang', 'EDJ', 'E', '126.043', '41.7741', '');
INSERT INTO `t_order_region` VALUES ('647', '220521', '220500', '通化县', '中国,吉林省,通化市,通化县', '通化', '中国,吉林,通化,通化', '3', '0435', '134100', 'Tonghua', 'TH', 'T', '125.759', '41.6793', '');
INSERT INTO `t_order_region` VALUES ('648', '220523', '220500', '辉南县', '中国,吉林省,通化市,辉南县', '辉南', '中国,吉林,通化,辉南', '3', '0435', '135100', 'Huinan', 'HN', 'H', '126.047', '42.685', '');
INSERT INTO `t_order_region` VALUES ('649', '220524', '220500', '柳河县', '中国,吉林省,通化市,柳河县', '柳河', '中国,吉林,通化,柳河', '3', '0435', '135300', 'Liuhe', 'LH', 'L', '125.745', '42.2847', '');
INSERT INTO `t_order_region` VALUES ('650', '220581', '220500', '梅河口市', '中国,吉林省,通化市,梅河口市', '梅河口', '中国,吉林,通化,梅河口', '3', '0435', '135000', 'Meihekou', 'MHK', 'M', '125.71', '42.5383', '');
INSERT INTO `t_order_region` VALUES ('651', '220582', '220500', '集安市', '中国,吉林省,通化市,集安市', '集安', '中国,吉林,通化,集安', '3', '0435', '134200', 'Ji\'an', 'JA', 'J', '126.188', '41.1227', '');
INSERT INTO `t_order_region` VALUES ('652', '220600', '220000', '白山市', '中国,吉林省,白山市', '白山', '中国,吉林,白山', '2', '0439', '134300', 'Baishan', 'BS', 'B', '126.428', '41.9425', '');
INSERT INTO `t_order_region` VALUES ('653', '220602', '220600', '浑江区', '中国,吉林省,白山市,浑江区', '浑江', '中国,吉林,白山,浑江', '3', '0439', '134300', 'Hunjiang', 'HJ', 'H', '126.422', '41.9457', '');
INSERT INTO `t_order_region` VALUES ('654', '220605', '220600', '江源区', '中国,吉林省,白山市,江源区', '江源', '中国,吉林,白山,江源', '3', '0439', '134700', 'Jiangyuan', 'JY', 'J', '126.591', '42.0566', '');
INSERT INTO `t_order_region` VALUES ('655', '220621', '220600', '抚松县', '中国,吉林省,白山市,抚松县', '抚松', '中国,吉林,白山,抚松', '3', '0439', '134500', 'Fusong', 'FS', 'F', '127.28', '42.342', '');
INSERT INTO `t_order_region` VALUES ('656', '220622', '220600', '靖宇县', '中国,吉林省,白山市,靖宇县', '靖宇', '中国,吉林,白山,靖宇', '3', '0439', '135200', 'Jingyu', 'JY', 'J', '126.813', '42.3886', '');
INSERT INTO `t_order_region` VALUES ('657', '220623', '220600', '长白朝鲜族自治县', '中国,吉林省,白山市,长白朝鲜族自治县', '长白', '中国,吉林,白山,长白', '3', '0439', '134400', 'Changbai', 'CB', 'C', '128.2', '41.42', '');
INSERT INTO `t_order_region` VALUES ('658', '220681', '220600', '临江市', '中国,吉林省,白山市,临江市', '临江', '中国,吉林,白山,临江', '3', '0439', '134600', 'Linjiang', 'LJ', 'L', '126.918', '41.8114', '');
INSERT INTO `t_order_region` VALUES ('659', '220700', '220000', '松原市', '中国,吉林省,松原市', '松原', '中国,吉林,松原', '2', '0438', '138000', 'Songyuan', 'SY', 'S', '124.824', '45.1182', '');
INSERT INTO `t_order_region` VALUES ('660', '220702', '220700', '宁江区', '中国,吉林省,松原市,宁江区', '宁江', '中国,吉林,松原,宁江', '3', '0438', '138000', 'Ningjiang', 'NJ', 'N', '124.817', '45.1717', '');
INSERT INTO `t_order_region` VALUES ('661', '220721', '220700', '前郭尔罗斯蒙古族自治县', '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', '前郭尔罗斯', '中国,吉林,松原,前郭尔罗斯', '3', '0438', '131100', 'Qianguoerluosi', 'QGELS', 'Q', '124.824', '45.1173', '');
INSERT INTO `t_order_region` VALUES ('662', '220722', '220700', '长岭县', '中国,吉林省,松原市,长岭县', '长岭', '中国,吉林,松原,长岭', '3', '0438', '131500', 'Changling', 'CL', 'C', '123.967', '44.2758', '');
INSERT INTO `t_order_region` VALUES ('663', '220723', '220700', '乾安县', '中国,吉林省,松原市,乾安县', '乾安', '中国,吉林,松原,乾安', '3', '0438', '131400', 'Qian\'an', 'QA', 'Q', '124.027', '45.0107', '');
INSERT INTO `t_order_region` VALUES ('664', '220781', '220700', '扶余市', '中国,吉林省,松原市,扶余市', '扶余', '中国,吉林,松原,扶余', '3', '0438', '131200', 'Fuyu', 'FY', 'F', '126.043', '44.9862', '');
INSERT INTO `t_order_region` VALUES ('665', '220800', '220000', '白城市', '中国,吉林省,白城市', '白城', '中国,吉林,白城', '2', '0436', '137000', 'Baicheng', 'BC', 'B', '122.841', '45.619', '');
INSERT INTO `t_order_region` VALUES ('666', '220802', '220800', '洮北区', '中国,吉林省,白城市,洮北区', '洮北', '中国,吉林,白城,洮北', '3', '0436', '137000', 'Taobei', 'TB', 'T', '122.851', '45.6217', '');
INSERT INTO `t_order_region` VALUES ('667', '220821', '220800', '镇赉县', '中国,吉林省,白城市,镇赉县', '镇赉', '中国,吉林,白城,镇赉', '3', '0436', '137300', 'Zhenlai', 'ZL', 'Z', '123.199', '45.8478', '');
INSERT INTO `t_order_region` VALUES ('668', '220822', '220800', '通榆县', '中国,吉林省,白城市,通榆县', '通榆', '中国,吉林,白城,通榆', '3', '0436', '137200', 'Tongyu', 'TY', 'T', '123.088', '44.8139', '');
INSERT INTO `t_order_region` VALUES ('669', '220881', '220800', '洮南市', '中国,吉林省,白城市,洮南市', '洮南', '中国,吉林,白城,洮南', '3', '0436', '137100', 'Taonan', 'TN', 'T', '122.788', '45.335', '');
INSERT INTO `t_order_region` VALUES ('670', '220882', '220800', '大安市', '中国,吉林省,白城市,大安市', '大安', '中国,吉林,白城,大安', '3', '0436', '131300', 'Da\'an', 'DA', 'D', '124.295', '45.5085', '');
INSERT INTO `t_order_region` VALUES ('671', '222400', '220000', '延边朝鲜族自治州', '中国,吉林省,延边朝鲜族自治州', '延边', '中国,吉林,延边', '2', '0433', '133000', 'Yanbian', 'YB', 'Y', '129.513', '42.9048', '');
INSERT INTO `t_order_region` VALUES ('672', '222401', '222400', '延吉市', '中国,吉林省,延边朝鲜族自治州,延吉市', '延吉', '中国,吉林,延边,延吉', '3', '0433', '133000', 'Yanji', 'YJ', 'Y', '129.514', '42.9068', '');
INSERT INTO `t_order_region` VALUES ('673', '222402', '222400', '图们市', '中国,吉林省,延边朝鲜族自治州,图们市', '图们', '中国,吉林,延边,图们', '3', '0433', '133100', 'Tumen', 'TM', 'T', '129.844', '42.968', '');
INSERT INTO `t_order_region` VALUES ('674', '222403', '222400', '敦化市', '中国,吉林省,延边朝鲜族自治州,敦化市', '敦化', '中国,吉林,延边,敦化', '3', '0433', '133700', 'Dunhua', 'DH', 'D', '128.232', '43.373', '');
INSERT INTO `t_order_region` VALUES ('675', '222404', '222400', '珲春市', '中国,吉林省,延边朝鲜族自治州,珲春市', '珲春', '中国,吉林,延边,珲春', '3', '0433', '133300', 'Hunchun', 'HCH', 'H', '130.366', '42.8624', '');
INSERT INTO `t_order_region` VALUES ('676', '222405', '222400', '龙井市', '中国,吉林省,延边朝鲜族自治州,龙井市', '龙井', '中国,吉林,延边,龙井', '3', '0433', '133400', 'Longjing', 'LJ', 'L', '129.426', '42.768', '');
INSERT INTO `t_order_region` VALUES ('677', '222406', '222400', '和龙市', '中国,吉林省,延边朝鲜族自治州,和龙市', '和龙', '中国,吉林,延边,和龙', '3', '0433', '133500', 'Helong', 'HL', 'H', '129.011', '42.5464', '');
INSERT INTO `t_order_region` VALUES ('678', '222424', '222400', '汪清县', '中国,吉林省,延边朝鲜族自治州,汪清县', '汪清', '中国,吉林,延边,汪清', '3', '0433', '133200', 'Wangqing', 'WQ', 'W', '129.771', '43.3128', '');
INSERT INTO `t_order_region` VALUES ('679', '222426', '222400', '安图县', '中国,吉林省,延边朝鲜族自治州,安图县', '安图', '中国,吉林,延边,安图', '3', '0433', '133600', 'Antu', 'AT', 'A', '128.906', '43.1153', '');
INSERT INTO `t_order_region` VALUES ('680', '230000', '100000', '黑龙江省', '中国,黑龙江省', '黑龙江', '中国,黑龙江', '1', '', '', 'Heilongjiang', 'HL', 'H', '126.642', '45.757', '');
INSERT INTO `t_order_region` VALUES ('681', '230100', '230000', '哈尔滨市', '中国,黑龙江省,哈尔滨市', '哈尔滨', '中国,黑龙江,哈尔滨', '2', '0451', '150000', 'Harbin', 'HEB', 'H', '126.642', '45.757', '');
INSERT INTO `t_order_region` VALUES ('682', '230102', '230100', '道里区', '中国,黑龙江省,哈尔滨市,道里区', '道里', '中国,黑龙江,哈尔滨,道里', '3', '0451', '150000', 'Daoli', 'DL', 'D', '126.617', '45.7559', '');
INSERT INTO `t_order_region` VALUES ('683', '230103', '230100', '南岗区', '中国,黑龙江省,哈尔滨市,南岗区', '南岗', '中国,黑龙江,哈尔滨,南岗', '3', '0451', '150000', 'Nangang', 'NG', 'N', '126.669', '45.76', '');
INSERT INTO `t_order_region` VALUES ('684', '230104', '230100', '道外区', '中国,黑龙江省,哈尔滨市,道外区', '道外', '中国,黑龙江,哈尔滨,道外', '3', '0451', '150000', 'Daowai', 'DW', 'D', '126.649', '45.7919', '');
INSERT INTO `t_order_region` VALUES ('685', '230108', '230100', '平房区', '中国,黑龙江省,哈尔滨市,平房区', '平房', '中国,黑龙江,哈尔滨,平房', '3', '0451', '150000', 'Pingfang', 'PF', 'P', '126.637', '45.5978', '');
INSERT INTO `t_order_region` VALUES ('686', '230109', '230100', '松北区', '中国,黑龙江省,哈尔滨市,松北区', '松北', '中国,黑龙江,哈尔滨,松北', '3', '0451', '150000', 'Songbei', 'SB', 'S', '126.563', '45.8083', '');
INSERT INTO `t_order_region` VALUES ('687', '230110', '230100', '香坊区', '中国,黑龙江省,哈尔滨市,香坊区', '香坊', '中国,黑龙江,哈尔滨,香坊', '3', '0451', '150000', 'Xiangfang', 'XF', 'X', '126.68', '45.7238', '');
INSERT INTO `t_order_region` VALUES ('688', '230111', '230100', '呼兰区', '中国,黑龙江省,哈尔滨市,呼兰区', '呼兰', '中国,黑龙江,哈尔滨,呼兰', '3', '0451', '150500', 'Hulan', 'HL', 'H', '126.588', '45.889', '');
INSERT INTO `t_order_region` VALUES ('689', '230112', '230100', '阿城区', '中国,黑龙江省,哈尔滨市,阿城区', '阿城', '中国,黑龙江,哈尔滨,阿城', '3', '0451', '150000', 'A\'cheng', 'AC', 'A', '126.975', '45.5414', '');
INSERT INTO `t_order_region` VALUES ('690', '230113', '230100', '双城区', '中国,黑龙江省,哈尔滨市,双城区', '双城', '中国,黑龙江,哈尔滨,双城', '3', '0451', '150100', 'Shuangcheng', 'SC', 'S', '126.309', '45.3779', '');
INSERT INTO `t_order_region` VALUES ('691', '230123', '230100', '依兰县', '中国,黑龙江省,哈尔滨市,依兰县', '依兰', '中国,黑龙江,哈尔滨,依兰', '3', '0451', '154800', 'Yilan', 'YL', 'Y', '129.568', '46.3247', '');
INSERT INTO `t_order_region` VALUES ('692', '230124', '230100', '方正县', '中国,黑龙江省,哈尔滨市,方正县', '方正', '中国,黑龙江,哈尔滨,方正', '3', '0451', '150800', 'Fangzheng', 'FZ', 'F', '128.83', '45.8516', '');
INSERT INTO `t_order_region` VALUES ('693', '230125', '230100', '宾县', '中国,黑龙江省,哈尔滨市,宾县', '宾县', '中国,黑龙江,哈尔滨,宾县', '3', '0451', '150400', 'Binxian', 'BX', 'B', '127.487', '45.755', '');
INSERT INTO `t_order_region` VALUES ('694', '230126', '230100', '巴彦县', '中国,黑龙江省,哈尔滨市,巴彦县', '巴彦', '中国,黑龙江,哈尔滨,巴彦', '3', '0451', '151800', 'Bayan', 'BY', 'B', '127.408', '46.0815', '');
INSERT INTO `t_order_region` VALUES ('695', '230127', '230100', '木兰县', '中国,黑龙江省,哈尔滨市,木兰县', '木兰', '中国,黑龙江,哈尔滨,木兰', '3', '0451', '151900', 'Mulan', 'ML', 'M', '128.045', '45.9494', '');
INSERT INTO `t_order_region` VALUES ('696', '230128', '230100', '通河县', '中国,黑龙江省,哈尔滨市,通河县', '通河', '中国,黑龙江,哈尔滨,通河', '3', '0451', '150900', 'Tonghe', 'TH', 'T', '128.746', '45.9901', '');
INSERT INTO `t_order_region` VALUES ('697', '230129', '230100', '延寿县', '中国,黑龙江省,哈尔滨市,延寿县', '延寿', '中国,黑龙江,哈尔滨,延寿', '3', '0451', '150700', 'Yanshou', 'YS', 'Y', '128.334', '45.4554', '');
INSERT INTO `t_order_region` VALUES ('698', '230183', '230100', '尚志市', '中国,黑龙江省,哈尔滨市,尚志市', '尚志', '中国,黑龙江,哈尔滨,尚志', '3', '0451', '150600', 'Shangzhi', 'SZ', 'S', '127.962', '45.2174', '');
INSERT INTO `t_order_region` VALUES ('699', '230184', '230100', '五常市', '中国,黑龙江省,哈尔滨市,五常市', '五常', '中国,黑龙江,哈尔滨,五常', '3', '0451', '150200', 'Wuchang', 'WC', 'W', '127.168', '44.9318', '');
INSERT INTO `t_order_region` VALUES ('700', '230185', '230100', '哈尔滨新区', '中国,黑龙江省,哈尔滨市,哈尔滨新区', '哈尔滨新区', '中国,黑龙江,哈尔滨,哈尔滨新区', '3', '0451', '150000', 'HarbinXinQu', 'HEBXQ', 'H', '126.642', '45.757', '国家级新区');
INSERT INTO `t_order_region` VALUES ('701', '230186', '230100', '高新区', '中国,黑龙江省,哈尔滨市,高新区', '高新区', '中国,黑龙江,哈尔滨,高新区', '3', '0451', '150000', 'GaoXinQu', 'GXQ', 'G', '126.498', '45.7915', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('702', '230200', '230000', '齐齐哈尔市', '中国,黑龙江省,齐齐哈尔市', '齐齐哈尔', '中国,黑龙江,齐齐哈尔', '2', '0452', '161000', 'Qiqihar', 'QQHE', 'Q', '123.953', '47.3481', '');
INSERT INTO `t_order_region` VALUES ('703', '230202', '230200', '龙沙区', '中国,黑龙江省,齐齐哈尔市,龙沙区', '龙沙', '中国,黑龙江,齐齐哈尔,龙沙', '3', '0452', '161000', 'Longsha', 'LS', 'L', '123.958', '47.3178', '');
INSERT INTO `t_order_region` VALUES ('704', '230203', '230200', '建华区', '中国,黑龙江省,齐齐哈尔市,建华区', '建华', '中国,黑龙江,齐齐哈尔,建华', '3', '0452', '161000', 'Jianhua', 'JH', 'J', '124.013', '47.3672', '');
INSERT INTO `t_order_region` VALUES ('705', '230204', '230200', '铁锋区', '中国,黑龙江省,齐齐哈尔市,铁锋区', '铁锋', '中国,黑龙江,齐齐哈尔,铁锋', '3', '0452', '161000', 'Tiefeng', 'TF', 'T', '123.978', '47.3408', '');
INSERT INTO `t_order_region` VALUES ('706', '230205', '230200', '昂昂溪区', '中国,黑龙江省,齐齐哈尔市,昂昂溪区', '昂昂溪', '中国,黑龙江,齐齐哈尔,昂昂溪', '3', '0452', '161000', 'Angangxi', 'AAX', 'A', '123.822', '47.1551', '');
INSERT INTO `t_order_region` VALUES ('707', '230206', '230200', '富拉尔基区', '中国,黑龙江省,齐齐哈尔市,富拉尔基区', '富拉尔基', '中国,黑龙江,齐齐哈尔,富拉尔基', '3', '0452', '161000', 'Fulaerji', 'FLEJ', 'F', '123.629', '47.2088', '');
INSERT INTO `t_order_region` VALUES ('708', '230207', '230200', '碾子山区', '中国,黑龙江省,齐齐哈尔市,碾子山区', '碾子山', '中国,黑龙江,齐齐哈尔,碾子山', '3', '0452', '161000', 'Nianzishan', 'NZS', 'N', '122.882', '47.5166', '');
INSERT INTO `t_order_region` VALUES ('709', '230208', '230200', '梅里斯达斡尔族区', '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', '梅里斯', '中国,黑龙江,齐齐哈尔,梅里斯', '3', '0452', '161000', 'Meilisi', 'MLS', 'M', '123.753', '47.3095', '');
INSERT INTO `t_order_region` VALUES ('710', '230221', '230200', '龙江县', '中国,黑龙江省,齐齐哈尔市,龙江县', '龙江', '中国,黑龙江,齐齐哈尔,龙江', '3', '0452', '161100', 'Longjiang', 'LJ', 'L', '123.205', '47.3387', '');
INSERT INTO `t_order_region` VALUES ('711', '230223', '230200', '依安县', '中国,黑龙江省,齐齐哈尔市,依安县', '依安', '中国,黑龙江,齐齐哈尔,依安', '3', '0452', '161500', 'Yi\'an', 'YA', 'Y', '125.309', '47.8931', '');
INSERT INTO `t_order_region` VALUES ('712', '230224', '230200', '泰来县', '中国,黑龙江省,齐齐哈尔市,泰来县', '泰来', '中国,黑龙江,齐齐哈尔,泰来', '3', '0452', '162400', 'Tailai', 'TL', 'T', '123.423', '46.3939', '');
INSERT INTO `t_order_region` VALUES ('713', '230225', '230200', '甘南县', '中国,黑龙江省,齐齐哈尔市,甘南县', '甘南', '中国,黑龙江,齐齐哈尔,甘南', '3', '0452', '162100', 'Gannan', 'GN', 'G', '123.503', '47.9244', '');
INSERT INTO `t_order_region` VALUES ('714', '230227', '230200', '富裕县', '中国,黑龙江省,齐齐哈尔市,富裕县', '富裕', '中国,黑龙江,齐齐哈尔,富裕', '3', '0452', '161200', 'Fuyu', 'FY', 'F', '124.475', '47.7743', '');
INSERT INTO `t_order_region` VALUES ('715', '230229', '230200', '克山县', '中国,黑龙江省,齐齐哈尔市,克山县', '克山', '中国,黑龙江,齐齐哈尔,克山', '3', '0452', '161600', 'Keshan', 'KS', 'K', '125.874', '48.0326', '');
INSERT INTO `t_order_region` VALUES ('716', '230230', '230200', '克东县', '中国,黑龙江省,齐齐哈尔市,克东县', '克东', '中国,黑龙江,齐齐哈尔,克东', '3', '0452', '164800', 'Kedong', 'KD', 'K', '126.249', '48.0383', '');
INSERT INTO `t_order_region` VALUES ('717', '230231', '230200', '拜泉县', '中国,黑龙江省,齐齐哈尔市,拜泉县', '拜泉', '中国,黑龙江,齐齐哈尔,拜泉', '3', '0452', '164700', 'Baiquan', 'BQ', 'B', '126.092', '47.6082', '');
INSERT INTO `t_order_region` VALUES ('718', '230281', '230200', '讷河市', '中国,黑龙江省,齐齐哈尔市,讷河市', '讷河', '中国,黑龙江,齐齐哈尔,讷河', '3', '0452', '161300', 'Nehe', 'NH', 'N', '124.877', '48.4839', '');
INSERT INTO `t_order_region` VALUES ('719', '230282', '230200', '高新区', '中国,黑龙江省,齐齐哈尔市,高新区', '高新区', '中国,黑龙江,齐齐哈尔,高新区', '3', '0452', '161000', 'GaoXinQu', 'GXQ', 'G', '123.955', '47.3083', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('720', '230300', '230000', '鸡西市', '中国,黑龙江省,鸡西市', '鸡西', '中国,黑龙江,鸡西', '2', '0467', '158100', 'Jixi', 'JX', 'J', '130.976', '45.3', '');
INSERT INTO `t_order_region` VALUES ('721', '230302', '230300', '鸡冠区', '中国,黑龙江省,鸡西市,鸡冠区', '鸡冠', '中国,黑龙江,鸡西,鸡冠', '3', '0467', '158100', 'Jiguan', 'JG', 'J', '130.981', '45.304', '');
INSERT INTO `t_order_region` VALUES ('722', '230303', '230300', '恒山区', '中国,黑龙江省,鸡西市,恒山区', '恒山', '中国,黑龙江,鸡西,恒山', '3', '0467', '158100', 'Hengshan', 'HS', 'H', '130.905', '45.2107', '');
INSERT INTO `t_order_region` VALUES ('723', '230304', '230300', '滴道区', '中国,黑龙江省,鸡西市,滴道区', '滴道', '中国,黑龙江,鸡西,滴道', '3', '0467', '158100', 'Didao', 'DD', 'D', '130.848', '45.3511', '');
INSERT INTO `t_order_region` VALUES ('724', '230305', '230300', '梨树区', '中国,黑龙江省,鸡西市,梨树区', '梨树', '中国,黑龙江,鸡西,梨树', '3', '0467', '158100', 'Lishu', 'LS', 'L', '130.698', '45.0904', '');
INSERT INTO `t_order_region` VALUES ('725', '230306', '230300', '城子河区', '中国,黑龙江省,鸡西市,城子河区', '城子河', '中国,黑龙江,鸡西,城子河', '3', '0467', '158100', 'Chengzihe', 'CZH', 'C', '131.011', '45.3369', '');
INSERT INTO `t_order_region` VALUES ('726', '230307', '230300', '麻山区', '中国,黑龙江省,鸡西市,麻山区', '麻山', '中国,黑龙江,鸡西,麻山', '3', '0467', '158100', 'Mashan', 'MS', 'M', '130.478', '45.2121', '');
INSERT INTO `t_order_region` VALUES ('727', '230321', '230300', '鸡东县', '中国,黑龙江省,鸡西市,鸡东县', '鸡东', '中国,黑龙江,鸡西,鸡东', '3', '0467', '158200', 'Jidong', 'JD', 'J', '131.124', '45.2603', '');
INSERT INTO `t_order_region` VALUES ('728', '230381', '230300', '虎林市', '中国,黑龙江省,鸡西市,虎林市', '虎林', '中国,黑龙江,鸡西,虎林', '3', '0467', '158400', 'Hulin', 'HL', 'H', '132.937', '45.7629', '');
INSERT INTO `t_order_region` VALUES ('729', '230382', '230300', '密山市', '中国,黑龙江省,鸡西市,密山市', '密山', '中国,黑龙江,鸡西,密山', '3', '0467', '158300', 'Mishan', 'MS', 'M', '131.846', '45.5297', '');
INSERT INTO `t_order_region` VALUES ('730', '230400', '230000', '鹤岗市', '中国,黑龙江省,鹤岗市', '鹤岗', '中国,黑龙江,鹤岗', '2', '0468', '154100', 'Hegang', 'HG', 'H', '130.277', '47.3321', '');
INSERT INTO `t_order_region` VALUES ('731', '230402', '230400', '向阳区', '中国,黑龙江省,鹤岗市,向阳区', '向阳', '中国,黑龙江,鹤岗,向阳', '3', '0468', '154100', 'Xiangyang', 'XY', 'X', '130.294', '47.3425', '');
INSERT INTO `t_order_region` VALUES ('732', '230403', '230400', '工农区', '中国,黑龙江省,鹤岗市,工农区', '工农', '中国,黑龙江,鹤岗,工农', '3', '0468', '154100', 'Gongnong', 'GN', 'G', '130.275', '47.3187', '');
INSERT INTO `t_order_region` VALUES ('733', '230404', '230400', '南山区', '中国,黑龙江省,鹤岗市,南山区', '南山', '中国,黑龙江,鹤岗,南山', '3', '0468', '154100', 'Nanshan', 'NS', 'N', '130.277', '47.314', '');
INSERT INTO `t_order_region` VALUES ('734', '230405', '230400', '兴安区', '中国,黑龙江省,鹤岗市,兴安区', '兴安', '中国,黑龙江,鹤岗,兴安', '3', '0468', '154100', 'Xing\'an', 'XA', 'X', '130.24', '47.2526', '');
INSERT INTO `t_order_region` VALUES ('735', '230406', '230400', '东山区', '中国,黑龙江省,鹤岗市,东山区', '东山', '中国,黑龙江,鹤岗,东山', '3', '0468', '154100', 'Dongshan', 'DS', 'D', '130.317', '47.3385', '');
INSERT INTO `t_order_region` VALUES ('736', '230407', '230400', '兴山区', '中国,黑龙江省,鹤岗市,兴山区', '兴山', '中国,黑龙江,鹤岗,兴山', '3', '0468', '154100', 'Xingshan', 'XS', 'X', '130.293', '47.3578', '');
INSERT INTO `t_order_region` VALUES ('737', '230421', '230400', '萝北县', '中国,黑龙江省,鹤岗市,萝北县', '萝北', '中国,黑龙江,鹤岗,萝北', '3', '0468', '154200', 'Luobei', 'LB', 'L', '130.833', '47.5796', '');
INSERT INTO `t_order_region` VALUES ('738', '230422', '230400', '绥滨县', '中国,黑龙江省,鹤岗市,绥滨县', '绥滨', '中国,黑龙江,鹤岗,绥滨', '3', '0468', '156200', 'Suibin', 'SB', 'S', '131.86', '47.2903', '');
INSERT INTO `t_order_region` VALUES ('739', '230500', '230000', '双鸭山市', '中国,黑龙江省,双鸭山市', '双鸭山', '中国,黑龙江,双鸭山', '2', '0469', '155100', 'Shuangyashan', 'SYS', 'S', '131.157', '46.6434', '');
INSERT INTO `t_order_region` VALUES ('740', '230502', '230500', '尖山区', '中国,黑龙江省,双鸭山市,尖山区', '尖山', '中国,黑龙江,双鸭山,尖山', '3', '0469', '155100', 'Jianshan', 'JS', 'J', '131.158', '46.6464', '');
INSERT INTO `t_order_region` VALUES ('741', '230503', '230500', '岭东区', '中国,黑龙江省,双鸭山市,岭东区', '岭东', '中国,黑龙江,双鸭山,岭东', '3', '0469', '155100', 'Lingdong', 'LD', 'L', '131.165', '46.5904', '');
INSERT INTO `t_order_region` VALUES ('742', '230505', '230500', '四方台区', '中国,黑龙江省,双鸭山市,四方台区', '四方台', '中国,黑龙江,双鸭山,四方台', '3', '0469', '155100', 'Sifangtai', 'SFT', 'S', '131.336', '46.595', '');
INSERT INTO `t_order_region` VALUES ('743', '230506', '230500', '宝山区', '中国,黑龙江省,双鸭山市,宝山区', '宝山', '中国,黑龙江,双鸭山,宝山', '3', '0469', '155100', 'Baoshan', 'BS', 'B', '131.402', '46.5772', '');
INSERT INTO `t_order_region` VALUES ('744', '230521', '230500', '集贤县', '中国,黑龙江省,双鸭山市,集贤县', '集贤', '中国,黑龙江,双鸭山,集贤', '3', '0469', '155900', 'Jixian', 'JX', 'J', '131.141', '46.7268', '');
INSERT INTO `t_order_region` VALUES ('745', '230522', '230500', '友谊县', '中国,黑龙江省,双鸭山市,友谊县', '友谊', '中国,黑龙江,双鸭山,友谊', '3', '0469', '155800', 'Youyi', 'YY', 'Y', '131.808', '46.7674', '');
INSERT INTO `t_order_region` VALUES ('746', '230523', '230500', '宝清县', '中国,黑龙江省,双鸭山市,宝清县', '宝清', '中国,黑龙江,双鸭山,宝清', '3', '0469', '155600', 'Baoqing', 'BQ', 'B', '132.197', '46.3272', '');
INSERT INTO `t_order_region` VALUES ('747', '230524', '230500', '饶河县', '中国,黑龙江省,双鸭山市,饶河县', '饶河', '中国,黑龙江,双鸭山,饶河', '3', '0469', '155700', 'Raohe', 'RH', 'R', '134.02', '46.799', '');
INSERT INTO `t_order_region` VALUES ('748', '230600', '230000', '大庆市', '中国,黑龙江省,大庆市', '大庆', '中国,黑龙江,大庆', '2', '0459', '163000', 'Daqing', 'DQ', 'D', '125.113', '46.5907', '');
INSERT INTO `t_order_region` VALUES ('749', '230602', '230600', '萨尔图区', '中国,黑龙江省,大庆市,萨尔图区', '萨尔图', '中国,黑龙江,大庆,萨尔图', '3', '0459', '163000', 'Saertu', 'SET', 'S', '125.088', '46.5936', '');
INSERT INTO `t_order_region` VALUES ('750', '230603', '230600', '龙凤区', '中国,黑龙江省,大庆市,龙凤区', '龙凤', '中国,黑龙江,大庆,龙凤', '3', '0459', '163000', 'Longfeng', 'LF', 'L', '125.117', '46.5327', '');
INSERT INTO `t_order_region` VALUES ('751', '230604', '230600', '让胡路区', '中国,黑龙江省,大庆市,让胡路区', '让胡路', '中国,黑龙江,大庆,让胡路', '3', '0459', '163000', 'Ranghulu', 'RHL', 'R', '124.871', '46.6522', '');
INSERT INTO `t_order_region` VALUES ('752', '230605', '230600', '红岗区', '中国,黑龙江省,大庆市,红岗区', '红岗', '中国,黑龙江,大庆,红岗', '3', '0459', '163000', 'Honggang', 'HG', 'H', '124.892', '46.4013', '');
INSERT INTO `t_order_region` VALUES ('753', '230606', '230600', '大同区', '中国,黑龙江省,大庆市,大同区', '大同', '中国,黑龙江,大庆,大同', '3', '0459', '163000', 'Datong', 'DT', 'D', '124.816', '46.033', '');
INSERT INTO `t_order_region` VALUES ('754', '230621', '230600', '肇州县', '中国,黑龙江省,大庆市,肇州县', '肇州', '中国,黑龙江,大庆,肇州', '3', '0459', '166400', 'Zhaozhou', 'ZZ', 'Z', '125.271', '45.7041', '');
INSERT INTO `t_order_region` VALUES ('755', '230622', '230600', '肇源县', '中国,黑龙江省,大庆市,肇源县', '肇源', '中国,黑龙江,大庆,肇源', '3', '0459', '166500', 'Zhaoyuan', 'ZY', 'Z', '125.085', '45.5203', '');
INSERT INTO `t_order_region` VALUES ('756', '230623', '230600', '林甸县', '中国,黑龙江省,大庆市,林甸县', '林甸', '中国,黑龙江,大庆,林甸', '3', '0459', '166300', 'Lindian', 'LD', 'L', '124.876', '47.186', '');
INSERT INTO `t_order_region` VALUES ('757', '230624', '230600', '杜尔伯特蒙古族自治县', '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', '杜尔伯特', '中国,黑龙江,大庆,杜尔伯特', '3', '0459', '166200', 'Duerbote', 'DEBT', 'D', '124.449', '46.8651', '');
INSERT INTO `t_order_region` VALUES ('758', '230625', '230600', '高新区', '中国,黑龙江省,大庆市,高新区', '高新区', '中国,黑龙江,大庆,高新区', '3', '0459', '163000', 'Gaoxinqu', 'GXQ', 'G', '125.151', '46.581', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('759', '230700', '230000', '伊春市', '中国,黑龙江省,伊春市', '伊春', '中国,黑龙江,伊春', '2', '0458', '153000', 'Yichun', 'YC', 'Y', '128.899', '47.7248', '');
INSERT INTO `t_order_region` VALUES ('760', '230702', '230700', '伊春区', '中国,黑龙江省,伊春市,伊春区', '伊春', '中国,黑龙江,伊春,伊春', '3', '0458', '153000', 'Yichun', 'YC', 'Y', '128.908', '47.728', '');
INSERT INTO `t_order_region` VALUES ('761', '230703', '230700', '南岔区', '中国,黑龙江省,伊春市,南岔区', '南岔', '中国,黑龙江,伊春,南岔', '3', '0458', '153000', 'Nancha', 'NC', 'N', '129.284', '47.139', '');
INSERT INTO `t_order_region` VALUES ('762', '230704', '230700', '友好区', '中国,黑龙江省,伊春市,友好区', '友好', '中国,黑龙江,伊春,友好', '3', '0458', '153000', 'Youhao', 'YH', 'Y', '128.84', '47.8537', '');
INSERT INTO `t_order_region` VALUES ('763', '230705', '230700', '西林区', '中国,黑龙江省,伊春市,西林区', '西林', '中国,黑龙江,伊春,西林', '3', '0458', '153000', 'Xilin', 'XL', 'X', '129.312', '47.481', '');
INSERT INTO `t_order_region` VALUES ('764', '230706', '230700', '翠峦区', '中国,黑龙江省,伊春市,翠峦区', '翠峦', '中国,黑龙江,伊春,翠峦', '3', '0458', '153000', 'Cuiluan', 'CL', 'C', '128.667', '47.725', '');
INSERT INTO `t_order_region` VALUES ('765', '230707', '230700', '新青区', '中国,黑龙江省,伊春市,新青区', '新青', '中国,黑龙江,伊春,新青', '3', '0458', '153000', 'Xinqing', 'XQ', 'X', '129.537', '48.2907', '');
INSERT INTO `t_order_region` VALUES ('766', '230708', '230700', '美溪区', '中国,黑龙江省,伊春市,美溪区', '美溪', '中国,黑龙江,伊春,美溪', '3', '0458', '153000', 'Meixi', 'MX', 'M', '129.137', '47.6351', '');
INSERT INTO `t_order_region` VALUES ('767', '230709', '230700', '金山屯区', '中国,黑龙江省,伊春市,金山屯区', '金山屯', '中国,黑龙江,伊春,金山屯', '3', '0458', '153000', 'Jinshantun', 'JST', 'J', '129.438', '47.4135', '');
INSERT INTO `t_order_region` VALUES ('768', '230710', '230700', '五营区', '中国,黑龙江省,伊春市,五营区', '五营', '中国,黑龙江,伊春,五营', '3', '0458', '153000', 'Wuying', 'WY', 'W', '129.245', '48.1079', '');
INSERT INTO `t_order_region` VALUES ('769', '230711', '230700', '乌马河区', '中国,黑龙江省,伊春市,乌马河区', '乌马河', '中国,黑龙江,伊春,乌马河', '3', '0458', '153000', 'Wumahe', 'WMH', 'W', '128.797', '47.728', '');
INSERT INTO `t_order_region` VALUES ('770', '230712', '230700', '汤旺河区', '中国,黑龙江省,伊春市,汤旺河区', '汤旺河', '中国,黑龙江,伊春,汤旺河', '3', '0458', '153000', 'Tangwanghe', 'TWH', 'T', '129.572', '48.4518', '');
INSERT INTO `t_order_region` VALUES ('771', '230713', '230700', '带岭区', '中国,黑龙江省,伊春市,带岭区', '带岭', '中国,黑龙江,伊春,带岭', '3', '0458', '153000', 'Dailing', 'DL', 'D', '129.024', '47.0255', '');
INSERT INTO `t_order_region` VALUES ('772', '230714', '230700', '乌伊岭区', '中国,黑龙江省,伊春市,乌伊岭区', '乌伊岭', '中国,黑龙江,伊春,乌伊岭', '3', '0458', '153000', 'Wuyiling', 'WYL', 'W', '129.44', '48.596', '');
INSERT INTO `t_order_region` VALUES ('773', '230715', '230700', '红星区', '中国,黑龙江省,伊春市,红星区', '红星', '中国,黑龙江,伊春,红星', '3', '0458', '153000', 'Hongxing', 'HX', 'H', '129.389', '48.2394', '');
INSERT INTO `t_order_region` VALUES ('774', '230716', '230700', '上甘岭区', '中国,黑龙江省,伊春市,上甘岭区', '上甘岭', '中国,黑龙江,伊春,上甘岭', '3', '0458', '153000', 'Shangganling', 'SGL', 'S', '129.024', '47.9752', '');
INSERT INTO `t_order_region` VALUES ('775', '230722', '230700', '嘉荫县', '中国,黑龙江省,伊春市,嘉荫县', '嘉荫', '中国,黑龙江,伊春,嘉荫', '3', '0458', '153200', 'Jiayin', 'JY', 'J', '130.398', '48.8917', '');
INSERT INTO `t_order_region` VALUES ('776', '230781', '230700', '铁力市', '中国,黑龙江省,伊春市,铁力市', '铁力', '中国,黑龙江,伊春,铁力', '3', '0458', '152500', 'Tieli', 'TL', 'T', '128.032', '46.9857', '');
INSERT INTO `t_order_region` VALUES ('777', '230800', '230000', '佳木斯市', '中国,黑龙江省,佳木斯市', '佳木斯', '中国,黑龙江,佳木斯', '2', '0454', '154000', 'Jiamusi', 'JMS', 'J', '130.362', '46.8096', '');
INSERT INTO `t_order_region` VALUES ('778', '230803', '230800', '向阳区', '中国,黑龙江省,佳木斯市,向阳区', '向阳', '中国,黑龙江,佳木斯,向阳', '3', '0454', '154000', 'Xiangyang', 'XY', 'X', '130.365', '46.8078', '');
INSERT INTO `t_order_region` VALUES ('779', '230804', '230800', '前进区', '中国,黑龙江省,佳木斯市,前进区', '前进', '中国,黑龙江,佳木斯,前进', '3', '0454', '154000', 'Qianjin', 'QJ', 'Q', '130.375', '46.814', '');
INSERT INTO `t_order_region` VALUES ('780', '230805', '230800', '东风区', '中国,黑龙江省,佳木斯市,东风区', '东风', '中国,黑龙江,佳木斯,东风', '3', '0454', '154000', 'Dongfeng', 'DF', 'D', '130.404', '46.8226', '');
INSERT INTO `t_order_region` VALUES ('781', '230811', '230800', '郊区', '中国,黑龙江省,佳木斯市,郊区', '郊区', '中国,黑龙江,佳木斯,郊区', '3', '0454', '154000', 'Jiaoqu', 'JQ', 'J', '130.327', '46.8096', '');
INSERT INTO `t_order_region` VALUES ('782', '230822', '230800', '桦南县', '中国,黑龙江省,佳木斯市,桦南县', '桦南', '中国,黑龙江,佳木斯,桦南', '3', '0454', '154400', 'Huanan', 'HN', 'H', '130.554', '46.2392', '');
INSERT INTO `t_order_region` VALUES ('783', '230826', '230800', '桦川县', '中国,黑龙江省,佳木斯市,桦川县', '桦川', '中国,黑龙江,佳木斯,桦川', '3', '0454', '154300', 'Huachuan', 'HC', 'H', '130.719', '47.023', '');
INSERT INTO `t_order_region` VALUES ('784', '230828', '230800', '汤原县', '中国,黑龙江省,佳木斯市,汤原县', '汤原', '中国,黑龙江,佳木斯,汤原', '3', '0454', '154700', 'Tangyuan', 'TY', 'T', '129.91', '46.7276', '');
INSERT INTO `t_order_region` VALUES ('785', '230881', '230800', '同江市', '中国,黑龙江省,佳木斯市,同江市', '同江', '中国,黑龙江,佳木斯,同江', '3', '0454', '156400', 'Tongjiang', 'TJ', 'T', '132.511', '47.6421', '');
INSERT INTO `t_order_region` VALUES ('786', '230882', '230800', '富锦市', '中国,黑龙江省,佳木斯市,富锦市', '富锦', '中国,黑龙江,佳木斯,富锦', '3', '0454', '156100', 'Fujin', 'FJ', 'F', '132.037', '47.2513', '');
INSERT INTO `t_order_region` VALUES ('787', '230883', '230800', '抚远市', '中国,黑龙江省,佳木斯市,抚远市', '抚远', '中国,黑龙江,佳木斯,抚远', '3', '0454', '156500', 'Fuyuan', 'FY', 'F', '134.296', '48.3679', '');
INSERT INTO `t_order_region` VALUES ('788', '230900', '230000', '七台河市', '中国,黑龙江省,七台河市', '七台河', '中国,黑龙江,七台河', '2', '0464', '154600', 'Qitaihe', 'QTH', 'Q', '131.016', '45.7713', '');
INSERT INTO `t_order_region` VALUES ('789', '230902', '230900', '新兴区', '中国,黑龙江省,七台河市,新兴区', '新兴', '中国,黑龙江,七台河,新兴', '3', '0464', '154600', 'Xinxing', 'XX', 'X', '130.932', '45.8162', '');
INSERT INTO `t_order_region` VALUES ('790', '230903', '230900', '桃山区', '中国,黑龙江省,七台河市,桃山区', '桃山', '中国,黑龙江,七台河,桃山', '3', '0464', '154600', 'Taoshan', 'TS', 'T', '131.018', '45.7678', '');
INSERT INTO `t_order_region` VALUES ('791', '230904', '230900', '茄子河区', '中国,黑龙江省,七台河市,茄子河区', '茄子河', '中国,黑龙江,七台河,茄子河', '3', '0464', '154600', 'Qiezihe', 'QZH', 'Q', '131.068', '45.7852', '');
INSERT INTO `t_order_region` VALUES ('792', '230921', '230900', '勃利县', '中国,黑龙江省,七台河市,勃利县', '勃利', '中国,黑龙江,七台河,勃利', '3', '0464', '154500', 'Boli', 'BL', 'B', '130.592', '45.755', '');
INSERT INTO `t_order_region` VALUES ('793', '231000', '230000', '牡丹江市', '中国,黑龙江省,牡丹江市', '牡丹江', '中国,黑龙江,牡丹江', '2', '0453', '157000', 'Mudanjiang', 'MDJ', 'M', '129.619', '44.583', '');
INSERT INTO `t_order_region` VALUES ('794', '231002', '231000', '东安区', '中国,黑龙江省,牡丹江市,东安区', '东安', '中国,黑龙江,牡丹江,东安', '3', '0453', '157000', 'Dong\'an', 'DA', 'D', '129.627', '44.5813', '');
INSERT INTO `t_order_region` VALUES ('795', '231003', '231000', '阳明区', '中国,黑龙江省,牡丹江市,阳明区', '阳明', '中国,黑龙江,牡丹江,阳明', '3', '0453', '157000', 'Yangming', 'YM', 'Y', '129.635', '44.596', '');
INSERT INTO `t_order_region` VALUES ('796', '231004', '231000', '爱民区', '中国,黑龙江省,牡丹江市,爱民区', '爱民', '中国,黑龙江,牡丹江,爱民', '3', '0453', '157000', 'Aimin', 'AM', 'A', '129.591', '44.5965', '');
INSERT INTO `t_order_region` VALUES ('797', '231005', '231000', '西安区', '中国,黑龙江省,牡丹江市,西安区', '西安', '中国,黑龙江,牡丹江,西安', '3', '0453', '157000', 'Xi\'an', 'XA', 'X', '129.616', '44.5777', '');
INSERT INTO `t_order_region` VALUES ('798', '231025', '231000', '林口县', '中国,黑龙江省,牡丹江市,林口县', '林口', '中国,黑龙江,牡丹江,林口', '3', '0453', '157600', 'Linkou', 'LK', 'L', '130.284', '45.2781', '');
INSERT INTO `t_order_region` VALUES ('799', '231081', '231000', '绥芬河市', '中国,黑龙江省,牡丹江市,绥芬河市', '绥芬河', '中国,黑龙江,牡丹江,绥芬河', '3', '0453', '157300', 'Suifenhe', 'SFH', 'S', '131.151', '44.4125', '');
INSERT INTO `t_order_region` VALUES ('800', '231083', '231000', '海林市', '中国,黑龙江省,牡丹江市,海林市', '海林', '中国,黑龙江,牡丹江,海林', '3', '0453', '157100', 'Hailin', 'HL', 'H', '129.382', '44.59', '');
INSERT INTO `t_order_region` VALUES ('801', '231084', '231000', '宁安市', '中国,黑龙江省,牡丹江市,宁安市', '宁安', '中国,黑龙江,牡丹江,宁安', '3', '0453', '157400', 'Ning\'an', 'NA', 'N', '129.483', '44.3402', '');
INSERT INTO `t_order_region` VALUES ('802', '231085', '231000', '穆棱市', '中国,黑龙江省,牡丹江市,穆棱市', '穆棱', '中国,黑龙江,牡丹江,穆棱', '3', '0453', '157500', 'Muling', 'ML', 'M', '130.525', '44.919', '');
INSERT INTO `t_order_region` VALUES ('803', '231086', '231000', '东宁市', '中国,黑龙江省,牡丹江市,东宁市', '东宁', '中国,黑龙江,牡丹江,东宁', '3', '0453', '157200', 'Dongning', 'DN', 'D', '131.128', '44.0661', '');
INSERT INTO `t_order_region` VALUES ('804', '231100', '230000', '黑河市', '中国,黑龙江省,黑河市', '黑河', '中国,黑龙江,黑河', '2', '0456', '164300', 'Heihe', 'HH', 'H', '127.499', '50.2496', '');
INSERT INTO `t_order_region` VALUES ('805', '231102', '231100', '爱辉区', '中国,黑龙江省,黑河市,爱辉区', '爱辉', '中国,黑龙江,黑河,爱辉', '3', '0456', '164300', 'Aihui', 'AH', 'A', '127.501', '50.252', '');
INSERT INTO `t_order_region` VALUES ('806', '231121', '231100', '嫩江县', '中国,黑龙江省,黑河市,嫩江县', '嫩江', '中国,黑龙江,黑河,嫩江', '3', '0456', '161400', 'Nenjiang', 'NJ', 'N', '125.226', '49.1784', '');
INSERT INTO `t_order_region` VALUES ('807', '231123', '231100', '逊克县', '中国,黑龙江省,黑河市,逊克县', '逊克', '中国,黑龙江,黑河,逊克', '3', '0456', '164400', 'Xunke', 'XK', 'X', '128.479', '49.5798', '');
INSERT INTO `t_order_region` VALUES ('808', '231124', '231100', '孙吴县', '中国,黑龙江省,黑河市,孙吴县', '孙吴', '中国,黑龙江,黑河,孙吴', '3', '0456', '164200', 'Sunwu', 'SW', 'S', '127.336', '49.4254', '');
INSERT INTO `t_order_region` VALUES ('809', '231181', '231100', '北安市', '中国,黑龙江省,黑河市,北安市', '北安', '中国,黑龙江,黑河,北安', '3', '0456', '164000', 'Bei\'an', 'BA', 'B', '126.482', '48.2387', '');
INSERT INTO `t_order_region` VALUES ('810', '231182', '231100', '五大连池市', '中国,黑龙江省,黑河市,五大连池市', '五大连池', '中国,黑龙江,黑河,五大连池', '3', '0456', '164100', 'Wudalianchi', 'WDLC', 'W', '126.203', '48.5151', '');
INSERT INTO `t_order_region` VALUES ('811', '231200', '230000', '绥化市', '中国,黑龙江省,绥化市', '绥化', '中国,黑龙江,绥化', '2', '0455', '152000', 'Suihua', 'SH', 'S', '126.993', '46.6374', '');
INSERT INTO `t_order_region` VALUES ('812', '231202', '231200', '北林区', '中国,黑龙江省,绥化市,北林区', '北林', '中国,黑龙江,绥化,北林', '3', '0455', '152000', 'Beilin', 'BL', 'B', '126.986', '46.6373', '');
INSERT INTO `t_order_region` VALUES ('813', '231221', '231200', '望奎县', '中国,黑龙江省,绥化市,望奎县', '望奎', '中国,黑龙江,绥化,望奎', '3', '0455', '152100', 'Wangkui', 'WK', 'W', '126.482', '46.8308', '');
INSERT INTO `t_order_region` VALUES ('814', '231222', '231200', '兰西县', '中国,黑龙江省,绥化市,兰西县', '兰西', '中国,黑龙江,绥化,兰西', '3', '0455', '151500', 'Lanxi', 'LX', 'L', '126.29', '46.2525', '');
INSERT INTO `t_order_region` VALUES ('815', '231223', '231200', '青冈县', '中国,黑龙江省,绥化市,青冈县', '青冈', '中国,黑龙江,绥化,青冈', '3', '0455', '151600', 'Qinggang', 'QG', 'Q', '126.113', '46.6853', '');
INSERT INTO `t_order_region` VALUES ('816', '231224', '231200', '庆安县', '中国,黑龙江省,绥化市,庆安县', '庆安', '中国,黑龙江,绥化,庆安', '3', '0455', '152400', 'Qing\'an', 'QA', 'Q', '127.508', '46.8802', '');
INSERT INTO `t_order_region` VALUES ('817', '231225', '231200', '明水县', '中国,黑龙江省,绥化市,明水县', '明水', '中国,黑龙江,绥化,明水', '3', '0455', '151700', 'Mingshui', 'MS', 'M', '125.906', '47.1733', '');
INSERT INTO `t_order_region` VALUES ('818', '231226', '231200', '绥棱县', '中国,黑龙江省,绥化市,绥棱县', '绥棱', '中国,黑龙江,绥化,绥棱', '3', '0455', '152200', 'Suileng', 'SL', 'S', '127.116', '47.2427', '');
INSERT INTO `t_order_region` VALUES ('819', '231281', '231200', '安达市', '中国,黑龙江省,绥化市,安达市', '安达', '中国,黑龙江,绥化,安达', '3', '0455', '151400', 'Anda', 'AD', 'A', '125.344', '46.4177', '');
INSERT INTO `t_order_region` VALUES ('820', '231282', '231200', '肇东市', '中国,黑龙江省,绥化市,肇东市', '肇东', '中国,黑龙江,绥化,肇东', '3', '0455', '151100', 'Zhaodong', 'ZD', 'Z', '125.962', '46.0513', '');
INSERT INTO `t_order_region` VALUES ('821', '231283', '231200', '海伦市', '中国,黑龙江省,绥化市,海伦市', '海伦', '中国,黑龙江,绥化,海伦', '3', '0455', '152300', 'Hailun', 'HL', 'H', '126.968', '47.4609', '');
INSERT INTO `t_order_region` VALUES ('822', '232700', '230000', '大兴安岭地区', '中国,黑龙江省,大兴安岭地区', '大兴安岭', '中国,黑龙江,大兴安岭', '2', '0457', '165000', 'DaXingAnLing', 'DXAL', 'D', '124.712', '52.3353', '');
INSERT INTO `t_order_region` VALUES ('823', '232701', '232700', '加格达奇区', '中国,黑龙江省,大兴安岭地区,加格达奇区', '加格达奇', '中国,黑龙江,大兴安岭,加格达奇', '3', '0457', '165000', 'Jiagedaqi', 'JGDQ', 'J', '124.31', '51.9814', '政企合一');
INSERT INTO `t_order_region` VALUES ('824', '232702', '232700', '新林区', '中国,黑龙江省,大兴安岭地区,新林区', '新林', '中国,黑龙江,大兴安岭,新林', '3', '0457', '165010', 'Xinlin', 'XL', 'X', '124.398', '51.6734', '政企合一');
INSERT INTO `t_order_region` VALUES ('825', '232703', '232700', '松岭区', '中国,黑龙江省,大兴安岭地区,松岭区', '松岭', '中国,黑龙江,大兴安岭,松岭', '3', '0457', '165020', 'Songling', 'SL', 'S', '124.19', '51.9855', '政企合一');
INSERT INTO `t_order_region` VALUES ('826', '232704', '232700', '呼中区', '中国,黑龙江省,大兴安岭地区,呼中区', '呼中', '中国,黑龙江,大兴安岭,呼中', '3', '0457', '165030', 'Huzhong', 'HZ', 'H', '123.6', '52.0335', '政企合一');
INSERT INTO `t_order_region` VALUES ('827', '232721', '232700', '呼玛县', '中国,黑龙江省,大兴安岭地区,呼玛县', '呼玛', '中国,黑龙江,大兴安岭,呼玛', '3', '0457', '165100', 'Huma', 'HM', 'H', '126.662', '51.7311', '');
INSERT INTO `t_order_region` VALUES ('828', '232722', '232700', '塔河县', '中国,黑龙江省,大兴安岭地区,塔河县', '塔河', '中国,黑龙江,大兴安岭,塔河', '3', '0457', '165200', 'Tahe', 'TH', 'T', '124.71', '52.3343', '');
INSERT INTO `t_order_region` VALUES ('829', '232723', '232700', '漠河县', '中国,黑龙江省,大兴安岭地区,漠河县', '漠河', '中国,黑龙江,大兴安岭,漠河', '3', '0457', '165300', 'Mohe', 'MH', 'M', '122.538', '52.97', '');
INSERT INTO `t_order_region` VALUES ('830', '310000', '100000', '上海', '中国,上海', '上海', '中国,上海', '1', '', '', 'Shanghai', 'SH', 'S', '121.473', '31.2317', '');
INSERT INTO `t_order_region` VALUES ('831', '310100', '310000', '上海市', '中国,上海,上海市', '上海', '中国,上海,上海', '2', '021', '200000', 'Shanghai', 'SH', 'S', '121.473', '31.2317', '');
INSERT INTO `t_order_region` VALUES ('832', '310101', '310100', '黄浦区', '中国,上海,上海市,黄浦区', '黄浦', '中国,上海,上海,黄浦', '3', '021', '200001', 'Huangpu', 'HP', 'H', '121.493', '31.2234', '');
INSERT INTO `t_order_region` VALUES ('833', '310104', '310100', '徐汇区', '中国,上海,上海市,徐汇区', '徐汇', '中国,上海,上海,徐汇', '3', '021', '200030', 'Xuhui', 'XH', 'X', '121.437', '31.1883', '');
INSERT INTO `t_order_region` VALUES ('834', '310105', '310100', '长宁区', '中国,上海,上海市,长宁区', '长宁', '中国,上海,上海,长宁', '3', '021', '200050', 'Changning', 'CN', 'C', '121.425', '31.2204', '');
INSERT INTO `t_order_region` VALUES ('835', '310106', '310100', '静安区', '中国,上海,上海市,静安区', '静安', '中国,上海,上海,静安', '3', '021', '200040', 'Jing\'an', 'JA', 'J', '121.444', '31.2288', '');
INSERT INTO `t_order_region` VALUES ('836', '310107', '310100', '普陀区', '中国,上海,上海市,普陀区', '普陀', '中国,上海,上海,普陀', '3', '021', '200333', 'Putuo', 'PT', 'P', '121.397', '31.2495', '');
INSERT INTO `t_order_region` VALUES ('837', '310109', '310100', '虹口区', '中国,上海,上海市,虹口区', '虹口', '中国,上海,上海,虹口', '3', '021', '200080', 'Hongkou', 'HK', 'H', '121.482', '31.2779', '');
INSERT INTO `t_order_region` VALUES ('838', '310110', '310100', '杨浦区', '中国,上海,上海市,杨浦区', '杨浦', '中国,上海,上海,杨浦', '3', '021', '200082', 'Yangpu', 'YP', 'Y', '121.526', '31.2595', '');
INSERT INTO `t_order_region` VALUES ('839', '310112', '310100', '闵行区', '中国,上海,上海市,闵行区', '闵行', '中国,上海,上海,闵行', '3', '021', '201100', 'Minhang', 'MH', 'M', '121.382', '31.1125', '');
INSERT INTO `t_order_region` VALUES ('840', '310113', '310100', '宝山区', '中国,上海,上海市,宝山区', '宝山', '中国,上海,上海,宝山', '3', '021', '201900', 'Baoshan', 'BS', 'B', '121.489', '31.4045', '');
INSERT INTO `t_order_region` VALUES ('841', '310114', '310100', '嘉定区', '中国,上海,上海市,嘉定区', '嘉定', '中国,上海,上海,嘉定', '3', '021', '201800', 'Jiading', 'JD', 'J', '121.266', '31.3747', '');
INSERT INTO `t_order_region` VALUES ('842', '310115', '310100', '浦东新区', '中国,上海,上海市,浦东新区', '浦东', '中国,上海,上海,浦东', '3', '021', '200120', 'Pudong', 'PD', 'P', '121.545', '31.2225', '国家级新区');
INSERT INTO `t_order_region` VALUES ('843', '310116', '310100', '金山区', '中国,上海,上海市,金山区', '金山', '中国,上海,上海,金山', '3', '021', '201500', 'Jinshan', 'JS', 'J', '121.342', '30.7416', '');
INSERT INTO `t_order_region` VALUES ('844', '310117', '310100', '松江区', '中国,上海,上海市,松江区', '松江', '中国,上海,上海,松江', '3', '021', '201600', 'Songjiang', 'SJ', 'S', '121.229', '31.0322', '');
INSERT INTO `t_order_region` VALUES ('845', '310118', '310100', '青浦区', '中国,上海,上海市,青浦区', '青浦', '中国,上海,上海,青浦', '3', '021', '201700', 'Qingpu', 'QP', 'Q', '121.124', '31.1497', '');
INSERT INTO `t_order_region` VALUES ('846', '310120', '310100', '奉贤区', '中国,上海,上海市,奉贤区', '奉贤', '中国,上海,上海,奉贤', '3', '021', '201400', 'Fengxian', 'FX', 'F', '121.474', '30.9179', '');
INSERT INTO `t_order_region` VALUES ('847', '310151', '310100', '崇明区', '中国,上海,上海市,崇明区', '崇明', '中国,上海,上海,崇明', '3', '021', '202150', 'Chongming', 'CM', 'C', '121.398', '31.6228', '');
INSERT INTO `t_order_region` VALUES ('848', '310231', '310100', '张江高新区', '中国,上海,上海市,张江高新区', '张江高新区', '中国,上海,上海,张江高新区', '3', '021', '201203', 'Zhangjiang', 'ZJ', 'Z', '121.635', '31.2194', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('849', '310232', '310100', '紫竹高新区', '中国,上海,上海市,紫竹高新区', '紫竹高新区', '中国,上海,上海,紫竹高新区', '3', '021', '200336', 'Zizhu', 'ZZ', 'Z', '121.449', '31.0218', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('850', '310233', '310100', '漕河泾开发区', '中国,上海,上海市,漕河泾开发区', '漕河泾开发区', '中国,上海,上海,漕河泾开发区', '3', '021', '200233', 'Caohejing', 'CHJ', 'C', '121.398', '31.1706', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('851', '320000', '100000', '江苏省', '中国,江苏省', '江苏', '中国,江苏', '1', '', '', 'Jiangsu', 'JS', 'J', '118.767', '32.0415', '');
INSERT INTO `t_order_region` VALUES ('852', '320100', '320000', '南京市', '中国,江苏省,南京市', '南京', '中国,江苏,南京', '2', '025', '210000', 'Nanjing', 'NJ', 'N', '118.767', '32.0415', '');
INSERT INTO `t_order_region` VALUES ('853', '320102', '320100', '玄武区', '中国,江苏省,南京市,玄武区', '玄武', '中国,江苏,南京,玄武', '3', '025', '210000', 'Xuanwu', 'XW', 'X', '118.798', '32.0486', '');
INSERT INTO `t_order_region` VALUES ('854', '320104', '320100', '秦淮区', '中国,江苏省,南京市,秦淮区', '秦淮', '中国,江苏,南京,秦淮', '3', '025', '210000', 'Qinhuai', 'QH', 'Q', '118.798', '32.0111', '');
INSERT INTO `t_order_region` VALUES ('855', '320105', '320100', '建邺区', '中国,江苏省,南京市,建邺区', '建邺', '中国,江苏,南京,建邺', '3', '025', '210000', 'Jianye', 'JY', 'J', '118.766', '32.031', '');
INSERT INTO `t_order_region` VALUES ('856', '320106', '320100', '鼓楼区', '中国,江苏省,南京市,鼓楼区', '鼓楼', '中国,江苏,南京,鼓楼', '3', '025', '210000', 'Gulou', 'GL', 'G', '118.77', '32.0663', '');
INSERT INTO `t_order_region` VALUES ('857', '320111', '320100', '浦口区', '中国,江苏省,南京市,浦口区', '浦口', '中国,江苏,南京,浦口', '3', '025', '210000', 'Pukou', 'PK', 'P', '118.628', '32.0588', '');
INSERT INTO `t_order_region` VALUES ('858', '320113', '320100', '栖霞区', '中国,江苏省,南京市,栖霞区', '栖霞', '中国,江苏,南京,栖霞', '3', '025', '210000', 'Qixia', 'QX', 'Q', '118.881', '32.1135', '');
INSERT INTO `t_order_region` VALUES ('859', '320114', '320100', '雨花台区', '中国,江苏省,南京市,雨花台区', '雨花台', '中国,江苏,南京,雨花台', '3', '025', '210000', 'Yuhuatai', 'YHT', 'Y', '118.78', '31.992', '');
INSERT INTO `t_order_region` VALUES ('860', '320115', '320100', '江宁区', '中国,江苏省,南京市,江宁区', '江宁', '中国,江苏,南京,江宁', '3', '025', '211100', 'Jiangning', 'JN', 'J', '118.84', '31.9526', '');
INSERT INTO `t_order_region` VALUES ('861', '320116', '320100', '六合区', '中国,江苏省,南京市,六合区', '六合', '中国,江苏,南京,六合', '3', '025', '211500', 'Luhe', 'LH', 'L', '118.841', '32.3422', '');
INSERT INTO `t_order_region` VALUES ('862', '320117', '320100', '溧水区', '中国,江苏省,南京市,溧水区', '溧水', '中国,江苏,南京,溧水', '3', '025', '211200', 'Lishui', 'LS', 'L', '119.029', '31.6531', '');
INSERT INTO `t_order_region` VALUES ('863', '320118', '320100', '高淳区', '中国,江苏省,南京市,高淳区', '高淳', '中国,江苏,南京,高淳', '3', '025', '211300', 'Gaochun', 'GC', 'G', '118.876', '31.3271', '');
INSERT INTO `t_order_region` VALUES ('864', '320119', '320100', '江北新区', '中国,江苏省,南京市,江北新区', '江北新区', '中国,江苏,南京,江北新区', '3', '025', '211500', 'JiangbeiXinqu', 'JBXQ', 'J', '118.809', '32.1692', '国家级新区');
INSERT INTO `t_order_region` VALUES ('865', '320120', '320100', '高新区', '中国,江苏省,南京市,高新区', '高新区', '中国,江苏,南京,高新区', '3', '025', '210000', 'GaoXinQu', 'GXQ', 'G', '118.713', '32.171', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('866', '320200', '320000', '无锡市', '中国,江苏省,无锡市', '无锡', '中国,江苏,无锡', '2', '0510', '214000', 'Wuxi', 'WX', 'W', '120.302', '31.5747', '');
INSERT INTO `t_order_region` VALUES ('867', '320205', '320200', '锡山区', '中国,江苏省,无锡市,锡山区', '锡山', '中国,江苏,无锡,锡山', '3', '0510', '214000', 'Xishan', 'XS', 'X', '120.357', '31.5886', '');
INSERT INTO `t_order_region` VALUES ('868', '320206', '320200', '惠山区', '中国,江苏省,无锡市,惠山区', '惠山', '中国,江苏,无锡,惠山', '3', '0510', '214000', 'Huishan', 'HS', 'H', '120.298', '31.6809', '');
INSERT INTO `t_order_region` VALUES ('869', '320211', '320200', '滨湖区', '中国,江苏省,无锡市,滨湖区', '滨湖', '中国,江苏,无锡,滨湖', '3', '0510', '214123', 'Binhu', 'BH', 'B', '120.295', '31.5216', '');
INSERT INTO `t_order_region` VALUES ('870', '320213', '320200', '梁溪区', '中国,江苏省,无锡市,梁溪区', '梁溪', '中国,江苏,无锡,梁溪', '3', '0510', '214002', 'LiangXi', 'LX', 'L', '120.3', '31.58', '');
INSERT INTO `t_order_region` VALUES ('871', '320214', '320200', '新吴区', '中国,江苏省,无锡市,新吴区', '新吴', '中国,江苏,无锡,新吴', '3', '0510', '214028', 'XinWu', 'XW', 'X', '120.364', '31.4908', '新区');
INSERT INTO `t_order_region` VALUES ('872', '320281', '320200', '江阴市', '中国,江苏省,无锡市,江阴市', '江阴', '中国,江苏,无锡,江阴', '3', '0510', '214400', 'Jiangyin', 'JY', 'J', '120.285', '31.92', '');
INSERT INTO `t_order_region` VALUES ('873', '320282', '320200', '宜兴市', '中国,江苏省,无锡市,宜兴市', '宜兴', '中国,江苏,无锡,宜兴', '3', '0510', '214200', 'Yixing', 'YX', 'Y', '119.824', '31.3398', '');
INSERT INTO `t_order_region` VALUES ('874', '320300', '320000', '徐州市', '中国,江苏省,徐州市', '徐州', '中国,江苏,徐州', '2', '0516', '221000', 'Xuzhou', 'XZ', 'X', '117.185', '34.2618', '');
INSERT INTO `t_order_region` VALUES ('875', '320302', '320300', '鼓楼区', '中国,江苏省,徐州市,鼓楼区', '鼓楼', '中国,江苏,徐州,鼓楼', '3', '0516', '221005', 'Gulou', 'GL', 'G', '117.186', '34.2885', '');
INSERT INTO `t_order_region` VALUES ('876', '320303', '320300', '云龙区', '中国,江苏省,徐州市,云龙区', '云龙', '中国,江苏,徐州,云龙', '3', '0516', '221007', 'Yunlong', 'YL', 'Y', '117.231', '34.249', '');
INSERT INTO `t_order_region` VALUES ('877', '320305', '320300', '贾汪区', '中国,江苏省,徐州市,贾汪区', '贾汪', '中国,江苏,徐州,贾汪', '3', '0516', '221003', 'Jiawang', 'JW', 'J', '117.453', '34.4426', '');
INSERT INTO `t_order_region` VALUES ('878', '320311', '320300', '泉山区', '中国,江苏省,徐州市,泉山区', '泉山', '中国,江苏,徐州,泉山', '3', '0516', '221006', 'Quanshan', 'QS', 'Q', '117.194', '34.2442', '');
INSERT INTO `t_order_region` VALUES ('879', '320312', '320300', '铜山区', '中国,江苏省,徐州市,铜山区', '铜山', '中国,江苏,徐州,铜山', '3', '0516', '221106', 'Tongshan', 'TS', 'T', '117.184', '34.1929', '');
INSERT INTO `t_order_region` VALUES ('880', '320321', '320300', '丰县', '中国,江苏省,徐州市,丰县', '丰县', '中国,江苏,徐州,丰县', '3', '0516', '221700', 'Fengxian', 'FX', 'F', '116.6', '34.6997', '');
INSERT INTO `t_order_region` VALUES ('881', '320322', '320300', '沛县', '中国,江苏省,徐州市,沛县', '沛县', '中国,江苏,徐州,沛县', '3', '0516', '221600', 'Peixian', 'PX', 'P', '116.937', '34.7216', '');
INSERT INTO `t_order_region` VALUES ('882', '320324', '320300', '睢宁县', '中国,江苏省,徐州市,睢宁县', '睢宁', '中国,江苏,徐州,睢宁', '3', '0516', '221200', 'Suining', 'SN', 'S', '117.941', '33.9127', '');
INSERT INTO `t_order_region` VALUES ('883', '320381', '320300', '新沂市', '中国,江苏省,徐州市,新沂市', '新沂', '中国,江苏,徐州,新沂', '3', '0516', '221400', 'Xinyi', 'XY', 'X', '118.355', '34.3694', '');
INSERT INTO `t_order_region` VALUES ('884', '320382', '320300', '邳州市', '中国,江苏省,徐州市,邳州市', '邳州', '中国,江苏,徐州,邳州', '3', '0516', '221300', 'Pizhou', 'PZ', 'P', '117.959', '34.3333', '');
INSERT INTO `t_order_region` VALUES ('885', '320383', '320300', '经济技术开发区', '中国,江苏省,徐州市,经济技术开发区', '经济技术开发区', '中国,江苏,徐州,经济技术开发区', '3', '0516', '221000', 'Jingjikaifaqu', 'JJ', 'J', '117.279', '34.2654', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('886', '320384', '320300', '高新技术产业开发区', '中国,江苏省,徐州市,高新技术产业开发区', '高新区', '中国,江苏,徐州,高新区', '3', '0516', '221100', 'Gaoxinqu', 'GXQ', 'G', '117.181', '34.1627', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('887', '320385', '320300', '软件园', '中国,江苏省,徐州市,软件园', '软件园', '中国,江苏,徐州,软件园', '3', '0516', '221100', 'Ruanjianyuan', 'RJY', 'R', '117.202', '34.2261', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('888', '320400', '320000', '常州市', '中国,江苏省,常州市', '常州', '中国,江苏,常州', '2', '0519', '213000', 'Changzhou', 'CZ', 'C', '119.947', '31.7728', '');
INSERT INTO `t_order_region` VALUES ('889', '320402', '320400', '天宁区', '中国,江苏省,常州市,天宁区', '天宁', '中国,江苏,常州,天宁', '3', '0519', '213000', 'Tianning', 'TN', 'T', '119.951', '31.7521', '');
INSERT INTO `t_order_region` VALUES ('890', '320404', '320400', '钟楼区', '中国,江苏省,常州市,钟楼区', '钟楼', '中国,江苏,常州,钟楼', '3', '0519', '213000', 'Zhonglou', 'ZL', 'Z', '119.902', '31.8022', '');
INSERT INTO `t_order_region` VALUES ('891', '320411', '320400', '新北区', '中国,江苏省,常州市,新北区', '新北', '中国,江苏,常州,新北', '3', '0519', '213022', 'Xinbei', 'XB', 'X', '119.971', '31.8305', '');
INSERT INTO `t_order_region` VALUES ('892', '320412', '320400', '武进区', '中国,江苏省,常州市,武进区', '武进', '中国,江苏,常州,武进', '3', '0519', '213100', 'Wujin', 'WJ', 'W', '119.942', '31.7009', '');
INSERT INTO `t_order_region` VALUES ('893', '320413', '320400', '金坛区', '中国,江苏省,常州市,金坛区', '金坛', '中国,江苏,常州,金坛', '3', '0519', '213200', 'Jintan', 'JT', 'J', '119.578', '31.7404', '');
INSERT INTO `t_order_region` VALUES ('894', '320481', '320400', '溧阳市', '中国,江苏省,常州市,溧阳市', '溧阳', '中国,江苏,常州,溧阳', '3', '0519', '213300', 'Liyang', 'LY', 'L', '119.484', '31.4154', '');
INSERT INTO `t_order_region` VALUES ('895', '320482', '320400', '高新区', '中国,江苏省,常州市,高新区', '高新区', '中国,江苏,常州,高新区', '3', '0519', '213000', 'Gaoxinqu', 'GXQ', 'G', '119.973', '31.829', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('896', '320500', '320000', '苏州市', '中国,江苏省,苏州市', '苏州', '中国,江苏,苏州', '2', '0512', '215000', 'Suzhou', 'SZ', 'S', '120.62', '31.2994', '');
INSERT INTO `t_order_region` VALUES ('897', '320505', '320500', '虎丘区', '中国,江苏省,苏州市,虎丘区', '虎丘', '中国,江苏,苏州,虎丘', '3', '0512', '215000', 'Huqiu', 'HQ', 'H', '120.573', '31.2953', '');
INSERT INTO `t_order_region` VALUES ('898', '320506', '320500', '吴中区', '中国,江苏省,苏州市,吴中区', '吴中', '中国,江苏,苏州,吴中', '3', '0512', '215100', 'Wuzhong', 'WZ', 'W', '120.632', '31.2623', '');
INSERT INTO `t_order_region` VALUES ('899', '320507', '320500', '相城区', '中国,江苏省,苏州市,相城区', '相城', '中国,江苏,苏州,相城', '3', '0512', '215100', 'Xiangcheng', 'XC', 'X', '120.642', '31.3689', '');
INSERT INTO `t_order_region` VALUES ('900', '320508', '320500', '姑苏区', '中国,江苏省,苏州市,姑苏区', '姑苏', '中国,江苏,苏州,姑苏', '3', '0512', '215031', 'Gusu', 'GS', 'G', '120.62', '31.2994', '');
INSERT INTO `t_order_region` VALUES ('901', '320509', '320500', '吴江区', '中国,江苏省,苏州市,吴江区', '吴江', '中国,江苏,苏州,吴江', '3', '0512', '215200', 'Wujiang', 'WJ', 'W', '120.638', '31.1598', '');
INSERT INTO `t_order_region` VALUES ('902', '320581', '320500', '常熟市', '中国,江苏省,苏州市,常熟市', '常熟', '中国,江苏,苏州,常熟', '3', '0512', '215500', 'Changshu', 'CS', 'C', '120.752', '31.6537', '');
INSERT INTO `t_order_region` VALUES ('903', '320582', '320500', '张家港市', '中国,江苏省,苏州市,张家港市', '张家港', '中国,江苏,苏州,张家港', '3', '0512', '215600', 'Zhangjiagang', 'ZJG', 'Z', '120.555', '31.8753', '');
INSERT INTO `t_order_region` VALUES ('904', '320583', '320500', '昆山市', '中国,江苏省,苏州市,昆山市', '昆山', '中国,江苏,苏州,昆山', '3', '0512', '215300', 'Kunshan', 'KS', 'K', '120.981', '31.3846', '');
INSERT INTO `t_order_region` VALUES ('905', '320585', '320500', '太仓市', '中国,江苏省,苏州市,太仓市', '太仓', '中国,江苏,苏州,太仓', '3', '0512', '215400', 'Taicang', 'TC', 'T', '121.109', '31.4497', '');
INSERT INTO `t_order_region` VALUES ('906', '320586', '320500', '苏州新区', '中国,江苏省,苏州市,苏州新区', '苏州新区', '中国,江苏,苏州,苏州新区', '3', '0512', '215010', 'Suzhouxinqu', 'SZXQ', 'S', '120.524', '31.3724', '新区');
INSERT INTO `t_order_region` VALUES ('907', '320587', '320500', '工业园区', '中国,江苏省,苏州市,工业园区', '工业园区', '中国,江苏,苏州,工业园区', '3', '0512', '215000', 'GongyeYuanqu', 'GYYQ', 'G', '120.672', '31.318', '工业园区');
INSERT INTO `t_order_region` VALUES ('908', '320588', '320500', '高新区', '中国,江苏省,苏州市,高新区', '高新区', '中国,江苏,苏州,高新区', '3', '0512', '215010', 'Gaoxinqu', 'GXQ', 'G', '120.434', '31.3276', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('909', '320600', '320000', '南通市', '中国,江苏省,南通市', '南通', '中国,江苏,南通', '2', '0513', '226000', 'Nantong', 'NT', 'N', '120.865', '32.0162', '');
INSERT INTO `t_order_region` VALUES ('910', '320602', '320600', '崇川区', '中国,江苏省,南通市,崇川区', '崇川', '中国,江苏,南通,崇川', '3', '0513', '226000', 'Chongchuan', 'CC', 'C', '120.857', '32.0098', '');
INSERT INTO `t_order_region` VALUES ('911', '320611', '320600', '港闸区', '中国,江苏省,南通市,港闸区', '港闸', '中国,江苏,南通,港闸', '3', '0513', '226000', 'Gangzha', 'GZ', 'G', '120.818', '32.0316', '');
INSERT INTO `t_order_region` VALUES ('912', '320612', '320600', '通州区', '中国,江苏省,南通市,通州区', '通州', '中国,江苏,南通,通州', '3', '0513', '226300', 'Tongzhou', 'TZ', 'T', '121.073', '32.0676', '');
INSERT INTO `t_order_region` VALUES ('913', '320621', '320600', '海安县', '中国,江苏省,南通市,海安县', '海安', '中国,江苏,南通,海安', '3', '0513', '226600', 'Hai\'an', 'HA', 'H', '120.459', '32.5451', '');
INSERT INTO `t_order_region` VALUES ('914', '320623', '320600', '如东县', '中国,江苏省,南通市,如东县', '如东', '中国,江苏,南通,如东', '3', '0513', '226400', 'Rudong', 'RD', 'R', '121.189', '32.3144', '');
INSERT INTO `t_order_region` VALUES ('915', '320681', '320600', '启东市', '中国,江苏省,南通市,启东市', '启东', '中国,江苏,南通,启东', '3', '0513', '226200', 'Qidong', 'QD', 'Q', '121.66', '31.8108', '');
INSERT INTO `t_order_region` VALUES ('916', '320682', '320600', '如皋市', '中国,江苏省,南通市,如皋市', '如皋', '中国,江苏,南通,如皋', '3', '0513', '226500', 'Rugao', 'RG', 'R', '120.56', '32.376', '');
INSERT INTO `t_order_region` VALUES ('917', '320684', '320600', '海门市', '中国,江苏省,南通市,海门市', '海门', '中国,江苏,南通,海门', '3', '0513', '226100', 'Haimen', 'HM', 'H', '121.17', '31.8942', '');
INSERT INTO `t_order_region` VALUES ('918', '320685', '320600', '经济技术开发区', '中国,江苏省,南通市,经济技术开发区', '经济技术开发区', '中国,江苏,南通,经济技术开发区', '3', '0513', '226000', 'Jingjikaifaqu', 'JJKFQ', 'J', '120.958', '31.9247', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('919', '320700', '320000', '连云港市', '中国,江苏省,连云港市', '连云港', '中国,江苏,连云港', '2', '0518', '222000', 'Lianyungang', 'LYG', 'L', '119.179', '34.6', '');
INSERT INTO `t_order_region` VALUES ('920', '320703', '320700', '连云区', '中国,江苏省,连云港市,连云区', '连云', '中国,江苏,连云港,连云', '3', '0518', '222000', 'Lianyun', 'LY', 'L', '119.373', '34.7529', '');
INSERT INTO `t_order_region` VALUES ('921', '320706', '320700', '海州区', '中国,江苏省,连云港市,海州区', '海州', '中国,江苏,连云港,海州', '3', '0518', '222000', 'Haizhou', 'HZ', 'H', '119.131', '34.5699', '');
INSERT INTO `t_order_region` VALUES ('922', '320707', '320700', '赣榆区', '中国,江苏省,连云港市,赣榆区', '赣榆', '中国,江苏,连云港,赣榆', '3', '0518', '222100', 'Ganyu', 'GY', 'G', '119.129', '34.8392', '');
INSERT INTO `t_order_region` VALUES ('923', '320722', '320700', '东海县', '中国,江苏省,连云港市,东海县', '东海', '中国,江苏,连云港,东海', '3', '0518', '222300', 'Donghai', 'DH', 'D', '118.771', '34.5421', '');
INSERT INTO `t_order_region` VALUES ('924', '320723', '320700', '灌云县', '中国,江苏省,连云港市,灌云县', '灌云', '中国,江苏,连云港,灌云', '3', '0518', '222200', 'Guanyun', 'GY', 'G', '119.239', '34.2839', '');
INSERT INTO `t_order_region` VALUES ('925', '320724', '320700', '灌南县', '中国,江苏省,连云港市,灌南县', '灌南', '中国,江苏,连云港,灌南', '3', '0518', '223500', 'Guannan', 'GN', 'G', '119.356', '34.09', '');
INSERT INTO `t_order_region` VALUES ('926', '320725', '320700', '新海新区', '中国,江苏省,连云港市,新海新区', '新海新区', '中国,江苏,连云港,新海新区', '3', '0518', '222006', 'XinhaiXinqu', 'XHXQ', 'X', '119.233', '34.6371', '新区');
INSERT INTO `t_order_region` VALUES ('927', '320726', '320700', '连云新城', '中国,江苏省,连云港市,连云新城', '连云新城', '中国,江苏,连云港,连云新城', '3', '0518', '222000', 'LianyunXincheng', 'LYXC', 'L', '119.343', '34.7553', '新区');
INSERT INTO `t_order_region` VALUES ('928', '320727', '320700', '徐圩新区', '中国,江苏省,连云港市,徐圩新区', '徐圩新区', '中国,江苏,连云港,徐圩新区', '3', '0518', '222000', 'XuWeiXinqu', 'XWXQ', 'X', '119.524', '34.6197', '新区');
INSERT INTO `t_order_region` VALUES ('929', '320728', '320700', '济技术开发区', '中国,江苏省,连云港市,济技术开发区', '济技术开发区', '中国,江苏,连云港,济技术开发区', '3', '0518', '222000', 'Jingjikaifaqu', 'JJKFQ', 'J', '119.344', '34.6949', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('930', '320800', '320000', '淮安市', '中国,江苏省,淮安市', '淮安', '中国,江苏,淮安', '2', '0517', '223000', 'Huai\'an', 'HA', 'H', '119.021', '33.5975', '');
INSERT INTO `t_order_region` VALUES ('931', '320803', '320800', '淮安区', '中国,江苏省,淮安市,淮安区', '淮安', '中国,江苏,淮安,淮安', '3', '0517', '223200', 'Huai\'an', 'HA', 'H', '119.021', '33.5975', '');
INSERT INTO `t_order_region` VALUES ('932', '320804', '320800', '淮阴区', '中国,江苏省,淮安市,淮阴区', '淮阴', '中国,江苏,淮安,淮阴', '3', '0517', '223300', 'Huaiyin', 'HY', 'H', '119.035', '33.6317', '');
INSERT INTO `t_order_region` VALUES ('933', '320812', '320800', '清江浦区', '中国,江苏省,淮安市,清江浦区', '清江浦', '中国,江苏,淮安,清江浦', '3', '0517', '223001', 'Qingjiangpu', 'QJP', 'Q', '119.008', '33.5995', '');
INSERT INTO `t_order_region` VALUES ('934', '320813', '320800', '洪泽区', '中国,江苏省,淮安市,洪泽区', '洪泽', '中国,江苏,淮安,洪泽', '3', '0517', '223100', 'Hongze', 'HZ', 'H', '118.873', '33.2943', '');
INSERT INTO `t_order_region` VALUES ('935', '320826', '320800', '涟水县', '中国,江苏省,淮安市,涟水县', '涟水', '中国,江苏,淮安,涟水', '3', '0517', '223400', 'Lianshui', 'LS', 'L', '119.261', '33.7809', '');
INSERT INTO `t_order_region` VALUES ('936', '320830', '320800', '盱眙县', '中国,江苏省,淮安市,盱眙县', '盱眙', '中国,江苏,淮安,盱眙', '3', '0517', '211700', 'Xuyi', 'XY', 'X', '118.545', '33.0109', '');
INSERT INTO `t_order_region` VALUES ('937', '320831', '320800', '金湖县', '中国,江苏省,淮安市,金湖县', '金湖', '中国,江苏,淮安,金湖', '3', '0517', '211600', 'Jinhu', 'JH', 'J', '119.023', '33.0222', '');
INSERT INTO `t_order_region` VALUES ('938', '320832', '320800', '经济开发区', '中国,江苏省,淮安市,经济开发区', '经济开发区', '中国,江苏,淮安,经济开发区', '3', '0517', '223005', 'Jingjikaifaqu', 'JJKFQ', 'J', '119.023', '33.0222', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('939', '320900', '320000', '盐城市', '中国,江苏省,盐城市', '盐城', '中国,江苏,盐城', '2', '0515', '224000', 'Yancheng', 'YC', 'Y', '120.14', '33.3776', '');
INSERT INTO `t_order_region` VALUES ('940', '320902', '320900', '亭湖区', '中国,江苏省,盐城市,亭湖区', '亭湖', '中国,江苏,盐城,亭湖', '3', '0515', '224005', 'Tinghu', 'TH', 'T', '120.166', '33.3783', '');
INSERT INTO `t_order_region` VALUES ('941', '320903', '320900', '盐都区', '中国,江苏省,盐城市,盐都区', '盐都', '中国,江苏,盐城,盐都', '3', '0515', '224000', 'Yandu', 'YD', 'Y', '120.154', '33.3373', '');
INSERT INTO `t_order_region` VALUES ('942', '320904', '320900', '大丰区', '中国,江苏省,盐城市,大丰区', '大丰', '中国,江苏,盐城,大丰', '3', '0515', '224100', 'Dafeng', 'DF', 'D', '120.466', '33.1989', '');
INSERT INTO `t_order_region` VALUES ('943', '320921', '320900', '响水县', '中国,江苏省,盐城市,响水县', '响水', '中国,江苏,盐城,响水', '3', '0515', '224600', 'Xiangshui', 'XS', 'X', '119.57', '34.2051', '');
INSERT INTO `t_order_region` VALUES ('944', '320922', '320900', '滨海县', '中国,江苏省,盐城市,滨海县', '滨海', '中国,江苏,盐城,滨海', '3', '0515', '224500', 'Binhai', 'BH', 'B', '119.821', '33.9897', '');
INSERT INTO `t_order_region` VALUES ('945', '320923', '320900', '阜宁县', '中国,江苏省,盐城市,阜宁县', '阜宁', '中国,江苏,盐城,阜宁', '3', '0515', '224400', 'Funing', 'FN', 'F', '119.802', '33.7823', '');
INSERT INTO `t_order_region` VALUES ('946', '320924', '320900', '射阳县', '中国,江苏省,盐城市,射阳县', '射阳', '中国,江苏,盐城,射阳', '3', '0515', '224300', 'Sheyang', 'SY', 'S', '120.26', '33.7764', '');
INSERT INTO `t_order_region` VALUES ('947', '320925', '320900', '建湖县', '中国,江苏省,盐城市,建湖县', '建湖', '中国,江苏,盐城,建湖', '3', '0515', '224700', 'Jianhu', 'JH', 'J', '119.799', '33.4724', '');
INSERT INTO `t_order_region` VALUES ('948', '320981', '320900', '东台市', '中国,江苏省,盐城市,东台市', '东台', '中国,江苏,盐城,东台', '3', '0515', '224200', 'Dongtai', 'DT', 'D', '120.324', '32.8508', '');
INSERT INTO `t_order_region` VALUES ('949', '321000', '320000', '扬州市', '中国,江苏省,扬州市', '扬州', '中国,江苏,扬州', '2', '0514', '225000', 'Yangzhou', 'YZ', 'Y', '119.421', '32.3932', '');
INSERT INTO `t_order_region` VALUES ('950', '321002', '321000', '广陵区', '中国,江苏省,扬州市,广陵区', '广陵', '中国,江苏,扬州,广陵', '3', '0514', '225000', 'Guangling', 'GL', 'G', '119.432', '32.3947', '');
INSERT INTO `t_order_region` VALUES ('951', '321003', '321000', '邗江区', '中国,江苏省,扬州市,邗江区', '邗江', '中国,江苏,扬州,邗江', '3', '0514', '225100', 'Hanjiang', 'HJ', 'H', '119.398', '32.3765', '');
INSERT INTO `t_order_region` VALUES ('952', '321012', '321000', '江都区', '中国,江苏省,扬州市,江都区', '江都', '中国,江苏,扬州,江都', '3', '0514', '225200', 'Jiangdu', 'JD', 'J', '119.567', '32.4266', '');
INSERT INTO `t_order_region` VALUES ('953', '321023', '321000', '宝应县', '中国,江苏省,扬州市,宝应县', '宝应', '中国,江苏,扬州,宝应', '3', '0514', '225800', 'Baoying', 'BY', 'B', '119.312', '33.2355', '');
INSERT INTO `t_order_region` VALUES ('954', '321081', '321000', '仪征市', '中国,江苏省,扬州市,仪征市', '仪征', '中国,江苏,扬州,仪征', '3', '0514', '211400', 'Yizheng', 'YZ', 'Y', '119.184', '32.272', '');
INSERT INTO `t_order_region` VALUES ('955', '321084', '321000', '高邮市', '中国,江苏省,扬州市,高邮市', '高邮', '中国,江苏,扬州,高邮', '3', '0514', '225600', 'Gaoyou', 'GY', 'G', '119.46', '32.7813', '');
INSERT INTO `t_order_region` VALUES ('956', '321100', '320000', '镇江市', '中国,江苏省,镇江市', '镇江', '中国,江苏,镇江', '2', '0511', '212000', 'Zhenjiang', 'ZJ', 'Z', '119.453', '32.2044', '');
INSERT INTO `t_order_region` VALUES ('957', '321102', '321100', '京口区', '中国,江苏省,镇江市,京口区', '京口', '中国,江苏,镇江,京口', '3', '0511', '212000', 'Jingkou', 'JK', 'J', '119.469', '32.1981', '');
INSERT INTO `t_order_region` VALUES ('958', '321111', '321100', '润州区', '中国,江苏省,镇江市,润州区', '润州', '中国,江苏,镇江,润州', '3', '0511', '212000', 'Runzhou', 'RZ', 'R', '119.411', '32.1952', '');
INSERT INTO `t_order_region` VALUES ('959', '321112', '321100', '丹徒区', '中国,江苏省,镇江市,丹徒区', '丹徒', '中国,江苏,镇江,丹徒', '3', '0511', '212100', 'Dantu', 'DT', 'D', '119.434', '32.1318', '');
INSERT INTO `t_order_region` VALUES ('960', '321181', '321100', '丹阳市', '中国,江苏省,镇江市,丹阳市', '丹阳', '中国,江苏,镇江,丹阳', '3', '0511', '212300', 'Danyang', 'DY', 'D', '119.575', '31.9912', '');
INSERT INTO `t_order_region` VALUES ('961', '321182', '321100', '扬中市', '中国,江苏省,镇江市,扬中市', '扬中', '中国,江苏,镇江,扬中', '3', '0511', '212200', 'Yangzhong', 'YZ', 'Y', '119.797', '32.2363', '');
INSERT INTO `t_order_region` VALUES ('962', '321183', '321100', '句容市', '中国,江苏省,镇江市,句容市', '句容', '中国,江苏,镇江,句容', '3', '0511', '212400', 'Jurong', 'JR', 'J', '119.165', '31.9559', '');
INSERT INTO `t_order_region` VALUES ('963', '321184', '321100', '镇江新区', '中国,江苏省,镇江市,镇江新区', '镇江新区', '中国,江苏,镇江,镇江新区', '3', '0511', '212000', 'Zhenjiangxinqu', 'ZJXQ', 'Z', '119.674', '32.1679', '新区');
INSERT INTO `t_order_region` VALUES ('964', '321185', '321100', '镇江新区', '中国,江苏省,镇江市,丹徒新区', '丹徒新区', '中国,江苏,镇江,丹徒新区', '3', '0511', '212000', 'Dantuxinqu', 'DTXQ', 'D', '119.434', '32.1276', '新区');
INSERT INTO `t_order_region` VALUES ('965', '321186', '321100', '经济开发区', '中国,江苏省,镇江市,经济开发区', '经济开发区', '中国,江苏,镇江,经济开发区', '3', '0511', '212000', 'Jingjikaifaqu', 'JJKFQ', 'J', '119.665', '32.1687', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('966', '321200', '320000', '泰州市', '中国,江苏省,泰州市', '泰州', '中国,江苏,泰州', '2', '0523', '225300', 'Taizhou', 'TZ', 'T', '119.915', '32.4849', '');
INSERT INTO `t_order_region` VALUES ('967', '321202', '321200', '海陵区', '中国,江苏省,泰州市,海陵区', '海陵', '中国,江苏,泰州,海陵', '3', '0523', '225300', 'Hailing', 'HL', 'H', '119.919', '32.491', '');
INSERT INTO `t_order_region` VALUES ('968', '321203', '321200', '高港区', '中国,江苏省,泰州市,高港区', '高港', '中国,江苏,泰州,高港', '3', '0523', '225300', 'Gaogang', 'GG', 'G', '119.881', '32.3183', '');
INSERT INTO `t_order_region` VALUES ('969', '321204', '321200', '姜堰区', '中国,江苏省,泰州市,姜堰区', '姜堰', '中国,江苏,泰州,姜堰', '3', '0523', '225500', 'Jiangyan', 'JY', 'J', '120.148', '32.5085', '');
INSERT INTO `t_order_region` VALUES ('970', '321281', '321200', '兴化市', '中国,江苏省,泰州市,兴化市', '兴化', '中国,江苏,泰州,兴化', '3', '0523', '225700', 'Xinghua', 'XH', 'X', '119.852', '32.9094', '');
INSERT INTO `t_order_region` VALUES ('971', '321282', '321200', '靖江市', '中国,江苏省,泰州市,靖江市', '靖江', '中国,江苏,泰州,靖江', '3', '0523', '214500', 'Jingjiang', 'JJ', 'J', '120.273', '32.0159', '');
INSERT INTO `t_order_region` VALUES ('972', '321283', '321200', '泰兴市', '中国,江苏省,泰州市,泰兴市', '泰兴', '中国,江苏,泰州,泰兴', '3', '0523', '225400', 'Taixing', 'TX', 'T', '120.052', '32.1719', '');
INSERT INTO `t_order_region` VALUES ('973', '321300', '320000', '宿迁市', '中国,江苏省,宿迁市', '宿迁', '中国,江苏,宿迁', '2', '0527', '223800', 'Suqian', 'SQ', 'S', '118.293', '33.9452', '');
INSERT INTO `t_order_region` VALUES ('974', '321302', '321300', '宿城区', '中国,江苏省,宿迁市,宿城区', '宿城', '中国,江苏,宿迁,宿城', '3', '0527', '223800', 'Sucheng', 'SC', 'S', '118.291', '33.9422', '');
INSERT INTO `t_order_region` VALUES ('975', '321311', '321300', '宿豫区', '中国,江苏省,宿迁市,宿豫区', '宿豫', '中国,江苏,宿迁,宿豫', '3', '0527', '223800', 'Suyu', 'SY', 'S', '118.329', '33.9467', '');
INSERT INTO `t_order_region` VALUES ('976', '321322', '321300', '沭阳县', '中国,江苏省,宿迁市,沭阳县', '沭阳', '中国,江苏,宿迁,沭阳', '3', '0527', '223600', 'Shuyang', 'SY', 'S', '118.769', '34.1145', '');
INSERT INTO `t_order_region` VALUES ('977', '321323', '321300', '泗阳县', '中国,江苏省,宿迁市,泗阳县', '泗阳', '中国,江苏,宿迁,泗阳', '3', '0527', '223700', 'Siyang', 'SY', 'S', '118.703', '33.721', '');
INSERT INTO `t_order_region` VALUES ('978', '321324', '321300', '泗洪县', '中国,江苏省,宿迁市,泗洪县', '泗洪', '中国,江苏,宿迁,泗洪', '3', '0527', '223900', 'Sihong', 'SH', 'S', '118.217', '33.46', '');
INSERT INTO `t_order_region` VALUES ('979', '321325', '321300', '高新区', '中国,江苏省,宿迁市,高新区', '高新区', '中国,江苏,宿迁,高新区', '3', '0527', '223800', 'Gaoxinqu', 'GXQ', 'G', '118.267', '33.8921', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('980', '330000', '100000', '浙江省', '中国,浙江省', '浙江', '中国,浙江', '1', '', '', 'Zhejiang', 'ZJ', 'Z', '120.154', '30.2875', '');
INSERT INTO `t_order_region` VALUES ('981', '330100', '330000', '杭州市', '中国,浙江省,杭州市', '杭州', '中国,浙江,杭州', '2', '0571', '310000', 'Hangzhou', 'HZ', 'H', '120.154', '30.2875', '');
INSERT INTO `t_order_region` VALUES ('982', '330102', '330100', '上城区', '中国,浙江省,杭州市,上城区', '上城', '中国,浙江,杭州,上城', '3', '0571', '310000', 'Shangcheng', 'SC', 'S', '120.169', '30.2425', '');
INSERT INTO `t_order_region` VALUES ('983', '330103', '330100', '下城区', '中国,浙江省,杭州市,下城区', '下城', '中国,浙江,杭州,下城', '3', '0571', '310000', 'Xiacheng', 'XC', 'X', '120.181', '30.2815', '');
INSERT INTO `t_order_region` VALUES ('984', '330104', '330100', '江干区', '中国,浙江省,杭州市,江干区', '江干', '中国,浙江,杭州,江干', '3', '0571', '310000', 'Jianggan', 'JG', 'J', '120.205', '30.2572', '');
INSERT INTO `t_order_region` VALUES ('985', '330105', '330100', '拱墅区', '中国,浙江省,杭州市,拱墅区', '拱墅', '中国,浙江,杭州,拱墅', '3', '0571', '310000', 'Gongshu', 'GS', 'G', '120.142', '30.3197', '');
INSERT INTO `t_order_region` VALUES ('986', '330106', '330100', '西湖区', '中国,浙江省,杭州市,西湖区', '西湖', '中国,浙江,杭州,西湖', '3', '0571', '310000', 'Xihu', 'XH', 'X', '120.13', '30.2595', '');
INSERT INTO `t_order_region` VALUES ('987', '330108', '330100', '滨江区', '中国,浙江省,杭州市,滨江区', '滨江', '中国,浙江,杭州,滨江', '3', '0571', '310000', 'Binjiang', 'BJ', 'B', '120.212', '30.2083', '');
INSERT INTO `t_order_region` VALUES ('988', '330109', '330100', '萧山区', '中国,浙江省,杭州市,萧山区', '萧山', '中国,浙江,杭州,萧山', '3', '0571', '311200', 'Xiaoshan', 'XS', 'X', '120.265', '30.185', '');
INSERT INTO `t_order_region` VALUES ('989', '330110', '330100', '余杭区', '中国,浙江省,杭州市,余杭区', '余杭', '中国,浙江,杭州,余杭', '3', '0571', '311100', 'Yuhang', 'YH', 'Y', '120.3', '30.4183', '');
INSERT INTO `t_order_region` VALUES ('990', '330111', '330100', '富阳区', '中国,浙江省,杭州市,富阳区', '富阳', '中国,浙江,杭州,富阳', '3', '0571', '311400', 'Fuyang', 'FY', 'F', '119.96', '30.0488', '');
INSERT INTO `t_order_region` VALUES ('991', '330122', '330100', '桐庐县', '中国,浙江省,杭州市,桐庐县', '桐庐', '中国,浙江,杭州,桐庐', '3', '0571', '311500', 'Tonglu', 'TL', 'T', '119.689', '29.7978', '');
INSERT INTO `t_order_region` VALUES ('992', '330127', '330100', '淳安县', '中国,浙江省,杭州市,淳安县', '淳安', '中国,浙江,杭州,淳安', '3', '0571', '311700', 'Chun\'an', 'CA', 'C', '119.043', '29.6099', '');
INSERT INTO `t_order_region` VALUES ('993', '330182', '330100', '建德市', '中国,浙江省,杭州市,建德市', '建德', '中国,浙江,杭州,建德', '3', '0571', '311600', 'Jiande', 'JD', 'J', '119.282', '29.476', '');
INSERT INTO `t_order_region` VALUES ('994', '330185', '330100', '临安市', '中国,浙江省,杭州市,临安市', '临安', '中国,浙江,杭州,临安', '3', '0571', '311300', 'Lin\'an', 'LA', 'L', '119.725', '30.2345', '');
INSERT INTO `t_order_region` VALUES ('995', '330186', '330100', '高新区', '中国,浙江省,杭州市,高新区', '高新区', '中国,浙江,杭州,高新区', '3', '0571', '310000', 'Gaoxinqu', 'GXQ', 'G', '120.204', '30.1873', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('996', '330200', '330000', '宁波市', '中国,浙江省,宁波市', '宁波', '中国,浙江,宁波', '2', '0574', '315000', 'Ningbo', 'NB', 'N', '121.55', '29.8684', '');
INSERT INTO `t_order_region` VALUES ('997', '330203', '330200', '海曙区', '中国,浙江省,宁波市,海曙区', '海曙', '中国,浙江,宁波,海曙', '3', '0574', '315000', 'Haishu', 'HS', 'H', '121.551', '29.8598', '');
INSERT INTO `t_order_region` VALUES ('998', '330205', '330200', '江北区', '中国,浙江省,宁波市,江北区', '江北', '中国,浙江,宁波,江北', '3', '0574', '315000', 'Jiangbei', 'JB', 'J', '121.557', '29.8878', '');
INSERT INTO `t_order_region` VALUES ('999', '330206', '330200', '北仑区', '中国,浙江省,宁波市,北仑区', '北仑', '中国,浙江,宁波,北仑', '3', '0574', '315800', 'Beilun', 'BL', 'B', '121.844', '29.9007', '');
INSERT INTO `t_order_region` VALUES ('1000', '330211', '330200', '镇海区', '中国,浙江省,宁波市,镇海区', '镇海', '中国,浙江,宁波,镇海', '3', '0574', '315200', 'Zhenhai', 'ZH', 'Z', '121.716', '29.9489', '');
INSERT INTO `t_order_region` VALUES ('1001', '330212', '330200', '鄞州区', '中国,浙江省,宁波市,鄞州区', '鄞州', '中国,浙江,宁波,鄞州', '3', '0574', '315100', 'Yinzhou', 'YZ', 'Y', '121.548', '29.8161', '');
INSERT INTO `t_order_region` VALUES ('1002', '330213', '330200', '奉化区', '中国,浙江省,宁波市,奉化区', '奉化', '中国,浙江,宁波,奉化', '3', '0574', '315500', 'Fenghua', 'FH', 'F', '121.41', '29.6554', '');
INSERT INTO `t_order_region` VALUES ('1003', '330225', '330200', '象山县', '中国,浙江省,宁波市,象山县', '象山', '中国,浙江,宁波,象山', '3', '0574', '315700', 'Xiangshan', 'XS', 'X', '121.869', '29.4776', '');
INSERT INTO `t_order_region` VALUES ('1004', '330226', '330200', '宁海县', '中国,浙江省,宁波市,宁海县', '宁海', '中国,浙江,宁波,宁海', '3', '0574', '315600', 'Ninghai', 'NH', 'N', '121.431', '29.2889', '');
INSERT INTO `t_order_region` VALUES ('1005', '330281', '330200', '余姚市', '中国,浙江省,宁波市,余姚市', '余姚', '中国,浙江,宁波,余姚', '3', '0574', '315400', 'Yuyao', 'YY', 'Y', '121.153', '30.0387', '');
INSERT INTO `t_order_region` VALUES ('1006', '330282', '330200', '慈溪市', '中国,浙江省,宁波市,慈溪市', '慈溪', '中国,浙江,宁波,慈溪', '3', '0574', '315300', 'Cixi', 'CX', 'C', '121.266', '30.1696', '');
INSERT INTO `t_order_region` VALUES ('1007', '330284', '330200', '杭州湾新区', '中国,浙江省,宁波市,杭州湾新区', '杭州湾新区', '中国,浙江,宁波,杭州湾新区', '3', '0574', '315336', 'Hangzhouwanxinqu', 'HZWXQ', 'H', '121.314', '30.2913', '新区');
INSERT INTO `t_order_region` VALUES ('1008', '330285', '330200', '高新区', '中国,浙江省,宁波市,高新区', '高新区', '中国,浙江,宁波,高新区', '3', '0574', '315000', 'Gaoxinqu', 'GXQ', 'G', '121.659', '29.8893', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1009', '330300', '330000', '温州市', '中国,浙江省,温州市', '温州', '中国,浙江,温州', '2', '0577', '325000', 'Wenzhou', 'WZ', 'W', '120.672', '28.0006', '');
INSERT INTO `t_order_region` VALUES ('1010', '330302', '330300', '鹿城区', '中国,浙江省,温州市,鹿城区', '鹿城', '中国,浙江,温州,鹿城', '3', '0577', '325000', 'Lucheng', 'LC', 'L', '120.655', '28.0149', '');
INSERT INTO `t_order_region` VALUES ('1011', '330303', '330300', '龙湾区', '中国,浙江省,温州市,龙湾区', '龙湾', '中国,浙江,温州,龙湾', '3', '0577', '325000', 'Longwan', 'LW', 'L', '120.831', '27.9128', '');
INSERT INTO `t_order_region` VALUES ('1012', '330304', '330300', '瓯海区', '中国,浙江省,温州市,瓯海区', '瓯海', '中国,浙江,温州,瓯海', '3', '0577', '325000', 'Ouhai', 'OH', 'O', '120.638', '28.0071', '');
INSERT INTO `t_order_region` VALUES ('1013', '330305', '330300', '洞头区', '中国,浙江省,温州市,洞头区', '洞头', '中国,浙江,温州,洞头', '3', '0577', '325700', 'Dongtou', 'DT', 'D', '121.156', '27.8363', '');
INSERT INTO `t_order_region` VALUES ('1014', '330324', '330300', '永嘉县', '中国,浙江省,温州市,永嘉县', '永嘉', '中国,浙江,温州,永嘉', '3', '0577', '325100', 'Yongjia', 'YJ', 'Y', '120.693', '28.1546', '');
INSERT INTO `t_order_region` VALUES ('1015', '330326', '330300', '平阳县', '中国,浙江省,温州市,平阳县', '平阳', '中国,浙江,温州,平阳', '3', '0577', '325400', 'Pingyang', 'PY', 'P', '120.565', '27.6625', '');
INSERT INTO `t_order_region` VALUES ('1016', '330327', '330300', '苍南县', '中国,浙江省,温州市,苍南县', '苍南', '中国,浙江,温州,苍南', '3', '0577', '325800', 'Cangnan', 'CN', 'C', '120.426', '27.5174', '');
INSERT INTO `t_order_region` VALUES ('1017', '330328', '330300', '文成县', '中国,浙江省,温州市,文成县', '文成', '中国,浙江,温州,文成', '3', '0577', '325300', 'Wencheng', 'WC', 'W', '120.091', '27.7868', '');
INSERT INTO `t_order_region` VALUES ('1018', '330329', '330300', '泰顺县', '中国,浙江省,温州市,泰顺县', '泰顺', '中国,浙江,温州,泰顺', '3', '0577', '325500', 'Taishun', 'TS', 'T', '119.718', '27.5569', '');
INSERT INTO `t_order_region` VALUES ('1019', '330381', '330300', '瑞安市', '中国,浙江省,温州市,瑞安市', '瑞安', '中国,浙江,温州,瑞安', '3', '0577', '325200', 'Rui\'an', 'RA', 'R', '120.655', '27.7804', '');
INSERT INTO `t_order_region` VALUES ('1020', '330382', '330300', '乐清市', '中国,浙江省,温州市,乐清市', '乐清', '中国,浙江,温州,乐清', '3', '0577', '325600', 'Yueqing', 'YQ', 'Y', '120.962', '28.124', '');
INSERT INTO `t_order_region` VALUES ('1021', '330400', '330000', '嘉兴市', '中国,浙江省,嘉兴市', '嘉兴', '中国,浙江,嘉兴', '2', '0573', '314000', 'Jiaxing', 'JX', 'J', '120.751', '30.7627', '');
INSERT INTO `t_order_region` VALUES ('1022', '330402', '330400', '南湖区', '中国,浙江省,嘉兴市,南湖区', '南湖', '中国,浙江,嘉兴,南湖', '3', '0573', '314051', 'Nanhu', 'NH', 'N', '120.785', '30.7486', '');
INSERT INTO `t_order_region` VALUES ('1023', '330411', '330400', '秀洲区', '中国,浙江省,嘉兴市,秀洲区', '秀洲', '中国,浙江,嘉兴,秀洲', '3', '0573', '314031', 'Xiuzhou', 'XZ', 'X', '120.709', '30.7645', '');
INSERT INTO `t_order_region` VALUES ('1024', '330421', '330400', '嘉善县', '中国,浙江省,嘉兴市,嘉善县', '嘉善', '中国,浙江,嘉兴,嘉善', '3', '0573', '314100', 'Jiashan', 'JS', 'J', '120.926', '30.8299', '');
INSERT INTO `t_order_region` VALUES ('1025', '330424', '330400', '海盐县', '中国,浙江省,嘉兴市,海盐县', '海盐', '中国,浙江,嘉兴,海盐', '3', '0573', '314300', 'Haiyan', 'HY', 'H', '120.946', '30.5255', '');
INSERT INTO `t_order_region` VALUES ('1026', '330481', '330400', '海宁市', '中国,浙江省,嘉兴市,海宁市', '海宁', '中国,浙江,嘉兴,海宁', '3', '0573', '314400', 'Haining', 'HN', 'H', '120.681', '30.5097', '');
INSERT INTO `t_order_region` VALUES ('1027', '330482', '330400', '平湖市', '中国,浙江省,嘉兴市,平湖市', '平湖', '中国,浙江,嘉兴,平湖', '3', '0573', '314200', 'Pinghu', 'PH', 'P', '121.022', '30.6962', '');
INSERT INTO `t_order_region` VALUES ('1028', '330483', '330400', '桐乡市', '中国,浙江省,嘉兴市,桐乡市', '桐乡', '中国,浙江,嘉兴,桐乡', '3', '0573', '314500', 'Tongxiang', 'TX', 'T', '120.565', '30.6302', '');
INSERT INTO `t_order_region` VALUES ('1029', '330500', '330000', '湖州市', '中国,浙江省,湖州市', '湖州', '中国,浙江,湖州', '2', '0572', '313000', 'Huzhou', 'HZ', 'H', '120.102', '30.8672', '');
INSERT INTO `t_order_region` VALUES ('1030', '330502', '330500', '吴兴区', '中国,浙江省,湖州市,吴兴区', '吴兴', '中国,浙江,湖州,吴兴', '3', '0572', '313000', 'Wuxing', 'WX', 'W', '120.125', '30.8575', '');
INSERT INTO `t_order_region` VALUES ('1031', '330503', '330500', '南浔区', '中国,浙江省,湖州市,南浔区', '南浔', '中国,浙江,湖州,南浔', '3', '0572', '313000', 'Nanxun', 'NX', 'N', '120.42', '30.8669', '');
INSERT INTO `t_order_region` VALUES ('1032', '330521', '330500', '德清县', '中国,浙江省,湖州市,德清县', '德清', '中国,浙江,湖州,德清', '3', '0572', '313200', 'Deqing', 'DQ', 'D', '119.978', '30.5337', '');
INSERT INTO `t_order_region` VALUES ('1033', '330522', '330500', '长兴县', '中国,浙江省,湖州市,长兴县', '长兴', '中国,浙江,湖州,长兴', '3', '0572', '313100', 'Changxing', 'CX', 'C', '119.908', '31.0061', '');
INSERT INTO `t_order_region` VALUES ('1034', '330523', '330500', '安吉县', '中国,浙江省,湖州市,安吉县', '安吉', '中国,浙江,湖州,安吉', '3', '0572', '313300', 'Anji', 'AJ', 'A', '119.682', '30.638', '');
INSERT INTO `t_order_region` VALUES ('1035', '330600', '330000', '绍兴市', '中国,浙江省,绍兴市', '绍兴', '中国,浙江,绍兴', '2', '0575', '312000', 'Shaoxing', 'SX', 'S', '120.582', '29.9971', '');
INSERT INTO `t_order_region` VALUES ('1036', '330602', '330600', '越城区', '中国,浙江省,绍兴市,越城区', '越城', '中国,浙江,绍兴,越城', '3', '0575', '312000', 'Yuecheng', 'YC', 'Y', '120.582', '29.989', '');
INSERT INTO `t_order_region` VALUES ('1037', '330603', '330600', '柯桥区', '中国,浙江省,绍兴市,柯桥区', '柯桥', '中国,浙江,绍兴,柯桥', '3', '0575', '312030', 'Keqiao ', 'KQ', 'K', '120.493', '30.0876', '');
INSERT INTO `t_order_region` VALUES ('1038', '330604', '330600', '上虞区', '中国,浙江省,绍兴市,上虞区', '上虞', '中国,浙江,绍兴,上虞', '3', '0575', '312300', 'Shangyu', 'SY', 'S', '120.476', '30.078', '');
INSERT INTO `t_order_region` VALUES ('1039', '330624', '330600', '新昌县', '中国,浙江省,绍兴市,新昌县', '新昌', '中国,浙江,绍兴,新昌', '3', '0575', '312500', 'Xinchang', 'XC', 'X', '120.904', '29.4999', '');
INSERT INTO `t_order_region` VALUES ('1040', '330681', '330600', '诸暨市', '中国,浙江省,绍兴市,诸暨市', '诸暨', '中国,浙江,绍兴,诸暨', '3', '0575', '311800', 'Zhuji', 'ZJ', 'Z', '120.236', '29.7136', '');
INSERT INTO `t_order_region` VALUES ('1041', '330683', '330600', '嵊州市', '中国,浙江省,绍兴市,嵊州市', '嵊州', '中国,浙江,绍兴,嵊州', '3', '0575', '312400', 'Shengzhou', 'SZ', 'S', '120.822', '29.5885', '');
INSERT INTO `t_order_region` VALUES ('1042', '330700', '330000', '金华市', '中国,浙江省,金华市', '金华', '中国,浙江,金华', '2', '0579', '321000', 'Jinhua', 'JH', 'J', '119.65', '29.0895', '');
INSERT INTO `t_order_region` VALUES ('1043', '330702', '330700', '婺城区', '中国,浙江省,金华市,婺城区', '婺城', '中国,浙江,金华,婺城', '3', '0579', '321000', 'Wucheng', 'WC', 'W', '119.571', '29.0952', '');
INSERT INTO `t_order_region` VALUES ('1044', '330703', '330700', '金东区', '中国,浙江省,金华市,金东区', '金东', '中国,浙江,金华,金东', '3', '0579', '321000', 'Jindong', 'JD', 'J', '119.693', '29.0991', '');
INSERT INTO `t_order_region` VALUES ('1045', '330723', '330700', '武义县', '中国,浙江省,金华市,武义县', '武义', '中国,浙江,金华,武义', '3', '0579', '321200', 'Wuyi', 'WY', 'W', '119.816', '28.8933', '');
INSERT INTO `t_order_region` VALUES ('1046', '330726', '330700', '浦江县', '中国,浙江省,金华市,浦江县', '浦江', '中国,浙江,金华,浦江', '3', '0579', '322200', 'Pujiang', 'PJ', 'P', '119.892', '29.4535', '');
INSERT INTO `t_order_region` VALUES ('1047', '330727', '330700', '磐安县', '中国,浙江省,金华市,磐安县', '磐安', '中国,浙江,金华,磐安', '3', '0579', '322300', 'Pan\'an', 'PA', 'P', '120.45', '29.0573', '');
INSERT INTO `t_order_region` VALUES ('1048', '330781', '330700', '兰溪市', '中国,浙江省,金华市,兰溪市', '兰溪', '中国,浙江,金华,兰溪', '3', '0579', '321100', 'Lanxi', 'LX', 'L', '119.46', '29.2084', '');
INSERT INTO `t_order_region` VALUES ('1049', '330782', '330700', '义乌市', '中国,浙江省,金华市,义乌市', '义乌', '中国,浙江,金华,义乌', '3', '0579', '322000', 'Yiwu', 'YW', 'Y', '120.074', '29.3056', '');
INSERT INTO `t_order_region` VALUES ('1050', '330783', '330700', '东阳市', '中国,浙江省,金华市,东阳市', '东阳', '中国,浙江,金华,东阳', '3', '0579', '322100', 'Dongyang', 'DY', 'D', '120.242', '29.2894', '');
INSERT INTO `t_order_region` VALUES ('1051', '330784', '330700', '永康市', '中国,浙江省,金华市,永康市', '永康', '中国,浙江,金华,永康', '3', '0579', '321300', 'Yongkang', 'YK', 'Y', '120.047', '28.8884', '');
INSERT INTO `t_order_region` VALUES ('1052', '330800', '330000', '衢州市', '中国,浙江省,衢州市', '衢州', '中国,浙江,衢州', '2', '0570', '324000', 'Quzhou', 'QZ', 'Q', '118.873', '28.9417', '');
INSERT INTO `t_order_region` VALUES ('1053', '330802', '330800', '柯城区', '中国,浙江省,衢州市,柯城区', '柯城', '中国,浙江,衢州,柯城', '3', '0570', '324000', 'Kecheng', 'KC', 'K', '118.871', '28.9686', '');
INSERT INTO `t_order_region` VALUES ('1054', '330803', '330800', '衢江区', '中国,浙江省,衢州市,衢江区', '衢江', '中国,浙江,衢州,衢江', '3', '0570', '324000', 'Qujiang', 'QJ', 'Q', '118.96', '28.9798', '');
INSERT INTO `t_order_region` VALUES ('1055', '330822', '330800', '常山县', '中国,浙江省,衢州市,常山县', '常山', '中国,浙江,衢州,常山', '3', '0570', '324200', 'Changshan', 'CS', 'C', '118.51', '28.9019', '');
INSERT INTO `t_order_region` VALUES ('1056', '330824', '330800', '开化县', '中国,浙江省,衢州市,开化县', '开化', '中国,浙江,衢州,开化', '3', '0570', '324300', 'Kaihua', 'KH', 'K', '118.416', '29.1378', '');
INSERT INTO `t_order_region` VALUES ('1057', '330825', '330800', '龙游县', '中国,浙江省,衢州市,龙游县', '龙游', '中国,浙江,衢州,龙游', '3', '0570', '324400', 'Longyou', 'LY', 'L', '119.172', '29.0282', '');
INSERT INTO `t_order_region` VALUES ('1058', '330881', '330800', '江山市', '中国,浙江省,衢州市,江山市', '江山', '中国,浙江,衢州,江山', '3', '0570', '324100', 'Jiangshan', 'JS', 'J', '118.627', '28.7386', '');
INSERT INTO `t_order_region` VALUES ('1059', '330900', '330000', '舟山市', '中国,浙江省,舟山市', '舟山', '中国,浙江,舟山', '2', '0580', '316000', 'Zhoushan', 'ZS', 'Z', '122.107', '30.016', '');
INSERT INTO `t_order_region` VALUES ('1060', '330902', '330900', '定海区', '中国,浙江省,舟山市,定海区', '定海', '中国,浙江,舟山,定海', '3', '0580', '316000', 'Dinghai', 'DH', 'D', '122.107', '30.0198', '');
INSERT INTO `t_order_region` VALUES ('1061', '330903', '330900', '普陀区', '中国,浙江省,舟山市,普陀区', '普陀', '中国,浙江,舟山,普陀', '3', '0580', '316100', 'Putuo', 'PT', 'P', '122.303', '29.9491', '');
INSERT INTO `t_order_region` VALUES ('1062', '330921', '330900', '岱山县', '中国,浙江省,舟山市,岱山县', '岱山', '中国,浙江,舟山,岱山', '3', '0580', '316200', 'Daishan', 'DS', 'D', '122.205', '30.2439', '');
INSERT INTO `t_order_region` VALUES ('1063', '330922', '330900', '嵊泗县', '中国,浙江省,舟山市,嵊泗县', '嵊泗', '中国,浙江,舟山,嵊泗', '3', '0580', '202450', 'Shengsi', 'SS', 'S', '122.451', '30.7268', '');
INSERT INTO `t_order_region` VALUES ('1064', '331000', '330000', '台州市', '中国,浙江省,台州市', '台州', '中国,浙江,台州', '2', '0576', '318000', 'Taizhou', 'TZ', 'T', '121.429', '28.6614', '');
INSERT INTO `t_order_region` VALUES ('1065', '331002', '331000', '椒江区', '中国,浙江省,台州市,椒江区', '椒江', '中国,浙江,台州,椒江', '3', '0576', '317700', 'Jiaojiang', 'JJ', 'J', '121.443', '28.673', '');
INSERT INTO `t_order_region` VALUES ('1066', '331003', '331000', '黄岩区', '中国,浙江省,台州市,黄岩区', '黄岩', '中国,浙江,台州,黄岩', '3', '0576', '318020', 'Huangyan', 'HY', 'H', '121.259', '28.6508', '');
INSERT INTO `t_order_region` VALUES ('1067', '331004', '331000', '路桥区', '中国,浙江省,台州市,路桥区', '路桥', '中国,浙江,台州,路桥', '3', '0576', '318000', 'Luqiao', 'LQ', 'L', '121.374', '28.5802', '');
INSERT INTO `t_order_region` VALUES ('1068', '331021', '331000', '玉环市', '中国,浙江省,台州市,玉环市', '玉环', '中国,浙江,台州,玉环', '3', '0576', '317600', 'Yuhuan', 'YH', 'Y', '121.232', '28.1364', '省直辖');
INSERT INTO `t_order_region` VALUES ('1069', '331022', '331000', '三门县', '中国,浙江省,台州市,三门县', '三门', '中国,浙江,台州,三门', '3', '0576', '317100', 'Sanmen', 'SM', 'S', '121.394', '29.1051', '');
INSERT INTO `t_order_region` VALUES ('1070', '331023', '331000', '天台县', '中国,浙江省,台州市,天台县', '天台', '中国,浙江,台州,天台', '3', '0576', '317200', 'Tiantai', 'TT', 'T', '121.008', '29.1429', '');
INSERT INTO `t_order_region` VALUES ('1071', '331024', '331000', '仙居县', '中国,浙江省,台州市,仙居县', '仙居', '中国,浙江,台州,仙居', '3', '0576', '317300', 'Xianju', 'XJ', 'X', '120.729', '28.8467', '');
INSERT INTO `t_order_region` VALUES ('1072', '331081', '331000', '温岭市', '中国,浙江省,台州市,温岭市', '温岭', '中国,浙江,台州,温岭', '3', '0576', '317500', 'Wenling', 'WL', 'W', '121.386', '28.3718', '');
INSERT INTO `t_order_region` VALUES ('1073', '331082', '331000', '临海市', '中国,浙江省,台州市,临海市', '临海', '中国,浙江,台州,临海', '3', '0576', '317000', 'Linhai', 'LH', 'L', '121.139', '28.856', '');
INSERT INTO `t_order_region` VALUES ('1074', '331100', '330000', '丽水市', '中国,浙江省,丽水市', '丽水', '中国,浙江,丽水', '2', '0578', '323000', 'Lishui', 'LS', 'L', '119.922', '28.452', '');
INSERT INTO `t_order_region` VALUES ('1075', '331102', '331100', '莲都区', '中国,浙江省,丽水市,莲都区', '莲都', '中国,浙江,丽水,莲都', '3', '0578', '323000', 'Liandu', 'LD', 'L', '119.913', '28.4458', '');
INSERT INTO `t_order_region` VALUES ('1076', '331121', '331100', '青田县', '中国,浙江省,丽水市,青田县', '青田', '中国,浙江,丽水,青田', '3', '0578', '323900', 'Qingtian', 'QT', 'Q', '120.29', '28.139', '');
INSERT INTO `t_order_region` VALUES ('1077', '331122', '331100', '缙云县', '中国,浙江省,丽水市,缙云县', '缙云', '中国,浙江,丽水,缙云', '3', '0578', '321400', 'Jinyun', 'JY', 'J', '120.09', '28.6594', '');
INSERT INTO `t_order_region` VALUES ('1078', '331123', '331100', '遂昌县', '中国,浙江省,丽水市,遂昌县', '遂昌', '中国,浙江,丽水,遂昌', '3', '0578', '323300', 'Suichang', 'SC', 'S', '119.276', '28.5929', '');
INSERT INTO `t_order_region` VALUES ('1079', '331124', '331100', '松阳县', '中国,浙江省,丽水市,松阳县', '松阳', '中国,浙江,丽水,松阳', '3', '0578', '323400', 'Songyang', 'SY', 'S', '119.482', '28.4494', '');
INSERT INTO `t_order_region` VALUES ('1080', '331125', '331100', '云和县', '中国,浙江省,丽水市,云和县', '云和', '中国,浙江,丽水,云和', '3', '0578', '323600', 'Yunhe', 'YH', 'Y', '119.573', '28.1164', '');
INSERT INTO `t_order_region` VALUES ('1081', '331126', '331100', '庆元县', '中国,浙江省,丽水市,庆元县', '庆元', '中国,浙江,丽水,庆元', '3', '0578', '323800', 'Qingyuan', 'QY', 'Q', '119.063', '27.6184', '');
INSERT INTO `t_order_region` VALUES ('1082', '331127', '331100', '景宁畲族自治县', '中国,浙江省,丽水市,景宁畲族自治县', '景宁', '中国,浙江,丽水,景宁', '3', '0578', '323500', 'Jingning', 'JN', 'J', '119.638', '27.9739', '');
INSERT INTO `t_order_region` VALUES ('1083', '331181', '331100', '龙泉市', '中国,浙江省,丽水市,龙泉市', '龙泉', '中国,浙江,丽水,龙泉', '3', '0578', '323700', 'Longquan', 'LQ', 'L', '119.142', '28.0743', '');
INSERT INTO `t_order_region` VALUES ('1084', '331200', '330000', '舟山群岛新区', '中国,浙江省,舟山群岛新区', '舟山新区', '中国,浙江,舟山新区', '2', '0580', '316000', 'Zhoushan', 'ZS', 'Z', '122.318', '29.8132', '国家级新区');
INSERT INTO `t_order_region` VALUES ('1085', '331201', '331200', '金塘岛', '中国,浙江省,舟山群岛新区,金塘岛', '金塘', '中国,浙江,舟山新区,金塘', '3', '0580', '316000', 'Jintang', 'JT', 'J', '121.893', '30.0406', '新区');
INSERT INTO `t_order_region` VALUES ('1086', '331202', '331200', '六横岛', '中国,浙江省,舟山群岛新区,六横岛', '六横', '中国,浙江,舟山新区,六横', '3', '0580', '316000', 'Liuheng', 'LH', 'L', '122.143', '29.6629', '新区');
INSERT INTO `t_order_region` VALUES ('1087', '331203', '331200', '衢山岛', '中国,浙江省,舟山群岛新区,衢山岛', '衢山', '中国,浙江,舟山新区,衢山', '3', '0580', '316000', 'Qushan', 'QS', 'Q', '122.358', '30.4426', '新区');
INSERT INTO `t_order_region` VALUES ('1088', '331204', '331200', '舟山本岛西北部', '中国,浙江省,舟山群岛新区,舟山本岛西北部', '舟山', '中国,浙江,舟山新区,舟山', '3', '0580', '316000', 'Zhoushan', 'ZS', 'Z', '122.031', '30.1404', '新区');
INSERT INTO `t_order_region` VALUES ('1089', '331205', '331200', '岱山岛西南部', '中国,浙江省,舟山群岛新区,岱山岛西南部', '岱山', '中国,浙江,舟山新区,岱山', '3', '0580', '316000', 'Daishan', 'DS', 'D', '122.18', '30.2773', '新区');
INSERT INTO `t_order_region` VALUES ('1090', '331206', '331200', '泗礁岛', '中国,浙江省,舟山群岛新区,泗礁岛', '泗礁', '中国,浙江,舟山新区,泗礁', '3', '0580', '316000', 'Sijiao', 'SJ', 'S', '122.458', '30.7251', '新区');
INSERT INTO `t_order_region` VALUES ('1091', '331207', '331200', '朱家尖岛', '中国,浙江省,舟山群岛新区,朱家尖岛', '朱家尖', '中国,浙江,舟山新区,朱家尖', '3', '0580', '316000', 'Zhujiajian', 'ZJJ', 'Z', '122.391', '29.9163', '新区');
INSERT INTO `t_order_region` VALUES ('1092', '331208', '331200', '洋山岛', '中国,浙江省,舟山群岛新区,洋山岛', '洋山', '中国,浙江,舟山新区,洋山', '3', '0580', '316000', 'Yangshan', 'YS', 'Y', '121.996', '30.0946', '新区');
INSERT INTO `t_order_region` VALUES ('1093', '331209', '331200', '长涂岛', '中国,浙江省,舟山群岛新区,长涂岛', '长涂', '中国,浙江,舟山新区,长涂', '3', '0580', '316000', 'Changtu', 'CT', 'C', '122.285', '30.2489', '新区');
INSERT INTO `t_order_region` VALUES ('1094', '331210', '331200', '虾峙岛', '中国,浙江省,舟山群岛新区,虾峙岛', '虾峙', '中国,浙江,舟山新区,虾峙', '3', '0580', '316000', 'Xiazhi', 'XZ', 'X', '122.245', '29.7529', '新区');
INSERT INTO `t_order_region` VALUES ('1095', '340000', '100000', '安徽省', '中国,安徽省', '安徽', '中国,安徽', '1', '', '', 'Anhui', 'AH', 'A', '117.283', '31.8612', '');
INSERT INTO `t_order_region` VALUES ('1096', '340100', '340000', '合肥市', '中国,安徽省,合肥市', '合肥', '中国,安徽,合肥', '2', '0551', '230000', 'Hefei', 'HF', 'H', '117.283', '31.8612', '');
INSERT INTO `t_order_region` VALUES ('1097', '340102', '340100', '瑶海区', '中国,安徽省,合肥市,瑶海区', '瑶海', '中国,安徽,合肥,瑶海', '3', '0551', '230000', 'Yaohai', 'YH', 'Y', '117.309', '31.8581', '');
INSERT INTO `t_order_region` VALUES ('1098', '340103', '340100', '庐阳区', '中国,安徽省,合肥市,庐阳区', '庐阳', '中国,安徽,合肥,庐阳', '3', '0551', '230000', 'Luyang', 'LY', 'L', '117.265', '31.8787', '');
INSERT INTO `t_order_region` VALUES ('1099', '340104', '340100', '蜀山区', '中国,安徽省,合肥市,蜀山区', '蜀山', '中国,安徽,合肥,蜀山', '3', '0551', '230000', 'Shushan', 'SS', 'S', '117.261', '31.8512', '');
INSERT INTO `t_order_region` VALUES ('1100', '340111', '340100', '包河区', '中国,安徽省,合肥市,包河区', '包河', '中国,安徽,合肥,包河', '3', '0551', '230000', 'Baohe', 'BH', 'B', '117.31', '31.795', '');
INSERT INTO `t_order_region` VALUES ('1101', '340121', '340100', '长丰县', '中国,安徽省,合肥市,长丰县', '长丰', '中国,安徽,合肥,长丰', '3', '0551', '231100', 'Changfeng', 'CF', 'C', '117.165', '32.4796', '');
INSERT INTO `t_order_region` VALUES ('1102', '340122', '340100', '肥东县', '中国,安徽省,合肥市,肥东县', '肥东', '中国,安徽,合肥,肥东', '3', '0551', '230000', 'Feidong', 'FD', 'F', '117.471', '31.8853', '');
INSERT INTO `t_order_region` VALUES ('1103', '340123', '340100', '肥西县', '中国,安徽省,合肥市,肥西县', '肥西', '中国,安徽,合肥,肥西', '3', '0551', '231200', 'Feixi', 'FX', 'F', '117.168', '31.7214', '');
INSERT INTO `t_order_region` VALUES ('1104', '340124', '340100', '庐江县', '中国,安徽省,合肥市,庐江县', '庐江', '中国,安徽,合肥,庐江', '3', '0551', '231500', 'Lujiang', 'LJ', 'L', '117.29', '31.2515', '');
INSERT INTO `t_order_region` VALUES ('1105', '340181', '340100', '巢湖市', '中国,安徽省,合肥市,巢湖市', '巢湖', '中国,安徽,合肥,巢湖', '3', '0551', '238000', 'Chaohu', 'CH', 'C', '117.874', '31.6005', '');
INSERT INTO `t_order_region` VALUES ('1106', '340184', '340100', '经济技术开发区', '中国,安徽省,合肥市,经济技术开发区', '经济技术开发区', '中国,安徽,合肥,经济技术开发区', '3', '0551', '230000', 'Jingjikaifaqu', 'JJ', 'J', '117.209', '31.7789', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1107', '340185', '340100', '高新技术开发区', '中国,安徽省,合肥市,高新技术开发区', '高新技术开发区', '中国,安徽,合肥,高新技术开发区', '3', '0551', '230000', 'Gaoxinkaifaqu', 'GX', 'G', '117.136', '31.8313', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1108', '340186', '340100', '北城新区', '中国,安徽省,合肥市,北城新区', '北城新区', '中国,安徽,合肥,北城新区', '3', '0551', '230000', 'Beicheng', 'BC', 'B', '117.247', '32.0302', '新区');
INSERT INTO `t_order_region` VALUES ('1109', '340187', '340100', '滨湖新区', '中国,安徽省,合肥市,滨湖新区', '滨湖新区', '中国,安徽,合肥,滨湖新区', '3', '0551', '230000', 'Binhu', 'BH', 'B', '117.288', '31.7323', '新区');
INSERT INTO `t_order_region` VALUES ('1110', '340188', '340100', '政务文化新区', '中国,安徽省,合肥市,政务文化新区', '政务文化新区', '中国,安徽,合肥,政务文化新区', '3', '0551', '230000', 'Zhengwuwenhua', 'ZW', 'Z', '117.213', '31.8035', '新区');
INSERT INTO `t_order_region` VALUES ('1111', '340189', '340100', '新站综合开发试验区', '中国,安徽省,合肥市,新站综合开发试验区', '新站综合开发试验区', '中国,安徽,合肥,新站综合开发试验区', '3', '0551', '230000', 'Xinzhan', 'XZ', 'X', '117.378', '31.9398', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1112', '340200', '340000', '芜湖市', '中国,安徽省,芜湖市', '芜湖', '中国,安徽,芜湖', '2', '0553', '241000', 'Wuhu', 'WH', 'W', '118.376', '31.3263', '');
INSERT INTO `t_order_region` VALUES ('1113', '340202', '340200', '镜湖区', '中国,安徽省,芜湖市,镜湖区', '镜湖', '中国,安徽,芜湖,镜湖', '3', '0553', '241000', 'Jinghu', 'JH', 'J', '118.385', '31.3404', '');
INSERT INTO `t_order_region` VALUES ('1114', '340203', '340200', '弋江区', '中国,安徽省,芜湖市,弋江区', '弋江', '中国,安徽,芜湖,弋江', '3', '0553', '241000', 'Yijiang', 'YJ', 'Y', '118.373', '31.3118', '');
INSERT INTO `t_order_region` VALUES ('1115', '340207', '340200', '鸠江区', '中国,安徽省,芜湖市,鸠江区', '鸠江', '中国,安徽,芜湖,鸠江', '3', '0553', '241000', 'Jiujiang', 'JJ', 'J', '118.392', '31.3693', '');
INSERT INTO `t_order_region` VALUES ('1116', '340208', '340200', '三山区', '中国,安徽省,芜湖市,三山区', '三山', '中国,安徽,芜湖,三山', '3', '0553', '241000', 'Sanshan', 'SS', 'S', '118.225', '31.207', '');
INSERT INTO `t_order_region` VALUES ('1117', '340221', '340200', '芜湖县', '中国,安徽省,芜湖市,芜湖县', '芜湖', '中国,安徽,芜湖,芜湖', '3', '0553', '241100', 'Wuhu', 'WH', 'W', '118.575', '31.1348', '');
INSERT INTO `t_order_region` VALUES ('1118', '340222', '340200', '繁昌县', '中国,安徽省,芜湖市,繁昌县', '繁昌', '中国,安徽,芜湖,繁昌', '3', '0553', '241200', 'Fanchang', 'FC', 'F', '118.2', '31.0832', '');
INSERT INTO `t_order_region` VALUES ('1119', '340223', '340200', '南陵县', '中国,安徽省,芜湖市,南陵县', '南陵', '中国,安徽,芜湖,南陵', '3', '0553', '242400', 'Nanling', 'NL', 'N', '118.337', '30.9197', '');
INSERT INTO `t_order_region` VALUES ('1120', '340225', '340200', '无为县', '中国,安徽省,芜湖市,无为县', '无为', '中国,安徽,芜湖,无为', '3', '0553', '238300', 'Wuwei', 'WW', 'W', '117.911', '31.3031', '');
INSERT INTO `t_order_region` VALUES ('1121', '340226', '340200', '经济技术开发区', '中国,安徽省,芜湖市,经济技术开发区', '经济技术开发区', '中国,安徽,芜湖,经济技术开发区', '3', '0553', '241000', 'Jingjikaifaqu', 'JJ', 'J', '118.374', '31.4083', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1122', '340300', '340000', '蚌埠市', '中国,安徽省,蚌埠市', '蚌埠', '中国,安徽,蚌埠', '2', '0552', '233000', 'Bengbu', 'BB', 'B', '117.362', '32.934', '');
INSERT INTO `t_order_region` VALUES ('1123', '340302', '340300', '龙子湖区', '中国,安徽省,蚌埠市,龙子湖区', '龙子湖', '中国,安徽,蚌埠,龙子湖', '3', '0552', '233000', 'Longzihu', 'LZH', 'L', '117.394', '32.943', '');
INSERT INTO `t_order_region` VALUES ('1124', '340303', '340300', '蚌山区', '中国,安徽省,蚌埠市,蚌山区', '蚌山', '中国,安徽,蚌埠,蚌山', '3', '0552', '233000', 'Bengshan', 'BS', 'B', '117.368', '32.9441', '');
INSERT INTO `t_order_region` VALUES ('1125', '340304', '340300', '禹会区', '中国,安徽省,蚌埠市,禹会区', '禹会', '中国,安徽,蚌埠,禹会', '3', '0552', '233000', 'Yuhui', 'YH', 'Y', '117.353', '32.9334', '');
INSERT INTO `t_order_region` VALUES ('1126', '340311', '340300', '淮上区', '中国,安徽省,蚌埠市,淮上区', '淮上', '中国,安徽,蚌埠,淮上', '3', '0552', '233000', 'Huaishang', 'HS', 'H', '117.36', '32.9642', '');
INSERT INTO `t_order_region` VALUES ('1127', '340321', '340300', '怀远县', '中国,安徽省,蚌埠市,怀远县', '怀远', '中国,安徽,蚌埠,怀远', '3', '0552', '233400', 'Huaiyuan', 'HY', 'H', '117.205', '32.9701', '');
INSERT INTO `t_order_region` VALUES ('1128', '340322', '340300', '五河县', '中国,安徽省,蚌埠市,五河县', '五河', '中国,安徽,蚌埠,五河', '3', '0552', '233300', 'Wuhe', 'WH', 'W', '117.891', '33.1446', '');
INSERT INTO `t_order_region` VALUES ('1129', '340323', '340300', '固镇县', '中国,安徽省,蚌埠市,固镇县', '固镇', '中国,安徽,蚌埠,固镇', '3', '0552', '233700', 'Guzhen', 'GZ', 'G', '117.316', '33.318', '');
INSERT INTO `t_order_region` VALUES ('1130', '340324', '340300', '高新区', '中国,安徽省,蚌埠市,高新区', '高新区', '中国,安徽,蚌埠,高新区', '3', '0552', '233000', 'Gaoxinqu', 'GXQ', 'G', '117.321', '32.9081', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1131', '340400', '340000', '淮南市', '中国,安徽省,淮南市', '淮南', '中国,安徽,淮南', '2', '0554', '232000', 'Huainan', 'HN', 'H', '117.025', '32.6459', '');
INSERT INTO `t_order_region` VALUES ('1132', '340402', '340400', '大通区', '中国,安徽省,淮南市,大通区', '大通', '中国,安徽,淮南,大通', '3', '0554', '232000', 'Datong', 'DT', 'D', '117.053', '32.6326', '');
INSERT INTO `t_order_region` VALUES ('1133', '340403', '340400', '田家庵区', '中国,安徽省,淮南市,田家庵区', '田家庵', '中国,安徽,淮南,田家庵', '3', '0554', '232000', 'Tianjiaan', 'TJA', 'T', '117.017', '32.647', '');
INSERT INTO `t_order_region` VALUES ('1134', '340404', '340400', '谢家集区', '中国,安徽省,淮南市,谢家集区', '谢家集', '中国,安徽,淮南,谢家集', '3', '0554', '232000', 'Xiejiaji', 'XJJ', 'X', '116.864', '32.5982', '');
INSERT INTO `t_order_region` VALUES ('1135', '340405', '340400', '八公山区', '中国,安徽省,淮南市,八公山区', '八公山', '中国,安徽,淮南,八公山', '3', '0554', '232000', 'Bagongshan', 'BGS', 'B', '116.837', '32.6294', '');
INSERT INTO `t_order_region` VALUES ('1136', '340406', '340400', '潘集区', '中国,安徽省,淮南市,潘集区', '潘集', '中国,安徽,淮南,潘集', '3', '0554', '232000', 'Panji', 'PJ', 'P', '116.816', '32.7829', '');
INSERT INTO `t_order_region` VALUES ('1137', '340421', '340400', '凤台县', '中国,安徽省,淮南市,凤台县', '凤台', '中国,安徽,淮南,凤台', '3', '0554', '232100', 'Fengtai', 'FT', 'F', '116.716', '32.7075', '');
INSERT INTO `t_order_region` VALUES ('1138', '340422', '340400', '寿县', '中国,安徽省,淮南市,寿县', '寿县', '中国,安徽,淮南,寿县', '3', '0554', '232200', 'Shouxian', 'SX', 'S', '116.785', '32.5765', '');
INSERT INTO `t_order_region` VALUES ('1139', '340423', '340400', '山南新区', '中国,安徽省,淮南市,山南新区', '山南新区', '中国,安徽,淮南,山南新区', '3', '0554', '232000', 'Shannan', 'SN', 'S', '117.025', '32.6459', '新区');
INSERT INTO `t_order_region` VALUES ('1140', '340424', '340400', '毛集实验区', '中国,安徽省,淮南市,毛集实验区', '毛集实验区', '中国,安徽,淮南,毛集实验区', '3', '0554', '232180', 'Maoji', 'MJ', 'M', '116.636', '32.6547', '实验区');
INSERT INTO `t_order_region` VALUES ('1141', '340425', '340400', '经济开发区', '中国,安徽省,淮南市,经济开发区', '经济开发区', '中国,安徽,淮南,经济开发区', '3', '0554', '232000', 'Jingjikaifaqu', 'JJ', 'J', '117.064', '32.6603', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1142', '340500', '340000', '马鞍山市', '中国,安徽省,马鞍山市', '马鞍山', '中国,安徽,马鞍山', '2', '0555', '243000', 'Ma\'anshan', 'MAS', 'M', '118.508', '31.6894', '');
INSERT INTO `t_order_region` VALUES ('1143', '340503', '340500', '花山区', '中国,安徽省,马鞍山市,花山区', '花山', '中国,安徽,马鞍山,花山', '3', '0555', '243000', 'Huashan', 'HS', 'H', '118.512', '31.7001', '');
INSERT INTO `t_order_region` VALUES ('1144', '340504', '340500', '雨山区', '中国,安徽省,马鞍山市,雨山区', '雨山', '中国,安徽,马鞍山,雨山', '3', '0555', '243000', 'Yushan', 'YS', 'Y', '118.499', '31.6822', '');
INSERT INTO `t_order_region` VALUES ('1145', '340506', '340500', '博望区', '中国,安徽省,马鞍山市,博望区', '博望', '中国,安徽,马鞍山,博望', '3', '0555', '243131', 'Bowang', 'BW', 'B', '118.844', '31.5619', '');
INSERT INTO `t_order_region` VALUES ('1146', '340521', '340500', '当涂县', '中国,安徽省,马鞍山市,当涂县', '当涂', '中国,安徽,马鞍山,当涂', '3', '0555', '243100', 'Dangtu', 'DT', 'D', '118.498', '31.571', '');
INSERT INTO `t_order_region` VALUES ('1147', '340522', '340500', '含山县', '中国,安徽省,马鞍山市,含山县', '含山', '中国,安徽,马鞍山,含山', '3', '0555', '238100', 'Hanshan ', 'HS', 'H', '118.106', '31.7278', '');
INSERT INTO `t_order_region` VALUES ('1148', '340523', '340500', '和县', '中国,安徽省,马鞍山市,和县', '和县', '中国,安徽,马鞍山,和县', '3', '0555', '238200', 'Hexian', 'HX', 'H', '118.351', '31.7418', '');
INSERT INTO `t_order_region` VALUES ('1149', '340600', '340000', '淮北市', '中国,安徽省,淮北市', '淮北', '中国,安徽,淮北', '2', '0561', '235000', 'Huaibei', 'HB', 'H', '116.795', '33.9717', '');
INSERT INTO `t_order_region` VALUES ('1150', '340602', '340600', '杜集区', '中国,安徽省,淮北市,杜集区', '杜集', '中国,安徽,淮北,杜集', '3', '0561', '235000', 'Duji', 'DJ', 'D', '116.83', '33.9936', '');
INSERT INTO `t_order_region` VALUES ('1151', '340603', '340600', '相山区', '中国,安徽省,淮北市,相山区', '相山', '中国,安徽,淮北,相山', '3', '0561', '235000', 'Xiangshan', 'XS', 'X', '116.795', '33.9598', '');
INSERT INTO `t_order_region` VALUES ('1152', '340604', '340600', '烈山区', '中国,安徽省,淮北市,烈山区', '烈山', '中国,安徽,淮北,烈山', '3', '0561', '235000', 'Lieshan', 'LS', 'L', '116.814', '33.8936', '');
INSERT INTO `t_order_region` VALUES ('1153', '340621', '340600', '濉溪县', '中国,安徽省,淮北市,濉溪县', '濉溪', '中国,安徽,淮北,濉溪', '3', '0561', '235100', 'Suixi', 'SX', 'S', '116.768', '33.9146', '');
INSERT INTO `t_order_region` VALUES ('1154', '340700', '340000', '铜陵市', '中国,安徽省,铜陵市', '铜陵', '中国,安徽,铜陵', '2', '0562', '244000', 'Tongling', 'TL', 'T', '117.817', '30.9299', '');
INSERT INTO `t_order_region` VALUES ('1155', '340705', '340700', '铜官区', '中国,安徽省,铜陵市,铜官区', '铜官', '中国,安徽,铜陵,铜官', '3', '0562', '244000', 'Tongguan', 'TG', 'T', '117.815', '30.9342', '');
INSERT INTO `t_order_region` VALUES ('1156', '340706', '340700', '义安区', '中国,安徽省,铜陵市,义安区', '义安', '中国,安徽,铜陵,义安', '3', '0562', '244100', 'Yi\'an', 'YA', 'Y', '117.791', '30.9536', '');
INSERT INTO `t_order_region` VALUES ('1157', '340711', '340700', '郊区', '中国,安徽省,铜陵市,郊区', '郊区', '中国,安徽,铜陵,郊区', '3', '0562', '244000', 'Jiaoqu', 'JQ', 'J', '117.809', '30.9198', '');
INSERT INTO `t_order_region` VALUES ('1158', '340722', '340700', '枞阳县', '中国,安徽省,铜陵市,枞阳县', '枞阳', '中国,安徽,铜陵,枞阳', '3', '0562', '246700', 'Zongyang', 'ZY', 'Z', '117.22', '30.6996', '');
INSERT INTO `t_order_region` VALUES ('1159', '340800', '340000', '安庆市', '中国,安徽省,安庆市', '安庆', '中国,安徽,安庆', '2', '0556', '246000', 'Anqing', 'AQ', 'A', '117.054', '30.5248', '');
INSERT INTO `t_order_region` VALUES ('1160', '340802', '340800', '迎江区', '中国,安徽省,安庆市,迎江区', '迎江', '中国,安徽,安庆,迎江', '3', '0556', '246001', 'Yingjiang', 'YJ', 'Y', '117.049', '30.5042', '');
INSERT INTO `t_order_region` VALUES ('1161', '340803', '340800', '大观区', '中国,安徽省,安庆市,大观区', '大观', '中国,安徽,安庆,大观', '3', '0556', '246002', 'Daguan', 'DG', 'D', '117.034', '30.5122', '');
INSERT INTO `t_order_region` VALUES ('1162', '340811', '340800', '宜秀区', '中国,安徽省,安庆市,宜秀区', '宜秀', '中国,安徽,安庆,宜秀', '3', '0556', '246003', 'Yixiu', 'YX', 'Y', '117.061', '30.5078', '');
INSERT INTO `t_order_region` VALUES ('1163', '340822', '340800', '怀宁县', '中国,安徽省,安庆市,怀宁县', '怀宁', '中国,安徽,安庆,怀宁', '3', '0556', '246100', 'Huaining', 'HN', 'H', '116.83', '30.7338', '');
INSERT INTO `t_order_region` VALUES ('1164', '340824', '340800', '潜山县', '中国,安徽省,安庆市,潜山县', '潜山', '中国,安徽,安庆,潜山', '3', '0556', '246300', 'Qianshan', 'QS', 'Q', '116.576', '30.6304', '');
INSERT INTO `t_order_region` VALUES ('1165', '340825', '340800', '太湖县', '中国,安徽省,安庆市,太湖县', '太湖', '中国,安徽,安庆,太湖', '3', '0556', '246400', 'Taihu', 'TH', 'T', '116.309', '30.4541', '');
INSERT INTO `t_order_region` VALUES ('1166', '340826', '340800', '宿松县', '中国,安徽省,安庆市,宿松县', '宿松', '中国,安徽,安庆,宿松', '3', '0556', '246500', 'Susong', 'SS', 'S', '116.129', '30.1536', '');
INSERT INTO `t_order_region` VALUES ('1167', '340827', '340800', '望江县', '中国,安徽省,安庆市,望江县', '望江', '中国,安徽,安庆,望江', '3', '0556', '246200', 'Wangjiang', 'WJ', 'W', '116.688', '30.1259', '');
INSERT INTO `t_order_region` VALUES ('1168', '340828', '340800', '岳西县', '中国,安徽省,安庆市,岳西县', '岳西', '中国,安徽,安庆,岳西', '3', '0556', '246600', 'Yuexi', 'YX', 'Y', '116.36', '30.8498', '');
INSERT INTO `t_order_region` VALUES ('1169', '340881', '340800', '桐城市', '中国,安徽省,安庆市,桐城市', '桐城', '中国,安徽,安庆,桐城', '3', '0556', '231400', 'Tongcheng', 'TC', 'T', '116.951', '31.0522', '');
INSERT INTO `t_order_region` VALUES ('1170', '341000', '340000', '黄山市', '中国,安徽省,黄山市', '黄山', '中国,安徽,黄山', '2', '0559', '242700', 'Huangshan', 'HS', 'H', '118.317', '29.7092', '');
INSERT INTO `t_order_region` VALUES ('1171', '341002', '341000', '屯溪区', '中国,安徽省,黄山市,屯溪区', '屯溪', '中国,安徽,黄山,屯溪', '3', '0559', '245000', 'Tunxi', 'TX', 'T', '118.334', '29.7114', '');
INSERT INTO `t_order_region` VALUES ('1172', '341003', '341000', '黄山区', '中国,安徽省,黄山市,黄山区', '黄山', '中国,安徽,黄山,黄山', '3', '0559', '242700', 'Huangshan', 'HS', 'H', '118.142', '30.2729', '');
INSERT INTO `t_order_region` VALUES ('1173', '341004', '341000', '徽州区', '中国,安徽省,黄山市,徽州区', '徽州', '中国,安徽,黄山,徽州', '3', '0559', '245061', 'Huizhou', 'HZ', 'H', '118.337', '29.8278', '');
INSERT INTO `t_order_region` VALUES ('1174', '341021', '341000', '歙县', '中国,安徽省,黄山市,歙县', '歙县', '中国,安徽,黄山,歙县', '3', '0559', '245200', 'Shexian', 'SX', 'S', '118.437', '29.8675', '');
INSERT INTO `t_order_region` VALUES ('1175', '341022', '341000', '休宁县', '中国,安徽省,黄山市,休宁县', '休宁', '中国,安徽,黄山,休宁', '3', '0559', '245400', 'Xiuning', 'XN', 'X', '118.181', '29.7861', '');
INSERT INTO `t_order_region` VALUES ('1176', '341023', '341000', '黟县', '中国,安徽省,黄山市,黟县', '黟县', '中国,安徽,黄山,黟县', '3', '0559', '245500', 'Yixian', 'YX', 'Y', '117.941', '29.9259', '');
INSERT INTO `t_order_region` VALUES ('1177', '341024', '341000', '祁门县', '中国,安徽省,黄山市,祁门县', '祁门', '中国,安徽,黄山,祁门', '3', '0559', '245600', 'Qimen', 'QM', 'Q', '117.718', '29.8572', '');
INSERT INTO `t_order_region` VALUES ('1178', '341100', '340000', '滁州市', '中国,安徽省,滁州市', '滁州', '中国,安徽,滁州', '2', '0550', '239000', 'Chuzhou', 'CZ', 'C', '118.316', '32.3036', '');
INSERT INTO `t_order_region` VALUES ('1179', '341102', '341100', '琅琊区', '中国,安徽省,滁州市,琅琊区', '琅琊', '中国,安徽,滁州,琅琊', '3', '0550', '239000', 'Langya', 'LY', 'L', '118.305', '32.2952', '');
INSERT INTO `t_order_region` VALUES ('1180', '341103', '341100', '南谯区', '中国,安徽省,滁州市,南谯区', '南谯', '中国,安徽,滁州,南谯', '3', '0550', '239000', 'Nanqiao', 'NQ', 'N', '118.312', '32.3186', '');
INSERT INTO `t_order_region` VALUES ('1181', '341122', '341100', '来安县', '中国,安徽省,滁州市,来安县', '来安', '中国,安徽,滁州,来安', '3', '0550', '239200', 'Lai\'an', 'LA', 'L', '118.434', '32.4518', '');
INSERT INTO `t_order_region` VALUES ('1182', '341124', '341100', '全椒县', '中国,安徽省,滁州市,全椒县', '全椒', '中国,安徽,滁州,全椒', '3', '0550', '239500', 'Quanjiao', 'QJ', 'Q', '118.273', '32.0852', '');
INSERT INTO `t_order_region` VALUES ('1183', '341125', '341100', '定远县', '中国,安徽省,滁州市,定远县', '定远', '中国,安徽,滁州,定远', '3', '0550', '233200', 'Dingyuan', 'DY', 'D', '117.68', '32.5249', '');
INSERT INTO `t_order_region` VALUES ('1184', '341126', '341100', '凤阳县', '中国,安徽省,滁州市,凤阳县', '凤阳', '中国,安徽,滁州,凤阳', '3', '0550', '233100', 'Fengyang', 'FY', 'F', '117.565', '32.8651', '');
INSERT INTO `t_order_region` VALUES ('1185', '341181', '341100', '天长市', '中国,安徽省,滁州市,天长市', '天长', '中国,安徽,滁州,天长', '3', '0550', '239300', 'Tianchang', 'TC', 'T', '118.999', '32.6912', '');
INSERT INTO `t_order_region` VALUES ('1186', '341182', '341100', '明光市', '中国,安徽省,滁州市,明光市', '明光', '中国,安徽,滁州,明光', '3', '0550', '239400', 'Mingguang', 'MG', 'M', '117.991', '32.7782', '');
INSERT INTO `t_order_region` VALUES ('1187', '341200', '340000', '阜阳市', '中国,安徽省,阜阳市', '阜阳', '中国,安徽,阜阳', '2', '0558', '236000', 'Fuyang', 'FY', 'F', '115.82', '32.897', '');
INSERT INTO `t_order_region` VALUES ('1188', '341202', '341200', '颍州区', '中国,安徽省,阜阳市,颍州区', '颍州', '中国,安徽,阜阳,颍州', '3', '0558', '236000', 'Yingzhou', 'YZ', 'Y', '115.807', '32.8835', '');
INSERT INTO `t_order_region` VALUES ('1189', '341203', '341200', '颍东区', '中国,安徽省,阜阳市,颍东区', '颍东', '中国,安徽,阜阳,颍东', '3', '0558', '236000', 'Yingdong', 'YD', 'Y', '115.857', '32.913', '');
INSERT INTO `t_order_region` VALUES ('1190', '341204', '341200', '颍泉区', '中国,安徽省,阜阳市,颍泉区', '颍泉', '中国,安徽,阜阳,颍泉', '3', '0558', '236000', 'Yingquan', 'YQ', 'Y', '115.807', '32.9249', '');
INSERT INTO `t_order_region` VALUES ('1191', '341221', '341200', '临泉县', '中国,安徽省,阜阳市,临泉县', '临泉', '中国,安徽,阜阳,临泉', '3', '0558', '236400', 'Linquan', 'LQ', 'L', '115.262', '33.0676', '');
INSERT INTO `t_order_region` VALUES ('1192', '341222', '341200', '太和县', '中国,安徽省,阜阳市,太和县', '太和', '中国,安徽,阜阳,太和', '3', '0558', '236600', 'Taihe', 'TH', 'T', '115.622', '33.1603', '');
INSERT INTO `t_order_region` VALUES ('1193', '341225', '341200', '阜南县', '中国,安徽省,阜阳市,阜南县', '阜南', '中国,安徽,阜阳,阜南', '3', '0558', '236300', 'Funan', 'FN', 'F', '115.586', '32.6355', '');
INSERT INTO `t_order_region` VALUES ('1194', '341226', '341200', '颍上县', '中国,安徽省,阜阳市,颍上县', '颍上', '中国,安徽,阜阳,颍上', '3', '0558', '236200', 'Yingshang', 'YS', 'Y', '116.265', '32.63', '');
INSERT INTO `t_order_region` VALUES ('1195', '341282', '341200', '界首市', '中国,安徽省,阜阳市,界首市', '界首', '中国,安徽,阜阳,界首', '3', '0558', '236500', 'Jieshou', 'JS', 'J', '115.374', '33.2571', '');
INSERT INTO `t_order_region` VALUES ('1196', '341283', '341200', '经济开发区', '中国,安徽省,阜阳市,经济开发区', '经济开发区', '中国,安徽,阜阳,经济开发区', '3', '0558', '236000', 'Jingjikaifaqu', 'JJKFQ', 'J', '115.857', '32.8651', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1197', '341300', '340000', '宿州市', '中国,安徽省,宿州市', '宿州', '中国,安徽,宿州', '2', '0557', '234000', 'Suzhou', 'SZ', 'S', '116.984', '33.6339', '');
INSERT INTO `t_order_region` VALUES ('1198', '341302', '341300', '埇桥区', '中国,安徽省,宿州市,埇桥区', '埇桥', '中国,安徽,宿州,埇桥', '3', '0557', '234000', 'Yongqiao', 'YQ', 'Y', '116.977', '33.6406', '');
INSERT INTO `t_order_region` VALUES ('1199', '341321', '341300', '砀山县', '中国,安徽省,宿州市,砀山县', '砀山', '中国,安徽,宿州,砀山', '3', '0557', '235300', 'Dangshan', 'DS', 'D', '116.354', '34.4236', '');
INSERT INTO `t_order_region` VALUES ('1200', '341322', '341300', '萧县', '中国,安徽省,宿州市,萧县', '萧县', '中国,安徽,宿州,萧县', '3', '0557', '235200', 'Xiaoxian', 'XX', 'X', '116.945', '34.1879', '');
INSERT INTO `t_order_region` VALUES ('1201', '341323', '341300', '灵璧县', '中国,安徽省,宿州市,灵璧县', '灵璧', '中国,安徽,宿州,灵璧', '3', '0557', '234200', 'Lingbi', 'LB', 'L', '117.558', '33.5434', '');
INSERT INTO `t_order_region` VALUES ('1202', '341324', '341300', '泗县', '中国,安徽省,宿州市,泗县', '泗县', '中国,安徽,宿州,泗县', '3', '0557', '234300', 'Sixian', 'SX', 'S', '117.91', '33.4829', '');
INSERT INTO `t_order_region` VALUES ('1203', '341325', '341300', '经济开发区', '中国,安徽省,宿州市,经济开发区', '经济开发区', '中国,安徽,宿州,经济开发区', '3', '0557', '234000', 'Jingjikaifaqu', 'JJKFQ', 'J', '117.01', '33.5986', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1204', '341500', '340000', '六安市', '中国,安徽省,六安市', '六安', '中国,安徽,六安', '2', '0564', '237000', 'Lu\'an', 'LA', 'L', '116.508', '31.7529', '');
INSERT INTO `t_order_region` VALUES ('1205', '341502', '341500', '金安区', '中国,安徽省,六安市,金安区', '金安', '中国,安徽,六安,金安', '3', '0564', '237000', 'Jin\'an', 'JA', 'J', '116.509', '31.7557', '');
INSERT INTO `t_order_region` VALUES ('1206', '341503', '341500', '裕安区', '中国,安徽省,六安市,裕安区', '裕安', '中国,安徽,六安,裕安', '3', '0564', '237000', 'Yu\'an', 'YA', 'Y', '116.48', '31.7379', '');
INSERT INTO `t_order_region` VALUES ('1207', '341504', '341500', '叶集区', '中国,安徽省,六安市,叶集区', '叶集', '中国,安徽,六安,叶集', '3', '0564', '237431', 'Yeji', 'YJ', 'Y', '115.948', '31.863', '');
INSERT INTO `t_order_region` VALUES ('1208', '341522', '341500', '霍邱县', '中国,安徽省,六安市,霍邱县', '霍邱', '中国,安徽,六安,霍邱', '3', '0564', '237400', 'Huoqiu', 'HQ', 'H', '116.278', '32.353', '');
INSERT INTO `t_order_region` VALUES ('1209', '341523', '341500', '舒城县', '中国,安徽省,六安市,舒城县', '舒城', '中国,安徽,六安,舒城', '3', '0564', '231300', 'Shucheng', 'SC', 'S', '116.945', '31.4641', '');
INSERT INTO `t_order_region` VALUES ('1210', '341524', '341500', '金寨县', '中国,安徽省,六安市,金寨县', '金寨', '中国,安徽,六安,金寨', '3', '0564', '237300', 'Jinzhai', 'JZ', 'J', '115.935', '31.7351', '');
INSERT INTO `t_order_region` VALUES ('1211', '341525', '341500', '霍山县', '中国,安徽省,六安市,霍山县', '霍山', '中国,安徽,六安,霍山', '3', '0564', '237200', 'Huoshan', 'HS', 'H', '116.333', '31.3929', '');
INSERT INTO `t_order_region` VALUES ('1212', '341600', '340000', '亳州市', '中国,安徽省,亳州市', '亳州', '中国,安徽,亳州', '2', '0558', '236000', 'Bozhou', 'BZ', 'B', '115.783', '33.8693', '');
INSERT INTO `t_order_region` VALUES ('1213', '341602', '341600', '谯城区', '中国,安徽省,亳州市,谯城区', '谯城', '中国,安徽,亳州,谯城', '3', '0558', '236800', 'Qiaocheng', 'QC', 'Q', '115.779', '33.8753', '');
INSERT INTO `t_order_region` VALUES ('1214', '341621', '341600', '涡阳县', '中国,安徽省,亳州市,涡阳县', '涡阳', '中国,安徽,亳州,涡阳', '3', '0558', '233600', 'Guoyang', 'GY', 'G', '116.217', '33.5091', '');
INSERT INTO `t_order_region` VALUES ('1215', '341622', '341600', '蒙城县', '中国,安徽省,亳州市,蒙城县', '蒙城', '中国,安徽,亳州,蒙城', '3', '0558', '233500', 'Mengcheng', 'MC', 'M', '116.565', '33.2648', '');
INSERT INTO `t_order_region` VALUES ('1216', '341623', '341600', '利辛县', '中国,安徽省,亳州市,利辛县', '利辛', '中国,安徽,亳州,利辛', '3', '0558', '236700', 'Lixin', 'LX', 'L', '116.208', '33.142', '');
INSERT INTO `t_order_region` VALUES ('1217', '341700', '340000', '池州市', '中国,安徽省,池州市', '池州', '中国,安徽,池州', '2', '0566', '247100', 'Chizhou', 'CZ', 'C', '117.489', '30.656', '');
INSERT INTO `t_order_region` VALUES ('1218', '341702', '341700', '贵池区', '中国,安徽省,池州市,贵池区', '贵池', '中国,安徽,池州,贵池', '3', '0566', '247100', 'Guichi', 'GC', 'G', '117.487', '30.6528', '');
INSERT INTO `t_order_region` VALUES ('1219', '341721', '341700', '东至县', '中国,安徽省,池州市,东至县', '东至', '中国,安徽,池州,东至', '3', '0566', '247200', 'Dongzhi', 'DZ', 'D', '117.027', '30.0969', '');
INSERT INTO `t_order_region` VALUES ('1220', '341722', '341700', '石台县', '中国,安徽省,池州市,石台县', '石台', '中国,安徽,池州,石台', '3', '0566', '245100', 'Shitai', 'ST', 'S', '117.487', '30.2104', '');
INSERT INTO `t_order_region` VALUES ('1221', '341723', '341700', '青阳县', '中国,安徽省,池州市,青阳县', '青阳', '中国,安徽,池州,青阳', '3', '0566', '242800', 'Qingyang', 'QY', 'Q', '117.847', '30.6393', '');
INSERT INTO `t_order_region` VALUES ('1222', '341800', '340000', '宣城市', '中国,安徽省,宣城市', '宣城', '中国,安徽,宣城', '2', '0563', '242000', 'Xuancheng', 'XC', 'X', '118.758', '30.9457', '');
INSERT INTO `t_order_region` VALUES ('1223', '341802', '341800', '宣州区', '中国,安徽省,宣城市,宣州区', '宣州', '中国,安徽,宣城,宣州', '3', '0563', '242000', 'Xuanzhou', 'XZ', 'X', '118.755', '30.9444', '');
INSERT INTO `t_order_region` VALUES ('1224', '341821', '341800', '郎溪县', '中国,安徽省,宣城市,郎溪县', '郎溪', '中国,安徽,宣城,郎溪', '3', '0563', '242100', 'Langxi', 'LX', 'L', '119.179', '31.126', '');
INSERT INTO `t_order_region` VALUES ('1225', '341822', '341800', '广德县', '中国,安徽省,宣城市,广德县', '广德', '中国,安徽,宣城,广德', '3', '0563', '242200', 'Guangde', 'GD', 'G', '119.418', '30.8937', '');
INSERT INTO `t_order_region` VALUES ('1226', '341823', '341800', '泾县', '中国,安徽省,宣城市,泾县', '泾县', '中国,安徽,宣城,泾县', '3', '0563', '242500', 'Jingxian', 'JX', 'J', '118.42', '30.695', '');
INSERT INTO `t_order_region` VALUES ('1227', '341824', '341800', '绩溪县', '中国,安徽省,宣城市,绩溪县', '绩溪', '中国,安徽,宣城,绩溪', '3', '0563', '245300', 'Jixi', 'JX', 'J', '118.598', '30.0707', '');
INSERT INTO `t_order_region` VALUES ('1228', '341825', '341800', '旌德县', '中国,安徽省,宣城市,旌德县', '旌德', '中国,安徽,宣城,旌德', '3', '0563', '242600', 'Jingde', 'JD', 'J', '118.543', '30.289', '');
INSERT INTO `t_order_region` VALUES ('1229', '341881', '341800', '宁国市', '中国,安徽省,宣城市,宁国市', '宁国', '中国,安徽,宣城,宁国', '3', '0563', '242300', 'Ningguo', 'NG', 'N', '118.983', '30.6238', '');
INSERT INTO `t_order_region` VALUES ('1230', '350000', '100000', '福建省', '中国,福建省', '福建', '中国,福建', '1', '', '', 'Fujian', 'FJ', 'F', '119.306', '26.0753', '');
INSERT INTO `t_order_region` VALUES ('1231', '350100', '350000', '福州市', '中国,福建省,福州市', '福州', '中国,福建,福州', '2', '0591', '350000', 'Fuzhou', 'FZ', 'F', '119.306', '26.0753', '');
INSERT INTO `t_order_region` VALUES ('1232', '350102', '350100', '鼓楼区', '中国,福建省,福州市,鼓楼区', '鼓楼', '中国,福建,福州,鼓楼', '3', '0591', '350000', 'Gulou', 'GL', 'G', '119.304', '26.0823', '');
INSERT INTO `t_order_region` VALUES ('1233', '350103', '350100', '台江区', '中国,福建省,福州市,台江区', '台江', '中国,福建,福州,台江', '3', '0591', '350000', 'Taijiang', 'TJ', 'T', '119.309', '26.062', '');
INSERT INTO `t_order_region` VALUES ('1234', '350104', '350100', '仓山区', '中国,福建省,福州市,仓山区', '仓山', '中国,福建,福州,仓山', '3', '0591', '350000', 'Cangshan', 'CS', 'C', '119.315', '26.0434', '');
INSERT INTO `t_order_region` VALUES ('1235', '350105', '350100', '马尾区', '中国,福建省,福州市,马尾区', '马尾', '中国,福建,福州,马尾', '3', '0591', '350000', 'Mawei', 'MW', 'M', '119.455', '25.9894', '');
INSERT INTO `t_order_region` VALUES ('1236', '350111', '350100', '晋安区', '中国,福建省,福州市,晋安区', '晋安', '中国,福建,福州,晋安', '3', '0591', '350000', 'Jin\'an', 'JA', 'J', '119.328', '26.0818', '');
INSERT INTO `t_order_region` VALUES ('1237', '350121', '350100', '闽侯县', '中国,福建省,福州市,闽侯县', '闽侯', '中国,福建,福州,闽侯', '3', '0591', '350100', 'Minhou', 'MH', 'M', '119.134', '26.1501', '');
INSERT INTO `t_order_region` VALUES ('1238', '350122', '350100', '连江县', '中国,福建省,福州市,连江县', '连江', '中国,福建,福州,连江', '3', '0591', '350500', 'Lianjiang', 'LJ', 'L', '119.534', '26.1947', '');
INSERT INTO `t_order_region` VALUES ('1239', '350123', '350100', '罗源县', '中国,福建省,福州市,罗源县', '罗源', '中国,福建,福州,罗源', '3', '0591', '350600', 'Luoyuan', 'LY', 'L', '119.551', '26.4875', '');
INSERT INTO `t_order_region` VALUES ('1240', '350124', '350100', '闽清县', '中国,福建省,福州市,闽清县', '闽清', '中国,福建,福州,闽清', '3', '0591', '350800', 'Minqing', 'MQ', 'M', '118.862', '26.219', '');
INSERT INTO `t_order_region` VALUES ('1241', '350125', '350100', '永泰县', '中国,福建省,福州市,永泰县', '永泰', '中国,福建,福州,永泰', '3', '0591', '350700', 'Yongtai', 'YT', 'Y', '118.936', '25.8682', '');
INSERT INTO `t_order_region` VALUES ('1242', '350128', '350100', '平潭县', '中国,福建省,福州市,平潭县', '平潭', '中国,福建,福州,平潭', '3', '0591', '350400', 'Pingtan', 'PT', 'P', '119.791', '25.5037', '');
INSERT INTO `t_order_region` VALUES ('1243', '350181', '350100', '福清市', '中国,福建省,福州市,福清市', '福清', '中国,福建,福州,福清', '3', '0591', '350300', 'Fuqing', 'FQ', 'F', '119.385', '25.7209', '');
INSERT INTO `t_order_region` VALUES ('1244', '350182', '350100', '长乐市', '中国,福建省,福州市,长乐市', '长乐', '中国,福建,福州,长乐', '3', '0591', '350200', 'Changle', 'CL', 'C', '119.523', '25.9628', '');
INSERT INTO `t_order_region` VALUES ('1245', '350183', '350100', '福州新区', '中国,福建省,福州市,福州新区', '福州新区', '中国,福建,福州,福州新区', '3', '0591', '350000', 'FuzhouXinqu', 'FZXQ', 'F', '119.266', '26.0507', '国家级新区');
INSERT INTO `t_order_region` VALUES ('1246', '350200', '350000', '厦门市', '中国,福建省,厦门市', '厦门', '中国,福建,厦门', '2', '0592', '361000', 'Xiamen', 'XM', 'X', '118.11', '24.4905', '');
INSERT INTO `t_order_region` VALUES ('1247', '350203', '350200', '思明区', '中国,福建省,厦门市,思明区', '思明', '中国,福建,厦门,思明', '3', '0592', '361000', 'Siming', 'SM', 'S', '118.082', '24.4454', '');
INSERT INTO `t_order_region` VALUES ('1248', '350205', '350200', '海沧区', '中国,福建省,厦门市,海沧区', '海沧', '中国,福建,厦门,海沧', '3', '0592', '361000', 'Haicang', 'HC', 'H', '118.033', '24.4846', '');
INSERT INTO `t_order_region` VALUES ('1249', '350206', '350200', '湖里区', '中国,福建省,厦门市,湖里区', '湖里', '中国,福建,厦门,湖里', '3', '0592', '361000', 'Huli', 'HL', 'H', '118.146', '24.5125', '');
INSERT INTO `t_order_region` VALUES ('1250', '350211', '350200', '集美区', '中国,福建省,厦门市,集美区', '集美', '中国,福建,厦门,集美', '3', '0592', '361000', 'Jimei', 'JM', 'J', '118.097', '24.5758', '');
INSERT INTO `t_order_region` VALUES ('1251', '350212', '350200', '同安区', '中国,福建省,厦门市,同安区', '同安', '中国,福建,厦门,同安', '3', '0592', '361100', 'Tong\'an', 'TA', 'T', '118.152', '24.7231', '');
INSERT INTO `t_order_region` VALUES ('1252', '350213', '350200', '翔安区', '中国,福建省,厦门市,翔安区', '翔安', '中国,福建,厦门,翔安', '3', '0592', '361100', 'Xiang\'an', 'XA', 'X', '118.248', '24.6186', '');
INSERT INTO `t_order_region` VALUES ('1253', '350300', '350000', '莆田市', '中国,福建省,莆田市', '莆田', '中国,福建,莆田', '2', '0594', '351100', 'Putian', 'PT', 'P', '119.008', '25.431', '');
INSERT INTO `t_order_region` VALUES ('1254', '350302', '350300', '城厢区', '中国,福建省,莆田市,城厢区', '城厢', '中国,福建,莆田,城厢', '3', '0594', '351100', 'Chengxiang', 'CX', 'C', '118.995', '25.4187', '');
INSERT INTO `t_order_region` VALUES ('1255', '350303', '350300', '涵江区', '中国,福建省,莆田市,涵江区', '涵江', '中国,福建,莆田,涵江', '3', '0594', '351100', 'Hanjiang', 'HJ', 'H', '119.116', '25.4588', '');
INSERT INTO `t_order_region` VALUES ('1256', '350304', '350300', '荔城区', '中国,福建省,莆田市,荔城区', '荔城', '中国,福建,莆田,荔城', '3', '0594', '351100', 'Licheng', 'LC', 'L', '119.013', '25.4337', '');
INSERT INTO `t_order_region` VALUES ('1257', '350305', '350300', '秀屿区', '中国,福建省,莆田市,秀屿区', '秀屿', '中国,福建,莆田,秀屿', '3', '0594', '351100', 'Xiuyu', 'XY', 'X', '119.106', '25.3183', '');
INSERT INTO `t_order_region` VALUES ('1258', '350322', '350300', '仙游县', '中国,福建省,莆田市,仙游县', '仙游', '中国,福建,莆田,仙游', '3', '0594', '351200', 'Xianyou', 'XY', 'X', '118.692', '25.3621', '');
INSERT INTO `t_order_region` VALUES ('1259', '350400', '350000', '三明市', '中国,福建省,三明市', '三明', '中国,福建,三明', '2', '0598', '365000', 'Sanming', 'SM', 'S', '117.635', '26.2654', '');
INSERT INTO `t_order_region` VALUES ('1260', '350402', '350400', '梅列区', '中国,福建省,三明市,梅列区', '梅列', '中国,福建,三明,梅列', '3', '0598', '365000', 'Meilie', 'ML', 'M', '117.646', '26.2717', '');
INSERT INTO `t_order_region` VALUES ('1261', '350403', '350400', '三元区', '中国,福建省,三明市,三元区', '三元', '中国,福建,三明,三元', '3', '0598', '365000', 'Sanyuan', 'SY', 'S', '117.608', '26.2337', '');
INSERT INTO `t_order_region` VALUES ('1262', '350421', '350400', '明溪县', '中国,福建省,三明市,明溪县', '明溪', '中国,福建,三明,明溪', '3', '0598', '365200', 'Mingxi', 'MX', 'M', '117.205', '26.3529', '');
INSERT INTO `t_order_region` VALUES ('1263', '350423', '350400', '清流县', '中国,福建省,三明市,清流县', '清流', '中国,福建,三明,清流', '3', '0598', '365300', 'Qingliu', 'QL', 'Q', '116.815', '26.1714', '');
INSERT INTO `t_order_region` VALUES ('1264', '350424', '350400', '宁化县', '中国,福建省,三明市,宁化县', '宁化', '中国,福建,三明,宁化', '3', '0598', '365400', 'Ninghua', 'NH', 'N', '116.661', '26.2587', '');
INSERT INTO `t_order_region` VALUES ('1265', '350425', '350400', '大田县', '中国,福建省,三明市,大田县', '大田', '中国,福建,三明,大田', '3', '0598', '366100', 'Datian', 'DT', 'D', '117.847', '25.6926', '');
INSERT INTO `t_order_region` VALUES ('1266', '350426', '350400', '尤溪县', '中国,福建省,三明市,尤溪县', '尤溪', '中国,福建,三明,尤溪', '3', '0598', '365100', 'Youxi', 'YX', 'Y', '118.19', '26.17', '');
INSERT INTO `t_order_region` VALUES ('1267', '350427', '350400', '沙县', '中国,福建省,三明市,沙县', '沙县', '中国,福建,三明,沙县', '3', '0598', '365500', 'Shaxian', 'SX', 'S', '117.793', '26.3962', '');
INSERT INTO `t_order_region` VALUES ('1268', '350428', '350400', '将乐县', '中国,福建省,三明市,将乐县', '将乐', '中国,福建,三明,将乐', '3', '0598', '353300', 'Jiangle', 'JL', 'J', '117.473', '26.7284', '');
INSERT INTO `t_order_region` VALUES ('1269', '350429', '350400', '泰宁县', '中国,福建省,三明市,泰宁县', '泰宁', '中国,福建,三明,泰宁', '3', '0598', '354400', 'Taining', 'TN', 'T', '117.176', '26.9001', '');
INSERT INTO `t_order_region` VALUES ('1270', '350430', '350400', '建宁县', '中国,福建省,三明市,建宁县', '建宁', '中国,福建,三明,建宁', '3', '0598', '354500', 'Jianning', 'JN', 'J', '116.846', '26.8309', '');
INSERT INTO `t_order_region` VALUES ('1271', '350481', '350400', '永安市', '中国,福建省,三明市,永安市', '永安', '中国,福建,三明,永安', '3', '0598', '366000', 'Yong\'an', 'YA', 'Y', '117.365', '25.9414', '');
INSERT INTO `t_order_region` VALUES ('1272', '350500', '350000', '泉州市', '中国,福建省,泉州市', '泉州', '中国,福建,泉州', '2', '0595', '362000', 'Quanzhou', 'QZ', 'Q', '118.589', '24.9089', '');
INSERT INTO `t_order_region` VALUES ('1273', '350502', '350500', '鲤城区', '中国,福建省,泉州市,鲤城区', '鲤城', '中国,福建,泉州,鲤城', '3', '0595', '362000', 'Licheng', 'LC', 'L', '118.566', '24.8874', '');
INSERT INTO `t_order_region` VALUES ('1274', '350503', '350500', '丰泽区', '中国,福建省,泉州市,丰泽区', '丰泽', '中国,福建,泉州,丰泽', '3', '0595', '362000', 'Fengze', 'FZ', 'F', '118.613', '24.8912', '');
INSERT INTO `t_order_region` VALUES ('1275', '350504', '350500', '洛江区', '中国,福建省,泉州市,洛江区', '洛江', '中国,福建,泉州,洛江', '3', '0595', '362000', 'Luojiang', 'LJ', 'L', '118.671', '24.9398', '');
INSERT INTO `t_order_region` VALUES ('1276', '350505', '350500', '泉港区', '中国,福建省,泉州市,泉港区', '泉港', '中国,福建,泉州,泉港', '3', '0595', '362800', 'Quangang', 'QG', 'Q', '118.916', '25.1201', '');
INSERT INTO `t_order_region` VALUES ('1277', '350521', '350500', '惠安县', '中国,福建省,泉州市,惠安县', '惠安', '中国,福建,泉州,惠安', '3', '0595', '362100', 'Hui\'an', 'HA', 'H', '118.797', '25.0306', '');
INSERT INTO `t_order_region` VALUES ('1278', '350524', '350500', '安溪县', '中国,福建省,泉州市,安溪县', '安溪', '中国,福建,泉州,安溪', '3', '0595', '362400', 'Anxi', 'AX', 'A', '118.187', '25.0563', '');
INSERT INTO `t_order_region` VALUES ('1279', '350525', '350500', '永春县', '中国,福建省,泉州市,永春县', '永春', '中国,福建,泉州,永春', '3', '0595', '362600', 'Yongchun', 'YC', 'Y', '118.294', '25.3218', '');
INSERT INTO `t_order_region` VALUES ('1280', '350526', '350500', '德化县', '中国,福建省,泉州市,德化县', '德化', '中国,福建,泉州,德化', '3', '0595', '362500', 'Dehua', 'DH', 'D', '118.242', '25.4922', '');
INSERT INTO `t_order_region` VALUES ('1281', '350527', '350500', '金门县', '中国,福建省,泉州市,金门县', '金门', '中国,福建,泉州,金门', '3', '0595', '362000', 'Jinmen', 'JM', 'J', '118.323', '24.4292', '');
INSERT INTO `t_order_region` VALUES ('1282', '350581', '350500', '石狮市', '中国,福建省,泉州市,石狮市', '石狮', '中国,福建,泉州,石狮', '3', '0595', '362700', 'Shishi', 'SS', 'S', '118.648', '24.7324', '');
INSERT INTO `t_order_region` VALUES ('1283', '350582', '350500', '晋江市', '中国,福建省,泉州市,晋江市', '晋江', '中国,福建,泉州,晋江', '3', '0595', '362200', 'Jinjiang', 'JJ', 'J', '118.552', '24.7814', '');
INSERT INTO `t_order_region` VALUES ('1284', '350583', '350500', '南安市', '中国,福建省,泉州市,南安市', '南安', '中国,福建,泉州,南安', '3', '0595', '362300', 'Nan\'an', 'NA', 'N', '118.386', '24.9606', '');
INSERT INTO `t_order_region` VALUES ('1285', '350584', '350500', '台商投资区', '中国,福建省,泉州市,台商投资区', '台商投资区', '中国,福建,泉州,台商投资区', '3', '0595', '362000', 'Taishangtouziqu', 'TS', 'T', '118.756', '24.886', '拓展');
INSERT INTO `t_order_region` VALUES ('1286', '350585', '350500', '经济技术开发区', '中国,福建省,泉州市,经济技术开发区', '经济技术开发区', '中国,福建,泉州,经济技术开发区', '3', '0595', '362000', 'JingJi', 'JJ', 'J', '118.548', '24.8651', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1287', '350586', '350500', '高新技术开发区', '中国,福建省,泉州市,高新技术开发区', '高新技术开发区', '中国,福建,泉州,高新技术开发区', '3', '0595', '362000', 'Gaoxin', 'GX', 'G', '118.545', '24.9049', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1288', '350587', '350500', '综合保税区', '中国,福建省,泉州市,综合保税区', '综合保税区', '中国,福建,泉州,综合保税区', '3', '0595', '362000', 'Baoshuiqu', 'BS', 'B', '118.68', '24.8877', '拓展');
INSERT INTO `t_order_region` VALUES ('1289', '350600', '350000', '漳州市', '中国,福建省,漳州市', '漳州', '中国,福建,漳州', '2', '0596', '363000', 'Zhangzhou', 'ZZ', 'Z', '117.662', '24.5109', '');
INSERT INTO `t_order_region` VALUES ('1290', '350602', '350600', '芗城区', '中国,福建省,漳州市,芗城区', '芗城', '中国,福建,漳州,芗城', '3', '0596', '363000', 'Xiangcheng', 'XC', 'X', '117.654', '24.5108', '');
INSERT INTO `t_order_region` VALUES ('1291', '350603', '350600', '龙文区', '中国,福建省,漳州市,龙文区', '龙文', '中国,福建,漳州,龙文', '3', '0596', '363000', 'Longwen', 'LW', 'L', '117.71', '24.5032', '');
INSERT INTO `t_order_region` VALUES ('1292', '350622', '350600', '云霄县', '中国,福建省,漳州市,云霄县', '云霄', '中国,福建,漳州,云霄', '3', '0596', '363300', 'Yunxiao', 'YX', 'Y', '117.341', '23.9553', '');
INSERT INTO `t_order_region` VALUES ('1293', '350623', '350600', '漳浦县', '中国,福建省,漳州市,漳浦县', '漳浦', '中国,福建,漳州,漳浦', '3', '0596', '363200', 'Zhangpu', 'ZP', 'Z', '117.614', '24.1171', '');
INSERT INTO `t_order_region` VALUES ('1294', '350624', '350600', '诏安县', '中国,福建省,漳州市,诏安县', '诏安', '中国,福建,漳州,诏安', '3', '0596', '363500', 'Zhao\'an', 'ZA', 'Z', '117.175', '23.7115', '');
INSERT INTO `t_order_region` VALUES ('1295', '350625', '350600', '长泰县', '中国,福建省,漳州市,长泰县', '长泰', '中国,福建,漳州,长泰', '3', '0596', '363900', 'Changtai', 'CT', 'C', '117.759', '24.6253', '');
INSERT INTO `t_order_region` VALUES ('1296', '350626', '350600', '东山县', '中国,福建省,漳州市,东山县', '东山', '中国,福建,漳州,东山', '3', '0596', '363400', 'Dongshan', 'DS', 'D', '117.428', '23.7011', '');
INSERT INTO `t_order_region` VALUES ('1297', '350627', '350600', '南靖县', '中国,福建省,漳州市,南靖县', '南靖', '中国,福建,漳州,南靖', '3', '0596', '363600', 'Nanjing', 'NJ', 'N', '117.357', '24.5145', '');
INSERT INTO `t_order_region` VALUES ('1298', '350628', '350600', '平和县', '中国,福建省,漳州市,平和县', '平和', '中国,福建,漳州,平和', '3', '0596', '363700', 'Pinghe', 'PH', 'P', '117.312', '24.364', '');
INSERT INTO `t_order_region` VALUES ('1299', '350629', '350600', '华安县', '中国,福建省,漳州市,华安县', '华安', '中国,福建,漳州,华安', '3', '0596', '363800', 'Hua\'an', 'HA', 'H', '117.541', '25.0056', '');
INSERT INTO `t_order_region` VALUES ('1300', '350681', '350600', '龙海市', '中国,福建省,漳州市,龙海市', '龙海', '中国,福建,漳州,龙海', '3', '0596', '363100', 'Longhai', 'LH', 'L', '117.818', '24.4466', '');
INSERT INTO `t_order_region` VALUES ('1301', '350700', '350000', '南平市', '中国,福建省,南平市', '南平', '中国,福建,南平', '2', '0599', '353000', 'Nanping', 'NP', 'N', '118.178', '26.6356', '');
INSERT INTO `t_order_region` VALUES ('1302', '350702', '350700', '延平区', '中国,福建省,南平市,延平区', '延平', '中国,福建,南平,延平', '3', '0599', '353000', 'Yanping', 'YP', 'Y', '118.182', '26.6374', '');
INSERT INTO `t_order_region` VALUES ('1303', '350703', '350700', '建阳区', '中国,福建省,南平市,建阳区', '建阳', '中国,福建,南平,建阳', '3', '0599', '354200', 'Jianyang', 'JY', 'J', '118.123', '27.3321', '');
INSERT INTO `t_order_region` VALUES ('1304', '350721', '350700', '顺昌县', '中国,福建省,南平市,顺昌县', '顺昌', '中国,福建,南平,顺昌', '3', '0599', '353200', 'Shunchang', 'SC', 'S', '117.81', '26.793', '');
INSERT INTO `t_order_region` VALUES ('1305', '350722', '350700', '浦城县', '中国,福建省,南平市,浦城县', '浦城', '中国,福建,南平,浦城', '3', '0599', '353400', 'Pucheng', 'PC', 'P', '118.54', '27.9189', '');
INSERT INTO `t_order_region` VALUES ('1306', '350723', '350700', '光泽县', '中国,福建省,南平市,光泽县', '光泽', '中国,福建,南平,光泽', '3', '0599', '354100', 'Guangze', 'GZ', 'G', '117.333', '27.5423', '');
INSERT INTO `t_order_region` VALUES ('1307', '350724', '350700', '松溪县', '中国,福建省,南平市,松溪县', '松溪', '中国,福建,南平,松溪', '3', '0599', '353500', 'Songxi', 'SX', 'S', '118.785', '27.5262', '');
INSERT INTO `t_order_region` VALUES ('1308', '350725', '350700', '政和县', '中国,福建省,南平市,政和县', '政和', '中国,福建,南平,政和', '3', '0599', '353600', 'Zhenghe', 'ZH', 'Z', '118.856', '27.3677', '');
INSERT INTO `t_order_region` VALUES ('1309', '350781', '350700', '邵武市', '中国,福建省,南平市,邵武市', '邵武', '中国,福建,南平,邵武', '3', '0599', '354000', 'Shaowu', 'SW', 'S', '117.492', '27.3403', '');
INSERT INTO `t_order_region` VALUES ('1310', '350782', '350700', '武夷山市', '中国,福建省,南平市,武夷山市', '武夷山', '中国,福建,南平,武夷山', '3', '0599', '354300', 'Wuyishan', 'WYS', 'W', '118.037', '27.7554', '');
INSERT INTO `t_order_region` VALUES ('1311', '350783', '350700', '建瓯市', '中国,福建省,南平市,建瓯市', '建瓯', '中国,福建,南平,建瓯', '3', '0599', '353100', 'Jianou', 'JO', 'J', '118.298', '27.023', '');
INSERT INTO `t_order_region` VALUES ('1312', '350800', '350000', '龙岩市', '中国,福建省,龙岩市', '龙岩', '中国,福建,龙岩', '2', '0597', '364000', 'Longyan', 'LY', 'L', '117.03', '25.0916', '');
INSERT INTO `t_order_region` VALUES ('1313', '350802', '350800', '新罗区', '中国,福建省,龙岩市,新罗区', '新罗', '中国,福建,龙岩,新罗', '3', '0597', '364000', 'Xinluo', 'XL', 'X', '117.037', '25.0983', '');
INSERT INTO `t_order_region` VALUES ('1314', '350803', '350800', '永定区', '中国,福建省,龙岩市,永定区', '永定', '中国,福建,龙岩,永定', '3', '0597', '364100', 'Yongding', 'YD', 'Y', '116.732', '24.723', '');
INSERT INTO `t_order_region` VALUES ('1315', '350821', '350800', '长汀县', '中国,福建省,龙岩市,长汀县', '长汀', '中国,福建,龙岩,长汀', '3', '0597', '366300', 'Changting', 'CT', 'C', '116.359', '25.8277', '');
INSERT INTO `t_order_region` VALUES ('1316', '350823', '350800', '上杭县', '中国,福建省,龙岩市,上杭县', '上杭', '中国,福建,龙岩,上杭', '3', '0597', '364200', 'Shanghang', 'SH', 'S', '116.42', '25.0494', '');
INSERT INTO `t_order_region` VALUES ('1317', '350824', '350800', '武平县', '中国,福建省,龙岩市,武平县', '武平', '中国,福建,龙岩,武平', '3', '0597', '364300', 'Wuping', 'WP', 'W', '116.102', '25.0924', '');
INSERT INTO `t_order_region` VALUES ('1318', '350825', '350800', '连城县', '中国,福建省,龙岩市,连城县', '连城', '中国,福建,龙岩,连城', '3', '0597', '366200', 'Liancheng', 'LC', 'L', '116.755', '25.7103', '');
INSERT INTO `t_order_region` VALUES ('1319', '350881', '350800', '漳平市', '中国,福建省,龙岩市,漳平市', '漳平', '中国,福建,龙岩,漳平', '3', '0597', '364400', 'Zhangping', 'ZP', 'Z', '117.42', '25.2911', '');
INSERT INTO `t_order_region` VALUES ('1320', '350900', '350000', '宁德市', '中国,福建省,宁德市', '宁德', '中国,福建,宁德', '2', '0593', '352000', 'Ningde', 'ND', 'N', '119.527', '26.6592', '');
INSERT INTO `t_order_region` VALUES ('1321', '350902', '350900', '蕉城区', '中国,福建省,宁德市,蕉城区', '蕉城', '中国,福建,宁德,蕉城', '3', '0593', '352000', 'Jiaocheng', 'JC', 'J', '119.526', '26.6605', '');
INSERT INTO `t_order_region` VALUES ('1322', '350921', '350900', '霞浦县', '中国,福建省,宁德市,霞浦县', '霞浦', '中国,福建,宁德,霞浦', '3', '0593', '355100', 'Xiapu', 'XP', 'X', '119.999', '26.8858', '');
INSERT INTO `t_order_region` VALUES ('1323', '350922', '350900', '古田县', '中国,福建省,宁德市,古田县', '古田', '中国,福建,宁德,古田', '3', '0593', '352200', 'Gutian', 'GT', 'G', '118.747', '26.5768', '');
INSERT INTO `t_order_region` VALUES ('1324', '350923', '350900', '屏南县', '中国,福建省,宁德市,屏南县', '屏南', '中国,福建,宁德,屏南', '3', '0593', '352300', 'Pingnan', 'PN', 'P', '118.989', '26.911', '');
INSERT INTO `t_order_region` VALUES ('1325', '350924', '350900', '寿宁县', '中国,福建省,宁德市,寿宁县', '寿宁', '中国,福建,宁德,寿宁', '3', '0593', '355500', 'Shouning', 'SN', 'S', '119.504', '27.46', '');
INSERT INTO `t_order_region` VALUES ('1326', '350925', '350900', '周宁县', '中国,福建省,宁德市,周宁县', '周宁', '中国,福建,宁德,周宁', '3', '0593', '355400', 'Zhouning', 'ZN', 'Z', '119.338', '27.1066', '');
INSERT INTO `t_order_region` VALUES ('1327', '350926', '350900', '柘荣县', '中国,福建省,宁德市,柘荣县', '柘荣', '中国,福建,宁德,柘荣', '3', '0593', '355300', 'Zherong', 'ZR', 'Z', '119.9', '27.2354', '');
INSERT INTO `t_order_region` VALUES ('1328', '350981', '350900', '福安市', '中国,福建省,宁德市,福安市', '福安', '中国,福建,宁德,福安', '3', '0593', '355000', 'Fu\'an', 'FA', 'F', '119.649', '27.0867', '');
INSERT INTO `t_order_region` VALUES ('1329', '350982', '350900', '福鼎市', '中国,福建省,宁德市,福鼎市', '福鼎', '中国,福建,宁德,福鼎', '3', '0593', '355200', 'Fuding', 'FD', 'F', '120.217', '27.3243', '');
INSERT INTO `t_order_region` VALUES ('1330', '350983', '350900', '东侨开发区', '中国,福建省,宁德市,东侨开发区', '东侨开发区', '中国,福建,宁德,东侨开发区', '3', '0593', '352000', 'Dongqiaokaifaqu', 'DQKFQ', 'D', '119.541', '26.6599', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1331', '360000', '100000', '江西省', '中国,江西省', '江西', '中国,江西', '1', '', '', 'Jiangxi', 'JX', 'J', '115.892', '28.6765', '');
INSERT INTO `t_order_region` VALUES ('1332', '360100', '360000', '南昌市', '中国,江西省,南昌市', '南昌', '中国,江西,南昌', '2', '0791', '330000', 'Nanchang', 'NC', 'N', '115.892', '28.6765', '');
INSERT INTO `t_order_region` VALUES ('1333', '360102', '360100', '东湖区', '中国,江西省,南昌市,东湖区', '东湖', '中国,江西,南昌,东湖', '3', '0791', '330000', 'Donghu', 'DH', 'D', '115.899', '28.685', '');
INSERT INTO `t_order_region` VALUES ('1334', '360103', '360100', '西湖区', '中国,江西省,南昌市,西湖区', '西湖', '中国,江西,南昌,西湖', '3', '0791', '330000', 'Xihu', 'XH', 'X', '115.877', '28.6569', '');
INSERT INTO `t_order_region` VALUES ('1335', '360104', '360100', '青云谱区', '中国,江西省,南昌市,青云谱区', '青云谱', '中国,江西,南昌,青云谱', '3', '0791', '330000', 'Qingyunpu', 'QYP', 'Q', '115.915', '28.632', '');
INSERT INTO `t_order_region` VALUES ('1336', '360105', '360100', '湾里区', '中国,江西省,南昌市,湾里区', '湾里', '中国,江西,南昌,湾里', '3', '0791', '330000', 'Wanli', 'WL', 'W', '115.731', '28.7153', '');
INSERT INTO `t_order_region` VALUES ('1337', '360111', '360100', '青山湖区', '中国,江西省,南昌市,青山湖区', '青山湖', '中国,江西,南昌,青山湖', '3', '0791', '330029', 'Qingshanhu', 'QSH', 'Q', '115.962', '28.6821', '');
INSERT INTO `t_order_region` VALUES ('1338', '360112', '360100', '新建区', '中国,江西省,南昌市,新建区', '新建', '中国,江西,南昌,新建', '3', '0791', '330100', 'Xinjian', 'XJ', 'X', '115.815', '28.6925', '');
INSERT INTO `t_order_region` VALUES ('1339', '360121', '360100', '南昌县', '中国,江西省,南昌市,南昌县', '南昌', '中国,江西,南昌,南昌', '3', '0791', '330200', 'Nanchang', 'NC', 'N', '115.944', '28.5456', '');
INSERT INTO `t_order_region` VALUES ('1340', '360123', '360100', '安义县', '中国,江西省,南昌市,安义县', '安义', '中国,江西,南昌,安义', '3', '0791', '330500', 'Anyi', 'AY', 'A', '115.549', '28.846', '');
INSERT INTO `t_order_region` VALUES ('1341', '360124', '360100', '进贤县', '中国,江西省,南昌市,进贤县', '进贤', '中国,江西,南昌,进贤', '3', '0791', '331700', 'Jinxian', 'JX', 'J', '116.241', '28.3768', '');
INSERT INTO `t_order_region` VALUES ('1342', '360125', '360100', '红谷滩新区', '中国,江西省,南昌市,红谷滩新区', '红谷滩新区', '中国,江西,南昌,红谷滩新区', '3', '0791', '330038', 'Honggutanxinqu', 'HGTXQ', 'H', '115.858', '28.6982', '新区');
INSERT INTO `t_order_region` VALUES ('1343', '360126', '360100', '高新区', '中国,江西省,南昌市,高新区', '高新区', '中国,江西,南昌,高新区', '3', '0791', '330000', 'Gaoxinqu', 'GXQ', 'G', '115.96', '28.6821', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1344', '360127', '360100', '经济开发区', '中国,江西省,南昌市,经济开发区', '经济开发区', '中国,江西,南昌,经济开发区', '3', '0791', '330000', 'Jingjikaifaqu', 'JJKFQ', 'J', '115.841', '28.7349', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1345', '360128', '360100', '小蓝开发区', '中国,江西省,南昌市,小蓝开发区', '小蓝开发区', '中国,江西,南昌,小蓝开发区', '3', '0791', '330052', 'Xiaolankaifaqu', 'XLKFQ', 'X', '115.892', '28.5409', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1346', '360129', '360100', '桑海开发区', '中国,江西省,南昌市,桑海开发区', '桑海开发区', '中国,江西,南昌,桑海开发区', '3', '0791', '330115', 'Shanhaikaifaqu', 'SHKFQ', 'S', '115.837', '28.9122', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1347', '360130', '360100', '望城新区', '中国,江西省,南昌市,望城新区', '望城新区', '中国,江西,南昌,望城新区', '3', '0791', '330103', 'Wangchengxinqu', 'WCXQ', 'W', '115.735', '28.6313', '新区');
INSERT INTO `t_order_region` VALUES ('1348', '360131', '360100', '赣江新区', '中国,江西省,南昌市,赣江新区', '赣江新区', '中国,江西,南昌,赣江新区', '3', '0791', '330029', 'Ganjiangxinqu', 'GJXQ', 'G', '115.898', '28.717', '国家级新区');
INSERT INTO `t_order_region` VALUES ('1349', '360200', '360000', '景德镇市', '中国,江西省,景德镇市', '景德镇', '中国,江西,景德镇', '2', '0798', '333000', 'Jingdezhen', 'JDZ', 'J', '117.215', '29.2926', '');
INSERT INTO `t_order_region` VALUES ('1350', '360202', '360200', '昌江区', '中国,江西省,景德镇市,昌江区', '昌江', '中国,江西,景德镇,昌江', '3', '0798', '333000', 'Changjiang', 'CJ', 'C', '117.184', '29.2732', '');
INSERT INTO `t_order_region` VALUES ('1351', '360203', '360200', '珠山区', '中国,江西省,景德镇市,珠山区', '珠山', '中国,江西,景德镇,珠山', '3', '0798', '333000', 'Zhushan', 'ZS', 'Z', '117.202', '29.3013', '');
INSERT INTO `t_order_region` VALUES ('1352', '360222', '360200', '浮梁县', '中国,江西省,景德镇市,浮梁县', '浮梁', '中国,江西,景德镇,浮梁', '3', '0798', '333400', 'Fuliang', 'FL', 'F', '117.215', '29.3516', '');
INSERT INTO `t_order_region` VALUES ('1353', '360281', '360200', '乐平市', '中国,江西省,景德镇市,乐平市', '乐平', '中国,江西,景德镇,乐平', '3', '0798', '333300', 'Leping', 'LP', 'L', '117.129', '28.9629', '');
INSERT INTO `t_order_region` VALUES ('1354', '360300', '360000', '萍乡市', '中国,江西省,萍乡市', '萍乡', '中国,江西,萍乡', '2', '0799', '337000', 'Pingxiang', 'PX', 'P', '113.852', '27.6229', '');
INSERT INTO `t_order_region` VALUES ('1355', '360302', '360300', '安源区', '中国,江西省,萍乡市,安源区', '安源', '中国,江西,萍乡,安源', '3', '0799', '337000', 'Anyuan', 'AY', 'A', '113.891', '27.6165', '');
INSERT INTO `t_order_region` VALUES ('1356', '360313', '360300', '湘东区', '中国,江西省,萍乡市,湘东区', '湘东', '中国,江西,萍乡,湘东', '3', '0799', '337000', 'Xiangdong', 'XD', 'X', '113.733', '27.6401', '');
INSERT INTO `t_order_region` VALUES ('1357', '360321', '360300', '莲花县', '中国,江西省,萍乡市,莲花县', '莲花', '中国,江西,萍乡,莲花', '3', '0799', '337100', 'Lianhua', 'LH', 'L', '113.961', '27.1287', '');
INSERT INTO `t_order_region` VALUES ('1358', '360322', '360300', '上栗县', '中国,江西省,萍乡市,上栗县', '上栗', '中国,江西,萍乡,上栗', '3', '0799', '337000', 'Shangli', 'SL', 'S', '113.794', '27.8747', '');
INSERT INTO `t_order_region` VALUES ('1359', '360323', '360300', '芦溪县', '中国,江西省,萍乡市,芦溪县', '芦溪', '中国,江西,萍乡,芦溪', '3', '0799', '337000', 'Luxi', 'LX', 'L', '114.03', '27.6306', '');
INSERT INTO `t_order_region` VALUES ('1360', '360400', '360000', '九江市', '中国,江西省,九江市', '九江', '中国,江西,九江', '2', '0792', '332000', 'Jiujiang', 'JJ', 'J', '115.993', '29.712', '');
INSERT INTO `t_order_region` VALUES ('1361', '360402', '360400', '濂溪区', '中国,江西省,九江市,濂溪区', '濂溪', '中国,江西,九江,濂溪', '3', '0792', '332900', 'LianXi', 'LX', 'L', '115.989', '29.6718', '');
INSERT INTO `t_order_region` VALUES ('1362', '360403', '360400', '浔阳区', '中国,江西省,九江市,浔阳区', '浔阳', '中国,江西,九江,浔阳', '3', '0792', '332000', 'Xunyang', 'XY', 'X', '115.99', '29.7279', '');
INSERT INTO `t_order_region` VALUES ('1363', '360421', '360400', '九江县', '中国,江西省,九江市,九江县', '九江', '中国,江西,九江,九江', '3', '0792', '332100', 'Jiujiang', 'JJ', 'J', '115.911', '29.6085', '');
INSERT INTO `t_order_region` VALUES ('1364', '360423', '360400', '武宁县', '中国,江西省,九江市,武宁县', '武宁', '中国,江西,九江,武宁', '3', '0792', '332300', 'Wuning', 'WN', 'W', '115.101', '29.2584', '');
INSERT INTO `t_order_region` VALUES ('1365', '360424', '360400', '修水县', '中国,江西省,九江市,修水县', '修水', '中国,江西,九江,修水', '3', '0792', '332400', 'Xiushui', 'XS', 'X', '114.547', '29.0254', '');
INSERT INTO `t_order_region` VALUES ('1366', '360425', '360400', '永修县', '中国,江西省,九江市,永修县', '永修', '中国,江西,九江,永修', '3', '0792', '330300', 'Yongxiu', 'YX', 'Y', '115.809', '29.0209', '');
INSERT INTO `t_order_region` VALUES ('1367', '360426', '360400', '德安县', '中国,江西省,九江市,德安县', '德安', '中国,江西,九江,德安', '3', '0792', '330400', 'De\'an', 'DA', 'D', '115.756', '29.3134', '');
INSERT INTO `t_order_region` VALUES ('1368', '360428', '360400', '都昌县', '中国,江西省,九江市,都昌县', '都昌', '中国,江西,九江,都昌', '3', '0792', '332600', 'Duchang', 'DC', 'D', '116.204', '29.2733', '');
INSERT INTO `t_order_region` VALUES ('1369', '360429', '360400', '湖口县', '中国,江西省,九江市,湖口县', '湖口', '中国,江西,九江,湖口', '3', '0792', '332500', 'Hukou', 'HK', 'H', '116.219', '29.7382', '');
INSERT INTO `t_order_region` VALUES ('1370', '360430', '360400', '彭泽县', '中国,江西省,九江市,彭泽县', '彭泽', '中国,江西,九江,彭泽', '3', '0792', '332700', 'Pengze', 'PZ', 'P', '116.55', '29.8959', '');
INSERT INTO `t_order_region` VALUES ('1371', '360481', '360400', '瑞昌市', '中国,江西省,九江市,瑞昌市', '瑞昌', '中国,江西,九江,瑞昌', '3', '0792', '332200', 'Ruichang', 'RC', 'R', '115.667', '29.6718', '');
INSERT INTO `t_order_region` VALUES ('1372', '360482', '360400', '共青城市', '中国,江西省,九江市,共青城市', '共青城', '中国,江西,九江,共青城', '3', '0792', '332020', 'Gongqingcheng', 'GQC', 'G', '115.802', '29.2388', '');
INSERT INTO `t_order_region` VALUES ('1373', '360483', '360400', '庐山市', '中国,江西省,九江市,庐山市', '庐山', '中国,江西,九江,庐山', '3', '0792', '332800', 'Lushan', 'LS', 'L', '116.045', '29.4461', '');
INSERT INTO `t_order_region` VALUES ('1374', '360484', '360400', '经济技术开发区', '中国,江西省,九江市,经济技术开发区', '经济开发区', '中国,江西,九江,经济开发区', '3', '0792', '332000', 'Jingjikaifaqu', 'JJKFQ', 'J', '115.952', '29.7025', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1375', '360485', '360400', '八里湖新区', '中国,江西省,九江市,八里湖新区', '八里湖新区', '中国,江西,九江,八里湖新区', '3', '0792', '332000', 'Balihuxinqu', 'BLHXQ', 'B', '115.953', '29.6717', '新区');
INSERT INTO `t_order_region` VALUES ('1376', '360486', '360400', '庐山风景名胜区', '中国,江西省,九江市,庐山风景名胜区', '庐山风景名胜区', '中国,江西,九江,庐山风景名胜区', '3', '0792', '332800', 'Lushanfengjingqu', 'LSFJQ', 'L', '115.995', '29.5556', '风景名胜区');
INSERT INTO `t_order_region` VALUES ('1377', '360500', '360000', '新余市', '中国,江西省,新余市', '新余', '中国,江西,新余', '2', '0790', '338000', 'Xinyu', 'XY', 'X', '114.931', '27.8108', '');
INSERT INTO `t_order_region` VALUES ('1378', '360502', '360500', '渝水区', '中国,江西省,新余市,渝水区', '渝水', '中国,江西,新余,渝水', '3', '0790', '338000', 'Yushui', 'YS', 'Y', '114.944', '27.801', '');
INSERT INTO `t_order_region` VALUES ('1379', '360521', '360500', '分宜县', '中国,江西省,新余市,分宜县', '分宜', '中国,江西,新余,分宜', '3', '0790', '336600', 'Fenyi', 'FY', 'F', '114.692', '27.8148', '');
INSERT INTO `t_order_region` VALUES ('1380', '360600', '360000', '鹰潭市', '中国,江西省,鹰潭市', '鹰潭', '中国,江西,鹰潭', '2', '0701', '335000', 'Yingtan', 'YT', 'Y', '117.034', '28.2386', '');
INSERT INTO `t_order_region` VALUES ('1381', '360602', '360600', '月湖区', '中国,江西省,鹰潭市,月湖区', '月湖', '中国,江西,鹰潭,月湖', '3', '0701', '335000', 'Yuehu', 'YH', 'Y', '117.037', '28.2391', '');
INSERT INTO `t_order_region` VALUES ('1382', '360622', '360600', '余江县', '中国,江西省,鹰潭市,余江县', '余江', '中国,江西,鹰潭,余江', '3', '0701', '335200', 'Yujiang', 'YJ', 'Y', '116.819', '28.2103', '');
INSERT INTO `t_order_region` VALUES ('1383', '360681', '360600', '贵溪市', '中国,江西省,鹰潭市,贵溪市', '贵溪', '中国,江西,鹰潭,贵溪', '3', '0701', '335400', 'Guixi', 'GX', 'G', '117.242', '28.2926', '');
INSERT INTO `t_order_region` VALUES ('1384', '360682', '360600', '高新区', '中国,江西省,鹰潭市,高新区', '高新区', '中国,江西,鹰潭,高新区', '3', '0701', '338000', 'Gaoxinqu', 'GXQ', 'G', '117', '28.2155', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1385', '360700', '360000', '赣州市', '中国,江西省,赣州市', '赣州', '中国,江西,赣州', '2', '0797', '341000', 'Ganzhou', 'GZ', 'G', '114.94', '25.851', '');
INSERT INTO `t_order_region` VALUES ('1386', '360702', '360700', '章贡区', '中国,江西省,赣州市,章贡区', '章贡', '中国,江西,赣州,章贡', '3', '0797', '341000', 'Zhanggong', 'ZG', 'Z', '114.943', '25.8624', '');
INSERT INTO `t_order_region` VALUES ('1387', '360703', '360700', '南康区', '中国,江西省,赣州市,南康区', '南康', '中国,江西,赣州,南康', '3', '0797', '341400', 'Nankang', 'NK', 'N', '114.757', '25.6617', '');
INSERT INTO `t_order_region` VALUES ('1388', '360704', '360700', '赣县区', '中国,江西省,赣州市,赣县区', '赣县', '中国,江西,赣州,赣县', '3', '0797', '341100', 'Ganxian', 'GX', 'G', '115.012', '25.8615', '');
INSERT INTO `t_order_region` VALUES ('1389', '360722', '360700', '信丰县', '中国,江西省,赣州市,信丰县', '信丰', '中国,江西,赣州,信丰', '3', '0797', '341600', 'Xinfeng', 'XF', 'X', '114.923', '25.3861', '');
INSERT INTO `t_order_region` VALUES ('1390', '360723', '360700', '大余县', '中国,江西省,赣州市,大余县', '大余', '中国,江西,赣州,大余', '3', '0797', '341500', 'Dayu', 'DY', 'D', '114.358', '25.3956', '');
INSERT INTO `t_order_region` VALUES ('1391', '360724', '360700', '上犹县', '中国,江西省,赣州市,上犹县', '上犹', '中国,江西,赣州,上犹', '3', '0797', '341200', 'Shangyou', 'SY', 'S', '114.541', '25.7957', '');
INSERT INTO `t_order_region` VALUES ('1392', '360725', '360700', '崇义县', '中国,江西省,赣州市,崇义县', '崇义', '中国,江西,赣州,崇义', '3', '0797', '341300', 'Chongyi', 'CY', 'C', '114.308', '25.6819', '');
INSERT INTO `t_order_region` VALUES ('1393', '360726', '360700', '安远县', '中国,江西省,赣州市,安远县', '安远', '中国,江西,赣州,安远', '3', '0797', '342100', 'Anyuan', 'AY', 'A', '115.395', '25.1371', '');
INSERT INTO `t_order_region` VALUES ('1394', '360727', '360700', '龙南县', '中国,江西省,赣州市,龙南县', '龙南', '中国,江西,赣州,龙南', '3', '0797', '341700', 'Longnan', 'LN', 'L', '114.79', '24.9109', '');
INSERT INTO `t_order_region` VALUES ('1395', '360728', '360700', '定南县', '中国,江西省,赣州市,定南县', '定南', '中国,江西,赣州,定南', '3', '0797', '341900', 'Dingnan', 'DN', 'D', '115.027', '24.784', '');
INSERT INTO `t_order_region` VALUES ('1396', '360729', '360700', '全南县', '中国,江西省,赣州市,全南县', '全南', '中国,江西,赣州,全南', '3', '0797', '341800', 'Quannan', 'QN', 'Q', '114.529', '24.7432', '');
INSERT INTO `t_order_region` VALUES ('1397', '360730', '360700', '宁都县', '中国,江西省,赣州市,宁都县', '宁都', '中国,江西,赣州,宁都', '3', '0797', '342800', 'Ningdu', 'ND', 'N', '116.016', '26.4723', '');
INSERT INTO `t_order_region` VALUES ('1398', '360731', '360700', '于都县', '中国,江西省,赣州市,于都县', '于都', '中国,江西,赣州,于都', '3', '0797', '342300', 'Yudu', 'YD', 'Y', '115.414', '25.9526', '');
INSERT INTO `t_order_region` VALUES ('1399', '360732', '360700', '兴国县', '中国,江西省,赣州市,兴国县', '兴国', '中国,江西,赣州,兴国', '3', '0797', '342400', 'Xingguo', 'XG', 'X', '115.363', '26.3378', '');
INSERT INTO `t_order_region` VALUES ('1400', '360733', '360700', '会昌县', '中国,江西省,赣州市,会昌县', '会昌', '中国,江西,赣州,会昌', '3', '0797', '342600', 'Huichang', 'HC', 'H', '115.786', '25.6007', '');
INSERT INTO `t_order_region` VALUES ('1401', '360734', '360700', '寻乌县', '中国,江西省,赣州市,寻乌县', '寻乌', '中国,江西,赣州,寻乌', '3', '0797', '342200', 'Xunwu', 'XW', 'X', '115.649', '24.9551', '');
INSERT INTO `t_order_region` VALUES ('1402', '360735', '360700', '石城县', '中国,江西省,赣州市,石城县', '石城', '中国,江西,赣州,石城', '3', '0797', '342700', 'Shicheng', 'SC', 'S', '116.344', '26.3262', '');
INSERT INTO `t_order_region` VALUES ('1403', '360781', '360700', '瑞金市', '中国,江西省,赣州市,瑞金市', '瑞金', '中国,江西,赣州,瑞金', '3', '0797', '342500', 'Ruijin', 'RJ', 'R', '116.027', '25.8856', '');
INSERT INTO `t_order_region` VALUES ('1404', '360782', '360700', '章康新区', '中国,江西省,赣州市,章康新区', '章康新区', '中国,江西,赣州,章康新区', '3', '0797', '341000', 'Zhangkangxinqu', 'ZKXQ', 'Z', '114.935', '25.8318', '新区');
INSERT INTO `t_order_region` VALUES ('1405', '360800', '360000', '吉安市', '中国,江西省,吉安市', '吉安', '中国,江西,吉安', '2', '0796', '343000', 'Ji\'an', 'JA', 'J', '114.986', '27.1117', '');
INSERT INTO `t_order_region` VALUES ('1406', '360802', '360800', '吉州区', '中国,江西省,吉安市,吉州区', '吉州', '中国,江西,吉安,吉州', '3', '0796', '343000', 'Jizhou', 'JZ', 'J', '114.976', '27.1067', '');
INSERT INTO `t_order_region` VALUES ('1407', '360803', '360800', '青原区', '中国,江西省,吉安市,青原区', '青原', '中国,江西,吉安,青原', '3', '0796', '343000', 'Qingyuan', 'QY', 'Q', '115.017', '27.1058', '');
INSERT INTO `t_order_region` VALUES ('1408', '360821', '360800', '吉安县', '中国,江西省,吉安市,吉安县', '吉安', '中国,江西,吉安,吉安', '3', '0796', '343100', 'Ji\'an', 'JA', 'J', '114.907', '27.0405', '');
INSERT INTO `t_order_region` VALUES ('1409', '360822', '360800', '吉水县', '中国,江西省,吉安市,吉水县', '吉水', '中国,江西,吉安,吉水', '3', '0796', '331600', 'Jishui', 'JS', 'J', '115.134', '27.2107', '');
INSERT INTO `t_order_region` VALUES ('1410', '360823', '360800', '峡江县', '中国,江西省,吉安市,峡江县', '峡江', '中国,江西,吉安,峡江', '3', '0796', '331400', 'Xiajiang', 'XJ', 'X', '115.317', '27.576', '');
INSERT INTO `t_order_region` VALUES ('1411', '360824', '360800', '新干县', '中国,江西省,吉安市,新干县', '新干', '中国,江西,吉安,新干', '3', '0796', '331300', 'Xingan', 'XG', 'X', '115.393', '27.7409', '');
INSERT INTO `t_order_region` VALUES ('1412', '360825', '360800', '永丰县', '中国,江西省,吉安市,永丰县', '永丰', '中国,江西,吉安,永丰', '3', '0796', '331500', 'Yongfeng', 'YF', 'Y', '115.442', '27.3179', '');
INSERT INTO `t_order_region` VALUES ('1413', '360826', '360800', '泰和县', '中国,江西省,吉安市,泰和县', '泰和', '中国,江西,吉安,泰和', '3', '0796', '343700', 'Taihe', 'TH', 'T', '114.908', '26.7911', '');
INSERT INTO `t_order_region` VALUES ('1414', '360827', '360800', '遂川县', '中国,江西省,吉安市,遂川县', '遂川', '中国,江西,吉安,遂川', '3', '0796', '343900', 'Suichuan', 'SC', 'S', '114.516', '26.326', '');
INSERT INTO `t_order_region` VALUES ('1415', '360828', '360800', '万安县', '中国,江西省,吉安市,万安县', '万安', '中国,江西,吉安,万安', '3', '0796', '343800', 'Wan\'an', 'WA', 'W', '114.787', '26.4593', '');
INSERT INTO `t_order_region` VALUES ('1416', '360829', '360800', '安福县', '中国,江西省,吉安市,安福县', '安福', '中国,江西,吉安,安福', '3', '0796', '343200', 'Anfu', 'AF', 'A', '114.62', '27.3928', '');
INSERT INTO `t_order_region` VALUES ('1417', '360830', '360800', '永新县', '中国,江西省,吉安市,永新县', '永新', '中国,江西,吉安,永新', '3', '0796', '343400', 'Yongxin', 'YX', 'Y', '114.242', '26.9449', '');
INSERT INTO `t_order_region` VALUES ('1418', '360881', '360800', '井冈山市', '中国,江西省,吉安市,井冈山市', '井冈山', '中国,江西,吉安,井冈山', '3', '0796', '343600', 'Jinggangshan', 'JGS', 'J', '114.289', '26.748', '');
INSERT INTO `t_order_region` VALUES ('1419', '360900', '360000', '宜春市', '中国,江西省,宜春市', '宜春', '中国,江西,宜春', '2', '0795', '336000', 'Yichun', 'YC', 'Y', '114.391', '27.8043', '');
INSERT INTO `t_order_region` VALUES ('1420', '360902', '360900', '袁州区', '中国,江西省,宜春市,袁州区', '袁州', '中国,江西,宜春,袁州', '3', '0795', '336000', 'Yuanzhou', 'YZ', 'Y', '114.382', '27.7965', '');
INSERT INTO `t_order_region` VALUES ('1421', '360921', '360900', '奉新县', '中国,江西省,宜春市,奉新县', '奉新', '中国,江西,宜春,奉新', '3', '0795', '330700', 'Fengxin', 'FX', 'F', '115.4', '28.6879', '');
INSERT INTO `t_order_region` VALUES ('1422', '360922', '360900', '万载县', '中国,江西省,宜春市,万载县', '万载', '中国,江西,宜春,万载', '3', '0795', '336100', 'Wanzai', 'WZ', 'W', '114.446', '28.1066', '');
INSERT INTO `t_order_region` VALUES ('1423', '360923', '360900', '上高县', '中国,江西省,宜春市,上高县', '上高', '中国,江西,宜春,上高', '3', '0795', '336400', 'Shanggao', 'SG', 'S', '114.925', '28.2342', '');
INSERT INTO `t_order_region` VALUES ('1424', '360924', '360900', '宜丰县', '中国,江西省,宜春市,宜丰县', '宜丰', '中国,江西,宜春,宜丰', '3', '0795', '336300', 'Yifeng', 'YF', 'Y', '114.78', '28.3855', '');
INSERT INTO `t_order_region` VALUES ('1425', '360925', '360900', '靖安县', '中国,江西省,宜春市,靖安县', '靖安', '中国,江西,宜春,靖安', '3', '0795', '330600', 'Jing\'an', 'JA', 'J', '115.363', '28.8617', '');
INSERT INTO `t_order_region` VALUES ('1426', '360926', '360900', '铜鼓县', '中国,江西省,宜春市,铜鼓县', '铜鼓', '中国,江西,宜春,铜鼓', '3', '0795', '336200', 'Tonggu', 'TG', 'T', '114.37', '28.5231', '');
INSERT INTO `t_order_region` VALUES ('1427', '360981', '360900', '丰城市', '中国,江西省,宜春市,丰城市', '丰城', '中国,江西,宜春,丰城', '3', '0795', '331100', 'Fengcheng', 'FC', 'F', '115.771', '28.1592', '');
INSERT INTO `t_order_region` VALUES ('1428', '360982', '360900', '樟树市', '中国,江西省,宜春市,樟树市', '樟树', '中国,江西,宜春,樟树', '3', '0795', '331200', 'Zhangshu', 'ZS', 'Z', '115.547', '28.0533', '');
INSERT INTO `t_order_region` VALUES ('1429', '360983', '360900', '高安市', '中国,江西省,宜春市,高安市', '高安', '中国,江西,宜春,高安', '3', '0795', '330800', 'Gao\'an', 'GA', 'G', '115.375', '28.4178', '');
INSERT INTO `t_order_region` VALUES ('1430', '361000', '360000', '抚州市', '中国,江西省,抚州市', '抚州', '中国,江西,抚州', '2', '0794', '344000', 'Fuzhou', 'FZ', 'F', '116.358', '27.9839', '');
INSERT INTO `t_order_region` VALUES ('1431', '361002', '361000', '临川区', '中国,江西省,抚州市,临川区', '临川', '中国,江西,抚州,临川', '3', '0794', '344100', 'Linchuan', 'LC', 'L', '116.359', '27.9772', '');
INSERT INTO `t_order_region` VALUES ('1432', '361003', '361000', '东乡区', '中国,江西省,抚州市,东乡区', '东乡', '中国,江西,抚州,东乡', '3', '0794', '331800', 'Dongxiang', 'DX', 'D', '116.59', '28.2361', '');
INSERT INTO `t_order_region` VALUES ('1433', '361021', '361000', '南城县', '中国,江西省,抚州市,南城县', '南城', '中国,江西,抚州,南城', '3', '0794', '344700', 'Nancheng', 'NC', 'N', '116.644', '27.5538', '');
INSERT INTO `t_order_region` VALUES ('1434', '361022', '361000', '黎川县', '中国,江西省,抚州市,黎川县', '黎川', '中国,江西,抚州,黎川', '3', '0794', '344600', 'Lichuan', 'LC', 'L', '116.908', '27.2823', '');
INSERT INTO `t_order_region` VALUES ('1435', '361023', '361000', '南丰县', '中国,江西省,抚州市,南丰县', '南丰', '中国,江西,抚州,南丰', '3', '0794', '344500', 'Nanfeng', 'NF', 'N', '116.526', '27.2184', '');
INSERT INTO `t_order_region` VALUES ('1436', '361024', '361000', '崇仁县', '中国,江西省,抚州市,崇仁县', '崇仁', '中国,江西,抚州,崇仁', '3', '0794', '344200', 'Chongren', 'CR', 'C', '116.06', '27.7596', '');
INSERT INTO `t_order_region` VALUES ('1437', '361025', '361000', '乐安县', '中国,江西省,抚州市,乐安县', '乐安', '中国,江西,抚州,乐安', '3', '0794', '344300', 'Le\'an', 'LA', 'L', '115.831', '27.4281', '');
INSERT INTO `t_order_region` VALUES ('1438', '361026', '361000', '宜黄县', '中国,江西省,抚州市,宜黄县', '宜黄', '中国,江西,抚州,宜黄', '3', '0794', '344400', 'Yihuang', 'YH', 'Y', '116.236', '27.5549', '');
INSERT INTO `t_order_region` VALUES ('1439', '361027', '361000', '金溪县', '中国,江西省,抚州市,金溪县', '金溪', '中国,江西,抚州,金溪', '3', '0794', '344800', 'Jinxi', 'JX', 'J', '116.774', '27.9075', '');
INSERT INTO `t_order_region` VALUES ('1440', '361028', '361000', '资溪县', '中国,江西省,抚州市,资溪县', '资溪', '中国,江西,抚州,资溪', '3', '0794', '335300', 'Zixi', 'ZX', 'Z', '117.069', '27.7049', '');
INSERT INTO `t_order_region` VALUES ('1441', '361030', '361000', '广昌县', '中国,江西省,抚州市,广昌县', '广昌', '中国,江西,抚州,广昌', '3', '0794', '344900', 'Guangchang', 'GC', 'G', '116.325', '26.8341', '');
INSERT INTO `t_order_region` VALUES ('1442', '361100', '360000', '上饶市', '中国,江西省,上饶市', '上饶', '中国,江西,上饶', '2', '0793', '334000', 'Shangrao', 'SR', 'S', '117.971', '28.4444', '');
INSERT INTO `t_order_region` VALUES ('1443', '361102', '361100', '信州区', '中国,江西省,上饶市,信州区', '信州', '中国,江西,上饶,信州', '3', '0793', '334000', 'Xinzhou', 'XZ', 'X', '117.967', '28.4312', '');
INSERT INTO `t_order_region` VALUES ('1444', '361103', '361100', '广丰区', '中国,江西省,上饶市,广丰区', '广丰', '中国,江西,上饶,广丰', '3', '0793', '334600', 'Guangfeng', 'GF', 'G', '118.192', '28.4377', '');
INSERT INTO `t_order_region` VALUES ('1445', '361121', '361100', '上饶县', '中国,江西省,上饶市,上饶县', '上饶', '中国,江西,上饶,上饶', '3', '0793', '334100', 'Shangrao', 'SR', 'S', '117.909', '28.4486', '');
INSERT INTO `t_order_region` VALUES ('1446', '361123', '361100', '玉山县', '中国,江西省,上饶市,玉山县', '玉山', '中国,江西,上饶,玉山', '3', '0793', '334700', 'Yushan', 'YS', 'Y', '118.245', '28.6818', '');
INSERT INTO `t_order_region` VALUES ('1447', '361124', '361100', '铅山县', '中国,江西省,上饶市,铅山县', '铅山', '中国,江西,上饶,铅山', '3', '0793', '334500', 'Yanshan', 'YS', 'Y', '117.71', '28.3155', '');
INSERT INTO `t_order_region` VALUES ('1448', '361125', '361100', '横峰县', '中国,江西省,上饶市,横峰县', '横峰', '中国,江西,上饶,横峰', '3', '0793', '334300', 'Hengfeng', 'HF', 'H', '117.596', '28.4072', '');
INSERT INTO `t_order_region` VALUES ('1449', '361126', '361100', '弋阳县', '中国,江西省,上饶市,弋阳县', '弋阳', '中国,江西,上饶,弋阳', '3', '0793', '334400', 'Yiyang', 'YY', 'Y', '117.459', '28.3745', '');
INSERT INTO `t_order_region` VALUES ('1450', '361127', '361100', '余干县', '中国,江西省,上饶市,余干县', '余干', '中国,江西,上饶,余干', '3', '0793', '335100', 'Yugan', 'YG', 'Y', '116.696', '28.7021', '');
INSERT INTO `t_order_region` VALUES ('1451', '361128', '361100', '鄱阳县', '中国,江西省,上饶市,鄱阳县', '鄱阳', '中国,江西,上饶,鄱阳', '3', '0793', '333100', 'Poyang', 'PY', 'P', '116.7', '29.0118', '');
INSERT INTO `t_order_region` VALUES ('1452', '361129', '361100', '万年县', '中国,江西省,上饶市,万年县', '万年', '中国,江西,上饶,万年', '3', '0793', '335500', 'Wannian', 'WN', 'W', '117.069', '28.6954', '');
INSERT INTO `t_order_region` VALUES ('1453', '361130', '361100', '婺源县', '中国,江西省,上饶市,婺源县', '婺源', '中国,江西,上饶,婺源', '3', '0793', '333200', 'Wuyuan', 'WY', 'W', '117.861', '29.2484', '');
INSERT INTO `t_order_region` VALUES ('1454', '361181', '361100', '德兴市', '中国,江西省,上饶市,德兴市', '德兴', '中国,江西,上饶,德兴', '3', '0793', '334200', 'Dexing', 'DX', 'D', '117.579', '28.9474', '');
INSERT INTO `t_order_region` VALUES ('1455', '370000', '100000', '山东省', '中国,山东省', '山东', '中国,山东', '1', '', '', 'Shandong', 'SD', 'S', '117.001', '36.6758', '');
INSERT INTO `t_order_region` VALUES ('1456', '370100', '370000', '济南市', '中国,山东省,济南市', '济南', '中国,山东,济南', '2', '0531', '250000', 'Jinan', 'JN', 'J', '117.001', '36.6758', '');
INSERT INTO `t_order_region` VALUES ('1457', '370102', '370100', '历下区', '中国,山东省,济南市,历下区', '历下', '中国,山东,济南,历下', '3', '0531', '250014', 'Lixia', 'LX', 'L', '117.077', '36.6666', '');
INSERT INTO `t_order_region` VALUES ('1458', '370103', '370100', '市中区', '中国,山东省,济南市,市中区', '市中', '中国,山东,济南,市中', '3', '0531', '250001', 'Shizhong', 'SZ', 'S', '116.997', '36.651', '');
INSERT INTO `t_order_region` VALUES ('1459', '370104', '370100', '槐荫区', '中国,山东省,济南市,槐荫区', '槐荫', '中国,山东,济南,槐荫', '3', '0531', '250117', 'Huaiyin', 'HY', 'H', '116.901', '36.6514', '');
INSERT INTO `t_order_region` VALUES ('1460', '370105', '370100', '天桥区', '中国,山东省,济南市,天桥区', '天桥', '中国,山东,济南,天桥', '3', '0531', '250031', 'Tianqiao', 'TQ', 'T', '116.987', '36.678', '');
INSERT INTO `t_order_region` VALUES ('1461', '370112', '370100', '历城区', '中国,山东省,济南市,历城区', '历城', '中国,山东,济南,历城', '3', '0531', '250100', 'Licheng', 'LC', 'L', '117.065', '36.68', '');
INSERT INTO `t_order_region` VALUES ('1462', '370113', '370100', '长清区', '中国,山东省,济南市,长清区', '长清', '中国,山东,济南,长清', '3', '0531', '250300', 'Changqing', 'CQ', 'C', '116.752', '36.5535', '');
INSERT INTO `t_order_region` VALUES ('1463', '370114', '370100', '章丘区', '中国,山东省,济南市,章丘区', '章丘', '中国,山东,济南,章丘', '3', '0531', '250200', 'Zhangqiu', 'ZQ', 'Z', '117.537', '36.7139', '');
INSERT INTO `t_order_region` VALUES ('1464', '370124', '370100', '平阴县', '中国,山东省,济南市,平阴县', '平阴', '中国,山东,济南,平阴', '3', '0531', '250400', 'Pingyin', 'PY', 'P', '116.456', '36.2896', '');
INSERT INTO `t_order_region` VALUES ('1465', '370125', '370100', '济阳县', '中国,山东省,济南市,济阳县', '济阳', '中国,山东,济南,济阳', '3', '0531', '251400', 'Jiyang', 'JY', 'J', '117.173', '36.9785', '');
INSERT INTO `t_order_region` VALUES ('1466', '370126', '370100', '商河县', '中国,山东省,济南市,商河县', '商河', '中国,山东,济南,商河', '3', '0531', '251600', 'Shanghe', 'SH', 'S', '117.157', '37.3112', '');
INSERT INTO `t_order_region` VALUES ('1467', '370182', '370100', '高新区', '中国,山东省,济南市,高新区', '高新区', '中国,山东,济南,高新区', '3', '0531', '250000', 'Gaoxinqu', 'GXQ', 'G', '117.128', '36.6816', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1468', '370200', '370000', '青岛市', '中国,山东省,青岛市', '青岛', '中国,山东,青岛', '2', '0532', '266000', 'Qingdao', 'QD', 'Q', '120.37', '36.0944', '');
INSERT INTO `t_order_region` VALUES ('1469', '370202', '370200', '市南区', '中国,山东省,青岛市,市南区', '市南', '中国,山东,青岛,市南', '3', '0532', '266000', 'Shinan', 'SN', 'S', '120.388', '36.0667', '');
INSERT INTO `t_order_region` VALUES ('1470', '370203', '370200', '市北区', '中国,山东省,青岛市,市北区', '市北', '中国,山东,青岛,市北', '3', '0532', '266000', 'Shibei', 'SB', 'S', '120.375', '36.0873', '');
INSERT INTO `t_order_region` VALUES ('1471', '370211', '370200', '黄岛区', '中国,山东省,青岛市,黄岛区', '黄岛', '中国,山东,青岛,黄岛', '3', '0532', '266000', 'Huangdao', 'HD', 'H', '120.198', '35.9607', '');
INSERT INTO `t_order_region` VALUES ('1472', '370212', '370200', '崂山区', '中国,山东省,青岛市,崂山区', '崂山', '中国,山东,青岛,崂山', '3', '0532', '266100', 'Laoshan', 'LS', 'L', '120.469', '36.1072', '');
INSERT INTO `t_order_region` VALUES ('1473', '370213', '370200', '李沧区', '中国,山东省,青岛市,李沧区', '李沧', '中国,山东,青岛,李沧', '3', '0532', '266000', 'Licang', 'LC', 'L', '120.433', '36.145', '');
INSERT INTO `t_order_region` VALUES ('1474', '370214', '370200', '城阳区', '中国,山东省,青岛市,城阳区', '城阳', '中国,山东,青岛,城阳', '3', '0532', '266000', 'Chengyang', 'CY', 'C', '120.396', '36.3074', '');
INSERT INTO `t_order_region` VALUES ('1475', '370281', '370200', '胶州市', '中国,山东省,青岛市,胶州市', '胶州', '中国,山东,青岛,胶州', '3', '0532', '266300', 'Jiaozhou', 'JZ', 'J', '120.034', '36.2644', '');
INSERT INTO `t_order_region` VALUES ('1476', '370282', '370200', '即墨市', '中国,山东省,青岛市,即墨市', '即墨', '中国,山东,青岛,即墨', '3', '0532', '266200', 'Jimo', 'JM', 'J', '120.447', '36.3891', '');
INSERT INTO `t_order_region` VALUES ('1477', '370283', '370200', '平度市', '中国,山东省,青岛市,平度市', '平度', '中国,山东,青岛,平度', '3', '0532', '266700', 'Pingdu', 'PD', 'P', '119.96', '36.7869', '');
INSERT INTO `t_order_region` VALUES ('1478', '370285', '370200', '莱西市', '中国,山东省,青岛市,莱西市', '莱西', '中国,山东,青岛,莱西', '3', '0532', '266600', 'Laixi', 'LX', 'L', '120.518', '36.888', '');
INSERT INTO `t_order_region` VALUES ('1479', '370286', '370200', '西海岸新区', '中国,山东省,青岛市,西海岸新区', '西海岸新区', '中国,山东,青岛,西海岸新区', '3', '0532', '266500', 'Xihai\'anXinQu', 'XHAXQ', 'X', '120.198', '35.9607', '国家级新区');
INSERT INTO `t_order_region` VALUES ('1480', '370287', '370200', '高新区', '中国,山东省,青岛市,高新区', '高新区', '中国,山东,青岛,高新区', '3', '0532', '266000', 'Gaoxinqu', 'GXQ', 'G', '120.459', '36.1362', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1481', '370300', '370000', '淄博市', '中国,山东省,淄博市', '淄博', '中国,山东,淄博', '2', '0533', '255000', 'Zibo', 'ZB', 'Z', '118.048', '36.8149', '');
INSERT INTO `t_order_region` VALUES ('1482', '370302', '370300', '淄川区', '中国,山东省,淄博市,淄川区', '淄川', '中国,山东,淄博,淄川', '3', '0533', '255100', 'Zichuan', 'ZC', 'Z', '117.967', '36.6434', '');
INSERT INTO `t_order_region` VALUES ('1483', '370303', '370300', '张店区', '中国,山东省,淄博市,张店区', '张店', '中国,山东,淄博,张店', '3', '0533', '255000', 'Zhangdian', 'ZD', 'Z', '118.018', '36.8068', '');
INSERT INTO `t_order_region` VALUES ('1484', '370304', '370300', '博山区', '中国,山东省,淄博市,博山区', '博山', '中国,山东,淄博,博山', '3', '0533', '255200', 'Boshan', 'BS', 'B', '117.862', '36.4947', '');
INSERT INTO `t_order_region` VALUES ('1485', '370305', '370300', '临淄区', '中国,山东省,淄博市,临淄区', '临淄', '中国,山东,淄博,临淄', '3', '0533', '255400', 'Linzi', 'LZ', 'L', '118.31', '36.8259', '');
INSERT INTO `t_order_region` VALUES ('1486', '370306', '370300', '周村区', '中国,山东省,淄博市,周村区', '周村', '中国,山东,淄博,周村', '3', '0533', '255300', 'Zhoucun', 'ZC', 'Z', '117.87', '36.8032', '');
INSERT INTO `t_order_region` VALUES ('1487', '370321', '370300', '桓台县', '中国,山东省,淄博市,桓台县', '桓台', '中国,山东,淄博,桓台', '3', '0533', '256400', 'Huantai', 'HT', 'H', '118.097', '36.9604', '');
INSERT INTO `t_order_region` VALUES ('1488', '370322', '370300', '高青县', '中国,山东省,淄博市,高青县', '高青', '中国,山东,淄博,高青', '3', '0533', '256300', 'Gaoqing', 'GQ', 'G', '117.827', '37.172', '');
INSERT INTO `t_order_region` VALUES ('1489', '370323', '370300', '沂源县', '中国,山东省,淄博市,沂源县', '沂源', '中国,山东,淄博,沂源', '3', '0533', '256100', 'Yiyuan', 'YY', 'Y', '118.171', '36.1854', '');
INSERT INTO `t_order_region` VALUES ('1490', '370324', '370300', '高新区', '中国,山东省,淄博市,高新区', '高新区', '中国,山东,淄博,高新区', '3', '0533', '255000', 'Gaoxinqu', 'GXQ', 'G', '118.051', '36.841', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1491', '370400', '370000', '枣庄市', '中国,山东省,枣庄市', '枣庄', '中国,山东,枣庄', '2', '0632', '277000', 'Zaozhuang', 'ZZ', 'Z', '117.558', '34.8564', '');
INSERT INTO `t_order_region` VALUES ('1492', '370402', '370400', '市中区', '中国,山东省,枣庄市,市中区', '市中', '中国,山东,枣庄,市中', '3', '0632', '277000', 'Shizhong', 'SZ', 'S', '117.556', '34.8639', '');
INSERT INTO `t_order_region` VALUES ('1493', '370403', '370400', '薛城区', '中国,山东省,枣庄市,薛城区', '薛城', '中国,山东,枣庄,薛城', '3', '0632', '277000', 'Xuecheng', 'XC', 'X', '117.263', '34.795', '');
INSERT INTO `t_order_region` VALUES ('1494', '370404', '370400', '峄城区', '中国,山东省,枣庄市,峄城区', '峄城', '中国,山东,枣庄,峄城', '3', '0632', '277300', 'Yicheng', 'YC', 'Y', '117.591', '34.7723', '');
INSERT INTO `t_order_region` VALUES ('1495', '370405', '370400', '台儿庄区', '中国,山东省,枣庄市,台儿庄区', '台儿庄', '中国,山东,枣庄,台儿庄', '3', '0632', '277400', 'Taierzhuang', 'TEZ', 'T', '117.735', '34.5636', '');
INSERT INTO `t_order_region` VALUES ('1496', '370406', '370400', '山亭区', '中国,山东省,枣庄市,山亭区', '山亭', '中国,山东,枣庄,山亭', '3', '0632', '277200', 'Shanting', 'ST', 'S', '117.466', '35.0954', '');
INSERT INTO `t_order_region` VALUES ('1497', '370481', '370400', '滕州市', '中国,山东省,枣庄市,滕州市', '滕州', '中国,山东,枣庄,滕州', '3', '0632', '277500', 'Tengzhou', 'TZ', 'T', '117.165', '35.1053', '');
INSERT INTO `t_order_region` VALUES ('1498', '370482', '370400', '高新区', '中国,山东省,枣庄市,高新区', '高新区', '中国,山东,枣庄,高新区', '3', '0632', '277800', 'Gaoxinqu', 'GXQ', 'G', '117.274', '34.8091', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1499', '370500', '370000', '东营市', '中国,山东省,东营市', '东营', '中国,山东,东营', '2', '0546', '257000', 'Dongying', 'DY', 'D', '118.496', '37.4613', '');
INSERT INTO `t_order_region` VALUES ('1500', '370502', '370500', '东营区', '中国,山东省,东营市,东营区', '东营', '中国,山东,东营,东营', '3', '0546', '257100', 'Dongying', 'DY', 'D', '118.582', '37.4487', '');
INSERT INTO `t_order_region` VALUES ('1501', '370503', '370500', '河口区', '中国,山东省,东营市,河口区', '河口', '中国,山东,东营,河口', '3', '0546', '257200', 'Hekou', 'HK', 'H', '118.525', '37.8854', '');
INSERT INTO `t_order_region` VALUES ('1502', '370505', '370500', '垦利区', '中国,山东省,东营市,垦利区', '垦利', '中国,山东,东营,垦利', '3', '0546', '257500', 'Kenli', 'KL', 'K', '118.548', '37.5882', '');
INSERT INTO `t_order_region` VALUES ('1503', '370522', '370500', '利津县', '中国,山东省,东营市,利津县', '利津', '中国,山东,东营,利津', '3', '0546', '257400', 'Lijin', 'LJ', 'L', '118.256', '37.4916', '');
INSERT INTO `t_order_region` VALUES ('1504', '370523', '370500', '广饶县', '中国,山东省,东营市,广饶县', '广饶', '中国,山东,东营,广饶', '3', '0546', '257300', 'Guangrao', 'GR', 'G', '118.407', '37.0538', '');
INSERT INTO `t_order_region` VALUES ('1505', '370600', '370000', '烟台市', '中国,山东省,烟台市', '烟台', '中国,山东,烟台', '2', '0535', '264000', 'Yantai', 'YT', 'Y', '121.391', '37.5393', '');
INSERT INTO `t_order_region` VALUES ('1506', '370602', '370600', '芝罘区', '中国,山东省,烟台市,芝罘区', '芝罘', '中国,山东,烟台,芝罘', '3', '0535', '264000', 'Zhifu', 'ZF', 'Z', '121.4', '37.5406', '');
INSERT INTO `t_order_region` VALUES ('1507', '370611', '370600', '福山区', '中国,山东省,烟台市,福山区', '福山', '中国,山东,烟台,福山', '3', '0535', '265500', 'Fushan', 'FS', 'F', '121.268', '37.4984', '');
INSERT INTO `t_order_region` VALUES ('1508', '370612', '370600', '牟平区', '中国,山东省,烟台市,牟平区', '牟平', '中国,山东,烟台,牟平', '3', '0535', '264100', 'Muping', 'MP', 'M', '121.601', '37.3885', '');
INSERT INTO `t_order_region` VALUES ('1509', '370613', '370600', '莱山区', '中国,山东省,烟台市,莱山区', '莱山', '中国,山东,烟台,莱山', '3', '0535', '264000', 'Laishan', 'LS', 'L', '121.445', '37.5117', '');
INSERT INTO `t_order_region` VALUES ('1510', '370634', '370600', '长岛县', '中国,山东省,烟台市,长岛县', '长岛', '中国,山东,烟台,长岛', '3', '0535', '265800', 'Changdao', 'CD', 'C', '120.738', '37.9175', '');
INSERT INTO `t_order_region` VALUES ('1511', '370681', '370600', '龙口市', '中国,山东省,烟台市,龙口市', '龙口', '中国,山东,烟台,龙口', '3', '0535', '265700', 'Longkou', 'LK', 'L', '120.506', '37.6406', '');
INSERT INTO `t_order_region` VALUES ('1512', '370682', '370600', '莱阳市', '中国,山东省,烟台市,莱阳市', '莱阳', '中国,山东,烟台,莱阳', '3', '0535', '265200', 'Laiyang', 'LY', 'L', '120.711', '36.9801', '');
INSERT INTO `t_order_region` VALUES ('1513', '370683', '370600', '莱州市', '中国,山东省,烟台市,莱州市', '莱州', '中国,山东,烟台,莱州', '3', '0535', '261400', 'Laizhou', 'LZ', 'L', '119.941', '37.1781', '');
INSERT INTO `t_order_region` VALUES ('1514', '370684', '370600', '蓬莱市', '中国,山东省,烟台市,蓬莱市', '蓬莱', '中国,山东,烟台,蓬莱', '3', '0535', '265600', 'Penglai', 'PL', 'P', '120.76', '37.8112', '');
INSERT INTO `t_order_region` VALUES ('1515', '370685', '370600', '招远市', '中国,山东省,烟台市,招远市', '招远', '中国,山东,烟台,招远', '3', '0535', '265400', 'Zhaoyuan', 'ZY', 'Z', '120.405', '37.3627', '');
INSERT INTO `t_order_region` VALUES ('1516', '370686', '370600', '栖霞市', '中国,山东省,烟台市,栖霞市', '栖霞', '中国,山东,烟台,栖霞', '3', '0535', '265300', 'Qixia', 'QX', 'Q', '120.85', '37.3357', '');
INSERT INTO `t_order_region` VALUES ('1517', '370687', '370600', '海阳市', '中国,山东省,烟台市,海阳市', '海阳', '中国,山东,烟台,海阳', '3', '0535', '265100', 'Haiyang', 'HY', 'H', '121.16', '36.7762', '');
INSERT INTO `t_order_region` VALUES ('1518', '370688', '370600', '高新区', '中国,山东省,烟台市,高新区', '高新区', '中国,山东,烟台,高新区', '3', '0535', '264003', 'Gaoxinqu', 'GXQ', 'G', '121.484', '37.4489', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1519', '370689', '370600', '经济开发区', '中国,山东省,烟台市,经济开发区', '经济开发区', '中国,山东,烟台,经济开发区', '3', '0535', '264003', 'Jingjikaifaqu', 'JJKFQ', 'J', '121.253', '37.5632', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1520', '370700', '370000', '潍坊市', '中国,山东省,潍坊市', '潍坊', '中国,山东,潍坊', '2', '0536', '261000', 'Weifang', 'WF', 'W', '119.107', '36.7093', '');
INSERT INTO `t_order_region` VALUES ('1521', '370702', '370700', '潍城区', '中国,山东省,潍坊市,潍城区', '潍城', '中国,山东,潍坊,潍城', '3', '0536', '261000', 'Weicheng', 'WC', 'W', '119.106', '36.7139', '');
INSERT INTO `t_order_region` VALUES ('1522', '370703', '370700', '寒亭区', '中国,山东省,潍坊市,寒亭区', '寒亭', '中国,山东,潍坊,寒亭', '3', '0536', '261100', 'Hanting', 'HT', 'H', '119.218', '36.775', '');
INSERT INTO `t_order_region` VALUES ('1523', '370704', '370700', '坊子区', '中国,山东省,潍坊市,坊子区', '坊子', '中国,山东,潍坊,坊子', '3', '0536', '261200', 'Fangzi', 'FZ', 'F', '119.165', '36.6522', '');
INSERT INTO `t_order_region` VALUES ('1524', '370705', '370700', '奎文区', '中国,山东省,潍坊市,奎文区', '奎文', '中国,山东,潍坊,奎文', '3', '0536', '261000', 'Kuiwen', 'KW', 'K', '119.125', '36.7072', '');
INSERT INTO `t_order_region` VALUES ('1525', '370724', '370700', '临朐县', '中国,山东省,潍坊市,临朐县', '临朐', '中国,山东,潍坊,临朐', '3', '0536', '262600', 'Linqu', 'LQ', 'L', '118.544', '36.5122', '');
INSERT INTO `t_order_region` VALUES ('1526', '370725', '370700', '昌乐县', '中国,山东省,潍坊市,昌乐县', '昌乐', '中国,山东,潍坊,昌乐', '3', '0536', '262400', 'Changle', 'CL', 'C', '118.83', '36.7078', '');
INSERT INTO `t_order_region` VALUES ('1527', '370781', '370700', '青州市', '中国,山东省,潍坊市,青州市', '青州', '中国,山东,潍坊,青州', '3', '0536', '262500', 'Qingzhou', 'QZ', 'Q', '118.479', '36.6851', '');
INSERT INTO `t_order_region` VALUES ('1528', '370782', '370700', '诸城市', '中国,山东省,潍坊市,诸城市', '诸城', '中国,山东,潍坊,诸城', '3', '0536', '262200', 'Zhucheng', 'ZC', 'Z', '119.41', '35.9966', '');
INSERT INTO `t_order_region` VALUES ('1529', '370783', '370700', '寿光市', '中国,山东省,潍坊市,寿光市', '寿光', '中国,山东,潍坊,寿光', '3', '0536', '262700', 'Shouguang', 'SG', 'S', '118.74', '36.8813', '');
INSERT INTO `t_order_region` VALUES ('1530', '370784', '370700', '安丘市', '中国,山东省,潍坊市,安丘市', '安丘', '中国,山东,潍坊,安丘', '3', '0536', '262100', 'Anqiu', 'AQ', 'A', '119.219', '36.4785', '');
INSERT INTO `t_order_region` VALUES ('1531', '370785', '370700', '高密市', '中国,山东省,潍坊市,高密市', '高密', '中国,山东,潍坊,高密', '3', '0536', '261500', 'Gaomi', 'GM', 'G', '119.757', '36.384', '');
INSERT INTO `t_order_region` VALUES ('1532', '370786', '370700', '昌邑市', '中国,山东省,潍坊市,昌邑市', '昌邑', '中国,山东,潍坊,昌邑', '3', '0536', '261300', 'Changyi', 'CY', 'C', '119.398', '36.8601', '');
INSERT INTO `t_order_region` VALUES ('1533', '370787', '370700', '高新区', '中国,山东省,潍坊市,高新区', '高新区', '中国,山东,潍坊,高新区', '3', '0536', '261000', 'Gaoxinqu', 'GXQ', 'G', '119.216', '36.7122', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1534', '370800', '370000', '济宁市', '中国,山东省,济宁市', '济宁', '中国,山东,济宁', '2', '0537', '272000', 'Jining', 'JN', 'J', '116.587', '35.4154', '');
INSERT INTO `t_order_region` VALUES ('1535', '370811', '370800', '任城区', '中国,山东省,济宁市,任城区', '任城', '中国,山东,济宁,任城', '3', '0537', '272000', 'Rencheng', 'RC', 'R', '116.595', '35.4066', '');
INSERT INTO `t_order_region` VALUES ('1536', '370812', '370800', '兖州区', '中国,山东省,济宁市,兖州区', '兖州', '中国,山东,济宁,兖州', '3', '0537', '272000', 'Yanzhou ', 'YZ', 'Y', '116.827', '35.5523', '');
INSERT INTO `t_order_region` VALUES ('1537', '370826', '370800', '微山县', '中国,山东省,济宁市,微山县', '微山', '中国,山东,济宁,微山', '3', '0537', '277600', 'Weishan', 'WS', 'W', '117.129', '34.8071', '');
INSERT INTO `t_order_region` VALUES ('1538', '370827', '370800', '鱼台县', '中国,山东省,济宁市,鱼台县', '鱼台', '中国,山东,济宁,鱼台', '3', '0537', '272300', 'Yutai', 'YT', 'Y', '116.648', '34.9967', '');
INSERT INTO `t_order_region` VALUES ('1539', '370828', '370800', '金乡县', '中国,山东省,济宁市,金乡县', '金乡', '中国,山东,济宁,金乡', '3', '0537', '272200', 'Jinxiang', 'JX', 'J', '116.311', '35.065', '');
INSERT INTO `t_order_region` VALUES ('1540', '370829', '370800', '嘉祥县', '中国,山东省,济宁市,嘉祥县', '嘉祥', '中国,山东,济宁,嘉祥', '3', '0537', '272400', 'Jiaxiang', 'JX', 'J', '116.342', '35.4084', '');
INSERT INTO `t_order_region` VALUES ('1541', '370830', '370800', '汶上县', '中国,山东省,济宁市,汶上县', '汶上', '中国,山东,济宁,汶上', '3', '0537', '272500', 'Wenshang', 'WS', 'W', '116.487', '35.7329', '');
INSERT INTO `t_order_region` VALUES ('1542', '370831', '370800', '泗水县', '中国,山东省,济宁市,泗水县', '泗水', '中国,山东,济宁,泗水', '3', '0537', '273200', 'Sishui', 'SS', 'S', '117.279', '35.6611', '');
INSERT INTO `t_order_region` VALUES ('1543', '370832', '370800', '梁山县', '中国,山东省,济宁市,梁山县', '梁山', '中国,山东,济宁,梁山', '3', '0537', '272600', 'Liangshan', 'LS', 'L', '116.097', '35.8032', '');
INSERT INTO `t_order_region` VALUES ('1544', '370881', '370800', '曲阜市', '中国,山东省,济宁市,曲阜市', '曲阜', '中国,山东,济宁,曲阜', '3', '0537', '273100', 'Qufu', 'QF', 'Q', '116.986', '35.5809', '');
INSERT INTO `t_order_region` VALUES ('1545', '370883', '370800', '邹城市', '中国,山东省,济宁市,邹城市', '邹城', '中国,山东,济宁,邹城', '3', '0537', '273500', 'Zoucheng', 'ZC', 'Z', '116.973', '35.4053', '');
INSERT INTO `t_order_region` VALUES ('1546', '370884', '370800', '高新区', '中国,山东省,济宁市,高新区', '高新区', '中国,山东,济宁,高新区', '3', '0537', '272000', 'Gaoxinqu', 'GXQ', 'G', '116.63', '35.4298', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1547', '370900', '370000', '泰安市', '中国,山东省,泰安市', '泰安', '中国,山东,泰安', '2', '0538', '271000', 'Tai\'an', 'TA', 'T', '117.129', '36.195', '');
INSERT INTO `t_order_region` VALUES ('1548', '370902', '370900', '泰山区', '中国,山东省,泰安市,泰山区', '泰山', '中国,山东,泰安,泰山', '3', '0538', '271000', 'Taishan', 'TS', 'T', '117.134', '36.1941', '');
INSERT INTO `t_order_region` VALUES ('1549', '370911', '370900', '岱岳区', '中国,山东省,泰安市,岱岳区', '岱岳', '中国,山东,泰安,岱岳', '3', '0538', '271000', 'Daiyue', 'DY', 'D', '117.042', '36.1875', '');
INSERT INTO `t_order_region` VALUES ('1550', '370921', '370900', '宁阳县', '中国,山东省,泰安市,宁阳县', '宁阳', '中国,山东,泰安,宁阳', '3', '0538', '271400', 'Ningyang', 'NY', 'N', '116.805', '35.7599', '');
INSERT INTO `t_order_region` VALUES ('1551', '370923', '370900', '东平县', '中国,山东省,泰安市,东平县', '东平', '中国,山东,泰安,东平', '3', '0538', '271500', 'Dongping', 'DP', 'D', '116.471', '35.9379', '');
INSERT INTO `t_order_region` VALUES ('1552', '370982', '370900', '新泰市', '中国,山东省,泰安市,新泰市', '新泰', '中国,山东,泰安,新泰', '3', '0538', '271200', 'Xintai', 'XT', 'X', '117.77', '35.9089', '');
INSERT INTO `t_order_region` VALUES ('1553', '370983', '370900', '肥城市', '中国,山东省,泰安市,肥城市', '肥城', '中国,山东,泰安,肥城', '3', '0538', '271600', 'Feicheng', 'FC', 'F', '116.768', '36.1825', '');
INSERT INTO `t_order_region` VALUES ('1554', '371000', '370000', '威海市', '中国,山东省,威海市', '威海', '中国,山东,威海', '2', '0631', '264200', 'Weihai', 'WH', 'W', '122.116', '37.5097', '');
INSERT INTO `t_order_region` VALUES ('1555', '371002', '371000', '环翠区', '中国,山东省,威海市,环翠区', '环翠', '中国,山东,威海,环翠', '3', '0631', '264200', 'Huancui', 'HC', 'H', '122.123', '37.502', '');
INSERT INTO `t_order_region` VALUES ('1556', '371003', '371000', '文登区', '中国,山东省,威海市,文登区', '文登', '中国,山东,威海,文登', '3', '0631', '266440', 'Wendeng', 'WD', 'W', '122.057', '37.1962', '');
INSERT INTO `t_order_region` VALUES ('1557', '371082', '371000', '荣成市', '中国,山东省,威海市,荣成市', '荣成', '中国,山东,威海,荣成', '3', '0631', '264300', 'Rongcheng', 'RC', 'R', '122.488', '37.1652', '');
INSERT INTO `t_order_region` VALUES ('1558', '371083', '371000', '乳山市', '中国,山东省,威海市,乳山市', '乳山', '中国,山东,威海,乳山', '3', '0631', '264500', 'Rushan', 'RS', 'R', '121.538', '36.9192', '');
INSERT INTO `t_order_region` VALUES ('1559', '371100', '370000', '日照市', '中国,山东省,日照市', '日照', '中国,山东,日照', '2', '0633', '276800', 'Rizhao', 'RZ', 'R', '119.461', '35.4286', '');
INSERT INTO `t_order_region` VALUES ('1560', '371102', '371100', '东港区', '中国,山东省,日照市,东港区', '东港', '中国,山东,日照,东港', '3', '0633', '276800', 'Donggang', 'DG', 'D', '119.462', '35.4254', '');
INSERT INTO `t_order_region` VALUES ('1561', '371103', '371100', '岚山区', '中国,山东省,日照市,岚山区', '岚山', '中国,山东,日照,岚山', '3', '0633', '276800', 'Lanshan', 'LS', 'L', '119.319', '35.122', '');
INSERT INTO `t_order_region` VALUES ('1562', '371121', '371100', '五莲县', '中国,山东省,日照市,五莲县', '五莲', '中国,山东,日照,五莲', '3', '0633', '262300', 'Wulian', 'WL', 'W', '119.207', '35.75', '');
INSERT INTO `t_order_region` VALUES ('1563', '371122', '371100', '莒县', '中国,山东省,日照市,莒县', '莒县', '中国,山东,日照,莒县', '3', '0633', '276500', 'Juxian', 'JX', 'J', '118.838', '35.5805', '');
INSERT INTO `t_order_region` VALUES ('1564', '371200', '370000', '莱芜市', '中国,山东省,莱芜市', '莱芜', '中国,山东,莱芜', '2', '0634', '271100', 'Laiwu', 'LW', 'L', '117.678', '36.2144', '');
INSERT INTO `t_order_region` VALUES ('1565', '371202', '371200', '莱城区', '中国,山东省,莱芜市,莱城区', '莱城', '中国,山东,莱芜,莱城', '3', '0634', '271100', 'Laicheng', 'LC', 'L', '117.66', '36.2032', '');
INSERT INTO `t_order_region` VALUES ('1566', '371203', '371200', '钢城区', '中国,山东省,莱芜市,钢城区', '钢城', '中国,山东,莱芜,钢城', '3', '0634', '271100', 'Gangcheng', 'GC', 'G', '117.805', '36.0632', '');
INSERT INTO `t_order_region` VALUES ('1567', '371300', '370000', '临沂市', '中国,山东省,临沂市', '临沂', '中国,山东,临沂', '2', '0539', '276000', 'Linyi', 'LY', 'L', '118.326', '35.0653', '');
INSERT INTO `t_order_region` VALUES ('1568', '371302', '371300', '兰山区', '中国,山东省,临沂市,兰山区', '兰山', '中国,山东,临沂,兰山', '3', '0539', '276000', 'Lanshan', 'LS', 'L', '118.348', '35.0687', '');
INSERT INTO `t_order_region` VALUES ('1569', '371311', '371300', '罗庄区', '中国,山东省,临沂市,罗庄区', '罗庄', '中国,山东,临沂,罗庄', '3', '0539', '276000', 'Luozhuang', 'LZ', 'L', '118.285', '34.9963', '');
INSERT INTO `t_order_region` VALUES ('1570', '371312', '371300', '河东区', '中国,山东省,临沂市,河东区', '河东', '中国,山东,临沂,河东', '3', '0539', '276000', 'Hedong', 'HD', 'H', '118.411', '35.088', '');
INSERT INTO `t_order_region` VALUES ('1571', '371321', '371300', '沂南县', '中国,山东省,临沂市,沂南县', '沂南', '中国,山东,临沂,沂南', '3', '0539', '276300', 'Yinan', 'YN', 'Y', '118.471', '35.5513', '');
INSERT INTO `t_order_region` VALUES ('1572', '371322', '371300', '郯城县', '中国,山东省,临沂市,郯城县', '郯城', '中国,山东,临沂,郯城', '3', '0539', '276100', 'Tancheng', 'TC', 'T', '118.367', '34.6135', '');
INSERT INTO `t_order_region` VALUES ('1573', '371323', '371300', '沂水县', '中国,山东省,临沂市,沂水县', '沂水', '中国,山东,临沂,沂水', '3', '0539', '276400', 'Yishui', 'YS', 'Y', '118.63', '35.7873', '');
INSERT INTO `t_order_region` VALUES ('1574', '371324', '371300', '兰陵县', '中国,山东省,临沂市,兰陵县', '兰陵', '中国,山东,临沂,兰陵', '3', '0539', '277700', 'Lanling', 'LL', 'L', '117.857', '34.7383', '');
INSERT INTO `t_order_region` VALUES ('1575', '371325', '371300', '费县', '中国,山东省,临沂市,费县', '费县', '中国,山东,临沂,费县', '3', '0539', '273400', 'Feixian', 'FX', 'F', '117.978', '35.2656', '');
INSERT INTO `t_order_region` VALUES ('1576', '371326', '371300', '平邑县', '中国,山东省,临沂市,平邑县', '平邑', '中国,山东,临沂,平邑', '3', '0539', '273300', 'Pingyi', 'PY', 'P', '117.639', '35.5057', '');
INSERT INTO `t_order_region` VALUES ('1577', '371327', '371300', '莒南县', '中国,山东省,临沂市,莒南县', '莒南', '中国,山东,临沂,莒南', '3', '0539', '276600', 'Junan', 'JN', 'J', '118.832', '35.1754', '');
INSERT INTO `t_order_region` VALUES ('1578', '371328', '371300', '蒙阴县', '中国,山东省,临沂市,蒙阴县', '蒙阴', '中国,山东,临沂,蒙阴', '3', '0539', '276200', 'Mengyin', 'MY', 'M', '117.946', '35.71', '');
INSERT INTO `t_order_region` VALUES ('1579', '371329', '371300', '临沭县', '中国,山东省,临沂市,临沭县', '临沭', '中国,山东,临沂,临沭', '3', '0539', '276700', 'Linshu', 'LS', 'L', '118.653', '34.9209', '');
INSERT INTO `t_order_region` VALUES ('1580', '371400', '370000', '德州市', '中国,山东省,德州市', '德州', '中国,山东,德州', '2', '0534', '253000', 'Dezhou', 'DZ', 'D', '116.307', '37.454', '');
INSERT INTO `t_order_region` VALUES ('1581', '371402', '371400', '德城区', '中国,山东省,德州市,德城区', '德城', '中国,山东,德州,德城', '3', '0534', '253000', 'Decheng', 'DC', 'D', '116.299', '37.4513', '');
INSERT INTO `t_order_region` VALUES ('1582', '371403', '371400', '陵城区', '中国,山东省,德州市,陵城区', '陵城', '中国,山东,德州,陵城', '3', '0534', '253500', 'Lingcheng', 'LC', 'L', '116.576', '37.3357', '');
INSERT INTO `t_order_region` VALUES ('1583', '371422', '371400', '宁津县', '中国,山东省,德州市,宁津县', '宁津', '中国,山东,德州,宁津', '3', '0534', '253400', 'Ningjin', 'NJ', 'N', '116.797', '37.653', '');
INSERT INTO `t_order_region` VALUES ('1584', '371423', '371400', '庆云县', '中国,山东省,德州市,庆云县', '庆云', '中国,山东,德州,庆云', '3', '0534', '253700', 'Qingyun', 'QY', 'Q', '117.386', '37.7762', '');
INSERT INTO `t_order_region` VALUES ('1585', '371424', '371400', '临邑县', '中国,山东省,德州市,临邑县', '临邑', '中国,山东,德州,临邑', '3', '0534', '251500', 'Linyi', 'LY', 'L', '116.865', '37.1905', '');
INSERT INTO `t_order_region` VALUES ('1586', '371425', '371400', '齐河县', '中国,山东省,德州市,齐河县', '齐河', '中国,山东,德州,齐河', '3', '0534', '251100', 'Qihe', 'QH', 'Q', '116.755', '36.7953', '');
INSERT INTO `t_order_region` VALUES ('1587', '371426', '371400', '平原县', '中国,山东省,德州市,平原县', '平原', '中国,山东,德州,平原', '3', '0534', '253100', 'Pingyuan', 'PY', 'P', '116.434', '37.1663', '');
INSERT INTO `t_order_region` VALUES ('1588', '371427', '371400', '夏津县', '中国,山东省,德州市,夏津县', '夏津', '中国,山东,德州,夏津', '3', '0534', '253200', 'Xiajin', 'XJ', 'X', '116.002', '36.9485', '');
INSERT INTO `t_order_region` VALUES ('1589', '371428', '371400', '武城县', '中国,山东省,德州市,武城县', '武城', '中国,山东,德州,武城', '3', '0534', '253300', 'Wucheng', 'WC', 'W', '116.07', '37.214', '');
INSERT INTO `t_order_region` VALUES ('1590', '371481', '371400', '乐陵市', '中国,山东省,德州市,乐陵市', '乐陵', '中国,山东,德州,乐陵', '3', '0534', '253600', 'Leling', 'LL', 'L', '117.231', '37.7316', '');
INSERT INTO `t_order_region` VALUES ('1591', '371482', '371400', '禹城市', '中国,山东省,德州市,禹城市', '禹城', '中国,山东,德州,禹城', '3', '0534', '251200', 'Yucheng', 'YC', 'Y', '116.643', '36.9344', '');
INSERT INTO `t_order_region` VALUES ('1592', '371500', '370000', '聊城市', '中国,山东省,聊城市', '聊城', '中国,山东,聊城', '2', '0635', '252000', 'Liaocheng', 'LC', 'L', '115.98', '36.456', '');
INSERT INTO `t_order_region` VALUES ('1593', '371502', '371500', '东昌府区', '中国,山东省,聊城市,东昌府区', '东昌府', '中国,山东,聊城,东昌府', '3', '0635', '252000', 'Dongchangfu', 'DCF', 'D', '115.974', '36.4446', '');
INSERT INTO `t_order_region` VALUES ('1594', '371521', '371500', '阳谷县', '中国,山东省,聊城市,阳谷县', '阳谷', '中国,山东,聊城,阳谷', '3', '0635', '252300', 'Yanggu', 'YG', 'Y', '115.791', '36.1144', '');
INSERT INTO `t_order_region` VALUES ('1595', '371522', '371500', '莘县', '中国,山东省,聊城市,莘县', '莘县', '中国,山东,聊城,莘县', '3', '0635', '252400', 'Shenxian', 'SX', 'S', '115.67', '36.2342', '');
INSERT INTO `t_order_region` VALUES ('1596', '371523', '371500', '茌平县', '中国,山东省,聊城市,茌平县', '茌平', '中国,山东,聊城,茌平', '3', '0635', '252100', 'Chiping', 'CP', 'C', '116.255', '36.5797', '');
INSERT INTO `t_order_region` VALUES ('1597', '371524', '371500', '东阿县', '中国,山东省,聊城市,东阿县', '东阿', '中国,山东,聊城,东阿', '3', '0635', '252200', 'Dong\'e', 'DE', 'D', '116.25', '36.3321', '');
INSERT INTO `t_order_region` VALUES ('1598', '371525', '371500', '冠县', '中国,山东省,聊城市,冠县', '冠县', '中国,山东,聊城,冠县', '3', '0635', '252500', 'Guanxian', 'GX', 'G', '115.442', '36.4843', '');
INSERT INTO `t_order_region` VALUES ('1599', '371526', '371500', '高唐县', '中国,山东省,聊城市,高唐县', '高唐', '中国,山东,聊城,高唐', '3', '0635', '252800', 'Gaotang', 'GT', 'G', '116.232', '36.8653', '');
INSERT INTO `t_order_region` VALUES ('1600', '371581', '371500', '临清市', '中国,山东省,聊城市,临清市', '临清', '中国,山东,聊城,临清', '3', '0635', '252600', 'Linqing', 'LQ', 'L', '115.706', '36.8395', '');
INSERT INTO `t_order_region` VALUES ('1601', '371600', '370000', '滨州市', '中国,山东省,滨州市', '滨州', '中国,山东,滨州', '2', '0543', '256600', 'Binzhou', 'BZ', 'B', '118.017', '37.3835', '');
INSERT INTO `t_order_region` VALUES ('1602', '371602', '371600', '滨城区', '中国,山东省,滨州市,滨城区', '滨城', '中国,山东,滨州,滨城', '3', '0543', '256600', 'Bincheng', 'BC', 'B', '118.02', '37.3852', '');
INSERT INTO `t_order_region` VALUES ('1603', '371603', '371600', '沾化区', '中国,山东省,滨州市,沾化区', '沾化', '中国,山东,滨州,沾化', '3', '0543', '256800', 'Zhanhua', 'ZH', 'Z', '118.132', '37.6983', '');
INSERT INTO `t_order_region` VALUES ('1604', '371621', '371600', '惠民县', '中国,山东省,滨州市,惠民县', '惠民', '中国,山东,滨州,惠民', '3', '0543', '251700', 'Huimin', 'HM', 'H', '117.511', '37.4901', '');
INSERT INTO `t_order_region` VALUES ('1605', '371622', '371600', '阳信县', '中国,山东省,滨州市,阳信县', '阳信', '中国,山东,滨州,阳信', '3', '0543', '251800', 'Yangxin', 'YX', 'Y', '117.581', '37.642', '');
INSERT INTO `t_order_region` VALUES ('1606', '371623', '371600', '无棣县', '中国,山东省,滨州市,无棣县', '无棣', '中国,山东,滨州,无棣', '3', '0543', '251900', 'Wudi', 'WD', 'W', '117.614', '37.7401', '');
INSERT INTO `t_order_region` VALUES ('1607', '371625', '371600', '博兴县', '中国,山东省,滨州市,博兴县', '博兴', '中国,山东,滨州,博兴', '3', '0543', '256500', 'Boxing', 'BX', 'B', '118.134', '37.1432', '');
INSERT INTO `t_order_region` VALUES ('1608', '371626', '371600', '邹平县', '中国,山东省,滨州市,邹平县', '邹平', '中国,山东,滨州,邹平', '3', '0543', '256200', 'Zouping', 'ZP', 'Z', '117.743', '36.8629', '');
INSERT INTO `t_order_region` VALUES ('1609', '371627', '371600', '北海新区', '中国,山东省,滨州市,北海新区', '北海新区', '中国,山东,滨州,北海新区', '3', '0543', '256200', 'Beihaixinqu', 'BHXQ', 'B', '118.017', '37.3835', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1610', '371700', '370000', '菏泽市', '中国,山东省,菏泽市', '菏泽', '中国,山东,菏泽', '2', '0530', '274000', 'Heze', 'HZ', 'H', '115.469', '35.2465', '');
INSERT INTO `t_order_region` VALUES ('1611', '371702', '371700', '牡丹区', '中国,山东省,菏泽市,牡丹区', '牡丹', '中国,山东,菏泽,牡丹', '3', '0530', '274000', 'Mudan', 'MD', 'M', '115.417', '35.2509', '');
INSERT INTO `t_order_region` VALUES ('1612', '371703', '371700', '定陶区', '中国,山东省,菏泽市,定陶区', '定陶', '中国,山东,菏泽,定陶', '3', '0530', '274100', 'Dingtao', 'DT', 'D', '115.573', '35.0712', '');
INSERT INTO `t_order_region` VALUES ('1613', '371721', '371700', '曹县', '中国,山东省,菏泽市,曹县', '曹县', '中国,山东,菏泽,曹县', '3', '0530', '274400', 'Caoxian', 'CX', 'C', '115.542', '34.8266', '');
INSERT INTO `t_order_region` VALUES ('1614', '371722', '371700', '单县', '中国,山东省,菏泽市,单县', '单县', '中国,山东,菏泽,单县', '3', '0530', '274300', 'Shanxian', 'SX', 'S', '116.087', '34.7951', '');
INSERT INTO `t_order_region` VALUES ('1615', '371723', '371700', '成武县', '中国,山东省,菏泽市,成武县', '成武', '中国,山东,菏泽,成武', '3', '0530', '274200', 'Chengwu', 'CW', 'C', '115.89', '34.9533', '');
INSERT INTO `t_order_region` VALUES ('1616', '371724', '371700', '巨野县', '中国,山东省,菏泽市,巨野县', '巨野', '中国,山东,菏泽,巨野', '3', '0530', '274900', 'Juye', 'JY', 'J', '116.095', '35.3979', '');
INSERT INTO `t_order_region` VALUES ('1617', '371725', '371700', '郓城县', '中国,山东省,菏泽市,郓城县', '郓城', '中国,山东,菏泽,郓城', '3', '0530', '274700', 'Yuncheng', 'YC', 'Y', '115.944', '35.6004', '');
INSERT INTO `t_order_region` VALUES ('1618', '371726', '371700', '鄄城县', '中国,山东省,菏泽市,鄄城县', '鄄城', '中国,山东,菏泽,鄄城', '3', '0530', '274600', 'Juancheng', 'JC', 'J', '115.51', '35.5641', '');
INSERT INTO `t_order_region` VALUES ('1619', '371728', '371700', '东明县', '中国,山东省,菏泽市,东明县', '东明', '中国,山东,菏泽,东明', '3', '0530', '274500', 'Dongming', 'DM', 'D', '115.091', '35.2891', '');
INSERT INTO `t_order_region` VALUES ('1620', '410000', '100000', '河南省', '中国,河南省', '河南', '中国,河南', '1', '', '', 'Henan', 'HA', 'H', '113.665', '34.758', '');
INSERT INTO `t_order_region` VALUES ('1621', '410100', '410000', '郑州市', '中国,河南省,郑州市', '郑州', '中国,河南,郑州', '2', '0371', '450000', 'Zhengzhou', 'ZZ', 'Z', '113.665', '34.758', '');
INSERT INTO `t_order_region` VALUES ('1622', '410102', '410100', '中原区', '中国,河南省,郑州市,中原区', '中原', '中国,河南,郑州,中原', '3', '0371', '450000', 'Zhongyuan', 'ZY', 'Z', '113.613', '34.7483', '');
INSERT INTO `t_order_region` VALUES ('1623', '410103', '410100', '二七区', '中国,河南省,郑州市,二七区', '二七', '中国,河南,郑州,二七', '3', '0371', '450000', 'Erqi', 'EQ', 'E', '113.639', '34.7234', '');
INSERT INTO `t_order_region` VALUES ('1624', '410104', '410100', '管城回族区', '中国,河南省,郑州市,管城回族区', '管城', '中国,河南,郑州,管城', '3', '0371', '450000', 'Guancheng', 'GC', 'G', '113.677', '34.7538', '');
INSERT INTO `t_order_region` VALUES ('1625', '410105', '410100', '金水区', '中国,河南省,郑州市,金水区', '金水', '中国,河南,郑州,金水', '3', '0371', '450000', 'Jinshui', 'JS', 'J', '113.661', '34.8003', '');
INSERT INTO `t_order_region` VALUES ('1626', '410106', '410100', '上街区', '中国,河南省,郑州市,上街区', '上街', '中国,河南,郑州,上街', '3', '0371', '450041', 'Shangjie', 'SJ', 'S', '113.309', '34.8028', '');
INSERT INTO `t_order_region` VALUES ('1627', '410108', '410100', '惠济区', '中国,河南省,郑州市,惠济区', '惠济', '中国,河南,郑州,惠济', '3', '0371', '450053', 'Huiji', 'HJ', 'H', '113.617', '34.8674', '');
INSERT INTO `t_order_region` VALUES ('1628', '410122', '410100', '中牟县', '中国,河南省,郑州市,中牟县', '中牟', '中国,河南,郑州,中牟', '3', '0371', '451450', 'Zhongmu', 'ZM', 'Z', '113.976', '34.719', '');
INSERT INTO `t_order_region` VALUES ('1629', '410181', '410100', '巩义市', '中国,河南省,郑州市,巩义市', '巩义', '中国,河南,郑州,巩义', '3', '0371', '451200', 'Gongyi', 'GY', 'G', '113.022', '34.7479', '');
INSERT INTO `t_order_region` VALUES ('1630', '410182', '410100', '荥阳市', '中国,河南省,郑州市,荥阳市', '荥阳', '中国,河南,郑州,荥阳', '3', '0371', '450100', 'Xingyang', 'XY', 'X', '113.383', '34.7876', '');
INSERT INTO `t_order_region` VALUES ('1631', '410183', '410100', '新密市', '中国,河南省,郑州市,新密市', '新密', '中国,河南,郑州,新密', '3', '0371', '452370', 'Xinmi', 'XM', 'X', '113.387', '34.537', '');
INSERT INTO `t_order_region` VALUES ('1632', '410184', '410100', '新郑市', '中国,河南省,郑州市,新郑市', '新郑', '中国,河南,郑州,新郑', '3', '0371', '451100', 'Xinzheng', 'XZ', 'X', '113.736', '34.3955', '');
INSERT INTO `t_order_region` VALUES ('1633', '410185', '410100', '登封市', '中国,河南省,郑州市,登封市', '登封', '中国,河南,郑州,登封', '3', '0371', '452470', 'Dengfeng', 'DF', 'D', '113.05', '34.4534', '');
INSERT INTO `t_order_region` VALUES ('1634', '410186', '410100', '郑东新区', '中国,河南省,郑州市,郑东新区', '郑东新区', '中国,河南,郑州,郑东新区', '3', '0371', '450018', 'Zhengdongxinqu', 'ZDXQ', 'Z', '113.729', '34.7696', '新区');
INSERT INTO `t_order_region` VALUES ('1635', '410187', '410100', '郑汴新区', '中国,河南省,郑州市,郑汴新区', '郑汴新区', '中国,河南,郑州,郑汴新区', '3', '0371', '451100', 'Zhengbianxinqu', 'ZBXQ', 'Z', '113.693', '34.747', '新区');
INSERT INTO `t_order_region` VALUES ('1636', '410188', '410100', '高新开发区', '中国,河南省,郑州市,高新开发区', '高新开发区', '中国,河南,郑州,高新开发区', '3', '0371', '450000', 'Gaoxinqu', 'GXQ', 'G', '113.567', '34.8121', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1637', '410189', '410100', '经济开发区', '中国,河南省,郑州市,经济开发区', '经济开发区', '中国,河南,郑州,经济开发区', '3', '0371', '450000', 'Jingjiqu', 'JJQ', 'J', '113.743', '34.722', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1638', '410200', '410000', '开封市', '中国,河南省,开封市', '开封', '中国,河南,开封', '2', '0371', '475000', 'Kaifeng', 'KF', 'K', '114.341', '34.7971', '');
INSERT INTO `t_order_region` VALUES ('1639', '410202', '410200', '龙亭区', '中国,河南省,开封市,龙亭区', '龙亭', '中国,河南,开封,龙亭', '3', '0371', '475000', 'Longting', 'LT', 'L', '114.355', '34.7999', '');
INSERT INTO `t_order_region` VALUES ('1640', '410203', '410200', '顺河回族区', '中国,河南省,开封市,顺河回族区', '顺河', '中国,河南,开封,顺河', '3', '0371', '475000', 'Shunhe', 'SH', 'S', '114.361', '34.7959', '');
INSERT INTO `t_order_region` VALUES ('1641', '410204', '410200', '鼓楼区', '中国,河南省,开封市,鼓楼区', '鼓楼', '中国,河南,开封,鼓楼', '3', '0371', '475000', 'Gulou', 'GL', 'G', '114.356', '34.7952', '');
INSERT INTO `t_order_region` VALUES ('1642', '410205', '410200', '禹王台区', '中国,河南省,开封市,禹王台区', '禹王台', '中国,河南,开封,禹王台', '3', '0371', '475000', 'Yuwangtai', 'YWT', 'Y', '114.348', '34.7769', '');
INSERT INTO `t_order_region` VALUES ('1643', '410212', '410200', '祥符区', '中国,河南省,开封市,祥符区', '祥符', '中国,河南,开封,祥符', '3', '0371', '475100', 'Xiangfu', 'XF', 'X', '114.439', '34.7587', '');
INSERT INTO `t_order_region` VALUES ('1644', '410221', '410200', '杞县', '中国,河南省,开封市,杞县', '杞县', '中国,河南,开封,杞县', '3', '0371', '475200', 'Qixian', 'QX', 'Q', '114.783', '34.5503', '');
INSERT INTO `t_order_region` VALUES ('1645', '410222', '410200', '通许县', '中国,河南省,开封市,通许县', '通许', '中国,河南,开封,通许', '3', '0371', '475400', 'Tongxu', 'TX', 'T', '114.467', '34.4752', '');
INSERT INTO `t_order_region` VALUES ('1646', '410223', '410200', '尉氏县', '中国,河南省,开封市,尉氏县', '尉氏', '中国,河南,开封,尉氏', '3', '0371', '475500', 'Weishi', 'WS', 'W', '114.193', '34.4122', '');
INSERT INTO `t_order_region` VALUES ('1647', '410225', '410200', '兰考县', '中国,河南省,开封市,兰考县', '兰考', '中国,河南,开封,兰考', '3', '0371', '475300', 'Lankao', 'LK', 'L', '114.82', '34.8235', '');
INSERT INTO `t_order_region` VALUES ('1648', '410226', '410200', '经济技术开发区', '中国,河南省,开封市,经济技术开发区', '兰考', '中国,河南,开封,经济技术开发区', '3', '0371', '475000', 'JingJiKaiFaQu', 'JJKFQ', 'J', '114.292', '34.7868', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1649', '410300', '410000', '洛阳市', '中国,河南省,洛阳市', '洛阳', '中国,河南,洛阳', '2', '0379', '471000', 'Luoyang', 'LY', 'L', '112.434', '34.663', '');
INSERT INTO `t_order_region` VALUES ('1650', '410302', '410300', '老城区', '中国,河南省,洛阳市,老城区', '老城', '中国,河南,洛阳,老城', '3', '0379', '471000', 'Laocheng', 'LC', 'L', '112.469', '34.6836', '');
INSERT INTO `t_order_region` VALUES ('1651', '410303', '410300', '西工区', '中国,河南省,洛阳市,西工区', '西工', '中国,河南,洛阳,西工', '3', '0379', '471000', 'Xigong', 'XG', 'X', '112.437', '34.67', '');
INSERT INTO `t_order_region` VALUES ('1652', '410304', '410300', '瀍河回族区', '中国,河南省,洛阳市,瀍河回族区', '瀍河', '中国,河南,洛阳,瀍河', '3', '0379', '471002', 'Chanhe', 'CH', 'C', '112.5', '34.6799', '');
INSERT INTO `t_order_region` VALUES ('1653', '410305', '410300', '涧西区', '中国,河南省,洛阳市,涧西区', '涧西', '中国,河南,洛阳,涧西', '3', '0379', '471000', 'Jianxi', 'JX', 'J', '112.396', '34.6582', '');
INSERT INTO `t_order_region` VALUES ('1654', '410306', '410300', '吉利区', '中国,河南省,洛阳市,吉利区', '吉利', '中国,河南,洛阳,吉利', '3', '0379', '471000', 'Jili', 'JL', 'J', '112.589', '34.9009', '');
INSERT INTO `t_order_region` VALUES ('1655', '410311', '410300', '洛龙区', '中国,河南省,洛阳市,洛龙区', '洛龙', '中国,河南,洛阳,洛龙', '3', '0379', '471000', 'Luolong', 'LL', 'L', '112.464', '34.6187', '');
INSERT INTO `t_order_region` VALUES ('1656', '410322', '410300', '孟津县', '中国,河南省,洛阳市,孟津县', '孟津', '中国,河南,洛阳,孟津', '3', '0379', '471100', 'Mengjin', 'MJ', 'M', '112.444', '34.826', '');
INSERT INTO `t_order_region` VALUES ('1657', '410323', '410300', '新安县', '中国,河南省,洛阳市,新安县', '新安', '中国,河南,洛阳,新安', '3', '0379', '471800', 'Xin\'an', 'XA', 'X', '112.132', '34.7281', '');
INSERT INTO `t_order_region` VALUES ('1658', '410324', '410300', '栾川县', '中国,河南省,洛阳市,栾川县', '栾川', '中国,河南,洛阳,栾川', '3', '0379', '471500', 'Luanchuan', 'LC', 'L', '111.618', '33.7858', '');
INSERT INTO `t_order_region` VALUES ('1659', '410325', '410300', '嵩县', '中国,河南省,洛阳市,嵩县', '嵩县', '中国,河南,洛阳,嵩县', '3', '0379', '471400', 'Songxian', 'SX', 'S', '112.085', '34.1347', '');
INSERT INTO `t_order_region` VALUES ('1660', '410326', '410300', '汝阳县', '中国,河南省,洛阳市,汝阳县', '汝阳', '中国,河南,洛阳,汝阳', '3', '0379', '471200', 'Ruyang', 'RY', 'R', '112.473', '34.1539', '');
INSERT INTO `t_order_region` VALUES ('1661', '410327', '410300', '宜阳县', '中国,河南省,洛阳市,宜阳县', '宜阳', '中国,河南,洛阳,宜阳', '3', '0379', '471600', 'Yiyang', 'YY', 'Y', '112.179', '34.5152', '');
INSERT INTO `t_order_region` VALUES ('1662', '410328', '410300', '洛宁县', '中国,河南省,洛阳市,洛宁县', '洛宁', '中国,河南,洛阳,洛宁', '3', '0379', '471700', 'Luoning', 'LN', 'L', '111.651', '34.3891', '');
INSERT INTO `t_order_region` VALUES ('1663', '410329', '410300', '伊川县', '中国,河南省,洛阳市,伊川县', '伊川', '中国,河南,洛阳,伊川', '3', '0379', '471300', 'Yichuan', 'YC', 'Y', '112.429', '34.4221', '');
INSERT INTO `t_order_region` VALUES ('1664', '410381', '410300', '偃师市', '中国,河南省,洛阳市,偃师市', '偃师', '中国,河南,洛阳,偃师', '3', '0379', '471900', 'Yanshi', 'YS', 'Y', '112.792', '34.7281', '');
INSERT INTO `t_order_region` VALUES ('1665', '410382', '410300', '洛阳新区', '中国,河南省,洛阳市,洛阳新区', '洛阳新区', '中国,河南,洛阳,洛阳新区', '3', '0379', '471000', 'Luoyangxinqu', 'LYXQ', 'L', '112.482', '34.6098', '新区');
INSERT INTO `t_order_region` VALUES ('1666', '410383', '410300', '高新区', '中国,河南省,洛阳市,高新区', '高新区', '中国,河南,洛阳,高新区', '3', '0379', '471000', 'Gaoxinqu', 'GXQ', 'G', '112.372', '34.6423', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1667', '410400', '410000', '平顶山市', '中国,河南省,平顶山市', '平顶山', '中国,河南,平顶山', '2', '0375', '467000', 'Pingdingshan', 'PDS', 'P', '113.308', '33.7352', '');
INSERT INTO `t_order_region` VALUES ('1668', '410402', '410400', '新华区', '中国,河南省,平顶山市,新华区', '新华', '中国,河南,平顶山,新华', '3', '0375', '467000', 'Xinhua', 'XH', 'X', '113.294', '33.7373', '');
INSERT INTO `t_order_region` VALUES ('1669', '410403', '410400', '卫东区', '中国,河南省,平顶山市,卫东区', '卫东', '中国,河南,平顶山,卫东', '3', '0375', '467000', 'Weidong', 'WD', 'W', '113.335', '33.7347', '');
INSERT INTO `t_order_region` VALUES ('1670', '410404', '410400', '石龙区', '中国,河南省,平顶山市,石龙区', '石龙', '中国,河南,平顶山,石龙', '3', '0375', '467000', 'Shilong', 'SL', 'S', '112.899', '33.8988', '');
INSERT INTO `t_order_region` VALUES ('1671', '410411', '410400', '湛河区', '中国,河南省,平顶山市,湛河区', '湛河', '中国,河南,平顶山,湛河', '3', '0375', '467000', 'Zhanhe', 'ZH', 'Z', '113.293', '33.7362', '');
INSERT INTO `t_order_region` VALUES ('1672', '410421', '410400', '宝丰县', '中国,河南省,平顶山市,宝丰县', '宝丰', '中国,河南,平顶山,宝丰', '3', '0375', '467400', 'Baofeng', 'BF', 'B', '113.055', '33.8692', '');
INSERT INTO `t_order_region` VALUES ('1673', '410422', '410400', '叶县', '中国,河南省,平顶山市,叶县', '叶县', '中国,河南,平顶山,叶县', '3', '0375', '467200', 'Yexian', 'YX', 'Y', '113.351', '33.6222', '');
INSERT INTO `t_order_region` VALUES ('1674', '410423', '410400', '鲁山县', '中国,河南省,平顶山市,鲁山县', '鲁山', '中国,河南,平顶山,鲁山', '3', '0375', '467300', 'Lushan', 'LS', 'L', '112.906', '33.7388', '');
INSERT INTO `t_order_region` VALUES ('1675', '410425', '410400', '郏县', '中国,河南省,平顶山市,郏县', '郏县', '中国,河南,平顶山,郏县', '3', '0375', '467100', 'Jiaxian', 'JX', 'J', '113.216', '33.9707', '');
INSERT INTO `t_order_region` VALUES ('1676', '410481', '410400', '舞钢市', '中国,河南省,平顶山市,舞钢市', '舞钢', '中国,河南,平顶山,舞钢', '3', '0375', '462500', 'Wugang', 'WG', 'W', '113.524', '33.2938', '');
INSERT INTO `t_order_region` VALUES ('1677', '410482', '410400', '汝州市', '中国,河南省,平顶山市,汝州市', '汝州', '中国,河南,平顶山,汝州', '3', '0375', '467500', 'Ruzhou', 'RZ', 'R', '112.843', '34.1614', '');
INSERT INTO `t_order_region` VALUES ('1678', '410500', '410000', '安阳市', '中国,河南省,安阳市', '安阳', '中国,河南,安阳', '2', '0372', '455000', 'Anyang', 'AY', 'A', '114.352', '36.1034', '');
INSERT INTO `t_order_region` VALUES ('1679', '410502', '410500', '文峰区', '中国,河南省,安阳市,文峰区', '文峰', '中国,河南,安阳,文峰', '3', '0372', '455000', 'Wenfeng', 'WF', 'W', '114.357', '36.0905', '');
INSERT INTO `t_order_region` VALUES ('1680', '410503', '410500', '北关区', '中国,河南省,安阳市,北关区', '北关', '中国,河南,安阳,北关', '3', '0372', '455000', 'Beiguan', 'BG', 'B', '114.357', '36.1187', '');
INSERT INTO `t_order_region` VALUES ('1681', '410505', '410500', '殷都区', '中国,河南省,安阳市,殷都区', '殷都', '中国,河南,安阳,殷都', '3', '0372', '455000', 'Yindu', 'YD', 'Y', '114.303', '36.1099', '');
INSERT INTO `t_order_region` VALUES ('1682', '410506', '410500', '龙安区', '中国,河南省,安阳市,龙安区', '龙安', '中国,河南,安阳,龙安', '3', '0372', '455000', 'Long\'an', 'LA', 'L', '114.348', '36.119', '');
INSERT INTO `t_order_region` VALUES ('1683', '410522', '410500', '安阳县', '中国,河南省,安阳市,安阳县', '安阳', '中国,河南,安阳,安阳', '3', '0372', '455100', 'Anyang', 'AY', 'A', '114.366', '36.067', '');
INSERT INTO `t_order_region` VALUES ('1684', '410523', '410500', '汤阴县', '中国,河南省,安阳市,汤阴县', '汤阴', '中国,河南,安阳,汤阴', '3', '0372', '456150', 'Tangyin', 'TY', 'T', '114.358', '35.9215', '');
INSERT INTO `t_order_region` VALUES ('1685', '410526', '410500', '滑县', '中国,河南省,安阳市,滑县', '滑县', '中国,河南,安阳,滑县', '3', '0372', '456400', 'Huaxian', 'HX', 'H', '114.521', '35.5807', '');
INSERT INTO `t_order_region` VALUES ('1686', '410527', '410500', '内黄县', '中国,河南省,安阳市,内黄县', '内黄', '中国,河南,安阳,内黄', '3', '0372', '456300', 'Neihuang', 'NH', 'N', '114.907', '35.9527', '');
INSERT INTO `t_order_region` VALUES ('1687', '410581', '410500', '林州市', '中国,河南省,安阳市,林州市', '林州', '中国,河南,安阳,林州', '3', '0372', '456500', 'Linzhou', 'LZ', 'L', '113.816', '36.078', '');
INSERT INTO `t_order_region` VALUES ('1688', '410582', '410500', '安阳新区', '中国,河南省,安阳市,安阳新区', '安阳新区', '中国,河南,安阳,安阳新区', '3', '0372', '456500', 'Anyangxinqu', 'AYXQ', 'A', '114.453', '36.0839', '新区');
INSERT INTO `t_order_region` VALUES ('1689', '410600', '410000', '鹤壁市', '中国,河南省,鹤壁市', '鹤壁', '中国,河南,鹤壁', '2', '0392', '458000', 'Hebi', 'HB', 'H', '114.295', '35.7482', '');
INSERT INTO `t_order_region` VALUES ('1690', '410602', '410600', '鹤山区', '中国,河南省,鹤壁市,鹤山区', '鹤山', '中国,河南,鹤壁,鹤山', '3', '0392', '458000', 'Heshan', 'HS', 'H', '114.163', '35.9546', '');
INSERT INTO `t_order_region` VALUES ('1691', '410603', '410600', '山城区', '中国,河南省,鹤壁市,山城区', '山城', '中国,河南,鹤壁,山城', '3', '0392', '458000', 'Shancheng', 'SC', 'S', '114.184', '35.8977', '');
INSERT INTO `t_order_region` VALUES ('1692', '410611', '410600', '淇滨区', '中国,河南省,鹤壁市,淇滨区', '淇滨', '中国,河南,鹤壁,淇滨', '3', '0392', '458000', 'Qibin', 'QB', 'Q', '114.299', '35.7413', '');
INSERT INTO `t_order_region` VALUES ('1693', '410621', '410600', '浚县', '中国,河南省,鹤壁市,浚县', '浚县', '中国,河南,鹤壁,浚县', '3', '0392', '456250', 'Xunxian', 'XX', 'X', '114.549', '35.6708', '');
INSERT INTO `t_order_region` VALUES ('1694', '410622', '410600', '淇县', '中国,河南省,鹤壁市,淇县', '淇县', '中国,河南,鹤壁,淇县', '3', '0392', '456750', 'Qixian', 'QX', 'Q', '114.198', '35.6078', '');
INSERT INTO `t_order_region` VALUES ('1695', '410700', '410000', '新乡市', '中国,河南省,新乡市', '新乡', '中国,河南,新乡', '2', '0373', '453000', 'Xinxiang', 'XX', 'X', '113.884', '35.3026', '');
INSERT INTO `t_order_region` VALUES ('1696', '410702', '410700', '红旗区', '中国,河南省,新乡市,红旗区', '红旗', '中国,河南,新乡,红旗', '3', '0373', '453000', 'Hongqi', 'HQ', 'H', '113.875', '35.3037', '');
INSERT INTO `t_order_region` VALUES ('1697', '410703', '410700', '卫滨区', '中国,河南省,新乡市,卫滨区', '卫滨', '中国,河南,新乡,卫滨', '3', '0373', '453000', 'Weibin', 'WB', 'W', '113.866', '35.3021', '');
INSERT INTO `t_order_region` VALUES ('1698', '410704', '410700', '凤泉区', '中国,河南省,新乡市,凤泉区', '凤泉', '中国,河南,新乡,凤泉', '3', '0373', '453011', 'Fengquan', 'FQ', 'F', '113.915', '35.384', '');
INSERT INTO `t_order_region` VALUES ('1699', '410711', '410700', '牧野区', '中国,河南省,新乡市,牧野区', '牧野', '中国,河南,新乡,牧野', '3', '0373', '453002', 'Muye', 'MY', 'M', '113.909', '35.3149', '');
INSERT INTO `t_order_region` VALUES ('1700', '410721', '410700', '新乡县', '中国,河南省,新乡市,新乡县', '新乡', '中国,河南,新乡,新乡', '3', '0373', '453700', 'Xinxiang', 'XX', 'X', '113.805', '35.1908', '');
INSERT INTO `t_order_region` VALUES ('1701', '410724', '410700', '获嘉县', '中国,河南省,新乡市,获嘉县', '获嘉', '中国,河南,新乡,获嘉', '3', '0373', '453800', 'Huojia', 'HJ', 'H', '113.662', '35.2652', '');
INSERT INTO `t_order_region` VALUES ('1702', '410725', '410700', '原阳县', '中国,河南省,新乡市,原阳县', '原阳', '中国,河南,新乡,原阳', '3', '0373', '453500', 'Yuanyang', 'YY', 'Y', '113.94', '35.0657', '');
INSERT INTO `t_order_region` VALUES ('1703', '410726', '410700', '延津县', '中国,河南省,新乡市,延津县', '延津', '中国,河南,新乡,延津', '3', '0373', '453200', 'Yanjin', 'YJ', 'Y', '114.203', '35.1433', '');
INSERT INTO `t_order_region` VALUES ('1704', '410727', '410700', '封丘县', '中国,河南省,新乡市,封丘县', '封丘', '中国,河南,新乡,封丘', '3', '0373', '453300', 'Fengqiu', 'FQ', 'F', '114.419', '35.0417', '');
INSERT INTO `t_order_region` VALUES ('1705', '410728', '410700', '长垣县', '中国,河南省,新乡市,长垣县', '长垣', '中国,河南,新乡,长垣', '3', '0373', '453400', 'Changyuan', 'CY', 'C', '114.669', '35.2005', '');
INSERT INTO `t_order_region` VALUES ('1706', '410781', '410700', '卫辉市', '中国,河南省,新乡市,卫辉市', '卫辉', '中国,河南,新乡,卫辉', '3', '0373', '453100', 'Weihui', 'WH', 'W', '114.065', '35.3984', '');
INSERT INTO `t_order_region` VALUES ('1707', '410782', '410700', '辉县市', '中国,河南省,新乡市,辉县市', '辉县', '中国,河南,新乡,辉县', '3', '0373', '453600', 'Huixian', 'HX', 'H', '113.807', '35.4631', '');
INSERT INTO `t_order_region` VALUES ('1708', '410800', '410000', '焦作市', '中国,河南省,焦作市', '焦作', '中国,河南,焦作', '2', '0391', '454000', 'Jiaozuo', 'JZ', 'J', '113.238', '35.239', '');
INSERT INTO `t_order_region` VALUES ('1709', '410802', '410800', '解放区', '中国,河南省,焦作市,解放区', '解放', '中国,河南,焦作,解放', '3', '0391', '454150', 'Jiefang', 'JF', 'J', '113.229', '35.2402', '');
INSERT INTO `t_order_region` VALUES ('1710', '410803', '410800', '中站区', '中国,河南省,焦作市,中站区', '中站', '中国,河南,焦作,中站', '3', '0391', '454150', 'Zhongzhan', 'ZZ', 'Z', '113.183', '35.2366', '');
INSERT INTO `t_order_region` VALUES ('1711', '410804', '410800', '马村区', '中国,河南省,焦作市,马村区', '马村', '中国,河南,焦作,马村', '3', '0391', '454150', 'Macun', 'MC', 'M', '113.319', '35.2691', '');
INSERT INTO `t_order_region` VALUES ('1712', '410811', '410800', '山阳区', '中国,河南省,焦作市,山阳区', '山阳', '中国,河南,焦作,山阳', '3', '0391', '454150', 'Shanyang', 'SY', 'S', '113.255', '35.2144', '');
INSERT INTO `t_order_region` VALUES ('1713', '410821', '410800', '修武县', '中国,河南省,焦作市,修武县', '修武', '中国,河南,焦作,修武', '3', '0391', '454350', 'Xiuwu', 'XW', 'X', '113.448', '35.2236', '');
INSERT INTO `t_order_region` VALUES ('1714', '410822', '410800', '博爱县', '中国,河南省,焦作市,博爱县', '博爱', '中国,河南,焦作,博爱', '3', '0391', '454450', 'Boai', 'BA', 'B', '113.067', '35.1694', '');
INSERT INTO `t_order_region` VALUES ('1715', '410823', '410800', '武陟县', '中国,河南省,焦作市,武陟县', '武陟', '中国,河南,焦作,武陟', '3', '0391', '454950', 'Wuzhi', 'WZ', 'W', '113.397', '35.0951', '');
INSERT INTO `t_order_region` VALUES ('1716', '410825', '410800', '温县', '中国,河南省,焦作市,温县', '温县', '中国,河南,焦作,温县', '3', '0391', '454850', 'Wenxian', 'WX', 'W', '113.081', '34.9402', '');
INSERT INTO `t_order_region` VALUES ('1717', '410882', '410800', '沁阳市', '中国,河南省,焦作市,沁阳市', '沁阳', '中国,河南,焦作,沁阳', '3', '0391', '454550', 'Qinyang', 'QY', 'Q', '112.945', '35.0894', '');
INSERT INTO `t_order_region` VALUES ('1718', '410883', '410800', '孟州市', '中国,河南省,焦作市,孟州市', '孟州', '中国,河南,焦作,孟州', '3', '0391', '454750', 'Mengzhou', 'MZ', 'M', '112.791', '34.9071', '');
INSERT INTO `t_order_region` VALUES ('1719', '410900', '410000', '濮阳市', '中国,河南省,濮阳市', '濮阳', '中国,河南,濮阳', '2', '0393', '457000', 'Puyang', 'PY', 'P', '115.041', '35.7682', '');
INSERT INTO `t_order_region` VALUES ('1720', '410902', '410900', '华龙区', '中国,河南省,濮阳市,华龙区', '华龙', '中国,河南,濮阳,华龙', '3', '0393', '457001', 'Hualong', 'HL', 'H', '115.074', '35.7774', '');
INSERT INTO `t_order_region` VALUES ('1721', '410922', '410900', '清丰县', '中国,河南省,濮阳市,清丰县', '清丰', '中国,河南,濮阳,清丰', '3', '0393', '457300', 'Qingfeng', 'QF', 'Q', '115.104', '35.8851', '');
INSERT INTO `t_order_region` VALUES ('1722', '410923', '410900', '南乐县', '中国,河南省,濮阳市,南乐县', '南乐', '中国,河南,濮阳,南乐', '3', '0393', '457400', 'Nanle', 'NL', 'N', '115.206', '36.0769', '');
INSERT INTO `t_order_region` VALUES ('1723', '410926', '410900', '范县', '中国,河南省,濮阳市,范县', '范县', '中国,河南,濮阳,范县', '3', '0393', '457500', 'Fanxian', 'FX', 'F', '115.504', '35.8518', '');
INSERT INTO `t_order_region` VALUES ('1724', '410927', '410900', '台前县', '中国,河南省,濮阳市,台前县', '台前', '中国,河南,濮阳,台前', '3', '0393', '457600', 'Taiqian', 'TQ', 'T', '115.872', '35.9692', '');
INSERT INTO `t_order_region` VALUES ('1725', '410928', '410900', '濮阳县', '中国,河南省,濮阳市,濮阳县', '濮阳', '中国,河南,濮阳,濮阳', '3', '0393', '457100', 'Puyang', 'PY', 'P', '115.031', '35.7075', '');
INSERT INTO `t_order_region` VALUES ('1726', '411000', '410000', '许昌市', '中国,河南省,许昌市', '许昌', '中国,河南,许昌', '2', '0374', '461000', 'Xuchang', 'XC', 'X', '113.826', '34.023', '');
INSERT INTO `t_order_region` VALUES ('1727', '411002', '411000', '魏都区', '中国,河南省,许昌市,魏都区', '魏都', '中国,河南,许昌,魏都', '3', '0374', '461000', 'Weidu', 'WD', 'W', '113.823', '34.0254', '');
INSERT INTO `t_order_region` VALUES ('1728', '411003', '411000', '建安区', '中国,河南省,许昌市,建安区', '建安', '中国,河南,许昌,建安', '3', '0374', '461100', 'Jian\'an', 'JA', 'J', '113.847', '34.0041', '');
INSERT INTO `t_order_region` VALUES ('1729', '411024', '411000', '鄢陵县', '中国,河南省,许昌市,鄢陵县', '鄢陵', '中国,河南,许昌,鄢陵', '3', '0374', '461200', 'Yanling', 'YL', 'Y', '114.188', '34.1032', '');
INSERT INTO `t_order_region` VALUES ('1730', '411025', '411000', '襄城县', '中国,河南省,许昌市,襄城县', '襄城', '中国,河南,许昌,襄城', '3', '0374', '452670', 'Xiangcheng', 'XC', 'X', '113.482', '33.8493', '');
INSERT INTO `t_order_region` VALUES ('1731', '411081', '411000', '禹州市', '中国,河南省,许昌市,禹州市', '禹州', '中国,河南,许昌,禹州', '3', '0374', '461670', 'Yuzhou', 'YZ', 'Y', '113.488', '34.1405', '');
INSERT INTO `t_order_region` VALUES ('1732', '411082', '411000', '长葛市', '中国,河南省,许昌市,长葛市', '长葛', '中国,河南,许昌,长葛', '3', '0374', '461500', 'Changge', 'CG', 'C', '113.773', '34.2185', '');
INSERT INTO `t_order_region` VALUES ('1733', '411100', '410000', '漯河市', '中国,河南省,漯河市', '漯河', '中国,河南,漯河', '2', '0395', '462000', 'Luohe', 'LH', 'L', '114.026', '33.5759', '');
INSERT INTO `t_order_region` VALUES ('1734', '411102', '411100', '源汇区', '中国,河南省,漯河市,源汇区', '源汇', '中国,河南,漯河,源汇', '3', '0395', '462000', 'Yuanhui', 'YH', 'Y', '114.006', '33.5563', '');
INSERT INTO `t_order_region` VALUES ('1735', '411103', '411100', '郾城区', '中国,河南省,漯河市,郾城区', '郾城', '中国,河南,漯河,郾城', '3', '0395', '462300', 'Yancheng', 'YC', 'Y', '114.007', '33.5872', '');
INSERT INTO `t_order_region` VALUES ('1736', '411104', '411100', '召陵区', '中国,河南省,漯河市,召陵区', '召陵', '中国,河南,漯河,召陵', '3', '0395', '462300', 'Zhaoling', 'ZL', 'Z', '114.094', '33.586', '');
INSERT INTO `t_order_region` VALUES ('1737', '411121', '411100', '舞阳县', '中国,河南省,漯河市,舞阳县', '舞阳', '中国,河南,漯河,舞阳', '3', '0395', '462400', 'Wuyang', 'WY', 'W', '113.598', '33.4324', '');
INSERT INTO `t_order_region` VALUES ('1738', '411122', '411100', '临颍县', '中国,河南省,漯河市,临颍县', '临颍', '中国,河南,漯河,临颍', '3', '0395', '462600', 'Linying', 'LY', 'L', '113.937', '33.8112', '');
INSERT INTO `t_order_region` VALUES ('1739', '411200', '410000', '三门峡市', '中国,河南省,三门峡市', '三门峡', '中国,河南,三门峡', '2', '0398', '472000', 'Sanmenxia', 'SMX', 'S', '111.194', '34.7773', '');
INSERT INTO `t_order_region` VALUES ('1740', '411202', '411200', '湖滨区', '中国,河南省,三门峡市,湖滨区', '湖滨', '中国,河南,三门峡,湖滨', '3', '0398', '472000', 'Hubin', 'HB', 'H', '111.2', '34.7787', '');
INSERT INTO `t_order_region` VALUES ('1741', '411203', '411200', '陕州区', '中国,河南省,三门峡市,陕州区', '陕州', '中国,河南,三门峡,陕州', '3', '0398', '472100', 'Shanzhou', 'SZ', 'S', '111.103', '34.7205', '');
INSERT INTO `t_order_region` VALUES ('1742', '411221', '411200', '渑池县', '中国,河南省,三门峡市,渑池县', '渑池', '中国,河南,三门峡,渑池', '3', '0398', '472400', 'Mianchi', 'MC', 'M', '111.762', '34.7673', '');
INSERT INTO `t_order_region` VALUES ('1743', '411224', '411200', '卢氏县', '中国,河南省,三门峡市,卢氏县', '卢氏', '中国,河南,三门峡,卢氏', '3', '0398', '472200', 'Lushi', 'LS', 'L', '111.048', '34.0544', '');
INSERT INTO `t_order_region` VALUES ('1744', '411281', '411200', '义马市', '中国,河南省,三门峡市,义马市', '义马', '中国,河南,三门峡,义马', '3', '0398', '472300', 'Yima', 'YM', 'Y', '111.874', '34.7472', '');
INSERT INTO `t_order_region` VALUES ('1745', '411282', '411200', '灵宝市', '中国,河南省,三门峡市,灵宝市', '灵宝', '中国,河南,三门峡,灵宝', '3', '0398', '472500', 'Lingbao', 'LB', 'L', '110.895', '34.5168', '');
INSERT INTO `t_order_region` VALUES ('1746', '411300', '410000', '南阳市', '中国,河南省,南阳市', '南阳', '中国,河南,南阳', '2', '0377', '473000', 'Nanyang', 'NY', 'N', '112.541', '32.9991', '');
INSERT INTO `t_order_region` VALUES ('1747', '411302', '411300', '宛城区', '中国,河南省,南阳市,宛城区', '宛城', '中国,河南,南阳,宛城', '3', '0377', '473000', 'Wancheng', 'WC', 'W', '112.54', '33.0038', '');
INSERT INTO `t_order_region` VALUES ('1748', '411303', '411300', '卧龙区', '中国,河南省,南阳市,卧龙区', '卧龙', '中国,河南,南阳,卧龙', '3', '0377', '473000', 'Wolong', 'WL', 'W', '112.535', '32.9861', '');
INSERT INTO `t_order_region` VALUES ('1749', '411321', '411300', '南召县', '中国,河南省,南阳市,南召县', '南召', '中国,河南,南阳,南召', '3', '0377', '474650', 'Nanzhao', 'NZ', 'N', '112.432', '33.491', '');
INSERT INTO `t_order_region` VALUES ('1750', '411322', '411300', '方城县', '中国,河南省,南阳市,方城县', '方城', '中国,河南,南阳,方城', '3', '0377', '473200', 'Fangcheng', 'FC', 'F', '113.013', '33.2545', '');
INSERT INTO `t_order_region` VALUES ('1751', '411323', '411300', '西峡县', '中国,河南省,南阳市,西峡县', '西峡', '中国,河南,南阳,西峡', '3', '0377', '474550', 'Xixia', 'XX', 'X', '111.482', '33.2977', '');
INSERT INTO `t_order_region` VALUES ('1752', '411324', '411300', '镇平县', '中国,河南省,南阳市,镇平县', '镇平', '中国,河南,南阳,镇平', '3', '0377', '474250', 'Zhenping', 'ZP', 'Z', '112.24', '33.0363', '');
INSERT INTO `t_order_region` VALUES ('1753', '411325', '411300', '内乡县', '中国,河南省,南阳市,内乡县', '内乡', '中国,河南,南阳,内乡', '3', '0377', '474350', 'Neixiang', 'NX', 'N', '111.85', '33.0467', '');
INSERT INTO `t_order_region` VALUES ('1754', '411326', '411300', '淅川县', '中国,河南省,南阳市,淅川县', '淅川', '中国,河南,南阳,淅川', '3', '0377', '474450', 'Xichuan', 'XC', 'X', '111.487', '33.1371', '');
INSERT INTO `t_order_region` VALUES ('1755', '411327', '411300', '社旗县', '中国,河南省,南阳市,社旗县', '社旗', '中国,河南,南阳,社旗', '3', '0377', '473300', 'Sheqi', 'SQ', 'S', '112.947', '33.055', '');
INSERT INTO `t_order_region` VALUES ('1756', '411328', '411300', '唐河县', '中国,河南省,南阳市,唐河县', '唐河', '中国,河南,南阳,唐河', '3', '0377', '473400', 'Tanghe', 'TH', 'T', '112.836', '32.6945', '');
INSERT INTO `t_order_region` VALUES ('1757', '411329', '411300', '新野县', '中国,河南省,南阳市,新野县', '新野', '中国,河南,南阳,新野', '3', '0377', '473500', 'Xinye', 'XY', 'X', '112.362', '32.517', '');
INSERT INTO `t_order_region` VALUES ('1758', '411330', '411300', '桐柏县', '中国,河南省,南阳市,桐柏县', '桐柏', '中国,河南,南阳,桐柏', '3', '0377', '474750', 'Tongbai', 'TB', 'T', '113.429', '32.3792', '');
INSERT INTO `t_order_region` VALUES ('1759', '411381', '411300', '邓州市', '中国,河南省,南阳市,邓州市', '邓州', '中国,河南,南阳,邓州', '3', '0377', '474150', 'Dengzhou', 'DZ', 'D', '112.09', '32.6858', '');
INSERT INTO `t_order_region` VALUES ('1760', '411400', '410000', '商丘市', '中国,河南省,商丘市', '商丘', '中国,河南,商丘', '2', '0370', '476000', 'Shangqiu', 'SQ', 'S', '115.65', '34.4371', '');
INSERT INTO `t_order_region` VALUES ('1761', '411402', '411400', '梁园区', '中国,河南省,商丘市,梁园区', '梁园', '中国,河南,商丘,梁园', '3', '0370', '476000', 'Liangyuan', 'LY', 'L', '115.645', '34.4434', '');
INSERT INTO `t_order_region` VALUES ('1762', '411403', '411400', '睢阳区', '中国,河南省,商丘市,睢阳区', '睢阳', '中国,河南,商丘,睢阳', '3', '0370', '476000', 'Suiyang', 'SY', 'S', '115.653', '34.388', '');
INSERT INTO `t_order_region` VALUES ('1763', '411421', '411400', '民权县', '中国,河南省,商丘市,民权县', '民权', '中国,河南,商丘,民权', '3', '0370', '476800', 'Minquan', 'MQ', 'M', '115.146', '34.6493', '');
INSERT INTO `t_order_region` VALUES ('1764', '411422', '411400', '睢县', '中国,河南省,商丘市,睢县', '睢县', '中国,河南,商丘,睢县', '3', '0370', '476900', 'Suixian', 'SX', 'S', '115.072', '34.4454', '');
INSERT INTO `t_order_region` VALUES ('1765', '411423', '411400', '宁陵县', '中国,河南省,商丘市,宁陵县', '宁陵', '中国,河南,商丘,宁陵', '3', '0370', '476700', 'Ningling', 'NL', 'N', '115.305', '34.4546', '');
INSERT INTO `t_order_region` VALUES ('1766', '411424', '411400', '柘城县', '中国,河南省,商丘市,柘城县', '柘城', '中国,河南,商丘,柘城', '3', '0370', '476200', 'Zhecheng', 'ZC', 'Z', '115.305', '34.0911', '');
INSERT INTO `t_order_region` VALUES ('1767', '411425', '411400', '虞城县', '中国,河南省,商丘市,虞城县', '虞城', '中国,河南,商丘,虞城', '3', '0370', '476300', 'Yucheng', 'YC', 'Y', '115.863', '34.4019', '');
INSERT INTO `t_order_region` VALUES ('1768', '411426', '411400', '夏邑县', '中国,河南省,商丘市,夏邑县', '夏邑', '中国,河南,商丘,夏邑', '3', '0370', '476400', 'Xiayi', 'XY', 'X', '116.133', '34.2324', '');
INSERT INTO `t_order_region` VALUES ('1769', '411481', '411400', '永城市', '中国,河南省,商丘市,永城市', '永城', '中国,河南,商丘,永城', '3', '0370', '476600', 'Yongcheng', 'YC', 'Y', '116.449', '33.9291', '');
INSERT INTO `t_order_region` VALUES ('1770', '411500', '410000', '信阳市', '中国,河南省,信阳市', '信阳', '中国,河南,信阳', '2', '0376', '464000', 'Xinyang', 'XY', 'X', '114.075', '32.1233', '');
INSERT INTO `t_order_region` VALUES ('1771', '411502', '411500', '浉河区', '中国,河南省,信阳市,浉河区', '浉河', '中国,河南,信阳,浉河', '3', '0376', '464000', 'Shihe', 'SH', 'S', '114.059', '32.1168', '');
INSERT INTO `t_order_region` VALUES ('1772', '411503', '411500', '平桥区', '中国,河南省,信阳市,平桥区', '平桥', '中国,河南,信阳,平桥', '3', '0376', '464000', 'Pingqiao', 'PQ', 'P', '114.124', '32.1009', '');
INSERT INTO `t_order_region` VALUES ('1773', '411521', '411500', '罗山县', '中国,河南省,信阳市,罗山县', '罗山', '中国,河南,信阳,罗山', '3', '0376', '464200', 'Luoshan', 'LS', 'L', '114.531', '32.2028', '');
INSERT INTO `t_order_region` VALUES ('1774', '411522', '411500', '光山县', '中国,河南省,信阳市,光山县', '光山', '中国,河南,信阳,光山', '3', '0376', '465450', 'Guangshan', 'GS', 'G', '114.919', '32.0099', '');
INSERT INTO `t_order_region` VALUES ('1775', '411523', '411500', '新县', '中国,河南省,信阳市,新县', '新县', '中国,河南,信阳,新县', '3', '0376', '465550', 'Xinxian', 'XX', 'X', '114.879', '31.6439', '');
INSERT INTO `t_order_region` VALUES ('1776', '411524', '411500', '商城县', '中国,河南省,信阳市,商城县', '商城', '中国,河南,信阳,商城', '3', '0376', '465350', 'Shangcheng', 'SC', 'S', '115.409', '31.7999', '');
INSERT INTO `t_order_region` VALUES ('1777', '411525', '411500', '固始县', '中国,河南省,信阳市,固始县', '固始', '中国,河南,信阳,固始', '3', '0376', '465200', 'Gushi', 'GS', 'G', '115.683', '32.1801', '');
INSERT INTO `t_order_region` VALUES ('1778', '411526', '411500', '潢川县', '中国,河南省,信阳市,潢川县', '潢川', '中国,河南,信阳,潢川', '3', '0376', '465150', 'Huangchuan', 'HC', 'H', '115.047', '32.1376', '');
INSERT INTO `t_order_region` VALUES ('1779', '411527', '411500', '淮滨县', '中国,河南省,信阳市,淮滨县', '淮滨', '中国,河南,信阳,淮滨', '3', '0376', '464400', 'Huaibin', 'HB', 'H', '115.421', '32.4661', '');
INSERT INTO `t_order_region` VALUES ('1780', '411528', '411500', '息县', '中国,河南省,信阳市,息县', '息县', '中国,河南,信阳,息县', '3', '0376', '464300', 'Xixian', 'XX', 'X', '114.74', '32.3428', '');
INSERT INTO `t_order_region` VALUES ('1781', '411600', '410000', '周口市', '中国,河南省,周口市', '周口', '中国,河南,周口', '2', '0394', '466000', 'Zhoukou', 'ZK', 'Z', '114.65', '33.6204', '');
INSERT INTO `t_order_region` VALUES ('1782', '411602', '411600', '川汇区', '中国,河南省,周口市,川汇区', '川汇', '中国,河南,周口,川汇', '3', '0394', '466000', 'Chuanhui', 'CH', 'C', '114.642', '33.6256', '');
INSERT INTO `t_order_region` VALUES ('1783', '411621', '411600', '扶沟县', '中国,河南省,周口市,扶沟县', '扶沟', '中国,河南,周口,扶沟', '3', '0394', '461300', 'Fugou', 'FG', 'F', '114.395', '34.06', '');
INSERT INTO `t_order_region` VALUES ('1784', '411622', '411600', '西华县', '中国,河南省,周口市,西华县', '西华', '中国,河南,周口,西华', '3', '0394', '466600', 'Xihua', 'XH', 'X', '114.523', '33.7855', '');
INSERT INTO `t_order_region` VALUES ('1785', '411623', '411600', '商水县', '中国,河南省,周口市,商水县', '商水', '中国,河南,周口,商水', '3', '0394', '466100', 'Shangshui', 'SS', 'S', '114.606', '33.5391', '');
INSERT INTO `t_order_region` VALUES ('1786', '411624', '411600', '沈丘县', '中国,河南省,周口市,沈丘县', '沈丘', '中国,河南,周口,沈丘', '3', '0394', '466300', 'Shenqiu', 'SQ', 'S', '115.099', '33.4094', '');
INSERT INTO `t_order_region` VALUES ('1787', '411625', '411600', '郸城县', '中国,河南省,周口市,郸城县', '郸城', '中国,河南,周口,郸城', '3', '0394', '477150', 'Dancheng', 'DC', 'D', '115.177', '33.6449', '');
INSERT INTO `t_order_region` VALUES ('1788', '411626', '411600', '淮阳县', '中国,河南省,周口市,淮阳县', '淮阳', '中国,河南,周口,淮阳', '3', '0394', '466700', 'Huaiyang', 'HY', 'H', '114.888', '33.7321', '');
INSERT INTO `t_order_region` VALUES ('1789', '411627', '411600', '太康县', '中国,河南省,周口市,太康县', '太康', '中国,河南,周口,太康', '3', '0394', '475400', 'Taikang', 'TK', 'T', '114.838', '34.0638', '');
INSERT INTO `t_order_region` VALUES ('1790', '411628', '411600', '鹿邑县', '中国,河南省,周口市,鹿邑县', '鹿邑', '中国,河南,周口,鹿邑', '3', '0394', '477200', 'Luyi', 'LY', 'L', '115.486', '33.8593', '');
INSERT INTO `t_order_region` VALUES ('1791', '411681', '411600', '项城市', '中国,河南省,周口市,项城市', '项城', '中国,河南,周口,项城', '3', '0394', '466200', 'Xiangcheng', 'XC', 'X', '114.876', '33.4672', '');
INSERT INTO `t_order_region` VALUES ('1792', '411682', '411600', '东新区', '中国,河南省,周口市,东新区', '东新区', '中国,河南,周口,东新区', '3', '0394', '466000', 'Dongxinqu', 'DXQ', 'D', '114.708', '33.6511', '新区');
INSERT INTO `t_order_region` VALUES ('1793', '411683', '411600', '经济开发区', '中国,河南省,周口市,经济开发区', '经济开发区', '中国,河南,周口,经济开发区', '3', '0394', '466000', 'Jingjikaifaqu', 'JJQ', 'J', '114.678', '33.5866', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1794', '411700', '410000', '驻马店市', '中国,河南省,驻马店市', '驻马店', '中国,河南,驻马店', '2', '0396', '463000', 'Zhumadian', 'ZMD', 'Z', '114.025', '32.9802', '');
INSERT INTO `t_order_region` VALUES ('1795', '411702', '411700', '驿城区', '中国,河南省,驻马店市,驿城区', '驿城', '中国,河南,驻马店,驿城', '3', '0396', '463000', 'Yicheng', 'YC', 'Y', '113.994', '32.9732', '');
INSERT INTO `t_order_region` VALUES ('1796', '411721', '411700', '西平县', '中国,河南省,驻马店市,西平县', '西平', '中国,河南,驻马店,西平', '3', '0396', '463900', 'Xiping', 'XP', 'X', '114.023', '33.3845', '');
INSERT INTO `t_order_region` VALUES ('1797', '411722', '411700', '上蔡县', '中国,河南省,驻马店市,上蔡县', '上蔡', '中国,河南,驻马店,上蔡', '3', '0396', '463800', 'Shangcai', 'SC', 'S', '114.268', '33.2682', '');
INSERT INTO `t_order_region` VALUES ('1798', '411723', '411700', '平舆县', '中国,河南省,驻马店市,平舆县', '平舆', '中国,河南,驻马店,平舆', '3', '0396', '463400', 'Pingyu', 'PY', 'P', '114.636', '32.9573', '');
INSERT INTO `t_order_region` VALUES ('1799', '411724', '411700', '正阳县', '中国,河南省,驻马店市,正阳县', '正阳', '中国,河南,驻马店,正阳', '3', '0396', '463600', 'Zhengyang', 'ZY', 'Z', '114.39', '32.6039', '');
INSERT INTO `t_order_region` VALUES ('1800', '411725', '411700', '确山县', '中国,河南省,驻马店市,确山县', '确山', '中国,河南,驻马店,确山', '3', '0396', '463200', 'Queshan', 'QS', 'Q', '114.029', '32.8028', '');
INSERT INTO `t_order_region` VALUES ('1801', '411726', '411700', '泌阳县', '中国,河南省,驻马店市,泌阳县', '泌阳', '中国,河南,驻马店,泌阳', '3', '0396', '463700', 'Biyang', 'BY', 'B', '113.327', '32.7178', '');
INSERT INTO `t_order_region` VALUES ('1802', '411727', '411700', '汝南县', '中国,河南省,驻马店市,汝南县', '汝南', '中国,河南,驻马店,汝南', '3', '0396', '463300', 'Runan', 'RN', 'R', '114.361', '33.0046', '');
INSERT INTO `t_order_region` VALUES ('1803', '411728', '411700', '遂平县', '中国,河南省,驻马店市,遂平县', '遂平', '中国,河南,驻马店,遂平', '3', '0396', '463100', 'Suiping', 'SP', 'S', '114.013', '33.1457', '');
INSERT INTO `t_order_region` VALUES ('1804', '411729', '411700', '新蔡县', '中国,河南省,驻马店市,新蔡县', '新蔡', '中国,河南,驻马店,新蔡', '3', '0396', '463500', 'Xincai', 'XC', 'X', '114.982', '32.7502', '');
INSERT INTO `t_order_region` VALUES ('1805', '419001', '410000', '济源市', '中国,河南省,济源市', '济源', '中国,河南,济源', '2', '0391', '454650', 'Jiyuan', 'JY', 'J', '112.59', '35.0904', '直辖县级');
INSERT INTO `t_order_region` VALUES ('1806', '419011', '419001', '沁园街道', '中国,河南省,济源市,沁园街道', '沁园街道', '中国,河南,济源,沁园街道', '3', '0391', '459000', 'Qinyuan', 'QY', 'Q', '112.572', '35.0819', '拓展');
INSERT INTO `t_order_region` VALUES ('1807', '419012', '419001', '济水街道', '中国,河南省,济源市,济水街道', '济水街道', '中国,河南,济源,济水街道', '3', '0391', '459001', 'Jishui', 'JS', 'J', '112.589', '35.0916', '拓展');
INSERT INTO `t_order_region` VALUES ('1808', '419013', '419001', '北海街道', '中国,河南省,济源市,北海街道', '北海街道', '中国,河南,济源,北海街道', '3', '0391', '459003', 'Beihai', 'BH', 'B', '112.593', '35.0974', '拓展');
INSERT INTO `t_order_region` VALUES ('1809', '419014', '419001', '天坛街道', '中国,河南省,济源市,天坛街道', '天坛街道', '中国,河南,济源,天坛街道', '3', '0391', '459004', 'Tiantan', 'TT', 'T', '112.566', '35.0946', '拓展');
INSERT INTO `t_order_region` VALUES ('1810', '419015', '419001', '玉泉街道', '中国,河南省,济源市,玉泉街道', '玉泉街道', '中国,河南,济源,玉泉街道', '3', '0391', '459002', 'Yuquan', 'YQ', 'Y', '112.615', '35.0926', '拓展');
INSERT INTO `t_order_region` VALUES ('1811', '419016', '419001', '克井镇', '中国,河南省,济源市,克井镇', '克井镇', '中国,河南,济源,克井镇', '3', '0391', '459010', 'Kejing', 'KJ', 'K', '112.543', '35.1603', '拓展');
INSERT INTO `t_order_region` VALUES ('1812', '419017', '419001', '五龙口镇', '中国,河南省,济源市,五龙口镇', '五龙口镇', '中国,河南,济源,五龙口镇', '3', '0391', '459011', 'Wulongkao', 'WLK', 'W', '112.689', '35.135', '拓展');
INSERT INTO `t_order_region` VALUES ('1813', '419018', '419001', '梨林镇', '中国,河南省,济源市,梨林镇', '梨林镇', '中国,河南,济源,梨林镇', '3', '0391', '459018', 'Lilin', 'LL', 'L', '112.714', '35.0777', '拓展');
INSERT INTO `t_order_region` VALUES ('1814', '419019', '419001', '轵城镇', '中国,河南省,济源市,轵城镇', '轵城镇', '中国,河南,济源,轵城镇', '3', '0391', '459005', 'ZhiCheng', 'ZC', 'Z', '112.601', '35.0461', '拓展');
INSERT INTO `t_order_region` VALUES ('1815', '419020', '419001', '承留镇', '中国,河南省,济源市,承留镇', '承留镇', '中国,河南,济源,承留镇', '3', '0391', '459007', 'ChengLiu', 'CL', 'C', '112.499', '35.0777', '拓展');
INSERT INTO `t_order_region` VALUES ('1816', '419021', '419001', '坡头镇', '中国,河南省,济源市,坡头镇', '坡头镇', '中国,河南,济源,坡头镇', '3', '0391', '459016', 'Potou', 'PT', 'P', '112.525', '34.9284', '拓展');
INSERT INTO `t_order_region` VALUES ('1817', '419022', '419001', '大峪镇', '中国,河南省,济源市,大峪镇', '大峪镇', '中国,河南,济源,大峪镇', '3', '0391', '459017', 'Dayu', 'DY', 'D', '112.396', '34.9376', '拓展');
INSERT INTO `t_order_region` VALUES ('1818', '419023', '419001', '邵原镇', '中国,河南省,济源市,邵原镇', '邵原镇', '中国,河南,济源,邵原镇', '3', '0391', '459014', 'ShaoYuan', 'SY', 'S', '112.134', '35.161', '拓展');
INSERT INTO `t_order_region` VALUES ('1819', '419024', '419001', '思礼镇', '中国,河南省,济源市,思礼镇', '思礼镇', '中国,河南,济源,思礼镇', '3', '0391', '459006', 'Sili', 'SL', 'S', '112.507', '35.1011', '拓展');
INSERT INTO `t_order_region` VALUES ('1820', '419025', '419001', '王屋镇', '中国,河南省,济源市,王屋镇', '王屋镇', '中国,河南,济源,王屋镇', '3', '0391', '459013', 'WangWu', 'WW', 'W', '112.272', '35.1139', '拓展');
INSERT INTO `t_order_region` VALUES ('1821', '419026', '419001', '下冶镇', '中国,河南省,济源市,下冶镇', '下冶镇', '中国,河南,济源,下冶镇', '3', '0391', '459015', 'XiaYe', 'XY', 'X', '112.2', '35.0328', '拓展');
INSERT INTO `t_order_region` VALUES ('1822', '420000', '100000', '湖北省', '中国,湖北省', '湖北', '中国,湖北', '1', '', '', 'Hubei', 'HB', 'H', '114.299', '30.5844', '');
INSERT INTO `t_order_region` VALUES ('1823', '420100', '420000', '武汉市', '中国,湖北省,武汉市', '武汉', '中国,湖北,武汉', '2', '027', '430000', 'Wuhan', 'WH', 'W', '114.299', '30.5844', '');
INSERT INTO `t_order_region` VALUES ('1824', '420102', '420100', '江岸区', '中国,湖北省,武汉市,江岸区', '江岸', '中国,湖北,武汉,江岸', '3', '027', '430014', 'Jiang\'an', 'JA', 'J', '114.309', '30.5998', '');
INSERT INTO `t_order_region` VALUES ('1825', '420103', '420100', '江汉区', '中国,湖北省,武汉市,江汉区', '江汉', '中国,湖北,武汉,江汉', '3', '027', '430000', 'Jianghan', 'JH', 'J', '114.271', '30.6015', '');
INSERT INTO `t_order_region` VALUES ('1826', '420104', '420100', '硚口区', '中国,湖北省,武汉市,硚口区', '硚口', '中国,湖北,武汉,硚口', '3', '027', '430000', 'Qiaokou', 'QK', 'Q', '114.264', '30.5695', '');
INSERT INTO `t_order_region` VALUES ('1827', '420105', '420100', '汉阳区', '中国,湖北省,武汉市,汉阳区', '汉阳', '中国,湖北,武汉,汉阳', '3', '027', '430050', 'Hanyang', 'HY', 'H', '114.275', '30.5492', '');
INSERT INTO `t_order_region` VALUES ('1828', '420106', '420100', '武昌区', '中国,湖北省,武汉市,武昌区', '武昌', '中国,湖北,武汉,武昌', '3', '027', '430000', 'Wuchang', 'WC', 'W', '114.316', '30.5539', '');
INSERT INTO `t_order_region` VALUES ('1829', '420107', '420100', '青山区', '中国,湖北省,武汉市,青山区', '青山', '中国,湖北,武汉,青山', '3', '027', '430080', 'Qingshan', 'QS', 'Q', '114.391', '30.6343', '');
INSERT INTO `t_order_region` VALUES ('1830', '420111', '420100', '洪山区', '中国,湖北省,武汉市,洪山区', '洪山', '中国,湖北,武汉,洪山', '3', '027', '430070', 'Hongshan', 'HS', 'H', '114.344', '30.4999', '');
INSERT INTO `t_order_region` VALUES ('1831', '420112', '420100', '东西湖区', '中国,湖北省,武汉市,东西湖区', '东西湖', '中国,湖北,武汉,东西湖', '3', '027', '430040', 'Dongxihu', 'DXH', 'D', '114.137', '30.6199', '');
INSERT INTO `t_order_region` VALUES ('1832', '420113', '420100', '汉南区', '中国,湖北省,武汉市,汉南区', '汉南', '中国,湖北,武汉,汉南', '3', '027', '430090', 'Hannan', 'HN', 'H', '114.085', '30.3088', '');
INSERT INTO `t_order_region` VALUES ('1833', '420114', '420100', '蔡甸区', '中国,湖北省,武汉市,蔡甸区', '蔡甸', '中国,湖北,武汉,蔡甸', '3', '027', '430100', 'Caidian', 'CD', 'C', '114.029', '30.582', '');
INSERT INTO `t_order_region` VALUES ('1834', '420115', '420100', '江夏区', '中国,湖北省,武汉市,江夏区', '江夏', '中国,湖北,武汉,江夏', '3', '027', '430200', 'Jiangxia', 'JX', 'J', '114.313', '30.3465', '');
INSERT INTO `t_order_region` VALUES ('1835', '420116', '420100', '黄陂区', '中国,湖北省,武汉市,黄陂区', '黄陂', '中国,湖北,武汉,黄陂', '3', '027', '432200', 'Huangpi', 'HP', 'H', '114.375', '30.8815', '');
INSERT INTO `t_order_region` VALUES ('1836', '420117', '420100', '新洲区', '中国,湖北省,武汉市,新洲区', '新洲', '中国,湖北,武汉,新洲', '3', '027', '431400', 'Xinzhou', 'XZ', 'X', '114.801', '30.8414', '');
INSERT INTO `t_order_region` VALUES ('1837', '420118', '420100', '经济技术开发区', '中国,湖北省,武汉市,经济技术开发区', '经济技术开发区', '中国,湖北,武汉,经济技术开发区', '3', '027', '430056', 'Jingjikaifaqu', 'JJ', 'J', '114.159', '30.4889', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1838', '420200', '420000', '黄石市', '中国,湖北省,黄石市', '黄石', '中国,湖北,黄石', '2', '0714', '435000', 'Huangshi', 'HS', 'H', '115.077', '30.2201', '');
INSERT INTO `t_order_region` VALUES ('1839', '420202', '420200', '黄石港区', '中国,湖北省,黄石市,黄石港区', '黄石港', '中国,湖北,黄石,黄石港', '3', '0714', '435000', 'Huangshigang', 'HSG', 'H', '115.066', '30.2228', '');
INSERT INTO `t_order_region` VALUES ('1840', '420203', '420200', '西塞山区', '中国,湖北省,黄石市,西塞山区', '西塞山', '中国,湖北,黄石,西塞山', '3', '0714', '435001', 'Xisaishan', 'XSS', 'X', '115.11', '30.2049', '');
INSERT INTO `t_order_region` VALUES ('1841', '420204', '420200', '下陆区', '中国,湖北省,黄石市,下陆区', '下陆', '中国,湖北,黄石,下陆', '3', '0714', '435000', 'Xialu', 'XL', 'X', '114.961', '30.1737', '');
INSERT INTO `t_order_region` VALUES ('1842', '420205', '420200', '铁山区', '中国,湖北省,黄石市,铁山区', '铁山', '中国,湖北,黄石,铁山', '3', '0714', '435000', 'Tieshan', 'TS', 'T', '114.901', '30.2068', '');
INSERT INTO `t_order_region` VALUES ('1843', '420222', '420200', '阳新县', '中国,湖北省,黄石市,阳新县', '阳新', '中国,湖北,黄石,阳新', '3', '0714', '435200', 'Yangxin', 'YX', 'Y', '115.215', '29.8304', '');
INSERT INTO `t_order_region` VALUES ('1844', '420281', '420200', '大冶市', '中国,湖北省,黄石市,大冶市', '大冶', '中国,湖北,黄石,大冶', '3', '0714', '435100', 'Daye', 'DY', 'D', '114.972', '30.0944', '');
INSERT INTO `t_order_region` VALUES ('1845', '420282', '420200', '经济开发区', '中国,湖北省,黄石市,经济开发区', '经济开发区', '中国,湖北,黄石,经济开发区', '3', '0714', '435003', 'Jingjikaifaqu', 'JJ', 'J', '115.03', '30.1359', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1846', '420300', '420000', '十堰市', '中国,湖北省,十堰市', '十堰', '中国,湖北,十堰', '2', '0719', '442000', 'Shiyan', 'SY', 'S', '110.785', '32.647', '');
INSERT INTO `t_order_region` VALUES ('1847', '420302', '420300', '茅箭区', '中国,湖北省,十堰市,茅箭区', '茅箭', '中国,湖北,十堰,茅箭', '3', '0719', '442000', 'Maojian', 'MJ', 'M', '110.813', '32.5915', '');
INSERT INTO `t_order_region` VALUES ('1848', '420303', '420300', '张湾区', '中国,湖北省,十堰市,张湾区', '张湾', '中国,湖北,十堰,张湾', '3', '0719', '442000', 'Zhangwan', 'ZW', 'Z', '110.771', '32.652', '');
INSERT INTO `t_order_region` VALUES ('1849', '420304', '420300', '郧阳区', '中国,湖北省,十堰市,郧阳区', '郧阳', '中国,湖北,十堰,郧阳', '3', '0719', '442500', 'Yunyang', 'YY', 'Y', '110.819', '32.8359', '');
INSERT INTO `t_order_region` VALUES ('1850', '420322', '420300', '郧西县', '中国,湖北省,十堰市,郧西县', '郧西', '中国,湖北,十堰,郧西', '3', '0719', '442600', 'Yunxi', 'YX', 'Y', '110.426', '32.9935', '');
INSERT INTO `t_order_region` VALUES ('1851', '420323', '420300', '竹山县', '中国,湖北省,十堰市,竹山县', '竹山', '中国,湖北,十堰,竹山', '3', '0719', '442200', 'Zhushan', 'ZS', 'Z', '110.231', '32.2254', '');
INSERT INTO `t_order_region` VALUES ('1852', '420324', '420300', '竹溪县', '中国,湖北省,十堰市,竹溪县', '竹溪', '中国,湖北,十堰,竹溪', '3', '0719', '442300', 'Zhuxi', 'ZX', 'Z', '109.718', '32.319', '');
INSERT INTO `t_order_region` VALUES ('1853', '420325', '420300', '房县', '中国,湖北省,十堰市,房县', '房县', '中国,湖北,十堰,房县', '3', '0719', '442100', 'Fangxian', 'FX', 'F', '110.744', '32.0579', '');
INSERT INTO `t_order_region` VALUES ('1854', '420381', '420300', '丹江口市', '中国,湖北省,十堰市,丹江口市', '丹江口', '中国,湖北,十堰,丹江口', '3', '0719', '442700', 'Danjiangkou', 'DJK', 'D', '111.515', '32.5409', '');
INSERT INTO `t_order_region` VALUES ('1855', '420500', '420000', '宜昌市', '中国,湖北省,宜昌市', '宜昌', '中国,湖北,宜昌', '2', '0717', '443000', 'Yichang', 'YC', 'Y', '111.291', '30.7026', '');
INSERT INTO `t_order_region` VALUES ('1856', '420502', '420500', '西陵区', '中国,湖北省,宜昌市,西陵区', '西陵', '中国,湖北,宜昌,西陵', '3', '0717', '443000', 'Xiling', 'XL', 'X', '111.286', '30.7108', '');
INSERT INTO `t_order_region` VALUES ('1857', '420503', '420500', '伍家岗区', '中国,湖北省,宜昌市,伍家岗区', '伍家岗', '中国,湖北,宜昌,伍家岗', '3', '0717', '443000', 'Wujiagang', 'WJG', 'W', '111.361', '30.6443', '');
INSERT INTO `t_order_region` VALUES ('1858', '420504', '420500', '点军区', '中国,湖北省,宜昌市,点军区', '点军', '中国,湖北,宜昌,点军', '3', '0717', '443000', 'Dianjun', 'DJ', 'D', '111.268', '30.6934', '');
INSERT INTO `t_order_region` VALUES ('1859', '420505', '420500', '猇亭区', '中国,湖北省,宜昌市,猇亭区', '猇亭', '中国,湖北,宜昌,猇亭', '3', '0717', '443000', 'Xiaoting', 'XT', 'X', '111.441', '30.5266', '');
INSERT INTO `t_order_region` VALUES ('1860', '420506', '420500', '夷陵区', '中国,湖北省,宜昌市,夷陵区', '夷陵', '中国,湖北,宜昌,夷陵', '3', '0717', '443100', 'Yiling', 'YL', 'Y', '111.326', '30.7688', '');
INSERT INTO `t_order_region` VALUES ('1861', '420525', '420500', '远安县', '中国,湖北省,宜昌市,远安县', '远安', '中国,湖北,宜昌,远安', '3', '0717', '444200', 'Yuan\'an', 'YA', 'Y', '111.642', '31.0599', '');
INSERT INTO `t_order_region` VALUES ('1862', '420526', '420500', '兴山县', '中国,湖北省,宜昌市,兴山县', '兴山', '中国,湖北,宜昌,兴山', '3', '0717', '443700', 'Xingshan', 'XS', 'X', '110.75', '31.3469', '');
INSERT INTO `t_order_region` VALUES ('1863', '420527', '420500', '秭归县', '中国,湖北省,宜昌市,秭归县', '秭归', '中国,湖北,宜昌,秭归', '3', '0717', '443600', 'Zigui', 'ZG', 'Z', '110.982', '30.827', '');
INSERT INTO `t_order_region` VALUES ('1864', '420528', '420500', '长阳土家族自治县', '中国,湖北省,宜昌市,长阳土家族自治县', '长阳', '中国,湖北,宜昌,长阳', '3', '0717', '443500', 'Changyang', 'CY', 'C', '111.201', '30.4705', '');
INSERT INTO `t_order_region` VALUES ('1865', '420529', '420500', '五峰土家族自治县', '中国,湖北省,宜昌市,五峰土家族自治县', '五峰', '中国,湖北,宜昌,五峰', '3', '0717', '443400', 'Wufeng', 'WF', 'W', '110.675', '30.1986', '');
INSERT INTO `t_order_region` VALUES ('1866', '420581', '420500', '宜都市', '中国,湖北省,宜昌市,宜都市', '宜都', '中国,湖北,宜昌,宜都', '3', '0717', '443000', 'Yidu', 'YD', 'Y', '111.45', '30.3781', '');
INSERT INTO `t_order_region` VALUES ('1867', '420582', '420500', '当阳市', '中国,湖北省,宜昌市,当阳市', '当阳', '中国,湖北,宜昌,当阳', '3', '0717', '444100', 'Dangyang', 'DY', 'D', '111.789', '30.8208', '');
INSERT INTO `t_order_region` VALUES ('1868', '420583', '420500', '枝江市', '中国,湖北省,宜昌市,枝江市', '枝江', '中国,湖北,宜昌,枝江', '3', '0717', '443200', 'Zhijiang', 'ZJ', 'Z', '111.769', '30.4261', '');
INSERT INTO `t_order_region` VALUES ('1869', '420584', '420500', '宜昌新区', '中国,湖北省,宜昌市,宜昌新区', '宜昌新区', '中国,湖北,宜昌,宜昌新区', '3', '0717', '443000', 'Yichangxinqu', 'YCXQ', 'Y', '111.406', '30.7117', '新区');
INSERT INTO `t_order_region` VALUES ('1870', '420600', '420000', '襄阳市', '中国,湖北省,襄阳市', '襄阳', '中国,湖北,襄阳', '2', '0710', '441000', 'Xiangyang', 'XY', 'X', '112.144', '32.0424', '');
INSERT INTO `t_order_region` VALUES ('1871', '420602', '420600', '襄城区', '中国,湖北省,襄阳市,襄城区', '襄城', '中国,湖北,襄阳,襄城', '3', '0710', '441000', 'Xiangcheng', 'XC', 'X', '112.134', '32.0102', '');
INSERT INTO `t_order_region` VALUES ('1872', '420606', '420600', '樊城区', '中国,湖北省,襄阳市,樊城区', '樊城', '中国,湖北,襄阳,樊城', '3', '0710', '441000', 'Fancheng', 'FC', 'F', '112.135', '32.0448', '');
INSERT INTO `t_order_region` VALUES ('1873', '420607', '420600', '襄州区', '中国,湖北省,襄阳市,襄州区', '襄州', '中国,湖北,襄阳,襄州', '3', '0710', '441100', 'Xiangzhou', 'XZ', 'X', '112.15', '32.0151', '');
INSERT INTO `t_order_region` VALUES ('1874', '420624', '420600', '南漳县', '中国,湖北省,襄阳市,南漳县', '南漳', '中国,湖北,襄阳,南漳', '3', '0710', '441500', 'Nanzhang', 'NZ', 'N', '111.846', '31.7765', '');
INSERT INTO `t_order_region` VALUES ('1875', '420625', '420600', '谷城县', '中国,湖北省,襄阳市,谷城县', '谷城', '中国,湖北,襄阳,谷城', '3', '0710', '441700', 'Gucheng', 'GC', 'G', '111.653', '32.2638', '');
INSERT INTO `t_order_region` VALUES ('1876', '420626', '420600', '保康县', '中国,湖北省,襄阳市,保康县', '保康', '中国,湖北,襄阳,保康', '3', '0710', '441600', 'Baokang', 'BK', 'B', '111.261', '31.8787', '');
INSERT INTO `t_order_region` VALUES ('1877', '420682', '420600', '老河口市', '中国,湖北省,襄阳市,老河口市', '老河口', '中国,湖北,襄阳,老河口', '3', '0710', '441800', 'Laohekou', 'LHK', 'L', '111.671', '32.3848', '');
INSERT INTO `t_order_region` VALUES ('1878', '420683', '420600', '枣阳市', '中国,湖北省,襄阳市,枣阳市', '枣阳', '中国,湖北,襄阳,枣阳', '3', '0710', '441200', 'Zaoyang', 'ZY', 'Z', '112.774', '32.1314', '');
INSERT INTO `t_order_region` VALUES ('1879', '420684', '420600', '宜城市', '中国,湖北省,襄阳市,宜城市', '宜城', '中国,湖北,襄阳,宜城', '3', '0710', '441400', 'Yicheng', 'YC', 'Y', '112.258', '31.7197', '');
INSERT INTO `t_order_region` VALUES ('1880', '420685', '420600', '高新区', '中国,湖北省,襄阳市,高新区', '高新区', '中国,湖北,襄阳,高新区', '3', '0710', '441000', 'Gaoxinqu', 'GXQ', 'G', '112.122', '32.0803', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1881', '420686', '420600', '经济开发区', '中国,湖北省,襄阳市,经济开发区', '经济开发区', '中国,湖北,襄阳,经济开发区', '3', '0710', '441000', 'Jingjikaifaqu', 'JJ', 'J', '112.261', '32.1321', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1882', '420700', '420000', '鄂州市', '中国,湖北省,鄂州市', '鄂州', '中国,湖北,鄂州', '2', '0711', '436000', 'Ezhou', 'EZ', 'E', '114.891', '30.3965', '');
INSERT INTO `t_order_region` VALUES ('1883', '420702', '420700', '梁子湖区', '中国,湖北省,鄂州市,梁子湖区', '梁子湖', '中国,湖北,鄂州,梁子湖', '3', '0711', '436000', 'Liangzihu', 'LZH', 'L', '114.685', '30.1', '');
INSERT INTO `t_order_region` VALUES ('1884', '420703', '420700', '华容区', '中国,湖北省,鄂州市,华容区', '华容', '中国,湖北,鄂州,华容', '3', '0711', '436000', 'Huarong', 'HR', 'H', '114.736', '30.5333', '');
INSERT INTO `t_order_region` VALUES ('1885', '420704', '420700', '鄂城区', '中国,湖北省,鄂州市,鄂城区', '鄂城', '中国,湖北,鄂州,鄂城', '3', '0711', '436000', 'Echeng', 'EC', 'E', '114.892', '30.4002', '');
INSERT INTO `t_order_region` VALUES ('1886', '420800', '420000', '荆门市', '中国,湖北省,荆门市', '荆门', '中国,湖北,荆门', '2', '0724', '448000', 'Jingmen', 'JM', 'J', '112.204', '31.0354', '');
INSERT INTO `t_order_region` VALUES ('1887', '420802', '420800', '东宝区', '中国,湖北省,荆门市,东宝区', '东宝', '中国,湖北,荆门,东宝', '3', '0724', '448000', 'Dongbao', 'DB', 'D', '112.201', '31.0519', '');
INSERT INTO `t_order_region` VALUES ('1888', '420804', '420800', '掇刀区', '中国,湖北省,荆门市,掇刀区', '掇刀', '中国,湖北,荆门,掇刀', '3', '0724', '448000', 'Duodao', 'DD', 'D', '112.208', '30.9732', '');
INSERT INTO `t_order_region` VALUES ('1889', '420821', '420800', '京山县', '中国,湖北省,荆门市,京山县', '京山', '中国,湖北,荆门,京山', '3', '0724', '431800', 'Jingshan', 'JS', 'J', '113.111', '31.0224', '');
INSERT INTO `t_order_region` VALUES ('1890', '420822', '420800', '沙洋县', '中国,湖北省,荆门市,沙洋县', '沙洋', '中国,湖北,荆门,沙洋', '3', '0724', '448200', 'Shayang', 'SY', 'S', '112.589', '30.7092', '');
INSERT INTO `t_order_region` VALUES ('1891', '420881', '420800', '钟祥市', '中国,湖北省,荆门市,钟祥市', '钟祥', '中国,湖北,荆门,钟祥', '3', '0724', '431900', 'Zhongxiang', 'ZX', 'Z', '112.589', '31.1678', '');
INSERT INTO `t_order_region` VALUES ('1892', '420900', '420000', '孝感市', '中国,湖北省,孝感市', '孝感', '中国,湖北,孝感', '2', '0712', '432000', 'Xiaogan', 'XG', 'X', '113.927', '30.9264', '');
INSERT INTO `t_order_region` VALUES ('1893', '420902', '420900', '孝南区', '中国,湖北省,孝感市,孝南区', '孝南', '中国,湖北,孝感,孝南', '3', '0712', '432100', 'Xiaonan', 'XN', 'X', '113.911', '30.9168', '');
INSERT INTO `t_order_region` VALUES ('1894', '420921', '420900', '孝昌县', '中国,湖北省,孝感市,孝昌县', '孝昌', '中国,湖北,孝感,孝昌', '3', '0712', '432900', 'Xiaochang', 'XC', 'X', '113.998', '31.258', '');
INSERT INTO `t_order_region` VALUES ('1895', '420922', '420900', '大悟县', '中国,湖北省,孝感市,大悟县', '大悟', '中国,湖北,孝感,大悟', '3', '0712', '432800', 'Dawu', 'DW', 'D', '114.126', '31.5618', '');
INSERT INTO `t_order_region` VALUES ('1896', '420923', '420900', '云梦县', '中国,湖北省,孝感市,云梦县', '云梦', '中国,湖北,孝感,云梦', '3', '0712', '432500', 'Yunmeng', 'YM', 'Y', '113.753', '31.0209', '');
INSERT INTO `t_order_region` VALUES ('1897', '420981', '420900', '应城市', '中国,湖北省,孝感市,应城市', '应城', '中国,湖北,孝感,应城', '3', '0712', '432400', 'Yingcheng', 'YC', 'Y', '113.573', '30.9283', '');
INSERT INTO `t_order_region` VALUES ('1898', '420982', '420900', '安陆市', '中国,湖北省,孝感市,安陆市', '安陆', '中国,湖北,孝感,安陆', '3', '0712', '432600', 'Anlu', 'AL', 'A', '113.686', '31.2569', '');
INSERT INTO `t_order_region` VALUES ('1899', '420984', '420900', '汉川市', '中国,湖北省,孝感市,汉川市', '汉川', '中国,湖北,孝感,汉川', '3', '0712', '432300', 'Hanchuan', 'HC', 'H', '113.839', '30.6612', '');
INSERT INTO `t_order_region` VALUES ('1900', '421000', '420000', '荆州市', '中国,湖北省,荆州市', '荆州', '中国,湖北,荆州', '2', '0716', '434000', 'Jingzhou', 'JZ', 'J', '112.238', '30.3269', '');
INSERT INTO `t_order_region` VALUES ('1901', '421002', '421000', '沙市区', '中国,湖北省,荆州市,沙市区', '沙市', '中国,湖北,荆州,沙市', '3', '0716', '434000', 'Shashi', 'SS', 'S', '112.255', '30.3111', '');
INSERT INTO `t_order_region` VALUES ('1902', '421003', '421000', '荆州区', '中国,湖北省,荆州市,荆州区', '荆州', '中国,湖北,荆州,荆州', '3', '0716', '434020', 'Jingzhou', 'JZ', 'J', '112.19', '30.3526', '');
INSERT INTO `t_order_region` VALUES ('1903', '421022', '421000', '公安县', '中国,湖北省,荆州市,公安县', '公安', '中国,湖北,荆州,公安', '3', '0716', '434300', 'Gong\'an', 'GA', 'G', '112.232', '30.059', '');
INSERT INTO `t_order_region` VALUES ('1904', '421023', '421000', '监利县', '中国,湖北省,荆州市,监利县', '监利', '中国,湖北,荆州,监利', '3', '0716', '433300', 'Jianli', 'JL', 'J', '112.895', '29.8149', '');
INSERT INTO `t_order_region` VALUES ('1905', '421024', '421000', '江陵县', '中国,湖北省,荆州市,江陵县', '江陵', '中国,湖北,荆州,江陵', '3', '0716', '434100', 'Jiangling', 'JL', 'J', '112.425', '30.0417', '');
INSERT INTO `t_order_region` VALUES ('1906', '421081', '421000', '石首市', '中国,湖北省,荆州市,石首市', '石首', '中国,湖北,荆州,石首', '3', '0716', '434400', 'Shishou', 'SS', 'S', '112.426', '29.7213', '');
INSERT INTO `t_order_region` VALUES ('1907', '421083', '421000', '洪湖市', '中国,湖北省,荆州市,洪湖市', '洪湖', '中国,湖北,荆州,洪湖', '3', '0716', '433200', 'Honghu', 'HH', 'H', '113.476', '29.827', '');
INSERT INTO `t_order_region` VALUES ('1908', '421087', '421000', '松滋市', '中国,湖北省,荆州市,松滋市', '松滋', '中国,湖北,荆州,松滋', '3', '0716', '434200', 'Songzi', 'SZ', 'S', '111.767', '30.1696', '');
INSERT INTO `t_order_region` VALUES ('1909', '421100', '420000', '黄冈市', '中国,湖北省,黄冈市', '黄冈', '中国,湖北,黄冈', '2', '0713', '438000', 'Huanggang', 'HG', 'H', '114.879', '30.4477', '');
INSERT INTO `t_order_region` VALUES ('1910', '421102', '421100', '黄州区', '中国,湖北省,黄冈市,黄州区', '黄州', '中国,湖北,黄冈,黄州', '3', '0713', '438000', 'Huangzhou', 'HZ', 'H', '114.88', '30.4344', '');
INSERT INTO `t_order_region` VALUES ('1911', '421121', '421100', '团风县', '中国,湖北省,黄冈市,团风县', '团风', '中国,湖北,黄冈,团风', '3', '0713', '438000', 'Tuanfeng', 'TF', 'T', '114.872', '30.6436', '');
INSERT INTO `t_order_region` VALUES ('1912', '421122', '421100', '红安县', '中国,湖北省,黄冈市,红安县', '红安', '中国,湖北,黄冈,红安', '3', '0713', '438400', 'Hong\'an', 'HA', 'H', '114.622', '31.2867', '');
INSERT INTO `t_order_region` VALUES ('1913', '421123', '421100', '罗田县', '中国,湖北省,黄冈市,罗田县', '罗田', '中国,湖北,黄冈,罗田', '3', '0713', '438600', 'Luotian', 'LT', 'L', '115.4', '30.7826', '');
INSERT INTO `t_order_region` VALUES ('1914', '421124', '421100', '英山县', '中国,湖北省,黄冈市,英山县', '英山', '中国,湖北,黄冈,英山', '3', '0713', '438700', 'Yingshan', 'YS', 'Y', '115.681', '30.7352', '');
INSERT INTO `t_order_region` VALUES ('1915', '421125', '421100', '浠水县', '中国,湖北省,黄冈市,浠水县', '浠水', '中国,湖北,黄冈,浠水', '3', '0713', '438200', 'Xishui', 'XS', 'X', '115.269', '30.4527', '');
INSERT INTO `t_order_region` VALUES ('1916', '421126', '421100', '蕲春县', '中国,湖北省,黄冈市,蕲春县', '蕲春', '中国,湖北,黄冈,蕲春', '3', '0713', '435300', 'Qichun', 'QC', 'Q', '115.436', '30.2261', '');
INSERT INTO `t_order_region` VALUES ('1917', '421127', '421100', '黄梅县', '中国,湖北省,黄冈市,黄梅县', '黄梅', '中国,湖北,黄冈,黄梅', '3', '0713', '435500', 'Huangmei', 'HM', 'H', '115.944', '30.0703', '');
INSERT INTO `t_order_region` VALUES ('1918', '421181', '421100', '麻城市', '中国,湖北省,黄冈市,麻城市', '麻城', '中国,湖北,黄冈,麻城', '3', '0713', '438300', 'Macheng', 'MC', 'M', '115.01', '31.1723', '');
INSERT INTO `t_order_region` VALUES ('1919', '421182', '421100', '武穴市', '中国,湖北省,黄冈市,武穴市', '武穴', '中国,湖北,黄冈,武穴', '3', '0713', '435400', 'Wuxue', 'WX', 'W', '115.56', '29.8445', '');
INSERT INTO `t_order_region` VALUES ('1920', '421200', '420000', '咸宁市', '中国,湖北省,咸宁市', '咸宁', '中国,湖北,咸宁', '2', '0715', '437000', 'Xianning', 'XN', 'X', '114.329', '29.8328', '');
INSERT INTO `t_order_region` VALUES ('1921', '421202', '421200', '咸安区', '中国,湖北省,咸宁市,咸安区', '咸安', '中国,湖北,咸宁,咸安', '3', '0715', '437000', 'Xian\'an', 'XA', 'X', '114.299', '29.8529', '');
INSERT INTO `t_order_region` VALUES ('1922', '421221', '421200', '嘉鱼县', '中国,湖北省,咸宁市,嘉鱼县', '嘉鱼', '中国,湖北,咸宁,嘉鱼', '3', '0715', '437200', 'Jiayu', 'JY', 'J', '113.939', '29.9705', '');
INSERT INTO `t_order_region` VALUES ('1923', '421222', '421200', '通城县', '中国,湖北省,咸宁市,通城县', '通城', '中国,湖北,咸宁,通城', '3', '0715', '437400', 'Tongcheng', 'TC', 'T', '113.816', '29.2457', '');
INSERT INTO `t_order_region` VALUES ('1924', '421223', '421200', '崇阳县', '中国,湖北省,咸宁市,崇阳县', '崇阳', '中国,湖北,咸宁,崇阳', '3', '0715', '437500', 'Chongyang', 'CY', 'C', '114.04', '29.5556', '');
INSERT INTO `t_order_region` VALUES ('1925', '421224', '421200', '通山县', '中国,湖北省,咸宁市,通山县', '通山', '中国,湖北,咸宁,通山', '3', '0715', '437600', 'Tongshan', 'TS', 'T', '114.482', '29.6063', '');
INSERT INTO `t_order_region` VALUES ('1926', '421281', '421200', '赤壁市', '中国,湖北省,咸宁市,赤壁市', '赤壁', '中国,湖北,咸宁,赤壁', '3', '0715', '437300', 'Chibi', 'CB', 'C', '113.9', '29.7245', '');
INSERT INTO `t_order_region` VALUES ('1927', '421300', '420000', '随州市', '中国,湖北省,随州市', '随州', '中国,湖北,随州', '2', '0722', '441300', 'Suizhou', 'SZ', 'S', '113.374', '31.7175', '');
INSERT INTO `t_order_region` VALUES ('1928', '421303', '421300', '曾都区', '中国,湖北省,随州市,曾都区', '曾都', '中国,湖北,随州,曾都', '3', '0722', '441300', 'Zengdu', 'ZD', 'Z', '113.371', '31.7161', '');
INSERT INTO `t_order_region` VALUES ('1929', '421321', '421300', '随县', '中国,湖北省,随州市,随县', '随县', '中国,湖北,随州,随县', '3', '0722', '441309', 'Suixian', 'SX', 'S', '113.827', '31.6179', '');
INSERT INTO `t_order_region` VALUES ('1930', '421381', '421300', '广水市', '中国,湖北省,随州市,广水市', '广水', '中国,湖北,随州,广水', '3', '0722', '432700', 'Guangshui', 'GS', 'G', '113.827', '31.6179', '');
INSERT INTO `t_order_region` VALUES ('1931', '422800', '420000', '恩施土家族苗族自治州', '中国,湖北省,恩施土家族苗族自治州', '恩施', '中国,湖北,恩施', '2', '0718', '445000', 'Enshi', 'ES', 'E', '109.487', '30.2831', '');
INSERT INTO `t_order_region` VALUES ('1932', '422801', '422800', '恩施市', '中国,湖北省,恩施土家族苗族自治州,恩施市', '恩施', '中国,湖北,恩施,恩施', '3', '0718', '445000', 'Enshi', 'ES', 'E', '109.479', '30.295', '');
INSERT INTO `t_order_region` VALUES ('1933', '422802', '422800', '利川市', '中国,湖北省,恩施土家族苗族自治州,利川市', '利川', '中国,湖北,恩施,利川', '3', '0718', '445400', 'Lichuan', 'LC', 'L', '108.936', '30.2912', '');
INSERT INTO `t_order_region` VALUES ('1934', '422822', '422800', '建始县', '中国,湖北省,恩施土家族苗族自治州,建始县', '建始', '中国,湖北,恩施,建始', '3', '0718', '445300', 'Jianshi', 'JS', 'J', '109.722', '30.6021', '');
INSERT INTO `t_order_region` VALUES ('1935', '422823', '422800', '巴东县', '中国,湖北省,恩施土家族苗族自治州,巴东县', '巴东', '中国,湖北,恩施,巴东', '3', '0718', '444300', 'Badong', 'BD', 'B', '110.341', '31.0423', '');
INSERT INTO `t_order_region` VALUES ('1936', '422825', '422800', '宣恩县', '中国,湖北省,恩施土家族苗族自治州,宣恩县', '宣恩', '中国,湖北,恩施,宣恩', '3', '0718', '445500', 'Xuanen', 'XE', 'X', '109.492', '29.9871', '');
INSERT INTO `t_order_region` VALUES ('1937', '422826', '422800', '咸丰县', '中国,湖北省,恩施土家族苗族自治州,咸丰县', '咸丰', '中国,湖北,恩施,咸丰', '3', '0718', '445600', 'Xianfeng', 'XF', 'X', '109.152', '29.6798', '');
INSERT INTO `t_order_region` VALUES ('1938', '422827', '422800', '来凤县', '中国,湖北省,恩施土家族苗族自治州,来凤县', '来凤', '中国,湖北,恩施,来凤', '3', '0718', '445700', 'Laifeng', 'LF', 'L', '109.407', '29.4937', '');
INSERT INTO `t_order_region` VALUES ('1939', '422828', '422800', '鹤峰县', '中国,湖北省,恩施土家族苗族自治州,鹤峰县', '鹤峰', '中国,湖北,恩施,鹤峰', '3', '0718', '445800', 'Hefeng', 'HF', 'H', '110.031', '29.8907', '');
INSERT INTO `t_order_region` VALUES ('1940', '429004', '420000', '仙桃市', '中国,湖北省,仙桃市', '仙桃', '中国,湖北,仙桃', '2', '0728', '433000', 'Xiantao', 'XT', 'X', '113.454', '30.365', '直辖县级');
INSERT INTO `t_order_region` VALUES ('1941', '429005', '420000', '潜江市', '中国,湖北省,潜江市', '潜江', '中国,湖北,潜江', '2', '0728', '433100', 'Qianjiang', 'QJ', 'Q', '112.897', '30.4212', '直辖县级');
INSERT INTO `t_order_region` VALUES ('1942', '429006', '420000', '天门市', '中国,湖北省,天门市', '天门', '中国,湖北,天门', '2', '0728', '431700', 'Tianmen', 'TM', 'T', '113.166', '30.6531', '直辖县级');
INSERT INTO `t_order_region` VALUES ('1943', '429021', '420000', '神农架林区', '中国,湖北省,神农架林区', '神农架', '中国,湖北,神农架', '2', '0719', '442400', 'Shennongjia', 'SNJ', 'S', '110.672', '31.7444', '直辖县级');
INSERT INTO `t_order_region` VALUES ('1944', '429022', '429021', '松柏镇', '中国,湖北省,神农架林区,松柏镇', '松柏镇', '中国,湖北,神农架,松柏镇', '3', '0719', '442499', 'Songbai', 'SB', 'S', '110.662', '31.7469', '拓展');
INSERT INTO `t_order_region` VALUES ('1945', '429023', '429021', '阳日镇', '中国,湖北省,神农架林区,阳日镇', '阳日镇', '中国,湖北,神农架,阳日镇', '3', '0719', '442411', 'Yangri', 'YR', 'Y', '110.82', '31.7374', '拓展');
INSERT INTO `t_order_region` VALUES ('1946', '429024', '429021', '木鱼镇', '中国,湖北省,神农架林区,木鱼镇', '木鱼镇', '中国,湖北,神农架,木鱼镇', '3', '0719', '442421', 'Muyu', 'MY', 'M', '110.483', '31.4014', '拓展');
INSERT INTO `t_order_region` VALUES ('1947', '429025', '429021', '红坪镇', '中国,湖北省,神农架林区,红坪镇', '红坪镇', '中国,湖北,神农架,红坪镇', '3', '0719', '442416', 'Hongping', 'HP', 'H', '110.429', '31.6728', '拓展');
INSERT INTO `t_order_region` VALUES ('1948', '429026', '429021', '新华镇', '中国,湖北省,神农架林区,新华镇', '新华镇', '中国,湖北,神农架,新华镇', '3', '0719', '442412', 'Xinhua', 'XH', 'X', '110.892', '31.593', '拓展');
INSERT INTO `t_order_region` VALUES ('1949', '429027', '429021', '大九湖', '中国,湖北省,神农架林区,大九湖', '大九湖', '中国,湖北,神农架,大九湖', '3', '0719', '442417', 'DaJiuHu', 'DJH', 'D', '110.054', '31.4727', '拓展');
INSERT INTO `t_order_region` VALUES ('1950', '429028', '429021', '宋洛', '中国,湖北省,神农架林区,宋洛', '宋洛', '中国,湖北,神农架,宋洛', '3', '0719', '442414', 'SongLuo', 'SL', 'S', '110.608', '31.6609', '拓展');
INSERT INTO `t_order_region` VALUES ('1951', '429029', '429021', '下谷坪乡', '中国,湖北省,神农架林区,下谷坪乡', '下谷坪乡', '中国,湖北,神农架,下谷坪乡', '3', '0719', '442417', 'Xiaguping', 'XLP', 'X', '110.245', '31.3662', '拓展');
INSERT INTO `t_order_region` VALUES ('1952', '429401', '429004', '沙嘴街道', '中国,湖北省,仙桃市,沙嘴街道', '沙嘴街道', '中国,湖北,仙桃,沙嘴街道', '3', '0728', '433099', 'Shazui', 'SZ', 'S', '113.451', '30.3576', '拓展');
INSERT INTO `t_order_region` VALUES ('1953', '429402', '429004', '干河街道', '中国,湖北省,仙桃市,干河街道', '干河街道', '中国,湖北,仙桃,干河街道', '3', '0728', '433000', 'Ganhe', 'GH', 'G', '113.435', '30.378', '拓展');
INSERT INTO `t_order_region` VALUES ('1954', '429403', '429004', '龙华山街道', '中国,湖北省,仙桃市,龙华山街道', '龙华山街道', '中国,湖北,仙桃,龙华山街道', '3', '0728', '433099', 'Longhuashan', 'LHS', 'L', '113.461', '30.3695', '拓展');
INSERT INTO `t_order_region` VALUES ('1955', '429404', '429004', '郑场镇', '中国,湖北省,仙桃市,郑场镇', '郑场镇', '中国,湖北,仙桃,郑场镇', '3', '0728', '433009', 'Zhengchang', 'ZC', 'Z', '113.034', '30.4872', '拓展');
INSERT INTO `t_order_region` VALUES ('1956', '429405', '429004', '毛嘴镇', '中国,湖北省,仙桃市,毛嘴镇', '毛嘴镇', '中国,湖北,仙桃,毛嘴镇', '3', '0728', '433008', 'Maozui', 'MZ', 'M', '113.035', '30.4173', '拓展');
INSERT INTO `t_order_region` VALUES ('1957', '429406', '429004', '豆河镇', '中国,湖北省,仙桃市,豆河镇', '豆河镇', '中国,湖北,仙桃,豆河镇', '3', '0728', '433006', 'Douhe', 'DH', 'D', '113.087', '30.3421', '拓展');
INSERT INTO `t_order_region` VALUES ('1958', '429407', '429004', '三伏潭镇', '中国,湖北省,仙桃市,三伏潭镇', '三伏潭镇', '中国,湖北,仙桃,三伏潭镇', '3', '0728', '433005', 'Sanfutan', 'SFT', 'S', '113.202', '30.3752', '拓展');
INSERT INTO `t_order_region` VALUES ('1959', '429408', '429004', '胡场镇', '中国,湖北省,仙桃市,胡场镇', '胡场镇', '中国,湖北,仙桃,胡场镇', '3', '0728', '433004', 'Huchang', 'HC', 'H', '113.308', '30.3775', '拓展');
INSERT INTO `t_order_region` VALUES ('1960', '429409', '429004', '长埫口镇', '中国,湖北省,仙桃市,长埫口镇', '长埫口镇', '中国,湖北,仙桃,长埫口镇', '3', '0728', '433000', 'Changchongkou', 'CCK', 'C', '113.564', '30.4008', '拓展');
INSERT INTO `t_order_region` VALUES ('1961', '429410', '429004', '西流河镇', '中国,湖北省,仙桃市,西流河镇', '西流河镇', '中国,湖北,仙桃,西流河镇', '3', '0728', '433023', 'Xiliuhe', 'XLH', 'X', '113.678', '30.3145', '拓展');
INSERT INTO `t_order_region` VALUES ('1962', '429411', '429004', '沙湖镇', '中国,湖北省,仙桃市,沙湖镇', '沙湖镇', '中国,湖北,仙桃,沙湖镇', '3', '0728', '433019', 'Shahu', 'SH', 'S', '113.675', '30.1693', '拓展');
INSERT INTO `t_order_region` VALUES ('1963', '429412', '429004', '杨林尾镇', '中国,湖北省,仙桃市,杨林尾镇', '杨林尾镇', '中国,湖北,仙桃,杨林尾镇', '3', '0728', '433021', 'Yanglinwei', 'YLW', 'Y', '113.509', '30.1371', '拓展');
INSERT INTO `t_order_region` VALUES ('1964', '429413', '429004', '彭场镇', '中国,湖北省,仙桃市,彭场镇', '彭场镇', '中国,湖北,仙桃,彭场镇', '3', '0728', '433018', 'Pengchang', 'PC', 'P', '113.506', '30.2633', '拓展');
INSERT INTO `t_order_region` VALUES ('1965', '429414', '429004', '张沟镇', '中国,湖北省,仙桃市,张沟镇', '张沟镇', '中国,湖北,仙桃,张沟镇', '3', '0728', '433012', 'Zhanggou', 'ZG', 'Z', '113.381', '30.2501', '拓展');
INSERT INTO `t_order_region` VALUES ('1966', '429415', '429004', '郭河镇', '中国,湖北省,仙桃市,郭河镇', '郭河镇', '中国,湖北,仙桃,郭河镇', '3', '0728', '433013', 'Guohe', 'GH', 'G', '113.294', '30.2404', '拓展');
INSERT INTO `t_order_region` VALUES ('1967', '429416', '429004', '沔城镇', '中国,湖北省,仙桃市,沔城镇', '沔城镇', '中国,湖北,仙桃,沔城镇', '3', '0728', '433014', 'Miancheng', 'MC', 'M', '113.231', '30.193', '拓展');
INSERT INTO `t_order_region` VALUES ('1968', '429417', '429004', '通海口镇', '中国,湖北省,仙桃市,通海口镇', '通海口镇', '中国,湖北,仙桃,通海口镇', '3', '0728', '433015', 'Tonghaikou', 'THK', 'T', '113.153', '30.1982', '拓展');
INSERT INTO `t_order_region` VALUES ('1969', '429418', '429004', '陈场镇', '中国,湖北省,仙桃市,陈场镇', '陈场镇', '中国,湖北,仙桃,陈场镇', '3', '0728', '433016', 'Chenchang', 'CC', 'C', '113.088', '30.2352', '拓展');
INSERT INTO `t_order_region` VALUES ('1970', '429419', '429004', '高新区', '中国,湖北省,仙桃市,高新区', '高新区', '中国,湖北,仙桃,高新区', '3', '0728', '433000', 'GaoXinQu', 'GXQ', 'G', '113.461', '30.3689', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('1971', '429420', '429004', '经济开发区', '中国,湖北省,仙桃市,经济开发区', '经济开发区', '中国,湖北,仙桃,经济开发区', '3', '0728', '433000', 'Xiantao', 'XT', 'X', '113.483', '30.3648', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('1972', '429421', '429004', '工业园区', '中国,湖北省,仙桃市,工业园区', '工业园区', '中国,湖北,仙桃,工业园区', '3', '0728', '433001', 'Gongyeyuanqu', 'GYYQ', 'G', '113.414', '30.3373', '工业园区');
INSERT INTO `t_order_region` VALUES ('1973', '429422', '429004', '九合垸原种场', '中国,湖北省,仙桃市,九合垸原种场', '九合垸原种场', '中国,湖北,仙桃,九合垸原种场', '3', '0728', '433032', 'Jiuheyuan', 'JHY', 'J', '113.015', '30.2535', '拓展');
INSERT INTO `t_order_region` VALUES ('1974', '429423', '429004', '沙湖原种场', '中国,湖北省,仙桃市,沙湖原种场', '沙湖原种场', '中国,湖北,仙桃,沙湖原种场', '3', '0728', '433019', 'ShaYuan', 'SY', 'S', '113.662', '30.1587', '拓展');
INSERT INTO `t_order_region` VALUES ('1975', '429424', '429004', '排湖渔场', '中国,湖北省,仙桃市,排湖渔场', '排湖渔场', '中国,湖北,仙桃,排湖渔场', '3', '0728', '433025', 'PaiHu', 'PH', 'P', '113.239', '30.2933', '拓展');
INSERT INTO `t_order_region` VALUES ('1976', '429425', '429004', '五湖渔场', '中国,湖北省,仙桃市,五湖渔场', '五湖渔场', '中国,湖北,仙桃,五湖渔场', '3', '0728', '433019', 'Wuhu', 'WH', 'W', '113.79', '30.2002', '拓展');
INSERT INTO `t_order_region` VALUES ('1977', '429426', '429004', '赵西垸林场', '中国,湖北省,仙桃市,赵西垸林场', '赵西垸林场', '中国,湖北,仙桃,赵西垸林场', '3', '0728', '433000', 'Zhaoxiyuan', 'ZXY', 'Z', '113.017', '30.2947', '拓展');
INSERT INTO `t_order_region` VALUES ('1978', '429427', '429004', '刘家垸林场', '中国,湖北省,仙桃市,刘家垸林场', '刘家垸林场', '中国,湖北,仙桃,刘家垸林场', '3', '0728', '433029', 'LiuJiaYuan', 'LJY', 'L', '113.568', '30.2123', '拓展');
INSERT INTO `t_order_region` VALUES ('1979', '429428', '429004', '畜禽良种场', '中国,湖北省,仙桃市,畜禽良种场', '畜禽良种场', '中国,湖北,仙桃,畜禽良种场', '3', '0728', '433019', 'ChuQin', 'CQ', 'C', '113.768', '30.1803', '拓展');
INSERT INTO `t_order_region` VALUES ('1980', '429501', '429005', '园林', '中国,湖北省,潜江市,园林', '园林', '中国,湖北,潜江,园林', '3', '0728', '433199', 'Yuanlin', 'YL', 'Y', '112.766', '30.4027', '拓展');
INSERT INTO `t_order_region` VALUES ('1981', '429502', '429005', '广华', '中国,湖北省,潜江市,广华', '广华', '中国,湖北,潜江,广华', '3', '0728', '433124', 'Guanghua', 'GH', 'G', '112.702', '30.4373', '拓展');
INSERT INTO `t_order_region` VALUES ('1982', '429503', '429005', '杨市', '中国,湖北省,潜江市,杨市', '杨市', '中国,湖北,潜江,杨市', '3', '0728', '433133', 'Yangshi', 'YS', 'Y', '112.91', '30.3681', '拓展');
INSERT INTO `t_order_region` VALUES ('1983', '429504', '429005', '周矶', '中国,湖北省,潜江市,周矶', '周矶', '中国,湖北,潜江,周矶', '3', '0728', '433114', 'Zhouji', 'ZJ', 'Z', '112.803', '30.4128', '拓展');
INSERT INTO `t_order_region` VALUES ('1984', '429505', '429005', '泽口', '中国,湖北省,潜江市,泽口', '泽口', '中国,湖北,潜江,泽口', '3', '0728', '433132', 'Zekou', 'ZK', 'Z', '112.877', '30.4769', '拓展');
INSERT INTO `t_order_region` VALUES ('1985', '429506', '429005', '泰丰', '中国,湖北省,潜江市,泰丰', '泰丰', '中国,湖北,潜江,泰丰', '3', '0728', '433199', 'Taifeng', 'TF', 'T', '112.907', '30.4064', '拓展');
INSERT INTO `t_order_region` VALUES ('1986', '429507', '429005', '高场', '中国,湖北省,潜江市,高场', '高场', '中国,湖北,潜江,高场', '3', '0728', '433115', 'Gaochang', 'GC', 'G', '112.733', '30.4045', '拓展');
INSERT INTO `t_order_region` VALUES ('1987', '429508', '429005', '熊口镇', '中国,湖北省,潜江市,熊口镇', '熊口镇', '中国,湖北,潜江,熊口镇', '3', '0728', '433136', 'Xiongkou', 'XK', 'X', '112.781', '30.306', '拓展');
INSERT INTO `t_order_region` VALUES ('1988', '429509', '429005', '竹根滩镇', '中国,湖北省,潜江市,竹根滩镇', '竹根滩镇', '中国,湖北,潜江,竹根滩镇', '3', '0728', '433131', 'Zhugentan', 'ZGT', 'Z', '112.907', '30.4935', '拓展');
INSERT INTO `t_order_region` VALUES ('1989', '429510', '429005', '高石碑镇', '中国,湖北省,潜江市,高石碑镇', '高石碑镇', '中国,湖北,潜江,高石碑镇', '3', '0728', '433126', 'Gaoshibei', 'GSB', 'G', '112.673', '30.5475', '拓展');
INSERT INTO `t_order_region` VALUES ('1990', '429511', '429005', '老新镇', '中国,湖北省,潜江市,老新镇', '老新镇', '中国,湖北,潜江,老新镇', '3', '0728', '433111', 'Laoxin', 'LX', 'L', '112.857', '30.1888', '拓展');
INSERT INTO `t_order_region` VALUES ('1991', '429512', '429005', '王场镇', '中国,湖北省,潜江市,王场镇', '王场镇', '中国,湖北,潜江,王场镇', '3', '0728', '433122', 'Wangchang', 'WC', 'W', '112.774', '30.5049', '拓展');
INSERT INTO `t_order_region` VALUES ('1992', '429513', '429005', '渔洋镇', '中国,湖北省,潜江市,渔洋镇', '渔洋镇', '中国,湖北,潜江,渔洋镇', '3', '0728', '433138', 'Yuyang', 'YY', 'Y', '112.909', '30.1724', '拓展');
INSERT INTO `t_order_region` VALUES ('1993', '429514', '429005', '龙湾镇', '中国,湖北省,潜江市,龙湾镇', '龙湾镇', '中国,湖北,潜江,龙湾镇', '3', '0728', '433139', 'Longwan', 'LW', 'L', '112.717', '30.2294', '拓展');
INSERT INTO `t_order_region` VALUES ('1994', '429515', '429005', '浩口镇', '中国,湖北省,潜江市,浩口镇', '浩口镇', '中国,湖北,潜江,浩口镇', '3', '0728', '433116', 'Haokou', 'HK', 'H', '112.65', '30.3787', '拓展');
INSERT INTO `t_order_region` VALUES ('1995', '429516', '429005', '积玉口镇', '中国,湖北省,潜江市,积玉口镇', '积玉口镇', '中国,湖北,潜江,积玉口镇', '3', '0728', '433128', 'Jiyukou', 'JYK', 'J', '112.603', '30.4455', '拓展');
INSERT INTO `t_order_region` VALUES ('1996', '429517', '429005', '张金镇', '中国,湖北省,潜江市,张金镇', '张金镇', '中国,湖北,潜江,张金镇', '3', '0728', '433140', 'Zhangjin', 'ZJ', 'Z', '112.597', '30.1919', '拓展');
INSERT INTO `t_order_region` VALUES ('1997', '429518', '429005', '白鹭湖管理区', '中国,湖北省,潜江市,白鹭湖管理区', '白鹭湖管理区', '中国,湖北,潜江,白鹭湖管理区', '3', '0728', '433100', 'Bailuhu', 'BLH', 'B', '112.766', '30.1076', '拓展');
INSERT INTO `t_order_region` VALUES ('1998', '429519', '429005', '总口管理区', '中国,湖北省,潜江市,总口管理区', '总口管理区', '中国,湖北,潜江,总口管理区', '3', '0728', '433100', 'ZongKou', 'ZK', 'Z', '112.921', '30.2887', '拓展');
INSERT INTO `t_order_region` VALUES ('1999', '429520', '429005', '熊口农场管理区', '中国,湖北省,潜江市,熊口农场管理区', '熊口农场管理区', '中国,湖北,潜江,熊口农场管理区', '3', '0728', '433100', 'Xiongkou', 'XK', 'X', '112.776', '30.2954', '拓展');
INSERT INTO `t_order_region` VALUES ('2000', '429521', '429005', '运粮湖管理区', '中国,湖北省,潜江市,运粮湖管理区', '运粮湖管理区', '中国,湖北,潜江,运粮湖管理区', '3', '0728', '433100', 'Yunlianghu', 'YLH', 'Y', '112.528', '30.2844', '拓展');
INSERT INTO `t_order_region` VALUES ('2001', '429522', '429005', '后湖管理区', '中国,湖北省,潜江市,后湖管理区', '后湖管理区', '中国,湖北,潜江,后湖管理区', '3', '0728', '433100', 'Houhu', 'HH', 'H', '112.726', '30.3976', '拓展');
INSERT INTO `t_order_region` VALUES ('2002', '429523', '429005', '周矶管理区', '中国,湖北省,潜江市,周矶管理区', '周矶管理区', '中国,湖北,潜江,周矶管理区', '3', '0728', '433100', 'Zhouji', 'ZJ', 'Z', '112.789', '30.4576', '拓展');
INSERT INTO `t_order_region` VALUES ('2003', '429524', '429005', '经济开发区', '中国,湖北省,潜江市,经济开发区', '经济开发区', '中国,湖北,潜江,经济开发区', '3', '0728', '433100', 'Kaifaqu', 'KF', 'K', '112.874', '30.4659', '拓展');
INSERT INTO `t_order_region` VALUES ('2004', '429601', '429006', '竟陵街道', '中国,湖北省,天门市,竟陵街道', '竟陵街道', '中国,湖北,天门,竟陵街道', '3', '0728', '431700', 'Jingling', 'JL', 'J', '113.167', '30.6457', '拓展');
INSERT INTO `t_order_region` VALUES ('2005', '429602', '429006', '杨林街道', '中国,湖北省,天门市,杨林街道', '杨林街道', '中国,湖北,天门,杨林街道', '3', '0728', '431732', 'Yanglin', 'YL', 'Y', '113.195', '30.6399', '拓展');
INSERT INTO `t_order_region` VALUES ('2006', '429603', '429006', '佛子山镇', '中国,湖北省,天门市,佛子山镇', '佛子山镇', '中国,湖北,天门,佛子山镇', '3', '0728', '431707', 'Fozishan', 'FZS', 'F', '113.011', '30.7524', '拓展');
INSERT INTO `t_order_region` VALUES ('2007', '429604', '429006', '多宝镇', '中国,湖北省,天门市,多宝镇', '多宝镇', '中国,湖北,天门,多宝镇', '3', '0728', '431722', 'Duobao', 'DB', 'D', '112.698', '30.6681', '拓展');
INSERT INTO `t_order_region` VALUES ('2008', '429605', '429006', '拖市镇', '中国,湖北省,天门市,拖市镇', '拖市镇', '中国,湖北,天门,拖市镇', '3', '0728', '43171', 'Tuoshi', 'TS', 'T', '112.839', '30.727', '拓展');
INSERT INTO `t_order_region` VALUES ('2009', '429606', '429006', '张港镇', '中国,湖北省,天门市,张港镇', '张港镇', '中国,湖北,天门,张港镇', '3', '0728', '431726', 'Zhanggang', 'ZG', 'Z', '112.881', '30.5677', '拓展');
INSERT INTO `t_order_region` VALUES ('2010', '429607', '429006', '蒋场镇', '中国,湖北省,天门市,蒋场镇', '蒋场镇', '中国,湖北,天门,蒋场镇', '3', '0728', '431716', 'Jiangchang', 'JC', 'J', '112.945', '30.6059', '拓展');
INSERT INTO `t_order_region` VALUES ('2011', '429608', '429006', '汪场镇', '中国,湖北省,天门市,汪场镇', '汪场镇', '中国,湖北,天门,汪场镇', '3', '0728', '431717', 'Wangchang', 'WC', 'W', '113.041', '30.6138', '拓展');
INSERT INTO `t_order_region` VALUES ('2012', '429609', '429006', '渔薪镇', '中国,湖北省,天门市,渔薪镇', '渔薪镇', '中国,湖北,天门,渔薪镇', '3', '0728', '431709', 'Yuxin', 'YX', 'Y', '112.991', '30.6753', '拓展');
INSERT INTO `t_order_region` VALUES ('2013', '429610', '429006', '黄潭镇', '中国,湖北省,天门市,黄潭镇', '黄潭镇', '中国,湖北,天门,黄潭镇', '3', '0728', '431708', 'Huangtan', 'HT', 'H', '113.091', '30.6594', '拓展');
INSERT INTO `t_order_region` VALUES ('2014', '429611', '429006', '岳口镇', '中国,湖北省,天门市,岳口镇', '岳口镇', '中国,湖北,天门,岳口镇', '3', '0728', '431702', 'Yuekou', 'YK', 'Y', '113.094', '30.5071', '拓展');
INSERT INTO `t_order_region` VALUES ('2015', '429612', '429006', '横林镇', '中国,湖北省,天门市,横林镇', '横林镇', '中国,湖北,天门,横林镇', '3', '0728', '431720', 'Henglin', 'HL', 'H', '113.188', '30.5367', '拓展');
INSERT INTO `t_order_region` VALUES ('2016', '429613', '429006', '彭市镇', '中国,湖北省,天门市,彭市镇', '彭市镇', '中国,湖北,天门,彭市镇', '3', '0728', '431718', 'Pengshi', 'PS', 'P', '113.188', '30.4566', '拓展');
INSERT INTO `t_order_region` VALUES ('2017', '429614', '429006', '麻洋镇', '中国,湖北省,天门市,麻洋镇', '麻洋镇', '中国,湖北,天门,麻洋镇', '3', '0728', '431727', 'Mayang', 'MY', 'M', '113.268', '30.4353', '拓展');
INSERT INTO `t_order_region` VALUES ('2018', '429615', '429006', '多祥镇', '中国,湖北省,天门市,多祥镇', '多祥镇', '中国,湖北,天门,多祥镇', '3', '0728', '431728', 'Duoxiang', 'DX', 'D', '113.367', '30.4274', '拓展');
INSERT INTO `t_order_region` VALUES ('2019', '429616', '429006', '干驿镇', '中国,湖北省,天门市,干驿镇', '干驿镇', '中国,湖北,天门,干驿镇', '3', '0728', '431714', 'Ganyi', 'GY', 'G', '113.386', '30.5434', '拓展');
INSERT INTO `t_order_region` VALUES ('2020', '429617', '429006', '马湾镇', '中国,湖北省,天门市,马湾镇', '马湾镇', '中国,湖北,天门,马湾镇', '3', '0728', '431715', 'Mawan', 'MW', 'M', '113.335', '30.5733', '拓展');
INSERT INTO `t_order_region` VALUES ('2021', '429618', '429006', '卢市镇', '中国,湖北省,天门市,卢市镇', '卢市镇', '中国,湖北,天门,卢市镇', '3', '0728', '431729', 'Lushi', 'LS', 'L', '113.332', '30.6681', '拓展');
INSERT INTO `t_order_region` VALUES ('2022', '429619', '429006', '小板镇', '中国,湖北省,天门市,小板镇', '小板镇', '中国,湖北,天门,小板镇', '3', '0728', '431731', 'Xiaoban', 'XB', 'X', '113.225', '30.608', '拓展');
INSERT INTO `t_order_region` VALUES ('2023', '429620', '429006', '九真镇', '中国,湖北省,天门市,九真镇', '九真镇', '中国,湖北,天门,九真镇', '3', '0728', '431705', 'Jiuzhen', 'JZ', 'J', '113.22', '30.7417', '拓展');
INSERT INTO `t_order_region` VALUES ('2024', '429621', '429006', '皂市镇', '中国,湖北省,天门市,皂市镇', '皂市镇', '中国,湖北,天门,皂市镇', '3', '0728', '431703', 'Zaoshi', 'ZS', 'Z', '113.349', '30.8562', '拓展');
INSERT INTO `t_order_region` VALUES ('2025', '429622', '429006', '胡市镇', '中国,湖北省,天门市,胡市镇', '胡市镇', '中国,湖北,天门,胡市镇', '3', '0728', '431713', 'Hushi', 'HS', 'H', '113.39', '30.7797', '拓展');
INSERT INTO `t_order_region` VALUES ('2026', '429623', '429006', '石河镇', '中国,湖北省,天门市,石河镇', '石河镇', '中国,湖北,天门,石河镇', '3', '0728', '431706', 'Shihe', 'SH', 'S', '113.086', '30.7585', '拓展');
INSERT INTO `t_order_region` VALUES ('2027', '429624', '429006', '净潭乡', '中国,湖北省,天门市,净潭乡', '净潭乡', '中国,湖北,天门,净潭乡', '3', '0728', '431730', 'Jingtanxiang', 'JTX', 'J', '113.401', '30.6551', '拓展');
INSERT INTO `t_order_region` VALUES ('2028', '429625', '429006', '蒋湖农场', '中国,湖北省,天门市,蒋湖农场', '蒋湖农场', '中国,湖北,天门,蒋湖农场', '3', '0728', '431725', 'Jianghu', 'JH', 'J', '112.854', '30.6365', '拓展');
INSERT INTO `t_order_region` VALUES ('2029', '429626', '429006', '白茅湖农场', '中国,湖北省,天门市,白茅湖农场', '白茅湖农场', '中国,湖北,天门,白茅湖农场', '3', '0728', '431719', 'Baimaohu', 'BMH', 'B', '113.101', '30.6075', '拓展');
INSERT INTO `t_order_region` VALUES ('2030', '429627', '429006', '沉湖林业科技示范区', '中国,湖北省,天门市,沉湖林业科技示范区', '沉湖林业科技示范区', '中国,湖北,天门,沉湖林业科技示范区', '3', '0728', '431700', 'Chenhu', 'CH', 'C', '113.166', '30.6531', '拓展');
INSERT INTO `t_order_region` VALUES ('2031', '429628', '429006', '天门工业园', '中国,湖北省,天门市,天门工业园', '天门工业园', '中国,湖北,天门,天门工业园', '3', '0728', '431700', 'Gongyeyuan', 'GYY', 'G', '113.446', '30.4026', '拓展');
INSERT INTO `t_order_region` VALUES ('2032', '429629', '429006', '侨乡街道开发区', '中国,湖北省,天门市,侨乡街道开发区', '侨乡街道开发区', '中国,湖北,天门,侨乡街道开发区', '3', '0728', '431700', 'Qiaoxiang', 'QX', 'Q', '113.157', '30.6349', '拓展');
INSERT INTO `t_order_region` VALUES ('2033', '430000', '100000', '湖南省', '中国,湖南省', '湖南', '中国,湖南', '1', '', '', 'Hunan', 'HN', 'H', '112.982', '28.1941', '');
INSERT INTO `t_order_region` VALUES ('2034', '430100', '430000', '长沙市', '中国,湖南省,长沙市', '长沙', '中国,湖南,长沙', '2', '0731', '410000', 'Changsha', 'CS', 'C', '112.982', '28.1941', '');
INSERT INTO `t_order_region` VALUES ('2035', '430102', '430100', '芙蓉区', '中国,湖南省,长沙市,芙蓉区', '芙蓉', '中国,湖南,长沙,芙蓉', '3', '0731', '410000', 'Furong', 'FR', 'F', '113.032', '28.1844', '');
INSERT INTO `t_order_region` VALUES ('2036', '430103', '430100', '天心区', '中国,湖南省,长沙市,天心区', '天心', '中国,湖南,长沙,天心', '3', '0731', '410000', 'Tianxin', 'TX', 'T', '112.99', '28.1127', '');
INSERT INTO `t_order_region` VALUES ('2037', '430104', '430100', '岳麓区', '中国,湖南省,长沙市,岳麓区', '岳麓', '中国,湖南,长沙,岳麓', '3', '0731', '410000', 'Yuelu', 'YL', 'Y', '112.931', '28.2351', '');
INSERT INTO `t_order_region` VALUES ('2038', '430105', '430100', '开福区', '中国,湖南省,长沙市,开福区', '开福', '中国,湖南,长沙,开福', '3', '0731', '410000', 'Kaifu', 'KF', 'K', '112.986', '28.2558', '');
INSERT INTO `t_order_region` VALUES ('2039', '430111', '430100', '雨花区', '中国,湖南省,长沙市,雨花区', '雨花', '中国,湖南,长沙,雨花', '3', '0731', '410000', 'Yuhua', 'YH', 'Y', '113.036', '28.1354', '');
INSERT INTO `t_order_region` VALUES ('2040', '430112', '430100', '望城区', '中国,湖南省,长沙市,望城区', '望城', '中国,湖南,长沙,望城', '3', '0731', '410200', 'Wangcheng', 'WC', 'W', '112.82', '28.3475', '');
INSERT INTO `t_order_region` VALUES ('2041', '430121', '430100', '长沙县', '中国,湖南省,长沙市,长沙县', '长沙', '中国,湖南,长沙,长沙', '3', '0731', '410100', 'Changsha', 'CS', 'C', '113.081', '28.246', '');
INSERT INTO `t_order_region` VALUES ('2042', '430124', '430100', '宁乡市', '中国,湖南省,长沙市,宁乡市', '宁乡', '中国,湖南,长沙,宁乡', '3', '0731', '410600', 'Ningxiang', 'NX', 'N', '112.557', '28.2536', '省直辖');
INSERT INTO `t_order_region` VALUES ('2043', '430181', '430100', '浏阳市', '中国,湖南省,长沙市,浏阳市', '浏阳', '中国,湖南,长沙,浏阳', '3', '0731', '410300', 'Liuyang', 'LY', 'L', '113.643', '28.1637', '');
INSERT INTO `t_order_region` VALUES ('2044', '430182', '430100', '湘江新区', '中国,湖南省,长沙市,湘江新区', '湘江新区', '中国,湖南,长沙,湘江新区', '3', '0731', '410005', 'XiangJiangXiQu', 'XJXQ', 'X', '112.938', '28.1403', '国家级新区');
INSERT INTO `t_order_region` VALUES ('2045', '430200', '430000', '株洲市', '中国,湖南省,株洲市', '株洲', '中国,湖南,株洲', '2', '0731', '412000', 'Zhuzhou', 'ZZ', 'Z', '113.152', '27.8358', '');
INSERT INTO `t_order_region` VALUES ('2046', '430202', '430200', '荷塘区', '中国,湖南省,株洲市,荷塘区', '荷塘', '中国,湖南,株洲,荷塘', '3', '0731', '412000', 'Hetang', 'HT', 'H', '113.173', '27.8557', '');
INSERT INTO `t_order_region` VALUES ('2047', '430203', '430200', '芦淞区', '中国,湖南省,株洲市,芦淞区', '芦淞', '中国,湖南,株洲,芦淞', '3', '0731', '412000', 'Lusong', 'LS', 'L', '113.156', '27.7852', '');
INSERT INTO `t_order_region` VALUES ('2048', '430204', '430200', '石峰区', '中国,湖南省,株洲市,石峰区', '石峰', '中国,湖南,株洲,石峰', '3', '0731', '412000', 'Shifeng', 'SF', 'S', '113.118', '27.8755', '');
INSERT INTO `t_order_region` VALUES ('2049', '430211', '430200', '天元区', '中国,湖南省,株洲市,天元区', '天元', '中国,湖南,株洲,天元', '3', '0731', '412000', 'Tianyuan', 'TY', 'T', '113.123', '27.831', '');
INSERT INTO `t_order_region` VALUES ('2050', '430221', '430200', '株洲县', '中国,湖南省,株洲市,株洲县', '株洲', '中国,湖南,株洲,株洲', '3', '0731', '412000', 'Zhuzhou', 'ZZ', 'Z', '113.144', '27.6983', '');
INSERT INTO `t_order_region` VALUES ('2051', '430223', '430200', '攸县', '中国,湖南省,株洲市,攸县', '攸县', '中国,湖南,株洲,攸县', '3', '0731', '412300', 'Youxian', 'YX', 'Y', '113.344', '27.0035', '');
INSERT INTO `t_order_region` VALUES ('2052', '430224', '430200', '茶陵县', '中国,湖南省,株洲市,茶陵县', '茶陵', '中国,湖南,株洲,茶陵', '3', '0731', '412400', 'Chaling', 'CL', 'C', '113.544', '26.7915', '');
INSERT INTO `t_order_region` VALUES ('2053', '430225', '430200', '炎陵县', '中国,湖南省,株洲市,炎陵县', '炎陵', '中国,湖南,株洲,炎陵', '3', '0731', '412500', 'Yanling', 'YL', 'Y', '113.772', '26.4882', '');
INSERT INTO `t_order_region` VALUES ('2054', '430281', '430200', '醴陵市', '中国,湖南省,株洲市,醴陵市', '醴陵', '中国,湖南,株洲,醴陵', '3', '0731', '412200', 'Liling', 'LL', 'L', '113.497', '27.6462', '');
INSERT INTO `t_order_region` VALUES ('2055', '430300', '430000', '湘潭市', '中国,湖南省,湘潭市', '湘潭', '中国,湖南,湘潭', '2', '0731', '411100', 'Xiangtan', 'XT', 'X', '112.925', '27.8467', '');
INSERT INTO `t_order_region` VALUES ('2056', '430302', '430300', '雨湖区', '中国,湖南省,湘潭市,雨湖区', '雨湖', '中国,湖南,湘潭,雨湖', '3', '0731', '411100', 'Yuhu', 'YH', 'Y', '112.904', '27.8686', '');
INSERT INTO `t_order_region` VALUES ('2057', '430304', '430300', '岳塘区', '中国,湖南省,湘潭市,岳塘区', '岳塘', '中国,湖南,湘潭,岳塘', '3', '0731', '411100', 'Yuetang', 'YT', 'Y', '112.961', '27.8578', '');
INSERT INTO `t_order_region` VALUES ('2058', '430321', '430300', '湘潭县', '中国,湖南省,湘潭市,湘潭县', '湘潭', '中国,湖南,湘潭,湘潭', '3', '0731', '411200', 'Xiangtan', 'XT', 'X', '112.951', '27.7789', '');
INSERT INTO `t_order_region` VALUES ('2059', '430381', '430300', '湘乡市', '中国,湖南省,湘潭市,湘乡市', '湘乡', '中国,湖南,湘潭,湘乡', '3', '0731', '411400', 'Xiangxiang', 'XX', 'X', '112.535', '27.7354', '');
INSERT INTO `t_order_region` VALUES ('2060', '430382', '430300', '韶山市', '中国,湖南省,湘潭市,韶山市', '韶山', '中国,湖南,湘潭,韶山', '3', '0731', '411300', 'Shaoshan', 'SS', 'S', '112.527', '27.915', '');
INSERT INTO `t_order_region` VALUES ('2061', '430383', '430300', '高新区', '中国,湖南省,湘潭市,高新区', '高新区', '中国,湖南,湘潭,高新区', '3', '0731', '411100', 'Gaoxinqu', 'GXQ', 'G', '112.94', '27.8228', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2062', '430400', '430000', '衡阳市', '中国,湖南省,衡阳市', '衡阳', '中国,湖南,衡阳', '2', '0734', '421000', 'Hengyang', 'HY', 'H', '112.608', '26.9004', '');
INSERT INTO `t_order_region` VALUES ('2063', '430405', '430400', '珠晖区', '中国,湖南省,衡阳市,珠晖区', '珠晖', '中国,湖南,衡阳,珠晖', '3', '0734', '421000', 'Zhuhui', 'ZH', 'Z', '112.621', '26.8936', '');
INSERT INTO `t_order_region` VALUES ('2064', '430406', '430400', '雁峰区', '中国,湖南省,衡阳市,雁峰区', '雁峰', '中国,湖南,衡阳,雁峰', '3', '0734', '421000', 'Yanfeng', 'YF', 'Y', '112.617', '26.8887', '');
INSERT INTO `t_order_region` VALUES ('2065', '430407', '430400', '石鼓区', '中国,湖南省,衡阳市,石鼓区', '石鼓', '中国,湖南,衡阳,石鼓', '3', '0734', '421000', 'Shigu', 'SG', 'S', '112.611', '26.9023', '');
INSERT INTO `t_order_region` VALUES ('2066', '430408', '430400', '蒸湘区', '中国,湖南省,衡阳市,蒸湘区', '蒸湘', '中国,湖南,衡阳,蒸湘', '3', '0734', '421000', 'Zhengxiang', 'ZX', 'Z', '112.603', '26.8965', '');
INSERT INTO `t_order_region` VALUES ('2067', '430412', '430400', '南岳区', '中国,湖南省,衡阳市,南岳区', '南岳', '中国,湖南,衡阳,南岳', '3', '0734', '421000', 'Nanyue', 'NY', 'N', '112.738', '27.2326', '');
INSERT INTO `t_order_region` VALUES ('2068', '430421', '430400', '衡阳县', '中国,湖南省,衡阳市,衡阳县', '衡阳', '中国,湖南,衡阳,衡阳', '3', '0734', '421200', 'Hengyang', 'HY', 'H', '112.371', '26.9706', '');
INSERT INTO `t_order_region` VALUES ('2069', '430422', '430400', '衡南县', '中国,湖南省,衡阳市,衡南县', '衡南', '中国,湖南,衡阳,衡南', '3', '0734', '421100', 'Hengnan', 'HN', 'H', '112.678', '26.7383', '');
INSERT INTO `t_order_region` VALUES ('2070', '430423', '430400', '衡山县', '中国,湖南省,衡阳市,衡山县', '衡山', '中国,湖南,衡阳,衡山', '3', '0734', '421300', 'Hengshan', 'HS', 'H', '112.868', '27.2313', '');
INSERT INTO `t_order_region` VALUES ('2071', '430424', '430400', '衡东县', '中国,湖南省,衡阳市,衡东县', '衡东', '中国,湖南,衡阳,衡东', '3', '0734', '421400', 'Hengdong', 'HD', 'H', '112.948', '27.0809', '');
INSERT INTO `t_order_region` VALUES ('2072', '430426', '430400', '祁东县', '中国,湖南省,衡阳市,祁东县', '祁东', '中国,湖南,衡阳,祁东', '3', '0734', '421600', 'Qidong', 'QD', 'Q', '112.09', '26.7996', '');
INSERT INTO `t_order_region` VALUES ('2073', '430481', '430400', '耒阳市', '中国,湖南省,衡阳市,耒阳市', '耒阳', '中国,湖南,衡阳,耒阳', '3', '0734', '421800', 'Leiyang', 'LY', 'L', '112.86', '26.4213', '');
INSERT INTO `t_order_region` VALUES ('2074', '430482', '430400', '常宁市', '中国,湖南省,衡阳市,常宁市', '常宁', '中国,湖南,衡阳,常宁', '3', '0734', '421500', 'Changning', 'CN', 'C', '112.401', '26.4069', '');
INSERT INTO `t_order_region` VALUES ('2075', '430483', '430400', '高新区', '中国,湖南省,衡阳市,高新区', '高新区', '中国,湖南,衡阳,高新区', '3', '0734', '421000', 'Gaoxinqu', 'GXQ', 'G', '112.572', '26.8922', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2076', '430500', '430000', '邵阳市', '中国,湖南省,邵阳市', '邵阳', '中国,湖南,邵阳', '2', '0739', '422000', 'Shaoyang', 'SY', 'S', '111.469', '27.2378', '');
INSERT INTO `t_order_region` VALUES ('2077', '430502', '430500', '双清区', '中国,湖南省,邵阳市,双清区', '双清', '中国,湖南,邵阳,双清', '3', '0739', '422000', 'Shuangqing', 'SQ', 'S', '111.497', '27.2329', '');
INSERT INTO `t_order_region` VALUES ('2078', '430503', '430500', '大祥区', '中国,湖南省,邵阳市,大祥区', '大祥', '中国,湖南,邵阳,大祥', '3', '0739', '422000', 'Daxiang', 'DX', 'D', '111.454', '27.2333', '');
INSERT INTO `t_order_region` VALUES ('2079', '430511', '430500', '北塔区', '中国,湖南省,邵阳市,北塔区', '北塔', '中国,湖南,邵阳,北塔', '3', '0739', '422000', 'Beita', 'BT', 'B', '111.452', '27.2465', '');
INSERT INTO `t_order_region` VALUES ('2080', '430521', '430500', '邵东县', '中国,湖南省,邵阳市,邵东县', '邵东', '中国,湖南,邵阳,邵东', '3', '0739', '422800', 'Shaodong', 'SD', 'S', '111.744', '27.2584', '');
INSERT INTO `t_order_region` VALUES ('2081', '430522', '430500', '新邵县', '中国,湖南省,邵阳市,新邵县', '新邵', '中国,湖南,邵阳,新邵', '3', '0739', '422900', 'Xinshao', 'XS', 'X', '111.461', '27.3217', '');
INSERT INTO `t_order_region` VALUES ('2082', '430523', '430500', '邵阳县', '中国,湖南省,邵阳市,邵阳县', '邵阳', '中国,湖南,邵阳,邵阳', '3', '0739', '422100', 'Shaoyang', 'SY', 'S', '111.275', '26.9914', '');
INSERT INTO `t_order_region` VALUES ('2083', '430524', '430500', '隆回县', '中国,湖南省,邵阳市,隆回县', '隆回', '中国,湖南,邵阳,隆回', '3', '0739', '422200', 'Longhui', 'LH', 'L', '111.032', '27.1094', '');
INSERT INTO `t_order_region` VALUES ('2084', '430525', '430500', '洞口县', '中国,湖南省,邵阳市,洞口县', '洞口', '中国,湖南,邵阳,洞口', '3', '0739', '422300', 'Dongkou', 'DK', 'D', '110.574', '27.0546', '');
INSERT INTO `t_order_region` VALUES ('2085', '430527', '430500', '绥宁县', '中国,湖南省,邵阳市,绥宁县', '绥宁', '中国,湖南,邵阳,绥宁', '3', '0739', '422600', 'Suining', 'SN', 'S', '110.156', '26.5864', '');
INSERT INTO `t_order_region` VALUES ('2086', '430528', '430500', '新宁县', '中国,湖南省,邵阳市,新宁县', '新宁', '中国,湖南,邵阳,新宁', '3', '0739', '422700', 'Xinning', 'XN', 'X', '110.851', '26.4294', '');
INSERT INTO `t_order_region` VALUES ('2087', '430529', '430500', '城步苗族自治县', '中国,湖南省,邵阳市,城步苗族自治县', '城步', '中国,湖南,邵阳,城步', '3', '0739', '422500', 'Chengbu', 'CB', 'C', '110.322', '26.3905', '');
INSERT INTO `t_order_region` VALUES ('2088', '430581', '430500', '武冈市', '中国,湖南省,邵阳市,武冈市', '武冈', '中国,湖南,邵阳,武冈', '3', '0739', '422400', 'Wugang', 'WG', 'W', '110.633', '26.7282', '');
INSERT INTO `t_order_region` VALUES ('2089', '430600', '430000', '岳阳市', '中国,湖南省,岳阳市', '岳阳', '中国,湖南,岳阳', '2', '0730', '414000', 'Yueyang', 'YY', 'Y', '113.133', '29.3703', '');
INSERT INTO `t_order_region` VALUES ('2090', '430602', '430600', '岳阳楼区', '中国,湖南省,岳阳市,岳阳楼区', '岳阳楼', '中国,湖南,岳阳,岳阳楼', '3', '0730', '414000', 'Yueyanglou', 'YYL', 'Y', '113.129', '29.3719', '');
INSERT INTO `t_order_region` VALUES ('2091', '430603', '430600', '云溪区', '中国,湖南省,岳阳市,云溪区', '云溪', '中国,湖南,岳阳,云溪', '3', '0730', '414000', 'Yunxi', 'YX', 'Y', '113.277', '29.4736', '');
INSERT INTO `t_order_region` VALUES ('2092', '430611', '430600', '君山区', '中国,湖南省,岳阳市,君山区', '君山', '中国,湖南,岳阳,君山', '3', '0730', '414000', 'Junshan', 'JS', 'J', '113.004', '29.4594', '');
INSERT INTO `t_order_region` VALUES ('2093', '430621', '430600', '岳阳县', '中国,湖南省,岳阳市,岳阳县', '岳阳', '中国,湖南,岳阳,岳阳', '3', '0730', '414100', 'Yueyang', 'YY', 'Y', '113.12', '29.1431', '');
INSERT INTO `t_order_region` VALUES ('2094', '430623', '430600', '华容县', '中国,湖南省,岳阳市,华容县', '华容', '中国,湖南,岳阳,华容', '3', '0730', '414200', 'Huarong', 'HR', 'H', '112.541', '29.5302', '');
INSERT INTO `t_order_region` VALUES ('2095', '430624', '430600', '湘阴县', '中国,湖南省,岳阳市,湘阴县', '湘阴', '中国,湖南,岳阳,湘阴', '3', '0730', '410500', 'Xiangyin', 'XY', 'X', '112.909', '28.6892', '');
INSERT INTO `t_order_region` VALUES ('2096', '430626', '430600', '平江县', '中国,湖南省,岳阳市,平江县', '平江', '中国,湖南,岳阳,平江', '3', '0730', '410400', 'Pingjiang', 'PJ', 'P', '113.581', '28.7066', '');
INSERT INTO `t_order_region` VALUES ('2097', '430681', '430600', '汨罗市', '中国,湖南省,岳阳市,汨罗市', '汨罗', '中国,湖南,岳阳,汨罗', '3', '0730', '414400', 'Miluo', 'ML', 'M', '113.067', '28.8063', '');
INSERT INTO `t_order_region` VALUES ('2098', '430682', '430600', '临湘市', '中国,湖南省,岳阳市,临湘市', '临湘', '中国,湖南,岳阳,临湘', '3', '0730', '414300', 'Linxiang', 'LX', 'L', '113.45', '29.477', '');
INSERT INTO `t_order_region` VALUES ('2099', '430700', '430000', '常德市', '中国,湖南省,常德市', '常德', '中国,湖南,常德', '2', '0736', '415000', 'Changde', 'CD', 'C', '111.691', '29.0402', '');
INSERT INTO `t_order_region` VALUES ('2100', '430702', '430700', '武陵区', '中国,湖南省,常德市,武陵区', '武陵', '中国,湖南,常德,武陵', '3', '0736', '415000', 'Wuling', 'WL', 'W', '111.698', '29.0288', '');
INSERT INTO `t_order_region` VALUES ('2101', '430703', '430700', '鼎城区', '中国,湖南省,常德市,鼎城区', '鼎城', '中国,湖南,常德,鼎城', '3', '0736', '415100', 'Dingcheng', 'DC', 'D', '111.681', '29.0186', '');
INSERT INTO `t_order_region` VALUES ('2102', '430721', '430700', '安乡县', '中国,湖南省,常德市,安乡县', '安乡', '中国,湖南,常德,安乡', '3', '0736', '415600', 'Anxiang', 'AX', 'A', '112.167', '29.4133', '');
INSERT INTO `t_order_region` VALUES ('2103', '430722', '430700', '汉寿县', '中国,湖南省,常德市,汉寿县', '汉寿', '中国,湖南,常德,汉寿', '3', '0736', '415900', 'Hanshou', 'HS', 'H', '111.967', '28.903', '');
INSERT INTO `t_order_region` VALUES ('2104', '430723', '430700', '澧县', '中国,湖南省,常德市,澧县', '澧县', '中国,湖南,常德,澧县', '3', '0736', '415500', 'Lixian', 'LX', 'L', '111.759', '29.6332', '');
INSERT INTO `t_order_region` VALUES ('2105', '430724', '430700', '临澧县', '中国,湖南省,常德市,临澧县', '临澧', '中国,湖南,常德,临澧', '3', '0736', '415200', 'Linli', 'LL', 'L', '111.652', '29.4416', '');
INSERT INTO `t_order_region` VALUES ('2106', '430725', '430700', '桃源县', '中国,湖南省,常德市,桃源县', '桃源', '中国,湖南,常德,桃源', '3', '0736', '415700', 'Taoyuan', 'TY', 'T', '111.489', '28.9047', '');
INSERT INTO `t_order_region` VALUES ('2107', '430726', '430700', '石门县', '中国,湖南省,常德市,石门县', '石门', '中国,湖南,常德,石门', '3', '0736', '415300', 'Shimen', 'SM', 'S', '111.38', '29.5842', '');
INSERT INTO `t_order_region` VALUES ('2108', '430781', '430700', '津市市', '中国,湖南省,常德市,津市市', '津市', '中国,湖南,常德,津市', '3', '0736', '415400', 'Jinshi', 'JS', 'J', '111.878', '29.6056', '');
INSERT INTO `t_order_region` VALUES ('2109', '430800', '430000', '张家界市', '中国,湖南省,张家界市', '张家界', '中国,湖南,张家界', '2', '0744', '427000', 'Zhangjiajie', 'ZJJ', 'Z', '110.48', '29.1274', '');
INSERT INTO `t_order_region` VALUES ('2110', '430802', '430800', '永定区', '中国,湖南省,张家界市,永定区', '永定', '中国,湖南,张家界,永定', '3', '0744', '427000', 'Yongding', 'YD', 'Y', '110.475', '29.1339', '');
INSERT INTO `t_order_region` VALUES ('2111', '430811', '430800', '武陵源区', '中国,湖南省,张家界市,武陵源区', '武陵源', '中国,湖南,张家界,武陵源', '3', '0744', '427400', 'Wulingyuan', 'WLY', 'W', '110.55', '29.3457', '');
INSERT INTO `t_order_region` VALUES ('2112', '430821', '430800', '慈利县', '中国,湖南省,张家界市,慈利县', '慈利', '中国,湖南,张家界,慈利', '3', '0744', '427200', 'Cili', 'CL', 'C', '111.139', '29.4299', '');
INSERT INTO `t_order_region` VALUES ('2113', '430822', '430800', '桑植县', '中国,湖南省,张家界市,桑植县', '桑植', '中国,湖南,张家界,桑植', '3', '0744', '427100', 'Sangzhi', 'SZ', 'S', '110.163', '29.3981', '');
INSERT INTO `t_order_region` VALUES ('2114', '430900', '430000', '益阳市', '中国,湖南省,益阳市', '益阳', '中国,湖南,益阳', '2', '0737', '413000', 'Yiyang', 'YY', 'Y', '112.355', '28.5701', '');
INSERT INTO `t_order_region` VALUES ('2115', '430902', '430900', '资阳区', '中国,湖南省,益阳市,资阳区', '资阳', '中国,湖南,益阳,资阳', '3', '0737', '413000', 'Ziyang', 'ZY', 'Z', '112.324', '28.591', '');
INSERT INTO `t_order_region` VALUES ('2116', '430903', '430900', '赫山区', '中国,湖南省,益阳市,赫山区', '赫山', '中国,湖南,益阳,赫山', '3', '0737', '413000', 'Heshan', 'HS', 'H', '112.373', '28.5742', '');
INSERT INTO `t_order_region` VALUES ('2117', '430921', '430900', '南县', '中国,湖南省,益阳市,南县', '南县', '中国,湖南,益阳,南县', '3', '0737', '413200', 'Nanxian', 'NX', 'N', '112.396', '29.3616', '');
INSERT INTO `t_order_region` VALUES ('2118', '430922', '430900', '桃江县', '中国,湖南省,益阳市,桃江县', '桃江', '中国,湖南,益阳,桃江', '3', '0737', '413400', 'Taojiang', 'TJ', 'T', '112.156', '28.5181', '');
INSERT INTO `t_order_region` VALUES ('2119', '430923', '430900', '安化县', '中国,湖南省,益阳市,安化县', '安化', '中国,湖南,益阳,安化', '3', '0737', '413500', 'Anhua', 'AH', 'A', '111.213', '28.3742', '');
INSERT INTO `t_order_region` VALUES ('2120', '430981', '430900', '沅江市', '中国,湖南省,益阳市,沅江市', '沅江', '中国,湖南,益阳,沅江', '3', '0737', '413100', 'Yuanjiang', 'YJ', 'Y', '112.354', '28.844', '');
INSERT INTO `t_order_region` VALUES ('2121', '431000', '430000', '郴州市', '中国,湖南省,郴州市', '郴州', '中国,湖南,郴州', '2', '0735', '423000', 'Chenzhou', 'CZ', 'C', '113.032', '25.7936', '');
INSERT INTO `t_order_region` VALUES ('2122', '431002', '431000', '北湖区', '中国,湖南省,郴州市,北湖区', '北湖', '中国,湖南,郴州,北湖', '3', '0735', '423000', 'Beihu', 'BH', 'B', '113.011', '25.784', '');
INSERT INTO `t_order_region` VALUES ('2123', '431003', '431000', '苏仙区', '中国,湖南省,郴州市,苏仙区', '苏仙', '中国,湖南,郴州,苏仙', '3', '0735', '423000', 'Suxian', 'SX', 'S', '113.042', '25.8004', '');
INSERT INTO `t_order_region` VALUES ('2124', '431021', '431000', '桂阳县', '中国,湖南省,郴州市,桂阳县', '桂阳', '中国,湖南,郴州,桂阳', '3', '0735', '424400', 'Guiyang', 'GY', 'G', '112.734', '25.7541', '');
INSERT INTO `t_order_region` VALUES ('2125', '431022', '431000', '宜章县', '中国,湖南省,郴州市,宜章县', '宜章', '中国,湖南,郴州,宜章', '3', '0735', '424200', 'Yizhang', 'YZ', 'Y', '112.951', '25.3993', '');
INSERT INTO `t_order_region` VALUES ('2126', '431023', '431000', '永兴县', '中国,湖南省,郴州市,永兴县', '永兴', '中国,湖南,郴州,永兴', '3', '0735', '423300', 'Yongxing', 'YX', 'Y', '113.112', '26.1265', '');
INSERT INTO `t_order_region` VALUES ('2127', '431024', '431000', '嘉禾县', '中国,湖南省,郴州市,嘉禾县', '嘉禾', '中国,湖南,郴州,嘉禾', '3', '0735', '424500', 'Jiahe', 'JH', 'J', '112.369', '25.5879', '');
INSERT INTO `t_order_region` VALUES ('2128', '431025', '431000', '临武县', '中国,湖南省,郴州市,临武县', '临武', '中国,湖南,郴州,临武', '3', '0735', '424300', 'Linwu', 'LW', 'L', '112.564', '25.276', '');
INSERT INTO `t_order_region` VALUES ('2129', '431026', '431000', '汝城县', '中国,湖南省,郴州市,汝城县', '汝城', '中国,湖南,郴州,汝城', '3', '0735', '424100', 'Rucheng', 'RC', 'R', '113.686', '25.552', '');
INSERT INTO `t_order_region` VALUES ('2130', '431027', '431000', '桂东县', '中国,湖南省,郴州市,桂东县', '桂东', '中国,湖南,郴州,桂东', '3', '0735', '423500', 'Guidong', 'GD', 'G', '113.947', '26.0799', '');
INSERT INTO `t_order_region` VALUES ('2131', '431028', '431000', '安仁县', '中国,湖南省,郴州市,安仁县', '安仁', '中国,湖南,郴州,安仁', '3', '0735', '423600', 'Anren', 'AR', 'A', '113.269', '26.7093', '');
INSERT INTO `t_order_region` VALUES ('2132', '431081', '431000', '资兴市', '中国,湖南省,郴州市,资兴市', '资兴', '中国,湖南,郴州,资兴', '3', '0735', '423400', 'Zixing', 'ZX', 'Z', '113.237', '25.9767', '');
INSERT INTO `t_order_region` VALUES ('2133', '431100', '430000', '永州市', '中国,湖南省,永州市', '永州', '中国,湖南,永州', '2', '0746', '425000', 'Yongzhou', 'YZ', 'Y', '111.608', '26.4345', '');
INSERT INTO `t_order_region` VALUES ('2134', '431102', '431100', '零陵区', '中国,湖南省,永州市,零陵区', '零陵', '中国,湖南,永州,零陵', '3', '0746', '425000', 'Lingling', 'LL', 'L', '111.621', '26.2211', '');
INSERT INTO `t_order_region` VALUES ('2135', '431103', '431100', '冷水滩区', '中国,湖南省,永州市,冷水滩区', '冷水滩', '中国,湖南,永州,冷水滩', '3', '0746', '425000', 'Lengshuitan', 'LST', 'L', '111.592', '26.4611', '');
INSERT INTO `t_order_region` VALUES ('2136', '431121', '431100', '祁阳县', '中国,湖南省,永州市,祁阳县', '祁阳', '中国,湖南,永州,祁阳', '3', '0746', '426100', 'Qiyang', 'QY', 'Q', '111.84', '26.5801', '');
INSERT INTO `t_order_region` VALUES ('2137', '431122', '431100', '东安县', '中国,湖南省,永州市,东安县', '东安', '中国,湖南,永州,东安', '3', '0746', '425900', 'Dong\'an', 'DA', 'D', '111.316', '26.392', '');
INSERT INTO `t_order_region` VALUES ('2138', '431123', '431100', '双牌县', '中国,湖南省,永州市,双牌县', '双牌', '中国,湖南,永州,双牌', '3', '0746', '425200', 'Shuangpai', 'SP', 'S', '111.659', '25.9599', '');
INSERT INTO `t_order_region` VALUES ('2139', '431124', '431100', '道县', '中国,湖南省,永州市,道县', '道县', '中国,湖南,永州,道县', '3', '0746', '425300', 'Daoxian', 'DX', 'D', '111.602', '25.5277', '');
INSERT INTO `t_order_region` VALUES ('2140', '431125', '431100', '江永县', '中国,湖南省,永州市,江永县', '江永', '中国,湖南,永州,江永', '3', '0746', '425400', 'Jiangyong', 'JY', 'J', '111.341', '25.2723', '');
INSERT INTO `t_order_region` VALUES ('2141', '431126', '431100', '宁远县', '中国,湖南省,永州市,宁远县', '宁远', '中国,湖南,永州,宁远', '3', '0746', '425600', 'Ningyuan', 'NY', 'N', '111.946', '25.5691', '');
INSERT INTO `t_order_region` VALUES ('2142', '431127', '431100', '蓝山县', '中国,湖南省,永州市,蓝山县', '蓝山', '中国,湖南,永州,蓝山', '3', '0746', '425800', 'Lanshan', 'LS', 'L', '112.194', '25.3679', '');
INSERT INTO `t_order_region` VALUES ('2143', '431128', '431100', '新田县', '中国,湖南省,永州市,新田县', '新田', '中国,湖南,永州,新田', '3', '0746', '425700', 'Xintian', 'XT', 'X', '112.221', '25.9095', '');
INSERT INTO `t_order_region` VALUES ('2144', '431129', '431100', '江华瑶族自治县', '中国,湖南省,永州市,江华瑶族自治县', '江华', '中国,湖南,永州,江华', '3', '0746', '425500', 'Jianghua', 'JH', 'J', '111.588', '25.1845', '');
INSERT INTO `t_order_region` VALUES ('2145', '431200', '430000', '怀化市', '中国,湖南省,怀化市', '怀化', '中国,湖南,怀化', '2', '0745', '418000', 'Huaihua', 'HH', 'H', '109.978', '27.5501', '');
INSERT INTO `t_order_region` VALUES ('2146', '431202', '431200', '鹤城区', '中国,湖南省,怀化市,鹤城区', '鹤城', '中国,湖南,怀化,鹤城', '3', '0745', '418000', 'Hecheng', 'HC', 'H', '109.965', '27.5494', '');
INSERT INTO `t_order_region` VALUES ('2147', '431221', '431200', '中方县', '中国,湖南省,怀化市,中方县', '中方', '中国,湖南,怀化,中方', '3', '0745', '418000', 'Zhongfang', 'ZF', 'Z', '109.945', '27.4399', '');
INSERT INTO `t_order_region` VALUES ('2148', '431222', '431200', '沅陵县', '中国,湖南省,怀化市,沅陵县', '沅陵', '中国,湖南,怀化,沅陵', '3', '0745', '419600', 'Yuanling', 'YL', 'Y', '110.396', '28.4555', '');
INSERT INTO `t_order_region` VALUES ('2149', '431223', '431200', '辰溪县', '中国,湖南省,怀化市,辰溪县', '辰溪', '中国,湖南,怀化,辰溪', '3', '0745', '419500', 'Chenxi', 'CX', 'C', '110.189', '28.0041', '');
INSERT INTO `t_order_region` VALUES ('2150', '431224', '431200', '溆浦县', '中国,湖南省,怀化市,溆浦县', '溆浦', '中国,湖南,怀化,溆浦', '3', '0745', '419300', 'Xupu', 'XP', 'X', '110.594', '27.9084', '');
INSERT INTO `t_order_region` VALUES ('2151', '431225', '431200', '会同县', '中国,湖南省,怀化市,会同县', '会同', '中国,湖南,怀化,会同', '3', '0745', '418300', 'Huitong', 'HT', 'H', '109.736', '26.8872', '');
INSERT INTO `t_order_region` VALUES ('2152', '431226', '431200', '麻阳苗族自治县', '中国,湖南省,怀化市,麻阳苗族自治县', '麻阳', '中国,湖南,怀化,麻阳', '3', '0745', '419400', 'Mayang', 'MY', 'M', '109.802', '27.866', '');
INSERT INTO `t_order_region` VALUES ('2153', '431227', '431200', '新晃侗族自治县', '中国,湖南省,怀化市,新晃侗族自治县', '新晃', '中国,湖南,怀化,新晃', '3', '0745', '419200', 'Xinhuang', 'XH', 'X', '109.172', '27.3594', '');
INSERT INTO `t_order_region` VALUES ('2154', '431228', '431200', '芷江侗族自治县', '中国,湖南省,怀化市,芷江侗族自治县', '芷江', '中国,湖南,怀化,芷江', '3', '0745', '419100', 'Zhijiang', 'ZJ', 'Z', '109.685', '27.443', '');
INSERT INTO `t_order_region` VALUES ('2155', '431229', '431200', '靖州苗族侗族自治县', '中国,湖南省,怀化市,靖州苗族侗族自治县', '靖州', '中国,湖南,怀化,靖州', '3', '0745', '418400', 'Jingzhou', 'JZ', 'J', '109.698', '26.5765', '');
INSERT INTO `t_order_region` VALUES ('2156', '431230', '431200', '通道侗族自治县', '中国,湖南省,怀化市,通道侗族自治县', '通道', '中国,湖南,怀化,通道', '3', '0745', '418500', 'Tongdao', 'TD', 'T', '109.785', '26.1571', '');
INSERT INTO `t_order_region` VALUES ('2157', '431281', '431200', '洪江市', '中国,湖南省,怀化市,洪江市', '洪江', '中国,湖南,怀化,洪江', '3', '0745', '418200', 'Hongjiang', 'HJ', 'H', '109.837', '27.2092', '');
INSERT INTO `t_order_region` VALUES ('2158', '431300', '430000', '娄底市', '中国,湖南省,娄底市', '娄底', '中国,湖南,娄底', '2', '0738', '417000', 'Loudi', 'LD', 'L', '112.008', '27.7281', '');
INSERT INTO `t_order_region` VALUES ('2159', '431302', '431300', '娄星区', '中国,湖南省,娄底市,娄星区', '娄星', '中国,湖南,娄底,娄星', '3', '0738', '417000', 'Louxing', 'LX', 'L', '112.002', '27.7299', '');
INSERT INTO `t_order_region` VALUES ('2160', '431321', '431300', '双峰县', '中国,湖南省,娄底市,双峰县', '双峰', '中国,湖南,娄底,双峰', '3', '0738', '417700', 'Shuangfeng', 'SF', 'S', '112.199', '27.4542', '');
INSERT INTO `t_order_region` VALUES ('2161', '431322', '431300', '新化县', '中国,湖南省,娄底市,新化县', '新化', '中国,湖南,娄底,新化', '3', '0738', '417600', 'Xinhua', 'XH', 'X', '111.327', '27.7266', '');
INSERT INTO `t_order_region` VALUES ('2162', '431381', '431300', '冷水江市', '中国,湖南省,娄底市,冷水江市', '冷水江', '中国,湖南,娄底,冷水江', '3', '0738', '417500', 'Lengshuijiang', 'LSJ', 'L', '111.436', '27.6815', '');
INSERT INTO `t_order_region` VALUES ('2163', '431382', '431300', '涟源市', '中国,湖南省,娄底市,涟源市', '涟源', '中国,湖南,娄底,涟源', '3', '0738', '417100', 'Lianyuan', 'LY', 'L', '111.672', '27.6883', '');
INSERT INTO `t_order_region` VALUES ('2164', '433100', '430000', '湘西土家族苗族自治州', '中国,湖南省,湘西土家族苗族自治州', '湘西', '中国,湖南,湘西', '2', '0743', '416000', 'Xiangxi', 'XX', 'X', '109.74', '28.3143', '');
INSERT INTO `t_order_region` VALUES ('2165', '433101', '433100', '吉首市', '中国,湖南省,湘西土家族苗族自治州,吉首市', '吉首', '中国,湖南,湘西,吉首', '3', '0743', '416000', 'Jishou', 'JS', 'J', '109.698', '28.2625', '');
INSERT INTO `t_order_region` VALUES ('2166', '433122', '433100', '泸溪县', '中国,湖南省,湘西土家族苗族自治州,泸溪县', '泸溪', '中国,湖南,湘西,泸溪', '3', '0743', '416100', 'Luxi', 'LX', 'L', '110.217', '28.2205', '');
INSERT INTO `t_order_region` VALUES ('2167', '433123', '433100', '凤凰县', '中国,湖南省,湘西土家族苗族自治州,凤凰县', '凤凰', '中国,湖南,湘西,凤凰', '3', '0743', '416200', 'Fenghuang', 'FH', 'F', '109.602', '27.9482', '');
INSERT INTO `t_order_region` VALUES ('2168', '433124', '433100', '花垣县', '中国,湖南省,湘西土家族苗族自治州,花垣县', '花垣', '中国,湖南,湘西,花垣', '3', '0743', '416400', 'Huayuan', 'HY', 'H', '109.482', '28.5721', '');
INSERT INTO `t_order_region` VALUES ('2169', '433125', '433100', '保靖县', '中国,湖南省,湘西土家族苗族自治州,保靖县', '保靖', '中国,湖南,湘西,保靖', '3', '0743', '416500', 'Baojing', 'BJ', 'B', '109.66', '28.7', '');
INSERT INTO `t_order_region` VALUES ('2170', '433126', '433100', '古丈县', '中国,湖南省,湘西土家族苗族自治州,古丈县', '古丈', '中国,湖南,湘西,古丈', '3', '0743', '416300', 'Guzhang', 'GZ', 'G', '109.948', '28.6194', '');
INSERT INTO `t_order_region` VALUES ('2171', '433127', '433100', '永顺县', '中国,湖南省,湘西土家族苗族自治州,永顺县', '永顺', '中国,湖南,湘西,永顺', '3', '0743', '416700', 'Yongshun', 'YS', 'Y', '109.853', '29.001', '');
INSERT INTO `t_order_region` VALUES ('2172', '433130', '433100', '龙山县', '中国,湖南省,湘西土家族苗族自治州,龙山县', '龙山', '中国,湖南,湘西,龙山', '3', '0743', '416800', 'Longshan', 'LS', 'L', '109.443', '29.4569', '');
INSERT INTO `t_order_region` VALUES ('2173', '440000', '100000', '广东省', '中国,广东省', '广东', '中国,广东', '1', '', '', 'Guangdong', 'GD', 'G', '113.281', '23.1252', '');
INSERT INTO `t_order_region` VALUES ('2174', '440100', '440000', '广州市', '中国,广东省,广州市', '广州', '中国,广东,广州', '2', '020', '510000', 'Guangzhou', 'GZ', 'G', '113.281', '23.1252', '');
INSERT INTO `t_order_region` VALUES ('2175', '440103', '440100', '荔湾区', '中国,广东省,广州市,荔湾区', '荔湾', '中国,广东,广州,荔湾', '3', '020', '510000', 'Liwan', 'LW', 'L', '113.244', '23.1259', '');
INSERT INTO `t_order_region` VALUES ('2176', '440104', '440100', '越秀区', '中国,广东省,广州市,越秀区', '越秀', '中国,广东,广州,越秀', '3', '020', '510000', 'Yuexiu', 'YX', 'Y', '113.267', '23.129', '');
INSERT INTO `t_order_region` VALUES ('2177', '440105', '440100', '海珠区', '中国,广东省,广州市,海珠区', '海珠', '中国,广东,广州,海珠', '3', '020', '510000', 'Haizhu', 'HZ', 'H', '113.262', '23.1038', '');
INSERT INTO `t_order_region` VALUES ('2178', '440106', '440100', '天河区', '中国,广东省,广州市,天河区', '天河', '中国,广东,广州,天河', '3', '020', '510000', 'Tianhe', 'TH', 'T', '113.361', '23.1247', '');
INSERT INTO `t_order_region` VALUES ('2179', '440111', '440100', '白云区', '中国,广东省,广州市,白云区', '白云', '中国,广东,广州,白云', '3', '020', '510000', 'Baiyun', 'BY', 'B', '113.273', '23.1579', '');
INSERT INTO `t_order_region` VALUES ('2180', '440112', '440100', '黄埔区', '中国,广东省,广州市,黄埔区', '黄埔', '中国,广东,广州,黄埔', '3', '020', '510700', 'Huangpu', 'HP', 'H', '113.459', '23.1064', '');
INSERT INTO `t_order_region` VALUES ('2181', '440113', '440100', '番禺区', '中国,广东省,广州市,番禺区', '番禺', '中国,广东,广州,番禺', '3', '020', '511400', 'Panyu', 'PY', 'P', '113.384', '22.936', '');
INSERT INTO `t_order_region` VALUES ('2182', '440114', '440100', '花都区', '中国,广东省,广州市,花都区', '花都', '中国,广东,广州,花都', '3', '020', '510800', 'Huadu', 'HD', 'H', '113.22', '23.4036', '');
INSERT INTO `t_order_region` VALUES ('2183', '440115', '440100', '南沙区', '中国,广东省,广州市,南沙区', '南沙', '中国,广东,广州,南沙', '3', '020', '511458', 'Nansha', 'NS', 'N', '113.608', '22.7714', '国家级新区');
INSERT INTO `t_order_region` VALUES ('2184', '440117', '440100', '从化区', '中国,广东省,广州市,从化区', '从化', '中国,广东,广州,从化', '3', '020', '510900', 'Conghua', 'CH', 'C', '113.587', '23.5453', '');
INSERT INTO `t_order_region` VALUES ('2185', '440118', '440100', '增城区', '中国,广东省,广州市,增城区', '增城', '中国,广东,广州,增城', '3', '020', '511300', 'Zengcheng', 'ZC', 'Z', '113.83', '23.2905', '');
INSERT INTO `t_order_region` VALUES ('2186', '440200', '440000', '韶关市', '中国,广东省,韶关市', '韶关', '中国,广东,韶关', '2', '0751', '512000', 'Shaoguan', 'SG', 'S', '113.592', '24.8013', '');
INSERT INTO `t_order_region` VALUES ('2187', '440203', '440200', '武江区', '中国,广东省,韶关市,武江区', '武江', '中国,广东,韶关,武江', '3', '0751', '512000', 'Wujiang', 'WJ', 'W', '113.588', '24.7926', '');
INSERT INTO `t_order_region` VALUES ('2188', '440204', '440200', '浈江区', '中国,广东省,韶关市,浈江区', '浈江', '中国,广东,韶关,浈江', '3', '0751', '512000', 'Zhenjiang', 'ZJ', 'Z', '113.611', '24.8044', '');
INSERT INTO `t_order_region` VALUES ('2189', '440205', '440200', '曲江区', '中国,广东省,韶关市,曲江区', '曲江', '中国,广东,韶关,曲江', '3', '0751', '512100', 'Qujiang', 'QJ', 'Q', '113.602', '24.6791', '');
INSERT INTO `t_order_region` VALUES ('2190', '440222', '440200', '始兴县', '中国,广东省,韶关市,始兴县', '始兴', '中国,广东,韶关,始兴', '3', '0751', '512500', 'Shixing', 'SX', 'S', '114.068', '24.9476', '');
INSERT INTO `t_order_region` VALUES ('2191', '440224', '440200', '仁化县', '中国,广东省,韶关市,仁化县', '仁化', '中国,广东,韶关,仁化', '3', '0751', '512300', 'Renhua', 'RH', 'R', '113.747', '25.0874', '');
INSERT INTO `t_order_region` VALUES ('2192', '440229', '440200', '翁源县', '中国,广东省,韶关市,翁源县', '翁源', '中国,广东,韶关,翁源', '3', '0751', '512600', 'Wengyuan', 'WY', 'W', '114.134', '24.3495', '');
INSERT INTO `t_order_region` VALUES ('2193', '440232', '440200', '乳源瑶族自治县', '中国,广东省,韶关市,乳源瑶族自治县', '乳源', '中国,广东,韶关,乳源', '3', '0751', '512600', 'Ruyuan', 'RY', 'R', '113.277', '24.778', '');
INSERT INTO `t_order_region` VALUES ('2194', '440233', '440200', '新丰县', '中国,广东省,韶关市,新丰县', '新丰', '中国,广东,韶关,新丰', '3', '0751', '511100', 'Xinfeng', 'XF', 'X', '114.208', '24.0592', '');
INSERT INTO `t_order_region` VALUES ('2195', '440281', '440200', '乐昌市', '中国,广东省,韶关市,乐昌市', '乐昌', '中国,广东,韶关,乐昌', '3', '0751', '512200', 'Lechang', 'LC', 'L', '113.357', '25.128', '');
INSERT INTO `t_order_region` VALUES ('2196', '440282', '440200', '南雄市', '中国,广东省,韶关市,南雄市', '南雄', '中国,广东,韶关,南雄', '3', '0751', '512400', 'Nanxiong', 'NX', 'N', '114.31', '25.1171', '');
INSERT INTO `t_order_region` VALUES ('2197', '440300', '440000', '深圳市', '中国,广东省,深圳市', '深圳', '中国,广东,深圳', '2', '0755', '518000', 'Shenzhen', 'SZ', 'S', '114.086', '22.547', '');
INSERT INTO `t_order_region` VALUES ('2198', '440303', '440300', '罗湖区', '中国,广东省,深圳市,罗湖区', '罗湖', '中国,广东,深圳,罗湖', '3', '0755', '518000', 'Luohu', 'LH', 'L', '114.131', '22.5484', '');
INSERT INTO `t_order_region` VALUES ('2199', '440304', '440300', '福田区', '中国,广东省,深圳市,福田区', '福田', '中国,广东,深圳,福田', '3', '0755', '518000', 'Futian', 'FT', 'F', '114.056', '22.5224', '');
INSERT INTO `t_order_region` VALUES ('2200', '440305', '440300', '南山区', '中国,广东省,深圳市,南山区', '南山', '中国,广东,深圳,南山', '3', '0755', '518000', 'Nanshan', 'NS', 'N', '113.93', '22.5329', '');
INSERT INTO `t_order_region` VALUES ('2201', '440306', '440300', '宝安区', '中国,广东省,深圳市,宝安区', '宝安', '中国,广东,深圳,宝安', '3', '0755', '518100', 'Bao\'an', 'BA', 'B', '113.883', '22.5537', '');
INSERT INTO `t_order_region` VALUES ('2202', '440307', '440300', '龙岗区', '中国,广东省,深圳市,龙岗区', '龙岗', '中国,广东,深圳,龙岗', '3', '0755', '518116', 'Longgang', 'LG', 'L', '114.248', '22.7199', '');
INSERT INTO `t_order_region` VALUES ('2203', '440308', '440300', '盐田区', '中国,广东省,深圳市,盐田区', '盐田', '中国,广东,深圳,盐田', '3', '0755', '518000', 'Yantian', 'YT', 'Y', '114.237', '22.5578', '');
INSERT INTO `t_order_region` VALUES ('2204', '440309', '440300', '龙华区', '中国,广东省,深圳市,龙华区', '龙华', '中国,广东,深圳,龙华', '3', '0755', '518109', 'Longhua', 'LH', 'L', '114.037', '22.687', '');
INSERT INTO `t_order_region` VALUES ('2205', '440310', '440300', '坪山区', '中国,广东省,深圳市,坪山区', '坪山', '中国,广东,深圳,坪山', '3', '0755', '518118', 'Pingshan', 'PS', 'P', '114.346', '22.6905', '');
INSERT INTO `t_order_region` VALUES ('2206', '440311', '440300', '光明新区', '中国,广东省,深圳市,光明新区', '光明新区', '中国,广东,深圳,光明新区', '3', '0755', '518107', 'Guangmingxinqu', 'GMXQ', 'G', '113.896', '22.7773', '新区');
INSERT INTO `t_order_region` VALUES ('2207', '440312', '440300', '大鹏新区', '中国,广东省,深圳市,大鹏新区', '大鹏新区', '中国,广东,深圳,大鹏新区', '3', '0755', '518116', 'Dapengxinqu', 'DPXQ', 'D', '114.48', '22.5879', '新区');
INSERT INTO `t_order_region` VALUES ('2208', '440400', '440000', '珠海市', '中国,广东省,珠海市', '珠海', '中国,广东,珠海', '2', '0756', '519000', 'Zhuhai', 'ZH', 'Z', '113.553', '22.2559', '');
INSERT INTO `t_order_region` VALUES ('2209', '440402', '440400', '香洲区', '中国,广东省,珠海市,香洲区', '香洲', '中国,广东,珠海,香洲', '3', '0756', '519000', 'Xiangzhou', 'XZ', 'X', '113.544', '22.2665', '');
INSERT INTO `t_order_region` VALUES ('2210', '440403', '440400', '斗门区', '中国,广东省,珠海市,斗门区', '斗门', '中国,广东,珠海,斗门', '3', '0756', '519100', 'Doumen', 'DM', 'D', '113.296', '22.209', '');
INSERT INTO `t_order_region` VALUES ('2211', '440404', '440400', '金湾区', '中国,广东省,珠海市,金湾区', '金湾', '中国,广东,珠海,金湾', '3', '0756', '519090', 'Jinwan', 'JW', 'J', '113.364', '22.1469', '');
INSERT INTO `t_order_region` VALUES ('2212', '440405', '440400', '横琴新区', '中国,广东省,珠海市,横琴新区', '横琴新区', '中国,广东,珠海,横琴新区', '3', '0756', '519000', 'Hengqinxinqu', 'HQXQ', 'H', '113.531', '22.0959', '新区');
INSERT INTO `t_order_region` VALUES ('2213', '440406', '440400', '经济开发区', '中国,广东省,珠海市,经济开发区', '经济开发区', '中国,广东,珠海,经济开发区', '3', '0756', '519000', 'Jingjikaifaqu', 'JJKFQ', 'J', '113.224', '21.9151', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('2214', '440500', '440000', '汕头市', '中国,广东省,汕头市', '汕头', '中国,广东,汕头', '2', '0754', '515000', 'Shantou', 'ST', 'S', '116.708', '23.371', '');
INSERT INTO `t_order_region` VALUES ('2215', '440507', '440500', '龙湖区', '中国,广东省,汕头市,龙湖区', '龙湖', '中国,广东,汕头,龙湖', '3', '0754', '515000', 'Longhu', 'LH', 'L', '116.716', '23.3717', '');
INSERT INTO `t_order_region` VALUES ('2216', '440511', '440500', '金平区', '中国,广东省,汕头市,金平区', '金平', '中国,广东,汕头,金平', '3', '0754', '515000', 'Jinping', 'JP', 'J', '116.704', '23.3664', '');
INSERT INTO `t_order_region` VALUES ('2217', '440512', '440500', '濠江区', '中国,广东省,汕头市,濠江区', '濠江', '中国,广东,汕头,濠江', '3', '0754', '515000', 'Haojiang', 'HJ', 'H', '116.727', '23.2859', '');
INSERT INTO `t_order_region` VALUES ('2218', '440513', '440500', '潮阳区', '中国,广东省,汕头市,潮阳区', '潮阳', '中国,广东,汕头,潮阳', '3', '0754', '515100', 'Chaoyang', 'CY', 'C', '116.602', '23.2649', '');
INSERT INTO `t_order_region` VALUES ('2219', '440514', '440500', '潮南区', '中国,广东省,汕头市,潮南区', '潮南', '中国,广东,汕头,潮南', '3', '0754', '515100', 'Chaonan', 'CN', 'C', '116.432', '23.25', '');
INSERT INTO `t_order_region` VALUES ('2220', '440515', '440500', '澄海区', '中国,广东省,汕头市,澄海区', '澄海', '中国,广东,汕头,澄海', '3', '0754', '515800', 'Chenghai', 'CH', 'C', '116.756', '23.4673', '');
INSERT INTO `t_order_region` VALUES ('2221', '440523', '440500', '南澳县', '中国,广东省,汕头市,南澳县', '南澳', '中国,广东,汕头,南澳', '3', '0754', '515900', 'Nanao', 'NA', 'N', '117.019', '23.4223', '');
INSERT INTO `t_order_region` VALUES ('2222', '440600', '440000', '佛山市', '中国,广东省,佛山市', '佛山', '中国,广东,佛山', '2', '0757', '528000', 'Foshan', 'FS', 'F', '113.123', '23.0288', '');
INSERT INTO `t_order_region` VALUES ('2223', '440604', '440600', '禅城区', '中国,广东省,佛山市,禅城区', '禅城', '中国,广东,佛山,禅城', '3', '0757', '528000', 'Chancheng', 'CC', 'C', '113.123', '23.0084', '');
INSERT INTO `t_order_region` VALUES ('2224', '440605', '440600', '南海区', '中国,广东省,佛山市,南海区', '南海', '中国,广东,佛山,南海', '3', '0757', '528200', 'Nanhai', 'NH', 'N', '113.143', '23.0288', '');
INSERT INTO `t_order_region` VALUES ('2225', '440606', '440600', '顺德区', '中国,广东省,佛山市,顺德区', '顺德', '中国,广东,佛山,顺德', '3', '0757', '528300', 'Shunde', 'SD', 'S', '113.294', '22.8045', '');
INSERT INTO `t_order_region` VALUES ('2226', '440607', '440600', '三水区', '中国,广东省,佛山市,三水区', '三水', '中国,广东,佛山,三水', '3', '0757', '528100', 'Sanshui', 'SS', 'S', '112.897', '23.1556', '');
INSERT INTO `t_order_region` VALUES ('2227', '440608', '440600', '高明区', '中国,广东省,佛山市,高明区', '高明', '中国,广东,佛山,高明', '3', '0757', '528500', 'Gaoming', 'GM', 'G', '112.893', '22.9002', '');
INSERT INTO `t_order_region` VALUES ('2228', '440700', '440000', '江门市', '中国,广东省,江门市', '江门', '中国,广东,江门', '2', '0750', '529000', 'Jiangmen', 'JM', 'J', '113.095', '22.5904', '');
INSERT INTO `t_order_region` VALUES ('2229', '440703', '440700', '蓬江区', '中国,广东省,江门市,蓬江区', '蓬江', '中国,广东,江门,蓬江', '3', '0750', '529000', 'Pengjiang', 'PJ', 'P', '113.078', '22.5951', '');
INSERT INTO `t_order_region` VALUES ('2230', '440704', '440700', '江海区', '中国,广东省,江门市,江海区', '江海', '中国,广东,江门,江海', '3', '0750', '529000', 'Jianghai', 'JH', 'J', '113.111', '22.5602', '');
INSERT INTO `t_order_region` VALUES ('2231', '440705', '440700', '新会区', '中国,广东省,江门市,新会区', '新会', '中国,广东,江门,新会', '3', '0750', '529100', 'Xinhui', 'XH', 'X', '113.032', '22.4588', '');
INSERT INTO `t_order_region` VALUES ('2232', '440781', '440700', '台山市', '中国,广东省,江门市,台山市', '台山', '中国,广东,江门,台山', '3', '0750', '529200', 'Taishan', 'TS', 'T', '112.794', '22.2515', '');
INSERT INTO `t_order_region` VALUES ('2233', '440783', '440700', '开平市', '中国,广东省,江门市,开平市', '开平', '中国,广东,江门,开平', '3', '0750', '529300', 'Kaiping', 'KP', 'K', '112.698', '22.3762', '');
INSERT INTO `t_order_region` VALUES ('2234', '440784', '440700', '鹤山市', '中国,广东省,江门市,鹤山市', '鹤山', '中国,广东,江门,鹤山', '3', '0750', '529700', 'Heshan', 'HS', 'H', '112.964', '22.7652', '');
INSERT INTO `t_order_region` VALUES ('2235', '440785', '440700', '恩平市', '中国,广东省,江门市,恩平市', '恩平', '中国,广东,江门,恩平', '3', '0750', '529400', 'Enping', 'EP', 'E', '112.305', '22.1829', '');
INSERT INTO `t_order_region` VALUES ('2236', '440800', '440000', '湛江市', '中国,广东省,湛江市', '湛江', '中国,广东,湛江', '2', '0759', '524000', 'Zhanjiang', 'ZJ', 'Z', '110.406', '21.1953', '');
INSERT INTO `t_order_region` VALUES ('2237', '440802', '440800', '赤坎区', '中国,广东省,湛江市,赤坎区', '赤坎', '中国,广东,湛江,赤坎', '3', '0759', '524000', 'Chikan', 'CK', 'C', '110.366', '21.2661', '');
INSERT INTO `t_order_region` VALUES ('2238', '440803', '440800', '霞山区', '中国,广东省,湛江市,霞山区', '霞山', '中国,广东,湛江,霞山', '3', '0759', '524000', 'Xiashan', 'XS', 'X', '110.398', '21.1918', '');
INSERT INTO `t_order_region` VALUES ('2239', '440804', '440800', '坡头区', '中国,广东省,湛江市,坡头区', '坡头', '中国,广东,湛江,坡头', '3', '0759', '524000', 'Potou', 'PT', 'P', '110.455', '21.2447', '');
INSERT INTO `t_order_region` VALUES ('2240', '440811', '440800', '麻章区', '中国,广东省,湛江市,麻章区', '麻章', '中国,广东,湛江,麻章', '3', '0759', '524000', 'Mazhang', 'MZ', 'M', '110.334', '21.2633', '');
INSERT INTO `t_order_region` VALUES ('2241', '440823', '440800', '遂溪县', '中国,广东省,湛江市,遂溪县', '遂溪', '中国,广东,湛江,遂溪', '3', '0759', '524300', 'Suixi', 'SX', 'S', '110.25', '21.3772', '');
INSERT INTO `t_order_region` VALUES ('2242', '440825', '440800', '徐闻县', '中国,广东省,湛江市,徐闻县', '徐闻', '中国,广东,湛江,徐闻', '3', '0759', '524100', 'Xuwen', 'XW', 'X', '110.174', '20.3281', '');
INSERT INTO `t_order_region` VALUES ('2243', '440881', '440800', '廉江市', '中国,广东省,湛江市,廉江市', '廉江', '中国,广东,湛江,廉江', '3', '0759', '524400', 'Lianjiang', 'LJ', 'L', '110.284', '21.6092', '');
INSERT INTO `t_order_region` VALUES ('2244', '440882', '440800', '雷州市', '中国,广东省,湛江市,雷州市', '雷州', '中国,广东,湛江,雷州', '3', '0759', '524200', 'Leizhou', 'LZ', 'L', '110.101', '20.9143', '');
INSERT INTO `t_order_region` VALUES ('2245', '440883', '440800', '吴川市', '中国,广东省,湛江市,吴川市', '吴川', '中国,广东,湛江,吴川', '3', '0759', '524500', 'Wuchuan', 'WC', 'W', '110.777', '21.4458', '');
INSERT INTO `t_order_region` VALUES ('2246', '440884', '440800', '经济开发区', '中国,广东省,湛江市,经济开发区', '经济开发区', '中国,广东,湛江,经济开发区', '3', '0759', '524001', 'Jingjikaifaqu', 'JJKFQ', 'J', '110.325', '21.0121', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('2247', '440900', '440000', '茂名市', '中国,广东省,茂名市', '茂名', '中国,广东,茂名', '2', '0668', '525000', 'Maoming', 'MM', 'M', '110.919', '21.6598', '');
INSERT INTO `t_order_region` VALUES ('2248', '440902', '440900', '茂南区', '中国,广东省,茂名市,茂南区', '茂南', '中国,广东,茂名,茂南', '3', '0668', '525000', 'Maonan', 'MN', 'M', '110.919', '21.641', '');
INSERT INTO `t_order_region` VALUES ('2249', '440904', '440900', '电白区', '中国,广东省,茂名市,电白区', '电白', '中国,广东,茂名,电白', '3', '0668', '525400', 'Dianbai', 'DB', 'D', '111.007', '21.5072', '');
INSERT INTO `t_order_region` VALUES ('2250', '440981', '440900', '高州市', '中国,广东省,茂名市,高州市', '高州', '中国,广东,茂名,高州', '3', '0668', '525200', 'Gaozhou', 'GZ', 'G', '110.855', '21.9206', '');
INSERT INTO `t_order_region` VALUES ('2251', '440982', '440900', '化州市', '中国,广东省,茂名市,化州市', '化州', '中国,广东,茂名,化州', '3', '0668', '525100', 'Huazhou', 'HZ', 'H', '110.639', '21.6639', '');
INSERT INTO `t_order_region` VALUES ('2252', '440983', '440900', '信宜市', '中国,广东省,茂名市,信宜市', '信宜', '中国,广东,茂名,信宜', '3', '0668', '525300', 'Xinyi', 'XY', 'X', '110.946', '22.3535', '');
INSERT INTO `t_order_region` VALUES ('2253', '441200', '440000', '肇庆市', '中国,广东省,肇庆市', '肇庆', '中国,广东,肇庆', '2', '0758', '526000', 'Zhaoqing', 'ZQ', 'Z', '112.473', '23.0515', '');
INSERT INTO `t_order_region` VALUES ('2254', '441202', '441200', '端州区', '中国,广东省,肇庆市,端州区', '端州', '中国,广东,肇庆,端州', '3', '0758', '526000', 'Duanzhou', 'DZ', 'D', '112.485', '23.0519', '');
INSERT INTO `t_order_region` VALUES ('2255', '441203', '441200', '鼎湖区', '中国,广东省,肇庆市,鼎湖区', '鼎湖', '中国,广东,肇庆,鼎湖', '3', '0758', '526000', 'Dinghu', 'DH', 'D', '112.566', '23.1585', '');
INSERT INTO `t_order_region` VALUES ('2256', '441204', '441200', '高要区', '中国,广东省,肇庆市,高要区', '高要', '中国,广东,肇庆,高要', '3', '0758', '526100', 'Gaoyao', 'GY', 'G', '112.458', '23.0258', '');
INSERT INTO `t_order_region` VALUES ('2257', '441223', '441200', '广宁县', '中国,广东省,肇庆市,广宁县', '广宁', '中国,广东,肇庆,广宁', '3', '0758', '526300', 'Guangning', 'GN', 'G', '112.441', '23.6346', '');
INSERT INTO `t_order_region` VALUES ('2258', '441224', '441200', '怀集县', '中国,广东省,肇庆市,怀集县', '怀集', '中国,广东,肇庆,怀集', '3', '0758', '526400', 'Huaiji', 'HJ', 'H', '112.184', '23.9092', '');
INSERT INTO `t_order_region` VALUES ('2259', '441225', '441200', '封开县', '中国,广东省,肇庆市,封开县', '封开', '中国,广东,肇庆,封开', '3', '0758', '526500', 'Fengkai', 'FK', 'F', '111.503', '23.4357', '');
INSERT INTO `t_order_region` VALUES ('2260', '441226', '441200', '德庆县', '中国,广东省,肇庆市,德庆县', '德庆', '中国,广东,肇庆,德庆', '3', '0758', '526600', 'Deqing', 'DQ', 'D', '111.786', '23.1437', '');
INSERT INTO `t_order_region` VALUES ('2261', '441284', '441200', '四会市', '中国,广东省,肇庆市,四会市', '四会', '中国,广东,肇庆,四会', '3', '0758', '526200', 'Sihui', 'SH', 'S', '112.734', '23.3269', '');
INSERT INTO `t_order_region` VALUES ('2262', '441300', '440000', '惠州市', '中国,广东省,惠州市', '惠州', '中国,广东,惠州', '2', '0752', '516000', 'Huizhou', 'HZ', 'H', '114.413', '23.0794', '');
INSERT INTO `t_order_region` VALUES ('2263', '441302', '441300', '惠城区', '中国,广东省,惠州市,惠城区', '惠城', '中国,广东,惠州,惠城', '3', '0752', '516000', 'Huicheng', 'HC', 'H', '114.383', '23.0838', '');
INSERT INTO `t_order_region` VALUES ('2264', '441303', '441300', '惠阳区', '中国,广东省,惠州市,惠阳区', '惠阳', '中国,广东,惠州,惠阳', '3', '0752', '516200', 'Huiyang', 'HY', 'H', '114.456', '22.7885', '');
INSERT INTO `t_order_region` VALUES ('2265', '441322', '441300', '博罗县', '中国,广东省,惠州市,博罗县', '博罗', '中国,广东,惠州,博罗', '3', '0752', '516100', 'Boluo', 'BL', 'B', '114.29', '23.1731', '');
INSERT INTO `t_order_region` VALUES ('2266', '441323', '441300', '惠东县', '中国,广东省,惠州市,惠东县', '惠东', '中国,广东,惠州,惠东', '3', '0752', '516300', 'Huidong', 'HD', 'H', '114.72', '22.9848', '');
INSERT INTO `t_order_region` VALUES ('2267', '441324', '441300', '龙门县', '中国,广东省,惠州市,龙门县', '龙门', '中国,广东,惠州,龙门', '3', '0752', '516800', 'Longmen', 'LM', 'L', '114.255', '23.7276', '');
INSERT INTO `t_order_region` VALUES ('2268', '441325', '441300', '大亚湾区', '中国,广东省,惠州市,大亚湾区', '大亚湾', '中国,广东,惠州,大亚湾', '3', '0752', '516000', 'Dayawan', 'DYW', 'D', '114.538', '22.7394', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('2269', '441400', '440000', '梅州市', '中国,广东省,梅州市', '梅州', '中国,广东,梅州', '2', '0753', '514000', 'Meizhou', 'MZ', 'M', '116.118', '24.2991', '');
INSERT INTO `t_order_region` VALUES ('2270', '441402', '441400', '梅江区', '中国,广东省,梅州市,梅江区', '梅江', '中国,广东,梅州,梅江', '3', '0753', '514000', 'Meijiang', 'MJ', 'M', '116.117', '24.3106', '');
INSERT INTO `t_order_region` VALUES ('2271', '441403', '441400', '梅县区', '中国,广东省,梅州市,梅县区', '梅县', '中国,广东,梅州,梅县', '3', '0753', '514787', 'Meixian', 'MX', 'M', '116.098', '24.2867', '');
INSERT INTO `t_order_region` VALUES ('2272', '441422', '441400', '大埔县', '中国,广东省,梅州市,大埔县', '大埔', '中国,广东,梅州,大埔', '3', '0753', '514200', 'Dabu', 'DB', 'D', '116.697', '24.3533', '');
INSERT INTO `t_order_region` VALUES ('2273', '441423', '441400', '丰顺县', '中国,广东省,梅州市,丰顺县', '丰顺', '中国,广东,梅州,丰顺', '3', '0753', '514300', 'Fengshun', 'FS', 'F', '116.182', '23.7409', '');
INSERT INTO `t_order_region` VALUES ('2274', '441424', '441400', '五华县', '中国,广东省,梅州市,五华县', '五华', '中国,广东,梅州,五华', '3', '0753', '514400', 'Wuhua', 'WH', 'W', '115.779', '23.9242', '');
INSERT INTO `t_order_region` VALUES ('2275', '441426', '441400', '平远县', '中国,广东省,梅州市,平远县', '平远', '中国,广东,梅州,平远', '3', '0753', '514600', 'Pingyuan', 'PY', 'P', '115.896', '24.5712', '');
INSERT INTO `t_order_region` VALUES ('2276', '441427', '441400', '蕉岭县', '中国,广东省,梅州市,蕉岭县', '蕉岭', '中国,广东,梅州,蕉岭', '3', '0753', '514100', 'Jiaoling', 'JL', 'J', '116.171', '24.6573', '');
INSERT INTO `t_order_region` VALUES ('2277', '441481', '441400', '兴宁市', '中国,广东省,梅州市,兴宁市', '兴宁', '中国,广东,梅州,兴宁', '3', '0753', '514500', 'Xingning', 'XN', 'X', '115.731', '24.14', '');
INSERT INTO `t_order_region` VALUES ('2278', '441500', '440000', '汕尾市', '中国,广东省,汕尾市', '汕尾', '中国,广东,汕尾', '2', '0660', '516600', 'Shanwei', 'SW', 'S', '115.364', '22.7745', '');
INSERT INTO `t_order_region` VALUES ('2279', '441502', '441500', '城区', '中国,广东省,汕尾市,城区', '城区', '中国,广东,汕尾,城区', '3', '0660', '516600', 'Chengqu', 'CQ', 'C', '115.365', '22.7789', '');
INSERT INTO `t_order_region` VALUES ('2280', '441521', '441500', '海丰县', '中国,广东省,汕尾市,海丰县', '海丰', '中国,广东,汕尾,海丰', '3', '0660', '516400', 'Haifeng', 'HF', 'H', '115.323', '22.9665', '');
INSERT INTO `t_order_region` VALUES ('2281', '441523', '441500', '陆河县', '中国,广东省,汕尾市,陆河县', '陆河', '中国,广东,汕尾,陆河', '3', '0660', '516700', 'Luhe', 'LH', 'L', '115.656', '23.3036', '');
INSERT INTO `t_order_region` VALUES ('2282', '441581', '441500', '陆丰市', '中国,广东省,汕尾市,陆丰市', '陆丰', '中国,广东,汕尾,陆丰', '3', '0660', '516500', 'Lufeng', 'LF', 'L', '115.648', '22.9433', '');
INSERT INTO `t_order_region` VALUES ('2283', '441600', '440000', '河源市', '中国,广东省,河源市', '河源', '中国,广东,河源', '2', '0762', '517000', 'Heyuan', 'HY', 'H', '114.698', '23.7463', '');
INSERT INTO `t_order_region` VALUES ('2284', '441602', '441600', '源城区', '中国,广东省,河源市,源城区', '源城', '中国,广东,河源,源城', '3', '0762', '517000', 'Yuancheng', 'YC', 'Y', '114.702', '23.7341', '');
INSERT INTO `t_order_region` VALUES ('2285', '441621', '441600', '紫金县', '中国,广东省,河源市,紫金县', '紫金', '中国,广东,河源,紫金', '3', '0762', '517400', 'Zijin', 'ZJ', 'Z', '115.184', '23.6387', '');
INSERT INTO `t_order_region` VALUES ('2286', '441622', '441600', '龙川县', '中国,广东省,河源市,龙川县', '龙川', '中国,广东,河源,龙川', '3', '0762', '517300', 'Longchuan', 'LC', 'L', '115.26', '24.1014', '');
INSERT INTO `t_order_region` VALUES ('2287', '441623', '441600', '连平县', '中国,广东省,河源市,连平县', '连平', '中国,广东,河源,连平', '3', '0762', '517100', 'Lianping', 'LP', 'L', '114.49', '24.3716', '');
INSERT INTO `t_order_region` VALUES ('2288', '441624', '441600', '和平县', '中国,广东省,河源市,和平县', '和平', '中国,广东,河源,和平', '3', '0762', '517200', 'Heping', 'HP', 'H', '114.938', '24.4432', '');
INSERT INTO `t_order_region` VALUES ('2289', '441625', '441600', '东源县', '中国,广东省,河源市,东源县', '东源', '中国,广东,河源,东源', '3', '0762', '517500', 'Dongyuan', 'DY', 'D', '114.746', '23.7883', '');
INSERT INTO `t_order_region` VALUES ('2290', '441700', '440000', '阳江市', '中国,广东省,阳江市', '阳江', '中国,广东,阳江', '2', '0662', '529500', 'Yangjiang', 'YJ', 'Y', '111.975', '21.8592', '');
INSERT INTO `t_order_region` VALUES ('2291', '441702', '441700', '江城区', '中国,广东省,阳江市,江城区', '江城', '中国,广东,阳江,江城', '3', '0662', '529500', 'Jiangcheng', 'JC', 'J', '111.955', '21.8619', '');
INSERT INTO `t_order_region` VALUES ('2292', '441704', '441700', '阳东区', '中国,广东省,阳江市,阳东区', '阳东', '中国,广东,阳江,阳东', '3', '0662', '529900', 'Yangdong', 'YD', 'Y', '112.015', '21.874', '');
INSERT INTO `t_order_region` VALUES ('2293', '441721', '441700', '阳西县', '中国,广东省,阳江市,阳西县', '阳西', '中国,广东,阳江,阳西', '3', '0662', '529800', 'Yangxi', 'YX', 'Y', '111.618', '21.7523', '');
INSERT INTO `t_order_region` VALUES ('2294', '441781', '441700', '阳春市', '中国,广东省,阳江市,阳春市', '阳春', '中国,广东,阳江,阳春', '3', '0662', '529600', 'Yangchun', 'YC', 'Y', '111.789', '22.1723', '');
INSERT INTO `t_order_region` VALUES ('2295', '441800', '440000', '清远市', '中国,广东省,清远市', '清远', '中国,广东,清远', '2', '0763', '511500', 'Qingyuan', 'QY', 'Q', '113.037', '23.7042', '');
INSERT INTO `t_order_region` VALUES ('2296', '441802', '441800', '清城区', '中国,广东省,清远市,清城区', '清城', '中国,广东,清远,清城', '3', '0763', '511500', 'Qingcheng', 'QC', 'Q', '113.063', '23.6978', '');
INSERT INTO `t_order_region` VALUES ('2297', '441803', '441800', '清新区', '中国,广东省,清远市,清新区', '清新', '中国,广东,清远,清新', '3', '0763', '511810', 'Qingxin', 'QX', 'Q', '113.015', '23.7369', '');
INSERT INTO `t_order_region` VALUES ('2298', '441821', '441800', '佛冈县', '中国,广东省,清远市,佛冈县', '佛冈', '中国,广东,清远,佛冈', '3', '0763', '511600', 'Fogang', 'FG', 'F', '113.533', '23.8723', '');
INSERT INTO `t_order_region` VALUES ('2299', '441823', '441800', '阳山县', '中国,广东省,清远市,阳山县', '阳山', '中国,广东,清远,阳山', '3', '0763', '513100', 'Yangshan', 'YS', 'Y', '112.641', '24.4652', '');
INSERT INTO `t_order_region` VALUES ('2300', '441825', '441800', '连山壮族瑶族自治县', '中国,广东省,清远市,连山壮族瑶族自治县', '连山', '中国,广东,清远,连山', '3', '0763', '513200', 'Lianshan', 'LS', 'L', '112.08', '24.5681', '');
INSERT INTO `t_order_region` VALUES ('2301', '441826', '441800', '连南瑶族自治县', '中国,广东省,清远市,连南瑶族自治县', '连南', '中国,广东,清远,连南', '3', '0763', '513300', 'Liannan', 'LN', 'L', '112.288', '24.7173', '');
INSERT INTO `t_order_region` VALUES ('2302', '441881', '441800', '英德市', '中国,广东省,清远市,英德市', '英德', '中国,广东,清远,英德', '3', '0763', '513000', 'Yingde', 'YD', 'Y', '113.415', '24.1857', '');
INSERT INTO `t_order_region` VALUES ('2303', '441882', '441800', '连州市', '中国,广东省,清远市,连州市', '连州', '中国,广东,清远,连州', '3', '0763', '513400', 'Lianzhou', 'LZ', 'L', '112.382', '24.7791', '');
INSERT INTO `t_order_region` VALUES ('2304', '441900', '440000', '东莞市', '中国,广东省,东莞市', '东莞', '中国,广东,东莞', '2', '0769', '523000', 'Dongguan', 'DG', 'D', '113.76', '23.0489', '');
INSERT INTO `t_order_region` VALUES ('2305', '441901', '441900', '莞城区', '中国,广东省,东莞市,莞城区', '莞城', '中国,广东,东莞,莞城', '3', '0769', '523128', 'Guancheng', 'GC', 'G', '113.751', '23.0534', '拓展');
INSERT INTO `t_order_region` VALUES ('2306', '441902', '441900', '南城区', '中国,广东省,东莞市,南城区', '南城', '中国,广东,东莞,南城', '3', '0769', '523617', 'Nancheng', 'NC', 'N', '113.752', '23.0202', '拓展');
INSERT INTO `t_order_region` VALUES ('2307', '441903', '441900', '东城区', '中国,广东省,东莞市,东城区', '东城', '中国,广东,东莞,东城', '3', '0769', '402560', 'Dongcheng', 'DC', 'D', '113.773', '22.9815', '拓展');
INSERT INTO `t_order_region` VALUES ('2308', '441904', '441900', '万江区', '中国,广东省,东莞市,万江区', '万江', '中国,广东,东莞,万江', '3', '0769', '523039', 'Wanjiang', 'WJ', 'W', '113.739', '23.0438', '拓展');
INSERT INTO `t_order_region` VALUES ('2309', '441905', '441900', '石碣镇', '中国,广东省,东莞市,石碣镇', '石碣', '中国,广东,东莞,石碣', '3', '0769', '523290', 'Shijie', 'SJ', 'S', '113.802', '23.099', '拓展');
INSERT INTO `t_order_region` VALUES ('2310', '441906', '441900', '石龙镇', '中国,广东省,东莞市,石龙镇', '石龙', '中国,广东,东莞,石龙', '3', '0769', '523326', 'Shilong', 'SL', 'S', '113.876', '23.1074', '拓展');
INSERT INTO `t_order_region` VALUES ('2311', '441907', '441900', '茶山镇', '中国,广东省,东莞市,茶山镇', '茶山', '中国,广东,东莞,茶山', '3', '0769', '523380', 'Chashan', 'CS', 'C', '113.884', '23.0624', '拓展');
INSERT INTO `t_order_region` VALUES ('2312', '441908', '441900', '石排镇', '中国,广东省,东莞市,石排镇', '石排', '中国,广东,东莞,石排', '3', '0769', '523346', 'Shipai', 'SP', 'S', '113.92', '23.0863', '拓展');
INSERT INTO `t_order_region` VALUES ('2313', '441909', '441900', '企石镇', '中国,广东省,东莞市,企石镇', '企石', '中国,广东,东莞,企石', '3', '0769', '523507', 'Qishi', 'QS', 'Q', '114.013', '23.066', '拓展');
INSERT INTO `t_order_region` VALUES ('2314', '441910', '441900', '横沥镇', '中国,广东省,东莞市,横沥镇', '横沥', '中国,广东,东莞,横沥', '3', '0769', '523471', 'Hengli', 'HL', 'H', '113.957', '23.0257', '拓展');
INSERT INTO `t_order_region` VALUES ('2315', '441911', '441900', '桥头镇', '中国,广东省,东莞市,桥头镇', '桥头', '中国,广东,东莞,桥头', '3', '0769', '523520', 'Qiaotou', 'QT', 'Q', '114.014', '22.9397', '拓展');
INSERT INTO `t_order_region` VALUES ('2316', '441912', '441900', '谢岗镇', '中国,广东省,东莞市,谢岗镇', '谢岗', '中国,广东,东莞,谢岗', '3', '0769', '523592', 'Xiegang', 'XG', 'X', '114.141', '22.9597', '拓展');
INSERT INTO `t_order_region` VALUES ('2317', '441913', '441900', '东坑镇', '中国,广东省,东莞市,东坑镇', '东坑', '中国,广东,东莞,东坑', '3', '0769', '523451', 'Dongkeng', 'DK', 'D', '113.94', '22.9928', '拓展');
INSERT INTO `t_order_region` VALUES ('2318', '441914', '441900', '常平镇', '中国,广东省,东莞市,常平镇', '常平', '中国,广东,东莞,常平', '3', '0769', '523560', 'Changping', 'CP', 'C', '114.03', '23.0161', '拓展');
INSERT INTO `t_order_region` VALUES ('2319', '441915', '441900', '寮步镇', '中国,广东省,东莞市,寮步镇', '寮步', '中国,广东,东莞,寮步', '3', '0769', '523411', 'Liaobu', 'LB', 'L', '113.885', '22.9917', '拓展');
INSERT INTO `t_order_region` VALUES ('2320', '441916', '441900', '大朗镇', '中国,广东省,东莞市,大朗镇', '大朗', '中国,广东,东莞,大朗', '3', '0769', '523770', 'Dalang', 'DL', 'D', '113.927', '22.9657', '拓展');
INSERT INTO `t_order_region` VALUES ('2321', '441917', '441900', '麻涌镇', '中国,广东省,东莞市,麻涌镇', '麻涌', '中国,广东,东莞,麻涌', '3', '0769', '523143', 'Machong', 'MC', 'M', '113.546', '23.0453', '拓展');
INSERT INTO `t_order_region` VALUES ('2322', '441918', '441900', '中堂镇', '中国,广东省,东莞市,中堂镇', '中堂', '中国,广东,东莞,中堂', '3', '0769', '523233', 'Zhongtang', 'ZT', 'Z', '113.654', '23.0902', '拓展');
INSERT INTO `t_order_region` VALUES ('2323', '441919', '441900', '高埗镇', '中国,广东省,东莞市,高埗镇', '高埗', '中国,广东,东莞,高埗', '3', '0769', '523282', 'Gaobu', 'GB', 'G', '113.736', '23.0684', '拓展');
INSERT INTO `t_order_region` VALUES ('2324', '441920', '441900', '樟木头镇', '中国,广东省,东莞市,樟木头镇', '樟木头', '中国,广东,东莞,樟木头', '3', '0769', '523619', 'Zhangmutou', 'ZMT', 'Z', '114.066', '22.9567', '拓展');
INSERT INTO `t_order_region` VALUES ('2325', '441921', '441900', '大岭山镇', '中国,广东省,东莞市,大岭山镇', '大岭山', '中国,广东,东莞,大岭山', '3', '0769', '523835', 'Dalingshan', 'DLS', 'D', '113.783', '22.8854', '拓展');
INSERT INTO `t_order_region` VALUES ('2326', '441922', '441900', '望牛墩镇', '中国,广东省,东莞市,望牛墩镇', '望牛墩', '中国,广东,东莞,望牛墩', '3', '0769', '523203', 'Wangniudun', 'WND', 'W', '113.659', '23.055', '拓展');
INSERT INTO `t_order_region` VALUES ('2327', '441923', '441900', '黄江镇', '中国,广东省,东莞市,黄江镇', '黄江', '中国,广东,东莞,黄江', '3', '0769', '523755', 'Huangjiang', 'HJ', 'H', '113.993', '22.8775', '拓展');
INSERT INTO `t_order_region` VALUES ('2328', '441924', '441900', '洪梅镇', '中国,广东省,东莞市,洪梅镇', '洪梅', '中国,广东,东莞,洪梅', '3', '0769', '523163', 'Hongmei', 'HM', 'H', '113.613', '22.9927', '拓展');
INSERT INTO `t_order_region` VALUES ('2329', '441925', '441900', '清溪镇', '中国,广东省,东莞市,清溪镇', '清溪', '中国,广东,东莞,清溪', '3', '0769', '523660', 'Qingxi', 'QX', 'Q', '114.156', '22.8445', '拓展');
INSERT INTO `t_order_region` VALUES ('2330', '441926', '441900', '沙田镇', '中国,广东省,东莞市,沙田镇', '沙田', '中国,广东,东莞,沙田', '3', '0769', '523988', 'Shatian', 'ST', 'S', '113.76', '23.0489', '拓展');
INSERT INTO `t_order_region` VALUES ('2331', '441927', '441900', '道滘镇', '中国,广东省,东莞市,道滘镇', '道滘', '中国,广东,东莞,道滘', '3', '0769', '523171', 'Daojiao', 'DJ', 'D', '113.76', '23.0489', '拓展');
INSERT INTO `t_order_region` VALUES ('2332', '441928', '441900', '塘厦镇', '中国,广东省,东莞市,塘厦镇', '塘厦', '中国,广东,东莞,塘厦', '3', '0769', '523713', 'Tangxia', 'TX', 'T', '114.108', '22.8229', '拓展');
INSERT INTO `t_order_region` VALUES ('2333', '441929', '441900', '虎门镇', '中国,广东省,东莞市,虎门镇', '虎门', '中国,广东,东莞,虎门', '3', '0769', '523932', 'Humen', 'HM', 'H', '113.711', '22.8262', '拓展');
INSERT INTO `t_order_region` VALUES ('2334', '441930', '441900', '厚街镇', '中国,广东省,东莞市,厚街镇', '厚街', '中国,广东,东莞,厚街', '3', '0769', '523960', 'Houjie', 'HJ', 'H', '113.673', '22.9408', '拓展');
INSERT INTO `t_order_region` VALUES ('2335', '441931', '441900', '凤岗镇', '中国,广东省,东莞市,凤岗镇', '凤岗', '中国,广东,东莞,凤岗', '3', '0769', '523690', 'Fenggang', 'FG', 'F', '114.141', '22.7446', '拓展');
INSERT INTO `t_order_region` VALUES ('2336', '441932', '441900', '长安镇', '中国,广东省,东莞市,长安镇', '长安', '中国,广东,东莞,长安', '3', '0769', '523850', 'Chang\'an', 'CA', 'C', '113.804', '22.8166', '拓展');
INSERT INTO `t_order_region` VALUES ('2337', '441933', '441900', '松山湖高新区', '中国,广东省,东莞市,松山湖高新区', '松山湖高新区', '中国,广东,东莞,松山湖高新区', '3', '0769', '523808', 'Songshanhu', 'SSH', 'S', '113.883', '22.9275', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2338', '442000', '440000', '中山市', '中国,广东省,中山市', '中山', '中国,广东,中山', '2', '0760', '528400', 'Zhongshan', 'ZS', 'Z', '113.382', '22.5211', '');
INSERT INTO `t_order_region` VALUES ('2339', '442001', '442000', '石岐区', '中国,广东省,中山市,石岐区', '石岐', '中国,广东,中山,石岐', '3', '0760', '528400', 'Shiqi', 'SQ', 'S', '113.379', '22.5252', '拓展');
INSERT INTO `t_order_region` VALUES ('2340', '442002', '442000', '东区', '中国,广东省,中山市,东区', '东区', '中国,广东,中山,东区', '3', '0760', '528403', 'Dongqu', 'DQ', 'D', '113.417', '22.5099', '拓展');
INSERT INTO `t_order_region` VALUES ('2341', '442003', '442000', '西区', '中国,广东省,中山市,西区', '东区', '中国,广东,中山,西区', '3', '0760', '528400', 'Xiqu', 'XQ', 'X', '113.342', '22.5538', '拓展');
INSERT INTO `t_order_region` VALUES ('2342', '442004', '442000', '南区', '中国,广东省,中山市,南区', '南区', '中国,广东,中山,南区', '3', '0760', '528400', 'Nanqu', 'NQ', 'N', '113.356', '22.4866', '拓展');
INSERT INTO `t_order_region` VALUES ('2343', '442005', '442000', '五桂山区', '中国,广东省,中山市,五桂山区', '五桂山', '中国,广东,中山,五桂山', '3', '0760', '528458', 'Wuguishan', 'WGS', 'W', '113.411', '22.5197', '拓展');
INSERT INTO `t_order_region` VALUES ('2344', '442006', '442000', '火炬开发区', '中国,广东省,中山市,火炬开发区', '火炬', '中国,广东,中山,火炬', '3', '0760', '528437', 'Huoju', 'HJ', 'H', '113.481', '22.5661', '拓展');
INSERT INTO `t_order_region` VALUES ('2345', '442007', '442000', '黄圃镇', '中国,广东省,中山市,黄圃镇', '黄圃', '中国,广东,中山,黄圃', '3', '0760', '528429', 'Huangpu', 'HP', 'H', '113.342', '22.7151', '拓展');
INSERT INTO `t_order_region` VALUES ('2346', '442008', '442000', '南头镇', '中国,广东省,中山市,南头镇', '南头', '中国,广东,中山,南头', '3', '0760', '528421', 'Nantou', 'NT', 'N', '113.296', '22.7139', '拓展');
INSERT INTO `t_order_region` VALUES ('2347', '442009', '442000', '东凤镇', '中国,广东省,中山市,东凤镇', '东凤', '中国,广东,中山,东凤', '3', '0760', '528425', 'Dongfeng', 'DF', 'D', '113.261', '22.6877', '拓展');
INSERT INTO `t_order_region` VALUES ('2348', '442010', '442000', '阜沙镇', '中国,广东省,中山市,阜沙镇', '阜沙', '中国,广东,中山,阜沙', '3', '0760', '528434', 'Fusha', 'FS', 'F', '113.353', '22.6664', '拓展');
INSERT INTO `t_order_region` VALUES ('2349', '442011', '442000', '小榄镇', '中国,广东省,中山市,小榄镇', '小榄', '中国,广东,中山,小榄', '3', '0760', '528415', 'Xiaolan', 'XL', 'X', '113.244', '22.667', '拓展');
INSERT INTO `t_order_region` VALUES ('2350', '442012', '442000', '东升镇', '中国,广东省,中山市,东升镇', '东升', '中国,广东,中山,东升', '3', '0760', '528400', 'Dongsheng', 'DS', 'D', '113.296', '22.614', '拓展');
INSERT INTO `t_order_region` VALUES ('2351', '442013', '442000', '古镇镇', '中国,广东省,中山市,古镇镇', '古镇', '中国,广东,中山,古镇', '3', '0760', '528422', 'Guzhen', 'GZ', 'G', '113.18', '22.611', '拓展');
INSERT INTO `t_order_region` VALUES ('2352', '442014', '442000', '横栏镇', '中国,广东省,中山市,横栏镇', '横栏', '中国,广东,中山,横栏', '3', '0760', '528478', 'Henglan', 'HL', 'H', '113.266', '22.5232', '拓展');
INSERT INTO `t_order_region` VALUES ('2353', '442015', '442000', '三角镇', '中国,广东省,中山市,三角镇', '三角', '中国,广东,中山,三角', '3', '0760', '528422', 'Sanjiao', 'SJ', 'S', '113.424', '22.677', '拓展');
INSERT INTO `t_order_region` VALUES ('2354', '442016', '442000', '民众镇', '中国,广东省,中山市,民众镇', '民众', '中国,广东,中山,民众', '3', '0760', '528441', 'Minzhong', 'MZ', 'M', '113.486', '22.6235', '拓展');
INSERT INTO `t_order_region` VALUES ('2355', '442017', '442000', '南朗镇', '中国,广东省,中山市,南朗镇', '南朗', '中国,广东,中山,南朗', '3', '0760', '528454', 'Nanlang', 'NL', 'N', '113.534', '22.4924', '拓展');
INSERT INTO `t_order_region` VALUES ('2356', '442018', '442000', '港口镇', '中国,广东省,中山市,港口镇', '港口', '中国,广东,中山,港口', '3', '0760', '528447', 'Gangkou', 'GK', 'G', '113.382', '22.5211', '拓展');
INSERT INTO `t_order_region` VALUES ('2357', '442019', '442000', '大涌镇', '中国,广东省,中山市,大涌镇', '大涌', '中国,广东,中山,大涌', '3', '0760', '528476', 'Dayong', 'DY', 'D', '113.292', '22.4677', '拓展');
INSERT INTO `t_order_region` VALUES ('2358', '442020', '442000', '沙溪镇', '中国,广东省,中山市,沙溪镇', '沙溪', '中国,广东,中山,沙溪', '3', '0760', '528471', 'Shaxi', 'SX', 'S', '113.328', '22.5263', '拓展');
INSERT INTO `t_order_region` VALUES ('2359', '442021', '442000', '三乡镇', '中国,广东省,中山市,三乡镇', '三乡', '中国,广东,中山,三乡', '3', '0760', '528463', 'Sanxiang', 'SX', 'S', '113.433', '22.3525', '拓展');
INSERT INTO `t_order_region` VALUES ('2360', '442022', '442000', '板芙镇', '中国,广东省,中山市,板芙镇', '板芙', '中国,广东,中山,板芙', '3', '0760', '528459', 'Banfu', 'BF', 'B', '113.32', '22.4157', '拓展');
INSERT INTO `t_order_region` VALUES ('2361', '442023', '442000', '神湾镇', '中国,广东省,中山市,神湾镇', '神湾', '中国,广东,中山,神湾', '3', '0760', '528462', 'Shenwan', 'SW', 'S', '113.359', '22.3125', '拓展');
INSERT INTO `t_order_region` VALUES ('2362', '442024', '442000', '坦洲镇', '中国,广东省,中山市,坦洲镇', '坦洲', '中国,广东,中山,坦洲', '3', '0760', '528467', 'Tanzhou', 'TZ', 'T', '113.486', '22.2613', '拓展');
INSERT INTO `t_order_region` VALUES ('2363', '445100', '440000', '潮州市', '中国,广东省,潮州市', '潮州', '中国,广东,潮州', '2', '0768', '521000', 'Chaozhou', 'CZ', 'C', '116.632', '23.6617', '');
INSERT INTO `t_order_region` VALUES ('2364', '445102', '445100', '湘桥区', '中国,广东省,潮州市,湘桥区', '湘桥', '中国,广东,潮州,湘桥', '3', '0768', '521000', 'Xiangqiao', 'XQ', 'X', '116.628', '23.6745', '');
INSERT INTO `t_order_region` VALUES ('2365', '445103', '445100', '潮安区', '中国,广东省,潮州市,潮安区', '潮安', '中国,广东,潮州,潮安', '3', '0768', '515638', 'Chao\'an', 'CA', 'C', '116.593', '23.6437', '');
INSERT INTO `t_order_region` VALUES ('2366', '445122', '445100', '饶平县', '中国,广东省,潮州市,饶平县', '饶平', '中国,广东,潮州,饶平', '3', '0768', '515700', 'Raoping', 'RP', 'R', '117.007', '23.6699', '');
INSERT INTO `t_order_region` VALUES ('2367', '445200', '440000', '揭阳市', '中国,广东省,揭阳市', '揭阳', '中国,广东,揭阳', '2', '0663', '522000', 'Jieyang', 'JY', 'J', '116.356', '23.5438', '');
INSERT INTO `t_order_region` VALUES ('2368', '445202', '445200', '榕城区', '中国,广东省,揭阳市,榕城区', '榕城', '中国,广东,揭阳,榕城', '3', '0663', '522000', 'Rongcheng', 'RC', 'R', '116.367', '23.5251', '');
INSERT INTO `t_order_region` VALUES ('2369', '445203', '445200', '揭东区', '中国,广东省,揭阳市,揭东区', '揭东', '中国,广东,揭阳,揭东', '3', '0663', '515500', 'Jiedong', 'JD', 'J', '116.413', '23.5699', '');
INSERT INTO `t_order_region` VALUES ('2370', '445222', '445200', '揭西县', '中国,广东省,揭阳市,揭西县', '揭西', '中国,广东,揭阳,揭西', '3', '0663', '515400', 'Jiexi', 'JX', 'J', '115.839', '23.4271', '');
INSERT INTO `t_order_region` VALUES ('2371', '445224', '445200', '惠来县', '中国,广东省,揭阳市,惠来县', '惠来', '中国,广东,揭阳,惠来', '3', '0663', '515200', 'Huilai', 'HL', 'H', '116.296', '23.0329', '');
INSERT INTO `t_order_region` VALUES ('2372', '445281', '445200', '普宁市', '中国,广东省,揭阳市,普宁市', '普宁', '中国,广东,揭阳,普宁', '3', '0663', '515300', 'Puning', 'PN', 'P', '116.166', '23.2973', '');
INSERT INTO `t_order_region` VALUES ('2373', '445300', '440000', '云浮市', '中国,广东省,云浮市', '云浮', '中国,广东,云浮', '2', '0766', '527300', 'Yunfu', 'YF', 'Y', '112.044', '22.9298', '');
INSERT INTO `t_order_region` VALUES ('2374', '445302', '445300', '云城区', '中国,广东省,云浮市,云城区', '云城', '中国,广东,云浮,云城', '3', '0766', '527300', 'Yuncheng', 'YC', 'Y', '112.039', '22.93', '');
INSERT INTO `t_order_region` VALUES ('2375', '445303', '445300', '云安区', '中国,广东省,云浮市,云安区', '云安', '中国,广东,云浮,云安', '3', '0766', '527500', 'Yun\'an', 'YA', 'Y', '112.009', '23.0778', '');
INSERT INTO `t_order_region` VALUES ('2376', '445321', '445300', '新兴县', '中国,广东省,云浮市,新兴县', '新兴', '中国,广东,云浮,新兴', '3', '0766', '527400', 'Xinxing', 'XX', 'X', '112.23', '22.6973', '');
INSERT INTO `t_order_region` VALUES ('2377', '445322', '445300', '郁南县', '中国,广东省,云浮市,郁南县', '郁南', '中国,广东,云浮,郁南', '3', '0766', '527100', 'Yunan', 'YN', 'Y', '111.534', '23.2331', '');
INSERT INTO `t_order_region` VALUES ('2378', '445381', '445300', '罗定市', '中国,广东省,云浮市,罗定市', '罗定', '中国,广东,云浮,罗定', '3', '0766', '527200', 'Luoding', 'LD', 'L', '111.57', '22.7697', '');
INSERT INTO `t_order_region` VALUES ('2379', '450000', '100000', '广西壮族自治区', '中国,广西壮族自治区', '广西', '中国,广西', '1', '', '', 'Guangxi', 'GX', 'G', '108.32', '22.824', '');
INSERT INTO `t_order_region` VALUES ('2380', '450100', '450000', '南宁市', '中国,广西壮族自治区,南宁市', '南宁', '中国,广西,南宁', '2', '0771', '530000', 'Nanning', 'NN', 'N', '108.32', '22.824', '');
INSERT INTO `t_order_region` VALUES ('2381', '450102', '450100', '兴宁区', '中国,广西壮族自治区,南宁市,兴宁区', '兴宁', '中国,广西,南宁,兴宁', '3', '0771', '530000', 'Xingning', 'XN', 'X', '108.367', '22.8535', '');
INSERT INTO `t_order_region` VALUES ('2382', '450103', '450100', '青秀区', '中国,广西壮族自治区,南宁市,青秀区', '青秀', '中国,广西,南宁,青秀', '3', '0771', '530000', 'Qingxiu', 'QX', 'Q', '108.495', '22.7851', '');
INSERT INTO `t_order_region` VALUES ('2383', '450105', '450100', '江南区', '中国,广西壮族自治区,南宁市,江南区', '江南', '中国,广西,南宁,江南', '3', '0771', '530000', 'Jiangnan', 'JN', 'J', '108.273', '22.7813', '');
INSERT INTO `t_order_region` VALUES ('2384', '450107', '450100', '西乡塘区', '中国,广西壮族自治区,南宁市,西乡塘区', '西乡塘', '中国,广西,南宁,西乡塘', '3', '0771', '530000', 'Xixiangtang', 'XXT', 'X', '108.313', '22.8339', '');
INSERT INTO `t_order_region` VALUES ('2385', '450108', '450100', '良庆区', '中国,广西壮族自治区,南宁市,良庆区', '良庆', '中国,广西,南宁,良庆', '3', '0771', '530200', 'Liangqing', 'LQ', 'L', '108.413', '22.7491', '');
INSERT INTO `t_order_region` VALUES ('2386', '450109', '450100', '邕宁区', '中国,广西壮族自治区,南宁市,邕宁区', '邕宁', '中国,广西,南宁,邕宁', '3', '0771', '530200', 'Yongning', 'YN', 'Y', '108.487', '22.7563', '');
INSERT INTO `t_order_region` VALUES ('2387', '450110', '450100', '武鸣区', '中国,广西壮族自治区,南宁市,武鸣区', '武鸣', '中国,广西,南宁,武鸣', '3', '0771', '530100', 'Wuming', 'WM', 'W', '108.277', '23.1564', '');
INSERT INTO `t_order_region` VALUES ('2388', '450123', '450100', '隆安县', '中国,广西壮族自治区,南宁市,隆安县', '隆安', '中国,广西,南宁,隆安', '3', '0771', '532700', 'Long\'an', 'LA', 'L', '107.692', '23.1734', '');
INSERT INTO `t_order_region` VALUES ('2389', '450124', '450100', '马山县', '中国,广西壮族自治区,南宁市,马山县', '马山', '中国,广西,南宁,马山', '3', '0771', '530600', 'Mashan', 'MS', 'M', '108.177', '23.7093', '');
INSERT INTO `t_order_region` VALUES ('2390', '450125', '450100', '上林县', '中国,广西壮族自治区,南宁市,上林县', '上林', '中国,广西,南宁,上林', '3', '0771', '530500', 'Shanglin', 'SL', 'S', '108.605', '23.432', '');
INSERT INTO `t_order_region` VALUES ('2391', '450126', '450100', '宾阳县', '中国,广西壮族自治区,南宁市,宾阳县', '宾阳', '中国,广西,南宁,宾阳', '3', '0771', '530400', 'Binyang', 'BY', 'B', '108.812', '23.2196', '');
INSERT INTO `t_order_region` VALUES ('2392', '450127', '450100', '横县', '中国,广西壮族自治区,南宁市,横县', '横县', '中国,广西,南宁,横县', '3', '0771', '530300', 'Hengxian', 'HX', 'H', '109.266', '22.6845', '');
INSERT INTO `t_order_region` VALUES ('2393', '450128', '450100', '埌东新区', '中国,广西壮族自治区,南宁市,埌东新区', '埌东', '中国,广西,南宁,埌东', '3', '0771', '530000', 'Langdong', 'LD', 'L', '108.419', '22.813', '新区');
INSERT INTO `t_order_region` VALUES ('2394', '450200', '450000', '柳州市', '中国,广西壮族自治区,柳州市', '柳州', '中国,广西,柳州', '2', '0772', '545000', 'Liuzhou', 'LZ', 'L', '109.412', '24.3146', '');
INSERT INTO `t_order_region` VALUES ('2395', '450202', '450200', '城中区', '中国,广西壮族自治区,柳州市,城中区', '城中', '中国,广西,柳州,城中', '3', '0772', '545000', 'Chengzhong', 'CZ', 'C', '109.411', '24.3154', '');
INSERT INTO `t_order_region` VALUES ('2396', '450203', '450200', '鱼峰区', '中国,广西壮族自治区,柳州市,鱼峰区', '鱼峰', '中国,广西,柳州,鱼峰', '3', '0772', '545000', 'Yufeng', 'YF', 'Y', '109.453', '24.3187', '');
INSERT INTO `t_order_region` VALUES ('2397', '450204', '450200', '柳南区', '中国,广西壮族自治区,柳州市,柳南区', '柳南', '中国,广西,柳州,柳南', '3', '0772', '545000', 'Liunan', 'LN', 'L', '109.385', '24.336', '');
INSERT INTO `t_order_region` VALUES ('2398', '450205', '450200', '柳北区', '中国,广西壮族自治区,柳州市,柳北区', '柳北', '中国,广西,柳州,柳北', '3', '0772', '545000', 'Liubei', 'LB', 'L', '109.402', '24.3627', '');
INSERT INTO `t_order_region` VALUES ('2399', '450206', '450200', '柳江区', '中国,广西壮族自治区,柳州市,柳江区', '柳江', '中国,广西,柳州,柳江', '3', '0772', '545100', 'Liujiang', 'LJ', 'L', '109.333', '24.256', '');
INSERT INTO `t_order_region` VALUES ('2400', '450222', '450200', '柳城县', '中国,广西壮族自治区,柳州市,柳城县', '柳城', '中国,广西,柳州,柳城', '3', '0772', '545200', 'Liucheng', 'LC', 'L', '109.239', '24.6495', '');
INSERT INTO `t_order_region` VALUES ('2401', '450223', '450200', '鹿寨县', '中国,广西壮族自治区,柳州市,鹿寨县', '鹿寨', '中国,广西,柳州,鹿寨', '3', '0772', '545600', 'Luzhai', 'LZ', 'L', '109.752', '24.4731', '');
INSERT INTO `t_order_region` VALUES ('2402', '450224', '450200', '融安县', '中国,广西壮族自治区,柳州市,融安县', '融安', '中国,广西,柳州,融安', '3', '0772', '545400', 'Rong\'an', 'RA', 'R', '109.398', '25.2246', '');
INSERT INTO `t_order_region` VALUES ('2403', '450225', '450200', '融水苗族自治县', '中国,广西壮族自治区,柳州市,融水苗族自治县', '融水', '中国,广西,柳州,融水', '3', '0772', '545300', 'Rongshui', 'RS', 'R', '109.256', '25.0663', '');
INSERT INTO `t_order_region` VALUES ('2404', '450226', '450200', '三江侗族自治县', '中国,广西壮族自治区,柳州市,三江侗族自治县', '三江', '中国,广西,柳州,三江', '3', '0772', '545500', 'Sanjiang', 'SJ', 'S', '109.604', '25.7843', '');
INSERT INTO `t_order_region` VALUES ('2405', '450227', '450200', '柳东新区', '中国,广西壮族自治区,柳州市,柳东新区', '柳东', '中国,广西,柳州,柳东', '3', '0772', '545000', 'Liudong', 'LD', 'L', '109.437', '24.3292', '新区');
INSERT INTO `t_order_region` VALUES ('2406', '450300', '450000', '桂林市', '中国,广西壮族自治区,桂林市', '桂林', '中国,广西,桂林', '2', '0773', '541000', 'Guilin', 'GL', 'G', '110.299', '25.2742', '');
INSERT INTO `t_order_region` VALUES ('2407', '450302', '450300', '秀峰区', '中国,广西壮族自治区,桂林市,秀峰区', '秀峰', '中国,广西,桂林,秀峰', '3', '0773', '541000', 'Xiufeng', 'XF', 'X', '110.289', '25.2825', '');
INSERT INTO `t_order_region` VALUES ('2408', '450303', '450300', '叠彩区', '中国,广西壮族自治区,桂林市,叠彩区', '叠彩', '中国,广西,桂林,叠彩', '3', '0773', '541000', 'Diecai', 'DC', 'D', '110.302', '25.3138', '');
INSERT INTO `t_order_region` VALUES ('2409', '450304', '450300', '象山区', '中国,广西壮族自治区,桂林市,象山区', '象山', '中国,广西,桂林,象山', '3', '0773', '541000', 'Xiangshan', 'XS', 'X', '110.281', '25.2617', '');
INSERT INTO `t_order_region` VALUES ('2410', '450305', '450300', '七星区', '中国,广西壮族自治区,桂林市,七星区', '七星', '中国,广西,桂林,七星', '3', '0773', '541000', 'Qixing', 'QX', 'Q', '110.318', '25.2525', '');
INSERT INTO `t_order_region` VALUES ('2411', '450311', '450300', '雁山区', '中国,广西壮族自治区,桂林市,雁山区', '雁山', '中国,广西,桂林,雁山', '3', '0773', '541000', 'Yanshan', 'YS', 'Y', '110.309', '25.0604', '');
INSERT INTO `t_order_region` VALUES ('2412', '450312', '450300', '临桂区', '中国,广西壮族自治区,桂林市,临桂区', '临桂', '中国,广西,桂林,临桂', '3', '0773', '541100', 'Lingui', 'LG', 'L', '110.205', '25.2463', '');
INSERT INTO `t_order_region` VALUES ('2413', '450321', '450300', '阳朔县', '中国,广西壮族自治区,桂林市,阳朔县', '阳朔', '中国,广西,桂林,阳朔', '3', '0773', '541900', 'Yangshuo', 'YS', 'Y', '110.495', '24.7758', '');
INSERT INTO `t_order_region` VALUES ('2414', '450323', '450300', '灵川县', '中国,广西壮族自治区,桂林市,灵川县', '灵川', '中国,广西,桂林,灵川', '3', '0773', '541200', 'Lingchuan', 'LC', 'L', '110.329', '25.4129', '');
INSERT INTO `t_order_region` VALUES ('2415', '450324', '450300', '全州县', '中国,广西壮族自治区,桂林市,全州县', '全州', '中国,广西,桂林,全州', '3', '0773', '541500', 'Quanzhou', 'QZ', 'Q', '111.072', '25.928', '');
INSERT INTO `t_order_region` VALUES ('2416', '450325', '450300', '兴安县', '中国,广西壮族自治区,桂林市,兴安县', '兴安', '中国,广西,桂林,兴安', '3', '0773', '541300', 'Xing\'an', 'XA', 'X', '110.671', '25.6117', '');
INSERT INTO `t_order_region` VALUES ('2417', '450326', '450300', '永福县', '中国,广西壮族自治区,桂林市,永福县', '永福', '中国,广西,桂林,永福', '3', '0773', '541800', 'Yongfu', 'YF', 'Y', '109.983', '24.98', '');
INSERT INTO `t_order_region` VALUES ('2418', '450327', '450300', '灌阳县', '中国,广西壮族自治区,桂林市,灌阳县', '灌阳', '中国,广西,桂林,灌阳', '3', '0773', '541600', 'Guanyang', 'GY', 'G', '111.16', '25.488', '');
INSERT INTO `t_order_region` VALUES ('2419', '450328', '450300', '龙胜各族自治县', '中国,广西壮族自治区,桂林市,龙胜各族自治县', '龙胜', '中国,广西,桂林,龙胜', '3', '0773', '541700', 'Longsheng', 'LS', 'L', '110.012', '25.7961', '');
INSERT INTO `t_order_region` VALUES ('2420', '450329', '450300', '资源县', '中国,广西壮族自治区,桂林市,资源县', '资源', '中国,广西,桂林,资源', '3', '0773', '541400', 'Ziyuan', 'ZY', 'Z', '110.653', '26.0424', '');
INSERT INTO `t_order_region` VALUES ('2421', '450330', '450300', '平乐县', '中国,广西壮族自治区,桂林市,平乐县', '平乐', '中国,广西,桂林,平乐', '3', '0773', '542400', 'Pingle', 'PL', 'P', '110.642', '24.6324', '');
INSERT INTO `t_order_region` VALUES ('2422', '450331', '450300', '荔浦县', '中国,广西壮族自治区,桂林市,荔浦县', '荔浦', '中国,广西,桂林,荔浦', '3', '0773', '546600', 'Lipu', 'LP', 'L', '110.397', '24.4959', '');
INSERT INTO `t_order_region` VALUES ('2423', '450332', '450300', '恭城瑶族自治县', '中国,广西壮族自治区,桂林市,恭城瑶族自治县', '恭城', '中国,广西,桂林,恭城', '3', '0773', '542500', 'Gongcheng', 'GC', 'G', '110.83', '24.8329', '');
INSERT INTO `t_order_region` VALUES ('2424', '450400', '450000', '梧州市', '中国,广西壮族自治区,梧州市', '梧州', '中国,广西,梧州', '2', '0774', '543000', 'Wuzhou', 'WZ', 'W', '111.316', '23.4723', '');
INSERT INTO `t_order_region` VALUES ('2425', '450403', '450400', '万秀区', '中国,广西壮族自治区,梧州市,万秀区', '万秀', '中国,广西,梧州,万秀', '3', '0774', '543000', 'Wanxiu', 'WX', 'W', '111.321', '23.473', '');
INSERT INTO `t_order_region` VALUES ('2426', '450405', '450400', '长洲区', '中国,广西壮族自治区,梧州市,长洲区', '长洲', '中国,广西,梧州,长洲', '3', '0774', '543000', 'Changzhou', 'CZ', 'C', '111.275', '23.4857', '');
INSERT INTO `t_order_region` VALUES ('2427', '450406', '450400', '龙圩区', '中国,广西壮族自治区,梧州市,龙圩区', '龙圩', '中国,广西,梧州,龙圩', '3', '0774', '543002', 'Longxu', 'LX', 'L', '111.316', '23.4723', '');
INSERT INTO `t_order_region` VALUES ('2428', '450421', '450400', '苍梧县', '中国,广西壮族自治区,梧州市,苍梧县', '苍梧', '中国,广西,梧州,苍梧', '3', '0774', '543100', 'Cangwu', 'CW', 'C', '111.245', '23.4205', '');
INSERT INTO `t_order_region` VALUES ('2429', '450422', '450400', '藤县', '中国,广西壮族自治区,梧州市,藤县', '藤县', '中国,广西,梧州,藤县', '3', '0774', '543300', 'Tengxian', 'TX', 'T', '110.914', '23.3761', '');
INSERT INTO `t_order_region` VALUES ('2430', '450423', '450400', '蒙山县', '中国,广西壮族自治区,梧州市,蒙山县', '蒙山', '中国,广西,梧州,蒙山', '3', '0774', '546700', 'Mengshan', 'MS', 'M', '110.522', '24.2017', '');
INSERT INTO `t_order_region` VALUES ('2431', '450481', '450400', '岑溪市', '中国,广西壮族自治区,梧州市,岑溪市', '岑溪', '中国,广西,梧州,岑溪', '3', '0774', '543200', 'Cenxi', 'CX', 'C', '110.996', '22.9191', '');
INSERT INTO `t_order_region` VALUES ('2432', '450500', '450000', '北海市', '中国,广西壮族自治区,北海市', '北海', '中国,广西,北海', '2', '0779', '536000', 'Beihai', 'BH', 'B', '109.119', '21.4733', '');
INSERT INTO `t_order_region` VALUES ('2433', '450502', '450500', '海城区', '中国,广西壮族自治区,北海市,海城区', '海城', '中国,广西,北海,海城', '3', '0779', '536000', 'Haicheng', 'HC', 'H', '109.117', '21.475', '');
INSERT INTO `t_order_region` VALUES ('2434', '450503', '450500', '银海区', '中国,广西壮族自治区,北海市,银海区', '银海', '中国,广西,北海,银海', '3', '0779', '536000', 'Yinhai', 'YH', 'Y', '109.13', '21.4783', '');
INSERT INTO `t_order_region` VALUES ('2435', '450512', '450500', '铁山港区', '中国,广西壮族自治区,北海市,铁山港区', '铁山港', '中国,广西,北海,铁山港', '3', '0779', '536000', 'Tieshangang', 'TSG', 'T', '109.456', '21.5966', '');
INSERT INTO `t_order_region` VALUES ('2436', '450521', '450500', '合浦县', '中国,广西壮族自治区,北海市,合浦县', '合浦', '中国,广西,北海,合浦', '3', '0779', '536100', 'Hepu', 'HP', 'H', '109.201', '21.666', '');
INSERT INTO `t_order_region` VALUES ('2437', '450600', '450000', '防城港市', '中国,广西壮族自治区,防城港市', '防城港', '中国,广西,防城港', '2', '0770', '538000', 'Fangchenggang', 'FCG', 'F', '108.345', '21.6146', '');
INSERT INTO `t_order_region` VALUES ('2438', '450602', '450600', '港口区', '中国,广西壮族自治区,防城港市,港口区', '港口', '中国,广西,防城港,港口', '3', '0770', '538000', 'Gangkou', 'GK', 'G', '108.38', '21.6434', '');
INSERT INTO `t_order_region` VALUES ('2439', '450603', '450600', '防城区', '中国,广西壮族自治区,防城港市,防城区', '防城', '中国,广西,防城港,防城', '3', '0770', '538000', 'Fangcheng', 'FC', 'F', '108.357', '21.7646', '');
INSERT INTO `t_order_region` VALUES ('2440', '450621', '450600', '上思县', '中国,广西壮族自治区,防城港市,上思县', '上思', '中国,广西,防城港,上思', '3', '0770', '535500', 'Shangsi', 'SS', 'S', '107.982', '22.1496', '');
INSERT INTO `t_order_region` VALUES ('2441', '450681', '450600', '东兴市', '中国,广西壮族自治区,防城港市,东兴市', '东兴', '中国,广西,防城港,东兴', '3', '0770', '538100', 'Dongxing', 'DX', 'D', '107.972', '21.5471', '');
INSERT INTO `t_order_region` VALUES ('2442', '450700', '450000', '钦州市', '中国,广西壮族自治区,钦州市', '钦州', '中国,广西,钦州', '2', '0777', '535000', 'Qinzhou', 'QZ', 'Q', '108.624', '21.9671', '');
INSERT INTO `t_order_region` VALUES ('2443', '450702', '450700', '钦南区', '中国,广西壮族自治区,钦州市,钦南区', '钦南', '中国,广西,钦州,钦南', '3', '0777', '535000', 'Qinnan', 'QN', 'Q', '108.618', '21.9514', '');
INSERT INTO `t_order_region` VALUES ('2444', '450703', '450700', '钦北区', '中国,广西壮族自治区,钦州市,钦北区', '钦北', '中国,广西,钦州,钦北', '3', '0777', '535000', 'Qinbei', 'QB', 'Q', '108.63', '21.9513', '');
INSERT INTO `t_order_region` VALUES ('2445', '450721', '450700', '灵山县', '中国,广西壮族自治区,钦州市,灵山县', '灵山', '中国,广西,钦州,灵山', '3', '0777', '535400', 'Lingshan', 'LS', 'L', '109.292', '22.4165', '');
INSERT INTO `t_order_region` VALUES ('2446', '450722', '450700', '浦北县', '中国,广西壮族自治区,钦州市,浦北县', '浦北', '中国,广西,钦州,浦北', '3', '0777', '535300', 'Pubei', 'PB', 'P', '109.556', '22.2689', '');
INSERT INTO `t_order_region` VALUES ('2447', '450800', '450000', '贵港市', '中国,广西壮族自治区,贵港市', '贵港', '中国,广西,贵港', '2', '0775', '537100', 'Guigang', 'GG', 'G', '109.602', '23.0936', '');
INSERT INTO `t_order_region` VALUES ('2448', '450802', '450800', '港北区', '中国,广西壮族自治区,贵港市,港北区', '港北', '中国,广西,贵港,港北', '3', '0775', '537100', 'Gangbei', 'GB', 'G', '109.572', '23.1115', '');
INSERT INTO `t_order_region` VALUES ('2449', '450803', '450800', '港南区', '中国,广西壮族自治区,贵港市,港南区', '港南', '中国,广西,贵港,港南', '3', '0775', '537100', 'Gangnan', 'GN', 'G', '109.606', '23.0723', '');
INSERT INTO `t_order_region` VALUES ('2450', '450804', '450800', '覃塘区', '中国,广西壮族自治区,贵港市,覃塘区', '覃塘', '中国,广西,贵港,覃塘', '3', '0775', '537100', 'Qintang', 'QT', 'Q', '109.443', '23.1268', '');
INSERT INTO `t_order_region` VALUES ('2451', '450821', '450800', '平南县', '中国,广西壮族自治区,贵港市,平南县', '平南', '中国,广西,贵港,平南', '3', '0775', '537300', 'Pingnan', 'PN', 'P', '110.391', '23.542', '');
INSERT INTO `t_order_region` VALUES ('2452', '450881', '450800', '桂平市', '中国,广西壮族自治区,贵港市,桂平市', '桂平', '中国,广西,贵港,桂平', '3', '0775', '537200', 'Guiping', 'GP', 'G', '110.081', '23.3934', '');
INSERT INTO `t_order_region` VALUES ('2453', '450900', '450000', '玉林市', '中国,广西壮族自治区,玉林市', '玉林', '中国,广西,玉林', '2', '0775', '537000', 'Yulin', 'YL', 'Y', '110.154', '22.6314', '');
INSERT INTO `t_order_region` VALUES ('2454', '450902', '450900', '玉州区', '中国,广西壮族自治区,玉林市,玉州区', '玉州', '中国,广西,玉林,玉州', '3', '0775', '537000', 'Yuzhou', 'YZ', 'Y', '110.151', '22.6281', '');
INSERT INTO `t_order_region` VALUES ('2455', '450903', '450900', '福绵区', '中国,广西壮族自治区,玉林市,福绵区', '福绵', '中国,广西,玉林,福绵', '3', '0775', '537023', 'Fumian', 'FM', 'F', '110.065', '22.5831', '');
INSERT INTO `t_order_region` VALUES ('2456', '450921', '450900', '容县', '中国,广西壮族自治区,玉林市,容县', '容县', '中国,广西,玉林,容县', '3', '0775', '537500', 'Rongxian', 'RX', 'R', '110.556', '22.857', '');
INSERT INTO `t_order_region` VALUES ('2457', '450922', '450900', '陆川县', '中国,广西壮族自治区,玉林市,陆川县', '陆川', '中国,广西,玉林,陆川', '3', '0775', '537700', 'Luchuan', 'LC', 'L', '110.264', '22.3245', '');
INSERT INTO `t_order_region` VALUES ('2458', '450923', '450900', '博白县', '中国,广西壮族自治区,玉林市,博白县', '博白', '中国,广西,玉林,博白', '3', '0775', '537600', 'Bobai', 'BB', 'B', '109.977', '22.2729', '');
INSERT INTO `t_order_region` VALUES ('2459', '450924', '450900', '兴业县', '中国,广西壮族自治区,玉林市,兴业县', '兴业', '中国,广西,玉林,兴业', '3', '0775', '537800', 'Xingye', 'XY', 'X', '109.876', '22.7424', '');
INSERT INTO `t_order_region` VALUES ('2460', '450981', '450900', '北流市', '中国,广西壮族自治区,玉林市,北流市', '北流', '中国,广西,玉林,北流', '3', '0775', '537400', 'Beiliu', 'BL', 'B', '110.353', '22.7082', '');
INSERT INTO `t_order_region` VALUES ('2461', '450982', '450900', '玉东新区', '中国,广西壮族自治区,玉林市,玉东新区', '玉东', '中国,广西,玉林,玉东', '3', '0775', '537000', 'Yudong', 'YD', 'Y', '110.154', '22.6314', '新区');
INSERT INTO `t_order_region` VALUES ('2462', '450983', '450900', '高新区', '中国,广西壮族自治区,玉林市,高新区', '高新区', '中国,广西,玉林,高新区', '3', '0775', '537000', 'GaoXinQu', 'GXQ', 'G', '110.196', '22.6479', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2463', '451000', '450000', '百色市', '中国,广西壮族自治区,百色市', '百色', '中国,广西,百色', '2', '0776', '533000', 'Baise', 'BS', 'B', '106.616', '23.8977', '');
INSERT INTO `t_order_region` VALUES ('2464', '451002', '451000', '右江区', '中国,广西壮族自治区,百色市,右江区', '右江', '中国,广西,百色,右江', '3', '0776', '533000', 'Youjiang', 'YJ', 'Y', '106.618', '23.9009', '');
INSERT INTO `t_order_region` VALUES ('2465', '451021', '451000', '田阳县', '中国,广西壮族自治区,百色市,田阳县', '田阳', '中国,广西,百色,田阳', '3', '0776', '533600', 'Tianyang', 'TY', 'T', '106.916', '23.7353', '');
INSERT INTO `t_order_region` VALUES ('2466', '451022', '451000', '田东县', '中国,广西壮族自治区,百色市,田东县', '田东', '中国,广西,百色,田东', '3', '0776', '531500', 'Tiandong', 'TD', 'T', '107.124', '23.6', '');
INSERT INTO `t_order_region` VALUES ('2467', '451023', '451000', '平果县', '中国,广西壮族自治区,百色市,平果县', '平果', '中国,广西,百色,平果', '3', '0776', '531400', 'Pingguo', 'PG', 'P', '107.59', '23.3297', '');
INSERT INTO `t_order_region` VALUES ('2468', '451024', '451000', '德保县', '中国,广西壮族自治区,百色市,德保县', '德保', '中国,广西,百色,德保', '3', '0776', '533700', 'Debao', 'DB', 'D', '106.619', '23.3251', '');
INSERT INTO `t_order_region` VALUES ('2469', '451026', '451000', '那坡县', '中国,广西壮族自治区,百色市,那坡县', '那坡', '中国,广西,百色,那坡', '3', '0776', '533900', 'Napo', 'NP', 'N', '105.842', '23.4065', '');
INSERT INTO `t_order_region` VALUES ('2470', '451027', '451000', '凌云县', '中国,广西壮族自治区,百色市,凌云县', '凌云', '中国,广西,百色,凌云', '3', '0776', '533100', 'Lingyun', 'LY', 'L', '106.562', '24.3475', '');
INSERT INTO `t_order_region` VALUES ('2471', '451028', '451000', '乐业县', '中国,广西壮族自治区,百色市,乐业县', '乐业', '中国,广西,百色,乐业', '3', '0776', '533200', 'Leye', 'LY', 'L', '106.561', '24.7829', '');
INSERT INTO `t_order_region` VALUES ('2472', '451029', '451000', '田林县', '中国,广西壮族自治区,百色市,田林县', '田林', '中国,广西,百色,田林', '3', '0776', '533300', 'Tianlin', 'TL', 'T', '106.229', '24.2921', '');
INSERT INTO `t_order_region` VALUES ('2473', '451030', '451000', '西林县', '中国,广西壮族自治区,百色市,西林县', '西林', '中国,广西,百色,西林', '3', '0776', '533500', 'Xilin', 'XL', 'X', '105.097', '24.4897', '');
INSERT INTO `t_order_region` VALUES ('2474', '451031', '451000', '隆林各族自治县', '中国,广西壮族自治区,百色市,隆林各族自治县', '隆林', '中国,广西,百色,隆林', '3', '0776', '533400', 'Longlin', 'LL', 'L', '105.343', '24.7704', '');
INSERT INTO `t_order_region` VALUES ('2475', '451081', '451000', '靖西市', '中国,广西壮族自治区,百色市,靖西市', '靖西', '中国,广西,百色,靖西', '3', '0776', '533800', 'Jingxi', 'JX', 'J', '106.418', '23.1343', '');
INSERT INTO `t_order_region` VALUES ('2476', '451100', '450000', '贺州市', '中国,广西壮族自治区,贺州市', '贺州', '中国,广西,贺州', '2', '0774', '542800', 'Hezhou', 'HZ', 'H', '111.552', '24.4141', '');
INSERT INTO `t_order_region` VALUES ('2477', '451102', '451100', '八步区', '中国,广西壮族自治区,贺州市,八步区', '八步', '中国,广西,贺州,八步', '3', '0774', '542800', 'Babu', 'BB', 'B', '111.552', '24.4118', '');
INSERT INTO `t_order_region` VALUES ('2478', '451103', '451100', '平桂区', '中国,广西壮族自治区,贺州市,平桂区', '平桂', '中国,广西,贺州,平桂', '3', '0774', '542800', 'Pingui', 'PG', 'P', '111.486', '24.458', '');
INSERT INTO `t_order_region` VALUES ('2479', '451121', '451100', '昭平县', '中国,广西壮族自治区,贺州市,昭平县', '昭平', '中国,广西,贺州,昭平', '3', '0774', '546800', 'Zhaoping', 'ZP', 'Z', '110.811', '24.1701', '');
INSERT INTO `t_order_region` VALUES ('2480', '451122', '451100', '钟山县', '中国,广西壮族自治区,贺州市,钟山县', '钟山', '中国,广西,贺州,钟山', '3', '0774', '542600', 'Zhongshan', 'ZS', 'Z', '111.305', '24.5248', '');
INSERT INTO `t_order_region` VALUES ('2481', '451123', '451100', '富川瑶族自治县', '中国,广西壮族自治区,贺州市,富川瑶族自治县', '富川', '中国,广西,贺州,富川', '3', '0774', '542700', 'Fuchuan', 'FC', 'F', '111.278', '24.8143', '');
INSERT INTO `t_order_region` VALUES ('2482', '451200', '450000', '河池市', '中国,广西壮族自治区,河池市', '河池', '中国,广西,河池', '2', '0778', '547000', 'Hechi', 'HC', 'H', '108.062', '24.6959', '');
INSERT INTO `t_order_region` VALUES ('2483', '451202', '451200', '金城江区', '中国,广西壮族自治区,河池市,金城江区', '金城江', '中国,广西,河池,金城江', '3', '0778', '547000', 'Jinchengjiang', 'JCJ', 'J', '108.037', '24.6897', '');
INSERT INTO `t_order_region` VALUES ('2484', '451203', '451200', '宜州区', '中国,广西壮族自治区,河池市,宜州区', '宜州', '中国,广西,河池,宜州', '3', '0778', '546300', 'Yizhou', 'YZ', 'Y', '108.653', '24.4939', '');
INSERT INTO `t_order_region` VALUES ('2485', '451221', '451200', '南丹县', '中国,广西壮族自治区,河池市,南丹县', '南丹', '中国,广西,河池,南丹', '3', '0778', '547200', 'Nandan', 'ND', 'N', '107.546', '24.9776', '');
INSERT INTO `t_order_region` VALUES ('2486', '451222', '451200', '天峨县', '中国,广西壮族自治区,河池市,天峨县', '天峨', '中国,广西,河池,天峨', '3', '0778', '547300', 'Tiane', 'TE', 'T', '107.172', '24.9959', '');
INSERT INTO `t_order_region` VALUES ('2487', '451223', '451200', '凤山县', '中国,广西壮族自治区,河池市,凤山县', '凤山', '中国,广西,河池,凤山', '3', '0778', '547600', 'Fengshan', 'FS', 'F', '107.049', '24.5422', '');
INSERT INTO `t_order_region` VALUES ('2488', '451224', '451200', '东兰县', '中国,广西壮族自治区,河池市,东兰县', '东兰', '中国,广西,河池,东兰', '3', '0778', '547400', 'Donglan', 'DL', 'D', '107.375', '24.5105', '');
INSERT INTO `t_order_region` VALUES ('2489', '451225', '451200', '罗城仫佬族自治县', '中国,广西壮族自治区,河池市,罗城仫佬族自治县', '罗城', '中国,广西,河池,罗城', '3', '0778', '546499', 'Luocheng', 'LC', 'L', '108.908', '24.7792', '');
INSERT INTO `t_order_region` VALUES ('2490', '451226', '451200', '环江毛南族自治县', '中国,广西壮族自治区,河池市,环江毛南族自治县', '环江', '中国,广西,河池,环江', '3', '0778', '547100', 'Huanjiang', 'HJ', 'H', '108.261', '24.8292', '');
INSERT INTO `t_order_region` VALUES ('2491', '451227', '451200', '巴马瑶族自治县', '中国,广西壮族自治区,河池市,巴马瑶族自治县', '巴马', '中国,广西,河池,巴马', '3', '0778', '547500', 'Bama', 'BM', 'B', '107.253', '24.1413', '');
INSERT INTO `t_order_region` VALUES ('2492', '451228', '451200', '都安瑶族自治县', '中国,广西壮族自治区,河池市,都安瑶族自治县', '都安', '中国,广西,河池,都安', '3', '0778', '530700', 'Du\'an', 'DA', 'D', '108.101', '23.9324', '');
INSERT INTO `t_order_region` VALUES ('2493', '451229', '451200', '大化瑶族自治县', '中国,广西壮族自治区,河池市,大化瑶族自治县', '大化', '中国,广西,河池,大化', '3', '0778', '530800', 'Dahua', 'DH', 'D', '107.998', '23.7449', '');
INSERT INTO `t_order_region` VALUES ('2494', '451300', '450000', '来宾市', '中国,广西壮族自治区,来宾市', '来宾', '中国,广西,来宾', '2', '0772', '546100', 'Laibin', 'LB', 'L', '109.23', '23.7338', '');
INSERT INTO `t_order_region` VALUES ('2495', '451302', '451300', '兴宾区', '中国,广西壮族自治区,来宾市,兴宾区', '兴宾', '中国,广西,来宾,兴宾', '3', '0772', '546100', 'Xingbin', 'XB', 'X', '109.235', '23.7273', '');
INSERT INTO `t_order_region` VALUES ('2496', '451321', '451300', '忻城县', '中国,广西壮族自治区,来宾市,忻城县', '忻城', '中国,广西,来宾,忻城', '3', '0772', '546200', 'Xincheng', 'XC', 'X', '108.664', '24.0686', '');
INSERT INTO `t_order_region` VALUES ('2497', '451322', '451300', '象州县', '中国,广西壮族自治区,来宾市,象州县', '象州', '中国,广西,来宾,象州', '3', '0772', '545800', 'Xiangzhou', 'XZ', 'X', '109.699', '23.9736', '');
INSERT INTO `t_order_region` VALUES ('2498', '451323', '451300', '武宣县', '中国,广西壮族自治区,来宾市,武宣县', '武宣', '中国,广西,来宾,武宣', '3', '0772', '545900', 'Wuxuan', 'WX', 'W', '109.663', '23.5947', '');
INSERT INTO `t_order_region` VALUES ('2499', '451324', '451300', '金秀瑶族自治县', '中国,广西壮族自治区,来宾市,金秀瑶族自治县', '金秀', '中国,广西,来宾,金秀', '3', '0772', '545700', 'Jinxiu', 'JX', 'J', '110.191', '24.1293', '');
INSERT INTO `t_order_region` VALUES ('2500', '451381', '451300', '合山市', '中国,广西壮族自治区,来宾市,合山市', '合山', '中国,广西,来宾,合山', '3', '0772', '546500', 'Heshan', 'HS', 'H', '108.886', '23.8062', '');
INSERT INTO `t_order_region` VALUES ('2501', '451400', '450000', '崇左市', '中国,广西壮族自治区,崇左市', '崇左', '中国,广西,崇左', '2', '0771', '532200', 'Chongzuo', 'CZ', 'C', '107.354', '22.4041', '');
INSERT INTO `t_order_region` VALUES ('2502', '451402', '451400', '江州区', '中国,广西壮族自治区,崇左市,江州区', '江州', '中国,广西,崇左,江州', '3', '0771', '532299', 'Jiangzhou', 'JZ', 'J', '107.347', '22.4114', '');
INSERT INTO `t_order_region` VALUES ('2503', '451421', '451400', '扶绥县', '中国,广西壮族自治区,崇左市,扶绥县', '扶绥', '中国,广西,崇左,扶绥', '3', '0771', '532100', 'Fusui', 'FS', 'F', '107.904', '22.6341', '');
INSERT INTO `t_order_region` VALUES ('2504', '451422', '451400', '宁明县', '中国,广西壮族自治区,崇左市,宁明县', '宁明', '中国,广西,崇左,宁明', '3', '0771', '532500', 'Ningming', 'NM', 'N', '107.073', '22.1366', '');
INSERT INTO `t_order_region` VALUES ('2505', '451423', '451400', '龙州县', '中国,广西壮族自治区,崇左市,龙州县', '龙州', '中国,广西,崇左,龙州', '3', '0771', '532400', 'Longzhou', 'LZ', 'L', '106.854', '22.3394', '');
INSERT INTO `t_order_region` VALUES ('2506', '451424', '451400', '大新县', '中国,广西壮族自治区,崇左市,大新县', '大新', '中国,广西,崇左,大新', '3', '0771', '532300', 'Daxin', 'DX', 'D', '107.198', '22.8341', '');
INSERT INTO `t_order_region` VALUES ('2507', '451425', '451400', '天等县', '中国,广西壮族自治区,崇左市,天等县', '天等', '中国,广西,崇左,天等', '3', '0771', '532800', 'Tiandeng', 'TD', 'T', '107.14', '23.077', '');
INSERT INTO `t_order_region` VALUES ('2508', '451481', '451400', '凭祥市', '中国,广西壮族自治区,崇左市,凭祥市', '凭祥', '中国,广西,崇左,凭祥', '3', '0771', '532600', 'Pingxiang', 'PX', 'P', '106.755', '22.1057', '');
INSERT INTO `t_order_region` VALUES ('2509', '460000', '100000', '海南省', '中国,海南省', '海南', '中国,海南', '1', '', '', 'Hainan', 'HI', 'H', '110.331', '20.032', '');
INSERT INTO `t_order_region` VALUES ('2510', '460100', '460000', '海口市', '中国,海南省,海口市', '海口', '中国,海南,海口', '2', '0898', '570000', 'Haikou', 'HK', 'H', '110.331', '20.032', '');
INSERT INTO `t_order_region` VALUES ('2511', '460105', '460100', '秀英区', '中国,海南省,海口市,秀英区', '秀英', '中国,海南,海口,秀英', '3', '0898', '570300', 'Xiuying', 'XY', 'X', '110.293', '20.0075', '');
INSERT INTO `t_order_region` VALUES ('2512', '460106', '460100', '龙华区', '中国,海南省,海口市,龙华区', '龙华', '中国,海南,海口,龙华', '3', '0898', '570100', 'Longhua', 'LH', 'L', '110.302', '20.0287', '');
INSERT INTO `t_order_region` VALUES ('2513', '460107', '460100', '琼山区', '中国,海南省,海口市,琼山区', '琼山', '中国,海南,海口,琼山', '3', '0898', '571199', 'Qiongshan', 'QS', 'Q', '110.354', '20.0032', '');
INSERT INTO `t_order_region` VALUES ('2514', '460108', '460100', '美兰区', '中国,海南省,海口市,美兰区', '美兰', '中国,海南,海口,美兰', '3', '0898', '570203', 'Meilan', 'ML', 'M', '110.369', '20.0286', '');
INSERT INTO `t_order_region` VALUES ('2515', '460200', '460000', '三亚市', '中国,海南省,三亚市', '三亚', '中国,海南,三亚', '2', '0898', '572000', 'Sanya', 'SY', 'S', '109.508', '18.2479', '');
INSERT INTO `t_order_region` VALUES ('2516', '460202', '460200', '海棠区', '中国,海南省,三亚市,海棠区', '海棠', '中国,海南,三亚,海棠', '3', '0898', '572000', 'Haitang', 'HT', 'H', '109.508', '18.2479', '');
INSERT INTO `t_order_region` VALUES ('2517', '460203', '460200', '吉阳区', '中国,海南省,三亚市,吉阳区', '吉阳', '中国,海南,三亚,吉阳', '3', '0898', '572000', 'Jiyang', 'JY', 'J', '109.508', '18.2479', '');
INSERT INTO `t_order_region` VALUES ('2518', '460204', '460200', '天涯区', '中国,海南省,三亚市,天涯区', '天涯', '中国,海南,三亚,天涯', '3', '0898', '572000', 'Tianya', 'TY', 'T', '109.508', '18.2479', '');
INSERT INTO `t_order_region` VALUES ('2519', '460205', '460200', '崖州区', '中国,海南省,三亚市,崖州区', '崖州', '中国,海南,三亚,崖州', '3', '0898', '572000', 'Yazhou', 'YZ', 'Y', '109.508', '18.2479', '');
INSERT INTO `t_order_region` VALUES ('2520', '460300', '460000', '三沙市', '中国,海南省,三沙市', '三沙', '中国,海南,三沙', '2', '0898', '573199', 'Sansha', 'SS', 'S', '112.349', '16.831', '');
INSERT INTO `t_order_region` VALUES ('2521', '460321', '460300', '西沙群岛', '中国,海南省,三沙市,西沙群岛', '西沙', '中国,海南,三沙,西沙', '3', '0898', '573199', 'Xisha Islands', 'XS', 'X', '112.026', '16.3313', '拓展');
INSERT INTO `t_order_region` VALUES ('2522', '460322', '460300', '南沙群岛', '中国,海南省,三沙市,南沙群岛', '南沙', '中国,海南,三沙,南沙', '3', '0898', '573199', 'Nansha Islands', 'NS', 'N', '116.75', '11.4719', '拓展');
INSERT INTO `t_order_region` VALUES ('2523', '460323', '460300', '中沙群岛', '中国,海南省,三沙市,中沙群岛', '中沙', '中国,海南,三沙,中沙', '3', '0898', '573199', 'Zhongsha Islands', 'ZS', 'Z', '117.74', '15.1129', '拓展');
INSERT INTO `t_order_region` VALUES ('2524', '460400', '460000', '儋州市', '中国,海南省,儋州市', '儋州', '中国,海南,儋州', '2', '0898', '571700', 'Danzhou', 'DZ', 'D', '109.577', '19.5175', '');
INSERT INTO `t_order_region` VALUES ('2525', '460401', '460400', '洋浦经济开发区', '中国,海南省,儋州市,洋浦经济开发区', '洋浦', '中国,海南,儋州,洋浦', '3', '0898', '578001', 'Yangpu', 'YP', 'Y', '109.199', '19.7349', '拓展');
INSERT INTO `t_order_region` VALUES ('2526', '460402', '460400', '那大镇', '中国,海南省,儋州市,那大镇', '那大', '中国,海南,儋州,那大', '3', '0898', '571799', 'Nada', 'ND', 'N', '109.546', '19.5149', '拓展');
INSERT INTO `t_order_region` VALUES ('2527', '460403', '460400', '南丰镇', '中国,海南省,儋州市,南丰镇', '南丰', '中国,海南,儋州,南丰', '3', '0898', '571724', 'Nanfeng', 'NF', 'N', '109.556', '19.4094', '拓展');
INSERT INTO `t_order_region` VALUES ('2528', '460404', '460400', '雅星镇', '中国,海南省,儋州市,雅星镇', '雅星', '中国,海南,儋州,雅星', '3', '0898', '571729', 'Yaxing', 'YX', 'Y', '109.269', '19.4441', '拓展');
INSERT INTO `t_order_region` VALUES ('2529', '460405', '460400', '和庆镇', '中国,海南省,儋州市,和庆镇', '和庆', '中国,海南,儋州,和庆', '3', '0898', '571721', 'Heqing', 'HQ', 'H', '109.641', '19.5254', '拓展');
INSERT INTO `t_order_region` VALUES ('2530', '460406', '460400', '大成镇', '中国,海南省,儋州市,大成镇', '大成', '中国,海南,儋州,大成', '3', '0898', '571736', 'Dacheng', 'DC', 'D', '109.399', '19.5081', '拓展');
INSERT INTO `t_order_region` VALUES ('2531', '460407', '460400', '新州镇', '中国,海南省,儋州市,新州镇', '新州', '中国,海南,儋州,新州', '3', '0898', '571749', 'Xinzhou', 'XZ', 'X', '109.316', '19.7143', '拓展');
INSERT INTO `t_order_region` VALUES ('2532', '460408', '460400', '光村镇', '中国,海南省,儋州市,光村镇', '光村', '中国,海南,儋州,光村', '3', '0898', '571752', 'Guangcun', 'GC', 'G', '109.487', '19.8136', '拓展');
INSERT INTO `t_order_region` VALUES ('2533', '460409', '460400', '东成镇', '中国,海南省,儋州市,东成镇', '东成', '中国,海南,儋州,东成', '3', '0898', '571763', 'Dongcheng', 'DC', 'D', '109.461', '19.7037', '拓展');
INSERT INTO `t_order_region` VALUES ('2534', '460410', '460400', '中和镇', '中国,海南省,儋州市,中和镇', '中和', '中国,海南,儋州,中和', '3', '0898', '571747', 'Zhonghe', 'ZH', 'Z', '109.355', '19.7397', '拓展');
INSERT INTO `t_order_region` VALUES ('2535', '460411', '460400', '峨蔓镇', '中国,海南省,儋州市,峨蔓镇', '峨蔓', '中国,海南,儋州,峨蔓', '3', '0898', '571745', 'E\'man', 'EM', 'E', '109.267', '19.8548', '拓展');
INSERT INTO `t_order_region` VALUES ('2536', '460412', '460400', '兰洋镇', '中国,海南省,儋州市,兰洋镇', '兰洋', '中国,海南,儋州,兰洋', '3', '0898', '571722', 'Lanyang', 'LY', 'L', '109.664', '19.4604', '拓展');
INSERT INTO `t_order_region` VALUES ('2537', '460413', '460400', '王五镇', '中国,海南省,儋州市,王五镇', '王五', '中国,海南,儋州,王五', '3', '0898', '571739', 'Wangwu', 'WW', 'W', '109.3', '19.6523', '拓展');
INSERT INTO `t_order_region` VALUES ('2538', '460414', '460400', '排浦镇', '中国,海南省,儋州市,排浦镇', '排浦', '中国,海南,儋州,排浦', '3', '0898', '571741', 'Paipu', 'PP', 'P', '109.163', '19.6388', '拓展');
INSERT INTO `t_order_region` VALUES ('2539', '460415', '460400', '海头镇', '中国,海南省,儋州市,海头镇', '海头', '中国,海南,儋州,海头', '3', '0898', '571732', 'Haitou', 'HT', 'H', '108.953', '19.5033', '拓展');
INSERT INTO `t_order_region` VALUES ('2540', '460416', '460400', '木棠镇', '中国,海南省,儋州市,木棠镇', '木棠', '中国,海南,儋州,木棠', '3', '0898', '571746', 'Mutang', 'MT', 'M', '109.35', '19.8039', '拓展');
INSERT INTO `t_order_region` VALUES ('2541', '460417', '460400', '白马井镇', '中国,海南省,儋州市,白马井镇', '白马井', '中国,海南,儋州,白马井', '3', '0898', '571742', 'Baima', 'BMJ', 'B', '109.219', '19.6964', '拓展');
INSERT INTO `t_order_region` VALUES ('2542', '460418', '460400', '三都镇', '中国,海南省,儋州市,三都镇', '三都', '中国,海南,儋州,三都', '3', '0898', '571744', 'Sandu', 'SD', 'S', '109.223', '19.7859', '拓展');
INSERT INTO `t_order_region` VALUES ('2543', '460419', '460400', '西培农场', '中国,海南省,儋州市,西培农场', '西培农场', '中国,海南,儋州,西培农场', '3', '0898', '571725', 'Xipei', 'XP', 'X', '109.456', '19.4764', '拓展');
INSERT INTO `t_order_region` VALUES ('2544', '460420', '460400', '西联农场', '中国,海南省,儋州市,西联农场', '西联农场', '中国,海南,儋州,西联农场', '3', '0898', '571756', 'Xilian', 'XL', 'X', '109.562', '19.5681', '拓展');
INSERT INTO `t_order_region` VALUES ('2545', '460421', '460400', '蓝洋农场', '中国,海南省,儋州市,蓝洋农场', '蓝洋农场', '中国,海南,儋州,蓝洋农场', '3', '0898', '571756', 'Lanyang', 'LY', 'L', '109.671', '19.459', '拓展');
INSERT INTO `t_order_region` VALUES ('2546', '460422', '460400', '八一农场', '中国,海南省,儋州市,八一农场', '八一农场', '中国,海南,儋州,八一农场', '3', '0898', '571727', 'Bayi', 'BY', 'B', '109.294', '19.4339', '拓展');
INSERT INTO `t_order_region` VALUES ('2547', '460423', '460400', '西华农场', '中国,海南省,儋州市,西华农场', '西华农场', '中国,海南,儋州,西华农场', '3', '0898', '571735', 'Xihua', 'XH', 'X', '109.339', '19.5226', '拓展');
INSERT INTO `t_order_region` VALUES ('2548', '460424', '460400', '西庆农场', '中国,海南省,儋州市,西庆农场', '西庆农场', '中国,海南,儋州,西庆农场', '3', '0898', '571738', 'Xiqing', 'XQ', 'X', '109.466', '19.5347', '拓展');
INSERT INTO `t_order_region` VALUES ('2549', '460425', '460400', '西流农场', '中国,海南省,儋州市,西流农场', '西流农场', '中国,海南,儋州,西流农场', '3', '0898', '571758', 'Xiliu', 'XL', 'X', '109.641', '19.5659', '拓展');
INSERT INTO `t_order_region` VALUES ('2550', '460426', '460400', '新盈农场', '中国,海南省,儋州市,新盈农场', '新盈农场', '中国,海南,儋州,新盈农场', '3', '0898', '571753', 'Xinying', 'XY', 'X', '109.562', '19.7745', '拓展');
INSERT INTO `t_order_region` VALUES ('2551', '460427', '460400', '龙山农场', '中国,海南省,儋州市,龙山农场', '龙山农场', '中国,海南,儋州,龙山农场', '3', '0898', '571757', 'Longshan', 'LS', 'L', '109.181', '19.6015', '拓展');
INSERT INTO `t_order_region` VALUES ('2552', '460428', '460400', '红岭农场', '中国,海南省,儋州市,红岭农场', '红岭农场', '中国,海南,儋州,红岭农场', '3', '0898', '571733', 'Hongling', 'HL', 'H', '109.098', '19.4957', '拓展');
INSERT INTO `t_order_region` VALUES ('2553', '469001', '460000', '五指山市', '中国,海南省,五指山市', '五指山', '中国,海南,五指山', '2', '0898', '572200', 'Wuzhishan', 'WZS', 'W', '109.517', '18.7769', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2554', '469002', '460000', '琼海市', '中国,海南省,琼海市', '琼海', '中国,海南,琼海', '2', '0898', '571400', 'Qionghai', 'QH', 'Q', '110.467', '19.246', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2555', '469005', '460000', '文昌市', '中国,海南省,文昌市', '文昌', '中国,海南,文昌', '2', '0898', '571300', 'Wenchang', 'WC', 'W', '110.754', '19.613', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2556', '469006', '460000', '万宁市', '中国,海南省,万宁市', '万宁', '中国,海南,万宁', '2', '0898', '571500', 'Wanning', 'WN', 'W', '110.389', '18.7962', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2557', '469007', '460000', '东方市', '中国,海南省,东方市', '东方', '中国,海南,东方', '2', '0898', '572600', 'Dongfang', 'DF', 'D', '108.654', '19.102', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2558', '469021', '460000', '定安县', '中国,海南省,定安县', '定安', '中国,海南,定安', '2', '0898', '571200', 'Ding\'an', 'DA', 'D', '110.324', '19.6992', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2559', '469022', '460000', '屯昌县', '中国,海南省,屯昌县', '屯昌', '中国,海南,屯昌', '2', '0898', '571600', 'Tunchang', 'TC', 'T', '110.103', '19.3629', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2560', '469023', '460000', '澄迈县', '中国,海南省,澄迈县', '澄迈', '中国,海南,澄迈', '2', '0898', '571900', 'Chengmai', 'CM', 'C', '110.007', '19.7371', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2561', '469024', '460000', '临高县', '中国,海南省,临高县', '临高', '中国,海南,临高', '2', '0898', '571800', 'Lingao', 'LG', 'L', '109.688', '19.9083', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2562', '469025', '460000', '白沙黎族自治县', '中国,海南省,白沙黎族自治县', '白沙', '中国,海南,白沙', '2', '0898', '572800', 'Baisha', 'BS', 'B', '109.453', '19.2246', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2563', '469026', '460000', '昌江黎族自治县', '中国,海南省,昌江黎族自治县', '昌江', '中国,海南,昌江', '2', '0898', '572700', 'Changjiang', 'CJ', 'C', '109.053', '19.261', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2564', '469027', '460000', '乐东黎族自治县', '中国,海南省,乐东黎族自治县', '乐东', '中国,海南,乐东', '2', '0898', '572500', 'Ledong', 'LD', 'L', '109.175', '18.7476', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2565', '469028', '460000', '陵水黎族自治县', '中国,海南省,陵水黎族自治县', '陵水', '中国,海南,陵水', '2', '0898', '572400', 'Lingshui', 'LS', 'L', '110.037', '18.505', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2566', '469029', '460000', '保亭黎族苗族自治县', '中国,海南省,保亭黎族苗族自治县', '保亭', '中国,海南,保亭', '2', '0898', '572300', 'Baoting', 'BT', 'B', '109.702', '18.6364', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2567', '469030', '460000', '琼中黎族苗族自治县', '中国,海南省,琼中黎族苗族自治县', '琼中', '中国,海南,琼中', '2', '0898', '572900', 'Qiongzhong', 'QZ', 'Q', '109.84', '19.0356', '直辖县级');
INSERT INTO `t_order_region` VALUES ('2568', '469101', '469001', '通什镇', '中国,海南省,五指山市,通什镇', '通什镇', '中国,海南,五指山,通什镇', '3', '0898', '572299', 'Tongshi', 'TS', 'T', '109.517', '18.7807', '拓展');
INSERT INTO `t_order_region` VALUES ('2569', '469102', '469001', '南圣镇', '中国,海南省,五指山市,南圣镇', '南圣镇', '中国,海南,五指山,南圣镇', '3', '0898', '572219', 'Nansheng', 'NS', 'N', '109.593', '18.7384', '拓展');
INSERT INTO `t_order_region` VALUES ('2570', '469103', '469001', '毛阳镇', '中国,海南省,五指山市,毛阳镇', '毛阳镇', '中国,海南,五指山,毛阳镇', '3', '0898', '572214', 'Maoyang', 'MY', 'M', '109.508', '18.937', '拓展');
INSERT INTO `t_order_region` VALUES ('2571', '469104', '469001', '番阳镇', '中国,海南省,五指山市,番阳镇', '番阳镇', '中国,海南,五指山,番阳镇', '3', '0898', '572213', 'Panyang', 'PY', 'P', '109.398', '18.8744', '拓展');
INSERT INTO `t_order_region` VALUES ('2572', '469105', '469001', '畅好乡', '中国,海南省,五指山市,畅好乡', '畅好乡', '中国,海南,五指山,畅好乡', '3', '0898', '572218', 'Changhao', 'CH', 'C', '109.487', '18.7337', '拓展');
INSERT INTO `t_order_region` VALUES ('2573', '469106', '469001', '毛道乡', '中国,海南省,五指山市,毛道乡', '毛道乡', '中国,海南,五指山,毛道乡', '3', '0898', '572217', 'Maodao', 'MD', 'M', '109.411', '18.7913', '拓展');
INSERT INTO `t_order_region` VALUES ('2574', '469107', '469001', '水满乡', '中国,海南省,五指山市,水满乡', '水满乡', '中国,海南,五指山,水满乡', '3', '0898', '572215', 'Shuiman', 'SM', 'S', '109.667', '18.881', '拓展');
INSERT INTO `t_order_region` VALUES ('2575', '469201', '469002', '嘉积镇', '中国,海南省,琼海市,嘉积镇', '嘉积镇', '中国,海南,琼海,嘉积镇', '3', '0898', '571400', 'Jiaji', 'JJ', 'J', '110.486', '19.243', '拓展');
INSERT INTO `t_order_region` VALUES ('2576', '469202', '469002', '万泉镇', '中国,海南省,琼海市,万泉镇', '万泉镇', '中国,海南,琼海,万泉镇', '3', '0898', '571421', 'Wanqua', 'WQ', 'W', '110.409', '19.243', '拓展');
INSERT INTO `t_order_region` VALUES ('2577', '469203', '469002', '石壁镇', '中国,海南省,琼海市,石壁镇', '石壁镇', '中国,海南,琼海,石壁镇', '3', '0898', '571400', 'Shibi', 'SB', 'S', '110.309', '19.1633', '拓展');
INSERT INTO `t_order_region` VALUES ('2578', '469204', '469002', '中原镇', '中国,海南省,琼海市,中原镇', '中原镇', '中国,海南,琼海,中原镇', '3', '0898', '571447', 'Zhongyuan', 'ZY', 'Z', '110.468', '19.1518', '拓展');
INSERT INTO `t_order_region` VALUES ('2579', '469205', '469002', '博鳌镇', '中国,海南省,琼海市,博鳌镇', '博鳌镇', '中国,海南,琼海,博鳌镇', '3', '0898', '571434', 'Bo\'ao', 'BA', 'B', '110.587', '19.1598', '拓展');
INSERT INTO `t_order_region` VALUES ('2580', '469206', '469002', '阳江镇', '中国,海南省,琼海市,阳江镇', '阳江镇', '中国,海南,琼海,阳江镇', '3', '0898', '571441', 'Yangjiang', 'YJ', 'Y', '110.352', '19.097', '拓展');
INSERT INTO `t_order_region` VALUES ('2581', '469207', '469002', '龙江镇', '中国,海南省,琼海市,龙江镇', '龙江镇', '中国,海南,琼海,龙江镇', '3', '0898', '571446', 'Longjiang', 'LJ', 'L', '110.325', '19.1468', '拓展');
INSERT INTO `t_order_region` VALUES ('2582', '469208', '469002', '潭门镇', '中国,海南省,琼海市,潭门镇', '潭门镇', '中国,海南,琼海,潭门镇', '3', '0898', '571431', 'Tanmen', 'TM', 'T', '110.617', '19.2417', '拓展');
INSERT INTO `t_order_region` VALUES ('2583', '469209', '469002', '塔洋镇', '中国,海南省,琼海市,塔洋镇', '塔洋镇', '中国,海南,琼海,塔洋镇', '3', '0898', '571427', 'Tayang', 'TY', 'T', '110.508', '19.2882', '拓展');
INSERT INTO `t_order_region` VALUES ('2584', '469210', '469002', '长坡镇', '中国,海南省,琼海市,长坡镇', '长坡镇', '中国,海南,琼海,长坡镇', '3', '0898', '571429', 'Changpo', 'CP', 'C', '110.607', '19.3356', '拓展');
INSERT INTO `t_order_region` VALUES ('2585', '469211', '469002', '大路镇', '中国,海南省,琼海市,大路镇', '大路镇', '中国,海南,琼海,大路镇', '3', '0898', '571425', 'Dalu', 'DL', 'D', '110.476', '19.381', '拓展');
INSERT INTO `t_order_region` VALUES ('2586', '469212', '469002', '会山镇', '中国,海南省,琼海市,会山镇', '会山镇', '中国,海南,琼海,会山镇', '3', '0898', '571444', 'Huishan', 'HS', 'H', '110.269', '19.0671', '拓展');
INSERT INTO `t_order_region` VALUES ('2587', '469213', '469002', '东太农场', '中国,海南省,琼海市,东太农场', '东太农场', '中国,海南,琼海,东太农场', '3', '0898', '571445', 'Dongtai', 'DT', 'D', '110.22', '19.1221', '拓展');
INSERT INTO `t_order_region` VALUES ('2588', '469214', '469002', '东红农场', '中国,海南省,琼海市,东红农场', '东红农场', '中国,海南,琼海,东红农场', '3', '0898', '571445', 'Donghong', 'DH', 'D', '110.448', '19.4003', '拓展');
INSERT INTO `t_order_region` VALUES ('2589', '469215', '469002', '东升农场', '中国,海南省,琼海市,东升农场', '东升农场', '中国,海南,琼海,东升农场', '3', '0898', '571422', 'Dongsheng', 'DS', 'D', '110.408', '19.2976', '拓展');
INSERT INTO `t_order_region` VALUES ('2590', '469216', '469002', '南俸农场', '中国,海南省,琼海市,南俸农场', '南俸农场', '中国,海南,琼海,南俸农场', '3', '0898', '571448', 'Nanfeng', 'NF', 'N', '110.223', '19.1731', '拓展');
INSERT INTO `t_order_region` VALUES ('2591', '469217', '469002', '彬村山华侨农场', '中国,海南省,琼海市,彬村山华侨农场', '彬村山华侨农场', '中国,海南,琼海,彬村山华侨农场', '3', '0898', '571400', 'Huaqiao', 'HQ', 'H', '110.571', '19.3095', '拓展');
INSERT INTO `t_order_region` VALUES ('2592', '469501', '469005', '文城镇', '中国,海南省,文昌市,文城镇', '文城镇', '中国,海南,文昌,文城镇', '3', '0898', '571399', 'Wencheng', 'WC', 'W', '110.754', '19.6138', '拓展');
INSERT INTO `t_order_region` VALUES ('2593', '469502', '469005', '重兴镇', '中国,海南省,文昌市,重兴镇', '重兴镇', '中国,海南,文昌,重兴镇', '3', '0898', '571344', 'Zhongxing', 'ZX', 'Z', '110.597', '19.4116', '拓展');
INSERT INTO `t_order_region` VALUES ('2594', '469503', '469005', '蓬莱镇', '中国,海南省,文昌市,蓬莱镇', '蓬莱镇', '中国,海南,文昌,蓬莱镇', '3', '0898', '571345', 'Penglai', 'PL', 'P', '110.541', '19.5368', '拓展');
INSERT INTO `t_order_region` VALUES ('2595', '469504', '469005', '会文镇', '中国,海南省,文昌市,会文镇', '会文镇', '中国,海南,文昌,会文镇', '3', '0898', '571343', 'Huiwen', 'HW', 'H', '110.732', '19.4626', '拓展');
INSERT INTO `t_order_region` VALUES ('2596', '469505', '469005', '东路镇', '中国,海南省,文昌市,东路镇', '东路镇', '中国,海南,文昌,东路镇', '3', '0898', '571348', 'Donglu', 'DL', 'D', '110.706', '19.7919', '拓展');
INSERT INTO `t_order_region` VALUES ('2597', '469506', '469005', '潭牛镇', '中国,海南省,文昌市,潭牛镇', '潭牛镇', '中国,海南,文昌,潭牛镇', '3', '0898', '571349', 'Tanniu', 'TN', 'T', '110.735', '19.7101', '拓展');
INSERT INTO `t_order_region` VALUES ('2598', '469507', '469005', '东阁镇', '中国,海南省,文昌市,东阁镇', '东阁镇', '中国,海南,文昌,东阁镇', '3', '0898', '571336', 'Dongge', 'DG', 'D', '110.849', '19.6569', '拓展');
INSERT INTO `t_order_region` VALUES ('2599', '469508', '469005', '文教镇', '中国,海南省,文昌市,文教镇', '文教镇', '中国,海南,文昌,文教镇', '3', '0898', '571335', 'Wenjiao', 'WJ', 'W', '110.914', '19.6663', '拓展');
INSERT INTO `t_order_region` VALUES ('2600', '469509', '469005', '东郊镇', '中国,海南省,文昌市,东郊镇', '东郊镇', '中国,海南,文昌,东郊镇', '3', '0898', '571334', 'Dongjiao', 'DJ', 'D', '110.852', '19.5732', '拓展');
INSERT INTO `t_order_region` VALUES ('2601', '469510', '469005', '龙楼镇', '中国,海南省,文昌市,龙楼镇', '龙楼镇', '中国,海南,文昌,龙楼镇', '3', '0898', '571333', 'Longlou', 'LL', 'L', '110.969', '19.6533', '拓展');
INSERT INTO `t_order_region` VALUES ('2602', '469511', '469005', '昌洒镇', '中国,海南省,文昌市,昌洒镇', '昌洒镇', '中国,海南,文昌,昌洒镇', '3', '0898', '571332', 'Changsa', 'CS', 'C', '110.9', '19.7618', '拓展');
INSERT INTO `t_order_region` VALUES ('2603', '469512', '469005', '翁田镇', '中国,海南省,文昌市,翁田镇', '翁田镇', '中国,海南,文昌,翁田镇', '3', '0898', '571328', 'Wengtian', 'WT', 'W', '110.88', '19.9315', '拓展');
INSERT INTO `t_order_region` VALUES ('2604', '469513', '469005', '抱罗镇', '中国,海南省,文昌市,抱罗镇', '抱罗镇', '中国,海南,文昌,抱罗镇', '3', '0898', '571326', 'Baoluo', 'BL', 'B', '110.749', '19.8435', '拓展');
INSERT INTO `t_order_region` VALUES ('2605', '469514', '469005', '冯坡镇', '中国,海南省,文昌市,冯坡镇', '冯坡镇', '中国,海南,文昌,冯坡镇', '3', '0898', '571327', 'Fengpo', 'FP', 'F', '110.784', '19.9646', '拓展');
INSERT INTO `t_order_region` VALUES ('2606', '469515', '469005', '锦山镇', '中国,海南省,文昌市,锦山镇', '锦山镇', '中国,海南,文昌,锦山镇', '3', '0898', '571323', 'Jinshan', 'JS', 'J', '110.698', '19.9955', '拓展');
INSERT INTO `t_order_region` VALUES ('2607', '469516', '469005', '铺前镇', '中国,海南省,文昌市,铺前镇', '铺前镇', '中国,海南,文昌,铺前镇', '3', '0898', '571322', 'Putian', 'PT', 'P', '110.58', '20.0237', '拓展');
INSERT INTO `t_order_region` VALUES ('2608', '469517', '469005', '公坡镇', '中国,海南省,文昌市,公坡镇', '公坡镇', '中国,海南,文昌,公坡镇', '3', '0898', '571331', 'Gongpo', 'GP', 'G', '110.809', '19.7891', '拓展');
INSERT INTO `t_order_region` VALUES ('2609', '469518', '469005', '迈号镇', '中国,海南省,文昌市,迈号镇', '迈号镇', '中国,海南,文昌,迈号镇', '3', '0898', '571341', 'Maihao', 'MH', 'M', '110.751', '19.5361', '拓展');
INSERT INTO `t_order_region` VALUES ('2610', '469519', '469005', '清谰镇', '中国,海南省,文昌市,清谰镇', '清谰镇', '中国,海南,文昌,清谰镇', '3', '0898', '571300', 'Qinglan', 'QL', 'Q', '110.819', '19.5626', '拓展');
INSERT INTO `t_order_region` VALUES ('2611', '469520', '469005', '南阳镇', '中国,海南省,文昌市,南阳镇', '南阳镇', '中国,海南,文昌,南阳镇', '3', '0898', '571300', 'Nanyang', 'NY', 'N', '110.651', '19.5841', '拓展');
INSERT INTO `t_order_region` VALUES ('2612', '469521', '469005', '新桥镇', '中国,海南省,文昌市,新桥镇', '新桥镇', '中国,海南,文昌,新桥镇', '3', '0898', '571347', 'Xinqiao', 'XQ', 'X', '110.686', '19.6547', '拓展');
INSERT INTO `t_order_region` VALUES ('2613', '469522', '469005', '头苑镇', '中国,海南省,文昌市,头苑镇', '头苑镇', '中国,海南,文昌,头苑镇', '3', '0898', '571338', 'Touyuan', 'TY', 'T', '110.788', '19.6368', '拓展');
INSERT INTO `t_order_region` VALUES ('2614', '469523', '469005', '宝芳乡', '中国,海南省,文昌市,宝芳乡', '宝芳乡', '中国,海南,文昌,宝芳乡', '3', '0898', '571337', 'Baofang', 'BF', 'B', '110.82', '19.7148', '拓展');
INSERT INTO `t_order_region` VALUES ('2615', '469524', '469005', '龙马乡', '中国,海南省,文昌市,龙马乡', '龙马乡', '中国,海南,文昌,龙马乡', '3', '0898', '571329', 'Longma', 'LM', 'L', '110.956', '19.8676', '拓展');
INSERT INTO `t_order_region` VALUES ('2616', '469525', '469005', '湖山乡', '中国,海南省,文昌市,湖山乡', '湖山乡', '中国,海南,文昌,湖山乡', '3', '0898', '571325', 'Hushan', 'HS', 'H', '110.707', '19.9208', '拓展');
INSERT INTO `t_order_region` VALUES ('2617', '469526', '469005', '东路农场', '中国,海南省,文昌市,东路农场', '东路农场', '中国,海南,文昌,东路农场', '3', '0898', '571300', 'Donglu', 'DL', 'D', '110.681', '19.7353', '拓展');
INSERT INTO `t_order_region` VALUES ('2618', '469527', '469005', '南阳农场', '中国,海南省,文昌市,南阳农场', '南阳农场', '中国,海南,文昌,南阳农场', '3', '0898', '571300', 'Nanyang', 'NY', 'N', '110.654', '19.5644', '拓展');
INSERT INTO `t_order_region` VALUES ('2619', '469528', '469005', '罗豆农场', '中国,海南省,文昌市,罗豆农场', '罗豆农场', '中国,海南,文昌,罗豆农场', '3', '0898', '571300', 'Luodou', 'LD', 'L', '110.642', '19.9725', '拓展');
INSERT INTO `t_order_region` VALUES ('2620', '469601', '469006', '万城镇', '中国,海南省,万宁市,万城镇', '万城镇', '中国,海南,万宁,万城镇', '3', '0898', '571599', 'Wancheng', 'WC', 'W', '110.397', '18.7944', '拓展');
INSERT INTO `t_order_region` VALUES ('2621', '469602', '469006', '龙滚镇', '中国,海南省,万宁市,龙滚镇', '龙滚镇', '中国,海南,万宁,龙滚镇', '3', '0898', '571521', 'Longgun', 'LG', 'L', '110.519', '19.0587', '拓展');
INSERT INTO `t_order_region` VALUES ('2622', '469603', '469006', '和乐镇', '中国,海南省,万宁市,和乐镇', '和乐镇', '中国,海南,万宁,和乐镇', '3', '0898', '571523', 'Hele', 'HL', 'H', '110.478', '18.9035', '拓展');
INSERT INTO `t_order_region` VALUES ('2623', '469604', '469006', '后安镇', '中国,海南省,万宁市,后安镇', '后安镇', '中国,海南,万宁,后安镇', '3', '0898', '571525', 'Hou\'an', 'HA', 'H', '110.444', '18.868', '拓展');
INSERT INTO `t_order_region` VALUES ('2624', '469605', '469006', '大茂镇', '中国,海南省,万宁市,大茂镇', '大茂镇', '中国,海南,万宁,大茂镇', '3', '0898', '571541', 'Damao', 'DM', 'D', '110.396', '18.849', '拓展');
INSERT INTO `t_order_region` VALUES ('2625', '469606', '469006', '东澳镇', '中国,海南省,万宁市,东澳镇', '东澳镇', '中国,海南,万宁,东澳镇', '3', '0898', '571528', 'Dong\'ao', 'DA', 'D', '110.402', '18.7148', '拓展');
INSERT INTO `t_order_region` VALUES ('2626', '469607', '469006', '礼纪镇', '中国,海南省,万宁市,礼纪镇', '礼纪镇', '中国,海南,万宁,礼纪镇', '3', '0898', '571529', 'Liji', 'LJ', 'L', '110.318', '18.7504', '拓展');
INSERT INTO `t_order_region` VALUES ('2627', '469608', '469006', '长丰镇', '中国,海南省,万宁市,长丰镇', '长丰镇', '中国,海南,万宁,长丰镇', '3', '0898', '571535', 'Changfeng', 'CF', 'C', '110.332', '18.7998', '拓展');
INSERT INTO `t_order_region` VALUES ('2628', '469609', '469006', '山根镇', '中国,海南省,万宁市,山根镇', '山根镇', '中国,海南,万宁,山根镇', '3', '0898', '571522', 'Shangen', 'SG', 'S', '110.483', '18.9633', '拓展');
INSERT INTO `t_order_region` VALUES ('2629', '469610', '469006', '北大镇', '中国,海南省,万宁市,北大镇', '北大镇', '中国,海南,万宁,北大镇', '3', '0898', '571539', 'Beida', 'BD', 'B', '110.336', '18.918', '拓展');
INSERT INTO `t_order_region` VALUES ('2630', '469611', '469006', '南桥镇', '中国,海南省,万宁市,南桥镇', '南桥镇', '中国,海南,万宁,南桥镇', '3', '0898', '571532', 'Nanqiao', 'NQ', 'N', '110.153', '18.6803', '拓展');
INSERT INTO `t_order_region` VALUES ('2631', '469612', '469006', '三更罗镇', '中国,海南省,万宁市,三更罗镇', '三更罗镇', '中国,海南,万宁,三更罗镇', '3', '0898', '571536', 'Sangengluo', 'SGL', 'S', '110.187', '18.8612', '拓展');
INSERT INTO `t_order_region` VALUES ('2632', '469613', '469006', '东岭农场', '中国,海南省,万宁市,东岭农场', '东岭农场', '中国,海南,万宁,东岭农场', '3', '0898', '571544', 'Dongning', 'DN', 'D', '110.382', '18.9793', '拓展');
INSERT INTO `t_order_region` VALUES ('2633', '469614', '469006', '南林农场', '中国,海南省,万宁市,南林农场', '南林农场', '中国,海南,万宁,南林农场', '3', '0898', '571532', 'Nanlin', 'NL', 'N', '110.158', '18.6823', '拓展');
INSERT INTO `t_order_region` VALUES ('2634', '469615', '469006', '东兴农场', '中国,海南省,万宁市,东兴农场', '东兴农场', '中国,海南,万宁,东兴农场', '3', '0898', '571539', 'Dongxing', 'DX', 'D', '110.334', '18.9289', '拓展');
INSERT INTO `t_order_region` VALUES ('2635', '469616', '469006', '东和农场', '中国,海南省,万宁市,东和农场', '东和农场', '中国,海南,万宁,东和农场', '3', '0898', '571534', 'Donghe', 'DH', 'D', '110.262', '18.7806', '拓展');
INSERT INTO `t_order_region` VALUES ('2636', '469617', '469006', '新中农场', '中国,海南省,万宁市,新中农场', '新中农场', '中国,海南,万宁,新中农场', '3', '0898', '571536', 'Xinzhong', 'XZ', 'X', '110.195', '18.8538', '拓展');
INSERT INTO `t_order_region` VALUES ('2637', '469618', '469006', '兴隆华侨农场', '中国,海南省,万宁市,兴隆华侨农场', '兴隆华侨农场', '中国,海南,万宁,兴隆华侨农场', '3', '0898', '571533', 'Xinglong', 'XL', 'X', '110.211', '18.7482', '拓展');
INSERT INTO `t_order_region` VALUES ('2638', '469701', '469007', '八所镇', '中国,海南省,东方市,八所镇', '八所镇', '中国,海南,东方,八所镇', '3', '0898', '572699', 'Basuo', 'BS', 'B', '108.671', '19.0922', '拓展');
INSERT INTO `t_order_region` VALUES ('2639', '469702', '469007', '东河镇', '中国,海南省,东方市,东河镇', '东河镇', '中国,海南,东方,东河镇', '3', '0898', '572626', 'Donghe', 'DH', 'D', '108.938', '19.0482', '拓展');
INSERT INTO `t_order_region` VALUES ('2640', '469703', '469007', '大田镇', '中国,海南省,东方市,大田镇', '大田镇', '中国,海南,东方,大田镇', '3', '0898', '572624', 'Datian', 'DT', 'D', '108.875', '19.165', '拓展');
INSERT INTO `t_order_region` VALUES ('2641', '469704', '469007', '感城镇', '中国,海南省,东方市,感城镇', '感城镇', '中国,海南,东方,感城镇', '3', '0898', '572633', 'Gancheng', 'GC', 'G', '108.647', '18.8476', '拓展');
INSERT INTO `t_order_region` VALUES ('2642', '469705', '469007', '板桥镇', '中国,海南省,东方市,板桥镇', '板桥镇', '中国,海南,东方,板桥镇', '3', '0898', '572634', 'Banqiao', 'BQ', 'B', '108.689', '18.7949', '拓展');
INSERT INTO `t_order_region` VALUES ('2643', '469706', '469007', '三家镇', '中国,海南省,东方市,三家镇', '三家镇', '中国,海南,东方,三家镇', '3', '0898', '572623', 'Sanjia', 'SJ', 'S', '108.758', '19.2412', '拓展');
INSERT INTO `t_order_region` VALUES ('2644', '469707', '469007', '四更镇', '中国,海南省,东方市,四更镇', '四更镇', '中国,海南,东方,四更镇', '3', '0898', '572622', 'Sigeng', 'SG', 'S', '108.682', '19.2256', '拓展');
INSERT INTO `t_order_region` VALUES ('2645', '469708', '469007', '新龙镇', '中国,海南省,东方市,新龙镇', '新龙镇', '中国,海南,东方,新龙镇', '3', '0898', '572632', 'Xinlong', 'XL', 'X', '108.685', '18.952', '拓展');
INSERT INTO `t_order_region` VALUES ('2646', '469709', '469007', '天安乡', '中国,海南省,东方市,天安乡', '天安乡', '中国,海南,东方,天安乡', '3', '0898', '572626', 'Tian\'an', 'TA', 'T', '108.913', '19.0174', '拓展');
INSERT INTO `t_order_region` VALUES ('2647', '469710', '469007', '江边乡', '中国,海南省,东方市,江边乡', '江边乡', '中国,海南,东方,江边乡', '3', '0898', '572628', 'Jiangbian', 'JB', 'J', '108.977', '18.8944', '拓展');
INSERT INTO `t_order_region` VALUES ('2648', '469711', '469007', '广坝农场', '中国,海南省,东方市,广坝农场', '广坝农场', '中国,海南,东方,广坝农场', '3', '0898', '572626', 'Guangba', 'GB', 'G', '108.946', '19.0436', '拓展');
INSERT INTO `t_order_region` VALUES ('2649', '469712', '469007', '东方华侨农场', '中国,海南省,东方市,东方华侨农场', '东方华侨农场', '中国,海南,东方,东方华侨农场', '3', '0898', '572632', 'Dongfang', 'DF', 'D', '108.691', '18.9825', '拓展');
INSERT INTO `t_order_region` VALUES ('2650', '469801', '469021', '定城镇', '中国,海南省,定安县,定城镇', '定城镇', '中国,海南,定安,定城镇', '3', '0898', '571299', 'Dingcheng', 'DC', 'D', '110.368', '19.6803', '拓展');
INSERT INTO `t_order_region` VALUES ('2651', '469802', '469021', '新竹镇', '中国,海南省,定安县,新竹镇', '新竹镇', '中国,海南,定安,新竹镇', '3', '0898', '571236', 'Xinzhu', 'XZ', 'X', '110.209', '19.6178', '拓展');
INSERT INTO `t_order_region` VALUES ('2652', '469803', '469021', '龙湖镇', '中国,海南省,定安县,龙湖镇', '龙湖镇', '中国,海南,定安,龙湖镇', '3', '0898', '571222', 'Longhu', 'LH', 'L', '110.401', '19.5732', '拓展');
INSERT INTO `t_order_region` VALUES ('2653', '469804', '469021', '雷鸣镇', '中国,海南省,定安县,雷鸣镇', '雷鸣镇', '中国,海南,定安,雷鸣镇', '3', '0898', '571225', 'Leiming', 'LM', 'L', '110.326', '19.5537', '拓展');
INSERT INTO `t_order_region` VALUES ('2654', '469805', '469021', '龙门镇', '中国,海南省,定安县,龙门镇', '龙门镇', '中国,海南,定安,龙门镇', '3', '0898', '571226', 'Longmen', 'LM', 'L', '110.328', '19.4392', '拓展');
INSERT INTO `t_order_region` VALUES ('2655', '469806', '469021', '龙河镇', '中国,海南省,定安县,龙河镇', '龙河镇', '中国,海南,定安,龙河镇', '3', '0898', '571231', 'Longhe', 'LH', 'L', '110.219', '19.3819', '拓展');
INSERT INTO `t_order_region` VALUES ('2656', '469807', '469021', '岭口镇', '中国,海南省,定安县,岭口镇', '岭口镇', '中国,海南,定安,岭口镇', '3', '0898', '571227', 'Lingkou', 'LK', 'L', '110.308', '19.3426', '拓展');
INSERT INTO `t_order_region` VALUES ('2657', '469808', '469021', '翰林镇', '中国,海南省,定安县,翰林镇', '翰林镇', '中国,海南,定安,翰林镇', '3', '0898', '571228', 'Hanlin', 'HL', 'H', '110.265', '19.3338', '拓展');
INSERT INTO `t_order_region` VALUES ('2658', '469809', '469021', '富文镇', '中国,海南省,定安县,富文镇', '富文镇', '中国,海南,定安,富文镇', '3', '0898', '571234', 'Fuwen', 'FW', 'F', '110.262', '19.5511', '拓展');
INSERT INTO `t_order_region` VALUES ('2659', '469810', '469021', '黄竹镇', '中国,海南省,定安县,黄竹镇', '黄竹镇', '中国,海南,定安,黄竹镇', '3', '0898', '571224', 'Huangzhu', 'HZ', 'H', '110.447', '19.4728', '拓展');
INSERT INTO `t_order_region` VALUES ('2660', '469811', '469021', '金鸡岭农场', '中国,海南省,定安县,金鸡岭农场', '金鸡岭农场', '中国,海南,定安,金鸡岭农场', '3', '0898', '571200', 'Jinjiling', 'JJL', 'J', '110.261', '19.5933', '拓展');
INSERT INTO `t_order_region` VALUES ('2661', '469812', '469021', '中瑞农场', '中国,海南省,定安县,中瑞农场', '中瑞农场', '中国,海南,定安,中瑞农场', '3', '0898', '571200', 'Zhongrui', 'ZR', 'Z', '110.307', '19.2505', '拓展');
INSERT INTO `t_order_region` VALUES ('2662', '469813', '469021', '南海农场', '中国,海南省,定安县,南海农场', '南海农场', '中国,海南,定安,南海农场', '3', '0898', '571200', 'Nanhai', 'NH', 'N', '110.447', '19.4715', '拓展');
INSERT INTO `t_order_region` VALUES ('2663', '469814', '469021', '城区', '中国,海南省,定安县,城区', '城区', '中国,海南,定安,城区', '3', '0898', '571200', 'Chengqu', 'CQ', 'C', '110.359', '19.6814', '拓展');
INSERT INTO `t_order_region` VALUES ('2664', '469821', '469022', '屯城镇', '中国,海南省,屯昌县,屯城镇', '屯城镇', '中国,海南,屯昌,屯城镇', '3', '0898', '571699', 'Tuncheng', 'TC', 'T', '110.105', '19.3716', '拓展');
INSERT INTO `t_order_region` VALUES ('2665', '469822', '469022', '新兴镇', '中国,海南省,屯昌县,新兴镇', '新兴镇', '中国,海南,屯昌,新兴镇', '3', '0898', '571621', 'Xinxing', 'XX', 'X', '110.183', '19.5067', '拓展');
INSERT INTO `t_order_region` VALUES ('2666', '469823', '469022', '枫木镇', '中国,海南省,屯昌县,枫木镇', '枫木镇', '中国,海南,屯昌,枫木镇', '3', '0898', '571627', 'Fengmu', 'FM', 'F', '110.019', '19.2145', '拓展');
INSERT INTO `t_order_region` VALUES ('2667', '469824', '469022', '乌坡镇', '中国,海南省,屯昌县,乌坡镇', '乌坡镇', '中国,海南,屯昌,乌坡镇', '3', '0898', '571626', 'Wupo', 'WP', 'W', '110.076', '19.18', '拓展');
INSERT INTO `t_order_region` VALUES ('2668', '469825', '469022', '南吕镇', '中国,海南省,屯昌县,南吕镇', '南吕镇', '中国,海南,屯昌,南吕镇', '3', '0898', '571625', 'Nanlv', 'NL', 'N', '110.085', '19.2474', '拓展');
INSERT INTO `t_order_region` VALUES ('2669', '469826', '469022', '南坤镇', '中国,海南省,屯昌县,南坤镇', '南坤镇', '中国,海南,屯昌,南坤镇', '3', '0898', '571632', 'Nankun', 'NK', 'N', '109.948', '19.3184', '拓展');
INSERT INTO `t_order_region` VALUES ('2670', '469827', '469022', '坡心镇', '中国,海南省,屯昌县,坡心镇', '坡心镇', '中国,海南,屯昌,坡心镇', '3', '0898', '571629', 'Poxin', 'PX', 'P', '110.09', '19.3071', '拓展');
INSERT INTO `t_order_region` VALUES ('2671', '469828', '469022', '西昌镇', '中国,海南省,屯昌县,西昌镇', '西昌镇', '中国,海南,屯昌,西昌镇', '3', '0898', '571636', 'Xichang', 'XC', 'X', '110.046', '19.4337', '拓展');
INSERT INTO `t_order_region` VALUES ('2672', '469829', '469022', '中建农场', '中国,海南省,屯昌县,中建农场', '中建农场', '中国,海南,屯昌,中建农场', '3', '0898', '571624', 'Zhongjian', 'ZJ', 'Z', '110.17', '19.2841', '拓展');
INSERT INTO `t_order_region` VALUES ('2673', '469830', '469022', '中坤农场', '中国,海南省,屯昌县,中坤农场', '中坤农场', '中国,海南,屯昌,中坤农场', '3', '0898', '571600', 'Zhongkun', 'ZK', 'Z', '109.95', '19.3164', '拓展');
INSERT INTO `t_order_region` VALUES ('2674', '469831', '469022', '县城内', '中国,海南省,屯昌县,县城内', '县城内', '中国,海南,屯昌,县城内', '3', '0898', '571600', 'Xiancheng', 'XC', 'X', '110.103', '19.3609', '拓展');
INSERT INTO `t_order_region` VALUES ('2675', '469841', '469023', '金江镇', '中国,海南省,澄迈县,金江镇', '金江镇', '中国,海南,澄迈,金江镇', '3', '0898', '571999', 'Jinjiang', 'JJ', 'J', '110.01', '19.7368', '拓展');
INSERT INTO `t_order_region` VALUES ('2676', '469842', '469023', '老城镇', '中国,海南省,澄迈县,老城镇', '老城镇', '中国,海南,澄迈,老城镇', '3', '0898', '571924', 'Laocheng', 'LC', 'L', '110.126', '19.9619', '拓展');
INSERT INTO `t_order_region` VALUES ('2677', '469843', '469023', '瑞溪镇', '中国,海南省,澄迈县,瑞溪镇', '瑞溪镇', '中国,海南,澄迈,瑞溪镇', '3', '0898', '571933', 'Ruixi', 'RX', 'R', '110.134', '19.7317', '拓展');
INSERT INTO `t_order_region` VALUES ('2678', '469844', '469023', '永发镇', '中国,海南省,澄迈县,永发镇', '永发镇', '中国,海南,澄迈,永发镇', '3', '0898', '571929', 'Yongfa', 'YF', 'Y', '110.195', '19.7474', '拓展');
INSERT INTO `t_order_region` VALUES ('2679', '469845', '469023', '加乐镇', '中国,海南省,澄迈县,加乐镇', '加乐镇', '中国,海南,澄迈,加乐镇', '3', '0898', '571938', 'Jiale', 'JL', 'J', '110.001', '19.585', '拓展');
INSERT INTO `t_order_region` VALUES ('2680', '469846', '469023', '文儒镇', '中国,海南省,澄迈县,文儒镇', '文儒镇', '中国,海南,澄迈,文儒镇', '3', '0898', '571937', 'Wenru', 'WR', 'W', '110.053', '19.5371', '拓展');
INSERT INTO `t_order_region` VALUES ('2681', '469847', '469023', '中兴镇', '中国,海南省,澄迈县,中兴镇', '中兴镇', '中国,海南,澄迈,中兴镇', '3', '0898', '571944', 'Zhongxing', 'ZX', 'Z', '109.861', '19.5648', '拓展');
INSERT INTO `t_order_region` VALUES ('2682', '469848', '469023', '仁兴镇', '中国,海南省,澄迈县,仁兴镇', '仁兴镇', '中国,海南,澄迈,仁兴镇', '3', '0898', '571941', 'Renxing', 'RX', 'R', '109.883', '19.4921', '拓展');
INSERT INTO `t_order_region` VALUES ('2683', '469849', '469023', '福山镇', '中国,海南省,澄迈县,福山镇', '福山镇', '中国,海南,澄迈,福山镇', '3', '0898', '571921', 'Fushan', 'FS', 'F', '109.93', '19.8302', '拓展');
INSERT INTO `t_order_region` VALUES ('2684', '469850', '469023', '桥头镇', '中国,海南省,澄迈县,桥头镇', '桥头镇', '中国,海南,澄迈,桥头镇', '3', '0898', '571922', 'Qiaotou', 'QT', 'Q', '109.934', '19.9541', '拓展');
INSERT INTO `t_order_region` VALUES ('2685', '469851', '469023', '大丰镇', '中国,海南省,澄迈县,大丰镇', '大丰镇', '中国,海南,澄迈,大丰镇', '3', '0898', '571926', 'Dafeng', 'DF', 'D', '110.038', '19.8555', '拓展');
INSERT INTO `t_order_region` VALUES ('2686', '469852', '469023', '红光农场', '中国,海南省,澄迈县,红光农场', '红光农场', '中国,海南,澄迈,红光农场', '3', '0898', '571921', 'Hongguang', 'HG', 'H', '109.921', '19.8378', '拓展');
INSERT INTO `t_order_region` VALUES ('2687', '469853', '469023', '西达农场', '中国,海南省,澄迈县,西达农场', '西达农场', '中国,海南,澄迈,西达农场', '3', '0898', '571941', 'Xida', 'XD', 'X', '109.885', '19.4836', '拓展');
INSERT INTO `t_order_region` VALUES ('2688', '469854', '469023', '金安农场', '中国,海南省,澄迈县,金安农场', '金安农场', '中国,海南,澄迈,金安农场', '3', '0898', '571932', 'Jin\'an', 'JA', 'J', '110.109', '19.7666', '拓展');
INSERT INTO `t_order_region` VALUES ('2689', '469855', '469023', '城区', '中国,海南省,澄迈县,城区', '城区', '中国,海南,澄迈,城区', '3', '0898', '571900', 'Chengqu', 'CQ', 'C', '110.007', '19.7385', '拓展');
INSERT INTO `t_order_region` VALUES ('2690', '469861', '469024', '临城镇', '中国,海南省,临高县,临城镇', '临城镇', '中国,海南,临高,临城镇', '3', '0898', '571899', 'Lincheng', 'LC', 'L', '109.696', '19.8965', '拓展');
INSERT INTO `t_order_region` VALUES ('2691', '469862', '469024', '波莲镇', '中国,海南省,临高县,波莲镇', '波莲镇', '中国,海南,临高,波莲镇', '3', '0898', '571834', 'Bolian', 'BL', 'B', '109.648', '19.8682', '拓展');
INSERT INTO `t_order_region` VALUES ('2692', '469863', '469024', '东英镇', '中国,海南省,临高县,东英镇', '东英镇', '中国,海南,临高,东英镇', '3', '0898', '571837', 'Dongying', 'DY', 'D', '109.649', '19.959', '拓展');
INSERT INTO `t_order_region` VALUES ('2693', '469864', '469024', '博厚镇', '中国,海南省,临高县,博厚镇', '博厚镇', '中国,海南,临高,博厚镇', '3', '0898', '571821', 'Bohou', 'BH', 'B', '109.746', '19.8837', '拓展');
INSERT INTO `t_order_region` VALUES ('2694', '469865', '469024', '皇桐镇', '中国,海南省,临高县,皇桐镇', '皇桐镇', '中国,海南,临高,皇桐镇', '3', '0898', '571823', 'Huangtong', 'HT', 'H', '109.85', '19.8329', '拓展');
INSERT INTO `t_order_region` VALUES ('2695', '469866', '469024', '多文镇', '中国,海南省,临高县,多文镇', '多文镇', '中国,海南,临高,多文镇', '3', '0898', '571825', 'Duowen', 'DW', 'D', '109.771', '19.7738', '拓展');
INSERT INTO `t_order_region` VALUES ('2696', '469867', '469024', '和舍镇', '中国,海南省,临高县,和舍镇', '和舍镇', '中国,海南,临高,和舍镇', '3', '0898', '571831', 'Heshe', 'HS', 'H', '109.728', '19.5963', '拓展');
INSERT INTO `t_order_region` VALUES ('2697', '469868', '469024', '南宝镇', '中国,海南省,临高县,南宝镇', '南宝镇', '中国,海南,临高,南宝镇', '3', '0898', '571832', 'Nanbao', 'NB', 'N', '109.6', '19.6805', '拓展');
INSERT INTO `t_order_region` VALUES ('2698', '469869', '469024', '新盈镇', '中国,海南省,临高县,新盈镇', '新盈镇', '中国,海南,临高,新盈镇', '3', '0898', '571835', 'Xinying', 'XY', 'X', '109.536', '19.8951', '拓展');
INSERT INTO `t_order_region` VALUES ('2699', '469870', '469024', '调楼镇', '中国,海南省,临高县,调楼镇', '调楼镇', '中国,海南,临高,调楼镇', '3', '0898', '571836', 'Tiaolou', 'TL', 'T', '109.544', '19.9351', '拓展');
INSERT INTO `t_order_region` VALUES ('2700', '469871', '469024', '加来镇', '中国,海南省,临高县,加来镇', '加来镇', '中国,海南,临高,加来镇', '3', '0898', '571833', 'Jialai', 'JL', 'J', '109.699', '19.7099', '拓展');
INSERT INTO `t_order_region` VALUES ('2701', '469872', '469024', '红华农场', '中国,海南省,临高县,红华农场', '红华农场', '中国,海南,临高,红华农场', '3', '0898', '571825', 'Honghua', 'HH', 'H', '109.775', '19.7745', '拓展');
INSERT INTO `t_order_region` VALUES ('2702', '469873', '469024', '加来农场', '中国,海南省,临高县,加来农场', '加来农场', '中国,海南,临高,加来农场', '3', '0898', '571833', 'Jialai', 'JL', 'J', '109.7', '19.7059', '拓展');
INSERT INTO `t_order_region` VALUES ('2703', '469874', '469024', '城区', '中国,海南省,临高县,城区', '城区', '中国,海南,临高,城区', '3', '0898', '571800', 'Chengqu', 'CQ', 'C', '109.691', '19.912', '拓展');
INSERT INTO `t_order_region` VALUES ('2704', '469881', '469025', '牙叉镇', '中国,海南省,白沙黎族自治县,牙叉镇', '牙叉镇', '中国,海南,白沙,牙叉镇', '3', '0898', '572800', 'Yacha', 'YC', 'Y', '109.445', '19.2122', '拓展');
INSERT INTO `t_order_region` VALUES ('2705', '469882', '469025', '七坊镇', '中国,海南省,白沙黎族自治县,七坊镇', '七坊镇', '中国,海南,白沙,七坊镇', '3', '0898', '572818', 'Qifang', 'QF', 'Q', '109.244', '19.2953', '拓展');
INSERT INTO `t_order_region` VALUES ('2706', '469883', '469025', '邦溪镇', '中国,海南省,白沙黎族自治县,邦溪镇', '邦溪镇', '中国,海南,白沙,邦溪镇', '3', '0898', '572821', 'Bangxi', 'BX', 'B', '109.104', '19.3695', '拓展');
INSERT INTO `t_order_region` VALUES ('2707', '469884', '469025', '打安镇', '中国,海南省,白沙黎族自治县,打安镇', '打安镇', '中国,海南,白沙,打安镇', '3', '0898', '572828', 'Da\'an', 'DA', 'D', '109.374', '19.2839', '拓展');
INSERT INTO `t_order_region` VALUES ('2708', '469885', '469025', '细水乡', '中国,海南省,白沙黎族自治县,细水乡', '细水乡', '中国,海南,白沙,细水乡', '3', '0898', '572811', 'Xishui', 'XS', 'X', '109.569', '19.2064', '拓展');
INSERT INTO `t_order_region` VALUES ('2709', '469886', '469025', '元门乡', '中国,海南省,白沙黎族自治县,元门乡', '元门乡', '中国,海南,白沙,元门乡', '3', '0898', '572813', 'Yuanmen', 'YM', 'Y', '109.486', '19.1581', '拓展');
INSERT INTO `t_order_region` VALUES ('2710', '469887', '469025', '南开乡', '中国,海南省,白沙黎族自治县,南开乡', '南开乡', '中国,海南,白沙,南开乡', '3', '0898', '572814', 'Nankai', 'NK', 'N', '109.418', '19.0769', '拓展');
INSERT INTO `t_order_region` VALUES ('2711', '469888', '469025', '阜龙乡', '中国,海南省,白沙黎族自治县,阜龙乡', '阜龙乡', '中国,海南,白沙,阜龙乡', '3', '0898', '572829', 'Fulong', 'FL', 'F', '109.461', '19.3226', '拓展');
INSERT INTO `t_order_region` VALUES ('2712', '469889', '469025', '青松乡', '中国,海南省,白沙黎族自治县,青松乡', '青松乡', '中国,海南,白沙,青松乡', '3', '0898', '572816', 'Qingsong', 'QS', 'Q', '109.277', '19.1544', '拓展');
INSERT INTO `t_order_region` VALUES ('2713', '469890', '469025', '金波乡', '中国,海南省,白沙黎族自治县,金波乡', '金波乡', '中国,海南,白沙,金波乡', '3', '0898', '572817', 'Jinbo', 'JB', 'J', '109.178', '19.2366', '拓展');
INSERT INTO `t_order_region` VALUES ('2714', '469891', '469025', '荣邦乡', '中国,海南省,白沙黎族自治县,荣邦乡', '荣邦乡', '中国,海南,白沙,荣邦乡', '3', '0898', '572823', 'Rongbang', 'RB', 'R', '109.171', '19.414', '拓展');
INSERT INTO `t_order_region` VALUES ('2715', '469892', '469025', '白沙农场', '中国,海南省,白沙黎族自治县,白沙农场', '白沙农场', '中国,海南,白沙,白沙农场', '3', '0898', '572899', 'Baisha', 'BS', 'B', '109.475', '19.1951', '拓展');
INSERT INTO `t_order_region` VALUES ('2716', '469893', '469025', '龙江农场', '中国,海南省,白沙黎族自治县,龙江农场', '龙江农场', '中国,海南,白沙,龙江农场', '3', '0898', '572818', 'Longjiang', 'LJ', 'L', '109.242', '19.2994', '拓展');
INSERT INTO `t_order_region` VALUES ('2717', '469894', '469025', '邦溪农场', '中国,海南省,白沙黎族自治县,邦溪农场', '邦溪农场', '中国,海南,白沙,邦溪农场', '3', '0898', '572821', 'Bangxi', 'BX', 'B', '109.127', '19.4031', '拓展');
INSERT INTO `t_order_region` VALUES ('2718', '469895', '469025', '城区', '中国,海南省,白沙黎族自治县,城区', '城区', '中国,海南,白沙,城区', '3', '0898', '572800', 'Chengqu', 'CQ', 'C', '109.451', '19.2248', '拓展');
INSERT INTO `t_order_region` VALUES ('2719', '469901', '469026', '石碌镇', '中国,海南省,昌江黎族自治县,石碌镇', '石碌镇', '中国,海南,昌江,石碌镇', '3', '0898', '572799', 'Shilu', 'SL', 'S', '109.056', '19.2776', '拓展');
INSERT INTO `t_order_region` VALUES ('2720', '469902', '469026', '叉河镇', '中国,海南省,昌江黎族自治县,叉河镇', '叉河镇', '中国,海南,昌江,叉河镇', '3', '0898', '572724', 'Chahe', 'CH', 'C', '108.957', '19.2389', '拓展');
INSERT INTO `t_order_region` VALUES ('2721', '469903', '469026', '十月田镇', '中国,海南省,昌江黎族自治县,十月田镇', '十月田镇', '中国,海南,昌江,十月田镇', '3', '0898', '572726', 'Shiyuetian', 'SYT', 'S', '108.952', '19.3281', '拓展');
INSERT INTO `t_order_region` VALUES ('2722', '469904', '469026', '乌烈镇', '中国,海南省,昌江黎族自治县,乌烈镇', '乌烈镇', '中国,海南,昌江,乌烈镇', '3', '0898', '572728', 'Wulie', 'WL', 'W', '108.792', '19.2886', '拓展');
INSERT INTO `t_order_region` VALUES ('2723', '469905', '469026', '海尾镇', '中国,海南省,昌江黎族自治县,海尾镇', '海尾镇', '中国,海南,昌江,海尾镇', '3', '0898', '572732', 'Haiwei', 'HW', 'H', '108.82', '19.4256', '拓展');
INSERT INTO `t_order_region` VALUES ('2724', '469906', '469026', '南罗镇', '中国,海南省,昌江黎族自治县,南罗镇', '南罗镇', '中国,海南,昌江,南罗镇', '3', '0898', '572733', 'Nanluo', 'NL', 'N', '108.955', '19.4647', '拓展');
INSERT INTO `t_order_region` VALUES ('2725', '469907', '469026', '太坡镇', '中国,海南省,昌江黎族自治县,太坡镇', '太坡镇', '中国,海南,昌江,太坡镇', '3', '0898', '572799', 'Taipo', 'TP', 'T', '109.04', '19.4058', '拓展');
INSERT INTO `t_order_region` VALUES ('2726', '469908', '469026', '昌化镇', '中国,海南省,昌江黎族自治县,昌化镇', '昌化镇', '中国,海南,昌江,昌化镇', '3', '0898', '572731', 'Changhua', 'CH', 'C', '108.685', '19.3292', '拓展');
INSERT INTO `t_order_region` VALUES ('2727', '469909', '469026', '七叉镇', '中国,海南省,昌江黎族自治县,七叉镇', '七叉镇', '中国,海南,昌江,七叉镇', '3', '0898', '572722', 'Qicha', 'QC', 'Q', '109.051', '19.1148', '拓展');
INSERT INTO `t_order_region` VALUES ('2728', '469910', '469026', '保平乡', '中国,海南省,昌江黎族自治县,保平乡', '保平乡', '中国,海南,昌江,保平乡', '3', '0898', '572726', 'BaoPing', 'BP', 'B', '108.89', '19.2994', '拓展');
INSERT INTO `t_order_region` VALUES ('2729', '469911', '469026', '昌城乡', '中国,海南省,昌江黎族自治县,昌城乡', '昌城乡', '中国,海南,昌江,昌城乡', '3', '0898', '572731', 'Changcheng', 'CC', 'C', '108.7', '19.3096', '拓展');
INSERT INTO `t_order_region` VALUES ('2730', '469912', '469026', '王下乡', '中国,海南省,昌江黎族自治县,王下乡', '王下乡', '中国,海南,昌江,王下乡', '3', '0898', '572722', 'Wangxia', 'WX', 'W', '109.15', '19.0034', '拓展');
INSERT INTO `t_order_region` VALUES ('2731', '469913', '469026', '霸王岭林场', '中国,海南省,昌江黎族自治县,霸王岭林场', '霸王岭林场', '中国,海南,昌江,霸王岭林场', '3', '0898', '572722', 'Bawangling', 'BWL', 'B', '109.146', '19.0691', '拓展');
INSERT INTO `t_order_region` VALUES ('2732', '469914', '469026', '红林农场', '中国,海南省,昌江黎族自治县,红林农场', '红林农场', '中国,海南,昌江,红林农场', '3', '0898', '572724', 'Honglin', 'HL', 'H', '109.058', '19.2627', '拓展');
INSERT INTO `t_order_region` VALUES ('2733', '469915', '469026', '城区', '中国,海南省,昌江黎族自治县,城区', '城区', '中国,海南,昌江,城区', '3', '0898', '572700', 'Chengqu', 'CQ', 'C', '109.055', '19.2609', '拓展');
INSERT INTO `t_order_region` VALUES ('2734', '469920', '469027', '抱由镇', '中国,海南省,乐东黎族自治县,抱由镇', '抱由镇', '中国,海南,乐东,抱由镇', '3', '0898', '572599', 'Baoyou', 'BY', 'B', '109.18', '18.7448', '拓展');
INSERT INTO `t_order_region` VALUES ('2735', '469921', '469027', '万冲镇', '中国,海南省,乐东黎族自治县,万冲镇', '万冲镇', '中国,海南,乐东,万冲镇', '3', '0898', '572521', 'Wanchong', 'WC', 'W', '109.323', '18.8447', '拓展');
INSERT INTO `t_order_region` VALUES ('2736', '469922', '469027', '大安镇', '中国,海南省,乐东黎族自治县,大安镇', '大安镇', '中国,海南,乐东,大安镇', '3', '0898', '572523', 'Da\'an', 'DA', 'D', '109.215', '18.6913', '拓展');
INSERT INTO `t_order_region` VALUES ('2737', '469923', '469027', '志仲镇', '中国,海南省,乐东黎族自治县,志仲镇', '志仲镇', '中国,海南,乐东,志仲镇', '3', '0898', '572524', 'Zhizhong', 'ZZ', 'Z', '109.265', '18.6292', '拓展');
INSERT INTO `t_order_region` VALUES ('2738', '469924', '469027', '千家镇', '中国,海南省,乐东黎族自治县,千家镇', '千家镇', '中国,海南,乐东,千家镇', '3', '0898', '572531', 'Qianjia', 'QJ', 'Q', '109.086', '18.5656', '拓展');
INSERT INTO `t_order_region` VALUES ('2739', '469925', '469027', '九所镇', '中国,海南省,乐东黎族自治县,九所镇', '九所镇', '中国,海南,乐东,九所镇', '3', '0898', '572533', 'Jiusuo', 'JS', 'J', '108.954', '18.4535', '拓展');
INSERT INTO `t_order_region` VALUES ('2740', '469926', '469027', '利国镇', '中国,海南省,乐东黎族自治县,利国镇', '利国镇', '中国,海南,乐东,利国镇', '3', '0898', '572534', 'Liguo', 'LG', 'L', '108.897', '18.4723', '拓展');
INSERT INTO `t_order_region` VALUES ('2741', '469927', '469027', '黄流镇', '中国,海南省,乐东黎族自治县,黄流镇', '黄流镇', '中国,海南,乐东,黄流镇', '3', '0898', '572536', 'Huangliu', 'HL', 'H', '108.793', '18.5046', '拓展');
INSERT INTO `t_order_region` VALUES ('2742', '469928', '469027', '佛罗镇', '中国,海南省,乐东黎族自治县,佛罗镇', '佛罗镇', '中国,海南,乐东,佛罗镇', '3', '0898', '572541', 'Foluo', 'FL', 'F', '108.736', '18.5785', '拓展');
INSERT INTO `t_order_region` VALUES ('2743', '469929', '469027', '尖峰镇', '中国,海南省,乐东黎族自治县,尖峰镇', '尖峰镇', '中国,海南,乐东,尖峰镇', '3', '0898', '572542', 'Jianfeng', 'JF', 'J', '108.792', '18.6904', '拓展');
INSERT INTO `t_order_region` VALUES ('2744', '469930', '469027', '莺歌海镇', '中国,海南省,乐东黎族自治县,莺歌海镇', '莺歌海镇', '中国,海南,乐东,莺歌海镇', '3', '0898', '572539', 'Yinggehai', 'YGH', 'Y', '108.697', '18.5102', '拓展');
INSERT INTO `t_order_region` VALUES ('2745', '469931', '469027', '乐中农场', '中国,海南省,乐东黎族自治县,乐中农场', '乐中农场', '中国,海南,乐东,乐中农场', '3', '0898', '572522', 'Lezhong', 'LZ', 'L', '109.325', '18.8481', '拓展');
INSERT INTO `t_order_region` VALUES ('2746', '469932', '469027', '山荣农场', '中国,海南省,乐东黎族自治县,山荣农场', '山荣农场', '中国,海南,乐东,山荣农场', '3', '0898', '572501', 'Shanrong', 'SR', 'S', '109.164', '18.7695', '拓展');
INSERT INTO `t_order_region` VALUES ('2747', '469933', '469027', '乐光农场', '中国,海南省,乐东黎族自治县,乐光农场', '乐光农场', '中国,海南,乐东,乐光农场', '3', '0898', '572529', 'Leguang', 'LG', 'L', '109.116', '18.6247', '拓展');
INSERT INTO `t_order_region` VALUES ('2748', '469934', '469027', '报伦农场', '中国,海南省,乐东黎族自治县,报伦农场', '报伦农场', '中国,海南,乐东,报伦农场', '3', '0898', '572543', 'Baolun', 'BL', 'B', '109.05', '18.5911', '拓展');
INSERT INTO `t_order_region` VALUES ('2749', '469935', '469027', '福报农场', '中国,海南省,乐东黎族自治县,福报农场', '福报农场', '中国,海南,乐东,福报农场', '3', '0898', '572532', 'Fubao', 'FB', 'F', '109.071', '18.5288', '拓展');
INSERT INTO `t_order_region` VALUES ('2750', '469936', '469027', '保国农场', '中国,海南省,乐东黎族自治县,保国农场', '保国农场', '中国,海南,乐东,保国农场', '3', '0898', '572525', 'Baoguo', 'BG', 'B', '109.29', '18.5712', '拓展');
INSERT INTO `t_order_region` VALUES ('2751', '469937', '469027', '保显农场', '中国,海南省,乐东黎族自治县,保显农场', '保显农场', '中国,海南,乐东,保显农场', '3', '0898', '572526', 'Baoxian', 'BX', 'B', '109.318', '18.6168', '拓展');
INSERT INTO `t_order_region` VALUES ('2752', '469938', '469027', '尖峰岭林业', '中国,海南省,乐东黎族自治县,尖峰岭林业', '尖峰岭林业', '中国,海南,乐东,尖峰岭林业', '3', '0898', '572500', 'Jianfengling', 'JFL', 'J', '108.815', '18.6979', '拓展');
INSERT INTO `t_order_region` VALUES ('2753', '469939', '469027', '莺歌海盐场', '中国,海南省,乐东黎族自治县,莺歌海盐场', '莺歌海盐场', '中国,海南,乐东,莺歌海盐场', '3', '0898', '572500', 'Yinggehai', 'YGH', 'Y', '108.741', '18.4977', '拓展');
INSERT INTO `t_order_region` VALUES ('2754', '469940', '469027', '城区', '中国,海南省,乐东黎族自治县,城区', '城区', '中国,海南,乐东,城区', '3', '0898', '572500', 'Chengqu', 'CQ', 'C', '109.178', '18.7435', '拓展');
INSERT INTO `t_order_region` VALUES ('2755', '469941', '469028', '椰林镇', '中国,海南省,陵水黎族自治县,椰林镇', '椰林镇', '中国,海南,陵水,椰林镇', '3', '0898', '572499', 'Yelin', 'YL', 'Y', '110.036', '18.5061', '拓展');
INSERT INTO `t_order_region` VALUES ('2756', '469942', '469028', '光坡镇', '中国,海南省,陵水黎族自治县,光坡镇', '光坡镇', '中国,海南,陵水,光坡镇', '3', '0898', '572422', 'Guangpo', 'GP', 'G', '110.049', '18.5434', '拓展');
INSERT INTO `t_order_region` VALUES ('2757', '469943', '469028', '三才镇', '中国,海南省,陵水黎族自治县,三才镇', '三才镇', '中国,海南,陵水,三才镇', '3', '0898', '572424', 'Sancai', 'SC', 'S', '110.003', '18.4746', '拓展');
INSERT INTO `t_order_region` VALUES ('2758', '469944', '469028', '英州镇', '中国,海南省,陵水黎族自治县,英州镇', '英州镇', '中国,海南,陵水,英州镇', '3', '0898', '572427', 'Yingzhou', 'YZ', 'Y', '109.859', '18.4271', '拓展');
INSERT INTO `t_order_region` VALUES ('2759', '469945', '469028', '隆广镇', '中国,海南省,陵水黎族自治县,隆广镇', '隆广镇', '中国,海南,陵水,隆广镇', '3', '0898', '572429', 'Longguang', 'LG', 'L', '109.907', '18.5012', '拓展');
INSERT INTO `t_order_region` VALUES ('2760', '469946', '469028', '文罗镇', '中国,海南省,陵水黎族自治县,文罗镇', '文罗镇', '中国,海南,陵水,文罗镇', '3', '0898', '572429', 'Wenluo', 'WL', 'W', '109.962', '18.5141', '拓展');
INSERT INTO `t_order_region` VALUES ('2761', '469947', '469028', '本号镇', '中国,海南省,陵水黎族自治县,本号镇', '本号镇', '中国,海南,陵水,本号镇', '3', '0898', '572434', 'Benhao', 'BH', 'B', '109.967', '18.6084', '拓展');
INSERT INTO `t_order_region` VALUES ('2762', '469948', '469028', '新村镇', '中国,海南省,陵水黎族自治县,新村镇', '新村镇', '中国,海南,陵水,新村镇', '3', '0898', '572426', 'Xincun', 'XC', 'X', '109.971', '18.4124', '拓展');
INSERT INTO `t_order_region` VALUES ('2763', '469949', '469028', '黎安镇', '中国,海南省,陵水黎族自治县,黎安镇', '黎安镇', '中国,海南,陵水,黎安镇', '3', '0898', '572423', 'Li\'an', 'LA', 'L', '110.07', '18.4373', '拓展');
INSERT INTO `t_order_region` VALUES ('2764', '469950', '469028', '提蒙乡', '中国,海南省,陵水黎族自治县,提蒙乡', '提蒙乡', '中国,海南,陵水,提蒙乡', '3', '0898', '572435', 'Timeng', 'TM', 'T', '110.013', '18.5648', '拓展');
INSERT INTO `t_order_region` VALUES ('2765', '469951', '469028', '群英乡', '中国,海南省,陵水黎族自治县,群英乡', '群英乡', '中国,海南,陵水,群英乡', '3', '0898', '572431', 'Qunying', 'QY', 'Q', '109.88', '18.5815', '拓展');
INSERT INTO `t_order_region` VALUES ('2766', '469952', '469028', '岭门农场', '中国,海南省,陵水黎族自治县,岭门农场', '岭门农场', '中国,海南,陵水,岭门农场', '3', '0898', '572421', 'Lingmeng', 'LS', 'L', '110.037', '18.6018', '拓展');
INSERT INTO `t_order_region` VALUES ('2767', '469953', '469028', '南平农场', '中国,海南省,陵水黎族自治县,南平农场', '南平农场', '中国,海南,陵水,南平农场', '3', '0898', '572431', 'Nanping', 'NP', 'N', '109.927', '18.6079', '拓展');
INSERT INTO `t_order_region` VALUES ('2768', '469954', '469028', '城区', '中国,海南省,陵水黎族自治县,城区', '城区', '中国,海南,陵水,城区', '3', '0898', '572400', 'Chengqu', 'CQ', 'C', '110.036', '18.5071', '拓展');
INSERT INTO `t_order_region` VALUES ('2769', '469961', '469029', '保城镇', '中国,海南省,保亭黎族苗族自治县,保城镇', '保城镇', '中国,海南,保亭,保城镇', '3', '0898', '572399', 'Baocheng', 'BC', 'B', '109.704', '18.6416', '拓展');
INSERT INTO `t_order_region` VALUES ('2770', '469962', '469029', '什玲镇', '中国,海南省,保亭黎族苗族自治县,什玲镇', '什玲镇', '中国,海南,保亭,什玲镇', '3', '0898', '572312', 'Shiling', 'SL', 'S', '109.788', '18.662', '拓展');
INSERT INTO `t_order_region` VALUES ('2771', '469963', '469029', '加茂镇', '中国,海南省,保亭黎族苗族自治县,加茂镇', '加茂镇', '中国,海南,保亭,加茂镇', '3', '0898', '572313', 'Jiamao', 'JM', 'J', '109.707', '18.5522', '拓展');
INSERT INTO `t_order_region` VALUES ('2772', '469964', '469029', '响水镇', '中国,海南省,保亭黎族苗族自治县,响水镇', '响水镇', '中国,海南,保亭,响水镇', '3', '0898', '572319', 'Xiangshui', 'XS', 'X', '109.616', '18.5922', '拓展');
INSERT INTO `t_order_region` VALUES ('2773', '469965', '469029', '新政镇', '中国,海南省,保亭黎族苗族自治县,新政镇', '新政镇', '中国,海南,保亭,新政镇', '3', '0898', '572318', 'Xinzheng', 'XZ', 'X', '109.629', '18.5417', '拓展');
INSERT INTO `t_order_region` VALUES ('2774', '469966', '469029', '三道镇', '中国,海南省,保亭黎族苗族自治县,三道镇', '三道镇', '中国,海南,保亭,三道镇', '3', '0898', '572316', 'Sandao', 'SD', 'S', '109.669', '18.4646', '拓展');
INSERT INTO `t_order_region` VALUES ('2775', '469967', '469029', '六弓乡', '中国,海南省,保亭黎族苗族自治县,六弓乡', '六弓乡', '中国,海南,保亭,六弓乡', '3', '0898', '572314', 'Liugong', 'LG', 'L', '109.791', '18.5395', '拓展');
INSERT INTO `t_order_region` VALUES ('2776', '469968', '469029', '南林乡', '中国,海南省,保亭黎族苗族自治县,南林乡', '南林乡', '中国,海南,保亭,南林乡', '3', '0898', '572317', 'Nanlin', 'NL', 'N', '109.617', '18.4052', '拓展');
INSERT INTO `t_order_region` VALUES ('2777', '469969', '469029', '毛感乡', '中国,海南省,保亭黎族苗族自治县,毛感乡', '毛感乡', '中国,海南,保亭,毛感乡', '3', '0898', '572322', 'Maogan', 'MG', 'M', '109.512', '18.6111', '拓展');
INSERT INTO `t_order_region` VALUES ('2778', '469970', '469029', '新星农场', '中国,海南省,保亭黎族苗族自治县,新星农场', '新星农场', '中国,海南,保亭,新星农场', '3', '0898', '572399', 'Xinxing', 'XX', 'X', '109.695', '18.6534', '拓展');
INSERT INTO `t_order_region` VALUES ('2779', '469971', '469029', '金江农场', '中国,海南省,保亭黎族苗族自治县,金江农场', '金江农场', '中国,海南,保亭,金江农场', '3', '0898', '572319', 'Jinjiang', 'JJ', 'J', '109.603', '18.5612', '拓展');
INSERT INTO `t_order_region` VALUES ('2780', '469972', '469029', '三道农场', '中国,海南省,保亭黎族苗族自治县,三道农场', '三道农场', '中国,海南,保亭,三道农场', '3', '0898', '572316', 'Sandao', 'SD', 'S', '109.684', '18.4401', '拓展');
INSERT INTO `t_order_region` VALUES ('2781', '469981', '469030', '营根镇', '中国,海南省,琼中黎族苗族自治县,营根镇', '营根镇', '中国,海南,琼中,营根镇', '3', '0898', '572999', 'Yinggen', 'YG', 'Y', '109.832', '19.0361', '拓展');
INSERT INTO `t_order_region` VALUES ('2782', '469982', '469030', '湾岭镇', '中国,海南省,琼中黎族苗族自治县,湾岭镇', '湾岭镇', '中国,海南,琼中,湾岭镇', '3', '0898', '572912', 'Wanling', 'WL', 'W', '109.9', '19.1413', '拓展');
INSERT INTO `t_order_region` VALUES ('2783', '469983', '469030', '黎母山镇', '中国,海南省,琼中黎族苗族自治县,黎母山镇', '黎母山镇', '中国,海南,琼中,黎母山镇', '3', '0898', '572929', 'Limushan', 'LMS', 'L', '109.793', '19.2662', '拓展');
INSERT INTO `t_order_region` VALUES ('2784', '469984', '469030', '和平镇', '中国,海南省,琼中黎族苗族自治县,和平镇', '和平镇', '中国,海南,琼中,和平镇', '3', '0898', '572918', 'Heping', 'HP', 'H', '110.029', '18.8974', '拓展');
INSERT INTO `t_order_region` VALUES ('2785', '469985', '469030', '长征镇', '中国,海南省,琼中黎族苗族自治县,长征镇', '长征镇', '中国,海南,琼中,长征镇', '3', '0898', '572917', 'Changzheng', 'CZ', 'C', '109.878', '18.9588', '拓展');
INSERT INTO `t_order_region` VALUES ('2786', '469986', '469030', '红毛镇', '中国,海南省,琼中黎族苗族自治县,红毛镇', '红毛镇', '中国,海南,琼中,红毛镇', '3', '0898', '572933', 'Hongmao', 'HM', 'H', '109.69', '19.0307', '拓展');
INSERT INTO `t_order_region` VALUES ('2787', '469987', '469030', '中平镇', '中国,海南省,琼中黎族苗族自治县,中平镇', '中平镇', '中国,海南,琼中,中平镇', '3', '0898', '572915', 'Zhongping', 'ZH', 'Z', '110.062', '19.0585', '拓展');
INSERT INTO `t_order_region` VALUES ('2788', '469988', '469030', '上安乡', '中国,海南省,琼中黎族苗族自治县,上安乡', '上安乡', '中国,海南,琼中,上安乡', '3', '0898', '572919', 'Shang\'an', 'SA', 'S', '109.837', '18.8768', '拓展');
INSERT INTO `t_order_region` VALUES ('2789', '469989', '469030', '什运乡', '中国,海南省,琼中黎族苗族自治县,什运乡', '什运乡', '中国,海南,琼中,什运乡', '3', '0898', '572923', 'Shiyun', 'SY', 'S', '109.608', '18.992', '拓展');
INSERT INTO `t_order_region` VALUES ('2790', '469990', '469030', '吊罗山乡', '中国,海南省,琼中黎族苗族自治县,吊罗山乡', '吊罗山乡', '中国,海南,琼中,吊罗山乡', '3', '0898', '572921', 'Diaoluoshan', 'DLS', 'D', '109.878', '18.7926', '拓展');
INSERT INTO `t_order_region` VALUES ('2791', '469991', '469030', '阳江农场', '中国,海南省,琼中黎族苗族自治县,阳江农场', '阳江农场', '中国,海南,琼中,阳江农场', '3', '0898', '572928', 'Yangjiang', 'YJ', 'Y', '109.72', '19.3451', '拓展');
INSERT INTO `t_order_region` VALUES ('2792', '469992', '469030', '乌石农场', '中国,海南省,琼中黎族苗族自治县,乌石农场', '乌石农场', '中国,海南,琼中,乌石农场', '3', '0898', '572911', 'Wushi', 'WS', 'W', '109.863', '19.1242', '拓展');
INSERT INTO `t_order_region` VALUES ('2793', '469993', '469030', '加钗农场', '中国,海南省,琼中黎族苗族自治县,加钗农场', '加钗农场', '中国,海南,琼中,加钗农场', '3', '0898', '572925', 'Jiacha', 'JC', 'J', '109.78', '19.0383', '拓展');
INSERT INTO `t_order_region` VALUES ('2794', '469994', '469030', '长征农场', '中国,海南省,琼中黎族苗族自治县,长征农场', '长征农场', '中国,海南,琼中,长征农场', '3', '0898', '572917', 'Changzheng', 'CZ', 'C', '109.88', '18.9594', '拓展');
INSERT INTO `t_order_region` VALUES ('2795', '469995', '469030', '城区', '中国,海南省,琼中黎族苗族自治县,城区', '城区', '中国,海南,琼中,城区', '3', '0898', '572900', 'Chengqu', 'CQ', 'C', '109.855', '19.0374', '拓展');
INSERT INTO `t_order_region` VALUES ('2796', '500000', '100000', '重庆', '中国,重庆', '重庆', '中国,重庆', '1', '', '', 'Chongqing', 'CQ', 'C', '106.505', '29.5332', '');
INSERT INTO `t_order_region` VALUES ('2797', '500100', '500000', '重庆市', '中国,重庆,重庆市', '重庆', '中国,重庆,重庆', '2', '023', '400000', 'Chongqing', 'CQ', 'C', '106.505', '29.5332', '');
INSERT INTO `t_order_region` VALUES ('2798', '500101', '500100', '万州区', '中国,重庆,重庆市,万州区', '万州', '中国,重庆,重庆,万州', '3', '023', '404100', 'Wanzhou', 'WZ', 'W', '108.409', '30.8079', '');
INSERT INTO `t_order_region` VALUES ('2799', '500102', '500100', '涪陵区', '中国,重庆,重庆市,涪陵区', '涪陵', '中国,重庆,重庆,涪陵', '3', '023', '408000', 'Fuling', 'FL', 'F', '107.39', '29.7029', '');
INSERT INTO `t_order_region` VALUES ('2800', '500103', '500100', '渝中区', '中国,重庆,重庆市,渝中区', '渝中', '中国,重庆,重庆,渝中', '3', '023', '400000', 'Yuzhong', 'YZ', 'Y', '106.569', '29.5528', '');
INSERT INTO `t_order_region` VALUES ('2801', '500104', '500100', '大渡口区', '中国,重庆,重庆市,大渡口区', '大渡口', '中国,重庆,重庆,大渡口', '3', '023', '400000', 'Dadukou', 'DDK', 'D', '106.483', '29.4845', '');
INSERT INTO `t_order_region` VALUES ('2802', '500105', '500100', '江北区', '中国,重庆,重庆市,江北区', '江北', '中国,重庆,重庆,江北', '3', '023', '400000', 'Jiangbei', 'JB', 'J', '106.574', '29.6066', '');
INSERT INTO `t_order_region` VALUES ('2803', '500106', '500100', '沙坪坝区', '中国,重庆,重庆市,沙坪坝区', '沙坪坝', '中国,重庆,重庆,沙坪坝', '3', '023', '400000', 'Shapingba', 'SPB', 'S', '106.458', '29.5411', '');
INSERT INTO `t_order_region` VALUES ('2804', '500107', '500100', '九龙坡区', '中国,重庆,重庆市,九龙坡区', '九龙坡', '中国,重庆,重庆,九龙坡', '3', '023', '400000', 'Jiulongpo', 'JLP', 'J', '106.511', '29.502', '');
INSERT INTO `t_order_region` VALUES ('2805', '500108', '500100', '南岸区', '中国,重庆,重庆市,南岸区', '南岸', '中国,重庆,重庆,南岸', '3', '023', '400000', 'Nan\'an', 'NA', 'N', '106.563', '29.5231', '');
INSERT INTO `t_order_region` VALUES ('2806', '500109', '500100', '北碚区', '中国,重庆,重庆市,北碚区', '北碚', '中国,重庆,重庆,北碚', '3', '023', '400700', 'Beibei', 'BB', 'B', '106.396', '29.8057', '');
INSERT INTO `t_order_region` VALUES ('2807', '500110', '500100', '綦江区', '中国,重庆,重庆市,綦江区', '綦江', '中国,重庆,重庆,綦江', '3', '023', '400800', 'Qijiang', 'QJ', 'Q', '106.927', '28.9607', '');
INSERT INTO `t_order_region` VALUES ('2808', '500111', '500100', '大足区', '中国,重庆,重庆市,大足区', '大足', '中国,重庆,重庆,大足', '3', '023', '400900', 'Dazu', 'DZ', 'D', '105.768', '29.484', '');
INSERT INTO `t_order_region` VALUES ('2809', '500112', '500100', '渝北区', '中国,重庆,重庆市,渝北区', '渝北', '中国,重庆,重庆,渝北', '3', '023', '401120', 'Yubei', 'YB', 'Y', '106.631', '29.7182', '');
INSERT INTO `t_order_region` VALUES ('2810', '500113', '500100', '巴南区', '中国,重庆,重庆市,巴南区', '巴南', '中国,重庆,重庆,巴南', '3', '023', '401320', 'Banan', 'BN', 'B', '106.524', '29.3831', '');
INSERT INTO `t_order_region` VALUES ('2811', '500114', '500100', '黔江区', '中国,重庆,重庆市,黔江区', '黔江', '中国,重庆,重庆,黔江', '3', '023', '409000', 'Qianjiang', 'QJ', 'Q', '108.771', '29.5332', '');
INSERT INTO `t_order_region` VALUES ('2812', '500115', '500100', '长寿区', '中国,重庆,重庆市,长寿区', '长寿', '中国,重庆,重庆,长寿', '3', '023', '401220', 'Changshou', 'CS', 'C', '107.082', '29.8536', '');
INSERT INTO `t_order_region` VALUES ('2813', '500116', '500100', '江津区', '中国,重庆,重庆市,江津区', '江津', '中国,重庆,重庆,江津', '3', '023', '402260', 'Jiangjin', 'JJ', 'J', '106.259', '29.2901', '');
INSERT INTO `t_order_region` VALUES ('2814', '500117', '500100', '合川区', '中国,重庆,重庆市,合川区', '合川', '中国,重庆,重庆,合川', '3', '023', '401520', 'Hechuan', 'HC', 'H', '106.276', '29.9723', '');
INSERT INTO `t_order_region` VALUES ('2815', '500118', '500100', '永川区', '中国,重庆,重庆市,永川区', '永川', '中国,重庆,重庆,永川', '3', '023', '402160', 'Yongchuan', 'YC', 'Y', '105.927', '29.3559', '');
INSERT INTO `t_order_region` VALUES ('2816', '500119', '500100', '南川区', '中国,重庆,重庆市,南川区', '南川', '中国,重庆,重庆,南川', '3', '023', '408400', 'Nanchuan', 'NC', 'N', '107.099', '29.1575', '');
INSERT INTO `t_order_region` VALUES ('2817', '500120', '500100', '璧山区', '中国,重庆,重庆市,璧山区', '璧山', '中国,重庆,重庆,璧山', '3', '023', '402760', 'Bishan', 'BS', 'B', '106.231', '29.5936', '');
INSERT INTO `t_order_region` VALUES ('2818', '500151', '500100', '铜梁区', '中国,重庆,重庆市,铜梁区', '铜梁', '中国,重庆,重庆,铜梁', '3', '023', '402560', 'Tongliang', 'TL', 'T', '106.055', '29.8399', '');
INSERT INTO `t_order_region` VALUES ('2819', '500152', '500100', '潼南区', '中国,重庆,重庆市,潼南区', '潼南', '中国,重庆,重庆,潼南', '3', '023', '402660', 'Tongnan', 'TN', 'T', '105.84', '30.1912', '');
INSERT INTO `t_order_region` VALUES ('2820', '500153', '500100', '荣昌区', '中国,重庆,重庆市,荣昌区', '荣昌', '中国,重庆,重庆,荣昌', '3', '023', '402460', 'Rongchang', 'RC', 'R', '105.594', '29.4049', '');
INSERT INTO `t_order_region` VALUES ('2821', '500154', '500100', '开州区', '中国,重庆,重庆市,开州区', '开州', '中国,重庆,重庆,开州', '3', '023', '405400', 'KaiZhou', 'KZ', 'K', '108.393', '31.1609', '');
INSERT INTO `t_order_region` VALUES ('2822', '500155', '500100', '梁平区', '中国,重庆,重庆市,梁平区', '梁平', '中国,重庆,重庆,梁平', '3', '023', '405200', 'Liangping', 'LP', 'L', '107.8', '30.6754', '');
INSERT INTO `t_order_region` VALUES ('2823', '500156', '500100', '武隆区', '中国,重庆,重庆市,武隆区', '武隆', '中国,重庆,重庆,武隆', '3', '023', '408500', 'Wulong', 'WL', 'W', '107.76', '29.3255', '');
INSERT INTO `t_order_region` VALUES ('2824', '500229', '500100', '城口县', '中国,重庆,重庆市,城口县', '城口', '中国,重庆,重庆,城口', '3', '023', '405900', 'Chengkou', 'CK', 'C', '108.665', '31.948', '');
INSERT INTO `t_order_region` VALUES ('2825', '500230', '500100', '丰都县', '中国,重庆,重庆市,丰都县', '丰都', '中国,重庆,重庆,丰都', '3', '023', '408200', 'Fengdu', 'FD', 'F', '107.731', '29.8635', '');
INSERT INTO `t_order_region` VALUES ('2826', '500231', '500100', '垫江县', '中国,重庆,重庆市,垫江县', '垫江', '中国,重庆,重庆,垫江', '3', '023', '408300', 'Dianjiang', 'DJ', 'D', '107.354', '30.3336', '');
INSERT INTO `t_order_region` VALUES ('2827', '500233', '500100', '忠县', '中国,重庆,重庆市,忠县', '忠县', '中国,重庆,重庆,忠县', '3', '023', '404300', 'Zhongxian', 'ZX', 'Z', '108.037', '30.289', '');
INSERT INTO `t_order_region` VALUES ('2828', '500235', '500100', '云阳县', '中国,重庆,重庆市,云阳县', '云阳', '中国,重庆,重庆,云阳', '3', '023', '404500', 'Yunyang', 'YY', 'Y', '108.697', '30.9306', '');
INSERT INTO `t_order_region` VALUES ('2829', '500236', '500100', '奉节县', '中国,重庆,重庆市,奉节县', '奉节', '中国,重庆,重庆,奉节', '3', '023', '404600', 'Fengjie', 'FJ', 'F', '109.465', '31.0182', '');
INSERT INTO `t_order_region` VALUES ('2830', '500237', '500100', '巫山县', '中国,重庆,重庆市,巫山县', '巫山', '中国,重庆,重庆,巫山', '3', '023', '404700', 'Wushan', 'WS', 'W', '109.878', '31.0746', '');
INSERT INTO `t_order_region` VALUES ('2831', '500238', '500100', '巫溪县', '中国,重庆,重庆市,巫溪县', '巫溪', '中国,重庆,重庆,巫溪', '3', '023', '405800', 'Wuxi', 'WX', 'W', '109.631', '31.3976', '');
INSERT INTO `t_order_region` VALUES ('2832', '500240', '500100', '石柱土家族自治县', '中国,重庆,重庆市,石柱土家族自治县', '石柱', '中国,重庆,重庆,石柱', '3', '023', '409100', 'Shizhu', 'SZ', 'S', '108.114', '30.0005', '');
INSERT INTO `t_order_region` VALUES ('2833', '500241', '500100', '秀山土家族苗族自治县', '中国,重庆,重庆市,秀山土家族苗族自治县', '秀山', '中国,重庆,重庆,秀山', '3', '023', '409900', 'Xiushan', 'XS', 'X', '108.989', '28.4506', '');
INSERT INTO `t_order_region` VALUES ('2834', '500242', '500100', '酉阳土家族苗族自治县', '中国,重庆,重庆市,酉阳土家族苗族自治县', '酉阳', '中国,重庆,重庆,酉阳', '3', '023', '409800', 'Youyang', 'YY', 'Y', '108.772', '28.8446', '');
INSERT INTO `t_order_region` VALUES ('2835', '500243', '500100', '彭水苗族土家族自治县', '中国,重庆,重庆市,彭水苗族土家族自治县', '彭水', '中国,重庆,重庆,彭水', '3', '023', '409600', 'Pengshui', 'PS', 'P', '108.166', '29.2952', '');
INSERT INTO `t_order_region` VALUES ('2836', '500300', '500100', '两江新区', '中国,重庆,重庆市,两江新区', '两江新区', '中国,重庆,重庆,两江新区', '3', '023', '401147', 'Liangjiangxinqu', 'LJXQ', 'L', '106.463', '29.7292', '国家级新区');
INSERT INTO `t_order_region` VALUES ('2837', '500301', '500100', '高新区', '中国,重庆,重庆市,高新区', '高新区', '中国,重庆,重庆,高新区', '3', '023', '400039', 'Gaoxinqu', 'GXQ', 'G', '106.48', '29.5249', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2838', '500302', '500100', '璧山高新区', '中国,重庆,重庆市,璧山高新区', '璧山高新区', '中国,重庆,重庆,璧山高新区', '3', '023', '402760', 'BishanGaoxinqu', 'BSGXQ', 'B', '106.214', '29.574', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2839', '510000', '100000', '四川省', '中国,四川省', '四川', '中国,四川', '1', '', '', 'Sichuan', 'SC', 'S', '104.066', '30.6595', '');
INSERT INTO `t_order_region` VALUES ('2840', '510100', '510000', '成都市', '中国,四川省,成都市', '成都', '中国,四川,成都', '2', '028', '610000', 'Chengdu', 'CD', 'C', '104.066', '30.6595', '');
INSERT INTO `t_order_region` VALUES ('2841', '510104', '510100', '锦江区', '中国,四川省,成都市,锦江区', '锦江', '中国,四川,成都,锦江', '3', '028', '610000', 'Jinjiang', 'JJ', 'J', '104.083', '30.6561', '');
INSERT INTO `t_order_region` VALUES ('2842', '510105', '510100', '青羊区', '中国,四川省,成都市,青羊区', '青羊', '中国,四川,成都,青羊', '3', '028', '610000', 'Qingyang', 'QY', 'Q', '104.062', '30.6739', '');
INSERT INTO `t_order_region` VALUES ('2843', '510106', '510100', '金牛区', '中国,四川省,成都市,金牛区', '金牛', '中国,四川,成都,金牛', '3', '028', '610000', 'Jinniu', 'JN', 'J', '104.051', '30.6913', '');
INSERT INTO `t_order_region` VALUES ('2844', '510107', '510100', '武侯区', '中国,四川省,成都市,武侯区', '武侯', '中国,四川,成都,武侯', '3', '028', '610000', 'Wuhou', 'WH', 'W', '104.043', '30.6423', '');
INSERT INTO `t_order_region` VALUES ('2845', '510108', '510100', '成华区', '中国,四川省,成都市,成华区', '成华', '中国,四川,成都,成华', '3', '028', '610000', 'Chenghua', 'CH', 'C', '104.102', '30.6599', '');
INSERT INTO `t_order_region` VALUES ('2846', '510112', '510100', '龙泉驿区', '中国,四川省,成都市,龙泉驿区', '龙泉驿', '中国,四川,成都,龙泉驿', '3', '028', '610100', 'Longquanyi', 'LQY', 'L', '104.275', '30.5566', '');
INSERT INTO `t_order_region` VALUES ('2847', '510113', '510100', '青白江区', '中国,四川省,成都市,青白江区', '青白江', '中国,四川,成都,青白江', '3', '028', '610300', 'Qingbaijiang', 'QBJ', 'Q', '104.251', '30.8784', '');
INSERT INTO `t_order_region` VALUES ('2848', '510114', '510100', '新都区', '中国,四川省,成都市,新都区', '新都', '中国,四川,成都,新都', '3', '028', '610500', 'Xindu', 'XD', 'X', '104.159', '30.8231', '');
INSERT INTO `t_order_region` VALUES ('2849', '510115', '510100', '温江区', '中国,四川省,成都市,温江区', '温江', '中国,四川,成都,温江', '3', '028', '611130', 'Wenjiang', 'WJ', 'W', '103.849', '30.6844', '');
INSERT INTO `t_order_region` VALUES ('2850', '510116', '510100', '双流区', '中国,四川省,成都市,双流区', '双流', '中国,四川,成都,双流', '3', '028', '610200', 'Shuangliu', 'SL', 'S', '103.924', '30.5744', '');
INSERT INTO `t_order_region` VALUES ('2851', '510117', '510100', '郫都区', '中国,四川省,成都市,郫都区', '郫都', '中国,四川,成都,郫都', '3', '028', '611730', 'Pidu', 'PD', 'P', '103.887', '30.8105', '');
INSERT INTO `t_order_region` VALUES ('2852', '510121', '510100', '金堂县', '中国,四川省,成都市,金堂县', '金堂', '中国,四川,成都,金堂', '3', '028', '610400', 'Jintang', 'JT', 'J', '104.412', '30.8619', '');
INSERT INTO `t_order_region` VALUES ('2853', '510129', '510100', '大邑县', '中国,四川省,成都市,大邑县', '大邑', '中国,四川,成都,大邑', '3', '028', '611300', 'Dayi', 'DY', 'D', '103.521', '30.5874', '');
INSERT INTO `t_order_region` VALUES ('2854', '510131', '510100', '蒲江县', '中国,四川省,成都市,蒲江县', '蒲江', '中国,四川,成都,蒲江', '3', '028', '611600', 'Pujiang', 'PJ', 'P', '103.506', '30.1967', '');
INSERT INTO `t_order_region` VALUES ('2855', '510132', '510100', '新津县', '中国,四川省,成都市,新津县', '新津', '中国,四川,成都,新津', '3', '028', '611400', 'Xinjin', 'XJ', 'X', '103.811', '30.4098', '');
INSERT INTO `t_order_region` VALUES ('2856', '510181', '510100', '都江堰市', '中国,四川省,成都市,都江堰市', '都江堰', '中国,四川,成都,都江堰', '3', '028', '611800', 'Dujiangyan', 'DJY', 'D', '103.619', '30.9982', '');
INSERT INTO `t_order_region` VALUES ('2857', '510182', '510100', '彭州市', '中国,四川省,成都市,彭州市', '彭州', '中国,四川,成都,彭州', '3', '028', '611900', 'Pengzhou', 'PZ', 'P', '103.958', '30.9901', '');
INSERT INTO `t_order_region` VALUES ('2858', '510183', '510100', '邛崃市', '中国,四川省,成都市,邛崃市', '邛崃', '中国,四川,成都,邛崃', '3', '028', '611500', 'Qionglai', 'QL', 'Q', '103.463', '30.4149', '');
INSERT INTO `t_order_region` VALUES ('2859', '510184', '510100', '崇州市', '中国,四川省,成都市,崇州市', '崇州', '中国,四川,成都,崇州', '3', '028', '611200', 'Chongzhou', 'CZ', 'C', '103.673', '30.6301', '');
INSERT INTO `t_order_region` VALUES ('2860', '510185', '510100', '简阳市', '中国,四川省,成都市,简阳市', '简阳', '中国,四川,成都,简阳', '3', '028', '641400', 'Jianyang', 'JY', 'J', '104.549', '30.3904', '');
INSERT INTO `t_order_region` VALUES ('2861', '510186', '510100', '天府新区', '中国,四川省,成都市,天府新区', '天府新区', '中国,四川,成都,天府新区', '3', '028', '610000', 'TianfuXinqu', 'TFXQ', 'T', '104.069', '30.5238', '国家级新区');
INSERT INTO `t_order_region` VALUES ('2862', '510187', '510100', '高新南区', '中国,四川省,成都市,高新南区', '高新南区', '中国,四川,成都,高新南区', '3', '028', '610041', 'GaoxinNanqu', 'GXNQ', 'G', '104.067', '30.5951', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2863', '510188', '510100', '高新西区', '中国,四川省,成都市,高新西区', '高新西区', '中国,四川,成都,高新西区', '3', '028', '611731', 'GaoxinXiqu', 'GXXQ', 'G', '103.93', '30.7665', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2864', '510300', '510000', '自贡市', '中国,四川省,自贡市', '自贡', '中国,四川,自贡', '2', '0813', '643000', 'Zigong', 'ZG', 'Z', '104.773', '29.3528', '');
INSERT INTO `t_order_region` VALUES ('2865', '510302', '510300', '自流井区', '中国,四川省,自贡市,自流井区', '自流井', '中国,四川,自贡,自流井', '3', '0813', '643000', 'Ziliujing', 'ZLJ', 'Z', '104.777', '29.3375', '');
INSERT INTO `t_order_region` VALUES ('2866', '510303', '510300', '贡井区', '中国,四川省,自贡市,贡井区', '贡井', '中国,四川,自贡,贡井', '3', '0813', '643020', 'Gongjing', 'GJ', 'G', '104.715', '29.3458', '');
INSERT INTO `t_order_region` VALUES ('2867', '510304', '510300', '大安区', '中国,四川省,自贡市,大安区', '大安', '中国,四川,自贡,大安', '3', '0813', '643010', 'Da\'an', 'DA', 'D', '104.774', '29.3636', '');
INSERT INTO `t_order_region` VALUES ('2868', '510311', '510300', '沿滩区', '中国,四川省,自贡市,沿滩区', '沿滩', '中国,四川,自贡,沿滩', '3', '0813', '643030', 'Yantan', 'YT', 'Y', '104.88', '29.2661', '');
INSERT INTO `t_order_region` VALUES ('2869', '510321', '510300', '荣县', '中国,四川省,自贡市,荣县', '荣县', '中国,四川,自贡,荣县', '3', '0813', '643100', 'Rongxian', 'RX', 'R', '104.418', '29.4445', '');
INSERT INTO `t_order_region` VALUES ('2870', '510322', '510300', '富顺县', '中国,四川省,自贡市,富顺县', '富顺', '中国,四川,自贡,富顺', '3', '0813', '643200', 'Fushun', 'FS', 'F', '104.975', '29.1812', '');
INSERT INTO `t_order_region` VALUES ('2871', '510323', '510300', '高新区', '中国,四川省,自贡市,高新区', '高新区', '中国,四川,自贡,高新区', '3', '0813', '643000', 'Gaoxinqu', 'GXQ', 'G', '104.778', '29.3389', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2872', '510400', '510000', '攀枝花市', '中国,四川省,攀枝花市', '攀枝花', '中国,四川,攀枝花', '2', '0812', '617000', 'Panzhihua', 'PZH', 'P', '101.716', '26.5804', '');
INSERT INTO `t_order_region` VALUES ('2873', '510402', '510400', '东区', '中国,四川省,攀枝花市,东区', '东区', '中国,四川,攀枝花,东区', '3', '0812', '617000', 'Dongqu', 'DQ', 'D', '101.705', '26.5468', '');
INSERT INTO `t_order_region` VALUES ('2874', '510403', '510400', '西区', '中国,四川省,攀枝花市,西区', '西区', '中国,四川,攀枝花,西区', '3', '0812', '617000', 'Xiqu', 'XQ', 'X', '101.631', '26.5975', '');
INSERT INTO `t_order_region` VALUES ('2875', '510411', '510400', '仁和区', '中国,四川省,攀枝花市,仁和区', '仁和', '中国,四川,攀枝花,仁和', '3', '0812', '617000', 'Renhe', 'RH', 'R', '101.738', '26.4984', '');
INSERT INTO `t_order_region` VALUES ('2876', '510421', '510400', '米易县', '中国,四川省,攀枝花市,米易县', '米易', '中国,四川,攀枝花,米易', '3', '0812', '617200', 'Miyi', 'MY', 'M', '102.111', '26.8872', '');
INSERT INTO `t_order_region` VALUES ('2877', '510422', '510400', '盐边县', '中国,四川省,攀枝花市,盐边县', '盐边', '中国,四川,攀枝花,盐边', '3', '0812', '617100', 'Yanbian', 'YB', 'Y', '101.854', '26.6885', '');
INSERT INTO `t_order_region` VALUES ('2878', '510500', '510000', '泸州市', '中国,四川省,泸州市', '泸州', '中国,四川,泸州', '2', '0830', '646000', 'Luzhou', 'LZ', 'L', '105.443', '28.8891', '');
INSERT INTO `t_order_region` VALUES ('2879', '510502', '510500', '江阳区', '中国,四川省,泸州市,江阳区', '江阳', '中国,四川,泸州,江阳', '3', '0830', '646000', 'Jiangyang', 'JY', 'J', '105.453', '28.8893', '');
INSERT INTO `t_order_region` VALUES ('2880', '510503', '510500', '纳溪区', '中国,四川省,泸州市,纳溪区', '纳溪', '中国,四川,泸州,纳溪', '3', '0830', '646300', 'Naxi', 'NX', 'N', '105.373', '28.7734', '');
INSERT INTO `t_order_region` VALUES ('2881', '510504', '510500', '龙马潭区', '中国,四川省,泸州市,龙马潭区', '龙马潭', '中国,四川,泸州,龙马潭', '3', '0830', '646000', 'Longmatan', 'LMT', 'L', '105.438', '28.9131', '');
INSERT INTO `t_order_region` VALUES ('2882', '510521', '510500', '泸县', '中国,四川省,泸州市,泸县', '泸县', '中国,四川,泸州,泸县', '3', '0830', '646100', 'Luxian', 'LX', 'L', '105.382', '29.1504', '');
INSERT INTO `t_order_region` VALUES ('2883', '510522', '510500', '合江县', '中国,四川省,泸州市,合江县', '合江', '中国,四川,泸州,合江', '3', '0830', '646200', 'Hejiang', 'HJ', 'H', '105.835', '28.81', '');
INSERT INTO `t_order_region` VALUES ('2884', '510524', '510500', '叙永县', '中国,四川省,泸州市,叙永县', '叙永', '中国,四川,泸州,叙永', '3', '0830', '646400', 'Xuyong', 'XY', 'X', '105.445', '28.1559', '');
INSERT INTO `t_order_region` VALUES ('2885', '510525', '510500', '古蔺县', '中国,四川省,泸州市,古蔺县', '古蔺', '中国,四川,泸州,古蔺', '3', '0830', '646500', 'Gulin', 'GL', 'G', '105.813', '28.0387', '');
INSERT INTO `t_order_region` VALUES ('2886', '510600', '510000', '德阳市', '中国,四川省,德阳市', '德阳', '中国,四川,德阳', '2', '0838', '618000', 'Deyang', 'DY', 'D', '104.399', '31.128', '');
INSERT INTO `t_order_region` VALUES ('2887', '510603', '510600', '旌阳区', '中国,四川省,德阳市,旌阳区', '旌阳', '中国,四川,德阳,旌阳', '3', '0838', '618000', 'Jingyang', 'JY', 'J', '104.394', '31.1391', '');
INSERT INTO `t_order_region` VALUES ('2888', '510623', '510600', '中江县', '中国,四川省,德阳市,中江县', '中江', '中国,四川,德阳,中江', '3', '0838', '618100', 'Zhongjiang', 'ZJ', 'Z', '104.679', '31.033', '');
INSERT INTO `t_order_region` VALUES ('2889', '510626', '510600', '罗江县', '中国,四川省,德阳市,罗江县', '罗江', '中国,四川,德阳,罗江', '3', '0838', '618500', 'Luojiang', 'LJ', 'L', '104.51', '31.3167', '');
INSERT INTO `t_order_region` VALUES ('2890', '510681', '510600', '广汉市', '中国,四川省,德阳市,广汉市', '广汉', '中国,四川,德阳,广汉', '3', '0838', '618300', 'Guanghan', 'GH', 'G', '104.282', '30.9769', '');
INSERT INTO `t_order_region` VALUES ('2891', '510682', '510600', '什邡市', '中国,四川省,德阳市,什邡市', '什邡', '中国,四川,德阳,什邡', '3', '0838', '618400', 'Shifang', 'SF', 'S', '104.168', '31.1264', '');
INSERT INTO `t_order_region` VALUES ('2892', '510683', '510600', '绵竹市', '中国,四川省,德阳市,绵竹市', '绵竹', '中国,四川,德阳,绵竹', '3', '0838', '618200', 'Mianzhu', 'MZ', 'M', '104.221', '31.3377', '');
INSERT INTO `t_order_region` VALUES ('2893', '510700', '510000', '绵阳市', '中国,四川省,绵阳市', '绵阳', '中国,四川,绵阳', '2', '0816', '621000', 'Mianyang', 'MY', 'M', '104.742', '31.464', '');
INSERT INTO `t_order_region` VALUES ('2894', '510703', '510700', '涪城区', '中国,四川省,绵阳市,涪城区', '涪城', '中国,四川,绵阳,涪城', '3', '0816', '621000', 'Fucheng', 'FC', 'F', '104.757', '31.4552', '');
INSERT INTO `t_order_region` VALUES ('2895', '510704', '510700', '游仙区', '中国,四川省,绵阳市,游仙区', '游仙', '中国,四川,绵阳,游仙', '3', '0816', '621000', 'Youxian', 'YX', 'Y', '104.771', '31.4657', '');
INSERT INTO `t_order_region` VALUES ('2896', '510705', '510700', '安州区', '中国,四川省,绵阳市,安州区', '安州', '中国,四川,绵阳,安州', '3', '0816', '622650', 'Anzhou', 'AZ', 'A', '104.567', '31.5349', '');
INSERT INTO `t_order_region` VALUES ('2897', '510722', '510700', '三台县', '中国,四川省,绵阳市,三台县', '三台', '中国,四川,绵阳,三台', '3', '0816', '621100', 'Santai', 'ST', 'S', '105.091', '31.0918', '');
INSERT INTO `t_order_region` VALUES ('2898', '510723', '510700', '盐亭县', '中国,四川省,绵阳市,盐亭县', '盐亭', '中国,四川,绵阳,盐亭', '3', '0816', '621600', 'Yanting', 'YT', 'Y', '105.39', '31.2218', '');
INSERT INTO `t_order_region` VALUES ('2899', '510725', '510700', '梓潼县', '中国,四川省,绵阳市,梓潼县', '梓潼', '中国,四川,绵阳,梓潼', '3', '0816', '622150', 'Zitong', 'ZT', 'Z', '105.162', '31.6359', '');
INSERT INTO `t_order_region` VALUES ('2900', '510726', '510700', '北川羌族自治县', '中国,四川省,绵阳市,北川羌族自治县', '北川', '中国,四川,绵阳,北川', '3', '0816', '622750', 'Beichuan', 'BC', 'B', '104.464', '31.8329', '');
INSERT INTO `t_order_region` VALUES ('2901', '510727', '510700', '平武县', '中国,四川省,绵阳市,平武县', '平武', '中国,四川,绵阳,平武', '3', '0816', '622550', 'Pingwu', 'PW', 'P', '104.529', '32.4079', '');
INSERT INTO `t_order_region` VALUES ('2902', '510781', '510700', '江油市', '中国,四川省,绵阳市,江油市', '江油', '中国,四川,绵阳,江油', '3', '0816', '621700', 'Jiangyou', 'JY', 'J', '104.745', '31.7778', '');
INSERT INTO `t_order_region` VALUES ('2903', '510782', '510700', '高新区', '中国,四川省,绵阳市,高新区', '高新区', '中国,四川,绵阳,高新区', '3', '0816', '621000', 'Gaoxinqu', 'GXQ', 'G', '104.664', '31.4662', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('2904', '510783', '510700', '经开区', '中国,四川省,绵阳市,经开区', '经开区', '中国,四川,绵阳,经开区', '3', '0816', '621000', 'Jingkaiqu', 'JKQ', 'J', '104.785', '31.4151', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('2905', '510800', '510000', '广元市', '中国,四川省,广元市', '广元', '中国,四川,广元', '2', '0839', '628000', 'Guangyuan', 'GY', 'G', '105.83', '32.4337', '');
INSERT INTO `t_order_region` VALUES ('2906', '510802', '510800', '利州区', '中国,四川省,广元市,利州区', '利州', '中国,四川,广元,利州', '3', '0839', '628017', 'Lizhou', 'LZ', 'L', '105.826', '32.4323', '');
INSERT INTO `t_order_region` VALUES ('2907', '510811', '510800', '昭化区', '中国,四川省,广元市,昭化区', '昭化', '中国,四川,广元,昭化', '3', '0839', '628017', 'Zhaohua', 'ZHU', 'Z', '105.64', '32.3865', '');
INSERT INTO `t_order_region` VALUES ('2908', '510812', '510800', '朝天区', '中国,四川省,广元市,朝天区', '朝天', '中国,四川,广元,朝天', '3', '0839', '628000', 'Chaotian', 'CT', 'C', '105.893', '32.644', '');
INSERT INTO `t_order_region` VALUES ('2909', '510821', '510800', '旺苍县', '中国,四川省,广元市,旺苍县', '旺苍', '中国,四川,广元,旺苍', '3', '0839', '628200', 'Wangcang', 'WC', 'W', '106.29', '32.2285', '');
INSERT INTO `t_order_region` VALUES ('2910', '510822', '510800', '青川县', '中国,四川省,广元市,青川县', '青川', '中国,四川,广元,青川', '3', '0839', '628100', 'Qingchuan', 'QC', 'Q', '105.239', '32.5856', '');
INSERT INTO `t_order_region` VALUES ('2911', '510823', '510800', '剑阁县', '中国,四川省,广元市,剑阁县', '剑阁', '中国,四川,广元,剑阁', '3', '0839', '628300', 'Jiange', 'JG', 'J', '105.525', '32.2884', '');
INSERT INTO `t_order_region` VALUES ('2912', '510824', '510800', '苍溪县', '中国,四川省,广元市,苍溪县', '苍溪', '中国,四川,广元,苍溪', '3', '0839', '628400', 'Cangxi', 'CX', 'C', '105.936', '31.7321', '');
INSERT INTO `t_order_region` VALUES ('2913', '510900', '510000', '遂宁市', '中国,四川省,遂宁市', '遂宁', '中国,四川,遂宁', '2', '0825', '629000', 'Suining', 'SN', 'S', '105.571', '30.5133', '');
INSERT INTO `t_order_region` VALUES ('2914', '510903', '510900', '船山区', '中国,四川省,遂宁市,船山区', '船山', '中国,四川,遂宁,船山', '3', '0825', '629000', 'Chuanshan', 'CS', 'C', '105.581', '30.4999', '');
INSERT INTO `t_order_region` VALUES ('2915', '510904', '510900', '安居区', '中国,四川省,遂宁市,安居区', '安居', '中国,四川,遂宁,安居', '3', '0825', '629000', 'Anju', 'AJ', 'A', '105.464', '30.3578', '');
INSERT INTO `t_order_region` VALUES ('2916', '510921', '510900', '蓬溪县', '中国,四川省,遂宁市,蓬溪县', '蓬溪', '中国,四川,遂宁,蓬溪', '3', '0825', '629100', 'Pengxi', 'PX', 'P', '105.708', '30.7577', '');
INSERT INTO `t_order_region` VALUES ('2917', '510922', '510900', '射洪县', '中国,四川省,遂宁市,射洪县', '射洪', '中国,四川,遂宁,射洪', '3', '0825', '629200', 'Shehong', 'SH', 'S', '105.389', '30.872', '');
INSERT INTO `t_order_region` VALUES ('2918', '510923', '510900', '大英县', '中国,四川省,遂宁市,大英县', '大英', '中国,四川,遂宁,大英', '3', '0825', '629300', 'Daying', 'DY', 'D', '105.243', '30.5943', '');
INSERT INTO `t_order_region` VALUES ('2919', '510924', '510900', '经济技术开发区', '中国,四川省,遂宁市,经济技术开发区', '经济技术开发区', '中国,四川,遂宁,经济技术开发区', '3', '0825', '629000', 'JingJiKaiFaQu', 'JJKFQ', 'J', '105.565', '30.543', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('2920', '511000', '510000', '内江市', '中国,四川省,内江市', '内江', '中国,四川,内江', '2', '0832', '641000', 'Neijiang', 'NJ', 'N', '105.066', '29.5871', '');
INSERT INTO `t_order_region` VALUES ('2921', '511002', '511000', '市中区', '中国,四川省,内江市,市中区', '市中', '中国,四川,内江,市中', '3', '0832', '641000', 'Shizhong', 'SZ', 'S', '105.068', '29.5871', '');
INSERT INTO `t_order_region` VALUES ('2922', '511011', '511000', '东兴区', '中国,四川省,内江市,东兴区', '东兴', '中国,四川,内江,东兴', '3', '0832', '641100', 'Dongxing', 'DX', 'D', '105.076', '29.5928', '');
INSERT INTO `t_order_region` VALUES ('2923', '511024', '511000', '威远县', '中国,四川省,内江市,威远县', '威远', '中国,四川,内江,威远', '3', '0832', '642450', 'Weiyuan', 'WY', 'W', '104.67', '29.5282', '');
INSERT INTO `t_order_region` VALUES ('2924', '511025', '511000', '资中县', '中国,四川省,内江市,资中县', '资中', '中国,四川,内江,资中', '3', '0832', '641200', 'Zizhong', 'ZZ', 'Z', '104.852', '29.7641', '');
INSERT INTO `t_order_region` VALUES ('2925', '511083', '511000', '隆昌市', '中国,四川省,内江市,隆昌市', '隆昌', '中国,四川,内江,隆昌', '3', '0832', '642150', 'Longchang', 'LC', 'L', '105.287', '29.3394', '省直辖');
INSERT INTO `t_order_region` VALUES ('2926', '511100', '510000', '乐山市', '中国,四川省,乐山市', '乐山', '中国,四川,乐山', '2', '0833', '614000', 'Leshan', 'LS', 'L', '103.761', '29.582', '');
INSERT INTO `t_order_region` VALUES ('2927', '511102', '511100', '市中区', '中国,四川省,乐山市,市中区', '市中', '中国,四川,乐山,市中', '3', '0833', '614000', 'Shizhong', 'SZ', 'S', '103.762', '29.5554', '');
INSERT INTO `t_order_region` VALUES ('2928', '511111', '511100', '沙湾区', '中国,四川省,乐山市,沙湾区', '沙湾', '中国,四川,乐山,沙湾', '3', '0833', '614900', 'Shawan', 'SW', 'S', '103.549', '29.4119', '');
INSERT INTO `t_order_region` VALUES ('2929', '511112', '511100', '五通桥区', '中国,四川省,乐山市,五通桥区', '五通桥', '中国,四川,乐山,五通桥', '3', '0833', '614800', 'Wutongqiao', 'WTQ', 'W', '103.823', '29.4034', '');
INSERT INTO `t_order_region` VALUES ('2930', '511113', '511100', '金口河区', '中国,四川省,乐山市,金口河区', '金口河', '中国,四川,乐山,金口河', '3', '0833', '614700', 'Jinkouhe', 'JKH', 'J', '103.079', '29.2458', '');
INSERT INTO `t_order_region` VALUES ('2931', '511123', '511100', '犍为县', '中国,四川省,乐山市,犍为县', '犍为', '中国,四川,乐山,犍为', '3', '0833', '614400', 'Qianwei', 'QW', 'Q', '103.95', '29.2097', '');
INSERT INTO `t_order_region` VALUES ('2932', '511124', '511100', '井研县', '中国,四川省,乐山市,井研县', '井研', '中国,四川,乐山,井研', '3', '0833', '613100', 'Jingyan', 'JY', 'J', '104.07', '29.6523', '');
INSERT INTO `t_order_region` VALUES ('2933', '511126', '511100', '夹江县', '中国,四川省,乐山市,夹江县', '夹江', '中国,四川,乐山,夹江', '3', '0833', '614100', 'Jiajiang', 'JJ', 'J', '103.572', '29.7387', '');
INSERT INTO `t_order_region` VALUES ('2934', '511129', '511100', '沐川县', '中国,四川省,乐山市,沐川县', '沐川', '中国,四川,乐山,沐川', '3', '0833', '614500', 'Muchuan', 'MC', 'M', '103.904', '28.9565', '');
INSERT INTO `t_order_region` VALUES ('2935', '511132', '511100', '峨边彝族自治县', '中国,四川省,乐山市,峨边彝族自治县', '峨边', '中国,四川,乐山,峨边', '3', '0833', '614300', 'Ebian', 'EB', 'E', '103.263', '29.23', '');
INSERT INTO `t_order_region` VALUES ('2936', '511133', '511100', '马边彝族自治县', '中国,四川省,乐山市,马边彝族自治县', '马边', '中国,四川,乐山,马边', '3', '0833', '614600', 'Mabian', 'MB', 'M', '103.546', '28.8359', '');
INSERT INTO `t_order_region` VALUES ('2937', '511181', '511100', '峨眉山市', '中国,四川省,乐山市,峨眉山市', '峨眉山', '中国,四川,乐山,峨眉山', '3', '0833', '614200', 'Emeishan', 'EMS', 'E', '103.484', '29.6012', '');
INSERT INTO `t_order_region` VALUES ('2938', '511300', '510000', '南充市', '中国,四川省,南充市', '南充', '中国,四川,南充', '2', '0817', '637000', 'Nanchong', 'NC', 'N', '106.083', '30.7953', '');
INSERT INTO `t_order_region` VALUES ('2939', '511302', '511300', '顺庆区', '中国,四川省,南充市,顺庆区', '顺庆', '中国,四川,南充,顺庆', '3', '0817', '637000', 'Shunqing', 'SQ', 'S', '106.092', '30.7964', '');
INSERT INTO `t_order_region` VALUES ('2940', '511303', '511300', '高坪区', '中国,四川省,南充市,高坪区', '高坪', '中国,四川,南充,高坪', '3', '0817', '637100', 'Gaoping', 'GP', 'G', '106.119', '30.7816', '');
INSERT INTO `t_order_region` VALUES ('2941', '511304', '511300', '嘉陵区', '中国,四川省,南充市,嘉陵区', '嘉陵', '中国,四川,南充,嘉陵', '3', '0817', '637500', 'Jialing', 'JL', 'J', '106.071', '30.7585', '');
INSERT INTO `t_order_region` VALUES ('2942', '511321', '511300', '南部县', '中国,四川省,南充市,南部县', '南部', '中国,四川,南充,南部', '3', '0817', '637300', 'Nanbu', 'NB', 'N', '106.067', '31.3545', '');
INSERT INTO `t_order_region` VALUES ('2943', '511322', '511300', '营山县', '中国,四川省,南充市,营山县', '营山', '中国,四川,南充,营山', '3', '0817', '637700', 'Yingshan', 'YS', 'Y', '106.566', '31.0775', '');
INSERT INTO `t_order_region` VALUES ('2944', '511323', '511300', '蓬安县', '中国,四川省,南充市,蓬安县', '蓬安', '中国,四川,南充,蓬安', '3', '0817', '637800', 'Peng\'an', 'PA', 'P', '106.413', '31.0296', '');
INSERT INTO `t_order_region` VALUES ('2945', '511324', '511300', '仪陇县', '中国,四川省,南充市,仪陇县', '仪陇', '中国,四川,南充,仪陇', '3', '0817', '637600', 'Yilong', 'YL', 'Y', '106.3', '31.2763', '');
INSERT INTO `t_order_region` VALUES ('2946', '511325', '511300', '西充县', '中国,四川省,南充市,西充县', '西充', '中国,四川,南充,西充', '3', '0817', '637200', 'Xichong', 'XC', 'X', '105.9', '30.9969', '');
INSERT INTO `t_order_region` VALUES ('2947', '511381', '511300', '阆中市', '中国,四川省,南充市,阆中市', '阆中', '中国,四川,南充,阆中', '3', '0817', '637400', 'Langzhong', 'LZ', 'L', '106.005', '31.5583', '');
INSERT INTO `t_order_region` VALUES ('2948', '511400', '510000', '眉山市', '中国,四川省,眉山市', '眉山', '中国,四川,眉山', '2', '028', '620000', 'Meishan', 'MS', 'M', '103.832', '30.0483', '');
INSERT INTO `t_order_region` VALUES ('2949', '511402', '511400', '东坡区', '中国,四川省,眉山市,东坡区', '东坡', '中国,四川,眉山,东坡', '3', '028', '620000', 'Dongpo', 'DP', 'D', '103.832', '30.0422', '');
INSERT INTO `t_order_region` VALUES ('2950', '511403', '511400', '彭山区', '中国,四川省,眉山市,彭山区', '彭山', '中国,四川,眉山,彭山', '3', '028', '620860', 'Pengshan', 'PS', 'P', '103.873', '30.1928', '');
INSERT INTO `t_order_region` VALUES ('2951', '511421', '511400', '仁寿县', '中国,四川省,眉山市,仁寿县', '仁寿', '中国,四川,眉山,仁寿', '3', '028', '620500', 'Renshou', 'RS', 'R', '104.134', '29.996', '');
INSERT INTO `t_order_region` VALUES ('2952', '511423', '511400', '洪雅县', '中国,四川省,眉山市,洪雅县', '洪雅', '中国,四川,眉山,洪雅', '3', '028', '620300', 'Hongya', 'HY', 'H', '103.373', '29.9066', '');
INSERT INTO `t_order_region` VALUES ('2953', '511424', '511400', '丹棱县', '中国,四川省,眉山市,丹棱县', '丹棱', '中国,四川,眉山,丹棱', '3', '028', '620200', 'Danling', 'DL', 'D', '103.513', '30.0156', '');
INSERT INTO `t_order_region` VALUES ('2954', '511425', '511400', '青神县', '中国,四川省,眉山市,青神县', '青神', '中国,四川,眉山,青神', '3', '028', '620400', 'Qingshen', 'QS', 'Q', '103.848', '29.8323', '');
INSERT INTO `t_order_region` VALUES ('2955', '511500', '510000', '宜宾市', '中国,四川省,宜宾市', '宜宾', '中国,四川,宜宾', '2', '0831', '644000', 'Yibin', 'YB', 'Y', '104.631', '28.7602', '');
INSERT INTO `t_order_region` VALUES ('2956', '511502', '511500', '翠屏区', '中国,四川省,宜宾市,翠屏区', '翠屏', '中国,四川,宜宾,翠屏', '3', '0831', '644000', 'Cuiping', 'CP', 'C', '104.62', '28.7657', '');
INSERT INTO `t_order_region` VALUES ('2957', '511503', '511500', '南溪区', '中国,四川省,宜宾市,南溪区', '南溪', '中国,四川,宜宾,南溪', '3', '0831', '644100', 'Nanxi', 'NX', 'N', '104.981', '28.8398', '');
INSERT INTO `t_order_region` VALUES ('2958', '511521', '511500', '宜宾县', '中国,四川省,宜宾市,宜宾县', '宜宾', '中国,四川,宜宾,宜宾', '3', '0831', '644600', 'Yibin', 'YB', 'Y', '104.533', '28.69', '');
INSERT INTO `t_order_region` VALUES ('2959', '511523', '511500', '江安县', '中国,四川省,宜宾市,江安县', '江安', '中国,四川,宜宾,江安', '3', '0831', '644200', 'Jiang\'an', 'JA', 'J', '105.067', '28.7239', '');
INSERT INTO `t_order_region` VALUES ('2960', '511524', '511500', '长宁县', '中国,四川省,宜宾市,长宁县', '长宁', '中国,四川,宜宾,长宁', '3', '0831', '644300', 'Changning', 'CN', 'C', '104.925', '28.5778', '');
INSERT INTO `t_order_region` VALUES ('2961', '511525', '511500', '高县', '中国,四川省,宜宾市,高县', '高县', '中国,四川,宜宾,高县', '3', '0831', '645150', 'Gaoxian', 'GX', 'G', '104.518', '28.4362', '');
INSERT INTO `t_order_region` VALUES ('2962', '511526', '511500', '珙县', '中国,四川省,宜宾市,珙县', '珙县', '中国,四川,宜宾,珙县', '3', '0831', '644500', 'Gongxian', 'GX', 'G', '104.714', '28.4451', '');
INSERT INTO `t_order_region` VALUES ('2963', '511527', '511500', '筠连县', '中国,四川省,宜宾市,筠连县', '筠连', '中国,四川,宜宾,筠连', '3', '0831', '645250', 'Junlian', 'JL', 'J', '104.512', '28.1649', '');
INSERT INTO `t_order_region` VALUES ('2964', '511528', '511500', '兴文县', '中国,四川省,宜宾市,兴文县', '兴文', '中国,四川,宜宾,兴文', '3', '0831', '644400', 'Xingwen', 'XW', 'X', '105.237', '28.3044', '');
INSERT INTO `t_order_region` VALUES ('2965', '511529', '511500', '屏山县', '中国,四川省,宜宾市,屏山县', '屏山', '中国,四川,宜宾,屏山', '3', '0831', '645350', 'Pingshan', 'PS', 'P', '104.163', '28.6437', '');
INSERT INTO `t_order_region` VALUES ('2966', '511600', '510000', '广安市', '中国,四川省,广安市', '广安', '中国,四川,广安', '2', '0826', '638000', 'Guang\'an', 'GA', 'G', '106.633', '30.4564', '');
INSERT INTO `t_order_region` VALUES ('2967', '511602', '511600', '广安区', '中国,四川省,广安市,广安区', '广安', '中国,四川,广安,广安', '3', '0826', '638550', 'Guang\'an', 'GA', 'G', '106.642', '30.4739', '');
INSERT INTO `t_order_region` VALUES ('2968', '511603', '511600', '前锋区', '中国,四川省,广安市,前锋区', '前锋', '中国,四川,广安,前锋', '3', '0826', '638019', 'Qianfeng', 'QF', 'Q', '106.894', '30.4946', '');
INSERT INTO `t_order_region` VALUES ('2969', '511621', '511600', '岳池县', '中国,四川省,广安市,岳池县', '岳池', '中国,四川,广安,岳池', '3', '0826', '638300', 'Yuechi', 'YC', 'Y', '106.441', '30.5392', '');
INSERT INTO `t_order_region` VALUES ('2970', '511622', '511600', '武胜县', '中国,四川省,广安市,武胜县', '武胜', '中国,四川,广安,武胜', '3', '0826', '638400', 'Wusheng', 'WS', 'W', '106.296', '30.3493', '');
INSERT INTO `t_order_region` VALUES ('2971', '511623', '511600', '邻水县', '中国,四川省,广安市,邻水县', '邻水', '中国,四川,广安,邻水', '3', '0826', '638500', 'Linshui', 'LS', 'L', '106.93', '30.3345', '');
INSERT INTO `t_order_region` VALUES ('2972', '511681', '511600', '华蓥市', '中国,四川省,广安市,华蓥市', '华蓥', '中国,四川,广安,华蓥', '3', '0826', '409800', 'Huaying', 'HY', 'H', '106.785', '30.3901', '');
INSERT INTO `t_order_region` VALUES ('2973', '511700', '510000', '达州市', '中国,四川省,达州市', '达州', '中国,四川,达州', '2', '0818', '635000', 'Dazhou', 'DZ', 'D', '107.502', '31.2095', '');
INSERT INTO `t_order_region` VALUES ('2974', '511702', '511700', '通川区', '中国,四川省,达州市,通川区', '通川', '中国,四川,达州,通川', '3', '0818', '635000', 'Tongchuan', 'TC', 'T', '107.505', '31.2147', '');
INSERT INTO `t_order_region` VALUES ('2975', '511703', '511700', '达川区', '中国,四川省,达州市,达川区', '达川', '中国,四川,达州,达川', '3', '0818', '635000', 'Dachuan', 'DC', 'D', '107.502', '31.2095', '');
INSERT INTO `t_order_region` VALUES ('2976', '511722', '511700', '宣汉县', '中国,四川省,达州市,宣汉县', '宣汉', '中国,四川,达州,宣汉', '3', '0818', '636150', 'Xuanhan', 'XH', 'X', '107.728', '31.3552', '');
INSERT INTO `t_order_region` VALUES ('2977', '511723', '511700', '开江县', '中国,四川省,达州市,开江县', '开江', '中国,四川,达州,开江', '3', '0818', '636250', 'Kaijiang', 'KJ', 'K', '107.869', '31.0841', '');
INSERT INTO `t_order_region` VALUES ('2978', '511724', '511700', '大竹县', '中国,四川省,达州市,大竹县', '大竹', '中国,四川,达州,大竹', '3', '0818', '635100', 'Dazhu', 'DZ', 'D', '107.209', '30.7415', '');
INSERT INTO `t_order_region` VALUES ('2979', '511725', '511700', '渠县', '中国,四川省,达州市,渠县', '渠县', '中国,四川,达州,渠县', '3', '0818', '635200', 'Quxian', 'QX', 'Q', '106.974', '30.8376', '');
INSERT INTO `t_order_region` VALUES ('2980', '511781', '511700', '万源市', '中国,四川省,达州市,万源市', '万源', '中国,四川,达州,万源', '3', '0818', '636350', 'Wanyuan', 'WY', 'W', '108.036', '32.0809', '');
INSERT INTO `t_order_region` VALUES ('2981', '511800', '510000', '雅安市', '中国,四川省,雅安市', '雅安', '中国,四川,雅安', '2', '0835', '625000', 'Ya\'an', 'YA', 'Y', '103.001', '29.9877', '');
INSERT INTO `t_order_region` VALUES ('2982', '511802', '511800', '雨城区', '中国,四川省,雅安市,雨城区', '雨城', '中国,四川,雅安,雨城', '3', '0835', '625000', 'Yucheng', 'YC', 'Y', '103.033', '30.0053', '');
INSERT INTO `t_order_region` VALUES ('2983', '511803', '511800', '名山区', '中国,四川省,雅安市,名山区', '名山', '中国,四川,雅安,名山', '3', '0835', '625100', 'Mingshan', 'MS', 'M', '103.112', '30.0847', '');
INSERT INTO `t_order_region` VALUES ('2984', '511822', '511800', '荥经县', '中国,四川省,雅安市,荥经县', '荥经', '中国,四川,雅安,荥经', '3', '0835', '625200', 'Yingjing', 'YJ', 'Y', '102.847', '29.794', '');
INSERT INTO `t_order_region` VALUES ('2985', '511823', '511800', '汉源县', '中国,四川省,雅安市,汉源县', '汉源', '中国,四川,雅安,汉源', '3', '0835', '625300', 'Hanyuan', 'HY', 'H', '102.678', '29.3517', '');
INSERT INTO `t_order_region` VALUES ('2986', '511824', '511800', '石棉县', '中国,四川省,雅安市,石棉县', '石棉', '中国,四川,雅安,石棉', '3', '0835', '625400', 'Shimian', 'SM', 'S', '102.359', '29.228', '');
INSERT INTO `t_order_region` VALUES ('2987', '511825', '511800', '天全县', '中国,四川省,雅安市,天全县', '天全', '中国,四川,雅安,天全', '3', '0835', '625500', 'Tianquan', 'TQ', 'T', '102.759', '30.0675', '');
INSERT INTO `t_order_region` VALUES ('2988', '511826', '511800', '芦山县', '中国,四川省,雅安市,芦山县', '芦山', '中国,四川,雅安,芦山', '3', '0835', '625600', 'Lushan', 'LS', 'L', '102.928', '30.1437', '');
INSERT INTO `t_order_region` VALUES ('2989', '511827', '511800', '宝兴县', '中国,四川省,雅安市,宝兴县', '宝兴', '中国,四川,雅安,宝兴', '3', '0835', '625700', 'Baoxing', 'BX', 'B', '102.816', '30.3684', '');
INSERT INTO `t_order_region` VALUES ('2990', '511900', '510000', '巴中市', '中国,四川省,巴中市', '巴中', '中国,四川,巴中', '2', '0827', '636600', 'Bazhong', 'BZ', 'B', '106.754', '31.8588', '');
INSERT INTO `t_order_region` VALUES ('2991', '511902', '511900', '巴州区', '中国,四川省,巴中市,巴州区', '巴州', '中国,四川,巴中,巴州', '3', '0827', '636600', 'Bazhou', 'BZ', 'B', '106.769', '31.8512', '');
INSERT INTO `t_order_region` VALUES ('2992', '511903', '511900', '恩阳区', '中国,四川省,巴中市,恩阳区', '恩阳', '中国,四川,巴中,恩阳', '3', '0827', '636064', 'Enyang', 'EY', 'E', '106.754', '31.8588', '');
INSERT INTO `t_order_region` VALUES ('2993', '511921', '511900', '通江县', '中国,四川省,巴中市,通江县', '通江', '中国,四川,巴中,通江', '3', '0827', '636700', 'Tongjiang', 'TJ', 'T', '107.244', '31.9129', '');
INSERT INTO `t_order_region` VALUES ('2994', '511922', '511900', '南江县', '中国,四川省,巴中市,南江县', '南江', '中国,四川,巴中,南江', '3', '0827', '635600', 'Nanjiang', 'NJ', 'N', '106.842', '32.3534', '');
INSERT INTO `t_order_region` VALUES ('2995', '511923', '511900', '平昌县', '中国,四川省,巴中市,平昌县', '平昌', '中国,四川,巴中,平昌', '3', '0827', '636400', 'Pingchang', 'PC', 'P', '107.104', '31.5594', '');
INSERT INTO `t_order_region` VALUES ('2996', '512000', '510000', '资阳市', '中国,四川省,资阳市', '资阳', '中国,四川,资阳', '2', '028', '641300', 'Ziyang', 'ZY', 'Z', '104.642', '30.1222', '');
INSERT INTO `t_order_region` VALUES ('2997', '512002', '512000', '雁江区', '中国,四川省,资阳市,雁江区', '雁江', '中国,四川,资阳,雁江', '3', '028', '641300', 'Yanjiang', 'YJ', 'Y', '104.652', '30.1152', '');
INSERT INTO `t_order_region` VALUES ('2998', '512021', '512000', '安岳县', '中国,四川省,资阳市,安岳县', '安岳', '中国,四川,资阳,安岳', '3', '028', '642350', 'Anyue', 'AY', 'A', '105.336', '30.0979', '');
INSERT INTO `t_order_region` VALUES ('2999', '512022', '512000', '乐至县', '中国,四川省,资阳市,乐至县', '乐至', '中国,四川,资阳,乐至', '3', '028', '641500', 'Lezhi', 'LZ', 'L', '105.032', '30.2723', '');
INSERT INTO `t_order_region` VALUES ('3000', '513200', '510000', '阿坝藏族羌族自治州', '中国,四川省,阿坝藏族羌族自治州', '阿坝', '中国,四川,阿坝', '2', '0837', '624000', 'Aba', 'AB', 'A', '102.221', '31.8998', '');
INSERT INTO `t_order_region` VALUES ('3001', '513201', '513200', '马尔康市', '中国,四川省,阿坝藏族羌族自治州,马尔康市', '马尔康', '中国,四川,阿坝,马尔康', '3', '0837', '624000', 'Maerkang', 'MEK', 'M', '102.206', '31.9058', '');
INSERT INTO `t_order_region` VALUES ('3002', '513221', '513200', '汶川县', '中国,四川省,阿坝藏族羌族自治州,汶川县', '汶川', '中国,四川,阿坝,汶川', '3', '0837', '623000', 'Wenchuan', 'WC', 'W', '103.591', '31.4733', '');
INSERT INTO `t_order_region` VALUES ('3003', '513222', '513200', '理县', '中国,四川省,阿坝藏族羌族自治州,理县', '理县', '中国,四川,阿坝,理县', '3', '0837', '623100', 'Lixian', 'LX', 'L', '103.172', '31.436', '');
INSERT INTO `t_order_region` VALUES ('3004', '513223', '513200', '茂县', '中国,四川省,阿坝藏族羌族自治州,茂县', '茂县', '中国,四川,阿坝,茂县', '3', '0837', '623200', 'Maoxian', 'MX', 'M', '103.854', '31.682', '');
INSERT INTO `t_order_region` VALUES ('3005', '513224', '513200', '松潘县', '中国,四川省,阿坝藏族羌族自治州,松潘县', '松潘', '中国,四川,阿坝,松潘', '3', '0837', '623300', 'Songpan', 'SP', 'S', '103.599', '32.6387', '');
INSERT INTO `t_order_region` VALUES ('3006', '513225', '513200', '九寨沟县', '中国,四川省,阿坝藏族羌族自治州,九寨沟县', '九寨沟', '中国,四川,阿坝,九寨沟', '3', '0837', '623400', 'Jiuzhaigou', 'JZG', 'J', '104.237', '33.2632', '');
INSERT INTO `t_order_region` VALUES ('3007', '513226', '513200', '金川县', '中国,四川省,阿坝藏族羌族自治州,金川县', '金川', '中国,四川,阿坝,金川', '3', '0837', '624100', 'Jinchuan', 'JC', 'J', '102.066', '31.4762', '');
INSERT INTO `t_order_region` VALUES ('3008', '513227', '513200', '小金县', '中国,四川省,阿坝藏族羌族自治州,小金县', '小金', '中国,四川,阿坝,小金', '3', '0837', '624200', 'Xiaojin', 'XJ', 'X', '102.365', '30.9993', '');
INSERT INTO `t_order_region` VALUES ('3009', '513228', '513200', '黑水县', '中国,四川省,阿坝藏族羌族自治州,黑水县', '黑水', '中国,四川,阿坝,黑水', '3', '0837', '623500', 'Heishui', 'HS', 'H', '102.992', '32.0618', '');
INSERT INTO `t_order_region` VALUES ('3010', '513230', '513200', '壤塘县', '中国,四川省,阿坝藏族羌族自治州,壤塘县', '壤塘', '中国,四川,阿坝,壤塘', '3', '0837', '624300', 'Rangtang', 'RT', 'R', '100.978', '32.2658', '');
INSERT INTO `t_order_region` VALUES ('3011', '513231', '513200', '阿坝县', '中国,四川省,阿坝藏族羌族自治州,阿坝县', '阿坝', '中国,四川,阿坝,阿坝', '3', '0837', '624600', 'Aba', 'AB', 'A', '101.706', '32.903', '');
INSERT INTO `t_order_region` VALUES ('3012', '513232', '513200', '若尔盖县', '中国,四川省,阿坝藏族羌族自治州,若尔盖县', '若尔盖', '中国,四川,阿坝,若尔盖', '3', '0837', '624500', 'Ruoergai', 'REG', 'R', '102.96', '33.5743', '');
INSERT INTO `t_order_region` VALUES ('3013', '513233', '513200', '红原县', '中国,四川省,阿坝藏族羌族自治州,红原县', '红原', '中国,四川,阿坝,红原', '3', '0837', '624400', 'Hongyuan', 'HY', 'H', '102.545', '32.7899', '');
INSERT INTO `t_order_region` VALUES ('3014', '513300', '510000', '甘孜藏族自治州', '中国,四川省,甘孜藏族自治州', '甘孜', '中国,四川,甘孜', '2', '0836', '626000', 'Garze', 'GZ', 'G', '101.964', '30.0507', '');
INSERT INTO `t_order_region` VALUES ('3015', '513301', '513300', '康定市', '中国,四川省,甘孜藏族自治州,康定市', '康定', '中国,四川,甘孜,康定', '3', '0836', '626000', 'Kangding', 'KD', 'K', '101.965', '30.0553', '');
INSERT INTO `t_order_region` VALUES ('3016', '513322', '513300', '泸定县', '中国,四川省,甘孜藏族自治州,泸定县', '泸定', '中国,四川,甘孜,泸定', '3', '0836', '626100', 'Luding', 'LD', 'L', '102.235', '29.9147', '');
INSERT INTO `t_order_region` VALUES ('3017', '513323', '513300', '丹巴县', '中国,四川省,甘孜藏族自治州,丹巴县', '丹巴', '中国,四川,甘孜,丹巴', '3', '0836', '626300', 'Danba', 'DB', 'D', '101.884', '30.8766', '');
INSERT INTO `t_order_region` VALUES ('3018', '513324', '513300', '九龙县', '中国,四川省,甘孜藏族自治州,九龙县', '九龙', '中国,四川,甘孜,九龙', '3', '0836', '616200', 'Jiulong', 'JL', 'J', '101.508', '29.0009', '');
INSERT INTO `t_order_region` VALUES ('3019', '513325', '513300', '雅江县', '中国,四川省,甘孜藏族自治州,雅江县', '雅江', '中国,四川,甘孜,雅江', '3', '0836', '627450', 'Yajiang', 'YJ', 'Y', '101.015', '30.0328', '');
INSERT INTO `t_order_region` VALUES ('3020', '513326', '513300', '道孚县', '中国,四川省,甘孜藏族自治州,道孚县', '道孚', '中国,四川,甘孜,道孚', '3', '0836', '626400', 'Daofu', 'DF', 'D', '101.126', '30.9805', '');
INSERT INTO `t_order_region` VALUES ('3021', '513327', '513300', '炉霍县', '中国,四川省,甘孜藏族自治州,炉霍县', '炉霍', '中国,四川,甘孜,炉霍', '3', '0836', '626500', 'Luhuo', 'LH', 'L', '100.677', '31.3917', '');
INSERT INTO `t_order_region` VALUES ('3022', '513328', '513300', '甘孜县', '中国,四川省,甘孜藏族自治州,甘孜县', '甘孜', '中国,四川,甘孜,甘孜', '3', '0836', '626700', 'Ganzi', 'GZ', 'G', '99.9931', '31.6267', '');
INSERT INTO `t_order_region` VALUES ('3023', '513329', '513300', '新龙县', '中国,四川省,甘孜藏族自治州,新龙县', '新龙', '中国,四川,甘孜,新龙', '3', '0836', '626800', 'Xinlong', 'XL', 'X', '100.312', '30.9407', '');
INSERT INTO `t_order_region` VALUES ('3024', '513330', '513300', '德格县', '中国,四川省,甘孜藏族自治州,德格县', '德格', '中国,四川,甘孜,德格', '3', '0836', '627250', 'Dege', 'DG', 'D', '98.5808', '31.8062', '');
INSERT INTO `t_order_region` VALUES ('3025', '513331', '513300', '白玉县', '中国,四川省,甘孜藏族自治州,白玉县', '白玉', '中国,四川,甘孜,白玉', '3', '0836', '627150', 'Baiyu', 'BY', 'B', '98.8257', '31.209', '');
INSERT INTO `t_order_region` VALUES ('3026', '513332', '513300', '石渠县', '中国,四川省,甘孜藏族自治州,石渠县', '石渠', '中国,四川,甘孜,石渠', '3', '0836', '627350', 'Shiqu', 'SQ', 'S', '98.1016', '32.9788', '');
INSERT INTO `t_order_region` VALUES ('3027', '513333', '513300', '色达县', '中国,四川省,甘孜藏族自治州,色达县', '色达', '中国,四川,甘孜,色达', '3', '0836', '626600', 'Seda', 'SD', 'S', '100.332', '32.2684', '');
INSERT INTO `t_order_region` VALUES ('3028', '513334', '513300', '理塘县', '中国,四川省,甘孜藏族自治州,理塘县', '理塘', '中国,四川,甘孜,理塘', '3', '0836', '624300', 'Litang', 'LT', 'L', '100.27', '29.9967', '');
INSERT INTO `t_order_region` VALUES ('3029', '513335', '513300', '巴塘县', '中国,四川省,甘孜藏族自治州,巴塘县', '巴塘', '中国,四川,甘孜,巴塘', '3', '0836', '627650', 'Batang', 'BT', 'B', '99.1041', '30.0042', '');
INSERT INTO `t_order_region` VALUES ('3030', '513336', '513300', '乡城县', '中国,四川省,甘孜藏族自治州,乡城县', '乡城', '中国,四川,甘孜,乡城', '3', '0836', '627850', 'Xiangcheng', 'XC', 'X', '99.7994', '28.9355', '');
INSERT INTO `t_order_region` VALUES ('3031', '513337', '513300', '稻城县', '中国,四川省,甘孜藏族自治州,稻城县', '稻城', '中国,四川,甘孜,稻城', '3', '0836', '627750', 'Daocheng', 'DC', 'D', '100.298', '29.0379', '');
INSERT INTO `t_order_region` VALUES ('3032', '513338', '513300', '得荣县', '中国,四川省,甘孜藏族自治州,得荣县', '得荣', '中国,四川,甘孜,得荣', '3', '0836', '627950', 'Derong', 'DR', 'D', '99.2863', '28.713', '');
INSERT INTO `t_order_region` VALUES ('3033', '513400', '510000', '凉山彝族自治州', '中国,四川省,凉山彝族自治州', '凉山', '中国,四川,凉山', '2', '0834', '615000', 'Liangshan', 'LS', 'L', '102.259', '27.8868', '');
INSERT INTO `t_order_region` VALUES ('3034', '513401', '513400', '西昌市', '中国,四川省,凉山彝族自治州,西昌市', '西昌', '中国,四川,凉山,西昌', '3', '0834', '615000', 'Xichang', 'XC', 'X', '102.264', '27.8952', '');
INSERT INTO `t_order_region` VALUES ('3035', '513422', '513400', '木里藏族自治县', '中国,四川省,凉山彝族自治州,木里藏族自治县', '木里', '中国,四川,凉山,木里', '3', '0834', '615800', 'Muli', 'ML', 'M', '101.28', '27.9287', '');
INSERT INTO `t_order_region` VALUES ('3036', '513423', '513400', '盐源县', '中国,四川省,凉山彝族自治州,盐源县', '盐源', '中国,四川,凉山,盐源', '3', '0834', '615700', 'Yanyuan', 'YY', 'Y', '101.51', '27.4218', '');
INSERT INTO `t_order_region` VALUES ('3037', '513424', '513400', '德昌县', '中国,四川省,凉山彝族自治州,德昌县', '德昌', '中国,四川,凉山,德昌', '3', '0834', '615500', 'Dechang', 'DC', 'D', '102.18', '27.4048', '');
INSERT INTO `t_order_region` VALUES ('3038', '513425', '513400', '会理县', '中国,四川省,凉山彝族自治州,会理县', '会理', '中国,四川,凉山,会理', '3', '0834', '615100', 'Huili', 'HL', 'H', '102.245', '26.6563', '');
INSERT INTO `t_order_region` VALUES ('3039', '513426', '513400', '会东县', '中国,四川省,凉山彝族自治州,会东县', '会东', '中国,四川,凉山,会东', '3', '0834', '615200', 'Huidong', 'HD', 'H', '102.578', '26.6343', '');
INSERT INTO `t_order_region` VALUES ('3040', '513427', '513400', '宁南县', '中国,四川省,凉山彝族自治州,宁南县', '宁南', '中国,四川,凉山,宁南', '3', '0834', '615400', 'Ningnan', 'NN', 'N', '102.761', '27.0657', '');
INSERT INTO `t_order_region` VALUES ('3041', '513428', '513400', '普格县', '中国,四川省,凉山彝族自治州,普格县', '普格', '中国,四川,凉山,普格', '3', '0834', '615300', 'Puge', 'PG', 'P', '102.541', '27.3748', '');
INSERT INTO `t_order_region` VALUES ('3042', '513429', '513400', '布拖县', '中国,四川省,凉山彝族自治州,布拖县', '布拖', '中国,四川,凉山,布拖', '3', '0834', '615350', 'Butuo', 'BT', 'B', '102.812', '27.7079', '');
INSERT INTO `t_order_region` VALUES ('3043', '513430', '513400', '金阳县', '中国,四川省,凉山彝族自治州,金阳县', '金阳', '中国,四川,凉山,金阳', '3', '0834', '616250', 'Jinyang', 'JY', 'J', '103.248', '27.697', '');
INSERT INTO `t_order_region` VALUES ('3044', '513431', '513400', '昭觉县', '中国,四川省,凉山彝族自治州,昭觉县', '昭觉', '中国,四川,凉山,昭觉', '3', '0834', '616150', 'Zhaojue', 'ZJ', 'Z', '102.847', '28.0116', '');
INSERT INTO `t_order_region` VALUES ('3045', '513432', '513400', '喜德县', '中国,四川省,凉山彝族自治州,喜德县', '喜德', '中国,四川,凉山,喜德', '3', '0834', '616750', 'Xide', 'XD', 'X', '102.413', '28.3074', '');
INSERT INTO `t_order_region` VALUES ('3046', '513433', '513400', '冕宁县', '中国,四川省,凉山彝族自治州,冕宁县', '冕宁', '中国,四川,凉山,冕宁', '3', '0834', '615600', 'Mianning', 'MN', 'M', '102.171', '28.5516', '');
INSERT INTO `t_order_region` VALUES ('3047', '513434', '513400', '越西县', '中国,四川省,凉山彝族自治州,越西县', '越西', '中国,四川,凉山,越西', '3', '0834', '616650', 'Yuexi', 'YX', 'Y', '102.508', '28.6413', '');
INSERT INTO `t_order_region` VALUES ('3048', '513435', '513400', '甘洛县', '中国,四川省,凉山彝族自治州,甘洛县', '甘洛', '中国,四川,凉山,甘洛', '3', '0834', '616850', 'Ganluo', 'GL', 'G', '102.772', '28.9662', '');
INSERT INTO `t_order_region` VALUES ('3049', '513436', '513400', '美姑县', '中国,四川省,凉山彝族自治州,美姑县', '美姑', '中国,四川,凉山,美姑', '3', '0834', '616450', 'Meigu', 'MG', 'M', '103.131', '28.326', '');
INSERT INTO `t_order_region` VALUES ('3050', '513437', '513400', '雷波县', '中国,四川省,凉山彝族自治州,雷波县', '雷波', '中国,四川,凉山,雷波', '3', '0834', '616550', 'Leibo', 'LB', 'L', '103.573', '28.2641', '');
INSERT INTO `t_order_region` VALUES ('3051', '520000', '100000', '贵州省', '中国,贵州省', '贵州', '中国,贵州', '1', '', '', 'Guizhou', 'GZ', 'G', '106.713', '26.5783', '');
INSERT INTO `t_order_region` VALUES ('3052', '520100', '520000', '贵阳市', '中国,贵州省,贵阳市', '贵阳', '中国,贵州,贵阳', '2', '0851', '550000', 'Guiyang', 'GY', 'G', '106.713', '26.5783', '');
INSERT INTO `t_order_region` VALUES ('3053', '520102', '520100', '南明区', '中国,贵州省,贵阳市,南明区', '南明', '中国,贵州,贵阳,南明', '3', '0851', '550000', 'Nanming', 'NM', 'N', '106.715', '26.5682', '');
INSERT INTO `t_order_region` VALUES ('3054', '520103', '520100', '云岩区', '中国,贵州省,贵阳市,云岩区', '云岩', '中国,贵州,贵阳,云岩', '3', '0851', '550000', 'Yunyan', 'YY', 'Y', '106.725', '26.6048', '');
INSERT INTO `t_order_region` VALUES ('3055', '520111', '520100', '花溪区', '中国,贵州省,贵阳市,花溪区', '花溪', '中国,贵州,贵阳,花溪', '3', '0851', '550000', 'Huaxi', 'HX', 'H', '106.677', '26.4334', '');
INSERT INTO `t_order_region` VALUES ('3056', '520112', '520100', '乌当区', '中国,贵州省,贵阳市,乌当区', '乌当', '中国,贵州,贵阳,乌当', '3', '0851', '550000', 'Wudang', 'WD', 'W', '106.752', '26.6302', '');
INSERT INTO `t_order_region` VALUES ('3057', '520113', '520100', '白云区', '中国,贵州省,贵阳市,白云区', '白云', '中国,贵州,贵阳,白云', '3', '0851', '550000', 'Baiyun', 'BY', 'B', '106.631', '26.6828', '');
INSERT INTO `t_order_region` VALUES ('3058', '520115', '520100', '观山湖区', '中国,贵州省,贵阳市,观山湖区', '观山湖', '中国,贵州,贵阳,观山湖', '3', '0851', '550009', 'Guanshanhu', 'GSH', 'G', '106.625', '26.6182', '');
INSERT INTO `t_order_region` VALUES ('3059', '520121', '520100', '开阳县', '中国,贵州省,贵阳市,开阳县', '开阳', '中国,贵州,贵阳,开阳', '3', '0851', '550300', 'Kaiyang', 'KY', 'K', '106.969', '27.0553', '');
INSERT INTO `t_order_region` VALUES ('3060', '520122', '520100', '息烽县', '中国,贵州省,贵阳市,息烽县', '息烽', '中国,贵州,贵阳,息烽', '3', '0851', '551100', 'Xifeng', 'XF', 'X', '106.738', '27.0935', '');
INSERT INTO `t_order_region` VALUES ('3061', '520123', '520100', '修文县', '中国,贵州省,贵阳市,修文县', '修文', '中国,贵州,贵阳,修文', '3', '0851', '550200', 'Xiuwen', 'XW', 'X', '106.595', '26.8378', '');
INSERT INTO `t_order_region` VALUES ('3062', '520181', '520100', '清镇市', '中国,贵州省,贵阳市,清镇市', '清镇', '中国,贵州,贵阳,清镇', '3', '0851', '551400', 'Qingzhen', 'QZ', 'Q', '106.469', '26.5526', '');
INSERT INTO `t_order_region` VALUES ('3063', '520182', '520100', '贵安新区', '中国,贵州省,贵阳市,贵安新区', '贵安新区', '中国,贵州,贵阳,贵安新区', '3', '0851', '550003', 'GuiAnXinQu', 'GAXQ', 'G', '106.63', '26.6477', '国家级新区');
INSERT INTO `t_order_region` VALUES ('3064', '520183', '520100', '高新区', '中国,贵州省,贵阳市,高新区', '高新区', '中国,贵州,贵阳,高新区', '3', '0851', '550003', 'GaoXinQu', 'GXQ', 'G', '106.646', '26.6207', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3065', '520200', '520000', '六盘水市', '中国,贵州省,六盘水市', '六盘水', '中国,贵州,六盘水', '2', '0858', '553000', 'Liupanshui', 'LPS', 'L', '104.847', '26.5846', '');
INSERT INTO `t_order_region` VALUES ('3066', '520201', '520200', '钟山区', '中国,贵州省,六盘水市,钟山区', '钟山', '中国,贵州,六盘水,钟山', '3', '0858', '553000', 'Zhongshan', 'ZS', 'Z', '104.878', '26.577', '');
INSERT INTO `t_order_region` VALUES ('3067', '520203', '520200', '六枝特区', '中国,贵州省,六盘水市,六枝特区', '六枝', '中国,贵州,六盘水,六枝', '3', '0858', '553400', 'Liuzhi', 'LZ', 'L', '105.481', '26.2012', '');
INSERT INTO `t_order_region` VALUES ('3068', '520221', '520200', '水城县', '中国,贵州省,六盘水市,水城县', '水城', '中国,贵州,六盘水,水城', '3', '0858', '553600', 'Shuicheng', 'SC', 'S', '104.958', '26.5478', '');
INSERT INTO `t_order_region` VALUES ('3069', '520281', '520200', '盘州市', '中国,贵州省,六盘水市,盘州市', '盘州', '中国,贵州,六盘水,盘州', '3', '0858', '553500', 'Panzhou', 'PZ', 'P', '104.471', '25.7136', '省直辖');
INSERT INTO `t_order_region` VALUES ('3070', '520300', '520000', '遵义市', '中国,贵州省,遵义市', '遵义', '中国,贵州,遵义', '2', '0851', '563000', 'Zunyi', 'ZY', 'Z', '106.937', '27.7066', '');
INSERT INTO `t_order_region` VALUES ('3071', '520302', '520300', '红花岗区', '中国,贵州省,遵义市,红花岗区', '红花岗', '中国,贵州,遵义,红花岗', '3', '0851', '563000', 'Honghuagang', 'HHG', 'H', '106.894', '27.6447', '');
INSERT INTO `t_order_region` VALUES ('3072', '520303', '520300', '汇川区', '中国,贵州省,遵义市,汇川区', '汇川', '中国,贵州,遵义,汇川', '3', '0851', '563000', 'Huichuan', 'HC', 'H', '106.939', '27.7062', '');
INSERT INTO `t_order_region` VALUES ('3073', '520304', '520300', '播州区', '中国,贵州省,遵义市,播州区', '播州', '中国,贵州,遵义,播州', '3', '0851', '563100', 'BoZhou', 'BZ', 'B', '106.833', '27.5377', '');
INSERT INTO `t_order_region` VALUES ('3074', '520322', '520300', '桐梓县', '中国,贵州省,遵义市,桐梓县', '桐梓', '中国,贵州,遵义,桐梓', '3', '0851', '563200', 'Tongzi', 'TZ', 'T', '106.826', '28.1381', '');
INSERT INTO `t_order_region` VALUES ('3075', '520323', '520300', '绥阳县', '中国,贵州省,遵义市,绥阳县', '绥阳', '中国,贵州,遵义,绥阳', '3', '0851', '563300', 'Suiyang', 'SY', 'S', '107.191', '27.947', '');
INSERT INTO `t_order_region` VALUES ('3076', '520324', '520300', '正安县', '中国,贵州省,遵义市,正安县', '正安', '中国,贵州,遵义,正安', '3', '0851', '563400', 'Zheng\'an', 'ZA', 'Z', '107.444', '28.5512', '');
INSERT INTO `t_order_region` VALUES ('3077', '520325', '520300', '道真仡佬族苗族自治县', '中国,贵州省,遵义市,道真仡佬族苗族自治县', '道真', '中国,贵州,遵义,道真', '3', '0851', '563500', 'Daozhen', 'DZ', 'D', '107.612', '28.864', '');
INSERT INTO `t_order_region` VALUES ('3078', '520326', '520300', '务川仡佬族苗族自治县', '中国,贵州省,遵义市,务川仡佬族苗族自治县', '务川', '中国,贵州,遵义,务川', '3', '0851', '564300', 'Wuchuan', 'WC', 'W', '107.889', '28.5223', '');
INSERT INTO `t_order_region` VALUES ('3079', '520327', '520300', '凤冈县', '中国,贵州省,遵义市,凤冈县', '凤冈', '中国,贵州,遵义,凤冈', '3', '0851', '564200', 'Fenggang', 'FG', 'F', '107.717', '27.9546', '');
INSERT INTO `t_order_region` VALUES ('3080', '520328', '520300', '湄潭县', '中国,贵州省,遵义市,湄潭县', '湄潭', '中国,贵州,遵义,湄潭', '3', '0851', '564100', 'Meitan', 'MT', 'M', '107.488', '27.7668', '');
INSERT INTO `t_order_region` VALUES ('3081', '520329', '520300', '余庆县', '中国,贵州省,遵义市,余庆县', '余庆', '中国,贵州,遵义,余庆', '3', '0851', '564400', 'Yuqing', 'YQ', 'Y', '107.888', '27.2253', '');
INSERT INTO `t_order_region` VALUES ('3082', '520330', '520300', '习水县', '中国,贵州省,遵义市,习水县', '习水', '中国,贵州,遵义,习水', '3', '0851', '564600', 'Xishui', 'XS', 'X', '106.213', '28.3198', '');
INSERT INTO `t_order_region` VALUES ('3083', '520381', '520300', '赤水市', '中国,贵州省,遵义市,赤水市', '赤水', '中国,贵州,遵义,赤水', '3', '0851', '564700', 'Chishui', 'CS', 'C', '105.698', '28.5892', '');
INSERT INTO `t_order_region` VALUES ('3084', '520382', '520300', '仁怀市', '中国,贵州省,遵义市,仁怀市', '仁怀', '中国,贵州,遵义,仁怀', '3', '0851', '564500', 'Renhuai', 'RH', 'R', '106.402', '27.7923', '');
INSERT INTO `t_order_region` VALUES ('3085', '520400', '520000', '安顺市', '中国,贵州省,安顺市', '安顺', '中国,贵州,安顺', '2', '0851', '561000', 'Anshun', 'AS', 'A', '105.932', '26.2455', '');
INSERT INTO `t_order_region` VALUES ('3086', '520402', '520400', '西秀区', '中国,贵州省,安顺市,西秀区', '西秀', '中国,贵州,安顺,西秀', '3', '0851', '561000', 'Xixiu', 'XX', 'X', '105.966', '26.2449', '');
INSERT INTO `t_order_region` VALUES ('3087', '520403', '520400', '平坝区', '中国,贵州省,安顺市,平坝区', '平坝', '中国,贵州,安顺,平坝', '3', '0851', '561100', 'Pingba', 'PB', 'P', '106.257', '26.4054', '');
INSERT INTO `t_order_region` VALUES ('3088', '520422', '520400', '普定县', '中国,贵州省,安顺市,普定县', '普定', '中国,贵州,安顺,普定', '3', '0851', '562100', 'Puding', 'PD', 'P', '105.743', '26.3014', '');
INSERT INTO `t_order_region` VALUES ('3089', '520423', '520400', '镇宁布依族苗族自治县', '中国,贵州省,安顺市,镇宁布依族苗族自治县', '镇宁', '中国,贵州,安顺,镇宁', '3', '0851', '561200', 'Zhenning', 'ZN', 'Z', '105.765', '26.0553', '');
INSERT INTO `t_order_region` VALUES ('3090', '520424', '520400', '关岭布依族苗族自治县', '中国,贵州省,安顺市,关岭布依族苗族自治县', '关岭', '中国,贵州,安顺,关岭', '3', '0851', '561300', 'Guanling', 'GL', 'G', '105.619', '25.9425', '');
INSERT INTO `t_order_region` VALUES ('3091', '520425', '520400', '紫云苗族布依族自治县', '中国,贵州省,安顺市,紫云苗族布依族自治县', '紫云', '中国,贵州,安顺,紫云', '3', '0851', '550800', 'Ziyun', 'ZY', 'Z', '106.084', '25.7526', '');
INSERT INTO `t_order_region` VALUES ('3092', '520500', '520000', '毕节市', '中国,贵州省,毕节市', '毕节', '中国,贵州,毕节', '2', '0857', '551700', 'Bijie', 'BJ', 'B', '105.285', '27.3017', '');
INSERT INTO `t_order_region` VALUES ('3093', '520502', '520500', '七星关区', '中国,贵州省,毕节市,七星关区', '七星关', '中国,贵州,毕节,七星关', '3', '0857', '551700', 'Qixingguan', 'QXG', 'Q', '104.95', '27.1536', '');
INSERT INTO `t_order_region` VALUES ('3094', '520521', '520500', '大方县', '中国,贵州省,毕节市,大方县', '大方', '中国,贵州,毕节,大方', '3', '0857', '551600', 'Dafang', 'DF', 'D', '105.609', '27.1435', '');
INSERT INTO `t_order_region` VALUES ('3095', '520522', '520500', '黔西县', '中国,贵州省,毕节市,黔西县', '黔西', '中国,贵州,毕节,黔西', '3', '0857', '551500', 'Qianxi', 'QX', 'Q', '106.038', '27.0249', '');
INSERT INTO `t_order_region` VALUES ('3096', '520523', '520500', '金沙县', '中国,贵州省,毕节市,金沙县', '金沙', '中国,贵州,毕节,金沙', '3', '0857', '551800', 'Jinsha', 'JS', 'J', '106.222', '27.4597', '');
INSERT INTO `t_order_region` VALUES ('3097', '520524', '520500', '织金县', '中国,贵州省,毕节市,织金县', '织金', '中国,贵州,毕节,织金', '3', '0857', '552100', 'Zhijin', 'ZJ', 'Z', '105.769', '26.6685', '');
INSERT INTO `t_order_region` VALUES ('3098', '520525', '520500', '纳雍县', '中国,贵州省,毕节市,纳雍县', '纳雍', '中国,贵州,毕节,纳雍', '3', '0857', '553300', 'Nayong', 'NY', 'N', '105.375', '26.7699', '');
INSERT INTO `t_order_region` VALUES ('3099', '520526', '520500', '威宁彝族回族苗族自治县', '中国,贵州省,毕节市,威宁彝族回族苗族自治县', '威宁', '中国,贵州,毕节,威宁', '3', '0857', '553100', 'Weining', 'WN', 'W', '104.287', '26.8591', '');
INSERT INTO `t_order_region` VALUES ('3100', '520527', '520500', '赫章县', '中国,贵州省,毕节市,赫章县', '赫章', '中国,贵州,毕节,赫章', '3', '0857', '553200', 'Hezhang', 'HZ', 'H', '104.726', '27.1192', '');
INSERT INTO `t_order_region` VALUES ('3101', '520600', '520000', '铜仁市', '中国,贵州省,铜仁市', '铜仁', '中国,贵州,铜仁', '2', '0856', '554300', 'Tongren', 'TR', 'T', '109.192', '27.7183', '');
INSERT INTO `t_order_region` VALUES ('3102', '520602', '520600', '碧江区', '中国,贵州省,铜仁市,碧江区', '碧江', '中国,贵州,铜仁,碧江', '3', '0856', '554300', 'Bijiang', 'BJ', 'B', '109.192', '27.7183', '');
INSERT INTO `t_order_region` VALUES ('3103', '520603', '520600', '万山区', '中国,贵州省,铜仁市,万山区', '万山', '中国,贵州,铜仁,万山', '3', '0856', '554200', 'Wanshan', 'WS', 'W', '109.212', '27.519', '');
INSERT INTO `t_order_region` VALUES ('3104', '520621', '520600', '江口县', '中国,贵州省,铜仁市,江口县', '江口', '中国,贵州,铜仁,江口', '3', '0856', '554400', 'Jiangkou', 'JK', 'J', '108.848', '27.6919', '');
INSERT INTO `t_order_region` VALUES ('3105', '520622', '520600', '玉屏侗族自治县', '中国,贵州省,铜仁市,玉屏侗族自治县', '玉屏', '中国,贵州,铜仁,玉屏', '3', '0856', '554004', 'Yuping', 'YP', 'Y', '108.918', '27.238', '');
INSERT INTO `t_order_region` VALUES ('3106', '520623', '520600', '石阡县', '中国,贵州省,铜仁市,石阡县', '石阡', '中国,贵州,铜仁,石阡', '3', '0856', '555100', 'Shiqian', 'SQ', 'S', '108.23', '27.5194', '');
INSERT INTO `t_order_region` VALUES ('3107', '520624', '520600', '思南县', '中国,贵州省,铜仁市,思南县', '思南', '中国,贵州,铜仁,思南', '3', '0856', '565100', 'Sinan', 'SN', 'S', '108.256', '27.9413', '');
INSERT INTO `t_order_region` VALUES ('3108', '520625', '520600', '印江土家族苗族自治县', '中国,贵州省,铜仁市,印江土家族苗族自治县', '印江', '中国,贵州,铜仁,印江', '3', '0856', '555200', 'Yinjiang', 'YJ', 'Y', '108.406', '27.998', '');
INSERT INTO `t_order_region` VALUES ('3109', '520626', '520600', '德江县', '中国,贵州省,铜仁市,德江县', '德江', '中国,贵州,铜仁,德江', '3', '0856', '565200', 'Dejiang', 'DJ', 'D', '108.117', '28.2609', '');
INSERT INTO `t_order_region` VALUES ('3110', '520627', '520600', '沿河土家族自治县', '中国,贵州省,铜仁市,沿河土家族自治县', '沿河', '中国,贵州,铜仁,沿河', '3', '0856', '565300', 'Yuanhe', 'YH', 'Y', '108.496', '28.5605', '');
INSERT INTO `t_order_region` VALUES ('3111', '520628', '520600', '松桃苗族自治县', '中国,贵州省,铜仁市,松桃苗族自治县', '松桃', '中国,贵州,铜仁,松桃', '3', '0856', '554100', 'Songtao', 'ST', 'S', '109.203', '28.1654', '');
INSERT INTO `t_order_region` VALUES ('3112', '522300', '520000', '黔西南布依族苗族自治州', '中国,贵州省,黔西南布依族苗族自治州', '黔西南', '中国,贵州,黔西南', '2', '0859', '562400', 'Qianxinan', 'QXN', 'Q', '104.898', '25.0881', '');
INSERT INTO `t_order_region` VALUES ('3113', '522301', '522300', '兴义市 ', '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', '兴义', '中国,贵州,黔西南,兴义', '3', '0859', '562400', 'Xingyi', 'XY', 'X', '104.895', '25.0921', '');
INSERT INTO `t_order_region` VALUES ('3114', '522322', '522300', '兴仁县', '中国,贵州省,黔西南布依族苗族自治州,兴仁县', '兴仁', '中国,贵州,黔西南,兴仁', '3', '0859', '562300', 'Xingren', 'XR', 'X', '105.187', '25.4328', '');
INSERT INTO `t_order_region` VALUES ('3115', '522323', '522300', '普安县', '中国,贵州省,黔西南布依族苗族自治州,普安县', '普安', '中国,贵州,黔西南,普安', '3', '0859', '561500', 'Pu\'an', 'PA', 'P', '104.955', '25.786', '');
INSERT INTO `t_order_region` VALUES ('3116', '522324', '522300', '晴隆县', '中国,贵州省,黔西南布依族苗族自治州,晴隆县', '晴隆', '中国,贵州,黔西南,晴隆', '3', '0859', '561400', 'Qinglong', 'QL', 'Q', '105.219', '25.8352', '');
INSERT INTO `t_order_region` VALUES ('3117', '522325', '522300', '贞丰县', '中国,贵州省,黔西南布依族苗族自治州,贞丰县', '贞丰', '中国,贵州,黔西南,贞丰', '3', '0859', '562200', 'Zhenfeng', 'ZF', 'Z', '105.655', '25.3846', '');
INSERT INTO `t_order_region` VALUES ('3118', '522326', '522300', '望谟县', '中国,贵州省,黔西南布依族苗族自治州,望谟县', '望谟', '中国,贵州,黔西南,望谟', '3', '0859', '552300', 'Wangmo', 'WM', 'W', '106.1', '25.1782', '');
INSERT INTO `t_order_region` VALUES ('3119', '522327', '522300', '册亨县', '中国,贵州省,黔西南布依族苗族自治州,册亨县', '册亨', '中国,贵州,黔西南,册亨', '3', '0859', '552200', 'Ceheng', 'CH', 'C', '105.812', '24.9838', '');
INSERT INTO `t_order_region` VALUES ('3120', '522328', '522300', '安龙县', '中国,贵州省,黔西南布依族苗族自治州,安龙县', '安龙', '中国,贵州,黔西南,安龙', '3', '0859', '552400', 'Anlong', 'AL', 'A', '105.443', '25.0982', '');
INSERT INTO `t_order_region` VALUES ('3121', '522600', '520000', '黔东南苗族侗族自治州', '中国,贵州省,黔东南苗族侗族自治州', '黔东南', '中国,贵州,黔东南', '2', '0855', '556000', 'Qiandongnan', 'QDN', 'Q', '107.977', '26.5834', '');
INSERT INTO `t_order_region` VALUES ('3122', '522601', '522600', '凯里市', '中国,贵州省,黔东南苗族侗族自治州,凯里市', '凯里', '中国,贵州,黔东南,凯里', '3', '0855', '556000', 'Kaili', 'KL', 'K', '107.981', '26.5669', '');
INSERT INTO `t_order_region` VALUES ('3123', '522622', '522600', '黄平县', '中国,贵州省,黔东南苗族侗族自治州,黄平县', '黄平', '中国,贵州,黔东南,黄平', '3', '0855', '556100', 'Huangping', 'HP', 'H', '107.902', '26.8957', '');
INSERT INTO `t_order_region` VALUES ('3124', '522623', '522600', '施秉县', '中国,贵州省,黔东南苗族侗族自治州,施秉县', '施秉', '中国,贵州,黔东南,施秉', '3', '0855', '556200', 'Shibing', 'SB', 'S', '108.126', '27.035', '');
INSERT INTO `t_order_region` VALUES ('3125', '522624', '522600', '三穗县', '中国,贵州省,黔东南苗族侗族自治州,三穗县', '三穗', '中国,贵州,黔东南,三穗', '3', '0855', '556500', 'Sansui', 'SS', 'S', '108.671', '26.9477', '');
INSERT INTO `t_order_region` VALUES ('3126', '522625', '522600', '镇远县', '中国,贵州省,黔东南苗族侗族自治州,镇远县', '镇远', '中国,贵州,黔东南,镇远', '3', '0855', '557700', 'Zhenyuan', 'ZY', 'Z', '108.427', '27.0493', '');
INSERT INTO `t_order_region` VALUES ('3127', '522626', '522600', '岑巩县', '中国,贵州省,黔东南苗族侗族自治州,岑巩县', '岑巩', '中国,贵州,黔东南,岑巩', '3', '0855', '557800', 'Cengong', 'CG', 'C', '108.819', '27.1754', '');
INSERT INTO `t_order_region` VALUES ('3128', '522627', '522600', '天柱县', '中国,贵州省,黔东南苗族侗族自治州,天柱县', '天柱', '中国,贵州,黔东南,天柱', '3', '0855', '556600', 'Tianzhu', 'TZ', 'T', '109.207', '26.9078', '');
INSERT INTO `t_order_region` VALUES ('3129', '522628', '522600', '锦屏县', '中国,贵州省,黔东南苗族侗族自治州,锦屏县', '锦屏', '中国,贵州,黔东南,锦屏', '3', '0855', '556700', 'Jinping', 'JP', 'J', '109.2', '26.6763', '');
INSERT INTO `t_order_region` VALUES ('3130', '522629', '522600', '剑河县', '中国,贵州省,黔东南苗族侗族自治州,剑河县', '剑河', '中国,贵州,黔东南,剑河', '3', '0855', '556400', 'Jianhe', 'JH', 'J', '108.591', '26.6525', '');
INSERT INTO `t_order_region` VALUES ('3131', '522630', '522600', '台江县', '中国,贵州省,黔东南苗族侗族自治州,台江县', '台江', '中国,贵州,黔东南,台江', '3', '0855', '556300', 'Taijiang', 'TJ', 'T', '108.318', '26.6692', '');
INSERT INTO `t_order_region` VALUES ('3132', '522631', '522600', '黎平县', '中国,贵州省,黔东南苗族侗族自治州,黎平县', '黎平', '中国,贵州,黔东南,黎平', '3', '0855', '557300', 'Liping', 'LP', 'L', '109.136', '26.2311', '');
INSERT INTO `t_order_region` VALUES ('3133', '522632', '522600', '榕江县', '中国,贵州省,黔东南苗族侗族自治州,榕江县', '榕江', '中国,贵州,黔东南,榕江', '3', '0855', '557200', 'Rongjiang', 'RJ', 'R', '108.521', '25.9242', '');
INSERT INTO `t_order_region` VALUES ('3134', '522633', '522600', '从江县', '中国,贵州省,黔东南苗族侗族自治州,从江县', '从江', '中国,贵州,黔东南,从江', '3', '0855', '557400', 'Congjiang', 'CJ', 'C', '108.905', '25.7542', '');
INSERT INTO `t_order_region` VALUES ('3135', '522634', '522600', '雷山县', '中国,贵州省,黔东南苗族侗族自治州,雷山县', '雷山', '中国,贵州,黔东南,雷山', '3', '0855', '557100', 'Leishan', 'LS', 'L', '108.077', '26.3839', '');
INSERT INTO `t_order_region` VALUES ('3136', '522635', '522600', '麻江县', '中国,贵州省,黔东南苗族侗族自治州,麻江县', '麻江', '中国,贵州,黔东南,麻江', '3', '0855', '557600', 'Majiang', 'MJ', 'M', '107.592', '26.4923', '');
INSERT INTO `t_order_region` VALUES ('3137', '522636', '522600', '丹寨县', '中国,贵州省,黔东南苗族侗族自治州,丹寨县', '丹寨', '中国,贵州,黔东南,丹寨', '3', '0855', '557500', 'Danzhai', 'DZ', 'D', '107.797', '26.1982', '');
INSERT INTO `t_order_region` VALUES ('3138', '522700', '520000', '黔南布依族苗族自治州', '中国,贵州省,黔南布依族苗族自治州', '黔南', '中国,贵州,黔南', '2', '0854', '558000', 'Qiannan', 'QN', 'Q', '107.517', '26.2582', '');
INSERT INTO `t_order_region` VALUES ('3139', '522701', '522700', '都匀市', '中国,贵州省,黔南布依族苗族自治州,都匀市', '都匀', '中国,贵州,黔南,都匀', '3', '0854', '558000', 'Duyun', 'DY', 'D', '107.519', '26.2594', '');
INSERT INTO `t_order_region` VALUES ('3140', '522702', '522700', '福泉市', '中国,贵州省,黔南布依族苗族自治州,福泉市', '福泉', '中国,贵州,黔南,福泉', '3', '0854', '550500', 'Fuquan', 'FQ', 'F', '107.517', '26.6799', '');
INSERT INTO `t_order_region` VALUES ('3141', '522722', '522700', '荔波县', '中国,贵州省,黔南布依族苗族自治州,荔波县', '荔波', '中国,贵州,黔南,荔波', '3', '0854', '558400', 'Libo', 'LB', 'L', '107.886', '25.4139', '');
INSERT INTO `t_order_region` VALUES ('3142', '522723', '522700', '贵定县', '中国,贵州省,黔南布依族苗族自治州,贵定县', '贵定', '中国,贵州,黔南,贵定', '3', '0854', '551300', 'Guiding', 'GD', 'G', '107.237', '26.5781', '');
INSERT INTO `t_order_region` VALUES ('3143', '522725', '522700', '瓮安县', '中国,贵州省,黔南布依族苗族自治州,瓮安县', '瓮安', '中国,贵州,黔南,瓮安', '3', '0854', '550400', 'Weng\'an', 'WA', 'W', '107.476', '27.0681', '');
INSERT INTO `t_order_region` VALUES ('3144', '522726', '522700', '独山县', '中国,贵州省,黔南布依族苗族自治州,独山县', '独山', '中国,贵州,黔南,独山', '3', '0854', '558200', 'Dushan', 'DS', 'D', '107.541', '25.8245', '');
INSERT INTO `t_order_region` VALUES ('3145', '522727', '522700', '平塘县', '中国,贵州省,黔南布依族苗族自治州,平塘县', '平塘', '中国,贵州,黔南,平塘', '3', '0854', '558300', 'Pingtang', 'PT', 'P', '107.324', '25.8329', '');
INSERT INTO `t_order_region` VALUES ('3146', '522728', '522700', '罗甸县', '中国,贵州省,黔南布依族苗族自治州,罗甸县', '罗甸', '中国,贵州,黔南,罗甸', '3', '0854', '550100', 'Luodian', 'LD', 'L', '106.752', '25.4259', '');
INSERT INTO `t_order_region` VALUES ('3147', '522729', '522700', '长顺县', '中国,贵州省,黔南布依族苗族自治州,长顺县', '长顺', '中国,贵州,黔南,长顺', '3', '0854', '550700', 'Changshun', 'CS', 'C', '106.452', '26.023', '');
INSERT INTO `t_order_region` VALUES ('3148', '522730', '522700', '龙里县', '中国,贵州省,黔南布依族苗族自治州,龙里县', '龙里', '中国,贵州,黔南,龙里', '3', '0854', '551200', 'Longli', 'LL', 'L', '106.977', '26.4508', '');
INSERT INTO `t_order_region` VALUES ('3149', '522731', '522700', '惠水县', '中国,贵州省,黔南布依族苗族自治州,惠水县', '惠水', '中国,贵州,黔南,惠水', '3', '0854', '550600', 'Huishui', 'HS', 'H', '106.659', '26.1339', '');
INSERT INTO `t_order_region` VALUES ('3150', '522732', '522700', '三都水族自治县', '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', '三都', '中国,贵州,黔南,三都', '3', '0854', '558100', 'Sandu', 'SD', 'S', '107.875', '25.9856', '');
INSERT INTO `t_order_region` VALUES ('3151', '530000', '100000', '云南省', '中国,云南省', '云南', '中国,云南', '1', '', '', 'Yunnan', 'YN', 'Y', '102.712', '25.0406', '');
INSERT INTO `t_order_region` VALUES ('3152', '530100', '530000', '昆明市', '中国,云南省,昆明市', '昆明', '中国,云南,昆明', '2', '0871', '650000', 'Kunming', 'KM', 'K', '102.712', '25.0406', '');
INSERT INTO `t_order_region` VALUES ('3153', '530102', '530100', '五华区', '中国,云南省,昆明市,五华区', '五华', '中国,云南,昆明,五华', '3', '0871', '650000', 'Wuhua', 'WH', 'W', '102.708', '25.0352', '');
INSERT INTO `t_order_region` VALUES ('3154', '530103', '530100', '盘龙区', '中国,云南省,昆明市,盘龙区', '盘龙', '中国,云南,昆明,盘龙', '3', '0871', '650000', 'Panlong', 'PL', 'P', '102.72', '25.0405', '');
INSERT INTO `t_order_region` VALUES ('3155', '530111', '530100', '官渡区', '中国,云南省,昆明市,官渡区', '官渡', '中国,云南,昆明,官渡', '3', '0871', '650200', 'Guandu', 'GD', 'G', '102.744', '25.015', '');
INSERT INTO `t_order_region` VALUES ('3156', '530112', '530100', '西山区', '中国,云南省,昆明市,西山区', '西山', '中国,云南,昆明,西山', '3', '0871', '650100', 'Xishan', 'XS', 'X', '102.665', '25.038', '');
INSERT INTO `t_order_region` VALUES ('3157', '530113', '530100', '东川区', '中国,云南省,昆明市,东川区', '东川', '中国,云南,昆明,东川', '3', '0871', '654100', 'Dongchuan', 'DC', 'D', '103.188', '26.083', '');
INSERT INTO `t_order_region` VALUES ('3158', '530114', '530100', '呈贡区', '中国,云南省,昆明市,呈贡区', '呈贡', '中国,云南,昆明,呈贡', '3', '0871', '650500', 'Chenggong', 'CG', 'C', '102.801', '24.8893', '');
INSERT INTO `t_order_region` VALUES ('3159', '530115', '530100', '晋宁区', '中国,云南省,昆明市,晋宁区', '晋宁', '中国,云南,昆明,晋宁', '3', '0871', '650600', 'Jinning', 'JN', 'J', '102.594', '24.6665', '');
INSERT INTO `t_order_region` VALUES ('3160', '530124', '530100', '富民县', '中国,云南省,昆明市,富民县', '富民', '中国,云南,昆明,富民', '3', '0871', '650400', 'Fumin', 'FM', 'F', '102.498', '25.2212', '');
INSERT INTO `t_order_region` VALUES ('3161', '530125', '530100', '宜良县', '中国,云南省,昆明市,宜良县', '宜良', '中国,云南,昆明,宜良', '3', '0871', '652100', 'Yiliang', 'YL', 'Y', '103.141', '24.917', '');
INSERT INTO `t_order_region` VALUES ('3162', '530126', '530100', '石林彝族自治县', '中国,云南省,昆明市,石林彝族自治县', '石林', '中国,云南,昆明,石林', '3', '0871', '652200', 'Shilin', 'SL', 'S', '103.271', '24.759', '');
INSERT INTO `t_order_region` VALUES ('3163', '530127', '530100', '嵩明县', '中国,云南省,昆明市,嵩明县', '嵩明', '中国,云南,昆明,嵩明', '3', '0871', '651700', 'Songming', 'SM', 'S', '103.037', '25.3399', '');
INSERT INTO `t_order_region` VALUES ('3164', '530128', '530100', '禄劝彝族苗族自治县', '中国,云南省,昆明市,禄劝彝族苗族自治县', '禄劝', '中国,云南,昆明,禄劝', '3', '0871', '651500', 'Luquan', 'LQ', 'L', '102.467', '25.5539', '');
INSERT INTO `t_order_region` VALUES ('3165', '530129', '530100', '寻甸回族彝族自治县 ', '中国,云南省,昆明市,寻甸回族彝族自治县 ', '寻甸', '中国,云南,昆明,寻甸', '3', '0871', '655200', 'Xundian', 'XD', 'X', '103.256', '25.5596', '');
INSERT INTO `t_order_region` VALUES ('3166', '530181', '530100', '安宁市', '中国,云南省,昆明市,安宁市', '安宁', '中国,云南,昆明,安宁', '3', '0871', '650300', 'Anning', 'AN', 'A', '102.47', '24.9165', '');
INSERT INTO `t_order_region` VALUES ('3167', '530182', '530100', '滇中新区', '中国,云南省,昆明市,滇中新区', '滇中新区', '中国,云南,昆明,滇中新区', '3', '0871', '650000', 'DianZhongXinQu', 'DZXQ', 'D', '102.712', '25.0406', '国家级新区');
INSERT INTO `t_order_region` VALUES ('3168', '530183', '530100', '高新区', '中国,云南省,昆明市,高新区', '高新区', '中国,云南,昆明,高新区', '3', '0871', '650000', 'Gaoxinqu', 'GXQ', 'G', '102.654', '25.0728', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3169', '530300', '530000', '曲靖市', '中国,云南省,曲靖市', '曲靖', '中国,云南,曲靖', '2', '0874', '655000', 'Qujing', 'QJ', 'Q', '103.798', '25.5016', '');
INSERT INTO `t_order_region` VALUES ('3170', '530302', '530300', '麒麟区', '中国,云南省,曲靖市,麒麟区', '麒麟', '中国,云南,曲靖,麒麟', '3', '0874', '655000', 'Qilin', 'QL', 'Q', '103.805', '25.4951', '');
INSERT INTO `t_order_region` VALUES ('3171', '530303', '530300', '沾益区', '中国,云南省,曲靖市,沾益区', '沾益', '中国,云南,曲靖,沾益', '3', '0874', '655331', 'Zhanyi', 'ZY', 'Z', '103.821', '25.6071', '');
INSERT INTO `t_order_region` VALUES ('3172', '530321', '530300', '马龙县', '中国,云南省,曲靖市,马龙县', '马龙', '中国,云南,曲靖,马龙', '3', '0874', '655100', 'Malong', 'ML', 'M', '103.579', '25.4252', '');
INSERT INTO `t_order_region` VALUES ('3173', '530322', '530300', '陆良县', '中国,云南省,曲靖市,陆良县', '陆良', '中国,云南,曲靖,陆良', '3', '0874', '655600', 'Luliang', 'LL', 'L', '103.666', '25.0233', '');
INSERT INTO `t_order_region` VALUES ('3174', '530323', '530300', '师宗县', '中国,云南省,曲靖市,师宗县', '师宗', '中国,云南,曲靖,师宗', '3', '0874', '655700', 'Shizong', 'SZ', 'S', '103.991', '24.8282', '');
INSERT INTO `t_order_region` VALUES ('3175', '530324', '530300', '罗平县', '中国,云南省,曲靖市,罗平县', '罗平', '中国,云南,曲靖,罗平', '3', '0874', '655800', 'Luoping', 'LP', 'L', '104.309', '24.8844', '');
INSERT INTO `t_order_region` VALUES ('3176', '530325', '530300', '富源县', '中国,云南省,曲靖市,富源县', '富源', '中国,云南,曲靖,富源', '3', '0874', '655500', 'Fuyuan', 'FY', 'F', '104.254', '25.6659', '');
INSERT INTO `t_order_region` VALUES ('3177', '530326', '530300', '会泽县', '中国,云南省,曲靖市,会泽县', '会泽', '中国,云南,曲靖,会泽', '3', '0874', '654200', 'Huize', 'HZ', 'H', '103.3', '26.4108', '');
INSERT INTO `t_order_region` VALUES ('3178', '530381', '530300', '宣威市', '中国,云南省,曲靖市,宣威市', '宣威', '中国,云南,曲靖,宣威', '3', '0874', '655400', 'Xuanwei', 'XW', 'X', '104.104', '26.2173', '');
INSERT INTO `t_order_region` VALUES ('3179', '530400', '530000', '玉溪市', '中国,云南省,玉溪市', '玉溪', '中国,云南,玉溪', '2', '0877', '653100', 'Yuxi', 'YX', 'Y', '102.544', '24.3505', '');
INSERT INTO `t_order_region` VALUES ('3180', '530402', '530400', '红塔区', '中国,云南省,玉溪市,红塔区', '红塔', '中国,云南,玉溪,红塔', '3', '0877', '653100', 'Hongta', 'HT', 'H', '102.545', '24.3541', '');
INSERT INTO `t_order_region` VALUES ('3181', '530403', '530400', '江川区', '中国,云南省,玉溪市,江川区', '江川', '中国,云南,玉溪,江川', '3', '0877', '652600', 'Jiangchuan', 'JC', 'J', '102.754', '24.2886', '');
INSERT INTO `t_order_region` VALUES ('3182', '530422', '530400', '澄江县', '中国,云南省,玉溪市,澄江县', '澄江', '中国,云南,玉溪,澄江', '3', '0877', '652500', 'Chengjiang', 'CJ', 'C', '102.908', '24.6738', '');
INSERT INTO `t_order_region` VALUES ('3183', '530423', '530400', '通海县', '中国,云南省,玉溪市,通海县', '通海', '中国,云南,玉溪,通海', '3', '0877', '652700', 'Tonghai', 'TH', 'T', '102.766', '24.1136', '');
INSERT INTO `t_order_region` VALUES ('3184', '530424', '530400', '华宁县', '中国,云南省,玉溪市,华宁县', '华宁', '中国,云南,玉溪,华宁', '3', '0877', '652800', 'Huaning', 'HN', 'H', '102.928', '24.1926', '');
INSERT INTO `t_order_region` VALUES ('3185', '530425', '530400', '易门县', '中国,云南省,玉溪市,易门县', '易门', '中国,云南,玉溪,易门', '3', '0877', '651100', 'Yimen', 'YM', 'Y', '102.164', '24.6712', '');
INSERT INTO `t_order_region` VALUES ('3186', '530426', '530400', '峨山彝族自治县', '中国,云南省,玉溪市,峨山彝族自治县', '峨山', '中国,云南,玉溪,峨山', '3', '0877', '653200', 'Eshan', 'ES', 'E', '102.406', '24.169', '');
INSERT INTO `t_order_region` VALUES ('3187', '530427', '530400', '新平彝族傣族自治县', '中国,云南省,玉溪市,新平彝族傣族自治县', '新平', '中国,云南,玉溪,新平', '3', '0877', '653400', 'Xinping', 'XP', 'X', '101.989', '24.0689', '');
INSERT INTO `t_order_region` VALUES ('3188', '530428', '530400', '元江哈尼族彝族傣族自治县', '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', '元江', '中国,云南,玉溪,元江', '3', '0877', '653300', 'Yuanjiang', 'YJ', 'Y', '101.998', '23.5965', '');
INSERT INTO `t_order_region` VALUES ('3189', '530500', '530000', '保山市', '中国,云南省,保山市', '保山', '中国,云南,保山', '2', '0875', '678000', 'Baoshan', 'BS', 'B', '99.1671', '25.1118', '');
INSERT INTO `t_order_region` VALUES ('3190', '530502', '530500', '隆阳区', '中国,云南省,保山市,隆阳区', '隆阳', '中国,云南,保山,隆阳', '3', '0875', '678000', 'Longyang', 'LY', 'L', '99.1633', '25.1116', '');
INSERT INTO `t_order_region` VALUES ('3191', '530521', '530500', '施甸县', '中国,云南省,保山市,施甸县', '施甸', '中国,云南,保山,施甸', '3', '0875', '678200', 'Shidian', 'SD', 'S', '99.1877', '24.7242', '');
INSERT INTO `t_order_region` VALUES ('3192', '530523', '530500', '龙陵县', '中国,云南省,保山市,龙陵县', '龙陵', '中国,云南,保山,龙陵', '3', '0875', '678300', 'Longling', 'LL', 'L', '98.6902', '24.5875', '');
INSERT INTO `t_order_region` VALUES ('3193', '530524', '530500', '昌宁县', '中国,云南省,保山市,昌宁县', '昌宁', '中国,云南,保山,昌宁', '3', '0875', '678100', 'Changning', 'CN', 'C', '99.6036', '24.8276', '');
INSERT INTO `t_order_region` VALUES ('3194', '530581', '530500', '腾冲市', '中国,云南省,保山市,腾冲市', '腾冲', '中国,云南,保山,腾冲', '3', '0875', '679100', 'Tengchong', 'TC', 'T', '98.4941', '25.0254', '');
INSERT INTO `t_order_region` VALUES ('3195', '530600', '530000', '昭通市', '中国,云南省,昭通市', '昭通', '中国,云南,昭通', '2', '0870', '657000', 'Zhaotong', 'ZT', 'Z', '103.717', '27.337', '');
INSERT INTO `t_order_region` VALUES ('3196', '530602', '530600', '昭阳区', '中国,云南省,昭通市,昭阳区', '昭阳', '中国,云南,昭通,昭阳', '3', '0870', '657000', 'Zhaoyang', 'ZY', 'Z', '103.707', '27.32', '');
INSERT INTO `t_order_region` VALUES ('3197', '530621', '530600', '鲁甸县', '中国,云南省,昭通市,鲁甸县', '鲁甸', '中国,云南,昭通,鲁甸', '3', '0870', '657100', 'Ludian', 'LD', 'L', '103.547', '27.1924', '');
INSERT INTO `t_order_region` VALUES ('3198', '530622', '530600', '巧家县', '中国,云南省,昭通市,巧家县', '巧家', '中国,云南,昭通,巧家', '3', '0870', '654600', 'Qiaojia', 'QJ', 'Q', '102.924', '26.9124', '');
INSERT INTO `t_order_region` VALUES ('3199', '530623', '530600', '盐津县', '中国,云南省,昭通市,盐津县', '盐津', '中国,云南,昭通,盐津', '3', '0870', '657500', 'Yanjin', 'YJ', 'Y', '104.235', '28.1086', '');
INSERT INTO `t_order_region` VALUES ('3200', '530624', '530600', '大关县', '中国,云南省,昭通市,大关县', '大关', '中国,云南,昭通,大关', '3', '0870', '657400', 'Daguan', 'DG', 'D', '103.893', '27.7488', '');
INSERT INTO `t_order_region` VALUES ('3201', '530625', '530600', '永善县', '中国,云南省,昭通市,永善县', '永善', '中国,云南,昭通,永善', '3', '0870', '657300', 'Yongshan', 'YS', 'Y', '103.635', '28.2279', '');
INSERT INTO `t_order_region` VALUES ('3202', '530626', '530600', '绥江县', '中国,云南省,昭通市,绥江县', '绥江', '中国,云南,昭通,绥江', '3', '0870', '657700', 'Suijiang', 'SJ', 'S', '103.949', '28.5966', '');
INSERT INTO `t_order_region` VALUES ('3203', '530627', '530600', '镇雄县', '中国,云南省,昭通市,镇雄县', '镇雄', '中国,云南,昭通,镇雄', '3', '0870', '657200', 'Zhenxiong', 'ZX', 'Z', '104.873', '27.4398', '');
INSERT INTO `t_order_region` VALUES ('3204', '530628', '530600', '彝良县', '中国,云南省,昭通市,彝良县', '彝良', '中国,云南,昭通,彝良', '3', '0870', '657600', 'Yiliang', 'YL', 'Y', '104.05', '27.6281', '');
INSERT INTO `t_order_region` VALUES ('3205', '530629', '530600', '威信县', '中国,云南省,昭通市,威信县', '威信', '中国,云南,昭通,威信', '3', '0870', '657900', 'Weixin', 'WX', 'W', '105.048', '27.8407', '');
INSERT INTO `t_order_region` VALUES ('3206', '530630', '530600', '水富县', '中国,云南省,昭通市,水富县', '水富', '中国,云南,昭通,水富', '3', '0870', '657800', 'Shuifu', 'SF', 'S', '104.416', '28.6299', '');
INSERT INTO `t_order_region` VALUES ('3207', '530700', '530000', '丽江市', '中国,云南省,丽江市', '丽江', '中国,云南,丽江', '2', '0888', '674100', 'Lijiang', 'LJ', 'L', '100.233', '26.8721', '');
INSERT INTO `t_order_region` VALUES ('3208', '530702', '530700', '古城区', '中国,云南省,丽江市,古城区', '古城', '中国,云南,丽江,古城', '3', '0888', '674100', 'Gucheng', 'GC', 'G', '100.226', '26.877', '');
INSERT INTO `t_order_region` VALUES ('3209', '530721', '530700', '玉龙纳西族自治县', '中国,云南省,丽江市,玉龙纳西族自治县', '玉龙', '中国,云南,丽江,玉龙', '3', '0888', '674100', 'Yulong', 'YL', 'Y', '100.237', '26.8215', '');
INSERT INTO `t_order_region` VALUES ('3210', '530722', '530700', '永胜县', '中国,云南省,丽江市,永胜县', '永胜', '中国,云南,丽江,永胜', '3', '0888', '674200', 'Yongsheng', 'YS', 'Y', '100.747', '26.6859', '');
INSERT INTO `t_order_region` VALUES ('3211', '530723', '530700', '华坪县', '中国,云南省,丽江市,华坪县', '华坪', '中国,云南,丽江,华坪', '3', '0888', '674800', 'Huaping', 'HP', 'H', '101.266', '26.6297', '');
INSERT INTO `t_order_region` VALUES ('3212', '530724', '530700', '宁蒗彝族自治县', '中国,云南省,丽江市,宁蒗彝族自治县', '宁蒗', '中国,云南,丽江,宁蒗', '3', '0888', '674300', 'Ninglang', 'NL', 'N', '100.851', '27.2818', '');
INSERT INTO `t_order_region` VALUES ('3213', '530800', '530000', '普洱市', '中国,云南省,普洱市', '普洱', '中国,云南,普洱', '2', '0879', '665000', 'Pu\'er', 'PE', 'P', '100.972', '22.7773', '');
INSERT INTO `t_order_region` VALUES ('3214', '530802', '530800', '思茅区', '中国,云南省,普洱市,思茅区', '思茅', '中国,云南,普洱,思茅', '3', '0879', '665000', 'Simao', 'SM', 'S', '100.977', '22.7869', '');
INSERT INTO `t_order_region` VALUES ('3215', '530821', '530800', '宁洱哈尼族彝族自治县', '中国,云南省,普洱市,宁洱哈尼族彝族自治县', '宁洱', '中国,云南,普洱,宁洱', '3', '0879', '665100', 'Ninger', 'NE', 'N', '101.047', '23.0634', '');
INSERT INTO `t_order_region` VALUES ('3216', '530822', '530800', '墨江哈尼族自治县', '中国,云南省,普洱市,墨江哈尼族自治县', '墨江', '中国,云南,普洱,墨江', '3', '0879', '654800', 'Mojiang', 'MJ', 'M', '101.692', '23.4321', '');
INSERT INTO `t_order_region` VALUES ('3217', '530823', '530800', '景东彝族自治县', '中国,云南省,普洱市,景东彝族自治县', '景东', '中国,云南,普洱,景东', '3', '0879', '676200', 'Jingdong', 'JD', 'J', '100.836', '24.4479', '');
INSERT INTO `t_order_region` VALUES ('3218', '530824', '530800', '景谷傣族彝族自治县', '中国,云南省,普洱市,景谷傣族彝族自治县', '景谷', '中国,云南,普洱,景谷', '3', '0879', '666400', 'Jinggu', 'JG', 'J', '100.703', '23.497', '');
INSERT INTO `t_order_region` VALUES ('3219', '530825', '530800', '镇沅彝族哈尼族拉祜族自治县', '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', '镇沅', '中国,云南,普洱,镇沅', '3', '0879', '666500', 'Zhenyuan', 'ZY', 'Z', '101.107', '24.0056', '');
INSERT INTO `t_order_region` VALUES ('3220', '530826', '530800', '江城哈尼族彝族自治县', '中国,云南省,普洱市,江城哈尼族彝族自治县', '江城', '中国,云南,普洱,江城', '3', '0879', '665900', 'Jiangcheng', 'JC', 'J', '101.858', '22.5842', '');
INSERT INTO `t_order_region` VALUES ('3221', '530827', '530800', '孟连傣族拉祜族佤族自治县', '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', '孟连', '中国,云南,普洱,孟连', '3', '0879', '665800', 'Menglian', 'ML', 'M', '99.5842', '22.3292', '');
INSERT INTO `t_order_region` VALUES ('3222', '530828', '530800', '澜沧拉祜族自治县', '中国,云南省,普洱市,澜沧拉祜族自治县', '澜沧', '中国,云南,普洱,澜沧', '3', '0879', '665600', 'Lancang', 'LC', 'L', '99.9359', '22.5547', '');
INSERT INTO `t_order_region` VALUES ('3223', '530829', '530800', '西盟佤族自治县', '中国,云南省,普洱市,西盟佤族自治县', '西盟', '中国,云南,普洱,西盟', '3', '0879', '665700', 'Ximeng', 'XM', 'X', '99.5987', '22.6477', '');
INSERT INTO `t_order_region` VALUES ('3224', '530900', '530000', '临沧市', '中国,云南省,临沧市', '临沧', '中国,云南,临沧', '2', '0883', '677000', 'Lincang', 'LC', 'L', '100.087', '23.8866', '');
INSERT INTO `t_order_region` VALUES ('3225', '530902', '530900', '临翔区', '中国,云南省,临沧市,临翔区', '临翔', '中国,云南,临沧,临翔', '3', '0883', '677000', 'Linxiang', 'LX', 'L', '100.082', '23.895', '');
INSERT INTO `t_order_region` VALUES ('3226', '530921', '530900', '凤庆县', '中国,云南省,临沧市,凤庆县', '凤庆', '中国,云南,临沧,凤庆', '3', '0883', '675900', 'Fengqing', 'FQ', 'F', '99.9284', '24.5803', '');
INSERT INTO `t_order_region` VALUES ('3227', '530922', '530900', '云县', '中国,云南省,临沧市,云县', '云县', '中国,云南,临沧,云县', '3', '0883', '675800', 'Yunxian', 'YX', 'Y', '100.128', '24.4468', '');
INSERT INTO `t_order_region` VALUES ('3228', '530923', '530900', '永德县', '中国,云南省,临沧市,永德县', '永德', '中国,云南,临沧,永德', '3', '0883', '677600', 'Yongde', 'YD', 'Y', '99.2533', '24.0276', '');
INSERT INTO `t_order_region` VALUES ('3229', '530924', '530900', '镇康县', '中国,云南省,临沧市,镇康县', '镇康', '中国,云南,临沧,镇康', '3', '0883', '677700', 'Zhenkang', 'ZK', 'Z', '98.8255', '23.7624', '');
INSERT INTO `t_order_region` VALUES ('3230', '530925', '530900', '双江拉祜族佤族布朗族傣族自治县', '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', '双江', '中国,云南,临沧,双江', '3', '0883', '677300', 'Shuangjiang', 'SJ', 'S', '99.8277', '23.4735', '');
INSERT INTO `t_order_region` VALUES ('3231', '530926', '530900', '耿马傣族佤族自治县', '中国,云南省,临沧市,耿马傣族佤族自治县', '耿马', '中国,云南,临沧,耿马', '3', '0883', '677500', 'Gengma', 'GM', 'G', '99.3979', '23.5378', '');
INSERT INTO `t_order_region` VALUES ('3232', '530927', '530900', '沧源佤族自治县', '中国,云南省,临沧市,沧源佤族自治县', '沧源', '中国,云南,临沧,沧源', '3', '0883', '677400', 'Cangyuan', 'CY', 'C', '99.2455', '23.1482', '');
INSERT INTO `t_order_region` VALUES ('3233', '532300', '530000', '楚雄彝族自治州', '中国,云南省,楚雄彝族自治州', '楚雄', '中国,云南,楚雄', '2', '0878', '675000', 'Chuxiong', 'CX', 'C', '101.546', '25.042', '');
INSERT INTO `t_order_region` VALUES ('3234', '532301', '532300', '楚雄市', '中国,云南省,楚雄彝族自治州,楚雄市', '楚雄', '中国,云南,楚雄,楚雄', '3', '0878', '675000', 'Chuxiong', 'CX', 'C', '101.546', '25.0329', '');
INSERT INTO `t_order_region` VALUES ('3235', '532322', '532300', '双柏县', '中国,云南省,楚雄彝族自治州,双柏县', '双柏', '中国,云南,楚雄,双柏', '3', '0878', '675100', 'Shuangbai', 'SB', 'S', '101.642', '24.6888', '');
INSERT INTO `t_order_region` VALUES ('3236', '532323', '532300', '牟定县', '中国,云南省,楚雄彝族自治州,牟定县', '牟定', '中国,云南,楚雄,牟定', '3', '0878', '675500', 'Mouding', 'MD', 'M', '101.54', '25.3155', '');
INSERT INTO `t_order_region` VALUES ('3237', '532324', '532300', '南华县', '中国,云南省,楚雄彝族自治州,南华县', '南华', '中国,云南,楚雄,南华', '3', '0878', '675200', 'Nanhua', 'NH', 'N', '101.273', '25.1929', '');
INSERT INTO `t_order_region` VALUES ('3238', '532325', '532300', '姚安县', '中国,云南省,楚雄彝族自治州,姚安县', '姚安', '中国,云南,楚雄,姚安', '3', '0878', '675300', 'Yao\'an', 'YA', 'Y', '101.243', '25.5047', '');
INSERT INTO `t_order_region` VALUES ('3239', '532326', '532300', '大姚县', '中国,云南省,楚雄彝族自治州,大姚县', '大姚', '中国,云南,楚雄,大姚', '3', '0878', '675400', 'Dayao', 'DY', 'D', '101.324', '25.7222', '');
INSERT INTO `t_order_region` VALUES ('3240', '532327', '532300', '永仁县', '中国,云南省,楚雄彝族自治州,永仁县', '永仁', '中国,云南,楚雄,永仁', '3', '0878', '651400', 'Yongren', 'YR', 'Y', '101.672', '26.0579', '');
INSERT INTO `t_order_region` VALUES ('3241', '532328', '532300', '元谋县', '中国,云南省,楚雄彝族自治州,元谋县', '元谋', '中国,云南,楚雄,元谋', '3', '0878', '651300', 'Yuanmou', 'YM', 'Y', '101.877', '25.7044', '');
INSERT INTO `t_order_region` VALUES ('3242', '532329', '532300', '武定县', '中国,云南省,楚雄彝族自治州,武定县', '武定', '中国,云南,楚雄,武定', '3', '0878', '651600', 'Wuding', 'WD', 'W', '102.404', '25.5295', '');
INSERT INTO `t_order_region` VALUES ('3243', '532331', '532300', '禄丰县', '中国,云南省,楚雄彝族自治州,禄丰县', '禄丰', '中国,云南,楚雄,禄丰', '3', '0878', '651200', 'Lufeng', 'LF', 'L', '102.078', '25.1481', '');
INSERT INTO `t_order_region` VALUES ('3244', '532500', '530000', '红河哈尼族彝族自治州', '中国,云南省,红河哈尼族彝族自治州', '红河', '中国,云南,红河', '2', '0873', '661400', 'Honghe', 'HH', 'H', '103.384', '23.3668', '');
INSERT INTO `t_order_region` VALUES ('3245', '532501', '532500', '个旧市', '中国,云南省,红河哈尼族彝族自治州,个旧市', '个旧', '中国,云南,红河,个旧', '3', '0873', '661000', 'Gejiu', 'GJ', 'G', '103.16', '23.3589', '');
INSERT INTO `t_order_region` VALUES ('3246', '532502', '532500', '开远市', '中国,云南省,红河哈尼族彝族自治州,开远市', '开远', '中国,云南,红河,开远', '3', '0873', '661600', 'Kaiyuan', 'KY', 'K', '103.27', '23.7101', '');
INSERT INTO `t_order_region` VALUES ('3247', '532503', '532500', '蒙自市', '中国,云南省,红河哈尼族彝族自治州,蒙自市', '蒙自', '中国,云南,红河,蒙自', '3', '0873', '661101', 'Mengzi', 'MZ', 'M', '103.385', '23.3668', '');
INSERT INTO `t_order_region` VALUES ('3248', '532504', '532500', '弥勒市', '中国,云南省,红河哈尼族彝族自治州,弥勒市', '弥勒', '中国,云南,红河,弥勒', '3', '0873', '652300', 'Mile ', 'ML', 'M', '103.437', '24.4084', '');
INSERT INTO `t_order_region` VALUES ('3249', '532523', '532500', '屏边苗族自治县', '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', '屏边', '中国,云南,红河,屏边', '3', '0873', '661200', 'Pingbian', 'PB', 'P', '103.686', '22.9842', '');
INSERT INTO `t_order_region` VALUES ('3250', '532524', '532500', '建水县', '中国,云南省,红河哈尼族彝族自治州,建水县', '建水', '中国,云南,红河,建水', '3', '0873', '654300', 'Jianshui', 'JS', 'J', '102.827', '23.6347', '');
INSERT INTO `t_order_region` VALUES ('3251', '532525', '532500', '石屏县', '中国,云南省,红河哈尼族彝族自治州,石屏县', '石屏', '中国,云南,红河,石屏', '3', '0873', '662200', 'Shiping', 'SP', 'S', '102.494', '23.7144', '');
INSERT INTO `t_order_region` VALUES ('3252', '532527', '532500', '泸西县', '中国,云南省,红河哈尼族彝族自治州,泸西县', '泸西', '中国,云南,红河,泸西', '3', '0873', '652400', 'Luxi', 'LX', 'L', '103.764', '24.5285', '');
INSERT INTO `t_order_region` VALUES ('3253', '532528', '532500', '元阳县', '中国,云南省,红河哈尼族彝族自治州,元阳县', '元阳', '中国,云南,红河,元阳', '3', '0873', '662400', 'Yuanyang', 'YY', 'Y', '102.833', '23.2228', '');
INSERT INTO `t_order_region` VALUES ('3254', '532529', '532500', '红河县', '中国,云南省,红河哈尼族彝族自治州,红河县', '红河县', '中国,云南,红河,红河县', '3', '0873', '654400', 'Honghexian', 'HHX', 'H', '102.421', '23.3677', '');
INSERT INTO `t_order_region` VALUES ('3255', '532530', '532500', '金平苗族瑶族傣族自治县', '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', '金平', '中国,云南,红河,金平', '3', '0873', '661500', 'Jinping', 'JP', 'J', '103.227', '22.7796', '');
INSERT INTO `t_order_region` VALUES ('3256', '532531', '532500', '绿春县', '中国,云南省,红河哈尼族彝族自治州,绿春县', '绿春', '中国,云南,红河,绿春', '3', '0873', '662500', 'Lvchun', 'LC', 'L', '102.397', '22.9937', '');
INSERT INTO `t_order_region` VALUES ('3257', '532532', '532500', '河口瑶族自治县', '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', '河口', '中国,云南,红河,河口', '3', '0873', '661300', 'Hekou', 'HK', 'H', '103.939', '22.5293', '');
INSERT INTO `t_order_region` VALUES ('3258', '532600', '530000', '文山壮族苗族自治州', '中国,云南省,文山壮族苗族自治州', '文山', '中国,云南,文山', '2', '0876', '663000', 'Wenshan', 'WS', 'W', '104.244', '23.3695', '');
INSERT INTO `t_order_region` VALUES ('3259', '532601', '532600', '文山市', '中国,云南省,文山壮族苗族自治州,文山市', '文山', '中国,云南,文山,文山', '3', '0876', '663000', 'Wenshan', 'WS', 'W', '104.244', '23.3692', '');
INSERT INTO `t_order_region` VALUES ('3260', '532622', '532600', '砚山县', '中国,云南省,文山壮族苗族自治州,砚山县', '砚山', '中国,云南,文山,砚山', '3', '0876', '663100', 'Yanshan', 'YS', 'Y', '104.333', '23.6072', '');
INSERT INTO `t_order_region` VALUES ('3261', '532623', '532600', '西畴县', '中国,云南省,文山壮族苗族自治州,西畴县', '西畴', '中国,云南,文山,西畴', '3', '0876', '663500', 'Xichou', 'XC', 'X', '104.674', '23.4394', '');
INSERT INTO `t_order_region` VALUES ('3262', '532624', '532600', '麻栗坡县', '中国,云南省,文山壮族苗族自治州,麻栗坡县', '麻栗坡', '中国,云南,文山,麻栗坡', '3', '0876', '663600', 'Malipo', 'MLP', 'M', '104.701', '23.1203', '');
INSERT INTO `t_order_region` VALUES ('3263', '532625', '532600', '马关县', '中国,云南省,文山壮族苗族自治州,马关县', '马关', '中国,云南,文山,马关', '3', '0876', '663700', 'Maguan', 'MG', 'M', '104.395', '23.0129', '');
INSERT INTO `t_order_region` VALUES ('3264', '532626', '532600', '丘北县', '中国,云南省,文山壮族苗族自治州,丘北县', '丘北', '中国,云南,文山,丘北', '3', '0876', '663200', 'Qiubei', 'QB', 'Q', '104.193', '24.0396', '');
INSERT INTO `t_order_region` VALUES ('3265', '532627', '532600', '广南县', '中国,云南省,文山壮族苗族自治州,广南县', '广南', '中国,云南,文山,广南', '3', '0876', '663300', 'Guangnan', 'GN', 'G', '105.055', '24.0464', '');
INSERT INTO `t_order_region` VALUES ('3266', '532628', '532600', '富宁县', '中国,云南省,文山壮族苗族自治州,富宁县', '富宁', '中国,云南,文山,富宁', '3', '0876', '663400', 'Funing', 'FN', 'F', '105.631', '23.6254', '');
INSERT INTO `t_order_region` VALUES ('3267', '532800', '530000', '西双版纳傣族自治州', '中国,云南省,西双版纳傣族自治州', '西双版纳', '中国,云南,西双版纳', '2', '0691', '666100', 'Xishuangbanna', 'XSBN', 'X', '100.798', '22.0017', '');
INSERT INTO `t_order_region` VALUES ('3268', '532801', '532800', '景洪市', '中国,云南省,西双版纳傣族自治州,景洪市', '景洪', '中国,云南,西双版纳,景洪', '3', '0691', '666100', 'Jinghong', 'JH', 'J', '100.8', '22.0107', '');
INSERT INTO `t_order_region` VALUES ('3269', '532822', '532800', '勐海县', '中国,云南省,西双版纳傣族自治州,勐海县', '勐海', '中国,云南,西双版纳,勐海', '3', '0691', '666200', 'Menghai', 'MH', 'M', '100.449', '21.9618', '');
INSERT INTO `t_order_region` VALUES ('3270', '532823', '532800', '勐腊县', '中国,云南省,西双版纳傣族自治州,勐腊县', '勐腊', '中国,云南,西双版纳,勐腊', '3', '0691', '666300', 'Mengla', 'ML', 'M', '101.565', '21.4816', '');
INSERT INTO `t_order_region` VALUES ('3271', '532900', '530000', '大理白族自治州', '中国,云南省,大理白族自治州', '大理', '中国,云南,大理', '2', '0872', '671000', 'Dali', 'DL', 'D', '100.24', '25.5928', '');
INSERT INTO `t_order_region` VALUES ('3272', '532901', '532900', '大理市', '中国,云南省,大理白族自治州,大理市', '大理', '中国,云南,大理,大理', '3', '0872', '671000', 'Dali', 'DL', 'D', '100.23', '25.5916', '');
INSERT INTO `t_order_region` VALUES ('3273', '532922', '532900', '漾濞彝族自治县', '中国,云南省,大理白族自治州,漾濞彝族自治县', '漾濞', '中国,云南,大理,漾濞', '3', '0872', '672500', 'Yangbi', 'YB', 'Y', '99.9547', '25.6652', '');
INSERT INTO `t_order_region` VALUES ('3274', '532923', '532900', '祥云县', '中国,云南省,大理白族自治州,祥云县', '祥云', '中国,云南,大理,祥云', '3', '0872', '672100', 'Xiangyun', 'XY', 'X', '100.558', '25.4734', '');
INSERT INTO `t_order_region` VALUES ('3275', '532924', '532900', '宾川县', '中国,云南省,大理白族自治州,宾川县', '宾川', '中国,云南,大理,宾川', '3', '0872', '671600', 'Binchuan', 'BC', 'B', '100.577', '25.8314', '');
INSERT INTO `t_order_region` VALUES ('3276', '532925', '532900', '弥渡县', '中国,云南省,大理白族自治州,弥渡县', '弥渡', '中国,云南,大理,弥渡', '3', '0872', '675600', 'Midu', 'MD', 'M', '100.491', '25.3418', '');
INSERT INTO `t_order_region` VALUES ('3277', '532926', '532900', '南涧彝族自治县', '中国,云南省,大理白族自治州,南涧彝族自治县', '南涧', '中国,云南,大理,南涧', '3', '0872', '675700', 'Nanjian', 'NJ', 'N', '100.51', '25.0435', '');
INSERT INTO `t_order_region` VALUES ('3278', '532927', '532900', '巍山彝族回族自治县', '中国,云南省,大理白族自治州,巍山彝族回族自治县', '巍山', '中国,云南,大理,巍山', '3', '0872', '672400', 'Weishan', 'WS', 'W', '100.306', '25.232', '');
INSERT INTO `t_order_region` VALUES ('3279', '532928', '532900', '永平县', '中国,云南省,大理白族自治州,永平县', '永平', '中国,云南,大理,永平', '3', '0872', '672600', 'Yongping', 'YP', 'Y', '99.5409', '25.4645', '');
INSERT INTO `t_order_region` VALUES ('3280', '532929', '532900', '云龙县', '中国,云南省,大理白族自治州,云龙县', '云龙', '中国,云南,大理,云龙', '3', '0872', '672700', 'Yunlong', 'YL', 'Y', '99.3726', '25.885', '');
INSERT INTO `t_order_region` VALUES ('3281', '532930', '532900', '洱源县', '中国,云南省,大理白族自治州,洱源县', '洱源', '中国,云南,大理,洱源', '3', '0872', '671200', 'Eryuan', 'EY', 'E', '99.949', '26.1083', '');
INSERT INTO `t_order_region` VALUES ('3282', '532931', '532900', '剑川县', '中国,云南省,大理白族自治州,剑川县', '剑川', '中国,云南,大理,剑川', '3', '0872', '671300', 'Jianchuan', 'JC', 'J', '99.9054', '26.5369', '');
INSERT INTO `t_order_region` VALUES ('3283', '532932', '532900', '鹤庆县', '中国,云南省,大理白族自治州,鹤庆县', '鹤庆', '中国,云南,大理,鹤庆', '3', '0872', '671500', 'Heqing', 'HQ', 'H', '100.177', '26.558', '');
INSERT INTO `t_order_region` VALUES ('3284', '533100', '530000', '德宏傣族景颇族自治州', '中国,云南省,德宏傣族景颇族自治州', '德宏', '中国,云南,德宏', '2', '0692', '678400', 'Dehong', 'DH', 'D', '98.5784', '24.4367', '');
INSERT INTO `t_order_region` VALUES ('3285', '533102', '533100', '瑞丽市', '中国,云南省,德宏傣族景颇族自治州,瑞丽市', '瑞丽', '中国,云南,德宏,瑞丽', '3', '0692', '678600', 'Ruili', 'RL', 'R', '97.8518', '24.0128', '');
INSERT INTO `t_order_region` VALUES ('3286', '533103', '533100', '芒市', '中国,云南省,德宏傣族景颇族自治州,芒市', '芒市', '中国,云南,德宏,芒市', '3', '0692', '678400', 'Mangshi', 'MS', 'M', '98.5886', '24.4337', '');
INSERT INTO `t_order_region` VALUES ('3287', '533122', '533100', '梁河县', '中国,云南省,德宏傣族景颇族自治州,梁河县', '梁河', '中国,云南,德宏,梁河', '3', '0692', '679200', 'Lianghe', 'LH', 'L', '98.2971', '24.8066', '');
INSERT INTO `t_order_region` VALUES ('3288', '533123', '533100', '盈江县', '中国,云南省,德宏傣族景颇族自治州,盈江县', '盈江', '中国,云南,德宏,盈江', '3', '0692', '679300', 'Yingjiang', 'YJ', 'Y', '97.9318', '24.7058', '');
INSERT INTO `t_order_region` VALUES ('3289', '533124', '533100', '陇川县', '中国,云南省,德宏傣族景颇族自治州,陇川县', '陇川', '中国,云南,德宏,陇川', '3', '0692', '678700', 'Longchuan', 'LC', 'L', '97.792', '24.183', '');
INSERT INTO `t_order_region` VALUES ('3290', '533300', '530000', '怒江傈僳族自治州', '中国,云南省,怒江傈僳族自治州', '怒江', '中国,云南,怒江', '2', '0886', '673100', 'Nujiang', 'NJ', 'N', '98.8543', '25.8509', '');
INSERT INTO `t_order_region` VALUES ('3291', '533301', '533300', '泸水市', '中国,云南省,怒江傈僳族自治州,泸水市', '泸水', '中国,云南,怒江,泸水', '3', '0886', '673200', 'Lushui', 'LS', 'L', '98.8553', '25.8377', '');
INSERT INTO `t_order_region` VALUES ('3292', '533323', '533300', '福贡县', '中国,云南省,怒江傈僳族自治州,福贡县', '福贡', '中国,云南,怒江,福贡', '3', '0886', '673400', 'Fugong', 'FG', 'F', '98.8697', '26.9037', '');
INSERT INTO `t_order_region` VALUES ('3293', '533324', '533300', '贡山独龙族怒族自治县', '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', '贡山', '中国,云南,怒江,贡山', '3', '0886', '673500', 'Gongshan', 'GS', 'G', '98.6658', '27.7409', '');
INSERT INTO `t_order_region` VALUES ('3294', '533325', '533300', '兰坪白族普米族自治县', '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', '兰坪', '中国,云南,怒江,兰坪', '3', '0886', '671400', 'Lanping', 'LP', 'L', '99.4189', '26.4525', '');
INSERT INTO `t_order_region` VALUES ('3295', '533400', '530000', '迪庆藏族自治州', '中国,云南省,迪庆藏族自治州', '迪庆', '中国,云南,迪庆', '2', '0887', '674400', 'Deqen', 'DQ', 'D', '99.7065', '27.8269', '');
INSERT INTO `t_order_region` VALUES ('3296', '533401', '533400', '香格里拉市', '中国,云南省,迪庆藏族自治州,香格里拉市', '香格里拉', '中国,云南,迪庆,香格里拉', '3', '0887', '674400', 'Xianggelila', 'XGLL', 'X', '99.706', '27.8231', '');
INSERT INTO `t_order_region` VALUES ('3297', '533422', '533400', '德钦县', '中国,云南省,迪庆藏族自治州,德钦县', '德钦', '中国,云南,迪庆,德钦', '3', '0887', '674500', 'Deqin', 'DQ', 'D', '98.9108', '28.4863', '');
INSERT INTO `t_order_region` VALUES ('3298', '533423', '533400', '维西傈僳族自治县', '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', '维西', '中国,云南,迪庆,维西', '3', '0887', '674600', 'Weixi', 'WX', 'W', '99.284', '27.1793', '');
INSERT INTO `t_order_region` VALUES ('3299', '540000', '100000', '西藏自治区', '中国,西藏自治区', '西藏', '中国,西藏', '1', '', '', 'Tibet', 'XZ', 'T', '91.1322', '29.6604', '');
INSERT INTO `t_order_region` VALUES ('3300', '540100', '540000', '拉萨市', '中国,西藏自治区,拉萨市', '拉萨', '中国,西藏,拉萨', '2', '0891', '850000', 'Lhasa', 'LS', 'L', '91.1322', '29.6604', '');
INSERT INTO `t_order_region` VALUES ('3301', '540102', '540100', '城关区', '中国,西藏自治区,拉萨市,城关区', '城关', '中国,西藏,拉萨,城关', '3', '0891', '850000', 'Chengguan', 'CG', 'C', '91.1386', '29.6531', '');
INSERT INTO `t_order_region` VALUES ('3302', '540103', '540100', '堆龙德庆区', '中国,西藏自治区,拉萨市,堆龙德庆区', '堆龙德庆', '中国,西藏,拉萨,堆龙德庆', '3', '0891', '851400', 'Duilongdeqing', 'DLDQ', 'D', '91.0003', '29.65', '');
INSERT INTO `t_order_region` VALUES ('3303', '540121', '540100', '林周县', '中国,西藏自治区,拉萨市,林周县', '林周', '中国,西藏,拉萨,林周', '3', '0891', '851600', 'Linzhou', 'LZ', 'L', '91.2586', '29.8944', '');
INSERT INTO `t_order_region` VALUES ('3304', '540122', '540100', '当雄县', '中国,西藏自治区,拉萨市,当雄县', '当雄', '中国,西藏,拉萨,当雄', '3', '0891', '851500', 'Dangxiong', 'DX', 'D', '91.1008', '30.4831', '');
INSERT INTO `t_order_region` VALUES ('3305', '540123', '540100', '尼木县', '中国,西藏自治区,拉萨市,尼木县', '尼木', '中国,西藏,拉萨,尼木', '3', '0891', '851600', 'Nimu', 'NM', 'N', '90.1638', '29.4335', '');
INSERT INTO `t_order_region` VALUES ('3306', '540124', '540100', '曲水县', '中国,西藏自治区,拉萨市,曲水县', '曲水', '中国,西藏,拉萨,曲水', '3', '0891', '850600', 'Qushui', 'QS', 'Q', '90.7319', '29.3564', '');
INSERT INTO `t_order_region` VALUES ('3307', '540126', '540100', '达孜县', '中国,西藏自治区,拉萨市,达孜县', '达孜', '中国,西藏,拉萨,达孜', '3', '0891', '850100', 'Dazi', 'DZ', 'D', '91.3576', '29.6722', '');
INSERT INTO `t_order_region` VALUES ('3308', '540127', '540100', '墨竹工卡县', '中国,西藏自治区,拉萨市,墨竹工卡县', '墨竹工卡', '中国,西藏,拉萨,墨竹工卡', '3', '0891', '850200', 'Mozhugongka', 'MZGK', 'M', '91.7281', '29.8361', '');
INSERT INTO `t_order_region` VALUES ('3309', '540200', '540000', '日喀则市', '中国,西藏自治区,日喀则市', '日喀则', '中国,西藏,日喀则', '2', '0892', '857000', 'Rikaze', 'RKZ', 'R', '88.8849', '29.2638', '');
INSERT INTO `t_order_region` VALUES ('3310', '540202', '540200', '桑珠孜区', '中国,西藏自治区,日喀则市,桑珠孜区', '桑珠孜', '中国,西藏,日喀则,桑珠孜', '3', '0892', '857000', 'Sangzhuzi', 'SZZ', 'S', '88.8804', '29.2696', '');
INSERT INTO `t_order_region` VALUES ('3311', '540221', '540200', '南木林县', '中国,西藏自治区,日喀则市,南木林县', '南木林', '中国,西藏,日喀则,南木林', '3', '0892', '857100', 'Nanmulin', 'NML', 'N', '89.0969', '29.6821', '');
INSERT INTO `t_order_region` VALUES ('3312', '540222', '540200', '江孜县', '中国,西藏自治区,日喀则市,江孜县', '江孜', '中国,西藏,日喀则,江孜', '3', '0892', '857400', 'Jiangzi', 'JZ', 'J', '89.6026', '28.9174', '');
INSERT INTO `t_order_region` VALUES ('3313', '540223', '540200', '定日县', '中国,西藏自治区,日喀则市,定日县', '定日', '中国,西藏,日喀则,定日', '3', '0892', '858200', 'Dingri', 'DR', 'D', '87.1218', '28.6613', '');
INSERT INTO `t_order_region` VALUES ('3314', '540224', '540200', '萨迦县', '中国,西藏自治区,日喀则市,萨迦县', '萨迦', '中国,西藏,日喀则,萨迦', '3', '0892', '857800', 'Sajia', 'SJ', 'S', '88.0219', '28.903', '');
INSERT INTO `t_order_region` VALUES ('3315', '540225', '540200', '拉孜县', '中国,西藏自治区,日喀则市,拉孜县', '拉孜', '中国,西藏,日喀则,拉孜', '3', '0892', '858100', 'Lazi', 'LZ', 'L', '87.6341', '29.085', '');
INSERT INTO `t_order_region` VALUES ('3316', '540226', '540200', '昂仁县', '中国,西藏自治区,日喀则市,昂仁县', '昂仁', '中国,西藏,日喀则,昂仁', '3', '0892', '858500', 'Angren', 'AR', 'A', '87.2386', '29.295', '');
INSERT INTO `t_order_region` VALUES ('3317', '540227', '540200', '谢通门县', '中国,西藏自治区,日喀则市,谢通门县', '谢通门', '中国,西藏,日喀则,谢通门', '3', '0892', '858900', 'Xietongmen', 'XTM', 'X', '88.2624', '29.4334', '');
INSERT INTO `t_order_region` VALUES ('3318', '540228', '540200', '白朗县', '中国,西藏自治区,日喀则市,白朗县', '白朗', '中国,西藏,日喀则,白朗', '3', '0892', '857300', 'Bailang', 'BL', 'B', '89.262', '29.1055', '');
INSERT INTO `t_order_region` VALUES ('3319', '540229', '540200', '仁布县', '中国,西藏自治区,日喀则市,仁布县', '仁布', '中国,西藏,日喀则,仁布', '3', '0892', '857200', 'Renbu', 'RB', 'R', '89.8423', '29.2301', '');
INSERT INTO `t_order_region` VALUES ('3320', '540230', '540200', '康马县', '中国,西藏自治区,日喀则市,康马县', '康马', '中国,西藏,日喀则,康马', '3', '0892', '857500', 'Kangma', 'KM', 'K', '89.6853', '28.5567', '');
INSERT INTO `t_order_region` VALUES ('3321', '540231', '540200', '定结县', '中国,西藏自治区,日喀则市,定结县', '定结', '中国,西藏,日喀则,定结', '3', '0892', '857900', 'Dingjie', 'DJ', 'D', '87.7726', '28.364', '');
INSERT INTO `t_order_region` VALUES ('3322', '540232', '540200', '仲巴县', '中国,西藏自治区,日喀则市,仲巴县', '仲巴', '中国,西藏,日喀则,仲巴', '3', '0892', '858800', 'Zhongba', 'ZB', 'Z', '84.0295', '29.7659', '');
INSERT INTO `t_order_region` VALUES ('3323', '540233', '540200', '亚东县', '中国,西藏自治区,日喀则市,亚东县', '亚东', '中国,西藏,日喀则,亚东', '3', '0892', '857600', 'Yadong', 'YD', 'Y', '88.908', '27.4839', '');
INSERT INTO `t_order_region` VALUES ('3324', '540234', '540200', '吉隆县', '中国,西藏自治区,日喀则市,吉隆县', '吉隆', '中国,西藏,日喀则,吉隆', '3', '0892', '858700', 'Jilong', 'JL', 'J', '85.2985', '28.8538', '');
INSERT INTO `t_order_region` VALUES ('3325', '540235', '540200', '聂拉木县', '中国,西藏自治区,日喀则市,聂拉木县', '聂拉木', '中国,西藏,日喀则,聂拉木', '3', '0892', '858300', 'Nielamu', 'NLM', 'N', '85.98', '28.1565', '');
INSERT INTO `t_order_region` VALUES ('3326', '540236', '540200', '萨嘎县', '中国,西藏自治区,日喀则市,萨嘎县', '萨嘎', '中国,西藏,日喀则,萨嘎', '3', '0892', '857800', 'Saga', 'SG', 'S', '85.2341', '29.3294', '');
INSERT INTO `t_order_region` VALUES ('3327', '540237', '540200', '岗巴县', '中国,西藏自治区,日喀则市,岗巴县', '岗巴', '中国,西藏,日喀则,岗巴', '3', '0892', '857700', 'Gangba', 'GB', 'G', '88.5207', '28.275', '');
INSERT INTO `t_order_region` VALUES ('3328', '540300', '540000', '昌都市', '中国,西藏自治区,昌都市', '昌都', '中国,西藏,昌都', '2', '0895', '854000', 'Qamdo', 'CD', 'Q', '97.1785', '31.1369', '');
INSERT INTO `t_order_region` VALUES ('3329', '540302', '540300', '卡若区', '中国,西藏自治区,昌都市,卡若区', '卡若', '中国,西藏,昌都,卡若', '3', '0895', '854000', 'Karuo', 'KR', 'K', '97.1804', '31.1385', '');
INSERT INTO `t_order_region` VALUES ('3330', '540321', '540300', '江达县', '中国,西藏自治区,昌都市,江达县', '江达', '中国,西藏,昌都,江达', '3', '0895', '854100', 'Jiangda', 'JD', 'J', '98.2187', '31.5034', '');
INSERT INTO `t_order_region` VALUES ('3331', '540322', '540300', '贡觉县', '中国,西藏自治区,昌都市,贡觉县', '贡觉', '中国,西藏,昌都,贡觉', '3', '0895', '854200', 'Gongjue', 'GJ', 'G', '98.2716', '30.8594', '');
INSERT INTO `t_order_region` VALUES ('3332', '540323', '540300', '类乌齐县', '中国,西藏自治区,昌都市,类乌齐县', '类乌齐', '中国,西藏,昌都,类乌齐', '3', '0895', '855600', 'Leiwuqi', 'LWQ', 'L', '96.6002', '31.2121', '');
INSERT INTO `t_order_region` VALUES ('3333', '540324', '540300', '丁青县', '中国,西藏自治区,昌都市,丁青县', '丁青', '中国,西藏,昌都,丁青', '3', '0895', '855700', 'Dingqing', 'DQ', 'D', '95.5936', '31.4162', '');
INSERT INTO `t_order_region` VALUES ('3334', '540325', '540300', '察雅县', '中国,西藏自治区,昌都市,察雅县', '察雅', '中国,西藏,昌都,察雅', '3', '0895', '854300', 'Chaya', 'CY', 'C', '97.5652', '30.6534', '');
INSERT INTO `t_order_region` VALUES ('3335', '540326', '540300', '八宿县', '中国,西藏自治区,昌都市,八宿县', '八宿', '中国,西藏,昌都,八宿', '3', '0895', '854600', 'Basu', 'BS', 'B', '96.9176', '30.0535', '');
INSERT INTO `t_order_region` VALUES ('3336', '540327', '540300', '左贡县', '中国,西藏自治区,昌都市,左贡县', '左贡', '中国,西藏,昌都,左贡', '3', '0895', '854400', 'Zuogong', 'ZG', 'Z', '97.8443', '29.6711', '');
INSERT INTO `t_order_region` VALUES ('3337', '540328', '540300', '芒康县', '中国,西藏自治区,昌都市,芒康县', '芒康', '中国,西藏,昌都,芒康', '3', '0895', '854500', 'Mangkang', 'MK', 'M', '98.5938', '29.6795', '');
INSERT INTO `t_order_region` VALUES ('3338', '540329', '540300', '洛隆县', '中国,西藏自治区,昌都市,洛隆县', '洛隆', '中国,西藏,昌都,洛隆', '3', '0895', '855400', 'Luolong', 'LL', 'L', '95.8264', '30.7405', '');
INSERT INTO `t_order_region` VALUES ('3339', '540330', '540300', '边坝县', '中国,西藏自治区,昌都市,边坝县', '边坝', '中国,西藏,昌都,边坝', '3', '0895', '855500', 'Bianba', 'BB', 'B', '94.7069', '30.9343', '');
INSERT INTO `t_order_region` VALUES ('3340', '540400', '540000', '林芝市', '中国,西藏自治区,林芝市', '林芝', '中国,西藏,林芝', '2', '0894', '860000', 'Nyingchi', 'LZ', 'N', '94.3624', '29.6547', '');
INSERT INTO `t_order_region` VALUES ('3341', '540402', '540400', '巴宜区', '中国,西藏自治区,林芝市,巴宜区', '巴宜', '中国,西藏,林芝,巴宜', '3', '0894', '860100', 'BaYi', 'BY', 'B', '94.4839', '29.5756', '');
INSERT INTO `t_order_region` VALUES ('3342', '540421', '540400', '工布江达县', '中国,西藏自治区,林芝市,工布江达县', '工布江达', '中国,西藏,林芝,工布江达', '3', '0894', '860200', 'Gongbujiangda', 'GBJD', 'G', '93.2452', '29.8858', '');
INSERT INTO `t_order_region` VALUES ('3343', '540422', '540400', '米林县', '中国,西藏自治区,林芝市,米林县', '米林', '中国,西藏,林芝,米林', '3', '0894', '860500', 'Milin', 'ML', 'M', '94.2132', '29.2153', '');
INSERT INTO `t_order_region` VALUES ('3344', '540423', '540400', '墨脱县', '中国,西藏自治区,林芝市,墨脱县', '墨脱', '中国,西藏,林芝,墨脱', '3', '0894', '860700', 'Motuo', 'MT', 'M', '95.3316', '29.327', '');
INSERT INTO `t_order_region` VALUES ('3345', '540424', '540400', '波密县', '中国,西藏自治区,林芝市,波密县', '波密', '中国,西藏,林芝,波密', '3', '0894', '860300', 'Bomi', 'BM', 'B', '95.771', '29.8591', '');
INSERT INTO `t_order_region` VALUES ('3346', '540425', '540400', '察隅县', '中国,西藏自治区,林芝市,察隅县', '察隅', '中国,西藏,林芝,察隅', '3', '0894', '860600', 'Chayu', 'CY', 'C', '97.4668', '28.6618', '');
INSERT INTO `t_order_region` VALUES ('3347', '540426', '540400', '朗县', '中国,西藏自治区,林芝市,朗县', '朗县', '中国,西藏,林芝,朗县', '3', '0894', '860400', 'Langxian', 'LX', 'L', '93.0754', '29.0455', '');
INSERT INTO `t_order_region` VALUES ('3348', '540500', '540000', '山南市', '中国,西藏自治区,山南市', '山南', '中国,西藏,山南', '2', '0893', '856000', 'Shannan', 'SN', 'S', '91.7665', '29.236', '');
INSERT INTO `t_order_region` VALUES ('3349', '540502', '540500', '乃东区', '中国,西藏自治区,山南市,乃东区', '乃东', '中国,西藏,山南,乃东', '3', '0893', '856100', 'Naidong', 'ND', 'N', '91.7615', '29.2249', '');
INSERT INTO `t_order_region` VALUES ('3350', '540521', '540500', '扎囊县', '中国,西藏自治区,山南市,扎囊县', '扎囊', '中国,西藏,山南,扎囊', '3', '0893', '850800', 'Zhanang', 'ZN', 'Z', '91.3329', '29.2399', '');
INSERT INTO `t_order_region` VALUES ('3351', '540522', '540500', '贡嘎县', '中国,西藏自治区,山南市,贡嘎县', '贡嘎', '中国,西藏,山南,贡嘎', '3', '0893', '850700', 'Gongga', 'GG', 'G', '90.9887', '29.2941', '');
INSERT INTO `t_order_region` VALUES ('3352', '540523', '540500', '桑日县', '中国,西藏自治区,山南市,桑日县', '桑日', '中国,西藏,山南,桑日', '3', '0893', '856200', 'Sangri', 'SR', 'S', '92.0201', '29.2664', '');
INSERT INTO `t_order_region` VALUES ('3353', '540524', '540500', '琼结县', '中国,西藏自治区,山南市,琼结县', '琼结', '中国,西藏,山南,琼结', '3', '0893', '856800', 'Qiongjie', 'QJ', 'Q', '91.6809', '29.0263', '');
INSERT INTO `t_order_region` VALUES ('3354', '540525', '540500', '曲松县', '中国,西藏自治区,山南市,曲松县', '曲松', '中国,西藏,山南,曲松', '3', '0893', '856300', 'Qusong', 'QS', 'Q', '92.2026', '29.0641', '');
INSERT INTO `t_order_region` VALUES ('3355', '540526', '540500', '措美县', '中国,西藏自治区,山南市,措美县', '措美', '中国,西藏,山南,措美', '3', '0893', '856900', 'Cuomei', 'CM', 'C', '91.4324', '28.4379', '');
INSERT INTO `t_order_region` VALUES ('3356', '540527', '540500', '洛扎县', '中国,西藏自治区,山南市,洛扎县', '洛扎', '中国,西藏,山南,洛扎', '3', '0893', '851200', 'Luozha', 'LZ', 'L', '90.8604', '28.3872', '');
INSERT INTO `t_order_region` VALUES ('3357', '540528', '540500', '加查县', '中国,西藏自治区,山南市,加查县', '加查', '中国,西藏,山南,加查', '3', '0893', '856400', 'Jiacha', 'JC', 'J', '92.577', '29.1397', '');
INSERT INTO `t_order_region` VALUES ('3358', '540529', '540500', '隆子县', '中国,西藏自治区,山南市,隆子县', '隆子', '中国,西藏,山南,隆子', '3', '0893', '856600', 'Longzi', 'LZ', 'L', '92.4615', '28.408', '');
INSERT INTO `t_order_region` VALUES ('3359', '540530', '540500', '错那县', '中国,西藏自治区,山南市,错那县', '错那', '中国,西藏,山南,错那', '3', '0893', '856700', 'Cuona', 'CN', 'C', '91.9575', '27.9922', '');
INSERT INTO `t_order_region` VALUES ('3360', '540531', '540500', '浪卡子县', '中国,西藏自治区,山南市,浪卡子县', '浪卡子', '中国,西藏,山南,浪卡子', '3', '0893', '851100', 'Langkazi', 'LKZ', 'L', '90.4', '28.9695', '');
INSERT INTO `t_order_region` VALUES ('3361', '542400', '540000', '那曲地区', '中国,西藏自治区,那曲地区', '那曲', '中国,西藏,那曲', '2', '0896', '852000', 'Nagqu', 'NQ', 'N', '92.0602', '31.476', '');
INSERT INTO `t_order_region` VALUES ('3362', '542421', '542400', '那曲县', '中国,西藏自治区,那曲地区,那曲县', '那曲', '中国,西藏,那曲,那曲', '3', '0896', '852000', 'Naqu', 'NQ', 'N', '92.0535', '31.4696', '');
INSERT INTO `t_order_region` VALUES ('3363', '542422', '542400', '嘉黎县', '中国,西藏自治区,那曲地区,嘉黎县', '嘉黎', '中国,西藏,那曲,嘉黎', '3', '0896', '852400', 'Jiali', 'JL', 'J', '93.2499', '30.6423', '');
INSERT INTO `t_order_region` VALUES ('3364', '542423', '542400', '比如县', '中国,西藏自治区,那曲地区,比如县', '比如', '中国,西藏,那曲,比如', '3', '0896', '852300', 'Biru', 'BR', 'B', '93.6869', '31.4779', '');
INSERT INTO `t_order_region` VALUES ('3365', '542424', '542400', '聂荣县', '中国,西藏自治区,那曲地区,聂荣县', '聂荣', '中国,西藏,那曲,聂荣', '3', '0896', '853500', 'Nierong', 'NR', 'N', '92.2957', '32.1119', '');
INSERT INTO `t_order_region` VALUES ('3366', '542425', '542400', '安多县', '中国,西藏自治区,那曲地区,安多县', '安多', '中国,西藏,那曲,安多', '3', '0896', '853400', 'Anduo', 'AD', 'A', '91.6795', '32.2612', '');
INSERT INTO `t_order_region` VALUES ('3367', '542426', '542400', '申扎县', '中国,西藏自治区,那曲地区,申扎县', '申扎', '中国,西藏,那曲,申扎', '3', '0896', '853100', 'Shenzha', 'SZ', 'S', '88.7078', '30.93', '');
INSERT INTO `t_order_region` VALUES ('3368', '542427', '542400', '索县', '中国,西藏自治区,那曲地区,索县', '索县', '中国,西藏,那曲,索县', '3', '0896', '852200', 'Suoxian', 'SX', 'S', '93.783', '31.8843', '');
INSERT INTO `t_order_region` VALUES ('3369', '542428', '542400', '班戈县', '中国,西藏自治区,那曲地区,班戈县', '班戈', '中国,西藏,那曲,班戈', '3', '0896', '852500', 'Bange', 'BG', 'B', '90.0191', '31.3615', '');
INSERT INTO `t_order_region` VALUES ('3370', '542429', '542400', '巴青县', '中国,西藏自治区,那曲地区,巴青县', '巴青', '中国,西藏,那曲,巴青', '3', '0896', '852100', 'Baqing', 'BQ', 'B', '94.0532', '31.9183', '');
INSERT INTO `t_order_region` VALUES ('3371', '542430', '542400', '尼玛县', '中国,西藏自治区,那曲地区,尼玛县', '尼玛', '中国,西藏,那曲,尼玛', '3', '0896', '853200', 'Nima', 'NM', 'N', '87.2526', '31.7965', '');
INSERT INTO `t_order_region` VALUES ('3372', '542431', '542400', '双湖县', '中国,西藏自治区,那曲地区,双湖县', '双湖', '中国,西藏,那曲,双湖', '3', '0896', '852600', 'Shuanghu', 'SH', 'S', '88.8378', '33.189', '');
INSERT INTO `t_order_region` VALUES ('3373', '542500', '540000', '阿里地区', '中国,西藏自治区,阿里地区', '阿里', '中国,西藏,阿里', '2', '0897', '859000', 'Ngari', 'AL', 'N', '80.1055', '32.5032', '');
INSERT INTO `t_order_region` VALUES ('3374', '542521', '542500', '普兰县', '中国,西藏自治区,阿里地区,普兰县', '普兰', '中国,西藏,阿里,普兰', '3', '0897', '859500', 'Pulan', 'PL', 'P', '81.177', '30.3', '');
INSERT INTO `t_order_region` VALUES ('3375', '542522', '542500', '札达县', '中国,西藏自治区,阿里地区,札达县', '札达', '中国,西藏,阿里,札达', '3', '0897', '859600', 'Zhada', 'ZD', 'Z', '79.8026', '31.4834', '');
INSERT INTO `t_order_region` VALUES ('3376', '542523', '542500', '噶尔县', '中国,西藏自治区,阿里地区,噶尔县', '噶尔', '中国,西藏,阿里,噶尔', '3', '0897', '859000', 'Gaer', 'GE', 'G', '80.0958', '32.5002', '');
INSERT INTO `t_order_region` VALUES ('3377', '542524', '542500', '日土县', '中国,西藏自治区,阿里地区,日土县', '日土', '中国,西藏,阿里,日土', '3', '0897', '859700', 'Ritu', 'RT', 'R', '79.7131', '33.3874', '');
INSERT INTO `t_order_region` VALUES ('3378', '542525', '542500', '革吉县', '中国,西藏自治区,阿里地区,革吉县', '革吉', '中国,西藏,阿里,革吉', '3', '0897', '859100', 'Geji', 'GJ', 'G', '81.151', '32.3964', '');
INSERT INTO `t_order_region` VALUES ('3379', '542526', '542500', '改则县', '中国,西藏自治区,阿里地区,改则县', '改则', '中国,西藏,阿里,改则', '3', '0897', '859200', 'Gaize', 'GZ', 'G', '84.063', '32.3045', '');
INSERT INTO `t_order_region` VALUES ('3380', '542527', '542500', '措勤县', '中国,西藏自治区,阿里地区,措勤县', '措勤', '中国,西藏,阿里,措勤', '3', '0897', '859300', 'Cuoqin', 'CQ', 'C', '85.1662', '31.021', '');
INSERT INTO `t_order_region` VALUES ('3381', '610000', '100000', '陕西省', '中国,陕西省', '陕西', '中国,陕西', '1', '', '', 'Shaanxi', 'SN', 'S', '108.948', '34.2632', '');
INSERT INTO `t_order_region` VALUES ('3382', '610100', '610000', '西安市', '中国,陕西省,西安市', '西安', '中国,陕西,西安', '2', '029', '710000', 'Xi\'an', 'XA', 'X', '108.948', '34.2632', '');
INSERT INTO `t_order_region` VALUES ('3383', '610102', '610100', '新城区', '中国,陕西省,西安市,新城区', '新城', '中国,陕西,西安,新城', '3', '029', '710000', 'Xincheng', 'XC', 'X', '108.961', '34.2664', '');
INSERT INTO `t_order_region` VALUES ('3384', '610103', '610100', '碑林区', '中国,陕西省,西安市,碑林区', '碑林', '中国,陕西,西安,碑林', '3', '029', '710000', 'Beilin', 'BL', 'B', '108.934', '34.2304', '');
INSERT INTO `t_order_region` VALUES ('3385', '610104', '610100', '莲湖区', '中国,陕西省,西安市,莲湖区', '莲湖', '中国,陕西,西安,莲湖', '3', '029', '710000', 'Lianhu', 'LH', 'L', '108.94', '34.2671', '');
INSERT INTO `t_order_region` VALUES ('3386', '610111', '610100', '灞桥区', '中国,陕西省,西安市,灞桥区', '灞桥', '中国,陕西,西安,灞桥', '3', '029', '710000', 'Baqiao', 'BQ', 'B', '109.065', '34.2726', '');
INSERT INTO `t_order_region` VALUES ('3387', '610112', '610100', '未央区', '中国,陕西省,西安市,未央区', '未央', '中国,陕西,西安,未央', '3', '029', '710000', 'Weiyang', 'WY', 'W', '108.947', '34.293', '');
INSERT INTO `t_order_region` VALUES ('3388', '610113', '610100', '雁塔区', '中国,陕西省,西安市,雁塔区', '雁塔', '中国,陕西,西安,雁塔', '3', '029', '710000', 'Yanta', 'YT', 'Y', '108.949', '34.2225', '');
INSERT INTO `t_order_region` VALUES ('3389', '610114', '610100', '阎良区', '中国,陕西省,西安市,阎良区', '阎良', '中国,陕西,西安,阎良', '3', '029', '710000', 'Yanliang', 'YL', 'Y', '109.226', '34.6622', '');
INSERT INTO `t_order_region` VALUES ('3390', '610115', '610100', '临潼区', '中国,陕西省,西安市,临潼区', '临潼', '中国,陕西,西安,临潼', '3', '029', '710600', 'Lintong', 'LT', 'L', '109.214', '34.3666', '');
INSERT INTO `t_order_region` VALUES ('3391', '610116', '610100', '长安区', '中国,陕西省,西安市,长安区', '长安', '中国,陕西,西安,长安', '3', '029', '710100', 'Chang\'an', 'CA', 'C', '108.946', '34.1556', '');
INSERT INTO `t_order_region` VALUES ('3392', '610117', '610100', '高陵区', '中国,陕西省,西安市,高陵区', '高陵', '中国,陕西,西安,高陵', '3', '029', '710200', 'Gaoling', 'GL', 'G', '109.088', '34.5348', '');
INSERT INTO `t_order_region` VALUES ('3393', '610118', '610100', '鄠邑区', '中国,陕西省,西安市,鄠邑区', '鄠邑', '中国,陕西,西安,鄠邑', '3', '029', '710300', 'Huyi', 'HY', 'H', '108.605', '34.1086', '');
INSERT INTO `t_order_region` VALUES ('3394', '610122', '610100', '蓝田县', '中国,陕西省,西安市,蓝田县', '蓝田', '中国,陕西,西安,蓝田', '3', '029', '710500', 'Lantian', 'LT', 'L', '109.323', '34.1513', '');
INSERT INTO `t_order_region` VALUES ('3395', '610124', '610100', '周至县', '中国,陕西省,西安市,周至县', '周至', '中国,陕西,西安,周至', '3', '029', '710400', 'Zhouzhi', 'ZZ', 'Z', '108.222', '34.1634', '');
INSERT INTO `t_order_region` VALUES ('3396', '610125', '610100', '西咸新区', '中国,陕西省,西安市,西咸新区', '西咸新区', '中国,陕西,西安,西咸新区', '3', '029', '712000', 'XixianXinQu', 'XXXQ', 'X', '108.811', '34.3071', '国家级新区');
INSERT INTO `t_order_region` VALUES ('3397', '610127', '610100', '曲江新区', '中国,陕西省,西安市,曲江新区', '曲江新区', '中国,陕西,西安,曲江新区', '3', '029', '710061', 'QujiangXinQu', 'QJXQ', 'Q', '108.774', '34.1877', '新区');
INSERT INTO `t_order_region` VALUES ('3398', '610128', '610100', '高新区', '中国,陕西省,西安市,高新区', '高新区', '中国,陕西,西安,高新区', '3', '029', '710000', 'Gaoxinqu', 'GXQ', 'G', '108.891', '34.1934', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3399', '610200', '610000', '铜川市', '中国,陕西省,铜川市', '铜川', '中国,陕西,铜川', '2', '0919', '727000', 'Tongchuan', 'TC', 'T', '108.963', '34.9089', '');
INSERT INTO `t_order_region` VALUES ('3400', '610202', '610200', '王益区', '中国,陕西省,铜川市,王益区', '王益', '中国,陕西,铜川,王益', '3', '0919', '727000', 'Wangyi', 'WY', 'W', '109.076', '35.069', '');
INSERT INTO `t_order_region` VALUES ('3401', '610203', '610200', '印台区', '中国,陕西省,铜川市,印台区', '印台', '中国,陕西,铜川,印台', '3', '0919', '727007', 'Yintai', 'YT', 'Y', '109.102', '35.1169', '');
INSERT INTO `t_order_region` VALUES ('3402', '610204', '610200', '耀州区', '中国,陕西省,铜川市,耀州区', '耀州', '中国,陕西,铜川,耀州', '3', '0919', '727100', 'Yaozhou', 'YZ', 'Y', '108.986', '34.9131', '');
INSERT INTO `t_order_region` VALUES ('3403', '610222', '610200', '宜君县', '中国,陕西省,铜川市,宜君县', '宜君', '中国,陕西,铜川,宜君', '3', '0919', '727200', 'Yijun', 'YJ', 'Y', '109.118', '35.4011', '');
INSERT INTO `t_order_region` VALUES ('3404', '610300', '610000', '宝鸡市', '中国,陕西省,宝鸡市', '宝鸡', '中国,陕西,宝鸡', '2', '0917', '721000', 'Baoji', 'BJ', 'B', '107.145', '34.3693', '');
INSERT INTO `t_order_region` VALUES ('3405', '610302', '610300', '渭滨区', '中国,陕西省,宝鸡市,渭滨区', '渭滨', '中国,陕西,宝鸡,渭滨', '3', '0917', '721000', 'Weibin', 'WB', 'W', '107.15', '34.3712', '');
INSERT INTO `t_order_region` VALUES ('3406', '610303', '610300', '金台区', '中国,陕西省,宝鸡市,金台区', '金台', '中国,陕西,宝鸡,金台', '3', '0917', '721000', 'Jintai', 'JT', 'J', '107.147', '34.3761', '');
INSERT INTO `t_order_region` VALUES ('3407', '610304', '610300', '陈仓区', '中国,陕西省,宝鸡市,陈仓区', '陈仓', '中国,陕西,宝鸡,陈仓', '3', '0917', '721300', 'Chencang', 'CC', 'C', '107.387', '34.3545', '');
INSERT INTO `t_order_region` VALUES ('3408', '610322', '610300', '凤翔县', '中国,陕西省,宝鸡市,凤翔县', '凤翔', '中国,陕西,宝鸡,凤翔', '3', '0917', '721400', 'Fengxiang', 'FX', 'F', '107.396', '34.5232', '');
INSERT INTO `t_order_region` VALUES ('3409', '610323', '610300', '岐山县', '中国,陕西省,宝鸡市,岐山县', '岐山', '中国,陕西,宝鸡,岐山', '3', '0917', '722400', 'Qishan', 'QS', 'Q', '107.622', '34.4438', '');
INSERT INTO `t_order_region` VALUES ('3410', '610324', '610300', '扶风县', '中国,陕西省,宝鸡市,扶风县', '扶风', '中国,陕西,宝鸡,扶风', '3', '0917', '722200', 'Fufeng', 'FF', 'F', '107.9', '34.3752', '');
INSERT INTO `t_order_region` VALUES ('3411', '610326', '610300', '眉县', '中国,陕西省,宝鸡市,眉县', '眉县', '中国,陕西,宝鸡,眉县', '3', '0917', '722300', 'Meixian', 'MX', 'M', '107.751', '34.2757', '');
INSERT INTO `t_order_region` VALUES ('3412', '610327', '610300', '陇县', '中国,陕西省,宝鸡市,陇县', '陇县', '中国,陕西,宝鸡,陇县', '3', '0917', '721200', 'Longxian', 'LX', 'L', '106.859', '34.894', '');
INSERT INTO `t_order_region` VALUES ('3413', '610328', '610300', '千阳县', '中国,陕西省,宝鸡市,千阳县', '千阳', '中国,陕西,宝鸡,千阳', '3', '0917', '721100', 'Qianyang', 'QY', 'Q', '107.13', '34.6422', '');
INSERT INTO `t_order_region` VALUES ('3414', '610329', '610300', '麟游县', '中国,陕西省,宝鸡市,麟游县', '麟游', '中国,陕西,宝鸡,麟游', '3', '0917', '721500', 'Linyou', 'LY', 'L', '107.796', '34.6784', '');
INSERT INTO `t_order_region` VALUES ('3415', '610330', '610300', '凤县', '中国,陕西省,宝鸡市,凤县', '凤县', '中国,陕西,宝鸡,凤县', '3', '0917', '721700', 'Fengxian', 'FX', 'F', '106.524', '33.9117', '');
INSERT INTO `t_order_region` VALUES ('3416', '610331', '610300', '太白县', '中国,陕西省,宝鸡市,太白县', '太白', '中国,陕西,宝鸡,太白', '3', '0917', '721600', 'Taibai', 'TB', 'T', '107.316', '34.0621', '');
INSERT INTO `t_order_region` VALUES ('3417', '610332', '610300', '高新区', '中国,陕西省,宝鸡市,高新区', '高新区', '中国,陕西,宝鸡,高新区', '3', '0917', '721013', 'Gaoxinqu', 'GXQ', 'G', '107.232', '34.3486', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3418', '610400', '610000', '咸阳市', '中国,陕西省,咸阳市', '咸阳', '中国,陕西,咸阳', '2', '029', '712000', 'Xianyang', 'XY', 'X', '108.705', '34.3334', '');
INSERT INTO `t_order_region` VALUES ('3419', '610402', '610400', '秦都区', '中国,陕西省,咸阳市,秦都区', '秦都', '中国,陕西,咸阳,秦都', '3', '029', '712000', 'Qindu', 'QD', 'Q', '108.715', '34.338', '');
INSERT INTO `t_order_region` VALUES ('3420', '610403', '610400', '杨陵区', '中国,陕西省,咸阳市,杨陵区', '杨陵', '中国,陕西,咸阳,杨陵', '3', '029', '712100', 'Yangling', 'YL', 'Y', '108.083', '34.2704', '');
INSERT INTO `t_order_region` VALUES ('3421', '610404', '610400', '渭城区', '中国,陕西省,咸阳市,渭城区', '渭城', '中国,陕西,咸阳,渭城', '3', '029', '712000', 'Weicheng', 'WC', 'W', '108.722', '34.332', '');
INSERT INTO `t_order_region` VALUES ('3422', '610422', '610400', '三原县', '中国,陕西省,咸阳市,三原县', '三原', '中国,陕西,咸阳,三原', '3', '029', '713800', 'Sanyuan', 'SY', 'S', '108.932', '34.6156', '');
INSERT INTO `t_order_region` VALUES ('3423', '610423', '610400', '泾阳县', '中国,陕西省,咸阳市,泾阳县', '泾阳', '中国,陕西,咸阳,泾阳', '3', '029', '713700', 'Jingyang', 'JY', 'J', '108.843', '34.5271', '');
INSERT INTO `t_order_region` VALUES ('3424', '610424', '610400', '乾县', '中国,陕西省,咸阳市,乾县', '乾县', '中国,陕西,咸阳,乾县', '3', '029', '713300', 'Qianxian', 'QX', 'Q', '108.242', '34.5295', '');
INSERT INTO `t_order_region` VALUES ('3425', '610425', '610400', '礼泉县', '中国,陕西省,咸阳市,礼泉县', '礼泉', '中国,陕西,咸阳,礼泉', '3', '029', '713200', 'Liquan', 'LQ', 'L', '108.426', '34.4846', '');
INSERT INTO `t_order_region` VALUES ('3426', '610426', '610400', '永寿县', '中国,陕西省,咸阳市,永寿县', '永寿', '中国,陕西,咸阳,永寿', '3', '029', '713400', 'Yongshou', 'YS', 'Y', '108.145', '34.6908', '');
INSERT INTO `t_order_region` VALUES ('3427', '610427', '610400', '彬县', '中国,陕西省,咸阳市,彬县', '彬县', '中国,陕西,咸阳,彬县', '3', '029', '713500', 'Binxian', 'BX', 'B', '108.085', '35.0342', '');
INSERT INTO `t_order_region` VALUES ('3428', '610428', '610400', '长武县', '中国,陕西省,咸阳市,长武县', '长武', '中国,陕西,咸阳,长武', '3', '029', '713600', 'Changwu', 'CW', 'C', '107.795', '35.2067', '');
INSERT INTO `t_order_region` VALUES ('3429', '610429', '610400', '旬邑县', '中国,陕西省,咸阳市,旬邑县', '旬邑', '中国,陕西,咸阳,旬邑', '3', '029', '711300', 'Xunyi', 'XY', 'X', '108.334', '35.1134', '');
INSERT INTO `t_order_region` VALUES ('3430', '610430', '610400', '淳化县', '中国,陕西省,咸阳市,淳化县', '淳化', '中国,陕西,咸阳,淳化', '3', '029', '711200', 'Chunhua', 'CH', 'C', '108.58', '34.7989', '');
INSERT INTO `t_order_region` VALUES ('3431', '610431', '610400', '武功县', '中国,陕西省,咸阳市,武功县', '武功', '中国,陕西,咸阳,武功', '3', '029', '712200', 'Wugong', 'WG', 'W', '108.204', '34.26', '');
INSERT INTO `t_order_region` VALUES ('3432', '610481', '610400', '兴平市', '中国,陕西省,咸阳市,兴平市', '兴平', '中国,陕西,咸阳,兴平', '3', '029', '713100', 'Xingping', 'XP', 'X', '108.491', '34.2979', '');
INSERT INTO `t_order_region` VALUES ('3433', '610482', '610400', '高新区', '中国,陕西省,咸阳市,高新区', '高新区', '中国,陕西,咸阳,高新区', '3', '029', '712000', 'Gaoxinqu', 'GXQ', 'G', '108.665', '34.3199', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3434', '610500', '610000', '渭南市', '中国,陕西省,渭南市', '渭南', '中国,陕西,渭南', '2', '0913', '714000', 'Weinan', 'WN', 'W', '109.503', '34.4994', '');
INSERT INTO `t_order_region` VALUES ('3435', '610502', '610500', '临渭区', '中国,陕西省,渭南市,临渭区', '临渭', '中国,陕西,渭南,临渭', '3', '0913', '714000', 'Linwei', 'LW', 'L', '109.493', '34.4982', '');
INSERT INTO `t_order_region` VALUES ('3436', '610503', '610500', '华州区', '中国,陕西省,渭南市,华州区', '华州', '中国,陕西,渭南,华州', '3', '0913', '714100', 'Huazhou', 'HZ', 'H', '109.772', '34.5126', '');
INSERT INTO `t_order_region` VALUES ('3437', '610522', '610500', '潼关县', '中国,陕西省,渭南市,潼关县', '潼关', '中国,陕西,渭南,潼关', '3', '0913', '714300', 'Tongguan', 'TG', 'T', '110.244', '34.5428', '');
INSERT INTO `t_order_region` VALUES ('3438', '610523', '610500', '大荔县', '中国,陕西省,渭南市,大荔县', '大荔', '中国,陕西,渭南,大荔', '3', '0913', '715100', 'Dali', 'DL', 'D', '109.942', '34.7957', '');
INSERT INTO `t_order_region` VALUES ('3439', '610524', '610500', '合阳县', '中国,陕西省,渭南市,合阳县', '合阳', '中国,陕西,渭南,合阳', '3', '0913', '715300', 'Heyang', 'HY', 'H', '110.149', '35.238', '');
INSERT INTO `t_order_region` VALUES ('3440', '610525', '610500', '澄城县', '中国,陕西省,渭南市,澄城县', '澄城', '中国,陕西,渭南,澄城', '3', '0913', '715200', 'Chengcheng', 'CC', 'C', '109.934', '35.184', '');
INSERT INTO `t_order_region` VALUES ('3441', '610526', '610500', '蒲城县', '中国,陕西省,渭南市,蒲城县', '蒲城', '中国,陕西,渭南,蒲城', '3', '0913', '715500', 'Pucheng', 'PC', 'P', '109.59', '34.9568', '');
INSERT INTO `t_order_region` VALUES ('3442', '610527', '610500', '白水县', '中国,陕西省,渭南市,白水县', '白水', '中国,陕西,渭南,白水', '3', '0913', '715600', 'Baishui', 'BS', 'B', '109.593', '35.1786', '');
INSERT INTO `t_order_region` VALUES ('3443', '610528', '610500', '富平县', '中国,陕西省,渭南市,富平县', '富平', '中国,陕西,渭南,富平', '3', '0913', '711700', 'Fuping', 'FP', 'F', '109.18', '34.7511', '');
INSERT INTO `t_order_region` VALUES ('3444', '610581', '610500', '韩城市', '中国,陕西省,渭南市,韩城市', '韩城', '中国,陕西,渭南,韩城', '3', '0913', '715400', 'Hancheng', 'HC', 'H', '110.442', '35.4793', '');
INSERT INTO `t_order_region` VALUES ('3445', '610582', '610500', '华阴市', '中国,陕西省,渭南市,华阴市', '华阴', '中国,陕西,渭南,华阴', '3', '0913', '714200', 'Huayin', 'HY', 'H', '110.088', '34.5661', '');
INSERT INTO `t_order_region` VALUES ('3446', '610600', '610000', '延安市', '中国,陕西省,延安市', '延安', '中国,陕西,延安', '2', '0911', '716000', 'Yan\'an', 'YA', 'Y', '109.491', '36.5965', '');
INSERT INTO `t_order_region` VALUES ('3447', '610602', '610600', '宝塔区', '中国,陕西省,延安市,宝塔区', '宝塔', '中国,陕西,延安,宝塔', '3', '0911', '716000', 'Baota', 'BT', 'B', '109.493', '36.5915', '');
INSERT INTO `t_order_region` VALUES ('3448', '610603', '610600', '安塞区', '中国,陕西省,延安市,安塞区', '安塞', '中国,陕西,延安,安塞', '3', '0911', '717400', 'Ansai', 'AS', 'A', '109.327', '36.8651', '');
INSERT INTO `t_order_region` VALUES ('3449', '610621', '610600', '延长县', '中国,陕西省,延安市,延长县', '延长', '中国,陕西,延安,延长', '3', '0911', '717100', 'Yanchang', 'YC', 'Y', '110.011', '36.579', '');
INSERT INTO `t_order_region` VALUES ('3450', '610622', '610600', '延川县', '中国,陕西省,延安市,延川县', '延川', '中国,陕西,延安,延川', '3', '0911', '717200', 'Yanchuan', 'YC', 'Y', '110.194', '36.8782', '');
INSERT INTO `t_order_region` VALUES ('3451', '610623', '610600', '子长县', '中国,陕西省,延安市,子长县', '子长', '中国,陕西,延安,子长', '3', '0911', '717300', 'Zichang', 'ZC', 'Z', '109.675', '37.1425', '');
INSERT INTO `t_order_region` VALUES ('3452', '610625', '610600', '志丹县', '中国,陕西省,延安市,志丹县', '志丹', '中国,陕西,延安,志丹', '3', '0911', '717500', 'Zhidan', 'ZD', 'Z', '108.768', '36.8218', '');
INSERT INTO `t_order_region` VALUES ('3453', '610626', '610600', '吴起县', '中国,陕西省,延安市,吴起县', '吴起', '中国,陕西,延安,吴起', '3', '0911', '717600', 'Wuqi', 'WQ', 'W', '108.176', '36.9278', '');
INSERT INTO `t_order_region` VALUES ('3454', '610627', '610600', '甘泉县', '中国,陕西省,延安市,甘泉县', '甘泉', '中国,陕西,延安,甘泉', '3', '0911', '716100', 'Ganquan', 'GQ', 'G', '109.35', '36.2775', '');
INSERT INTO `t_order_region` VALUES ('3455', '610628', '610600', '富县', '中国,陕西省,延安市,富县', '富县', '中国,陕西,延安,富县', '3', '0911', '727500', 'Fuxian', 'FX', 'F', '109.379', '35.988', '');
INSERT INTO `t_order_region` VALUES ('3456', '610629', '610600', '洛川县', '中国,陕西省,延安市,洛川县', '洛川', '中国,陕西,延安,洛川', '3', '0911', '727400', 'Luochuan', 'LC', 'L', '109.433', '35.7608', '');
INSERT INTO `t_order_region` VALUES ('3457', '610630', '610600', '宜川县', '中国,陕西省,延安市,宜川县', '宜川', '中国,陕西,延安,宜川', '3', '0911', '716200', 'Yichuan', 'YC', 'Y', '110.172', '36.0473', '');
INSERT INTO `t_order_region` VALUES ('3458', '610631', '610600', '黄龙县', '中国,陕西省,延安市,黄龙县', '黄龙', '中国,陕西,延安,黄龙', '3', '0911', '715700', 'Huanglong', 'HL', 'H', '109.843', '35.5835', '');
INSERT INTO `t_order_region` VALUES ('3459', '610632', '610600', '黄陵县', '中国,陕西省,延安市,黄陵县', '黄陵', '中国,陕西,延安,黄陵', '3', '0911', '727300', 'Huangling', 'HL', 'H', '109.263', '35.5836', '');
INSERT INTO `t_order_region` VALUES ('3460', '610700', '610000', '汉中市', '中国,陕西省,汉中市', '汉中', '中国,陕西,汉中', '2', '0916', '723000', 'Hanzhong', 'HZ', 'H', '107.029', '33.0777', '');
INSERT INTO `t_order_region` VALUES ('3461', '610702', '610700', '汉台区', '中国,陕西省,汉中市,汉台区', '汉台', '中国,陕西,汉中,汉台', '3', '0916', '723000', 'Hantai', 'HT', 'H', '107.032', '33.0677', '');
INSERT INTO `t_order_region` VALUES ('3462', '610721', '610700', '南郑县', '中国,陕西省,汉中市,南郑县', '南郑', '中国,陕西,汉中,南郑', '3', '0916', '723100', 'Nanzheng', 'NZ', 'N', '106.94', '33.003', '');
INSERT INTO `t_order_region` VALUES ('3463', '610722', '610700', '城固县', '中国,陕西省,汉中市,城固县', '城固', '中国,陕西,汉中,城固', '3', '0916', '723200', 'Chenggu', 'CG', 'C', '107.334', '33.1566', '');
INSERT INTO `t_order_region` VALUES ('3464', '610723', '610700', '洋县', '中国,陕西省,汉中市,洋县', '洋县', '中国,陕西,汉中,洋县', '3', '0916', '723300', 'Yangxian', 'YX', 'Y', '107.547', '33.221', '');
INSERT INTO `t_order_region` VALUES ('3465', '610724', '610700', '西乡县', '中国,陕西省,汉中市,西乡县', '西乡', '中国,陕西,汉中,西乡', '3', '0916', '723500', 'Xixiang', 'XX', 'X', '107.769', '32.9841', '');
INSERT INTO `t_order_region` VALUES ('3466', '610725', '610700', '勉县', '中国,陕西省,汉中市,勉县', '勉县', '中国,陕西,汉中,勉县', '3', '0916', '724200', 'Mianxian', 'MX', 'M', '106.676', '33.1527', '');
INSERT INTO `t_order_region` VALUES ('3467', '610726', '610700', '宁强县', '中国,陕西省,汉中市,宁强县', '宁强', '中国,陕西,汉中,宁强', '3', '0916', '724400', 'Ningqiang', 'NQ', 'N', '106.26', '32.8288', '');
INSERT INTO `t_order_region` VALUES ('3468', '610727', '610700', '略阳县', '中国,陕西省,汉中市,略阳县', '略阳', '中国,陕西,汉中,略阳', '3', '0916', '724300', 'Lueyang', 'LY', 'L', '106.154', '33.3301', '');
INSERT INTO `t_order_region` VALUES ('3469', '610728', '610700', '镇巴县', '中国,陕西省,汉中市,镇巴县', '镇巴', '中国,陕西,汉中,镇巴', '3', '0916', '723600', 'Zhenba', 'ZB', 'Z', '107.896', '32.5349', '');
INSERT INTO `t_order_region` VALUES ('3470', '610729', '610700', '留坝县', '中国,陕西省,汉中市,留坝县', '留坝', '中国,陕西,汉中,留坝', '3', '0916', '724100', 'Liuba', 'LB', 'L', '106.922', '33.6161', '');
INSERT INTO `t_order_region` VALUES ('3471', '610730', '610700', '佛坪县', '中国,陕西省,汉中市,佛坪县', '佛坪', '中国,陕西,汉中,佛坪', '3', '0916', '723400', 'Foping', 'FP', 'F', '107.99', '33.525', '');
INSERT INTO `t_order_region` VALUES ('3472', '610800', '610000', '榆林市', '中国,陕西省,榆林市', '榆林', '中国,陕西,榆林', '2', '0912', '719000', 'Yulin', 'YL', 'Y', '109.741', '38.2902', '');
INSERT INTO `t_order_region` VALUES ('3473', '610802', '610800', '榆阳区', '中国,陕西省,榆林市,榆阳区', '榆阳', '中国,陕西,榆林,榆阳', '3', '0912', '719000', 'Yuyang', 'YY', 'Y', '109.735', '38.2784', '');
INSERT INTO `t_order_region` VALUES ('3474', '610803', '610800', '横山区', '中国,陕西省,榆林市,横山区', '横山', '中国,陕西,榆林,横山', '3', '0912', '719200', 'Hengshan', 'HS', 'H', '109.296', '37.958', '');
INSERT INTO `t_order_region` VALUES ('3475', '610822', '610800', '府谷县', '中国,陕西省,榆林市,府谷县', '府谷', '中国,陕西,榆林,府谷', '3', '0912', '719400', 'Fugu', 'FG', 'F', '111.067', '39.028', '');
INSERT INTO `t_order_region` VALUES ('3476', '610824', '610800', '靖边县', '中国,陕西省,榆林市,靖边县', '靖边', '中国,陕西,榆林,靖边', '3', '0912', '718500', 'Jingbian', 'JB', 'J', '108.794', '37.5994', '');
INSERT INTO `t_order_region` VALUES ('3477', '610825', '610800', '定边县', '中国,陕西省,榆林市,定边县', '定边', '中国,陕西,榆林,定边', '3', '0912', '718600', 'Dingbian', 'DB', 'D', '107.598', '37.5904', '');
INSERT INTO `t_order_region` VALUES ('3478', '610826', '610800', '绥德县', '中国,陕西省,榆林市,绥德县', '绥德', '中国,陕西,榆林,绥德', '3', '0912', '718000', 'Suide', 'SD', 'S', '110.261', '37.4978', '');
INSERT INTO `t_order_region` VALUES ('3479', '610827', '610800', '米脂县', '中国,陕西省,榆林市,米脂县', '米脂', '中国,陕西,榆林,米脂', '3', '0912', '718100', 'Mizhi', 'MZ', 'M', '110.184', '37.7553', '');
INSERT INTO `t_order_region` VALUES ('3480', '610828', '610800', '佳县', '中国,陕西省,榆林市,佳县', '佳县', '中国,陕西,榆林,佳县', '3', '0912', '719200', 'Jiaxian', 'JX', 'J', '110.494', '38.0225', '');
INSERT INTO `t_order_region` VALUES ('3481', '610829', '610800', '吴堡县', '中国,陕西省,榆林市,吴堡县', '吴堡', '中国,陕西,榆林,吴堡', '3', '0912', '718200', 'Wubu', 'WB', 'W', '110.745', '37.4571', '');
INSERT INTO `t_order_region` VALUES ('3482', '610830', '610800', '清涧县', '中国,陕西省,榆林市,清涧县', '清涧', '中国,陕西,榆林,清涧', '3', '0912', '718300', 'Qingjian', 'QJ', 'Q', '110.122', '37.0885', '');
INSERT INTO `t_order_region` VALUES ('3483', '610831', '610800', '子洲县', '中国,陕西省,榆林市,子洲县', '子洲', '中国,陕西,榆林,子洲', '3', '0912', '718400', 'Zizhou', 'ZZ', 'Z', '110.035', '37.6124', '');
INSERT INTO `t_order_region` VALUES ('3484', '610881', '610800', '神木市', '中国,陕西省,榆林市,神木市', '神木', '中国,陕西,榆林,神木', '3', '0912', '719300', 'Shenmu', 'SM', 'S', '110.499', '38.8423', '');
INSERT INTO `t_order_region` VALUES ('3485', '610900', '610000', '安康市', '中国,陕西省,安康市', '安康', '中国,陕西,安康', '2', '0915', '725000', 'Ankang', 'AK', 'A', '109.029', '32.6903', '');
INSERT INTO `t_order_region` VALUES ('3486', '610902', '610900', '汉滨区', '中国,陕西省,安康市,汉滨区', '汉滨', '中国,陕西,安康,汉滨', '3', '0915', '725000', 'Hanbin', 'HB', 'H', '109.027', '32.6952', '');
INSERT INTO `t_order_region` VALUES ('3487', '610921', '610900', '汉阴县', '中国,陕西省,安康市,汉阴县', '汉阴', '中国,陕西,安康,汉阴', '3', '0915', '725100', 'Hanyin', 'HY', 'H', '108.511', '32.8913', '');
INSERT INTO `t_order_region` VALUES ('3488', '610922', '610900', '石泉县', '中国,陕西省,安康市,石泉县', '石泉', '中国,陕西,安康,石泉', '3', '0915', '725200', 'Shiquan', 'SQ', 'S', '108.248', '33.0397', '');
INSERT INTO `t_order_region` VALUES ('3489', '610923', '610900', '宁陕县', '中国,陕西省,安康市,宁陕县', '宁陕', '中国,陕西,安康,宁陕', '3', '0915', '711600', 'Ningshan', 'NS', 'N', '108.315', '33.3173', '');
INSERT INTO `t_order_region` VALUES ('3490', '610924', '610900', '紫阳县', '中国,陕西省,安康市,紫阳县', '紫阳', '中国,陕西,安康,紫阳', '3', '0915', '725300', 'Ziyang', 'ZY', 'Z', '108.537', '32.5211', '');
INSERT INTO `t_order_region` VALUES ('3491', '610925', '610900', '岚皋县', '中国,陕西省,安康市,岚皋县', '岚皋', '中国,陕西,安康,岚皋', '3', '0915', '725400', 'Langao', 'LG', 'L', '108.903', '32.3079', '');
INSERT INTO `t_order_region` VALUES ('3492', '610926', '610900', '平利县', '中国,陕西省,安康市,平利县', '平利', '中国,陕西,安康,平利', '3', '0915', '725500', 'Pingli', 'PL', 'P', '109.358', '32.3911', '');
INSERT INTO `t_order_region` VALUES ('3493', '610927', '610900', '镇坪县', '中国,陕西省,安康市,镇坪县', '镇坪', '中国,陕西,安康,镇坪', '3', '0915', '725600', 'Zhenping', 'ZP', 'Z', '109.525', '31.8833', '');
INSERT INTO `t_order_region` VALUES ('3494', '610928', '610900', '旬阳县', '中国,陕西省,安康市,旬阳县', '旬阳', '中国,陕西,安康,旬阳', '3', '0915', '725700', 'Xunyang', 'XY', 'X', '109.362', '32.8321', '');
INSERT INTO `t_order_region` VALUES ('3495', '610929', '610900', '白河县', '中国,陕西省,安康市,白河县', '白河', '中国,陕西,安康,白河', '3', '0915', '725800', 'Baihe', 'BH', 'B', '110.113', '32.8096', '');
INSERT INTO `t_order_region` VALUES ('3496', '611000', '610000', '商洛市', '中国,陕西省,商洛市', '商洛', '中国,陕西,商洛', '2', '0914', '726000', 'Shangluo', 'SL', 'S', '109.94', '33.8683', '');
INSERT INTO `t_order_region` VALUES ('3497', '611002', '611000', '商州区', '中国,陕西省,商洛市,商州区', '商州', '中国,陕西,商洛,商州', '3', '0914', '726000', 'Shangzhou', 'SZ', 'S', '109.941', '33.8627', '');
INSERT INTO `t_order_region` VALUES ('3498', '611021', '611000', '洛南县', '中国,陕西省,商洛市,洛南县', '洛南', '中国,陕西,商洛,洛南', '3', '0914', '726100', 'Luonan', 'LN', 'L', '110.146', '34.0899', '');
INSERT INTO `t_order_region` VALUES ('3499', '611022', '611000', '丹凤县', '中国,陕西省,商洛市,丹凤县', '丹凤', '中国,陕西,商洛,丹凤', '3', '0914', '726200', 'Danfeng', 'DF', 'D', '110.335', '33.6947', '');
INSERT INTO `t_order_region` VALUES ('3500', '611023', '611000', '商南县', '中国,陕西省,商洛市,商南县', '商南', '中国,陕西,商洛,商南', '3', '0914', '726300', 'Shangnan', 'SN', 'S', '110.884', '33.5258', '');
INSERT INTO `t_order_region` VALUES ('3501', '611024', '611000', '山阳县', '中国,陕西省,商洛市,山阳县', '山阳', '中国,陕西,商洛,山阳', '3', '0914', '726400', 'Shanyang', 'SY', 'S', '109.888', '33.5293', '');
INSERT INTO `t_order_region` VALUES ('3502', '611025', '611000', '镇安县', '中国,陕西省,商洛市,镇安县', '镇安', '中国,陕西,商洛,镇安', '3', '0914', '711500', 'Zhen\'an', 'ZA', 'Z', '109.154', '33.4237', '');
INSERT INTO `t_order_region` VALUES ('3503', '611026', '611000', '柞水县', '中国,陕西省,商洛市,柞水县', '柞水', '中国,陕西,商洛,柞水', '3', '0914', '711400', 'Zhashui', 'ZS', 'Z', '109.111', '33.6831', '');
INSERT INTO `t_order_region` VALUES ('3504', '620000', '100000', '甘肃省', '中国,甘肃省', '甘肃', '中国,甘肃', '1', '', '', 'Gansu', 'GS', 'G', '103.824', '36.058', '');
INSERT INTO `t_order_region` VALUES ('3505', '620100', '620000', '兰州市', '中国,甘肃省,兰州市', '兰州', '中国,甘肃,兰州', '2', '0931', '730000', 'Lanzhou', 'LZ', 'L', '103.824', '36.058', '');
INSERT INTO `t_order_region` VALUES ('3506', '620102', '620100', '城关区', '中国,甘肃省,兰州市,城关区', '城关', '中国,甘肃,兰州,城关', '3', '0931', '730030', 'Chengguan', 'CG', 'C', '103.825', '36.0573', '');
INSERT INTO `t_order_region` VALUES ('3507', '620103', '620100', '七里河区', '中国,甘肃省,兰州市,七里河区', '七里河', '中国,甘肃,兰州,七里河', '3', '0931', '730050', 'Qilihe', 'QLH', 'Q', '103.786', '36.0658', '');
INSERT INTO `t_order_region` VALUES ('3508', '620104', '620100', '西固区', '中国,甘肃省,兰州市,西固区', '西固', '中国,甘肃,兰州,西固', '3', '0931', '730060', 'Xigu', 'XG', 'X', '103.628', '36.0886', '');
INSERT INTO `t_order_region` VALUES ('3509', '620105', '620100', '安宁区', '中国,甘肃省,兰州市,安宁区', '安宁', '中国,甘肃,兰州,安宁', '3', '0931', '730070', 'Anning', 'AN', 'A', '103.719', '36.1038', '');
INSERT INTO `t_order_region` VALUES ('3510', '620111', '620100', '红古区', '中国,甘肃省,兰州市,红古区', '红古', '中国,甘肃,兰州,红古', '3', '0931', '730080', 'Honggu', 'HG', 'H', '102.86', '36.3454', '');
INSERT INTO `t_order_region` VALUES ('3511', '620121', '620100', '永登县', '中国,甘肃省,兰州市,永登县', '永登', '中国,甘肃,兰州,永登', '3', '0931', '730300', 'Yongdeng', 'YD', 'Y', '103.261', '36.7352', '');
INSERT INTO `t_order_region` VALUES ('3512', '620122', '620100', '皋兰县', '中国,甘肃省,兰州市,皋兰县', '皋兰', '中国,甘肃,兰州,皋兰', '3', '0931', '730200', 'Gaolan', 'GL', 'G', '103.945', '36.3321', '');
INSERT INTO `t_order_region` VALUES ('3513', '620123', '620100', '榆中县', '中国,甘肃省,兰州市,榆中县', '榆中', '中国,甘肃,兰州,榆中', '3', '0931', '730100', 'Yuzhong', 'YZ', 'Y', '104.115', '35.8442', '');
INSERT INTO `t_order_region` VALUES ('3514', '620124', '620100', '兰州新区', '中国,甘肃省,兰州市,兰州新区', '兰州新区', '中国,甘肃,兰州,兰州新区', '3', '0931', '730000', 'LanzhouXinQu', 'LZXQ', 'L', '103.629', '36.4928', '国家级新区');
INSERT INTO `t_order_region` VALUES ('3515', '620125', '620100', '高新区', '中国,甘肃省,兰州市,高新区', '高新区', '中国,甘肃,兰州,高新区', '3', '0931', '730000', 'Gaoxinqu', 'GXQ', 'G', '103.894', '36.053', '高新技术开发区');
INSERT INTO `t_order_region` VALUES ('3516', '620126', '620100', '经济开发区', '中国,甘肃省,兰州市,经济开发区', '经济开发区', '中国,甘肃,兰州,经济开发区', '3', '0931', '730000', 'Jingjikaifaqu', 'JJKFQ', 'J', '103.716', '36.095', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('3517', '620200', '620000', '嘉峪关市', '中国,甘肃省,嘉峪关市', '嘉峪关', '中国,甘肃,嘉峪关', '2', '0937', '735100', 'Jiayuguan', 'JYG', 'J', '98.2773', '39.7865', '');
INSERT INTO `t_order_region` VALUES ('3518', '620201', '620200', '雄关区', '中国,甘肃省,嘉峪关市,雄关区', '雄关', '中国,甘肃,嘉峪关,雄关', '3', '0937', '735100', 'Xiongguan', 'XG', 'X', '98.2774', '39.7793', '拓展');
INSERT INTO `t_order_region` VALUES ('3519', '620202', '620200', '长城区', '中国,甘肃省,嘉峪关市,长城区', '长城', '中国,甘肃,嘉峪关,长城', '3', '0937', '735106', 'Changcheng', 'CC', 'C', '98.2735', '39.7874', '拓展');
INSERT INTO `t_order_region` VALUES ('3520', '620203', '620200', '镜铁区', '中国,甘肃省,嘉峪关市,镜铁区', '镜铁', '中国,甘肃,嘉峪关,镜铁', '3', '0937', '735100', 'Jingtie', 'JT', 'J', '98.2773', '39.7865', '拓展');
INSERT INTO `t_order_region` VALUES ('3521', '620300', '620000', '金昌市', '中国,甘肃省,金昌市', '金昌', '中国,甘肃,金昌', '2', '0935', '737100', 'Jinchang', 'JC', 'J', '102.188', '38.5142', '');
INSERT INTO `t_order_region` VALUES ('3522', '620302', '620300', '金川区', '中国,甘肃省,金昌市,金川区', '金川', '中国,甘肃,金昌,金川', '3', '0935', '737100', 'Jinchuan', 'JC', 'J', '102.194', '38.521', '');
INSERT INTO `t_order_region` VALUES ('3523', '620321', '620300', '永昌县', '中国,甘肃省,金昌市,永昌县', '永昌', '中国,甘肃,金昌,永昌', '3', '0935', '737200', 'Yongchang', 'YC', 'Y', '101.972', '38.2471', '');
INSERT INTO `t_order_region` VALUES ('3524', '620400', '620000', '白银市', '中国,甘肃省,白银市', '白银', '中国,甘肃,白银', '2', '0943', '730900', 'Baiyin', 'BY', 'B', '104.174', '36.5457', '');
INSERT INTO `t_order_region` VALUES ('3525', '620402', '620400', '白银区', '中国,甘肃省,白银市,白银区', '白银', '中国,甘肃,白银,白银', '3', '0943', '730900', 'Baiyin', 'BY', 'B', '104.174', '36.5441', '');
INSERT INTO `t_order_region` VALUES ('3526', '620403', '620400', '平川区', '中国,甘肃省,白银市,平川区', '平川', '中国,甘肃,白银,平川', '3', '0943', '730913', 'Pingchuan', 'PC', 'P', '104.825', '36.7277', '');
INSERT INTO `t_order_region` VALUES ('3527', '620421', '620400', '靖远县', '中国,甘肃省,白银市,靖远县', '靖远', '中国,甘肃,白银,靖远', '3', '0943', '730600', 'Jingyuan', 'JY', 'J', '104.683', '36.566', '');
INSERT INTO `t_order_region` VALUES ('3528', '620422', '620400', '会宁县', '中国,甘肃省,白银市,会宁县', '会宁', '中国,甘肃,白银,会宁', '3', '0943', '730700', 'Huining', 'HN', 'H', '105.053', '35.6963', '');
INSERT INTO `t_order_region` VALUES ('3529', '620423', '620400', '景泰县', '中国,甘肃省,白银市,景泰县', '景泰', '中国,甘肃,白银,景泰', '3', '0943', '730400', 'Jingtai', 'JT', 'J', '104.063', '37.1836', '');
INSERT INTO `t_order_region` VALUES ('3530', '620500', '620000', '天水市', '中国,甘肃省,天水市', '天水', '中国,甘肃,天水', '2', '0938', '741000', 'Tianshui', 'TS', 'T', '105.725', '34.5785', '');
INSERT INTO `t_order_region` VALUES ('3531', '620502', '620500', '秦州区', '中国,甘肃省,天水市,秦州区', '秦州', '中国,甘肃,天水,秦州', '3', '0938', '741000', 'Qinzhou', 'QZ', 'Q', '105.724', '34.5809', '');
INSERT INTO `t_order_region` VALUES ('3532', '620503', '620500', '麦积区', '中国,甘肃省,天水市,麦积区', '麦积', '中国,甘肃,天水,麦积', '3', '0938', '741020', 'Maiji', 'MJ', 'M', '105.89', '34.5707', '');
INSERT INTO `t_order_region` VALUES ('3533', '620521', '620500', '清水县', '中国,甘肃省,天水市,清水县', '清水', '中国,甘肃,天水,清水', '3', '0938', '741400', 'Qingshui', 'QS', 'Q', '106.137', '34.7503', '');
INSERT INTO `t_order_region` VALUES ('3534', '620522', '620500', '秦安县', '中国,甘肃省,天水市,秦安县', '秦安', '中国,甘肃,天水,秦安', '3', '0938', '741600', 'Qin\'an', 'QA', 'Q', '105.67', '34.8589', '');
INSERT INTO `t_order_region` VALUES ('3535', '620523', '620500', '甘谷县', '中国,甘肃省,天水市,甘谷县', '甘谷', '中国,甘肃,天水,甘谷', '3', '0938', '741200', 'Gangu', 'GG', 'G', '105.333', '34.7366', '');
INSERT INTO `t_order_region` VALUES ('3536', '620524', '620500', '武山县', '中国,甘肃省,天水市,武山县', '武山', '中国,甘肃,天水,武山', '3', '0938', '741300', 'Wushan', 'WS', 'W', '104.884', '34.7212', '');
INSERT INTO `t_order_region` VALUES ('3537', '620525', '620500', '张家川回族自治县', '中国,甘肃省,天水市,张家川回族自治县', '张家川', '中国,甘肃,天水,张家川', '3', '0938', '741500', 'Zhangjiachuan', 'ZJC', 'Z', '106.216', '34.9958', '');
INSERT INTO `t_order_region` VALUES ('3538', '620600', '620000', '武威市', '中国,甘肃省,武威市', '武威', '中国,甘肃,武威', '2', '0935', '733000', 'Wuwei', 'WW', 'W', '102.635', '37.93', '');
INSERT INTO `t_order_region` VALUES ('3539', '620602', '620600', '凉州区', '中国,甘肃省,武威市,凉州区', '凉州', '中国,甘肃,武威,凉州', '3', '0935', '733000', 'Liangzhou', 'LZ', 'L', '102.642', '37.9283', '');
INSERT INTO `t_order_region` VALUES ('3540', '620621', '620600', '民勤县', '中国,甘肃省,武威市,民勤县', '民勤', '中国,甘肃,武威,民勤', '3', '0935', '733300', 'Minqin', 'MQ', 'M', '103.09', '38.6249', '');
INSERT INTO `t_order_region` VALUES ('3541', '620622', '620600', '古浪县', '中国,甘肃省,武威市,古浪县', '古浪', '中国,甘肃,武威,古浪', '3', '0935', '733100', 'Gulang', 'GL', 'G', '102.892', '37.4651', '');
INSERT INTO `t_order_region` VALUES ('3542', '620623', '620600', '天祝藏族自治县', '中国,甘肃省,武威市,天祝藏族自治县', '天祝', '中国,甘肃,武威,天祝', '3', '0935', '733200', 'Tianzhu', 'TZ', 'T', '103.136', '36.9771', '');
INSERT INTO `t_order_region` VALUES ('3543', '620700', '620000', '张掖市', '中国,甘肃省,张掖市', '张掖', '中国,甘肃,张掖', '2', '0936', '734000', 'Zhangye', 'ZY', 'Z', '100.455', '38.9329', '');
INSERT INTO `t_order_region` VALUES ('3544', '620702', '620700', '甘州区', '中国,甘肃省,张掖市,甘州区', '甘州', '中国,甘肃,张掖,甘州', '3', '0936', '734000', 'Ganzhou', 'GZ', 'G', '100.453', '38.9295', '');
INSERT INTO `t_order_region` VALUES ('3545', '620721', '620700', '肃南裕固族自治县', '中国,甘肃省,张掖市,肃南裕固族自治县', '肃南', '中国,甘肃,张掖,肃南', '3', '0936', '734400', 'Sunan', 'SN', 'S', '99.6141', '38.8378', '');
INSERT INTO `t_order_region` VALUES ('3546', '620722', '620700', '民乐县', '中国,甘肃省,张掖市,民乐县', '民乐', '中国,甘肃,张掖,民乐', '3', '0936', '734500', 'Minle', 'ML', 'M', '100.811', '38.4348', '');
INSERT INTO `t_order_region` VALUES ('3547', '620723', '620700', '临泽县', '中国,甘肃省,张掖市,临泽县', '临泽', '中国,甘肃,张掖,临泽', '3', '0936', '734200', 'Linze', 'LZ', 'L', '100.164', '39.1525', '');
INSERT INTO `t_order_region` VALUES ('3548', '620724', '620700', '高台县', '中国,甘肃省,张掖市,高台县', '高台', '中国,甘肃,张掖,高台', '3', '0936', '734300', 'Gaotai', 'GT', 'G', '99.8192', '39.3783', '');
INSERT INTO `t_order_region` VALUES ('3549', '620725', '620700', '山丹县', '中国,甘肃省,张掖市,山丹县', '山丹', '中国,甘肃,张掖,山丹', '3', '0936', '734100', 'Shandan', 'SD', 'S', '101.094', '38.7847', '');
INSERT INTO `t_order_region` VALUES ('3550', '620800', '620000', '平凉市', '中国,甘肃省,平凉市', '平凉', '中国,甘肃,平凉', '2', '0933', '744000', 'Pingliang', 'PL', 'P', '106.685', '35.5428', '');
INSERT INTO `t_order_region` VALUES ('3551', '620802', '620800', '崆峒区', '中国,甘肃省,平凉市,崆峒区', '崆峒', '中国,甘肃,平凉,崆峒', '3', '0933', '744000', 'Kongtong', 'KT', 'K', '106.675', '35.5426', '');
INSERT INTO `t_order_region` VALUES ('3552', '620821', '620800', '泾川县', '中国,甘肃省,平凉市,泾川县', '泾川', '中国,甘肃,平凉,泾川', '3', '0933', '744300', 'Jingchuan', 'JC', 'J', '107.366', '35.3322', '');
INSERT INTO `t_order_region` VALUES ('3553', '620822', '620800', '灵台县', '中国,甘肃省,平凉市,灵台县', '灵台', '中国,甘肃,平凉,灵台', '3', '0933', '744400', 'Lingtai', 'LT', 'L', '107.617', '35.0677', '');
INSERT INTO `t_order_region` VALUES ('3554', '620823', '620800', '崇信县', '中国,甘肃省,平凉市,崇信县', '崇信', '中国,甘肃,平凉,崇信', '3', '0933', '744200', 'Chongxin', 'CX', 'C', '107.037', '35.3034', '');
INSERT INTO `t_order_region` VALUES ('3555', '620824', '620800', '华亭县', '中国,甘肃省,平凉市,华亭县', '华亭', '中国,甘肃,平凉,华亭', '3', '0933', '744100', 'Huating', 'HT', 'H', '106.655', '35.2183', '');
INSERT INTO `t_order_region` VALUES ('3556', '620825', '620800', '庄浪县', '中国,甘肃省,平凉市,庄浪县', '庄浪', '中国,甘肃,平凉,庄浪', '3', '0933', '744600', 'Zhuanglang', 'ZL', 'Z', '106.037', '35.2024', '');
INSERT INTO `t_order_region` VALUES ('3557', '620826', '620800', '静宁县', '中国,甘肃省,平凉市,静宁县', '静宁', '中国,甘肃,平凉,静宁', '3', '0933', '743400', 'Jingning', 'JN', 'J', '105.727', '35.5199', '');
INSERT INTO `t_order_region` VALUES ('3558', '620900', '620000', '酒泉市', '中国,甘肃省,酒泉市', '酒泉', '中国,甘肃,酒泉', '2', '0937', '735000', 'Jiuquan', 'JQ', 'J', '98.5108', '39.744', '');
INSERT INTO `t_order_region` VALUES ('3559', '620902', '620900', '肃州区', '中国,甘肃省,酒泉市,肃州区', '肃州', '中国,甘肃,酒泉,肃州', '3', '0937', '735000', 'Suzhou', 'SZ', 'S', '98.5078', '39.7451', '');
INSERT INTO `t_order_region` VALUES ('3560', '620921', '620900', '金塔县', '中国,甘肃省,酒泉市,金塔县', '金塔', '中国,甘肃,酒泉,金塔', '3', '0937', '735300', 'Jinta', 'JT', 'J', '98.9', '39.9773', '');
INSERT INTO `t_order_region` VALUES ('3561', '620922', '620900', '瓜州县', '中国,甘肃省,酒泉市,瓜州县', '瓜州', '中国,甘肃,酒泉,瓜州', '3', '0937', '736100', 'Guazhou', 'GZ', 'G', '95.7827', '40.5155', '');
INSERT INTO `t_order_region` VALUES ('3562', '620923', '620900', '肃北蒙古族自治县', '中国,甘肃省,酒泉市,肃北蒙古族自治县', '肃北', '中国,甘肃,酒泉,肃北', '3', '0937', '736300', 'Subei', 'SB', 'S', '94.8765', '39.5121', '');
INSERT INTO `t_order_region` VALUES ('3563', '620924', '620900', '阿克塞哈萨克族自治县', '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', '阿克塞', '中国,甘肃,酒泉,阿克塞', '3', '0937', '736400', 'Akesai', 'AKS', 'A', '94.341', '39.6343', '');
INSERT INTO `t_order_region` VALUES ('3564', '620981', '620900', '玉门市', '中国,甘肃省,酒泉市,玉门市', '玉门', '中国,甘肃,酒泉,玉门', '3', '0937', '735200', 'Yumen', 'YM', 'Y', '97.0454', '40.2917', '');
INSERT INTO `t_order_region` VALUES ('3565', '620982', '620900', '敦煌市', '中国,甘肃省,酒泉市,敦煌市', '敦煌', '中国,甘肃,酒泉,敦煌', '3', '0937', '736200', 'Dunhuang', 'DH', 'D', '94.6616', '40.1421', '');
INSERT INTO `t_order_region` VALUES ('3566', '621000', '620000', '庆阳市', '中国,甘肃省,庆阳市', '庆阳', '中国,甘肃,庆阳', '2', '0934', '745000', 'Qingyang', 'QY', 'Q', '107.638', '35.7342', '');
INSERT INTO `t_order_region` VALUES ('3567', '621002', '621000', '西峰区', '中国,甘肃省,庆阳市,西峰区', '西峰', '中国,甘肃,庆阳,西峰', '3', '0934', '745000', 'Xifeng', 'XF', 'X', '107.651', '35.7307', '');
INSERT INTO `t_order_region` VALUES ('3568', '621021', '621000', '庆城县', '中国,甘肃省,庆阳市,庆城县', '庆城', '中国,甘肃,庆阳,庆城', '3', '0934', '745100', 'Qingcheng', 'QC', 'Q', '107.883', '36.0151', '');
INSERT INTO `t_order_region` VALUES ('3569', '621022', '621000', '环县', '中国,甘肃省,庆阳市,环县', '环县', '中国,甘肃,庆阳,环县', '3', '0934', '745700', 'Huanxian', 'HX', 'H', '107.308', '36.5685', '');
INSERT INTO `t_order_region` VALUES ('3570', '621023', '621000', '华池县', '中国,甘肃省,庆阳市,华池县', '华池', '中国,甘肃,庆阳,华池', '3', '0934', '745600', 'Huachi', 'HC', 'H', '107.989', '36.4611', '');
INSERT INTO `t_order_region` VALUES ('3571', '621024', '621000', '合水县', '中国,甘肃省,庆阳市,合水县', '合水', '中国,甘肃,庆阳,合水', '3', '0934', '745400', 'Heshui', 'HS', 'H', '108.02', '35.8191', '');
INSERT INTO `t_order_region` VALUES ('3572', '621025', '621000', '正宁县', '中国,甘肃省,庆阳市,正宁县', '正宁', '中国,甘肃,庆阳,正宁', '3', '0934', '745300', 'Zhengning', 'ZN', 'Z', '108.36', '35.4917', '');
INSERT INTO `t_order_region` VALUES ('3573', '621026', '621000', '宁县', '中国,甘肃省,庆阳市,宁县', '宁县', '中国,甘肃,庆阳,宁县', '3', '0934', '745200', 'Ningxian', 'NX', 'N', '107.925', '35.5016', '');
INSERT INTO `t_order_region` VALUES ('3574', '621027', '621000', '镇原县', '中国,甘肃省,庆阳市,镇原县', '镇原', '中国,甘肃,庆阳,镇原', '3', '0934', '744500', 'Zhenyuan', 'ZY', 'Z', '107.199', '35.6771', '');
INSERT INTO `t_order_region` VALUES ('3575', '621100', '620000', '定西市', '中国,甘肃省,定西市', '定西', '中国,甘肃,定西', '2', '0932', '743000', 'Dingxi', 'DX', 'D', '104.626', '35.5796', '');
INSERT INTO `t_order_region` VALUES ('3576', '621102', '621100', '安定区', '中国,甘肃省,定西市,安定区', '安定', '中国,甘肃,定西,安定', '3', '0932', '744300', 'Anding', 'AD', 'A', '104.611', '35.5807', '');
INSERT INTO `t_order_region` VALUES ('3577', '621121', '621100', '通渭县', '中国,甘肃省,定西市,通渭县', '通渭', '中国,甘肃,定西,通渭', '3', '0932', '743300', 'Tongwei', 'TW', 'T', '105.242', '35.211', '');
INSERT INTO `t_order_region` VALUES ('3578', '621122', '621100', '陇西县', '中国,甘肃省,定西市,陇西县', '陇西', '中国,甘肃,定西,陇西', '3', '0932', '748100', 'Longxi', 'LX', 'L', '104.634', '35.0024', '');
INSERT INTO `t_order_region` VALUES ('3579', '621123', '621100', '渭源县', '中国,甘肃省,定西市,渭源县', '渭源', '中国,甘肃,定西,渭源', '3', '0932', '748200', 'Weiyuan', 'WY', 'W', '104.214', '35.1365', '');
INSERT INTO `t_order_region` VALUES ('3580', '621124', '621100', '临洮县', '中国,甘肃省,定西市,临洮县', '临洮', '中国,甘肃,定西,临洮', '3', '0932', '730500', 'Lintao', 'LT', 'L', '103.862', '35.3751', '');
INSERT INTO `t_order_region` VALUES ('3581', '621125', '621100', '漳县', '中国,甘肃省,定西市,漳县', '漳县', '中国,甘肃,定西,漳县', '3', '0932', '748300', 'Zhangxian', 'ZX', 'Z', '104.467', '34.8498', '');
INSERT INTO `t_order_region` VALUES ('3582', '621126', '621100', '岷县', '中国,甘肃省,定西市,岷县', '岷县', '中国,甘肃,定西,岷县', '3', '0932', '748400', 'Minxian', 'MX', 'M', '104.038', '34.4344', '');
INSERT INTO `t_order_region` VALUES ('3583', '621200', '620000', '陇南市', '中国,甘肃省,陇南市', '陇南', '中国,甘肃,陇南', '2', '0939', '742500', 'Longnan', 'LN', 'L', '104.929', '33.3886', '');
INSERT INTO `t_order_region` VALUES ('3584', '621202', '621200', '武都区', '中国,甘肃省,陇南市,武都区', '武都', '中国,甘肃,陇南,武都', '3', '0939', '746000', 'Wudu', 'WD', 'W', '104.927', '33.3924', '');
INSERT INTO `t_order_region` VALUES ('3585', '621221', '621200', '成县', '中国,甘肃省,陇南市,成县', '成县', '中国,甘肃,陇南,成县', '3', '0939', '742500', 'Chengxian', 'CX', 'C', '105.726', '33.7393', '');
INSERT INTO `t_order_region` VALUES ('3586', '621222', '621200', '文县', '中国,甘肃省,陇南市,文县', '文县', '中国,甘肃,陇南,文县', '3', '0939', '746400', 'Wenxian', 'WX', 'W', '104.684', '32.9434', '');
INSERT INTO `t_order_region` VALUES ('3587', '621223', '621200', '宕昌县', '中国,甘肃省,陇南市,宕昌县', '宕昌', '中国,甘肃,陇南,宕昌', '3', '0939', '748500', 'Dangchang', 'DC', 'D', '104.393', '34.0473', '');
INSERT INTO `t_order_region` VALUES ('3588', '621224', '621200', '康县', '中国,甘肃省,陇南市,康县', '康县', '中国,甘肃,陇南,康县', '3', '0939', '746500', 'Kangxian', 'KX', 'K', '105.607', '33.3291', '');
INSERT INTO `t_order_region` VALUES ('3589', '621225', '621200', '西和县', '中国,甘肃省,陇南市,西和县', '西和', '中国,甘肃,陇南,西和', '3', '0939', '742100', 'Xihe', 'XH', 'X', '105.301', '34.0143', '');
INSERT INTO `t_order_region` VALUES ('3590', '621226', '621200', '礼县', '中国,甘肃省,陇南市,礼县', '礼县', '中国,甘肃,陇南,礼县', '3', '0939', '742200', 'Lixian', 'LX', 'L', '105.178', '34.1894', '');
INSERT INTO `t_order_region` VALUES ('3591', '621227', '621200', '徽县', '中国,甘肃省,陇南市,徽县', '徽县', '中国,甘肃,陇南,徽县', '3', '0939', '742300', 'Huixian', 'HX', 'H', '106.085', '33.769', '');
INSERT INTO `t_order_region` VALUES ('3592', '621228', '621200', '两当县', '中国,甘肃省,陇南市,两当县', '两当', '中国,甘肃,陇南,两当', '3', '0939', '742400', 'Liangdang', 'LD', 'L', '106.305', '33.9096', '');
INSERT INTO `t_order_region` VALUES ('3593', '622900', '620000', '临夏回族自治州', '中国,甘肃省,临夏回族自治州', '临夏', '中国,甘肃,临夏', '2', '0930', '731100', 'Linxia', 'LX', 'L', '103.212', '35.5994', '');
INSERT INTO `t_order_region` VALUES ('3594', '622901', '622900', '临夏市', '中国,甘肃省,临夏回族自治州,临夏市', '临夏', '中国,甘肃,临夏,临夏', '3', '0930', '731100', 'Linxia', 'LX', 'L', '103.21', '35.5992', '');
INSERT INTO `t_order_region` VALUES ('3595', '622921', '622900', '临夏县', '中国,甘肃省,临夏回族自治州,临夏县', '临夏', '中国,甘肃,临夏,临夏', '3', '0930', '731800', 'Linxia', 'LX', 'L', '102.994', '35.4952', '');
INSERT INTO `t_order_region` VALUES ('3596', '622922', '622900', '康乐县', '中国,甘肃省,临夏回族自治州,康乐县', '康乐', '中国,甘肃,临夏,康乐', '3', '0930', '731500', 'Kangle', 'KL', 'K', '103.711', '35.3722', '');
INSERT INTO `t_order_region` VALUES ('3597', '622923', '622900', '永靖县', '中国,甘肃省,临夏回族自治州,永靖县', '永靖', '中国,甘肃,临夏,永靖', '3', '0930', '731600', 'Yongjing', 'YJ', 'Y', '103.32', '35.9384', '');
INSERT INTO `t_order_region` VALUES ('3598', '622924', '622900', '广河县', '中国,甘肃省,临夏回族自治州,广河县', '广河', '中国,甘肃,临夏,广河', '3', '0930', '731300', 'Guanghe', 'GH', 'G', '103.569', '35.481', '');
INSERT INTO `t_order_region` VALUES ('3599', '622925', '622900', '和政县', '中国,甘肃省,临夏回族自治州,和政县', '和政', '中国,甘肃,临夏,和政', '3', '0930', '731200', 'Hezheng', 'HZ', 'H', '103.349', '35.4259', '');
INSERT INTO `t_order_region` VALUES ('3600', '622926', '622900', '东乡族自治县', '中国,甘肃省,临夏回族自治州,东乡族自治县', '东乡族', '中国,甘肃,临夏,东乡族', '3', '0930', '731400', 'Dongxiangzu', 'DXZ', 'D', '103.395', '35.6647', '');
INSERT INTO `t_order_region` VALUES ('3601', '622927', '622900', '积石山保安族东乡族撒拉族自治县', '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', '积石山', '中国,甘肃,临夏,积石山', '3', '0930', '731700', 'Jishishan', 'JSS', 'J', '102.874', '35.7182', '');
INSERT INTO `t_order_region` VALUES ('3602', '623000', '620000', '甘南藏族自治州', '中国,甘肃省,甘南藏族自治州', '甘南', '中国,甘肃,甘南', '2', '0941', '747000', 'Gannan', 'GN', 'G', '102.911', '34.9864', '');
INSERT INTO `t_order_region` VALUES ('3603', '623001', '623000', '合作市', '中国,甘肃省,甘南藏族自治州,合作市', '合作', '中国,甘肃,甘南,合作', '3', '0941', '747000', 'Hezuo', 'HZ', 'H', '102.911', '35.0002', '');
INSERT INTO `t_order_region` VALUES ('3604', '623021', '623000', '临潭县', '中国,甘肃省,甘南藏族自治州,临潭县', '临潭', '中国,甘肃,甘南,临潭', '3', '0941', '747500', 'Lintan', 'LT', 'L', '103.353', '34.6951', '');
INSERT INTO `t_order_region` VALUES ('3605', '623022', '623000', '卓尼县', '中国,甘肃省,甘南藏族自治州,卓尼县', '卓尼', '中国,甘肃,甘南,卓尼', '3', '0941', '747600', 'Zhuoni', 'ZN', 'Z', '103.508', '34.5892', '');
INSERT INTO `t_order_region` VALUES ('3606', '623023', '623000', '舟曲县', '中国,甘肃省,甘南藏族自治州,舟曲县', '舟曲', '中国,甘肃,甘南,舟曲', '3', '0941', '746300', 'Zhouqu', 'ZQ', 'Z', '104.372', '33.7847', '');
INSERT INTO `t_order_region` VALUES ('3607', '623024', '623000', '迭部县', '中国,甘肃省,甘南藏族自治州,迭部县', '迭部', '中国,甘肃,甘南,迭部', '3', '0941', '747400', 'Diebu', 'DB', 'D', '103.223', '34.0562', '');
INSERT INTO `t_order_region` VALUES ('3608', '623025', '623000', '玛曲县', '中国,甘肃省,甘南藏族自治州,玛曲县', '玛曲', '中国,甘肃,甘南,玛曲', '3', '0941', '747300', 'Maqu', 'MQ', 'M', '102.075', '33.997', '');
INSERT INTO `t_order_region` VALUES ('3609', '623026', '623000', '碌曲县', '中国,甘肃省,甘南藏族自治州,碌曲县', '碌曲', '中国,甘肃,甘南,碌曲', '3', '0941', '747200', 'Luqu', 'LQ', 'L', '102.492', '34.5887', '');
INSERT INTO `t_order_region` VALUES ('3610', '623027', '623000', '夏河县', '中国,甘肃省,甘南藏族自治州,夏河县', '夏河', '中国,甘肃,甘南,夏河', '3', '0941', '747100', 'Xiahe', 'XH', 'X', '102.522', '35.2049', '');
INSERT INTO `t_order_region` VALUES ('3611', '630000', '100000', '青海省', '中国,青海省', '青海', '中国,青海', '1', '', '', 'Qinghai', 'QH', 'Q', '101.779', '36.6232', '');
INSERT INTO `t_order_region` VALUES ('3612', '630100', '630000', '西宁市', '中国,青海省,西宁市', '西宁', '中国,青海,西宁', '2', '0971', '810000', 'Xining', 'XN', 'X', '101.779', '36.6232', '');
INSERT INTO `t_order_region` VALUES ('3613', '630102', '630100', '城东区', '中国,青海省,西宁市,城东区', '城东', '中国,青海,西宁,城东', '3', '0971', '810000', 'Chengdong', 'CD', 'C', '101.804', '36.5997', '');
INSERT INTO `t_order_region` VALUES ('3614', '630103', '630100', '城中区', '中国,青海省,西宁市,城中区', '城中', '中国,青海,西宁,城中', '3', '0971', '810000', 'Chengzhong', 'CZ', 'C', '101.784', '36.6228', '');
INSERT INTO `t_order_region` VALUES ('3615', '630104', '630100', '城西区', '中国,青海省,西宁市,城西区', '城西', '中国,青海,西宁,城西', '3', '0971', '810000', 'Chengxi', 'CX', 'C', '101.766', '36.6283', '');
INSERT INTO `t_order_region` VALUES ('3616', '630105', '630100', '城北区', '中国,青海省,西宁市,城北区', '城北', '中国,青海,西宁,城北', '3', '0971', '810000', 'Chengbei', 'CB', 'C', '101.766', '36.6501', '');
INSERT INTO `t_order_region` VALUES ('3617', '630121', '630100', '大通回族土族自治县', '中国,青海省,西宁市,大通回族土族自治县', '大通', '中国,青海,西宁,大通', '3', '0971', '810100', 'Datong', 'DT', 'D', '101.702', '36.9349', '');
INSERT INTO `t_order_region` VALUES ('3618', '630122', '630100', '湟中县', '中国,青海省,西宁市,湟中县', '湟中', '中国,青海,西宁,湟中', '3', '0971', '811600', 'Huangzhong', 'HZ', 'H', '101.572', '36.5008', '');
INSERT INTO `t_order_region` VALUES ('3619', '630123', '630100', '湟源县', '中国,青海省,西宁市,湟源县', '湟源', '中国,青海,西宁,湟源', '3', '0971', '812100', 'Huangyuan', 'HY', 'H', '101.256', '36.6824', '');
INSERT INTO `t_order_region` VALUES ('3620', '630200', '630000', '海东市', '中国,青海省,海东市', '海东', '中国,青海,海东', '2', '0972', '810600', 'Haidong', 'HD', 'H', '102.103', '36.5029', '');
INSERT INTO `t_order_region` VALUES ('3621', '630202', '630200', '乐都区', '中国,青海省,海东市,乐都区', '乐都', '中国,青海,海东,乐都', '3', '0972', '810700', 'Ledu', 'LD', 'L', '102.402', '36.4803', '');
INSERT INTO `t_order_region` VALUES ('3622', '630203', '630200', '平安区', '中国,青海省,海东市,平安区', '平安', '中国,青海,海东,平安', '3', '0972', '810600', 'Ping\'an', 'PA', 'P', '102.104', '36.5027', '');
INSERT INTO `t_order_region` VALUES ('3623', '630222', '630200', '民和回族土族自治县', '中国,青海省,海东市,民和回族土族自治县', '民和', '中国,青海,海东,民和', '3', '0972', '810800', 'Minhe', 'MH', 'M', '102.804', '36.3295', '');
INSERT INTO `t_order_region` VALUES ('3624', '630223', '630200', '互助土族自治县', '中国,青海省,海东市,互助土族自治县', '互助', '中国,青海,海东,互助', '3', '0972', '810500', 'Huzhu', 'HZ', 'H', '101.957', '36.8399', '');
INSERT INTO `t_order_region` VALUES ('3625', '630224', '630200', '化隆回族自治县', '中国,青海省,海东市,化隆回族自治县', '化隆', '中国,青海,海东,化隆', '3', '0972', '810900', 'Hualong', 'HL', 'H', '102.262', '36.0983', '');
INSERT INTO `t_order_region` VALUES ('3626', '630225', '630200', '循化撒拉族自治县', '中国,青海省,海东市,循化撒拉族自治县', '循化', '中国,青海,海东,循化', '3', '0972', '811100', 'Xunhua', 'XH', 'X', '102.487', '35.8472', '');
INSERT INTO `t_order_region` VALUES ('3627', '632200', '630000', '海北藏族自治州', '中国,青海省,海北藏族自治州', '海北', '中国,青海,海北', '2', '0970', '812200', 'Haibei', 'HB', 'H', '100.901', '36.9594', '');
INSERT INTO `t_order_region` VALUES ('3628', '632221', '632200', '门源回族自治县', '中国,青海省,海北藏族自治州,门源回族自治县', '门源', '中国,青海,海北,门源', '3', '0970', '810300', 'Menyuan', 'MY', 'M', '101.622', '37.3761', '');
INSERT INTO `t_order_region` VALUES ('3629', '632222', '632200', '祁连县', '中国,青海省,海北藏族自治州,祁连县', '祁连', '中国,青海,海北,祁连', '3', '0970', '810400', 'Qilian', 'QL', 'Q', '100.246', '38.179', '');
INSERT INTO `t_order_region` VALUES ('3630', '632223', '632200', '海晏县', '中国,青海省,海北藏族自治州,海晏县', '海晏', '中国,青海,海北,海晏', '3', '0970', '812200', 'Haiyan', 'HY', 'H', '100.993', '36.899', '');
INSERT INTO `t_order_region` VALUES ('3631', '632224', '632200', '刚察县', '中国,青海省,海北藏族自治州,刚察县', '刚察', '中国,青海,海北,刚察', '3', '0970', '812300', 'Gangcha', 'GC', 'G', '100.147', '37.3216', '');
INSERT INTO `t_order_region` VALUES ('3632', '632300', '630000', '黄南藏族自治州', '中国,青海省,黄南藏族自治州', '黄南', '中国,青海,黄南', '2', '0973', '811300', 'Huangnan', 'HN', 'H', '102.02', '35.5177', '');
INSERT INTO `t_order_region` VALUES ('3633', '632321', '632300', '同仁县', '中国,青海省,黄南藏族自治州,同仁县', '同仁', '中国,青海,黄南,同仁', '3', '0973', '811300', 'Tongren', 'TR', 'T', '102.018', '35.516', '');
INSERT INTO `t_order_region` VALUES ('3634', '632322', '632300', '尖扎县', '中国,青海省,黄南藏族自治州,尖扎县', '尖扎', '中国,青海,黄南,尖扎', '3', '0973', '811200', 'Jianzha', 'JZ', 'J', '102.034', '35.9395', '');
INSERT INTO `t_order_region` VALUES ('3635', '632323', '632300', '泽库县', '中国,青海省,黄南藏族自治州,泽库县', '泽库', '中国,青海,黄南,泽库', '3', '0973', '811400', 'Zeku', 'ZK', 'Z', '101.464', '35.0352', '');
INSERT INTO `t_order_region` VALUES ('3636', '632324', '632300', '河南蒙古族自治县', '中国,青海省,黄南藏族自治州,河南蒙古族自治县', '河南', '中国,青海,黄南,河南', '3', '0973', '811500', 'Henan', 'HN', 'H', '101.609', '34.7348', '');
INSERT INTO `t_order_region` VALUES ('3637', '632500', '630000', '海南藏族自治州', '中国,青海省,海南藏族自治州', '海南', '中国,青海,海南', '2', '0974', '813000', 'Hainan', 'HN', 'H', '100.62', '36.2804', '');
INSERT INTO `t_order_region` VALUES ('3638', '632521', '632500', '共和县', '中国,青海省,海南藏族自治州,共和县', '共和', '中国,青海,海南,共和', '3', '0974', '813000', 'Gonghe', 'GH', 'G', '100.62', '36.2841', '');
INSERT INTO `t_order_region` VALUES ('3639', '632522', '632500', '同德县', '中国,青海省,海南藏族自治州,同德县', '同德', '中国,青海,海南,同德', '3', '0974', '813200', 'Tongde', 'TD', 'T', '100.572', '35.2549', '');
INSERT INTO `t_order_region` VALUES ('3640', '632523', '632500', '贵德县', '中国,青海省,海南藏族自治州,贵德县', '贵德', '中国,青海,海南,贵德', '3', '0974', '811700', 'Guide', 'GD', 'G', '101.432', '36.044', '');
INSERT INTO `t_order_region` VALUES ('3641', '632524', '632500', '兴海县', '中国,青海省,海南藏族自治州,兴海县', '兴海', '中国,青海,海南,兴海', '3', '0974', '813300', 'Xinghai', 'XH', 'X', '99.9885', '35.5903', '');
INSERT INTO `t_order_region` VALUES ('3642', '632525', '632500', '贵南县', '中国,青海省,海南藏族自治州,贵南县', '贵南', '中国,青海,海南,贵南', '3', '0974', '813100', 'Guinan', 'GN', 'G', '100.747', '35.5867', '');
INSERT INTO `t_order_region` VALUES ('3643', '632600', '630000', '果洛藏族自治州', '中国,青海省,果洛藏族自治州', '果洛', '中国,青海,果洛', '2', '0975', '814000', 'Golog', 'GL', 'G', '100.242', '34.4736', '');
INSERT INTO `t_order_region` VALUES ('3644', '632621', '632600', '玛沁县', '中国,青海省,果洛藏族自治州,玛沁县', '玛沁', '中国,青海,果洛,玛沁', '3', '0975', '814000', 'Maqin', 'MQ', 'M', '100.239', '34.4775', '');
INSERT INTO `t_order_region` VALUES ('3645', '632622', '632600', '班玛县', '中国,青海省,果洛藏族自治州,班玛县', '班玛', '中国,青海,果洛,班玛', '3', '0975', '814300', 'Banma', 'BM', 'B', '100.737', '32.9325', '');
INSERT INTO `t_order_region` VALUES ('3646', '632623', '632600', '甘德县', '中国,青海省,果洛藏族自治州,甘德县', '甘德', '中国,青海,果洛,甘德', '3', '0975', '814100', 'Gande', 'GD', 'G', '99.9025', '33.9684', '');
INSERT INTO `t_order_region` VALUES ('3647', '632624', '632600', '达日县', '中国,青海省,果洛藏族自治州,达日县', '达日', '中国,青海,果洛,达日', '3', '0975', '814200', 'Dari', 'DR', 'D', '99.6518', '33.7519', '');
INSERT INTO `t_order_region` VALUES ('3648', '632625', '632600', '久治县', '中国,青海省,果洛藏族自治州,久治县', '久治', '中国,青海,果洛,久治', '3', '0975', '624700', 'Jiuzhi', 'JZ', 'J', '101.483', '33.4299', '');
INSERT INTO `t_order_region` VALUES ('3649', '632626', '632600', '玛多县', '中国,青海省,果洛藏族自治州,玛多县', '玛多', '中国,青海,果洛,玛多', '3', '0975', '813500', 'Maduo', 'MD', 'M', '98.21', '34.9157', '');
INSERT INTO `t_order_region` VALUES ('3650', '632700', '630000', '玉树藏族自治州', '中国,青海省,玉树藏族自治州', '玉树', '中国,青海,玉树', '2', '0976', '815000', 'Yushu', 'YS', 'Y', '97.0085', '33.004', '');
INSERT INTO `t_order_region` VALUES ('3651', '632701', '632700', '玉树市', '中国,青海省,玉树藏族自治州,玉树市', '玉树', '中国,青海,玉树,玉树', '3', '0976', '815000', 'Yushu', 'YS', 'Y', '97.0088', '33.0039', '');
INSERT INTO `t_order_region` VALUES ('3652', '632722', '632700', '杂多县', '中国,青海省,玉树藏族自治州,杂多县', '杂多', '中国,青海,玉树,杂多', '3', '0976', '815300', 'Zaduo', 'ZD', 'Z', '95.2986', '32.8932', '');
INSERT INTO `t_order_region` VALUES ('3653', '632723', '632700', '称多县', '中国,青海省,玉树藏族自治州,称多县', '称多', '中国,青海,玉树,称多', '3', '0976', '815100', 'Chenduo', 'CD', 'C', '97.1079', '33.369', '');
INSERT INTO `t_order_region` VALUES ('3654', '632724', '632700', '治多县', '中国,青海省,玉树藏族自治州,治多县', '治多', '中国,青海,玉树,治多', '3', '0976', '815400', 'Zhiduo', 'ZD', 'Z', '95.6157', '33.8528', '');
INSERT INTO `t_order_region` VALUES ('3655', '632725', '632700', '囊谦县', '中国,青海省,玉树藏族自治州,囊谦县', '囊谦', '中国,青海,玉树,囊谦', '3', '0976', '815200', 'Nangqian', 'NQ', 'N', '96.4775', '32.2036', '');
INSERT INTO `t_order_region` VALUES ('3656', '632726', '632700', '曲麻莱县', '中国,青海省,玉树藏族自治州,曲麻莱县', '曲麻莱', '中国,青海,玉树,曲麻莱', '3', '0976', '815500', 'Qumalai', 'QML', 'Q', '95.7976', '34.1261', '');
INSERT INTO `t_order_region` VALUES ('3657', '632800', '630000', '海西蒙古族藏族自治州', '中国,青海省,海西蒙古族藏族自治州', '海西', '中国,青海,海西', '2', '0977', '817000', 'Haixi', 'HX', 'H', '97.3708', '37.3747', '');
INSERT INTO `t_order_region` VALUES ('3658', '632801', '632800', '格尔木市', '中国,青海省,海西蒙古族藏族自治州,格尔木市', '格尔木', '中国,青海,海西,格尔木', '3', '0979', '816000', 'Geermu', 'GEM', 'G', '94.9033', '36.4024', '');
INSERT INTO `t_order_region` VALUES ('3659', '632802', '632800', '德令哈市', '中国,青海省,海西蒙古族藏族自治州,德令哈市', '德令哈', '中国,青海,海西,德令哈', '3', '0977', '817000', 'Delingha', 'DLH', 'D', '97.3608', '37.3695', '');
INSERT INTO `t_order_region` VALUES ('3660', '632821', '632800', '乌兰县', '中国,青海省,海西蒙古族藏族自治州,乌兰县', '乌兰', '中国,青海,海西,乌兰', '3', '0977', '817100', 'Wulan', 'WL', 'W', '98.482', '36.9347', '');
INSERT INTO `t_order_region` VALUES ('3661', '632822', '632800', '都兰县', '中国,青海省,海西蒙古族藏族自治州,都兰县', '都兰', '中国,青海,海西,都兰', '3', '0977', '816100', 'Dulan', 'DL', 'D', '98.0923', '36.3013', '');
INSERT INTO `t_order_region` VALUES ('3662', '632823', '632800', '天峻县', '中国,青海省,海西蒙古族藏族自治州,天峻县', '天峻', '中国,青海,海西,天峻', '3', '0977', '817200', 'Tianjun', 'TJ', 'T', '99.0245', '37.3033', '');
INSERT INTO `t_order_region` VALUES ('3663', '640000', '100000', '宁夏回族自治区', '中国,宁夏回族自治区', '宁夏', '中国,宁夏', '1', '', '', 'Ningxia', 'NX', 'N', '106.278', '38.4664', '');
INSERT INTO `t_order_region` VALUES ('3664', '640100', '640000', '银川市', '中国,宁夏回族自治区,银川市', '银川', '中国,宁夏,银川', '2', '0951', '750000', 'Yinchuan', 'YC', 'Y', '106.278', '38.4664', '');
INSERT INTO `t_order_region` VALUES ('3665', '640104', '640100', '兴庆区', '中国,宁夏回族自治区,银川市,兴庆区', '兴庆', '中国,宁夏,银川,兴庆', '3', '0951', '750000', 'Xingqing', 'XQ', 'X', '106.289', '38.4739', '');
INSERT INTO `t_order_region` VALUES ('3666', '640105', '640100', '西夏区', '中国,宁夏回族自治区,银川市,西夏区', '西夏', '中国,宁夏,银川,西夏', '3', '0951', '750000', 'Xixia', 'XX', 'X', '106.15', '38.4914', '');
INSERT INTO `t_order_region` VALUES ('3667', '640106', '640100', '金凤区', '中国,宁夏回族自治区,银川市,金凤区', '金凤', '中国,宁夏,银川,金凤', '3', '0951', '750000', 'Jinfeng', 'JF', 'J', '106.243', '38.4729', '');
INSERT INTO `t_order_region` VALUES ('3668', '640121', '640100', '永宁县', '中国,宁夏回族自治区,银川市,永宁县', '永宁', '中国,宁夏,银川,永宁', '3', '0951', '750100', 'Yongning', 'YN', 'Y', '106.252', '38.2756', '');
INSERT INTO `t_order_region` VALUES ('3669', '640122', '640100', '贺兰县', '中国,宁夏回族自治区,银川市,贺兰县', '贺兰', '中国,宁夏,银川,贺兰', '3', '0951', '750200', 'Helan', 'HL', 'H', '106.35', '38.5544', '');
INSERT INTO `t_order_region` VALUES ('3670', '640181', '640100', '灵武市', '中国,宁夏回族自治区,银川市,灵武市', '灵武', '中国,宁夏,银川,灵武', '3', '0951', '751400', 'Lingwu', 'LW', 'L', '106.34', '38.1027', '');
INSERT INTO `t_order_region` VALUES ('3671', '640182', '640100', '经济开发区', '中国,宁夏回族自治区,银川市,经济开发区', '经济开发区', '中国,宁夏,银川,经济开发区', '3', '0951', '750000', 'Jingjikaifaqu', 'JJKFQ', 'J', '106.223', '38.4796', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('3672', '640200', '640000', '石嘴山市', '中国,宁夏回族自治区,石嘴山市', '石嘴山', '中国,宁夏,石嘴山', '2', '0952', '753000', 'Shizuishan', 'SZS', 'S', '106.376', '39.0133', '');
INSERT INTO `t_order_region` VALUES ('3673', '640202', '640200', '大武口区', '中国,宁夏回族自治区,石嘴山市,大武口区', '大武口', '中国,宁夏,石嘴山,大武口', '3', '0952', '753000', 'Dawukou', 'DWK', 'D', '106.377', '39.0123', '');
INSERT INTO `t_order_region` VALUES ('3674', '640205', '640200', '惠农区', '中国,宁夏回族自治区,石嘴山市,惠农区', '惠农', '中国,宁夏,石嘴山,惠农', '3', '0952', '753600', 'Huinong', 'HN', 'H', '106.711', '39.1319', '');
INSERT INTO `t_order_region` VALUES ('3675', '640221', '640200', '平罗县', '中国,宁夏回族自治区,石嘴山市,平罗县', '平罗', '中国,宁夏,石嘴山,平罗', '3', '0952', '753400', 'Pingluo', 'PL', 'P', '106.545', '38.9043', '');
INSERT INTO `t_order_region` VALUES ('3676', '640222', '640200', '经济开发区', '中国,宁夏回族自治区,石嘴山市,经济开发区', '经济开发区', '中国,宁夏,石嘴山,经济开发区', '3', '0952', '753000', 'Jingjikaifaqu', 'JJKFQ', 'J', '106.316', '38.9546', '经济技术开发区');
INSERT INTO `t_order_region` VALUES ('3677', '640300', '640000', '吴忠市', '中国,宁夏回族自治区,吴忠市', '吴忠', '中国,宁夏,吴忠', '2', '0953', '751100', 'Wuzhong', 'WZ', 'W', '106.199', '37.9862', '');
INSERT INTO `t_order_region` VALUES ('3678', '640302', '640300', '利通区', '中国,宁夏回族自治区,吴忠市,利通区', '利通', '中国,宁夏,吴忠,利通', '3', '0953', '751100', 'Litong', 'LT', 'L', '106.203', '37.9851', '');
INSERT INTO `t_order_region` VALUES ('3679', '640303', '640300', '红寺堡区', '中国,宁夏回族自治区,吴忠市,红寺堡区', '红寺堡', '中国,宁夏,吴忠,红寺堡', '3', '0953', '751900', 'Hongsibao', 'HSB', 'H', '106.198', '37.9975', '');
INSERT INTO `t_order_region` VALUES ('3680', '640323', '640300', '盐池县', '中国,宁夏回族自治区,吴忠市,盐池县', '盐池', '中国,宁夏,吴忠,盐池', '3', '0953', '751500', 'Yanchi', 'YC', 'Y', '107.407', '37.7833', '');
INSERT INTO `t_order_region` VALUES ('3681', '640324', '640300', '同心县', '中国,宁夏回族自治区,吴忠市,同心县', '同心', '中国,宁夏,吴忠,同心', '3', '0953', '751300', 'Tongxin', 'TX', 'T', '105.914', '36.9812', '');
INSERT INTO `t_order_region` VALUES ('3682', '640381', '640300', '青铜峡市', '中国,宁夏回族自治区,吴忠市,青铜峡市', '青铜峡', '中国,宁夏,吴忠,青铜峡', '3', '0953', '751600', 'Qingtongxia', 'QTX', 'Q', '106.075', '38.02', '');
INSERT INTO `t_order_region` VALUES ('3683', '640400', '640000', '固原市', '中国,宁夏回族自治区,固原市', '固原', '中国,宁夏,固原', '2', '0954', '756000', 'Guyuan', 'GY', 'G', '106.285', '36.0046', '');
INSERT INTO `t_order_region` VALUES ('3684', '640402', '640400', '原州区', '中国,宁夏回族自治区,固原市,原州区', '原州', '中国,宁夏,固原,原州', '3', '0954', '756000', 'Yuanzhou', 'YZ', 'Y', '106.288', '36.0037', '');
INSERT INTO `t_order_region` VALUES ('3685', '640422', '640400', '西吉县', '中国,宁夏回族自治区,固原市,西吉县', '西吉', '中国,宁夏,固原,西吉', '3', '0954', '756200', 'Xiji', 'XJ', 'X', '105.731', '35.9662', '');
INSERT INTO `t_order_region` VALUES ('3686', '640423', '640400', '隆德县', '中国,宁夏回族自治区,固原市,隆德县', '隆德', '中国,宁夏,固原,隆德', '3', '0954', '756300', 'Longde', 'LD', 'L', '106.124', '35.6172', '');
INSERT INTO `t_order_region` VALUES ('3687', '640424', '640400', '泾源县', '中国,宁夏回族自治区,固原市,泾源县', '泾源', '中国,宁夏,固原,泾源', '3', '0954', '756400', 'Jingyuan', 'JY', 'J', '106.339', '35.4907', '');
INSERT INTO `t_order_region` VALUES ('3688', '640425', '640400', '彭阳县', '中国,宁夏回族自治区,固原市,彭阳县', '彭阳', '中国,宁夏,固原,彭阳', '3', '0954', '756500', 'Pengyang', 'PY', 'P', '106.645', '35.8508', '');
INSERT INTO `t_order_region` VALUES ('3689', '640500', '640000', '中卫市', '中国,宁夏回族自治区,中卫市', '中卫', '中国,宁夏,中卫', '2', '0955', '755000', 'Zhongwei', 'ZW', 'Z', '105.19', '37.5149', '');
INSERT INTO `t_order_region` VALUES ('3690', '640502', '640500', '沙坡头区', '中国,宁夏回族自治区,中卫市,沙坡头区', '沙坡头', '中国,宁夏,中卫,沙坡头', '3', '0955', '755000', 'Shapotou', 'SPT', 'S', '105.19', '37.5104', '');
INSERT INTO `t_order_region` VALUES ('3691', '640521', '640500', '中宁县', '中国,宁夏回族自治区,中卫市,中宁县', '中宁', '中国,宁夏,中卫,中宁', '3', '0955', '755100', 'Zhongning', 'ZN', 'Z', '105.685', '37.4915', '');
INSERT INTO `t_order_region` VALUES ('3692', '640522', '640500', '海原县', '中国,宁夏回族自治区,中卫市,海原县', '海原', '中国,宁夏,中卫,海原', '3', '0955', '755200', 'Haiyuan', 'HY', 'H', '105.647', '36.565', '');
INSERT INTO `t_order_region` VALUES ('3693', '650000', '100000', '新疆维吾尔自治区', '中国,新疆维吾尔自治区', '新疆', '中国,新疆', '1', '', '', 'Xinjiang', 'XJ', 'X', '87.6177', '43.7928', '');
INSERT INTO `t_order_region` VALUES ('3694', '650100', '650000', '乌鲁木齐市', '中国,新疆维吾尔自治区,乌鲁木齐市', '乌鲁木齐', '中国,新疆,乌鲁木齐', '2', '0991', '830000', 'Urumqi', 'WLMQ', 'U', '87.6177', '43.7928', '');
INSERT INTO `t_order_region` VALUES ('3695', '650102', '650100', '天山区', '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', '天山', '中国,新疆,乌鲁木齐,天山', '3', '0991', '830000', 'Tianshan', 'TS', 'T', '87.6317', '43.7944', '');
INSERT INTO `t_order_region` VALUES ('3696', '650103', '650100', '沙依巴克区', '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', '沙依巴克', '中国,新疆,乌鲁木齐,沙依巴克', '3', '0991', '830000', 'Shayibake', 'SYBK', 'S', '87.5979', '43.8012', '');
INSERT INTO `t_order_region` VALUES ('3697', '650104', '650100', '新市区', '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', '新市', '中国,新疆,乌鲁木齐,新市', '3', '0991', '830000', 'Xinshi', 'XS', 'X', '87.5741', '43.8435', '');
INSERT INTO `t_order_region` VALUES ('3698', '650105', '650100', '水磨沟区', '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', '水磨沟', '中国,新疆,乌鲁木齐,水磨沟', '3', '0991', '830000', 'Shuimogou', 'SMG', 'S', '87.6425', '43.8325', '');
INSERT INTO `t_order_region` VALUES ('3699', '650106', '650100', '头屯河区', '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', '头屯河', '中国,新疆,乌鲁木齐,头屯河', '3', '0991', '830000', 'Toutunhe', 'TTH', 'T', '87.2914', '43.8549', '');
INSERT INTO `t_order_region` VALUES ('3700', '650107', '650100', '达坂城区', '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', '达坂城', '中国,新疆,乌鲁木齐,达坂城', '3', '0991', '830039', 'Dabancheng', 'DBC', 'D', '88.307', '43.358', '');
INSERT INTO `t_order_region` VALUES ('3701', '650109', '650100', '米东区', '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', '米东', '中国,新疆,乌鲁木齐,米东', '3', '0991', '830019', 'Midong', 'MD', 'M', '87.6858', '43.9474', '');
INSERT INTO `t_order_region` VALUES ('3702', '650121', '650100', '乌鲁木齐县', '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', '乌鲁木齐', '中国,新疆,乌鲁木齐,乌鲁木齐', '3', '0991', '830000', 'Wulumuqi', 'WLMQ', 'W', '87.4094', '43.4712', '');
INSERT INTO `t_order_region` VALUES ('3703', '650200', '650000', '克拉玛依市', '中国,新疆维吾尔自治区,克拉玛依市', '克拉玛依', '中国,新疆,克拉玛依', '2', '0990', '834000', 'Karamay', 'KLMY', 'K', '84.8739', '45.5959', '');
INSERT INTO `t_order_region` VALUES ('3704', '650202', '650200', '独山子区', '中国,新疆维吾尔自治区,克拉玛依市,独山子区', '独山子', '中国,新疆,克拉玛依,独山子', '3', '0992', '833600', 'Dushanzi', 'DSZ', 'D', '84.8867', '44.3287', '');
INSERT INTO `t_order_region` VALUES ('3705', '650203', '650200', '克拉玛依区', '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', '克拉玛依', '中国,新疆,克拉玛依,克拉玛依', '3', '0990', '834000', 'Kelamayi', 'KLMY', 'K', '84.8623', '45.5909', '');
INSERT INTO `t_order_region` VALUES ('3706', '650204', '650200', '白碱滩区', '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', '白碱滩', '中国,新疆,克拉玛依,白碱滩', '3', '0990', '834008', 'Baijiantan', 'BJT', 'B', '85.1324', '45.6877', '');
INSERT INTO `t_order_region` VALUES ('3707', '650205', '650200', '乌尔禾区', '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', '乌尔禾', '中国,新疆,克拉玛依,乌尔禾', '3', '0990', '834014', 'Wuerhe', 'WEH', 'W', '85.6914', '46.0901', '');
INSERT INTO `t_order_region` VALUES ('3708', '650400', '650000', '吐鲁番市', '中国,新疆维吾尔自治区,吐鲁番市', '吐鲁番', '中国,新疆,吐鲁番', '2', '0995', '838000', 'Turpan', 'TLF', 'T', '89.1841', '42.9476', '');
INSERT INTO `t_order_region` VALUES ('3709', '650402', '650400', '高昌区', '中国,新疆维吾尔自治区,吐鲁番市,高昌区', '高昌', '中国,新疆,吐鲁番,高昌', '3', '0995', '838000', 'Gaochang', 'GC', 'G', '89.1858', '42.9351', '');
INSERT INTO `t_order_region` VALUES ('3710', '650421', '650400', '鄯善县', '中国,新疆维吾尔自治区,吐鲁番市,鄯善县', '鄯善', '中国,新疆,吐鲁番,鄯善', '3', '0995', '838200', 'Shanshan', 'SS', 'S', '90.214', '42.8635', '');
INSERT INTO `t_order_region` VALUES ('3711', '650422', '650400', '托克逊县', '中国,新疆维吾尔自治区,吐鲁番市,托克逊县', '托克逊', '中国,新疆,吐鲁番,托克逊', '3', '0995', '838100', 'Tuokexun', 'TKX', 'T', '88.6582', '42.7923', '');
INSERT INTO `t_order_region` VALUES ('3712', '650500', '650000', '哈密市', '中国,新疆维吾尔自治区,哈密市', '哈密', '中国,新疆,哈密', '2', '0902', '839000', 'Hami', 'HM', 'H', '93.5132', '42.8332', '');
INSERT INTO `t_order_region` VALUES ('3713', '650502', '650500', '伊州区', '中国,新疆维吾尔自治区,哈密市,伊州区', '哈密', '中国,新疆,哈密,伊州', '3', '0902', '839000', 'Yizhou', 'YZ', 'Y', '93.5148', '42.8273', '');
INSERT INTO `t_order_region` VALUES ('3714', '650521', '650500', '巴里坤哈萨克自治县', '中国,新疆维吾尔自治区,哈密市,巴里坤哈萨克自治县', '巴里坤', '中国,新疆,哈密,巴里坤', '3', '0902', '839200', 'Balikun', 'BLK', 'B', '93.0124', '43.5999', '');
INSERT INTO `t_order_region` VALUES ('3715', '650522', '650500', '伊吾县', '中国,新疆维吾尔自治区,哈密市,伊吾县', '伊吾', '中国,新疆,哈密,伊吾', '3', '0902', '839300', 'Yiwu', 'YW', 'Y', '94.694', '43.2537', '');
INSERT INTO `t_order_region` VALUES ('3716', '652300', '650000', '昌吉回族自治州', '中国,新疆维吾尔自治区,昌吉回族自治州', '昌吉', '中国,新疆,昌吉', '2', '0994', '831100', 'Changji', 'CJ', 'C', '87.304', '44.0146', '');
INSERT INTO `t_order_region` VALUES ('3717', '652301', '652300', '昌吉市', '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', '昌吉', '中国,新疆,昌吉,昌吉', '3', '0994', '831100', 'Changji', 'CJ', 'C', '87.3025', '44.0127', '');
INSERT INTO `t_order_region` VALUES ('3718', '652302', '652300', '阜康市', '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', '阜康', '中国,新疆,昌吉,阜康', '3', '0994', '831500', 'Fukang', 'FK', 'F', '87.9853', '44.1584', '');
INSERT INTO `t_order_region` VALUES ('3719', '652323', '652300', '呼图壁县', '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', '呼图壁', '中国,新疆,昌吉,呼图壁', '3', '0994', '831200', 'Hutubi', 'HTB', 'H', '86.8989', '44.1898', '');
INSERT INTO `t_order_region` VALUES ('3720', '652324', '652300', '玛纳斯县', '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', '玛纳斯', '中国,新疆,昌吉,玛纳斯', '3', '0994', '832200', 'Manasi', 'MNS', 'M', '86.2145', '44.3044', '');
INSERT INTO `t_order_region` VALUES ('3721', '652325', '652300', '奇台县', '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', '奇台', '中国,新疆,昌吉,奇台', '3', '0994', '831800', 'Qitai', 'QT', 'Q', '89.5932', '44.0222', '');
INSERT INTO `t_order_region` VALUES ('3722', '652327', '652300', '吉木萨尔县', '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', '吉木萨尔', '中国,新疆,昌吉,吉木萨尔', '3', '0994', '831700', 'Jimusaer', 'JMSE', 'J', '89.1808', '44.0005', '');
INSERT INTO `t_order_region` VALUES ('3723', '652328', '652300', '木垒哈萨克自治县', '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', '木垒', '中国,新疆,昌吉,木垒', '3', '0994', '831900', 'Mulei', 'ML', 'M', '90.289', '43.8351', '');
INSERT INTO `t_order_region` VALUES ('3724', '652700', '650000', '博尔塔拉蒙古自治州', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', '博尔塔拉', '中国,新疆,博尔塔拉', '2', '0909', '833400', 'Bortala', 'BETL', 'B', '82.0748', '44.9033', '');
INSERT INTO `t_order_region` VALUES ('3725', '652701', '652700', '博乐市', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', '博乐', '中国,新疆,博尔塔拉,博乐', '3', '0909', '833400', 'Bole', 'BL', 'B', '82.0713', '44.9005', '');
INSERT INTO `t_order_region` VALUES ('3726', '652702', '652700', '阿拉山口市', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', '阿拉山口', '中国,新疆,博尔塔拉,阿拉山口', '3', '0909', '833400', 'Alashankou', 'ALSK', 'A', '82.5677', '45.1706', '');
INSERT INTO `t_order_region` VALUES ('3727', '652722', '652700', '精河县', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', '精河', '中国,新疆,博尔塔拉,精河', '3', '0909', '833300', 'Jinghe', 'JH', 'J', '82.8942', '44.6077', '');
INSERT INTO `t_order_region` VALUES ('3728', '652723', '652700', '温泉县', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', '温泉', '中国,新疆,博尔塔拉,温泉', '3', '0909', '833500', 'Wenquan', 'WQ', 'W', '81.0313', '44.9737', '');
INSERT INTO `t_order_region` VALUES ('3729', '652800', '650000', '巴音郭楞蒙古自治州', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', '巴音郭楞', '中国,新疆,巴音郭楞', '2', '0996', '841000', 'Bayingol', 'BYGL', 'B', '86.151', '41.7686', '');
INSERT INTO `t_order_region` VALUES ('3730', '652801', '652800', '库尔勒市', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', '库尔勒', '中国,新疆,巴音郭楞,库尔勒', '3', '0996', '841000', 'Kuerle', 'KEL', 'K', '86.1553', '41.766', '');
INSERT INTO `t_order_region` VALUES ('3731', '652822', '652800', '轮台县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', '轮台', '中国,新疆,巴音郭楞,轮台', '3', '0996', '841600', 'Luntai', 'LT', 'L', '84.261', '41.7764', '');
INSERT INTO `t_order_region` VALUES ('3732', '652823', '652800', '尉犁县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', '尉犁', '中国,新疆,巴音郭楞,尉犁', '3', '0996', '841500', 'Yuli', 'YL', 'Y', '86.259', '41.3363', '');
INSERT INTO `t_order_region` VALUES ('3733', '652824', '652800', '若羌县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', '若羌', '中国,新疆,巴音郭楞,若羌', '3', '0996', '841800', 'Ruoqiang', 'RQ', 'R', '88.1681', '39.0179', '');
INSERT INTO `t_order_region` VALUES ('3734', '652825', '652800', '且末县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', '且末', '中国,新疆,巴音郭楞,且末', '3', '0996', '841900', 'Qiemo', 'QM', 'Q', '85.5297', '38.1453', '');
INSERT INTO `t_order_region` VALUES ('3735', '652826', '652800', '焉耆回族自治县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', '焉耆', '中国,新疆,巴音郭楞,焉耆', '3', '0996', '841100', 'Yanqi', 'YQ', 'Y', '86.5744', '42.059', '');
INSERT INTO `t_order_region` VALUES ('3736', '652827', '652800', '和静县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', '和静', '中国,新疆,巴音郭楞,和静', '3', '0996', '841300', 'Hejing', 'HJ', 'H', '86.3961', '42.3184', '');
INSERT INTO `t_order_region` VALUES ('3737', '652828', '652800', '和硕县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', '和硕', '中国,新疆,巴音郭楞,和硕', '3', '0996', '841200', 'Heshuo', 'HS', 'H', '86.8639', '42.2681', '');
INSERT INTO `t_order_region` VALUES ('3738', '652829', '652800', '博湖县', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', '博湖', '中国,新疆,巴音郭楞,博湖', '3', '0996', '841400', 'Bohu', 'BH', 'B', '86.6333', '41.9801', '');
INSERT INTO `t_order_region` VALUES ('3739', '652900', '650000', '阿克苏地区', '中国,新疆维吾尔自治区,阿克苏地区', '阿克苏', '中国,新疆,阿克苏', '2', '0997', '843000', 'Aksu', 'AKS', 'A', '80.2651', '41.1707', '');
INSERT INTO `t_order_region` VALUES ('3740', '652901', '652900', '阿克苏市', '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', '阿克苏', '中国,新疆,阿克苏,阿克苏', '3', '0997', '843000', 'Akesu', 'AKS', 'A', '80.2634', '41.1675', '');
INSERT INTO `t_order_region` VALUES ('3741', '652922', '652900', '温宿县', '中国,新疆维吾尔自治区,阿克苏地区,温宿县', '温宿', '中国,新疆,阿克苏,温宿', '3', '0997', '843100', 'Wensu', 'WS', 'W', '80.2417', '41.2768', '');
INSERT INTO `t_order_region` VALUES ('3742', '652923', '652900', '库车县', '中国,新疆维吾尔自治区,阿克苏地区,库车县', '库车', '中国,新疆,阿克苏,库车', '3', '0997', '842000', 'Kuche', 'KC', 'K', '82.9621', '41.7179', '');
INSERT INTO `t_order_region` VALUES ('3743', '652924', '652900', '沙雅县', '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', '沙雅', '中国,新疆,阿克苏,沙雅', '3', '0997', '842200', 'Shaya', 'SY', 'S', '82.7813', '41.225', '');
INSERT INTO `t_order_region` VALUES ('3744', '652925', '652900', '新和县', '中国,新疆维吾尔自治区,阿克苏地区,新和县', '新和', '中国,新疆,阿克苏,新和', '3', '0997', '842100', 'Xinhe', 'XH', 'X', '82.6105', '41.5496', '');
INSERT INTO `t_order_region` VALUES ('3745', '652926', '652900', '拜城县', '中国,新疆维吾尔自治区,阿克苏地区,拜城县', '拜城', '中国,新疆,阿克苏,拜城', '3', '0997', '842300', 'Baicheng', 'BC', 'B', '81.8756', '41.798', '');
INSERT INTO `t_order_region` VALUES ('3746', '652927', '652900', '乌什县', '中国,新疆维吾尔自治区,阿克苏地区,乌什县', '乌什', '中国,新疆,阿克苏,乌什', '3', '0997', '843400', 'Wushi', 'WS', 'W', '79.2294', '41.2157', '');
INSERT INTO `t_order_region` VALUES ('3747', '652928', '652900', '阿瓦提县', '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', '阿瓦提', '中国,新疆,阿克苏,阿瓦提', '3', '0997', '843200', 'Awati', 'AWT', 'A', '80.3834', '40.6393', '');
INSERT INTO `t_order_region` VALUES ('3748', '652929', '652900', '柯坪县', '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', '柯坪', '中国,新疆,阿克苏,柯坪', '3', '0997', '843600', 'Keping', 'KP', 'K', '79.0475', '40.5059', '');
INSERT INTO `t_order_region` VALUES ('3749', '653000', '650000', '克孜勒苏柯尔克孜自治州', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', '克孜勒苏', '中国,新疆,克孜勒苏', '2', '0908', '845350', 'Kizilsu', 'KZLS', 'K', '76.1728', '39.7134', '');
INSERT INTO `t_order_region` VALUES ('3750', '653001', '653000', '阿图什市', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', '阿图什', '中国,新疆,克孜勒苏,阿图什', '3', '0908', '845350', 'Atushi', 'ATS', 'A', '76.1683', '39.7161', '');
INSERT INTO `t_order_region` VALUES ('3751', '653022', '653000', '阿克陶县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', '阿克陶', '中国,新疆,克孜勒苏,阿克陶', '3', '0908', '845550', 'Aketao', 'AKT', 'A', '75.9469', '39.1489', '');
INSERT INTO `t_order_region` VALUES ('3752', '653023', '653000', '阿合奇县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', '阿合奇', '中国,新疆,克孜勒苏,阿合奇', '3', '0997', '843500', 'Aheqi', 'AHQ', 'A', '78.4485', '40.9395', '');
INSERT INTO `t_order_region` VALUES ('3753', '653024', '653000', '乌恰县', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', '乌恰', '中国,新疆,克孜勒苏,乌恰', '3', '0908', '845450', 'Wuqia', 'WQ', 'W', '75.2584', '39.7198', '');
INSERT INTO `t_order_region` VALUES ('3754', '653100', '650000', '喀什地区', '中国,新疆维吾尔自治区,喀什地区', '喀什', '中国,新疆,喀什', '2', '0998', '844000', 'Kashgar', 'KS', 'K', '75.9891', '39.4677', '');
INSERT INTO `t_order_region` VALUES ('3755', '653101', '653100', '喀什市', '中国,新疆维吾尔自治区,喀什地区,喀什市', '喀什', '中国,新疆,喀什,喀什', '3', '0998', '844000', 'Kashi', 'KS', 'K', '75.9938', '39.4677', '');
INSERT INTO `t_order_region` VALUES ('3756', '653121', '653100', '疏附县', '中国,新疆维吾尔自治区,喀什地区,疏附县', '疏附', '中国,新疆,喀什,疏附', '3', '0998', '844100', 'Shufu', 'SF', 'S', '75.8603', '39.3753', '');
INSERT INTO `t_order_region` VALUES ('3757', '653122', '653100', '疏勒县', '中国,新疆维吾尔自治区,喀什地区,疏勒县', '疏勒', '中国,新疆,喀什,疏勒', '3', '0998', '844200', 'Shule', 'SL', 'S', '76.054', '39.4062', '');
INSERT INTO `t_order_region` VALUES ('3758', '653123', '653100', '英吉沙县', '中国,新疆维吾尔自治区,喀什地区,英吉沙县', '英吉沙', '中国,新疆,喀什,英吉沙', '3', '0998', '844500', 'Yingjisha', 'YJS', 'Y', '76.1757', '38.9297', '');
INSERT INTO `t_order_region` VALUES ('3759', '653124', '653100', '泽普县', '中国,新疆维吾尔自治区,喀什地区,泽普县', '泽普', '中国,新疆,喀什,泽普', '3', '0998', '844800', 'Zepu', 'ZP', 'Z', '77.2714', '38.1894', '');
INSERT INTO `t_order_region` VALUES ('3760', '653125', '653100', '莎车县', '中国,新疆维吾尔自治区,喀什地区,莎车县', '莎车', '中国,新疆,喀什,莎车', '3', '0998', '844700', 'Shache', 'SC', 'S', '77.2432', '38.416', '');
INSERT INTO `t_order_region` VALUES ('3761', '653126', '653100', '叶城县', '中国,新疆维吾尔自治区,喀什地区,叶城县', '叶城', '中国,新疆,喀什,叶城', '3', '0998', '844900', 'Yecheng', 'YC', 'Y', '77.4166', '37.8832', '');
INSERT INTO `t_order_region` VALUES ('3762', '653127', '653100', '麦盖提县', '中国,新疆维吾尔自治区,喀什地区,麦盖提县', '麦盖提', '中国,新疆,喀什,麦盖提', '3', '0998', '844600', 'Maigaiti', 'MGT', 'M', '77.6422', '38.8966', '');
INSERT INTO `t_order_region` VALUES ('3763', '653128', '653100', '岳普湖县', '中国,新疆维吾尔自治区,喀什地区,岳普湖县', '岳普湖', '中国,新疆,喀什,岳普湖', '3', '0998', '844400', 'Yuepuhu', 'YPH', 'Y', '76.7723', '39.2356', '');
INSERT INTO `t_order_region` VALUES ('3764', '653129', '653100', '伽师县', '中国,新疆维吾尔自治区,喀什地区,伽师县', '伽师', '中国,新疆,喀什,伽师', '3', '0998', '844300', 'Jiashi', 'JS', 'J', '76.7237', '39.488', '');
INSERT INTO `t_order_region` VALUES ('3765', '653130', '653100', '巴楚县', '中国,新疆维吾尔自治区,喀什地区,巴楚县', '巴楚', '中国,新疆,喀什,巴楚', '3', '0998', '843800', 'Bachu', 'BC', 'B', '78.5489', '39.7855', '');
INSERT INTO `t_order_region` VALUES ('3766', '653131', '653100', '塔什库尔干塔吉克自治县', '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', '塔什库尔干塔吉克', '中国,新疆,喀什,塔什库尔干塔吉克', '3', '0998', '845250', 'Tashikuergantajike', 'TSKEGTJK', 'T', '75.232', '37.7789', '');
INSERT INTO `t_order_region` VALUES ('3767', '653200', '650000', '和田地区', '中国,新疆维吾尔自治区,和田地区', '和田', '中国,新疆,和田', '2', '0903', '848000', 'Hotan', 'HT', 'H', '79.9253', '37.1107', '');
INSERT INTO `t_order_region` VALUES ('3768', '653201', '653200', '和田市', '中国,新疆维吾尔自治区,和田地区,和田市', '和田市', '中国,新疆,和田,和田市', '3', '0903', '848000', 'Hetianshi', 'HTS', 'H', '79.9135', '37.1121', '');
INSERT INTO `t_order_region` VALUES ('3769', '653221', '653200', '和田县', '中国,新疆维吾尔自治区,和田地区,和田县', '和田县', '中国,新疆,和田,和田县', '3', '0903', '848000', 'Hetianxian', 'HTX', 'H', '79.8287', '37.0892', '');
INSERT INTO `t_order_region` VALUES ('3770', '653222', '653200', '墨玉县', '中国,新疆维吾尔自治区,和田地区,墨玉县', '墨玉', '中国,新疆,和田,墨玉', '3', '0903', '848100', 'Moyu', 'MY', 'M', '79.7403', '37.2725', '');
INSERT INTO `t_order_region` VALUES ('3771', '653223', '653200', '皮山县', '中国,新疆维吾尔自治区,和田地区,皮山县', '皮山', '中国,新疆,和田,皮山', '3', '0903', '845150', 'Pishan', 'PS', 'P', '78.2812', '37.6201', '');
INSERT INTO `t_order_region` VALUES ('3772', '653224', '653200', '洛浦县', '中国,新疆维吾尔自治区,和田地区,洛浦县', '洛浦', '中国,新疆,和田,洛浦', '3', '0903', '848200', 'Luopu', 'LP', 'L', '80.1854', '37.0736', '');
INSERT INTO `t_order_region` VALUES ('3773', '653225', '653200', '策勒县', '中国,新疆维吾尔自治区,和田地区,策勒县', '策勒', '中国,新疆,和田,策勒', '3', '0903', '848300', 'Cele', 'CL', 'C', '80.81', '36.9984', '');
INSERT INTO `t_order_region` VALUES ('3774', '653226', '653200', '于田县', '中国,新疆维吾尔自治区,和田地区,于田县', '于田', '中国,新疆,和田,于田', '3', '0903', '848400', 'Yutian', 'YT', 'Y', '81.6672', '36.854', '');
INSERT INTO `t_order_region` VALUES ('3775', '653227', '653200', '民丰县', '中国,新疆维吾尔自治区,和田地区,民丰县', '民丰', '中国,新疆,和田,民丰', '3', '0903', '848500', 'Minfeng', 'MF', 'M', '82.6844', '37.0658', '');
INSERT INTO `t_order_region` VALUES ('3776', '654000', '650000', '伊犁哈萨克自治州', '中国,新疆维吾尔自治区,伊犁哈萨克自治州', '伊犁', '中国,新疆,伊犁', '2', '0999', '835000', 'Ili', 'YL', 'I', '81.3179', '43.9219', '');
INSERT INTO `t_order_region` VALUES ('3777', '654002', '654000', '伊宁市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', '伊宁', '中国,新疆,伊犁,伊宁', '3', '0999', '835000', 'Yining', 'YN', 'Y', '81.3293', '43.9129', '');
INSERT INTO `t_order_region` VALUES ('3778', '654003', '654000', '奎屯市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', '奎屯', '中国,新疆,伊犁,奎屯', '3', '0992', '833200', 'Kuitun', 'KT', 'K', '84.9023', '44.425', '');
INSERT INTO `t_order_region` VALUES ('3779', '654004', '654000', '霍尔果斯市', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', '霍尔果斯', '中国,新疆,伊犁,霍尔果斯', '3', '0999', '835221', 'Huoerguosi', 'HEGS', 'H', '80.4182', '44.2058', '');
INSERT INTO `t_order_region` VALUES ('3780', '654021', '654000', '伊宁县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', '伊宁', '中国,新疆,伊犁,伊宁', '3', '0999', '835100', 'Yining', 'YN', 'Y', '81.5276', '43.9786', '');
INSERT INTO `t_order_region` VALUES ('3781', '654022', '654000', '察布查尔锡伯自治县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', '察布查尔锡伯', '中国,新疆,伊犁,察布查尔锡伯', '3', '0999', '835300', 'Chabuchaerxibo', 'CBCEXB', 'C', '81.1496', '43.8402', '');
INSERT INTO `t_order_region` VALUES ('3782', '654023', '654000', '霍城县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', '霍城', '中国,新疆,伊犁,霍城', '3', '0999', '835200', 'Huocheng', 'HC', 'H', '80.8783', '44.0533', '');
INSERT INTO `t_order_region` VALUES ('3783', '654024', '654000', '巩留县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', '巩留', '中国,新疆,伊犁,巩留', '3', '0999', '835400', 'Gongliu', 'GL', 'G', '82.2285', '43.4843', '');
INSERT INTO `t_order_region` VALUES ('3784', '654025', '654000', '新源县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', '新源', '中国,新疆,伊犁,新源', '3', '0999', '835800', 'Xinyuan', 'XY', 'X', '83.2609', '43.4284', '');
INSERT INTO `t_order_region` VALUES ('3785', '654026', '654000', '昭苏县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', '昭苏', '中国,新疆,伊犁,昭苏', '3', '0999', '835600', 'Zhaosu', 'ZS', 'Z', '81.1307', '43.1583', '');
INSERT INTO `t_order_region` VALUES ('3786', '654027', '654000', '特克斯县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', '特克斯', '中国,新疆,伊犁,特克斯', '3', '0999', '835500', 'Tekesi', 'TKS', 'T', '81.84', '43.2194', '');
INSERT INTO `t_order_region` VALUES ('3787', '654028', '654000', '尼勒克县', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', '尼勒克', '中国,新疆,伊犁,尼勒克', '3', '0999', '835700', 'Nileke', 'NLK', 'N', '82.5118', '43.799', '');
INSERT INTO `t_order_region` VALUES ('3788', '654200', '650000', '塔城地区', '中国,新疆维吾尔自治区,塔城地区', '塔城', '中国,新疆,塔城', '2', '0901', '834700', 'Qoqek', 'TC', 'Q', '82.9857', '46.7463', '');
INSERT INTO `t_order_region` VALUES ('3789', '654201', '654200', '塔城市', '中国,新疆维吾尔自治区,塔城地区,塔城市', '塔城', '中国,新疆,塔城,塔城', '3', '0901', '834700', 'Tacheng', 'TC', 'T', '82.9789', '46.7485', '');
INSERT INTO `t_order_region` VALUES ('3790', '654202', '654200', '乌苏市', '中国,新疆维吾尔自治区,塔城地区,乌苏市', '乌苏', '中国,新疆,塔城,乌苏', '3', '0992', '833000', 'Wusu', 'WS', 'W', '84.6826', '44.4373', '');
INSERT INTO `t_order_region` VALUES ('3791', '654221', '654200', '额敏县', '中国,新疆维吾尔自治区,塔城地区,额敏县', '额敏', '中国,新疆,塔城,额敏', '3', '0901', '834600', 'Emin', 'EM', 'E', '83.6287', '46.5284', '');
INSERT INTO `t_order_region` VALUES ('3792', '654223', '654200', '沙湾县', '中国,新疆维吾尔自治区,塔城地区,沙湾县', '沙湾', '中国,新疆,塔城,沙湾', '3', '0993', '832100', 'Shawan', 'SW', 'S', '85.6193', '44.3314', '');
INSERT INTO `t_order_region` VALUES ('3793', '654224', '654200', '托里县', '中国,新疆维吾尔自治区,塔城地区,托里县', '托里', '中国,新疆,塔城,托里', '3', '0901', '834500', 'Tuoli', 'TL', 'T', '83.6059', '45.9362', '');
INSERT INTO `t_order_region` VALUES ('3794', '654225', '654200', '裕民县', '中国,新疆维吾尔自治区,塔城地区,裕民县', '裕民', '中国,新疆,塔城,裕民', '3', '0901', '834800', 'Yumin', 'YM', 'Y', '82.99', '46.2038', '');
INSERT INTO `t_order_region` VALUES ('3795', '654226', '654200', '和布克赛尔蒙古自治县', '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', '和布克赛尔', '中国,新疆,塔城,和布克赛尔', '3', '0990', '834400', 'Hebukesaier', 'HBKSE', 'H', '85.7266', '46.7936', '');
INSERT INTO `t_order_region` VALUES ('3796', '654300', '650000', '阿勒泰地区', '中国,新疆维吾尔自治区,阿勒泰地区', '阿勒泰', '中国,新疆,阿勒泰', '2', '0906', '836500', 'Altay', 'ALT', 'A', '88.1396', '47.8484', '');
INSERT INTO `t_order_region` VALUES ('3797', '654301', '654300', '阿勒泰市', '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', '阿勒泰', '中国,新疆,阿勒泰,阿勒泰', '3', '0906', '836500', 'Aletai', 'ALT', 'A', '88.1391', '47.8317', '');
INSERT INTO `t_order_region` VALUES ('3798', '654321', '654300', '布尔津县', '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', '布尔津', '中国,新疆,阿勒泰,布尔津', '3', '0906', '836600', 'Buerjin', 'BEJ', 'B', '86.8575', '47.7006', '');
INSERT INTO `t_order_region` VALUES ('3799', '654322', '654300', '富蕴县', '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', '富蕴', '中国,新疆,阿勒泰,富蕴', '3', '0906', '836100', 'Fuyun', 'FY', 'F', '89.5268', '46.9944', '');
INSERT INTO `t_order_region` VALUES ('3800', '654323', '654300', '福海县', '中国,新疆维吾尔自治区,阿勒泰地区,福海县', '福海', '中国,新疆,阿勒泰,福海', '3', '0906', '836400', 'Fuhai', 'FH', 'F', '87.4951', '47.1106', '');
INSERT INTO `t_order_region` VALUES ('3801', '654324', '654300', '哈巴河县', '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', '哈巴河', '中国,新疆,阿勒泰,哈巴河', '3', '0906', '836700', 'Habahe', 'HBH', 'H', '86.4209', '48.0605', '');
INSERT INTO `t_order_region` VALUES ('3802', '654325', '654300', '青河县', '中国,新疆维吾尔自治区,阿勒泰地区,青河县', '青河', '中国,新疆,阿勒泰,青河', '3', '0906', '836200', 'Qinghe', 'QH', 'Q', '90.383', '46.6738', '');
INSERT INTO `t_order_region` VALUES ('3803', '654326', '654300', '吉木乃县', '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', '吉木乃', '中国,新疆,阿勒泰,吉木乃', '3', '0906', '836800', 'Jimunai', 'JMN', 'J', '85.8781', '47.4336', '');
INSERT INTO `t_order_region` VALUES ('3804', '659001', '650000', '石河子市', '中国,新疆维吾尔自治区,石河子市', '石河子', '中国,新疆,石河子', '2', '0993', '832000', 'Shihezi', 'SHZ', 'S', '86.0411', '44.3059', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3805', '659002', '650000', '阿拉尔市', '中国,新疆维吾尔自治区,阿拉尔市', '阿拉尔', '中国,新疆,阿拉尔', '2', '0997', '843300', 'Aral', 'ALE', 'A', '81.2859', '40.5419', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3806', '659003', '650000', '图木舒克市', '中国,新疆维吾尔自治区,图木舒克市', '图木舒克', '中国,新疆,图木舒克', '2', '0998', '843806', 'Tumxuk', 'TMSK', 'T', '79.078', '39.8673', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3807', '659004', '650000', '五家渠市', '中国,新疆维吾尔自治区,五家渠市', '五家渠', '中国,新疆,五家渠', '2', '0994', '831300', 'Wujiaqu', 'WJQ', 'W', '87.5269', '44.1674', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3808', '659005', '650000', '北屯市', '中国,新疆维吾尔自治区,北屯市', '北屯', '中国,新疆,北屯', '2', '0906', '836000', 'Beitun', 'BT', 'B', '87.8085', '47.3623', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3809', '659006', '650000', '铁门关市', '中国,新疆维吾尔自治区,铁门关市', '铁门关', '中国,新疆,铁门关', '2', '0906', '836000', 'Tiemenguan', 'TMG', 'T', '86.1947', '41.811', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3810', '659007', '650000', '双河市', '中国,新疆维吾尔自治区,双河市', '双河', '中国,新疆,双河', '2', '0909', '833408', 'Shuanghe', 'SH', 'S', '82.3537', '44.8405', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3811', '659008', '650000', '可克达拉市', '中国,新疆维吾尔自治区,可克达拉市', '可克达拉', '中国,新疆,可克达拉', '2', '0999', '835213', 'Kokdala', 'KKDL', 'K', '80.6242', '44.127', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3812', '659009', '650000', '昆玉市', '中国,新疆维吾尔自治区,昆玉市', '昆玉', '中国,新疆,昆玉', '2', '0903', '848000', 'Kunyu', 'KY', 'K', '79.9181', '37.0964', '直辖县级');
INSERT INTO `t_order_region` VALUES ('3813', '659101', '659001', '新城街道', '中国,新疆维吾尔自治区,石河子市,新城街道', '新城街道', '中国,新疆,石河子,新城街道', '3', '0993', '832000', 'Xincheng', 'XC', 'X', '86.0276', '44.2931', '拓展');
INSERT INTO `t_order_region` VALUES ('3814', '659102', '659001', '向阳街道', '中国,新疆维吾尔自治区,石河子市,向阳街道', '向阳街道', '中国,新疆,石河子,向阳街道', '3', '0993', '832000', 'Xiangyang', 'XY', 'X', '86.0544', '44.3071', '拓展');
INSERT INTO `t_order_region` VALUES ('3815', '659103', '659001', '红山街道', '中国,新疆维吾尔自治区,石河子市,红山街道', '红山街道', '中国,新疆,石河子,红山街道', '3', '0993', '832000', 'Hongshan', 'HS', 'H', '86.045', '44.2986', '拓展');
INSERT INTO `t_order_region` VALUES ('3816', '659104', '659001', '老街街道', '中国,新疆维吾尔自治区,石河子市,老街街道', '老街街道', '中国,新疆,石河子,老街街道', '3', '0993', '832000', 'Laojie', 'LJ', 'L', '86.039', '44.3167', '拓展');
INSERT INTO `t_order_region` VALUES ('3817', '659105', '659001', '东城街道', '中国,新疆维吾尔自治区,石河子市,东城街道', '东城街道', '中国,新疆,石河子,东城街道', '3', '0993', '832000', 'Dongcheng', 'DC', 'D', '86.0918', '44.3102', '拓展');
INSERT INTO `t_order_region` VALUES ('3818', '659106', '659001', '北泉镇', '中国,新疆维吾尔自治区,石河子市,北泉镇', '北泉镇', '中国,新疆,石河子,北泉镇', '3', '0993', '832011', 'Beiquan', 'BQ', 'B', '86.0167', '44.3338', '拓展');
INSERT INTO `t_order_region` VALUES ('3819', '659107', '659001', '石河子乡', '中国,新疆维吾尔自治区,石河子市,石河子乡', '石河子乡', '中国,新疆,石河子,石河子乡', '3', '0993', '832099', 'Shihezi', 'SHZ', 'S', '86.0354', '44.2865', '拓展');
INSERT INTO `t_order_region` VALUES ('3820', '659108', '659001', '一五二团', '中国,新疆维吾尔自治区,石河子市,一五二团', '一五二团', '中国,新疆,石河子,一五二团', '3', '0993', '832099', 'Yishierwutuan', 'YSEWT', 'Y', '86.0477', '44.2893', '拓展');
INSERT INTO `t_order_region` VALUES ('3821', '659201', '659002', '幸福路街道', '中国,新疆维吾尔自治区,阿拉尔市,幸福路街道', '阿拉尔', '中国,新疆,阿拉尔,幸福路街道', '3', '0997', '843302', 'XingFuLu', 'XFL', 'X', '81.285', '40.5442', '拓展');
INSERT INTO `t_order_region` VALUES ('3822', '659202', '659002', '金银川路街道', '中国,新疆维吾尔自治区,阿拉尔市,金银川路街道', '金银川路街道', '中国,新疆,阿拉尔,金银川路街道', '3', '0997', '843300', 'JinYinChuanLu', 'JYCL', 'J', '81.2758', '40.548', '拓展');
INSERT INTO `t_order_region` VALUES ('3823', '659203', '659002', '青松路街道', '中国,新疆维吾尔自治区,阿拉尔市,青松路街道', '青松路街道', '中国,新疆,阿拉尔,青松路街道', '3', '0997', '843300', 'QingSongLu', 'QSL', 'Q', '81.2654', '40.5513', '拓展');
INSERT INTO `t_order_region` VALUES ('3824', '659204', '659002', '南口街道', '中国,新疆维吾尔自治区,阿拉尔市,南口街道', '南口街道', '中国,新疆,阿拉尔,南口街道', '3', '0997', '843301', 'Nankou', 'NK', 'N', '81.3083', '40.5064', '拓展');
INSERT INTO `t_order_region` VALUES ('3825', '659205', '659002', '托喀依乡', '中国,新疆维吾尔自治区,阿拉尔市,托喀依乡', '托喀依乡', '中国,新疆,阿拉尔,托喀依乡', '3', '0997', '843300', 'Tuokayixiang', 'TKYX', 'T', '81.1201', '40.5387', '拓展');
INSERT INTO `t_order_region` VALUES ('3826', '659206', '659002', '金银川镇', '中国,新疆维吾尔自治区,阿拉尔市,金银川镇', '阿拉尔', '中国,新疆,阿拉尔,金银川镇', '3', '0997', '843008', 'JinYinChuanZhen', 'JYCZ', 'J', '79.9588', '40.746', '拓展');
INSERT INTO `t_order_region` VALUES ('3827', '659301', '659003', '图木舒克市区', '中国,新疆维吾尔自治区,图木舒克市,图木舒克市区', '图木舒克市区', '中国,新疆,图木舒克,图木舒克市区', '3', '0998', '843806', 'Shiqu', 'SQ', 'S', '79.072', '39.8687', '拓展');
INSERT INTO `t_order_region` VALUES ('3828', '659302', '659003', '兵团四十四团', '中国,新疆维吾尔自治区,图木舒克市,兵团四十四团', '兵团四十四团', '中国,新疆,图木舒克,兵团四十四团', '3', '0998', '843806', 'SishisiTuan', 'SSST', 'S', '79.1377', '39.8273', '拓展');
INSERT INTO `t_order_region` VALUES ('3829', '659303', '659003', '兵团四十九团', '中国,新疆维吾尔自治区,图木舒克市,兵团四十九团', '兵团四十九团', '中国,新疆,图木舒克,兵团四十九团', '3', '0998', '843806', 'SishijiuTuan', 'SSJT', 'S', '78.9171', '39.7052', '拓展');
INSERT INTO `t_order_region` VALUES ('3830', '659304', '659003', '兵团五十团', '中国,新疆维吾尔自治区,图木舒克市,兵团五十团', '兵团五十团', '中国,新疆,图木舒克,兵团五十团', '3', '0998', '843806', 'WushiTuan', 'WST', 'W', '79.2428', '39.946', '拓展');
INSERT INTO `t_order_region` VALUES ('3831', '659305', '659003', '兵团五十一团', '中国,新疆维吾尔自治区,图木舒克市,兵团五十一团', '兵团五十一团', '中国,新疆,图木舒克,兵团五十一团', '3', '0998', '843806', 'WushiyiTuan', 'WSYT', 'W', '79.1432', '39.9789', '拓展');
INSERT INTO `t_order_region` VALUES ('3832', '659306', '659003', '兵团五十二团', '中国,新疆维吾尔自治区,图木舒克市,兵团五十二团', '兵团五十二团', '中国,新疆,图木舒克,兵团五十二团', '3', '0998', '843806', 'WushierTuan', 'WSET', 'W', '79.1024', '39.8799', '拓展');
INSERT INTO `t_order_region` VALUES ('3833', '659307', '659003', '兵团五十三团', '中国,新疆维吾尔自治区,图木舒克市,兵团五十三团', '兵团五十三团', '中国,新疆,图木舒克,兵团五十三团', '3', '0998', '843806', 'WushisanTuan', 'WSST', 'W', '79.4206', '40.0303', '拓展');
INSERT INTO `t_order_region` VALUES ('3834', '659308', '659003', '喀拉拜勒镇', '中国,新疆维吾尔自治区,图木舒克市,喀拉拜勒镇', '喀拉拜勒', '中国,新疆,图木舒克,喀拉拜勒', '3', '0998', '843806', 'Kalabaile', 'KLBL', 'K', '78.8737', '39.6853', '拓展');
INSERT INTO `t_order_region` VALUES ('3835', '659309', '659003', '永安坝', '中国,新疆维吾尔自治区,图木舒克市,永安坝', '永安坝', '中国,新疆,图木舒克,永安坝', '3', '0998', '843806', 'Yong\'anBa', 'YAB', 'Y', '79.021', '39.8463', '拓展');
INSERT INTO `t_order_region` VALUES ('3836', '659401', '659004', '城区', '中国,新疆维吾尔自治区,五家渠市,城区', '城区', '中国,新疆,五家渠,城区', '3', '0994', '831300', 'Chengqu', 'CQ', 'C', '87.5352', '44.1295', '拓展');
INSERT INTO `t_order_region` VALUES ('3837', '659402', '659004', '一零一团', '中国,新疆维吾尔自治区,五家渠市,一零一团', '一零一团', '中国,新疆,五家渠,一零一团', '3', '0994', '831300', 'YilingyiTuan', 'YLYT', 'Y', '87.5285', '44.1623', '拓展');
INSERT INTO `t_order_region` VALUES ('3838', '659403', '659004', '一零二团', '中国,新疆维吾尔自治区,五家渠市,一零二团', '一零二团', '中国,新疆,五家渠,一零二团', '3', '0994', '831300', 'YilingerTuan', 'YLET', 'Y', '87.6486', '44.2664', '拓展');
INSERT INTO `t_order_region` VALUES ('3839', '659404', '659004', '一零三团', '中国,新疆维吾尔自治区,五家渠市,一零三团', '一零三团', '中国,新疆,五家渠,一零三团', '3', '0994', '831300', 'YilingsanTuan', 'YLST', 'Y', '87.5285', '44.5279', '拓展');
INSERT INTO `t_order_region` VALUES ('3840', '659501', '659005', '新城区', '中国,新疆维吾尔自治区,北屯市,新城区', '新城', '中国,新疆,北屯,新城', '3', '0906', '836000', 'Xincheng', 'XC', 'X', '87.8003', '47.3545', '拓展');
INSERT INTO `t_order_region` VALUES ('3841', '659502', '659005', '老城区', '中国,新疆维吾尔自治区,北屯市,老城区', '老城', '中国,新疆,北屯,老城', '3', '0906', '836000', 'Laocheng', 'LC', 'L', '87.8085', '47.3623', '拓展');
INSERT INTO `t_order_region` VALUES ('3842', '659503', '659005', '工业园区', '中国,新疆维吾尔自治区,北屯市,工业园区', '工业园', '中国,新疆,北屯,工业园', '3', '0906', '836000', 'Gongyeyuan', 'GYY', 'G', '87.7806', '47.2312', '拓展');
INSERT INTO `t_order_region` VALUES ('3843', '659504', '659005', '海川镇', '中国,新疆维吾尔自治区,北屯市,海川镇', '海川', '中国,新疆,北屯,海川', '3', '0906', '836000', 'Haichuan', 'HC', 'H', '87.7909', '47.3434', '拓展');
INSERT INTO `t_order_region` VALUES ('3844', '659505', '659005', '丰庆镇', '中国,新疆维吾尔自治区,北屯市,丰庆镇', '丰庆', '中国,新疆,北屯,丰庆', '3', '0906', '836000', 'Fengqing', 'FQ', 'F', '87.9924', '47.2737', '拓展');
INSERT INTO `t_order_region` VALUES ('3845', '659506', '659005', '锡伯渡镇', '中国,新疆维吾尔自治区,北屯市,锡伯渡镇', '锡伯渡', '中国,新疆,北屯,锡伯渡', '3', '0906', '836000', 'Xibodu', 'XBD', 'X', '88.095', '47.2601', '拓展');
INSERT INTO `t_order_region` VALUES ('3846', '659601', '659006', '二十九团场', '中国,新疆维吾尔自治区,铁门关市,二十九团场', '二十九团场', '中国,新疆,铁门关,二十九团场', '3', '0906', '836000', 'Ershijiutuan', 'ESJT', 'E', '85.659', '41.8191', '拓展');
INSERT INTO `t_order_region` VALUES ('3847', '659602', '659006', '库西经济工业园', '中国,新疆维吾尔自治区,铁门关市,库西经济工业园', '库西经济工业园', '中国,新疆,铁门关,库西经济工业园', '3', '0906', '836000', 'Kuxigongyeyuan', 'KXGYY', 'K', '85.7122', '41.8542', '拓展');
INSERT INTO `t_order_region` VALUES ('3848', '659603', '659006', '博古其镇', '中国,新疆维吾尔自治区,铁门关市,博古其镇', '博古其镇', '中国,新疆,铁门关,博古其镇', '3', '0906', '836000', 'Boguqi', 'BGQ', 'B', '86.0297', '41.7933', '拓展');
INSERT INTO `t_order_region` VALUES ('3849', '659604', '659006', '双丰镇', '中国,新疆维吾尔自治区,铁门关市,双丰镇', '双丰镇', '中国,新疆,铁门关,双丰镇', '3', '0906', '836000', 'Shuangfeng', 'SF', 'S', '85.5018', '41.8262', '拓展');
INSERT INTO `t_order_region` VALUES ('3850', '659701', '659007', '八十一团', '中国,新疆维吾尔自治区,双河市,八十一团', '八十一团', '中国,新疆,双河,八十一团', '3', '0909', '833408', 'Bayituan', 'BSYT', 'B', '82.44', '44.7841', '拓展');
INSERT INTO `t_order_region` VALUES ('3851', '659702', '659007', '八十四团', '中国,新疆维吾尔自治区,双河市,八十四团', '八十四团', '中国,新疆,双河,八十四团', '3', '0909', '833408', 'Basituan', 'BSST', 'B', '82.063', '44.9958', '拓展');
INSERT INTO `t_order_region` VALUES ('3852', '659703', '659007', '八十五团', '中国,新疆维吾尔自治区,双河市,八十五团', '八十五团', '中国,新疆,双河,八十五团', '3', '0909', '833408', 'Bawutuan', 'BSWT', 'B', '82.1441', '44.8309', '拓展');
INSERT INTO `t_order_region` VALUES ('3853', '659704', '659007', '八十六团', '中国,新疆维吾尔自治区,双河市,八十六团', '八十六团', '中国,新疆,双河,八十六团', '3', '0909', '833408', 'Baliutuan', 'BSLT', 'B', '82.1938', '44.8882', '拓展');
INSERT INTO `t_order_region` VALUES ('3854', '659705', '659007', '八十九团', '中国,新疆维吾尔自治区,双河市,八十九团', '八十九团', '中国,新疆,双河,八十九团', '3', '0909', '833408', 'Bashijiutuan', 'BSJT', 'B', '82.4474', '44.8491', '拓展');
INSERT INTO `t_order_region` VALUES ('3855', '659706', '659007', '九十团', '中国,新疆维吾尔自治区,双河市,九十团', '九十团', '中国,新疆,双河,九十团', '3', '0909', '833408', 'Jiushituan', 'JST', 'J', '82.5955', '44.8225', '拓展');
INSERT INTO `t_order_region` VALUES ('3856', '659801', '659008', '63团', '中国,新疆维吾尔自治区,可克达拉市,63团', '63团', '中国,新疆,可克达拉,63团', '3', '0999', '835213', 'Liushisantuan', 'LSST', 'L', '80.545', '43.9686', '拓展');
INSERT INTO `t_order_region` VALUES ('3857', '659802', '659008', '64团', '中国,新疆维吾尔自治区,可克达拉市,64团', '64团', '中国,新疆,可克达拉,64团', '3', '0999', '835213', 'Liushisituan', 'LSST', 'L', '80.6438', '44.1278', '拓展');
INSERT INTO `t_order_region` VALUES ('3858', '659803', '659008', '66团', '中国,新疆维吾尔自治区,可克达拉市,66团', '66团', '中国,新疆,可克达拉,66团', '3', '0999', '835213', 'LiushiliuTuan', 'LSLT', 'L', '81.0438', '43.944', '拓展');
INSERT INTO `t_order_region` VALUES ('3859', '659804', '659008', '67团', '中国,新疆维吾尔自治区,可克达拉市,67团', '67团', '中国,新疆,可克达拉,67团', '3', '0999', '835213', 'LiushiqiTuan', 'LSQT', 'L', '80.7577', '43.802', '拓展');
INSERT INTO `t_order_region` VALUES ('3860', '659805', '659008', '68团', '中国,新疆维吾尔自治区,可克达拉市,68团', '68团', '中国,新疆,可克达拉,68团', '3', '0999', '835213', 'LiushibaTuan', 'LSBT', 'L', '80.6242', '44.127', '拓展');
INSERT INTO `t_order_region` VALUES ('3861', '659901', '659009', '皮山农场', '中国,新疆维吾尔自治区,昆玉市,皮山农场', '皮山农场', '中国,新疆,昆玉,皮山农场', '3', '0903', '848000', 'Pishannongchang', 'PSNC', 'P', '77.7942', '37.2264', '拓展');
INSERT INTO `t_order_region` VALUES ('3862', '659902', '659009', '二二四团', '中国,新疆维吾尔自治区,昆玉市,二二四团', '二二四团', '中国,新疆,昆玉,二二四团', '3', '0903', '848000', 'Erersituan', 'EEST', 'E', '79.2902', '37.2117', '拓展');
INSERT INTO `t_order_region` VALUES ('3863', '659903', '659009', '四十七团', '中国,新疆维吾尔自治区,昆玉市,四十七团', '四十七团', '中国,新疆,昆玉,四十七团', '3', '0903', '848000', 'Sishiqituan', 'SSQT', 'S', '79.6484', '37.5107', '拓展');
INSERT INTO `t_order_region` VALUES ('3864', '659904', '659009', '一牧场', '中国,新疆维吾尔自治区,昆玉市,一牧场', '一牧场', '中国,新疆,昆玉,一牧场', '3', '0903', '848000', 'Yimuchang', 'YMC', 'Y', '81.0331', '36.2632', '拓展');
INSERT INTO `t_order_region` VALUES ('3865', '710000', '100000', '台湾', '中国,台湾', '台湾', '中国,台湾', '1', '', '', 'Taiwan', 'TW', 'T', '121.509', '25.0443', '');
INSERT INTO `t_order_region` VALUES ('3866', '710100', '710000', '台北市', '中国,台湾,台北市', '台北', '中国,台湾,台北', '2', '02', '1', 'Taipei', 'TB', 'T', '121.565', '25.0378', '');
INSERT INTO `t_order_region` VALUES ('3867', '710101', '710100', '松山区', '中国,台湾,台北市,松山区', '松山', '中国,台湾,台北,松山', '3', '02', '105', 'Songshan', 'SS', 'S', '121.577', '25.0497', '');
INSERT INTO `t_order_region` VALUES ('3868', '710102', '710100', '信义区', '中国,台湾,台北市,信义区', '信义', '中国,台湾,台北,信义', '3', '02', '110', 'Xinyi', 'XY', 'X', '121.751', '25.1294', '');
INSERT INTO `t_order_region` VALUES ('3869', '710103', '710100', '大安区', '中国,台湾,台北市,大安区', '大安', '中国,台湾,台北,大安', '3', '02', '106', 'Da\'an', 'DA', 'D', '121.535', '25.0264', '');
INSERT INTO `t_order_region` VALUES ('3870', '710104', '710100', '中山区', '中国,台湾,台北市,中山区', '中山', '中国,台湾,台北,中山', '3', '02', '104', 'Zhongshan', 'ZS', 'Z', '121.533', '25.0644', '');
INSERT INTO `t_order_region` VALUES ('3871', '710105', '710100', '中正区', '中国,台湾,台北市,中正区', '中正', '中国,台湾,台北,中正', '3', '02', '100', 'Zhongzheng', 'ZZ', 'Z', '121.518', '25.0324', '');
INSERT INTO `t_order_region` VALUES ('3872', '710106', '710100', '大同区', '中国,台湾,台北市,大同区', '大同', '中国,台湾,台北,大同', '3', '02', '103', 'Datong', 'DT', 'D', '121.516', '25.066', '');
INSERT INTO `t_order_region` VALUES ('3873', '710107', '710100', '万华区', '中国,台湾,台北市,万华区', '万华', '中国,台湾,台北,万华', '3', '02', '108', 'Wanhua', 'WH', 'W', '121.499', '25.0319', '');
INSERT INTO `t_order_region` VALUES ('3874', '710108', '710100', '文山区', '中国,台湾,台北市,文山区', '文山', '中国,台湾,台北,文山', '3', '02', '116', 'Wenshan', 'WS', 'W', '121.57', '24.9898', '');
INSERT INTO `t_order_region` VALUES ('3875', '710109', '710100', '南港区', '中国,台湾,台北市,南港区', '南港', '中国,台湾,台北,南港', '3', '02', '115', 'Nangang', 'NG', 'N', '121.607', '25.0547', '');
INSERT INTO `t_order_region` VALUES ('3876', '710110', '710100', '内湖区', '中国,台湾,台北市,内湖区', '内湖', '中国,台湾,台北,内湖', '3', '02', '114', 'Nahu', 'NH', 'N', '121.589', '25.0697', '');
INSERT INTO `t_order_region` VALUES ('3877', '710111', '710100', '士林区', '中国,台湾,台北市,士林区', '士林', '中国,台湾,台北,士林', '3', '02', '111', 'Shilin', 'SL', 'S', '121.52', '25.0928', '');
INSERT INTO `t_order_region` VALUES ('3878', '710112', '710100', '北投区', '中国,台湾,台北市,北投区', '北投', '中国,台湾,台北,北投', '3', '02', '112', 'Beitou', 'BT', 'B', '121.501', '25.1324', '');
INSERT INTO `t_order_region` VALUES ('3879', '710200', '710000', '高雄市', '中国,台湾,高雄市', '高雄', '中国,台湾,高雄', '2', '07', '8', 'Kaohsiung', 'GX', 'K', '120.312', '22.6209', '');
INSERT INTO `t_order_region` VALUES ('3880', '710201', '710200', '盐埕区', '中国,台湾,高雄市,盐埕区', '盐埕', '中国,台湾,高雄,盐埕', '3', '07', '803', 'Yancheng', 'YC', 'Y', '120.287', '22.6247', '');
INSERT INTO `t_order_region` VALUES ('3881', '710202', '710200', '鼓山区', '中国,台湾,高雄市,鼓山区', '鼓山', '中国,台湾,高雄,鼓山', '3', '07', '804', 'Gushan', 'GS', 'G', '120.281', '22.6368', '');
INSERT INTO `t_order_region` VALUES ('3882', '710203', '710200', '左营区', '中国,台湾,高雄市,左营区', '左营', '中国,台湾,高雄,左营', '3', '07', '813', 'Zuoying', 'ZY', 'Z', '120.295', '22.6901', '');
INSERT INTO `t_order_region` VALUES ('3883', '710204', '710200', '楠梓区', '中国,台湾,高雄市,楠梓区', '楠梓', '中国,台湾,高雄,楠梓', '3', '07', '811', 'Nanzi', 'NZ', 'N', '120.326', '22.7284', '');
INSERT INTO `t_order_region` VALUES ('3884', '710205', '710200', '三民区', '中国,台湾,高雄市,三民区', '三民', '中国,台湾,高雄,三民', '3', '07', '807', 'Sanmin', 'SM', 'S', '120.3', '22.6477', '');
INSERT INTO `t_order_region` VALUES ('3885', '710206', '710200', '新兴区', '中国,台湾,高雄市,新兴区', '新兴', '中国,台湾,高雄,新兴', '3', '07', '800', 'Xinxing', 'XX', 'X', '120.31', '22.6311', '');
INSERT INTO `t_order_region` VALUES ('3886', '710207', '710200', '前金区', '中国,台湾,高雄市,前金区', '前金', '中国,台湾,高雄,前金', '3', '07', '801', 'Qianjin', 'QJ', 'Q', '120.294', '22.6274', '');
INSERT INTO `t_order_region` VALUES ('3887', '710208', '710200', '苓雅区', '中国,台湾,高雄市,苓雅区', '苓雅', '中国,台湾,高雄,苓雅', '3', '07', '802', 'Lingya', 'LY', 'L', '120.312', '22.6218', '');
INSERT INTO `t_order_region` VALUES ('3888', '710209', '710200', '前镇区', '中国,台湾,高雄市,前镇区', '前镇', '中国,台湾,高雄,前镇', '3', '07', '806', 'Qianzhen', 'QZ', 'Q', '120.319', '22.5864', '');
INSERT INTO `t_order_region` VALUES ('3889', '710210', '710200', '旗津区', '中国,台湾,高雄市,旗津区', '旗津', '中国,台湾,高雄,旗津', '3', '07', '805', 'Qijin', 'QJ', 'Q', '120.284', '22.5906', '');
INSERT INTO `t_order_region` VALUES ('3890', '710211', '710200', '小港区', '中国,台湾,高雄市,小港区', '小港', '中国,台湾,高雄,小港', '3', '07', '812', 'Xiaogang', 'XG', 'X', '120.338', '22.5654', '');
INSERT INTO `t_order_region` VALUES ('3891', '710212', '710200', '凤山区', '中国,台湾,高雄市,凤山区', '凤山', '中国,台湾,高雄,凤山', '3', '07', '830', 'Fengshan', 'FS', 'F', '120.357', '22.6269', '');
INSERT INTO `t_order_region` VALUES ('3892', '710213', '710200', '林园区', '中国,台湾,高雄市,林园区', '林园', '中国,台湾,高雄,林园', '3', '07', '832', 'Linyuan', 'LY', 'L', '120.396', '22.5015', '');
INSERT INTO `t_order_region` VALUES ('3893', '710214', '710200', '大寮区', '中国,台湾,高雄市,大寮区', '大寮', '中国,台湾,高雄,大寮', '3', '07', '831', 'Daliao', 'DL', 'D', '120.395', '22.6054', '');
INSERT INTO `t_order_region` VALUES ('3894', '710215', '710200', '大树区', '中国,台湾,高雄市,大树区', '大树', '中国,台湾,高雄,大树', '3', '07', '840', 'Dashu', 'DS', 'D', '120.433', '22.6934', '');
INSERT INTO `t_order_region` VALUES ('3895', '710216', '710200', '大社区', '中国,台湾,高雄市,大社区', '大社', '中国,台湾,高雄,大社', '3', '07', '815', 'Dashe', 'DS', 'D', '120.347', '22.73', '');
INSERT INTO `t_order_region` VALUES ('3896', '710217', '710200', '仁武区', '中国,台湾,高雄市,仁武区', '仁武', '中国,台湾,高雄,仁武', '3', '07', '814', 'Renwu', 'RW', 'R', '120.348', '22.7019', '');
INSERT INTO `t_order_region` VALUES ('3897', '710218', '710200', '鸟松区', '中国,台湾,高雄市,鸟松区', '鸟松', '中国,台湾,高雄,鸟松', '3', '07', '833', 'Niaosong', 'NS', 'N', '120.364', '22.6593', '');
INSERT INTO `t_order_region` VALUES ('3898', '710219', '710200', '冈山区', '中国,台湾,高雄市,冈山区', '冈山', '中国,台湾,高雄,冈山', '3', '07', '820', 'Gangshan', 'GS', 'G', '120.296', '22.7968', '');
INSERT INTO `t_order_region` VALUES ('3899', '710220', '710200', '桥头区', '中国,台湾,高雄市,桥头区', '桥头', '中国,台湾,高雄,桥头', '3', '07', '825', 'Qiaotou', 'QT', 'Q', '120.306', '22.7575', '');
INSERT INTO `t_order_region` VALUES ('3900', '710221', '710200', '燕巢区', '中国,台湾,高雄市,燕巢区', '燕巢', '中国,台湾,高雄,燕巢', '3', '07', '824', 'Yanchao', 'YC', 'Y', '120.362', '22.7934', '');
INSERT INTO `t_order_region` VALUES ('3901', '710222', '710200', '田寮区', '中国,台湾,高雄市,田寮区', '田寮', '中国,台湾,高雄,田寮', '3', '07', '823', 'Tianliao', 'TL', 'T', '120.36', '22.8693', '');
INSERT INTO `t_order_region` VALUES ('3902', '710223', '710200', '阿莲区', '中国,台湾,高雄市,阿莲区', '阿莲', '中国,台湾,高雄,阿莲', '3', '07', '822', 'Alian', 'AL', 'A', '120.327', '22.8837', '');
INSERT INTO `t_order_region` VALUES ('3903', '710224', '710200', '路竹区', '中国,台湾,高雄市,路竹区', '路竹', '中国,台湾,高雄,路竹', '3', '07', '821', 'Luzhu', 'LZ', 'L', '120.262', '22.8569', '');
INSERT INTO `t_order_region` VALUES ('3904', '710225', '710200', '湖内区', '中国,台湾,高雄市,湖内区', '湖内', '中国,台湾,高雄,湖内', '3', '07', '829', 'Huna', 'HN', 'H', '120.212', '22.9082', '');
INSERT INTO `t_order_region` VALUES ('3905', '710226', '710200', '茄萣区', '中国,台湾,高雄市,茄萣区', '茄萣', '中国,台湾,高雄,茄萣', '3', '07', '852', 'Qieding', 'QD', 'Q', '120.183', '22.9066', '');
INSERT INTO `t_order_region` VALUES ('3906', '710227', '710200', '永安区', '中国,台湾,高雄市,永安区', '永安', '中国,台湾,高雄,永安', '3', '07', '828', 'Yong\'an', 'YA', 'Y', '120.225', '22.8186', '');
INSERT INTO `t_order_region` VALUES ('3907', '710228', '710200', '弥陀区', '中国,台湾,高雄市,弥陀区', '弥陀', '中国,台湾,高雄,弥陀', '3', '07', '827', 'Mituo', 'MT', 'M', '120.247', '22.7829', '');
INSERT INTO `t_order_region` VALUES ('3908', '710229', '710200', '梓官区', '中国,台湾,高雄市,梓官区', '梓官', '中国,台湾,高雄,梓官', '3', '07', '826', 'Ziguan', 'ZG', 'Z', '120.267', '22.7605', '');
INSERT INTO `t_order_region` VALUES ('3909', '710230', '710200', '旗山区', '中国,台湾,高雄市,旗山区', '旗山', '中国,台湾,高雄,旗山', '3', '07', '842', 'Qishan', 'QS', 'Q', '120.484', '22.8885', '');
INSERT INTO `t_order_region` VALUES ('3910', '710231', '710200', '美浓区', '中国,台湾,高雄市,美浓区', '美浓', '中国,台湾,高雄,美浓', '3', '07', '843', 'Meinong', 'MN', 'M', '120.542', '22.8979', '');
INSERT INTO `t_order_region` VALUES ('3911', '710232', '710200', '六龟区', '中国,台湾,高雄市,六龟区', '六龟', '中国,台湾,高雄,六龟', '3', '07', '844', 'Liugui', 'LG', 'L', '120.633', '22.9979', '');
INSERT INTO `t_order_region` VALUES ('3912', '710233', '710200', '甲仙区', '中国,台湾,高雄市,甲仙区', '甲仙', '中国,台湾,高雄,甲仙', '3', '07', '847', 'Jiaxian', 'JX', 'J', '120.591', '23.0847', '');
INSERT INTO `t_order_region` VALUES ('3913', '710234', '710200', '杉林区', '中国,台湾,高雄市,杉林区', '杉林', '中国,台湾,高雄,杉林', '3', '07', '846', 'Shanlin', 'SL', 'S', '120.539', '22.9707', '');
INSERT INTO `t_order_region` VALUES ('3914', '710235', '710200', '内门区', '中国,台湾,高雄市,内门区', '内门', '中国,台湾,高雄,内门', '3', '07', '845', 'Namen', 'NM', 'N', '120.462', '22.9434', '');
INSERT INTO `t_order_region` VALUES ('3915', '710236', '710200', '茂林区', '中国,台湾,高雄市,茂林区', '茂林', '中国,台湾,高雄,茂林', '3', '07', '851', 'Maolin', 'ML', 'M', '120.663', '22.8862', '');
INSERT INTO `t_order_region` VALUES ('3916', '710237', '710200', '桃源区', '中国,台湾,高雄市,桃源区', '桃源', '中国,台湾,高雄,桃源', '3', '07', '848', 'Taoyuan', 'TY', 'T', '120.76', '23.1591', '');
INSERT INTO `t_order_region` VALUES ('3917', '710238', '710200', '那玛夏区', '中国,台湾,高雄市,那玛夏区', '那玛夏', '中国,台湾,高雄,那玛夏', '3', '07', '849', 'Namaxia', 'NMX', 'N', '120.693', '23.217', '');
INSERT INTO `t_order_region` VALUES ('3918', '710300', '710000', '基隆市', '中国,台湾,基隆市', '基隆', '中国,台湾,基隆', '2', '02', '2', 'Keelung', 'JL', 'K', '121.746', '25.1307', '');
INSERT INTO `t_order_region` VALUES ('3919', '710301', '710300', '中正区', '中国,台湾,基隆市,中正区', '中正', '中国,台湾,基隆,中正', '3', '02', '202', 'Zhongzheng', 'ZZ', 'Z', '121.518', '25.0324', '');
INSERT INTO `t_order_region` VALUES ('3920', '710302', '710300', '七堵区', '中国,台湾,基隆市,七堵区', '七堵', '中国,台湾,基隆,七堵', '3', '02', '206', 'Qidu', 'QD', 'Q', '121.713', '25.0957', '');
INSERT INTO `t_order_region` VALUES ('3921', '710303', '710300', '暖暖区', '中国,台湾,基隆市,暖暖区', '暖暖', '中国,台湾,基隆,暖暖', '3', '02', '205', 'Nuannuan', 'NN', 'N', '121.736', '25.0998', '');
INSERT INTO `t_order_region` VALUES ('3922', '710304', '710300', '仁爱区', '中国,台湾,基隆市,仁爱区', '仁爱', '中国,台湾,基隆,仁爱', '3', '02', '200', 'Renai', 'RA', 'R', '121.741', '25.1275', '');
INSERT INTO `t_order_region` VALUES ('3923', '710305', '710300', '中山区', '中国,台湾,基隆市,中山区', '中山', '中国,台湾,基隆,中山', '3', '02', '203', 'Zhongshan', 'ZS', 'Z', '121.739', '25.134', '');
INSERT INTO `t_order_region` VALUES ('3924', '710306', '710300', '安乐区', '中国,台湾,基隆市,安乐区', '安乐', '中国,台湾,基隆,安乐', '3', '02', '204', 'Anle', 'AL', 'A', '121.723', '25.1209', '');
INSERT INTO `t_order_region` VALUES ('3925', '710307', '710300', '信义区', '中国,台湾,基隆市,信义区', '信义', '中国,台湾,基隆,信义', '3', '02', '201', 'Xinyi', 'XY', 'X', '121.751', '25.1294', '');
INSERT INTO `t_order_region` VALUES ('3926', '710400', '710000', '台中市', '中国,台湾,台中市', '台中', '中国,台湾,台中', '2', '04', '4', 'Taichung', 'TZ', 'T', '120.679', '24.1386', '');
INSERT INTO `t_order_region` VALUES ('3927', '710401', '710400', '中区', '中国,台湾,台中市,中区', '中区', '中国,台湾,台中,中区', '3', '04', '400', 'Zhongqu', 'ZQ', 'Z', '120.68', '24.1438', '');
INSERT INTO `t_order_region` VALUES ('3928', '710402', '710400', '东区', '中国,台湾,台中市,东区', '东区', '中国,台湾,台中,东区', '3', '04', '401', 'Dongqu', 'DQ', 'D', '120.704', '24.1366', '');
INSERT INTO `t_order_region` VALUES ('3929', '710403', '710400', '南区', '中国,台湾,台中市,南区', '南区', '中国,台湾,台中,南区', '3', '04', '402', 'Nanqu', 'NQ', 'N', '120.189', '22.9609', '');
INSERT INTO `t_order_region` VALUES ('3930', '710404', '710400', '西区', '中国,台湾,台中市,西区', '西区', '中国,台湾,台中,西区', '3', '04', '403', 'Xiqu', 'XQ', 'X', '120.671', '24.1414', '');
INSERT INTO `t_order_region` VALUES ('3931', '710405', '710400', '北区', '中国,台湾,台中市,北区', '北区', '中国,台湾,台中,北区', '3', '04', '404', 'Beiqu', 'BQ', 'B', '120.682', '24.166', '');
INSERT INTO `t_order_region` VALUES ('3932', '710406', '710400', '西屯区', '中国,台湾,台中市,西屯区', '西屯', '中国,台湾,台中,西屯', '3', '04', '407', 'Xitun', 'XT', 'X', '120.64', '24.1813', '');
INSERT INTO `t_order_region` VALUES ('3933', '710407', '710400', '南屯区', '中国,台湾,台中市,南屯区', '南屯', '中国,台湾,台中,南屯', '3', '04', '408', 'Nantun', 'NT', 'N', '120.643', '24.1383', '');
INSERT INTO `t_order_region` VALUES ('3934', '710408', '710400', '北屯区', '中国,台湾,台中市,北屯区', '北屯', '中国,台湾,台中,北屯', '3', '04', '406', 'Beitun', 'BT', 'B', '120.686', '24.1822', '');
INSERT INTO `t_order_region` VALUES ('3935', '710409', '710400', '丰原区', '中国,台湾,台中市,丰原区', '丰原', '中国,台湾,台中,丰原', '3', '04', '420', 'Fengyuan', 'FY', 'F', '120.718', '24.2422', '');
INSERT INTO `t_order_region` VALUES ('3936', '710410', '710400', '东势区', '中国,台湾,台中市,东势区', '东势', '中国,台湾,台中,东势', '3', '04', '423', 'Dongshi', 'DS', 'D', '120.828', '24.2586', '');
INSERT INTO `t_order_region` VALUES ('3937', '710411', '710400', '大甲区', '中国,台湾,台中市,大甲区', '大甲', '中国,台湾,台中,大甲', '3', '04', '437', 'Dajia', 'DJ', 'D', '120.622', '24.3489', '');
INSERT INTO `t_order_region` VALUES ('3938', '710412', '710400', '清水区', '中国,台湾,台中市,清水区', '清水', '中国,台湾,台中,清水', '3', '04', '436', 'Qingshui', 'QS', 'Q', '120.56', '24.2687', '');
INSERT INTO `t_order_region` VALUES ('3939', '710413', '710400', '沙鹿区', '中国,台湾,台中市,沙鹿区', '沙鹿', '中国,台湾,台中,沙鹿', '3', '04', '433', 'Shalu', 'SL', 'S', '120.566', '24.2335', '');
INSERT INTO `t_order_region` VALUES ('3940', '710414', '710400', '梧栖区', '中国,台湾,台中市,梧栖区', '梧栖', '中国,台湾,台中,梧栖', '3', '04', '435', 'Wuqi', 'WQ', 'W', '120.532', '24.255', '');
INSERT INTO `t_order_region` VALUES ('3941', '710415', '710400', '后里区', '中国,台湾,台中市,后里区', '后里', '中国,台湾,台中,后里', '3', '04', '421', 'Houli', 'HL', 'H', '120.711', '24.3049', '');
INSERT INTO `t_order_region` VALUES ('3942', '710416', '710400', '神冈区', '中国,台湾,台中市,神冈区', '神冈', '中国,台湾,台中,神冈', '3', '04', '429', 'Shengang', 'SG', 'S', '120.662', '24.2578', '');
INSERT INTO `t_order_region` VALUES ('3943', '710417', '710400', '潭子区', '中国,台湾,台中市,潭子区', '潭子', '中国,台湾,台中,潭子', '3', '04', '427', 'Tanzi', 'TZ', 'T', '120.705', '24.2095', '');
INSERT INTO `t_order_region` VALUES ('3944', '710418', '710400', '大雅区', '中国,台湾,台中市,大雅区', '大雅', '中国,台湾,台中,大雅', '3', '04', '428', 'Daya', 'DY', 'D', '120.648', '24.2292', '');
INSERT INTO `t_order_region` VALUES ('3945', '710419', '710400', '新社区', '中国,台湾,台中市,新社区', '新社', '中国,台湾,台中,新社', '3', '04', '426', 'Xinshe', 'XS', 'X', '120.81', '24.2341', '');
INSERT INTO `t_order_region` VALUES ('3946', '710420', '710400', '石冈区', '中国,台湾,台中市,石冈区', '石冈', '中国,台湾,台中,石冈', '3', '04', '422', 'Shigang', 'SG', 'S', '120.78', '24.275', '');
INSERT INTO `t_order_region` VALUES ('3947', '710421', '710400', '外埔区', '中国,台湾,台中市,外埔区', '外埔', '中国,台湾,台中,外埔', '3', '04', '438', 'Waipu', 'WP', 'W', '120.654', '24.332', '');
INSERT INTO `t_order_region` VALUES ('3948', '710422', '710400', '大安区', '中国,台湾,台中市,大安区', '大安', '中国,台湾,台中,大安', '3', '04', '439', 'Da\'an', 'DA', 'D', '120.587', '24.3461', '');
INSERT INTO `t_order_region` VALUES ('3949', '710423', '710400', '乌日区', '中国,台湾,台中市,乌日区', '乌日', '中国,台湾,台中,乌日', '3', '04', '414', 'Wuri', 'WR', 'W', '120.624', '24.1045', '');
INSERT INTO `t_order_region` VALUES ('3950', '710424', '710400', '大肚区', '中国,台湾,台中市,大肚区', '大肚', '中国,台湾,台中,大肚', '3', '04', '432', 'Dadu', 'DD', 'D', '120.541', '24.1537', '');
INSERT INTO `t_order_region` VALUES ('3951', '710425', '710400', '龙井区', '中国,台湾,台中市,龙井区', '龙井', '中国,台湾,台中,龙井', '3', '04', '434', 'Longjing', 'LJ', 'L', '120.546', '24.1927', '');
INSERT INTO `t_order_region` VALUES ('3952', '710426', '710400', '雾峰区', '中国,台湾,台中市,雾峰区', '雾峰', '中国,台湾,台中,雾峰', '3', '04', '413', 'Wufeng', 'WF', 'W', '120.7', '24.0615', '');
INSERT INTO `t_order_region` VALUES ('3953', '710427', '710400', '太平区', '中国,台湾,台中市,太平区', '太平', '中国,台湾,台中,太平', '3', '04', '411', 'Taiping', 'TP', 'T', '120.719', '24.1265', '');
INSERT INTO `t_order_region` VALUES ('3954', '710428', '710400', '大里区', '中国,台湾,台中市,大里区', '大里', '中国,台湾,台中,大里', '3', '04', '412', 'Dali', 'DL', 'D', '120.678', '24.0994', '');
INSERT INTO `t_order_region` VALUES ('3955', '710429', '710400', '和平区', '中国,台湾,台中市,和平区', '和平', '中国,台湾,台中,和平', '3', '04', '424', 'Heping', 'HP', 'H', '120.883', '24.1748', '');
INSERT INTO `t_order_region` VALUES ('3956', '710500', '710000', '台南市', '中国,台湾,台南市', '台南', '中国,台湾,台南', '2', '06', '7', 'Tainan', 'TN', 'T', '120.279', '23.1725', '');
INSERT INTO `t_order_region` VALUES ('3957', '710501', '710500', '东区', '中国,台湾,台南市,东区', '东区', '中国,台湾,台南,东区', '3', '06', '701', 'Dongqu', 'DQ', 'D', '120.224', '22.9801', '');
INSERT INTO `t_order_region` VALUES ('3958', '710502', '710500', '南区', '中国,台湾,台南市,南区', '南区', '中国,台湾,台南,南区', '3', '06', '702', 'Nanqu', 'NQ', 'N', '120.189', '22.9609', '');
INSERT INTO `t_order_region` VALUES ('3959', '710504', '710500', '北区', '中国,台湾,台南市,北区', '北区', '中国,台湾,台南,北区', '3', '06', '704', 'Beiqu', 'BQ', 'B', '120.682', '24.166', '');
INSERT INTO `t_order_region` VALUES ('3960', '710506', '710500', '安南区', '中国,台湾,台南市,安南区', '安南', '中国,台湾,台南,安南', '3', '06', '709', 'Annan', 'AN', 'A', '120.185', '23.0472', '');
INSERT INTO `t_order_region` VALUES ('3961', '710507', '710500', '安平区', '中国,台湾,台南市,安平区', '安平', '中国,台湾,台南,安平', '3', '06', '708', 'Anping', 'AP', 'A', '120.167', '23.0008', '');
INSERT INTO `t_order_region` VALUES ('3962', '710508', '710500', '中西区', '中国,台湾,台南市,中西区', '中西', '中国,台湾,台南,中西', '3', '06', '700', 'Zhongxi', 'ZX', 'Z', '120.206', '22.9922', '');
INSERT INTO `t_order_region` VALUES ('3963', '710509', '710500', '新营区', '中国,台湾,台南市,新营区', '新营', '中国,台湾,台南,新营', '3', '06', '730', 'Xinying', 'XY', 'X', '120.317', '23.3103', '');
INSERT INTO `t_order_region` VALUES ('3964', '710510', '710500', '盐水区', '中国,台湾,台南市,盐水区', '盐水', '中国,台湾,台南,盐水', '3', '06', '737', 'Yanshui', 'YS', 'Y', '120.266', '23.3198', '');
INSERT INTO `t_order_region` VALUES ('3965', '710511', '710500', '白河区', '中国,台湾,台南市,白河区', '白河', '中国,台湾,台南,白河', '3', '06', '732', 'Baihe', 'BH', 'B', '120.416', '23.3512', '');
INSERT INTO `t_order_region` VALUES ('3966', '710512', '710500', '柳营区', '中国,台湾,台南市,柳营区', '柳营', '中国,台湾,台南,柳营', '3', '06', '736', 'Liuying', 'LY', 'L', '120.311', '23.2781', '');
INSERT INTO `t_order_region` VALUES ('3967', '710513', '710500', '后壁区', '中国,台湾,台南市,后壁区', '后壁', '中国,台湾,台南,后壁', '3', '06', '731', 'Houbi', 'HB', 'H', '120.363', '23.3667', '');
INSERT INTO `t_order_region` VALUES ('3968', '710514', '710500', '东山区', '中国,台湾,台南市,东山区', '东山', '中国,台湾,台南,东山', '3', '06', '733', 'Dongshan', 'DS', 'D', '120.404', '23.3261', '');
INSERT INTO `t_order_region` VALUES ('3969', '710515', '710500', '麻豆区', '中国,台湾,台南市,麻豆区', '麻豆', '中国,台湾,台南,麻豆', '3', '06', '721', 'Madou', 'MD', 'M', '120.248', '23.1817', '');
INSERT INTO `t_order_region` VALUES ('3970', '710516', '710500', '下营区', '中国,台湾,台南市,下营区', '下营', '中国,台湾,台南,下营', '3', '06', '735', 'Xiaying', 'XY', 'X', '120.264', '23.2354', '');
INSERT INTO `t_order_region` VALUES ('3971', '710517', '710500', '六甲区', '中国,台湾,台南市,六甲区', '六甲', '中国,台湾,台南,六甲', '3', '06', '734', 'Liujia', 'LJ', 'L', '120.348', '23.2319', '');
INSERT INTO `t_order_region` VALUES ('3972', '710518', '710500', '官田区', '中国,台湾,台南市,官田区', '官田', '中国,台湾,台南,官田', '3', '06', '720', 'Guantian', 'GT', 'G', '120.314', '23.1947', '');
INSERT INTO `t_order_region` VALUES ('3973', '710519', '710500', '大内区', '中国,台湾,台南市,大内区', '大内', '中国,台湾,台南,大内', '3', '06', '742', 'Dana', 'DN', 'D', '120.349', '23.1195', '');
INSERT INTO `t_order_region` VALUES ('3974', '710520', '710500', '佳里区', '中国,台湾,台南市,佳里区', '佳里', '中国,台湾,台南,佳里', '3', '06', '722', 'Jiali', 'JL', 'J', '120.177', '23.1651', '');
INSERT INTO `t_order_region` VALUES ('3975', '710521', '710500', '学甲区', '中国,台湾,台南市,学甲区', '学甲', '中国,台湾,台南,学甲', '3', '06', '726', 'Xuejia', 'XJ', 'X', '120.18', '23.2323', '');
INSERT INTO `t_order_region` VALUES ('3976', '710522', '710500', '西港区', '中国,台湾,台南市,西港区', '西港', '中国,台湾,台南,西港', '3', '06', '723', 'Xigang', 'XG', 'X', '120.204', '23.1231', '');
INSERT INTO `t_order_region` VALUES ('3977', '710523', '710500', '七股区', '中国,台湾,台南市,七股区', '七股', '中国,台湾,台南,七股', '3', '06', '724', 'Qigu', 'QG', 'Q', '120.14', '23.1405', '');
INSERT INTO `t_order_region` VALUES ('3978', '710524', '710500', '将军区', '中国,台湾,台南市,将军区', '将军', '中国,台湾,台南,将军', '3', '06', '725', 'Jiangjun', 'JJ', 'J', '120.157', '23.1995', '');
INSERT INTO `t_order_region` VALUES ('3979', '710525', '710500', '北门区', '中国,台湾,台南市,北门区', '北门', '中国,台湾,台南,北门', '3', '06', '727', 'Beimen', 'BM', 'B', '120.126', '23.2671', '');
INSERT INTO `t_order_region` VALUES ('3980', '710526', '710500', '新化区', '中国,台湾,台南市,新化区', '新化', '中国,台湾,台南,新化', '3', '06', '712', 'Xinhua', 'XH', 'X', '120.311', '23.0385', '');
INSERT INTO `t_order_region` VALUES ('3981', '710527', '710500', '善化区', '中国,台湾,台南市,善化区', '善化', '中国,台湾,台南,善化', '3', '06', '741', 'Shanhua', 'SH', 'S', '120.297', '23.1323', '');
INSERT INTO `t_order_region` VALUES ('3982', '710528', '710500', '新市区', '中国,台湾,台南市,新市区', '新市', '中国,台湾,台南,新市', '3', '06', '744', 'Xinshi', 'XS', 'X', '120.295', '23.079', '');
INSERT INTO `t_order_region` VALUES ('3983', '710529', '710500', '安定区', '中国,台湾,台南市,安定区', '安定', '中国,台湾,台南,安定', '3', '06', '745', 'Anding', 'AD', 'A', '120.237', '23.1215', '');
INSERT INTO `t_order_region` VALUES ('3984', '710530', '710500', '山上区', '中国,台湾,台南市,山上区', '山上', '中国,台湾,台南,山上', '3', '06', '743', 'Shanshang', 'SS', 'S', '120.353', '23.1032', '');
INSERT INTO `t_order_region` VALUES ('3985', '710531', '710500', '玉井区', '中国,台湾,台南市,玉井区', '玉井', '中国,台湾,台南,玉井', '3', '06', '714', 'Yujing', 'YJ', 'Y', '120.46', '23.1239', '');
INSERT INTO `t_order_region` VALUES ('3986', '710532', '710500', '楠西区', '中国,台湾,台南市,楠西区', '楠西', '中国,台湾,台南,楠西', '3', '06', '715', 'Nanxi', 'NX', 'N', '120.485', '23.1735', '');
INSERT INTO `t_order_region` VALUES ('3987', '710533', '710500', '南化区', '中国,台湾,台南市,南化区', '南化', '中国,台湾,台南,南化', '3', '06', '716', 'Nanhua', 'NH', 'N', '120.477', '23.0426', '');
INSERT INTO `t_order_region` VALUES ('3988', '710534', '710500', '左镇区', '中国,台湾,台南市,左镇区', '左镇', '中国,台湾,台南,左镇', '3', '06', '713', 'Zuozhen', 'ZZ', 'Z', '120.407', '23.058', '');
INSERT INTO `t_order_region` VALUES ('3989', '710535', '710500', '仁德区', '中国,台湾,台南市,仁德区', '仁德', '中国,台湾,台南,仁德', '3', '06', '717', 'Rende', 'RD', 'R', '120.252', '22.9722', '');
INSERT INTO `t_order_region` VALUES ('3990', '710536', '710500', '归仁区', '中国,台湾,台南市,归仁区', '归仁', '中国,台湾,台南,归仁', '3', '06', '711', 'Guiren', 'GR', 'G', '120.294', '22.9671', '');
INSERT INTO `t_order_region` VALUES ('3991', '710537', '710500', '关庙区', '中国,台湾,台南市,关庙区', '关庙', '中国,台湾,台南,关庙', '3', '06', '718', 'Guanmiao', 'GM', 'G', '120.328', '22.9629', '');
INSERT INTO `t_order_region` VALUES ('3992', '710538', '710500', '龙崎区', '中国,台湾,台南市,龙崎区', '龙崎', '中国,台湾,台南,龙崎', '3', '06', '719', 'Longqi', 'LQ', 'L', '120.361', '22.9657', '');
INSERT INTO `t_order_region` VALUES ('3993', '710539', '710500', '永康区', '中国,台湾,台南市,永康区', '永康', '中国,台湾,台南,永康', '3', '06', '710', 'Yongkang', 'YK', 'Y', '120.257', '23.0261', '');
INSERT INTO `t_order_region` VALUES ('3994', '710600', '710000', '新竹市', '中国,台湾,新竹市', '新竹', '中国,台湾,新竹', '2', '03', '3', 'Hsinchu', 'XZ', 'H', '120.969', '24.8067', '');
INSERT INTO `t_order_region` VALUES ('3995', '710601', '710600', '东区', '中国,台湾,新竹市,东区', '东区', '中国,台湾,新竹,东区', '3', '03', '300', 'Dongqu', 'DQ', 'D', '120.97', '24.8013', '');
INSERT INTO `t_order_region` VALUES ('3996', '710602', '710600', '北区', '中国,台湾,新竹市,北区', '北区', '中国,台湾,新竹,北区', '3', '03', '', 'Beiqu', 'BQ', 'B', '120.682', '24.166', '');
INSERT INTO `t_order_region` VALUES ('3997', '710603', '710600', '香山区', '中国,台湾,新竹市,香山区', '香山', '中国,台湾,新竹,香山', '3', '03', '', 'Xiangshan', 'XS', 'X', '120.957', '24.7689', '');
INSERT INTO `t_order_region` VALUES ('3998', '710700', '710000', '嘉义市', '中国,台湾,嘉义市', '嘉义', '中国,台湾,嘉义', '2', '05', '6', 'Chiayi', 'JY', 'C', '120.453', '23.4816', '');
INSERT INTO `t_order_region` VALUES ('3999', '710701', '710700', '东区', '中国,台湾,嘉义市,东区', '东区', '中国,台湾,嘉义,东区', '3', '05', '600', 'Dongqu', 'DQ', 'D', '120.458', '23.4862', '');
INSERT INTO `t_order_region` VALUES ('4000', '710702', '710700', '西区', '中国,台湾,嘉义市,西区', '西区', '中国,台湾,嘉义,西区', '3', '05', '600', 'Xiqu', 'XQ', 'X', '120.437', '23.473', '');
INSERT INTO `t_order_region` VALUES ('4001', '710800', '710000', '新北市', '中国,台湾,新北市', '新北', '中国,台湾,新北', '2', '02', '2', 'New Taipei', 'XB', 'N', '121.466', '25.0124', '');
INSERT INTO `t_order_region` VALUES ('4002', '710801', '710800', '板桥区', '中国,台湾,新北市,板桥区', '板桥', '中国,台湾,新北,板桥', '3', '02', '220', 'Banqiao', 'BQ', 'B', '121.459', '25.0096', '');
INSERT INTO `t_order_region` VALUES ('4003', '710802', '710800', '三重区', '中国,台湾,新北市,三重区', '三重', '中国,台湾,新北,三重', '3', '02', '241', 'Sanzhong', 'SZ', 'S', '121.488', '25.0615', '');
INSERT INTO `t_order_region` VALUES ('4004', '710803', '710800', '中和区', '中国,台湾,新北市,中和区', '中和', '中国,台湾,新北,中和', '3', '02', '235', 'Zhonghe', 'ZH', 'Z', '121.499', '24.9994', '');
INSERT INTO `t_order_region` VALUES ('4005', '710804', '710800', '永和区', '中国,台湾,新北市,永和区', '永和', '中国,台湾,新北,永和', '3', '02', '234', 'Yonghe', 'YH', 'Y', '121.514', '25.0078', '');
INSERT INTO `t_order_region` VALUES ('4006', '710805', '710800', '新庄区', '中国,台湾,新北市,新庄区', '新庄', '中国,台湾,新北,新庄', '3', '02', '242', 'Xinzhuang', 'XZ', 'X', '121.45', '25.0359', '');
INSERT INTO `t_order_region` VALUES ('4007', '710806', '710800', '新店区', '中国,台湾,新北市,新店区', '新店', '中国,台湾,新北,新店', '3', '02', '231', 'Xindian', 'XD', 'X', '121.542', '24.9676', '');
INSERT INTO `t_order_region` VALUES ('4008', '710807', '710800', '树林区', '中国,台湾,新北市,树林区', '树林', '中国,台湾,新北,树林', '3', '02', '238', 'Shulin', 'SL', 'S', '121.421', '24.9907', '');
INSERT INTO `t_order_region` VALUES ('4009', '710808', '710800', '莺歌区', '中国,台湾,新北市,莺歌区', '莺歌', '中国,台湾,新北,莺歌', '3', '02', '239', 'Yingge', 'YG', 'Y', '121.355', '24.9554', '');
INSERT INTO `t_order_region` VALUES ('4010', '710809', '710800', '三峡区', '中国,台湾,新北市,三峡区', '三峡', '中国,台湾,新北,三峡', '3', '02', '237', 'Sanxia', 'SX', 'S', '121.369', '24.9343', '');
INSERT INTO `t_order_region` VALUES ('4011', '710810', '710800', '淡水区', '中国,台湾,新北市,淡水区', '淡水', '中国,台湾,新北,淡水', '3', '02', '251', 'Danshui', 'DS', 'D', '121.441', '25.1695', '');
INSERT INTO `t_order_region` VALUES ('4012', '710811', '710800', '汐止区', '中国,台湾,新北市,汐止区', '汐止', '中国,台湾,新北,汐止', '3', '02', '221', 'Xizhi', 'XZ', 'X', '121.629', '25.063', '');
INSERT INTO `t_order_region` VALUES ('4013', '710812', '710800', '瑞芳区', '中国,台湾,新北市,瑞芳区', '瑞芳', '中国,台湾,新北,瑞芳', '3', '02', '224', 'Ruifang', 'RF', 'R', '121.81', '25.1089', '');
INSERT INTO `t_order_region` VALUES ('4014', '710813', '710800', '土城区', '中国,台湾,新北市,土城区', '土城', '中国,台湾,新北,土城', '3', '02', '236', 'Tucheng', 'TC', 'T', '121.443', '24.9722', '');
INSERT INTO `t_order_region` VALUES ('4015', '710814', '710800', '芦洲区', '中国,台湾,新北市,芦洲区', '芦洲', '中国,台湾,新北,芦洲', '3', '02', '247', 'Luzhou', 'LZ', 'L', '121.474', '25.0849', '');
INSERT INTO `t_order_region` VALUES ('4016', '710815', '710800', '五股区', '中国,台湾,新北市,五股区', '五股', '中国,台湾,新北,五股', '3', '02', '248', 'Wugu', 'WG', 'W', '121.438', '25.0827', '');
INSERT INTO `t_order_region` VALUES ('4017', '710816', '710800', '泰山区', '中国,台湾,新北市,泰山区', '泰山', '中国,台湾,新北,泰山', '3', '02', '243', 'Taishan', 'TS', 'T', '121.431', '25.0589', '');
INSERT INTO `t_order_region` VALUES ('4018', '710817', '710800', '林口区', '中国,台湾,新北市,林口区', '林口', '中国,台湾,新北,林口', '3', '02', '244', 'Linkou', 'LK', 'L', '121.392', '25.0775', '');
INSERT INTO `t_order_region` VALUES ('4019', '710818', '710800', '深坑区', '中国,台湾,新北市,深坑区', '深坑', '中国,台湾,新北,深坑', '3', '02', '222', 'Shenkeng', 'SK', 'S', '121.616', '25.0023', '');
INSERT INTO `t_order_region` VALUES ('4020', '710819', '710800', '石碇区', '中国,台湾,新北市,石碇区', '石碇', '中国,台湾,新北,石碇', '3', '02', '223', 'Shiding', 'SD', 'S', '121.659', '24.9917', '');
INSERT INTO `t_order_region` VALUES ('4021', '710820', '710800', '坪林区', '中国,台湾,新北市,坪林区', '坪林', '中国,台湾,新北,坪林', '3', '02', '232', 'Pinglin', 'PL', 'P', '121.711', '24.9374', '');
INSERT INTO `t_order_region` VALUES ('4022', '710821', '710800', '三芝区', '中国,台湾,新北市,三芝区', '三芝', '中国,台湾,新北,三芝', '3', '02', '252', 'Sanzhi', 'SZ', 'S', '121.501', '25.258', '');
INSERT INTO `t_order_region` VALUES ('4023', '710822', '710800', '石门区', '中国,台湾,新北市,石门区', '石门', '中国,台湾,新北,石门', '3', '02', '253', 'Shimen', 'SM', 'S', '121.568', '25.2904', '');
INSERT INTO `t_order_region` VALUES ('4024', '710823', '710800', '八里区', '中国,台湾,新北市,八里区', '八里', '中国,台湾,新北,八里', '3', '02', '249', 'Bali', 'BL', 'B', '121.398', '25.1467', '');
INSERT INTO `t_order_region` VALUES ('4025', '710824', '710800', '平溪区', '中国,台湾,新北市,平溪区', '平溪', '中国,台湾,新北,平溪', '3', '02', '226', 'Pingxi', 'PX', 'P', '121.738', '25.0257', '');
INSERT INTO `t_order_region` VALUES ('4026', '710825', '710800', '双溪区', '中国,台湾,新北市,双溪区', '双溪', '中国,台湾,新北,双溪', '3', '02', '227', 'Shuangxi', 'SX', 'S', '121.866', '25.0334', '');
INSERT INTO `t_order_region` VALUES ('4027', '710826', '710800', '贡寮区', '中国,台湾,新北市,贡寮区', '贡寮', '中国,台湾,新北,贡寮', '3', '02', '228', 'Gongliao', 'GL', 'G', '121.908', '25.0224', '');
INSERT INTO `t_order_region` VALUES ('4028', '710827', '710800', '金山区', '中国,台湾,新北市,金山区', '金山', '中国,台湾,新北,金山', '3', '02', '208', 'Jinshan', 'JS', 'J', '121.636', '25.2219', '');
INSERT INTO `t_order_region` VALUES ('4029', '710828', '710800', '万里区', '中国,台湾,新北市,万里区', '万里', '中国,台湾,新北,万里', '3', '02', '207', 'Wanli', 'WL', 'W', '121.689', '25.1812', '');
INSERT INTO `t_order_region` VALUES ('4030', '710829', '710800', '乌来区', '中国,台湾,新北市,乌来区', '乌来', '中国,台湾,新北,乌来', '3', '02', '233', 'Wulai', 'WL', 'W', '121.551', '24.8653', '');
INSERT INTO `t_order_region` VALUES ('4031', '712200', '710000', '宜兰县', '中国,台湾,宜兰县', '宜兰', '中国,台湾,宜兰', '2', '03', '2', 'Yilan', 'YL', 'Y', '121.5', '24.6', '');
INSERT INTO `t_order_region` VALUES ('4032', '712201', '712200', '宜兰市', '中国,台湾,宜兰县,宜兰市', '宜兰', '中国,台湾,宜兰,宜兰', '3', '03', '260', 'Yilan', 'YL', 'Y', '121.753', '24.7517', '');
INSERT INTO `t_order_region` VALUES ('4033', '712221', '712200', '罗东镇', '中国,台湾,宜兰县,罗东镇', '罗东', '中国,台湾,宜兰,罗东', '3', '03', '265', 'Luodong', 'LD', 'L', '121.767', '24.677', '');
INSERT INTO `t_order_region` VALUES ('4034', '712222', '712200', '苏澳镇', '中国,台湾,宜兰县,苏澳镇', '苏澳', '中国,台湾,宜兰,苏澳', '3', '03', '270', 'Suao', 'SA', 'S', '121.843', '24.5946', '');
INSERT INTO `t_order_region` VALUES ('4035', '712223', '712200', '头城镇', '中国,台湾,宜兰县,头城镇', '头城', '中国,台湾,宜兰,头城', '3', '03', '261', 'Toucheng', 'TC', 'T', '121.823', '24.8592', '');
INSERT INTO `t_order_region` VALUES ('4036', '712224', '712200', '礁溪乡', '中国,台湾,宜兰县,礁溪乡', '礁溪', '中国,台湾,宜兰,礁溪', '3', '03', '262', 'Jiaoxi', 'JX', 'J', '121.767', '24.8223', '');
INSERT INTO `t_order_region` VALUES ('4037', '712225', '712200', '壮围乡', '中国,台湾,宜兰县,壮围乡', '壮围', '中国,台湾,宜兰,壮围', '3', '03', '263', 'Zhuangwei', 'ZW', 'Z', '121.782', '24.7449', '');
INSERT INTO `t_order_region` VALUES ('4038', '712226', '712200', '员山乡', '中国,台湾,宜兰县,员山乡', '员山', '中国,台湾,宜兰,员山', '3', '03', '264', 'Yuanshan', 'YS', 'Y', '121.722', '24.7418', '');
INSERT INTO `t_order_region` VALUES ('4039', '712227', '712200', '冬山乡', '中国,台湾,宜兰县,冬山乡', '冬山', '中国,台湾,宜兰,冬山', '3', '03', '269', 'Dongshan', 'DS', 'D', '121.792', '24.6345', '');
INSERT INTO `t_order_region` VALUES ('4040', '712228', '712200', '五结乡', '中国,台湾,宜兰县,五结乡', '五结', '中国,台湾,宜兰,五结', '3', '03', '268', 'Wujie', 'WJ', 'W', '121.798', '24.6846', '');
INSERT INTO `t_order_region` VALUES ('4041', '712229', '712200', '三星乡', '中国,台湾,宜兰县,三星乡', '三星', '中国,台湾,宜兰,三星', '3', '03', '266', 'Sanxing', 'SX', 'S', '121.003', '23.7753', '');
INSERT INTO `t_order_region` VALUES ('4042', '712230', '712200', '大同乡', '中国,台湾,宜兰县,大同乡', '大同', '中国,台湾,宜兰,大同', '3', '03', '267', 'Datong', 'DT', 'D', '121.606', '24.676', '');
INSERT INTO `t_order_region` VALUES ('4043', '712231', '712200', '南澳乡', '中国,台湾,宜兰县,南澳乡', '南澳', '中国,台湾,宜兰,南澳', '3', '03', '272', 'Nanao', 'NA', 'N', '121.8', '24.4654', '');
INSERT INTO `t_order_region` VALUES ('4044', '712300', '710000', '桃园市', '中国,台湾,桃园市', '桃园', '中国,台湾,桃园', '2', '03', '3', 'Taoyuan', 'TY', 'T', '121.083', '25', '');
INSERT INTO `t_order_region` VALUES ('4045', '712301', '712300', '桃园市', '中国,台湾,桃园市,桃园区', '桃园', '中国,台湾,桃园,桃园', '3', '03', '330', 'Taoyuan', 'TY', 'T', '121.301', '24.9938', '');
INSERT INTO `t_order_region` VALUES ('4046', '712302', '712300', '中坜市', '中国,台湾,桃园市,中坜区', '中坜', '中国,台湾,桃园,中坜', '3', '03', '320', 'Zhongli', 'ZL', 'Z', '121.225', '24.9654', '');
INSERT INTO `t_order_region` VALUES ('4047', '712303', '712300', '平镇市', '中国,台湾,桃园市,平镇区', '平镇', '中国,台湾,桃园,平镇', '3', '03', '324', 'Pingzhen', 'PZ', 'P', '121.218', '24.9458', '');
INSERT INTO `t_order_region` VALUES ('4048', '712304', '712300', '八德市', '中国,台湾,桃园市,八德区', '八德', '中国,台湾,桃园,八德', '3', '03', '334', 'Bade', 'BD', 'B', '121.285', '24.9287', '');
INSERT INTO `t_order_region` VALUES ('4049', '712305', '712300', '杨梅市', '中国,台湾,桃园市,杨梅区', '杨梅', '中国,台湾,桃园,杨梅', '3', '03', '326', 'Yangmei', 'YM', 'Y', '121.146', '24.9076', '');
INSERT INTO `t_order_region` VALUES ('4050', '712306', '712300', '芦竹市', '中国,台湾,桃园市,芦竹区', '芦竹', '中国,台湾,桃园,芦竹', '3', '03', '338', 'Luzhu', 'LZ', 'L', '121.292', '25.0454', '');
INSERT INTO `t_order_region` VALUES ('4051', '712321', '712300', '大溪镇', '中国,台湾,桃园市,大溪区', '大溪', '中国,台湾,桃园,大溪', '3', '03', '335', 'Daxi', 'DX', 'D', '121.287', '24.8806', '');
INSERT INTO `t_order_region` VALUES ('4052', '712324', '712300', '大园乡', '中国,台湾,桃园市,大园区', '大园', '中国,台湾,桃园,大园', '3', '03', '337', 'Dayuan', 'DY', 'D', '121.196', '25.0645', '');
INSERT INTO `t_order_region` VALUES ('4053', '712325', '712300', '龟山乡', '中国,台湾,桃园市,龟山区', '龟山', '中国,台湾,桃园,龟山', '3', '03', '333', 'Guishan', 'GS', 'G', '121.338', '24.9925', '');
INSERT INTO `t_order_region` VALUES ('4054', '712327', '712300', '龙潭乡', '中国,台湾,桃园市,龙潭区', '龙潭', '中国,台湾,桃园,龙潭', '3', '03', '325', 'Longtan', 'LT', 'L', '121.216', '24.8639', '');
INSERT INTO `t_order_region` VALUES ('4055', '712329', '712300', '新屋乡', '中国,台湾,桃园市,新屋区', '新屋', '中国,台湾,桃园,新屋', '3', '03', '327', 'Xinwu', 'XW', 'X', '121.106', '24.9722', '');
INSERT INTO `t_order_region` VALUES ('4056', '712330', '712300', '观音乡', '中国,台湾,桃园市,观音区', '观音', '中国,台湾,桃园,观音', '3', '03', '328', 'Guanyin', 'GY', 'G', '121.078', '25.0333', '');
INSERT INTO `t_order_region` VALUES ('4057', '712331', '712300', '复兴乡', '中国,台湾,桃园市,复兴区', '复兴', '中国,台湾,桃园,复兴', '3', '03', '336', 'Fuxing', 'FX', 'F', '121.353', '24.8209', '');
INSERT INTO `t_order_region` VALUES ('4058', '712400', '710000', '新竹县', '中国,台湾,新竹县', '新竹', '中国,台湾,新竹', '2', '03', '3', 'Hsinchu', 'XZ', 'H', '121.16', '24.6', '');
INSERT INTO `t_order_region` VALUES ('4059', '712401', '712400', '竹北市', '中国,台湾,新竹县,竹北市', '竹北', '中国,台湾,新竹,竹北', '3', '03', '302', 'Zhubei', 'ZB', 'Z', '121.004', '24.8397', '');
INSERT INTO `t_order_region` VALUES ('4060', '712421', '712400', '竹东镇', '中国,台湾,新竹县,竹东镇', '竹东', '中国,台湾,新竹,竹东', '3', '03', '310', 'Zhudong', 'ZD', 'Z', '121.086', '24.7336', '');
INSERT INTO `t_order_region` VALUES ('4061', '712422', '712400', '新埔镇', '中国,台湾,新竹县,新埔镇', '新埔', '中国,台湾,新竹,新埔', '3', '03', '305', 'Xinpu', 'XP', 'X', '121.073', '24.8248', '');
INSERT INTO `t_order_region` VALUES ('4062', '712423', '712400', '关西镇', '中国,台湾,新竹县,关西镇', '关西', '中国,台湾,新竹,关西', '3', '03', '306', 'Guanxi', 'GX', 'G', '121.177', '24.7888', '');
INSERT INTO `t_order_region` VALUES ('4063', '712424', '712400', '湖口乡', '中国,台湾,新竹县,湖口乡', '湖口', '中国,台湾,新竹,湖口', '3', '03', '303', 'Hukou', 'HK', 'H', '121.044', '24.9039', '');
INSERT INTO `t_order_region` VALUES ('4064', '712425', '712400', '新丰乡', '中国,台湾,新竹县,新丰乡', '新丰', '中国,台湾,新竹,新丰', '3', '03', '304', 'Xinfeng', 'XF', 'X', '120.983', '24.8996', '');
INSERT INTO `t_order_region` VALUES ('4065', '712426', '712400', '芎林乡', '中国,台湾,新竹县,芎林乡', '芎林', '中国,台湾,新竹,芎林', '3', '03', '307', 'Xionglin', 'XL', 'X', '121.077', '24.7744', '');
INSERT INTO `t_order_region` VALUES ('4066', '712427', '712400', '横山乡', '中国,台湾,新竹县,横山乡', '横山', '中国,台湾,新竹,横山', '3', '03', '312', 'Hengshan', 'HS', 'H', '121.116', '24.7208', '');
INSERT INTO `t_order_region` VALUES ('4067', '712428', '712400', '北埔乡', '中国,台湾,新竹县,北埔乡', '北埔', '中国,台湾,新竹,北埔', '3', '03', '314', 'Beipu', 'BP', 'B', '121.053', '24.6971', '');
INSERT INTO `t_order_region` VALUES ('4068', '712429', '712400', '宝山乡', '中国,台湾,新竹县,宝山乡', '宝山', '中国,台湾,新竹,宝山', '3', '03', '308', 'Baoshan', 'BS', 'B', '120.986', '24.761', '');
INSERT INTO `t_order_region` VALUES ('4069', '712430', '712400', '峨眉乡', '中国,台湾,新竹县,峨眉乡', '峨眉', '中国,台湾,新竹,峨眉', '3', '03', '315', 'Emei', 'EM', 'E', '121.015', '24.6861', '');
INSERT INTO `t_order_region` VALUES ('4070', '712431', '712400', '尖石乡', '中国,台湾,新竹县,尖石乡', '尖石', '中国,台湾,新竹,尖石', '3', '03', '313', 'Jianshi', 'JS', 'J', '121.198', '24.7044', '');
INSERT INTO `t_order_region` VALUES ('4071', '712432', '712400', '五峰乡', '中国,台湾,新竹县,五峰乡', '五峰', '中国,台湾,新竹,五峰', '3', '03', '311', 'Wufeng', 'WF', 'W', '121.003', '23.7753', '');
INSERT INTO `t_order_region` VALUES ('4072', '712500', '710000', '苗栗县', '中国,台湾,苗栗县', '苗栗', '中国,台湾,苗栗', '2', '037', '3', 'Miaoli', 'ML', 'M', '120.75', '24.5', '');
INSERT INTO `t_order_region` VALUES ('4073', '712501', '712500', '苗栗市', '中国,台湾,苗栗县,苗栗市', '苗栗', '中国,台湾,苗栗,苗栗', '3', '037', '360', 'Miaoli', 'ML', 'M', '120.819', '24.5615', '');
INSERT INTO `t_order_region` VALUES ('4074', '712521', '712500', '苑里镇', '中国,台湾,苗栗县,苑里镇', '苑里', '中国,台湾,苗栗,苑里', '3', '037', '358', 'Yuanli', 'YL', 'Y', '120.649', '24.4417', '');
INSERT INTO `t_order_region` VALUES ('4075', '712522', '712500', '通霄镇', '中国,台湾,苗栗县,通霄镇', '通霄', '中国,台湾,苗栗,通霄', '3', '037', '357', 'Tongxiao', 'TX', 'T', '120.677', '24.4891', '');
INSERT INTO `t_order_region` VALUES ('4076', '712523', '712500', '竹南镇', '中国,台湾,苗栗县,竹南镇', '竹南', '中国,台湾,苗栗,竹南', '3', '037', '350', 'Zhunan', 'ZN', 'Z', '120.873', '24.6855', '');
INSERT INTO `t_order_region` VALUES ('4077', '712524', '712500', '头份市', '中国,台湾,苗栗县,头份市', '头份', '中国,台湾,苗栗,头份', '3', '037', '351', 'Toufen', 'TF', 'T', '120.895', '24.688', '');
INSERT INTO `t_order_region` VALUES ('4078', '712525', '712500', '后龙镇', '中国,台湾,苗栗县,后龙镇', '后龙', '中国,台湾,苗栗,后龙', '3', '037', '356', 'Houlong', 'HL', 'H', '120.786', '24.6126', '');
INSERT INTO `t_order_region` VALUES ('4079', '712526', '712500', '卓兰镇', '中国,台湾,苗栗县,卓兰镇', '卓兰', '中国,台湾,苗栗,卓兰', '3', '037', '369', 'Zhuolan', 'ZL', 'Z', '120.823', '24.3095', '');
INSERT INTO `t_order_region` VALUES ('4080', '712527', '712500', '大湖乡', '中国,台湾,苗栗县,大湖乡', '大湖', '中国,台湾,苗栗,大湖', '3', '037', '364', 'Dahu', 'DH', 'D', '120.864', '24.4225', '');
INSERT INTO `t_order_region` VALUES ('4081', '712528', '712500', '公馆乡', '中国,台湾,苗栗县,公馆乡', '公馆', '中国,台湾,苗栗,公馆', '3', '037', '363', 'Gongguan', 'GG', 'G', '120.823', '24.4991', '');
INSERT INTO `t_order_region` VALUES ('4082', '712529', '712500', '铜锣乡', '中国,台湾,苗栗县,铜锣乡', '铜锣', '中国,台湾,苗栗,铜锣', '3', '037', '366', 'Tongluo', 'TL', 'T', '121.003', '23.7753', '');
INSERT INTO `t_order_region` VALUES ('4083', '712530', '712500', '南庄乡', '中国,台湾,苗栗县,南庄乡', '南庄', '中国,台湾,苗栗,南庄', '3', '037', '353', 'Nanzhuang', 'NZ', 'N', '120.995', '24.5968', '');
INSERT INTO `t_order_region` VALUES ('4084', '712531', '712500', '头屋乡', '中国,台湾,苗栗县,头屋乡', '头屋', '中国,台湾,苗栗,头屋', '3', '037', '362', 'Touwu', 'TW', 'T', '120.847', '24.5742', '');
INSERT INTO `t_order_region` VALUES ('4085', '712532', '712500', '三义乡', '中国,台湾,苗栗县,三义乡', '三义', '中国,台湾,苗栗,三义', '3', '037', '367', 'Sanyi', 'SY', 'S', '120.742', '24.3503', '');
INSERT INTO `t_order_region` VALUES ('4086', '712533', '712500', '西湖乡', '中国,台湾,苗栗县,西湖乡', '西湖', '中国,台湾,苗栗,西湖', '3', '037', '368', 'Xihu', 'XH', 'X', '121.003', '23.7753', '');
INSERT INTO `t_order_region` VALUES ('4087', '712534', '712500', '造桥乡', '中国,台湾,苗栗县,造桥乡', '造桥', '中国,台湾,苗栗,造桥', '3', '037', '361', 'Zaoqiao', 'ZQ', 'Z', '120.862', '24.6375', '');
INSERT INTO `t_order_region` VALUES ('4088', '712535', '712500', '三湾乡', '中国,台湾,苗栗县,三湾乡', '三湾', '中国,台湾,苗栗,三湾', '3', '037', '352', 'Sanwan', 'SW', 'S', '120.951', '24.6511', '');
INSERT INTO `t_order_region` VALUES ('4089', '712536', '712500', '狮潭乡', '中国,台湾,苗栗县,狮潭乡', '狮潭', '中国,台湾,苗栗,狮潭', '3', '037', '354', 'Shitan', 'ST', 'S', '120.918', '24.54', '');
INSERT INTO `t_order_region` VALUES ('4090', '712537', '712500', '泰安乡', '中国,台湾,苗栗县,泰安乡', '泰安', '中国,台湾,苗栗,泰安', '3', '037', '365', 'Tai\'an', 'TA', 'T', '120.904', '24.4426', '');
INSERT INTO `t_order_region` VALUES ('4091', '712700', '710000', '彰化县', '中国,台湾,彰化县', '彰化', '中国,台湾,彰化', '2', '04', '5', 'Changhua', 'ZH', 'C', '120.416', '24', '');
INSERT INTO `t_order_region` VALUES ('4092', '712701', '712700', '彰化市', '中国,台湾,彰化县,彰化市', '彰化市', '中国,台湾,彰化,彰化市', '3', '04', '500', 'Zhanghuashi', 'ZHS', 'Z', '120.542', '24.0809', '');
INSERT INTO `t_order_region` VALUES ('4093', '712721', '712700', '鹿港镇', '中国,台湾,彰化县,鹿港镇', '鹿港', '中国,台湾,彰化,鹿港', '3', '04', '505', 'Lugang', 'LG', 'L', '120.435', '24.0569', '');
INSERT INTO `t_order_region` VALUES ('4094', '712722', '712700', '和美镇', '中国,台湾,彰化县,和美镇', '和美', '中国,台湾,彰化,和美', '3', '04', '508', 'Hemei', 'HM', 'H', '120.5', '24.1109', '');
INSERT INTO `t_order_region` VALUES ('4095', '712723', '712700', '线西乡', '中国,台湾,彰化县,线西乡', '线西', '中国,台湾,彰化,线西', '3', '04', '507', 'Xianxi', 'XX', 'X', '120.466', '24.1287', '');
INSERT INTO `t_order_region` VALUES ('4096', '712724', '712700', '伸港乡', '中国,台湾,彰化县,伸港乡', '伸港', '中国,台湾,彰化,伸港', '3', '04', '509', 'Shengang', 'SG', 'S', '120.484', '24.1461', '');
INSERT INTO `t_order_region` VALUES ('4097', '712725', '712700', '福兴乡', '中国,台湾,彰化县,福兴乡', '福兴', '中国,台湾,彰化,福兴', '3', '04', '506', 'Fuxing', 'FX', 'F', '120.444', '24.0479', '');
INSERT INTO `t_order_region` VALUES ('4098', '712726', '712700', '秀水乡', '中国,台湾,彰化县,秀水乡', '秀水', '中国,台湾,彰化,秀水', '3', '04', '504', 'Xiushui', 'XS', 'X', '120.503', '24.0353', '');
INSERT INTO `t_order_region` VALUES ('4099', '712727', '712700', '花坛乡', '中国,台湾,彰化县,花坛乡', '花坛', '中国,台湾,彰化,花坛', '3', '04', '503', 'Huatan', 'HT', 'H', '120.538', '24.0294', '');
INSERT INTO `t_order_region` VALUES ('4100', '712728', '712700', '芬园乡', '中国,台湾,彰化县,芬园乡', '芬园', '中国,台湾,彰化,芬园', '3', '04', '502', 'Fenyuan', 'FY', 'F', '120.629', '24.0137', '');
INSERT INTO `t_order_region` VALUES ('4101', '712729', '712700', '员林市', '中国,台湾,彰化县,员林市', '员林', '中国,台湾,彰化,员林', '3', '04', '510', 'Yuanlin', 'YL', 'Y', '120.575', '23.959', '');
INSERT INTO `t_order_region` VALUES ('4102', '712730', '712700', '溪湖镇', '中国,台湾,彰化县,溪湖镇', '溪湖', '中国,台湾,彰化,溪湖', '3', '04', '514', 'Xihu', 'XH', 'X', '120.479', '23.9623', '');
INSERT INTO `t_order_region` VALUES ('4103', '712731', '712700', '田中镇', '中国,台湾,彰化县,田中镇', '田中', '中国,台湾,彰化,田中', '3', '04', '520', 'Tianzhong', 'TZ', 'T', '120.581', '23.8617', '');
INSERT INTO `t_order_region` VALUES ('4104', '712732', '712700', '大村乡', '中国,台湾,彰化县,大村乡', '大村', '中国,台湾,彰化,大村', '3', '04', '515', 'Dacun', 'DC', 'D', '120.541', '23.9937', '');
INSERT INTO `t_order_region` VALUES ('4105', '712733', '712700', '埔盐乡', '中国,台湾,彰化县,埔盐乡', '埔盐', '中国,台湾,彰化,埔盐', '3', '04', '516', 'Puyan', 'PY', 'P', '120.464', '24.0003', '');
INSERT INTO `t_order_region` VALUES ('4106', '712734', '712700', '埔心乡', '中国,台湾,彰化县,埔心乡', '埔心', '中国,台湾,彰化,埔心', '3', '04', '513', 'Puxin', 'PX', 'P', '120.544', '23.953', '');
INSERT INTO `t_order_region` VALUES ('4107', '712735', '712700', '永靖乡', '中国,台湾,彰化县,永靖乡', '永靖', '中国,台湾,彰化,永靖', '3', '04', '512', 'Yongjing', 'YJ', 'Y', '120.548', '23.9247', '');
INSERT INTO `t_order_region` VALUES ('4108', '712736', '712700', '社头乡', '中国,台湾,彰化县,社头乡', '社头', '中国,台湾,彰化,社头', '3', '04', '511', 'Shetou', 'ST', 'S', '120.583', '23.8967', '');
INSERT INTO `t_order_region` VALUES ('4109', '712737', '712700', '二水乡', '中国,台湾,彰化县,二水乡', '二水', '中国,台湾,彰化,二水', '3', '04', '530', 'Ershui', 'ES', 'E', '120.619', '23.807', '');
INSERT INTO `t_order_region` VALUES ('4110', '712738', '712700', '北斗镇', '中国,台湾,彰化县,北斗镇', '北斗', '中国,台湾,彰化,北斗', '3', '04', '521', 'Beidou', 'BD', 'B', '120.52', '23.8709', '');
INSERT INTO `t_order_region` VALUES ('4111', '712739', '712700', '二林镇', '中国,台湾,彰化县,二林镇', '二林', '中国,台湾,彰化,二林', '3', '04', '526', 'Erlin', 'EL', 'E', '120.374', '23.8998', '');
INSERT INTO `t_order_region` VALUES ('4112', '712740', '712700', '田尾乡', '中国,台湾,彰化县,田尾乡', '田尾', '中国,台湾,彰化,田尾', '3', '04', '522', 'Tianwei', 'TW', 'T', '120.525', '23.8907', '');
INSERT INTO `t_order_region` VALUES ('4113', '712741', '712700', '埤头乡', '中国,台湾,彰化县,埤头乡', '埤头', '中国,台湾,彰化,埤头', '3', '04', '523', 'Pitou', 'PT', 'P', '120.463', '23.8913', '');
INSERT INTO `t_order_region` VALUES ('4114', '712742', '712700', '芳苑乡', '中国,台湾,彰化县,芳苑乡', '芳苑', '中国,台湾,彰化,芳苑', '3', '04', '528', 'Fangyuan', 'FY', 'F', '120.32', '23.9242', '');
INSERT INTO `t_order_region` VALUES ('4115', '712743', '712700', '大城乡', '中国,台湾,彰化县,大城乡', '大城', '中国,台湾,彰化,大城', '3', '04', '527', 'Dacheng', 'DC', 'D', '120.321', '23.8524', '');
INSERT INTO `t_order_region` VALUES ('4116', '712744', '712700', '竹塘乡', '中国,台湾,彰化县,竹塘乡', '竹塘', '中国,台湾,彰化,竹塘', '3', '04', '525', 'Zhutang', 'ZT', 'Z', '120.427', '23.8601', '');
INSERT INTO `t_order_region` VALUES ('4117', '712745', '712700', '溪州乡', '中国,台湾,彰化县,溪州乡', '溪州', '中国,台湾,彰化,溪州', '3', '04', '524', 'Xizhou', 'XZ', 'X', '120.499', '23.8512', '');
INSERT INTO `t_order_region` VALUES ('4118', '712800', '710000', '南投县', '中国,台湾,南投县', '南投', '中国,台湾,南投', '2', '049', '5', 'Nantou', 'NT', 'N', '120.83', '23.83', '');
INSERT INTO `t_order_region` VALUES ('4119', '712801', '712800', '南投市', '中国,台湾,南投县,南投市', '南投市', '中国,台湾,南投,南投市', '3', '049', '540', 'Nantoushi', 'NTS', 'N', '120.684', '23.91', '');
INSERT INTO `t_order_region` VALUES ('4120', '712821', '712800', '埔里镇', '中国,台湾,南投县,埔里镇', '埔里', '中国,台湾,南投,埔里', '3', '049', '545', 'Puli', 'PL', 'P', '120.965', '23.9648', '');
INSERT INTO `t_order_region` VALUES ('4121', '712822', '712800', '草屯镇', '中国,台湾,南投县,草屯镇', '草屯', '中国,台湾,南投,草屯', '3', '049', '542', 'Caotun', 'CT', 'C', '120.68', '23.9739', '');
INSERT INTO `t_order_region` VALUES ('4122', '712823', '712800', '竹山镇', '中国,台湾,南投县,竹山镇', '竹山', '中国,台湾,南投,竹山', '3', '049', '557', 'Zhushan', 'ZS', 'Z', '120.672', '23.7577', '');
INSERT INTO `t_order_region` VALUES ('4123', '712824', '712800', '集集镇', '中国,台湾,南投县,集集镇', '集集', '中国,台湾,南投,集集', '3', '049', '552', 'Jiji', 'JJ', 'J', '120.784', '23.829', '');
INSERT INTO `t_order_region` VALUES ('4124', '712825', '712800', '名间乡', '中国,台湾,南投县,名间乡', '名间', '中国,台湾,南投,名间', '3', '049', '551', 'Mingjian', 'MJ', 'M', '120.703', '23.8384', '');
INSERT INTO `t_order_region` VALUES ('4125', '712826', '712800', '鹿谷乡', '中国,台湾,南投县,鹿谷乡', '鹿谷', '中国,台湾,南投,鹿谷', '3', '049', '558', 'Lugu', 'LG', 'L', '120.753', '23.7445', '');
INSERT INTO `t_order_region` VALUES ('4126', '712827', '712800', '中寮乡', '中国,台湾,南投县,中寮乡', '中寮', '中国,台湾,南投,中寮', '3', '049', '541', 'Zhongliao', 'ZL', 'Z', '120.767', '23.8789', '');
INSERT INTO `t_order_region` VALUES ('4127', '712828', '712800', '鱼池乡', '中国,台湾,南投县,鱼池乡', '鱼池', '中国,台湾,南投,鱼池', '3', '049', '555', 'Yuchi', 'YC', 'Y', '120.936', '23.8964', '');
INSERT INTO `t_order_region` VALUES ('4128', '712829', '712800', '国姓乡', '中国,台湾,南投县,国姓乡', '国姓', '中国,台湾,南投,国姓', '3', '049', '544', 'Guoxing', 'GX', 'G', '120.859', '24.0423', '');
INSERT INTO `t_order_region` VALUES ('4129', '712830', '712800', '水里乡', '中国,台湾,南投县,水里乡', '水里', '中国,台湾,南投,水里', '3', '049', '553', 'Shuili', 'SL', 'S', '120.856', '23.8121', '');
INSERT INTO `t_order_region` VALUES ('4130', '712831', '712800', '信义乡', '中国,台湾,南投县,信义乡', '信义', '中国,台湾,南投,信义', '3', '049', '556', 'Xinyi', 'XY', 'X', '120.855', '23.6999', '');
INSERT INTO `t_order_region` VALUES ('4131', '712832', '712800', '仁爱乡', '中国,台湾,南投县,仁爱乡', '仁爱', '中国,台湾,南投,仁爱', '3', '049', '546', 'Renai', 'RA', 'R', '121.134', '24.0244', '');
INSERT INTO `t_order_region` VALUES ('4132', '712900', '710000', '云林县', '中国,台湾,云林县', '云林', '中国,台湾,云林', '2', '05', '6', 'Yunlin', 'YL', 'Y', '120.25', '23.75', '');
INSERT INTO `t_order_region` VALUES ('4133', '712901', '712900', '斗六市', '中国,台湾,云林县,斗六市', '斗六', '中国,台湾,云林,斗六', '3', '05', '640', 'Douliu', 'DL', 'D', '120.527', '23.6977', '');
INSERT INTO `t_order_region` VALUES ('4134', '712921', '712900', '斗南镇', '中国,台湾,云林县,斗南镇', '斗南', '中国,台湾,云林,斗南', '3', '05', '630', 'Dounan', 'DN', 'D', '120.479', '23.6797', '');
INSERT INTO `t_order_region` VALUES ('4135', '712922', '712900', '虎尾镇', '中国,台湾,云林县,虎尾镇', '虎尾', '中国,台湾,云林,虎尾', '3', '05', '632', 'Huwei', 'HW', 'H', '120.445', '23.7082', '');
INSERT INTO `t_order_region` VALUES ('4136', '712923', '712900', '西螺镇', '中国,台湾,云林县,西螺镇', '西螺', '中国,台湾,云林,西螺', '3', '05', '648', 'Xiluo', 'XL', 'X', '120.466', '23.798', '');
INSERT INTO `t_order_region` VALUES ('4137', '712924', '712900', '土库镇', '中国,台湾,云林县,土库镇', '土库', '中国,台湾,云林,土库', '3', '05', '633', 'Tuku', 'TK', 'T', '120.393', '23.6778', '');
INSERT INTO `t_order_region` VALUES ('4138', '712925', '712900', '北港镇', '中国,台湾,云林县,北港镇', '北港', '中国,台湾,云林,北港', '3', '05', '651', 'Beigang', 'BG', 'B', '120.302', '23.5755', '');
INSERT INTO `t_order_region` VALUES ('4139', '712926', '712900', '古坑乡', '中国,台湾,云林县,古坑乡', '古坑', '中国,台湾,云林,古坑', '3', '05', '646', 'Gukeng', 'GK', 'G', '120.562', '23.6426', '');
INSERT INTO `t_order_region` VALUES ('4140', '712927', '712900', '大埤乡', '中国,台湾,云林县,大埤乡', '大埤', '中国,台湾,云林,大埤', '3', '05', '631', 'Dapi', 'DP', 'D', '120.431', '23.6459', '');
INSERT INTO `t_order_region` VALUES ('4141', '712928', '712900', '莿桐乡', '中国,台湾,云林县,莿桐乡', '莿桐', '中国,台湾,云林,莿桐', '3', '05', '647', 'Citong', 'CT', 'C', '120.502', '23.7608', '');
INSERT INTO `t_order_region` VALUES ('4142', '712929', '712900', '林内乡', '中国,台湾,云林县,林内乡', '林内', '中国,台湾,云林,林内', '3', '05', '643', 'Linna', 'LN', 'L', '120.611', '23.7587', '');
INSERT INTO `t_order_region` VALUES ('4143', '712930', '712900', '二仑乡', '中国,台湾,云林县,二仑乡', '二仑', '中国,台湾,云林,二仑', '3', '05', '649', 'Erlun', 'EL', 'E', '120.415', '23.7713', '');
INSERT INTO `t_order_region` VALUES ('4144', '712931', '712900', '仑背乡', '中国,台湾,云林县,仑背乡', '仑背', '中国,台湾,云林,仑背', '3', '05', '637', 'Lunbei', 'LB', 'L', '120.354', '23.7588', '');
INSERT INTO `t_order_region` VALUES ('4145', '712932', '712900', '麦寮乡', '中国,台湾,云林县,麦寮乡', '麦寮', '中国,台湾,云林,麦寮', '3', '05', '638', 'Mailiao', 'ML', 'M', '120.252', '23.7538', '');
INSERT INTO `t_order_region` VALUES ('4146', '712933', '712900', '东势乡', '中国,台湾,云林县,东势乡', '东势', '中国,台湾,云林,东势', '3', '05', '635', 'Dongshi', 'DS', 'D', '120.253', '23.6747', '');
INSERT INTO `t_order_region` VALUES ('4147', '712934', '712900', '褒忠乡', '中国,台湾,云林县,褒忠乡', '褒忠', '中国,台湾,云林,褒忠', '3', '05', '634', 'Baozhong', 'BZ', 'B', '120.31', '23.6942', '');
INSERT INTO `t_order_region` VALUES ('4148', '712935', '712900', '台西乡', '中国,台湾,云林县,台西乡', '台西', '中国,台湾,云林,台西', '3', '05', '636', 'Taixi', 'TX', 'T', '120.196', '23.7028', '');
INSERT INTO `t_order_region` VALUES ('4149', '712936', '712900', '元长乡', '中国,台湾,云林县,元长乡', '元长', '中国,台湾,云林,元长', '3', '05', '655', 'Yuanchang', 'YC', 'Y', '120.315', '23.6495', '');
INSERT INTO `t_order_region` VALUES ('4150', '712937', '712900', '四湖乡', '中国,台湾,云林县,四湖乡', '四湖', '中国,台湾,云林,四湖', '3', '05', '654', 'Sihu', 'SH', 'S', '120.226', '23.6377', '');
INSERT INTO `t_order_region` VALUES ('4151', '712938', '712900', '口湖乡', '中国,台湾,云林县,口湖乡', '口湖', '中国,台湾,云林,口湖', '3', '05', '653', 'Kouhu', 'KH', 'K', '120.185', '23.5824', '');
INSERT INTO `t_order_region` VALUES ('4152', '712939', '712900', '水林乡', '中国,台湾,云林县,水林乡', '水林', '中国,台湾,云林,水林', '3', '05', '652', 'Shuilin', 'SL', 'S', '120.246', '23.5726', '');
INSERT INTO `t_order_region` VALUES ('4153', '713000', '710000', '嘉义县', '中国,台湾,嘉义县', '嘉义', '中国,台湾,嘉义', '2', '05', '6', 'Chiayi', 'JY', 'C', '120.3', '23.5', '');
INSERT INTO `t_order_region` VALUES ('4154', '713001', '713000', '太保市', '中国,台湾,嘉义县,太保市', '太保', '中国,台湾,嘉义,太保', '3', '05', '612', 'Taibao', 'TB', 'T', '120.333', '23.4596', '');
INSERT INTO `t_order_region` VALUES ('4155', '713002', '713000', '朴子市', '中国,台湾,嘉义县,朴子市', '朴子', '中国,台湾,嘉义,朴子', '3', '05', '613', 'Puzi', 'PZ', 'P', '120.247', '23.465', '');
INSERT INTO `t_order_region` VALUES ('4156', '713023', '713000', '布袋镇', '中国,台湾,嘉义县,布袋镇', '布袋', '中国,台湾,嘉义,布袋', '3', '05', '625', 'Budai', 'BD', 'B', '120.167', '23.378', '');
INSERT INTO `t_order_region` VALUES ('4157', '713024', '713000', '大林镇', '中国,台湾,嘉义县,大林镇', '大林', '中国,台湾,嘉义,大林', '3', '05', '622', 'Dalin', 'DL', 'D', '120.471', '23.6038', '');
INSERT INTO `t_order_region` VALUES ('4158', '713025', '713000', '民雄乡', '中国,台湾,嘉义县,民雄乡', '民雄', '中国,台湾,嘉义,民雄', '3', '05', '621', 'Minxiong', 'MX', 'M', '120.429', '23.5515', '');
INSERT INTO `t_order_region` VALUES ('4159', '713026', '713000', '溪口乡', '中国,台湾,嘉义县,溪口乡', '溪口', '中国,台湾,嘉义,溪口', '3', '05', '623', 'Xikou', 'XK', 'X', '120.394', '23.6022', '');
INSERT INTO `t_order_region` VALUES ('4160', '713027', '713000', '新港乡', '中国,台湾,嘉义县,新港乡', '新港', '中国,台湾,嘉义,新港', '3', '05', '616', 'Xingang', 'XG', 'X', '120.348', '23.5518', '');
INSERT INTO `t_order_region` VALUES ('4161', '713028', '713000', '六脚乡', '中国,台湾,嘉义县,六脚乡', '六脚', '中国,台湾,嘉义,六脚', '3', '05', '615', 'Liujiao', 'LJ', 'L', '120.291', '23.4939', '');
INSERT INTO `t_order_region` VALUES ('4162', '713029', '713000', '东石乡', '中国,台湾,嘉义县,东石乡', '东石', '中国,台湾,嘉义,东石', '3', '05', '614', 'Dongshi', 'DS', 'D', '120.154', '23.4592', '');
INSERT INTO `t_order_region` VALUES ('4163', '713030', '713000', '义竹乡', '中国,台湾,嘉义县,义竹乡', '义竹', '中国,台湾,嘉义,义竹', '3', '05', '624', 'Yizhu', 'YZ', 'Y', '120.243', '23.3363', '');
INSERT INTO `t_order_region` VALUES ('4164', '713031', '713000', '鹿草乡', '中国,台湾,嘉义县,鹿草乡', '鹿草', '中国,台湾,嘉义,鹿草', '3', '05', '611', 'Lucao', 'LC', 'L', '120.308', '23.4108', '');
INSERT INTO `t_order_region` VALUES ('4165', '713032', '713000', '水上乡', '中国,台湾,嘉义县,水上乡', '水上', '中国,台湾,嘉义,水上', '3', '05', '608', 'Shuishang', 'SS', 'S', '120.398', '23.4281', '');
INSERT INTO `t_order_region` VALUES ('4166', '713033', '713000', '中埔乡', '中国,台湾,嘉义县,中埔乡', '中埔', '中国,台湾,嘉义,中埔', '3', '05', '606', 'Zhongpu', 'ZP', 'Z', '120.523', '23.4251', '');
INSERT INTO `t_order_region` VALUES ('4167', '713034', '713000', '竹崎乡', '中国,台湾,嘉义县,竹崎乡', '竹崎', '中国,台湾,嘉义,竹崎', '3', '05', '604', 'Zhuqi', 'ZQ', 'Z', '120.551', '23.5232', '');
INSERT INTO `t_order_region` VALUES ('4168', '713035', '713000', '梅山乡', '中国,台湾,嘉义县,梅山乡', '梅山', '中国,台湾,嘉义,梅山', '3', '05', '603', 'Meishan', 'MS', 'M', '120.557', '23.5849', '');
INSERT INTO `t_order_region` VALUES ('4169', '713036', '713000', '番路乡', '中国,台湾,嘉义县,番路乡', '番路', '中国,台湾,嘉义,番路', '3', '05', '602', 'Fanlu', 'FL', 'F', '120.555', '23.4652', '');
INSERT INTO `t_order_region` VALUES ('4170', '713037', '713000', '大埔乡', '中国,台湾,嘉义县,大埔乡', '大埔', '中国,台湾,嘉义,大埔', '3', '05', '607', 'Dapu', 'DP', 'D', '120.594', '23.2967', '');
INSERT INTO `t_order_region` VALUES ('4171', '713038', '713000', '阿里山乡', '中国,台湾,嘉义县,阿里山乡', '阿里山', '中国,台湾,嘉义,阿里山', '3', '05', '605', 'Alishan', 'ALS', 'A', '120.733', '23.468', '');
INSERT INTO `t_order_region` VALUES ('4172', '713300', '710000', '屏东县', '中国,台湾,屏东县', '屏东', '中国,台湾,屏东', '2', '08', '9', 'Pingtung', 'PD', 'P', '120.488', '22.6828', '');
INSERT INTO `t_order_region` VALUES ('4173', '713301', '713300', '屏东市', '中国,台湾,屏东县,屏东市', '屏东', '中国,台湾,屏东,屏东', '3', '08', '900', 'Pingdong', 'PD', 'P', '120.488', '22.6697', '');
INSERT INTO `t_order_region` VALUES ('4174', '713321', '713300', '潮州镇', '中国,台湾,屏东县,潮州镇', '潮州', '中国,台湾,屏东,潮州', '3', '08', '920', 'Chaozhou', 'CZ', 'C', '120.543', '22.5505', '');
INSERT INTO `t_order_region` VALUES ('4175', '713322', '713300', '东港镇', '中国,台湾,屏东县,东港镇', '东港', '中国,台湾,屏东,东港', '3', '08', '928', 'Donggang', 'DG', 'D', '120.454', '22.4666', '');
INSERT INTO `t_order_region` VALUES ('4176', '713323', '713300', '恒春镇', '中国,台湾,屏东县,恒春镇', '恒春', '中国,台湾,屏东,恒春', '3', '08', '946', 'Hengchun', 'HC', 'H', '120.745', '22.0024', '');
INSERT INTO `t_order_region` VALUES ('4177', '713324', '713300', '万丹乡', '中国,台湾,屏东县,万丹乡', '万丹', '中国,台湾,屏东,万丹', '3', '08', '913', 'Wandan', 'WD', 'W', '120.485', '22.5898', '');
INSERT INTO `t_order_region` VALUES ('4178', '713325', '713300', '长治乡', '中国,台湾,屏东县,长治乡', '长治', '中国,台湾,屏东,长治', '3', '08', '908', 'Changzhi', 'CZ', 'C', '120.528', '22.6771', '');
INSERT INTO `t_order_region` VALUES ('4179', '713326', '713300', '麟洛乡', '中国,台湾,屏东县,麟洛乡', '麟洛', '中国,台湾,屏东,麟洛', '3', '08', '909', 'Linluo', 'LL', 'L', '120.527', '22.6506', '');
INSERT INTO `t_order_region` VALUES ('4180', '713327', '713300', '九如乡', '中国,台湾,屏东县,九如乡', '九如', '中国,台湾,屏东,九如', '3', '08', '904', 'Jiuru', 'JR', 'J', '120.49', '22.7398', '');
INSERT INTO `t_order_region` VALUES ('4181', '713328', '713300', '里港乡', '中国,台湾,屏东县,里港乡', '里港', '中国,台湾,屏东,里港', '3', '08', '905', 'Ligang', 'LG', 'L', '120.494', '22.7792', '');
INSERT INTO `t_order_region` VALUES ('4182', '713329', '713300', '盐埔乡', '中国,台湾,屏东县,盐埔乡', '盐埔', '中国,台湾,屏东,盐埔', '3', '08', '907', 'Yanpu', 'YP', 'Y', '120.573', '22.7548', '');
INSERT INTO `t_order_region` VALUES ('4183', '713330', '713300', '高树乡', '中国,台湾,屏东县,高树乡', '高树', '中国,台湾,屏东,高树', '3', '08', '906', 'Gaoshu', 'GS', 'G', '120.6', '22.8268', '');
INSERT INTO `t_order_region` VALUES ('4184', '713331', '713300', '万峦乡', '中国,台湾,屏东县,万峦乡', '万峦', '中国,台湾,屏东,万峦', '3', '08', '923', 'Wanluan', 'WL', 'W', '120.566', '22.572', '');
INSERT INTO `t_order_region` VALUES ('4185', '713332', '713300', '内埔乡', '中国,台湾,屏东县,内埔乡', '内埔', '中国,台湾,屏东,内埔', '3', '08', '912', 'Napu', 'NP', 'N', '120.567', '22.612', '');
INSERT INTO `t_order_region` VALUES ('4186', '713333', '713300', '竹田乡', '中国,台湾,屏东县,竹田乡', '竹田', '中国,台湾,屏东,竹田', '3', '08', '911', 'Zhutian', 'ZT', 'Z', '120.544', '22.5847', '');
INSERT INTO `t_order_region` VALUES ('4187', '713334', '713300', '新埤乡', '中国,台湾,屏东县,新埤乡', '新埤', '中国,台湾,屏东,新埤', '3', '08', '925', 'Xinpi', 'XP', 'X', '120.55', '22.47', '');
INSERT INTO `t_order_region` VALUES ('4188', '713335', '713300', '枋寮乡', '中国,台湾,屏东县,枋寮乡', '枋寮', '中国,台湾,屏东,枋寮', '3', '08', '940', 'Fangliao', 'FL', 'F', '120.593', '22.3656', '');
INSERT INTO `t_order_region` VALUES ('4189', '713336', '713300', '新园乡', '中国,台湾,屏东县,新园乡', '新园', '中国,台湾,屏东,新园', '3', '08', '932', 'Xinyuan', 'XY', 'X', '120.462', '22.544', '');
INSERT INTO `t_order_region` VALUES ('4190', '713337', '713300', '崁顶乡', '中国,台湾,屏东县,崁顶乡', '崁顶', '中国,台湾,屏东,崁顶', '3', '08', '924', 'Kanding', 'KD', 'K', '120.515', '22.5148', '');
INSERT INTO `t_order_region` VALUES ('4191', '713338', '713300', '林边乡', '中国,台湾,屏东县,林边乡', '林边', '中国,台湾,屏东,林边', '3', '08', '927', 'Linbian', 'LB', 'L', '120.515', '22.434', '');
INSERT INTO `t_order_region` VALUES ('4192', '713339', '713300', '南州乡', '中国,台湾,屏东县,南州乡', '南州', '中国,台湾,屏东,南州', '3', '08', '926', 'Nanzhou', 'NZ', 'N', '120.51', '22.4902', '');
INSERT INTO `t_order_region` VALUES ('4193', '713340', '713300', '佳冬乡', '中国,台湾,屏东县,佳冬乡', '佳冬', '中国,台湾,屏东,佳冬', '3', '08', '931', 'Jiadong', 'JD', 'J', '120.552', '22.4177', '');
INSERT INTO `t_order_region` VALUES ('4194', '713341', '713300', '琉球乡', '中国,台湾,屏东县,琉球乡', '琉球', '中国,台湾,屏东,琉球', '3', '08', '929', 'Liuqiu', 'LQ', 'L', '120.369', '22.3424', '');
INSERT INTO `t_order_region` VALUES ('4195', '713342', '713300', '车城乡', '中国,台湾,屏东县,车城乡', '车城', '中国,台湾,屏东,车城', '3', '08', '944', 'Checheng', 'CC', 'C', '120.711', '22.0721', '');
INSERT INTO `t_order_region` VALUES ('4196', '713343', '713300', '满州乡', '中国,台湾,屏东县,满州乡', '满州', '中国,台湾,屏东,满州', '3', '08', '947', 'Manzhou', 'MZ', 'M', '120.839', '22.0209', '');
INSERT INTO `t_order_region` VALUES ('4197', '713344', '713300', '枋山乡', '中国,台湾,屏东县,枋山乡', '枋山', '中国,台湾,屏东,枋山', '3', '08', '941', 'Fangshan', 'FS', 'F', '120.656', '22.2603', '');
INSERT INTO `t_order_region` VALUES ('4198', '713345', '713300', '三地门乡', '中国,台湾,屏东县,三地门乡', '三地门', '中国,台湾,屏东,三地门', '3', '08', '901', 'Sandimen', 'SDM', 'S', '120.654', '22.7139', '');
INSERT INTO `t_order_region` VALUES ('4199', '713346', '713300', '雾台乡', '中国,台湾,屏东县,雾台乡', '雾台', '中国,台湾,屏东,雾台', '3', '08', '902', 'Wutai', 'WT', 'W', '120.732', '22.7449', '');
INSERT INTO `t_order_region` VALUES ('4200', '713347', '713300', '玛家乡', '中国,台湾,屏东县,玛家乡', '玛家', '中国,台湾,屏东,玛家', '3', '08', '903', 'Majia', 'MJ', 'M', '120.644', '22.7067', '');
INSERT INTO `t_order_region` VALUES ('4201', '713348', '713300', '泰武乡', '中国,台湾,屏东县,泰武乡', '泰武', '中国,台湾,屏东,泰武', '3', '08', '921', 'Taiwu', 'TW', 'T', '120.633', '22.5918', '');
INSERT INTO `t_order_region` VALUES ('4202', '713349', '713300', '来义乡', '中国,台湾,屏东县,来义乡', '来义', '中国,台湾,屏东,来义', '3', '08', '922', 'Laiyi', 'LY', 'L', '120.634', '22.5259', '');
INSERT INTO `t_order_region` VALUES ('4203', '713350', '713300', '春日乡', '中国,台湾,屏东县,春日乡', '春日', '中国,台湾,屏东,春日', '3', '08', '942', 'Chunri', 'CR', 'C', '120.629', '22.3707', '');
INSERT INTO `t_order_region` VALUES ('4204', '713351', '713300', '狮子乡', '中国,台湾,屏东县,狮子乡', '狮子', '中国,台湾,屏东,狮子', '3', '08', '943', 'Shizi', 'SZ', 'S', '120.705', '22.2019', '');
INSERT INTO `t_order_region` VALUES ('4205', '713352', '713300', '牡丹乡', '中国,台湾,屏东县,牡丹乡', '牡丹', '中国,台湾,屏东,牡丹', '3', '08', '945', 'Mudan', 'MD', 'M', '120.77', '22.1257', '');
INSERT INTO `t_order_region` VALUES ('4206', '713400', '710000', '台东县', '中国,台湾,台东县', '台东', '中国,台湾,台东', '2', '089', '9', 'Taitung', 'TD', 'T', '120.916', '23', '');
INSERT INTO `t_order_region` VALUES ('4207', '713401', '713400', '台东市', '中国,台湾,台东县,台东市', '台东', '中国,台湾,台东,台东', '3', '089', '950', 'Taidong', 'TD', 'T', '121.146', '22.756', '');
INSERT INTO `t_order_region` VALUES ('4208', '713421', '713400', '成功镇', '中国,台湾,台东县,成功镇', '成功', '中国,台湾,台东,成功', '3', '089', '961', 'Chenggong', 'CG', 'C', '121.38', '23.1002', '');
INSERT INTO `t_order_region` VALUES ('4209', '713422', '713400', '关山镇', '中国,台湾,台东县,关山镇', '关山', '中国,台湾,台东,关山', '3', '089', '956', 'Guanshan', 'GS', 'G', '121.163', '23.0474', '');
INSERT INTO `t_order_region` VALUES ('4210', '713423', '713400', '卑南乡', '中国,台湾,台东县,卑南乡', '卑南', '中国,台湾,台东,卑南', '3', '089', '954', 'Beinan', 'BN', 'B', '121.084', '22.786', '');
INSERT INTO `t_order_region` VALUES ('4211', '713424', '713400', '鹿野乡', '中国,台湾,台东县,鹿野乡', '鹿野', '中国,台湾,台东,鹿野', '3', '089', '955', 'Luye', 'LY', 'L', '121.136', '22.914', '');
INSERT INTO `t_order_region` VALUES ('4212', '713425', '713400', '池上乡', '中国,台湾,台东县,池上乡', '池上', '中国,台湾,台东,池上', '3', '089', '958', 'Chishang', 'CS', 'C', '121.215', '23.1224', '');
INSERT INTO `t_order_region` VALUES ('4213', '713426', '713400', '东河乡', '中国,台湾,台东县,东河乡', '东河', '中国,台湾,台东,东河', '3', '089', '959', 'Donghe', 'DH', 'D', '121.3', '22.9699', '');
INSERT INTO `t_order_region` VALUES ('4214', '713427', '713400', '长滨乡', '中国,台湾,台东县,长滨乡', '长滨', '中国,台湾,台东,长滨', '3', '089', '962', 'Changbin', 'CB', 'C', '121.452', '23.315', '');
INSERT INTO `t_order_region` VALUES ('4215', '713428', '713400', '太麻里乡', '中国,台湾,台东县,太麻里乡', '太麻里', '中国,台湾,台东,太麻里', '3', '089', '963', 'Taimali', 'TML', 'T', '121.007', '22.6154', '');
INSERT INTO `t_order_region` VALUES ('4216', '713429', '713400', '大武乡', '中国,台湾,台东县,大武乡', '大武', '中国,台湾,台东,大武', '3', '089', '965', 'Dawu', 'DW', 'D', '120.89', '22.3399', '');
INSERT INTO `t_order_region` VALUES ('4217', '713430', '713400', '绿岛乡', '中国,台湾,台东县,绿岛乡', '绿岛', '中国,台湾,台东,绿岛', '3', '089', '951', 'Lvdao', 'LD', 'L', '121.493', '22.6617', '');
INSERT INTO `t_order_region` VALUES ('4218', '713431', '713400', '海端乡', '中国,台湾,台东县,海端乡', '海端', '中国,台湾,台东,海端', '3', '089', '957', 'Haiduan', 'HD', 'H', '121.172', '23.1011', '');
INSERT INTO `t_order_region` VALUES ('4219', '713432', '713400', '延平乡', '中国,台湾,台东县,延平乡', '延平', '中国,台湾,台东,延平', '3', '089', '953', 'Yanping', 'YP', 'Y', '121.084', '22.9024', '');
INSERT INTO `t_order_region` VALUES ('4220', '713433', '713400', '金峰乡', '中国,台湾,台东县,金峰乡', '金峰', '中国,台湾,台东,金峰', '3', '089', '964', 'Jinfeng', 'JF', 'J', '120.971', '22.5955', '');
INSERT INTO `t_order_region` VALUES ('4221', '713434', '713400', '达仁乡', '中国,台湾,台东县,达仁乡', '达仁', '中国,台湾,台东,达仁', '3', '089', '966', 'Daren', 'DR', 'D', '120.884', '22.2949', '');
INSERT INTO `t_order_region` VALUES ('4222', '713435', '713400', '兰屿乡', '中国,台湾,台东县,兰屿乡', '兰屿', '中国,台湾,台东,兰屿', '3', '089', '952', 'Lanyu', 'LY', 'L', '121.532', '22.0567', '');
INSERT INTO `t_order_region` VALUES ('4223', '713500', '710000', '花莲县', '中国,台湾,花莲县', '花莲', '中国,台湾,花莲', '2', '03', '9', 'Hualien', 'HL', 'H', '121.3', '23.83', '');
INSERT INTO `t_order_region` VALUES ('4224', '713501', '713500', '花莲市', '中国,台湾,花莲县,花莲市', '花莲', '中国,台湾,花莲,花莲', '3', '03', '970', 'Hualian', 'HL', 'H', '121.607', '23.9821', '');
INSERT INTO `t_order_region` VALUES ('4225', '713521', '713500', '凤林镇', '中国,台湾,花莲县,凤林镇', '凤林', '中国,台湾,花莲,凤林', '3', '03', '975', 'Fenglin', 'FL', 'F', '121.452', '23.7446', '');
INSERT INTO `t_order_region` VALUES ('4226', '713522', '713500', '玉里镇', '中国,台湾,花莲县,玉里镇', '玉里', '中国,台湾,花莲,玉里', '3', '03', '981', 'Yuli', 'YL', 'Y', '121.316', '23.3365', '');
INSERT INTO `t_order_region` VALUES ('4227', '713523', '713500', '新城乡', '中国,台湾,花莲县,新城乡', '新城', '中国,台湾,花莲,新城', '3', '03', '971', 'Xincheng', 'XC', 'X', '121.641', '24.1281', '');
INSERT INTO `t_order_region` VALUES ('4228', '713524', '713500', '吉安乡', '中国,台湾,花莲县,吉安乡', '吉安', '中国,台湾,花莲,吉安', '3', '03', '973', 'Ji\'an', 'JA', 'J', '121.568', '23.9616', '');
INSERT INTO `t_order_region` VALUES ('4229', '713525', '713500', '寿丰乡', '中国,台湾,花莲县,寿丰乡', '寿丰', '中国,台湾,花莲,寿丰', '3', '03', '974', 'Shoufeng', 'SF', 'S', '121.509', '23.8707', '');
INSERT INTO `t_order_region` VALUES ('4230', '713526', '713500', '光复乡', '中国,台湾,花莲县,光复乡', '光复', '中国,台湾,花莲,光复', '3', '03', '976', 'Guangfu', 'GF', 'G', '121.423', '23.6691', '');
INSERT INTO `t_order_region` VALUES ('4231', '713527', '713500', '丰滨乡', '中国,台湾,花莲县,丰滨乡', '丰滨', '中国,台湾,花莲,丰滨', '3', '03', '977', 'Fengbin', 'FB', 'F', '121.519', '23.5971', '');
INSERT INTO `t_order_region` VALUES ('4232', '713528', '713500', '瑞穗乡', '中国,台湾,花莲县,瑞穗乡', '瑞穗', '中国,台湾,花莲,瑞穗', '3', '03', '978', 'Ruisui', 'RS', 'R', '121.376', '23.4968', '');
INSERT INTO `t_order_region` VALUES ('4233', '713529', '713500', '富里乡', '中国,台湾,花莲县,富里乡', '富里', '中国,台湾,花莲,富里', '3', '03', '983', 'Fuli', 'FL', 'F', '121.25', '23.18', '');
INSERT INTO `t_order_region` VALUES ('4234', '713530', '713500', '秀林乡', '中国,台湾,花莲县,秀林乡', '秀林', '中国,台湾,花莲,秀林', '3', '03', '972', 'Xiulin', 'XL', 'X', '121.62', '24.1166', '');
INSERT INTO `t_order_region` VALUES ('4235', '713531', '713500', '万荣乡', '中国,台湾,花莲县,万荣乡', '万荣', '中国,台湾,花莲,万荣', '3', '03', '979', 'Wanrong', 'WR', 'W', '121.407', '23.7153', '');
INSERT INTO `t_order_region` VALUES ('4236', '713532', '713500', '卓溪乡', '中国,台湾,花莲县,卓溪乡', '卓溪', '中国,台湾,花莲,卓溪', '3', '03', '982', 'Zhuoxi', 'ZX', 'Z', '121.303', '23.3464', '');
INSERT INTO `t_order_region` VALUES ('4237', '713600', '710000', '澎湖县', '中国,台湾,澎湖县', '澎湖', '中国,台湾,澎湖', '2', '06', '8', 'Penghu', 'PH', 'P', '119.566', '23.5697', '');
INSERT INTO `t_order_region` VALUES ('4238', '713601', '713600', '马公市', '中国,台湾,澎湖县,马公市', '马公', '中国,台湾,澎湖,马公', '3', '06', '880', 'Magong', 'MG', 'M', '119.566', '23.5658', '');
INSERT INTO `t_order_region` VALUES ('4239', '713621', '713600', '湖西乡', '中国,台湾,澎湖县,湖西乡', '湖西', '中国,台湾,澎湖,湖西', '3', '06', '885', 'Huxi', 'HX', 'H', '119.66', '23.5834', '');
INSERT INTO `t_order_region` VALUES ('4240', '713622', '713600', '白沙乡', '中国,台湾,澎湖县,白沙乡', '白沙', '中国,台湾,澎湖,白沙', '3', '06', '884', 'Baisha', 'BS', 'B', '119.598', '23.6661', '');
INSERT INTO `t_order_region` VALUES ('4241', '713623', '713600', '西屿乡', '中国,台湾,澎湖县,西屿乡', '西屿', '中国,台湾,澎湖,西屿', '3', '06', '881', 'Xiyu', 'XY', 'X', '119.507', '23.6008', '');
INSERT INTO `t_order_region` VALUES ('4242', '713624', '713600', '望安乡', '中国,台湾,澎湖县,望安乡', '望安', '中国,台湾,澎湖,望安', '3', '06', '882', 'Wang\'an', 'WA', 'W', '119.501', '23.3575', '');
INSERT INTO `t_order_region` VALUES ('4243', '713625', '713600', '七美乡', '中国,台湾,澎湖县,七美乡', '七美', '中国,台湾,澎湖,七美', '3', '06', '883', 'Qimei', 'QM', 'Q', '119.424', '23.206', '');
INSERT INTO `t_order_region` VALUES ('4244', '713700', '710000', '金门县', '中国,台湾,金门县', '金门', '中国,台湾,金门', '2', '082', '8', 'Jinmen', 'JM', 'J', '118.317', '24.4327', '');
INSERT INTO `t_order_region` VALUES ('4245', '713701', '713700', '金城镇', '中国,台湾,金门县,金城镇', '金城', '中国,台湾,金门,金城', '3', '082', '893', 'Jincheng', 'JC', 'J', '118.317', '24.4167', '');
INSERT INTO `t_order_region` VALUES ('4246', '713702', '713700', '金湖镇', '中国,台湾,金门县,金湖镇', '金湖', '中国,台湾,金门,金湖', '3', '082', '891', 'Jinhu', 'JH', 'J', '118.42', '24.4386', '');
INSERT INTO `t_order_region` VALUES ('4247', '713703', '713700', '金沙镇', '中国,台湾,金门县,金沙镇', '金沙', '中国,台湾,金门,金沙', '3', '082', '890', 'Jinsha', 'JS', 'J', '118.428', '24.4811', '');
INSERT INTO `t_order_region` VALUES ('4248', '713704', '713700', '金宁乡', '中国,台湾,金门县,金宁乡', '金宁', '中国,台湾,金门,金宁', '3', '082', '892', 'Jinning', 'JN', 'J', '118.335', '24.4567', '');
INSERT INTO `t_order_region` VALUES ('4249', '713705', '713700', '烈屿乡', '中国,台湾,金门县,烈屿乡', '烈屿', '中国,台湾,金门,烈屿', '3', '082', '894', 'Lieyu', 'LY', 'L', '118.247', '24.4331', '');
INSERT INTO `t_order_region` VALUES ('4250', '713706', '713700', '乌丘乡', '中国,台湾,金门县,乌丘乡', '乌丘', '中国,台湾,金门,乌丘', '3', '082', '896', 'Wuqiu', 'WQ', 'W', '118.32', '24.435', '');
INSERT INTO `t_order_region` VALUES ('4251', '713800', '710000', '连江县', '中国,台湾,连江县', '连江', '中国,台湾,连江', '2', '0836', '2', 'Lienchiang', 'LJ', 'L', '119.54', '26.1974', '');
INSERT INTO `t_order_region` VALUES ('4252', '713801', '713800', '南竿乡', '中国,台湾,连江县,南竿乡', '南竿', '中国,台湾,连江,南竿', '3', '0836', '209', 'Nangan', 'NG', 'N', '119.944', '26.144', '');
INSERT INTO `t_order_region` VALUES ('4253', '713802', '713800', '北竿乡', '中国,台湾,连江县,北竿乡', '北竿', '中国,台湾,连江,北竿', '3', '0836', '210', 'Beigan', 'BG', 'B', '120.001', '26.222', '');
INSERT INTO `t_order_region` VALUES ('4254', '713803', '713800', '莒光乡', '中国,台湾,连江县,莒光乡', '莒光', '中国,台湾,连江,莒光', '3', '0836', '211', 'Juguang', 'JG', 'J', '119.94', '25.9763', '');
INSERT INTO `t_order_region` VALUES ('4255', '713804', '713800', '东引乡', '中国,台湾,连江县,东引乡', '东引', '中国,台湾,连江,东引', '3', '0836', '212', 'Dongyin', 'DY', 'D', '120.494', '26.3662', '');
INSERT INTO `t_order_region` VALUES ('4256', '810000', '100000', '香港特别行政区', '中国,香港特别行政区', '香港', '中国,香港', '1', '', '', 'Hong Kong', 'HK', 'H', '114.173', '22.32', '');
INSERT INTO `t_order_region` VALUES ('4257', '810100', '810000', '香港岛', '中国,香港特别行政区,香港岛', '香港岛', '中国,香港,香港岛', '2', '00852', '999077', 'Hong Kong Island', 'XGD', 'H', '114.177', '22.2664', '');
INSERT INTO `t_order_region` VALUES ('4258', '810101', '810100', '中西区', '中国,香港特别行政区,香港岛,中西区', '中西区', '中国,香港,香港岛,中西区', '3', '00852', '999077', 'Central and Western District', 'ZXQ', 'C', '114.154', '22.282', '');
INSERT INTO `t_order_region` VALUES ('4259', '810102', '810100', '湾仔区', '中国,香港特别行政区,香港岛,湾仔区', '湾仔区', '中国,香港,香港岛,湾仔区', '3', '00852', '999077', 'Wan Chai District', 'WZQ', 'W', '114.183', '22.2764', '');
INSERT INTO `t_order_region` VALUES ('4260', '810103', '810100', '东区', '中国,香港特别行政区,香港岛,东区', '东区', '中国,香港,香港岛,东区', '3', '00852', '999077', 'Eastern District', 'DQ', 'E', '114.256', '22.2628', '');
INSERT INTO `t_order_region` VALUES ('4261', '810104', '810100', '南区', '中国,香港特别行政区,香港岛,南区', '南区', '中国,香港,香港岛,南区', '3', '00852', '999077', 'Southern District', 'NQ', 'S', '114.174', '22.2468', '');
INSERT INTO `t_order_region` VALUES ('4262', '810200', '810000', '九龙', '中国,香港特别行政区,九龙', '九龙', '中国,香港,九龙', '2', '00852', '999077', 'Kowloon', 'JL', 'K', '114.175', '22.3271', '');
INSERT INTO `t_order_region` VALUES ('4263', '810201', '810200', '油尖旺区', '中国,香港特别行政区,九龙,油尖旺区', '油尖旺', '中国,香港,九龙,油尖旺', '3', '00852', '999077', 'Yau Tsim Mong', 'YJW', 'Y', '114.173', '22.3117', '');
INSERT INTO `t_order_region` VALUES ('4264', '810202', '810200', '深水埗区', '中国,香港特别行政区,九龙,深水埗区', '深水埗', '中国,香港,九龙,深水埗', '3', '00852', '999077', 'Sham Shui Po', 'SSB', 'S', '114.167', '22.3282', '');
INSERT INTO `t_order_region` VALUES ('4265', '810203', '810200', '九龙城区', '中国,香港特别行政区,九龙,九龙城区', '九龙城', '中国,香港,九龙,九龙城', '3', '00852', '999077', 'Jiulongcheng', 'JLC', 'J', '114.195', '22.3267', '');
INSERT INTO `t_order_region` VALUES ('4266', '810204', '810200', '黄大仙区', '中国,香港特别行政区,九龙,黄大仙区', '黄大仙', '中国,香港,九龙,黄大仙', '3', '00852', '999077', 'Wong Tai Sin', 'HDX', 'W', '114.199', '22.3363', '');
INSERT INTO `t_order_region` VALUES ('4267', '810205', '810200', '观塘区', '中国,香港特别行政区,九龙,观塘区', '观塘', '中国,香港,九龙,观塘', '3', '00852', '999077', 'Kwun Tong', 'GT', 'K', '114.231', '22.3094', '');
INSERT INTO `t_order_region` VALUES ('4268', '810300', '810000', '新界', '中国,香港特别行政区,新界', '新界', '中国,香港,新界', '2', '00852', '999077', 'New Territories', 'XJ', 'N', '114.202', '22.3418', '');
INSERT INTO `t_order_region` VALUES ('4269', '810301', '810300', '荃湾区', '中国,香港特别行政区,新界,荃湾区', '荃湾', '中国,香港,新界,荃湾', '3', '00852', '999077', 'Tsuen Wan', 'QW', 'T', '114.123', '22.371', '');
INSERT INTO `t_order_region` VALUES ('4270', '810302', '810300', '屯门区', '中国,香港特别行政区,新界,屯门区', '屯门', '中国,香港,新界,屯门', '3', '00852', '999077', 'Tuen Mun', 'TM', 'T', '113.977', '22.391', '');
INSERT INTO `t_order_region` VALUES ('4271', '810303', '810300', '元朗区', '中国,香港特别行政区,新界,元朗区', '元朗', '中国,香港,新界,元朗', '3', '00852', '999077', 'Yuen Long', 'YL', 'Y', '114.04', '22.4433', '');
INSERT INTO `t_order_region` VALUES ('4272', '810304', '810300', '北区', '中国,香港特别行政区,新界,北区', '北区', '中国,香港,新界,北区', '3', '00852', '999077', 'North District', 'BQ', 'N', '114.149', '22.4941', '');
INSERT INTO `t_order_region` VALUES ('4273', '810305', '810300', '大埔区', '中国,香港特别行政区,新界,大埔区', '大埔', '中国,香港,新界,大埔', '3', '00852', '999077', 'Tai Po', 'DP', 'T', '114.172', '22.4457', '');
INSERT INTO `t_order_region` VALUES ('4274', '810306', '810300', '西贡区', '中国,香港特别行政区,新界,西贡区', '西贡', '中国,香港,新界,西贡', '3', '00852', '999077', 'Sai Kung', 'XG', 'S', '114.279', '22.3794', '');
INSERT INTO `t_order_region` VALUES ('4275', '810307', '810300', '沙田区', '中国,香港特别行政区,新界,沙田区', '沙田', '中国,香港,新界,沙田', '3', '00852', '999077', 'Sha Tin', 'ST', 'S', '114.192', '22.3793', '');
INSERT INTO `t_order_region` VALUES ('4276', '810308', '810300', '葵青区', '中国,香港特别行政区,新界,葵青区', '葵青', '中国,香港,新界,葵青', '3', '00852', '999077', 'Kwai Tsing', 'KQ', 'K', '114.139', '22.3639', '');
INSERT INTO `t_order_region` VALUES ('4277', '810309', '810300', '离岛区', '中国,香港特别行政区,新界,离岛区', '离岛', '中国,香港,新界,离岛', '3', '00852', '999077', 'Outlying Islands', 'LD', 'O', '113.946', '22.2815', '');
INSERT INTO `t_order_region` VALUES ('4278', '820000', '100000', '澳门特别行政区', '中国,澳门特别行政区', '澳门', '中国,澳门', '1', '', '', 'Macau', 'MO', 'M', '113.549', '22.199', '');
INSERT INTO `t_order_region` VALUES ('4279', '820100', '820000', '澳门半岛', '中国,澳门特别行政区,澳门半岛', '澳门半岛', '中国,澳门,澳门半岛', '2', '00853', '999078', 'MacauPeninsula', 'AMBD', 'M', '113.549', '22.1988', '');
INSERT INTO `t_order_region` VALUES ('4280', '820101', '820100', '花地玛堂区', '中国,澳门特别行政区,澳门半岛,花地玛堂区', '花地玛堂区', '中国,澳门,澳门半岛,花地玛堂区', '3', '00853', '999078', 'Nossa Senhora de Fatima', 'HDMTQ', 'N', '113.552', '22.2081', '');
INSERT INTO `t_order_region` VALUES ('4281', '820102', '820100', '圣安多尼堂区', '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', '圣安多尼堂区', '中国,澳门,澳门半岛,圣安多尼堂区', '3', '00853', '999078', 'Santo Antonio', 'SADNTQ', 'S', '113.564', '22.1238', '');
INSERT INTO `t_order_region` VALUES ('4282', '820103', '820100', '大堂区', '中国,澳门特别行政区,澳门半岛,大堂区', '大堂', '中国,澳门,澳门半岛,大堂', '3', '00853', '999078', 'S?', 'DT', 'S', '113.553', '22.1884', '');
INSERT INTO `t_order_region` VALUES ('4283', '820104', '820100', '望德堂区', '中国,澳门特别行政区,澳门半岛,望德堂区', '望德堂区', '中国,澳门,澳门半岛,望德堂区', '3', '00853', '999078', 'Sao Lazaro', 'WDTQ', 'S', '113.551', '22.1941', '');
INSERT INTO `t_order_region` VALUES ('4284', '820105', '820100', '风顺堂区', '中国,澳门特别行政区,澳门半岛,风顺堂区', '风顺堂区', '中国,澳门,澳门半岛,风顺堂区', '3', '00853', '999078', 'Sao Lourenco', 'FSTQ', 'S', '113.542', '22.1874', '');
INSERT INTO `t_order_region` VALUES ('4285', '820200', '820000', '氹仔岛', '中国,澳门特别行政区,氹仔岛', '氹仔岛', '中国,澳门,氹仔岛', '2', '00853', '999078', 'Taipa', 'DZD', 'T', '113.578', '22.1568', '');
INSERT INTO `t_order_region` VALUES ('4286', '820201', '820200', '嘉模堂区', '中国,澳门特别行政区,氹仔岛,嘉模堂区', '嘉模堂区', '中国,澳门,氹仔岛,嘉模堂区', '3', '00853', '999078', 'Our Lady Of Carmel\'s Parish', 'JMTQ', 'O', '113.565', '22.149', '');
INSERT INTO `t_order_region` VALUES ('4287', '820300', '820000', '路环岛', '中国,澳门特别行政区,路环岛', '路环岛', '中国,澳门,路环岛', '2', '00853', '999078', 'Coloane', 'LHD', 'C', '113.565', '22.1162', '');
INSERT INTO `t_order_region` VALUES ('4288', '820301', '820300', '圣方济各堂区', '中国,澳门特别行政区,路环岛,圣方济各堂区', '圣方济各堂区', '中国,澳门,路环岛,圣方济各堂区', '3', '00853', '999078', 'St Francis Xavier\'s Parish', 'SFJGTQ', 'S', '113.56', '22.1235', '');
INSERT INTO `t_order_region` VALUES ('4289', '900000', '100000', '钓鱼岛', '中国,钓鱼岛', '钓鱼岛', '中国,钓鱼岛', '1', '', '', 'DiaoyuDao', 'DYD', 'D', '123.478', '25.7424', '');

-- ----------------------------
-- Table structure for t_order_trace
-- ----------------------------
DROP TABLE IF EXISTS `t_order_trace`;
CREATE TABLE `t_order_trace` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `operate` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作',
  `ope_trace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '历史操作轨迹',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单操作轨迹表';

-- ----------------------------
-- Records of t_order_trace
-- ----------------------------

-- ----------------------------
-- Table structure for t_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_record`;
CREATE TABLE `t_pay_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `trade_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付宝交易号',
  `pay_channel` smallint(2) DEFAULT NULL COMMENT '交易渠道',
  `pay_type` smallint(1) DEFAULT NULL COMMENT '交易类型(0:付款/1:退款)',
  `payment` decimal(30,2) DEFAULT NULL COMMENT '交易金额',
  `actual_paument` decimal(30,2) DEFAULT NULL,
  `buyed_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `ceate_tme` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='付款记录表';

-- ----------------------------
-- Records of t_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_promotions
-- ----------------------------
DROP TABLE IF EXISTS `t_promotions`;
CREATE TABLE `t_promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动表主键',
  `promotions_type` varchar(50) NOT NULL COMMENT '活动方式 见字典表',
  `promotions_name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `main_image` varchar(500) DEFAULT NULL COMMENT '活动主图',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动开始时间',
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动结束时间',
  `priority` int(11) DEFAULT NULL COMMENT '活动优先级',
  `share_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否和其他活动共享  1和其他活动共享 0不和其他活动共享',
  `discout` decimal(8,2) DEFAULT NULL COMMENT '折扣',
  `buy_limit` int(11) DEFAULT NULL COMMENT '每次限购数量',
  `trial_limit` int(11) DEFAULT NULL COMMENT '试用限制',
  `apply_num` int(11) DEFAULT '0' COMMENT '申请人数',
  `description` text COMMENT '活动介绍',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_flag` smallint(1) DEFAULT '1' COMMENT '删除标识 0：无效 1：有效',
  `create_admin` int(11) NOT NULL COMMENT '活动创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='促销活动表';

-- ----------------------------
-- Records of t_promotions
-- ----------------------------
INSERT INTO `t_promotions` VALUES ('4', 'trial', '芙丽芳丝面膜试用活动', '/1.jpg', '2018-07-02 00:00:00', '2019-07-02 23:59:59', '1', '1', '10.00', '10', '100', '1', '试用流程 1、成为认证用户 2、免费申请试用 3、等待审核', '2018-07-02 18:12:08', '2018-07-03 13:52:00', '1', '-1');
INSERT INTO `t_promotions` VALUES ('5', 'trial', '薇姿保湿套餐试用活动', '/2.jpg', '2018-06-02 00:00:00', '2018-07-02 23:59:59', '1', '1', '10.00', '10', '100', '0', '试用流程 1、成为认证用户 2、免费申请试用 3、等待审核', '2018-07-03 15:18:25', '2018-07-03 15:18:25', '1', '-1');
INSERT INTO `t_promotions` VALUES ('6', 'trial', '薇姿面膜试用活动', '/1.jpg', '2018-07-09 00:00:00', '2019-07-02 23:59:59', '1', '1', '10.00', '10', '100', '0', '试用流程 1、成为认证用户 2、免费申请试用 3、等待审核', '2018-07-04 11:27:07', '2018-07-04 11:27:49', '1', '-1');
INSERT INTO `t_promotions` VALUES ('7', 'trial', '理肤泉喷雾试用活动', '/1.jpg', '2018-07-02 00:00:00', '2019-07-02 23:59:59', '1', '1', '10.00', '10', '100', '1', '<p><strong><span style=\"font-size:18px;\">试用流程</span></strong> </p> <p> <span style=\"color:#666666;\">1、成为认证用户</span> </p> <p> <span style=\"color:#666666;\">申请试用者必须是淘美商会认证用户</span> </p> <p><span style=\"color:#666666;\">2、免费申请试用</span> </p> <p><span style=\"color:#666666;\">我们将为你提供各类化妆品免费试用机会</span> </p> <hr /><a href=\"http://www.taobao.com\">点击打开链接</a><br />', '2018-07-04 11:36:39', '2018-07-05 11:54:06', '1', '-1');

-- ----------------------------
-- Table structure for t_promotions_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_promotions_apply`;
CREATE TABLE `t_promotions_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动报名表主键',
  `promotions_id` int(11) NOT NULL COMMENT '活动ID',
  `user_id` int(11) NOT NULL COMMENT '报名用户ID',
  `audit_status` smallint(2) NOT NULL COMMENT '审核状态 0初始化  1审核通过  2不通过 3申请成功  4申请失败',
  `audit_admin` int(11) DEFAULT NULL COMMENT '审核人ID',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `receiver_name` varchar(64) NOT NULL COMMENT '收货人姓名',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '移动号码',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定号码',
  `receiver_address` varchar(300) DEFAULT NULL COMMENT '收货地址，如：xx省xx市xx县/区xx路xx号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='促销活动申请表';

-- ----------------------------
-- Records of t_promotions_apply
-- ----------------------------
INSERT INTO `t_promotions_apply` VALUES ('1', '4', '1', '3', null, '2018-07-03 13:51:59', '侯印', '18513222222', '固定电话', '侯印得圈或窝地址', '侯印要求有球多，过多要求写了也不得满足你');
INSERT INTO `t_promotions_apply` VALUES ('2', '7', '1', '0', null, '2018-07-05 11:54:06', '侯印', '18513222222', '固定电话', '侯印得圈或窝地址', '侯印要求有球多，过多要求写了也不得满足你');

-- ----------------------------
-- Table structure for t_promotions_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_promotions_collect`;
CREATE TABLE `t_promotions_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '促销活动收藏表主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `promotions_id` int(11) NOT NULL COMMENT '收藏活动',
  `collect_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  `cancel_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '取消收藏时间',
  `delete_flag` smallint(1) NOT NULL COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='促销活动收藏表';

-- ----------------------------
-- Records of t_promotions_collect
-- ----------------------------

-- ----------------------------
-- Table structure for t_promotions_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_promotions_goods`;
CREATE TABLE `t_promotions_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动商品表主键',
  `promotions_id` int(11) NOT NULL COMMENT '活动ID',
  `spu_id` int(11) NOT NULL COMMENT '商品ID',
  `limit_count` int(11) DEFAULT NULL COMMENT '限制购买数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加日期',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '删除标识 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='促销活动商品表';

-- ----------------------------
-- Records of t_promotions_goods
-- ----------------------------
INSERT INTO `t_promotions_goods` VALUES ('1', '4', '1', '999', '2018-07-02 18:12:09', '1');
INSERT INTO `t_promotions_goods` VALUES ('2', '5', '2', '999', '2018-07-03 15:18:27', '1');
INSERT INTO `t_promotions_goods` VALUES ('3', '6', '2', '999', '2018-07-04 11:27:07', '1');
INSERT INTO `t_promotions_goods` VALUES ('4', '7', '2', '999', '2018-07-04 11:36:39', '1');

-- ----------------------------
-- Table structure for t_receipt_address
-- ----------------------------
DROP TABLE IF EXISTS `t_receipt_address`;
CREATE TABLE `t_receipt_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL COMMENT '发票ID',
  `name` varchar(50) DEFAULT NULL COMMENT '收票人姓名',
  `telephone` varchar(16) DEFAULT NULL COMMENT '电话',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT '收票人详细地址',
  `status` smallint(1) DEFAULT NULL COMMENT '收票状态（0 - 未签收，1 - 已签收）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收票地址表';

-- ----------------------------
-- Records of t_receipt_address
-- ----------------------------

-- ----------------------------
-- Table structure for t_review_log
-- ----------------------------
DROP TABLE IF EXISTS `t_review_log`;
CREATE TABLE `t_review_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(16) DEFAULT NULL COMMENT '业务类型',
  `business_id` int(11) NOT NULL COMMENT '数据来源 Id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `status` smallint(2) DEFAULT NULL COMMENT '审核状态',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='审核日志表';

-- ----------------------------
-- Records of t_review_log
-- ----------------------------
INSERT INTO `t_review_log` VALUES ('1', 'shop', '1', '标题', '3', '描述', '-1', null);
INSERT INTO `t_review_log` VALUES ('2', 'shop', '1', '标题', '3', '描述', '-1', null);
INSERT INTO `t_review_log` VALUES ('3', 'shop', '1', '标题', '3', '描述', '-1', null);
INSERT INTO `t_review_log` VALUES ('4', 'shop', '1', '标题', '3', '描述', '-1', null);
INSERT INTO `t_review_log` VALUES ('11', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('12', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('13', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('18', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('19', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('21', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('22', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('23', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('24', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('25', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('26', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);
INSERT INTO `t_review_log` VALUES ('27', 'banrd', '92', '品牌入驻审核', '2', '审核通过', '-1', null);

-- ----------------------------
-- Table structure for t_shop_info
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_info`;
CREATE TABLE `t_shop_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_code` varchar(20) NOT NULL COMMENT '平台 code （天猫，淘宝，京东、等）',
  `third_shop_id` varchar(20) NOT NULL COMMENT '第三方店铺ID',
  `third_shop_name` varchar(50) DEFAULT NULL COMMENT '第三方店铺名称',
  `third_shop_url` varchar(255) DEFAULT NULL COMMENT '第三方店铺链接',
  `monthly_turnover` decimal(8,2) DEFAULT NULL COMMENT '月成交额',
  `monthly_sales_images` varchar(255) DEFAULT NULL COMMENT '月销售截图',
  `main_category` varchar(255) DEFAULT NULL COMMENT '主营类目（护肤/彩妆/洗护/香水）',
  `main_brand` varchar(255) DEFAULT NULL COMMENT '主营品牌（综合/日韩/欧美/国货/东南亚/澳洲）',
  `shop_type` varchar(255) DEFAULT NULL COMMENT '店铺类型（品牌旗舰店or专营\\综合店\\红人店\\小众店\\细分品类店）',
  `unit_price` decimal(8,2) DEFAULT NULL COMMENT '客单价',
  `shop_describe` varchar(40) DEFAULT NULL COMMENT '店铺经营特色',
  `logistics_methods` varchar(60) DEFAULT NULL COMMENT '物流方式（国内/保税仓/直邮）',
  `logo_images` varchar(50) DEFAULT NULL COMMENT '品牌logo图片',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `status` smallint(1) DEFAULT '0' COMMENT '店铺审核状态（0-未审核，1-审核中，2-已审核，3-已拒绝）',
  `is_main_shop` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是主店铺（0,- 否，1- 是）',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='店铺信息';

-- ----------------------------
-- Records of t_shop_info
-- ----------------------------
INSERT INTO `t_shop_info` VALUES ('1', '平台 code （天猫，淘宝，京东、等）', '200000', '第三方店铺名称', '第三方店铺链接', '8000.00', null, '主营类目（护肤/彩妆/洗护/香水）', '主营品牌（综合/日韩/欧美/国货/东南亚/澳洲）', '店铺类型（品牌旗舰店or专营/综合店/红人店/小众店/细分品类店', '80.00', '店铺经营特色', '物流方式（国内/保税仓/直邮）', '品牌logo图片', '13', '3', '0', '2018-06-30 17:22:30');
INSERT INTO `t_shop_info` VALUES ('2', '平台 code （天猫，淘宝，京东、等）', '200000', '第三方店铺名称', '第三方店铺链接', '8000.00', null, '主营类目（护肤/彩妆/洗护/香水）', '主营品牌（综合/日韩/欧美/国货/东南亚/澳洲）', '店铺类型（品牌旗舰店or专营/综合店/红人店/小众店/细分品类店', '80.00', '店铺经营特色', '物流方式（国内/保税仓/直邮）', '品牌logo图片', '1', '1', '0', '2018-06-29 14:26:31');

-- ----------------------------
-- Table structure for t_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_sku`;
CREATE TABLE `t_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格主键',
  `spu_id` int(11) NOT NULL COMMENT '商品ID',
  `sku_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sku_price` decimal(8,2) NOT NULL COMMENT '规格价格',
  `min_buy_num` int(11) NOT NULL DEFAULT '1' COMMENT '最小订购数',
  `max_buy_num` int(11) NOT NULL COMMENT '最大购买数',
  `sku_img_url` varchar(500) DEFAULT NULL COMMENT '规格图地址',
  `stock_num` int(11) NOT NULL DEFAULT '0' COMMENT '规格库存',
  `sell_num` int(11) NOT NULL DEFAULT '0' COMMENT '规格销售量',
  `delete_flag` smallint(1) NOT NULL COMMENT '删除标识 0：无效 1：有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='商品规格表';

-- ----------------------------
-- Records of t_sku
-- ----------------------------
INSERT INTO `t_sku` VALUES ('1', '1', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:35:07', '2018-07-04 18:44:36');
INSERT INTO `t_sku` VALUES ('2', '1', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:35:07', '2018-07-04 18:44:40');
INSERT INTO `t_sku` VALUES ('3', '2', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:12', '2018-06-28 13:36:12');
INSERT INTO `t_sku` VALUES ('4', '2', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:12', '2018-06-28 13:36:12');
INSERT INTO `t_sku` VALUES ('5', '3', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:19', '2018-06-28 13:36:19');
INSERT INTO `t_sku` VALUES ('6', '3', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:19', '2018-06-28 13:36:19');
INSERT INTO `t_sku` VALUES ('7', '4', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:47', '2018-06-28 13:36:47');
INSERT INTO `t_sku` VALUES ('8', '4', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:47', '2018-06-28 13:36:47');
INSERT INTO `t_sku` VALUES ('9', '5', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:58', '2018-06-28 13:36:58');
INSERT INTO `t_sku` VALUES ('10', '5', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:36:58', '2018-06-28 13:36:58');
INSERT INTO `t_sku` VALUES ('11', '6', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:13', '2018-06-28 13:37:13');
INSERT INTO `t_sku` VALUES ('12', '6', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:13', '2018-06-28 13:37:13');
INSERT INTO `t_sku` VALUES ('13', '7', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:22', '2018-06-28 13:37:22');
INSERT INTO `t_sku` VALUES ('14', '7', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:22', '2018-06-28 13:37:22');
INSERT INTO `t_sku` VALUES ('15', '8', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:44', '2018-06-28 13:37:44');
INSERT INTO `t_sku` VALUES ('16', '8', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:37:44', '2018-06-28 13:37:44');
INSERT INTO `t_sku` VALUES ('17', '9', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:38:07', '2018-06-28 13:38:07');
INSERT INTO `t_sku` VALUES ('18', '9', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:38:07', '2018-06-28 13:38:07');
INSERT INTO `t_sku` VALUES ('19', '10', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:38:47', '2018-06-28 13:38:47');
INSERT INTO `t_sku` VALUES ('20', '10', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:38:47', '2018-06-28 13:38:47');
INSERT INTO `t_sku` VALUES ('21', '11', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:39:49', '2018-06-28 13:39:49');
INSERT INTO `t_sku` VALUES ('22', '11', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:39:49', '2018-06-28 13:39:49');
INSERT INTO `t_sku` VALUES ('23', '12', '15ml', '199.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:40:13', '2018-06-28 13:40:13');
INSERT INTO `t_sku` VALUES ('24', '12', '150ml', '1990.99', '1', '99', 'http://', '10', '0', '1', '2018-06-28 13:40:13', '2018-06-28 13:40:13');

-- ----------------------------
-- Table structure for t_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_log`;
CREATE TABLE `t_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sms_template_id` int(11) NOT NULL COMMENT '短信发送模板ID',
  `biz_id` varchar(50) NOT NULL COMMENT '短信发送回执ID',
  `success_flag` smallint(1) NOT NULL COMMENT '是否发送成功  1成功 0不成功',
  `mobile` text NOT NULL COMMENT '短信接收号码,批量以逗号分隔的形式存储',
  `send_content` varchar(255) DEFAULT NULL COMMENT '短信发送内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='短信发送记录表';

-- ----------------------------
-- Records of t_sms_log
-- ----------------------------
INSERT INTO `t_sms_log` VALUES ('1', '1', '165313830006978691^0', '1', '18516525350', null, '2018-06-26 17:59:53');
INSERT INTO `t_sms_log` VALUES ('2', '1', '796519230007212931^0', '1', '18516525350', null, '2018-06-26 18:01:50');
INSERT INTO `t_sms_log` VALUES ('3', '1', '270010130076366587^0', '1', '18516525350', null, '2018-06-27 13:14:20');
INSERT INTO `t_sms_log` VALUES ('4', '1', '476508930076636044^0', '1', '18516525350', null, '2018-06-27 13:18:45');
INSERT INTO `t_sms_log` VALUES ('5', '4', '825708130082920387^0', '1', '18356238002', null, '2018-06-27 15:03:29');
INSERT INTO `t_sms_log` VALUES ('6', '4', '212607230083728748^0', '1', '15026486249', '{\"code\":\"892130\"}', '2018-06-27 15:16:58');
INSERT INTO `t_sms_log` VALUES ('7', '1', '283715230084865864^0', '1', '18356238002', '{\"code\":\"207313\"}', '2018-06-27 15:35:55');
INSERT INTO `t_sms_log` VALUES ('8', '4', '607416230147819138^0', '1', '15026486249', '{\"code\":\"378955\"}', '2018-06-28 09:05:08');
INSERT INTO `t_sms_log` VALUES ('9', '4', '245110530148148758^0', '1', '15026486249', '{\"code\":\"828210\"}', '2018-06-28 09:10:38');
INSERT INTO `t_sms_log` VALUES ('10', '4', '127514430148819929^0', '1', '15026486249', '{\"code\":\"876107\"}', '2018-06-28 09:21:49');
INSERT INTO `t_sms_log` VALUES ('11', '4', '354208030149003110^0', '1', '15026486249', '{\"code\":\"979962\"}', '2018-06-28 09:24:52');
INSERT INTO `t_sms_log` VALUES ('12', '4', '997519230149211550^0', '1', '15026486249', '{\"code\":\"426295\"}', '2018-06-28 09:28:21');
INSERT INTO `t_sms_log` VALUES ('13', '4', '456713830152330343^0', '1', '18046438383', '{\"code\":\"456892\"}', '2018-06-28 10:20:20');
INSERT INTO `t_sms_log` VALUES ('14', '4', '145814530154027068^0', '1', '18046438383', '{\"code\":\"982048\"}', '2018-06-28 10:48:36');
INSERT INTO `t_sms_log` VALUES ('15', '4', '264209430155471214^0', '1', '18046438383', '{\"code\":\"268534\"}', '2018-06-28 11:12:41');
INSERT INTO `t_sms_log` VALUES ('16', '4', '281515830156936873^0', '1', '18011111111', '{\"code\":\"727394\"}', '2018-06-28 11:37:06');

-- ----------------------------
-- Table structure for t_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_template`;
CREATE TABLE `t_sms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_name` varchar(50) DEFAULT NULL COMMENT '模板名称',
  `sign_name` varchar(100) NOT NULL COMMENT '短信签名-可在阿里云短信控制台中找到',
  `template_code` varchar(100) NOT NULL COMMENT '短信模板-可在阿里云短信控制台中找到',
  `template_param` varchar(255) NOT NULL,
  `delete_flag` smallint(1) NOT NULL COMMENT '是否有效 1有效 0无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='短信发送模板表';

-- ----------------------------
-- Records of t_sms_template
-- ----------------------------
INSERT INTO `t_sms_template` VALUES ('1', '身份验证验证码', '淘美妆商会', 'SMS_137485028', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:31', '2018-06-14 11:03:41');
INSERT INTO `t_sms_template` VALUES ('2', '登录确认验证码', '淘美妆商会', 'SMS_137485027', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:33', '2018-06-14 11:26:15');
INSERT INTO `t_sms_template` VALUES ('3', '登录异常验证码', '淘美妆商会', 'SMS_137485026', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:34', '2018-06-14 11:26:39');
INSERT INTO `t_sms_template` VALUES ('4', '用户注册验证码', '淘美妆商会', 'SMS_137485025', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:35', '2018-06-14 11:26:50');
INSERT INTO `t_sms_template` VALUES ('5', '修改密码验证码', '淘美妆商会', 'SMS_137485024', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:36', '2018-06-14 11:27:01');
INSERT INTO `t_sms_template` VALUES ('6', '信息变更验证码', '淘美妆商会', 'SMS_137485023', '{\"code\":\"%s\"}', '1', '2018-06-26 17:59:38', '2018-06-14 11:27:12');
INSERT INTO `t_sms_template` VALUES ('7', '支付验证', '淘美妆商会', 'SMS_138076041', '{\"code\":\"%s\"}', '1', '2018-06-27 15:32:11', '2018-06-27 13:31:32');
INSERT INTO `t_sms_template` VALUES ('8', '审核通知', '淘美妆商会', 'SMS_138130193', '{\"mtname\":\"%s\",\"submittime\":\"%s\"}', '1', '2018-06-27 15:32:23', '2018-06-27 15:32:23');

-- ----------------------------
-- Table structure for t_spu
-- ----------------------------
DROP TABLE IF EXISTS `t_spu`;
CREATE TABLE `t_spu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `spu_name` varchar(255) NOT NULL COMMENT '商品名称',
  `main_img` varchar(500) NOT NULL COMMENT '商品主图',
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌ID',
  `category_id` int(11) DEFAULT NULL COMMENT '类目ID',
  `video_url` varchar(100) DEFAULT NULL COMMENT '视频链接',
  `advertorial` varchar(255) DEFAULT NULL COMMENT '商品描述或者卖点',
  `view_price` decimal(8,2) NOT NULL COMMENT '显示价格',
  `buy_flag` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否可集采买卖 1可以 0不可以',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `collect_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品收藏数',
  `stock_count` int(11) NOT NULL DEFAULT '0' COMMENT '总库存',
  `sell_count` int(11) NOT NULL DEFAULT '0' COMMENT '总销量',
  `publish_status` smallint(1) NOT NULL DEFAULT '1' COMMENT '上下架标识 1上架 0下架',
  `audit_status` smallint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 0初始化 1通过 2不通过',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `on_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下架时间',
  `delete_flag` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否有效  1有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='商品或者产品表';

-- ----------------------------
-- Records of t_spu
-- ----------------------------
INSERT INTO `t_spu` VALUES ('1', '芙丽芳丝洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '1', '0', '0', '20', '0', '1', '1', '2018-06-28 13:33:38', '2018-07-04 18:44:28', '2018-06-28 13:33:38', '2018-06-28 13:35:07', '1');
INSERT INTO `t_spu` VALUES ('2', '兰蔻洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:34:43', '2018-06-28 13:34:43', '2018-06-28 13:34:43', '2018-06-28 13:36:12', '1');
INSERT INTO `t_spu` VALUES ('3', '雅思兰黛洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:34:50', '2018-06-28 13:34:50', '2018-06-28 13:34:50', '2018-06-28 13:36:19', '1');
INSERT INTO `t_spu` VALUES ('4', '纪梵希洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:35:18', '2018-06-28 13:35:18', '2018-06-28 13:35:18', '2018-06-28 13:36:47', '1');
INSERT INTO `t_spu` VALUES ('5', '香奈儿洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:35:29', '2018-06-28 13:35:29', '2018-06-28 13:35:29', '2018-06-28 13:36:58', '1');
INSERT INTO `t_spu` VALUES ('6', '阿玛尼洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:35:44', '2018-07-04 16:57:28', '2018-06-28 13:35:44', '2018-06-28 13:37:13', '1');
INSERT INTO `t_spu` VALUES ('7', 'SK2洗面奶150ml美白', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:35:53', '2018-06-28 13:35:53', '2018-06-28 13:35:53', '2018-06-28 13:37:22', '1');
INSERT INTO `t_spu` VALUES ('8', '罗卜丁权杖口红', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:36:15', '2018-06-28 13:36:15', '2018-06-28 13:36:15', '2018-06-28 13:37:44', '1');
INSERT INTO `t_spu` VALUES ('9', '阿玛尼小胖丁权杖口红', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:36:38', '2018-06-28 13:36:38', '2018-06-28 13:36:38', '2018-06-28 13:38:07', '1');
INSERT INTO `t_spu` VALUES ('10', '纪梵希蜜粉', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:37:17', '2018-06-28 13:37:17', '2018-06-28 13:37:17', '2018-06-28 13:38:46', '1');
INSERT INTO `t_spu` VALUES ('11', '兰蔻小黑瓶', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:38:20', '2018-06-28 13:38:20', '2018-06-28 13:38:20', '2018-06-28 13:39:49', '1');
INSERT INTO `t_spu` VALUES ('12', '雅思兰黛粉底液', 'http', '1', '-1', 'http://', '卖点美白抖音同款', '199.99', '0', '0', '0', '20', '0', '1', '1', '2018-06-28 13:38:44', '2018-06-28 13:38:44', '2018-06-28 13:38:44', '2018-06-28 13:40:13', '1');

-- ----------------------------
-- Table structure for t_spu_extend
-- ----------------------------
DROP TABLE IF EXISTS `t_spu_extend`;
CREATE TABLE `t_spu_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品规格',
  `spu_id` int(11) NOT NULL COMMENT '商品ID',
  `detail_desc` text COMMENT '图文详情',
  `spu_param` varchar(2000) DEFAULT NULL COMMENT '产品参数 不同品类产品参数不同存 json串',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='商品扩展信息';

-- ----------------------------
-- Records of t_spu_extend
-- ----------------------------
INSERT INTO `t_spu_extend` VALUES ('1', '1', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:35:07', '2018-06-28 13:35:07');
INSERT INTO `t_spu_extend` VALUES ('2', '2', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:36:12', '2018-06-28 13:36:12');
INSERT INTO `t_spu_extend` VALUES ('3', '3', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:36:19', '2018-06-28 13:36:19');
INSERT INTO `t_spu_extend` VALUES ('4', '4', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:36:47', '2018-06-28 13:36:47');
INSERT INTO `t_spu_extend` VALUES ('5', '5', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:36:58', '2018-06-28 13:36:58');
INSERT INTO `t_spu_extend` VALUES ('6', '6', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:37:13', '2018-06-28 13:37:13');
INSERT INTO `t_spu_extend` VALUES ('7', '7', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:37:22', '2018-06-28 13:37:22');
INSERT INTO `t_spu_extend` VALUES ('8', '8', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:37:44', '2018-06-28 13:37:44');
INSERT INTO `t_spu_extend` VALUES ('9', '9', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:38:07', '2018-06-28 13:38:07');
INSERT INTO `t_spu_extend` VALUES ('10', '10', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:38:47', '2018-06-28 13:38:47');
INSERT INTO `t_spu_extend` VALUES ('11', '11', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:39:49', '2018-06-28 13:39:49');
INSERT INTO `t_spu_extend` VALUES ('12', '12', '图文详情', '[{\"id\":1,\"keyName\":\"品牌\",\"keyValue\":\"芙丽芳丝\"},{\"id\":2,\"keyName\":\"产地\",\"keyValue\":\"中国上海\"},{\"id\":3,\"keyName\":\"适合肤质\",\"keyValue\":\"所有肤质\"},{\"id\":4,\"keyName\":\"功效\",\"keyValue\":[\"干肤质\",\"油性肤质\"]}]', null, '2018-06-28 13:40:13', '2018-06-28 13:40:13');

-- ----------------------------
-- Table structure for t_spu_photo
-- ----------------------------
DROP TABLE IF EXISTS `t_spu_photo`;
CREATE TABLE `t_spu_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品图片表',
  `spu_id` int(11) NOT NULL COMMENT '同一个商品下 多图片的排序 1：开始',
  `sort_num` int(3) DEFAULT NULL COMMENT '排序',
  `img_url` varchar(500) NOT NULL COMMENT '图片存储路径',
  `main_flag` smallint(1) NOT NULL COMMENT '主图标记 0:非主图 1:主图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='商品图片表';

-- ----------------------------
-- Records of t_spu_photo
-- ----------------------------
INSERT INTO `t_spu_photo` VALUES ('1', '1', '1', 'http', '1', '2018-06-28 13:35:07');
INSERT INTO `t_spu_photo` VALUES ('2', '1', '2', 'http', '0', '2018-06-28 13:35:07');
INSERT INTO `t_spu_photo` VALUES ('3', '1', '3', 'http', '0', '2018-06-28 13:35:07');
INSERT INTO `t_spu_photo` VALUES ('4', '2', '1', 'http', '1', '2018-06-28 13:36:12');
INSERT INTO `t_spu_photo` VALUES ('5', '2', '2', 'http', '0', '2018-06-28 13:36:12');
INSERT INTO `t_spu_photo` VALUES ('6', '2', '3', 'http', '0', '2018-06-28 13:36:12');
INSERT INTO `t_spu_photo` VALUES ('7', '3', '1', 'http', '1', '2018-06-28 13:36:19');
INSERT INTO `t_spu_photo` VALUES ('8', '3', '2', 'http', '0', '2018-06-28 13:36:19');
INSERT INTO `t_spu_photo` VALUES ('9', '3', '3', 'http', '0', '2018-06-28 13:36:19');
INSERT INTO `t_spu_photo` VALUES ('10', '4', '1', 'http', '1', '2018-06-28 13:36:47');
INSERT INTO `t_spu_photo` VALUES ('11', '4', '2', 'http', '0', '2018-06-28 13:36:47');
INSERT INTO `t_spu_photo` VALUES ('12', '4', '3', 'http', '0', '2018-06-28 13:36:47');
INSERT INTO `t_spu_photo` VALUES ('13', '5', '1', 'http', '1', '2018-06-28 13:36:58');
INSERT INTO `t_spu_photo` VALUES ('14', '5', '2', 'http', '0', '2018-06-28 13:36:58');
INSERT INTO `t_spu_photo` VALUES ('15', '5', '3', 'http', '0', '2018-06-28 13:36:58');
INSERT INTO `t_spu_photo` VALUES ('16', '6', '1', 'http', '1', '2018-06-28 13:37:13');
INSERT INTO `t_spu_photo` VALUES ('17', '6', '2', 'http', '0', '2018-06-28 13:37:13');
INSERT INTO `t_spu_photo` VALUES ('18', '6', '3', 'http', '0', '2018-06-28 13:37:13');
INSERT INTO `t_spu_photo` VALUES ('19', '7', '1', 'http', '1', '2018-06-28 13:37:22');
INSERT INTO `t_spu_photo` VALUES ('20', '7', '2', 'http', '0', '2018-06-28 13:37:22');
INSERT INTO `t_spu_photo` VALUES ('21', '7', '3', 'http', '0', '2018-06-28 13:37:22');
INSERT INTO `t_spu_photo` VALUES ('22', '8', '1', 'http', '1', '2018-06-28 13:37:44');
INSERT INTO `t_spu_photo` VALUES ('23', '8', '2', 'http', '0', '2018-06-28 13:37:44');
INSERT INTO `t_spu_photo` VALUES ('24', '8', '3', 'http', '0', '2018-06-28 13:37:44');
INSERT INTO `t_spu_photo` VALUES ('25', '9', '1', 'http', '1', '2018-06-28 13:38:07');
INSERT INTO `t_spu_photo` VALUES ('26', '9', '2', 'http', '0', '2018-06-28 13:38:07');
INSERT INTO `t_spu_photo` VALUES ('27', '9', '3', 'http', '0', '2018-06-28 13:38:07');
INSERT INTO `t_spu_photo` VALUES ('28', '10', '1', 'http', '1', '2018-06-28 13:38:47');
INSERT INTO `t_spu_photo` VALUES ('29', '10', '2', 'http', '0', '2018-06-28 13:38:47');
INSERT INTO `t_spu_photo` VALUES ('30', '10', '3', 'http', '0', '2018-06-28 13:38:47');
INSERT INTO `t_spu_photo` VALUES ('31', '11', '1', 'http', '1', '2018-06-28 13:39:49');
INSERT INTO `t_spu_photo` VALUES ('32', '11', '2', 'http', '0', '2018-06-28 13:39:49');
INSERT INTO `t_spu_photo` VALUES ('33', '11', '3', 'http', '0', '2018-06-28 13:39:49');
INSERT INTO `t_spu_photo` VALUES ('34', '12', '1', 'http', '1', '2018-06-28 13:40:13');
INSERT INTO `t_spu_photo` VALUES ('35', '12', '2', 'http', '0', '2018-06-28 13:40:13');
INSERT INTO `t_spu_photo` VALUES ('36', '12', '3', 'http', '0', '2018-06-28 13:40:13');

-- ----------------------------
-- Table structure for t_sys_configure
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_configure`;
CREATE TABLE `t_sys_configure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_service` varchar(50) DEFAULT NULL COMMENT '图片服务地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置表';

-- ----------------------------
-- Records of t_sys_configure
-- ----------------------------
INSERT INTO `t_sys_configure` VALUES ('1', 'http://192.168.168.5:8020');

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tile` varchar(50) DEFAULT NULL COMMENT '操作说明',
  `method` varchar(100) DEFAULT NULL COMMENT '方法名等',
  `ip` varchar(28) DEFAULT NULL COMMENT 'IP 地址',
  `params` text COMMENT '参数列表',
  `create_user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `create_user_name` varchar(20) DEFAULT NULL COMMENT ' 用户名称',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
INSERT INTO `t_sys_log` VALUES ('1', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":6, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 14:57:44');
INSERT INTO `t_sys_log` VALUES ('2', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 14:58:22');
INSERT INTO `t_sys_log` VALUES ('3', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 14:58:43');
INSERT INTO `t_sys_log` VALUES ('4', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 14:58:46');
INSERT INTO `t_sys_log` VALUES ('5', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 14:58:50');
INSERT INTO `t_sys_log` VALUES ('6', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 15:48:03');
INSERT INTO `t_sys_log` VALUES ('7', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:18:24');
INSERT INTO `t_sys_log` VALUES ('8', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:21:37');
INSERT INTO `t_sys_log` VALUES ('9', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:23:10');
INSERT INTO `t_sys_log` VALUES ('10', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"1个中国彩妆品牌到泰国卖彩妆 开会引千人参加\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b30641fadaa91.46647740.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"LCHEAR蕾琪集团22年来一直专注于彩妆的研发、生产及销售服务。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p class=\'ppTxt_imgbox\'><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529897233964190.jpg@85q_1wh.jpg\' title=\'蕾琪\' alt=\'蕾琪\' width=\'800\' height=\'310\' border=\'0\' vspace=\'0\' style=\'width: 100%; height: auto;\' class=\'innerBoxImg\'></p><p>6月21日，中国彩妆企业——LCHEAR蕾琪集团，在泰国曼谷举办一场以“新姿态·赢未来”为主题的跨国盛会。应邀出席会议的嘉宾除了来自中国各地区近千名美妆行业老板外，还有业界的专家、学者以及当地行业代表、多家媒体记者。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:23:46');
INSERT INTO `t_sys_log` VALUES ('11', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"有个韩国品牌用5年研发1款抗衰老产品 为啥？\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b304c051bf635.65573936.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"全球抗衰老市场将在2021年达到2160亿美元，同比增长7.5%\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>姑娘们的心底里，早就不认同以25岁来作为“衰老”的分界线了。在这个颜值高于一切的时代，越来越多的年轻消费者率先将“抗衰”这一诉求提上了日程。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:33:49');
INSERT INTO `t_sys_log` VALUES ('12', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"韩国消费者钱包收紧 韩妆盯上中国人爱去的免税店\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2cbf989b7186.58659775.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"受到中国游客欢迎的网上渠道和免税店正成为韩国化妆品的主要零售渠道。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>近日，韩国受最低薪资上涨等因素影响，劳动力需求减少，工作时间缩短，占家庭收入65%的劳动所得减少，导致韩国消费者钱包收紧，尤其是化妆品支出急剧减少。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:42:39');
INSERT INTO `t_sys_log` VALUES ('13', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"倒立敷面膜是什么新玩法？伊贝诗携手孙坚搞事情\\\", \\\"mainUrl\\\":\\\"http://image.hzpgc.com/upload/article/content/20180622/1529671710978716.png@85q_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"“倒立敷面膜”打造了一种护肤减压的新方式。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>面膜作为最基础、入门级的护肤用品，几乎每个人都会敷。可是，倒立着敷面膜你听说过吗？</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:48:17');
INSERT INTO `t_sys_log` VALUES ('14', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"倒立敷面膜是什么新玩法？伊贝诗携手孙坚搞事情\\\", \\\"mainUrl\\\":\\\"http://image.hzpgc.com/upload/article/content/20180622/1529671710978716.png@85q_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"“倒立敷面膜”打造了一种护肤减压的新方式。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>面膜作为最基础、入门级的护肤用品，几乎每个人都会敷。可是，倒立着敷面膜你听说过吗？</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 16:59:30');
INSERT INTO `t_sys_log` VALUES ('15', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"涂了防晒霜还被晒伤？你需要先了解防晒的3个常识\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2cc3c2a0fe74.81160708.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"“别让你的化妆品防晒打了折扣。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>大海航行靠舵手，万物生长靠太阳……”正如歌曲所唱的那样，阳光是人们生活中不可或缺的一部分。不过，如果长期在阳光下暴晒则会引起皮肤疾病。特别是在烈日炎炎的夏天，如何才能科学地防晒，以防受到紫外线伤害？</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 17:11:50');
INSERT INTO `t_sys_log` VALUES ('16', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"这12个在电商渠道卖得火热的进口品牌，今悉数布局CS店\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2ccd3c8bd768.70494038.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"为更高效的化妆品供需对接而生。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>有人说，马云改变了人们的购物方式，马化腾改变了人们的交流方式。同样的，电商的崛起和社交软件的流行也影响了化妆品行业，影响了消费者的决策和购买方式。  中国作为一个化妆品消费大国，历来是吸引了众多进口品前来掘金，然而由于直接拓展线下渠道的成本很高等原因，有很多进口品选择了首先试水线上，一经成功便开始拓展线下渠道。  这样一来，因为线上的口碑积累，这些品牌无需进一步的宣传便可赢得消费者的青睐，成为化妆品店里的流量品。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 17:13:35');
INSERT INTO `t_sys_log` VALUES ('17', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"卖不好彩妆的店有救了！它帮你把顾客拽回来！\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2c5e559450b1.13268763.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"顾客不进店，彩妆BA是关键。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>彩妆消费热度持续升温，但线下门店的日子却没有想象中那么好过。  我们走访市场发现，据多数店老板反应，彩妆顾客不进店已成为制约线下彩妆销售的首要原因。  在彩妆销售势头上升，整体消费提速的大背景下，顾客为何抛弃了原本具备“人货场”优势的线下门店？新一代顾客的彩妆消费又去了哪里呢？</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 17:14:52');
INSERT INTO `t_sys_log` VALUES ('18', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"特写｜娇兰佳人发力的药妆市场 还有多少玩家在抢\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2b2171d0b330.56302253.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"强大的市场需求给了这一品类在中国市场立足的机会。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p> “6·18购物节”的战线因为预售玩法和各种促销活动从一天拉长到了半个月之久。这期间，作为消费主力的女性又开始了囤货大战，其中最受欢迎的护肤产品是——面膜。也让它所代表的“药妆”品类首次杀入天猫美妆品牌单店销量排行榜前十。</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 17:17:38');
INSERT INTO `t_sys_log` VALUES ('19', '发布编辑资讯', 'com.ishop.controller.ArticleBaController.publishArticle()', '0:0:0:0:0:0:0:1', '{\"articleInfo\":[\"{\\\"categoryId\\\":3, \\\"title\\\":\\\"增长原力丨雅诗兰黛/欧莱雅是如何成就百年企业的\\\", \\\"mainUrl\\\":\\\"http://image.pinguan.com/upload/article/201806/5b2b7f624d66f3.44572164.jpg@122h_175w_1e_1c_1wh.jpg\\\", \\\"type\\\":\\\"1\\\", \\\"articleUrl\\\":\\\"\\\", \\\"author\\\":\\\"淘美妆APP\\\", \\\"source\\\":\\\"1\\\", \\\"digest\\\":\\\"信念的力量强大无比，甚至是最核心的力量。\\\", \\\"top_flag\\\":\\\"0\\\", \\\"viewMainFlag\\\":0 ,\\\"brandId\\\":1}\"],\"articleExtendInfo\":[\"{\\\"content\\\":\\\"<p><img src=\'http://image.hzpgc.com/upload/article/content/20180625/1529891678572560.jpg@85q_1wh.jpg\' title=\'Gdew奇缔\' alt=\'Gdew奇缔\' width=\'800\' height=\'450\' border=\'0\' vspace=\'0\' style=\'width: 800px; height: 450px;\'></p><p>在NBA这个世界最顶级的篮球赛场上，诞生过许多经典语录。其中最广为人知的恐怕源自篮球巨星科比，当有人问他为什么如此成功时，他回答：“你见过洛杉矶凌晨4点的样子吗</p>\\\", \\\"remark\\\":\\\"\\\"}\"]}', null, null, '2018-06-26 17:19:23');
INSERT INTO `t_sys_log` VALUES ('20', '新增短信模板信息', 'com.ishop.controller.SmsBaController.addSmsTemplate()', '0:0:0:0:0:0:0:1', '{\"templateName\":[\"审核通知\"],\"signName\":[\"淘美妆商会\"],\"templateCode\":[\"SMS_138130193\"],\"templateParam\":[\"{\\\"mtname\\\":\\\"%s\\\",\\\"submittime\\\":\\\"%s\\\"}\"]}', null, null, '2018-06-27 13:30:03');
INSERT INTO `t_sys_log` VALUES ('21', '新增短信模板信息', 'com.ishop.controller.SmsBaController.addSmsTemplate()', '0:0:0:0:0:0:0:1', '{\"templateName\":[\"审核通知\"],\"signName\":[\"淘美妆商会\"],\"templateCode\":[\"SMS_138130193\"],\"templateParam\":[\"{\\\"mtname\\\":\\\"%s\\\",\\\"submittime\\\":\\\"%s\\\"}\"]}', null, null, '2018-06-27 15:27:32');
INSERT INTO `t_sys_log` VALUES ('22', '新增短信模板信息', 'com.ishop.controller.SmsBaController.addSmsTemplate()', '0:0:0:0:0:0:0:1', '{\"templateName\":[\"审核通知\"],\"signName\":[\"淘美妆商会\"],\"templateCode\":[\"SMS_138130193\"],\"templateParam\":[\"{\\\"mtname\\\":\\\"%s\\\",\\\"submittime\\\":\\\"%s\\\"}\"]}', null, null, '2018-06-27 15:30:54');
INSERT INTO `t_sys_log` VALUES ('23', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"芙丽芳丝洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:33:37');
INSERT INTO `t_sys_log` VALUES ('24', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"兰蔻洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:34:43');
INSERT INTO `t_sys_log` VALUES ('25', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"雅思兰黛洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:34:50');
INSERT INTO `t_sys_log` VALUES ('26', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"纪梵希洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:35:18');
INSERT INTO `t_sys_log` VALUES ('27', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"香奈儿洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:35:29');
INSERT INTO `t_sys_log` VALUES ('28', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"阿玛尼洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:35:44');
INSERT INTO `t_sys_log` VALUES ('29', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"SK2洗面奶150ml美白\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:35:53');
INSERT INTO `t_sys_log` VALUES ('30', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"罗卜丁权杖口红\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:36:15');
INSERT INTO `t_sys_log` VALUES ('31', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"阿玛尼小胖丁权杖口红\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:36:38');
INSERT INTO `t_sys_log` VALUES ('32', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"纪梵希蜜粉\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:37:17');
INSERT INTO `t_sys_log` VALUES ('33', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"兰蔻小黑瓶\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:38:20');
INSERT INTO `t_sys_log` VALUES ('34', '发布编辑商品', 'com.ishop.controller.GoodsBaController.addDictData()', '0:0:0:0:0:0:0:1', '{\"sInfo\":[\"{\\\"spuName\\\":\\\"雅思兰黛粉底液\\\",\\\"stockCount\\\":20,\\\"brandId\\\":1,\\\"categoryId\\\":-1,\\\"advertorial\\\":\\\"卖点美白抖音同款\\\",\\\"videoUrl\\\":\\\"http://\\\",\\\"detailDesc\\\":\\\"图文详情\\\",\\\"spuParam\\\":\\\"[{\\\\\\\"id\\\\\\\":1,\\\\\\\"keyName\\\\\\\":\\\\\\\"品牌\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"芙丽芳丝\\\\\\\"},{\\\\\\\"id\\\\\\\":2,\\\\\\\"keyName\\\\\\\":\\\\\\\"产地\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"中国上海\\\\\\\"},{\\\\\\\"id\\\\\\\":3,\\\\\\\"keyName\\\\\\\":\\\\\\\"适合肤质\\\\\\\",\\\\\\\"keyValue\\\\\\\":\\\\\\\"所有肤质\\\\\\\"},{\\\\\\\"id\\\\\\\":4,\\\\\\\"keyName\\\\\\\":\\\\\\\"功效\\\\\\\",\\\\\\\"keyValue\\\\\\\":[\\\\\\\"干肤质\\\\\\\",\\\\\\\"油性肤质\\\\\\\"]}]\\\"}\"],\"skuList\":[\"[{\\\"skuName\\\":\\\"15ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":199.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1},{\\\"skuName\\\":\\\"150ml\\\",\\\"skuImgUrl\\\":\\\"http://\\\",\\\"stockNum\\\":10,\\\"skuPrice\\\":1990.99,\\\"minBuyNum\\\":1,\\\"maxBuyNum\\\":99,\\\"deleteFlag\\\":1}]\"],\"pList\":[\"[{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":1,\\\"sortNum\\\":1},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":2},{\\\"imgUrl\\\":\\\"http\\\",\\\"mainFlag\\\":0,\\\"sortNum\\\":3}]\"]}', null, null, '2018-06-28 13:38:44');
INSERT INTO `t_sys_log` VALUES ('35', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"芙丽芳丝面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":1,\\\"limitCount\\\":999}]\"]}', null, null, '2018-07-02 18:07:07');
INSERT INTO `t_sys_log` VALUES ('36', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"芙丽芳丝面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":1,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-02 18:08:03');
INSERT INTO `t_sys_log` VALUES ('37', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"芙丽芳丝面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":1,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-02 18:08:13');
INSERT INTO `t_sys_log` VALUES ('38', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"芙丽芳丝面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":1,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-02 18:08:33');
INSERT INTO `t_sys_log` VALUES ('39', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"芙丽芳丝面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":1,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-02 18:10:28');
INSERT INTO `t_sys_log` VALUES ('40', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"薇姿保湿套餐试用活动\\\",\\\"mainImage\\\":\\\"/2.jpg\\\",\\\"startTime\\\":\\\"2018-06-02 00:00:00\\\",\\\"endTime\\\":\\\"2018-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":2,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-03 15:16:43');
INSERT INTO `t_sys_log` VALUES ('41', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"薇姿面膜试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"试用流程 1、成为认证用户 2、免费申请试用 3、等待审核\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":2,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-04 11:25:27');
INSERT INTO `t_sys_log` VALUES ('42', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"理肤泉喷雾试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"<p> \\t<strong><span style=\\\"font-size:18px;\\\">试用流程</span></strong> </p> <p> \\t<span style=\\\"color:#666666;\\\">1、成为认证用户</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">申请试用者必须是淘美商会认证用户</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">2、免费申请试用</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">我们将为你提供各类化妆品免费试用机会</span> </p> <p> </p> <hr /> <a href=\\\"http://www.taobao.com\\\">点击打开链接</a><br />  <p> </p> <blockquote style=\\\"margin: 0 0 0 40px; border: none; padding: 0px;\\\"> \\t<p> \\t\\taaaa \\t</p> </blockquote>\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":2,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-04 11:28:15');
INSERT INTO `t_sys_log` VALUES ('43', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"理肤泉喷雾试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"<p> \\t<strong><span style=\\\"font-size:18px;\\\">试用流程</span></strong> </p> <p> \\t<span style=\\\"color:#666666;\\\">1、成为认证用户</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">申请试用者必须是淘美商会认证用户</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">2、免费申请试用</span> </p> <p> \\t<span style=\\\"color:#666666;\\\">我们将为你提供各类化妆品免费试用机会</span> </p> <p> </p> <hr /> <a href=\\\"http://www.taobao.com\\\">点击打开链接</a><br />  <p> </p> <blockquote style=\\\"margin: 0 0 0 40px; border: none; padding: 0px;\\\"> \\t<p> \\t\\taaaa \\t</p> </blockquote>\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":2,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-04 11:28:45');
INSERT INTO `t_sys_log` VALUES ('44', '发布编辑促销活动', 'com.ishop.controller.promotions.PromotionsBaController.publishGoods()', '0:0:0:0:0:0:0:1', '{\"pInfo\":[\"{\\\"promotionsId\\\":null,\\\"promotionsType\\\":\\\"trial\\\",\\\"promotionsName\\\":\\\"理肤泉喷雾试用活动\\\",\\\"mainImage\\\":\\\"/1.jpg\\\",\\\"startTime\\\":\\\"2018-07-02 00:00:00\\\",\\\"endTime\\\":\\\"2019-07-02 23:59:59\\\",\\\"priority\\\":1,\\\"shareFlag\\\":\\\"1\\\",\\\"discout\\\":10.0,\\\"buyLimit\\\":10,\\\"trialLimit\\\":100,\\\"description\\\":\\\"<p><strong><span style=\\\\\\\"font-size:18px;\\\\\\\">试用流程</span></strong> </p> <p> <span style=\\\\\\\"color:#666666;\\\\\\\">1、成为认证用户</span> </p> <p> <span style=\\\\\\\"color:#666666;\\\\\\\">申请试用者必须是淘美商会认证用户</span> </p> <p><span style=\\\\\\\"color:#666666;\\\\\\\">2、免费申请试用</span> </p> <p><span style=\\\\\\\"color:#666666;\\\\\\\">我们将为你提供各类化妆品免费试用机会</span> </p> <hr /><a href=\\\\\\\"http://www.taobao.com\\\\\\\">点击打开链接</a><br />\\\"}\"],\"gList\":[\"[{\\\"spuId\\\":2,\\\"limitCount\\\":999,\\\"deleteFlag\\\":1}]\"]}', null, null, '2018-07-04 11:34:45');
INSERT INTO `t_sys_log` VALUES ('45', '新增分类', 'com.ishop.controller.CategoryBaController.addCategory()', '0:0:0:0:0:0:0:1', '{\"name\":[\"护肤\"],\"pid\":[\"0\"],\"lev\":[\"1\"],\"type\":[\"2\"],\"imgUrl\":[\"/1.jpg\"]}', null, null, '2018-07-04 16:55:25');
INSERT INTO `t_sys_log` VALUES ('46', '新增分类', 'com.ishop.controller.CategoryBaController.addCategory()', '0:0:0:0:0:0:0:1', '{\"name\":[\"彩妆\"],\"pid\":[\"0\"],\"lev\":[\"1\"],\"type\":[\"2\"],\"imgUrl\":[\"/1.jpg\"]}', null, null, '2018-07-04 16:55:41');
INSERT INTO `t_sys_log` VALUES ('47', '新增分类', 'com.ishop.controller.CategoryBaController.addCategory()', '0:0:0:0:0:0:0:1', '{\"name\":[\"个护\"],\"pid\":[\"0\"],\"lev\":[\"1\"],\"type\":[\"2\"],\"imgUrl\":[\"/1.jpg\"]}', null, null, '2018-07-04 16:55:47');

-- ----------------------------
-- Table structure for t_template
-- ----------------------------
DROP TABLE IF EXISTS `t_template`;
CREATE TABLE `t_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_name` varchar(500) NOT NULL COMMENT '页面名称',
  `template_type` varchar(30) NOT NULL COMMENT '模板类型 1手机端 2PC端',
  `template_location` varchar(30) NOT NULL COMMENT '模板位置',
  `template_json` text COMMENT '模板装修字符串',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='模板表';

-- ----------------------------
-- Records of t_template
-- ----------------------------
INSERT INTO `t_template` VALUES ('1', '手机端首页模板', '1', 'APP_PAGE_INDEX', '[     {         \"height\":359,         \"width\":\"500\",         \"titleViewflag\":\"true\",         \"title\":\"推广轮播图\",         \"moduleData\":{             \"banner_array\":[                 {                     \"imgUrl\":\"http://img04.taobaocdn.com/imgextra/i4/869019299/TB2MHd_bXXXXXaHXpXXXXXXXXXX_!!869019299.jpg\",                     \"linkUrl\":\"http\"                 }             ],             \"fullScreen\":\"false\"         },         \"moduleName\":\"banner\",         \"moduleNameDesc\":\"轮播图模块\",         \"sort\":1     },     {         \"height\":359,         \"width\":\"500\",         \"titleViewflag\":\"false\",         \"title\":\"分类列表\",         \"moduleData\":{             \"menu_array\":[                 {                     \"name\":\"会员榜\",                     \"imgUrl\":\"moon.png\",                     \"linkUrl\":\"http\"                 },                 {                     \"name\":\"品牌库\",                     \"imgUrl\":\"nong.png\",                     \"linkUrl\":\"http\"                 },                 {                     \"name\":\"网红榜\",                     \"imgUrl\":\"qing.png\",                     \"linkUrl\":\"http\"                 },                 {                     \"name\":\"应用中心\",                     \"imgUrl\":\"zhong.png\",                     \"linkUrl\":\"http\"                 }             ],             \"fullScreen\":\"false\"         },         \"moduleName\":\"menu\",         \"moduleNameDesc\":\"分类模块\",         \"sort\":2     } ]', '2018-06-12 13:41:47', '2018-06-12 11:45:02');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_code` varchar(20) DEFAULT NULL COMMENT '会员编号',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `pass_word` varchar(100) NOT NULL COMMENT '用户密码',
  `sex` smallint(1) DEFAULT NULL COMMENT '性别（男-0,1-女）',
  `grade` varchar(10) DEFAULT '' COMMENT '用户等级',
  `growth_value` int(11) NOT NULL DEFAULT '0' COMMENT '用户成长值',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `image_url` varchar(50) DEFAULT NULL COMMENT '头像地址',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '用户昵称',
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `birthday` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户生日',
  `province` int(8) DEFAULT NULL COMMENT '省份',
  `city` int(8) DEFAULT NULL COMMENT '市',
  `district` int(8) DEFAULT NULL COMMENT '区',
  `wang_wang` varchar(20) DEFAULT NULL COMMENT '旺旺',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `wei_xin` varchar(20) DEFAULT NULL COMMENT '微信',
  `balance` decimal(11,0) DEFAULT '0' COMMENT '用户余额',
  `type` varchar(16) DEFAULT NULL COMMENT '会员类型（会员，会长）数据字典获取',
  `max_login_number` int(2) DEFAULT '5' COMMENT '允许设备最大接入数量',
  `to_ken` varchar(50) DEFAULT NULL COMMENT '用户登录身份令牌',
  `is_year_payment` tinyint(1) DEFAULT '0' COMMENT '是否年缴费( 0 - 否，1 - 是) 第一次缴费后必须按年缴费',
  `device_token` varchar(50) DEFAULT NULL COMMENT '登录设备token',
  `device_type` varchar(50) DEFAULT NULL COMMENT '登录设备类型',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `locked` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户是否被锁定(0:未锁定，1:锁定)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='C-端 用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', null, '18356238002', '123456', null, '一级', '0', '0', null, null, 'Jack', '2018-07-04 15:02:28', null, null, null, null, null, null, '0', null, '5', '57E62C0CA95999ABE1AEE1F2449DFC0E', '0', null, null, '2018-07-04 15:02:28', '0');
INSERT INTO `t_user` VALUES ('6', null, '17856348002', '123456', null, '一级', '0', '0', null, null, '17856348002', null, null, null, null, null, null, null, '0', null, '5', null, '0', null, null, '2018-06-27 18:23:15', '0');
INSERT INTO `t_user` VALUES ('9', null, '15026486249', '123456lijian', null, '一级', '0', '0', null, null, '15026486249', '2018-06-29 18:01:03', null, null, null, null, null, null, '0', null, '5', '00BDAE16B9C48E9FDB0978C3A03B0D85', '0', null, null, '2018-06-29 18:01:03', '0');
INSERT INTO `t_user` VALUES ('10', null, '18046438383', '888888a', null, '一级', '0', '0', null, null, '18046438383', '2018-07-03 11:15:57', null, null, null, null, null, null, '0', null, '5', 'B4E0618D168ABFCAF25762C68F2715B7', '0', null, null, '2018-07-03 11:15:57', '0');
INSERT INTO `t_user` VALUES ('11', null, '18022222222', '888888', null, '一级', '0', '0', null, null, '18022222222', null, null, null, null, null, null, null, '0', null, '5', null, '0', null, null, '2018-06-28 13:10:10', '0');
INSERT INTO `t_user` VALUES ('12', null, '18011111111', '006fa539472e7208d815ef7ed657a5e1', null, '一级', '0', '0', null, null, '18011111111', null, null, null, null, null, null, null, '0', null, '5', null, '0', null, null, '2018-06-28 14:23:51', '0');
INSERT INTO `t_user` VALUES ('13', '10010100', '13023189972', '123456789', '0', '一级', '0', '0', null, '廖兵', '13023189972', '2018-06-29 13:45:27', '1100', '2000', '3000', 'wangwang', 'qq', 'weixing', '0', 'huiyuan', '5', null, '0', null, null, '2018-06-29 13:45:27', '0');

-- ----------------------------
-- Table structure for t_user_auths
-- ----------------------------
DROP TABLE IF EXISTS `t_user_auths`;
CREATE TABLE `t_user_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `identify_type` varchar(2) DEFAULT NULL COMMENT '登陆类型',
  `wx_openid` varchar(256) DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(256) DEFAULT NULL COMMENT 'qq  openid',
  `credential` varchar(256) DEFAULT NULL COMMENT '授权凭证',
  `verified` int(1) DEFAULT NULL COMMENT '是否已经验证',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user_auths
-- ----------------------------
INSERT INTO `t_user_auths` VALUES ('1', '1', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('2', '2', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('3', '3', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('4', '4', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('5', '5', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('6', '6', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('7', '7', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('8', '8', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('9', '9', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('10', '10', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('11', '11', null, null, null, null, null);
INSERT INTO `t_user_auths` VALUES ('12', '12', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_user_category
-- ----------------------------
DROP TABLE IF EXISTS `t_user_category`;
CREATE TABLE `t_user_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `category_type` varchar(255) DEFAULT NULL COMMENT '用户类别（商会会员，网红，品牌方）',
  `status` smallint(1) DEFAULT '1' COMMENT '用户状态（1-申请中，2-审核中，3-审核通过待付费，4-审核通过已付费，5-已拒绝，6-会员过期）',
  `expiry_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户归属类别';

-- ----------------------------
-- Records of t_user_category
-- ----------------------------
INSERT INTO `t_user_category` VALUES ('1', '1', '商会会员', '4', '2019-08-08 11:26:05', '2018-07-04 11:26:24');
INSERT INTO `t_user_category` VALUES ('2', '1', '品牌方', '3', '2019-08-04 11:26:50', '2018-07-04 11:27:00');
INSERT INTO `t_user_category` VALUES ('3', '1', '网红', '4', '2019-08-04 14:44:32', '2018-07-04 14:44:45');
INSERT INTO `t_user_category` VALUES ('4', '1', 'BRAND_PARTY', '1', null, '2018-07-04 16:19:37');

-- ----------------------------
-- Table structure for t_user_label
-- ----------------------------
DROP TABLE IF EXISTS `t_user_label`;
CREATE TABLE `t_user_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `laban_code` varchar(16) NOT NULL COMMENT '标签 code (数据字典获取)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和标签关联表';

-- ----------------------------
-- Records of t_user_label
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_subaccount
-- ----------------------------
DROP TABLE IF EXISTS `t_user_subaccount`;
CREATE TABLE `t_user_subaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '主账号ID',
  `user_account` varchar(30) NOT NULL COMMENT '子账号',
  `pass_word` varchar(100) NOT NULL COMMENT '密码',
  `user_name` varchar(20) NOT NULL COMMENT '用户名字',
  `phone` varchar(16) NOT NULL COMMENT '手机号',
  `position` varchar(20) NOT NULL COMMENT '职位',
  `we_chat` varchar(30) NOT NULL COMMENT '微信',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `to_ken` varchar(100) DEFAULT NULL COMMENT '子账号登录令牌',
  `status` smallint(1) DEFAULT '1' COMMENT '状态（0 - 禁用，1 - 启用）',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户子账号';

-- ----------------------------
-- Records of t_user_subaccount
-- ----------------------------

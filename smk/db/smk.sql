/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : smk

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2014-12-02 15:50:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auto_db
-- ----------------------------
DROP TABLE IF EXISTS `auto_db`;
CREATE TABLE `auto_db` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) NOT NULL,
  `db_type` varchar(64) NOT NULL,
  `db_url` varchar(256) NOT NULL,
  `db_account` varchar(64) NOT NULL,
  `db_pwd` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自动生成_数据库';

-- ----------------------------
-- Records of auto_db
-- ----------------------------
INSERT INTO `auto_db` VALUES ('1', '企信通', 'mysql', 'jdbc:mysql://localhost:3306/smk?useUnicode=true&characterEncoding=UTF-8', 'root', 'root');

-- ----------------------------
-- Table structure for auto_db_table
-- ----------------------------
DROP TABLE IF EXISTS `auto_db_table`;
CREATE TABLE `auto_db_table` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) NOT NULL,
  `table_zh_name` varchar(128) NOT NULL,
  `table_class_name` varchar(64) DEFAULT NULL,
  `db_id` varchar(32) NOT NULL,
  `class_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='自动生成_数据库表';

-- ----------------------------
-- Records of auto_db_table
-- ----------------------------
INSERT INTO `auto_db_table` VALUES ('1', 'sys_user', '用户表', 'SysUser', '1', '1');

-- ----------------------------
-- Table structure for auto_db_table_class
-- ----------------------------
DROP TABLE IF EXISTS `auto_db_table_class`;
CREATE TABLE `auto_db_table_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `class_name` varchar(64) NOT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT '0' COMMENT '父id',
  `db_id` varchar(32) NOT NULL COMMENT '所属数据库',
  `class_package` varchar(64) NOT NULL COMMENT '数据库包',
  `url_path` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='自动生成_数据库表分类';

-- ----------------------------
-- Records of auto_db_table_class
-- ----------------------------
INSERT INTO `auto_db_table_class` VALUES ('1', '后台管理', '0', '1', 'com.shareinfo.adminManage', 'adminManage');
INSERT INTO `auto_db_table_class` VALUES ('2', 'web客户端管理', '0', '1', 'com.shareinfo.ent.manage', 'webclient');
INSERT INTO `auto_db_table_class` VALUES ('3', '自动生成', '1', '1', 'com.shareinfo.adminManage.auto', 'auto');
INSERT INTO `auto_db_table_class` VALUES ('4', '用户管理', '1', '1', 'com.shareinfo.adminManage.ent', 'ent');
INSERT INTO `auto_db_table_class` VALUES ('5', '系统管理', '1', '1', 'com.shareinfo.adminManage.sys', 'sys');

-- ----------------------------
-- Table structure for auto_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `auto_dictionary`;
CREATE TABLE `auto_dictionary` (
  `id` varchar(32) NOT NULL,
  `dictionary_name` varchar(64) DEFAULT NULL,
  `dictionary_value` varchar(128) DEFAULT NULL,
  `class_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_字典表';

-- ----------------------------
-- Records of auto_dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for auto_dictionary_class
-- ----------------------------
DROP TABLE IF EXISTS `auto_dictionary_class`;
CREATE TABLE `auto_dictionary_class` (
  `class_id` varchar(32) NOT NULL,
  `class_name` varchar(64) DEFAULT NULL,
  `class_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_字典分类表';

-- ----------------------------
-- Records of auto_dictionary_class
-- ----------------------------

-- ----------------------------
-- Table structure for auto_project
-- ----------------------------
DROP TABLE IF EXISTS `auto_project`;
CREATE TABLE `auto_project` (
  `id` varchar(32) NOT NULL,
  `project_name` varchar(64) DEFAULT NULL,
  `project_desc` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_模型项目';

-- ----------------------------
-- Records of auto_project
-- ----------------------------

-- ----------------------------
-- Table structure for auto_project_template_relation
-- ----------------------------
DROP TABLE IF EXISTS `auto_project_template_relation`;
CREATE TABLE `auto_project_template_relation` (
  `project_id` varchar(32) NOT NULL,
  `template_id` varchar(32) NOT NULL,
  PRIMARY KEY (`project_id`,`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_项目模型关系表';

-- ----------------------------
-- Records of auto_project_template_relation
-- ----------------------------

-- ----------------------------
-- Table structure for auto_template
-- ----------------------------
DROP TABLE IF EXISTS `auto_template`;
CREATE TABLE `auto_template` (
  `id` varchar(32) NOT NULL,
  `template_name` varchar(64) DEFAULT NULL,
  `template_type` varchar(64) DEFAULT NULL COMMENT '通过数据字典来（mybatis、hibernate等）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_模型';

-- ----------------------------
-- Records of auto_template
-- ----------------------------

-- ----------------------------
-- Table structure for auto_template_file
-- ----------------------------
DROP TABLE IF EXISTS `auto_template_file`;
CREATE TABLE `auto_template_file` (
  `id` varchar(32) NOT NULL,
  `file_name` varchar(64) DEFAULT NULL,
  `file_desc` varchar(64) DEFAULT NULL,
  `file_path` varchar(256) DEFAULT NULL,
  `file_content` text,
  `template_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动生成_模板文件';

-- ----------------------------
-- Records of auto_template_file
-- ----------------------------

-- ----------------------------
-- Table structure for blog_class
-- ----------------------------
DROP TABLE IF EXISTS `blog_class`;
CREATE TABLE `blog_class` (
  `class_id` varchar(32) NOT NULL,
  `class_name` varchar(128) DEFAULT NULL,
  `pclass_id` varchar(32) DEFAULT NULL,
  `class_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客分类';

-- ----------------------------
-- Records of blog_class
-- ----------------------------

-- ----------------------------
-- Table structure for demo_user
-- ----------------------------
DROP TABLE IF EXISTS `demo_user`;
CREATE TABLE `demo_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo_user
-- ----------------------------
INSERT INTO `demo_user` VALUES ('63', '94300452@qq.com', '黄鹏', 'hp', null);

-- ----------------------------
-- Table structure for ent_info
-- ----------------------------
DROP TABLE IF EXISTS `ent_info`;
CREATE TABLE `ent_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业编号',
  `ent_name` varchar(64) DEFAULT NULL COMMENT '企业名称',
  `state` int(11) DEFAULT NULL COMMENT '状态：0正常 1锁定 -1删除',
  `addtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业信息';

-- ----------------------------
-- Records of ent_info
-- ----------------------------

-- ----------------------------
-- Table structure for ent_linkman
-- ----------------------------
DROP TABLE IF EXISTS `ent_linkman`;
CREATE TABLE `ent_linkman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ent_id` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '联系人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业联系人';

-- ----------------------------
-- Records of ent_linkman
-- ----------------------------

-- ----------------------------
-- Table structure for gupiao_attention
-- ----------------------------
DROP TABLE IF EXISTS `gupiao_attention`;
CREATE TABLE `gupiao_attention` (
  `id` int(11) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `desc` varchar(512) DEFAULT NULL COMMENT '描述',
  `userid` int(11) DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注股';

-- ----------------------------
-- Records of gupiao_attention
-- ----------------------------

-- ----------------------------
-- Table structure for gupiao_benqian
-- ----------------------------
DROP TABLE IF EXISTS `gupiao_benqian`;
CREATE TABLE `gupiao_benqian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(8) DEFAULT NULL COMMENT '转入时间 yyyymmdd',
  `type` tinyint(1) DEFAULT NULL COMMENT '0新存入 1新取出 2当日结算本金',
  `money` float(10,2) DEFAULT NULL COMMENT '金额',
  `desc` varchar(512) DEFAULT NULL COMMENT '描述',
  `userid` int(11) DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='股票本金转入流水';

-- ----------------------------
-- Records of gupiao_benqian
-- ----------------------------
INSERT INTO `gupiao_benqian` VALUES ('1', '20140101', '0', '20000.00', '原始本金存入', '1');
INSERT INTO `gupiao_benqian` VALUES ('2', '20141114', '0', '3000.00', '追加', '1');
INSERT INTO `gupiao_benqian` VALUES ('3', '20141114', '2', '20150.75', null, '1');

-- ----------------------------
-- Table structure for gupiao_business
-- ----------------------------
DROP TABLE IF EXISTS `gupiao_business`;
CREATE TABLE `gupiao_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(255) DEFAULT NULL COMMENT '时间：yyyymmdd',
  `code` varchar(32) DEFAULT NULL COMMENT '股票代码',
  `type` tinyint(1) DEFAULT NULL COMMENT '0新买入 1新卖出',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `share` int(11) DEFAULT NULL COMMENT '多少股',
  `userid` int(11) DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='股票买卖流水';

-- ----------------------------
-- Records of gupiao_business
-- ----------------------------
INSERT INTO `gupiao_business` VALUES ('1', '20141114', '600418', '0', '11.12', '400', '1');

-- ----------------------------
-- Table structure for hp_sys_department
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_department`;
CREATE TABLE `hp_sys_department` (
  `dept_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_dept_id` int(11) NOT NULL DEFAULT '0',
  `dept_remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息';

-- ----------------------------
-- Records of hp_sys_department
-- ----------------------------
INSERT INTO `hp_sys_department` VALUES ('1', '测试1', '0', null);
INSERT INTO `hp_sys_department` VALUES ('2', '测试2', '0', null);
INSERT INTO `hp_sys_department` VALUES ('3', '测试', '0', null);

-- ----------------------------
-- Table structure for hp_sys_function
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_function`;
CREATE TABLE `hp_sys_function` (
  `fun_id` varchar(32) NOT NULL,
  `fun_name` varchar(50) NOT NULL,
  `parent_fun_id` varchar(32) DEFAULT 'root',
  `fun_order` varchar(255) DEFAULT NULL,
  `fun_url` varchar(100) DEFAULT NULL,
  `icon_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fun_id`),
  KEY `FKD20FBACFB266419E` (`icon_id`),
  CONSTRAINT `FKD20FBACFB266419E` FOREIGN KEY (`icon_id`) REFERENCES `hp_sys_icon` (`icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统功能';

-- ----------------------------
-- Records of hp_sys_function
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_function_power
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_function_power`;
CREATE TABLE `hp_sys_function_power` (
  `power_id` varchar(32) NOT NULL,
  `fun_id` varchar(32) NOT NULL,
  `power_name` varchar(50) NOT NULL,
  `power_order` varchar(255) DEFAULT NULL,
  `power_url` varchar(100) DEFAULT NULL,
  `icon_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`power_id`),
  KEY `FKD20FBACFB266419E` (`icon_id`),
  KEY `fun_id` (`fun_id`),
  CONSTRAINT `hp_sys_function_power_ibfk_1` FOREIGN KEY (`fun_id`) REFERENCES `hp_sys_function` (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统功能权限';

-- ----------------------------
-- Records of hp_sys_function_power
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_icon
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_icon`;
CREATE TABLE `hp_sys_icon` (
  `icon_id` varchar(255) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `iconclas` varchar(200) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `path` longtext,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`icon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图标';

-- ----------------------------
-- Records of hp_sys_icon
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_menu`;
CREATE TABLE `hp_sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `is_activiti` char(1) DEFAULT NULL COMMENT '是否同步工作流',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`(255)),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of hp_sys_menu
-- ----------------------------
INSERT INTO `hp_sys_menu` VALUES ('1', '0', '0,', '顶级菜单', '', '', '', '0', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '/sys/dict/', '', 'th-list', '60', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '', '', '', '30', '0', '0', 'sys:dict:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '', '', '', '30', '0', '0', 'sys:dict:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '', '', '', '970', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '/sys/area/', '', 'th', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '', '', '', '30', '0', '0', 'sys:area:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '', '', '', '30', '0', '0', 'sys:area:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '/sys/office/', '', 'th-large', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '', '', '', '30', '0', '0', 'sys:office:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '', '', '', '30', '0', '0', 'sys:office:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '', '', '', '900', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '/sys/user/', '', 'user', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '', '', '', '30', '0', '0', 'sys:user:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '', '', '', '30', '0', '0', 'sys:user:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('24', '23', '0,1,2,23', '项目首页', 'http://jeesite.com', '_blank', '', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', 'http://jeesite.com/donation.html', '_blank', '', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', 'http://bbs.jeesite.com', '_blank', '', '80', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '', '', '', '100', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '/sys/user/info', '', 'user', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '', '', '', '980', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '/sys/user/modifyPwd', '', 'lock', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '', '', '', '500', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '/cms/category/', '', 'align-justify', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '', '', '', '30', '0', '0', 'cms:category:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '', '', '', '30', '0', '0', 'cms:category:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '/cms/site/', '', 'certificate', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '', '', '', '30', '0', '0', 'cms:site:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '', '', '', '30', '0', '0', 'cms:site:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '/cms/site/select', '', 'retweet', '50', '1', '0', 'cms:site:select', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '/sys/menu/', '', 'list-alt', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '', '', '', '500', '1', '0', 'cms:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '/cms/', '', 'briefcase', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '/cms/article/', '', 'file', '40', '0', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '', '', '', '30', '0', '0', 'cms:article:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '', '', '', '30', '0', '0', 'cms:article:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '', '', '', '30', '0', '0', 'cms:article:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '/cms/link/', '', 'random', '60', '0', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '', '', '', '30', '0', '0', 'cms:link:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '', '', '', '30', '0', '0', 'cms:link:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '', '', '', '30', '0', '0', 'cms:link:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '', '', '', '30', '0', '0', 'sys:menu:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '/cms/comment/?status=2', '', 'comment', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '', '', '', '30', '0', '0', 'cms:comment:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '', '', '', '30', '0', '0', 'cms:comment:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '/cms/guestbook/?status=2', '', 'glass', '80', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '', '', '', '30', '0', '0', 'cms:guestbook:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '', '', '', '30', '0', '0', 'cms:guestbook:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('56', '40', '0,1,31,40,', '文件管理', '/../static/ckfinder/ckfinder.html', '', 'folder-open', '90', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('57', '56', '0,1,31,40,56,', '查看', '', '', '', '30', '0', '0', 'cms:ckfinder:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('58', '56', '0,1,31,40,56,', '上传', '', '', '', '30', '0', '0', 'cms:ckfinder:upload', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('59', '56', '0,1,31,40,56,', '修改', '', '', '', '30', '0', '0', 'cms:ckfinder:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '', '', '', '30', '0', '0', 'sys:menu:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '', '', '', '600', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '/cms/stats/article', '', 'tasks', '30', '1', '0', 'cms:stats:article', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '', '', '', '200', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '', '', '', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '/oa/leave', '', 'leaf', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '', '', '', '30', '0', '0', 'oa:leave:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '', '', '', '40', '0', '0', 'oa:leave:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '', '', '', '985', '1', '0', '', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '/sys/log', '', 'pencil', '30', '1', '0', 'sys:log:view', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('69', '2', '0,1,2,', '流程管理', '', '', '', '983', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '/sys/role/', '', 'lock', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('70', '69', '0,1,2,69,', '流程管理', '/sys/workflow/processList', '', 'road', '300', '1', '0', 'sys:workflow:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('71', '64', '0,1,62,63,64,', '部门领导审批', '', '', '', '50', '0', '1', 'oa:leave:deptLeaderAudit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('72', '64', '0,1,62,63,64,', '人事审批', '', '', '', '60', '0', '1', 'oa:leave:hrAudit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('73', '32', '0,1,31,32', '模板管理', '/cms/template', '', 'pencil', '40', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('74', '73', '0,1,31,32,73,', '查看', '', '', '', '30', '0', '0', 'cms:template:view', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('75', '73', '0,1,31,32,73,', '修改', '', '', '', '30', '0', '0', 'cms:template:edit', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('76', '1', '0,1,', '项目管理', '', '', '', '1000', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('77', '76', '0,1,76,', '项目数据', '', '', '', '30', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('78', '77', '0,1,76,77,', '项目管理', '/prj/project/', '', 'globe', '30', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('79', '78', '0,1,76,77,78,', '查看', '', '', '', '30', '0', '0', 'prj:project:view', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '', '', '', '30', '0', '0', 'sys:role:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('80', '78', '0,1,76,77,78,', '修改', '', '', '', '40', '0', '0', 'prj:project:edit', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `hp_sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '', '', '', '30', '0', '0', 'sys:role:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for hp_sys_online
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_online`;
CREATE TABLE `hp_sys_online` (
  `ID` varchar(32) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `LOGINDATETIME` datetime NOT NULL,
  `LOGINNAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户';

-- ----------------------------
-- Records of hp_sys_online
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_role`;
CREATE TABLE `hp_sys_role` (
  `role_id` varchar(255) NOT NULL,
  `rolename` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息';

-- ----------------------------
-- Records of hp_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_role_function`;
CREATE TABLE `hp_sys_role_function` (
  `id` varchar(255) NOT NULL,
  `fun_id` varchar(255) DEFAULT NULL,
  `role_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sys_role_function_ibfk_1` (`fun_id`),
  KEY `sys_role_function_ibfk_2` (`role_id`),
  CONSTRAINT `hp_sys_role_function_ibfk_1` FOREIGN KEY (`fun_id`) REFERENCES `hp_sys_function` (`fun_id`),
  CONSTRAINT `hp_sys_role_function_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `hp_sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能关系';

-- ----------------------------
-- Records of hp_sys_role_function
-- ----------------------------

-- ----------------------------
-- Table structure for hp_sys_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_sequence`;
CREATE TABLE `hp_sys_sequence` (
  `seq_name` varchar(32) NOT NULL,
  `seq_num` bigint(20) NOT NULL DEFAULT '1',
  `seq_remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统游标';

-- ----------------------------
-- Records of hp_sys_sequence
-- ----------------------------
INSERT INTO `hp_sys_sequence` VALUES ('sys_department_id', '3', null);

-- ----------------------------
-- Table structure for hp_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_user`;
CREATE TABLE `hp_sys_user` (
  `USER_ID` varchar(20) NOT NULL DEFAULT '',
  `PWD` varchar(50) NOT NULL DEFAULT '',
  `JOIN_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LOGINS` int(11) NOT NULL DEFAULT '1',
  `LAST_LOGIN_DATE` datetime DEFAULT NULL,
  `LAST_LOGIN_IP` varchar(20) DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '0',
  `MOBILE` varchar(11) DEFAULT NULL,
  `EMAIL` varchar(60) DEFAULT NULL,
  `USER_REMARK` varchar(250) DEFAULT NULL,
  `dept_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`USER_ID`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `hp_sys_user_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `hp_sys_department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

-- ----------------------------
-- Records of hp_sys_user
-- ----------------------------
INSERT INTO `hp_sys_user` VALUES ('94300452', '123456', '2014-07-16 14:51:31', '0', '2014-07-16 14:51:31', '127.0.0.1', '0', '18107218207', '94300452@qq.com', '', '1');
INSERT INTO `hp_sys_user` VALUES ('94300453', '123456', '2014-07-16 15:26:36', '0', '2014-07-16 15:26:36', '127.0.0.1', '0', '18107218207', '94300452@qq.com', '', '1');
INSERT INTO `hp_sys_user` VALUES ('hp', '123', '0000-00-00 00:00:00', '1', null, null, '1', null, null, null, '1');
INSERT INTO `hp_sys_user` VALUES ('hp1', '123', '0000-00-00 00:00:00', '1', null, null, '1', null, null, null, '1');
INSERT INTO `hp_sys_user` VALUES ('zj', '123', '0000-00-00 00:00:00', '1', null, null, '1', null, null, null, '1');

-- ----------------------------
-- Table structure for hp_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `hp_sys_user_role`;
CREATE TABLE `hp_sys_user_role` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `sys_role_user_ibfk_2` (`role_id`),
  CONSTRAINT `hp_sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `hp_sys_user` (`USER_ID`),
  CONSTRAINT `hp_sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `hp_sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系';

-- ----------------------------
-- Records of hp_sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) NOT NULL COMMENT '区域名称',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_parent_ids` (`parent_ids`(255)),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '100000', '中国', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('10', '8', '0,1,2,', '370532', '历城区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('11', '8', '0,1,2,', '370533', '历城区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('12', '8', '0,1,2,', '370534', '历下区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('13', '8', '0,1,2,', '370535', '天桥区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('14', '8', '0,1,2,', '370536', '槐荫区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '110000', '北京市', '2', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '110101', '东城区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('4', '2', '0,1,2,', '110102', '西城区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('5', '2', '0,1,2,', '110103', '朝阳区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('6', '2', '0,1,2,', '110104', '丰台区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('7', '2', '0,1,2,', '110105', '海淀区', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('8', '1', '0,1,', '370000', '山东省', '2', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('9', '8', '0,1,2,', '370531', '济南市', '3', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '删除', '1', 'del_flag', '删除标记', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('23', '一级', '1', 'sys_office_grade', '机构等级', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('24', '二级', '2', 'sys_office_grade', '机构等级', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('25', '三级', '3', 'sys_office_grade', '机构等级', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('26', '四级', '4', 'sys_office_grade', '机构等级', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('28', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('29', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('30', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('31', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('32', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('33', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('34', '系统管理', '1', 'sys_user_type', '用户类型', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('35', '部门经理', '2', 'sys_user_type', '用户类型', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('36', '普通用户', '3', 'sys_user_type', '用户类型', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('37', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('38', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('39', '红色主题', 'red', 'cms_theme', '站点主题', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('40', '文章模型', 'article', 'cms_module', '栏目模型', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('41', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('42', '下载模型', 'download', 'cms_module', '栏目模型', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('43', '链接模型', 'link', 'cms_module', '栏目模型', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('44', '专题模型', 'special', 'cms_module', '栏目模型', '50', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_dict` VALUES ('45', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('46', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('47', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('48', '发布', '0', 'cms_del_flag', '内容状态', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('49', '删除', '1', 'cms_del_flag', '内容状态', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('50', '审核', '2', 'cms_del_flag', '内容状态', '15', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('51', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('53', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('54', '建议', '2', 'cms_guestbook', '留言板分类', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('55', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('56', '其它', '4', 'cms_guestbook', '留言板分类', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('57', '公休', '1', 'oa_leave_type', '请假类型', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('58', '病假', '2', 'oa_leave_type', '请假类型', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('59', '事假', '3', 'oa_leave_type', '请假类型', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('60', '调休', '4', 'oa_leave_type', '请假类型', '40', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('61', '婚假', '5', 'oa_leave_type', '请假类型', '60', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('62', '接入日志', '1', 'sys_log_type', '日志类型', '30', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('63', '异常日志', '2', 'sys_log_type', '日志类型', '40', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('64', '单表增删改查', 'single', 'prj_template_type', '代码模板', '10', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('65', '所有entity和dao', 'entityAndDao', 'prj_template_type', '代码模板', '20', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('38ff9282390c4b0982a3810664dfb69a', '1', '2', '2014-09-17 14:54:42', '127.0.0.1', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '/jeesite/a/oa/leave/save', 'POST', 'id=&startTime=2014-09-10 14:54:29&reason=afas&endTime=2017-10-12 14:54:34', '');

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_parent_ids` (`parent_ids`(255)),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `is_activiti` char(1) DEFAULT NULL COMMENT '是否同步工作流',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_parent_ids` (`parent_ids`(255)),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '顶级菜单', '', '', '', '0', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '/sys/dict/', '', 'th-list', '60', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '', '', '', '30', '0', '0', 'sys:dict:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '', '', '', '30', '0', '0', 'sys:dict:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '', '', '', '970', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '/sys/area/', '', 'th', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '', '', '', '30', '0', '0', 'sys:area:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '', '', '', '30', '0', '0', 'sys:area:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '/sys/office/', '', 'th-large', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '', '', '', '30', '0', '0', 'sys:office:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '', '', '', '30', '0', '0', 'sys:office:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '', '', '', '900', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '/sys/user/', '', 'user', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '', '', '', '30', '0', '0', 'sys:user:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '', '', '', '30', '0', '0', 'sys:user:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '项目首页', 'http://jeesite.com', '_blank', '', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', 'http://jeesite.com/donation.html', '_blank', '', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', 'http://bbs.jeesite.com', '_blank', '', '80', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '', '', '', '100', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '/sys/user/info', '', 'user', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '', '', '', '980', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '/sys/user/modifyPwd', '', 'lock', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '', '', '', '500', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '', '', '', '990', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '/cms/category/', '', 'align-justify', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '', '', '', '30', '0', '0', 'cms:category:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '', '', '', '30', '0', '0', 'cms:category:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '/cms/site/', '', 'certificate', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '', '', '', '30', '0', '0', 'cms:site:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '', '', '', '30', '0', '0', 'cms:site:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '/cms/site/select', '', 'retweet', '50', '1', '0', 'cms:site:select', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '/sys/menu/', '', 'list-alt', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '', '', '', '500', '1', '0', 'cms:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '/cms/', '', 'briefcase', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '/cms/article/', '', 'file', '40', '0', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '', '', '', '30', '0', '0', 'cms:article:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '', '', '', '30', '0', '0', 'cms:article:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '', '', '', '30', '0', '0', 'cms:article:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '/cms/link/', '', 'random', '60', '0', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '', '', '', '30', '0', '0', 'cms:link:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '', '', '', '30', '0', '0', 'cms:link:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '', '', '', '30', '0', '0', 'cms:link:audit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '', '', '', '30', '0', '0', 'sys:menu:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '/cms/comment/?status=2', '', 'comment', '40', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '', '', '', '30', '0', '0', 'cms:comment:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '', '', '', '30', '0', '0', 'cms:comment:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '/cms/guestbook/?status=2', '', 'glass', '80', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '', '', '', '30', '0', '0', 'cms:guestbook:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '', '', '', '30', '0', '0', 'cms:guestbook:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '40', '0,1,31,40,', '文件管理', '/../static/ckfinder/ckfinder.html', '', 'folder-open', '90', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,31,40,56,', '查看', '', '', '', '30', '0', '0', 'cms:ckfinder:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,31,40,56,', '上传', '', '', '', '30', '0', '0', 'cms:ckfinder:upload', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,31,40,56,', '修改', '', '', '', '30', '0', '0', 'cms:ckfinder:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '', '', '', '30', '0', '0', 'sys:menu:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '', '', '', '600', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '/cms/stats/article', '', 'tasks', '30', '1', '0', 'cms:stats:article', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '', '', '', '200', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '', '', '', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '/oa/leave', '', 'leaf', '30', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '', '', '', '30', '0', '0', 'oa:leave:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '', '', '', '40', '0', '0', 'oa:leave:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '', '', '', '985', '1', '0', '', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '/sys/log', '', 'pencil', '30', '1', '0', 'sys:log:view', '1', '2013-06-03 00:00:00', '1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('69', '2', '0,1,2,', '流程管理', '', '', '', '983', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '/sys/role/', '', 'lock', '50', '1', '0', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,2,69,', '流程管理', '/sys/workflow/processList', '', 'road', '300', '1', '0', 'sys:workflow:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '64', '0,1,62,63,64,', '部门领导审批', '', '', '', '50', '0', '1', 'oa:leave:deptLeaderAudit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('72', '64', '0,1,62,63,64,', '人事审批', '', '', '', '60', '0', '1', 'oa:leave:hrAudit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('73', '32', '0,1,31,32', '模板管理', '/cms/template', '', 'pencil', '40', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('74', '73', '0,1,31,32,73,', '查看', '', '', '', '30', '0', '0', 'cms:template:view', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('75', '73', '0,1,31,32,73,', '修改', '', '', '', '30', '0', '0', 'cms:template:edit', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('76', '1', '0,1,', '项目管理', '', '', '', '1000', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('77', '76', '0,1,76,', '项目数据', '', '', '', '30', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('78', '77', '0,1,76,77,', '项目管理', '/prj/project/', '', 'globe', '30', '1', '0', '', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('79', '78', '0,1,76,77,78,', '查看', '', '', '', '30', '0', '0', 'prj:project:view', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '', '', '', '30', '0', '0', 'sys:role:view', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('80', '78', '0,1,76,77,78,', '修改', '', '', '', '40', '0', '0', 'prj:project:edit', '1', '2013-12-12 00:00:00', '1', '2013-12-12 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '', '', '', '30', '0', '0', 'sys:role:edit', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `name` varchar(100) NOT NULL COMMENT '机构名称',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_parent_ids` (`parent_ids`(255)),
  KEY `sys_office_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '2', '100000', '北京市总公司', '1', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '8', '200003', '市场部', '2', '2', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '8', '200004', '技术部', '2', '2', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '9', '201000', '济南市分公司', '1', '3', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '9', '201001', '公司领导', '2', '3', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '9', '201002', '综合部', '2', '3', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '9', '201003', '市场部', '2', '3', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '9', '201004', '技术部', '2', '3', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('17', '12', '0,1,7,12,', '11', '201010', '济南市历城区分公司', '1', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,12,17,', '11', '201011', '公司领导', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,12,17,', '11', '201012', '综合部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '2', '100001', '公司领导', '2', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,12,17,', '11', '201013', '市场部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,12,17,', '11', '201014', '技术部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('22', '12', '0,1,7,12,', '12', '201020', '济南市历下区分公司', '1', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,12,22,', '12', '201021', '公司领导', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,12,22,', '12', '201022', '综合部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,12,22,', '12', '201023', '市场部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,12,22,', '12', '201024', '技术部', '2', '4', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '2', '100002', '人力部', '2', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '2', '100003', '市场部', '2', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '2', '100004', '技术部', '2', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '2', '100005', '研发部', '2', '1', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '8', '200000', '山东省分公司', '1', '2', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '8', '200001', '公司领导', '2', '2', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '8', '200002', '综合部', '2', '2', '', '', '', '', '', '', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', '1', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', '2', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', '3', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', '4', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', '5', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', '8', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('7', '7', '山东省管理员', '9', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '25');
INSERT INTO `sys_role_menu` VALUES ('2', '26');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '13');
INSERT INTO `sys_role_menu` VALUES ('4', '14');
INSERT INTO `sys_role_menu` VALUES ('4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '16');
INSERT INTO `sys_role_menu` VALUES ('4', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '2');
INSERT INTO `sys_role_menu` VALUES ('4', '20');
INSERT INTO `sys_role_menu` VALUES ('4', '21');
INSERT INTO `sys_role_menu` VALUES ('4', '22');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '26');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '30');
INSERT INTO `sys_role_menu` VALUES ('4', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '33');
INSERT INTO `sys_role_menu` VALUES ('4', '34');
INSERT INTO `sys_role_menu` VALUES ('4', '35');
INSERT INTO `sys_role_menu` VALUES ('4', '36');
INSERT INTO `sys_role_menu` VALUES ('4', '37');
INSERT INTO `sys_role_menu` VALUES ('4', '38');
INSERT INTO `sys_role_menu` VALUES ('4', '39');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '40');
INSERT INTO `sys_role_menu` VALUES ('4', '41');
INSERT INTO `sys_role_menu` VALUES ('4', '42');
INSERT INTO `sys_role_menu` VALUES ('4', '43');
INSERT INTO `sys_role_menu` VALUES ('4', '44');
INSERT INTO `sys_role_menu` VALUES ('4', '45');
INSERT INTO `sys_role_menu` VALUES ('4', '46');
INSERT INTO `sys_role_menu` VALUES ('4', '47');
INSERT INTO `sys_role_menu` VALUES ('4', '48');
INSERT INTO `sys_role_menu` VALUES ('4', '49');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '50');
INSERT INTO `sys_role_menu` VALUES ('4', '51');
INSERT INTO `sys_role_menu` VALUES ('4', '52');
INSERT INTO `sys_role_menu` VALUES ('4', '53');
INSERT INTO `sys_role_menu` VALUES ('4', '54');
INSERT INTO `sys_role_menu` VALUES ('4', '55');
INSERT INTO `sys_role_menu` VALUES ('4', '56');
INSERT INTO `sys_role_menu` VALUES ('4', '57');
INSERT INTO `sys_role_menu` VALUES ('4', '58');
INSERT INTO `sys_role_menu` VALUES ('4', '59');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '60');
INSERT INTO `sys_role_menu` VALUES ('4', '61');
INSERT INTO `sys_role_menu` VALUES ('4', '62');
INSERT INTO `sys_role_menu` VALUES ('4', '63');
INSERT INTO `sys_role_menu` VALUES ('4', '64');
INSERT INTO `sys_role_menu` VALUES ('4', '65');
INSERT INTO `sys_role_menu` VALUES ('4', '66');
INSERT INTO `sys_role_menu` VALUES ('4', '67');
INSERT INTO `sys_role_menu` VALUES ('4', '68');
INSERT INTO `sys_role_menu` VALUES ('4', '69');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '70');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '10');
INSERT INTO `sys_role_menu` VALUES ('5', '11');
INSERT INTO `sys_role_menu` VALUES ('5', '12');
INSERT INTO `sys_role_menu` VALUES ('5', '13');
INSERT INTO `sys_role_menu` VALUES ('5', '14');
INSERT INTO `sys_role_menu` VALUES ('5', '15');
INSERT INTO `sys_role_menu` VALUES ('5', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '17');
INSERT INTO `sys_role_menu` VALUES ('5', '18');
INSERT INTO `sys_role_menu` VALUES ('5', '19');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '20');
INSERT INTO `sys_role_menu` VALUES ('5', '21');
INSERT INTO `sys_role_menu` VALUES ('5', '22');
INSERT INTO `sys_role_menu` VALUES ('5', '23');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '26');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '28');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '30');
INSERT INTO `sys_role_menu` VALUES ('5', '31');
INSERT INTO `sys_role_menu` VALUES ('5', '32');
INSERT INTO `sys_role_menu` VALUES ('5', '33');
INSERT INTO `sys_role_menu` VALUES ('5', '34');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('5', '38');
INSERT INTO `sys_role_menu` VALUES ('5', '39');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '40');
INSERT INTO `sys_role_menu` VALUES ('5', '41');
INSERT INTO `sys_role_menu` VALUES ('5', '42');
INSERT INTO `sys_role_menu` VALUES ('5', '43');
INSERT INTO `sys_role_menu` VALUES ('5', '44');
INSERT INTO `sys_role_menu` VALUES ('5', '45');
INSERT INTO `sys_role_menu` VALUES ('5', '46');
INSERT INTO `sys_role_menu` VALUES ('5', '47');
INSERT INTO `sys_role_menu` VALUES ('5', '48');
INSERT INTO `sys_role_menu` VALUES ('5', '49');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '50');
INSERT INTO `sys_role_menu` VALUES ('5', '51');
INSERT INTO `sys_role_menu` VALUES ('5', '52');
INSERT INTO `sys_role_menu` VALUES ('5', '53');
INSERT INTO `sys_role_menu` VALUES ('5', '54');
INSERT INTO `sys_role_menu` VALUES ('5', '55');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '57');
INSERT INTO `sys_role_menu` VALUES ('5', '58');
INSERT INTO `sys_role_menu` VALUES ('5', '59');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '60');
INSERT INTO `sys_role_menu` VALUES ('5', '61');
INSERT INTO `sys_role_menu` VALUES ('5', '62');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '64');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '67');
INSERT INTO `sys_role_menu` VALUES ('5', '68');
INSERT INTO `sys_role_menu` VALUES ('5', '69');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '70');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '9');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '10');
INSERT INTO `sys_role_menu` VALUES ('6', '11');
INSERT INTO `sys_role_menu` VALUES ('6', '12');
INSERT INTO `sys_role_menu` VALUES ('6', '13');
INSERT INTO `sys_role_menu` VALUES ('6', '14');
INSERT INTO `sys_role_menu` VALUES ('6', '15');
INSERT INTO `sys_role_menu` VALUES ('6', '16');
INSERT INTO `sys_role_menu` VALUES ('6', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '18');
INSERT INTO `sys_role_menu` VALUES ('6', '19');
INSERT INTO `sys_role_menu` VALUES ('6', '2');
INSERT INTO `sys_role_menu` VALUES ('6', '20');
INSERT INTO `sys_role_menu` VALUES ('6', '21');
INSERT INTO `sys_role_menu` VALUES ('6', '22');
INSERT INTO `sys_role_menu` VALUES ('6', '23');
INSERT INTO `sys_role_menu` VALUES ('6', '24');
INSERT INTO `sys_role_menu` VALUES ('6', '25');
INSERT INTO `sys_role_menu` VALUES ('6', '26');
INSERT INTO `sys_role_menu` VALUES ('6', '27');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '3');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '31');
INSERT INTO `sys_role_menu` VALUES ('6', '32');
INSERT INTO `sys_role_menu` VALUES ('6', '33');
INSERT INTO `sys_role_menu` VALUES ('6', '34');
INSERT INTO `sys_role_menu` VALUES ('6', '35');
INSERT INTO `sys_role_menu` VALUES ('6', '36');
INSERT INTO `sys_role_menu` VALUES ('6', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '38');
INSERT INTO `sys_role_menu` VALUES ('6', '39');
INSERT INTO `sys_role_menu` VALUES ('6', '4');
INSERT INTO `sys_role_menu` VALUES ('6', '40');
INSERT INTO `sys_role_menu` VALUES ('6', '41');
INSERT INTO `sys_role_menu` VALUES ('6', '42');
INSERT INTO `sys_role_menu` VALUES ('6', '43');
INSERT INTO `sys_role_menu` VALUES ('6', '44');
INSERT INTO `sys_role_menu` VALUES ('6', '45');
INSERT INTO `sys_role_menu` VALUES ('6', '46');
INSERT INTO `sys_role_menu` VALUES ('6', '47');
INSERT INTO `sys_role_menu` VALUES ('6', '48');
INSERT INTO `sys_role_menu` VALUES ('6', '49');
INSERT INTO `sys_role_menu` VALUES ('6', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '50');
INSERT INTO `sys_role_menu` VALUES ('6', '51');
INSERT INTO `sys_role_menu` VALUES ('6', '52');
INSERT INTO `sys_role_menu` VALUES ('6', '53');
INSERT INTO `sys_role_menu` VALUES ('6', '54');
INSERT INTO `sys_role_menu` VALUES ('6', '55');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '57');
INSERT INTO `sys_role_menu` VALUES ('6', '58');
INSERT INTO `sys_role_menu` VALUES ('6', '59');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '60');
INSERT INTO `sys_role_menu` VALUES ('6', '61');
INSERT INTO `sys_role_menu` VALUES ('6', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '63');
INSERT INTO `sys_role_menu` VALUES ('6', '64');
INSERT INTO `sys_role_menu` VALUES ('6', '65');
INSERT INTO `sys_role_menu` VALUES ('6', '66');
INSERT INTO `sys_role_menu` VALUES ('6', '67');
INSERT INTO `sys_role_menu` VALUES ('6', '68');
INSERT INTO `sys_role_menu` VALUES ('6', '69');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '70');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('6', '9');
INSERT INTO `sys_role_menu` VALUES ('7', '1');
INSERT INTO `sys_role_menu` VALUES ('7', '10');
INSERT INTO `sys_role_menu` VALUES ('7', '11');
INSERT INTO `sys_role_menu` VALUES ('7', '12');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');
INSERT INTO `sys_role_menu` VALUES ('7', '23');
INSERT INTO `sys_role_menu` VALUES ('7', '24');
INSERT INTO `sys_role_menu` VALUES ('7', '25');
INSERT INTO `sys_role_menu` VALUES ('7', '26');
INSERT INTO `sys_role_menu` VALUES ('7', '27');
INSERT INTO `sys_role_menu` VALUES ('7', '28');
INSERT INTO `sys_role_menu` VALUES ('7', '29');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '30');
INSERT INTO `sys_role_menu` VALUES ('7', '31');
INSERT INTO `sys_role_menu` VALUES ('7', '32');
INSERT INTO `sys_role_menu` VALUES ('7', '33');
INSERT INTO `sys_role_menu` VALUES ('7', '34');
INSERT INTO `sys_role_menu` VALUES ('7', '35');
INSERT INTO `sys_role_menu` VALUES ('7', '36');
INSERT INTO `sys_role_menu` VALUES ('7', '37');
INSERT INTO `sys_role_menu` VALUES ('7', '38');
INSERT INTO `sys_role_menu` VALUES ('7', '39');
INSERT INTO `sys_role_menu` VALUES ('7', '4');
INSERT INTO `sys_role_menu` VALUES ('7', '40');
INSERT INTO `sys_role_menu` VALUES ('7', '41');
INSERT INTO `sys_role_menu` VALUES ('7', '42');
INSERT INTO `sys_role_menu` VALUES ('7', '43');
INSERT INTO `sys_role_menu` VALUES ('7', '44');
INSERT INTO `sys_role_menu` VALUES ('7', '45');
INSERT INTO `sys_role_menu` VALUES ('7', '46');
INSERT INTO `sys_role_menu` VALUES ('7', '47');
INSERT INTO `sys_role_menu` VALUES ('7', '48');
INSERT INTO `sys_role_menu` VALUES ('7', '49');
INSERT INTO `sys_role_menu` VALUES ('7', '5');
INSERT INTO `sys_role_menu` VALUES ('7', '50');
INSERT INTO `sys_role_menu` VALUES ('7', '51');
INSERT INTO `sys_role_menu` VALUES ('7', '52');
INSERT INTO `sys_role_menu` VALUES ('7', '53');
INSERT INTO `sys_role_menu` VALUES ('7', '54');
INSERT INTO `sys_role_menu` VALUES ('7', '55');
INSERT INTO `sys_role_menu` VALUES ('7', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '57');
INSERT INTO `sys_role_menu` VALUES ('7', '58');
INSERT INTO `sys_role_menu` VALUES ('7', '59');
INSERT INTO `sys_role_menu` VALUES ('7', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '60');
INSERT INTO `sys_role_menu` VALUES ('7', '61');
INSERT INTO `sys_role_menu` VALUES ('7', '62');
INSERT INTO `sys_role_menu` VALUES ('7', '63');
INSERT INTO `sys_role_menu` VALUES ('7', '64');
INSERT INTO `sys_role_menu` VALUES ('7', '65');
INSERT INTO `sys_role_menu` VALUES ('7', '66');
INSERT INTO `sys_role_menu` VALUES ('7', '67');
INSERT INTO `sys_role_menu` VALUES ('7', '68');
INSERT INTO `sys_role_menu` VALUES ('7', '69');
INSERT INTO `sys_role_menu` VALUES ('7', '7');
INSERT INTO `sys_role_menu` VALUES ('7', '70');
INSERT INTO `sys_role_menu` VALUES ('7', '8');
INSERT INTO `sys_role_menu` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '1', 'thinkgem', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', 'Thinkgem', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '山东省分公司技术部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '山东省分公司技术部', '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'sdjn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济分公司领导', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '济南分公司领导', '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'sdjnlc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济分历城领导', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '济南市历城区分公司领导', '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'sdjnlx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济分历下领导', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '济南市历下区分公司领导', '0');
INSERT INTO `sys_user` VALUES ('14', '22', '24', 'sdjnlx_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0014', '济分历下综合部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '济南市历下区分公司综合部', '0');
INSERT INTO `sys_user` VALUES ('2', '1', '1', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', 'thinkgem@163.com', '8675', '8675', '', '127.0.0.1', '2014-09-24 14:50:04', '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '管理员', '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'bj_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '综合部', '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'bj_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '市场部', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'bj_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '技术部', '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'bj_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '研发部', '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '山分领导', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '山东省分公司领导', '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '山分综合部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '山东省分公司综合部', '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '山分市场部', 'thinkgem@163.com', '8675', '8675', '', null, null, '1', '2013-05-27 00:00:00', '1', '2013-05-27 00:00:00', '山东省分公司市场部', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');

-- ----------------------------
-- Table structure for vincent_user
-- ----------------------------
DROP TABLE IF EXISTS `vincent_user`;
CREATE TABLE `vincent_user` (
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试mybatis接口';

-- ----------------------------
-- Records of vincent_user
-- ----------------------------

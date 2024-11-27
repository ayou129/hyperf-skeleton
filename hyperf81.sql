/*
 Navicat Premium Data Transfer

 Source Server         : idx1 localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : hyperf81

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 28/11/2024 01:27:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '说明',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (501, 'shop_order_timeout_auto_cancel_seconds', '600', '商品订单超时自动取消秒数', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (502, 'shop_product_pre_sale_preview_seconds', '86400', '商品订单预售显示秒数', NULL, NULL, NULL);
INSERT INTO `sys_config` VALUES (1001, 'tencent_real_name_authentication_pass_probability', '75', '腾讯实名认证通过概率(0.01-99.9)', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int DEFAULT '999',
  `status` tinyint(1) DEFAULT '1',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (10001, 0, '湛江', 999, 1, '湛江', '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10002, 0, '北方', 999, 1, '北方', '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10102, 10001, '研发部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10103, 10001, '市场部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10104, 10001, '财务部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10202, 10002, '研发部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10203, 10002, '市场部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10204, 10002, '财务部', 999, 1, NULL, '2024-04-03 15:58:01', NULL, NULL);
INSERT INTO `sys_dept` VALUES (10309, NULL, '2', 2, 0, '2', '2024-04-03 16:37:48', '2024-04-03 16:37:55', NULL);
INSERT INTO `sys_dept` VALUES (10310, 10002, '2-2', 20, 1, '2-2', '2024-04-03 16:38:13', '2024-04-03 16:48:01', '2024-04-03 16:48:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', '2019-10-27 20:31:36', NULL, NULL);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', '2019-10-27 20:31:36', NULL, NULL);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', '2019-10-27 20:31:36', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` int DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '字典值',
  `dict_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '岗位名称',
  `enabled` tinyint(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '更新者',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (8, '人事专员', 1, 3, NULL, NULL, '2019-03-29 14:52:28', NULL, NULL);
INSERT INTO `sys_job` VALUES (10, '产品经理', 1, 4, NULL, NULL, '2019-03-29 14:55:51', NULL, NULL);
INSERT INTO `sys_job` VALUES (11, '全栈开发', 1, 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43', NULL);
INSERT INTO `sys_job` VALUES (12, '软件测试', 1, 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int DEFAULT NULL COMMENT '上级菜单ID',
  `type` int DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '组件',
  `redirect` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `menu_sort` int DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '链接地址',
  `is_frame` tinyint(1) DEFAULT NULL COMMENT '是否外链',
  `cache` tinyint(1) DEFAULT '0' COMMENT '缓存',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `inx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1000303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (100001, 0, 0, 'Dashboard', 'Dashboard', 'LAYOUT', '/dashboard/analysis', 100, 'bx:bx-home', '/dashboard', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (100011, 100001, 0, '分析台', '分析台', 'dashboard/analysis/index', NULL, 100, NULL, 'analysis', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (100012, 100001, 0, '工作台', '工作台', 'dashboard/workbench/index', NULL, 99, NULL, 'workbench', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (100021, 0, 0, 'Permission', 'Permission', 'LAYOUT', NULL, 50, 'carbon:user-role', '/permission', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (199999, 0, 0, '系统管理', '系统管理', 'LAYOUT', NULL, 1, 'ion:settings-outline', '/system', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (200001, 199999, 0, '账号管理', '账号管理', 'main/system/account/index', NULL, 100, '', '/system/account', NULL, 0, 0, 'menu1:view', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (200002, 199999, 0, '角色管理', '角色管理', 'main/system/role/index', NULL, 99, '', '/system/role', NULL, 0, 0, 'menu2:add', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (200003, 199999, 0, '部门管理', '部门管理', 'main/system/dept/index', NULL, 98, '', '/system/dept', NULL, 0, 0, 'menu3:update', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (200004, 199999, 0, 'Request管理', 'Request管理', 'main/system/request/index', '', 1, NULL, '/system/request', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (200005, 199999, 0, '修改密码', '修改密码', 'main/system/password/index', NULL, 2, '', '/system/changePassword', NULL, 0, 0, 'menu4:del', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000101, 100021, NULL, 'PermissionBackDemo', 'PermissionBackDemo', '', NULL, 50, NULL, 'back', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000201, 1000101, NULL, 'BackAuthPage', 'BackAuthPage', 'main/permission/back/index', NULL, 2, NULL, 'page', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000202, 1000101, NULL, 'BackAuthBtn', 'BackAuthBtn', 'main/permission/back/Btn', NULL, 1, NULL, 'btn', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000301, 0, 0, '用户管理', '用户管理', 'LAYOUT', '', 2, 'ion:person-outline', '/user', NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (1000302, 1000301, 0, '用户列表', '用户列表', 'main/user/list/index', '', 1, NULL, '/user/list', NULL, 0, 0, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_request
-- ----------------------------
DROP TABLE IF EXISTS `sys_request`;
CREATE TABLE `sys_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `bodys` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_agent` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `u_id` int unsigned DEFAULT NULL,
  `exception_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `exception_otherinfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for sys_request_sql
-- ----------------------------
DROP TABLE IF EXISTS `sys_request_sql`;
CREATE TABLE `sys_request_sql` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `request_id` int unsigned DEFAULT NULL,
  `sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sql_exec_time` float(6,3) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `request_id_index` (`request_id`),
  KEY `created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sort` int DEFAULT '100',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uniq_name` (`name`),
  KEY `role_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'SuperAdmin', 1, '-', 1, '2018-11-23 11:04:37', '2024-04-04 10:09:16', NULL);
INSERT INTO `sys_role` VALUES (2, '管理员', 'Admin', 2, '-', 1, '2018-11-23 13:09:06', '2020-09-05 10:45:12', NULL);
INSERT INTO `sys_role` VALUES (101, '普通用户', 'User', 100, '-', 1, '2024-01-09 13:33:26', '2024-01-09 13:33:26', NULL);
INSERT INTO `sys_role` VALUES (102, '2', '2', 100, '2', 0, '2024-04-02 19:55:40', '2024-04-02 20:09:56', '2024-04-02 20:09:56');
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts` (
  `role_id` int NOT NULL,
  `dept_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色部门关联';

-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `menu_id` int NOT NULL COMMENT '菜单ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='角色菜单关联';

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO `sys_roles_menus` VALUES (100001, 1);
INSERT INTO `sys_roles_menus` VALUES (100001, 2);
INSERT INTO `sys_roles_menus` VALUES (100002, 2);
INSERT INTO `sys_roles_menus` VALUES (100002, 101);
INSERT INTO `sys_roles_menus` VALUES (100011, 1);
INSERT INTO `sys_roles_menus` VALUES (100012, 1);
INSERT INTO `sys_roles_menus` VALUES (100021, 1);
INSERT INTO `sys_roles_menus` VALUES (199999, 1);
INSERT INTO `sys_roles_menus` VALUES (199999, 101);
INSERT INTO `sys_roles_menus` VALUES (200001, 1);
INSERT INTO `sys_roles_menus` VALUES (200001, 101);
INSERT INTO `sys_roles_menus` VALUES (200002, 1);
INSERT INTO `sys_roles_menus` VALUES (200002, 101);
INSERT INTO `sys_roles_menus` VALUES (200003, 1);
INSERT INTO `sys_roles_menus` VALUES (200003, 101);
INSERT INTO `sys_roles_menus` VALUES (200004, 1);
INSERT INTO `sys_roles_menus` VALUES (200004, 101);
INSERT INTO `sys_roles_menus` VALUES (1000101, 1);
INSERT INTO `sys_roles_menus` VALUES (1000101, 2);
INSERT INTO `sys_roles_menus` VALUES (1000101, 101);
INSERT INTO `sys_roles_menus` VALUES (1000201, 1);
INSERT INTO `sys_roles_menus` VALUES (1000201, 2);
INSERT INTO `sys_roles_menus` VALUES (1000201, 101);
INSERT INTO `sys_roles_menus` VALUES (1000202, 1);
INSERT INTO `sys_roles_menus` VALUES (1000202, 2);
INSERT INTO `sys_roles_menus` VALUES (1000202, 101);
INSERT INTO `sys_roles_menus` VALUES (1000301, 1);
INSERT INTO `sys_roles_menus` VALUES (1000302, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_record`;
CREATE TABLE `sys_sms_record` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '短信发送记录编号',
  `platform_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '短信平台账号',
  `phone` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '接受短信的手机号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '短信内容',
  `send_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '添加记录ip',
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '短信模板ID',
  `result_code` int unsigned DEFAULT NULL COMMENT '状态码 100=成功,130=失败,131=空号,132=停机,133=关机,134=无状态',
  `record_id` int unsigned NOT NULL COMMENT '发送记录id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='短信发送记录表';

-- ----------------------------
-- Records of sys_sms_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` int DEFAULT NULL,
  `role_id` int DEFAULT '0',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'token',
  `token_expiretime` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像真实路径',
  `status` int DEFAULT '0',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `UK_email` (`email`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `dept_id` (`dept_id`) USING BTREE,
  KEY `avatar_name` (`avatar_name`) USING BTREE,
  KEY `inx_enabled` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 10102, 1, 'admin', '123111', '5y35ee73GKYiGgkL7bE2jOwApebBKymTrEfo3BhNiHzUfraltQEYzNlMh0W8kVXBr99BVRh5RTOrW0Um', '2024-05-13 11:39:01', '管理员', '', '14224@qq.com', 'avatar-20200806032259161.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', 1, '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2024-05-13 01:39:01', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `job_id` int NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (2, 8);
INSERT INTO `sys_users_jobs` VALUES (3, 8);
INSERT INTO `sys_users_jobs` VALUES (4, 8);
INSERT INTO `sys_users_jobs` VALUES (20, 8);
INSERT INTO `sys_users_jobs` VALUES (21, 10);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `user_id` int NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户角色关联';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (2, 2);
INSERT INTO `sys_users_roles` VALUES (3, 2);
INSERT INTO `sys_users_roles` VALUES (4, 2);
INSERT INTO `sys_users_roles` VALUES (20, 2);
INSERT INTO `sys_users_roles` VALUES (21, 2);
INSERT INTO `sys_users_roles` VALUES (21, 12);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户手机号唯一性',
  `wx_unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `password` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '用户姓名',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `gender` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `constellation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '星座',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '国家',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态',
  `playw_report_playwname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '俱乐部名称',
  `playw_report_club_jiedan_price` int DEFAULT '30' COMMENT '俱乐部接单价格',
  `playw_report_club_id` int unsigned DEFAULT NULL COMMENT '俱乐部ID',
  `playw_report_club_join_at` timestamp NULL DEFAULT NULL,
  `playw_report_club_admin` tinyint unsigned DEFAULT '0' COMMENT '是否管理员',
  `social_id` int unsigned DEFAULT NULL COMMENT '社交ID',
  `social_dazzle_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '社交炫彩昵称',
  `social_signature` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '' COMMENT '社交签名',
  `social_charm_value` int unsigned DEFAULT '0' COMMENT '社交魅力值',
  `social_magnate_value` int unsigned DEFAULT '0' COMMENT '社交富豪值',
  `social_noble_value` int unsigned DEFAULT '0' COMMENT '社交贵族值',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_phone` (`phone`),
  KEY `wx_unionid` (`wx_unionid`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '15369484019', NULL, 'UBElSFXZR61GSJuNd3oc/Q==', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/RQAN8GTNibNicSUgFVzTYxaibibKHQllT7h6UTrHg0ZAzicrnWvjCYCqPbB0qG8wrrG8auh3vqVichGonSVOwZbhQdHg/132', 1, NULL, NULL, NULL, NULL, NULL, 1, '阿尤', 35, 1001, '2023-08-22 03:18:04', 1, NULL, NULL, NULL, 0, 0, 0, '2023-08-12 19:41:27', '2023-08-22 03:18:16', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_login_info
-- ----------------------------
DROP TABLE IF EXISTS `user_login_info`;
CREATE TABLE `user_login_info` (
  `id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `platform` tinyint unsigned DEFAULT '1',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_login_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user_platform
-- ----------------------------
DROP TABLE IF EXISTS `user_platform`;
CREATE TABLE `user_platform` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int NOT NULL,
  `platform` tinyint unsigned DEFAULT '1',
  `wx_openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `wx_session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信session_key',
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'TOKEN',
  `login_token_expire_time` timestamp NULL DEFAULT NULL COMMENT 'TOKEN过期时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户平台表(登录专用)';
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

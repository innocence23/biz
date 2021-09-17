/*
 Navicat Premium Data Transfer

 Source Server         : biz
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:33061
 Source Schema         : x

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 14/09/2021 15:43:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '编码',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
  `author` varchar(128) NOT NULL DEFAULT '' COMMENT '作者',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '更新者',
  `publish_at` datetime NOT NULL COMMENT '发布时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_article_deleted_at` (`deleted_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='demo';

-- ----------------------------
-- Records of demo
-- ----------------------------
BEGIN;
INSERT INTO `demo` VALUES (1, '测试一下', '作者ABC', '我是内容', 1, 0, 0, '2021-09-12 16:00:00', '2021-09-13 06:53:54', '2021-09-13 06:53:54', NULL);
INSERT INTO `demo` VALUES (2, '我是demo', '新地方', '我是内容', 0, 0, 0, '2021-09-13 06:54:44', '2021-09-13 06:54:45', '2021-09-13 06:54:45', NULL);
COMMIT;

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(128) NOT NULL DEFAULT '' COMMENT '委托单位',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '查新范围 国内外',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '费用 元 -999999.99--999999.99',
  `operator_id` varchar(128) NOT NULL DEFAULT '0' COMMENT '查新员',
  `is_finish` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否交费',
  `huizhi` varchar(128) NOT NULL DEFAULT '' COMMENT '回执 file',
  `weituoshu` varchar(128) NOT NULL DEFAULT '' COMMENT '委托书 file',
  `baogao` varchar(128) NOT NULL DEFAULT '' COMMENT '报告 file',
  `fapiao` varchar(128) NOT NULL DEFAULT '' COMMENT '发票 file',
  `saomiao` varchar(128) NOT NULL DEFAULT '' COMMENT '扫描 file',
  `other` varchar(128) NOT NULL DEFAULT '' COMMENT '其他 file',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_operator_id` (`operator_id`),
  KEY `idx_create_by` (`create_by`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of report
-- ----------------------------
BEGIN;
INSERT INTO `report` VALUES (1, '李善文--山东省林业科学研究院', 2, 1300.00, '1', 0, 'http://api.biz.test/static/uploadfile/aa755672-d132-48e7-8cce-6525378c41cb.xlsx', 'http://api.biz.test/static/uploadfile/4e6f4572-1078-4285-95b4-3572cd23f814.jpeg', 'http://api.biz.test/static/uploadfile/8b268df0-9e81-4c47-bc3a-5045c7e757df.jpg', 'http://api.biz.test/static/uploadfile/b1fdf9c2-4527-4b72-a5be-6d018ce38fd1.jpg', 'http://api.biz.test/static/uploadfile/92573b29-ace0-4e16-8016-bebc55124194.png', 'http://api.biz.test/static/uploadfile/5a0f9035-5b98-4113-b931-7cc4bad52fc4.xlsx', '13439383938', '已交---=', 0, 0, '2021-09-13 07:50:41', '2021-09-14 03:13:45', NULL);
INSERT INTO `report` VALUES (2, '中建八局第一建设有限公司-李帅', 0, 3000.00, '4', 1, 'http://api.biz.test/static/uploadfile/bccaf1ce-62eb-43b8-a487-1f6a55891a9a.jpeg', 'http://api.biz.test/static/uploadfile/5534f575-d400-4f66-97b8-894edd4264bb.jpeg', 'http://api.biz.test/static/uploadfile/ab65ea0a-c356-44a8-a35d-2a45ea932707.jpeg', 'http://api.biz.test/static/uploadfile/c1c35a12-7533-4f71-87fe-f96aa6c568e7.jpeg', 'http://api.biz.test/static/uploadfile/c7cfeb34-5d91-4cd5-bf25-fd31c401af80.png', '', '13439383232', '', 0, 0, '2021-09-13 07:56:57', '2021-09-14 03:14:04', NULL);
COMMIT;

-- ----------------------------
-- Table structure for report_operator
-- ----------------------------
DROP TABLE IF EXISTS `report_operator`;
CREATE TABLE `report_operator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '人员名字',
  `phone` char(11) NOT NULL DEFAULT '' COMMENT '电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建者',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_by` (`create_by`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of report_operator
-- ----------------------------
BEGIN;
INSERT INTO `report_operator` VALUES (1, '张先生', '', '', 0, 0, '2021-09-13 07:48:26', '2021-09-13 07:48:26', NULL);
INSERT INTO `report_operator` VALUES (2, '李女士', '', '', 0, 0, '2021-09-13 07:48:36', '2021-09-13 07:48:36', NULL);
INSERT INTO `report_operator` VALUES (3, '赵先生', '', '', 0, 0, '2021-09-13 07:48:48', '2021-09-13 07:48:48', NULL);
INSERT INTO `report_operator` VALUES (4, '钱女士', '', '', 0, 0, '2021-09-13 07:48:59', '2021-09-13 07:48:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(128) NOT NULL COMMENT '标题',
  `path` varchar(128) NOT NULL COMMENT '地址',
  `action` varchar(16) NOT NULL COMMENT '请求类型',
  `type` varchar(16) NOT NULL COMMENT '接口类型',
  `handle` varchar(128) NOT NULL COMMENT 'handle',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_api_update_by` (`update_by`),
  KEY `idx_sys_api_deleted_at` (`deleted_at`),
  KEY `idx_sys_api_create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_api` VALUES (1, '登录日志通过id获取', '/api/v1/sys-login-log/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysLoginLog.Get-fm', 0, 0, '2021-05-13 19:59:01', '2021-06-17 11:37:12', NULL);
INSERT INTO `sys_api` VALUES (2, '操作日志列表', '/api/v1/sys-opera-log', 'GET', 'BUS', 'go-admin/app/admin/apis.SysOperaLog.GetPage-fm', 0, 0, '2021-05-13 19:59:01', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (3, '操作日志通过id获取', '/api/v1/sys-opera-log/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysOperaLog.Get-fm', 0, 0, '2021-05-13 19:59:01', '2021-06-16 21:49:49', NULL);
INSERT INTO `sys_api` VALUES (4, '分类列表', '/api/v1/syscategory', 'GET', 'BUS', 'go-admin/common/actions.IndexAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (5, '分类通过id获取', '/api/v1/syscategory/:id', 'GET', 'BUS', 'go-admin/common/actions.ViewAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (6, '内容列表', '/api/v1/syscontent', 'GET', 'BUS', 'go-admin/common/actions.IndexAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (7, '内容通过id获取', '/api/v1/syscontent/:id', 'GET', 'BUS', 'go-admin/common/actions.ViewAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (8, 'job列表', '/api/v1/sysjob', 'GET', 'BUS', 'go-admin/common/actions.IndexAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (9, 'job通过id获取', '/api/v1/sysjob/:id', 'GET', 'BUS', 'go-admin/common/actions.ViewAction.func1', 0, 0, '2021-05-13 19:59:01', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (10, '字典类型列表', '/api/v1/dict/type', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDictType.GetPage-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (11, '字典类型查询【代码生成】', '/api/v1/dict/type-option-select', 'GET', 'SYS', 'go-admin/app/admin/apis.SysDictType.GetAll-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (12, '字典类型通过id获取', '/api/v1/dict/type/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDictType.Get-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (13, '字典数据列表', '/api/v1/dict/data', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDictData.GetPage-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (14, '字典数据通过code获取', '/api/v1/dict/data/:dictCode', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDictData.Get-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (15, '数据字典根据key获取', '/api/v1/dict-data/option-select', 'GET', 'SYS', 'go-admin/app/admin/apis.SysDictData.GetSysDictDataAll-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (16, '部门列表', '/api/v1/dept', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDept.GetPage-fm', 0, 0, '2021-05-13 19:59:02', '2021-09-08 10:35:22', NULL);
INSERT INTO `sys_api` VALUES (17, '部门通过id获取', '/api/v1/dept/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysDept.Get-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (18, '查询部门下拉树【角色权限-自定权限】', '/api/v1/deptTree', 'GET', 'SYS', 'go-admin/app/admin/apis.SysDept.Get2Tree-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (19, '数据库表列表', '/api/v1/db/tables/page', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.(*Gen).GetDBTableList-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (20, '数据表列列表', '/api/v1/db/columns/page', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.(*Gen).GetDBColumnList-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (21, '数据库表生成到项目', '/api/v1/gen/toproject/:tableId', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.Gen.GenCode-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (22, '数据库表生成到DB', '/api/v1/gen/todb/:tableId', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.Gen.GenMenuAndApi-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (23, '关系表数据【代码生成】', '/api/v1/gen/tabletree', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesTree-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (24, '生成预览通过id获取', '/api/v1/gen/preview/:tableId', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.Gen.Preview-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (25, '生成api带文件', '/api/v1/gen/apitofile/:tableId', 'GET', 'SYS', 'go-admin/app/admin/apis/tools.Gen.GenApiToFile-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (26, '验证码获取', '/api/v1/getCaptcha', 'GET', 'SYS', 'go-admin/app/admin/apis.System.GenerateCaptchaHandler-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (27, '用户信息获取', '/api/v1/getinfo', 'GET', 'SYS', 'go-admin/app/admin/apis.SysUser.GetInfo-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (28, '菜单列表', '/api/v1/menu', 'GET', 'BUS', 'go-admin/app/admin/apis.SysMenu.GetPage-fm', 0, 0, '2021-05-13 19:59:02', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (29, '查询菜单下拉树结构【废弃】', '/api/v1/menuTreeselect', 'GET', 'SYS', 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-03 22:37:22', NULL);
INSERT INTO `sys_api` VALUES (30, '菜单通过id获取', '/api/v1/menu/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysMenu.Get-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (31, '角色菜单【顶部左侧菜单】', '/api/v1/menurole', 'GET', 'SYS', 'go-admin/app/admin/apis.SysMenu.GetMenuRole-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (32, '获取角色对应的菜单id数组【废弃】', '/api/v1/menuids', 'GET', 'SYS', 'go-admin/app/admin/apis.SysMenu.GetMenuIDS-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-03 22:39:53', NULL);
INSERT INTO `sys_api` VALUES (33, '角色列表', '/api/v1/role', 'GET', 'BUS', 'go-admin/app/admin/apis.SysRole.GetPage-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (34, '菜单权限列表【角色配菜单使用】', '/api/v1/roleMenuTreeselect/:roleId', 'GET', 'SYS', 'go-admin/app/admin/apis.SysMenu.GetMenuTreeSelect-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (35, '角色部门结构树【自定义数据权限】', '/api/v1/roleDeptTreeselect/:roleId', 'GET', 'SYS', 'go-admin/app/admin/apis.SysDept.GetDeptTreeRoleSelect-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (36, '角色通过id获取', '/api/v1/role/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysRole.Get-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (37, '刷新token', '/api/v1/refresh_token', 'GET', 'SYS', 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).RefreshHandler-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-13 20:53:49', NULL);
INSERT INTO `sys_api` VALUES (38, '参数列表', '/api/v1/config', 'GET', 'BUS', 'go-admin/app/admin/apis.SysConfig.GetPage-fm', 0, 0, '2021-05-13 19:59:03', '2021-09-08 10:37:40', NULL);
INSERT INTO `sys_api` VALUES (39, '参数通过id获取', '/api/v1/config/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysConfig.Get-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (40, '参数通过键名搜索【基础默认配置】', '/api/v1/configKey/:configKey', 'GET', 'SYS', 'go-admin/app/admin/apis.SysConfig.GetSysConfigByKEYForService-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (41, 'job移除', '/api/v1/job/remove/:id', 'GET', 'BUS', 'go-admin/app/jobs/apis.SysJob.RemoveJobForService-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (42, 'job启动', '/api/v1/job/start/:id', 'GET', 'BUS', 'go-admin/app/jobs/apis.SysJob.StartJobForService-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (43, '岗位列表', '/api/v1/post', 'GET', 'BUS', 'go-admin/app/admin/apis.SysPost.GetPage-fm', 0, 0, '2021-05-13 19:59:03', '2021-09-08 10:35:29', NULL);
INSERT INTO `sys_api` VALUES (44, '岗位通过id获取', '/api/v1/post/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysPost.Get-fm', 0, 0, '2021-05-13 19:59:03', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (45, '系统前端参数', '/api/v1/app-config', 'GET', 'SYS', 'go-admin/app/admin/apis.SysConfig.GetSysConfigBySysApp-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (46, '*用户信息获取', '/api/v1/user/profile', 'GET', 'SYS', 'go-admin/app/admin/apis.SysUser.GetProfile-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (47, '链接ws【定时任务log】', '/ws/:id/:channel', 'GET', 'BUS', 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).WsClient-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (48, '退出ws【定时任务log】', '/wslogout/:id/:channel', 'GET', 'BUS', 'github.com/go-admin-team/go-admin-core/sdk/pkg/ws.(*Manager).UnWsClient-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (49, '*用户基本信息', '/info', 'GET', 'SYS', 'go-admin/common/middleware/handler.Ping', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (50, '分类创建', '/api/v1/syscategory', 'POST', 'BUS', 'go-admin/common/actions.CreateAction.func1', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (51, '内容创建', '/api/v1/syscontent', 'POST', 'BUS', 'go-admin/common/actions.CreateAction.func1', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (52, 'job创建', '/api/v1/sysjob', 'POST', 'BUS', 'go-admin/common/actions.CreateAction.func1', 0, 0, '2021-05-13 19:59:04', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (53, '字典数据创建', '/api/v1/dict/data', 'POST', 'BUS', 'go-admin/app/admin/apis.SysDictData.Insert-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (54, '字典类型创建', '/api/v1/dict/type', 'POST', 'BUS', 'go-admin/app/admin/apis.SysDictType.Insert-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (55, '部门创建', '/api/v1/dept', 'POST', 'BUS', 'go-admin/app/admin/apis.SysDept.Insert-fm', 0, 0, '2021-05-13 19:59:04', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (56, '*登录', '/api/v1/login', 'POST', 'SYS', 'github.com/go-admin-team/go-admin-core/sdk/pkg/jwtauth.(*GinJWTMiddleware).LoginHandler-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (57, '*退出', '/api/v1/logout', 'POST', 'SYS', 'go-admin/common/middleware/handler.LogOut', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (58, '参数创建', '/api/v1/config', 'POST', 'BUS', 'go-admin/app/admin/apis.SysConfig.Insert-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (59, '菜单创建', '/api/v1/menu', 'POST', 'BUS', 'go-admin/app/admin/apis.SysMenu.Insert-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (60, '岗位创建', '/api/v1/post', 'POST', 'BUS', 'go-admin/app/admin/apis.SysPost.Insert-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (61, '角色创建', '/api/v1/role', 'POST', 'BUS', 'go-admin/app/admin/apis.SysRole.Insert-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (62, '*用户头像编辑', '/api/v1/user/avatar', 'POST', 'SYS', 'go-admin/app/admin/apis.SysUser.InsetAvatar-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (63, '接口编辑', '/api/v1/sys-api/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysApi.Update-fm', 0, 0, '2021-05-13 19:59:05', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (64, '分类编辑', '/api/v1/syscategory/:id', 'PUT', 'BUS', 'go-admin/common/actions.UpdateAction.func1', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (65, '内容编辑', '/api/v1/syscontent/:id', 'PUT', 'BUS', 'go-admin/common/actions.UpdateAction.func1', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (66, 'job编辑', '/api/v1/sysjob', 'PUT', 'BUS', 'go-admin/common/actions.UpdateAction.func1', 0, 0, '2021-05-13 19:59:05', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (67, '字典数据编辑', '/api/v1/dict/data/:dictCode', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysDictData.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (68, '字典类型编辑', '/api/v1/dict/type/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysDictType.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (69, '部门编辑', '/api/v1/dept/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysDept.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (70, '文件夹编辑', '/api/v1/file-dir/:id', 'PUT', 'BUS', 'go-admin/app/other/apis.SysFileDir.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (71, '文件编辑', '/api/v1/file-info/:id', 'PUT', 'BUS', 'go-admin/app/other/apis.SysFileInfo.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (72, '角色编辑', '/api/v1/role/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysRole.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (73, '角色数据权限修改', '/api/v1/roledatascope', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysRole.Update2DataScope-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (74, '参数编辑', '/api/v1/config/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysConfig.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (75, '编辑菜单', '/api/v1/menu/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysMenu.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (76, '岗位编辑', '/api/v1/post/:id', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysPost.Update-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (77, '*用户修改密码', '/api/v1/user/pwd', 'PUT', 'SYS', 'go-admin/app/admin/apis.SysUser.UpdatePwd-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (78, '分类删除', '/api/v1/syscategory', 'DELETE', 'BUS', 'go-admin/common/actions.DeleteAction.func1', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (79, '内容删除', '/api/v1/syscontent', 'DELETE', 'BUS', 'go-admin/common/actions.DeleteAction.func1', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (80, '登录日志删除', '/api/v1/sys-login-log', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysLoginLog.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (81, '操作日志删除', '/api/v1/sys-opera-log', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysOperaLog.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (82, 'job删除', '/api/v1/sysjob', 'DELETE', 'BUS', 'go-admin/common/actions.DeleteAction.func1', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (83, '行政区删除', '/api/v1/sys-area-data', 'DELETE', 'BUS', 'go-admin/app/other/apis.SysChinaAreaData.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (84, '字典数据删除', '/api/v1/dict/data', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysDictData.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (85, '字典类型删除', '/api/v1/dict/type', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysDictType.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (86, '部门删除', '/api/v1/dept/:id', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysDept.Delete-fm', 0, 0, '2021-05-13 19:59:06', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (87, '文件夹删除', '/api/v1/file-dir/:id', 'DELETE', 'BUS', 'go-admin/app/other/apis.SysFileDir.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-13 20:53:53', NULL);
INSERT INTO `sys_api` VALUES (88, '文件删除', '/api/v1/file-info/:id', 'DELETE', 'BUS', 'go-admin/app/other/apis.SysFileInfo.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-13 20:53:53', NULL);
INSERT INTO `sys_api` VALUES (89, '参数删除', '/api/v1/config', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysConfig.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (90, '删除菜单', '/api/v1/menu', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysMenu.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (91, '岗位删除', '/api/v1/post/:id', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysPost.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (92, '角色删除', '/api/v1/role', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysRole.Delete-fm', 0, 0, '2021-05-13 19:59:07', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (93, '系统指标', '/api/v1/metrics', 'GET', 'SYS', 'github.com/go-admin-team/go-admin-core/tools/transfer.Handler.func1', 0, 0, '2021-05-17 22:13:56', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (94, '健康状态', '/api/v1/health', 'GET', 'SYS', 'go-admin/app/other/router.registerMonitorRouter.func1', 0, 0, '2021-05-17 22:13:56', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (95, '项目默认接口', '/', 'GET', 'SYS', 'go-admin/app/admin/apis.HelloWorld', 0, 0, '2021-05-24 10:30:45', '2021-06-13 20:53:47', NULL);
INSERT INTO `sys_api` VALUES (96, '服务器基本状态', '/api/v1/server-monitor', 'GET', 'SYS', 'go-admin/app/other/apis.ServerMonitor.ServerInfo-fm', 0, 0, '2021-05-24 10:30:45', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (97, '接口列表', '/api/v1/sys-api', 'GET', 'BUS', 'go-admin/app/admin/apis.SysApi.GetPage-fm', 0, 0, '2021-05-24 11:37:53', '2021-09-08 10:35:06', NULL);
INSERT INTO `sys_api` VALUES (98, '接口通过id获取', '/api/v1/sys-api/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysApi.Get-fm', 0, 0, '2021-05-24 11:37:53', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (99, '登录日志列表', '/api/v1/sys-login-log', 'GET', 'BUS', 'go-admin/app/admin/apis.SysLoginLog.GetPage-fm', 0, 0, '2021-05-24 11:47:30', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (100, '文件上传', '/api/v1/public/uploadFile', 'POST', 'SYS', 'go-admin/app/other/apis.File.UploadFile-fm', 0, 0, '2021-05-25 19:16:18', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (101, '参数信息修改【参数配置】', '/api/v1/set-config', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysConfig.Update2Set-fm', 0, 0, '2021-05-27 09:45:15', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (102, '参数获取全部【配置使用】', '/api/v1/set-config', 'GET', 'BUS', 'go-admin/app/admin/apis.SysConfig.Get2Set-fm', 0, 0, '2021-05-27 11:54:14', '2021-06-17 11:48:41', NULL);
INSERT INTO `sys_api` VALUES (103, '管理员列表', '/api/v1/sys-user', 'GET', 'BUS', 'go-admin/app/admin/apis.SysUser.GetPage-fm', 0, 0, '2021-06-13 19:24:57', '2021-06-17 20:31:14', NULL);
INSERT INTO `sys_api` VALUES (104, '管理员通过id获取', '/api/v1/sys-user/:id', 'GET', 'BUS', 'go-admin/app/admin/apis.SysUser.Get-fm', 0, 0, '2021-06-13 19:24:57', '2021-06-17 20:31:14', NULL);
INSERT INTO `sys_api` VALUES (105, '', '/api/v1/sys/tables/info', 'GET', '', 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTablesInfo-fm', 0, 0, '2021-06-13 19:24:57', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (106, '', '/api/v1/sys/tables/info/:tableId', 'GET', '', 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTables-fm', 0, 0, '2021-06-13 19:24:58', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (107, '', '/api/v1/sys/tables/page', 'GET', '', 'go-admin/app/admin/apis/tools.(*SysTable).GetSysTableList-fm', 0, 0, '2021-06-13 19:24:58', '2021-06-13 20:53:48', NULL);
INSERT INTO `sys_api` VALUES (108, '', '/static/*filepath', 'GET', '', 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', 0, 0, '2021-06-13 19:25:00', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (109, '', '/swagger/*any', 'GET', '', 'github.com/swaggo/gin-swagger.CustomWrapHandler.func1', 0, 0, '2021-06-13 19:25:00', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (110, '', '/form-generator/*filepath', 'GET', '', 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', 0, 0, '2021-06-13 19:25:00', '2021-06-13 20:53:50', NULL);
INSERT INTO `sys_api` VALUES (111, '', '/api/v1/sys/tables/info', 'POST', '', 'go-admin/app/admin/apis/tools.(*SysTable).InsertSysTable-fm', 0, 0, '2021-06-13 19:25:00', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (112, '管理员创建', '/api/v1/sys-user', 'POST', 'BUS', 'go-admin/app/admin/apis.SysUser.Insert-fm', 0, 0, '2021-06-13 19:25:00', '2021-06-17 20:31:14', NULL);
INSERT INTO `sys_api` VALUES (113, '管理员编辑', '/api/v1/sys-user', 'PUT', 'BUS', 'go-admin/app/admin/apis.SysUser.Update-fm', 0, 0, '2021-06-13 19:25:01', '2021-06-17 20:31:14', NULL);
INSERT INTO `sys_api` VALUES (114, '', '/api/v1/sys/tables/info', 'PUT', '', 'go-admin/app/admin/apis/tools.(*SysTable).UpdateSysTable-fm', 0, 0, '2021-06-13 19:25:01', '2021-06-13 20:53:51', NULL);
INSERT INTO `sys_api` VALUES (115, '', '/api/v1/role-status', 'PUT', '', 'go-admin/app/admin/apis.SysRole.Update2Status-fm', 0, 0, '2021-06-13 19:25:01', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (116, '', '/api/v1/user/pwd/reset', 'PUT', '', 'go-admin/app/admin/apis.SysUser.ResetPwd-fm', 0, 0, '2021-06-13 19:25:02', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (117, '', '/api/v1/user/status', 'PUT', '', 'go-admin/app/admin/apis.SysUser.UpdateStatus-fm', 0, 0, '2021-06-13 19:25:02', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (118, '管理员删除', '/api/v1/sys-user', 'DELETE', 'BUS', 'go-admin/app/admin/apis.SysUser.Delete-fm', 0, 0, '2021-06-13 19:25:02', '2021-06-17 20:31:14', NULL);
INSERT INTO `sys_api` VALUES (119, '', '/api/v1/sys/tables/info/:tableId', 'DELETE', '', 'go-admin/app/admin/apis/tools.(*SysTable).DeleteSysTables-fm', 0, 0, '2021-06-13 19:25:02', '2021-06-13 20:53:52', NULL);
INSERT INTO `sys_api` VALUES (120, '', '/static/*filepath', 'HEAD', '', 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', 0, 0, '2021-06-13 19:25:03', '2021-06-13 20:53:53', NULL);
INSERT INTO `sys_api` VALUES (121, '', '/form-generator/*filepath', 'HEAD', '', 'github.com/gin-gonic/gin.(*RouterGroup).createStaticHandler.func1', 0, 0, '2021-06-13 19:25:03', '2021-06-13 20:53:53', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_casbin_rule`;
CREATE TABLE `sys_casbin_rule` (
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  UNIQUE KEY `idx_sys_casbin_rule` (`p_type`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_casbin_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `config_name` varchar(32) NOT NULL COMMENT 'Name e.g. 系统logo',
  `config_key` varchar(32) NOT NULL COMMENT 'Key e.g. sys_app_logo',
  `config_value` varchar(255) NOT NULL COMMENT 'Value e.g. https:.jpg',
  `config_type` varchar(32) NOT NULL COMMENT 'ConfigType *',
  `is_frontend` varchar(32) NOT NULL COMMENT '是否前台 *',
  `remark` varchar(32) NOT NULL COMMENT 'Remark *',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_config_create_by` (`create_by`),
  KEY `idx_sys_config_update_by` (`update_by`),
  KEY `idx_sys_config_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '系统名称', 'sys_app_name', 'admin管理系统', 'Y', '1', '', 1, 0, '2021-03-17 08:52:06', '2021-09-08 10:20:06', NULL);
INSERT INTO `sys_config` VALUES (2, '系统logo', 'sys_app_logo', 'http://api.biz.test/static/uploadfile/118dbaaa-9e7c-413c-aa74-69ca9c88d273.jpg', 'Y', '1', '', 1, 0, '2021-03-17 08:53:19', '2021-09-13 06:50:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `dept_path` varchar(255) NOT NULL,
  `dept_name` varchar(128) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `leader` varchar(128) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`),
  KEY `idx_sys_dept_create_by` (`create_by`),
  KEY `idx_sys_dept_update_by` (`update_by`),
  KEY `idx_sys_dept_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1/', '字得其乐科技', 0, 'admin', '13412345678', 'admin@ admin.com', 2, 1, 1, '2021-05-13 19:56:38', '2021-06-05 17:06:45', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '/0/1/2/', '人力资源部', 0, 'admin', '13412345678', 'admin@ admin.com', 2, 1, 1, '2021-05-13 19:56:38', '2021-06-05 17:07:09', NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '/0/1/3/', '客服部', 0, 'admin', '13412345678', 'admin@ admin.com', 2, 1, 1, '2021-05-13 19:56:38', '2021-09-08 10:39:15', NULL);
INSERT INTO `sys_dept` VALUES (4, 1, '/0/1/4/', '研发部', 0, 'admin', '13412345678', 'admin@ admin.com', 2, 1, 1, '2021-05-13 19:56:38', '2021-06-16 21:35:00', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_type` varchar(64) NOT NULL COMMENT 'en sys_user_sex',
  `dict_value` varchar(255) NOT NULL COMMENT 'en-val 1',
  `dict_label` varchar(128) NOT NULL COMMENT 'zh-val 女',
  `remark` varchar(255) NOT NULL COMMENT '说明 性别女',
  `dict_sort` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `css_class` varchar(128) NOT NULL COMMENT '*',
  `list_class` varchar(128) NOT NULL COMMENT '*',
  `default` varchar(8) NOT NULL COMMENT '*',
  `is_default` varchar(8) NOT NULL COMMENT '*',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_deleted_at` (`deleted_at`),
  KEY `idx_sys_dict_data_create_by` (`create_by`),
  KEY `idx_sys_dict_data_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 'sys_normal_disable', '2', '正常', '系统正常', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:40', NULL);
INSERT INTO `sys_dict_data` VALUES (2, 'sys_normal_disable', '1', '停用', '系统停用', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (3, 'sys_user_sex', '0', '男', '性别男', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (4, 'sys_user_sex', '1', '女', '性别女', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (5, 'sys_user_sex', '2', '未知', '性别未知', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (6, 'sys_show_hide', '0', '显示', '显示菜单', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (7, 'sys_show_hide', '1', '隐藏', '隐藏菜单', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (8, 'sys_yes_no', 'Y', '是', '系统默认是', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (9, 'sys_yes_no', 'N', '否', '系统默认否', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (10, 'sys_job_status', '2', '正常', '正常状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (11, 'sys_job_status', '1', '停用', '停用状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (12, 'sys_job_group', 'DEFAULT', '默认', '默认分组', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (13, 'sys_job_group', 'SYSTEM', '系统', '系统分组', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (14, 'sys_notice_type', '1', '通知', '通知', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (15, 'sys_notice_type', '2', '公告', '公告', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (16, 'sys_common_status', '2', '正常', '正常状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (17, 'sys_common_status', '1', '关闭', '关闭状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (18, 'sys_oper_type', '1', '新增', '新增操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (19, 'sys_oper_type', '2', '修改', '修改操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (20, 'sys_oper_type', '3', '删除', '删除操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (21, 'sys_oper_type', '4', '授权', '授权操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (22, 'sys_oper_type', '5', '导出', '导出操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (23, 'sys_oper_type', '6', '导入', '导入操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (24, 'sys_oper_type', '7', '强退', '强退操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (25, 'sys_oper_type', '8', '生成代码', '生成操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (26, 'sys_oper_type', '9', '清空数据', '清空操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (27, 'sys_notice_status', '0', '成功', '成功状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (28, 'sys_notice_status', '1', '失败', '失败状态', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (29, 'sys_oper_type', '10', '登录', '登录操作', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 'sys_oper_type', '11', '退出', '', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (31, 'sys_oper_type', '12', '获取验证码', '获取验证码', 0, 2, '', '', '', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_data` VALUES (32, 'sys_content_status', '1', '正常', '', 0, 1, '', '', '', '', 1, 1, '2021-05-13 19:56:41', '2021-05-13 19:56:41', NULL);
INSERT INTO `sys_dict_data` VALUES (33, 'sys_content_status', '2', '禁用', '', 1, 1, '', '', '', '', 1, 1, '2021-05-13 19:56:41', '2021-05-13 19:56:41', NULL);
INSERT INTO `sys_dict_data` VALUES (34, 'sys_demo_status', '0', '正常', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 06:40:38', '2021-09-13 06:40:38', NULL);
INSERT INTO `sys_dict_data` VALUES (35, 'sys_demo_status', '1', '冻结', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 06:40:51', '2021-09-13 06:40:51', NULL);
INSERT INTO `sys_dict_data` VALUES (36, 'report_type', '0', '国内', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 07:28:40', '2021-09-13 07:28:40', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 'report_type', '1', '国外', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 07:28:53', '2021-09-13 07:28:53', NULL);
INSERT INTO `sys_dict_data` VALUES (38, 'report_type', '2', '国内外', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 07:29:01', '2021-09-13 07:29:01', NULL);
INSERT INTO `sys_dict_data` VALUES (39, 'report_is_finish', '0', '已完成', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 07:30:10', '2021-09-13 07:30:10', NULL);
INSERT INTO `sys_dict_data` VALUES (40, 'report_is_finish', '1', '未完成', '', 0, 2, '', '', '', '', 0, 0, '2021-09-13 07:30:18', '2021-09-13 07:30:18', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(128) NOT NULL COMMENT 'eg:用户性别',
  `dict_type` varchar(128) NOT NULL COMMENT 'eg:sys_user_sex',
  `remark` varchar(255) NOT NULL COMMENT 'eg:用户性别列表',
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dict_id`),
  KEY `idx_sys_dict_type_create_by` (`create_by`),
  KEY `idx_sys_dict_type_update_by` (`update_by`),
  KEY `idx_sys_dict_type_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '系统开关', 'sys_normal_disable', '系统开关列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (2, '用户性别', 'sys_user_sex', '用户性别列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (3, '菜单状态', 'sys_show_hide', '菜单状态列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (4, '系统是否', 'sys_yes_no', '系统是否列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (5, '任务状态', 'sys_job_status', '任务状态列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (6, '任务分组', 'sys_job_group', '任务分组列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '通知类型列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (8, '系统状态', 'sys_common_status', '登录状态列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '操作类型列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (10, '通知状态', 'sys_notice_status', '通知状态列表', 2, 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_dict_type` VALUES (11, 'demo状态', 'sys_demo_status', 'demo状态列表', 2, 1, 1, '2021-05-13 19:56:41', '2021-05-13 19:56:41', NULL);
INSERT INTO `sys_dict_type` VALUES (12, '报告类型', 'report_type', '', 2, 0, 0, '2021-09-13 07:27:49', '2021-09-13 07:27:49', NULL);
INSERT INTO `sys_dict_type` VALUES (13, '报告完成状态', 'report_is_finish', '', 2, 0, 0, '2021-09-13 07:29:54', '2021-09-13 07:29:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(255) NOT NULL,
  `job_group` varchar(255) NOT NULL,
  `job_type` tinyint(4) NOT NULL,
  `cron_expression` varchar(255) NOT NULL,
  `invoke_target` varchar(255) NOT NULL,
  `args` varchar(255) NOT NULL,
  `misfire_policy` bigint(20) NOT NULL,
  `concurrent` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `entry_id` smallint(6) NOT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`job_id`),
  KEY `idx_sys_job_deleted_at` (`deleted_at`),
  KEY `idx_sys_job_create_by` (`create_by`),
  KEY `idx_sys_job_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '接口测试', 'DEFAULT', 1, '0/5 * * * * ', 'http://localhost:8000', '', 1, 1, 1, 0, 1, 1, '2021-05-13 19:56:38', '2021-06-14 20:59:55', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `status` varchar(4) NOT NULL COMMENT '状态',
  `ipaddr` varchar(255) NOT NULL COMMENT 'ip地址',
  `login_location` varchar(255) NOT NULL COMMENT '归属地',
  `browser` varchar(255) NOT NULL COMMENT '浏览器',
  `os` varchar(255) NOT NULL COMMENT '系统',
  `platform` varchar(255) NOT NULL COMMENT '固件',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登录时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `msg` varchar(255) NOT NULL COMMENT '信息',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_login_log_create_by` (`create_by`),
  KEY `idx_sys_login_log_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL,
  `paths` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `path` varchar(128) NOT NULL,
  `menu_type` varchar(1) NOT NULL,
  `permission` varchar(255) NOT NULL,
  `component` varchar(255) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `visible` varchar(1) NOT NULL,
  `menu_name` varchar(128) NOT NULL COMMENT '*',
  `breadcrumb` varchar(255) NOT NULL COMMENT '*',
  `no_cache` tinyint(1) NOT NULL COMMENT '*',
  `is_frame` varchar(1) NOT NULL DEFAULT '0' COMMENT '*',
  `action` varchar(16) NOT NULL COMMENT '*',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`menu_id`),
  KEY `idx_sys_menu_create_by` (`create_by`),
  KEY `idx_sys_menu_update_by` (`update_by`),
  KEY `idx_sys_menu_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '/0/1', '系统', 'api-server', '/admin', 'M', '', 'Layout', 10, '1', 'Admin', '', 1, '1', '无', 0, 1, '2021-05-20 21:12:07', '2021-09-09 06:14:02', '2021-09-13 06:15:48');
INSERT INTO `sys_menu` VALUES (2, 0, '/0/2', '系统管理', 'api-server', '/admin', 'M', '', 'Layout', 10, '0', 'Admin', '', 1, '1', '无', 0, 1, '2021-05-20 21:12:07', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (3, 2, '/0/2/3', '用户管理', 'user', '/admin/sys-user', 'C', 'admin:sysUser:list', '/admin/sys-user/index', 10, '0', 'SysUserManage', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (4, 3, '/0/2/3/4', '新增管理员', 'app-group-fill', '', 'F', 'admin:sysUser:add', '', 10, '0', '', '', 0, '1', 'POST', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (5, 3, '/0/2/3/5', '查询管理员', 'app-group-fill', '', 'F', 'admin:sysUser:query', '', 40, '0', '', '', 0, '1', 'GET', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (6, 3, '/0/2/3/6', '修改管理员', 'app-group-fill', '', 'F', 'admin:sysUser:edit', '', 30, '0', '', '', 0, '1', 'PUT', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (7, 3, '/0/2/3/7', '删除管理员', 'app-group-fill', '', 'F', 'admin:sysUser:remove', '', 20, '0', '', '', 0, '1', 'DELETE', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (8, 2, '/0/2/8', '菜单管理', 'tree-table', '/admin/sys-menu', 'C', 'admin:sysMenu:list', '/admin/sys-menu/index', 30, '0', 'SysMenuManage', '', 1, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (9, 2, '/0/2/9', '角色管理', 'peoples', '/admin/sys-role', 'C', 'admin:sysRole:list', '/admin/sys-role/index', 20, '0', 'SysRoleManage', '', 1, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (10, 2, '/0/2/10', '部门管理', 'tree', '/admin/sys-dept', 'C', 'admin:sysDept:list', '/admin/sys-dept/index', 5, '0', 'SysDeptManage', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (11, 2, '/0/2/11', '岗位管理', 'pass', '/admin/sys-post', 'C', 'admin:sysPost:list', '/admin/sys-post/index', 5, '0', 'SysPostManage', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (12, 2, '/0/2/12', '字典管理', 'education', '/admin/dict', 'C', 'admin:sysDictType:list', '/admin/dict/index', 14, '0', 'Dict', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (13, 2, '/0/2/13', '字典数据', 'education', '/admin/dict/data/:dictId', 'C', 'admin:sysDictData:list', '/admin/dict/data', 100, '1', 'SysDictDataManage', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (14, 0, '/0/14', '开发工具', 'dev-tools', '/dev-tools', 'M', '', 'Layout', 15, '0', 'Tools', '', 0, '1', '无', 1, 1, '2020-04-11 15:09:48', '2021-09-07 06:36:30', NULL);
INSERT INTO `sys_menu` VALUES (15, 14, '/0/14/15', '系统接口', 'guide', '/dev-tools/swagger', 'C', '', '/dev-tools/swagger/index', 1, '0', 'Swagger', '', 0, '1', '无', 1, 1, '2020-04-11 15:09:48', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (16, 2, '/0/2/16', '参数管理', 'swagger', '/admin/sys-config', 'C', 'admin:sysConfig:list', '/admin/sys-config/index', 100, '1', 'SysConfigManage', '', 0, '1', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (17, 2, '/0/2/17', '日志管理', 'log', '/log', 'M', '', '/log/index', 80, '0', 'Log', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (18, 17, '/0/2/17/18', '登录日志', 'logininfor', '/admin/sys-login-log', 'C', 'admin:sysLoginLog:list', '/admin/sys-login-log/index', 1, '0', 'SysLoginLogManage', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (19, 17, '/0/2/17/19', '操作日志', 'skill', '/admin/sys-oper-log', 'C', 'admin:sysOperLog:list', '/admin/sys-oper-log/index', 1, '0', 'OperLog', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (20, 8, '/0/2/8/20', '新增菜单', 'app-group-fill', '', 'F', 'admin:sysMenu:add', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (21, 8, '/0/2/8/21', '修改菜单', 'app-group-fill', '', 'F', 'admin:sysMenu:edit', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (22, 8, '/0/2/8/22', '查询菜单', 'app-group-fill', '', 'F', 'admin:sysMenu:query', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (23, 8, '/0/2/8/23', '删除菜单', 'app-group-fill', '', 'F', 'admin:sysMenu:remove', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (24, 9, '/0/2/9/24', '新增角色', 'app-group-fill', '', 'F', 'admin:sysRole:add', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (25, 9, '/0/2/9/25', '查询角色', 'app-group-fill', '', 'F', 'admin:sysRole:query', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (26, 9, '/0/2/9/26', '修改角色', 'app-group-fill', '', 'F', 'admin:sysRole:update', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (27, 9, '/0/2/9/27', '删除角色', 'app-group-fill', '', 'F', 'admin:sysRole:remove', '', 1, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (28, 10, '/0/2/10/28', '查询部门', 'app-group-fill', '', 'F', 'admin:sysDept:query', '', 40, '0', '', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (29, 10, '/0/2/10/29', '新增部门', 'app-group-fill', '', 'F', 'admin:sysDept:add', '', 10, '0', '', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (30, 10, '/0/2/10/30', '修改部门', 'app-group-fill', '', 'F', 'admin:sysDept:edit', '', 30, '0', '', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (31, 10, '/0/2/10/31', '删除部门', 'app-group-fill', '', 'F', 'admin:sysDept:remove', '', 20, '0', '', '', 0, '1', '', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (32, 11, '/0/2/11/32', '查询岗位', 'app-group-fill', '', 'F', 'admin:sysPost:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (33, 11, '/0/2/11/33', '新增岗位', 'app-group-fill', '', 'F', 'admin:sysPost:add', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (34, 11, '/0/2/11/34', '修改岗位', 'app-group-fill', '', 'F', 'admin:sysPost:edit', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (35, 11, '/0/2/11/35', '删除岗位', 'app-group-fill', '', 'F', 'admin:sysPost:remove', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (36, 12, '/0/2/12/36', '查询字典', 'app-group-fill', '', 'F', 'admin:sysDictType:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (37, 12, '/0/2/12/37', '新增类型', 'app-group-fill', '', 'F', 'admin:sysDictType:add', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (38, 12, '/0/2/12/38', '修改类型', 'app-group-fill', '', 'F', 'admin:sysDictType:edit', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (39, 12, '/0/2/12/39', '删除类型', 'app-group-fill', '', 'F', 'system:sysdicttype:remove', '', 0, '1', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (40, 13, '/0/2/13/40', '查询数据', 'app-group-fill', '', 'F', 'admin:sysDictData:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (41, 13, '/0/2/13/41', '新增数据', 'app-group-fill', '', 'F', 'admin:sysDictData:add', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (42, 13, '/0/2/13/42', '修改数据', 'app-group-fill', '', 'F', 'admin:sysDictData:edit', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (43, 13, '/0/2/13/43', '删除数据', 'app-group-fill', '', 'F', 'admin:sysDictData:remove', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (44, 16, '/0/2/16/44', '查询参数', 'app-group-fill', '', 'F', 'admin:sysConfig:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (45, 16, '/0/2/16/45', '新增参数', 'app-group-fill', '', 'F', 'admin:sysConfig:add', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (46, 16, '/0/2/16/46', '修改参数', 'app-group-fill', '', 'F', 'admin:sysConfig:edit', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (47, 16, '/0/2/16/47', '删除参数', 'app-group-fill', '', 'F', 'admin:sysConfig:remove', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (48, 18, '/0/2/17/18/48', '查询登录日志', 'app-group-fill', '', 'F', 'admin:sysLoginLog:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (49, 18, '/0/2/17/18/49', '删除登录日志', 'app-group-fill', '', 'F', 'admin:sysLoginLog:remove', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (50, 19, '/0/2/17/19/50', '查询操作日志', 'app-group-fill', '', 'F', 'admin:sysOperLog:query', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (51, 19, '/0/2/17/19/51', '删除操作日志', 'app-group-fill', '', 'F', 'admin:sysOperLog:remove', '', 0, '0', '', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (52, 14, '/0/14/52', '代码生成', 'code', '/dev-tools/gen', 'C', '', '/dev-tools/gen/index', 2, '0', 'Gen', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-06-16 21:26:12', NULL);
INSERT INTO `sys_menu` VALUES (53, 14, '/0/14/53', '代码生成修改', 'build', '/dev-tools/editTable', 'C', '', '/dev-tools/gen/editTable', 100, '1', 'EditTable', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-06-16 21:26:12', NULL);
INSERT INTO `sys_menu` VALUES (54, 14, '/0/14/54', '表单构建', 'build', '/dev-tools/build', 'C', '', '/dev-tools/build/index', 1, '0', 'Build', '', 0, '1', '', 1, 1, '2020-04-11 15:09:48', '2021-06-16 21:26:12', NULL);
INSERT INTO `sys_menu` VALUES (55, 14, '/0/14/55', '服务监控', 'druid', '/dev-tools/monitor', 'C', 'devTools:serverMonitor:list', '/dev-tools/monitor', 0, '0', 'ServerMonitor', '', 0, '1', '', 1, 1, '2020-04-14 00:28:19', '2021-09-07 09:34:15', NULL);
INSERT INTO `sys_menu` VALUES (56, 0, '/0/56', '定时任务', 'time-range', '/schedule', 'M', '', 'Layout', 20, '0', 'Schedule', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (57, 56, '/0/56/57', 'Schedule', 'job', '/schedule/manage', 'C', 'job:sysJob:list', '/schedule/index', 0, '0', 'ScheduleManage', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (58, 57, '/0/56/57/58', '分页获取定时任务', 'app-group-fill', '', 'F', 'job:sysJob:query', '', 0, '0', 'sys_job', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (59, 57, '/0/56/57/59', '创建定时任务', 'app-group-fill', '', 'F', 'job:sysJob:add', '', 0, '0', 'sys_job', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (60, 57, '/0/56/57/60', '修改定时任务', 'app-group-fill', '', 'F', 'job:sysJob:edit', '', 0, '0', 'sys_job', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (61, 57, '/0/56/57/61', '删除定时任务', 'app-group-fill', '', 'F', 'job:sysJob:remove', '', 0, '0', 'sys_job', '', 0, '1', '无', 1, 1, '2020-08-03 09:17:37', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (62, 56, '/0/56/62', '日志', 'bug', '/schedule/log', 'C', '', '/schedule/log', 0, '1', 'JobLog', '', 0, '1', '', 1, 1, '2020-08-05 21:24:07', '2021-06-05 22:15:03', NULL);
INSERT INTO `sys_menu` VALUES (63, 2, '/0/2/63', '接口管理', 'api-doc', '/admin/sys-api', 'C', 'admin:sysApi:list', '/admin/sys-api/index', 40, '0', 'SysApiManage', '', 0, '0', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (64, 63, '/0/2/63/64', '查询接口', 'app-group-fill', '', 'F', 'admin:sysApi:query', '', 40, '0', '', '', 0, '0', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (65, 63, '/0/2/63/65', '修改接口', 'app-group-fill', '', 'F', 'admin:sysApi:edit', '', 30, '0', '', '', 0, '0', '无', 0, 1, '2021-05-20 22:08:45', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (66, 0, '0/66', '系统工具', 'system-tools', '/sys-tools', 'M', '', 'Layout', 30, '0', 'SysTools', '', 0, '1', '', 1, 1, '2021-05-21 11:13:32', '2021-06-16 21:26:12', '2021-09-13 06:14:35');
INSERT INTO `sys_menu` VALUES (67, 2, '0/2/67', '参数设置', 'system-tools', '/admin/sys-config/set', 'C', 'admin:sysConfigSet:list', '/admin/sys-config/set', 0, '0', 'SysConfigSet', '', 0, '1', '', 1, 1, '2021-05-25 16:06:53', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (68, 67, '0/2/67/68', '修改', 'upload', '', 'F', 'admin:sysConfigSet:update', '', 0, '0', '', '', 0, '1', '', 1, 1, '2021-06-13 11:45:49', '2021-09-09 06:14:02', NULL);
INSERT INTO `sys_menu` VALUES (69, 0, '', '系统业务', 'job', '/business', 'M', '', 'Layout', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:53:04', NULL);
INSERT INTO `sys_menu` VALUES (70, 69, '', '例子Demo', 'pass', '/business/demo', 'C', 'business:demo:list', '/business/demo/index', 0, '0', 'DemoManage', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:43:16', NULL);
INSERT INTO `sys_menu` VALUES (71, 70, '', '分页获取例子Demo', '', 'demo', 'F', 'business:demo:query', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:43:16', NULL);
INSERT INTO `sys_menu` VALUES (72, 70, '', '创建例子Demo', '', 'demo', 'F', 'business:demo:add', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:43:16', NULL);
INSERT INTO `sys_menu` VALUES (73, 70, '', '修改例子Demo', '', 'demo', 'F', 'business:demo:edit', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:43:16', NULL);
INSERT INTO `sys_menu` VALUES (74, 70, '', '删除例子Demo', '', 'demo', 'F', 'business:demo:remove', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 06:43:16', '2021-09-13 06:43:16', NULL);
INSERT INTO `sys_menu` VALUES (75, 69, '', '报告名单', 'pass', '/business/report-operator', 'C', 'business:reportOperator:list', '/business/report-operator/index', 0, '0', 'ReportOperatorManage', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:57', '2021-09-13 07:37:57', NULL);
INSERT INTO `sys_menu` VALUES (76, 75, '', '分页获取报告名单', '', 'report_operator', 'F', 'business:reportOperator:query', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:57', '2021-09-13 07:37:57', NULL);
INSERT INTO `sys_menu` VALUES (77, 75, '', '创建报告名单', '', 'report_operator', 'F', 'business:reportOperator:add', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:57', '2021-09-13 07:37:57', NULL);
INSERT INTO `sys_menu` VALUES (78, 75, '', '修改报告名单', '', 'report_operator', 'F', 'business:reportOperator:edit', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:57', '2021-09-13 07:37:57', NULL);
INSERT INTO `sys_menu` VALUES (79, 75, '', '删除报告名单', '', 'report_operator', 'F', 'business:reportOperator:remove', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:57', '2021-09-13 07:37:57', NULL);
INSERT INTO `sys_menu` VALUES (80, 69, '', '报告', 'pass', '/business/report', 'C', 'business:report:list', '/business/report/index', 0, '0', 'ReportManage', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:59', '2021-09-13 07:37:59', NULL);
INSERT INTO `sys_menu` VALUES (81, 80, '', '分页获取报告', '', 'report', 'F', 'business:report:query', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:59', '2021-09-13 07:37:59', NULL);
INSERT INTO `sys_menu` VALUES (82, 80, '', '创建报告', '', 'report', 'F', 'business:report:add', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:59', '2021-09-13 07:37:59', NULL);
INSERT INTO `sys_menu` VALUES (83, 80, '', '修改报告', '', 'report', 'F', 'business:report:edit', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:59', '2021-09-13 07:37:59', NULL);
INSERT INTO `sys_menu` VALUES (84, 80, '', '删除报告', '', 'report', 'F', 'business:report:remove', '', 0, '0', '', '', 0, '0', '无', 1, 1, '2021-09-13 07:37:59', '2021-09-13 07:37:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api_rule`;
CREATE TABLE `sys_menu_api_rule` (
  `sys_menu_menu_id` bigint(20) NOT NULL,
  `sys_api_id` bigint(20) NOT NULL,
  PRIMARY KEY (`sys_menu_menu_id`,`sys_api_id`),
  KEY `fk_sys_menu_api_rule_sys_api` (`sys_api_id`),
  CONSTRAINT `sys_menu_api_rule_ibfk_1` FOREIGN KEY (`sys_api_id`) REFERENCES `sys_api` (`id`),
  CONSTRAINT `sys_menu_api_rule_ibfk_2` FOREIGN KEY (`sys_menu_menu_id`) REFERENCES `sys_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu_api_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_migration
-- ----------------------------
DROP TABLE IF EXISTS `sys_migration`;
CREATE TABLE `sys_migration` (
  `version` varchar(191) NOT NULL,
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_migration
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_opera_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_opera_log`;
CREATE TABLE `sys_opera_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '操作模块',
  `business_type` varchar(128) NOT NULL COMMENT '操作类型',
  `business_types` varchar(128) NOT NULL COMMENT 'BusinessTypes',
  `method` varchar(128) NOT NULL COMMENT '函数',
  `request_method` varchar(128) NOT NULL COMMENT '请求方式',
  `operator_type` varchar(128) NOT NULL COMMENT '操作类型',
  `oper_name` varchar(128) NOT NULL COMMENT '操作者',
  `dept_name` varchar(128) NOT NULL COMMENT '部门名称',
  `oper_url` varchar(255) NOT NULL COMMENT '访问地址',
  `oper_ip` varchar(128) NOT NULL COMMENT '客户端ip',
  `oper_location` varchar(128) NOT NULL COMMENT '访问位置',
  `oper_param` varchar(255) NOT NULL COMMENT '请求参数',
  `status` varchar(4) NOT NULL COMMENT '操作状态',
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `json_result` varchar(255) NOT NULL COMMENT '返回数据',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `latency_time` varchar(128) NOT NULL COMMENT '耗时',
  `user_agent` varchar(255) NOT NULL COMMENT 'ua',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_opera_log_create_by` (`create_by`),
  KEY `idx_sys_opera_log_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_opera_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_name` varchar(32) NOT NULL,
  `post_code` varchar(32) NOT NULL,
  `sort` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`),
  KEY `idx_sys_post_create_by` (`create_by`),
  KEY `idx_sys_post_update_by` (`update_by`),
  KEY `idx_sys_post_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, '首席执行官', 'CEO', 0, 2, '首席执行官', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
INSERT INTO `sys_post` VALUES (2, '首席技术执行官', 'CTO', 2, 2, '首席技术执行官', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) NOT NULL,
  `role_key` varchar(128) NOT NULL,
  `role_sort` bigint(20) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `data_scope` varchar(128) NOT NULL COMMENT '数据权限',
  `remark` varchar(255) NOT NULL,
  `status` varchar(4) NOT NULL,
  `flag` varchar(128) NOT NULL COMMENT '*',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`role_id`),
  KEY `idx_sys_role_create_by` (`create_by`),
  KEY `idx_sys_role_update_by` (`update_by`),
  KEY `idx_sys_role_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'admin', 1, 1, '', '', '2', '', 1, 1, '2021-05-13 19:56:38', '2021-05-13 19:56:38', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`),
  KEY `idx-dept_id` (`dept_id`),
  CONSTRAINT `sys_role_dept_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_dept` (`dept_id`),
  CONSTRAINT `sys_role_dept_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `fk_sys_role_menu_sys_menu` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`),
  CONSTRAINT `sys_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_table`;
CREATE TABLE `sys_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `table_comment` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `tpl_category` varchar(255) DEFAULT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `module_front_name` varchar(255) DEFAULT NULL COMMENT '前端文件名',
  `business_name` varchar(255) DEFAULT NULL,
  `function_name` varchar(255) DEFAULT NULL,
  `function_author` varchar(255) DEFAULT NULL,
  `pk_column` varchar(255) DEFAULT NULL,
  `pk_go_field` varchar(255) DEFAULT NULL,
  `pk_json_field` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `tree_code` varchar(255) DEFAULT NULL,
  `tree_parent_code` varchar(255) DEFAULT NULL,
  `tree_name` varchar(255) DEFAULT NULL,
  `tree` tinyint(1) DEFAULT '0',
  `crud` tinyint(1) DEFAULT '1',
  `remark` varchar(255) DEFAULT NULL,
  `is_data_scope` tinyint(4) DEFAULT NULL,
  `is_actions` tinyint(4) DEFAULT NULL,
  `is_auth` tinyint(4) DEFAULT NULL,
  `is_logical_delete` varchar(1) DEFAULT NULL,
  `logical_delete` tinyint(1) DEFAULT NULL,
  `logical_delete_column` varchar(128) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`table_id`),
  KEY `idx_sys_tables_deleted_at` (`deleted_at`),
  KEY `idx_sys_tables_create_by` (`create_by`),
  KEY `idx_sys_tables_update_by` (`update_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_table
-- ----------------------------
BEGIN;
INSERT INTO `sys_table` VALUES (1, 'demo', '例子Demo', 'Demo', 'crud', 'business', 'demo', '', 'demo', 'demo', 'admin', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table` VALUES (2, 'report', '报告', 'Report', 'crud', 'business', 'report', '', 'report', 'Report', 'admin', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table` VALUES (3, 'report_operator', '报告名单', 'ReportOperator', 'crud', 'business', 'report-operator', '', 'reportOperator', 'ReportOperator', 'admin', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:16', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_table_column
-- ----------------------------
DROP TABLE IF EXISTS `sys_table_column`;
CREATE TABLE `sys_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` bigint(20) DEFAULT NULL,
  `column_name` varchar(128) DEFAULT NULL,
  `column_comment` varchar(128) DEFAULT NULL,
  `column_type` varchar(128) DEFAULT NULL,
  `go_type` varchar(128) DEFAULT NULL,
  `go_field` varchar(128) DEFAULT NULL,
  `json_field` varchar(128) DEFAULT NULL,
  `is_pk` varchar(4) DEFAULT NULL,
  `is_increment` varchar(4) DEFAULT NULL,
  `is_required` varchar(4) DEFAULT NULL,
  `is_insert` varchar(4) DEFAULT NULL,
  `is_edit` varchar(4) DEFAULT NULL,
  `is_list` varchar(4) DEFAULT NULL,
  `is_query` varchar(4) DEFAULT NULL,
  `query_type` varchar(128) DEFAULT NULL,
  `html_type` varchar(128) DEFAULT NULL,
  `dict_type` varchar(128) DEFAULT NULL,
  `sort` bigint(20) DEFAULT NULL,
  `list` varchar(1) DEFAULT NULL,
  `pk` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `super_column` tinyint(1) DEFAULT NULL,
  `usable_column` tinyint(1) DEFAULT NULL,
  `increment` tinyint(1) DEFAULT NULL,
  `insert` tinyint(1) DEFAULT NULL,
  `edit` tinyint(1) DEFAULT NULL,
  `query` tinyint(1) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `fk_table_name` longtext,
  `fk_table_name_class` longtext,
  `fk_table_name_package` longtext,
  `fk_label_id` longtext,
  `fk_label_name` varchar(255) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`column_id`),
  KEY `idx_sys_columns_update_by` (`update_by`),
  KEY `idx_sys_columns_deleted_at` (`deleted_at`),
  KEY `idx_sys_columns_create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_table_column
-- ----------------------------
BEGIN;
INSERT INTO `sys_table_column` VALUES (1, 1, 'id', 'ID', 'bigint(20) unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (2, 1, 'title', '标题', 'varchar(128)', 'string', 'Title', 'title', '0', '', '1', '1', '', '1', '1', 'LIKE', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (3, 1, 'author', '作者', 'varchar(128)', 'string', 'Author', 'author', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (4, 1, 'content', '内容', 'varchar(255)', 'string', 'Content', 'content', '0', '', '1', '1', '', '', '', 'EQ', 'textarea', '', 4, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (5, 1, 'status', '状态', 'tinyint(4)', 'string', 'Status', 'status', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', 'sys_demo_status', 5, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (6, 1, 'create_by', '创建者', 'bigint(20) unsigned', 'string', 'CreateBy', 'createBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 6, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:37:34', NULL);
INSERT INTO `sys_table_column` VALUES (7, 1, 'update_by', '更新者', 'bigint(20) unsigned', 'string', 'UpdateBy', 'updateBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 7, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:37:34', NULL);
INSERT INTO `sys_table_column` VALUES (8, 1, 'publish_at', '发布时间', 'datetime', 'time.Time', 'PublishAt', 'publishAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (9, 1, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '1', '1', '', '1', '1', 'EQ', 'datetime', '', 9, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:56:56', NULL);
INSERT INTO `sys_table_column` VALUES (10, 1, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '1', '1', '', '', '', 'EQ', 'datetime', '', 10, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:37:34', NULL);
INSERT INTO `sys_table_column` VALUES (11, 1, 'deleted_at', '删除时间', 'datetime', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 06:37:34', '2021-09-13 06:37:34', NULL);
INSERT INTO `sys_table_column` VALUES (12, 2, 'id', 'ID', 'bigint(20)', 'int', 'Id', 'id', '1', '', '1', '1', '', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (13, 2, 'company', '委托单位', 'varchar(128)', 'string', 'Company', 'company', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (14, 2, 'type', '查新范围', 'tinyint(4)', 'string', 'Type', 'type', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', 'report_type', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (15, 2, 'price', '费用', 'decimal(8,2)', 'string', 'Price', 'price', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 4, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (16, 2, 'operator_id', '查新员', 'varchar(128)', 'string', 'OperatorId', 'operatorId', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', '', 5, '', 0, 1, 0, 0, 0, 1, 0, 0, '', 'report_operator', 'ReportOperator', 'report-operator', 'id', 'name', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (17, 2, 'is_finish', '是否交费', 'tinyint(4)', 'string', 'IsFinish', 'isFinish', '0', '', '1', '1', '', '1', '1', 'EQ', 'select', 'report_is_finish', 6, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (18, 2, 'huizhi', '回执', 'varchar(128)', 'string', 'Huizhi', 'huizhi', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 7, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (19, 2, 'weituoshu', '委托书', 'varchar(128)', 'string', 'Weituoshu', 'weituoshu', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 8, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (20, 2, 'baogao', '报告', 'varchar(128)', 'string', 'Baogao', 'baogao', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 9, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (21, 2, 'fapiao', '发票', 'varchar(128)', 'string', 'Fapiao', 'fapiao', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (22, 2, 'saomiao', '扫描', 'varchar(128)', 'string', 'Saomiao', 'saomiao', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (23, 2, 'other', '其他', 'varchar(128)', 'string', 'Other', 'other', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 12, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (24, 2, 'phone', '电话', 'char(11)', 'string', 'Phone', 'phone', '0', '', '1', '1', '', '1', '1', 'EQ', 'input', '', 13, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (25, 2, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '1', '1', '', '1', '', 'EQ', 'textarea', '', 14, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (26, 2, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 15, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (27, 2, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 16, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (28, 2, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 17, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:53:00', NULL);
INSERT INTO `sys_table_column` VALUES (29, 2, 'updated_at', '最后更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '1', '1', '', '', '', 'EQ', 'datetime', '', 18, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (30, 2, 'deleted_at', '删除时间', 'datetime', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (31, 3, 'id', 'ID', 'bigint(20)', 'int', 'Id', 'id', '1', '', '1', '1', '', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:16', NULL);
INSERT INTO `sys_table_column` VALUES (32, 3, 'name', '人员名字', 'varchar(128)', 'string', 'Name', 'name', '0', '', '1', '1', '', '1', '1', 'LIKE', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:16', NULL);
INSERT INTO `sys_table_column` VALUES (33, 3, 'phone', '电话', 'char(11)', 'string', 'Phone', 'phone', '0', '', '1', '1', '', '1', '', 'EQ', 'input', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:16', NULL);
INSERT INTO `sys_table_column` VALUES (34, 3, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '1', '1', '', '1', '', 'EQ', 'textarea', '', 4, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:16', NULL);
INSERT INTO `sys_table_column` VALUES (35, 3, 'create_by', '创建者', 'bigint(20)', 'string', 'CreateBy', 'createBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 5, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (36, 3, 'update_by', '更新者', 'bigint(20)', 'string', 'UpdateBy', 'updateBy', '0', '', '1', '1', '', '', '', 'EQ', 'input', '', 6, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (37, 3, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 7, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:26:17', NULL);
INSERT INTO `sys_table_column` VALUES (38, 3, 'updated_at', '最后更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '1', '1', '', '', '', 'EQ', 'datetime', '', 8, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
INSERT INTO `sys_table_column` VALUES (39, 3, 'deleted_at', '删除时间', 'datetime', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2021-09-13 07:23:04', '2021-09-13 07:23:04', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(128) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `salt` varchar(255) DEFAULT NULL COMMENT '加盐',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门',
  `post_id` bigint(20) DEFAULT NULL COMMENT '岗位',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`),
  KEY `idx_sys_user_create_by` (`create_by`),
  KEY `idx_sys_user_update_by` (`update_by`),
  KEY `idx_sys_user_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$/Glr4g9Svr6O0kvjsRJCXu3f0W8/dsP3XZyVNi1019ratWpSPMyw.', 'zhangwj', '13818888888', 1, '', '', '1', '1@qq.com', 1, 1, '', '2', 1, 1, '2021-05-13 19:56:37.914', '2021-05-13 19:56:40.205', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


FROM hub.xesv5.com/library/golang:1.12.7-alpine
## FROM行由前端生成，请不要改动
ADD ./git-resource /home/www/fn_plat
RUN chmod +x /home/www/fn_plat/bin/fn_plat
WORKDIR  /home/www/fn_plat/
CMD ["bin/fn_plat_queue"]

#!/usr/bin/env bash
make
cp conf/conf_online.ini conf/conf.ini
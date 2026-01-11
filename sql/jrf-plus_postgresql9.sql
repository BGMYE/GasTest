-- 导出  表 gas.f_goods 结构
CREATE TABLE IF NOT EXISTS "f_goods" (
	"id" VARCHAR(300) NOT NULL,
	"goods_name" VARCHAR(300) NULL DEFAULT NULL,
	"goods_type" VARCHAR(30) NULL DEFAULT NULL,
	"goods_price" VARCHAR(300) NULL DEFAULT NULL,
	"goods_inventory" VARCHAR(300) NULL DEFAULT NULL,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"create_by" VARCHAR(765) NULL DEFAULT NULL,
	"create_name" VARCHAR(765) NULL DEFAULT NULL,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(765) NULL DEFAULT NULL,
	"update_name" VARCHAR(765) NULL DEFAULT NULL,
	"del_flag" CHAR(3) NULL DEFAULT NULL,
	"img_url" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- 正在导出表  gas.f_goods 的数据：4 rows
DELETE FROM "f_goods";
/*!40000 ALTER TABLE "f_goods" DISABLE KEYS */;
INSERT INTO "f_goods" ("id", "goods_name", "goods_type", "goods_price", "goods_inventory", "create_time", "create_by", "create_name", "update_time", "update_by", "update_name", "del_flag", "img_url") VALUES
	('1', 'test', '服装', '0', '7', NULL, NULL, NULL, '2025-12-17 21:31:23', '管理员', '1', '0  ', '/profile/upload/2025/11/07/ScreenShot_2025-09-26_110030_540_20251107213211A001.png'),
	('2', 'test', '服装', '0', '7', NULL, NULL, NULL, '2025-12-17 21:31:23', '管理员', '1', '0  ', '/profile/upload/2025/11/07/ScreenShot_2025-09-26_110030_540_20251107213211A001.png'),
	('fe1996e6249840428498401c77211', '商品1', '服装', '150', '11', '2025-12-17 20:51:17', '管理员', '1', NULL, NULL, NULL, '2  ', '/profile/upload/2025/12/17/ScreenShot_2025-09-26_112143_498_20251217205045A001.png'),
	('fe1996e6249840428498401c772e211e', '商品1', '服装', '150', '11', '2025-12-17 20:51:17', '管理员', '1', NULL, NULL, NULL, '2  ', '/profile/upload/2025/12/17/ScreenShot_2025-09-26_112143_498_20251217205045A001.png');
/*!40000 ALTER TABLE "f_goods" ENABLE KEYS */;

-- 导出  表 gas.gas_area_manage 结构
CREATE TABLE IF NOT EXISTS "gas_area_manage" (
	"area_manage_id" SERIAL NOT NULL,
	"supervision_id" INTEGER NULL DEFAULT NULL,
	"inspection_id" INTEGER NULL DEFAULT NULL,
	"region_code" VARCHAR(255) NULL DEFAULT NULL,
	"region_name" VARCHAR(255) NULL DEFAULT NULL,
	"create_by" VARCHAR(255) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(255) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("area_manage_id")
);

-- 正在导出表  gas.gas_area_manage 的数据：3 rows
DELETE FROM "gas_area_manage";
/*!40000 ALTER TABLE "gas_area_manage" DISABLE KEYS */;
INSERT INTO "gas_area_manage" ("area_manage_id", "supervision_id", "inspection_id", "region_code", "region_name", "create_by", "create_time", "update_by", "update_time") VALUES
	(9, 103, 102, '3', '3', 'admin', '2026-01-01 22:42:47', NULL, '2026-01-01 23:57:35'),
	(10, 100, 101, 'sefddd', 'wsefv', 'admin', '2026-01-02 00:01:31', NULL, '2026-01-02 00:01:52'),
	(11, 103, 101, NULL, NULL, 'admin', '2026-01-02 00:15:21', NULL, NULL);
/*!40000 ALTER TABLE "gas_area_manage" ENABLE KEYS */;

-- 导出  表 gas.gen_table 结构
CREATE TABLE IF NOT EXISTS "gen_table" (
	"table_id" SERIAL NOT NULL,
	"table_name" VARCHAR(200) NULL DEFAULT NULL::character varying,
	"table_comment" VARCHAR(500) NULL DEFAULT NULL::character varying,
	"sub_table_name" VARCHAR(64) NULL DEFAULT NULL,
	"sub_table_fk_name" VARCHAR(64) NULL DEFAULT NULL,
	"class_name" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"tpl_category" VARCHAR(200) NULL DEFAULT 'crud',
	"tpl_web_type" VARCHAR(30) NULL DEFAULT NULL::character varying,
	"package_name" VARCHAR(100) NULL DEFAULT NULL,
	"module_name" VARCHAR(30) NULL DEFAULT NULL,
	"business_name" VARCHAR(30) NULL DEFAULT NULL,
	"function_name" VARCHAR(50) NULL DEFAULT NULL,
	"function_author" VARCHAR(50) NULL DEFAULT NULL,
	"gen_type" CHAR(1) NULL DEFAULT '0',
	"gen_path" VARCHAR(200) NULL DEFAULT '/',
	"row_type" CHAR(2) NULL DEFAULT NULL,
	"options" VARCHAR(1000) NULL DEFAULT NULL,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("table_id")
);

-- 正在导出表  gas.gen_table 的数据：4 rows
DELETE FROM "gen_table";
/*!40000 ALTER TABLE "gen_table" DISABLE KEYS */;
INSERT INTO "gen_table" ("table_id", "table_name", "table_comment", "sub_table_name", "sub_table_fk_name", "class_name", "tpl_category", "tpl_web_type", "package_name", "module_name", "business_name", "function_name", "function_author", "gen_type", "gen_path", "row_type", "options", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(3, 'sys_post', '岗位信息表', NULL, NULL, 'SysPost', 'crud', 'element-plus', 'com.ruoyi.system', 'system', 'post', '岗位信息', 'ruoyi', '0', '/', '2 ', '{"parentMenuId":0}', 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37', NULL),
	(5, 'sys_dept', '部门表', NULL, NULL, 'SysDept', 'crud', NULL, 'com.ruoyi.system', 'system', 'dept', '部门', 'ruoyi', '0', '/', NULL, NULL, 'admin', '2025-12-30 16:13:12', NULL, NULL, NULL),
	(6, 'gas_area_manage', '监检区域分配', NULL, NULL, 'GasAreaManage', 'crud', 'element-plus', 'com.sxgpra.gasAreaManage', 'sxgpra', 'gasAreaManage', '监检区域分配', '岳鑫', '0', '/', '1 ', '{"parentMenuId":2054}', 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58', NULL),
	(7, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', NULL, 'com.ruoyi.system', 'system', 'user', '用户信息', 'ruoyi', '0', '/', NULL, NULL, 'admin', '2026-01-01 22:01:26', NULL, NULL, NULL);
/*!40000 ALTER TABLE "gen_table" ENABLE KEYS */;

-- 导出  表 gas.gen_table_column 结构
CREATE TABLE IF NOT EXISTS "gen_table_column" (
	"column_id" SERIAL NOT NULL,
	"table_id" BIGINT NULL DEFAULT NULL,
	"column_name" VARCHAR(200) NULL DEFAULT NULL,
	"column_comment" VARCHAR(500) NULL DEFAULT NULL,
	"column_type" VARCHAR(100) NULL DEFAULT NULL,
	"java_type" VARCHAR(500) NULL DEFAULT NULL,
	"java_field" VARCHAR(200) NULL DEFAULT NULL,
	"is_pk" CHAR(1) NULL DEFAULT NULL,
	"is_increment" CHAR(1) NULL DEFAULT NULL,
	"is_required" CHAR(1) NULL DEFAULT NULL,
	"is_insert" CHAR(1) NULL DEFAULT NULL,
	"is_edit" CHAR(1) NULL DEFAULT NULL,
	"is_list" CHAR(1) NULL DEFAULT NULL,
	"is_query" CHAR(1) NULL DEFAULT NULL,
	"query_type" VARCHAR(200) NULL DEFAULT 'EQ',
	"html_type" VARCHAR(200) NULL DEFAULT NULL,
	"dict_type" VARCHAR(200) NULL DEFAULT NULL::character varying,
	"sort" INTEGER NULL DEFAULT NULL,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("column_id")
);

-- 正在导出表  gas.gen_table_column 的数据：52 rows
DELETE FROM "gen_table_column";
/*!40000 ALTER TABLE "gen_table_column" DISABLE KEYS */;
INSERT INTO "gen_table_column" ("column_id", "table_id", "column_name", "column_comment", "column_type", "java_type", "java_field", "is_pk", "is_increment", "is_required", "is_insert", "is_edit", "is_list", "is_query", "query_type", "html_type", "dict_type", "sort", "create_by", "create_time", "update_by", "update_time") VALUES
	(62, 3, 'post_id', '岗位ID', 'bigint(20)', 'Long', 'postId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(63, 3, 'post_code', '岗位编码', 'varchar(64)', 'String', 'postCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', NULL, 2, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(64, 3, 'post_name', '岗位名称', 'varchar(50)', 'String', 'postName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, 3, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(65, 3, 'post_sort', '显示顺序', 'int(4)', 'Integer', 'postSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_process_category', 4, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(66, 3, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', NULL, 5, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(67, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'create_by', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 6, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(68, 3, 'create_time', '创建时间', 'datetime', 'Date', 'create_time', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 7, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(69, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'update_by', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, 8, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(70, 3, 'update_time', '更新时间', 'datetime', 'Date', 'update_time', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 9, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(71, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, 10, 'admin', '2025-08-26 14:06:47', NULL, '2025-08-26 15:05:37'),
	(81, 5, 'dept_id', '部门id', 'bigint(20)', 'Long', 'deptId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(82, 5, 'parent_id', '父部门id', 'bigint(20)', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 2, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(83, 5, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 3, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(84, 5, 'dept_name', '部门名称', 'varchar(30)', 'String', 'deptName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', NULL, 4, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(85, 5, 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 5, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(86, 5, 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 6, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(87, 5, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 7, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(88, 5, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 8, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(89, 5, 'status', '部门状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', NULL, 9, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(90, 5, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 10, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(91, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'create_by', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 11, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(92, 5, 'create_time', '创建时间', 'datetime', 'Date', 'create_time', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 12, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(93, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'update_by', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, 13, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(94, 5, 'update_time', '更新时间', 'datetime', 'Date', 'update_time', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 14, 'admin', '2025-12-30 16:13:12', NULL, '2026-01-01 20:24:17'),
	(95, 6, 'area_manage_id', '监检区域分配ID', 'int(11)', 'Long', 'areaManageId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(96, 6, 'supervision_id', '监察机构ID', 'int(11)', 'Long', 'supervisionId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'exp_data_type', 2, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(97, 6, 'inspection_id', '监检机构ID', 'int(11)', 'Long', 'inspectionId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 3, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(98, 6, 'region_code', '安装区域代码', 'varchar(255)', 'String', 'regionCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 4, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(99, 6, 'region_name', '安装区域名称', 'varchar(255)', 'String', 'regionName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', NULL, 5, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(100, 6, 'create_by', '创建人', 'varchar(255)', 'String', 'create_by', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 6, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(101, 6, 'create_time', '创建时间', 'datetime', 'Date', 'create_time', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', NULL, 7, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(102, 6, 'update_by', '更新人', 'varchar(255)', 'String', 'update_by', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'input', NULL, 8, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(103, 6, 'update_time', '更新时间', 'datetime', 'Date', 'update_time', '0', '0', '0', '0', '0', '0', '0', 'EQ', 'datetime', NULL, 9, 'admin', '2026-01-01 20:19:41', NULL, '2026-01-01 22:19:58'),
	(104, 7, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 1, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(105, 7, 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 2, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(106, 7, 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, 3, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(107, 7, 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', NULL, 4, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(108, 7, 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', NULL, 5, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(109, 7, 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 6, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(110, 7, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 7, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(111, 7, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', NULL, 8, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(112, 7, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 9, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(113, 7, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 10, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(114, 7, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', NULL, 11, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(115, 7, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 12, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(116, 7, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', NULL, 13, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(117, 7, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', NULL, 14, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(118, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'create_by', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', NULL, 15, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(119, 7, 'create_time', '创建时间', 'datetime', 'Date', 'create_time', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', NULL, 16, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(120, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'update_by', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', NULL, 17, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(121, 7, 'update_time', '更新时间', 'datetime', 'Date', 'update_time', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', NULL, 18, 'admin', '2026-01-01 22:01:26', NULL, NULL),
	(122, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', NULL, 19, 'admin', '2026-01-01 22:01:26', NULL, NULL);
/*!40000 ALTER TABLE "gen_table_column" ENABLE KEYS */;

-- 导出  表 gas.qingjia 结构
CREATE TABLE IF NOT EXISTS "qingjia" (
	"id" SERIAL NOT NULL,
	"task_id" VARCHAR(255) NOT NULL,
	"applicant_name" VARCHAR(255) NULL DEFAULT NULL,
	"leave_type" VARCHAR(255) NULL DEFAULT NULL,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"create_by" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("id", "task_id")
);

-- 正在导出表  gas.qingjia 的数据：2 rows
DELETE FROM "qingjia";
/*!40000 ALTER TABLE "qingjia" DISABLE KEYS */;
INSERT INTO "qingjia" ("id", "task_id", "applicant_name", "leave_type", "create_time", "create_by") VALUES
	(1, '67512', '请问', 'sick', NULL, NULL),
	(2, '67526', '请问', 'sick', NULL, NULL);
/*!40000 ALTER TABLE "qingjia" ENABLE KEYS */;

-- 导出  表 gas.sys_company 结构
CREATE TABLE IF NOT EXISTS "sys_company" (
	"scp_id" SERIAL NOT NULL,
	"dept_id" BIGINT NULL DEFAULT NULL,
	"scp_party_name" VARCHAR(300) NOT NULL,
	"scp_short_name" VARCHAR(50) NULL DEFAULT NULL,
	"scp_pid" BIGINT NOT NULL DEFAULT 0,
	"scp_add_date" TIMESTAMP NOT NULL DEFAULT pg_systimestamp(),
	"scp_update_date" TIMESTAMP NULL DEFAULT NULL,
	"scp_update_userid" BIGINT NULL DEFAULT NULL,
	"scp_update_username" VARCHAR(30) NULL DEFAULT NULL,
	"scp_province" VARCHAR(30) NULL DEFAULT NULL,
	"scp_city" VARCHAR(100) NULL DEFAULT NULL,
	"scp_address" VARCHAR(300) NULL DEFAULT NULL,
	"scp_status" VARCHAR(30) NOT NULL DEFAULT '0',
	"scp_desp" TEXT NULL DEFAULT NULL,
	"scp_type" VARCHAR(30) NOT NULL,
	"scp_add_userid" BIGINT NULL DEFAULT NULL,
	"scp_add_username" VARCHAR(30) NOT NULL,
	"scp_confirm_username" VARCHAR(50) NULL DEFAULT NULL,
	"scp_confirm_userid" BIGINT NULL DEFAULT NULL,
	"scp_confirm_date" TIMESTAMP NULL DEFAULT NULL,
	"scp_buss_type" VARCHAR(50) NULL DEFAULT 'RFQ',
	"scp_audit_date" TIMESTAMP NULL DEFAULT NULL,
	"scp_audit_user_id" BIGINT NULL DEFAULT 0,
	"scp_audit_user_name" VARCHAR(50) NULL DEFAULT NULL,
	"scp_user_mac" CHAR(1) NULL DEFAULT NULL,
	"scp_code" VARCHAR(100) NULL DEFAULT NULL,
	"scp_score" INTEGER NULL DEFAULT NULL,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	"scp_paidincapital" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_taxpaymentgrade" VARCHAR(20) NULL DEFAULT NULL,
	"scp_canbaonumber" INTEGER NULL DEFAULT NULL,
	"scp_salespromise" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_creditscore" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_tuijian" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_fuzhai" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_zichan" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_cunhuo" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_cunhuonianmo" NUMERIC(18,2) NULL DEFAULT NULL,
	"scp_xiaoshoucb" NUMERIC(18,2) NULL DEFAULT NULL,
	PRIMARY KEY ("scp_id")
);

-- 正在导出表  gas.sys_company 的数据：1 rows
DELETE FROM "sys_company";
/*!40000 ALTER TABLE "sys_company" DISABLE KEYS */;
INSERT INTO "sys_company" ("scp_id", "dept_id", "scp_party_name", "scp_short_name", "scp_pid", "scp_add_date", "scp_update_date", "scp_update_userid", "scp_update_username", "scp_province", "scp_city", "scp_address", "scp_status", "scp_desp", "scp_type", "scp_add_userid", "scp_add_username", "scp_confirm_username", "scp_confirm_userid", "scp_confirm_date", "scp_buss_type", "scp_audit_date", "scp_audit_user_id", "scp_audit_user_name", "scp_user_mac", "scp_code", "scp_score", "create_by", "create_time", "update_by", "update_time", "remark", "scp_paidincapital", "scp_taxpaymentgrade", "scp_canbaonumber", "scp_salespromise", "scp_creditscore", "scp_tuijian", "scp_fuzhai", "scp_zichan", "scp_cunhuo", "scp_cunhuonianmo", "scp_xiaoshoucb") VALUES
	(9, 200, '自贡市轻工业设计研究院有限责任公司', NULL, -1, '2025-08-14 15:11:55', NULL, NULL, NULL, '北京市', '东城区', '自贡市沿滩区高新工业园区金川路15号服务中心综合楼4-2号425房间', 'A', '自贡市轻工业设计研究院有限责任公司', 'SELLER', -1, 'test001-姓名', NULL, NULL, NULL, 'RFQ', NULL, 0, NULL, NULL, 'TGFB9', NULL, NULL, '2025-08-14 15:11:54', NULL, '2025-08-14 15:11:54', NULL, 1200.00, NULL, 100, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);
/*!40000 ALTER TABLE "sys_company" ENABLE KEYS */;

-- 导出  表 gas.sys_config 结构
CREATE TABLE IF NOT EXISTS "sys_config" (
	"config_id" SERIAL NOT NULL,
	"config_name" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"config_key" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"config_value" VARCHAR(500) NULL DEFAULT NULL::character varying,
	"config_type" CHAR(1) NULL DEFAULT 'N',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("config_id")
);

-- 正在导出表  gas.sys_config 的数据：6 rows
DELETE FROM "sys_config";
/*!40000 ALTER TABLE "sys_config" DISABLE KEYS */;
INSERT INTO "sys_config" ("config_id", "config_name", "config_key", "config_value", "config_type", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-08-12 17:06:45', NULL, NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-08-12 17:06:45', NULL, NULL, '初始化密码 123456'),
	(3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 14:02:46', '深色主题theme-dark，浅色主题theme-light'),
	(4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:26:40', '是否开启验证码功能（true开启，false关闭）'),
	(5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:28:45', '是否开启注册用户功能（true开启，false关闭）'),
	(6, '用户登录-黑名单列表', 'sys.login.blackIPList', NULL, 'Y', 'admin', '2025-08-12 17:06:45', NULL, NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE "sys_config" ENABLE KEYS */;

-- 导出  表 gas.sys_customer_required 结构
CREATE TABLE IF NOT EXISTS "sys_customer_required" (
	"sus_id" SERIAL NOT NULL,
	"user_id" BIGINT NULL DEFAULT NULL,
	"sus_party_id" BIGINT NOT NULL,
	"sus_usname" VARCHAR(300) NOT NULL,
	"sus_uspasswd" VARCHAR(300) NOT NULL,
	"sus_adddate" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"sus_realname" VARCHAR(100) NOT NULL,
	"sus_jobsite" VARCHAR(100) NULL DEFAULT NULL,
	"sus_phone" VARCHAR(100) NULL DEFAULT NULL,
	"sus_telphone" VARCHAR(100) NULL DEFAULT NULL,
	"sus_email" VARCHAR(100) NULL DEFAULT NULL,
	"sus_fax" VARCHAR(100) NULL DEFAULT NULL,
	"sus_address" VARCHAR(300) NULL DEFAULT NULL,
	"sus_startdate" TIMESTAMP NULL DEFAULT NULL,
	"sus_enddate" TIMESTAMP NULL DEFAULT NULL,
	"sus_update_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_update_userid" BIGINT NULL DEFAULT NULL,
	"sus_update_usname" VARCHAR(100) NULL DEFAULT NULL,
	"sus_status" VARCHAR(100) NOT NULL DEFAULT '0',
	"sus_pid" BIGINT NULL DEFAULT NULL,
	"sus_add_userid" BIGINT NULL DEFAULT NULL,
	"sus_add_usname" VARCHAR(100) NULL DEFAULT NULL,
	"sus_sex" VARCHAR(10) NULL DEFAULT NULL,
	"sus_recommend" TEXT NULL DEFAULT NULL,
	"sus_encrtpwd" VARCHAR(100) NULL DEFAULT NULL,
	"sus_functionpwd" VARCHAR(100) NULL DEFAULT NULL,
	"sus_partners" VARCHAR(500) NULL DEFAULT NULL,
	"sus_isplatform" VARCHAR(100) NULL DEFAULT NULL,
	"sus_inbind" VARCHAR(300) NULL DEFAULT NULL,
	"sus_linkman2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_phone2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_feedate" TIMESTAMP NULL DEFAULT NULL,
	"sus_callphone2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_isopen" VARCHAR(10) NULL DEFAULT 'Y',
	"sus_endbidbefore" VARCHAR(10) NULL DEFAULT 'Y',
	"sus_confirm_username" VARCHAR(50) NULL DEFAULT NULL,
	"sus_confirm_userid" BIGINT NULL DEFAULT NULL,
	"sus_confirm_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_audit_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_audit_user_id" BIGINT NULL DEFAULT 0,
	"sus_audit_user_name" VARCHAR(50) NULL DEFAULT NULL,
	"sus_dept_id" BIGINT NULL DEFAULT NULL,
	"sus_dept_name" VARCHAR(1000) NULL DEFAULT NULL,
	"sus_last_update_password_date" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"sus_last_logdate" TIMESTAMP NULL DEFAULT NULL,
	"sus_last_log_address" VARCHAR(50) NULL DEFAULT NULL,
	"sus_last_log_ip" VARCHAR(50) NULL DEFAULT NULL,
	"sus_islocked" CHAR(1) NULL DEFAULT '0',
	"sus_lock_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_attempt_count" INTEGER NULL DEFAULT 0,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("sus_id")
);

-- 正在导出表  gas.sys_customer_required 的数据：0 rows
DELETE FROM "sys_customer_required";
/*!40000 ALTER TABLE "sys_customer_required" DISABLE KEYS */;
/*!40000 ALTER TABLE "sys_customer_required" ENABLE KEYS */;

-- 导出  表 gas.sys_customer_user 结构
CREATE TABLE IF NOT EXISTS "sys_customer_user" (
	"sus_id" SERIAL NOT NULL,
	"user_id" BIGINT NULL DEFAULT NULL,
	"sus_party_id" BIGINT NOT NULL,
	"sus_usname" VARCHAR(300) NOT NULL,
	"sus_uspasswd" VARCHAR(300) NOT NULL,
	"sus_adddate" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"sus_realname" VARCHAR(100) NOT NULL,
	"sus_jobsite" VARCHAR(100) NULL DEFAULT NULL,
	"sus_phone" VARCHAR(100) NULL DEFAULT NULL,
	"sus_telphone" VARCHAR(100) NULL DEFAULT NULL,
	"sus_email" VARCHAR(100) NULL DEFAULT NULL,
	"sus_fax" VARCHAR(100) NULL DEFAULT NULL,
	"sus_address" VARCHAR(300) NULL DEFAULT NULL,
	"sus_startdate" TIMESTAMP NULL DEFAULT NULL,
	"sus_enddate" TIMESTAMP NULL DEFAULT NULL,
	"sus_update_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_update_userid" BIGINT NULL DEFAULT NULL,
	"sus_update_usname" VARCHAR(100) NULL DEFAULT NULL,
	"sus_status" VARCHAR(100) NOT NULL DEFAULT '0',
	"sus_pid" BIGINT NULL DEFAULT NULL,
	"sus_add_userid" BIGINT NULL DEFAULT NULL,
	"sus_add_usname" VARCHAR(100) NULL DEFAULT NULL,
	"sus_sex" VARCHAR(10) NULL DEFAULT NULL,
	"sus_recommend" TEXT NULL DEFAULT NULL,
	"sus_encrtpwd" VARCHAR(100) NULL DEFAULT NULL,
	"sus_functionpwd" VARCHAR(100) NULL DEFAULT NULL,
	"sus_partners" VARCHAR(500) NULL DEFAULT NULL,
	"sus_isplatform" VARCHAR(100) NULL DEFAULT NULL,
	"sus_inbind" VARCHAR(300) NULL DEFAULT NULL,
	"sus_linkman2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_phone2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_feedate" TIMESTAMP NULL DEFAULT NULL,
	"sus_callphone2" VARCHAR(100) NULL DEFAULT NULL,
	"sus_isopen" VARCHAR(10) NULL DEFAULT 'Y',
	"sus_endbidbefore" VARCHAR(10) NULL DEFAULT 'Y',
	"sus_confirm_username" VARCHAR(50) NULL DEFAULT NULL,
	"sus_confirm_userid" BIGINT NULL DEFAULT NULL,
	"sus_confirm_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_audit_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_audit_user_id" BIGINT NULL DEFAULT 0,
	"sus_audit_user_name" VARCHAR(50) NULL DEFAULT NULL,
	"sus_dept_id" BIGINT NULL DEFAULT NULL,
	"sus_dept_name" VARCHAR(1000) NULL DEFAULT NULL,
	"sus_last_update_password_date" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"sus_last_logdate" TIMESTAMP NULL DEFAULT NULL,
	"sus_last_log_address" VARCHAR(50) NULL DEFAULT NULL,
	"sus_last_log_ip" VARCHAR(50) NULL DEFAULT NULL,
	"sus_islocked" CHAR(1) NULL DEFAULT '0',
	"sus_lock_date" TIMESTAMP NULL DEFAULT NULL,
	"sus_attempt_count" INTEGER NULL DEFAULT 0,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT pg_systimestamp(),
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("sus_id"),
	UNIQUE ("sus_usname")
);

-- 正在导出表  gas.sys_customer_user 的数据：1 rows
DELETE FROM "sys_customer_user";
/*!40000 ALTER TABLE "sys_customer_user" DISABLE KEYS */;
INSERT INTO "sys_customer_user" ("sus_id", "user_id", "sus_party_id", "sus_usname", "sus_uspasswd", "sus_adddate", "sus_realname", "sus_jobsite", "sus_phone", "sus_telphone", "sus_email", "sus_fax", "sus_address", "sus_startdate", "sus_enddate", "sus_update_date", "sus_update_userid", "sus_update_usname", "sus_status", "sus_pid", "sus_add_userid", "sus_add_usname", "sus_sex", "sus_recommend", "sus_encrtpwd", "sus_functionpwd", "sus_partners", "sus_isplatform", "sus_inbind", "sus_linkman2", "sus_phone2", "sus_feedate", "sus_callphone2", "sus_isopen", "sus_endbidbefore", "sus_confirm_username", "sus_confirm_userid", "sus_confirm_date", "sus_audit_date", "sus_audit_user_id", "sus_audit_user_name", "sus_dept_id", "sus_dept_name", "sus_last_update_password_date", "sus_last_logdate", "sus_last_log_address", "sus_last_log_ip", "sus_islocked", "sus_lock_date", "sus_attempt_count", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(8, 100, 9, 'TEST001', '$2a$10$VLG/ykvkxQLlg6TBQ6J78ubV722adbfZf3UlCtWPq0ILRJ4ktG1YO', '2025-08-14 15:11:54', 'test001-姓名', '支援', '0311-11112222', '13322221111', '4333@qq.com', NULL, '河北秦皇岛', NULL, NULL, '2025-08-14 17:19:24', NULL, NULL, 'A', 0, -1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-08-14 15:11:54', NULL, NULL, NULL, '0', NULL, 0, NULL, '2025-08-14 15:11:54', NULL, '2025-08-14 15:11:54', NULL);
/*!40000 ALTER TABLE "sys_customer_user" ENABLE KEYS */;

-- 导出  表 gas.sys_deploy_form 结构
CREATE TABLE IF NOT EXISTS "sys_deploy_form" (
	"id" SERIAL NOT NULL,
	"form_id" BIGINT NULL DEFAULT NULL,
	"deploy_id" VARCHAR(50) NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- 正在导出表  gas.sys_deploy_form 的数据：18 rows
DELETE FROM "sys_deploy_form";
/*!40000 ALTER TABLE "sys_deploy_form" DISABLE KEYS */;
INSERT INTO "sys_deploy_form" ("id", "form_id", "deploy_id") VALUES
	(9623, 3936, '1'),
	(9624, 3936, '5'),
	(9625, 3936, '9'),
	(9626, 3936, '13'),
	(9627, 3936, '2509'),
	(9628, 3936, '5008'),
	(9629, 3936, '7514'),
	(9630, 3936, '10001'),
	(9631, 3936, '10005'),
	(9632, 3936, '20005'),
	(9633, 3936, '47514'),
	(9634, 3938, '55001'),
	(9635, 3938, '55005'),
	(9637, 3939, '55030'),
	(9638, 3939, '57520'),
	(9639, 3938, '57536'),
	(9640, 3939, '57639'),
	(9641, 3938, '57687');
/*!40000 ALTER TABLE "sys_deploy_form" ENABLE KEYS */;

-- 导出  表 gas.sys_dept 结构
CREATE TABLE IF NOT EXISTS "sys_dept" (
	"dept_id" SERIAL NOT NULL,
	"parent_id" BIGINT NULL DEFAULT 0,
	"ancestors" VARCHAR(500) NULL DEFAULT NULL::character varying,
	"dept_name" VARCHAR(30) NULL DEFAULT NULL::character varying,
	"order_num" INTEGER NULL DEFAULT 0,
	"leader" VARCHAR(20) NULL DEFAULT NULL,
	"phone" VARCHAR(11) NULL DEFAULT NULL,
	"email" VARCHAR(50) NULL DEFAULT NULL,
	"status" CHAR(1) NULL DEFAULT '0',
	"del_flag" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("dept_id")
);

-- 正在导出表  gas.sys_dept 的数据：10 rows
DELETE FROM "sys_dept";
/*!40000 ALTER TABLE "sys_dept" DISABLE KEYS */;
INSERT INTO "sys_dept" ("dept_id", "parent_id", "ancestors", "dept_name", "order_num", "leader", "phone", "email", "status", "del_flag", "create_by", "create_time", "update_by", "update_time") VALUES
	(100, 0, '0', '陕西科技', 0, '若依', '15888888888', 'sx@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', 'admin', '2025-11-10 14:24:10'),
	(101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL),
	(109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL);
/*!40000 ALTER TABLE "sys_dept" ENABLE KEYS */;

-- 导出  表 gas.sys_dict_data 结构
CREATE TABLE IF NOT EXISTS "sys_dict_data" (
	"dict_code" SERIAL NOT NULL,
	"dict_sort" INTEGER NULL DEFAULT 0,
	"dict_label" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"dict_value" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"dict_type" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"css_class" VARCHAR(100) NULL DEFAULT NULL,
	"list_class" VARCHAR(100) NULL DEFAULT NULL,
	"is_default" CHAR(1) NULL DEFAULT 'N',
	"status" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("dict_code")
);

-- 正在导出表  gas.sys_dict_data 的数据：38 rows
DELETE FROM "sys_dict_data";
/*!40000 ALTER TABLE "sys_dict_data" DISABLE KEYS */;
INSERT INTO "sys_dict_data" ("dict_code", "dict_sort", "dict_label", "dict_value", "dict_type", "css_class", "list_class", "is_default", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, 1, '男', '0', 'sys_user_sex', NULL, NULL, 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', NULL, NULL, 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '性别未知'),
	(4, 1, '显示', '0', 'sys_show_hide', NULL, 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', NULL, 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', NULL, 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '停用状态'),
	(10, 1, '默认', 'DEFAULT', 'sys_job_group', NULL, NULL, 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '默认分组'),
	(11, 2, '系统', 'SYSTEM', 'sys_job_group', NULL, NULL, 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '系统分组'),
	(12, 1, '是', 'Y', 'sys_yes_no', NULL, 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '系统默认是'),
	(13, 2, '否', 'N', 'sys_yes_no', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '系统默认否'),
	(14, 1, '通知', '1', 'sys_notice_type', NULL, 'warning', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '通知'),
	(15, 2, '公告', '2', 'sys_notice_type', NULL, 'success', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '公告'),
	(16, 1, '正常', '0', 'sys_notice_status', NULL, 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '正常状态'),
	(17, 2, '关闭', '1', 'sys_notice_status', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '关闭状态'),
	(18, 99, '其他', '0', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '其他操作'),
	(19, 1, '新增', '1', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '新增操作'),
	(20, 2, '修改', '2', 'sys_oper_type', NULL, 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '修改操作'),
	(21, 3, '删除', '3', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '删除操作'),
	(22, 4, '授权', '4', 'sys_oper_type', NULL, 'primary', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '授权操作'),
	(23, 5, '导出', '5', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '导出操作'),
	(24, 6, '导入', '6', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '导入操作'),
	(25, 7, '强退', '7', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '强退操作'),
	(26, 8, '生成代码', '8', 'sys_oper_type', NULL, 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '生成操作'),
	(27, 9, '清空数据', '9', 'sys_oper_type', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '清空操作'),
	(28, 1, '成功', '0', 'sys_common_status', NULL, 'primary', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '正常状态'),
	(29, 2, '失败', '1', 'sys_common_status', NULL, 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '停用状态'),
	(100, 0, '系统指定', 'fixed', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:04:46', NULL, NULL, NULL),
	(101, 0, '动态选择', 'dynamic', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:05:02', NULL, NULL, NULL),
	(104, 0, '任务监听', '1', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:26', NULL, NULL, NULL),
	(105, 2, '执行监听', '2', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:37', NULL, NULL, NULL),
	(106, 0, 'JAVA类', 'classListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:48:55', 'admin', '2024-09-05 21:38:02', NULL),
	(107, 0, '表达式', 'expressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:05', 'admin', '2024-09-05 21:38:10', NULL),
	(108, 0, '代理表达式', 'delegateExpressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:16', 'admin', '2024-09-05 21:38:16', NULL),
	(109, 0, '请假', 'leave', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:08:42', NULL, NULL, NULL),
	(110, 0, '报销', 'expense', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:09:02', NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_dict_data" ENABLE KEYS */;

-- 导出  表 gas.sys_dict_type 结构
CREATE TABLE IF NOT EXISTS "sys_dict_type" (
	"dict_id" SERIAL NOT NULL,
	"dict_name" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"dict_type" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"status" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("dict_id")
);

-- 正在导出表  gas.sys_dict_type 的数据：15 rows
DELETE FROM "sys_dict_type";
/*!40000 ALTER TABLE "sys_dict_type" DISABLE KEYS */;
INSERT INTO "sys_dict_type" ("dict_id", "dict_name", "dict_type", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '任务状态列表'),
	(5, '任务分组', 'sys_job_group', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '任务分组列表'),
	(6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '系统是否列表'),
	(7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '通知类型列表'),
	(8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '通知状态列表'),
	(9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '操作类型列表'),
	(10, '系统状态', 'sys_common_status', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '登录状态列表'),
	(100, '表达式类型', 'exp_data_type', '0', 'admin', '2024-03-12 09:03:02', NULL, NULL, NULL),
	(102, '监听类型', 'sys_listener_type', '0', 'admin', '2022-12-18 22:03:07', NULL, NULL, NULL),
	(103, '监听值类型', 'sys_listener_value_type', '0', 'admin', '2022-12-18 22:03:39', NULL, NULL, NULL),
	(104, '监听属性', 'sys_listener_event_type', '0', 'admin', '2022-12-18 22:04:29', NULL, NULL, NULL),
	(105, '流程分类', 'sys_process_category', '0', 'admin', '2024-03-12 09:08:18', NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_dict_type" ENABLE KEYS */;

-- 导出  表 gas.sys_form 结构
CREATE TABLE IF NOT EXISTS "sys_form" (
	"form_id" SERIAL NOT NULL,
	"form_name" VARCHAR(50) NULL DEFAULT NULL,
	"form_content" TEXT NULL DEFAULT NULL,
	"form_router" VARCHAR(255) NULL DEFAULT NULL,
	"form_submit" VARCHAR(255) NULL DEFAULT NULL,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"create_by" BIGINT NULL DEFAULT NULL,
	"update_by" BIGINT NULL DEFAULT NULL,
	"remark" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("form_id")
);

-- 正在导出表  gas.sys_form 的数据：2 rows
DELETE FROM "sys_form";
/*!40000 ALTER TABLE "sys_form" DISABLE KEYS */;
INSERT INTO "sys_form" ("form_id", "form_name", "form_content", "form_router", "form_submit", "create_time", "update_time", "create_by", "update_by", "remark") VALUES
	(3938, '请假', '{"widgetList":[{"key":76449,"type":"input","icon":"text-field","formItemFlag":true,"options":{"name":"啊啊","label":"请假人","labelAlign":"label-left-align","type":"text","defaultValue":"","placeholder":"","columnWidth":"200px","size":"","labelWidth":null,"labelHidden":false,"readonly":false,"disabled":false,"hidden":false,"clearable":true,"showPassword":false,"required":true,"requiredHint":"","validation":"","validationHint":"","customClass":"","labelIconClass":null,"labelIconPosition":"rear","labelTooltip":null,"minLength":null,"maxLength":null,"showWordLimit":false,"prefixIcon":"","suffixIcon":"","appendButton":false,"appendButtonDisabled":false,"buttonIcon":"custom-search","onCreated":"","onMounted":"","onInput":"","onChange":"","onFocus":"","onBlur":"","onValidate":"","onAppendButtonClick":""},"id":"input54555"},{"key":16515,"type":"input","icon":"text-field","formItemFlag":true,"options":{"name":"input46537","label":"请假理由","labelAlign":"","type":"text","defaultValue":"","placeholder":"","columnWidth":"200px","size":"","labelWidth":null,"labelHidden":false,"readonly":false,"disabled":false,"hidden":false,"clearable":true,"showPassword":false,"required":false,"requiredHint":"","validation":"","validationHint":"","customClass":[],"labelIconClass":null,"labelIconPosition":"rear","labelTooltip":null,"minLength":null,"maxLength":null,"showWordLimit":false,"prefixIcon":"","suffixIcon":"","appendButton":false,"appendButtonDisabled":false,"buttonIcon":"custom-search","onCreated":"","onMounted":"","onInput":"","onChange":"","onFocus":"","onBlur":"","onValidate":"","onAppendButtonClick":""},"id":"input46537"},{"key":64684,"type":"date-range","icon":"date-range-field","formItemFlag":true,"options":{"name":"daterange83468","label":"请假范围","labelAlign":"","type":"daterange","defaultValue":null,"startPlaceholder":"","endPlaceholder":"","columnWidth":"200px","size":"","autoFullWidth":true,"labelWidth":null,"labelHidden":false,"readonly":false,"disabled":false,"hidden":false,"clearable":true,"editable":false,"format":"YYYY-MM-DD","valueFormat":"YYYY-MM-DD","required":false,"requiredHint":"","validation":"","validationHint":"","customClass":"","labelIconClass":null,"labelIconPosition":"rear","labelTooltip":null,"onCreated":"","onMounted":"","onChange":"","onFocus":"","onBlur":"","onValidate":""},"id":"daterange83468"}],"formConfig":{"modelName":"formData","refName":"vForm","rulesName":"rules","labelWidth":80,"labelPosition":"left","size":"","labelAlign":"label-left-align","cssCode":"","customClass":"","functions":"","layoutType":"PC","jsonVersion":3,"onFormCreated":"","onFormMounted":"","onFormDataChange":"","onFormValidate":""}}', NULL, NULL, '2025-08-18 15:25:40', NULL, NULL, NULL, '1'),
	(3939, '请假外部页面', NULL, '/qingjia', 'qingjiaServiceImpl.insert(Qingjia qingjia)', '2025-08-18 15:40:10', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_form" ENABLE KEYS */;

-- 导出  表 gas.sys_job 结构
CREATE TABLE IF NOT EXISTS "sys_job" (
	"job_id" SERIAL NOT NULL,
	"job_name" VARCHAR(64) NOT NULL,
	"job_group" VARCHAR(64) NOT NULL,
	"invoke_target" VARCHAR(500) NOT NULL,
	"cron_expression" VARCHAR(255) NULL DEFAULT NULL,
	"misfire_policy" CHAR(1) NULL DEFAULT '3',
	"concurrent" CHAR(1) NULL DEFAULT '1',
	"status" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("job_id")
);

-- 正在导出表  gas.sys_job 的数据：3 rows
DELETE FROM "sys_job";
/*!40000 ALTER TABLE "sys_job" DISABLE KEYS */;
INSERT INTO "sys_job" ("job_id", "job_name", "job_group", "invoke_target", "cron_expression", "misfire_policy", "concurrent", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(''ry'')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_job" ENABLE KEYS */;

-- 导出  表 gas.sys_job_log 结构
CREATE TABLE IF NOT EXISTS "sys_job_log" (
	"job_log_id" SERIAL NOT NULL,
	"job_name" VARCHAR(64) NOT NULL,
	"job_group" VARCHAR(64) NOT NULL,
	"invoke_target" VARCHAR(500) NOT NULL,
	"job_message" VARCHAR(500) NULL DEFAULT NULL,
	"status" CHAR(1) NULL DEFAULT '0',
	"exception_info" TEXT NULL DEFAULT NULL,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("job_log_id")
);

-- 正在导出表  gas.sys_job_log 的数据：0 rows
DELETE FROM "sys_job_log";
/*!40000 ALTER TABLE "sys_job_log" DISABLE KEYS */;
/*!40000 ALTER TABLE "sys_job_log" ENABLE KEYS */;

-- 导出  表 gas.sys_logininfor 结构
CREATE TABLE IF NOT EXISTS "sys_logininfor" (
	"info_id" SERIAL NOT NULL,
	"user_name" VARCHAR(50) NULL DEFAULT NULL,
	"ipaddr" VARCHAR(128) NULL DEFAULT NULL,
	"login_location" VARCHAR(255) NULL DEFAULT NULL,
	"browser" VARCHAR(50) NULL DEFAULT NULL,
	"os" VARCHAR(50) NULL DEFAULT NULL,
	"status" CHAR(1) NULL DEFAULT NULL,
	"msg" VARCHAR(255) NULL DEFAULT NULL,
	"login_time" TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY ("info_id")
);

DELETE FROM "sys_logininfor";

-- 导出  表 gas.sys_menu 结构
CREATE TABLE IF NOT EXISTS "sys_menu" (
	"menu_id" SERIAL NOT NULL,
	"menu_name" VARCHAR(50) NOT NULL,
	"parent_id" BIGINT NULL DEFAULT 0,
	"order_num" INTEGER NULL DEFAULT 0,
	"path" VARCHAR(200) NULL DEFAULT NULL::character varying,
	"component" VARCHAR(255) NULL DEFAULT NULL,
	"query" VARCHAR(255) NULL DEFAULT NULL::character varying,
	"is_frame" CHAR(1) NULL DEFAULT '1',
	"is_cache" CHAR(1) NULL DEFAULT '0',
	"menu_type" CHAR(1) NULL DEFAULT NULL::bpchar,
	"visible" CHAR(1) NULL DEFAULT '0',
	"status" CHAR(1) NULL DEFAULT '0',
	"perms" VARCHAR(100) NULL DEFAULT NULL,
	"icon" VARCHAR(100) NULL DEFAULT '#',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	"route_name" VARCHAR(255) NULL DEFAULT '''''',
	PRIMARY KEY ("menu_id")
);

-- 正在导出表  gas.sys_menu 的数据：143 rows
DELETE FROM "sys_menu";
/*!40000 ALTER TABLE "sys_menu" DISABLE KEYS */;
INSERT INTO "sys_menu" ("menu_id", "menu_name", "parent_id", "order_num", "path", "component", "query", "is_frame", "is_cache", "menu_type", "visible", "status", "perms", "icon", "create_by", "create_time", "update_by", "update_time", "remark", "route_name") VALUES
	(1, '系统管理', 0, 9, 'system', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'system', 'admin', '2025-08-12 17:06:45', 'admin', '2025-12-15 13:34:10', '系统管理目录', NULL),
	(2, '系统监控', 0, 8, 'monitor', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'monitor', 'admin', '2025-08-12 17:06:45', 'admin', '2025-12-15 13:33:51', '系统监控目录', NULL),
	(3, '系统工具', 0, 10, 'tool', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'tool', 'admin', '2025-08-12 17:06:45', 'admin', '2025-12-15 13:35:45', '系统工具目录', NULL),
	(100, '用户管理', 1, 1, 'user', 'system/user/index', NULL, '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-08-12 17:06:45', NULL, NULL, '用户管理菜单', NULL),
	(101, '角色管理', 1, 2, 'role', 'system/role/index', NULL, '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-08-12 17:06:45', NULL, NULL, '角色管理菜单', NULL),
	(102, '菜单管理', 1, 3, 'menu', 'system/menu/index', NULL, '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-08-12 17:06:45', NULL, NULL, '菜单管理菜单', NULL),
	(103, '部门管理', 1, 4, 'dept', 'system/dept/index', NULL, '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-08-12 17:06:45', NULL, NULL, '部门管理菜单', NULL),
	(104, '岗位管理', 1, 5, 'post', 'system/post/index', NULL, '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-08-12 17:06:45', NULL, NULL, '岗位管理菜单', NULL),
	(105, '字典管理', 1, 6, 'dict', 'system/dict/index', NULL, '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-08-12 17:06:45', NULL, NULL, '字典管理菜单', NULL),
	(106, '参数设置', 1, 7, 'config', 'system/config/index', NULL, '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-08-12 17:06:45', NULL, NULL, '参数设置菜单', NULL),
	(107, '通知公告', 1, 8, 'notice', 'system/notice/index', NULL, '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-08-12 17:06:45', NULL, NULL, '通知公告菜单', NULL),
	(108, '日志管理', 1, 9, 'log', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'log', 'admin', '2025-08-12 17:06:45', NULL, NULL, '日志管理菜单', NULL),
	(109, '在线用户', 2, 1, 'online', 'monitor/online/index', NULL, '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-08-12 17:06:45', NULL, NULL, '在线用户菜单', NULL),
	(110, '定时任务', 2, 2, 'job', 'monitor/job/index', NULL, '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-08-12 17:06:45', NULL, NULL, '定时任务菜单', NULL),
	(111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', NULL, '1', '0', 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:12:30', '数据监控菜单', NULL),
	(112, '服务监控', 2, 4, 'server', 'monitor/server/index', NULL, '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-08-12 17:06:45', NULL, NULL, '服务监控菜单', NULL),
	(113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', NULL, '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-08-12 17:06:45', NULL, NULL, '缓存监控菜单', NULL),
	(114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', NULL, '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-08-12 17:06:45', NULL, NULL, '缓存列表菜单', NULL),
	(115, '表单构建', 3, 1, 'build', 'tool/build/index', NULL, '1', '0', 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:11:56', '表单构建菜单', NULL),
	(116, '代码生成', 3, 2, 'gen', 'tool/gen/index', NULL, '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-08-12 17:06:45', NULL, NULL, '代码生成菜单', NULL),
	(117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', NULL, '1', '0', 'C', '1', '1', 'tool:swagger:list', 'swagger', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:12:01', '系统接口菜单', NULL),
	(500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', NULL, '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-08-12 17:06:45', NULL, NULL, '操作日志菜单', NULL),
	(501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', NULL, '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-08-12 17:06:45', NULL, NULL, '登录日志菜单', NULL),
	(1000, '用户查询', 100, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1001, '用户新增', 100, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1002, '用户修改', 100, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1003, '用户删除', 100, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1004, '用户导出', 100, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1005, '用户导入', 100, 6, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1006, '重置密码', 100, 7, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1007, '角色查询', 101, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1008, '角色新增', 101, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1009, '角色修改', 101, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1010, '角色删除', 101, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1011, '角色导出', 101, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1012, '菜单查询', 102, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1013, '菜单新增', 102, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1014, '菜单修改', 102, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1015, '菜单删除', 102, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1016, '部门查询', 103, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1017, '部门新增', 103, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1018, '部门修改', 103, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1019, '部门删除', 103, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1020, '岗位查询', 104, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1021, '岗位新增', 104, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1022, '岗位修改', 104, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1023, '岗位删除', 104, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1024, '岗位导出', 104, 5, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1025, '字典查询', 105, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1026, '字典新增', 105, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1027, '字典修改', 105, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1028, '字典删除', 105, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1029, '字典导出', 105, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1030, '参数查询', 106, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1031, '参数新增', 106, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1032, '参数修改', 106, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1033, '参数删除', 106, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1034, '参数导出', 106, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1035, '公告查询', 107, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1036, '公告新增', 107, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1037, '公告修改', 107, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1038, '公告删除', 107, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1039, '操作查询', 500, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1040, '操作删除', 500, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1041, '日志导出', 500, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1042, '登录查询', 501, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1043, '登录删除', 501, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1044, '日志导出', 501, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1045, '账户解锁', 501, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1046, '在线查询', 109, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1047, '批量强退', 109, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1048, '单条强退', 109, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1049, '任务查询', 110, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1050, '任务新增', 110, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1051, '任务修改', 110, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1052, '任务删除', 110, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1053, '状态修改', 110, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1054, '任务导出', 110, 6, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1055, '生成查询', 116, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1056, '生成修改', 116, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1057, '生成删除', 116, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1058, '导入代码', 116, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1059, '预览代码', 116, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(1060, '生成代码', 116, 6, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL, NULL),
	(2020, '流程管理', 0, 11, 'flowable', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'cascader', 'tony', '2021-03-25 11:35:09', 'admin', '2025-12-15 14:44:47', NULL, NULL),
	(2022, '流程定义', 2020, 2, 'definition', 'flowable/definition/index', NULL, '1', '0', 'C', '0', '0', NULL, 'job', 'tony', '2021-03-25 13:53:55', 'admin', '2022-12-29 17:40:39', NULL, NULL),
	(2023, '任务管理', 0, 7, 'task', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'dict', 'tony', '2021-03-26 10:53:10', 'admin', '2021-03-29 09:37:40', NULL, NULL),
	(2024, '待办任务', 2023, 2, 'todo', 'flowable/task/todo/index', NULL, '1', '1', 'C', '0', '0', NULL, 'cascader', 'admin', '2021-03-26 10:55:52', 'admin', '2021-03-30 09:26:36', NULL, NULL),
	(2025, '已办任务', 2023, 3, 'finished', 'flowable/task/finished/index', NULL, '1', '1', 'C', '0', '0', NULL, 'time-range', 'admin', '2021-03-26 10:57:54', 'admin', '2021-03-30 09:26:50', NULL, NULL),
	(2026, '已发任务', 2023, 1, 'process', 'flowable/task/myProcess/index', NULL, '1', '1', 'C', '0', '0', NULL, 'guide', 'admin', '2021-03-30 09:26:23', 'admin', '2022-12-12 09:58:07', NULL, NULL),
	(2027, '表单配置', 2020, 2, 'form', 'flowable/task/form/index', NULL, '1', '1', 'C', '0', '0', 'flowable:form:list', 'form', 'admin', '2021-03-30 22:55:12', 'admin', '2023-08-19 15:54:57', NULL, NULL),
	(2028, '新增', 2027, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:add', '#', 'admin', '2021-07-07 14:23:37', 'admin', '2023-08-16 09:17:38', NULL, NULL),
	(2029, '删除', 2027, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:remove', '#', 'admin', '2021-07-07 14:24:10', NULL, NULL, NULL, NULL),
	(2030, '编辑', 2027, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:edit', '#', 'admin', '2021-07-07 14:24:31', NULL, NULL, NULL, NULL),
	(2031, '新增', 2026, 1, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:deployment:add', '#', 'admin', '2021-07-07 14:25:22', NULL, NULL, NULL, NULL),
	(2032, '编辑', 2026, 2, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:deployment:edit', '#', 'admin', '2021-07-07 14:25:47', NULL, NULL, NULL, NULL),
	(2033, '删除', 2026, 3, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:deployment:remove', '#', 'admin', '2021-07-07 14:26:02', NULL, NULL, NULL, NULL),
	(2034, '查询', 2027, 4, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:query', '#', 'admin', '2021-07-08 14:05:22', NULL, NULL, NULL, NULL),
	(2035, '修改密码', 100, 8, NULL, NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:updatePwd', '#', 'admin', '2022-04-29 11:27:13', NULL, NULL, NULL, NULL),
	(2036, '流程表达式', 2020, 3, 'expression', 'flowable/expression/index', NULL, '1', '1', 'C', '0', '0', 'system:expression:list', 'list', 'admin', '2022-12-12 17:12:19', 'admin', '2022-12-12 17:13:44', '流程达式菜单', NULL),
	(2037, '流程达式查询', 2036, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:expression:query', '#', 'admin', '2022-12-12 17:12:19', NULL, NULL, NULL, NULL),
	(2038, '流程达式新增', 2036, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:expression:add', '#', 'admin', '2022-12-12 17:12:19', NULL, NULL, NULL, NULL),
	(2039, '流程达式修改', 2036, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:expression:edit', '#', 'admin', '2022-12-12 17:12:19', NULL, NULL, NULL, NULL),
	(2040, '流程达式删除', 2036, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:expression:remove', '#', 'admin', '2022-12-12 17:12:19', NULL, NULL, NULL, NULL),
	(2041, '流程达式导出', 2036, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:expression:export', '#', 'admin', '2022-12-12 17:12:19', NULL, NULL, NULL, NULL),
	(2042, '流程监听', 2020, 4, 'listener', 'flowable/listener/index', NULL, '1', '0', 'C', '0', '0', 'system:listener:list', 'monitor', 'admin', '2022-12-25 11:44:16', 'admin', '2022-12-29 08:59:21', '流程监听菜单', NULL),
	(2043, '流程监听查询', 2042, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:listener:query', '#', 'admin', '2022-12-25 11:44:16', NULL, NULL, NULL, NULL),
	(2044, '流程监听新增', 2042, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:listener:add', '#', 'admin', '2022-12-25 11:44:16', NULL, NULL, NULL, NULL),
	(2045, '流程监听修改', 2042, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:listener:edit', '#', 'admin', '2022-12-25 11:44:16', NULL, NULL, NULL, NULL),
	(2046, '流程监听删除', 2042, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:listener:remove', '#', 'admin', '2022-12-25 11:44:16', NULL, NULL, NULL, NULL),
	(2047, '流程监听导出', 2042, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:listener:export', '#', 'admin', '2022-12-25 11:44:16', NULL, NULL, NULL, NULL),
	(2048, 'qingjia', 2023, 1, 'qingjia', 'system/qingjia/index', NULL, '1', '0', 'C', '1', '0', 'system:qingjia:list', '#', 'admin', '2025-08-26 11:57:45', 'admin', '2025-12-17 16:38:20', 'qingjia菜单', NULL),
	(2049, 'qingjia查询', 2048, 1, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:qingjia:query', '#', 'admin', '2025-08-26 11:57:45', NULL, NULL, NULL, NULL),
	(2050, 'qingjia新增', 2048, 2, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:qingjia:add', '#', 'admin', '2025-08-26 11:57:45', NULL, NULL, NULL, NULL),
	(2051, 'qingjia修改', 2048, 3, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:qingjia:edit', '#', 'admin', '2025-08-26 11:57:45', NULL, NULL, NULL, NULL),
	(2052, 'qingjia删除', 2048, 4, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:qingjia:remove', '#', 'admin', '2025-08-26 11:57:45', NULL, NULL, NULL, NULL),
	(2053, 'qingjia导出', 2048, 5, '#', NULL, NULL, '1', '0', 'F', '0', '0', 'system:qingjia:export', '#', 'admin', '2025-08-26 11:57:45', NULL, NULL, NULL, NULL),
	(2054, '基础信息', 0, 1, 'basic', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'dict', 'admin', '2025-12-15 13:33:31', 'admin', '2025-12-15 13:34:19', NULL, NULL),
	(2055, '立项管理', 0, 2, 'project', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'edit', 'admin', '2025-12-15 13:35:13', NULL, NULL, NULL, NULL),
	(2056, '施工过程', 0, 4, 'construction', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'peoples', 'admin', '2025-12-15 13:37:22', 'admin', '2025-12-15 14:30:03', NULL, NULL),
	(2057, '安装告知', 0, 3, 'installation', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'guide', 'admin', '2025-12-15 13:41:17', 'admin', '2025-12-15 14:28:02', NULL, NULL),
	(2058, '监检', 0, 5, 'supervision', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'component', 'admin', '2025-12-15 13:42:33', 'admin', '2025-12-15 14:47:26', NULL, NULL),
	(2059, '材料信息', 2054, 1, 'material', 'sxgpra/basic/material/index', NULL, '1', '0', 'C', '0', '0', NULL, 'slider', 'admin', '2025-12-15 13:49:34', 'admin', '2025-12-15 14:23:57', NULL, NULL),
	(2060, '焊工信息', 2054, 2, 'welder', 'sxgpra/basic/welder/index', NULL, '1', '0', 'C', '0', '0', NULL, 'star', 'admin', '2025-12-15 13:54:58', 'admin', '2025-12-15 14:24:06', NULL, NULL),
	(2061, '质量编码', 2054, 3, 'qualitycode', 'sxgpra/basic/qualitycode/index', NULL, '1', '0', 'C', '0', '0', NULL, 'tab', 'admin', '2025-12-15 13:57:25', 'admin', '2025-12-15 14:24:15', NULL, NULL),
	(2062, '设备信息', 2054, 4, 'weldmachine', 'sxgpra/basic/weldmachine/index', NULL, '1', '0', 'C', '0', '0', NULL, 'size', 'admin', '2025-12-15 13:58:31', 'admin', '2025-12-15 14:24:26', NULL, NULL),
	(2063, '监检区域分配', 2054, 5, 'sxgpra/areaManage', 'sxgpra/areaManage/index', NULL, '1', '1', 'C', '0', '0', NULL, 'cascader', 'admin', '2025-12-15 13:59:46', 'admin', '2025-12-30 16:09:12', NULL, NULL),
	(2064, '项目信息录入', 2055, 1, 'project', 'sxgpra/project/project/index', NULL, '1', '0', 'C', '0', '0', NULL, 'edit', 'admin', '2025-12-15 14:21:46', 'admin', '2025-12-15 14:24:49', NULL, NULL),
	(2065, '项目分配管理员和责任人', 2055, 2, 'projectmanager', 'sxgpra/project/projectmanager/index', NULL, '1', '0', 'C', '0', '0', NULL, 'user', 'admin', '2025-12-15 14:23:48', 'admin', '2025-12-15 14:24:59', NULL, NULL),
	(2066, '安装告知流程', 2057, 1, 'installation', 'sxgpra/installation/installation/index', NULL, '1', '0', 'C', '0', '0', NULL, 'job', 'admin', '2025-12-15 14:29:30', NULL, NULL, NULL, NULL),
	(2067, '人员校验', 2056, 1, 'personnel', 'sxgpra/construction/personnel/index', NULL, '1', '0', 'C', '0', '0', NULL, 'user', 'admin', '2025-12-15 14:31:58', NULL, NULL, NULL, NULL),
	(2068, '管材校验', 2056, 2, 'pipe', 'sxgpra/construction/pipe/index', NULL, '1', '0', 'C', '0', '0', NULL, 'component', 'admin', '2025-12-15 14:33:25', 'admin', '2025-12-15 14:33:57', NULL, NULL),
	(2069, '设备校验', 2056, 3, 'equipment', 'sxgpra/construction/equipment/index', NULL, '1', '0', 'C', '0', '0', NULL, 'nested', 'admin', '2025-12-15 14:35:22', NULL, NULL, NULL, NULL),
	(2070, '焊接工艺校验', 2056, 4, 'welding', 'sxgpra/construction/pipe/index', NULL, '1', '0', 'C', '0', '0', NULL, 'online', 'admin', '2025-12-15 14:36:20', NULL, NULL, NULL, NULL),
	(2071, '定位校验', 2056, 5, 'location', 'sxgpra/construction/location/index', NULL, '1', '0', 'C', '0', '0', NULL, 'exit-fullscreen', 'admin', '2025-12-15 14:38:02', NULL, NULL, NULL, NULL),
	(2072, '管道埋深', 2056, 6, 'pipeline', 'sxgpra/construction/pipeline/index', NULL, '1', '0', 'C', '0', '0', NULL, 'example', 'admin', '2025-12-15 14:38:59', NULL, NULL, NULL, NULL),
	(2073, '无损检测', 2056, 7, 'nondestructive', 'sxgpra/construction/pipe/index', NULL, '1', '0', 'C', '0', '0', NULL, 'eye-open', 'admin', '2025-12-15 14:40:12', NULL, NULL, NULL, NULL),
	(2074, '防腐试验', 2056, 8, 'corrosion', 'sxgpra/construction/corrosion/index', NULL, '1', '0', 'C', '0', '0', NULL, 'icon', 'admin', '2025-12-15 14:41:10', NULL, NULL, NULL, NULL),
	(2075, '耐压试验', 2056, 9, 'pressure', 'sxgpra/construction/pressure/index', NULL, '1', '0', 'C', '0', '0', NULL, 'logininfor', 'admin', '2025-12-15 14:42:29', NULL, NULL, NULL, NULL),
	(2076, '监检（流程）', 2058, 1, 'supervision', 'sxgpra/supervision/supervision/index', NULL, '1', '0', 'C', '0', '0', NULL, 'job', 'admin', '2025-12-15 14:44:16', NULL, NULL, NULL, NULL),
	(2077, '综合', 0, 6, 'unitmap', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'clipboard', 'admin', '2025-12-15 14:45:21', NULL, NULL, NULL, NULL),
	(2078, '综合展示', 2077, 1, 'unitmap', 'sxgpra/unitmap/unitmap/index', NULL, '1', '0', 'C', '0', '0', NULL, 'list', 'admin', '2025-12-15 14:46:36', NULL, NULL, NULL, NULL),
	(2079, '商品', 2054, 6, 'sxgpra/goods', 'sxgpra/goods/index', NULL, '1', '1', 'C', '0', '0', NULL, 'shopping', 'admin', '2025-12-30 15:42:36', 'admin', '2025-12-30 16:00:17', NULL, NULL);
/*!40000 ALTER TABLE "sys_menu" ENABLE KEYS */;

-- 导出  表 gas.sys_notice 结构
CREATE TABLE IF NOT EXISTS "sys_notice" (
	"notice_id" SERIAL NOT NULL,
	"notice_title" VARCHAR(50) NOT NULL,
	"notice_type" CHAR(1) NOT NULL,
	"notice_content" TEXT NULL DEFAULT NULL,
	"status" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY ("notice_id")
);

-- 正在导出表  gas.sys_notice 的数据：0 rows
DELETE FROM "sys_notice";
/*!40000 ALTER TABLE "sys_notice" DISABLE KEYS */;
/*!40000 ALTER TABLE "sys_notice" ENABLE KEYS */;

-- 导出  表 gas.sys_oper_log 结构
CREATE TABLE IF NOT EXISTS "sys_oper_log" (
	"oper_id" SERIAL NOT NULL,
	"title" VARCHAR(50) NULL DEFAULT NULL::character varying,
	"business_type" INTEGER NULL DEFAULT 0,
	"method" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"request_method" VARCHAR(10) NULL DEFAULT NULL::character varying,
	"operator_type" INTEGER NULL DEFAULT 0,
	"oper_name" VARCHAR(50) NULL DEFAULT NULL::character varying,
	"dept_name" VARCHAR(50) NULL DEFAULT NULL::character varying,
	"oper_url" VARCHAR(255) NULL DEFAULT NULL::character varying,
	"oper_ip" VARCHAR(128) NULL DEFAULT NULL::character varying,
	"oper_location" VARCHAR(255) NULL DEFAULT NULL::character varying,
	"oper_param" VARCHAR(2000) NULL DEFAULT NULL::character varying,
	"json_result" VARCHAR(2000) NULL DEFAULT NULL::character varying,
	"status" INTEGER NULL DEFAULT 0,
	"error_msg" VARCHAR(2000) NULL DEFAULT NULL::character varying,
	"oper_time" TIMESTAMP NULL DEFAULT NULL,
	"cost_time" BIGINT NULL DEFAULT 0,
	PRIMARY KEY ("oper_id")
);

-- 正在导出表  gas.sys_oper_log 的数据：0 rows
DELETE FROM "sys_oper_log";
/*!40000 ALTER TABLE "sys_oper_log" DISABLE KEYS */;
/*!40000 ALTER TABLE "sys_oper_log" ENABLE KEYS */;

-- 导出  表 gas.sys_post 结构
CREATE TABLE IF NOT EXISTS "sys_post" (
	"post_id" SERIAL NOT NULL,
	"post_code" VARCHAR(64) NOT NULL,
	"post_name" VARCHAR(50) NOT NULL,
	"post_sort" INTEGER NOT NULL,
	"status" CHAR(1) NOT NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("post_id")
);

-- 正在导出表  gas.sys_post 的数据：5 rows
DELETE FROM "sys_post";
/*!40000 ALTER TABLE "sys_post" DISABLE KEYS */;
INSERT INTO "sys_post" ("post_id", "post_code", "post_name", "post_sort", "status", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, 'ceo', '董事长', 1, '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(2, 'se', '项目经理', 2, '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(3, 'hr', '人力资源', 3, '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(4, 'user', '普通员工', 4, '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, NULL),
	(5, 'manager', '部门管理员', 5, '0', 'admin', '2025-12-16 15:35:17', NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_post" ENABLE KEYS */;

-- 导出  表 gas.sys_role 结构
CREATE TABLE IF NOT EXISTS "sys_role" (
	"role_id" SERIAL NOT NULL,
	"role_name" VARCHAR(30) NOT NULL,
	"role_key" VARCHAR(100) NOT NULL,
	"role_sort" INTEGER NOT NULL,
	"data_scope" CHAR(1) NULL DEFAULT '1',
	"menu_check_strictly" CHAR(1) NULL DEFAULT '1',
	"dept_check_strictly" CHAR(1) NULL DEFAULT '1',
	"status" CHAR(1) NOT NULL DEFAULT '0',
	"del_flag" CHAR(1) NULL DEFAULT '0',
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("role_id")
);

-- 正在导出表  gas.sys_role 的数据：4 rows
DELETE FROM "sys_role";
/*!40000 ALTER TABLE "sys_role" DISABLE KEYS */;
INSERT INTO "sys_role" ("role_id", "role_name", "role_key", "role_sort", "data_scope", "menu_check_strictly", "dept_check_strictly", "status", "del_flag", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, '超级管理员', 'admin', 1, '1', '1', '1', '0', '0', 'admin', '2025-08-12 17:06:45', NULL, NULL, '超级管理员'),
	(2, '普通角色', 'common', 2, '2', '1', '1', '0', '0', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:11:46', '普通角色'),
	(3, '领导组', 'lead', 0, '1', '1', '1', '0', '0', 'admin', '2025-08-14 07:57:59', NULL, NULL, NULL),
	(4, '设备管理员', 'pipemanager', 3, '1', '1', '1', '0', '0', 'admin', '2025-12-16 15:36:45', NULL, NULL, NULL);
/*!40000 ALTER TABLE "sys_role" ENABLE KEYS */;

-- 导出  表 gas.sys_role_dept 结构
CREATE TABLE IF NOT EXISTS "sys_role_dept" (
	"role_id" BIGINT NOT NULL,
	"dept_id" BIGINT NOT NULL,
	PRIMARY KEY ("role_id", "dept_id")
);

-- 正在导出表  gas.sys_role_dept 的数据：3 rows
DELETE FROM "sys_role_dept";
/*!40000 ALTER TABLE "sys_role_dept" DISABLE KEYS */;
INSERT INTO "sys_role_dept" ("role_id", "dept_id") VALUES
	(2, 100),
	(2, 101),
	(2, 105);
/*!40000 ALTER TABLE "sys_role_dept" ENABLE KEYS */;

-- 导出  表 gas.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS "sys_role_menu" (
	"role_id" BIGINT NOT NULL,
	"menu_id" BIGINT NOT NULL,
	PRIMARY KEY ("role_id", "menu_id")
);

-- 正在导出表  gas.sys_role_menu 的数据：220 rows
DELETE FROM "sys_role_menu";
/*!40000 ALTER TABLE "sys_role_menu" DISABLE KEYS */;
INSERT INTO "sys_role_menu" ("role_id", "menu_id") VALUES
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 108),
	(2, 109),
	(2, 110),
	(2, 111),
	(2, 112),
	(2, 113),
	(2, 114),
	(2, 115),
	(2, 116),
	(2, 117),
	(2, 500),
	(2, 501),
	(2, 1000),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1025),
	(2, 1026),
	(2, 1027),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1032),
	(2, 1033),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1039),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1043),
	(2, 1044),
	(2, 1045),
	(2, 1046),
	(2, 1047),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1055),
	(2, 1056),
	(2, 1057),
	(2, 1058),
	(2, 1059),
	(2, 1060),
	(2, 2020),
	(2, 2022),
	(2, 2023),
	(2, 2024),
	(2, 2025),
	(2, 2026),
	(2, 2027),
	(2, 2028),
	(2, 2029),
	(2, 2030),
	(2, 2031),
	(2, 2032),
	(2, 2033),
	(2, 2034),
	(2, 2036),
	(2, 2037),
	(2, 2038),
	(2, 2039),
	(2, 2040),
	(2, 2041),
	(2, 2042),
	(2, 2043),
	(2, 2044),
	(2, 2045),
	(2, 2046),
	(2, 2047),
	(3, 2020),
	(3, 2022),
	(3, 2023),
	(3, 2024),
	(3, 2025),
	(3, 2026),
	(3, 2027),
	(3, 2028),
	(3, 2029),
	(3, 2030),
	(3, 2031),
	(3, 2032),
	(3, 2033),
	(3, 2034),
	(3, 2036),
	(3, 2037),
	(3, 2038),
	(3, 2039),
	(3, 2040),
	(3, 2041),
	(3, 2042),
	(3, 2043),
	(3, 2044),
	(3, 2045),
	(3, 2046),
	(3, 2047),
	(4, 1),
	(4, 100),
	(4, 101),
	(4, 102),
	(4, 103),
	(4, 104),
	(4, 105),
	(4, 106),
	(4, 107),
	(4, 108),
	(4, 500),
	(4, 501),
	(4, 1000),
	(4, 1001),
	(4, 1002),
	(4, 1003),
	(4, 1004),
	(4, 1005),
	(4, 1006),
	(4, 1007),
	(4, 1008),
	(4, 1009),
	(4, 1010),
	(4, 1011),
	(4, 1012),
	(4, 1013),
	(4, 1014),
	(4, 1015),
	(4, 1016),
	(4, 1017),
	(4, 1018),
	(4, 1019),
	(4, 1020),
	(4, 1021),
	(4, 1022),
	(4, 1023),
	(4, 1024),
	(4, 1025),
	(4, 1026),
	(4, 1027),
	(4, 1028),
	(4, 1029),
	(4, 1030),
	(4, 1031),
	(4, 1032),
	(4, 1033),
	(4, 1034),
	(4, 1035),
	(4, 1036),
	(4, 1037),
	(4, 1038),
	(4, 1039),
	(4, 1040),
	(4, 1041),
	(4, 1042),
	(4, 1043),
	(4, 1044),
	(4, 1045),
	(4, 2035),
	(4, 2054),
	(4, 2055),
	(4, 2056),
	(4, 2057),
	(4, 2058),
	(4, 2059),
	(4, 2060),
	(4, 2061),
	(4, 2062),
	(4, 2063),
	(4, 2064),
	(4, 2065),
	(4, 2066),
	(4, 2067),
	(4, 2068),
	(4, 2069),
	(4, 2070),
	(4, 2071),
	(4, 2072),
	(4, 2073),
	(4, 2074),
	(4, 2075),
	(4, 2076),
	(4, 2077),
	(4, 2078);
/*!40000 ALTER TABLE "sys_role_menu" ENABLE KEYS */;

-- 导出  表 gas.sys_user 结构
CREATE TABLE IF NOT EXISTS "sys_user" (
	"user_id" SERIAL NOT NULL,
	"dept_id" BIGINT NULL DEFAULT NULL,
	"user_name" VARCHAR(30) NOT NULL,
	"nick_name" VARCHAR(30) NOT NULL,
	"user_type" VARCHAR(2) NULL DEFAULT '00',
	"email" VARCHAR(50) NULL DEFAULT NULL::character varying,
	"phonenumber" VARCHAR(11) NULL DEFAULT NULL::character varying,
	"sex" CHAR(1) NULL DEFAULT '0',
	"avatar" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"password" VARCHAR(100) NULL DEFAULT NULL::character varying,
	"status" CHAR(1) NULL DEFAULT '0',
	"del_flag" CHAR(1) NULL DEFAULT '0',
	"login_ip" VARCHAR(128) NULL DEFAULT NULL::character varying,
	"login_date" TIMESTAMP NULL DEFAULT NULL,
	"create_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"create_time" TIMESTAMP NULL DEFAULT NULL,
	"update_by" VARCHAR(64) NULL DEFAULT NULL::character varying,
	"update_time" TIMESTAMP NULL DEFAULT NULL,
	"remark" VARCHAR(500) NULL DEFAULT NULL,
	PRIMARY KEY ("user_id")
);

-- 正在导出表  gas.sys_user 的数据：3 rows
DELETE FROM "sys_user";
/*!40000 ALTER TABLE "sys_user" DISABLE KEYS */;
INSERT INTO "sys_user" ("user_id", "dept_id", "user_name", "nick_name", "user_type", "email", "phonenumber", "sex", "avatar", "password", "status", "del_flag", "login_ip", "login_date", "create_by", "create_time", "update_by", "update_time", "remark") VALUES
	(1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2025/12/15/avatar_20251215154458A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-09 23:32:35.382', 'admin', '2025-08-12 17:06:45', NULL, '2026-01-09 23:32:35.387921', '管理员'),
	(2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', NULL, '$2a$10$oJUdnl7iEoEYvpn77prvfugQNMpO23N8bqzgttNpaRA0uXEDKkkna', '0', '0', '127.0.0.1', '2025-08-20 08:20:27', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-20 08:20:27', '测试员'),
	(100, 100, 'ceshi1', '测试1', '00', NULL, NULL, '0', NULL, '$2a$10$0JKnO8An2YeOMBSTEmJ/R.b.uLUQo184rx55i97tDHE.MgBZ6Bd8q', '0', '0', '127.0.0.1', '2025-08-20 08:47:11', 'admin', '2025-08-12 17:20:05', 'admin', '2025-08-20 08:47:11', NULL);
/*!40000 ALTER TABLE "sys_user" ENABLE KEYS */;

-- 导出  表 gas.sys_user_post 结构
CREATE TABLE IF NOT EXISTS "sys_user_post" (
	"user_id" BIGINT NOT NULL,
	"post_id" BIGINT NOT NULL,
	PRIMARY KEY ("user_id", "post_id")
);

-- 正在导出表  gas.sys_user_post 的数据：2 rows
DELETE FROM "sys_user_post";
/*!40000 ALTER TABLE "sys_user_post" DISABLE KEYS */;
INSERT INTO "sys_user_post" ("user_id", "post_id") VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE "sys_user_post" ENABLE KEYS */;

-- 导出  表 gas.sys_user_role 结构
CREATE TABLE IF NOT EXISTS "sys_user_role" (
	"user_id" BIGINT NOT NULL,
	"role_id" BIGINT NOT NULL,
	PRIMARY KEY ("user_id", "role_id")
);

-- 正在导出表  gas.sys_user_role 的数据：5 rows
DELETE FROM "sys_user_role";
/*!40000 ALTER TABLE "sys_user_role" DISABLE KEYS */;
INSERT INTO "sys_user_role" ("user_id", "role_id") VALUES
	(1, 1),
	(1, 4),
	(2, 2),
	(2, 3),
	(100, 2);

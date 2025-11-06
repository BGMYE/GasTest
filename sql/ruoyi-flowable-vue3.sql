/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ruoyi-flowable-vue3

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 26/08/2025 15:18:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
DROP TABLE IF EXISTS `act_app_appdef`;
CREATE TABLE `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_app_appdef_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_appdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangelog`;
CREATE TABLE `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-08-12 17:07:45', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '4.3.5', NULL, NULL, '4989665128');
INSERT INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-08-12 17:07:45', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '4.3.5', NULL, NULL, '4989665128');
INSERT INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2025-08-12 17:07:45', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '4.3.5', NULL, NULL, '4989665128');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
CREATE TABLE `act_app_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment`;
CREATE TABLE `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_app_deployment_resource`;
CREATE TABLE `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_app_deployment_resource_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_casedef`;
CREATE TABLE `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_casedef_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_casedef
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
CREATE TABLE `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:43', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:43', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:43', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:43', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 8, 'EXECUTED', '8:e8c2eb1ce28bc301efe07e0e29757781', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 9, 'EXECUTED', '8:4cb4782b9bdec5ced2a64c525aa7b3a0', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 10, 'EXECUTED', '8:341c16be247f5d17badc9809da8691f9', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 11, 'EXECUTED', '8:d7c4da9276bcfffbfb0ebfb25e3f7b05', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 12, 'EXECUTED', '8:adf4ecc45f2aa9a44a5626b02e1d6f98', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 13, 'EXECUTED', '8:7550626f964ab5518464709408333ec1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('14', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:44', 14, 'EXECUTED', '8:086b40b3a05596dcc8a8d7479922d494', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('16', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:45', 15, 'EXECUTED', '8:a697a222ddd99dd15b36516a252f1c63', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');
INSERT INTO `act_cmmn_databasechangelog` VALUES ('17', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2025-08-12 17:07:45', 16, 'EXECUTED', '8:d3706c5813a9b97fd2a59d12a9523946', 'createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST', '', NULL, '4.3.5', NULL, NULL, '4989662446');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
CREATE TABLE `act_cmmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment`;
CREATE TABLE `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
CREATE TABLE `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_deployment_resource_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
CREATE TABLE `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_CASE_INST_END`(`END_TIME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
CREATE TABLE `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
CREATE TABLE `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
CREATE TABLE `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_REF_ID_`(`REFERENCE_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_case_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
CREATE TABLE `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_mil_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_cmmn_ru_mil_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
CREATE TABLE `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_plan_item_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_cmmn_ru_plan_item_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
CREATE TABLE `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_3` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_sentry_part_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
DROP TABLE IF EXISTS `act_co_content_item`;
CREATE TABLE `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_`) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_`) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_content_item
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangelog`;
CREATE TABLE `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2025-08-12 17:07:42', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '4.3.5', NULL, NULL, '4989662223');
INSERT INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2025-08-12 17:07:42', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '4.3.5', NULL, NULL, '4989662223');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
CREATE TABLE `act_co_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 7, 'EXECUTED', '8:215a499ff7ae77685b55355245b8b708', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 8, 'EXECUTED', '8:5355bee389318afed91a11702f2df032', 'addColumn tableName=ACT_DMN_DECISION', '', NULL, '4.3.5', NULL, NULL, '4989661423');
INSERT INTO `act_dmn_databasechangelog` VALUES ('9', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2025-08-12 17:07:41', 9, 'EXECUTED', '8:0fe82086431b1953d293f0199f805876', 'createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '4.3.5', NULL, NULL, '4989661423');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision`;
CREATE TABLE `act_dmn_decision`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DMN_DEC_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_decision
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
CREATE TABLE `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DMN_INSTANCE_ID`(`INSTANCE_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_hi_decision_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:41', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.3.5', NULL, NULL, '4989661859');
INSERT INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:41', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.3.5', NULL, NULL, '4989661859');
INSERT INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:41', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '4.3.5', NULL, NULL, '4989661859');
INSERT INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:42', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.3.5', NULL, NULL, '4989661859');
INSERT INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:42', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '4.3.5', NULL, NULL, '4989661859');
INSERT INTO `act_fo_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2025-08-12 17:07:42', 6, 'EXECUTED', '8:384bbd364a649b67c3ca1bcb72fe537f', 'createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '4.3.5', NULL, NULL, '4989661859');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_instance`;
CREATE TABLE `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_FORM_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_FORM_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_FORM_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_instance
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('10002', 1, 'flow_yvmruh6h.bpmn', '10001', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('10003', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '10001', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('10006', 1, 'flow_yvmruh6h.bpmn', '10005', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('10007', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '10005', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('10010', 1, 'flow_yvmruh6h.bpmn', '10009', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('10011', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '10009', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('12502', 1, 'flow_yvmruh6h.bpmn', '12501', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('12503', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '12501', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('15002', 1, 'flow_yvmruh6h.bpmn', '15001', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('15003', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '15001', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('15006', 1, 'flow_yvmruh6h.bpmn', '15005', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('15007', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '15005', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('15010', 1, 'flow_yvmruh6h.bpmn', '15009', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('15011', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '15009', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('17502', 1, 'flow_yvmruh6h.bpmn', '17501', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('17503', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '17501', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('20002', 1, 'null.bpmn', '20001', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F33222076616C75653D22E9A286E5AFBCE7BB8422202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('20003', 1, 'null.flow_rmnt89qb.png', '20001', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('20006', 1, 'flow_yvmruh6h.bpmn', '20005', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('20007', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '20005', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('42505', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('45005', 2, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000227400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002274000864697361626C656471007E001174000668696464656E71007E0022740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0022740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C7400116C6162656C49636F6E506F736974696F6E7400047265617274000D73686F77576F72644C696D697471007E002274000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0022740014617070656E64427574746F6E44697361626C656471007E002274000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657374000A6C6162656C57696474687371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002C71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('47505', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('47515', 1, 'flow_yvmruh6h.bpmn', '47514', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('47516', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '47514', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('47520', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('47522', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('47535', 2, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000227400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002274000864697361626C656471007E001174000668696464656E71007E0022740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0022740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C7400116C6162656C49636F6E506F736974696F6E7400047265617274000D73686F77576F72644C696D697471007E002274000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0022740014617070656E64427574746F6E44697361626C656471007E002274000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657374000A6C6162656C57696474687371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002C71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('50003', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('50005', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('52503', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('52505', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('52516', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('52518', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000017704000000017371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('55002', 1, 'null.bpmn', '55001', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('55003', 1, 'null.flow_rmnt89qb.png', '55001', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('55006', 1, 'null.bpmn', '55005', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('55007', 1, 'null.flow_rmnt89qb.png', '55005', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('55013', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000037704000000037371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000277400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000A6C6162656C57696474687074000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002374000864697361626C656471007E002374000668696464656E71007E0023740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0023740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C74000E6C6162656C49636F6E436C617373707400116C6162656C49636F6E506F736974696F6E7400047265617274000C6C6162656C546F6F6C746970707400096D696E4C656E677468707400096D61784C656E6774687074000D73686F77576F72644C696D697471007E002374000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0023740014617070656E64427574746F6E44697361626C656471007E002374000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000408371007E000B740005696E70757471007E000D74000A746578742D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000002771007E001474000A696E707574343635333771007E001674000CE8AFB7E58187E79086E794B171007E001871007E001C71007E000B7400047465787471007E001B71007E001C71007E001D71007E001C71007E001E740005323030707871007E002071007E001C71007E00217071007E002271007E002371007E002471007E002371007E002571007E002371007E002671007E002371007E002771007E001171007E002871007E002371007E002971007E002371007E002A71007E001C71007E002B71007E001C71007E002C71007E001C71007E002D7371007E0004000000007704000000007871007E002E7071007E002F7400047265617271007E00317071007E00327071007E00337071007E003471007E002371007E003571007E001C71007E003671007E001C71007E003771007E002371007E003871007E002371007E003974000D637573746F6D2D73656172636871007E003B71007E001C71007E003C71007E001C71007E003D71007E001C71007E003E71007E001C71007E003F71007E001C71007E004071007E001C71007E004171007E001C71007E004271007E001C780071007E004374000A696E707574343635333778007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000FCAC71007E000B74000A646174652D72616E676571007E000D740010646174652D72616E67652D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000002171007E001474000E6461746572616E6765383334363871007E001674000CE8AFB7E58187E88C83E59BB471007E001871007E001C71007E000B7400096461746572616E676571007E001B707400107374617274506C616365686F6C64657271007E001C74000E656E64506C616365686F6C64657271007E001C71007E001E740005323030707871007E002071007E001C74000D6175746F46756C6C576964746871007E001171007E00217071007E002271007E002371007E002471007E002371007E002571007E002371007E002671007E002371007E002771007E00117400086564697461626C6571007E0023740006666F726D617474000A595959592D4D4D2D444474000B76616C7565466F726D617474000A595959592D4D4D2D444471007E002971007E002371007E002A71007E001C71007E002B71007E001C71007E002C71007E001C71007E002D71007E001C71007E002E7071007E002F7400047265617271007E00317071007E003B71007E001C71007E003C71007E001C71007E003E71007E001C71007E003F71007E001C71007E004071007E001C71007E004171007E001C780071007E004374000E6461746572616E6765383334363878007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657371007E00217371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002D71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('55018', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313874000A323032352D30382D323078, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('55031', 1, 'null.bpmn', '55030', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('55032', 1, 'null.flow_rmnt89qb.png', '55030', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57503', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000002770800000002000000007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57505', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000002770800000002000000007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57517', 1, '请假.bpmn', '57516', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22E8AFB7E58187223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57518', 1, '请假.flow_rmnt89qb.png', '57516', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57521', 1, '请假外部页面.bpmn', '57520', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22E8AFB7E58187E5A496E983A8E9A1B5E99DA22220666C6F7761626C653A70726F6365737343617465676F72793D226C65617665223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22332220666C6F7761626C653A75736572547970653D2263616E64696461746547726F7570732220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57522', 1, '请假外部页面.flow_rmnt89qb.png', '57520', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57525', 1, '结束.bpmn', '57524', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F703832673669623822206E616D653D22E7BB93E69D9F223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316930327970363C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3076656D6B307A22206E616D653D22E5AEA1E689B9312220666C6F7761626C653A75736572547970653D2261737369676E6565223E0A2020202020203C696E636F6D696E673E466C6F775F316930327970363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F31793679786B373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316930327970362220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3076656D6B307A22202F3E0A202020203C757365725461736B2069643D2241637469766974795F3030356368697922206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31793679786B373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307764397534693C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31793679786B372220736F757263655265663D2241637469766974795F3076656D6B307A22207461726765745265663D2241637469766974795F3030356368697922202F3E0A202020203C656E644576656E742069643D224576656E745F3065393536746F223E0A2020202020203C696E636F6D696E673E466C6F775F307764397534693C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307764397534692220736F757263655265663D2241637469766974795F3030356368697922207461726765745265663D224576656E745F3065393536746F22202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7038326736696238223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F3076656D6B307A5F6469222062706D6E456C656D656E743D2241637469766974795F3076656D6B307A223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303035636869795F6469222062706D6E456C656D656E743D2241637469766974795F30303563686979223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F3065393536746F5F6469222062706D6E456C656D656E743D224576656E745F3065393536746F223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316930327970365F6469222062706D6E456C656D656E743D22466C6F775F31693032797036223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31793679786B375F6469222062706D6E456C656D656E743D22466C6F775F31793679786B37223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307764397534695F6469222062706D6E456C656D656E743D22466C6F775F30776439753469223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57526', 1, '结束.flow_p82g6ib8.png', '57524', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C80000136449444154785EEDDD5B8C55F5BD0770EAC3096D5FB4B7345AB51793DAA40FBEB6F6C1B69A3E54633D05E7426C67608C432BB6497BDA482407441F684C93DA634F306D1AA89C9073522CD88254072D5A40EBAD47A9228A28204E01455006CB659DF5DF9D3D67FBDF836E6760CF7FFDE7F349BE19D87BCD5A4BE6E7DADF596B5FA64C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080FF5714C5BF6CDBB6EDBF376EDCF88F818181E29E7BEE9136A7FC773FBE7EFDFA97D7AD5B7779FCF3A92A7335F1C971AE00A8A8B214FC4FF9A0540C0E0E16434343C55B6FBD256D4EF8770FFFFEF7DF7FFFEB6551F87AFC33AA227335F1C971AE00A8A870062A3C28C50F56D2FEECDEBD7B6F590C1E8E7F465564AED2494E7305404585CB9DCE40A591F073288BC1E1F8675445E62A9DE4345700545478AE57FC00251397F0F3887F465564AED24A2E73054045B55A0CDED8BFBBD8F6975F179BEFBDB196F0E7705BBC9C8C2FB9140373955672992B002AAA956270F0B55DC5536BE7157FFDC3BFBD2DE1B6705FBCBC8C3DB9140373955672992B002AAA9562B063F3AAA65250CFCECD77352D2F634F2EC5C05CA5955CE60A808A6AA5183C7DDFA2A642504FB82F5E5EC69E5C8A81B94A2BB9CC150015D54A3178EA9EF94D85A09E705FBCBC8C3DB9140373955672992B002A4A31482BB9140373955672992B002AAA9562105E3D1C17827AC27DF1F232F6E4520CCC555AC965AE00A8A8568AC1D63FFF475321A827DC172F2F634F2EC5C05CA5955CE60A808A6AA518ECDBF5BFC5537FFCF7A652106E0BF7C5CBCBD8934B313057692597B902A0A25A2906212F3CB2B4A91884DBE2E5647CC9A51898ABB492CB5C0150512D1583C3878BAD1BFEB3A91884DBC27D4DCBCB98934B313057692597B902A0A2DEAD18844F7C79F6CF3F6F2A05F584FB7C2ACCC94B2EC5C05CA5955CE60A808A3A6131387CB8D8BD755DF1E4DD739BCA409CB04C58D659A9F127976260AED24A2E730540458D560CDEEDECD389E2ACD4F8934B313057692597B902A0A2462B06AD9C7D3A51C2F7C6EB93D6934B313057692597B902A0A2462B06F183FD7B4DBC3E693DB9140373955672992B002A6AB4622013975C8A81B94A2BB9CCD558F5F4F49CDED9D939ADA3A3E3D6F2EB409917CA1C2A530C7F0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CCD57BD5D5D5754959205794796BB85CB69AB0FC8AF0FDF13A011803C520ADE4520CCC555AC965AE5A5516C52F948571D32845722CD914D6176F0380F74031482BB914037395567299AB77D3D3D333B5A3A3E3B6B2241E8F8BE3F7BFFFFD62D9B265C5A38F3E5A3CFFFCF3C5BE7DFB8A207C0D7F0FB787FBC372F1F786F585F586F5C7DB0418511E534EDBB871E3BF2E5DBAF48F0B162CD8FBE31FFF7868F6ECD9B503527F7FFF911FFEF08707CADB9E5BB870E12DBDBDBD67C7DF9F33C520ADE4520CCC555AC965AEDE49793C3FBBABABEBAF8D45B1BBBBBB58BC7871B173E7CE5AB96C55583E7C5FF8FEA8783E11B6136F1B98E4CAE3C6D4BBEFBEFBF679F3E6FDA3AFAFAFF8C52F7E516CDAB469D4DF6EC3EDE1FE59B3661D9B3367CEB6ABAFBEFA6BF1FA72A418A4955C8A81B94A2BB9CCD5899445F3FC32BB1ACBE1A2458B8A1D3B76BCBD49BE47E1FBC37AA2D2B9236C2FDE0760922A0BE477172E5C38142E8F6CDCB8B13876EC587C2C1955582E2C7FDD75D71DF9CE77BEF3584747C767E275E74431482BB914037395567299ABD10C9FD91C299BE1ACE4AA55ABE243FBB884F545673B7738D309935C796C78DFDAB56B975D73CD35C5EAD5AB8BA3478FC6C78E9684EF0BDFDFD3D3F346CEAF54540CD24A2EC5C05CA5955CE62A169E53D97819BDB7B7B778FCF1C7E3C3F94911D61BD6DF503A9FF09C4E98A4CA63C2FB56AC58F1D0ECD9B38B679E79263E5E8C49584F5F5FDFA1F2B7DB59F1F672A018A4955C8A81B94A2BB9CC556CF805422367364F55D9AC0BEB6F3CD319B61FEF13300984339BFDFDFDC5E0E0607C9C1897B0BEF237DB83575E79E5C5F136AB4E31482BB914037395567299AB46C36F7D74AC5EFEEEBAEBAEF8D07D4A84ED349CE53CE62D936092D9B061C37743D93C59673663E57A8F7FEB5BDF7A6DFAF4E9E7C5DBAE32C520ADE4520CCC555AC965AE1A7536BCCF6678614F3B452F24DA14EF1B90A9F2FFFFA937DD74D35078CEE5A9B472E5CAD7BABBBBEF8EB75F658A415AC9A51898ABB492CB5CD585AB4D8D97D2C7FB6AF4F72A6CAFF1D27A8E57BF8051AC59B366717835FA585F20D4AAB0FEBEBEBE3DE5C1E5CBF13E5495629056722906E62AADE43257759DFFFCB8CA5AD90BEF973911C2761BCE72AE88F711C84CF9FFFD6937DC70C33FC25B19B5C3830F3EB8BF3CB83C10EF475529066925976260AED24A2E73157477779FD1D9F0D9E8ED3EBB5917B6DB5038DF0AFB15EF2B90910D1B365C71F5D557B7FC3E9BE315B63363C68CFDD3A74F3F2BDE97949407C0FBCA5C14DF1E530CD24AEAC5C05C5533A9CF555D2BF355DE3FAD5EF4C295AD89147D0CE6B4785F818C2C59B2E49EF00941EDB460C182A73A3A3A66C7FB92928683E03B1EC01583B4927A313057D54CEA7355D7CA7C95B7FFBCBEDC1D77DC111F9EDB2A6CBF619F7F1EEF2B9091850B17EE69D7E5F4BA7BEFBD777367E2CFD9693808BEE3015C31482BA917037355CDA43E5775ADCC575757D7BAFAFD8F3CF2487C786EABB0FDFABE84FD6ADC4F20333FFAD18F86B66DDB161F074EA92D5BB66C2F0F307F89F72525A31CB8473D802B066925F56230CA3C99AB0A24F5B9AA1B65AE9AE6ABFCFA52FDF6761FFB6361FB0DFBF852F49F03E4A4BFBFFFF8ABAFBE1A1F074EA97DFBF61D2C0F2EBBE27D49C92807EC38B50378158AC1B3CF3E5B7B827E7C7B631E7AE8A1A6DB1E78E081E2C081034DB7A79CD48BC1287314C75C2598D4E7AA6E94798A13E6EBCDFADFDB7DEC8F85EDD7F7A5ABABEB40FCDF0364E4AAABAE2A8E1C39121F074EA9727B074639105632A9168370207FF3CD376B7FDEBA756BF1894F7CA2D8BF7FFFC8FD4343436F5BFEC20B2F2CC27379C3A780841791854270F9E5971737DC7043D3BAC3FA9E7BEEB9A6DB5348FCF3A96A26E35C85CBABAB56AD2AF6EEDDDB74DF4427FEF9E492761FFB6361FB0DFB73347E7C023272CD35D71C69F76FB97BF6EC79AEB3BA6738EFEBACC0A5CF050B1614D3A64D0BEF7B5ACC9A352B9C9D29BEFDED6F173367CE0C1F335A7CEE739F2B9E78E28991E52FBAE8A2E2BEFBEEAB3DE05F7AE9A5B5DBA64F9F5EDC79E79DB5B358070F1EAC95CC193366141FF9C8478ADFFCE6374DDB4C21A99F891A659E26FD5C85DBE6CF9F5F5B57C8A73FFDE95AB18DB73D91497DAEEA4699ABA6F90A6712EBB7B7FBD81F73861326911FFCE00707DAFD3C9EBFFDED6F8F7456EF399C6F2B0475A916834F7DEA53E1DF79E4EF1FFAD087468AC0ADB7DE5ACC9B37AFD8B56B57AD0884334F679D755671FEF9E717E79D775EF18D6F7CA356044231F8ED6F7F5B7CE52B5FA99589279F7CB2F8D297BE542B050AE7D898ABE6B90ADF7BC6196714EBD6AD2B0606066AF3B572E5CAA66D4F64529FABBA56E6ABD3733881893077EEDC67DBFD2AF53BEFBC735567755EA5DE74C06E946A3178E595578AAF7EF5ABB507FD900F7CE003237FFEE4273F397249FCD0A143B51270C9259714EBD7AFAF5DFA3CF7DC738B73CE39A7F8F0873F5C7CFEF39F2FAEBFFEFAE2F5D75F1F59F7148573CCCCD5E873D5DFDF5F3CF6D863E1F9DDB5F90ACFF38CB73D91497DAEEA5A992FAF520726C482050B6E69F7FB705E7BEDB5AB2BF03E9C273C60374AB518847CF4A31F1D79BEDD99679E3972FBC73EF6B1B72DF7C61B6F145FFCE2176B973FBFF9CD6F16575C7145EDF67026EA97BFFC65D37AA7289C6366AE4E3C5721E12C69FDD27B4A497DAEEA5A99AF4EEFC3094C84DEDEDEB3FBFAFA8EB5F193865E290F2C7B52FFA4A156A55C0C3EFEF18F173D3D3DB5CB96E14C54F85AFF737D995FFDEA57B50271FAE9A7176BD7AE2DD6AC59F3B662109E6B17AF778AC279CA4DC6B90A6742BBBBBB937C057B2E73157426F44943DFFBDEF78E37144E9F3404B99B3367CE0BEDBAACBE7CF9F23B3A7D967A5B122E5D86177784CB9D1FFCE007472E7D4E9D3AB576C9332C33383858FCFEF7BF1FB9F4395A3178FAE9A78BA54B978EAC778AC279CA4DB6B90A7F2E8F43B5EF0F9759477B3BA5894C2E7315F82C7560C2940F165FBBEEBAEB8E1C3D7A343E269C54E5FA77940796AD575E79E597E37DA8AA948BC14F7EF293E2F0E1C3B53F87B352F5DB7FF6B39F35BD7D4D6331B8ECB2CB8A9B6EBAA978FFFBDF5FAC58B1A2F62AE3B973E7D69EBF77DB6DB7D50A67575757B161C386A66D4E747229069369AEC272E195EF4B962CA9FD22135E4C145E3C146F772293CB5CD595C7E115F5B2B778F1E2F850DD1661BB0D8533E9E7F40327D1B5D75EFBD8EAD5AB8FC7078593E878F940F5EBF2C0B23ADE7695A55C0C1A132E6FC6B7856CD9B2A5F8E94F7F5A7CF6B39FAD15C8DB6FBFBD38EDB4D36A0F0637DE7863ED397AE195C6E15267B87FCAF05BD78484B35AF1FA263AB91483C9345761F9290D731512BE3F5EE7442697B9AA2B7FE9BFB85EF6C2CFA0DD6739C3F6CA5F5A472EA787FD89F711C8D4F4E9D3CFEBEDED3DF8CC33CFC4C78693E24F7FFAD392F2C0B23B6C27DE769555A5185C70C1054DB78584335537DF7C7371F1C517D75EE4B17DFBF6E2965B6E695AAE2AC9A51898ABB492CB5C352A8FC79BEA856FD1A245F121FB940ADB6B38BBB929DE372073E56F9C97CC9C39F35078FED5C9543ED8DC551E545ECEF1B7D8AA1483FA73EB464B7C19B4CAC9A51898ABB492CB5C352A8FF75F288FCBC7EAC52FBC75553B84ED3494CD63613FE27D032681EEEEEE59BDBDBD074ED699CEE1339BBBCACC8CB79583AA1483C9925C8A81B94A2BB9CC55ACA3A3E3B67AF90B97D61F7FFCF1F8107E5285F5375E4A0FDB8FF7099844C299C8ABAEBAEAB5952B57BE36D617128517080D3F67F3951CCF6CD629066925976260AED24A2E7315EBE9E9995A1EA39FA817C0F0F656A7AA7486F596DB1B39A31AB61BB61FEF1330C994BF797EA6FC8D776D5F5FDF9E071F7C707FABEFD3592E37B87CF9F265E5C1646B9935613DF1BA73A218A4955C8A81B94A2BB9CCD568CAE3F4D965C23B888C9CE90C1F4D7A3285F5359ED91CDEDED9F1BE009358780BA3F2C0B07EC68C19AFCF9F3FFFC9818181A7B66CD9F2D2DEBD7BDF288F2307FFFEF7BF6FDBBC79F323BFFBDDEF56CE9933674DB9ECDEB07C4E6F7DF44E1483B4924B313057692597B93A91B20C9EDF583A43C20B7BC6FBEAF5F0FDD10B846A65336C2FDE07809AF0C940E581A2BFA3A3237C0EFAC30D07A7F0F5E1E1DBFB73F904A15629066925976260AED24A2E73F54E3AFF79A673E4F27A4838DB19DECA6AE7CE9D71977C4761F9F07DD159CDDA65F4B09D78DB00BC0BC520ADE4520CCC555AC965AEDE4D784EE5F00B89E2A258FB18CC65CB96158F3EFA68F1FCF3CF17FBF6EDAB95CBF035FC3DDC1EEE8F3EAEB29EE361BD9EB30930468A415AC9A51898ABB492CB5CB56AF82D9346DEA7739CD9E4AD8F00C64931482BB914037395567299ABF72ABC3773E73F3F0673E4B3D75B4C587E45F8FE789D008C81629056722906E62AADE4325763D5D3D3737A5920A7757474DC5A7E1D28F3429943C3E5327C0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015353030707C6868A8E9014ADA9FF2E7F072590C0EC73FA32A3257E924A7B902A0A2D6AF5FFFF2E0E060D38394B43F2FBEF8E2F2B2183C1CFF8CAAC85CA5939CE60A808A5AB76EDDE5F7DF7FFFEBBB77EFDEEB8CD4C4A4FC77DFBD7DFBF6FF2A4BC14B65BE1EFF8CAAC85C4D7C729C2B002A2C3C1885332065DE0ACFF592B627FCBB877FFFAC4A41F8EF19FEEF325713932CE70A000000000000000000000000000000000000000000008049ECFF0044CC9A9F56F1AEE90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57529', 1, '结束.bpmn', '57528', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F703832673669623822206E616D653D22E7BB93E69D9F223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316930327970363C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3076656D6B307A22206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F316930327970363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F31793679786B373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316930327970362220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3076656D6B307A22202F3E0A202020203C757365725461736B2069643D2241637469766974795F3030356368697922206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31793679786B373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307764397534693C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31793679786B372220736F757263655265663D2241637469766974795F3076656D6B307A22207461726765745265663D2241637469766974795F3030356368697922202F3E0A202020203C656E644576656E742069643D224576656E745F3065393536746F223E0A2020202020203C696E636F6D696E673E466C6F775F307764397534693C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307764397534692220736F757263655265663D2241637469766974795F3030356368697922207461726765745265663D224576656E745F3065393536746F22202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7038326736696238223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F3076656D6B307A5F6469222062706D6E456C656D656E743D2241637469766974795F3076656D6B307A223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303035636869795F6469222062706D6E456C656D656E743D2241637469766974795F30303563686979223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F3065393536746F5F6469222062706D6E456C656D656E743D224576656E745F3065393536746F223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316930327970365F6469222062706D6E456C656D656E743D22466C6F775F31693032797036223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31793679786B375F6469222062706D6E456C656D656E743D22466C6F775F31793679786B37223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307764397534695F6469222062706D6E456C656D656E743D22466C6F775F30776439753469223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57530', 1, '结束.flow_p82g6ib8.png', '57528', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C80000136449444154785EEDDD5B8C55F5BD0770EAC3096D5FB4B7345AB51793DAA40FBEB6F6C1B69A3E54633D05E7426C67608C432BB6497BDA482407441F684C93DA634F306D1AA89C9073522CD88254072D5A40EBAD47A9228A28204E01455006CB659DF5DF9D3D67FBDF836E6760CF7FFDE7F349BE19D87BCD5A4BE6E7DADF596B5FA64C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080FF5714C5BF6CDBB6EDBF376EDCF88F818181E29E7BEE9136A7FC773FBE7EFDFA97D7AD5B7779FCF3A92A7335F1C971AE00A8A8B214FC4FF9A0540C0E0E16434343C55B6FBD256D4EF8770FFFFEF7DF7FFFEB6551F87AFC33AA227335F1C971AE00A8A870062A3C28C50F56D2FEECDEBD7B6F590C1E8E7F465564AED2494E7305404585CB9DCE40A591F073288BC1E1F8675445E62A9DE4345700545478AE57FC00251397F0F3887F465564AED24A2E73054045B55A0CDED8BFBBD8F6975F179BEFBDB196F0E7705BBC9C8C2FB9140373955672992B002AAA956270F0B55DC5536BE7157FFDC3BFBD2DE1B6705FBCBC8C3DB9140373955672992B002AAA9562B063F3AAA65250CFCECD77352D2F634F2EC5C05CA5955CE60A808A6AA5183C7DDFA2A642504FB82F5E5EC69E5C8A81B94A2BB9CC150015D54A3178EA9EF94D85A09E705FBCBC8C3DB9140373955672992B002A4A31482BB9140373955672992B002AAA9562105E3D1C17827AC27DF1F232F6E4520CCC555AC965AE00A8A8568AC1D63FFF475321A827DC172F2F634F2EC5C05CA5955CE60A808A6AA518ECDBF5BFC5537FFCF7A652106E0BF7C5CBCBD8934B313057692597B902A0A25A2906212F3CB2B4A91884DBE2E5647CC9A51898ABB492CB5C0150512D1583C3878BAD1BFEB3A91884DBC27D4DCBCB98934B313057692597B902A0A2DEAD18844F7C79F6CF3F6F2A05F584FB7C2ACCC94B2EC5C05CA5955CE60A808A3A6131387CB8D8BD755DF1E4DD739BCA409CB04C58D659A9F127976260AED24A2E730540458D560CDEEDECD389E2ACD4F8934B313057692597B902A0A2462B06AD9C7D3A51C2F7C6EB93D6934B313057692597B902A0A2462B06F183FD7B4DBC3E693DB9140373955672992B002A6AB4622013975C8A81B94A2BB9CCD558F5F4F49CDED9D939ADA3A3E3D6F2EB409917CA1C2A530C7F0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CCD57BD5D5D5754959205794796BB85CB69AB0FC8AF0FDF13A011803C520ADE4520CCC555AC965AE5A5516C52F948571D32845722CD914D6176F0380F74031482BB914037395567299AB77D3D3D333B5A3A3E3B6B2241E8F8BE3F7BFFFFD62D9B265C5A38F3E5A3CFFFCF3C5BE7DFB8A207C0D7F0FB787FBC372F1F786F585F586F5C7DB0418511E534EDBB871E3BF2E5DBAF48F0B162CD8FBE31FFF7868F6ECD9B503527F7FFF911FFEF08707CADB9E5BB870E12DBDBDBD67C7DF9F33C520ADE4520CCC555AC965AEDE49793C3FBBABABEBAF8D45B1BBBBBB58BC7871B173E7CE5AB96C55583E7C5FF8FEA8783E11B6136F1B98E4CAE3C6D4BBEFBEFBF679F3E6FDA3AFAFAFF8C52F7E516CDAB469D4DF6EC3EDE1FE59B3661D9B3367CEB6ABAFBEFA6BF1FA72A418A4955C8A81B94A2BB9CCD5899445F3FC32BB1ACBE1A2458B8A1D3B76BCBD49BE47E1FBC37AA2D2B9236C2FDE0760922A0BE477172E5C38142E8F6CDCB8B13876EC587C2C1955582E2C7FDD75D71DF9CE77BEF3584747C767E275E74431482BB914037395567299ABD10C9FD91C299BE1ACE4AA55ABE243FBB884F545673B7738D309935C796C78DFDAB56B975D73CD35C5EAD5AB8BA3478FC6C78E9684EF0BDFDFD3D3F346CEAF54540CD24A2EC5C05CA5955CE62A169E53D97819BDB7B7B778FCF1C7E3C3F94911D61BD6DF503A9FF09C4E98A4CA63C2FB56AC58F1D0ECD9B38B679E79263E5E8C49584F5F5FDFA1F2B7DB59F1F672A018A4955C8A81B94A2BB9CC556CF805422367364F55D9AC0BEB6F3CD319B61FEF13300984339BFDFDFDC5E0E0607C9C1897B0BEF237DB83575E79E5C5F136AB4E31482BB914037395567299AB46C36F7D74AC5EFEEEBAEBAEF8D07D4A84ED349CE53CE62D936092D9B061C37743D93C59673663E57A8F7FEB5BDF7A6DFAF4E9E7C5DBAE32C520ADE4520CCC555AC965AE1A7536BCCF6678614F3B452F24DA14EF1B90A9F2FFFFA937DD74D35078CEE5A9B472E5CAD7BABBBBEF8EB75F658A415AC9A51898ABB492CB5CD585AB4D8D97D2C7FB6AF4F72A6CAFF1D27A8E57BF8051AC59B366717835FA585F20D4AAB0FEBEBEBE3DE5C1E5CBF13E5495629056722906E62AADE43257759DFFFCB8CA5AD90BEF973911C2761BCE72AE88F711C84CF9FFFD6937DC70C33FC25B19B5C3830F3EB8BF3CB83C10EF475529066925976260AED24A2E73157477779FD1D9F0D9E8ED3EBB5917B6DB5038DF0AFB15EF2B90910D1B365C71F5D557B7FC3E9BE315B63363C68CFDD3A74F3F2BDE97949407C0FBCA5C14DF1E530CD24AEAC5C05C5533A9CF555D2BF355DE3FAD5EF4C295AD89147D0CE6B4785F818C2C59B2E49EF00941EDB460C182A73A3A3A66C7FB92928683E03B1EC01583B4927A313057D54CEA7355D7CA7C95B7FFBCBEDC1D77DC111F9EDB2A6CBF619F7F1EEF2B9091850B17EE69D7E5F4BA7BEFBD777367E2CFD9693808BEE3015C31482BA917037355CDA43E5775ADCC575757D7BAFAFD8F3CF2487C786EABB0FDFABE84FD6ADC4F20333FFAD18F86B66DDB161F074EA92D5BB66C2F0F307F89F72525A31CB8473D802B066925F56230CA3C99AB0A24F5B9AA1B65AE9AE6ABFCFA52FDF6761FFB6361FB0DFBF852F49F03E4A4BFBFFFF8ABAFBE1A1F074EA97DFBF61D2C0F2EBBE27D49C92807EC38B50378158AC1B3CF3E5B7B827E7C7B631E7AE8A1A6DB1E78E081E2C081034DB7A79CD48BC1287314C75C2598D4E7AA6E94798A13E6EBCDFADFDB7DEC8F85EDD7F7A5ABABEB40FCDF0364E4AAABAE2A8E1C39121F074EA9727B074639105632A9168370207FF3CD376B7FDEBA756BF1894F7CA2D8BF7FFFC8FD4343436F5BFEC20B2F2CC27379C3A780841791854270F9E5971737DC7043D3BAC3FA9E7BEEB9A6DB5348FCF3A96A26E35C85CBABAB56AD2AF6EEDDDB74DF4427FEF9E492761FFB6361FB0DFB73347E7C023272CD35D71C69F76FB97BF6EC79AEB3BA6738EFEBACC0A5CF050B1614D3A64D0BEF7B5ACC9A352B9C9D29BEFDED6F173367CE0C1F335A7CEE739F2B9E78E28991E52FBAE8A2E2BEFBEEAB3DE05F7AE9A5B5DBA64F9F5EDC79E79DB5B358070F1EAC95CC193366141FF9C8478ADFFCE6374DDB4C21A99F891A659E26FD5C85DBE6CF9F5F5B57C8A73FFDE95AB18DB73D91497DAEEA4699ABA6F90A6712EBB7B7FBD81F73861326911FFCE00707DAFD3C9EBFFDED6F8F7456EF399C6F2B0475A916834F7DEA53E1DF79E4EF1FFAD087468AC0ADB7DE5ACC9B37AFD8B56B57AD0884334F679D755671FEF9E717E79D775EF18D6F7CA356044231F8ED6F7F5B7CE52B5FA99589279F7CB2F8D297BE542B050AE7D898ABE6B90ADF7BC6196714EBD6AD2B0606066AF3B572E5CAA66D4F64529FABBA56E6ABD3733881893077EEDC67DBFD2AF53BEFBC735567755EA5DE74C06E946A3178E595578AAF7EF5ABB507FD900F7CE003237FFEE4273F397249FCD0A143B51270C9259714EBD7AFAF5DFA3CF7DC738B73CE39A7F8F0873F5C7CFEF39F2FAEBFFEFAE2F5D75F1F59F7148573CCCCD5E873D5DFDF5F3CF6D863E1F9DDB5F90ACFF38CB73D91497DAEEA5A992FAF520726C482050B6E69F7FB705E7BEDB5AB2BF03E9C273C60374AB518847CF4A31F1D79BEDD99679E3972FBC73EF6B1B72DF7C61B6F145FFCE2176B973FBFF9CD6F16575C7145EDF67026EA97BFFC65D37AA7289C6366AE4E3C5721E12C69FDD27B4A497DAEEA5A99AF4EEFC3094C84DEDEDEB3FBFAFA8EB5F193865E290F2C7B52FFA4A156A55C0C3EFEF18F173D3D3DB5CB96E14C54F85AFF737D995FFDEA57B50271FAE9A7176BD7AE2DD6AC59F3B662109E6B17AF778AC279CA4DC6B90A6742BBBBBB937C057B2E73157426F44943DFFBDEF78E37144E9F3404B99B3367CE0BEDBAACBE7CF9F23B3A7D967A5B122E5D86177784CB9D1FFCE007472E7D4E9D3AB576C9332C33383858FCFEF7BF1FB9F4395A3178FAE9A78BA54B978EAC778AC279CA4DB6B90A7F2E8F43B5EF0F9759477B3BA5894C2E7315F82C7560C2940F165FBBEEBAEB8E1C3D7A343E269C54E5FA77940796AD575E79E597E37DA8AA948BC14F7EF293E2F0E1C3B53F87B352F5DB7FF6B39F35BD7D4D6331B8ECB2CB8A9B6EBAA978FFFBDF5FAC58B1A2F62AE3B973E7D69EBF77DB6DB7D50A67575757B161C386A66D4E747229069369AEC272E195EF4B962CA9FD22135E4C145E3C146F772293CB5CD595C7E115F5B2B778F1E2F850DD1661BB0D8533E9E7F40327D1B5D75EFBD8EAD5AB8FC7078593E878F940F5EBF2C0B23ADE7695A55C0C1A132E6FC6B7856CD9B2A5F8E94F7F5A7CF6B39FAD15C8DB6FBFBD38EDB4D36A0F0637DE7863ED397AE195C6E15267B87FCAF05BD78484B35AF1FA263AB91483C9345761F9290D731512BE3F5EE7442697B9AA2B7FE9BFB85EF6C2CFA0DD6739C3F6CA5F5A472EA787FD89F711C8D4F4E9D3CFEBEDED3DF8CC33CFC4C78693E24F7FFAD392F2C0B23B6C27DE769555A5185C70C1054DB78584335537DF7C7371F1C517D75EE4B17DFBF6E2965B6E695AAE2AC9A51898ABB492CB5C352A8FC79BEA856FD1A245F121FB940ADB6B38BBB929DE372073E56F9C97CC9C39F35078FED5C9543ED8DC551E545ECEF1B7D8AA1483FA73EB464B7C19B4CAC9A51898ABB492CB5C352A8FF75F288FCBC7EAC52FBC75553B84ED3494CD63613FE27D032681EEEEEE59BDBDBD074ED699CEE1339BBBCACC8CB79583AA1483C9925C8A81B94A2BB9CC55ACA3A3E3B67AF90B97D61F7FFCF1F8107E5285F5375E4A0FDB8FF7099844C299C8ABAEBAEAB5952B57BE36D617128517080D3F67F3951CCF6CD629066925976260AED24A2E7315EBE9E9995A1EA39FA817C0F0F656A7AA7486F596DB1B39A31AB61BB61FEF1330C994BF797EA6FC8D776D5F5FDF9E071F7C707FABEFD3592E37B87CF9F265E5C1646B9935613DF1BA73A218A4955C8A81B94A2BB9CCD568CAE3F4D965C23B888C9CE90C1F4D7A3285F5359ED91CDEDED9F1BE009358780BA3F2C0B07EC68C19AFCF9F3FFFC9818181A7B66CD9F2D2DEBD7BDF288F2307FFFEF7BF6FDBBC79F323BFFBDDEF56CE9933674DB9ECDEB07C4E6F7DF44E1483B4924B313057692597B93A91B20C9EDF583A43C20B7BC6FBEAF5F0FDD10B846A65336C2FDE07809AF0C940E581A2BFA3A3237C0EFAC30D07A7F0F5E1E1DBFB73F904A15629066925976260AED24A2E73F54E3AFF79A673E4F27A4838DB19DECA6AE7CE9D71977C4761F9F07DD159CDDA65F4B09D78DB00BC0BC520ADE4520CCC555AC965AEDE4D784EE5F00B89E2A258FB18CC65CB96158F3EFA68F1FCF3CF17FBF6EDAB95CBF035FC3DDC1EEE8F3EAEB29EE361BD9EB30930468A415AC9A51898ABB492CB5CB56AF82D9346DEA7739CD9E4AD8F00C64931482BB914037395567299ABF72ABC3773E73F3F0673E4B3D75B4C587E45F8FE789D008C81629056722906E62AADE4325763D5D3D3737A5920A7757474DC5A7E1D28F3429943C3E5327C0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015353030707C6868A8E9014ADA9FF2E7F072590C0EC73FA32A3257E924A7B902A0A2D6AF5FFFF2E0E060D38394B43F2FBEF8E2F2B2183C1CFF8CAAC85CA5939CE60A808A5AB76EDDE5F7DF7FFFEBBB77EFDEEB8CD4C4A4FC77DFBD7DFBF6FF2A4BC14B65BE1EFF8CAAC85C4D7C729C2B002A2C3C1885332065DE0ACFF592B627FCBB877FFFAC4A41F8EF19FEEF325713932CE70A000000000000000000000000000000000000000000008049ECFF0044CC9A9F56F1AEE90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57533', 1, '结束.bpmn', '57532', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F703832673669623822206E616D653D22E7BB93E69D9F223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316930327970363C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3076656D6B307A22206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F316930327970363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F31793679786B373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316930327970362220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3076656D6B307A22202F3E0A202020203C757365725461736B2069643D2241637469766974795F3030356368697922206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31793679786B373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307764397534693C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31793679786B372220736F757263655265663D2241637469766974795F3076656D6B307A22207461726765745265663D2241637469766974795F3030356368697922202F3E0A202020203C656E644576656E742069643D224576656E745F3065393536746F223E0A2020202020203C696E636F6D696E673E466C6F775F307764397534693C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307764397534692220736F757263655265663D2241637469766974795F3030356368697922207461726765745265663D224576656E745F3065393536746F22202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7038326736696238223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F3076656D6B307A5F6469222062706D6E456C656D656E743D2241637469766974795F3076656D6B307A223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303035636869795F6469222062706D6E456C656D656E743D2241637469766974795F30303563686979223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F3065393536746F5F6469222062706D6E456C656D656E743D224576656E745F3065393536746F223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316930327970365F6469222062706D6E456C656D656E743D22466C6F775F31693032797036223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31793679786B375F6469222062706D6E456C656D656E743D22466C6F775F31793679786B37223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307764397534695F6469222062706D6E456C656D656E743D22466C6F775F30776439753469223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57534', 1, '结束.flow_p82g6ib8.png', '57532', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C80000136449444154785EEDDD5B8C55F5BD0770EAC3096D5FB4B7345AB51793DAA40FBEB6F6C1B69A3E54633D05E7426C67608C432BB6497BDA482407441F684C93DA634F306D1AA89C9073522CD88254072D5A40EBAD47A9228A28204E01455006CB659DF5DF9D3D67FBDF836E6760CF7FFDE7F349BE19D87BCD5A4BE6E7DADF596B5FA64C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080FF5714C5BF6CDBB6EDBF376EDCF88F818181E29E7BEE9136A7FC773FBE7EFDFA97D7AD5B7779FCF3A92A7335F1C971AE00A8A8B214FC4FF9A0540C0E0E16434343C55B6FBD256D4EF8770FFFFEF7DF7FFFEB6551F87AFC33AA227335F1C971AE00A8A870062A3C28C50F56D2FEECDEBD7B6F590C1E8E7F465564AED2494E7305404585CB9DCE40A591F073288BC1E1F8675445E62A9DE4345700545478AE57FC00251397F0F3887F465564AED24A2E73054045B55A0CDED8BFBBD8F6975F179BEFBDB196F0E7705BBC9C8C2FB9140373955672992B002AAA956270F0B55DC5536BE7157FFDC3BFBD2DE1B6705FBCBC8C3DB9140373955672992B002AAA9562B063F3AAA65250CFCECD77352D2F634F2EC5C05CA5955CE60A808A6AA5183C7DDFA2A642504FB82F5E5EC69E5C8A81B94A2BB9CC150015D54A3178EA9EF94D85A09E705FBCBC8C3DB9140373955672992B002A4A31482BB9140373955672992B002AAA9562105E3D1C17827AC27DF1F232F6E4520CCC555AC965AE00A8A8568AC1D63FFF475321A827DC172F2F634F2EC5C05CA5955CE60A808A6AA518ECDBF5BFC5537FFCF7A652106E0BF7C5CBCBD8934B313057692597B902A0A25A2906212F3CB2B4A91884DBE2E5647CC9A51898ABB492CB5C0150512D1583C3878BAD1BFEB3A91884DBC27D4DCBCB98934B313057692597B902A0A2DEAD18844F7C79F6CF3F6F2A05F584FB7C2ACCC94B2EC5C05CA5955CE60A808A3A6131387CB8D8BD755DF1E4DD739BCA409CB04C58D659A9F127976260AED24A2E730540458D560CDEEDECD389E2ACD4F8934B313057692597B902A0A2462B06AD9C7D3A51C2F7C6EB93D6934B313057692597B902A0A2462B06F183FD7B4DBC3E693DB9140373955672992B002A6AB4622013975C8A81B94A2BB9CCD558F5F4F49CDED9D939ADA3A3E3D6F2EB409917CA1C2A530C7F0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CCD57BD5D5D5754959205794796BB85CB69AB0FC8AF0FDF13A011803C520ADE4520CCC555AC965AE5A5516C52F948571D32845722CD914D6176F0380F74031482BB914037395567299AB77D3D3D333B5A3A3E3B6B2241E8F8BE3F7BFFFFD62D9B265C5A38F3E5A3CFFFCF3C5BE7DFB8A207C0D7F0FB787FBC372F1F786F585F586F5C7DB0418511E534EDBB871E3BF2E5DBAF48F0B162CD8FBE31FFF7868F6ECD9B503527F7FFF911FFEF08707CADB9E5BB870E12DBDBDBD67C7DF9F33C520ADE4520CCC555AC965AEDE49793C3FBBABABEBAF8D45B1BBBBBB58BC7871B173E7CE5AB96C55583E7C5FF8FEA8783E11B6136F1B98E4CAE3C6D4BBEFBEFBF679F3E6FDA3AFAFAFF8C52F7E516CDAB469D4DF6EC3EDE1FE59B3661D9B3367CEB6ABAFBEFA6BF1FA72A418A4955C8A81B94A2BB9CCD5899445F3FC32BB1ACBE1A2458B8A1D3B76BCBD49BE47E1FBC37AA2D2B9236C2FDE0760922A0BE477172E5C38142E8F6CDCB8B13876EC587C2C1955582E2C7FDD75D71DF9CE77BEF3584747C767E275E74431482BB914037395567299ABD10C9FD91C299BE1ACE4AA55ABE243FBB884F545673B7738D309935C796C78DFDAB56B975D73CD35C5EAD5AB8BA3478FC6C78E9684EF0BDFDFD3D3F346CEAF54540CD24A2EC5C05CA5955CE62A169E53D97819BDB7B7B778FCF1C7E3C3F94911D61BD6DF503A9FF09C4E98A4CA63C2FB56AC58F1D0ECD9B38B679E79263E5E8C49584F5F5FDFA1F2B7DB59F1F672A018A4955C8A81B94A2BB9CC556CF805422367364F55D9AC0BEB6F3CD319B61FEF13300984339BFDFDFDC5E0E0607C9C1897B0BEF237DB83575E79E5C5F136AB4E31482BB914037395567299AB46C36F7D74AC5EFEEEBAEBAEF8D07D4A84ED349CE53CE62D936092D9B061C37743D93C59673663E57A8F7FEB5BDF7A6DFAF4E9E7C5DBAE32C520ADE4520CCC555AC965AE1A7536BCCF6678614F3B452F24DA14EF1B90A9F2FFFFA937DD74D35078CEE5A9B472E5CAD7BABBBBEF8EB75F658A415AC9A51898ABB492CB5CD585AB4D8D97D2C7FB6AF4F72A6CAFF1D27A8E57BF8051AC59B366717835FA585F20D4AAB0FEBEBEBE3DE5C1E5CBF13E5495629056722906E62AADE43257759DFFFCB8CA5AD90BEF973911C2761BCE72AE88F711C84CF9FFFD6937DC70C33FC25B19B5C3830F3EB8BF3CB83C10EF475529066925976260AED24A2E73157477779FD1D9F0D9E8ED3EBB5917B6DB5038DF0AFB15EF2B90910D1B365C71F5D557B7FC3E9BE315B63363C68CFDD3A74F3F2BDE97949407C0FBCA5C14DF1E530CD24AEAC5C05C5533A9CF555D2BF355DE3FAD5EF4C295AD89147D0CE6B4785F818C2C59B2E49EF00941EDB460C182A73A3A3A66C7FB92928683E03B1EC01583B4927A313057D54CEA7355D7CA7C95B7FFBCBEDC1D77DC111F9EDB2A6CBF619F7F1EEF2B9091850B17EE69D7E5F4BA7BEFBD777367E2CFD9693808BEE3015C31482BA917037355CDA43E5775ADCC575757D7BAFAFD8F3CF2487C786EABB0FDFABE84FD6ADC4F20333FFAD18F86B66DDB161F074EA92D5BB66C2F0F307F89F72525A31CB8473D802B066925F56230CA3C99AB0A24F5B9AA1B65AE9AE6ABFCFA52FDF6761FFB6361FB0DFBF852F49F03E4A4BFBFFFF8ABAFBE1A1F074EA97DFBF61D2C0F2EBBE27D49C92807EC38B50378158AC1B3CF3E5B7B827E7C7B631E7AE8A1A6DB1E78E081E2C081034DB7A79CD48BC1287314C75C2598D4E7AA6E94798A13E6EBCDFADFDB7DEC8F85EDD7F7A5ABABEB40FCDF0364E4AAABAE2A8E1C39121F074EA9727B074639105632A9168370207FF3CD376B7FDEBA756BF1894F7CA2D8BF7FFFC8FD4343436F5BFEC20B2F2CC27379C3A780841791854270F9E5971737DC7043D3BAC3FA9E7BEEB9A6DB5348FCF3A96A26E35C85CBABAB56AD2AF6EEDDDB74DF4427FEF9E492761FFB6361FB0DFB73347E7C023272CD35D71C69F76FB97BF6EC79AEB3BA6738EFEBACC0A5CF050B1614D3A64D0BEF7B5ACC9A352B9C9D29BEFDED6F173367CE0C1F335A7CEE739F2B9E78E28991E52FBAE8A2E2BEFBEEAB3DE05F7AE9A5B5DBA64F9F5EDC79E79DB5B358070F1EAC95CC193366141FF9C8478ADFFCE6374DDB4C21A99F891A659E26FD5C85DBE6CF9F5F5B57C8A73FFDE95AB18DB73D91497DAEEA4699ABA6F90A6712EBB7B7FBD81F73861326911FFCE00707DAFD3C9EBFFDED6F8F7456EF399C6F2B0475A916834F7DEA53E1DF79E4EF1FFAD087468AC0ADB7DE5ACC9B37AFD8B56B57AD0884334F679D755671FEF9E717E79D775EF18D6F7CA356044231F8ED6F7F5B7CE52B5FA99589279F7CB2F8D297BE542B050AE7D898ABE6B90ADF7BC6196714EBD6AD2B0606066AF3B572E5CAA66D4F64529FABBA56E6ABD3733881893077EEDC67DBFD2AF53BEFBC735567755EA5DE74C06E946A3178E595578AAF7EF5ABB507FD900F7CE003237FFEE4273F397249FCD0A143B51270C9259714EBD7AFAF5DFA3CF7DC738B73CE39A7F8F0873F5C7CFEF39F2FAEBFFEFAE2F5D75F1F59F7148573CCCCD5E873D5DFDF5F3CF6D863E1F9DDB5F90ACFF38CB73D91497DAEEA5A992FAF520726C482050B6E69F7FB705E7BEDB5AB2BF03E9C273C60374AB518847CF4A31F1D79BEDD99679E3972FBC73EF6B1B72DF7C61B6F145FFCE2176B973FBFF9CD6F16575C7145EDF67026EA97BFFC65D37AA7289C6366AE4E3C5721E12C69FDD27B4A497DAEEA5A99AF4EEFC3094C84DEDEDEB3FBFAFA8EB5F193865E290F2C7B52FFA4A156A55C0C3EFEF18F173D3D3DB5CB96E14C54F85AFF737D995FFDEA57B50271FAE9A7176BD7AE2DD6AC59F3B662109E6B17AF778AC279CA4DC6B90A6742BBBBBB937C057B2E73157426F44943DFFBDEF78E37144E9F3404B99B3367CE0BEDBAACBE7CF9F23B3A7D967A5B122E5D86177784CB9D1FFCE007472E7D4E9D3AB576C9332C33383858FCFEF7BF1FB9F4395A3178FAE9A78BA54B978EAC778AC279CA4DB6B90A7F2E8F43B5EF0F9759477B3BA5894C2E7315F82C7560C2940F165FBBEEBAEB8E1C3D7A343E269C54E5FA77940796AD575E79E597E37DA8AA948BC14F7EF293E2F0E1C3B53F87B352F5DB7FF6B39F35BD7D4D6331B8ECB2CB8A9B6EBAA978FFFBDF5FAC58B1A2F62AE3B973E7D69EBF77DB6DB7D50A67575757B161C386A66D4E747229069369AEC272E195EF4B962CA9FD22135E4C145E3C146F772293CB5CD595C7E115F5B2B778F1E2F850DD1661BB0D8533E9E7F40327D1B5D75EFBD8EAD5AB8FC7078593E878F940F5EBF2C0B23ADE7695A55C0C1A132E6FC6B7856CD9B2A5F8E94F7F5A7CF6B39FAD15C8DB6FBFBD38EDB4D36A0F0637DE7863ED397AE195C6E15267B87FCAF05BD78484B35AF1FA263AB91483C9345761F9290D731512BE3F5EE7442697B9AA2B7FE9BFB85EF6C2CFA0DD6739C3F6CA5F5A472EA787FD89F711C8D4F4E9D3CFEBEDED3DF8CC33CFC4C78693E24F7FFAD392F2C0B23B6C27DE769555A5185C70C1054DB78584335537DF7C7371F1C517D75EE4B17DFBF6E2965B6E695AAE2AC9A51898ABB492CB5C352A8FC79BEA856FD1A245F121FB940ADB6B38BBB929DE372073E56F9C97CC9C39F35078FED5C9543ED8DC551E545ECEF1B7D8AA1483FA73EB464B7C19B4CAC9A51898ABB492CB5C352A8FF75F288FCBC7EAC52FBC75553B84ED3494CD63613FE27D032681EEEEEE59BDBDBD074ED699CEE1339BBBCACC8CB79583AA1483C9925C8A81B94A2BB9CC55ACA3A3E3B67AF90B97D61F7FFCF1F8107E5285F5375E4A0FDB8FF7099844C299C8ABAEBAEAB5952B57BE36D617128517080D3F67F3951CCF6CD629066925976260AED24A2E7315EBE9E9995A1EA39FA817C0F0F656A7AA7486F596DB1B39A31AB61BB61FEF1330C994BF797EA6FC8D776D5F5FDF9E071F7C707FABEFD3592E37B87CF9F265E5C1646B9935613DF1BA73A218A4955C8A81B94A2BB9CCD568CAE3F4D965C23B888C9CE90C1F4D7A3285F5359ED91CDEDED9F1BE009358780BA3F2C0B07EC68C19AFCF9F3FFFC9818181A7B66CD9F2D2DEBD7BDF288F2307FFFEF7BF6FDBBC79F323BFFBDDEF56CE9933674DB9ECDEB07C4E6F7DF44E1483B4924B313057692597B93A91B20C9EDF583A43C20B7BC6FBEAF5F0FDD10B846A65336C2FDE07809AF0C940E581A2BFA3A3237C0EFAC30D07A7F0F5E1E1DBFB73F904A15629066925976260AED24A2E73F54E3AFF79A673E4F27A4838DB19DECA6AE7CE9D71977C4761F9F07DD159CDDA65F4B09D78DB00BC0BC520ADE4520CCC555AC965AEDE4D784EE5F00B89E2A258FB18CC65CB96158F3EFA68F1FCF3CF17FBF6EDAB95CBF035FC3DDC1EEE8F3EAEB29EE361BD9EB30930468A415AC9A51898ABB492CB5CB56AF82D9346DEA7739CD9E4AD8F00C64931482BB914037395567299ABF72ABC3773E73F3F0673E4B3D75B4C587E45F8FE789D008C81629056722906E62AADE4325763D5D3D3737A5920A7757474DC5A7E1D28F3429943C3E5327C0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015353030707C6868A8E9014ADA9FF2E7F072590C0EC73FA32A3257E924A7B902A0A2D6AF5FFFF2E0E060D38394B43F2FBEF8E2F2B2183C1CFF8CAAC85CA5939CE60A808A5AB76EDDE5F7DF7FFFEBBB77EFDEEB8CD4C4A4FC77DFBD7DFBF6FF2A4BC14B65BE1EFF8CAAC85C4D7C729C2B002A2C3C1885332065DE0ACFF592B627FCBB877FFFAC4A41F8EF19FEEF325713932CE70A000000000000000000000000000000000000000000008049ECFF0044CC9A9F56F1AEE90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57537', 1, '请假内部页面.bpmn', '57536', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F703832673669623822206E616D653D22E8AFB7E58187E58685E983A8E9A1B5E99DA2223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316930327970363C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3076656D6B307A22206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F316930327970363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F31793679786B373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316930327970362220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3076656D6B307A22202F3E0A202020203C757365725461736B2069643D2241637469766974795F3030356368697922206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31793679786B373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307764397534693C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31793679786B372220736F757263655265663D2241637469766974795F3076656D6B307A22207461726765745265663D2241637469766974795F3030356368697922202F3E0A202020203C656E644576656E742069643D224576656E745F3065393536746F223E0A2020202020203C696E636F6D696E673E466C6F775F307764397534693C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307764397534692220736F757263655265663D2241637469766974795F3030356368697922207461726765745265663D224576656E745F3065393536746F22202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7038326736696238223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F3076656D6B307A5F6469222062706D6E456C656D656E743D2241637469766974795F3076656D6B307A223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303035636869795F6469222062706D6E456C656D656E743D2241637469766974795F30303563686979223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F3065393536746F5F6469222062706D6E456C656D656E743D224576656E745F3065393536746F223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316930327970365F6469222062706D6E456C656D656E743D22466C6F775F31693032797036223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31793679786B375F6469222062706D6E456C656D656E743D22466C6F775F31793679786B37223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307764397534695F6469222062706D6E456C656D656E743D22466C6F775F30776439753469223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57538', 1, '请假内部页面.flow_p82g6ib8.png', '57536', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C80000136449444154785EEDDD5B8C55F5BD0770EAC3096D5FB4B7345AB51793DAA40FBEB6F6C1B69A3E54633D05E7426C67608C432BB6497BDA482407441F684C93DA634F306D1AA89C9073522CD88254072D5A40EBAD47A9228A28204E01455006CB659DF5DF9D3D67FBDF836E6760CF7FFDE7F349BE19D87BCD5A4BE6E7DADF596B5FA64C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080FF5714C5BF6CDBB6EDBF376EDCF88F818181E29E7BEE9136A7FC773FBE7EFDFA97D7AD5B7779FCF3A92A7335F1C971AE00A8A8B214FC4FF9A0540C0E0E16434343C55B6FBD256D4EF8770FFFFEF7DF7FFFEB6551F87AFC33AA227335F1C971AE00A8A870062A3C28C50F56D2FEECDEBD7B6F590C1E8E7F465564AED2494E7305404585CB9DCE40A591F073288BC1E1F8675445E62A9DE4345700545478AE57FC00251397F0F3887F465564AED24A2E73054045B55A0CDED8BFBBD8F6975F179BEFBDB196F0E7705BBC9C8C2FB9140373955672992B002AAA956270F0B55DC5536BE7157FFDC3BFBD2DE1B6705FBCBC8C3DB9140373955672992B002AAA9562B063F3AAA65250CFCECD77352D2F634F2EC5C05CA5955CE60A808A6AA5183C7DDFA2A642504FB82F5E5EC69E5C8A81B94A2BB9CC150015D54A3178EA9EF94D85A09E705FBCBC8C3DB9140373955672992B002A4A31482BB9140373955672992B002AAA9562105E3D1C17827AC27DF1F232F6E4520CCC555AC965AE00A8A8568AC1D63FFF475321A827DC172F2F634F2EC5C05CA5955CE60A808A6AA518ECDBF5BFC5537FFCF7A652106E0BF7C5CBCBD8934B313057692597B902A0A25A2906212F3CB2B4A91884DBE2E5647CC9A51898ABB492CB5C0150512D1583C3878BAD1BFEB3A91884DBC27D4DCBCB98934B313057692597B902A0A2DEAD18844F7C79F6CF3F6F2A05F584FB7C2ACCC94B2EC5C05CA5955CE60A808A3A6131387CB8D8BD755DF1E4DD739BCA409CB04C58D659A9F127976260AED24A2E730540458D560CDEEDECD389E2ACD4F8934B313057692597B902A0A2462B06AD9C7D3A51C2F7C6EB93D6934B313057692597B902A0A2462B06F183FD7B4DBC3E693DB9140373955672992B002A6AB4622013975C8A81B94A2BB9CCD558F5F4F49CDED9D939ADA3A3E3D6F2EB409917CA1C2A530C7F0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CCD57BD5D5D5754959205794796BB85CB69AB0FC8AF0FDF13A011803C520ADE4520CCC555AC965AE5A5516C52F948571D32845722CD914D6176F0380F74031482BB914037395567299AB77D3D3D333B5A3A3E3B6B2241E8F8BE3F7BFFFFD62D9B265C5A38F3E5A3CFFFCF3C5BE7DFB8A207C0D7F0FB787FBC372F1F786F585F586F5C7DB0418511E534EDBB871E3BF2E5DBAF48F0B162CD8FBE31FFF7868F6ECD9B503527F7FFF911FFEF08707CADB9E5BB870E12DBDBDBD67C7DF9F33C520ADE4520CCC555AC965AEDE49793C3FBBABABEBAF8D45B1BBBBBB58BC7871B173E7CE5AB96C55583E7C5FF8FEA8783E11B6136F1B98E4CAE3C6D4BBEFBEFBF679F3E6FDA3AFAFAFF8C52F7E516CDAB469D4DF6EC3EDE1FE59B3661D9B3367CEB6ABAFBEFA6BF1FA72A418A4955C8A81B94A2BB9CCD5899445F3FC32BB1ACBE1A2458B8A1D3B76BCBD49BE47E1FBC37AA2D2B9236C2FDE0760922A0BE477172E5C38142E8F6CDCB8B13876EC587C2C1955582E2C7FDD75D71DF9CE77BEF3584747C767E275E74431482BB914037395567299ABD10C9FD91C299BE1ACE4AA55ABE243FBB884F545673B7738D309935C796C78DFDAB56B975D73CD35C5EAD5AB8BA3478FC6C78E9684EF0BDFDFD3D3F346CEAF54540CD24A2EC5C05CA5955CE62A169E53D97819BDB7B7B778FCF1C7E3C3F94911D61BD6DF503A9FF09C4E98A4CA63C2FB56AC58F1D0ECD9B38B679E79263E5E8C49584F5F5FDFA1F2B7DB59F1F672A018A4955C8A81B94A2BB9CC556CF805422367364F55D9AC0BEB6F3CD319B61FEF13300984339BFDFDFDC5E0E0607C9C1897B0BEF237DB83575E79E5C5F136AB4E31482BB914037395567299AB46C36F7D74AC5EFEEEBAEBAEF8D07D4A84ED349CE53CE62D936092D9B061C37743D93C59673663E57A8F7FEB5BDF7A6DFAF4E9E7C5DBAE32C520ADE4520CCC555AC965AE1A7536BCCF6678614F3B452F24DA14EF1B90A9F2FFFFA937DD74D35078CEE5A9B472E5CAD7BABBBBEF8EB75F658A415AC9A51898ABB492CB5CD585AB4D8D97D2C7FB6AF4F72A6CAFF1D27A8E57BF8051AC59B366717835FA585F20D4AAB0FEBEBEBE3DE5C1E5CBF13E5495629056722906E62AADE43257759DFFFCB8CA5AD90BEF973911C2761BCE72AE88F711C84CF9FFFD6937DC70C33FC25B19B5C3830F3EB8BF3CB83C10EF475529066925976260AED24A2E73157477779FD1D9F0D9E8ED3EBB5917B6DB5038DF0AFB15EF2B90910D1B365C71F5D557B7FC3E9BE315B63363C68CFDD3A74F3F2BDE97949407C0FBCA5C14DF1E530CD24AEAC5C05C5533A9CF555D2BF355DE3FAD5EF4C295AD89147D0CE6B4785F818C2C59B2E49EF00941EDB460C182A73A3A3A66C7FB92928683E03B1EC01583B4927A313057D54CEA7355D7CA7C95B7FFBCBEDC1D77DC111F9EDB2A6CBF619F7F1EEF2B9091850B17EE69D7E5F4BA7BEFBD777367E2CFD9693808BEE3015C31482BA917037355CDA43E5775ADCC575757D7BAFAFD8F3CF2487C786EABB0FDFABE84FD6ADC4F20333FFAD18F86B66DDB161F074EA92D5BB66C2F0F307F89F72525A31CB8473D802B066925F56230CA3C99AB0A24F5B9AA1B65AE9AE6ABFCFA52FDF6761FFB6361FB0DFBF852F49F03E4A4BFBFFFF8ABAFBE1A1F074EA97DFBF61D2C0F2EBBE27D49C92807EC38B50378158AC1B3CF3E5B7B827E7C7B631E7AE8A1A6DB1E78E081E2C081034DB7A79CD48BC1287314C75C2598D4E7AA6E94798A13E6EBCDFADFDB7DEC8F85EDD7F7A5ABABEB40FCDF0364E4AAABAE2A8E1C39121F074EA9727B074639105632A9168370207FF3CD376B7FDEBA756BF1894F7CA2D8BF7FFFC8FD4343436F5BFEC20B2F2CC27379C3A780841791854270F9E5971737DC7043D3BAC3FA9E7BEEB9A6DB5348FCF3A96A26E35C85CBABAB56AD2AF6EEDDDB74DF4427FEF9E492761FFB6361FB0DFB73347E7C023272CD35D71C69F76FB97BF6EC79AEB3BA6738EFEBACC0A5CF050B1614D3A64D0BEF7B5ACC9A352B9C9D29BEFDED6F173367CE0C1F335A7CEE739F2B9E78E28991E52FBAE8A2E2BEFBEEAB3DE05F7AE9A5B5DBA64F9F5EDC79E79DB5B358070F1EAC95CC193366141FF9C8478ADFFCE6374DDB4C21A99F891A659E26FD5C85DBE6CF9F5F5B57C8A73FFDE95AB18DB73D91497DAEEA4699ABA6F90A6712EBB7B7FBD81F73861326911FFCE00707DAFD3C9EBFFDED6F8F7456EF399C6F2B0475A916834F7DEA53E1DF79E4EF1FFAD087468AC0ADB7DE5ACC9B37AFD8B56B57AD0884334F679D755671FEF9E717E79D775EF18D6F7CA356044231F8ED6F7F5B7CE52B5FA99589279F7CB2F8D297BE542B050AE7D898ABE6B90ADF7BC6196714EBD6AD2B0606066AF3B572E5CAA66D4F64529FABBA56E6ABD3733881893077EEDC67DBFD2AF53BEFBC735567755EA5DE74C06E946A3178E595578AAF7EF5ABB507FD900F7CE003237FFEE4273F397249FCD0A143B51270C9259714EBD7AFAF5DFA3CF7DC738B73CE39A7F8F0873F5C7CFEF39F2FAEBFFEFAE2F5D75F1F59F7148573CCCCD5E873D5DFDF5F3CF6D863E1F9DDB5F90ACFF38CB73D91497DAEEA5A992FAF520726C482050B6E69F7FB705E7BEDB5AB2BF03E9C273C60374AB518847CF4A31F1D79BEDD99679E3972FBC73EF6B1B72DF7C61B6F145FFCE2176B973FBFF9CD6F16575C7145EDF67026EA97BFFC65D37AA7289C6366AE4E3C5721E12C69FDD27B4A497DAEEA5A99AF4EEFC3094C84DEDEDEB3FBFAFA8EB5F193865E290F2C7B52FFA4A156A55C0C3EFEF18F173D3D3DB5CB96E14C54F85AFF737D995FFDEA57B50271FAE9A7176BD7AE2DD6AC59F3B662109E6B17AF778AC279CA4DC6B90A6742BBBBBB937C057B2E73157426F44943DFFBDEF78E37144E9F3404B99B3367CE0BEDBAACBE7CF9F23B3A7D967A5B122E5D86177784CB9D1FFCE007472E7D4E9D3AB576C9332C33383858FCFEF7BF1FB9F4395A3178FAE9A78BA54B978EAC778AC279CA4DB6B90A7F2E8F43B5EF0F9759477B3BA5894C2E7315F82C7560C2940F165FBBEEBAEB8E1C3D7A343E269C54E5FA77940796AD575E79E597E37DA8AA948BC14F7EF293E2F0E1C3B53F87B352F5DB7FF6B39F35BD7D4D6331B8ECB2CB8A9B6EBAA978FFFBDF5FAC58B1A2F62AE3B973E7D69EBF77DB6DB7D50A67575757B161C386A66D4E747229069369AEC272E195EF4B962CA9FD22135E4C145E3C146F772293CB5CD595C7E115F5B2B778F1E2F850DD1661BB0D8533E9E7F40327D1B5D75EFBD8EAD5AB8FC7078593E878F940F5EBF2C0B23ADE7695A55C0C1A132E6FC6B7856CD9B2A5F8E94F7F5A7CF6B39FAD15C8DB6FBFBD38EDB4D36A0F0637DE7863ED397AE195C6E15267B87FCAF05BD78484B35AF1FA263AB91483C9345761F9290D731512BE3F5EE7442697B9AA2B7FE9BFB85EF6C2CFA0DD6739C3F6CA5F5A472EA787FD89F711C8D4F4E9D3CFEBEDED3DF8CC33CFC4C78693E24F7FFAD392F2C0B23B6C27DE769555A5185C70C1054DB78584335537DF7C7371F1C517D75EE4B17DFBF6E2965B6E695AAE2AC9A51898ABB492CB5C352A8FC79BEA856FD1A245F121FB940ADB6B38BBB929DE372073E56F9C97CC9C39F35078FED5C9543ED8DC551E545ECEF1B7D8AA1483FA73EB464B7C19B4CAC9A51898ABB492CB5C352A8FF75F288FCBC7EAC52FBC75553B84ED3494CD63613FE27D032681EEEEEE59BDBDBD074ED699CEE1339BBBCACC8CB79583AA1483C9925C8A81B94A2BB9CC55ACA3A3E3B67AF90B97D61F7FFCF1F8107E5285F5375E4A0FDB8FF7099844C299C8ABAEBAEAB5952B57BE36D617128517080D3F67F3951CCF6CD629066925976260AED24A2E7315EBE9E9995A1EA39FA817C0F0F656A7AA7486F596DB1B39A31AB61BB61FEF1330C994BF797EA6FC8D776D5F5FDF9E071F7C707FABEFD3592E37B87CF9F265E5C1646B9935613DF1BA73A218A4955C8A81B94A2BB9CCD568CAE3F4D965C23B888C9CE90C1F4D7A3285F5359ED91CDEDED9F1BE009358780BA3F2C0B07EC68C19AFCF9F3FFFC9818181A7B66CD9F2D2DEBD7BDF288F2307FFFEF7BF6FDBBC79F323BFFBDDEF56CE9933674DB9ECDEB07C4E6F7DF44E1483B4924B313057692597B93A91B20C9EDF583A43C20B7BC6FBEAF5F0FDD10B846A65336C2FDE07809AF0C940E581A2BFA3A3237C0EFAC30D07A7F0F5E1E1DBFB73F904A15629066925976260AED24A2E73F54E3AFF79A673E4F27A4838DB19DECA6AE7CE9D71977C4761F9F07DD159CDDA65F4B09D78DB00BC0BC520ADE4520CCC555AC965AEDE4D784EE5F00B89E2A258FB18CC65CB96158F3EFA68F1FCF3CF17FBF6EDAB95CBF035FC3DDC1EEE8F3EAEB29EE361BD9EB30930468A415AC9A51898ABB492CB5CB56AF82D9346DEA7739CD9E4AD8F00C64931482BB914037395567299ABF72ABC3773E73F3F0673E4B3D75B4C587E45F8FE789D008C81629056722906E62AADE4325763D5D3D3737A5920A7757474DC5A7E1D28F3429943C3E5327C0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015353030707C6868A8E9014ADA9FF2E7F072590C0EC73FA32A3257E924A7B902A0A2D6AF5FFFF2E0E060D38394B43F2FBEF8E2F2B2183C1CFF8CAAC85CA5939CE60A808A5AB76EDDE5F7DF7FFFEBBB77EFDEEB8CD4C4A4FC77DFBD7DFBF6FF2A4BC14B65BE1EFF8CAAC85C4D7C729C2B002A2C3C1885332065DE0ACFF592B627FCBB877FFFAC4A41F8EF19FEEF325713932CE70A000000000000000000000000000000000000000000008049ECFF0044CC9A9F56F1AEE90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57542', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57544', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57547', 1, 'var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57549', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57560', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57562', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57565', 1, 'var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57567', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323278, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57578', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57580', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57583', 1, 'var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57585', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57598', 1, 'var-_rawValue', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000374000D6170706C6963616E744E616D65740006E8AFB7E997AE7400096C6561766554797065740008706572736F6E616C7400067461736B49647400007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57600', 1, 'hist.var-_rawValue', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000374000D6170706C6963616E744E616D65740006E8AFB7E997AE7400096C6561766554797065740008706572736F6E616C7400067461736B49647400007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57601', 1, 'var-_value', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000374000D6170706C6963616E744E616D65740006E8AFB7E997AE7400096C6561766554797065740008706572736F6E616C7400067461736B49647400007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57603', 1, 'hist.var-_value', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000374000D6170706C6963616E744E616D65740006E8AFB7E997AE7400096C6561766554797065740008706572736F6E616C7400067461736B49647400007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57636', 1, '请假外部页面.bpmn', '57635', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22E8AFB7E58187E5A496E983A8E9A1B5E99DA22220666C6F7761626C653A70726F6365737343617465676F72793D226C65617665223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F313437336769373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C757365725461736B2069643D2241637469766974795F306C7075367A6122206E616D653D22E5AEA1E689B9322220666C6F7761626C653A75736572547970653D2261737369676E6565223E0A2020202020203C696E636F6D696E673E466C6F775F313437336769373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F313870756B39313C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F313437336769372220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D2241637469766974795F306C7075367A6122202F3E0A202020203C656E644576656E742069643D224576656E745F3167636431387022206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F313870756B39313C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F313870756B39312220736F757263655265663D2241637469766974795F306C7075367A6122207461726765745265663D224576656E745F3167636431387022202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F306C7075367A615F6469222062706D6E456C656D656E743D2241637469766974795F306C7075367A61223E0A20202020202020203C6F6D6764633A426F756E647320783D223137302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F316763643138705F6469222062706D6E456C656D656E743D224576656E745F31676364313870223E0A20202020202020203C6F6D6764633A426F756E647320783D223333322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223333392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F313437336769375F6469222062706D6E456C656D656E743D22466C6F775F31343733676937223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F313870756B39315F6469222062706D6E456C656D656E743D22466C6F775F313870756B3931223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223333322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57637', 1, '请假外部页面.flow_rmnt89qb.png', '57635', 0x89504E470D0A1A0A0000000D49484452000001C5000000C808060000009928FAEE0000118249444154785EEDDD7D6C5475BEC771963F6E50FFC1C718159F96444CFCC37F57FDC355C9FEB11AF4DADAA9046DA184E25234D1AB91402E15FC03434CC48B371ACD06941BB21BAB059787C516AC6CA92E4FBB80521E2A0A582A451EA520B6BFFBFB1E7B26C3EF37C0F469E637E7FB7E259FB43D73E69CD3996FBFBF3967CE9C0E1B0600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0A032C6FC475B5BDB5F366CD8F07343438359B3660DC973ECE3DED3D4D4F47D6363E338F7F9493AEAAFF0D15C7F80C736A4BFDA3F08D3D1D161BABABACCD9B367499E238FBB3CFEEBD6AD3B6E9BD41FDDE728C9A8BFC24773FD011E79852E7F10EE1F0AC97FDADBDB3B6D53FAD27D8E928CFA0B271AEB0FF0C8212B5EA18711791E6C533AE33E474946FD85138DF50778E43D05F78F83142EF27CB8CF5192517F61455BFD019E5C9BD2A963EDA6ED9F7F363B3E7D258A7C2FD3DCF9C8C0A2AD29517F61455BFD019E5C9AD2C9A307CDF6D5B3CCBFFEF65FE745A6C96DEEFCA4FFD1D694A8BFB0A2ADFE004F2E4D69FF8E655E438A7360C7726F7ED2FF686B4AD45F58D1567F802797A6F4F5DA795E338A23B7B9F393FE475B53A2FEC28AB6FA033CB934A5ED6B667BCD288EDCE6CE4FFA1F6D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF5077872694A72B69FDB8CE2C86DEEFCA4FFD1D694A8BFB0A2ADFE004F2E4D69F73FFEC76B4671E436777ED2FF686B4AD45F58D1567F802797A674E4E0BFCDF6BFFFB7D790649ADCE6CE4FFA1F6D4D89FA0B2BDAEA0FF0E4D29424DF6C5CEC352599E6CE4706166D4D89FA0B2BDAEA0FF0E4D494CE9C31BB9BFFD76B4A324D6EF3E627FD8EB6A644FD85156DF507782ED594E48A21BBFEF1A6D790E2C86D5C5564F0A2AD29517F61455BFD019E0B3625FB0ABC7D77A3D9B66A86D788DCC83C322FAFDA071E6D4D89FA0B2BDAEA0FF0646B4A977A757EA1F0AA7DE0D1D694A8BFB0A2ADFE004FB6A694CBABF30B45EEEB2E8FE41E6D4D89FA0B2BDAEA0FF0646B4A6EA3E96BDCE591DCA3AD29517F61455BFD019E6C4D89142EDA9A12F51756B4D55F7F5554548C4CA552256565650BECD7069B6F6C4EDB98DEAFF27343EFED2532BFBB0C048AA61456B43525EA2FAC68ABBFBE2A2F2F1F6B07B93A9BB3BD0360AE91F9EBE4FEEE3211189A5258D1D694A8BFB0A2ADFE726507B3DFD941AD25CB60D79FB4C8F2DC75201034A5B0A2AD29517F61455BFD5D4A4545C588B2B2B2857620EB7107B7E79E7BCE2C59B2C46CDAB4C9ECDDBBD71C3972C408F92A3FCB74B95DE673EF2BCB93E5CAF2DD750E3ABB4DC3376CD8F09F8B172FFE7B6D6D6DE74B2FBDD43575EAD4E817AAAEAE3EF7C20B2F9CB0D3F6CC9933677E6565E528F7FEDAD094C28AB6A644FD85156DF5773176CC1865F7E8FE9539983DF9E493E6EDB7DF36070E1C8806C05CC9FC723FB9BF33386E95F5B8EB1E1476BD2356AD5AF5CEAC59B37EAEAAAA326FBDF596696969C93A82CB74B97DD2A449DD3535356D93274FFE83BB3C2D684A61455B53A2FEC28AB6FABB103B188EB139983980CD9B37CFECDFBFFFFCD1AE8FE4FEB21C6760DC2FEB73B76140EC20F727BBE7D725BBA9762FD1747777BBDB9295CC27F34F9F3EFDDC33CF3CB3D9EECEFED65D76D2D194C28AB6A644FD85156DF5974DEF1E627A4094BDBB65CB96B9C3C780C8F29CBDC6FD83B2C76897FD9BD5AB572F9932658A59B16285F9E5975FDC75E744EE27F7AFA8A838A5EDEC209A5258D1D694A8BFB0A2ADFE5CF21E5FE621D3CACA4AB365CB1677C81814B25C597EC6C0B87540EF31DA65FEA6AEAEEE8BA953A79A9D3B77BAEBEB17594E5555D5693B824F72D7975434A5B0A2AD29517F61455BFDB97A4FAA49EF210ED5801893E567EE31CAFADD6DCA99EC215657579B8E8E0E773D0322CBB3A3F7C9279E78E221779D4944530A2BDA9A12F51756B4D55FA6DE8F5D74C703D4F2E5CBDDE16148C87A32F616BBFBF5718DE6E6E63FC98038587B882EBBDC9EA79E7AEA686969E96877DD4943530A2BDA9A12F51756B4D55FA654C6E710E564987C724EBE6971B7EDA2ECFD47CC9D3BB74BDE031C4AF5F5F547ED6EED2A77FD4943530A2BDA9A12F51756B4D55F4C8E0C661E361DE859A67D25EBCB3C8CDAA723952B57AE7C5BCE32EDEF4935B992E55755551DB61BF77B771B9284A61456B43525EA2FAC68ABBF58EAD74BB74503927C9EB01064BD197B8B75EE366665EF377CE6CC993FCBC728F261FDFAF5C7ECC67DEE6E4792D094C28AB6A644FD85156DF527EC1EDA95A98C6B99E67B2F3126EBCD1814CFCA76B9DBEA696E6E7E6CF2E4C9397F0E71A0643DE3C78F3F565A5A7AA3BB2DA1B30FEA5A9BFBDDE92E9A5258494A53A2FE8A3349A9BF582E75686F2F890723390A5948CE25E14ADC6DF52C5AB4688D5C89269F6A6B6BB79795954D75B72574190FEC458B82A6145692D294A8BFE24C52EA2F964B1DDAE96FC6F37DF0C107EE109057B2FE8C6D7ED3DD56CF9C39730EE7EBD069ECD34F3FDD91CAF5F86E40321ED88B16054D29AC24A529517FC599A4D45F2C973A2C2F2F6F8C6FDFB871A33B04E495AC3FDE16D9AECCEDCCEAC5175FEC6A6B6B739733A45A5B5BF7D90DFCA7BB2DA1CB520C598B82A6145692D294B2D41DF55704494AFDC5B2D49F5787F6EB77F1F47C8F2F2E597FC6367EE7FC3ABEEAEAEA9E1F7FFCD15DCE903A72E4C849BB7107DD6D095D9622701315453134A55DBB76456F42BBD333F3C5175F78D33EFFFC7373E2C4096F7AC8494A53CA526F6EA8BF009394FA8B65A93B3752873FC53FE77B7C71C9FAE36DB17B8A27DCDFC73361C20473EEDC39773943CAAEEF449607323109B5294971FCF4D34FD1F7BB77EF3637DD74933976EC58FAF6AEAEAEF3E6BFF7DE7BA3FF7C2257879093B1A4198D1B37CECC9C39D35BB62C6FCF9E3DDEF410E23E3F498FC6FA9343647241E8CECE4EEFB642C77D7EB425DFE38B4BD69FB13DBFB863A067CA9429E7F23D921F3E7C784F2A597B8A6B534570F8AAB6B6D6949494C86745E55F7CC9AB57F3F4D34F9B8913274617D1BDF3CE3BCDD6AD5BD3F3DF7FFFFD66EDDAB551B379F8E187A369A5A5A5E6A38F3E8A5EE59F3C79321A08C78F1F6FAEB9E61AF3FEFBEF7BEB0C214979A59EA5EED4D79F4C9B3D7B76B42CC9EDB7DF1E0DBEEEBA0B99A4D45F2C4BFD7975287B64F1F47C8F2FAE3EEF293EFFFCF327F27DCCF7ABAFBEDA984AC67B8AE735A358A84DE9B6DB6E93C73EFDF355575D956E420B162C30B366CD32070F1E8C9A90BC32BFF1C61BCD983163CCE8D1A3CDA38F3E1A3521694A1F7EF8A179E08107A246B66DDB3673DF7DF7450D89417168517F7EFDC97DAFBCF24AD3D8D8681A1A1AA23AACAFAFF7D65DC824A5FE62B9D461AA98DF539C3163C6AE7C9F7D6A5FE92D4B15F7D9A75E11640AB5291D3A74C83CF8E08351C3915C7EF9E5E9EF6FBDF5D6F4E1CFD3A74F470D68ECD8B1A6A9A9293A7C75CB2DB7989B6FBED95C7DF5D5E6AEBBEE322FBFFCB2397EFC787AD9C31814871CF597BDFEE49ACD9B376F8EFEE1B9FDF5A3F71DDD75173249A9BF582E7558D4679FD6D6D6CECFF7E714A74D9BB6A2483FA778C122C8146A53925C7BEDB5E9F7756EB8E186F4F4EBAEBBEEBCF94E9D3A65EEB9E79EE810D6E38F3F6E1E7BECB168BABC527FF7DD77BDE50E63501C72D4DF85EB4F227B9BF161D6909294FA8BE55287A962FE9C626565E5A8AAAAAAEE3C5ED1E690DDB0C3C578459B5C85DC94AEBFFE7AF9C7CFD1A12779A52E5FE3EFE379DE7BEFBDA8798D1C39D2AC5EBDDAAC5CB9F2BCA624EFE9B8CB1DC6A0180C8DF5277B9472F1E710CF4CD5567F2215D0156D9E7DF6D99E8C41F1D257B411353535DFE4EB10EAD2A54B3F4871EDD382450E3FC9890E72C8EA8A2BAE481FBE1A31624474D84AE691FF7FF9C9279FA40F5F656B4A5F7FFDB559BC78717AB9C3181483A1ADFEE47BDBC3A2FBCBA1B26C1FE52864B4D59F28EA6B9F0A5B947F983E7DFAB93CFC978CFD76C376F35F320A97D75E7BCD9C397326FA5E5EB5C7D3DF78E30DEF94F8CCA6F4C8238F98B973E79ACB2EBBCCD4D5D5456705CE9831237A9F68E1C285D1A0585E5E6E9A9B9BBD75163ADA9A92A6FA93F9E48CD6458B16452FCAE4041C39E1C65D6F21A3ADFE62A962FD2F19B169D3A66D5EB162458FBBD041D463FF20FE6C376C85BBEEA409B92965460E51B9D324ADADADE6F5D75F3777DC714734C8BDF3CE3B66F8F0E15181BDF2CA2BD17B417266A01CAE92DB87F59E0E2F9157FDEEF20A1D6D4D4953FDC9FCC332EA4F22F7779759C868ABBF5808FF4FD1BE504F1F3AEDD3FF5314A5A5A5A32B2B2B4FEEDCB9D35DF6A0F8ECB3CF16D90D6B97F5B8EB4E9A62694A77DF7DB7374D22AFE45F7DF555F3D0430F45273CECDBB7CFCC9F3FDF9BAF58A2AD29517F61455BFD65B23DBF251E94E6CD9BE70E0B434AD697B197D8E26E5B4EECA83A76E2C489A7E598FE60B245BDDC6ED4F77D1EA98B54B134A5F83D9C6C710F651573B43525EA2FAC68ABBF4C764CF99DEDFDDDF1E0241FAFC907594FC680D82DDBE16E5BCEEC6EEE24BBC77862B0F6187BF7100FDA4C74D79554C5D294B4445B53A2FEC28AB6FA739595952D8C0728398CBA65CB1677981854B2FCCCC3A6B27E779BFA4CF6E8264C9870B4BEBEFE687F4FBE91936A7ADF433CA4650F3146530A2BDA9A12F51756B4D59FABA2A262841D07B6C683947C0467A8064659AE5D5F7ACF54D62BEB77B7A95FECE8FA5B3BAAAFAEAAAA3ABC7EFDFA63B97E8ED1CED7B174E9D225766376DBAC94E5B8CB4E3A9A5258D1D694A8BFB0A2ADFEB2B163C1281BF9F4417A8F512EE737986479997B88BDEB1BE56ECB80C9C727EC829BC68F1F7F7CF6ECD9DB1A1A1AB6B7B6B67ED7D9D979CA6EC7C91F7EF8A16DC78E1D1B3FFEF8E3FA9A9A9A9576DE4E993FE91FBBB8189A5258D1D694A8BFB0A2ADFE2EC40E5863320746899C0C33D0B352E5FECE4935D18028EB73B76150C91568EC8AAAED9E9F5CB7F4CB8C5F4EBE7ED93BBD3AC957AAC9154D29AC686B4AD45F58D1567F1793FA758F317D2855227B8DF2719B03070EB8E3DD45C9FC723F67EF303A642AEB71D78D02A22985156D4D89FA0B2BDAEAEF52E43DBEDE936FDCC12CBA24DC92254BCCA64D9BCCDEBD7BA38BBC0BF92A3FCB74B9DDB9745B9C1E59EEA0BD8788C143530A2BDA9A12F51756B4D55FAE7A3FAE91FE1CE300D332A08F5D6068D194C28AB6A644FD85156DF5D757F2F9F8D4AF97844B5F2B35C7C8FC75727F7799080C4D29AC686B4AD45F58D1567FFD55515131D20E72256565650BECD7069B6F6C4EF70E80F2557E6EE8BDBD44E677978140D194C28AB6A644FD85156DF50778684A61455B53A2FEC28AB6FA033C34A5B0A2AD29517F61455BFD011E9A5258D1D694A8BFB0A2ADFE000F4D29AC686B4AD45F58D1567F8087A61456B43525EA2FAC68AB3FC043530A2BDA9A12F51756B4D51FE0A12985156D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF50778684A61455B53A2FEC28AB6FA033C34A5B0A2AD29517F61455BFD011E9A5258D1D694A8BFB0A2ADFE000F4D29AC686B4AD45F58D1567F8087A61456B43525EA2FAC68AB3FC043530A2BDA9A12F51756B4D51FE0A12985156D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF507781A1A1A7ABABABABC3F0E92FFD8E7E17BDB94CEB8CF5192517FE14463FD019EA6A6A6EF3B3A3ABC3F1092FF7CFBEDB74B6D53FAD27D8E928CFA0B271AEB0FF03436368E5BB76EDDF1F6F6F64E5EB11726F6716FDFB76FDFFFD986F49DCD1FDDE728C9A8BFC24773FD0159C91F82BC42B4392BEF2990BC471E7779FC553624F9BD7B7F7FEAAF30515D7F000000000000000000000000000000000000000000000040B1FF079115CD4ECEA559100000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57640', 1, '请假外部页面.bpmn', '57639', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22E8AFB7E58187E5A496E983A8E9A1B5E99DA22220666C6F7761626C653A70726F6365737343617465676F72793D226C65617665223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C657874656E73696F6E456C656D656E74733E0A20202020202020203C666C6F7761626C653A70726F706572746965733E0A202020202020202020203C666C6F7761626C653A70726F7065727479206E616D653D22696E69746961746F725F335F32222076616C75653D22E699AEE9809AE8A792E889B222202F3E0A20202020202020203C2F666C6F7761626C653A70726F706572746965733E0A2020202020203C2F657874656E73696F6E456C656D656E74733E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F313437336769373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C757365725461736B2069643D2241637469766974795F306C7075367A6122206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F313437336769373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F313870756B39313C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F313437336769372220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D2241637469766974795F306C7075367A6122202F3E0A202020203C656E644576656E742069643D224576656E745F3167636431387022206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F313870756B39313C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F313870756B39312220736F757263655265663D2241637469766974795F306C7075367A6122207461726765745265663D224576656E745F3167636431387022202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F306C7075367A615F6469222062706D6E456C656D656E743D2241637469766974795F306C7075367A61223E0A20202020202020203C6F6D6764633A426F756E647320783D223137302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F316763643138705F6469222062706D6E456C656D656E743D224576656E745F31676364313870223E0A20202020202020203C6F6D6764633A426F756E647320783D223333322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223333392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F313437336769375F6469222062706D6E456C656D656E743D22466C6F775F31343733676937223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F313870756B39315F6469222062706D6E456C656D656E743D22466C6F775F313870756B3931223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223333322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57641', 1, '请假外部页面.flow_rmnt89qb.png', '57639', 0x89504E470D0A1A0A0000000D49484452000001C5000000C808060000009928FAEE0000118249444154785EEDDD7D6C5475BEC771963F6E50FFC1C718159F96444CFCC37F57FDC355C9FEB11AF4DADAA9046DA184E25234D1AB91402E15FC03434CC48B371ACD06941BB21BAB059787C516AC6CA92E4FBB80521E2A0A582A451EA520B6BFFBFB1E7B26C3EF37C0F469E637E7FB7E259FB43D73E69CD3996FBFBF3967CE9C0E1B0600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0A032C6FC475B5BDB5F366CD8F07343438359B3660DC973ECE3DED3D4D4F47D6363E338F7F9493AEAAFF0D15C7F80C736A4BFDA3F08D3D1D161BABABACCD9B367499E238FBB3CFEEBD6AD3B6E9BD41FDDE728C9A8BFC24773FD011E79852E7F10EE1F0AC97FDADBDB3B6D53FAD27D8E928CFA0B271AEB0FF0C8212B5EA18711791E6C533AE33E474946FD85138DF50778E43D05F78F83142EF27CB8CF5192517F61455BFD019E5C9BD2A963EDA6ED9F7F363B3E7D258A7C2FD3DCF9C8C0A2AD29517F61455BFD019E5C9AD2C9A307CDF6D5B3CCBFFEF65FE745A6C96DEEFCA4FFD1D694A8BFB0A2ADFE004F2E4D69FF8E655E438A7360C7726F7ED2FF686B4AD45F58D1567F802797A6F4F5DA795E338A23B7B9F393FE475B53A2FEC28AB6FA033CB934A5ED6B667BCD288EDCE6CE4FFA1F6D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF5077872694A72B69FDB8CE2C86DEEFCA4FFD1D694A8BFB0A2ADFE004F2E4D69F73FFEC76B4671E436777ED2FF686B4AD45F58D1567F802797A674E4E0BFCDF6BFFFB7D790649ADCE6CE4FFA1F6D4D89FA0B2BDAEA0FF0E4D29424DF6C5CEC352599E6CE4706166D4D89FA0B2BDAEA0FF0E4D494CE9C31BB9BFFD76B4A324D6EF3E627FD8EB6A644FD85156DF507782ED594E48A21BBFEF1A6D790E2C86D5C5564F0A2AD29517F61455BFD019E0B3625FB0ABC7D77A3D9B66A86D788DCC83C322FAFDA071E6D4D89FA0B2BDAEA0FF0646B4A977A757EA1F0AA7DE0D1D694A8BFB0A2ADFE004FB6A694CBABF30B45EEEB2E8FE41E6D4D89FA0B2BDAEA0FF0646B4A6EA3E96BDCE591DCA3AD29517F61455BFD019E6C4D89142EDA9A12F51756B4D55F7F5554548C4CA552256565650BECD7069B6F6C4EDB98DEAFF27343EFED2532BFBB0C048AA61456B43525EA2FAC68ABBFBE2A2F2F1F6B07B93A9BB3BD0360AE91F9EBE4FEEE3211189A5258D1D694A8BFB0A2ADFE726507B3DFD941AD25CB60D79FB4C8F2DC75201034A5B0A2AD29517F61455BFD5D4A4545C588B2B2B2857620EB7107B7E79E7BCE2C59B2C46CDAB4C9ECDDBBD71C3972C408F92A3FCB74B95DE673EF2BCB93E5CAF2DD750E3ABB4DC3376CD8F09F8B172FFE7B6D6D6DE74B2FBDD43575EAD4E817AAAEAE3EF7C20B2F9CB0D3F6CC9933677E6565E528F7FEDAD094C28AB6A644FD85156DF5773176CC1865F7E8FE9539983DF9E493E6EDB7DF36070E1C8806C05CC9FC723FB9BF33386E95F5B8EB1E1476BD2356AD5AF5CEAC59B37EAEAAAA326FBDF596696969C93A82CB74B97DD2A449DD3535356D93274FFE83BB3C2D684A61455B53A2FEC28AB6FABB103B188EB139983980CD9B37CFECDFBFFFFCD1AE8FE4FEB21C6760DC2FEB73B76140EC20F727BBE7D725BBA9762FD1747777BBDB9295CC27F34F9F3EFDDC33CF3CB3D9EECEFED65D76D2D194C28AB6A644FD85156DF5974DEF1E627A4094BDBB65CB96B9C3C780C8F29CBDC6FD83B2C76897FD9BD5AB572F9932658A59B16285F9E5975FDC75E744EE27F7AFA8A838A5EDEC209A5258D1D694A8BFB0A2ADFE5CF21E5FE621D3CACA4AB365CB1677C81814B25C597EC6C0B87540EF31DA65FEA6AEAEEE8BA953A79A9D3B77BAEBEB17594E5555D5693B824F72D7975434A5B0A2AD29517F61455BFDB97A4FAA49EF210ED5801893E567EE31CAFADD6DCA99EC215657579B8E8E0E773D0322CBB3A3F7C9279E78E221779D4944530A2BDA9A12F51756B4D55FA6DE8F5D74C703D4F2E5CBDDE16148C87A32F616BBFBF5718DE6E6E63FC98038587B882EBBDC9EA79E7AEA686969E96877DD4943530A2BDA9A12F51756B4D55FA654C6E710E564987C724EBE6971B7EDA2ECFD47CC9D3BB74BDE031C4AF5F5F547ED6EED2A77FD4943530A2BDA9A12F51756B4D55F4C8E0C661E361DE859A67D25EBCB3C8CDAA723952B57AE7C5BCE32EDEF4935B992E55755551DB61BF77B771B9284A61456B43525EA2FAC68ABBF58EAD74BB74503927C9EB01064BD197B8B75EE366665EF377CE6CC993FCBC728F261FDFAF5C7ECC67DEE6E4792D094C28AB6A644FD85156DF527EC1EDA95A98C6B99E67B2F3126EBCD1814CFCA76B9DBEA696E6E7E6CF2E4C9397F0E71A0643DE3C78F3F565A5A7AA3BB2DA1B30FEA5A9BFBDDE92E9A5258494A53A2FE8A3349A9BF582E75686F2F890723390A5948CE25E14ADC6DF52C5AB4688D5C89269F6A6B6BB79795954D75B72574190FEC458B82A6145692D294A8BFE24C52EA2F964B1DDAE96FC6F37DF0C107EE109057B2FE8C6D7ED3DD56CF9C39730EE7EBD069ECD34F3FDD91CAF5F86E40321ED88B16054D29AC24A529517FC599A4D45F2C973A2C2F2F6F8C6FDFB871A33B04E495AC3FDE16D9AECCEDCCEAC5175FEC6A6B6B739733A45A5B5BF7D90DFCA7BB2DA1CB520C598B82A6145692D294B2D41DF55704494AFDC5B2D49F5787F6EB77F1F47C8F2F2E597FC6367EE7FC3ABEEAEAEA9E1F7FFCD15DCE903A72E4C849BB7107DD6D095D9622701315453134A55DBB76456F42BBD333F3C5175F78D33EFFFC7373E2C4096F7AC8494A53CA526F6EA8BF009394FA8B65A93B3752873FC53FE77B7C71C9FAE36DB17B8A27DCDFC73361C20473EEDC39773943CAAEEF449607323109B5294971FCF4D34FD1F7BB77EF3637DD74933976EC58FAF6AEAEAEF3E6BFF7DE7BA3FF7C2257879093B1A4198D1B37CECC9C39D35BB62C6FCF9E3DDEF410E23E3F498FC6FA9343647241E8CECE4EEFB642C77D7EB425DFE38B4BD69FB13DBFB863A067CA9429E7F23D921F3E7C784F2A597B8A6B534570F8AAB6B6D6949494C86745E55F7CC9AB57F3F4D34F9B8913274617D1BDF3CE3BCDD6AD5BD3F3DF7FFFFD66EDDAB551B379F8E187A369A5A5A5E6A38F3E8A5EE59F3C79321A08C78F1F6FAEB9E61AF3FEFBEF7BEB0C214979A59EA5EED4D79F4C9B3D7B76B42CC9EDB7DF1E0DBEEEBA0B99A4D45F2C4BFD7975287B64F1F47C8F2FAE3EEF293EFFFCF327F27DCCF7ABAFBEDA984AC67B8AE735A358A84DE9B6DB6E93C73EFDF355575D956E420B162C30B366CD32070F1E8C9A90BC32BFF1C61BCD983163CCE8D1A3CDA38F3E1A3521694A1F7EF8A179E08107A246B66DDB3673DF7DF7450D89417168517F7EFDC97DAFBCF24AD3D8D8681A1A1AA23AACAFAFF7D65DC824A5FE62B9D461AA98DF539C3163C6AE7C9F7D6A5FE92D4B15F7D9A75E11640AB5291D3A74C83CF8E08351C3915C7EF9E5E9EF6FBDF5D6F4E1CFD3A74F470D68ECD8B1A6A9A9293A7C75CB2DB7989B6FBED95C7DF5D5E6AEBBEE322FBFFCB2397EFC787AD9C31814871CF597BDFEE49ACD9B376F8EFEE1B9FDF5A3F71DDD75173249A9BF582E7558D4679FD6D6D6CECFF7E714A74D9BB6A2483FA778C122C8146A53925C7BEDB5E9F7756EB8E186F4F4EBAEBBEEBCF94E9D3A65EEB9E79EE810D6E38F3F6E1E7BECB168BABC527FF7DD77BDE50E63501C72D4DF85EB4F227B9BF161D6909294FA8BE55287A962FE9C626565E5A8AAAAAAEE3C5ED1E690DDB0C3C578459B5C85DC94AEBFFE7AF9C7CFD1A12779A52E5FE3EFE379DE7BEFBDA8798D1C39D2AC5EBDDAAC5CB9F2BCA624EFE9B8CB1DC6A0180C8DF5277B9472F1E710CF4CD5567F2215D0156D9E7DF6D99E8C41F1D257B411353535DFE4EB10EAD2A54B3F4871EDD382450E3FC9890E72C8EA8A2BAE481FBE1A31624474D84AE691FF7FF9C9279FA40F5F656B4A5F7FFDB559BC78717AB9C3181483A1ADFEE47BDBC3A2FBCBA1B26C1FE52864B4D59F28EA6B9F0A5B947F983E7DFAB93CFC978CFD76C376F35F320A97D75E7BCD9C397326FA5E5EB5C7D3DF78E30DEF94F8CCA6F4C8238F98B973E79ACB2EBBCCD4D5D5456705CE9831237A9F68E1C285D1A0585E5E6E9A9B9BBD75163ADA9A92A6FA93F9E48CD6458B16452FCAE4041C39E1C65D6F21A3ADFE62A962FD2F19B169D3A66D5EB162458FBBD041D463FF20FE6C376C85BBEEA409B92965460E51B9D324ADADADE6F5D75F3777DC714734C8BDF3CE3B66F8F0E15181BDF2CA2BD17B417266A01CAE92DB87F59E0E2F9157FDEEF20A1D6D4D4953FDC9FCC332EA4F22F7779759C868ABBF5808FF4FD1BE504F1F3AEDD3FF5314A5A5A5A32B2B2B4FEEDCB9D35DF6A0F8ECB3CF16D90D6B97F5B8EB4E9A62694A77DF7DB7374D22AFE45F7DF555F3D0430F45273CECDBB7CFCC9F3FDF9BAF58A2AD29517F61455BFD65B23DBF251E94E6CD9BE70E0B434AD697B197D8E26E5B4EECA83A76E2C489A7E598FE60B245BDDC6ED4F77D1EA98B54B134A5F83D9C6C710F651573B43525EA2FAC68ABBF4C764CF99DEDFDDDF1E0241FAFC907594FC680D82DDBE16E5BCEEC6EEE24BBC77862B0F6187BF7100FDA4C74D79554C5D294B4445B53A2FEC28AB6FA739595952D8C0728398CBA65CB1677981854B2FCCCC3A6B27E779BFA4CF6E8264C9870B4BEBEFE687F4FBE91936A7ADF433CA4650F3146530A2BDA9A12F51756B4D59FABA2A262841D07B6C683947C0467A8064659AE5D5F7ACF54D62BEB77B7A95FECE8FA5B3BAAAFAEAAAA3ABC7EFDFA63B97E8ED1CED7B174E9D225766376DBAC94E5B8CB4E3A9A5258D1D694A8BFB0A2ADFEB2B163C1281BF9F4417A8F512EE737986479997B88BDEB1BE56ECB80C9C727EC829BC68F1F7F7CF6ECD9DB1A1A1AB6B7B6B67ED7D9D979CA6EC7C91F7EF8A16DC78E1D1B3FFEF8E3FA9A9A9A9576DE4E993FE91FBBB8189A5258D1D694A8BFB0A2ADFE2EC40E5863320746899C0C33D0B352E5FECE4935D18028EB73B76150C91568EC8AAAED9E9F5CB7F4CB8C5F4EBE7ED93BBD3AC957AAC9154D29AC686B4AD45F58D1567F1793FA758F317D2855227B8DF2719B03070EB8E3DD45C9FC723F67EF303A642AEB71D78D02A22985156D4D89FA0B2BDAEAEF52E43DBEDE936FDCC12CBA24DC92254BCCA64D9BCCDEBD7BA38BBC0BF92A3FCB74B9DDB9745B9C1E59EEA0BD8788C143530A2BDA9A12F51756B4D55FAE7A3FAE91FE1CE300D332A08F5D6068D194C28AB6A644FD85156DF5D757F2F9F8D4AF97844B5F2B35C7C8FC75727F7799080C4D29AC686B4AD45F58D1567FFD55515131D20E72256565650BECD7069B6F6C4EF70E80F2557E6EE8BDBD44E677978140D194C28AB6A644FD85156DF50778684A61455B53A2FEC28AB6FA033C34A5B0A2AD29517F61455BFD011E9A5258D1D694A8BFB0A2ADFE000F4D29AC686B4AD45F58D1567F8087A61456B43525EA2FAC68AB3FC043530A2BDA9A12F51756B4D51FE0A12985156D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF50778684A61455B53A2FEC28AB6FA033C34A5B0A2AD29517F61455BFD011E9A5258D1D694A8BFB0A2ADFE000F4D29AC686B4AD45F58D1567F8087A61456B43525EA2FAC68AB3FC043530A2BDA9A12F51756B4D51FE0A12985156D4D89FA0B2BDAEA0FF0D094C28AB6A644FD85156DF507781A1A1A7ABABABABC3F0E92FFD8E7E17BDB94CEB8CF5192517FE14463FD019EA6A6A6EF3B3A3ABC3F1092FF7CFBEDB74B6D53FAD27D8E928CFA0B271AEB0FF03436368E5BB76EDDF1F6F6F64E5EB11726F6716FDFB76FDFFFD986F49DCD1FDDE728C9A8BFC24773FD0159C91F82BC42B4392BEF2990BC471E7779FC553624F9BD7B7F7FEAAF30515D7F000000000000000000000000000000000000000000000040B1FF079115CD4ECEA559100000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57671', 1, 'var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57673', 1, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F62740008666F726D4E616D65740006E8AFB7E5818774000B666F726D436F6E74656E74740A7D7B227769646765744C697374223A5B7B226B6579223A37363434392C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22E5958AE5958A222C226C6162656C223A22E8AFB7E58187E4BABA222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A747275652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743534353535227D2C7B226B6579223A31363531352C2274797065223A22696E707574222C2269636F6E223A22746578742D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A22696E7075743436353337222C226C6162656C223A22E8AFB7E58187E79086E794B1222C226C6162656C416C69676E223A22222C2274797065223A2274657874222C2264656661756C7456616C7565223A22222C22706C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C2273686F7750617373776F7264223A66616C73652C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A5B5D2C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226D696E4C656E677468223A6E756C6C2C226D61784C656E677468223A6E756C6C2C2273686F77576F72644C696D6974223A66616C73652C2270726566697849636F6E223A22222C2273756666697849636F6E223A22222C22617070656E64427574746F6E223A66616C73652C22617070656E64427574746F6E44697361626C6564223A66616C73652C22627574746F6E49636F6E223A22637573746F6D2D736561726368222C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E496E707574223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22222C226F6E417070656E64427574746F6E436C69636B223A22227D2C226964223A22696E7075743436353337227D2C7B226B6579223A36343638342C2274797065223A22646174652D72616E6765222C2269636F6E223A22646174652D72616E67652D6669656C64222C22666F726D4974656D466C6167223A747275652C226F7074696F6E73223A7B226E616D65223A226461746572616E67653833343638222C226C6162656C223A22E8AFB7E58187E88C83E59BB4222C226C6162656C416C69676E223A22222C2274797065223A226461746572616E6765222C2264656661756C7456616C7565223A6E756C6C2C227374617274506C616365686F6C646572223A22222C22656E64506C616365686F6C646572223A22222C22636F6C756D6E5769647468223A223230307078222C2273697A65223A22222C226175746F46756C6C5769647468223A747275652C226C6162656C5769647468223A6E756C6C2C226C6162656C48696464656E223A66616C73652C22726561646F6E6C79223A66616C73652C2264697361626C6564223A66616C73652C2268696464656E223A66616C73652C22636C65617261626C65223A747275652C226564697461626C65223A66616C73652C22666F726D6174223A22595959592D4D4D2D4444222C2276616C7565466F726D6174223A22595959592D4D4D2D4444222C227265717569726564223A66616C73652C22726571756972656448696E74223A22222C2276616C69646174696F6E223A22222C2276616C69646174696F6E48696E74223A22222C22637573746F6D436C617373223A22222C226C6162656C49636F6E436C617373223A6E756C6C2C226C6162656C49636F6E506F736974696F6E223A2272656172222C226C6162656C546F6F6C746970223A6E756C6C2C226F6E43726561746564223A22222C226F6E4D6F756E746564223A22222C226F6E4368616E6765223A22222C226F6E466F637573223A22222C226F6E426C7572223A22222C226F6E56616C6964617465223A22227D2C226964223A226461746572616E67653833343638227D5D2C22666F726D436F6E666967223A7B226D6F64656C4E616D65223A22666F726D44617461222C227265664E616D65223A2276466F726D222C2272756C65734E616D65223A2272756C6573222C226C6162656C5769647468223A38302C226C6162656C506F736974696F6E223A226C656674222C2273697A65223A22222C226C6162656C416C69676E223A226C6162656C2D6C6566742D616C69676E222C22637373436F6465223A22222C22637573746F6D436C617373223A22222C2266756E6374696F6E73223A22222C226C61796F757454797065223A225043222C226A736F6E56657273696F6E223A332C226F6E466F726D43726561746564223A22222C226F6E466F726D4D6F756E746564223A22222C226F6E466F726D446174614368616E6765223A22222C226F6E466F726D56616C6964617465223A22227D7D74000A666F726D526F757465727074000A666F726D5375626D6974707800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57676', 1, 'var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57678', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57688', 1, '请假内部页面.bpmn', '57687', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F703832673669623822206E616D653D22E8AFB7E58187E58685E983A8E9A1B5E99DA2223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F316930327970363C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3076656D6B307A22206E616D653D22E5AEA1E689B9312220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F316930327970363C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F31793679786B373C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F316930327970362220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3076656D6B307A22202F3E0A202020203C757365725461736B2069643D2241637469766974795F3030356368697922206E616D653D22E5AEA1E689B9322220666C6F7761626C653A61737369676E65653D22312220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31793679786B373C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F307764397534693C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31793679786B372220736F757263655265663D2241637469766974795F3076656D6B307A22207461726765745265663D2241637469766974795F3030356368697922202F3E0A202020203C656E644576656E742069643D224576656E745F3065393536746F223E0A2020202020203C696E636F6D696E673E466C6F775F307764397534693C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F307764397534692220736F757263655265663D2241637469766974795F3030356368697922207461726765745265663D224576656E745F3065393536746F22202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F7038326736696238223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D223234302220793D22323030222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223234322220793D22323337222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F3076656D6B307A5F6469222062706D6E456C656D656E743D2241637469766974795F3076656D6B307A223E0A20202020202020203C6F6D6764633A426F756E647320783D223332302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303035636869795F6469222062706D6E456C656D656E743D2241637469766974795F30303563686979223E0A20202020202020203C6F6D6764633A426F756E647320783D223437302220793D22313735222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F3065393536746F5F6469222062706D6E456C656D656E743D224576656E745F3065393536746F223E0A20202020202020203C6F6D6764633A426F756E647320783D223632322220793D22313937222077696474683D22333622206865696768743D22333622202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F316930327970365F6469222062706D6E456C656D656E743D22466C6F775F31693032797036223E0A20202020202020203C64693A776179706F696E7420783D223237302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223332302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31793679786B375F6469222062706D6E456C656D656E743D22466C6F775F31793679786B37223E0A20202020202020203C64693A776179706F696E7420783D223432302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223437302220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F307764397534695F6469222062706D6E456C656D656E743D22466C6F775F30776439753469223E0A20202020202020203C64693A776179706F696E7420783D223537302220793D2232313522202F3E0A20202020202020203C64693A776179706F696E7420783D223632322220793D2232313522202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('57689', 1, '请假内部页面.flow_p82g6ib8.png', '57687', 0x89504E470D0A1A0A0000000D494844520000029C0000010908060000003908F7C80000136449444154785EEDDD5B8C55F5BD0770EAC3096D5FB4B7345AB51793DAA40FBEB6F6C1B69A3E54633D05E7426C67608C432BB6497BDA482407441F684C93DA634F306D1AA89C9073522CD88254072D5A40EBAD47A9228A28204E01455006CB659DF5DF9D3D67FBDF836E6760CF7FFDE7F349BE19D87BCD5A4BE6E7DADF596B5FA64C0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080FF5714C5BF6CDBB6EDBF376EDCF88F818181E29E7BEE9136A7FC773FBE7EFDFA97D7AD5B7779FCF3A92A7335F1C971AE00A8A8B214FC4FF9A0540C0E0E16434343C55B6FBD256D4EF8770FFFFEF7DF7FFFEB6551F87AFC33AA227335F1C971AE00A8A870062A3C28C50F56D2FEECDEBD7B6F590C1E8E7F465564AED2494E7305404585CB9DCE40A591F073288BC1E1F8675445E62A9DE4345700545478AE57FC00251397F0F3887F465564AED24A2E73054045B55A0CDED8BFBBD8F6975F179BEFBDB196F0E7705BBC9C8C2FB9140373955672992B002AAA956270F0B55DC5536BE7157FFDC3BFBD2DE1B6705FBCBC8C3DB9140373955672992B002AAA9562B063F3AAA65250CFCECD77352D2F634F2EC5C05CA5955CE60A808A6AA5183C7DDFA2A642504FB82F5E5EC69E5C8A81B94A2BB9CC150015D54A3178EA9EF94D85A09E705FBCBC8C3DB9140373955672992B002A4A31482BB9140373955672992B002AAA9562105E3D1C17827AC27DF1F232F6E4520CCC555AC965AE00A8A8568AC1D63FFF475321A827DC172F2F634F2EC5C05CA5955CE60A808A6AA518ECDBF5BFC5537FFCF7A652106E0BF7C5CBCBD8934B313057692597B902A0A25A2906212F3CB2B4A91884DBE2E5647CC9A51898ABB492CB5C0150512D1583C3878BAD1BFEB3A91884DBC27D4DCBCB98934B313057692597B902A0A2DEAD18844F7C79F6CF3F6F2A05F584FB7C2ACCC94B2EC5C05CA5955CE60A808A3A6131387CB8D8BD755DF1E4DD739BCA409CB04C58D659A9F127976260AED24A2E730540458D560CDEEDECD389E2ACD4F8934B313057692597B902A0A2462B06AD9C7D3A51C2F7C6EB93D6934B313057692597B902A0A2462B06F183FD7B4DBC3E693DB9140373955672992B002A6AB4622013975C8A81B94A2BB9CCD558F5F4F49CDED9D939ADA3A3E3D6F2EB409917CA1C2A530C7F0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CCD57BD5D5D5754959205794796BB85CB69AB0FC8AF0FDF13A011803C520ADE4520CCC555AC965AE5A5516C52F948571D32845722CD914D6176F0380F74031482BB914037395567299AB77D3D3D333B5A3A3E3B6B2241E8F8BE3F7BFFFFD62D9B265C5A38F3E5A3CFFFCF3C5BE7DFB8A207C0D7F0FB787FBC372F1F786F585F586F5C7DB0418511E534EDBB871E3BF2E5DBAF48F0B162CD8FBE31FFF7868F6ECD9B503527F7FFF911FFEF08707CADB9E5BB870E12DBDBDBD67C7DF9F33C520ADE4520CCC555AC965AEDE49793C3FBBABABEBAF8D45B1BBBBBB58BC7871B173E7CE5AB96C55583E7C5FF8FEA8783E11B6136F1B98E4CAE3C6D4BBEFBEFBF679F3E6FDA3AFAFAFF8C52F7E516CDAB469D4DF6EC3EDE1FE59B3661D9B3367CEB6ABAFBEFA6BF1FA72A418A4955C8A81B94A2BB9CCD5899445F3FC32BB1ACBE1A2458B8A1D3B76BCBD49BE47E1FBC37AA2D2B9236C2FDE0760922A0BE477172E5C38142E8F6CDCB8B13876EC587C2C1955582E2C7FDD75D71DF9CE77BEF3584747C767E275E74431482BB914037395567299ABD10C9FD91C299BE1ACE4AA55ABE243FBB884F545673B7738D309935C796C78DFDAB56B975D73CD35C5EAD5AB8BA3478FC6C78E9684EF0BDFDFD3D3F346CEAF54540CD24A2EC5C05CA5955CE62A169E53D97819BDB7B7B778FCF1C7E3C3F94911D61BD6DF503A9FF09C4E98A4CA63C2FB56AC58F1D0ECD9B38B679E79263E5E8C49584F5F5FDFA1F2B7DB59F1F672A018A4955C8A81B94A2BB9CC556CF805422367364F55D9AC0BEB6F3CD319B61FEF13300984339BFDFDFDC5E0E0607C9C1897B0BEF237DB83575E79E5C5F136AB4E31482BB914037395567299AB46C36F7D74AC5EFEEEBAEBAEF8D07D4A84ED349CE53CE62D936092D9B061C37743D93C59673663E57A8F7FEB5BDF7A6DFAF4E9E7C5DBAE32C520ADE4520CCC555AC965AE1A7536BCCF6678614F3B452F24DA14EF1B90A9F2FFFFA937DD74D35078CEE5A9B472E5CAD7BABBBBEF8EB75F658A415AC9A51898ABB492CB5CD585AB4D8D97D2C7FB6AF4F72A6CAFF1D27A8E57BF8051AC59B366717835FA585F20D4AAB0FEBEBEBE3DE5C1E5CBF13E5495629056722906E62AADE43257759DFFFCB8CA5AD90BEF973911C2761BCE72AE88F711C84CF9FFFD6937DC70C33FC25B19B5C3830F3EB8BF3CB83C10EF475529066925976260AED24A2E73157477779FD1D9F0D9E8ED3EBB5917B6DB5038DF0AFB15EF2B90910D1B365C71F5D557B7FC3E9BE315B63363C68CFDD3A74F3F2BDE97949407C0FBCA5C14DF1E530CD24AEAC5C05C5533A9CF555D2BF355DE3FAD5EF4C295AD89147D0CE6B4785F818C2C59B2E49EF00941EDB460C182A73A3A3A66C7FB92928683E03B1EC01583B4927A313057D54CEA7355D7CA7C95B7FFBCBEDC1D77DC111F9EDB2A6CBF619F7F1EEF2B9091850B17EE69D7E5F4BA7BEFBD777367E2CFD9693808BEE3015C31482BA917037355CDA43E5775ADCC575757D7BAFAFD8F3CF2487C786EABB0FDFABE84FD6ADC4F20333FFAD18F86B66DDB161F074EA92D5BB66C2F0F307F89F72525A31CB8473D802B066925F56230CA3C99AB0A24F5B9AA1B65AE9AE6ABFCFA52FDF6761FFB6361FB0DFBF852F49F03E4A4BFBFFFF8ABAFBE1A1F074EA97DFBF61D2C0F2EBBE27D49C92807EC38B50378158AC1B3CF3E5B7B827E7C7B631E7AE8A1A6DB1E78E081E2C081034DB7A79CD48BC1287314C75C2598D4E7AA6E94798A13E6EBCDFADFDB7DEC8F85EDD7F7A5ABABEB40FCDF0364E4AAABAE2A8E1C39121F074EA9727B074639105632A9168370207FF3CD376B7FDEBA756BF1894F7CA2D8BF7FFFC8FD4343436F5BFEC20B2F2CC27379C3A780841791854270F9E5971737DC7043D3BAC3FA9E7BEEB9A6DB5348FCF3A96A26E35C85CBABAB56AD2AF6EEDDDB74DF4427FEF9E492761FFB6361FB0DFB73347E7C023272CD35D71C69F76FB97BF6EC79AEB3BA6738EFEBACC0A5CF050B1614D3A64D0BEF7B5ACC9A352B9C9D29BEFDED6F173367CE0C1F335A7CEE739F2B9E78E28991E52FBAE8A2E2BEFBEEAB3DE05F7AE9A5B5DBA64F9F5EDC79E79DB5B358070F1EAC95CC193366141FF9C8478ADFFCE6374DDB4C21A99F891A659E26FD5C85DBE6CF9F5F5B57C8A73FFDE95AB18DB73D91497DAEEA4699ABA6F90A6712EBB7B7FBD81F73861326911FFCE00707DAFD3C9EBFFDED6F8F7456EF399C6F2B0475A916834F7DEA53E1DF79E4EF1FFAD087468AC0ADB7DE5ACC9B37AFD8B56B57AD0884334F679D755671FEF9E717E79D775EF18D6F7CA356044231F8ED6F7F5B7CE52B5FA99589279F7CB2F8D297BE542B050AE7D898ABE6B90ADF7BC6196714EBD6AD2B0606066AF3B572E5CAA66D4F64529FABBA56E6ABD3733881893077EEDC67DBFD2AF53BEFBC735567755EA5DE74C06E946A3178E595578AAF7EF5ABB507FD900F7CE003237FFEE4273F397249FCD0A143B51270C9259714EBD7AFAF5DFA3CF7DC738B73CE39A7F8F0873F5C7CFEF39F2FAEBFFEFAE2F5D75F1F59F7148573CCCCD5E873D5DFDF5F3CF6D863E1F9DDB5F90ACFF38CB73D91497DAEEA5A992FAF520726C482050B6E69F7FB705E7BEDB5AB2BF03E9C273C60374AB518847CF4A31F1D79BEDD99679E3972FBC73EF6B1B72DF7C61B6F145FFCE2176B973FBFF9CD6F16575C7145EDF67026EA97BFFC65D37AA7289C6366AE4E3C5721E12C69FDD27B4A497DAEEA5A99AF4EEFC3094C84DEDEDEB3FBFAFA8EB5F193865E290F2C7B52FFA4A156A55C0C3EFEF18F173D3D3DB5CB96E14C54F85AFF737D995FFDEA57B50271FAE9A7176BD7AE2DD6AC59F3B662109E6B17AF778AC279CA4DC6B90A6742BBBBBB937C057B2E73157426F44943DFFBDEF78E37144E9F3404B99B3367CE0BEDBAACBE7CF9F23B3A7D967A5B122E5D86177784CB9D1FFCE007472E7D4E9D3AB576C9332C33383858FCFEF7BF1FB9F4395A3178FAE9A78BA54B978EAC778AC279CA4DB6B90A7F2E8F43B5EF0F9759477B3BA5894C2E7315F82C7560C2940F165FBBEEBAEB8E1C3D7A343E269C54E5FA77940796AD575E79E597E37DA8AA948BC14F7EF293E2F0E1C3B53F87B352F5DB7FF6B39F35BD7D4D6331B8ECB2CB8A9B6EBAA978FFFBDF5FAC58B1A2F62AE3B973E7D69EBF77DB6DB7D50A67575757B161C386A66D4E747229069369AEC272E195EF4B962CA9FD22135E4C145E3C146F772293CB5CD595C7E115F5B2B778F1E2F850DD1661BB0D8533E9E7F40327D1B5D75EFBD8EAD5AB8FC7078593E878F940F5EBF2C0B23ADE7695A55C0C1A132E6FC6B7856CD9B2A5F8E94F7F5A7CF6B39FAD15C8DB6FBFBD38EDB4D36A0F0637DE7863ED397AE195C6E15267B87FCAF05BD78484B35AF1FA263AB91483C9345761F9290D731512BE3F5EE7442697B9AA2B7FE9BFB85EF6C2CFA0DD6739C3F6CA5F5A472EA787FD89F711C8D4F4E9D3CFEBEDED3DF8CC33CFC4C78693E24F7FFAD392F2C0B23B6C27DE769555A5185C70C1054DB78584335537DF7C7371F1C517D75EE4B17DFBF6E2965B6E695AAE2AC9A51898ABB492CB5C352A8FC79BEA856FD1A245F121FB940ADB6B38BBB929DE372073E56F9C97CC9C39F35078FED5C9543ED8DC551E545ECEF1B7D8AA1483FA73EB464B7C19B4CAC9A51898ABB492CB5C352A8FF75F288FCBC7EAC52FBC75553B84ED3494CD63613FE27D032681EEEEEE59BDBDBD074ED699CEE1339BBBCACC8CB79583AA1483C9925C8A81B94A2BB9CC55ACA3A3E3B67AF90B97D61F7FFCF1F8107E5285F5375E4A0FDB8FF7099844C299C8ABAEBAEAB5952B57BE36D617128517080D3F67F3951CCF6CD629066925976260AED24A2E7315EBE9E9995A1EA39FA817C0F0F656A7AA7486F596DB1B39A31AB61BB61FEF1330C994BF797EA6FC8D776D5F5FDF9E071F7C707FABEFD3592E37B87CF9F265E5C1646B9935613DF1BA73A218A4955C8A81B94A2BB9CCD568CAE3F4D965C23B888C9CE90C1F4D7A3285F5359ED91CDEDED9F1BE009358780BA3F2C0B07EC68C19AFCF9F3FFFC9818181A7B66CD9F2D2DEBD7BDF288F2307FFFEF7BF6FDBBC79F323BFFBDDEF56CE9933674DB9ECDEB07C4E6F7DF44E1483B4924B313057692597B93A91B20C9EDF583A43C20B7BC6FBEAF5F0FDD10B846A65336C2FDE07809AF0C940E581A2BFA3A3237C0EFAC30D07A7F0F5E1E1DBFB73F904A15629066925976260AED24A2E73F54E3AFF79A673E4F27A4838DB19DECA6AE7CE9D71977C4761F9F07DD159CDDA65F4B09D78DB00BC0BC520ADE4520CCC555AC965AEDE4D784EE5F00B89E2A258FB18CC65CB96158F3EFA68F1FCF3CF17FBF6EDAB95CBF035FC3DDC1EEE8F3EAEB29EE361BD9EB30930468A415AC9A51898ABB492CB5CB56AF82D9346DEA7739CD9E4AD8F00C64931482BB914037395567299ABF72ABC3773E73F3F0673E4B3D75B4C587E45F8FE789D008C81629056722906E62AADE4325763D5D3D3737A5920A7757474DC5A7E1D28F3429943C3E5327C0D7F1F18BE7F5A583E5E0700E3A018A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015A518A4955C8A81B94A2BB9CC150015353030707C6868A8E9014ADA9FF2E7F072590C0EC73FA32A3257E924A7B902A0A2D6AF5FFFF2E0E060D38394B43F2FBEF8E2F2B2183C1CFF8CAAC85CA5939CE60A808A5AB76EDDE5F7DF7FFFEBBB77EFDEEB8CD4C4A4FC77DFBD7DFBF6FF2A4BC14B65BE1EFF8CAAC85C4D7C729C2B002A2C3C1885332065DE0ACFF592B627FCBB877FFFAC4A41F8EF19FEEF325713932CE70A000000000000000000000000000000000000000000008049ECFF0044CC9A9F56F1AEE90000000049454E44AE426082, 1);
INSERT INTO `act_ge_bytearray` VALUES ('57695', 2, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000037704000000037371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000227400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002274000864697361626C656471007E001174000668696464656E71007E0022740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0022740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C7400116C6162656C49636F6E506F736974696F6E7400047265617274000D73686F77576F72644C696D697471007E002274000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0022740014617070656E64427574746F6E44697361626C656471007E002274000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000408371007E000B740005696E70757471007E000D74000A746578742D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000002271007E001474000A696E707574343635333771007E001674000CE8AFB7E58187E79086E794B171007E001871007E001C71007E000B7400047465787471007E001B71007E001C71007E001D71007E001C71007E001E740005323030707871007E002071007E001C71007E002171007E002271007E002371007E002271007E002471007E001171007E002571007E002271007E002671007E001171007E002771007E002271007E002871007E002271007E002971007E001C71007E002A71007E001C71007E002B71007E001C71007E002C7371007E0004000000007704000000007871007E002D7400047265617271007E002F71007E002271007E003071007E001C71007E003171007E001C71007E003271007E002271007E003371007E002271007E003474000D637573746F6D2D73656172636871007E003671007E001C71007E003771007E001C71007E003871007E001C71007E003971007E001C71007E003A71007E001C71007E003B71007E001C71007E003C71007E001C71007E003D71007E001C780071007E003E74000A696E707574343635333778007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000FCAC71007E000B74000A646174652D72616E676571007E000D740010646174652D72616E67652D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000001D71007E001474000E6461746572616E6765383334363871007E001674000CE8AFB7E58187E88C83E59BB471007E001871007E001C71007E000B7400096461746572616E67657400107374617274506C616365686F6C64657271007E001C74000E656E64506C616365686F6C64657271007E001C71007E001E740005323030707871007E002071007E001C74000D6175746F46756C6C576964746871007E001171007E002171007E002271007E002371007E002271007E002471007E001171007E002571007E002271007E002671007E00117400086564697461626C6571007E0022740006666F726D617474000A595959592D4D4D2D444474000B76616C7565466F726D617474000A595959592D4D4D2D444471007E002871007E002271007E002971007E001C71007E002A71007E001C71007E002B71007E001C71007E002C71007E001C71007E002D7400047265617271007E003671007E001C71007E003771007E001C71007E003971007E001C71007E003A71007E001C71007E003B71007E001C71007E003C71007E001C780071007E003E74000E6461746572616E6765383334363878007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657374000A6C6162656C57696474687371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002C71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('57700', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('62508', 2, 'hist.var-formJson', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A7769646765744C697374737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000037704000000037371007E00003F4000000000000C770800000010000000067400036B6579737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000012AA174000474797065740005696E70757474000469636F6E74000A746578742D6669656C6474000C666F726D4974656D466C6167737200116A6176612E6C616E672E426F6F6C65616ECD207280D59CFAEE0200015A000576616C75657870017400076F7074696F6E737371007E00003F40000000000030770800000040000000227400046E616D65740006E5958AE5958A7400056C6162656C740009E8AFB7E58187E4BABA74000A6C6162656C416C69676E7400106C6162656C2D6C6566742D616C69676E71007E000B7400047465787474000C64656661756C7456616C756574000074000B706C616365686F6C64657271007E001C74000B636F6C756D6E5769647468740005323030707874000473697A6571007E001C74000B6C6162656C48696464656E7371007E001000740008726561646F6E6C7971007E002274000864697361626C656471007E001174000668696464656E71007E0022740009636C65617261626C6571007E001174000C73686F7750617373776F726471007E0022740008726571756972656471007E001174000C726571756972656448696E7471007E001C74000A76616C69646174696F6E71007E001C74000E76616C69646174696F6E48696E7471007E001C74000B637573746F6D436C61737371007E001C7400116C6162656C49636F6E506F736974696F6E7400047265617274000D73686F77576F72644C696D697471007E002274000A70726566697849636F6E71007E001C74000A73756666697849636F6E71007E001C74000C617070656E64427574746F6E71007E0022740014617070656E64427574746F6E44697361626C656471007E002274000A627574746F6E49636F6E74000D637573746F6D2D7365617263687400096F6E4372656174656471007E001C7400096F6E4D6F756E74656471007E001C7400076F6E496E70757471007E001C7400086F6E4368616E676571007E001C7400076F6E466F63757371007E001C7400066F6E426C757271007E001C74000A6F6E56616C696461746571007E001C7400136F6E417070656E64427574746F6E436C69636B71007E001C7800740002696474000A696E707574353435353578007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000408371007E000B740005696E70757471007E000D74000A746578742D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000002271007E001474000A696E707574343635333771007E001674000CE8AFB7E58187E79086E794B171007E001871007E001C71007E000B7400047465787471007E001B71007E001C71007E001D71007E001C71007E001E740005323030707871007E002071007E001C71007E002171007E002271007E002371007E002271007E002471007E001171007E002571007E002271007E002671007E001171007E002771007E002271007E002871007E002271007E002971007E001C71007E002A71007E001C71007E002B71007E001C71007E002C7371007E0004000000007704000000007871007E002D7400047265617271007E002F71007E002271007E003071007E001C71007E003171007E001C71007E003271007E002271007E003371007E002271007E003474000D637573746F6D2D73656172636871007E003671007E001C71007E003771007E001C71007E003871007E001C71007E003971007E001C71007E003A71007E001C71007E003B71007E001C71007E003C71007E001C71007E003D71007E001C780071007E003E74000A696E707574343635333778007371007E00003F4000000000000C7708000000100000000671007E00077371007E00080000FCAC71007E000B74000A646174652D72616E676571007E000D740010646174652D72616E67652D6669656C6471007E000F71007E001171007E00127371007E00003F400000000000307708000000400000001D71007E001474000E6461746572616E6765383334363871007E001674000CE8AFB7E58187E88C83E59BB471007E001871007E001C71007E000B7400096461746572616E67657400107374617274506C616365686F6C64657271007E001C74000E656E64506C616365686F6C64657271007E001C71007E001E740005323030707871007E002071007E001C74000D6175746F46756C6C576964746871007E001171007E002171007E002271007E002371007E002271007E002471007E001171007E002571007E002271007E002671007E00117400086564697461626C6571007E0022740006666F726D617474000A595959592D4D4D2D444474000B76616C7565466F726D617474000A595959592D4D4D2D444471007E002871007E002271007E002971007E001C71007E002A71007E001C71007E002B71007E001C71007E002C71007E001C71007E002D7400047265617271007E003671007E001C71007E003771007E001C71007E003971007E001C71007E003A71007E001C71007E003B71007E001C71007E003C71007E001C780071007E003E74000E6461746572616E6765383334363878007874000A666F726D436F6E6669677371007E00003F40000000000018770800000020000000107400096D6F64656C4E616D65740008666F726D446174617400077265664E616D6574000576466F726D74000972756C65734E616D6574000572756C657374000A6C6162656C57696474687371007E00080000005074000D6C6162656C506F736974696F6E7400046C65667471007E002071007E001C71007E00187400106C6162656C2D6C6566742D616C69676E740007637373436F646571007E001C71007E002C71007E001C74000966756E6374696F6E7371007E001C74000A6C61796F757454797065740002504374000B6A736F6E56657273696F6E7371007E00080000000374000D6F6E466F726D4372656174656471007E001C74000D6F6E466F726D4D6F756E74656471007E001C7400106F6E466F726D446174614368616E676571007E001C74000E6F6E466F726D56616C696461746571007E001C78007800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('62513', 1, 'hist.var-daterange83468', NULL, 0xACED0005737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A6578700000000277040000000274000A323032352D30382D313974000A323032352D30382D323178, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('70004', 1, 'hist.var-form', NULL, 0xACED0005737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F72646572787200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000A74000863726561746542797074000A63726561746554696D657074000875706461746542797074000A75706461746554696D657074000672656D61726B70740006666F726D4964737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000F63740008666F726D4E616D65740012E8AFB7E58187E5A496E983A8E9A1B5E99DA274000B666F726D436F6E74656E747074000A666F726D526F757465727400082F71696E676A696174000A666F726D5375626D697474002A71696E676A696153657276696365496D706C2E696E736572742851696E676A69612071696E676A6961297800, NULL);
INSERT INTO `act_ge_bytearray` VALUES ('7515', 1, 'flow_yvmruh6h.bpmn', '7514', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A62696F633D22687474703A2F2F62706D6E2E696F2F736368656D612F62706D6E2F62696F636F6C6F722F312E302220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D6122207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A20203C70726F636573732069643D22666C6F775F726D6E743839716222206E616D653D22666C6F775F79766D7275683668223E0A202020203C73746172744576656E742069643D2273746172745F6576656E7422206E616D653D22E5BC80E5A78B223E0A2020202020203C6F7574676F696E673E466C6F775F31686864766D753C2F6F7574676F696E673E0A202020203C2F73746172744576656E743E0A202020203C757365725461736B2069643D2241637469766974795F3034713476747822206E616D653D22E5AEA1E689B92220666C6F7761626C653A61737369676E65653D22322220666C6F7761626C653A75736572547970653D2261737369676E65652220666C6F7761626C653A64617461547970653D226669786564223E0A2020202020203C696E636F6D696E673E466C6F775F31686864766D753C2F696E636F6D696E673E0A2020202020203C6F7574676F696E673E466C6F775F306F6D766779683C2F6F7574676F696E673E0A202020203C2F757365725461736B3E0A202020203C73657175656E6365466C6F772069643D22466C6F775F31686864766D752220736F757263655265663D2273746172745F6576656E7422207461726765745265663D2241637469766974795F3034713476747822202F3E0A202020203C656E644576656E742069643D224576656E745F306B6A6B38316922206E616D653D22E7BB93E69D9F223E0A2020202020203C696E636F6D696E673E466C6F775F306F6D766779683C2F696E636F6D696E673E0A202020203C2F656E644576656E743E0A202020203C73657175656E6365466C6F772069643D22466C6F775F306F6D766779682220736F757263655265663D2241637469766974795F3034713476747822207461726765745265663D224576656E745F306B6A6B38316922202F3E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F666C6F77223E0A202020203C62706D6E64693A42504D4E506C616E652069643D2242504D4E506C616E655F666C6F77222062706D6E456C656D656E743D22666C6F775F726D6E7438397162223E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2242504D4E53686170655F73746172745F6576656E74222062706D6E456C656D656E743D2273746172745F6576656E74222062696F633A7374726F6B653D22223E0A20202020202020203C6F6D6764633A426F756E647320783D222D37352220793D22313335222077696474683D22333022206865696768743D22333022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D222D37332220793D22313732222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D2241637469766974795F303471347674785F6469222062706D6E456C656D656E743D2241637469766974795F30347134767478223E0A20202020202020203C6F6D6764633A426F756E647320783D2231302220793D22313130222077696474683D2231303022206865696768743D22383022202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C202F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652069643D224576656E745F306B6A6B3831695F6469222062706D6E456C656D656E743D224576656E745F306B6A6B383169223E0A20202020202020203C6F6D6764633A426F756E647320783D223137322220793D22313332222077696474683D22333622206865696768743D22333622202F3E0A20202020202020203C62706D6E64693A42504D4E4C6162656C3E0A202020202020202020203C6F6D6764633A426F756E647320783D223137392220793D22313735222077696474683D22323322206865696768743D22313422202F3E0A20202020202020203C2F62706D6E64693A42504D4E4C6162656C3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F31686864766D755F6469222062706D6E456C656D656E743D22466C6F775F31686864766D75223E0A20202020202020203C64693A776179706F696E7420783D222D34352220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D2231302220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652069643D22466C6F775F306F6D766779685F6469222062706D6E456C656D656E743D22466C6F775F306F6D76677968223E0A20202020202020203C64693A776179706F696E7420783D223131302220793D2231353022202F3E0A20202020202020203C64693A776179706F696E7420783D223137322220793D2231353022202F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `act_ge_bytearray` VALUES ('7516', 1, 'flow_yvmruh6h.flow_rmnt89qb.png', '7514', 0x89504E470D0A1A0A0000000D4948445200000125000000C80806000000AECAF79F00000D8449444154785EEDDD7F6C14651EC771E58F0BEA3F9C4663C49F391231F10FFF3DFC8753C8FDA106395BD94A502925B44AD5444F63437314F00F0C3111EFBC403486865E9ABB5805BC960A2D58B41404C5938AA5502A144AA51568A12D42FBDCF39D76D6E9334BD976DBEDB3FBBC5FC9376D6767E679D89DF9F0CCECECEC75D70100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000924C29F5BBA6A6A67FEFDEBDFBD7AAAA2AB56DDB362AC9A59FF7FE9A9A9A53D5D5D573CCD707708E0EA4FFE81D42B5B5B5A99E9E1E75E9D2252AC925CFBB3CFF3B77EE3CAF43EA31F335029C222324D921CC1D854A7EB5B6B6B6EB50DA6BBE468053E4908D11921D25AF830EA55EF335029C22E734CC9D839AB892D7C37C8D00A7C41B4A17CEB5AAA6AF3F52F5DB577825BFCB34733E2AB12294E0BC7842A9EBEC4975B0B2507DF7DFBF0E2999268F99F353A32F4209CE8B27944ED46F0E05925F2DF55B42F353A32F4209CE8B27940EED581D0A23BFE431737E6AF44528C179F184D2C16DCB4361E4973C66CE4F8DBE0825388F50B2AB0825382F9E509277DBCC30F24B1E33E7A7465F84129C174F28357EF5F75018F9258F99F353A32F4209CE8B27943A4EFE4F1DFCFC6FA1409269F298393F35FA2294E0BC784249EAD8BEE25028C934733E2AB12294E0BCB842A9B75735D6FE33144A324D1E0BCD4F8DBA082538EF5AA124576C1FFEEABD5020F9258F7155F7D815A104E75D3594F408A8B5B15A7DBFB520144466C93C322FA3A6C48B5082F36285D2B54647572B464D8917A104E7C50AA5784647572B59D65C1F157F114A705EAC50328366A465AE8F8ABF0825382F562851135784527C9E7FFEF92991482463DEBC796BF5CF2A5DC77475EB52833FE5EFAAC1C733647E731DB014A16457114AC3CBCACA9AAD43A64CD7A5C1008AB764FE3259DE5C272C4328D95584526C3A4CFEA843A52E46D88CA6EA647D661BB004A16457114A43E9C3AEC9FA10EC1F3A48FACD7079E5955754494989DABF7FBF3A7AF4A8EAE8E850427ECADF325D1E97F9CC65657DB25E59BFD9E698D37D9AB47BF7EEBF1417177F5E5454D4FEC61B6FF4E4E5E579FFA0DCDCDCCBAFBDF65AA79E7664E5CA956B162E5C7897B9BC6B0825BB8A50FA8DDE67EFD2239AEF8261F2CC33CFA875EBD6A99696162F80E225F3CB72B2BC114E07A41DB3ED31A1DB9DBC75EBD6F5858585BFE6E4E4A8F7DF7F5FD5D5D5C54C50992E8F2F5AB4A82F3F3FBF69F1E2C57F36D7E70A42C9AE229406E8309AAEEB64304056AF5EAD4E9C3831346D46489697F518C17442DA33FB90101D322FEA914F8F0CD3F42849F5F5F5997D8949E693F95F7AE9A5CB2FBCF0C2377A38F70773DDE98E50B2AB08A5E808291A4832BAD9BC79B3B9FB2644D6678C9A4E8CC98849AFFBFACACACA92254B96A8F2F27275E5CA15B3EDB8C872B2BC3EBEBCE0DAD97942C9AE723D94E41C4FF0906DE1C285EADB6FBF3577D93121EB95F50782E94042E798F43AAF2F2B2BDB939797A77EFCF147B3BD5191F5E843BF6E9DA08BCCF6D215A16457B91E4A8327B5A323A4F10A249FAC3F386292F6CD3EC54D4648B9B9B9AAADADCD6C2721B23E9D9E5D4F3FFDF42CB3CD744428D9552E87D2E0DBFE7D7E406CD9B2C5DC3DC785B413182DF58DEA7281DADADA172590C66A8464D2EBED7FF6D967CF6666664E33DB4E3784925DE572284502D721C9C9E864324E7ED7997D1B965E7EF2AA55AB7AE41CD078DAB469D3593DACDB6AB69F6E0825BBCAD550922393E0615BA2EFB28D94B4173C8C1BD191524545C53A79976DB427B5E325EBCFC9C939A33BF727B30FE98450B2AB5C0DA5C8C04747BC4090EB892682B41B182D95997D8C492F3769D9B265BFCADBF8C9F0E5975F9ED39DDB65F6239D104A76958BA1A44728BF8F043ECB96EC51924FDA0D84D225E997D9D790DADADAB98B172F8EFB3AA444493BF3E7CF3F97999939D5EC8BEDF493BA43D74C73BA8950B2ABD22D94E2D90EF5E3197E18C851D044323E929261F63564C3860DDBE44AEC642A2A2A3A386FDEBC3CB32FB60B3CB1C36E1484925D9586A174CDED504F7FCF9F6FE3C68DE62E9854D27EA0CFEF997D0D59B972E599641DBAF9B66FDF5E1F89F7F8D222812776D88D8250B2ABD23894AEBA1D66656555FB8FEFDBB7CFDC05934ADAF7FB22FD0AF633A6D75F7FBDA7A9A9C95CCFB86A686868D61DFCDAEC8BED626C0C31370A42C9AE72209442DBA1FE79DC9F9EECFDDB24ED07FA78DCF8E784E5E6E6F6FFF2CB2FE67AC65547474797EEDC49B32FB68BB11198E56D14A9144A870F1FF64E469AD3CDDAB3674F68DAAE5DBB5467676768BA6DE5502805B7C38BFEDFC9DEBF4DD2BEDF173D52EA34FF3D210B162C50972F5F36D733AE747B9D319EC8B429DB434936928B172F7ABF373636AA3BEFBC539D3B772EFA784F4F4F6899871F7ED8BB0B845CA92B6F8C4818CD9933472D5BB62C34AF6D65BE3EAE55B2F76F93B41FE8CF15338342962C597239D9497AE6CC992391F41A29ED88A4D0E15B515191CAC8C8906BC6E45633328A50CF3DF79CCACECEF63E4CF9C0030FA803070E0C5966E6CC996AC78E1DDE27C11F7FFC716F5A6666A6FAE4934FBC9156575757A81D5BCAA19152743B9411893F3DD9FBB769C423A5575F7DB533D9C79C3FFCF0C3BE487A9C531A12463EDB43E9BEFBEE93D720FAF7CD37DF1C0DA1B56BD7AAC2C24275F2E4C077CD4908C9C868EAD4A96AFAF4E96ADAB469EAC9279FF4424842E9E38F3F568F3CF2881766663BB69403A114DA0E23A97C4EA9A0A0E070B2DF7DD3FFBB6E8EA4F6BB6FA18D20C8F6503A7DFAB47AF4D147BDB091BAF1C61BA3BFDF7BEFBDEAC89123D179BBBBBBBD009A3D7BB6AAA9A9F10EDFEEB9E71E75F7DD77AB5B6EB9453DF8E083EACD37DF54E7CF9F0FB5634BA571285D753B4CE977DFF4507E4DB2AF535ABA7469798A5EA774D58D20C8F65092BAF5D65BA3E795EEB8E38EE8F4DB6EBB2D34EF850B17D48C1933BC43B8A79E7A4ACD9D3BD79B2E23A50F3EF82034BF6D9586A174CDED3092CAD729C93DB5737272FA927845F769DDB133A9784577BC5221946EBFFD76B9019F77D8252325F9E9FF1E9CEFC30F3FF4026CCA9429AAB2B2525554540C092539A764AEDBB64AB7508A47C4A22BBA5F7EF9E5E017145CFB8A6E919F9F7F2C598770A5A5A51B237CF66DC24B0EBDE444B71CB2DD74D34DD1C3B7C993277B876CFE7C722FACCF3EFB2C7AF8162B940E1D3AA48A8B8B436DD8522E86524A7FF64DC84DFEE59EDA49B84B80DCB3B791BB044C7CBDFDF6DBAAB7B7D7FB5D464DFEF477DF7D37E62501C1507AE28927D4AA55ABD40D37DCA0CACACABC77E50A0A0A42CBD8522E869288A4EA5D027C4B972EFDA6BCBCBCDF5CE918EAD73BC247BA63E566DBE926154229587278664EF3ABA1A141BDF3CE3BEAFEFBEF57B5B5B56AFDFAF56AD2A449DEC6B662C50AEF7C94BC3327F7CD3197B5A55C0D251BEEA7949595153D741BD1FD9484DC11526E593B5E779EFCE28B2F36E88EB572E749FBEAA1871E0A4DF34B46536FBDF5969A356B9677C2BBB9B959AD59B326349FCDE56A288948AADE79D227DF3A929D9DDD3DD6F7E8D61BF216DDA953234ECA14956AA1143C8714AB621DCEA552B91C4A297D8F6E9F7CEB881E31758ED58869708424DF37956DB695AE522D94D2BD5C0E253111DF66123C6C4BE8DB4C7C32A259B060C159B9A7F6684F7ECB49EDC17348A75D1921F90825BBCAF55092EF5D8B0C7C95B61712E3FDBD6FBABDE8C84CDA4DE87BDF82E49B6D75AA56CA3DB5E516B6F15EC7A4E76B2B2D2D2DD19D69D455C137E452135DAE8792D0FBE25D91816FAC8D8E98C6E31B728323A4C1F612FF865C93BC7DAF575C337FFEFCF3CB972FFFBEAAAAEA604343C3F1F6F6F60BBA1F5D3FFFFC73537D7DFDBE4F3FFD74537E7E7E859EB75DE64FF7B7FD874328D95584D2001D18D383C1242527A3137D574E96374E6A7B8124ED997D18537205B66E28578F7CE4736B7B03FF38F9B977707A6E3A5FA91D2F42C9AE22947E13191831450FE5A464D4249778B4B4B49879332C995F96334647DE219BB463B68D094428D95584D250728E67F0E4B71926DE47524A4A4AD4FEFDFBD5D1A347E5868C5E00C94FF95BA6CBE3C64747FCEA97F58ED939248C1D42C9AE2294621BBC5C207A1D53825597D0DBFE185F84925D45280D4FAE4F8C0C7C2425FA59B9384BE62F93E5CD75C23284925D4528C5471F764DD12193A10FC1D6EA9F55BA8EE9EA1E0C20F9297F570D3E9E21F39BEB80A50825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F30825BB8A5082F3AAAAAAFA53FDABAED3A5F4EB704A8752AFF91A014EA9A9A939D5D6D616DA41A8E4D74F3FFD54AA4369AFF91A014EA9AEAE9EB373E7CEF3ADADADED8C9826A6F4F3DEDADCDCFC2F1D48C7753D66BE468073644790FFA1755D92731A54D24B9E7779FE0924000000000000000000000000000000D8EBFF9C3BB825AC717FA90000000049454E44AE426082, 1);

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('batch.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `act_ge_property` VALUES ('common.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('job.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '72501', 30);
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.8.0.0)', 1);
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('task.schema.version', '6.8.0.0', 1);
INSERT INTO `act_ge_property` VALUES ('variable.schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('42509', 1, 'flow_rmnt89qb:11:20008', '42501', '42508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-14 11:02:50.465', '2025-08-14 11:02:50.469', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('42510', 1, 'flow_rmnt89qb:11:20008', '42501', '42508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-14 11:02:50.470', '2025-08-14 11:02:50.470', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('42511', 2, 'flow_rmnt89qb:11:20008', '42501', '42508', 'Activity_04q4vtx', '42512', NULL, '审批', 'userTask', NULL, '2025-08-14 11:02:50.470', '2025-08-14 11:03:06.052', 3, 15582, '驳回：加班', '');
INSERT INTO `act_hi_actinst` VALUES ('45009', 1, 'flow_rmnt89qb:11:20008', '45001', '45008', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-14 15:30:55.342', '2025-08-14 15:30:55.345', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('45010', 1, 'flow_rmnt89qb:11:20008', '45001', '45008', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-14 15:30:55.346', '2025-08-14 15:30:55.346', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('45011', 3, 'flow_rmnt89qb:11:20008', '45001', '45008', 'Activity_04q4vtx', '45012', NULL, '审批', 'userTask', '2', '2025-08-14 15:30:55.347', '2025-08-14 15:31:27.204', 3, 31857, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('45018', 1, 'flow_rmnt89qb:11:20008', '45001', '45008', 'Flow_0omvgyh', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-14 15:31:27.205', '2025-08-14 15:31:27.205', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('45019', 1, 'flow_rmnt89qb:11:20008', '45001', '45008', 'Event_0kjk81i', NULL, NULL, '结束', 'endEvent', NULL, '2025-08-14 15:31:27.205', '2025-08-14 15:31:27.207', 2, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47509', 1, 'flow_rmnt89qb:11:20008', '47501', '47508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 11:38:48.197', '2025-08-18 11:38:48.200', 1, 3, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47510', 1, 'flow_rmnt89qb:11:20008', '47501', '47508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 11:38:48.201', '2025-08-18 11:38:48.201', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47511', 2, 'flow_rmnt89qb:11:20008', '47501', '47508', 'Activity_04q4vtx', '47512', NULL, '审批', 'userTask', NULL, '2025-08-18 11:38:48.201', '2025-08-18 15:29:38.785', 3, 13850584, 'Change activity to Event_0kjk81i', '');
INSERT INTO `act_hi_actinst` VALUES ('47526', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:26:53.737', '2025-08-18 14:26:53.737', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47527', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:26:53.738', '2025-08-18 14:26:53.738', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47528', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'Activity_04q4vtx', '47529', NULL, '审批', 'userTask', NULL, '2025-08-18 14:26:53.738', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47539', 1, 'flow_rmnt89qb:12:47517', '47531', '47538', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:28:47.365', '2025-08-18 14:28:47.365', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47540', 1, 'flow_rmnt89qb:12:47517', '47531', '47538', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:28:47.365', '2025-08-18 14:28:47.365', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47541', 3, 'flow_rmnt89qb:12:47517', '47531', '47538', 'Activity_04q4vtx', '47542', NULL, '审批', 'userTask', '2', '2025-08-18 14:28:47.365', '2025-08-18 14:33:38.784', 3, 291419, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47548', 1, 'flow_rmnt89qb:12:47517', '47531', '47538', 'Flow_0omvgyh', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:33:38.784', '2025-08-18 14:33:38.784', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('47549', 1, 'flow_rmnt89qb:12:47517', '47531', '47538', 'Event_0kjk81i', NULL, NULL, '结束', 'endEvent', NULL, '2025-08-18 14:33:38.786', '2025-08-18 14:33:38.787', 2, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('50009', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:35:18.038', '2025-08-18 14:35:18.039', 1, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('50010', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:35:18.039', '2025-08-18 14:35:18.039', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('50011', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'Activity_04q4vtx', '50012', NULL, '审批', 'userTask', NULL, '2025-08-18 14:35:18.039', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52509', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52510', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52511', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'Activity_04q4vtx', '52512', NULL, '审批', 'userTask', NULL, '2025-08-18 14:37:26.486', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52522', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52523', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('52524', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'Activity_04q4vtx', '52525', NULL, '审批', 'userTask', NULL, '2025-08-18 14:37:29.862', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('55021', 1, 'flow_rmnt89qb:14:55008', '55009', '55020', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 15:29:18.483', '2025-08-18 15:29:18.487', 1, 4, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('55022', 1, 'flow_rmnt89qb:14:55008', '55009', '55020', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 15:29:18.488', '2025-08-18 15:29:18.488', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('55023', 2, 'flow_rmnt89qb:14:55008', '55009', '55020', 'Activity_04q4vtx', '55024', NULL, '审批', 'userTask', NULL, '2025-08-18 15:29:18.489', '2025-08-18 15:29:23.598', 3, 5109, 'Change activity to Event_0kjk81i', '');
INSERT INTO `act_hi_actinst` VALUES ('55027', 1, 'flow_rmnt89qb:14:55008', '55009', '55026', 'Event_0kjk81i', NULL, NULL, '结束', 'endEvent', NULL, '2025-08-18 15:29:23.605', '2025-08-18 15:29:23.607', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('55029', 1, 'flow_rmnt89qb:11:20008', '47501', '55028', 'Event_0kjk81i', NULL, NULL, '结束', 'endEvent', NULL, '2025-08-18 15:29:38.788', '2025-08-18 15:29:38.788', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57511', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 07:54:46.308', '2025-08-19 07:54:46.313', 1, 5, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57512', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 07:54:46.314', '2025-08-19 07:54:46.314', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57513', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'Activity_04q4vtx', '57514', NULL, '审批', 'userTask', NULL, '2025-08-19 07:54:46.315', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57552', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:04:46.496', '2025-08-19 08:04:46.496', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57553', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:04:46.496', '2025-08-19 08:04:46.496', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57554', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'Activity_0vemk0z', '57555', NULL, '审批1', 'userTask', '1', '2025-08-19 08:04:46.496', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57570', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57571', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:06:51.969', '2025-08-19 08:06:51.969', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57572', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'Activity_0vemk0z', '57573', NULL, '审批1', 'userTask', '1', '2025-08-19 08:06:51.969', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57588', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.317', 1, 2, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57589', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:15:20.317', '2025-08-19 08:15:20.317', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57590', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'Activity_0vemk0z', '57591', NULL, '审批1', 'userTask', '1', '2025-08-19 08:15:20.317', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57606', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57607', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57608', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'Activity_04q4vtx', '57609', NULL, '审批', 'userTask', NULL, '2025-08-19 08:15:56.145', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57618', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57619', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57620', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'Activity_04q4vtx', '57621', NULL, '审批', 'userTask', NULL, '2025-08-19 08:16:51.824', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57630', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57631', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57632', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'Activity_04q4vtx', '57633', NULL, '审批', 'userTask', NULL, '2025-08-19 08:17:35.150', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57650', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57651', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57652', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'Activity_04q4vtx', '57653', NULL, '审批1', 'userTask', '2', '2025-08-19 08:19:55.310', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57663', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57664', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57665', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'Activity_04q4vtx', '57666', NULL, '审批1', 'userTask', '2', '2025-08-19 08:21:10.227', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57681', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57682', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57683', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'Activity_0vemk0z', '57684', NULL, '审批1', 'userTask', '1', '2025-08-19 08:22:16.203', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57703', 1, 'flow_p82g6ib8:5:57690', '57691', '57702', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:24:03.370', '2025-08-19 08:24:03.370', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57704', 1, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:24:03.370', '2025-08-19 08:24:03.370', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('57705', 2, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Activity_0vemk0z', '57706', NULL, '审批1', 'userTask', '2', '2025-08-19 08:24:03.370', '2025-08-19 08:31:03.496', 3, 420126, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('60002', 1, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Flow_1y6yxk7', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:31:03.499', '2025-08-19 08:31:03.499', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('60003', 2, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Activity_005chiy', '60004', NULL, '审批2', 'userTask', '1', '2025-08-19 08:31:03.500', '2025-08-19 08:55:14.763', 2, 1451263, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62502', 1, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Flow_0wd9u4i', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:55:14.764', '2025-08-19 08:55:14.764', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62503', 1, 'flow_p82g6ib8:5:57690', '57691', '57702', 'Event_0e956to', NULL, NULL, NULL, 'endEvent', NULL, '2025-08-19 08:55:14.765', '2025-08-19 08:55:14.766', 2, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62516', 1, 'flow_p82g6ib8:5:57690', '62504', '62515', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:16:19.607', '2025-08-19 09:16:19.607', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62517', 1, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:16:19.607', '2025-08-19 09:16:19.607', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62518', 2, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Activity_0vemk0z', '62519', NULL, '审批1', 'userTask', '2', '2025-08-19 09:16:19.607', '2025-08-20 09:32:07.506', 3, 87347899, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62529', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62530', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('62531', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'Activity_04q4vtx', '62532', NULL, '审批1', 'userTask', '2', '2025-08-19 09:16:43.481', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65008', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65009', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65010', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'Activity_04q4vtx', '65011', NULL, '审批1', 'userTask', '2', '2025-08-19 09:18:55.198', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65022', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65023', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('65024', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'Activity_04q4vtx', '65025', NULL, '审批1', 'userTask', '2', '2025-08-19 09:22:32.889', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67509', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:34:34.918', '2025-08-19 09:34:34.919', 1, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67510', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:34:34.920', '2025-08-19 09:34:34.920', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67511', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'Activity_04q4vtx', '67512', NULL, '审批1', 'userTask', '2', '2025-08-19 09:34:34.920', NULL, 3, NULL, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67523', 1, 'flow_rmnt89qb:19:57642', '67515', '67522', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:34:53.895', '2025-08-19 09:34:53.895', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67524', 1, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:34:53.895', '2025-08-19 09:34:53.895', 2, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('67525', 2, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Activity_04q4vtx', '67526', NULL, '审批1', 'userTask', '2', '2025-08-19 09:34:53.895', '2025-08-20 09:31:42.555', 3, 86208660, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70005', 1, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Flow_1473gi7', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-20 09:31:42.560', '2025-08-20 09:31:42.560', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70006', 2, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Activity_0lpu6za', '70007', NULL, '审批2', 'userTask', '1', '2025-08-20 09:31:42.561', '2025-08-20 09:38:32.940', 2, 410379, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70011', 1, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Flow_1y6yxk7', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-20 09:32:07.506', '2025-08-20 09:32:07.506', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70012', 2, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Activity_005chiy', '70013', NULL, '审批2', 'userTask', '1', '2025-08-20 09:32:07.506', '2025-08-20 09:38:38.968', 2, 391462, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70017', 1, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Flow_18puk91', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-20 09:38:32.941', '2025-08-20 09:38:32.941', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70018', 1, 'flow_rmnt89qb:19:57642', '67515', '67522', 'Event_1gcd18p', NULL, NULL, '结束', 'endEvent', NULL, '2025-08-20 09:38:32.941', '2025-08-20 09:38:32.942', 2, 1, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70020', 1, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Flow_0wd9u4i', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-20 09:38:38.969', '2025-08-20 09:38:38.969', 1, 0, NULL, '');
INSERT INTO `act_hi_actinst` VALUES ('70021', 1, 'flow_p82g6ib8:5:57690', '62504', '62515', 'Event_0e956to', NULL, NULL, NULL, 'endEvent', NULL, '2025-08-20 09:38:38.969', '2025-08-20 09:38:38.969', 2, 0, NULL, '');

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------
INSERT INTO `act_hi_comment` VALUES ('42514', '3', '2025-08-14 11:03:06.032', NULL, '42512', '42501', 'AddComment', '加班', 0xE58AA0E78FAD);
INSERT INTO `act_hi_comment` VALUES ('45014', '1', '2025-08-14 15:31:27.160', NULL, '45012', '45001', 'AddComment', '好的', 0xE5A5BDE79A84);
INSERT INTO `act_hi_comment` VALUES ('45017', 'event', '2025-08-14 15:31:27.170', NULL, '45012', NULL, 'AddUserLink', '2_|_assignee', NULL);
INSERT INTO `act_hi_comment` VALUES ('47544', '1', '2025-08-18 14:33:38.765', NULL, '47542', '47531', 'AddComment', '通过', 0xE9809AE8BF87);
INSERT INTO `act_hi_comment` VALUES ('47547', 'event', '2025-08-18 14:33:38.771', NULL, '47542', NULL, 'AddUserLink', '2_|_assignee', NULL);
INSERT INTO `act_hi_comment` VALUES ('60001', '1', '2025-08-19 08:31:03.421', NULL, '57706', '57691', 'AddComment', '1', 0x31);
INSERT INTO `act_hi_comment` VALUES ('62501', '1', '2025-08-19 08:55:14.683', NULL, '60004', '57691', 'AddComment', 'hao', 0x68616F);
INSERT INTO `act_hi_comment` VALUES ('70001', '1', '2025-08-20 09:31:42.377', NULL, '67526', '67515', 'AddComment', '同意', 0xE5908CE6848F);
INSERT INTO `act_hi_comment` VALUES ('70010', '1', '2025-08-20 09:32:07.496', NULL, '62519', '62504', 'AddComment', '123', 0x313233);
INSERT INTO `act_hi_comment` VALUES ('70016', '1', '2025-08-20 09:38:32.935', NULL, '70007', '67515', 'AddComment', '好的', 0xE5A5BDE79A84);
INSERT INTO `act_hi_comment` VALUES ('70019', '1', '2025-08-20 09:38:38.963', NULL, '70013', '62504', 'AddComment', '234', 0x323334);

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_entitylink`;
CREATE TABLE `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_`, `REF_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('42502', NULL, 'starter', '100', NULL, '2025-08-14 11:02:50.459', '42501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('42513', '3', 'candidate', NULL, '42512', '2025-08-14 11:02:50.484', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('45002', NULL, 'starter', '100', NULL, '2025-08-14 15:30:55.331', '45001', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('45013', '3', 'candidate', NULL, '45012', '2025-08-14 15:30:55.362', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('45015', NULL, 'assignee', '2', '45012', '2025-08-14 15:31:27.168', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('45016', NULL, 'participant', '2', NULL, '2025-08-14 15:31:27.170', '45001', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47502', NULL, 'starter', '100', NULL, '2025-08-18 11:38:48.193', '47501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47513', '3', 'candidate', NULL, '47512', '2025-08-18 11:38:48.211', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47519', NULL, 'starter', '1', NULL, '2025-08-18 14:26:53.733', '47518', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47530', '3', 'candidate', NULL, '47529', '2025-08-18 14:26:53.738', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47532', NULL, 'starter', '1', NULL, '2025-08-18 14:28:47.363', '47531', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47543', '3', 'candidate', NULL, '47542', '2025-08-18 14:28:47.365', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47545', NULL, 'assignee', '2', '47542', '2025-08-18 14:33:38.770', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('47546', NULL, 'participant', '2', NULL, '2025-08-18 14:33:38.771', '47531', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('50002', NULL, 'starter', '1', NULL, '2025-08-18 14:35:18.029', '50001', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('50013', '3', 'candidate', NULL, '50012', '2025-08-18 14:35:18.052', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('52502', NULL, 'starter', '1', NULL, '2025-08-18 14:37:26.485', '52501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('52513', '3', 'candidate', NULL, '52512', '2025-08-18 14:37:26.486', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('52515', NULL, 'starter', '1', NULL, '2025-08-18 14:37:29.860', '52514', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('52526', '3', 'candidate', NULL, '52525', '2025-08-18 14:37:29.862', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('55010', NULL, 'starter', '100', NULL, '2025-08-18 15:29:18.478', '55009', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('55025', '3', 'candidate', NULL, '55024', '2025-08-18 15:29:18.506', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57502', NULL, 'starter', '1', NULL, '2025-08-19 07:54:46.298', '57501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57515', '3', 'candidate', NULL, '57514', '2025-08-19 07:54:46.341', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57541', NULL, 'starter', '100', NULL, '2025-08-19 08:04:46.491', '57540', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57556', NULL, 'assignee', '1', '57555', '2025-08-19 08:04:46.496', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57557', NULL, 'participant', '1', NULL, '2025-08-19 08:04:46.497', '57540', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57559', NULL, 'starter', '100', NULL, '2025-08-19 08:06:51.968', '57558', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57574', NULL, 'assignee', '1', '57573', '2025-08-19 08:06:51.969', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57575', NULL, 'participant', '1', NULL, '2025-08-19 08:06:51.969', '57558', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57577', NULL, 'starter', '100', NULL, '2025-08-19 08:15:20.313', '57576', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57592', NULL, 'assignee', '1', '57591', '2025-08-19 08:15:20.317', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57593', NULL, 'participant', '1', NULL, '2025-08-19 08:15:20.317', '57576', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57595', NULL, 'starter', '100', NULL, '2025-08-19 08:15:56.144', '57594', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57610', '3', 'candidate', NULL, '57609', '2025-08-19 08:15:56.145', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57612', NULL, 'starter', '100', NULL, '2025-08-19 08:16:51.824', '57611', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57622', '3', 'candidate', NULL, '57621', '2025-08-19 08:16:51.824', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57624', NULL, 'starter', '100', NULL, '2025-08-19 08:17:35.150', '57623', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57634', '3', 'candidate', NULL, '57633', '2025-08-19 08:17:35.150', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57644', NULL, 'starter', '100', NULL, '2025-08-19 08:19:55.310', '57643', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57654', NULL, 'assignee', '2', '57653', '2025-08-19 08:19:55.311', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57655', NULL, 'participant', '2', NULL, '2025-08-19 08:19:55.311', '57643', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57657', NULL, 'starter', '100', NULL, '2025-08-19 08:21:10.226', '57656', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57667', NULL, 'assignee', '2', '57666', '2025-08-19 08:21:10.227', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57668', NULL, 'participant', '2', NULL, '2025-08-19 08:21:10.227', '57656', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57670', NULL, 'starter', '100', NULL, '2025-08-19 08:22:16.203', '57669', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57685', NULL, 'assignee', '1', '57684', '2025-08-19 08:22:16.203', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57686', NULL, 'participant', '1', NULL, '2025-08-19 08:22:16.204', '57669', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57692', NULL, 'starter', '100', NULL, '2025-08-19 08:24:03.369', '57691', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57707', NULL, 'assignee', '2', '57706', '2025-08-19 08:24:03.370', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('57708', NULL, 'participant', '2', NULL, '2025-08-19 08:24:03.370', '57691', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('60005', NULL, 'assignee', '1', '60004', '2025-08-19 08:31:03.508', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('60006', NULL, 'participant', '1', NULL, '2025-08-19 08:31:03.510', '57691', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62505', NULL, 'starter', '100', NULL, '2025-08-19 09:16:19.606', '62504', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62520', NULL, 'assignee', '2', '62519', '2025-08-19 09:16:19.616', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62521', NULL, 'participant', '2', NULL, '2025-08-19 09:16:19.616', '62504', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62523', NULL, 'starter', '100', NULL, '2025-08-19 09:16:43.481', '62522', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62533', NULL, 'assignee', '2', '62532', '2025-08-19 09:16:43.481', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('62534', NULL, 'participant', '2', NULL, '2025-08-19 09:16:43.481', '62522', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65002', NULL, 'starter', '100', NULL, '2025-08-19 09:18:55.198', '65001', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65012', NULL, 'assignee', '2', '65011', '2025-08-19 09:18:55.198', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65013', NULL, 'participant', '2', NULL, '2025-08-19 09:18:55.198', '65001', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65015', NULL, 'starter', '100', NULL, '2025-08-19 09:22:32.888', '65014', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65026', NULL, 'assignee', '2', '65025', '2025-08-19 09:22:32.889', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('65027', NULL, 'participant', '2', NULL, '2025-08-19 09:22:32.889', '65014', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67502', NULL, 'starter', '100', NULL, '2025-08-19 09:34:34.915', '67501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67513', NULL, 'assignee', '2', '67512', '2025-08-19 09:34:34.932', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67514', NULL, 'participant', '2', NULL, '2025-08-19 09:34:34.932', '67501', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67516', NULL, 'starter', '100', NULL, '2025-08-19 09:34:53.895', '67515', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67527', NULL, 'assignee', '2', '67526', '2025-08-19 09:34:53.895', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('67528', NULL, 'participant', '2', NULL, '2025-08-19 09:34:53.895', '67515', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('70008', NULL, 'assignee', '1', '70007', '2025-08-20 09:31:42.577', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('70009', NULL, 'participant', '1', NULL, '2025-08-20 09:31:42.580', '67515', NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('70014', NULL, 'assignee', '1', '70013', '2025-08-20 09:32:07.506', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_identitylink` VALUES ('70015', NULL, 'participant', '1', NULL, '2025-08-20 09:32:07.508', '62504', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_SUPER_PROCINST`(`SUPER_PROCESS_INSTANCE_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('42501', 2, '42501', NULL, 'flow_rmnt89qb:11:20008', '2025-08-14 11:02:50.452', '2025-08-14 11:03:06.072', 15620, '100', 'start_event', NULL, NULL, '驳回：加班', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('45001', 2, '45001', NULL, 'flow_rmnt89qb:11:20008', '2025-08-14 15:30:55.322', '2025-08-14 15:31:27.229', 31907, '100', 'start_event', 'Event_0kjk81i', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('47501', 2, '47501', NULL, 'flow_rmnt89qb:11:20008', '2025-08-18 11:38:48.183', '2025-08-18 15:29:38.795', 13850612, '100', 'start_event', 'Event_0kjk81i', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('47518', 1, '47518', NULL, 'flow_rmnt89qb:12:47517', '2025-08-18 14:26:53.733', NULL, NULL, '1', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('47531', 2, '47531', NULL, 'flow_rmnt89qb:12:47517', '2025-08-18 14:28:47.363', '2025-08-18 14:33:38.799', 291436, '1', 'start_event', 'Event_0kjk81i', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('50001', 1, '50001', NULL, 'flow_rmnt89qb:12:47517', '2025-08-18 14:35:18.013', NULL, NULL, '1', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('52501', 1, '52501', NULL, 'flow_rmnt89qb:12:47517', '2025-08-18 14:37:26.479', NULL, NULL, '1', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('52514', 1, '52514', NULL, 'flow_rmnt89qb:12:47517', '2025-08-18 14:37:29.860', NULL, NULL, '1', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('55009', 2, '55009', NULL, 'flow_rmnt89qb:14:55008', '2025-08-18 15:29:18.477', '2025-08-18 15:29:23.623', 5146, '100', 'start_event', 'Event_0kjk81i', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57501', 1, '57501', NULL, 'flow_rmnt89qb:15:55033', '2025-08-19 07:54:46.289', NULL, NULL, '1', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57540', 1, '57540', NULL, 'flow_p82g6ib8:4:57539', '2025-08-19 08:04:46.491', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57558', 1, '57558', NULL, 'flow_p82g6ib8:4:57539', '2025-08-19 08:06:51.968', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57576', 1, '57576', NULL, 'flow_p82g6ib8:4:57539', '2025-08-19 08:15:20.313', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57594', 1, '57594', NULL, 'flow_rmnt89qb:17:57523', '2025-08-19 08:15:56.144', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57611', 1, '57611', NULL, 'flow_rmnt89qb:17:57523', '2025-08-19 08:16:51.824', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57623', 1, '57623', NULL, 'flow_rmnt89qb:17:57523', '2025-08-19 08:17:35.150', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57643', 1, '57643', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 08:19:55.310', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57656', 1, '57656', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 08:21:10.226', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57669', 1, '57669', NULL, 'flow_p82g6ib8:4:57539', '2025-08-19 08:22:16.203', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('57691', 2, '57691', NULL, 'flow_p82g6ib8:5:57690', '2025-08-19 08:24:03.369', '2025-08-19 08:55:14.779', 1871410, '100', 'start_event', 'Event_0e956to', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('62504', 2, '62504', NULL, 'flow_p82g6ib8:5:57690', '2025-08-19 09:16:19.605', '2025-08-20 09:38:38.974', 87739369, '100', 'start_event', 'Event_0e956to', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('62522', 1, '62522', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 09:16:43.481', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('65001', 1, '65001', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 09:18:55.185', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('65014', 1, '65014', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 09:22:32.888', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('67501', 1, '67501', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 09:34:34.907', NULL, NULL, '100', 'start_event', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_hi_procinst` VALUES ('67515', 2, '67515', NULL, 'flow_rmnt89qb:19:57642', '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.968', 86619073, '100', 'start_event', 'Event_1gcd18p', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('42512', 2, 'flow_rmnt89qb:11:20008', NULL, 'Activity_04q4vtx', '42501', '42508', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-14 11:02:50.470', NULL, '2025-08-14 11:03:06.049', 15579, '驳回：加班', 50, NULL, NULL, NULL, '', '2025-08-14 11:03:06.049');
INSERT INTO `act_hi_taskinst` VALUES ('45012', 3, 'flow_rmnt89qb:11:20008', NULL, 'Activity_04q4vtx', '45001', '45008', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, '2', '2025-08-14 15:30:55.347', NULL, '2025-08-14 15:31:27.201', 31854, NULL, 50, NULL, NULL, NULL, '', '2025-08-14 15:31:27.201');
INSERT INTO `act_hi_taskinst` VALUES ('47512', 2, 'flow_rmnt89qb:11:20008', NULL, 'Activity_04q4vtx', '47501', '47508', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 11:38:48.201', NULL, '2025-08-18 15:29:38.787', 13850586, 'Change activity to Event_0kjk81i', 50, NULL, NULL, NULL, '', '2025-08-18 15:29:38.787');
INSERT INTO `act_hi_taskinst` VALUES ('47529', 1, 'flow_rmnt89qb:12:47517', NULL, 'Activity_04q4vtx', '47518', '47525', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 14:26:53.738', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-18 14:26:53.738');
INSERT INTO `act_hi_taskinst` VALUES ('47542', 3, 'flow_rmnt89qb:12:47517', NULL, 'Activity_04q4vtx', '47531', '47538', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, '2', '2025-08-18 14:28:47.365', NULL, '2025-08-18 14:33:38.783', 291418, NULL, 50, NULL, NULL, NULL, '', '2025-08-18 14:33:38.783');
INSERT INTO `act_hi_taskinst` VALUES ('50012', 1, 'flow_rmnt89qb:12:47517', NULL, 'Activity_04q4vtx', '50001', '50008', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 14:35:18.039', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-18 14:35:18.052');
INSERT INTO `act_hi_taskinst` VALUES ('52512', 1, 'flow_rmnt89qb:12:47517', NULL, 'Activity_04q4vtx', '52501', '52508', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 14:37:26.486', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-18 14:37:26.486');
INSERT INTO `act_hi_taskinst` VALUES ('52525', 1, 'flow_rmnt89qb:12:47517', NULL, 'Activity_04q4vtx', '52514', '52521', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 14:37:29.862', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-18 14:37:29.862');
INSERT INTO `act_hi_taskinst` VALUES ('55024', 2, 'flow_rmnt89qb:14:55008', NULL, 'Activity_04q4vtx', '55009', '55020', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-18 15:29:18.489', NULL, '2025-08-18 15:29:23.602', 5113, 'Change activity to Event_0kjk81i', 50, NULL, NULL, NULL, '', '2025-08-18 15:29:23.602');
INSERT INTO `act_hi_taskinst` VALUES ('57514', 1, 'flow_rmnt89qb:15:55033', NULL, 'Activity_04q4vtx', '57501', '57510', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-19 07:54:46.315', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 07:54:46.341');
INSERT INTO `act_hi_taskinst` VALUES ('57555', 1, 'flow_p82g6ib8:4:57539', NULL, 'Activity_0vemk0z', '57540', '57551', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '1', '2025-08-19 08:04:46.496', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:04:46.496');
INSERT INTO `act_hi_taskinst` VALUES ('57573', 1, 'flow_p82g6ib8:4:57539', NULL, 'Activity_0vemk0z', '57558', '57569', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '1', '2025-08-19 08:06:51.969', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:06:51.969');
INSERT INTO `act_hi_taskinst` VALUES ('57591', 1, 'flow_p82g6ib8:4:57539', NULL, 'Activity_0vemk0z', '57576', '57587', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '1', '2025-08-19 08:15:20.317', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:15:20.317');
INSERT INTO `act_hi_taskinst` VALUES ('57609', 1, 'flow_rmnt89qb:17:57523', NULL, 'Activity_04q4vtx', '57594', '57605', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-19 08:15:56.145', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:15:56.145');
INSERT INTO `act_hi_taskinst` VALUES ('57621', 1, 'flow_rmnt89qb:17:57523', NULL, 'Activity_04q4vtx', '57611', '57617', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-19 08:16:51.824', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:16:51.824');
INSERT INTO `act_hi_taskinst` VALUES ('57633', 1, 'flow_rmnt89qb:17:57523', NULL, 'Activity_04q4vtx', '57623', '57629', NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, NULL, NULL, '2025-08-19 08:17:35.150', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:17:35.150');
INSERT INTO `act_hi_taskinst` VALUES ('57653', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '57643', '57649', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 08:19:55.310', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:19:55.311');
INSERT INTO `act_hi_taskinst` VALUES ('57666', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '57656', '57662', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 08:21:10.227', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:21:10.227');
INSERT INTO `act_hi_taskinst` VALUES ('57684', 1, 'flow_p82g6ib8:4:57539', NULL, 'Activity_0vemk0z', '57669', '57680', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '1', '2025-08-19 08:22:16.203', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_taskinst` VALUES ('57706', 2, 'flow_p82g6ib8:5:57690', NULL, 'Activity_0vemk0z', '57691', '57702', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 08:24:03.370', NULL, '2025-08-19 08:31:03.493', 420123, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:31:03.493');
INSERT INTO `act_hi_taskinst` VALUES ('60004', 2, 'flow_p82g6ib8:5:57690', NULL, 'Activity_005chiy', '57691', '57702', NULL, NULL, NULL, NULL, NULL, '审批2', NULL, NULL, NULL, '1', '2025-08-19 08:31:03.500', NULL, '2025-08-19 08:55:14.759', 1451259, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 08:55:14.759');
INSERT INTO `act_hi_taskinst` VALUES ('62519', 2, 'flow_p82g6ib8:5:57690', NULL, 'Activity_0vemk0z', '62504', '62515', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:16:19.607', NULL, '2025-08-20 09:32:07.505', 87347898, NULL, 50, NULL, NULL, NULL, '', '2025-08-20 09:32:07.505');
INSERT INTO `act_hi_taskinst` VALUES ('62532', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '62522', '62528', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:16:43.481', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 09:16:43.481');
INSERT INTO `act_hi_taskinst` VALUES ('65011', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '65001', '65007', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:18:55.198', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 09:18:55.198');
INSERT INTO `act_hi_taskinst` VALUES ('65025', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '65014', '65021', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:22:32.889', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_taskinst` VALUES ('67512', 1, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '67501', '67508', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:34:34.920', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, '', '2025-08-19 09:34:34.932');
INSERT INTO `act_hi_taskinst` VALUES ('67526', 2, 'flow_rmnt89qb:19:57642', NULL, 'Activity_04q4vtx', '67515', '67522', NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, NULL, '2', '2025-08-19 09:34:53.895', NULL, '2025-08-20 09:31:42.540', 86208645, NULL, 50, NULL, NULL, NULL, '', '2025-08-20 09:31:42.540');
INSERT INTO `act_hi_taskinst` VALUES ('70007', 2, 'flow_rmnt89qb:19:57642', NULL, 'Activity_0lpu6za', '67515', '67522', NULL, NULL, NULL, NULL, NULL, '审批2', NULL, NULL, NULL, '1', '2025-08-20 09:31:42.561', NULL, '2025-08-20 09:38:32.939', 410378, NULL, 50, NULL, NULL, NULL, '', '2025-08-20 09:38:32.939');
INSERT INTO `act_hi_taskinst` VALUES ('70013', 2, 'flow_p82g6ib8:5:57690', NULL, 'Activity_005chiy', '62504', '62515', NULL, NULL, NULL, NULL, NULL, '审批2', NULL, NULL, NULL, '1', '2025-08-20 09:32:07.506', NULL, '2025-08-20 09:38:38.967', 391461, NULL, 50, NULL, NULL, NULL, '', '2025-08-20 09:38:38.967');

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_tsk_log`;
CREATE TABLE `act_hi_tsk_log`  (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('42504', 0, '42501', '42501', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '42505', NULL, NULL, NULL, NULL, '2025-08-14 11:02:50.464', '2025-08-14 11:02:50.464');
INSERT INTO `act_hi_varinst` VALUES ('42506', 0, '42501', '42501', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '贺秋雨', NULL, '2025-08-14 11:02:50.464', '2025-08-14 11:02:50.464');
INSERT INTO `act_hi_varinst` VALUES ('42507', 0, '42501', '42501', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-14 11:02:50.464', '2025-08-14 11:02:50.464');
INSERT INTO `act_hi_varinst` VALUES ('45004', 1, '45001', '45001', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '45005', NULL, NULL, NULL, NULL, '2025-08-14 15:30:55.342', '2025-08-14 15:31:27.197');
INSERT INTO `act_hi_varinst` VALUES ('45006', 1, '45001', '45001', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'heqiuyu', NULL, '2025-08-14 15:30:55.342', '2025-08-14 15:31:27.194');
INSERT INTO `act_hi_varinst` VALUES ('45007', 0, '45001', '45001', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-14 15:30:55.342', '2025-08-14 15:30:55.342');
INSERT INTO `act_hi_varinst` VALUES ('47504', 0, '47501', '47501', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '47505', NULL, NULL, NULL, NULL, '2025-08-18 11:38:48.197', '2025-08-18 11:38:48.197');
INSERT INTO `act_hi_varinst` VALUES ('47506', 0, '47501', '47501', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '啊', NULL, '2025-08-18 11:38:48.197', '2025-08-18 11:38:48.197');
INSERT INTO `act_hi_varinst` VALUES ('47507', 0, '47501', '47501', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-18 11:38:48.197', '2025-08-18 11:38:48.197');
INSERT INTO `act_hi_varinst` VALUES ('47521', 0, '47518', '47518', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '47522', NULL, NULL, NULL, NULL, '2025-08-18 14:26:53.737', '2025-08-18 14:26:53.737');
INSERT INTO `act_hi_varinst` VALUES ('47523', 0, '47518', '47518', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'heqiuyu', NULL, '2025-08-18 14:26:53.737', '2025-08-18 14:26:53.737');
INSERT INTO `act_hi_varinst` VALUES ('47524', 0, '47518', '47518', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-18 14:26:53.737', '2025-08-18 14:26:53.737');
INSERT INTO `act_hi_varinst` VALUES ('47534', 1, '47531', '47531', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '47535', NULL, NULL, NULL, NULL, '2025-08-18 14:28:47.364', '2025-08-18 14:33:38.782');
INSERT INTO `act_hi_varinst` VALUES ('47536', 1, '47531', '47531', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'o', NULL, '2025-08-18 14:28:47.364', '2025-08-18 14:33:38.781');
INSERT INTO `act_hi_varinst` VALUES ('47537', 0, '47531', '47531', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-18 14:28:47.364', '2025-08-18 14:28:47.364');
INSERT INTO `act_hi_varinst` VALUES ('50004', 0, '50001', '50001', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '50005', NULL, NULL, NULL, NULL, '2025-08-18 14:35:18.036', '2025-08-18 14:35:18.036');
INSERT INTO `act_hi_varinst` VALUES ('50006', 0, '50001', '50001', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL, '2025-08-18 14:35:18.036', '2025-08-18 14:35:18.036');
INSERT INTO `act_hi_varinst` VALUES ('50007', 0, '50001', '50001', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-18 14:35:18.036', '2025-08-18 14:35:18.036');
INSERT INTO `act_hi_varinst` VALUES ('52504', 0, '52501', '52501', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '52505', NULL, NULL, NULL, NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486');
INSERT INTO `act_hi_varinst` VALUES ('52506', 0, '52501', '52501', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486');
INSERT INTO `act_hi_varinst` VALUES ('52507', 0, '52501', '52501', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486');
INSERT INTO `act_hi_varinst` VALUES ('52517', 0, '52514', '52514', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '52518', NULL, NULL, NULL, NULL, '2025-08-18 14:37:29.860', '2025-08-18 14:37:29.860');
INSERT INTO `act_hi_varinst` VALUES ('52519', 0, '52514', '52514', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862');
INSERT INTO `act_hi_varinst` VALUES ('52520', 0, '52514', '52514', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862');
INSERT INTO `act_hi_varinst` VALUES ('55012', 0, '55009', '55009', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '55013', NULL, NULL, NULL, NULL, '2025-08-18 15:29:18.482', '2025-08-18 15:29:18.482');
INSERT INTO `act_hi_varinst` VALUES ('55014', 0, '55009', '55009', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'heqiuyu', NULL, '2025-08-18 15:29:18.482', '2025-08-18 15:29:18.482');
INSERT INTO `act_hi_varinst` VALUES ('55015', 0, '55009', '55009', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2025-08-18 15:29:18.482', '2025-08-18 15:29:18.482');
INSERT INTO `act_hi_varinst` VALUES ('55017', 0, '55009', '55009', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '55018', NULL, NULL, NULL, NULL, '2025-08-18 15:29:18.482', '2025-08-18 15:29:18.482');
INSERT INTO `act_hi_varinst` VALUES ('55019', 0, '55009', '55009', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-18 15:29:18.482', '2025-08-18 15:29:18.482');
INSERT INTO `act_hi_varinst` VALUES ('57504', 0, '57501', '57501', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57505', NULL, NULL, NULL, NULL, '2025-08-19 07:54:46.307', '2025-08-19 07:54:46.307');
INSERT INTO `act_hi_varinst` VALUES ('57506', 0, '57501', '57501', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 07:54:46.307', '2025-08-19 07:54:46.307');
INSERT INTO `act_hi_varinst` VALUES ('57507', 0, '57501', '57501', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 07:54:46.307', '2025-08-19 07:54:46.307');
INSERT INTO `act_hi_varinst` VALUES ('57508', 0, '57501', '57501', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 07:54:46.307', '2025-08-19 07:54:46.307');
INSERT INTO `act_hi_varinst` VALUES ('57509', 0, '57501', '57501', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 1, '1', NULL, '2025-08-19 07:54:46.307', '2025-08-19 07:54:46.307');
INSERT INTO `act_hi_varinst` VALUES ('57543', 0, '57540', '57540', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57544', NULL, NULL, NULL, NULL, '2025-08-19 08:04:46.495', '2025-08-19 08:04:46.495');
INSERT INTO `act_hi_varinst` VALUES ('57545', 0, '57540', '57540', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '啊', NULL, '2025-08-19 08:04:46.495', '2025-08-19 08:04:46.495');
INSERT INTO `act_hi_varinst` VALUES ('57546', 0, '57540', '57540', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '啊', NULL, '2025-08-19 08:04:46.495', '2025-08-19 08:04:46.495');
INSERT INTO `act_hi_varinst` VALUES ('57548', 0, '57540', '57540', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '57549', NULL, NULL, NULL, NULL, '2025-08-19 08:04:46.495', '2025-08-19 08:04:46.495');
INSERT INTO `act_hi_varinst` VALUES ('57550', 0, '57540', '57540', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:04:46.496', '2025-08-19 08:04:46.496');
INSERT INTO `act_hi_varinst` VALUES ('57561', 0, '57558', '57558', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57562', NULL, NULL, NULL, NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968');
INSERT INTO `act_hi_varinst` VALUES ('57563', 0, '57558', '57558', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968');
INSERT INTO `act_hi_varinst` VALUES ('57564', 0, '57558', '57558', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '213', NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968');
INSERT INTO `act_hi_varinst` VALUES ('57566', 0, '57558', '57558', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '57567', NULL, NULL, NULL, NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968');
INSERT INTO `act_hi_varinst` VALUES ('57568', 0, '57558', '57558', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968');
INSERT INTO `act_hi_varinst` VALUES ('57579', 0, '57576', '57576', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57580', NULL, NULL, NULL, NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.315');
INSERT INTO `act_hi_varinst` VALUES ('57581', 0, '57576', '57576', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.315');
INSERT INTO `act_hi_varinst` VALUES ('57582', 0, '57576', '57576', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.315');
INSERT INTO `act_hi_varinst` VALUES ('57584', 0, '57576', '57576', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '57585', NULL, NULL, NULL, NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.315');
INSERT INTO `act_hi_varinst` VALUES ('57586', 0, '57576', '57576', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.315');
INSERT INTO `act_hi_varinst` VALUES ('57596', 0, '57594', '57594', NULL, '__v_isShallow', 'boolean', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2025-08-19 08:15:56.144', '2025-08-19 08:15:56.144');
INSERT INTO `act_hi_varinst` VALUES ('57597', 0, '57594', '57594', NULL, '__v_isRef', 'boolean', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-19 08:15:56.144', '2025-08-19 08:15:56.144');
INSERT INTO `act_hi_varinst` VALUES ('57599', 0, '57594', '57594', NULL, '_rawValue', 'serializable', NULL, NULL, NULL, '57600', NULL, NULL, NULL, NULL, '2025-08-19 08:15:56.144', '2025-08-19 08:15:56.144');
INSERT INTO `act_hi_varinst` VALUES ('57602', 0, '57594', '57594', NULL, '_value', 'serializable', NULL, NULL, NULL, '57603', NULL, NULL, NULL, NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145');
INSERT INTO `act_hi_varinst` VALUES ('57604', 0, '57594', '57594', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145');
INSERT INTO `act_hi_varinst` VALUES ('57613', 0, '57611', '57611', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'qwe', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824');
INSERT INTO `act_hi_varinst` VALUES ('57614', 0, '57611', '57611', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824');
INSERT INTO `act_hi_varinst` VALUES ('57615', 0, '57611', '57611', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824');
INSERT INTO `act_hi_varinst` VALUES ('57616', 0, '57611', '57611', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824');
INSERT INTO `act_hi_varinst` VALUES ('57625', 0, '57623', '57623', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150');
INSERT INTO `act_hi_varinst` VALUES ('57626', 0, '57623', '57623', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150');
INSERT INTO `act_hi_varinst` VALUES ('57627', 0, '57623', '57623', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150');
INSERT INTO `act_hi_varinst` VALUES ('57628', 0, '57623', '57623', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150');
INSERT INTO `act_hi_varinst` VALUES ('57645', 0, '57643', '57643', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310');
INSERT INTO `act_hi_varinst` VALUES ('57646', 0, '57643', '57643', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310');
INSERT INTO `act_hi_varinst` VALUES ('57647', 0, '57643', '57643', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310');
INSERT INTO `act_hi_varinst` VALUES ('57648', 0, '57643', '57643', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310');
INSERT INTO `act_hi_varinst` VALUES ('57658', 0, '57656', '57656', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 08:21:10.226', '2025-08-19 08:21:10.226');
INSERT INTO `act_hi_varinst` VALUES ('57659', 0, '57656', '57656', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227');
INSERT INTO `act_hi_varinst` VALUES ('57660', 0, '57656', '57656', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227');
INSERT INTO `act_hi_varinst` VALUES ('57661', 0, '57656', '57656', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227');
INSERT INTO `act_hi_varinst` VALUES ('57672', 0, '57669', '57669', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57673', NULL, NULL, NULL, NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_varinst` VALUES ('57674', 0, '57669', '57669', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_varinst` VALUES ('57675', 0, '57669', '57669', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_varinst` VALUES ('57677', 0, '57669', '57669', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '57678', NULL, NULL, NULL, NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_varinst` VALUES ('57679', 0, '57669', '57669', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203');
INSERT INTO `act_hi_varinst` VALUES ('57694', 2, '57691', '57691', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '57695', NULL, NULL, NULL, NULL, '2025-08-19 08:24:03.369', '2025-08-19 08:55:14.759');
INSERT INTO `act_hi_varinst` VALUES ('57696', 2, '57691', '57691', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:24:03.369', '2025-08-19 08:55:14.754');
INSERT INTO `act_hi_varinst` VALUES ('57697', 2, '57691', '57691', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 08:24:03.369', '2025-08-19 08:55:14.755');
INSERT INTO `act_hi_varinst` VALUES ('57699', 2, '57691', '57691', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '57700', NULL, NULL, NULL, NULL, '2025-08-19 08:24:03.369', '2025-08-19 08:55:14.757');
INSERT INTO `act_hi_varinst` VALUES ('57701', 0, '57691', '57691', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 08:24:03.369', '2025-08-19 08:24:03.369');
INSERT INTO `act_hi_varinst` VALUES ('62507', 2, '62504', '62504', NULL, 'formJson', 'serializable', NULL, NULL, NULL, '62508', NULL, NULL, NULL, NULL, '2025-08-19 09:16:19.607', '2025-08-20 09:38:38.966');
INSERT INTO `act_hi_varinst` VALUES ('62509', 2, '62504', '62504', NULL, '啊啊', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 09:16:19.607', '2025-08-20 09:38:38.965');
INSERT INTO `act_hi_varinst` VALUES ('62510', 2, '62504', '62504', NULL, 'input46537', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL, '2025-08-19 09:16:19.607', '2025-08-20 09:38:38.966');
INSERT INTO `act_hi_varinst` VALUES ('62512', 2, '62504', '62504', NULL, 'daterange83468', 'serializable', NULL, NULL, NULL, '62513', NULL, NULL, NULL, NULL, '2025-08-19 09:16:19.607', '2025-08-20 09:38:38.966');
INSERT INTO `act_hi_varinst` VALUES ('62514', 0, '62504', '62504', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:16:19.607', '2025-08-19 09:16:19.607');
INSERT INTO `act_hi_varinst` VALUES ('62524', 0, '62522', '62522', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481');
INSERT INTO `act_hi_varinst` VALUES ('62525', 0, '62522', '62522', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481');
INSERT INTO `act_hi_varinst` VALUES ('62526', 0, '62522', '62522', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481');
INSERT INTO `act_hi_varinst` VALUES ('62527', 0, '62522', '62522', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481');
INSERT INTO `act_hi_varinst` VALUES ('65003', 0, '65001', '65001', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198');
INSERT INTO `act_hi_varinst` VALUES ('65004', 0, '65001', '65001', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198');
INSERT INTO `act_hi_varinst` VALUES ('65005', 0, '65001', '65001', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198');
INSERT INTO `act_hi_varinst` VALUES ('65006', 0, '65001', '65001', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198');
INSERT INTO `act_hi_varinst` VALUES ('65016', 0, '65014', '65014', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_varinst` VALUES ('65017', 0, '65014', '65014', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_varinst` VALUES ('65018', 0, '65014', '65014', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_varinst` VALUES ('65019', 0, '65014', '65014', NULL, 'deployId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '57639', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_varinst` VALUES ('65020', 0, '65014', '65014', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889');
INSERT INTO `act_hi_varinst` VALUES ('67503', 0, '67501', '67501', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 09:34:34.916', '2025-08-19 09:34:34.916');
INSERT INTO `act_hi_varinst` VALUES ('67504', 0, '67501', '67501', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 09:34:34.916', '2025-08-19 09:34:34.916');
INSERT INTO `act_hi_varinst` VALUES ('67505', 0, '67501', '67501', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 09:34:34.916', '2025-08-19 09:34:34.916');
INSERT INTO `act_hi_varinst` VALUES ('67506', 0, '67501', '67501', NULL, 'deployId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '57639', NULL, '2025-08-19 09:34:34.916', '2025-08-19 09:34:34.916');
INSERT INTO `act_hi_varinst` VALUES ('67507', 0, '67501', '67501', NULL, 'INITIATOR', 'long', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:34:34.916', '2025-08-19 09:34:34.916');
INSERT INTO `act_hi_varinst` VALUES ('67517', 2, '67515', '67515', NULL, 'applicantName', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL, '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.939');
INSERT INTO `act_hi_varinst` VALUES ('67518', 2, '67515', '67515', NULL, 'leaveType', 'string', NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL, '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.937');
INSERT INTO `act_hi_varinst` VALUES ('67519', 2, '67515', '67515', NULL, 'taskId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.939');
INSERT INTO `act_hi_varinst` VALUES ('67520', 2, '67515', '67515', NULL, 'deployId', 'string', NULL, NULL, NULL, NULL, NULL, NULL, '57639', NULL, '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.939');
INSERT INTO `act_hi_varinst` VALUES ('67521', 2, '67515', '67515', NULL, 'INITIATOR', 'integer', NULL, NULL, NULL, NULL, NULL, 100, '100', NULL, '2025-08-19 09:34:53.895', '2025-08-20 09:38:32.939');
INSERT INTO `act_hi_varinst` VALUES ('70003', 1, '67515', '67515', NULL, 'form', 'serializable', NULL, NULL, NULL, '70004', NULL, NULL, NULL, NULL, '2025-08-20 09:31:42.537', '2025-08-20 09:38:32.938');

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_id_bytearray`;
CREATE TABLE `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `act_id_membership_ibfk_1` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_id_membership_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv`;
CREATE TABLE `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
DROP TABLE IF EXISTS `act_id_priv_mapping`;
CREATE TABLE `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `act_id_priv_mapping_ibfk_1` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
DROP TABLE IF EXISTS `act_id_property`;
CREATE TABLE `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT INTO `act_id_property` VALUES ('schema.version', '6.8.0.0', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
DROP TABLE IF EXISTS `act_id_token`;
CREATE TABLE `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `act_procdef_info_ibfk_1` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_procdef_info_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('10001', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-13 17:34:12.257', NULL, NULL, '10001', NULL);
INSERT INTO `act_re_deployment` VALUES ('10005', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 07:59:03.789', NULL, NULL, '10005', NULL);
INSERT INTO `act_re_deployment` VALUES ('10009', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:00:51.796', NULL, NULL, '10009', NULL);
INSERT INTO `act_re_deployment` VALUES ('12501', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:06:38.991', NULL, NULL, '12501', NULL);
INSERT INTO `act_re_deployment` VALUES ('15001', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:09:37.900', NULL, NULL, '15001', NULL);
INSERT INTO `act_re_deployment` VALUES ('15005', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:13:24.160', NULL, NULL, '15005', NULL);
INSERT INTO `act_re_deployment` VALUES ('15009', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:15:26.081', NULL, NULL, '15009', NULL);
INSERT INTO `act_re_deployment` VALUES ('17501', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:17:27.469', NULL, NULL, '17501', NULL);
INSERT INTO `act_re_deployment` VALUES ('20001', 'flow_yvmruh6h_回退版本_1755131614402', 'rollback', NULL, '', '2025-08-14 08:33:34.403', NULL, NULL, '20001', NULL);
INSERT INTO `act_re_deployment` VALUES ('20005', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-14 08:41:41.767', NULL, NULL, '20005', NULL);
INSERT INTO `act_re_deployment` VALUES ('47514', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-18 14:09:40.510', NULL, NULL, '47514', NULL);
INSERT INTO `act_re_deployment` VALUES ('55001', 'flow_yvmruh6h_回退版本_1755500547417', 'rollback', NULL, '', '2025-08-18 15:02:27.420', NULL, NULL, '55001', NULL);
INSERT INTO `act_re_deployment` VALUES ('55005', 'flow_yvmruh6h_回退版本_1755502025163', 'rollback', NULL, '', '2025-08-18 15:27:05.164', NULL, NULL, '55005', NULL);
INSERT INTO `act_re_deployment` VALUES ('55030', 'flow_yvmruh6h_回退版本_1755500547417_回退版本_1755502199924', 'rollback', NULL, '', '2025-08-18 15:29:59.924', NULL, NULL, '55030', NULL);
INSERT INTO `act_re_deployment` VALUES ('57516', '请假', NULL, NULL, '', '2025-08-19 08:01:42.399', NULL, NULL, '57516', NULL);
INSERT INTO `act_re_deployment` VALUES ('57520', '请假外部页面', 'leave', NULL, '', '2025-08-19 08:02:00.139', NULL, NULL, '57520', NULL);
INSERT INTO `act_re_deployment` VALUES ('57524', '结束', NULL, NULL, '', '2025-08-19 08:03:24.644', NULL, NULL, '57524', NULL);
INSERT INTO `act_re_deployment` VALUES ('57528', '结束', NULL, NULL, '', '2025-08-19 08:03:42.295', NULL, NULL, '57528', NULL);
INSERT INTO `act_re_deployment` VALUES ('57532', '结束', NULL, NULL, '', '2025-08-19 08:03:57.988', NULL, NULL, '57532', NULL);
INSERT INTO `act_re_deployment` VALUES ('57536', '请假内部页面', NULL, NULL, '', '2025-08-19 08:04:14.133', NULL, NULL, '57536', NULL);
INSERT INTO `act_re_deployment` VALUES ('57635', '请假外部页面', 'leave', NULL, '', '2025-08-19 08:18:45.711', NULL, NULL, '57635', NULL);
INSERT INTO `act_re_deployment` VALUES ('57639', '请假外部页面', 'leave', NULL, '', '2025-08-19 08:19:12.758', NULL, NULL, '57639', NULL);
INSERT INTO `act_re_deployment` VALUES ('57687', '请假内部页面', NULL, NULL, '', '2025-08-19 08:23:23.724', NULL, NULL, '57687', NULL);
INSERT INTO `act_re_deployment` VALUES ('7514', 'flow_yvmruh6h', NULL, NULL, '', '2025-08-13 17:09:13.153', NULL, NULL, '7514', NULL);

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_re_model_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_re_model_ibfk_2` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_re_model_ibfk_3` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------
INSERT INTO `act_re_procdef` VALUES ('flow_p82g6ib8:1:57527', 2, NULL, '结束', 'flow_p82g6ib8', 1, '57524', '结束.bpmn', '结束.flow_p82g6ib8.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_p82g6ib8:2:57531', 2, NULL, '结束', 'flow_p82g6ib8', 2, '57528', '结束.bpmn', '结束.flow_p82g6ib8.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_p82g6ib8:3:57535', 2, NULL, '结束', 'flow_p82g6ib8', 3, '57532', '结束.bpmn', '结束.flow_p82g6ib8.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_p82g6ib8:4:57539', 2, NULL, '请假内部页面', 'flow_p82g6ib8', 4, '57536', '请假内部页面.bpmn', '请假内部页面.flow_p82g6ib8.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_p82g6ib8:5:57690', 2, NULL, '请假内部页面', 'flow_p82g6ib8', 5, '57687', '请假内部页面.bpmn', '请假内部页面.flow_p82g6ib8.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:10:20004', 1, 'http://www.flowable.org/processdef', 'flow_yvmruh6h', 'flow_rmnt89qb', 10, '20001', 'null.bpmn', 'null.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:11:20008', 4, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 11, '20005', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:12:47517', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 12, '47514', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:13:55004', 1, 'http://www.flowable.org/processdef', 'flow_yvmruh6h', 'flow_rmnt89qb', 13, '55001', 'null.bpmn', 'null.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:14:55008', 1, 'http://www.flowable.org/processdef', 'flow_yvmruh6h', 'flow_rmnt89qb', 14, '55005', 'null.bpmn', 'null.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:15:55033', 1, 'http://www.flowable.org/processdef', 'flow_yvmruh6h', 'flow_rmnt89qb', 15, '55030', 'null.bpmn', 'null.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:16:57519', 2, NULL, '请假', 'flow_rmnt89qb', 16, '57516', '请假.bpmn', '请假.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:17:57523', 2, 'leave', '请假外部页面', 'flow_rmnt89qb', 17, '57520', '请假外部页面.bpmn', '请假外部页面.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:18:57638', 2, 'leave', '请假外部页面', 'flow_rmnt89qb', 18, '57635', '请假外部页面.bpmn', '请假外部页面.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:19:57642', 2, 'leave', '请假外部页面', 'flow_rmnt89qb', 19, '57639', '请假外部页面.bpmn', '请假外部页面.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:1:7517', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 1, '7514', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:2:10004', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 2, '10001', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:3:10008', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 3, '10005', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:4:10012', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 4, '10009', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:5:12504', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 5, '12501', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:6:15004', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 6, '15001', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:7:15008', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 7, '15005', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:8:15012', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 8, '15009', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);
INSERT INTO `act_re_procdef` VALUES ('flow_rmnt89qb:9:17504', 2, NULL, 'flow_yvmruh6h', 'flow_rmnt89qb', 9, '17501', 'flow_yvmruh6h.bpmn', 'flow_yvmruh6h.flow_rmnt89qb.png', NULL, 0, 1, 1, '', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_actinst`;
CREATE TABLE `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_TASK`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------
INSERT INTO `act_ru_actinst` VALUES ('47526', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:26:53.737', '2025-08-18 14:26:53.737', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('47527', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:26:53.738', '2025-08-18 14:26:53.738', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('47528', 1, 'flow_rmnt89qb:12:47517', '47518', '47525', 'Activity_04q4vtx', '47529', NULL, '审批', 'userTask', NULL, '2025-08-18 14:26:53.738', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('50009', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:35:18.038', '2025-08-18 14:35:18.039', 1, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('50010', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:35:18.039', '2025-08-18 14:35:18.039', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('50011', 1, 'flow_rmnt89qb:12:47517', '50001', '50008', 'Activity_04q4vtx', '50012', NULL, '审批', 'userTask', NULL, '2025-08-18 14:35:18.039', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52509', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52510', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:37:26.486', '2025-08-18 14:37:26.486', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52511', 1, 'flow_rmnt89qb:12:47517', '52501', '52508', 'Activity_04q4vtx', '52512', NULL, '审批', 'userTask', NULL, '2025-08-18 14:37:26.486', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52522', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52523', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-18 14:37:29.862', '2025-08-18 14:37:29.862', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('52524', 1, 'flow_rmnt89qb:12:47517', '52514', '52521', 'Activity_04q4vtx', '52525', NULL, '审批', 'userTask', NULL, '2025-08-18 14:37:29.862', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57511', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 07:54:46.308', '2025-08-19 07:54:46.313', 5, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57512', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 07:54:46.314', '2025-08-19 07:54:46.314', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57513', 1, 'flow_rmnt89qb:15:55033', '57501', '57510', 'Activity_04q4vtx', '57514', NULL, '审批', 'userTask', NULL, '2025-08-19 07:54:46.315', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57552', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:04:46.496', '2025-08-19 08:04:46.496', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57553', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:04:46.496', '2025-08-19 08:04:46.496', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57554', 1, 'flow_p82g6ib8:4:57539', '57540', '57551', 'Activity_0vemk0z', '57555', NULL, '审批1', 'userTask', '1', '2025-08-19 08:04:46.496', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57570', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:06:51.968', '2025-08-19 08:06:51.968', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57571', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:06:51.969', '2025-08-19 08:06:51.969', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57572', 1, 'flow_p82g6ib8:4:57539', '57558', '57569', 'Activity_0vemk0z', '57573', NULL, '审批1', 'userTask', '1', '2025-08-19 08:06:51.969', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57588', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:15:20.315', '2025-08-19 08:15:20.317', 2, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57589', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:15:20.317', '2025-08-19 08:15:20.317', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57590', 1, 'flow_p82g6ib8:4:57539', '57576', '57587', 'Activity_0vemk0z', '57591', NULL, '审批1', 'userTask', '1', '2025-08-19 08:15:20.317', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57606', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57607', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:15:56.145', '2025-08-19 08:15:56.145', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57608', 1, 'flow_rmnt89qb:17:57523', '57594', '57605', 'Activity_04q4vtx', '57609', NULL, '审批', 'userTask', NULL, '2025-08-19 08:15:56.145', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57618', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57619', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:16:51.824', '2025-08-19 08:16:51.824', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57620', 1, 'flow_rmnt89qb:17:57523', '57611', '57617', 'Activity_04q4vtx', '57621', NULL, '审批', 'userTask', NULL, '2025-08-19 08:16:51.824', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57630', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57631', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:17:35.150', '2025-08-19 08:17:35.150', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57632', 1, 'flow_rmnt89qb:17:57523', '57623', '57629', 'Activity_04q4vtx', '57633', NULL, '审批', 'userTask', NULL, '2025-08-19 08:17:35.150', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57650', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57651', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:19:55.310', '2025-08-19 08:19:55.310', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57652', 1, 'flow_rmnt89qb:19:57642', '57643', '57649', 'Activity_04q4vtx', '57653', NULL, '审批1', 'userTask', '2', '2025-08-19 08:19:55.310', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57663', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57664', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:21:10.227', '2025-08-19 08:21:10.227', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57665', 1, 'flow_rmnt89qb:19:57642', '57656', '57662', 'Activity_04q4vtx', '57666', NULL, '审批1', 'userTask', '2', '2025-08-19 08:21:10.227', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57681', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57682', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'Flow_1i02yp6', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 08:22:16.203', '2025-08-19 08:22:16.203', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('57683', 1, 'flow_p82g6ib8:4:57539', '57669', '57680', 'Activity_0vemk0z', '57684', NULL, '审批1', 'userTask', '1', '2025-08-19 08:22:16.203', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('62529', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('62530', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:16:43.481', '2025-08-19 09:16:43.481', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('62531', 1, 'flow_rmnt89qb:19:57642', '62522', '62528', 'Activity_04q4vtx', '62532', NULL, '审批1', 'userTask', '2', '2025-08-19 09:16:43.481', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65008', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65009', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:18:55.198', '2025-08-19 09:18:55.198', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65010', 1, 'flow_rmnt89qb:19:57642', '65001', '65007', 'Activity_04q4vtx', '65011', NULL, '审批1', 'userTask', '2', '2025-08-19 09:18:55.198', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65022', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889', 0, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65023', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:22:32.889', '2025-08-19 09:22:32.889', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('65024', 1, 'flow_rmnt89qb:19:57642', '65014', '65021', 'Activity_04q4vtx', '65025', NULL, '审批1', 'userTask', '2', '2025-08-19 09:22:32.889', NULL, NULL, 3, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('67509', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'start_event', NULL, NULL, '开始', 'startEvent', NULL, '2025-08-19 09:34:34.918', '2025-08-19 09:34:34.919', 1, 1, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('67510', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'Flow_1hhdvmu', NULL, NULL, NULL, 'sequenceFlow', NULL, '2025-08-19 09:34:34.920', '2025-08-19 09:34:34.920', 0, 2, NULL, '');
INSERT INTO `act_ru_actinst` VALUES ('67511', 1, 'flow_rmnt89qb:19:57642', '67501', '67508', 'Activity_04q4vtx', '67512', NULL, '审批1', 'userTask', '2', '2025-08-19 09:34:34.920', NULL, NULL, 3, NULL, '');

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_deadletter_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_deadletter_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_entitylink`;
CREATE TABLE `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_REF_SCOPE`(`REF_SCOPE_ID_`, `REF_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_ROOT_SCOPE`(`ROOT_SCOPE_ID_`, `ROOT_SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_SCOPEREF_`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `act_ru_event_subscr_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_REF_ID_`(`REFERENCE_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_4` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('47518', 1, '47518', NULL, NULL, 'flow_rmnt89qb:12:47517', NULL, '47518', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-18 14:26:53.733', '1', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('47525', 1, '47518', NULL, '47518', 'flow_rmnt89qb:12:47517', NULL, '47518', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-18 14:26:53.737', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('50001', 1, '50001', NULL, NULL, 'flow_rmnt89qb:12:47517', NULL, '50001', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-18 14:35:18.013', '1', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('50008', 1, '50001', NULL, '50001', 'flow_rmnt89qb:12:47517', NULL, '50001', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-18 14:35:18.036', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('52501', 1, '52501', NULL, NULL, 'flow_rmnt89qb:12:47517', NULL, '52501', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-18 14:37:26.479', '1', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('52508', 1, '52501', NULL, '52501', 'flow_rmnt89qb:12:47517', NULL, '52501', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-18 14:37:26.486', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('52514', 1, '52514', NULL, NULL, 'flow_rmnt89qb:12:47517', NULL, '52514', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-18 14:37:29.860', '1', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('52521', 1, '52514', NULL, '52514', 'flow_rmnt89qb:12:47517', NULL, '52514', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-18 14:37:29.862', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57501', 1, '57501', NULL, NULL, 'flow_rmnt89qb:15:55033', NULL, '57501', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 07:54:46.289', '1', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57510', 1, '57501', NULL, '57501', 'flow_rmnt89qb:15:55033', NULL, '57501', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 07:54:46.307', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57540', 1, '57540', NULL, NULL, 'flow_p82g6ib8:4:57539', NULL, '57540', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:04:46.491', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57551', 1, '57540', NULL, '57540', 'flow_p82g6ib8:4:57539', NULL, '57540', 'Activity_0vemk0z', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:04:46.496', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57558', 1, '57558', NULL, NULL, 'flow_p82g6ib8:4:57539', NULL, '57558', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:06:51.968', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57569', 1, '57558', NULL, '57558', 'flow_p82g6ib8:4:57539', NULL, '57558', 'Activity_0vemk0z', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:06:51.968', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57576', 1, '57576', NULL, NULL, 'flow_p82g6ib8:4:57539', NULL, '57576', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:15:20.313', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57587', 1, '57576', NULL, '57576', 'flow_p82g6ib8:4:57539', NULL, '57576', 'Activity_0vemk0z', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:15:20.315', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57594', 1, '57594', NULL, NULL, 'flow_rmnt89qb:17:57523', NULL, '57594', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:15:56.144', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57605', 1, '57594', NULL, '57594', 'flow_rmnt89qb:17:57523', NULL, '57594', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:15:56.145', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57611', 1, '57611', NULL, NULL, 'flow_rmnt89qb:17:57523', NULL, '57611', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:16:51.824', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57617', 1, '57611', NULL, '57611', 'flow_rmnt89qb:17:57523', NULL, '57611', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:16:51.824', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57623', 1, '57623', NULL, NULL, 'flow_rmnt89qb:17:57523', NULL, '57623', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:17:35.150', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57629', 1, '57623', NULL, '57623', 'flow_rmnt89qb:17:57523', NULL, '57623', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:17:35.150', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57643', 1, '57643', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '57643', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:19:55.310', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57649', 1, '57643', NULL, '57643', 'flow_rmnt89qb:19:57642', NULL, '57643', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:19:55.310', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57656', 1, '57656', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '57656', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:21:10.226', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57662', 1, '57656', NULL, '57656', 'flow_rmnt89qb:19:57642', NULL, '57656', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:21:10.227', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57669', 1, '57669', NULL, NULL, 'flow_p82g6ib8:4:57539', NULL, '57669', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 08:22:16.203', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('57680', 1, '57669', NULL, '57669', 'flow_p82g6ib8:4:57539', NULL, '57669', 'Activity_0vemk0z', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 08:22:16.203', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('62522', 1, '62522', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '62522', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 09:16:43.481', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('62528', 1, '62522', NULL, '62522', 'flow_rmnt89qb:19:57642', NULL, '62522', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 09:16:43.481', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('65001', 1, '65001', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '65001', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 09:18:55.185', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('65007', 1, '65001', NULL, '65001', 'flow_rmnt89qb:19:57642', NULL, '65001', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 09:18:55.198', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('65014', 1, '65014', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '65014', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 09:22:32.888', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('65021', 1, '65014', NULL, '65014', 'flow_rmnt89qb:19:57642', NULL, '65014', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 09:22:32.889', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('67501', 1, '67501', NULL, NULL, 'flow_rmnt89qb:19:57642', NULL, '67501', NULL, 1, 0, 1, 0, 0, 1, NULL, '', NULL, 'start_event', '2025-08-19 09:34:34.907', '100', NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_execution` VALUES ('67508', 1, '67501', NULL, '67501', 'flow_rmnt89qb:19:57642', NULL, '67501', 'Activity_04q4vtx', 1, 0, 0, 0, 0, 1, NULL, '', NULL, NULL, '2025-08-19 09:34:34.918', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_external_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_external_job`;
CREATE TABLE `act_ru_external_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_EJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  CONSTRAINT `act_ru_external_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_external_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_external_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_history_job`;
CREATE TABLE `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('47519', 1, NULL, 'starter', '1', NULL, '47518', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('47530', 1, '3', 'candidate', NULL, '47529', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('50002', 1, NULL, 'starter', '1', NULL, '50001', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('50013', 1, '3', 'candidate', NULL, '50012', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('52502', 1, NULL, 'starter', '1', NULL, '52501', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('52513', 1, '3', 'candidate', NULL, '52512', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('52515', 1, NULL, 'starter', '1', NULL, '52514', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('52526', 1, '3', 'candidate', NULL, '52525', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57502', 1, NULL, 'starter', '1', NULL, '57501', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57515', 1, '3', 'candidate', NULL, '57514', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57541', 1, NULL, 'starter', '100', NULL, '57540', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57557', 1, NULL, 'participant', '1', NULL, '57540', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57559', 1, NULL, 'starter', '100', NULL, '57558', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57575', 1, NULL, 'participant', '1', NULL, '57558', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57577', 1, NULL, 'starter', '100', NULL, '57576', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57593', 1, NULL, 'participant', '1', NULL, '57576', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57595', 1, NULL, 'starter', '100', NULL, '57594', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57610', 1, '3', 'candidate', NULL, '57609', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57612', 1, NULL, 'starter', '100', NULL, '57611', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57622', 1, '3', 'candidate', NULL, '57621', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57624', 1, NULL, 'starter', '100', NULL, '57623', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57634', 1, '3', 'candidate', NULL, '57633', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57644', 1, NULL, 'starter', '100', NULL, '57643', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57655', 1, NULL, 'participant', '2', NULL, '57643', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57657', 1, NULL, 'starter', '100', NULL, '57656', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57668', 1, NULL, 'participant', '2', NULL, '57656', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57670', 1, NULL, 'starter', '100', NULL, '57669', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('57686', 1, NULL, 'participant', '1', NULL, '57669', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('62523', 1, NULL, 'starter', '100', NULL, '62522', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('62534', 1, NULL, 'participant', '2', NULL, '62522', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('65002', 1, NULL, 'starter', '100', NULL, '65001', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('65013', 1, NULL, 'participant', '2', NULL, '65001', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('65015', 1, NULL, 'starter', '100', NULL, '65014', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('65027', 1, NULL, 'participant', '2', NULL, '65014', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('67502', 1, NULL, 'starter', '100', NULL, '67501', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_identitylink` VALUES ('67514', 1, NULL, 'participant', '2', NULL, '67501', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_suspended_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_suspended_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
INSERT INTO `act_ru_task` VALUES ('47529', 1, '47525', '47518', 'flow_rmnt89qb:12:47517', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-18 14:26:53.738', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('50012', 1, '50008', '50001', 'flow_rmnt89qb:12:47517', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-18 14:35:18.039', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('52512', 1, '52508', '52501', 'flow_rmnt89qb:12:47517', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-18 14:37:26.486', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('52525', 1, '52521', '52514', 'flow_rmnt89qb:12:47517', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-18 14:37:29.862', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('57514', 1, '57510', '57501', 'flow_rmnt89qb:15:55033', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-19 07:54:46.315', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('57555', 1, '57551', '57540', 'flow_p82g6ib8:4:57539', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_0vemk0z', NULL, '1', NULL, 50, '2025-08-19 08:04:46.496', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('57573', 1, '57569', '57558', 'flow_p82g6ib8:4:57539', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_0vemk0z', NULL, '1', NULL, 50, '2025-08-19 08:06:51.969', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('57591', 1, '57587', '57576', 'flow_p82g6ib8:4:57539', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_0vemk0z', NULL, '1', NULL, 50, '2025-08-19 08:15:20.317', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('57609', 1, '57605', '57594', 'flow_rmnt89qb:17:57523', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-19 08:15:56.145', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('57621', 1, '57617', '57611', 'flow_rmnt89qb:17:57523', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-19 08:16:51.824', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('57633', 1, '57629', '57623', 'flow_rmnt89qb:17:57523', NULL, NULL, NULL, NULL, NULL, NULL, '审批', NULL, NULL, 'Activity_04q4vtx', NULL, NULL, NULL, 50, '2025-08-19 08:17:35.150', NULL, NULL, 1, '', NULL, NULL, 1, 0, 1, 0);
INSERT INTO `act_ru_task` VALUES ('57653', 1, '57649', '57643', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 08:19:55.310', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('57666', 1, '57662', '57656', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 08:21:10.227', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('57684', 1, '57680', '57669', 'flow_p82g6ib8:4:57539', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_0vemk0z', NULL, '1', NULL, 50, '2025-08-19 08:22:16.203', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('62532', 1, '62528', '62522', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 09:16:43.481', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('65011', 1, '65007', '65001', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 09:18:55.198', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('65025', 1, '65021', '65014', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 09:22:32.889', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);
INSERT INTO `act_ru_task` VALUES ('67512', 1, '67508', '67501', 'flow_rmnt89qb:19:57642', NULL, NULL, NULL, NULL, NULL, NULL, '审批1', NULL, NULL, 'Activity_04q4vtx', NULL, '2', NULL, 50, '2025-08-19 09:34:34.920', NULL, NULL, 1, '', NULL, NULL, 1, 0, 0, 0);

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CORRELATION_ID`(`CORRELATION_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_DUEDATE`(`DUEDATE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_timer_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_timer_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('47521', 1, 'serializable', 'formJson', '47518', '47518', NULL, NULL, NULL, NULL, '47520', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('47523', 1, 'string', '啊啊', '47518', '47518', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'heqiuyu', NULL);
INSERT INTO `act_ru_variable` VALUES ('47524', 1, 'long', 'INITIATOR', '47518', '47518', NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL);
INSERT INTO `act_ru_variable` VALUES ('50004', 1, 'serializable', 'formJson', '50001', '50001', NULL, NULL, NULL, NULL, '50003', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('50006', 1, 'string', '啊啊', '50001', '50001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL);
INSERT INTO `act_ru_variable` VALUES ('50007', 1, 'long', 'INITIATOR', '50001', '50001', NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL);
INSERT INTO `act_ru_variable` VALUES ('52504', 1, 'serializable', 'formJson', '52501', '52501', NULL, NULL, NULL, NULL, '52503', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('52506', 1, 'string', '啊啊', '52501', '52501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL);
INSERT INTO `act_ru_variable` VALUES ('52507', 1, 'long', 'INITIATOR', '52501', '52501', NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL);
INSERT INTO `act_ru_variable` VALUES ('52517', 1, 'serializable', 'formJson', '52514', '52514', NULL, NULL, NULL, NULL, '52516', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('52519', 1, 'string', '啊啊', '52514', '52514', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'taskid', NULL);
INSERT INTO `act_ru_variable` VALUES ('52520', 1, 'long', 'INITIATOR', '52514', '52514', NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL);
INSERT INTO `act_ru_variable` VALUES ('57504', 1, 'serializable', 'formJson', '57501', '57501', NULL, NULL, NULL, NULL, '57503', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57506', 1, 'string', 'applicantName', '57501', '57501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('57507', 1, 'string', 'leaveType', '57501', '57501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('57508', 1, 'string', 'taskId', '57501', '57501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('57509', 1, 'long', 'INITIATOR', '57501', '57501', NULL, NULL, NULL, NULL, NULL, NULL, 1, '1', NULL);
INSERT INTO `act_ru_variable` VALUES ('57543', 1, 'serializable', 'formJson', '57540', '57540', NULL, NULL, NULL, NULL, '57542', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57545', 1, 'string', '啊啊', '57540', '57540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '啊', NULL);
INSERT INTO `act_ru_variable` VALUES ('57546', 1, 'string', 'input46537', '57540', '57540', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '啊', NULL);
INSERT INTO `act_ru_variable` VALUES ('57548', 1, 'serializable', 'daterange83468', '57540', '57540', NULL, NULL, NULL, NULL, '57547', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57550', 1, 'long', 'INITIATOR', '57540', '57540', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57561', 1, 'serializable', 'formJson', '57558', '57558', NULL, NULL, NULL, NULL, '57560', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57563', 1, 'string', '啊啊', '57558', '57558', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL);
INSERT INTO `act_ru_variable` VALUES ('57564', 1, 'string', 'input46537', '57558', '57558', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '213', NULL);
INSERT INTO `act_ru_variable` VALUES ('57566', 1, 'serializable', 'daterange83468', '57558', '57558', NULL, NULL, NULL, NULL, '57565', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57568', 1, 'long', 'INITIATOR', '57558', '57558', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57579', 1, 'serializable', 'formJson', '57576', '57576', NULL, NULL, NULL, NULL, '57578', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57581', 1, 'string', '啊啊', '57576', '57576', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL);
INSERT INTO `act_ru_variable` VALUES ('57582', 1, 'string', 'input46537', '57576', '57576', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL);
INSERT INTO `act_ru_variable` VALUES ('57584', 1, 'serializable', 'daterange83468', '57576', '57576', NULL, NULL, NULL, NULL, '57583', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57586', 1, 'long', 'INITIATOR', '57576', '57576', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57596', 1, 'boolean', '__v_isShallow', '57594', '57594', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57597', 1, 'boolean', '__v_isRef', '57594', '57594', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57599', 1, 'serializable', '_rawValue', '57594', '57594', NULL, NULL, NULL, NULL, '57598', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57602', 1, 'serializable', '_value', '57594', '57594', NULL, NULL, NULL, NULL, '57601', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57604', 1, 'long', 'INITIATOR', '57594', '57594', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57613', 1, 'string', 'applicantName', '57611', '57611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qwe', NULL);
INSERT INTO `act_ru_variable` VALUES ('57614', 1, 'string', 'leaveType', '57611', '57611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('57615', 1, 'string', 'taskId', '57611', '57611', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('57616', 1, 'long', 'INITIATOR', '57611', '57611', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57625', 1, 'string', 'applicantName', '57623', '57623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('57626', 1, 'string', 'leaveType', '57623', '57623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('57627', 1, 'string', 'taskId', '57623', '57623', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('57628', 1, 'long', 'INITIATOR', '57623', '57623', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57645', 1, 'string', 'applicantName', '57643', '57643', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('57646', 1, 'string', 'leaveType', '57643', '57643', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('57647', 1, 'string', 'taskId', '57643', '57643', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('57648', 1, 'long', 'INITIATOR', '57643', '57643', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57658', 1, 'string', 'applicantName', '57656', '57656', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('57659', 1, 'string', 'leaveType', '57656', '57656', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('57660', 1, 'string', 'taskId', '57656', '57656', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('57661', 1, 'long', 'INITIATOR', '57656', '57656', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('57672', 1, 'serializable', 'formJson', '57669', '57669', NULL, NULL, NULL, NULL, '57671', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57674', 1, 'string', '啊啊', '57669', '57669', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL);
INSERT INTO `act_ru_variable` VALUES ('57675', 1, 'string', 'input46537', '57669', '57669', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123', NULL);
INSERT INTO `act_ru_variable` VALUES ('57677', 1, 'serializable', 'daterange83468', '57669', '57669', NULL, NULL, NULL, NULL, '57676', NULL, NULL, NULL, NULL);
INSERT INTO `act_ru_variable` VALUES ('57679', 1, 'long', 'INITIATOR', '57669', '57669', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('62524', 1, 'string', 'applicantName', '62522', '62522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('62525', 1, 'string', 'leaveType', '62522', '62522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('62526', 1, 'string', 'taskId', '62522', '62522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('62527', 1, 'long', 'INITIATOR', '62522', '62522', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('65003', 1, 'string', 'applicantName', '65001', '65001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('65004', 1, 'string', 'leaveType', '65001', '65001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('65005', 1, 'string', 'taskId', '65001', '65001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('65006', 1, 'long', 'INITIATOR', '65001', '65001', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('65016', 1, 'string', 'applicantName', '65014', '65014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('65017', 1, 'string', 'leaveType', '65014', '65014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('65018', 1, 'string', 'taskId', '65014', '65014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('65019', 1, 'string', 'deployId', '65014', '65014', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '57639', NULL);
INSERT INTO `act_ru_variable` VALUES ('65020', 1, 'long', 'INITIATOR', '65014', '65014', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);
INSERT INTO `act_ru_variable` VALUES ('67503', 1, 'string', 'applicantName', '67501', '67501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', NULL);
INSERT INTO `act_ru_variable` VALUES ('67504', 1, 'string', 'leaveType', '67501', '67501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sick', NULL);
INSERT INTO `act_ru_variable` VALUES ('67505', 1, 'string', 'taskId', '67501', '67501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `act_ru_variable` VALUES ('67506', 1, 'string', 'deployId', '67501', '67501', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '57639', NULL);
INSERT INTO `act_ru_variable` VALUES ('67507', 1, 'long', 'INITIATOR', '67501', '67501', NULL, NULL, NULL, NULL, NULL, NULL, 100, '100', NULL);

-- ----------------------------
-- Table structure for flow_initiator_config
-- ----------------------------
DROP TABLE IF EXISTS `flow_initiator_config`;
CREATE TABLE `flow_initiator_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `deploy_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程部署ID',
  `proc_def_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程定义ID',
  `proc_def_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程定义Key',
  `initiator_type` tinyint(2) NOT NULL COMMENT '发起人类型：1-用户，2-部门，3-角色',
  `initiator_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发起人ID（用户ID、部门ID或角色ID）',
  `initiator_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起人名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人员',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人员',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_deploy_id`(`deploy_id`) USING BTREE,
  INDEX `idx_proc_def_id`(`proc_def_id`) USING BTREE,
  INDEX `idx_proc_def_key`(`proc_def_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程发起人配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flow_initiator_config
-- ----------------------------
INSERT INTO `flow_initiator_config` VALUES (1, '17501', 'flow_rmnt89qb:9:17504', 'flow_rmnt89qb', 3, '3', '领导组', '2025-08-14 08:17:28', 'admin', '2025-08-14 08:17:27', NULL);
INSERT INTO `flow_initiator_config` VALUES (2, '20005', 'flow_rmnt89qb:11:20008', 'flow_rmnt89qb', 3, '2', '普通角色', '2025-08-14 08:41:42', 'admin', '2025-08-14 08:41:41', NULL);
INSERT INTO `flow_initiator_config` VALUES (3, '57516', 'flow_rmnt89qb:16:57519', 'flow_rmnt89qb', 3, '2', '普通角色', '2025-08-19 08:01:43', 'admin', '2025-08-19 08:01:42', NULL);
INSERT INTO `flow_initiator_config` VALUES (4, '57520', 'flow_rmnt89qb:17:57523', 'flow_rmnt89qb', 3, '2', '普通角色', '2025-08-19 08:02:00', 'admin', '2025-08-19 08:02:00', NULL);
INSERT INTO `flow_initiator_config` VALUES (5, '57639', 'flow_rmnt89qb:19:57642', 'flow_rmnt89qb', 3, '2', '普通角色', '2025-08-19 08:19:13', 'admin', '2025-08-19 08:19:12', NULL);

-- ----------------------------
-- Table structure for flw_channel_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_channel_definition`;
CREATE TABLE `flw_channel_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CHANNEL_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_channel_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ev_databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
CREATE TABLE `flw_ev_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangelog
-- ----------------------------
INSERT INTO `flw_ev_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-08-12 17:07:40', 1, 'EXECUTED', '8:1b0c48c9cf7945be799d868a2626d687', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', NULL, '4.3.5', NULL, NULL, '4989660819');
INSERT INTO `flw_ev_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-08-12 17:07:41', 2, 'EXECUTED', '8:0ea825feb8e470558f0b5754352b9cda', 'addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION', '', NULL, '4.3.5', NULL, NULL, '4989660819');
INSERT INTO `flw_ev_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', '2025-08-12 17:07:41', 3, 'EXECUTED', '8:3c2bb293350b5cbe6504331980c9dcee', 'customChange', '', NULL, '4.3.5', NULL, NULL, '4989660819');

-- ----------------------------
-- Table structure for flw_ev_databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
CREATE TABLE `flw_ev_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ev_databasechangeloglock
-- ----------------------------
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for flw_event_definition
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_definition`;
CREATE TABLE `flw_event_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_EVENT_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_definition
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_deployment
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_deployment`;
CREATE TABLE `flw_event_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for flw_event_resource
-- ----------------------------
DROP TABLE IF EXISTS `flw_event_resource`;
CREATE TABLE `flw_event_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_event_resource
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch`;
CREATE TABLE `flw_ru_batch`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch
-- ----------------------------

-- ----------------------------
-- Table structure for flw_ru_batch_part
-- ----------------------------
DROP TABLE IF EXISTS `flw_ru_batch_part`;
CREATE TABLE `flw_ru_batch_part`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `BATCH_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) NULL DEFAULT NULL,
  `STATUS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `FLW_IDX_BATCH_PART`(`BATCH_ID_`) USING BTREE,
  CONSTRAINT `flw_ru_batch_part_ibfk_1` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flw_ru_batch_part
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `row_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单行还是双行 1单行 2双行',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'sys_post', '岗位信息表', NULL, NULL, 'SysPost', 'crud', 'element-plus', 'com.ruoyi.system', 'system', 'post', '岗位信息', 'ruoyi', '0', '/', '2', '{\"parentMenuId\":0}', 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (62, 3, 'post_id', '岗位ID', 'bigint(20)', 'Long', 'postId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (63, 3, 'post_code', '岗位编码', 'varchar(64)', 'String', 'postCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (64, 3, 'post_name', '岗位名称', 'varchar(50)', 'String', 'postName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (65, 3, 'post_sort', '显示顺序', 'int(4)', 'Integer', 'postSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_process_category', 4, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (66, 3, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (67, 3, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (68, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (69, 3, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (70, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');
INSERT INTO `gen_table_column` VALUES (71, 3, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2025-08-26 14:06:47', '', '2025-08-26 15:05:37');

-- ----------------------------
-- Table structure for qingjia
-- ----------------------------
DROP TABLE IF EXISTS `qingjia`;
CREATE TABLE `qingjia`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '流程id',
  `applicant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `leave_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请假类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`, `task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qingjia
-- ----------------------------
INSERT INTO `qingjia` VALUES (1, '67512', '请问', 'sick', NULL, NULL);
INSERT INTO `qingjia` VALUES (2, '67526', '请问', 'sick', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_company
-- ----------------------------
DROP TABLE IF EXISTS `sys_company`;
CREATE TABLE `sys_company`  (
  `scp_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '关联若依部门ID',
  `scp_party_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司名称',
  `scp_short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司简称',
  `scp_pid` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级节点',
  `scp_add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `scp_update_date` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `scp_update_userid` bigint(20) NULL DEFAULT NULL COMMENT '更新人ID',
  `scp_update_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人姓名',
  `scp_province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `scp_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `scp_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通信地址',
  `scp_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `scp_desp` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `scp_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公司类型',
  `scp_add_userid` bigint(20) NULL DEFAULT NULL COMMENT '添加人ID',
  `scp_add_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '添加人姓名',
  `scp_confirm_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认人姓名',
  `scp_confirm_userid` bigint(20) NULL DEFAULT NULL COMMENT '确认人ID',
  `scp_confirm_date` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `scp_buss_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'RFQ' COMMENT '业务类型',
  `scp_audit_date` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `scp_audit_user_id` bigint(20) NULL DEFAULT 0 COMMENT '审批人ID',
  `scp_audit_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `scp_user_mac` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定该公司账号登陆是否锁定MAC地址',
  `scp_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司编码',
  `scp_score` int(11) NULL DEFAULT NULL COMMENT '供应商得分',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `scp_paidincapital` decimal(18, 2) NULL DEFAULT NULL COMMENT '实缴资本',
  `scp_taxpaymentgrade` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纳税等级',
  `scp_canbaonumber` int(11) NULL DEFAULT NULL COMMENT '参保人数',
  `scp_salespromise` decimal(18, 2) NULL DEFAULT NULL COMMENT '售后承诺',
  `scp_creditscore` decimal(18, 2) NULL DEFAULT NULL COMMENT '企查查得分',
  `scp_tuijian` decimal(18, 2) NULL DEFAULT NULL COMMENT '推荐单位',
  `scp_fuzhai` decimal(18, 2) NULL DEFAULT NULL COMMENT '负债总额',
  `scp_zichan` decimal(18, 2) NULL DEFAULT NULL COMMENT '资产总额',
  `scp_cunhuo` decimal(18, 2) NULL DEFAULT NULL COMMENT '年初库存（上年存货报表数据）',
  `scp_cunhuonianmo` decimal(18, 2) NULL DEFAULT NULL COMMENT '年末库存（上年存货报表数据）',
  `scp_xiaoshoucb` decimal(18, 2) NULL DEFAULT NULL COMMENT '销售成本（上年财务报表数据）',
  PRIMARY KEY (`scp_id`) USING BTREE,
  INDEX `idx_sys_company_dept_id`(`dept_id`) USING BTREE,
  INDEX `idx_sys_company_status`(`scp_status`) USING BTREE,
  INDEX `idx_sys_company_type`(`scp_type`) USING BTREE,
  INDEX `idx_sys_company_pid`(`scp_pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购方公司信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_company
-- ----------------------------
INSERT INTO `sys_company` VALUES (9, 200, '自贡市轻工业设计研究院有限责任公司', NULL, -1, '2025-08-14 15:11:55', NULL, NULL, NULL, '北京市', '东城区', '自贡市沿滩区高新工业园区金川路15号服务中心综合楼4-2号425房间', 'A', '自贡市轻工业设计研究院有限责任公司', 'SELLER', -1, 'test001-姓名', NULL, NULL, NULL, 'RFQ', NULL, 0, NULL, NULL, 'TGFB9', NULL, '', '2025-08-14 15:11:54', '', '2025-08-14 15:11:54', NULL, 1200.00, NULL, 100, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-08-12 17:06:45', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-08-12 17:06:45', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 14:02:46', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:26:40', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:28:45', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-08-12 17:06:45', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_customer_user`;
CREATE TABLE `sys_customer_user`  (
  `sus_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '关联若依用户ID',
  `sus_party_id` bigint(20) NOT NULL COMMENT '所在公司ID',
  `sus_usname` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `sus_uspasswd` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密密码',
  `sus_adddate` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sus_realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `sus_jobsite` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职称/岗位',
  `sus_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `sus_telphone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sus_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `sus_fax` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '传真',
  `sus_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮寄地址',
  `sus_startdate` datetime NULL DEFAULT NULL COMMENT '启用时间',
  `sus_enddate` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `sus_update_date` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `sus_update_userid` bigint(20) NULL DEFAULT NULL COMMENT '更新人ID',
  `sus_update_usname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人名称',
  `sus_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `sus_pid` bigint(20) NULL DEFAULT NULL COMMENT '直接上级',
  `sus_add_userid` bigint(20) NULL DEFAULT NULL COMMENT '添加人ID',
  `sus_add_usname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '添加人姓名',
  `sus_sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别（0男 1女 2未知）',
  `sus_recommend` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐单位',
  `sus_encrtpwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'exchange 密码1',
  `sus_functionpwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'exchange 密码2',
  `sus_partners` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正绑定ID',
  `sus_isplatform` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否全平台',
  `sus_inbind` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反绑定ID',
  `sus_linkman2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人2（预留字段）',
  `sus_phone2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定电话2（预留字段）',
  `sus_feedate` datetime NULL DEFAULT NULL COMMENT '用户缴费截止时间',
  `sus_callphone2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号2（预留字段）',
  `sus_isopen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '是否公开(Y,N)',
  `sus_endbidbefore` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '停止应答提前启用项',
  `sus_confirm_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认人姓名',
  `sus_confirm_userid` bigint(20) NULL DEFAULT NULL COMMENT '确认人ID',
  `sus_confirm_date` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `sus_audit_date` datetime NULL DEFAULT NULL COMMENT '审批时间',
  `sus_audit_user_id` bigint(20) NULL DEFAULT 0 COMMENT '审批人ID',
  `sus_audit_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审批人姓名',
  `sus_dept_id` bigint(20) NULL DEFAULT NULL COMMENT '所属部门ID',
  `sus_dept_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属部门名称',
  `sus_last_update_password_date` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新密码时间',
  `sus_last_logdate` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `sus_last_log_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录地址',
  `sus_last_log_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `sus_islocked` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否锁定（0正常 1锁定）',
  `sus_lock_date` datetime NULL DEFAULT NULL COMMENT '锁定时间',
  `sus_attempt_count` int(11) NULL DEFAULT 0 COMMENT '尝试次数',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sus_id`) USING BTREE,
  UNIQUE INDEX `sus_usname`(`sus_usname`) USING BTREE,
  INDEX `idx_sys_customer_user_user_id`(`user_id`) USING BTREE,
  INDEX `idx_sys_customer_user_party_id`(`sus_party_id`) USING BTREE,
  INDEX `idx_sys_customer_user_status`(`sus_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_customer_user
-- ----------------------------
INSERT INTO `sys_customer_user` VALUES (8, 100, 9, 'TEST001', '$2a$10$VLG/ykvkxQLlg6TBQ6J78ubV722adbfZf3UlCtWPq0ILRJ4ktG1YO', '2025-08-14 15:11:54', 'test001-姓名', '支援', '0311-11112222', '13322221111', '4333@qq.com', '', '河北秦皇岛', NULL, NULL, '2025-08-14 17:19:24', NULL, NULL, 'A', 0, -1, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2025-08-14 15:11:54', NULL, NULL, NULL, '0', NULL, 0, '', '2025-08-14 15:11:54', '', '2025-08-14 15:11:54', NULL);

-- ----------------------------
-- Table structure for sys_deploy_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_deploy_form`;
CREATE TABLE `sys_deploy_form`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `form_id` bigint(20) NULL DEFAULT NULL COMMENT '表单主键',
  `deploy_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流程实例主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程实例关联表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_deploy_form
-- ----------------------------
INSERT INTO `sys_deploy_form` VALUES (9623, 3936, '1');
INSERT INTO `sys_deploy_form` VALUES (9624, 3936, '5');
INSERT INTO `sys_deploy_form` VALUES (9625, 3936, '9');
INSERT INTO `sys_deploy_form` VALUES (9626, 3936, '13');
INSERT INTO `sys_deploy_form` VALUES (9627, 3936, '2509');
INSERT INTO `sys_deploy_form` VALUES (9628, 3936, '5008');
INSERT INTO `sys_deploy_form` VALUES (9629, 3936, '7514');
INSERT INTO `sys_deploy_form` VALUES (9630, 3936, '10001');
INSERT INTO `sys_deploy_form` VALUES (9631, 3936, '10005');
INSERT INTO `sys_deploy_form` VALUES (9632, 3936, '20005');
INSERT INTO `sys_deploy_form` VALUES (9633, 3936, '47514');
INSERT INTO `sys_deploy_form` VALUES (9634, 3938, '55001');
INSERT INTO `sys_deploy_form` VALUES (9635, 3938, '55005');
INSERT INTO `sys_deploy_form` VALUES (9637, 3939, '55030');
INSERT INTO `sys_deploy_form` VALUES (9638, 3939, '57520');
INSERT INTO `sys_deploy_form` VALUES (9639, 3938, '57536');
INSERT INTO `sys_deploy_form` VALUES (9640, 3939, '57639');
INSERT INTO `sys_deploy_form` VALUES (9641, 3938, '57687');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '系统指定', 'fixed', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:04:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '动态选择', 'dynamic', 'exp_data_type', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:05:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '任务监听', '1', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '执行监听', '2', 'sys_listener_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:47:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, 'JAVA类', 'classListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:48:55', 'admin', '2024-09-05 21:38:02', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '表达式', 'expressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:05', 'admin', '2024-09-05 21:38:10', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '代理表达式', 'delegateExpressionListener', 'sys_listener_value_type', NULL, 'default', 'N', '0', 'admin', '2022-12-25 11:49:16', 'admin', '2024-09-05 21:38:16', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '请假', 'leave', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:08:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '报销', 'expense', 'sys_process_category', NULL, 'default', 'N', '0', 'admin', '2024-03-12 09:09:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '表达式类型', 'exp_data_type', '0', 'admin', '2024-03-12 09:03:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '监听类型', 'sys_listener_type', '0', 'admin', '2022-12-18 22:03:07', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '监听值类型', 'sys_listener_value_type', '0', 'admin', '2022-12-18 22:03:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '监听属性', 'sys_listener_event_type', '0', 'admin', '2022-12-18 22:04:29', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '流程分类', 'sys_process_category', '0', 'admin', '2024-03-12 09:08:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_expression
-- ----------------------------
DROP TABLE IF EXISTS `sys_expression`;
CREATE TABLE `sys_expression`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表达式名称',
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表达式内容',
  `data_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表达式类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人员',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人员',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程表达式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_expression
-- ----------------------------

-- ----------------------------
-- Table structure for sys_form
-- ----------------------------
DROP TABLE IF EXISTS `sys_form`;
CREATE TABLE `sys_form`  (
  `form_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `form_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单名称',
  `form_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '表单内容',
  `form_router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单路由',
  `form_submit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表单提交方法',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人员',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人员',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`form_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3940 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_form
-- ----------------------------
INSERT INTO `sys_form` VALUES (3938, '请假', '{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"啊啊\",\"label\":\"请假人\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"请假理由\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"请假范围\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}', NULL, NULL, '2025-08-18 15:25:40', NULL, NULL, NULL, '1');
INSERT INTO `sys_form` VALUES (3939, '请假外部页面', NULL, '/qingjia', 'qingjiaServiceImpl.insert(Qingjia qingjia)', '2025-08-18 15:40:10', NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-08-12 17:06:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_listener
-- ----------------------------
DROP TABLE IF EXISTS `sys_listener`;
CREATE TABLE `sys_listener`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表单主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监听类型',
  `event_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件类型',
  `value_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值类型',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人员',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人员',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流程监听' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_listener
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2054 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-08-12 17:06:45', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-08-12 17:06:45', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-08-12 17:06:45', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-08-12 17:06:45', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-08-12 17:06:45', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-08-12 17:06:45', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-08-12 17:06:45', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-08-12 17:06:45', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-08-12 17:06:45', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-08-12 17:06:45', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-08-12 17:06:45', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-08-12 17:06:45', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-08-12 17:06:45', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-08-12 17:06:45', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '1', '1', 'monitor:druid:list', 'druid', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:12:30', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-08-12 17:06:45', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-08-12 17:06:45', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-08-12 17:06:45', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '1', '1', 'tool:build:list', 'build', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:11:56', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-08-12 17:06:45', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '1', '1', 'tool:swagger:list', 'swagger', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:12:01', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-08-12 17:06:45', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-08-12 17:06:45', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '流程管理', 0, 6, 'flowable', NULL, NULL, NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'tony', '2021-03-25 11:35:09', 'admin', '2022-12-29 17:39:22', '');
INSERT INTO `sys_menu` VALUES (2022, '流程定义', 2020, 2, 'definition', 'flowable/definition/index', NULL, NULL, 1, 0, 'C', '0', '0', '', 'job', 'tony', '2021-03-25 13:53:55', 'admin', '2022-12-29 17:40:39', '');
INSERT INTO `sys_menu` VALUES (2023, '任务管理', 0, 7, 'task', NULL, NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'tony', '2021-03-26 10:53:10', 'admin', '2021-03-29 09:37:40', '');
INSERT INTO `sys_menu` VALUES (2024, '待办任务', 2023, 2, 'todo', 'flowable/task/todo/index', NULL, NULL, 1, 1, 'C', '0', '0', '', 'cascader', 'admin', '2021-03-26 10:55:52', 'admin', '2021-03-30 09:26:36', '');
INSERT INTO `sys_menu` VALUES (2025, '已办任务', 2023, 3, 'finished', 'flowable/task/finished/index', NULL, NULL, 1, 1, 'C', '0', '0', '', 'time-range', 'admin', '2021-03-26 10:57:54', 'admin', '2021-03-30 09:26:50', '');
INSERT INTO `sys_menu` VALUES (2026, '已发任务', 2023, 1, 'process', 'flowable/task/myProcess/index', NULL, NULL, 1, 1, 'C', '0', '0', '', 'guide', 'admin', '2021-03-30 09:26:23', 'admin', '2022-12-12 09:58:07', '');
INSERT INTO `sys_menu` VALUES (2027, '表单配置', 2020, 2, 'form', 'flowable/task/form/index', NULL, NULL, 1, 1, 'C', '0', '0', 'flowable:form:list', 'form', 'admin', '2021-03-30 22:55:12', 'admin', '2023-08-19 15:54:57', '');
INSERT INTO `sys_menu` VALUES (2028, '新增', 2027, 1, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'flowable:form:add', '#', 'admin', '2021-07-07 14:23:37', 'admin', '2023-08-16 09:17:38', '');
INSERT INTO `sys_menu` VALUES (2029, '删除', 2027, 3, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'flowable:form:remove', '#', 'admin', '2021-07-07 14:24:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '编辑', 2027, 2, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'flowable:form:edit', '#', 'admin', '2021-07-07 14:24:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '新增', 2026, 1, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'system:deployment:add', '#', 'admin', '2021-07-07 14:25:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '编辑', 2026, 2, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'system:deployment:edit', '#', 'admin', '2021-07-07 14:25:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '删除', 2026, 3, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'system:deployment:remove', '#', 'admin', '2021-07-07 14:26:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '查询', 2027, 4, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'flowable:form:query', '#', 'admin', '2021-07-08 14:05:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '修改密码', 100, 8, '', NULL, NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:updatePwd', '#', 'admin', '2022-04-29 11:27:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '流程表达式', 2020, 3, 'expression', 'flowable/expression/index', NULL, NULL, 1, 1, 'C', '0', '0', 'system:expression:list', 'list', 'admin', '2022-12-12 17:12:19', 'admin', '2022-12-12 17:13:44', '流程达式菜单');
INSERT INTO `sys_menu` VALUES (2037, '流程达式查询', 2036, 1, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:expression:query', '#', 'admin', '2022-12-12 17:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '流程达式新增', 2036, 2, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:expression:add', '#', 'admin', '2022-12-12 17:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '流程达式修改', 2036, 3, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:expression:edit', '#', 'admin', '2022-12-12 17:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '流程达式删除', 2036, 4, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:expression:remove', '#', 'admin', '2022-12-12 17:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '流程达式导出', 2036, 5, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:expression:export', '#', 'admin', '2022-12-12 17:12:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '流程监听', 2020, 4, 'listener', 'flowable/listener/index', NULL, NULL, 1, 0, 'C', '0', '0', 'system:listener:list', 'monitor', 'admin', '2022-12-25 11:44:16', 'admin', '2022-12-29 08:59:21', '流程监听菜单');
INSERT INTO `sys_menu` VALUES (2043, '流程监听查询', 2042, 1, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:listener:query', '#', 'admin', '2022-12-25 11:44:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '流程监听新增', 2042, 2, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:listener:add', '#', 'admin', '2022-12-25 11:44:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '流程监听修改', 2042, 3, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:listener:edit', '#', 'admin', '2022-12-25 11:44:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '流程监听删除', 2042, 4, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:listener:remove', '#', 'admin', '2022-12-25 11:44:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '流程监听导出', 2042, 5, '#', '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:listener:export', '#', 'admin', '2022-12-25 11:44:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, 'qingjia', 2023, 1, 'qingjia', 'system/qingjia/index', NULL, '', 1, 0, 'C', '0', '0', 'system:qingjia:list', '#', 'admin', '2025-08-26 11:57:45', '', NULL, 'qingjia菜单');
INSERT INTO `sys_menu` VALUES (2049, 'qingjia查询', 2048, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:qingjia:query', '#', 'admin', '2025-08-26 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, 'qingjia新增', 2048, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:qingjia:add', '#', 'admin', '2025-08-26 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, 'qingjia修改', 2048, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:qingjia:edit', '#', 'admin', '2025-08-26 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, 'qingjia删除', 2048, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:qingjia:remove', '#', 'admin', '2025-08-26 11:57:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, 'qingjia导出', 2048, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:qingjia:export', '#', 'admin', '2025-08-26 11:57:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-08-12 17:06:45', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-08-12 17:06:45', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-14 15:11:46', '普通角色');
INSERT INTO `sys_role` VALUES (3, '领导组', 'lead', 0, '1', 1, 1, '0', '0', 'admin', '2025-08-14 07:57:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2020);
INSERT INTO `sys_role_menu` VALUES (3, 2022);
INSERT INTO `sys_role_menu` VALUES (3, 2023);
INSERT INTO `sys_role_menu` VALUES (3, 2024);
INSERT INTO `sys_role_menu` VALUES (3, 2025);
INSERT INTO `sys_role_menu` VALUES (3, 2026);
INSERT INTO `sys_role_menu` VALUES (3, 2027);
INSERT INTO `sys_role_menu` VALUES (3, 2028);
INSERT INTO `sys_role_menu` VALUES (3, 2029);
INSERT INTO `sys_role_menu` VALUES (3, 2030);
INSERT INTO `sys_role_menu` VALUES (3, 2031);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2034);
INSERT INTO `sys_role_menu` VALUES (3, 2036);
INSERT INTO `sys_role_menu` VALUES (3, 2037);
INSERT INTO `sys_role_menu` VALUES (3, 2038);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2040);
INSERT INTO `sys_role_menu` VALUES (3, 2041);
INSERT INTO `sys_role_menu` VALUES (3, 2042);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-08-26 14:05:53', 'admin', '2025-08-12 17:06:45', '', '2025-08-26 14:05:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$oJUdnl7iEoEYvpn77prvfugQNMpO23N8bqzgttNpaRA0uXEDKkkna', '0', '0', '127.0.0.1', '2025-08-20 08:20:27', 'admin', '2025-08-12 17:06:45', 'admin', '2025-08-20 08:20:27', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'ceshi1', '测试1', '00', '', '', '0', '', '$2a$10$0JKnO8An2YeOMBSTEmJ/R.b.uLUQo184rx55i97tDHE.MgBZ6Bd8q', '0', '0', '127.0.0.1', '2025-08-20 08:47:11', 'admin', '2025-08-12 17:20:05', 'admin', '2025-08-20 08:47:11', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (100, 2);

SET FOREIGN_KEY_CHECKS = 1;

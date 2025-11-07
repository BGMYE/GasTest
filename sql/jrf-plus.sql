/*
SQLyog Professional v12.2.6 (64 bit)
MySQL - 5.7.43-log : Database - jrf-plus
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `act_app_appdef` */

DROP TABLE IF EXISTS `act_app_appdef`;

CREATE TABLE `act_app_appdef` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE,
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_app_appdef_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_app_appdef` */

/*Table structure for table `act_app_databasechangelog` */

DROP TABLE IF EXISTS `act_app_databasechangelog`;

CREATE TABLE `act_app_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_app_databasechangelog` */

insert  into `act_app_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-08-12 17:07:45',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'4.3.5',NULL,NULL,'4989665128');
insert  into `act_app_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-08-12 17:07:45',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'4.3.5',NULL,NULL,'4989665128');
insert  into `act_app_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2025-08-12 17:07:45',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'4.3.5',NULL,NULL,'4989665128');

/*Table structure for table `act_app_databasechangeloglock` */

DROP TABLE IF EXISTS `act_app_databasechangeloglock`;

CREATE TABLE `act_app_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_app_databasechangeloglock` */

insert  into `act_app_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `act_app_deployment` */

DROP TABLE IF EXISTS `act_app_deployment`;

CREATE TABLE `act_app_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_app_deployment` */

/*Table structure for table `act_app_deployment_resource` */

DROP TABLE IF EXISTS `act_app_deployment_resource`;

CREATE TABLE `act_app_deployment_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_app_deployment_resource_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_app_deployment_resource` */

/*Table structure for table `act_cmmn_casedef` */

DROP TABLE IF EXISTS `act_cmmn_casedef`;

CREATE TABLE `act_cmmn_casedef` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_casedef_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_casedef` */

/*Table structure for table `act_cmmn_databasechangelog` */

DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;

CREATE TABLE `act_cmmn_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_databasechangelog` */

insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:43',1,'EXECUTED','8:8b4b922d90b05ff27483abefc9597aa6','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:43',2,'EXECUTED','8:65e39b3d385706bb261cbeffe7533cbe','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:43',3,'EXECUTED','8:c01f6e802b49436b4489040da3012359','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:43',4,'EXECUTED','8:e40d29cb79345b7fb5afd38a7f0ba8fc','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',5,'EXECUTED','8:70349de472f87368dcdec971a10311a0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',6,'EXECUTED','8:10e82e26a7fee94c32a92099c059c18c','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',7,'EXECUTED','8:530bc81a1e30618ccf4a2da1f7c6c043','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('8','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',8,'EXECUTED','8:e8c2eb1ce28bc301efe07e0e29757781','addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('9','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',9,'EXECUTED','8:4cb4782b9bdec5ced2a64c525aa7b3a0','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('10','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',10,'EXECUTED','8:341c16be247f5d17badc9809da8691f9','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('11','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',11,'EXECUTED','8:d7c4da9276bcfffbfb0ebfb25e3f7b05','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('12','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',12,'EXECUTED','8:adf4ecc45f2aa9a44a5626b02e1d6f98','addColumn tableName=ACT_CMMN_RU_CASE_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('13','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',13,'EXECUTED','8:7550626f964ab5518464709408333ec1','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('14','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:44',14,'EXECUTED','8:086b40b3a05596dcc8a8d7479922d494','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('16','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:45',15,'EXECUTED','8:a697a222ddd99dd15b36516a252f1c63','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');
insert  into `act_cmmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('17','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2025-08-12 17:07:45',16,'EXECUTED','8:d3706c5813a9b97fd2a59d12a9523946','createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.3.5',NULL,NULL,'4989662446');

/*Table structure for table `act_cmmn_databasechangeloglock` */

DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;

CREATE TABLE `act_cmmn_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_databasechangeloglock` */

insert  into `act_cmmn_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `act_cmmn_deployment` */

DROP TABLE IF EXISTS `act_cmmn_deployment`;

CREATE TABLE `act_cmmn_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_deployment` */

/*Table structure for table `act_cmmn_deployment_resource` */

DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;

CREATE TABLE `act_cmmn_deployment_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_deployment_resource_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_deployment_resource` */

/*Table structure for table `act_cmmn_hi_case_inst` */

DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;

CREATE TABLE `act_cmmn_hi_case_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_CASE_INST_END` (`END_TIME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_hi_case_inst` */

/*Table structure for table `act_cmmn_hi_mil_inst` */

DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;

CREATE TABLE `act_cmmn_hi_mil_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_hi_mil_inst` */

/*Table structure for table `act_cmmn_hi_plan_item_inst` */

DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;

CREATE TABLE `act_cmmn_hi_plan_item_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_hi_plan_item_inst` */

/*Table structure for table `act_cmmn_ru_case_inst` */

DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;

CREATE TABLE `act_cmmn_ru_case_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_INST_REF_ID_` (`REFERENCE_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_case_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_ru_case_inst` */

/*Table structure for table `act_cmmn_ru_mil_inst` */

DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;

CREATE TABLE `act_cmmn_ru_mil_inst` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_mil_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `act_cmmn_ru_mil_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_ru_mil_inst` */

/*Table structure for table `act_cmmn_ru_plan_item_inst` */

DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;

CREATE TABLE `act_cmmn_ru_plan_item_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_plan_item_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `act_cmmn_ru_plan_item_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_ru_plan_item_inst` */

/*Table structure for table `act_cmmn_ru_sentry_part_inst` */

DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;

CREATE TABLE `act_cmmn_ru_sentry_part_inst` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) DEFAULT NULL,
  `ON_PART_ID_` varchar(255) DEFAULT NULL,
  `IF_PART_ID_` varchar(255) DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_1` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_2` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`),
  CONSTRAINT `act_cmmn_ru_sentry_part_inst_ibfk_3` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_cmmn_ru_sentry_part_inst` */

/*Table structure for table `act_co_content_item` */

DROP TABLE IF EXISTS `act_co_content_item`;

CREATE TABLE `act_co_content_item` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `MIME_TYPE_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) DEFAULT NULL,
  `FIELD_` varchar(400) DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) DEFAULT '0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `idx_contitem_taskid` (`TASK_ID_`) USING BTREE,
  KEY `idx_contitem_procid` (`PROC_INST_ID_`) USING BTREE,
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_co_content_item` */

/*Table structure for table `act_co_databasechangelog` */

DROP TABLE IF EXISTS `act_co_databasechangelog`;

CREATE TABLE `act_co_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_co_databasechangelog` */

insert  into `act_co_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2025-08-12 17:07:42',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.3.5',NULL,NULL,'4989662223');
insert  into `act_co_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2025-08-12 17:07:42',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.3.5',NULL,NULL,'4989662223');

/*Table structure for table `act_co_databasechangeloglock` */

DROP TABLE IF EXISTS `act_co_databasechangeloglock`;

CREATE TABLE `act_co_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_co_databasechangeloglock` */

insert  into `act_co_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `act_dmn_databasechangelog` */

DROP TABLE IF EXISTS `act_dmn_databasechangelog`;

CREATE TABLE `act_dmn_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_databasechangelog` */

insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',1,'EXECUTED','8:c8701f1c71018b55029f450b2e9a10a1','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',2,'EXECUTED','8:47f94b27feb7df8a30d4e338c7bd5fb8','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',3,'EXECUTED','8:ac17eae89fbdccb6e08daf3c7797b579','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',4,'EXECUTED','8:f73aabc4529e7292c2942073d1cff6f9','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',5,'EXECUTED','8:3e03528582dd4eeb4eb41f9b9539140d','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',6,'EXECUTED','8:646c6a061e0b6e8a62e69844ff96abb0','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('7','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',7,'EXECUTED','8:215a499ff7ae77685b55355245b8b708','dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('8','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',8,'EXECUTED','8:5355bee389318afed91a11702f2df032','addColumn tableName=ACT_DMN_DECISION','',NULL,'4.3.5',NULL,NULL,'4989661423');
insert  into `act_dmn_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('9','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2025-08-12 17:07:41',9,'EXECUTED','8:0fe82086431b1953d293f0199f805876','createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.3.5',NULL,NULL,'4989661423');

/*Table structure for table `act_dmn_databasechangeloglock` */

DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;

CREATE TABLE `act_dmn_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_databasechangeloglock` */

insert  into `act_dmn_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `act_dmn_decision` */

DROP TABLE IF EXISTS `act_dmn_decision`;

CREATE TABLE `act_dmn_decision` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_DMN_DEC_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_decision` */

/*Table structure for table `act_dmn_deployment` */

DROP TABLE IF EXISTS `act_dmn_deployment`;

CREATE TABLE `act_dmn_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_deployment` */

/*Table structure for table `act_dmn_deployment_resource` */

DROP TABLE IF EXISTS `act_dmn_deployment_resource`;

CREATE TABLE `act_dmn_deployment_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_deployment_resource` */

/*Table structure for table `act_dmn_hi_decision_execution` */

DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;

CREATE TABLE `act_dmn_hi_decision_execution` (
  `ID_` varchar(255) NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_JSON_` longtext,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_DMN_INSTANCE_ID` (`INSTANCE_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_dmn_hi_decision_execution` */

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_fo_databasechangelog` */

DROP TABLE IF EXISTS `act_fo_databasechangelog`;

CREATE TABLE `act_fo_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_databasechangelog` */

insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','activiti','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:41',1,'EXECUTED','8:033ebf9380889aed7c453927ecc3250d','createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'4989661859');
insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:41',2,'EXECUTED','8:986365ceb40445ce3b27a8e6b40f159b','addColumn tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'4989661859');
insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('3','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:41',3,'EXECUTED','8:abf482518ceb09830ef674e52c06bf15','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.3.5',NULL,NULL,'4989661859');
insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('4','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:42',4,'EXECUTED','8:2087829f22a4b2298dbf530681c74854','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'4989661859');
insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('5','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:42',5,'EXECUTED','8:b4be732b89e5ca028bdd520c6ad4d446','createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.3.5',NULL,NULL,'4989661859');
insert  into `act_fo_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('6','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2025-08-12 17:07:42',6,'EXECUTED','8:384bbd364a649b67c3ca1bcb72fe537f','createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.3.5',NULL,NULL,'4989661859');

/*Table structure for table `act_fo_databasechangeloglock` */

DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;

CREATE TABLE `act_fo_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_databasechangeloglock` */

insert  into `act_fo_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `act_fo_form_definition` */

DROP TABLE IF EXISTS `act_fo_form_definition`;

CREATE TABLE `act_fo_form_definition` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_form_definition` */

/*Table structure for table `act_fo_form_deployment` */

DROP TABLE IF EXISTS `act_fo_form_deployment`;

CREATE TABLE `act_fo_form_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_form_deployment` */

/*Table structure for table `act_fo_form_instance` */

DROP TABLE IF EXISTS `act_fo_form_instance`;

CREATE TABLE `act_fo_form_instance` (
  `ID_` varchar(255) NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) NOT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_FORM_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_FORM_PROC` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_FORM_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_form_instance` */

/*Table structure for table `act_fo_form_resource` */

DROP TABLE IF EXISTS `act_fo_form_resource`;

CREATE TABLE `act_fo_form_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `act_fo_form_resource` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_ge_bytearray_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10002',1,'flow_yvmruh6h.bpmn','10001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10003',1,'flow_yvmruh6h.flow_rmnt89qb.png','10001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10006',1,'flow_yvmruh6h.bpmn','10005','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10007',1,'flow_yvmruh6h.flow_rmnt89qb.png','10005','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10010',1,'flow_yvmruh6h.bpmn','10009','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('10011',1,'flow_yvmruh6h.flow_rmnt89qb.png','10009','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('12502',1,'flow_yvmruh6h.bpmn','12501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('12503',1,'flow_yvmruh6h.flow_rmnt89qb.png','12501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15002',1,'flow_yvmruh6h.bpmn','15001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15003',1,'flow_yvmruh6h.flow_rmnt89qb.png','15001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15006',1,'flow_yvmruh6h.bpmn','15005','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15007',1,'flow_yvmruh6h.flow_rmnt89qb.png','15005','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15010',1,'flow_yvmruh6h.bpmn','15009','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('15011',1,'flow_yvmruh6h.flow_rmnt89qb.png','15009','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('17502',1,'flow_yvmruh6h.bpmn','17501','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('17503',1,'flow_yvmruh6h.flow_rmnt89qb.png','17501','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('20002',1,'null.bpmn','20001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_3\" value=\"é¢†å¯¼ç»„\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('20003',1,'null.flow_rmnt89qb.png','20001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('20006',1,'flow_yvmruh6h.bpmn','20005','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('20007',1,'flow_yvmruh6h.flow_rmnt89qb.png','20005','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('42505',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('45005',2,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0labelHiddensq\0~\0\0t\0readonlyq\0~\0\"t\0disabledq\0~\0t\0hiddenq\0~\0\"t\0	clearableq\0~\0t\0showPasswordq\0~\0\"t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconPositiont\0reart\0\rshowWordLimitq\0~\0\"t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0\"t\0appendButtonDisabledq\0~\0\"t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulest\0\nlabelWidthsq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0,q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47505',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47515',1,'flow_yvmruh6h.bpmn','47514','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47516',1,'flow_yvmruh6h.flow_rmnt89qb.png','47514','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47520',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47522',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('47535',2,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0labelHiddensq\0~\0\0t\0readonlyq\0~\0\"t\0disabledq\0~\0t\0hiddenq\0~\0\"t\0	clearableq\0~\0t\0showPasswordq\0~\0\"t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconPositiont\0reart\0\rshowWordLimitq\0~\0\"t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0\"t\0appendButtonDisabledq\0~\0\"t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulest\0\nlabelWidthsq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0,q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('50003',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('50005',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('52503',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('52505',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('52516',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('52518',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55002',1,'null.bpmn','55001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55003',1,'null.flow_rmnt89qb.png','55001','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55006',1,'null.bpmn','55005','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55007',1,'null.flow_rmnt89qb.png','55005','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55013',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0\nlabelWidthpt\0labelHiddensq\0~\0\0t\0readonlyq\0~\0#t\0disabledq\0~\0#t\0hiddenq\0~\0#t\0	clearableq\0~\0t\0showPasswordq\0~\0#t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconClasspt\0labelIconPositiont\0reart\0labelTooltippt\0	minLengthpt\0	maxLengthpt\0\rshowWordLimitq\0~\0#t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0#t\0appendButtonDisabledq\0~\0#t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0@ƒq\0~\0t\0inputq\0~\0\rt\0\ntext-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\'q\0~\0t\0\ninput46537q\0~\0t\0è¯·å‡ç†ç”±q\0~\0q\0~\0q\0~\0t\0textq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0q\0~\0!pq\0~\0\"q\0~\0#q\0~\0$q\0~\0#q\0~\0%q\0~\0#q\0~\0&q\0~\0#q\0~\0\'q\0~\0q\0~\0(q\0~\0#q\0~\0)q\0~\0#q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,q\0~\0q\0~\0-sq\0~\0\0\0\0\0w\0\0\0\0xq\0~\0.pq\0~\0/t\0rearq\0~\01pq\0~\02pq\0~\03pq\0~\04q\0~\0#q\0~\05q\0~\0q\0~\06q\0~\0q\0~\07q\0~\0#q\0~\08q\0~\0#q\0~\09t\0\rcustom-searchq\0~\0;q\0~\0q\0~\0<q\0~\0q\0~\0=q\0~\0q\0~\0>q\0~\0q\0~\0?q\0~\0q\0~\0@q\0~\0q\0~\0Aq\0~\0q\0~\0Bq\0~\0x\0q\0~\0Ct\0\ninput46537x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0ü¬q\0~\0t\0\ndate-rangeq\0~\0\rt\0date-range-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0!q\0~\0t\0daterange83468q\0~\0t\0è¯·å‡èŒƒå›´q\0~\0q\0~\0q\0~\0t\0	daterangeq\0~\0pt\0startPlaceholderq\0~\0t\0endPlaceholderq\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0t\0\rautoFullWidthq\0~\0q\0~\0!pq\0~\0\"q\0~\0#q\0~\0$q\0~\0#q\0~\0%q\0~\0#q\0~\0&q\0~\0#q\0~\0\'q\0~\0t\0editableq\0~\0#t\0formatt\0\nYYYY-MM-DDt\0valueFormatt\0\nYYYY-MM-DDq\0~\0)q\0~\0#q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,q\0~\0q\0~\0-q\0~\0q\0~\0.pq\0~\0/t\0rearq\0~\01pq\0~\0;q\0~\0q\0~\0<q\0~\0q\0~\0>q\0~\0q\0~\0?q\0~\0q\0~\0@q\0~\0q\0~\0Aq\0~\0x\0q\0~\0Ct\0daterange83468x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulesq\0~\0!sq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0-q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55018',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-18t\0\n2025-08-20x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55031',1,'null.bpmn','55030','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('55032',1,'null.flow_rmnt89qb.png','55030','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57503',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57505',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57517',1,'è¯·å‡.bpmn','57516','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"è¯·å‡\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57518',1,'è¯·å‡.flow_rmnt89qb.png','57516','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57521',1,'è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','57520','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"è¯·å‡å¤–éƒ¨é¡µé¢\" flowable:processCategory=\"leave\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:candidateGroups=\"3\" flowable:userType=\"candidateGroups\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57522',1,'è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png','57520','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57525',1,'ç»“æŸ.bpmn','57524','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_p82g6ib8\" name=\"ç»“æŸ\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1i02yp6</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0vemk0z\" name=\"å®¡æ‰¹1\" flowable:userType=\"assignee\">\n      <incoming>Flow_1i02yp6</incoming>\n      <outgoing>Flow_1y6yxk7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i02yp6\" sourceRef=\"start_event\" targetRef=\"Activity_0vemk0z\" />\n    <userTask id=\"Activity_005chiy\" name=\"å®¡æ‰¹2\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1y6yxk7</incoming>\n      <outgoing>Flow_0wd9u4i</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1y6yxk7\" sourceRef=\"Activity_0vemk0z\" targetRef=\"Activity_005chiy\" />\n    <endEvent id=\"Event_0e956to\">\n      <incoming>Flow_0wd9u4i</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0wd9u4i\" sourceRef=\"Activity_005chiy\" targetRef=\"Event_0e956to\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_p82g6ib8\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0vemk0z_di\" bpmnElement=\"Activity_0vemk0z\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_005chiy_di\" bpmnElement=\"Activity_005chiy\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0e956to_di\" bpmnElement=\"Event_0e956to\">\n        <omgdc:Bounds x=\"622\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1i02yp6_di\" bpmnElement=\"Flow_1i02yp6\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1y6yxk7_di\" bpmnElement=\"Flow_1y6yxk7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0wd9u4i_di\" bpmnElement=\"Flow_0wd9u4i\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"622\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57526',1,'ç»“æŸ.flow_p82g6ib8.png','57524','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0œ\0\0	\0\0\09÷È\0\0dIDATx^íİ[ŒUõ½pêÃ	m_´·4Zµ“Ú¤¾¶öÁ¶š>Tc=çBlg`ŒC+¶I{ÚH$DhL“ÚcO0m\Z¨œsR,Ø‚T-Z@ë­G©\"Š( NEPËeõß=gûßƒng`ÏıçóI¾Ø{ÍZKæçÚßYk_¦L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿWÅ¿lÛ¶í¿7nÜøâ{î‘6§üw?¾~ıú—×­[wyüó©*s5ñÉq®\0¨¨²üOù TCCCÅ[o½%mNøwÿş÷ßÿëeQøzü3ª\"s5ñÉq®\0¨¨p*<(ÅVÒşìŞ½{oYFUd®ÒINs@E…ËÎ@¥‘ğs(‹ÁáøgTEæ*ä4W\0TTx®Wü\0%—ğóˆFUd®ÒJ.s@EµZŞØ¿»Øö—_›ï½±–ğçp[¼œŒ/¹s•Vr™+\0*ª•bpğµ]ÅSkçıÃ¿½-á¶p_¼¼Œ=¹s•Vr™+\0*ª•b°cóª¦RPÏÎÍw5-/cO.ÅÀ\\¥•\\æ\n€Šj¥<}ß¢¦BPO¸/^^Æ\\Š¹J+¹Ì\0ÕJ1xêùM… p_¼¼Œ=¹s•Vr™+\0*J1H+¹s•Vr™+\0*ª•b^=‚zÂ}ñò2öäRÌUZÉe®\0¨¨VŠÁÖ?ÿGS!¨\'Ü//cO.ÅÀ\\¥•\\æ\n€Šj¥ìÛõ¿ÅSü÷¦Rn÷ÅËËØ“K10Wi%—¹ ¢Z)!/<²´©„Ûâåd|É¥˜«´’Ë\\PQ-ƒÃ‡‹­ş³©„ÛÂ}MËË˜“K10Wi%—¹ ¢Ş­„O|yöÏ?o*õ„û|*ÌÉK.ÅÀ\\¥•\\æ\n€Š:a18|¸Ø½u]ñäİs›Ê@œ°LXÖY©ñ\'—b`®ÒJ.s@EVŞíìÓ‰â¬Ôø“K10Wi%—¹ ¢F+­œ}:QÂ÷Æë“Ö“K10Wi%—¹ ¢F+ñƒı{M¼>i=¹s•Vr™+\0*j´b —\\Š¹J+¹ÌÕXõôôœŞÙÙ9­££ãÖòë@™Ê*S\r¾ZX>^\0ã ¤•\\Š¹J+¹ÌÕ{ÕÕÕuIY W”yk¸\\¶š°üŠğıñ:Å ­äRÌUZÉe®ZUÅ/”…qÓ(Er,ÙÖo€÷@1H+¹s•Vr™«wÓÓÓ3µ££ã¶²$‹ã÷¿ÿıbÙ²eÅ£>Z<ÿüóÅ¾}ûŠ |\r·‡ûÃrñ÷†õ…õ†õÇÛQSNÛ¸qã¿.]ºô,ØûãÿxhöìÙµRÿ‘şğ‡ÊÛ[¸pá-½½½gÇßŸ3Å ­äRÌUZÉe®ŞIy<?»««ë¯E±»»»X¼xq±sçÎZ¹lUX>|_øş¨x>¶o˜äÊãÆÔ»ï¾ûöyóæı£¯¯¯øÅ/~QlÚ´iÔßnÃíáşY³f›3gÎ¶«¯¾úkñúr¤¤•\\Š¹J+¹ÌÕ‰”Eóü2»\ZËá¢E‹Š;v¼½I¾GáûÃz¢Ò¹#l/Ş`’*äw.\\8.lÜ¸±8vìX|,UX.,İu×ùÎw¾óXGGÇgâuçD1H+¹s•Vr™«ÑŸÙ)›á¬äªU«âCû¸„õEg;w8Ó	“\\ylxßÚµk—]sÍ5ÅêÕ«‹£GÆÇ–„ïßßÓÓóFÎ¯TTÒJ.ÅÀ\\¥•\\æ*SÙx½···xüñÇãÃùIÖÖßP:ŸğœN˜¤ÊcÂûV¬XñĞìÙ³‹gy&>^ŒIXO__ß¡ò·ÛYñör ¤•\\Š¹J+¹ÌUløB#g6OUÙ¬ëo<Ó¶ï0	„3›ıııÅàà`|œ—°¾ò7ÛƒW^yåÅñ6«N1H+¹s•Vr™«FÃo}t¬^şîºë®øĞ}J„í4œå<æ-“`’Ù°aÃwCÙ<Yg6cåzë[ßzmúôéçÅÛ®2Å ­äRÌUZÉe®\Zu6¼ÏfxaO;E/$Úï©òÿÿ©7İtÓPxÎå©´råÊ×º»»ï·_eŠAZÉ¥˜«´’Ë\\Õ…«M—ÒÇûjô÷*l¯ñÒzW¿€Q¬Y³fqx5úX_ Ôª°ş¾¾¾=åÁåËñ>T•bVr)æ*­ä2Wuÿü¸ÊZÙï—9ÂvÎr®ˆ÷ÈLùÿıi7ÜpÃ?Â[µÃƒ>¸¿<¸<ïGU)i%—b`®ÒJ.stwwŸÑÙğÙèí>»Y¶ÛP8ß\nûï+‘\r6\\qõÕW·ü>›ã¶3cÆŒıÓ§O?+Ş—””ÀûÊ\\ßSÒJêÅÀ\\U3©ÏU]+óUŞ?­^ôÂ•­‰}æ´x_Œ,Y²äğ	Aí´`Á‚§:::fÇû’’†ƒà;Àƒ´’z10WÕLêsU×Ê|•·ÿ¼¾ÜwÜÛ*l¿aŸï+‘…îi×åôº{ï½wsgâÏÙi8¾ã\\1H+©sUÍ¤>Wu­ÌWWW×ºúı<òH|xn«°ıú¾„ıjÜO 3?úÑ†¶mÛN©-[¶l/0‰÷%%£¸G=€+i%õb0Ê<™«\n$õ¹ªe®šæ«üúRıövûcaû\rûøRôŸä¤¿¿ÿø«¯¾\ZN©}ûö,.»â}IÉ(ì8µxŠÁ³Ï>[{‚~|{czè¡¦ÛxàâÀM·§œÔ‹Á(sÇ\\%˜Ôçªn”yŠæëÍúßÛ}ì…í×÷¥««ë@üßdäª«®*9N©r{F9V2©ƒp óÍ7kŞºukñ‰O|¢Ø¿ÿÈıCCCo[şÂ/,ÂsyÃ§€„‘…Bpùå—7ÜpCÓºÃú{î¹¦ÛSHüó©j&ã\\…Ë««V­*öîİÛtßD\'şùä’vûcaû\rûs4~|2rÍ5×i÷o¹{öìy®³ºg8ïë¬À¥ÏÓ¦Mï{ZÌš5+œ)¾ıío3gÎ3Z|îsŸ+xâ‰‘å/ºè¢â¾ûî«=à_zé¥µÛ¦OŸ^Üyçµ³X¬•Ì3fùÈGŠßüæ7MÛL!©Ÿ‰\Ze&ı\\…ÛæÏŸ_[WÈ§?ıéZ±·=‘I}®êF™«¦ù\ngë··ûØs†&‘üàÚı<¿ıíotVï9œo+u©ƒO}êSáßyäïúĞ‡FŠÀ­·ŞZÌ›7¯ØµkW­„3OguVqşùççw^ño|£VB1øío[|å+_©•‰\'Ÿ|²øÒ—¾T+\nçØ˜«æ¹\nß{ÆgëÖ­+jóµråÊ¦mOdRŸ«ºVæ«Ós8‰0wîÜgÛı*õ;ï¼sUgu^¥ŞtÀn”j1xå•WŠ¯~õ«µı|à#şä\'?9rIüĞ¡CµpÉ%—ë×¯¯]ú<÷Üs‹sÎ9§øğ‡?\\|şóŸ/®¿şúâõ×_Y÷…sÌÌÕèsÕßß_<öØcáùİµù\nÏóŒ·=‘I}®êZ™/¯R&Ä‚ni÷ûp^{íµ«+ğ>œ\'<`7Jµ„|ô£y¾İ™g9rûÇ>ö±·-÷Æo_üâk—?¿ùÍoW\\qEíöp&ê—¿üeÓz§(œcf®N<W!á,iıÒ{JI}®êZ™¯NïÃ	L„ŞŞŞ³ûúúµñ“†^),{Rÿ¤¡V¥\\>şñ===µË–áLTøZÿs}™_ıêWµqúé§k×®-Ö¬Yó¶bk¯wŠÂyÊMÆ¹\ngB»»»“|{.st&ôICßûŞ÷7NŸ4¹›3gÎíº¬¾|ùò;:}–z[.]†w„ËüàG.}N:µvÉ3,388Xüş÷¿¹ô9Z1xúé§‹¥K—¬wŠÂyÊM¶¹\n.Cµï—YG{;¥‰L.sø,u`Â”_»îºë=z4>&œTåúw”–­W^yå—ã}¨ª”‹ÁO~ò“âğáÃµ?‡³RõÛö³Ÿ5½}Mc1¸ì²ËŠ›nº©xÿûß_¬X±¢ö*ã¹sçÖ¿wÛm·Õ\ngWWW±aÃ†¦mNtr)“i®Ârá•ïK–,©ı\"^L^<ow\"“Ë\\Õ•Çáõ²·xñâøPİa»\r…3éçô\'Ñµ×^ûØêÕ«Ç…“èxù@õëòÀ²:Şv•¥\\\Z.oÆ·…lÙ²¥øéOZ|ö³Ÿ­ÈÛo¿½8í´Ój7Şxcí9zá•ÆáRg¸Êğ[×„„³Zñú&:¹ƒÉ4Waù)\rs¾?^çD&—¹ª+é¿¸^öÂÏ İg9ÃöÊ_ZG.§‡ı‰÷ÈÔôéÓÏëíí=øÌ3ÏÄÇ†“âOúÓ’òÀ²;l\'Şv•U¥\\pÁM·…„3U7ß|sqñÅ×^ä±}ûöâ–[niZ®*É¥˜«´’Ë\\5*Ç›ê…oÑ¢Eñ!û”\nÛk8»¹)Ş7 såoœ—Ìœ9óPxşÕÉT>ØÜUT^Îñ·ØªƒúsëFK|´ÊÉ¥˜«´’Ë\\5*÷_(ËÇêÅ/¼uU;„í4”Íca?â}&îîîY½½½NÖ™Îá3›»ÊÌŒ·•ƒªƒÉ’\\Š¹J+¹ÌU¬££ã¶zù—Öüñø~R…õ7^JÛ÷	˜DÂ™È«®ºêµ•+W¾6Ö…\r?gó•ÏlÖ)i%—b`®ÒJ.sëéé™Z£Ÿ¨ÀğöV§ªt†õ–Û9£\Z¶¶ï0É”¿y~¦üwm__ß|p«ïÓY.7¸|ùòeåÁdk™5a=ñºs¢¤•\\Š¹J+¹ÌÕhÊãôÙeÂ;ˆŒœéMz2…õ5ÙŞŞÙñ¾\0“Xx£òÀ°~ÆŒ¯ÏŸ?ÿÉ§¶lÙòÒŞ½{ß(#ÿş÷¿oÛ¼yó#¿ûİïVÎ™3gM¹ìŞ°|No}ôNƒ´’K10Wi%—¹:‘²ßX:CÂ{ÆûêõğıÑ„je3l/Ş€šğÉ@å¢¿££#|úÃ\r§ğõááÛûsù¡V)i%—b`®ÒJ.sõN:ÿy¦säòzH8ÛŞÊjçÎq—|Gaùğ}ÑYÍÚeô°xÛ\0¼Å ­äRÌUZÉe®ŞMxNåğ‰â¢XûÌeË–>úhñüóÏûöí«•Ëğ5ü=Üî>®²ãa½³	0FŠAZÉ¥˜«´’Ë\\µjø-“FŞ§sœÙä­\0ÆI1H+¹s•Vr™«÷*¼7sç??sä³×[LX~Eøşx\0ŒbVr)æ*­ä2WcÕÓÓszY §uttÜZ~(óB™CÃå2|\r¾ZX>^\0ã ¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0500p|hh¨éJÚŸòçğrYÇ?£*2Wé$§¹ ¢Ö¯_ÿòàà`Óƒ”´?/¾øâò²<ÿŒªÈ\\¥“œæ\n€ŠZ·nİå÷ßÿë»wïŞëŒÔÄ¤üwß½}ûöÿ*KÁKe¾ÿŒªÈ\\M|rœ+\0*,<…3 eŞ\nÏõ’¶\'ü»‡ÿ¬JAøïşï2W“,ç\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Iìÿ\0DÌšŸVñ®é\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57529',1,'ç»“æŸ.bpmn','57528','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_p82g6ib8\" name=\"ç»“æŸ\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1i02yp6</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0vemk0z\" name=\"å®¡æ‰¹1\" flowable:assignee=\"1\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1i02yp6</incoming>\n      <outgoing>Flow_1y6yxk7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i02yp6\" sourceRef=\"start_event\" targetRef=\"Activity_0vemk0z\" />\n    <userTask id=\"Activity_005chiy\" name=\"å®¡æ‰¹2\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1y6yxk7</incoming>\n      <outgoing>Flow_0wd9u4i</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1y6yxk7\" sourceRef=\"Activity_0vemk0z\" targetRef=\"Activity_005chiy\" />\n    <endEvent id=\"Event_0e956to\">\n      <incoming>Flow_0wd9u4i</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0wd9u4i\" sourceRef=\"Activity_005chiy\" targetRef=\"Event_0e956to\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_p82g6ib8\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0vemk0z_di\" bpmnElement=\"Activity_0vemk0z\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_005chiy_di\" bpmnElement=\"Activity_005chiy\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0e956to_di\" bpmnElement=\"Event_0e956to\">\n        <omgdc:Bounds x=\"622\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1i02yp6_di\" bpmnElement=\"Flow_1i02yp6\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1y6yxk7_di\" bpmnElement=\"Flow_1y6yxk7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0wd9u4i_di\" bpmnElement=\"Flow_0wd9u4i\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"622\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57530',1,'ç»“æŸ.flow_p82g6ib8.png','57528','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0œ\0\0	\0\0\09÷È\0\0dIDATx^íİ[ŒUõ½pêÃ	m_´·4Zµ“Ú¤¾¶öÁ¶š>Tc=çBlg`ŒC+¶I{ÚH$DhL“ÚcO0m\Z¨œsR,Ø‚T-Z@ë­G©\"Š( NEPËeõß=gûßƒng`ÏıçóI¾Ø{ÍZKæçÚßYk_¦L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿWÅ¿lÛ¶í¿7nÜøâ{î‘6§üw?¾~ıú—×­[wyüó©*s5ñÉq®\0¨¨²üOù TCCCÅ[o½%mNøwÿş÷ßÿëeQøzü3ª\"s5ñÉq®\0¨¨p*<(ÅVÒşìŞ½{oYFUd®ÒINs@E…ËÎ@¥‘ğs(‹ÁáøgTEæ*ä4W\0TTx®Wü\0%—ğóˆFUd®ÒJ.s@EµZŞØ¿»Øö—_›ï½±–ğçp[¼œŒ/¹s•Vr™+\0*ª•bpğµ]ÅSkçıÃ¿½-á¶p_¼¼Œ=¹s•Vr™+\0*ª•b°cóª¦RPÏÎÍw5-/cO.ÅÀ\\¥•\\æ\n€Šj¥<}ß¢¦BPO¸/^^Æ\\Š¹J+¹Ì\0ÕJ1xêùM… p_¼¼Œ=¹s•Vr™+\0*J1H+¹s•Vr™+\0*ª•b^=‚zÂ}ñò2öäRÌUZÉe®\0¨¨VŠÁÖ?ÿGS!¨\'Ü//cO.ÅÀ\\¥•\\æ\n€Šj¥ìÛõ¿ÅSü÷¦Rn÷ÅËËØ“K10Wi%—¹ ¢Z)!/<²´©„Ûâåd|É¥˜«´’Ë\\PQ-ƒÃ‡‹­ş³©„ÛÂ}MËË˜“K10Wi%—¹ ¢Ş­„O|yöÏ?o*õ„û|*ÌÉK.ÅÀ\\¥•\\æ\n€Š:a18|¸Ø½u]ñäİs›Ê@œ°LXÖY©ñ\'—b`®ÒJ.s@EVŞíìÓ‰â¬Ôø“K10Wi%—¹ ¢F+­œ}:QÂ÷Æë“Ö“K10Wi%—¹ ¢F+ñƒı{M¼>i=¹s•Vr™+\0*j´b —\\Š¹J+¹ÌÕXõôôœŞÙÙ9­££ãÖòë@™Ê*S\r¾ZX>^\0ã ¤•\\Š¹J+¹ÌÕ{ÕÕÕuIY W”yk¸\\¶š°üŠğıñ:Å ­äRÌUZÉe®ZUÅ/”…qÓ(Er,ÙÖo€÷@1H+¹s•Vr™«wÓÓÓ3µ££ã¶²$‹ã÷¿ÿıbÙ²eÅ£>Z<ÿüóÅ¾}ûŠ |\r·‡ûÃrñ÷†õ…õ†õÇÛQSNÛ¸qã¿.]ºô,ØûãÿxhöìÙµRÿ‘şğ‡ÊÛ[¸pá-½½½gÇßŸ3Å ­äRÌUZÉe®ŞIy<?»««ë¯E±»»»X¼xq±sçÎZ¹lUX>|_øş¨x>¶o˜äÊãÆÔ»ï¾ûöyóæı£¯¯¯øÅ/~QlÚ´iÔßnÃíáşY³f›3gÎ¶«¯¾úkñúr¤¤•\\Š¹J+¹ÌÕ‰”Eóü2»\ZËá¢E‹Š;v¼½I¾GáûÃz¢Ò¹#l/Ş`’*äw.\\8.lÜ¸±8vìX|,UX.,İu×ùÎw¾óXGGÇgâuçD1H+¹s•Vr™«ÑŸÙ)›á¬äªU«âCû¸„õEg;w8Ó	“\\ylxßÚµk—]sÍ5ÅêÕ«‹£GÆÇ–„ïßßÓÓóFÎ¯TTÒJ.ÅÀ\\¥•\\æ*SÙx½···xüñÇãÃùIÖÖßP:ŸğœN˜¤ÊcÂûV¬XñĞìÙ³‹gy&>^ŒIXO__ß¡ò·ÛYñör ¤•\\Š¹J+¹ÌUløB#g6OUÙ¬ëo<Ó¶ï0	„3›ıııÅàà`|œ—°¾ò7ÛƒW^yåÅñ6«N1H+¹s•Vr™«FÃo}t¬^şîºë®øĞ}J„í4œå<æ-“`’Ù°aÃwCÙ<Yg6cåzë[ßzmúôéçÅÛ®2Å ­äRÌUZÉe®\Zu6¼ÏfxaO;E/$Úï©òÿÿ©7İtÓPxÎå©´råÊ×º»»ï·_eŠAZÉ¥˜«´’Ë\\Õ…«M—ÒÇûjô÷*l¯ñÒzW¿€Q¬Y³fqx5úX_ Ôª°ş¾¾¾=åÁåËñ>T•bVr)æ*­ä2Wuÿü¸ÊZÙï—9ÂvÎr®ˆ÷ÈLùÿıi7ÜpÃ?Â[µÃƒ>¸¿<¸<ïGU)i%—b`®ÒJ.stwwŸÑÙğÙèí>»Y¶ÛP8ß\nûï+‘\r6\\qõÕW·ü>›ã¶3cÆŒıÓ§O?+Ş—””ÀûÊ\\ßSÒJêÅÀ\\U3©ÏU]+óUŞ?­^ôÂ•­‰}æ´x_Œ,Y²äğ	Aí´`Á‚§:::fÇû’’†ƒà;Àƒ´’z10WÕLêsU×Ê|•·ÿ¼¾ÜwÜÛ*l¿aŸï+‘…îi×åôº{ï½wsgâÏÙi8¾ã\\1H+©sUÍ¤>Wu­ÌWWW×ºúı<òH|xn«°ıú¾„ıjÜO 3?úÑ†¶mÛN©-[¶l/0‰÷%%£¸G=€+i%õb0Ê<™«\n$õ¹ªe®šæ«üúRıövûcaû\rûøRôŸä¤¿¿ÿø«¯¾\ZN©}ûö,.»â}IÉ(ì8µxŠÁ³Ï>[{‚~|{czè¡¦ÛxàâÀM·§œÔ‹Á(sÇ\\%˜Ôçªn”yŠæëÍúßÛ}ì…í×÷¥««ë@üßdäª«®*9N©r{F9V2©ƒp óÍ7kŞºukñ‰O|¢Ø¿ÿÈıCCCo[şÂ/,ÂsyÃ§€„‘…Bpùå—7ÜpCÓºÃú{î¹¦ÛSHüó©j&ã\\…Ë««V­*öîİÛtßD\'şùä’vûcaû\rûs4~|2rÍ5×i÷o¹{öìy®³ºg8ïë¬À¥ÏÓ¦Mï{ZÌš5+œ)¾ıío3gÎ3Z|îsŸ+xâ‰‘å/ºè¢â¾ûî«=à_zé¥µÛ¦OŸ^Üyçµ³X¬•Ì3fùÈGŠßüæ7MÛL!©Ÿ‰\Ze&ı\\…ÛæÏŸ_[WÈ§?ıéZ±·=‘I}®êF™«¦ù\ngë··ûØs†&‘üàÚı<¿ıíotVï9œo+u©ƒO}êSáßyäïúĞ‡FŠÀ­·ŞZÌ›7¯ØµkW­„3OguVqşùççw^ño|£VB1øío[|å+_©•‰\'Ÿ|²øÒ—¾T+\nçØ˜«æ¹\nß{ÆgëÖ­+jóµråÊ¦mOdRŸ«ºVæ«Ós8‰0wîÜgÛı*õ;ï¼sUgu^¥ŞtÀn”j1xå•WŠ¯~õ«µı|à#şä\'?9rIüĞ¡CµpÉ%—ë×¯¯]ú<÷Üs‹sÎ9§øğ‡?\\|şóŸ/®¿şúâõ×_Y÷…sÌÌÕèsÕßß_<öØcáùİµù\nÏóŒ·=‘I}®êZ™/¯R&Ä‚ni÷ûp^{íµ«+ğ>œ\'<`7Jµ„|ô£y¾İ™g9rûÇ>ö±·-÷Æo_üâk—?¿ùÍoW\\qEíöp&ê—¿üeÓz§(œcf®N<W!á,iıÒ{JI}®êZ™¯NïÃ	L„ŞŞŞ³ûúúµñ“†^),{Rÿ¤¡V¥\\>şñ===µË–áLTøZÿs}™_ıêWµqúé§k×®-Ö¬Yó¶bk¯wŠÂyÊMÆ¹\ngB»»»“|{.st&ôICßûŞ÷7NŸ4¹›3gÎíº¬¾|ùò;:}–z[.]†w„ËüàG.}N:µvÉ3,388Xüş÷¿¹ô9Z1xúé§‹¥K—¬wŠÂyÊM¶¹\n.Cµï—YG{;¥‰L.sø,u`Â”_»îºë=z4>&œTåúw”–­W^yå—ã}¨ª”‹ÁO~ò“âğáÃµ?‡³RõÛö³Ÿ5½}Mc1¸ì²ËŠ›nº©xÿûß_¬X±¢ö*ã¹sçÖ¿wÛm·Õ\ngWWW±aÃ†¦mNtr)“i®Ârá•ïK–,©ı\"^L^<ow\"“Ë\\Õ•Çáõ²·xñâøPİa»\r…3éçô\'Ñµ×^ûØêÕ«Ç…“èxù@õëòÀ²:Şv•¥\\\Z.oÆ·…lÙ²¥øéOZ|ö³Ÿ­ÈÛo¿½8í´Ój7Şxcí9zá•ÆáRg¸Êğ[×„„³Zñú&:¹ƒÉ4Waù)\rs¾?^çD&—¹ª+é¿¸^öÂÏ İg9ÃöÊ_ZG.§‡ı‰÷ÈÔôéÓÏëíí=øÌ3ÏÄÇ†“âOúÓ’òÀ²;l\'Şv•U¥\\pÁM·…„3U7ß|sqñÅ×^ä±}ûöâ–[niZ®*É¥˜«´’Ë\\5*Ç›ê…oÑ¢Eñ!û”\nÛk8»¹)Ş7 såoœ—Ìœ9óPxşÕÉT>ØÜUT^Îñ·ØªƒúsëFK|´ÊÉ¥˜«´’Ë\\5*÷_(ËÇêÅ/¼uU;„í4”Íca?â}&îîîY½½½NÖ™Îá3›»ÊÌŒ·•ƒªƒÉ’\\Š¹J+¹ÌU¬££ã¶zù—Öüñø~R…õ7^JÛ÷	˜DÂ™È«®ºêµ•+W¾6Ö…\r?gó•ÏlÖ)i%—b`®ÒJ.sëéé™Z£Ÿ¨ÀğöV§ªt†õ–Û9£\Z¶¶ï0É”¿y~¦üwm__ß|p«ïÓY.7¸|ùòeåÁdk™5a=ñºs¢¤•\\Š¹J+¹ÌÕhÊãôÙeÂ;ˆŒœéMz2…õ5ÙŞŞÙñ¾\0“Xx£òÀ°~ÆŒ¯ÏŸ?ÿÉ§¶lÙòÒŞ½{ß(#ÿş÷¿oÛ¼yó#¿ûİïVÎ™3gM¹ìŞ°|No}ôNƒ´’K10Wi%—¹:‘²ßX:CÂ{ÆûêõğıÑ„je3l/Ş€šğÉ@å¢¿££#|úÃ\r§ğõááÛûsù¡V)i%—b`®ÒJ.sõN:ÿy¦säòzH8ÛŞÊjçÎq—|Gaùğ}ÑYÍÚeô°xÛ\0¼Å ­äRÌUZÉe®ŞMxNåğ‰â¢XûÌeË–>úhñüóÏûöí«•Ëğ5ü=Üî>®²ãa½³	0FŠAZÉ¥˜«´’Ë\\µjø-“FŞ§sœÙä­\0ÆI1H+¹s•Vr™«÷*¼7sç??sä³×[LX~Eøşx\0ŒbVr)æ*­ä2WcÕÓÓszY §uttÜZ~(óB™CÃå2|\r¾ZX>^\0ã ¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0500p|hh¨éJÚŸòçğrYÇ?£*2Wé$§¹ ¢Ö¯_ÿòàà`Óƒ”´?/¾øâò²<ÿŒªÈ\\¥“œæ\n€ŠZ·nİå÷ßÿë»wïŞëŒÔÄ¤üwß½}ûöÿ*KÁKe¾ÿŒªÈ\\M|rœ+\0*,<…3 eŞ\nÏõ’¶\'ü»‡ÿ¬JAøïşï2W“,ç\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Iìÿ\0DÌšŸVñ®é\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57533',1,'ç»“æŸ.bpmn','57532','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_p82g6ib8\" name=\"ç»“æŸ\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1i02yp6</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0vemk0z\" name=\"å®¡æ‰¹1\" flowable:assignee=\"1\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1i02yp6</incoming>\n      <outgoing>Flow_1y6yxk7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i02yp6\" sourceRef=\"start_event\" targetRef=\"Activity_0vemk0z\" />\n    <userTask id=\"Activity_005chiy\" name=\"å®¡æ‰¹2\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1y6yxk7</incoming>\n      <outgoing>Flow_0wd9u4i</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1y6yxk7\" sourceRef=\"Activity_0vemk0z\" targetRef=\"Activity_005chiy\" />\n    <endEvent id=\"Event_0e956to\">\n      <incoming>Flow_0wd9u4i</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0wd9u4i\" sourceRef=\"Activity_005chiy\" targetRef=\"Event_0e956to\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_p82g6ib8\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0vemk0z_di\" bpmnElement=\"Activity_0vemk0z\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_005chiy_di\" bpmnElement=\"Activity_005chiy\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0e956to_di\" bpmnElement=\"Event_0e956to\">\n        <omgdc:Bounds x=\"622\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1i02yp6_di\" bpmnElement=\"Flow_1i02yp6\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1y6yxk7_di\" bpmnElement=\"Flow_1y6yxk7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0wd9u4i_di\" bpmnElement=\"Flow_0wd9u4i\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"622\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57534',1,'ç»“æŸ.flow_p82g6ib8.png','57532','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0œ\0\0	\0\0\09÷È\0\0dIDATx^íİ[ŒUõ½pêÃ	m_´·4Zµ“Ú¤¾¶öÁ¶š>Tc=çBlg`ŒC+¶I{ÚH$DhL“ÚcO0m\Z¨œsR,Ø‚T-Z@ë­G©\"Š( NEPËeõß=gûßƒng`ÏıçóI¾Ø{ÍZKæçÚßYk_¦L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿWÅ¿lÛ¶í¿7nÜøâ{î‘6§üw?¾~ıú—×­[wyüó©*s5ñÉq®\0¨¨²üOù TCCCÅ[o½%mNøwÿş÷ßÿëeQøzü3ª\"s5ñÉq®\0¨¨p*<(ÅVÒşìŞ½{oYFUd®ÒINs@E…ËÎ@¥‘ğs(‹ÁáøgTEæ*ä4W\0TTx®Wü\0%—ğóˆFUd®ÒJ.s@EµZŞØ¿»Øö—_›ï½±–ğçp[¼œŒ/¹s•Vr™+\0*ª•bpğµ]ÅSkçıÃ¿½-á¶p_¼¼Œ=¹s•Vr™+\0*ª•b°cóª¦RPÏÎÍw5-/cO.ÅÀ\\¥•\\æ\n€Šj¥<}ß¢¦BPO¸/^^Æ\\Š¹J+¹Ì\0ÕJ1xêùM… p_¼¼Œ=¹s•Vr™+\0*J1H+¹s•Vr™+\0*ª•b^=‚zÂ}ñò2öäRÌUZÉe®\0¨¨VŠÁÖ?ÿGS!¨\'Ü//cO.ÅÀ\\¥•\\æ\n€Šj¥ìÛõ¿ÅSü÷¦Rn÷ÅËËØ“K10Wi%—¹ ¢Z)!/<²´©„Ûâåd|É¥˜«´’Ë\\PQ-ƒÃ‡‹­ş³©„ÛÂ}MËË˜“K10Wi%—¹ ¢Ş­„O|yöÏ?o*õ„û|*ÌÉK.ÅÀ\\¥•\\æ\n€Š:a18|¸Ø½u]ñäİs›Ê@œ°LXÖY©ñ\'—b`®ÒJ.s@EVŞíìÓ‰â¬Ôø“K10Wi%—¹ ¢F+­œ}:QÂ÷Æë“Ö“K10Wi%—¹ ¢F+ñƒı{M¼>i=¹s•Vr™+\0*j´b —\\Š¹J+¹ÌÕXõôôœŞÙÙ9­££ãÖòë@™Ê*S\r¾ZX>^\0ã ¤•\\Š¹J+¹ÌÕ{ÕÕÕuIY W”yk¸\\¶š°üŠğıñ:Å ­äRÌUZÉe®ZUÅ/”…qÓ(Er,ÙÖo€÷@1H+¹s•Vr™«wÓÓÓ3µ££ã¶²$‹ã÷¿ÿıbÙ²eÅ£>Z<ÿüóÅ¾}ûŠ |\r·‡ûÃrñ÷†õ…õ†õÇÛQSNÛ¸qã¿.]ºô,ØûãÿxhöìÙµRÿ‘şğ‡ÊÛ[¸pá-½½½gÇßŸ3Å ­äRÌUZÉe®ŞIy<?»««ë¯E±»»»X¼xq±sçÎZ¹lUX>|_øş¨x>¶o˜äÊãÆÔ»ï¾ûöyóæı£¯¯¯øÅ/~QlÚ´iÔßnÃíáşY³f›3gÎ¶«¯¾úkñúr¤¤•\\Š¹J+¹ÌÕ‰”Eóü2»\ZËá¢E‹Š;v¼½I¾GáûÃz¢Ò¹#l/Ş`’*äw.\\8.lÜ¸±8vìX|,UX.,İu×ùÎw¾óXGGÇgâuçD1H+¹s•Vr™«ÑŸÙ)›á¬äªU«âCû¸„õEg;w8Ó	“\\ylxßÚµk—]sÍ5ÅêÕ«‹£GÆÇ–„ïßßÓÓóFÎ¯TTÒJ.ÅÀ\\¥•\\æ*SÙx½···xüñÇãÃùIÖÖßP:ŸğœN˜¤ÊcÂûV¬XñĞìÙ³‹gy&>^ŒIXO__ß¡ò·ÛYñör ¤•\\Š¹J+¹ÌUløB#g6OUÙ¬ëo<Ó¶ï0	„3›ıııÅàà`|œ—°¾ò7ÛƒW^yåÅñ6«N1H+¹s•Vr™«FÃo}t¬^şîºë®øĞ}J„í4œå<æ-“`’Ù°aÃwCÙ<Yg6cåzë[ßzmúôéçÅÛ®2Å ­äRÌUZÉe®\Zu6¼ÏfxaO;E/$Úï©òÿÿ©7İtÓPxÎå©´råÊ×º»»ï·_eŠAZÉ¥˜«´’Ë\\Õ…«M—ÒÇûjô÷*l¯ñÒzW¿€Q¬Y³fqx5úX_ Ôª°ş¾¾¾=åÁåËñ>T•bVr)æ*­ä2Wuÿü¸ÊZÙï—9ÂvÎr®ˆ÷ÈLùÿıi7ÜpÃ?Â[µÃƒ>¸¿<¸<ïGU)i%—b`®ÒJ.stwwŸÑÙğÙèí>»Y¶ÛP8ß\nûï+‘\r6\\qõÕW·ü>›ã¶3cÆŒıÓ§O?+Ş—””ÀûÊ\\ßSÒJêÅÀ\\U3©ÏU]+óUŞ?­^ôÂ•­‰}æ´x_Œ,Y²äğ	Aí´`Á‚§:::fÇû’’†ƒà;Àƒ´’z10WÕLêsU×Ê|•·ÿ¼¾ÜwÜÛ*l¿aŸï+‘…îi×åôº{ï½wsgâÏÙi8¾ã\\1H+©sUÍ¤>Wu­ÌWWW×ºúı<òH|xn«°ıú¾„ıjÜO 3?úÑ†¶mÛN©-[¶l/0‰÷%%£¸G=€+i%õb0Ê<™«\n$õ¹ªe®šæ«üúRıövûcaû\rûøRôŸä¤¿¿ÿø«¯¾\ZN©}ûö,.»â}IÉ(ì8µxŠÁ³Ï>[{‚~|{czè¡¦ÛxàâÀM·§œÔ‹Á(sÇ\\%˜Ôçªn”yŠæëÍúßÛ}ì…í×÷¥««ë@üßdäª«®*9N©r{F9V2©ƒp óÍ7kŞºukñ‰O|¢Ø¿ÿÈıCCCo[şÂ/,ÂsyÃ§€„‘…Bpùå—7ÜpCÓºÃú{î¹¦ÛSHüó©j&ã\\…Ë««V­*öîİÛtßD\'şùä’vûcaû\rûs4~|2rÍ5×i÷o¹{öìy®³ºg8ïë¬À¥ÏÓ¦Mï{ZÌš5+œ)¾ıío3gÎ3Z|îsŸ+xâ‰‘å/ºè¢â¾ûî«=à_zé¥µÛ¦OŸ^Üyçµ³X¬•Ì3fùÈGŠßüæ7MÛL!©Ÿ‰\Ze&ı\\…ÛæÏŸ_[WÈ§?ıéZ±·=‘I}®êF™«¦ù\ngë··ûØs†&‘üàÚı<¿ıíotVï9œo+u©ƒO}êSáßyäïúĞ‡FŠÀ­·ŞZÌ›7¯ØµkW­„3OguVqşùççw^ño|£VB1øío[|å+_©•‰\'Ÿ|²øÒ—¾T+\nçØ˜«æ¹\nß{ÆgëÖ­+jóµråÊ¦mOdRŸ«ºVæ«Ós8‰0wîÜgÛı*õ;ï¼sUgu^¥ŞtÀn”j1xå•WŠ¯~õ«µı|à#şä\'?9rIüĞ¡CµpÉ%—ë×¯¯]ú<÷Üs‹sÎ9§øğ‡?\\|şóŸ/®¿şúâõ×_Y÷…sÌÌÕèsÕßß_<öØcáùİµù\nÏóŒ·=‘I}®êZ™/¯R&Ä‚ni÷ûp^{íµ«+ğ>œ\'<`7Jµ„|ô£y¾İ™g9rûÇ>ö±·-÷Æo_üâk—?¿ùÍoW\\qEíöp&ê—¿üeÓz§(œcf®N<W!á,iıÒ{JI}®êZ™¯NïÃ	L„ŞŞŞ³ûúúµñ“†^),{Rÿ¤¡V¥\\>şñ===µË–áLTøZÿs}™_ıêWµqúé§k×®-Ö¬Yó¶bk¯wŠÂyÊMÆ¹\ngB»»»“|{.st&ôICßûŞ÷7NŸ4¹›3gÎíº¬¾|ùò;:}–z[.]†w„ËüàG.}N:µvÉ3,388Xüş÷¿¹ô9Z1xúé§‹¥K—¬wŠÂyÊM¶¹\n.Cµï—YG{;¥‰L.sø,u`Â”_»îºë=z4>&œTåúw”–­W^yå—ã}¨ª”‹ÁO~ò“âğáÃµ?‡³RõÛö³Ÿ5½}Mc1¸ì²ËŠ›nº©xÿûß_¬X±¢ö*ã¹sçÖ¿wÛm·Õ\ngWWW±aÃ†¦mNtr)“i®Ârá•ïK–,©ı\"^L^<ow\"“Ë\\Õ•Çáõ²·xñâøPİa»\r…3éçô\'Ñµ×^ûØêÕ«Ç…“èxù@õëòÀ²:Şv•¥\\\Z.oÆ·…lÙ²¥øéOZ|ö³Ÿ­ÈÛo¿½8í´Ój7Şxcí9zá•ÆáRg¸Êğ[×„„³Zñú&:¹ƒÉ4Waù)\rs¾?^çD&—¹ª+é¿¸^öÂÏ İg9ÃöÊ_ZG.§‡ı‰÷ÈÔôéÓÏëíí=øÌ3ÏÄÇ†“âOúÓ’òÀ²;l\'Şv•U¥\\pÁM·…„3U7ß|sqñÅ×^ä±}ûöâ–[niZ®*É¥˜«´’Ë\\5*Ç›ê…oÑ¢Eñ!û”\nÛk8»¹)Ş7 såoœ—Ìœ9óPxşÕÉT>ØÜUT^Îñ·ØªƒúsëFK|´ÊÉ¥˜«´’Ë\\5*÷_(ËÇêÅ/¼uU;„í4”Íca?â}&îîîY½½½NÖ™Îá3›»ÊÌŒ·•ƒªƒÉ’\\Š¹J+¹ÌU¬££ã¶zù—Öüñø~R…õ7^JÛ÷	˜DÂ™È«®ºêµ•+W¾6Ö…\r?gó•ÏlÖ)i%—b`®ÒJ.sëéé™Z£Ÿ¨ÀğöV§ªt†õ–Û9£\Z¶¶ï0É”¿y~¦üwm__ß|p«ïÓY.7¸|ùòeåÁdk™5a=ñºs¢¤•\\Š¹J+¹ÌÕhÊãôÙeÂ;ˆŒœéMz2…õ5ÙŞŞÙñ¾\0“Xx£òÀ°~ÆŒ¯ÏŸ?ÿÉ§¶lÙòÒŞ½{ß(#ÿş÷¿oÛ¼yó#¿ûİïVÎ™3gM¹ìŞ°|No}ôNƒ´’K10Wi%—¹:‘²ßX:CÂ{ÆûêõğıÑ„je3l/Ş€šğÉ@å¢¿££#|úÃ\r§ğõááÛûsù¡V)i%—b`®ÒJ.sõN:ÿy¦säòzH8ÛŞÊjçÎq—|Gaùğ}ÑYÍÚeô°xÛ\0¼Å ­äRÌUZÉe®ŞMxNåğ‰â¢XûÌeË–>úhñüóÏûöí«•Ëğ5ü=Üî>®²ãa½³	0FŠAZÉ¥˜«´’Ë\\µjø-“FŞ§sœÙä­\0ÆI1H+¹s•Vr™«÷*¼7sç??sä³×[LX~Eøşx\0ŒbVr)æ*­ä2WcÕÓÓszY §uttÜZ~(óB™CÃå2|\r¾ZX>^\0ã ¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0500p|hh¨éJÚŸòçğrYÇ?£*2Wé$§¹ ¢Ö¯_ÿòàà`Óƒ”´?/¾øâò²<ÿŒªÈ\\¥“œæ\n€ŠZ·nİå÷ßÿë»wïŞëŒÔÄ¤üwß½}ûöÿ*KÁKe¾ÿŒªÈ\\M|rœ+\0*,<…3 eŞ\nÏõ’¶\'ü»‡ÿ¬JAøïşï2W“,ç\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Iìÿ\0DÌšŸVñ®é\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57537',1,'è¯·å‡å†…éƒ¨é¡µé¢.bpmn','57536','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_p82g6ib8\" name=\"è¯·å‡å†…éƒ¨é¡µé¢\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1i02yp6</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0vemk0z\" name=\"å®¡æ‰¹1\" flowable:assignee=\"1\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1i02yp6</incoming>\n      <outgoing>Flow_1y6yxk7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i02yp6\" sourceRef=\"start_event\" targetRef=\"Activity_0vemk0z\" />\n    <userTask id=\"Activity_005chiy\" name=\"å®¡æ‰¹2\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1y6yxk7</incoming>\n      <outgoing>Flow_0wd9u4i</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1y6yxk7\" sourceRef=\"Activity_0vemk0z\" targetRef=\"Activity_005chiy\" />\n    <endEvent id=\"Event_0e956to\">\n      <incoming>Flow_0wd9u4i</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0wd9u4i\" sourceRef=\"Activity_005chiy\" targetRef=\"Event_0e956to\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_p82g6ib8\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0vemk0z_di\" bpmnElement=\"Activity_0vemk0z\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_005chiy_di\" bpmnElement=\"Activity_005chiy\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0e956to_di\" bpmnElement=\"Event_0e956to\">\n        <omgdc:Bounds x=\"622\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1i02yp6_di\" bpmnElement=\"Flow_1i02yp6\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1y6yxk7_di\" bpmnElement=\"Flow_1y6yxk7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0wd9u4i_di\" bpmnElement=\"Flow_0wd9u4i\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"622\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57538',1,'è¯·å‡å†…éƒ¨é¡µé¢.flow_p82g6ib8.png','57536','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0œ\0\0	\0\0\09÷È\0\0dIDATx^íİ[ŒUõ½pêÃ	m_´·4Zµ“Ú¤¾¶öÁ¶š>Tc=çBlg`ŒC+¶I{ÚH$DhL“ÚcO0m\Z¨œsR,Ø‚T-Z@ë­G©\"Š( NEPËeõß=gûßƒng`ÏıçóI¾Ø{ÍZKæçÚßYk_¦L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿWÅ¿lÛ¶í¿7nÜøâ{î‘6§üw?¾~ıú—×­[wyüó©*s5ñÉq®\0¨¨²üOù TCCCÅ[o½%mNøwÿş÷ßÿëeQøzü3ª\"s5ñÉq®\0¨¨p*<(ÅVÒşìŞ½{oYFUd®ÒINs@E…ËÎ@¥‘ğs(‹ÁáøgTEæ*ä4W\0TTx®Wü\0%—ğóˆFUd®ÒJ.s@EµZŞØ¿»Øö—_›ï½±–ğçp[¼œŒ/¹s•Vr™+\0*ª•bpğµ]ÅSkçıÃ¿½-á¶p_¼¼Œ=¹s•Vr™+\0*ª•b°cóª¦RPÏÎÍw5-/cO.ÅÀ\\¥•\\æ\n€Šj¥<}ß¢¦BPO¸/^^Æ\\Š¹J+¹Ì\0ÕJ1xêùM… p_¼¼Œ=¹s•Vr™+\0*J1H+¹s•Vr™+\0*ª•b^=‚zÂ}ñò2öäRÌUZÉe®\0¨¨VŠÁÖ?ÿGS!¨\'Ü//cO.ÅÀ\\¥•\\æ\n€Šj¥ìÛõ¿ÅSü÷¦Rn÷ÅËËØ“K10Wi%—¹ ¢Z)!/<²´©„Ûâåd|É¥˜«´’Ë\\PQ-ƒÃ‡‹­ş³©„ÛÂ}MËË˜“K10Wi%—¹ ¢Ş­„O|yöÏ?o*õ„û|*ÌÉK.ÅÀ\\¥•\\æ\n€Š:a18|¸Ø½u]ñäİs›Ê@œ°LXÖY©ñ\'—b`®ÒJ.s@EVŞíìÓ‰â¬Ôø“K10Wi%—¹ ¢F+­œ}:QÂ÷Æë“Ö“K10Wi%—¹ ¢F+ñƒı{M¼>i=¹s•Vr™+\0*j´b —\\Š¹J+¹ÌÕXõôôœŞÙÙ9­££ãÖòë@™Ê*S\r¾ZX>^\0ã ¤•\\Š¹J+¹ÌÕ{ÕÕÕuIY W”yk¸\\¶š°üŠğıñ:Å ­äRÌUZÉe®ZUÅ/”…qÓ(Er,ÙÖo€÷@1H+¹s•Vr™«wÓÓÓ3µ££ã¶²$‹ã÷¿ÿıbÙ²eÅ£>Z<ÿüóÅ¾}ûŠ |\r·‡ûÃrñ÷†õ…õ†õÇÛQSNÛ¸qã¿.]ºô,ØûãÿxhöìÙµRÿ‘şğ‡ÊÛ[¸pá-½½½gÇßŸ3Å ­äRÌUZÉe®ŞIy<?»««ë¯E±»»»X¼xq±sçÎZ¹lUX>|_øş¨x>¶o˜äÊãÆÔ»ï¾ûöyóæı£¯¯¯øÅ/~QlÚ´iÔßnÃíáşY³f›3gÎ¶«¯¾úkñúr¤¤•\\Š¹J+¹ÌÕ‰”Eóü2»\ZËá¢E‹Š;v¼½I¾GáûÃz¢Ò¹#l/Ş`’*äw.\\8.lÜ¸±8vìX|,UX.,İu×ùÎw¾óXGGÇgâuçD1H+¹s•Vr™«ÑŸÙ)›á¬äªU«âCû¸„õEg;w8Ó	“\\ylxßÚµk—]sÍ5ÅêÕ«‹£GÆÇ–„ïßßÓÓóFÎ¯TTÒJ.ÅÀ\\¥•\\æ*SÙx½···xüñÇãÃùIÖÖßP:ŸğœN˜¤ÊcÂûV¬XñĞìÙ³‹gy&>^ŒIXO__ß¡ò·ÛYñör ¤•\\Š¹J+¹ÌUløB#g6OUÙ¬ëo<Ó¶ï0	„3›ıııÅàà`|œ—°¾ò7ÛƒW^yåÅñ6«N1H+¹s•Vr™«FÃo}t¬^şîºë®øĞ}J„í4œå<æ-“`’Ù°aÃwCÙ<Yg6cåzë[ßzmúôéçÅÛ®2Å ­äRÌUZÉe®\Zu6¼ÏfxaO;E/$Úï©òÿÿ©7İtÓPxÎå©´råÊ×º»»ï·_eŠAZÉ¥˜«´’Ë\\Õ…«M—ÒÇûjô÷*l¯ñÒzW¿€Q¬Y³fqx5úX_ Ôª°ş¾¾¾=åÁåËñ>T•bVr)æ*­ä2Wuÿü¸ÊZÙï—9ÂvÎr®ˆ÷ÈLùÿıi7ÜpÃ?Â[µÃƒ>¸¿<¸<ïGU)i%—b`®ÒJ.stwwŸÑÙğÙèí>»Y¶ÛP8ß\nûï+‘\r6\\qõÕW·ü>›ã¶3cÆŒıÓ§O?+Ş—””ÀûÊ\\ßSÒJêÅÀ\\U3©ÏU]+óUŞ?­^ôÂ•­‰}æ´x_Œ,Y²äğ	Aí´`Á‚§:::fÇû’’†ƒà;Àƒ´’z10WÕLêsU×Ê|•·ÿ¼¾ÜwÜÛ*l¿aŸï+‘…îi×åôº{ï½wsgâÏÙi8¾ã\\1H+©sUÍ¤>Wu­ÌWWW×ºúı<òH|xn«°ıú¾„ıjÜO 3?úÑ†¶mÛN©-[¶l/0‰÷%%£¸G=€+i%õb0Ê<™«\n$õ¹ªe®šæ«üúRıövûcaû\rûøRôŸä¤¿¿ÿø«¯¾\ZN©}ûö,.»â}IÉ(ì8µxŠÁ³Ï>[{‚~|{czè¡¦ÛxàâÀM·§œÔ‹Á(sÇ\\%˜Ôçªn”yŠæëÍúßÛ}ì…í×÷¥««ë@üßdäª«®*9N©r{F9V2©ƒp óÍ7kŞºukñ‰O|¢Ø¿ÿÈıCCCo[şÂ/,ÂsyÃ§€„‘…Bpùå—7ÜpCÓºÃú{î¹¦ÛSHüó©j&ã\\…Ë««V­*öîİÛtßD\'şùä’vûcaû\rûs4~|2rÍ5×i÷o¹{öìy®³ºg8ïë¬À¥ÏÓ¦Mï{ZÌš5+œ)¾ıío3gÎ3Z|îsŸ+xâ‰‘å/ºè¢â¾ûî«=à_zé¥µÛ¦OŸ^Üyçµ³X¬•Ì3fùÈGŠßüæ7MÛL!©Ÿ‰\Ze&ı\\…ÛæÏŸ_[WÈ§?ıéZ±·=‘I}®êF™«¦ù\ngë··ûØs†&‘üàÚı<¿ıíotVï9œo+u©ƒO}êSáßyäïúĞ‡FŠÀ­·ŞZÌ›7¯ØµkW­„3OguVqşùççw^ño|£VB1øío[|å+_©•‰\'Ÿ|²øÒ—¾T+\nçØ˜«æ¹\nß{ÆgëÖ­+jóµråÊ¦mOdRŸ«ºVæ«Ós8‰0wîÜgÛı*õ;ï¼sUgu^¥ŞtÀn”j1xå•WŠ¯~õ«µı|à#şä\'?9rIüĞ¡CµpÉ%—ë×¯¯]ú<÷Üs‹sÎ9§øğ‡?\\|şóŸ/®¿şúâõ×_Y÷…sÌÌÕèsÕßß_<öØcáùİµù\nÏóŒ·=‘I}®êZ™/¯R&Ä‚ni÷ûp^{íµ«+ğ>œ\'<`7Jµ„|ô£y¾İ™g9rûÇ>ö±·-÷Æo_üâk—?¿ùÍoW\\qEíöp&ê—¿üeÓz§(œcf®N<W!á,iıÒ{JI}®êZ™¯NïÃ	L„ŞŞŞ³ûúúµñ“†^),{Rÿ¤¡V¥\\>şñ===µË–áLTøZÿs}™_ıêWµqúé§k×®-Ö¬Yó¶bk¯wŠÂyÊMÆ¹\ngB»»»“|{.st&ôICßûŞ÷7NŸ4¹›3gÎíº¬¾|ùò;:}–z[.]†w„ËüàG.}N:µvÉ3,388Xüş÷¿¹ô9Z1xúé§‹¥K—¬wŠÂyÊM¶¹\n.Cµï—YG{;¥‰L.sø,u`Â”_»îºë=z4>&œTåúw”–­W^yå—ã}¨ª”‹ÁO~ò“âğáÃµ?‡³RõÛö³Ÿ5½}Mc1¸ì²ËŠ›nº©xÿûß_¬X±¢ö*ã¹sçÖ¿wÛm·Õ\ngWWW±aÃ†¦mNtr)“i®Ârá•ïK–,©ı\"^L^<ow\"“Ë\\Õ•Çáõ²·xñâøPİa»\r…3éçô\'Ñµ×^ûØêÕ«Ç…“èxù@õëòÀ²:Şv•¥\\\Z.oÆ·…lÙ²¥øéOZ|ö³Ÿ­ÈÛo¿½8í´Ój7Şxcí9zá•ÆáRg¸Êğ[×„„³Zñú&:¹ƒÉ4Waù)\rs¾?^çD&—¹ª+é¿¸^öÂÏ İg9ÃöÊ_ZG.§‡ı‰÷ÈÔôéÓÏëíí=øÌ3ÏÄÇ†“âOúÓ’òÀ²;l\'Şv•U¥\\pÁM·…„3U7ß|sqñÅ×^ä±}ûöâ–[niZ®*É¥˜«´’Ë\\5*Ç›ê…oÑ¢Eñ!û”\nÛk8»¹)Ş7 såoœ—Ìœ9óPxşÕÉT>ØÜUT^Îñ·ØªƒúsëFK|´ÊÉ¥˜«´’Ë\\5*÷_(ËÇêÅ/¼uU;„í4”Íca?â}&îîîY½½½NÖ™Îá3›»ÊÌŒ·•ƒªƒÉ’\\Š¹J+¹ÌU¬££ã¶zù—Öüñø~R…õ7^JÛ÷	˜DÂ™È«®ºêµ•+W¾6Ö…\r?gó•ÏlÖ)i%—b`®ÒJ.sëéé™Z£Ÿ¨ÀğöV§ªt†õ–Û9£\Z¶¶ï0É”¿y~¦üwm__ß|p«ïÓY.7¸|ùòeåÁdk™5a=ñºs¢¤•\\Š¹J+¹ÌÕhÊãôÙeÂ;ˆŒœéMz2…õ5ÙŞŞÙñ¾\0“Xx£òÀ°~ÆŒ¯ÏŸ?ÿÉ§¶lÙòÒŞ½{ß(#ÿş÷¿oÛ¼yó#¿ûİïVÎ™3gM¹ìŞ°|No}ôNƒ´’K10Wi%—¹:‘²ßX:CÂ{ÆûêõğıÑ„je3l/Ş€šğÉ@å¢¿££#|úÃ\r§ğõááÛûsù¡V)i%—b`®ÒJ.sõN:ÿy¦säòzH8ÛŞÊjçÎq—|Gaùğ}ÑYÍÚeô°xÛ\0¼Å ­äRÌUZÉe®ŞMxNåğ‰â¢XûÌeË–>úhñüóÏûöí«•Ëğ5ü=Üî>®²ãa½³	0FŠAZÉ¥˜«´’Ë\\µjø-“FŞ§sœÙä­\0ÆI1H+¹s•Vr™«÷*¼7sç??sä³×[LX~Eøşx\0ŒbVr)æ*­ä2WcÕÓÓszY §uttÜZ~(óB™CÃå2|\r¾ZX>^\0ã ¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0500p|hh¨éJÚŸòçğrYÇ?£*2Wé$§¹ ¢Ö¯_ÿòàà`Óƒ”´?/¾øâò²<ÿŒªÈ\\¥“œæ\n€ŠZ·nİå÷ßÿë»wïŞëŒÔÄ¤üwß½}ûöÿ*KÁKe¾ÿŒªÈ\\M|rœ+\0*,<…3 eŞ\nÏõ’¶\'ü»‡ÿ¬JAøïşï2W“,ç\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Iìÿ\0DÌšŸVñ®é\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57542',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57544',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57547',1,'var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-22x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57549',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-22x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57560',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57562',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57565',1,'var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-22x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57567',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-22x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57578',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57580',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57583',1,'var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57585',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57598',1,'var-_rawValue',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rapplicantNamet\0è¯·é—®t\0	leaveTypet\0personalt\0taskIdt\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57600',1,'hist.var-_rawValue',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rapplicantNamet\0è¯·é—®t\0	leaveTypet\0personalt\0taskIdt\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57601',1,'var-_value',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rapplicantNamet\0è¯·é—®t\0	leaveTypet\0personalt\0taskIdt\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57603',1,'hist.var-_value',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rapplicantNamet\0è¯·é—®t\0	leaveTypet\0personalt\0taskIdt\0\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57636',1,'è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','57635','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"è¯·å‡å¤–éƒ¨é¡µé¢\" flowable:processCategory=\"leave\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹1\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_1473gi7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <userTask id=\"Activity_0lpu6za\" name=\"å®¡æ‰¹2\" flowable:userType=\"assignee\">\n      <incoming>Flow_1473gi7</incoming>\n      <outgoing>Flow_18puk91</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1473gi7\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Activity_0lpu6za\" />\n    <endEvent id=\"Event_1gcd18p\" name=\"ç»“æŸ\">\n      <incoming>Flow_18puk91</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_18puk91\" sourceRef=\"Activity_0lpu6za\" targetRef=\"Event_1gcd18p\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lpu6za_di\" bpmnElement=\"Activity_0lpu6za\">\n        <omgdc:Bounds x=\"170\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1gcd18p_di\" bpmnElement=\"Event_1gcd18p\">\n        <omgdc:Bounds x=\"332\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"339\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1473gi7_di\" bpmnElement=\"Flow_1473gi7\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"170\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_18puk91_di\" bpmnElement=\"Flow_18puk91\">\n        <di:waypoint x=\"270\" y=\"150\" />\n        <di:waypoint x=\"332\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57637',1,'è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png','57635','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Å\0\0\0È\0\0\0™(úî\0\0‚IDATx^íİ}lTu¾Çq–?nPÿÁÇŸ–DLüÃWıÃUÉş±\ZôÚÚ©m¡„âR4Ñ«‘@.üCLÄ‹7\ZÍ”²«—‡Å¬l©.O»€R*\nX*E¥ ¶¿ûû{&Ãï7Àôiæ7çû~%Ÿ´=sæœÓ™o¿¿9gÎœ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À 2ÆüG[[Û_6lØğsCCƒY³f\rÉsìãŞÓÔÔô}ccã8÷ùI:ê¯ğÑ\\€Ç6¤¿Ú?ÓÑÑaºººÌÙ³gI#»<şëÖ­;n›Ôİç(É¨¿ÂGsıy….î\nÉÚÛÛ;mSúÒ}’Œú\'\ZëğÈ!+^¡‡ylS:ã>GIFı…õxä=÷ƒ.ò|¸ÏQ’QaE[ı\\›Ò©cí¦íŸ6;>}%Š|/ÓÜùÈÀ¢­)QaE[ı\\šÒÉ£ÍöÕ³Ì¿şö_çE¦Émîü¤ÿÑÖ”¨¿°¢­ş\0O.Miÿe^CŠs`Çro~ÒÿhkJÔ_XÑV€\'—¦ôõÚy^3Š#·¹ó“şG[S¢şÂŠ¶ú<¹4¥íkf{Í(ÜæÎOúmM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõxriJr¶ŸÛŒâÈmîü¤ÿÑÖ”¨¿°¢­ş\0O.Mi÷?şÇkFqä6w~ÒÿhkJÔ_XÑV€\'—¦täà¿Íö¿ÿ·×dšÜæÎOúmM‰ú+ÚêğäÒ”$ßl\\ì5%™æÎGmM‰ú+ÚêğäÔ”Îœ1»›ÿ×kJ2Mnóæ\'ı¶¦Dı…mõx.Õ”äŠ!»şñ¦×âÈm\\Udğ¢­)QaE[ı6%û\n¼}w£Ù¶j†×ˆÜÈ<2/¯ÚmM‰ú+ÚêğdkJ—zu~¡ğª}àÑÖ”¨¿°¢­ş\0O¶¦”Ë«óEîë.ämM‰ú+ÚêğdkJn£ékÜå‘Ü£­)QaE[ılM‰.ÚšõV´Õ_UTTŒL¥R%eeeì×›olNÛ˜Ş¯òsCïí%2¿»Š¦V´5%ê/¬h«¿¾*//k¹:›³½`®‘ùëäşî2šRXÑÖ”¨¿°¢­şre³ßÙA­%Ë`×Ÿ´ÈòÜu 4¥°¢­)QaE[ı]JEEÅˆ²²²…v ëq·ç{Î,Y²ÄlÚ´Éìİ»×9rÄù*?Ët¹]æsï+Ë“åÊòİu:»MÃ7lØğŸ‹/ş{mmmçK/½Ô5uêÔèª®®>÷Â/œ°ÓöÌ™3g~eeå(÷şÚĞ”ÂŠ¶¦Dı…mõw1vÌe÷èş•9˜=ùä“æí·ß6ˆÀ\\Éür?¹¿38n•õ¸ëv½#V­ZõÎ¬Y³~®ªª2o½õ–iiiÉ:‚Ët¹}Ò¤Iİ555m“\'Oşƒ»<-hJaE[S¢şÂŠ¶ú»;±9˜9€Í›7Ïìß¿ÿüÑ®äş²g`Ü/ës·a@ì ÷\'»ç×%»©v/Ñtww»Û’•Ì\'óOŸ>ıÜ3Ï<³ÙîÎşÖ]vÒÑ”ÂŠ¶¦Dı…mõ—Mïbz@”½»eË–¹ÃÇ€Èòœ½Æıƒ²Çh—ı›Õ«W/™2eŠY±b…ùå—_ÜuçDî\'÷¯¨¨8¥íì šRXÑÖ”¨¿°¢­ş\\ò_æ!ÓÊÊJ³eËwÈ²\\Y~ÆÀ¸u@ï1Úeş¦®®î‹©S§š;wºëëYNUUÕi;‚Or×—T4¥°¢­)QaE[ı¹zOªIï!Õ€“ågî1ÊúİmÊ™ì!VWW›w=\"Ë³£÷É\'xâ!wIDS\n+ÚšõV´Õ_¦Ş]tÇÔòåËİáaHÈz2ö»ûõqæææ?É€8X{ˆ.»Ü§zêhiiéhwİICS\n+ÚšõV´Õ_¦TÆçåd˜|rN¾iq·í¢ìıGÌ;·KŞJõõõGíní*wıICS\n+ÚšõV´Õ_Lf6èY¦}%ëË<ŒÚ§#•+W®|[Î2íïI5¹’åWUU¶÷{w’„¦V´5%ê/¬h«¿Xê×K·E’|°d½{‹uî6feï7|æÌ™?ËÇ(òaıúõÇìÆ}înG’Ğ”ÂŠ¶¦Dı…mõ\'ìÚ•©Œk™æ{/1&ëÍÏÊv¹Ûêinn~lòäÉ9q d=ãÇ?VZZz£»-¡³êZ›ûİé.šRXIJS¢şŠ3I©¿X.uho/‰#9\nYHÎ%áJÜmõ,Z´h\\‰&Ÿjkk·—••Mu·%tìE‹‚¦V’Ò”¨¿âLRê/–KÚéoÆó}ğÁîW²şŒm~ÓİVÏœ9sçëĞiìÓO?İ‘Êõøn@2Ø‹M)¬$¥)QÅ™¤Ô_,—:,//oŒoß¸q£;ä•¬?ŞÙ®ÌíÌêÅ_ìjkks—3¤Z[[÷Ù\rü§»-¡ËRY‹‚¦V’Ò”²ÔõWIJıÅ²ÔŸW‡öëwñô|/.YÆ6~çü:¾êêêüÑ]Î:räÈI»qİm	]–\"pE14¥]»vEoB»Ó3óÅ_xÓ>ÿüssâÄ	ozÈIJSÊRon¨¿\0“”ú‹e©;7R‡?Å?ç{|qÉúãm±{Š\'ÜßÇ3aÂsîÜ9w9CÊ®ïD–21	µ)IqüôÓOÑ÷»wï67İt“9vìXúö®®®óæ¿÷Ş{£ÿ|\"W‡“±¤7ÎÌœ9Ó[¶,oÏ=Şôâ>?IÆú“CdrAèÎÎNï¶BÇ}~´%ßã‹KÖŸ±=¿¸c gÊ”)çò=’>|xO*Y{ŠkSEpøª¶¶Ö”””ÈgEå_|É«WóôÓO›‰\'FÑ½óÎ;ÍÖ­[ÓóßÿıfíÚµQ³yøá‡£i¥¥¥æ£>Š^åŸ<y2\ZÇo®¹æ\Zóşûï{ë!Iy¥¥îÔ×ŸL›={v´,Éí·ß\r¾îº™¤Ô_,Kıyu({dñô|/®>ï)>ÿüó\'ò}Ì÷«¯¾Ú˜JÆ{Šç5£X¨Mé¶Ûn“Ç>ıóUW]•nB,0³fÍ2Œš¼2¿ñÆÍ˜1cÌèÑ£Í£>\Z5!iJ~ø¡yà¢F¶mÛ6sß}÷E\r‰AqhQ~ıÉ}¯¼òJÓØØh\Z\Z\Z¢:¬¯¯÷Ö]È$¥şb¹Ôaª˜ßSœ1cÆ®|Ÿ}j_é-K÷Ù§^d\nµ):tÈ<øàƒQÃ‘\\~ùåéïo½õÖôáÏÓ§OG\rhìØ±¦©©):|uË-·˜›o¾Ù\\}õÕæ®»î2/¿ü²9~üxzÙÃ‡õ—½şäšÍ›7oşá¹ıõ£÷İu2I©¿X.uXÔgŸÖÖÖÎÏ÷ç§M›¶¢H?§xÁ\"ÈjS’\\{íµé÷un¸á†ôôë®»î¼ùN:eî¹çèÖã?n{ì±hº¼R÷İw½åcPrÔß…ëO\"{›ñaÖ’”ú‹åR‡©bşœbeeå¨ªªªî<^Ñæİ°ÃÅxE›\\…Ü”®¿şzùÇÏÑ¡\'y¥._ãïãyŞ{ï½¨y9Ò¬^½Ú¬\\¹ò¼¦$ïé¸ËÆ õ\'{”rñçÏLÕV\"Ğm}öÙŒAñÒW´555ßäëêÒ¥K?HqíÓ‚E?É‰rÈêŠ+®H¾\Z1bDtØJæ‘ÿùÉ\'Ÿ¤_ekJ_ıµY¼xqz¹Ãƒ¡­şä{ÛÃ¢ûË¡²lå(d´ÕŸ(êkŸ\n[”˜>}ú¹<ü—ŒıvÃvó_2\n—×^{Íœ9s&ú^^µÇÓßxã\rï”øÌ¦ôÈ#˜¹sçšË.»ÌÔÕÕEgÎ˜1#zŸháÂ…Ñ X^^nš››½u:Úš’¦ú“ùäŒÖE‹E/Êä9áÆ]o!£­şb©bı/±iÓ¦m^±bE»ĞAÔcÿ şl7l…»î¤	¹)eFQ¹Ó$­­­æõ×_7wÜqG4È½óÎ;føğáQ½òÊ+Ñ{Arf ®’Û‡õ/‘Wıîò\nmMISıÉüÃ2êO\"÷w—YÈh«¿XÿOÑ¾PO:íÓÿS¥¥¥£+++OîÜ¹Ó]ö øì³ÏÙ\rk—õ¸ëNšbiJwß}·7M\"¯ä_}õUóĞCE\'<ìÛ·ÏÌŸ?ß›¯X¢­)QaE[ıe²=¿%”æÍ›çCJÖ—±—Øân[Nì¨:vâÄ‰§å˜ş`²E½ÜnÔ÷}©‹T±4¥ø=œlqes´5%ê/¬h«¿LvLùíıİñà$¯ÉYOÆ€Ø-Ûán[Îìnî$»Çxb°ö{÷ÚLt×•TÅÒ”´D[S¢şÂŠ¶ús•••-Œ(9ŒºeËw˜T²üÌÃ¦²~w›úLöè&L˜p´¾¾şhO¾‘“jzßC<¤e1FS\n+ÚšõV´ÕŸ«¢¢b„¶Æƒ”|g¨FY®]_zÏTÖ+ëw·©_ìèú[;ª¯®ªª:¼~ıúc¹~ÑÎ×±téÒ%vcvÛ¬”å¸ËN:šRXÑÖ”¨¿°¢­ş²±cÁ(ùôAzQ.ç7˜dy™{ˆ½ëånË€ÉÇ\'ì‚›Æ|öìÙÛ\Z\Z\Z¶·¶¶~×ÙÙyÊnÇÉ~ø¡mÇ?şøãúššš•vŞN™?é»¸šRXÑÖ”¨¿°¢­ş.ÄXc2F‰œ3Ğ³RåşÎI5Ñ€(ës·aPÉhìŠªíŸ\\·ôËŒ_N¾~Ù;½:ÉWªÉM)¬hkJÔ_XÑV“úu1}(U\"{òq›¸ãİEÉür?gï0:d*ëq×¢)…mM‰ú+ÚêïRä=¾Ş“oÜÁ,º$Ü’%KÌ¦M›ÌŞ½{£‹¼ù*?Ët¹İ¹t[œYî ½‡ˆÁCS\n+ÚšõV´Õ_®z?®‘şã\0Ó2 ]`hÑ”ÂŠ¶¦Dı…mõ×WòùøÔ¯—„K_+5ÇÈüurw™M)¬hkJÔ_XÑVıUQQ1Òr%eeeì×›olN÷€òU~nè½½Dæw—@Ñ”ÂŠ¶¦Dı…mõxhJaE[S¢şÂŠ¶ú<4¥°¢­)QaE[ıšRXÑÖ”¨¿°¢­ş\0M)¬hkJÔ_XÑV€‡¦V´5%ê/¬h«?ÀCS\n+ÚšõV´Õà¡)…mM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõxhJaE[S¢şÂŠ¶ú<4¥°¢­)QaE[ıšRXÑÖ”¨¿°¢­ş\0M)¬hkJÔ_XÑV€‡¦V´5%ê/¬h«?ÀCS\n+ÚšõV´Õà¡)…mM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõx\Z\Z\Zzººº¼?’ÿØçá{Û”Î¸ÏQ’QáDcı¦¦¦ï;::¼?’ÿ|ûí·KmSúÒ}’Œú\'\Zëğ466[·nİñöööN^±&öqoß·oßÿÙ†ôÍİç(É¨¿ÂGsıYÉ‚¼B´9+ï)¼GwyüU6$ù½{ê¯0Q]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@±ÿ‘ÍNÎ¥Y\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57640',1,'è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','57639','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"è¯·å‡å¤–éƒ¨é¡µé¢\" flowable:processCategory=\"leave\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <extensionElements>\n        <flowable:properties>\n          <flowable:property name=\"initiator_3_2\" value=\"æ™®é€šè§’è‰²\" />\n        </flowable:properties>\n      </extensionElements>\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹1\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_1473gi7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <userTask id=\"Activity_0lpu6za\" name=\"å®¡æ‰¹2\" flowable:assignee=\"1\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1473gi7</incoming>\n      <outgoing>Flow_18puk91</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1473gi7\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Activity_0lpu6za\" />\n    <endEvent id=\"Event_1gcd18p\" name=\"ç»“æŸ\">\n      <incoming>Flow_18puk91</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_18puk91\" sourceRef=\"Activity_0lpu6za\" targetRef=\"Event_1gcd18p\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0lpu6za_di\" bpmnElement=\"Activity_0lpu6za\">\n        <omgdc:Bounds x=\"170\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1gcd18p_di\" bpmnElement=\"Event_1gcd18p\">\n        <omgdc:Bounds x=\"332\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"339\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1473gi7_di\" bpmnElement=\"Flow_1473gi7\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"170\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_18puk91_di\" bpmnElement=\"Flow_18puk91\">\n        <di:waypoint x=\"270\" y=\"150\" />\n        <di:waypoint x=\"332\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57641',1,'è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png','57639','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Å\0\0\0È\0\0\0™(úî\0\0‚IDATx^íİ}lTu¾Çq–?nPÿÁÇŸ–DLüÃWıÃUÉş±\ZôÚÚ©m¡„âR4Ñ«‘@.üCLÄ‹7\ZÍ”²«—‡Å¬l©.O»€R*\nX*E¥ ¶¿ûû{&Ãï7Àôiæ7çû~%Ÿ´=sæœÓ™o¿¿9gÎœ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À 2ÆüG[[Û_6lØğsCCƒY³f\rÉsìãŞÓÔÔô}ccã8÷ùI:ê¯ğÑ\\€Ç6¤¿Ú?ÓÑÑaºººÌÙ³gI#»<şëÖ­;n›Ôİç(É¨¿ÂGsıy….î\nÉÚÛÛ;mSúÒ}’Œú\'\ZëğÈ!+^¡‡ylS:ã>GIFı…õxä=÷ƒ.ò|¸ÏQ’QaE[ı\\›Ò©cí¦íŸ6;>}%Š|/ÓÜùÈÀ¢­)QaE[ı\\šÒÉ£ÍöÕ³Ì¿şö_çE¦Émîü¤ÿÑÖ”¨¿°¢­ş\0O.Miÿe^CŠs`Çro~ÒÿhkJÔ_XÑV€\'—¦ôõÚy^3Š#·¹ó“şG[S¢şÂŠ¶ú<¹4¥íkf{Í(ÜæÎOúmM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõxriJr¶ŸÛŒâÈmîü¤ÿÑÖ”¨¿°¢­ş\0O.Mi÷?şÇkFqä6w~ÒÿhkJÔ_XÑV€\'—¦täà¿Íö¿ÿ·×dšÜæÎOúmM‰ú+ÚêğäÒ”$ßl\\ì5%™æÎGmM‰ú+ÚêğäÔ”Îœ1»›ÿ×kJ2Mnóæ\'ı¶¦Dı…mõx.Õ”äŠ!»şñ¦×âÈm\\Udğ¢­)QaE[ı6%û\n¼}w£Ù¶j†×ˆÜÈ<2/¯ÚmM‰ú+ÚêğdkJ—zu~¡ğª}àÑÖ”¨¿°¢­ş\0O¶¦”Ë«óEîë.ämM‰ú+ÚêğdkJn£ékÜå‘Ü£­)QaE[ılM‰.ÚšõV´Õ_UTTŒL¥R%eeeì×›olNÛ˜Ş¯òsCïí%2¿»Š¦V´5%ê/¬h«¿¾*//k¹:›³½`®‘ùëäşî2šRXÑÖ”¨¿°¢­şre³ßÙA­%Ë`×Ÿ´ÈòÜu 4¥°¢­)QaE[ı]JEEÅˆ²²²…v ëq·ç{Î,Y²ÄlÚ´Éìİ»×9rÄù*?Ët¹]æsï+Ë“åÊòİu:»MÃ7lØğŸ‹/ş{mmmçK/½Ô5uêÔèª®®>÷Â/œ°ÓöÌ™3g~eeå(÷şÚĞ”ÂŠ¶¦Dı…mõw1vÌe÷èş•9˜=ùä“æí·ß6ˆÀ\\Éür?¹¿38n•õ¸ëv½#V­ZõÎ¬Y³~®ªª2o½õ–iiiÉ:‚Ët¹}Ò¤Iİ555m“\'Oşƒ»<-hJaE[S¢şÂŠ¶ú»;±9˜9€Í›7Ïìß¿ÿüÑ®äş²g`Ü/ës·a@ì ÷\'»ç×%»©v/Ñtww»Û’•Ì\'óOŸ>ıÜ3Ï<³ÙîÎşÖ]vÒÑ”ÂŠ¶¦Dı…mõ—Mïbz@”½»eË–¹ÃÇ€Èòœ½Æıƒ²Çh—ı›Õ«W/™2eŠY±b…ùå—_ÜuçDî\'÷¯¨¨8¥íì šRXÑÖ”¨¿°¢­ş\\ò_æ!ÓÊÊJ³eËwÈ²\\Y~ÆÀ¸u@ï1Úeş¦®®î‹©S§š;wºëëYNUUÕi;‚Or×—T4¥°¢­)QaE[ı¹zOªIï!Õ€“ågî1ÊúİmÊ™ì!VWW›w=\"Ë³£÷É\'xâ!wIDS\n+ÚšõV´Õ_¦Ş]tÇÔòåËİáaHÈz2ö»ûõqæææ?É€8X{ˆ.»Ü§zêhiiéhwİICS\n+ÚšõV´Õ_¦TÆçåd˜|rN¾iq·í¢ìıGÌ;·KŞJõõõGíní*wıICS\n+ÚšõV´Õ_Lf6èY¦}%ëË<ŒÚ§#•+W®|[Î2íïI5¹’åWUU¶÷{w’„¦V´5%ê/¬h«¿Xê×K·E’|°d½{‹uî6feï7|æÌ™?ËÇ(òaıúõÇìÆ}înG’Ğ”ÂŠ¶¦Dı…mõ\'ìÚ•©Œk™æ{/1&ëÍÏÊv¹Ûêinn~lòäÉ9q d=ãÇ?VZZz£»-¡³êZ›ûİé.šRXIJS¢şŠ3I©¿X.uho/‰#9\nYHÎ%áJÜmõ,Z´h\\‰&Ÿjkk·—••Mu·%tìE‹‚¦V’Ò”¨¿âLRê/–KÚéoÆó}ğÁîW²şŒm~ÓİVÏœ9sçëĞiìÓO?İ‘Êõøn@2Ø‹M)¬$¥)QÅ™¤Ô_,—:,//oŒoß¸q£;ä•¬?ŞÙ®ÌíÌêÅ_ìjkks—3¤Z[[÷Ù\rü§»-¡ËRY‹‚¦V’Ò”²ÔõWIJıÅ²ÔŸW‡öëwñô|/.YÆ6~çü:¾êêêüÑ]Î:räÈI»qİm	]–\"pE14¥]»vEoB»Ó3óÅ_xÓ>ÿüssâÄ	ozÈIJSÊRon¨¿\0“”ú‹e©;7R‡?Å?ç{|qÉúãm±{Š\'ÜßÇ3aÂsîÜ9w9CÊ®ïD–21	µ)IqüôÓOÑ÷»wï67İt“9vìXúö®®®óæ¿÷Ş{£ÿ|\"W‡“±¤7ÎÌœ9Ó[¶,oÏ=Şôâ>?IÆú“CdrAèÎÎNï¶BÇ}~´%ßã‹KÖŸ±=¿¸c gÊ”)çò=’>|xO*Y{ŠkSEpøª¶¶Ö”””ÈgEå_|É«WóôÓO›‰\'FÑ½óÎ;ÍÖ­[ÓóßÿıfíÚµQ³yøá‡£i¥¥¥æ£>Š^åŸ<y2\ZÇo®¹æ\Zóşûï{ë!Iy¥¥îÔ×ŸL›={v´,Éí·ß\r¾îº™¤Ô_,Kıyu({dñô|/®>ï)>ÿüó\'ò}Ì÷«¯¾Ú˜JÆ{Šç5£X¨Mé¶Ûn“Ç>ıóUW]•nB,0³fÍ2Œš¼2¿ñÆÍ˜1cÌèÑ£Í£>\Z5!iJ~ø¡yà¢F¶mÛ6sß}÷E\r‰AqhQ~ıÉ}¯¼òJÓØØh\Z\Z\Z¢:¬¯¯÷Ö]È$¥şb¹Ôaª˜ßSœ1cÆ®|Ÿ}j_é-K÷Ù§^d\nµ):tÈ<øàƒQÃ‘\\~ùåéïo½õÖôáÏÓ§OG\rhìØ±¦©©):|uË-·˜›o¾Ù\\}õÕæ®»î2/¿ü²9~üxzÙÃ‡õ—½şäšÍ›7oşá¹ıõ£÷İu2I©¿X.uXÔgŸÖÖÖÎÏ÷ç§M›¶¢H?§xÁ\"ÈjS’\\{íµé÷un¸á†ôôë®»î¼ùN:eî¹çèÖã?n{ì±hº¼R÷İw½åcPrÔß…ëO\"{›ñaÖ’”ú‹åR‡©bşœbeeå¨ªªªî<^Ñæİ°ÃÅxE›\\…Ü”®¿şzùÇÏÑ¡\'y¥._ãïãyŞ{ï½¨y9Ò¬^½Ú¬\\¹ò¼¦$ïé¸ËÆ õ\'{”rñçÏLÕV\"Ğm}öÙŒAñÒW´555ßäëêÒ¥K?HqíÓ‚E?É‰rÈêŠ+®H¾\Z1bDtØJæ‘ÿùÉ\'Ÿ¤_ekJ_ıµY¼xqz¹Ãƒ¡­şä{ÛÃ¢ûË¡²lå(d´ÕŸ(êkŸ\n[”˜>}ú¹<ü—ŒıvÃvó_2\n—×^{Íœ9s&ú^^µÇÓßxã\rï”øÌ¦ôÈ#˜¹sçšË.»ÌÔÕÕEgÎ˜1#zŸháÂ…Ñ X^^nš››½u:Úš’¦ú“ùäŒÖE‹E/Êä9áÆ]o!£­şb©bı/±iÓ¦m^±bE»ĞAÔcÿ şl7l…»î¤	¹)eFQ¹Ó$­­­æõ×_7wÜqG4È½óÎ;føğáQ½òÊ+Ñ{Arf ®’Û‡õ/‘Wıîò\nmMISıÉüÃ2êO\"÷w—YÈh«¿XÿOÑ¾PO:íÓÿS¥¥¥£+++OîÜ¹Ó]ö øì³ÏÙ\rk—õ¸ëNšbiJwß}·7M\"¯ä_}õUóĞCE\'<ìÛ·ÏÌŸ?ß›¯X¢­)QaE[ıe²=¿%”æÍ›çCJÖ—±—Øân[Nì¨:vâÄ‰§å˜ş`²E½ÜnÔ÷}©‹T±4¥ø=œlqes´5%ê/¬h«¿LvLùíıİñà$¯ÉYOÆ€Ø-Ûán[Îìnî$»Çxb°ö{÷ÚLt×•TÅÒ”´D[S¢şÂŠ¶ús•••-Œ(9ŒºeËw˜T²üÌÃ¦²~w›úLöè&L˜p´¾¾şhO¾‘“jzßC<¤e1FS\n+ÚšõV´ÕŸ«¢¢b„¶Æƒ”|g¨FY®]_zÏTÖ+ëw·©_ìèú[;ª¯®ªª:¼~ıúc¹~ÑÎ×±téÒ%vcvÛ¬”å¸ËN:šRXÑÖ”¨¿°¢­ş²±cÁ(ùôAzQ.ç7˜dy™{ˆ½ëånË€ÉÇ\'ì‚›Æ|öìÙÛ\Z\Z\Z¶·¶¶~×ÙÙyÊnÇÉ~ø¡mÇ?şøãúššš•vŞN™?é»¸šRXÑÖ”¨¿°¢­ş.ÄXc2F‰œ3Ğ³RåşÎI5Ñ€(ës·aPÉhìŠªíŸ\\·ôËŒ_N¾~Ù;½:ÉWªÉM)¬hkJÔ_XÑV“úu1}(U\"{òq›¸ãİEÉür?gï0:d*ëq×¢)…mM‰ú+ÚêïRä=¾Ş“oÜÁ,º$Ü’%KÌ¦M›ÌŞ½{£‹¼ù*?Ët¹İ¹t[œYî ½‡ˆÁCS\n+ÚšõV´Õ_®z?®‘şã\0Ó2 ]`hÑ”ÂŠ¶¦Dı…mõ×WòùøÔ¯—„K_+5ÇÈüurw™M)¬hkJÔ_XÑVıUQQ1Òr%eeeì×›olN÷€òU~nè½½Dæw—@Ñ”ÂŠ¶¦Dı…mõxhJaE[S¢şÂŠ¶ú<4¥°¢­)QaE[ıšRXÑÖ”¨¿°¢­ş\0M)¬hkJÔ_XÑV€‡¦V´5%ê/¬h«?ÀCS\n+ÚšõV´Õà¡)…mM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõxhJaE[S¢şÂŠ¶ú<4¥°¢­)QaE[ıšRXÑÖ”¨¿°¢­ş\0M)¬hkJÔ_XÑV€‡¦V´5%ê/¬h«?ÀCS\n+ÚšõV´Õà¡)…mM‰ú+ÚêğĞ”ÂŠ¶¦Dı…mõx\Z\Z\Zzººº¼?’ÿØçá{Û”Î¸ÏQ’QáDcı¦¦¦ï;::¼?’ÿ|ûí·KmSúÒ}’Œú\'\Zëğ466[·nİñöööN^±&öqoß·oßÿÙ†ôÍİç(É¨¿ÂGsıYÉ‚¼B´9+ï)¼GwyüU6$ù½{ê¯0Q]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0@±ÿ‘ÍNÎ¥Y\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57671',1,'var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57673',1,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0bt\0formNamet\0è¯·å‡t\0formContentt\n}{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}t\0\nformRouterpt\0\nformSubmitpx\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57676',1,'var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57678',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57688',1,'è¯·å‡å†…éƒ¨é¡µé¢.bpmn','57687','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_p82g6ib8\" name=\"è¯·å‡å†…éƒ¨é¡µé¢\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1i02yp6</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0vemk0z\" name=\"å®¡æ‰¹1\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1i02yp6</incoming>\n      <outgoing>Flow_1y6yxk7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i02yp6\" sourceRef=\"start_event\" targetRef=\"Activity_0vemk0z\" />\n    <userTask id=\"Activity_005chiy\" name=\"å®¡æ‰¹2\" flowable:assignee=\"1\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1y6yxk7</incoming>\n      <outgoing>Flow_0wd9u4i</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1y6yxk7\" sourceRef=\"Activity_0vemk0z\" targetRef=\"Activity_005chiy\" />\n    <endEvent id=\"Event_0e956to\">\n      <incoming>Flow_0wd9u4i</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0wd9u4i\" sourceRef=\"Activity_005chiy\" targetRef=\"Event_0e956to\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_p82g6ib8\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"242\" y=\"237\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0vemk0z_di\" bpmnElement=\"Activity_0vemk0z\">\n        <omgdc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_005chiy_di\" bpmnElement=\"Activity_005chiy\">\n        <omgdc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0e956to_di\" bpmnElement=\"Event_0e956to\">\n        <omgdc:Bounds x=\"622\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1i02yp6_di\" bpmnElement=\"Flow_1i02yp6\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1y6yxk7_di\" bpmnElement=\"Flow_1y6yxk7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0wd9u4i_di\" bpmnElement=\"Flow_0wd9u4i\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"622\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57689',1,'è¯·å‡å†…éƒ¨é¡µé¢.flow_p82g6ib8.png','57687','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0œ\0\0	\0\0\09÷È\0\0dIDATx^íİ[ŒUõ½pêÃ	m_´·4Zµ“Ú¤¾¶öÁ¶š>Tc=çBlg`ŒC+¶I{ÚH$DhL“ÚcO0m\Z¨œsR,Ø‚T-Z@ë­G©\"Š( NEPËeõß=gûßƒng`ÏıçóI¾Ø{ÍZKæçÚßYk_¦L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€ÿWÅ¿lÛ¶í¿7nÜøâ{î‘6§üw?¾~ıú—×­[wyüó©*s5ñÉq®\0¨¨²üOù TCCCÅ[o½%mNøwÿş÷ßÿëeQøzü3ª\"s5ñÉq®\0¨¨p*<(ÅVÒşìŞ½{oYFUd®ÒINs@E…ËÎ@¥‘ğs(‹ÁáøgTEæ*ä4W\0TTx®Wü\0%—ğóˆFUd®ÒJ.s@EµZŞØ¿»Øö—_›ï½±–ğçp[¼œŒ/¹s•Vr™+\0*ª•bpğµ]ÅSkçıÃ¿½-á¶p_¼¼Œ=¹s•Vr™+\0*ª•b°cóª¦RPÏÎÍw5-/cO.ÅÀ\\¥•\\æ\n€Šj¥<}ß¢¦BPO¸/^^Æ\\Š¹J+¹Ì\0ÕJ1xêùM… p_¼¼Œ=¹s•Vr™+\0*J1H+¹s•Vr™+\0*ª•b^=‚zÂ}ñò2öäRÌUZÉe®\0¨¨VŠÁÖ?ÿGS!¨\'Ü//cO.ÅÀ\\¥•\\æ\n€Šj¥ìÛõ¿ÅSü÷¦Rn÷ÅËËØ“K10Wi%—¹ ¢Z)!/<²´©„Ûâåd|É¥˜«´’Ë\\PQ-ƒÃ‡‹­ş³©„ÛÂ}MËË˜“K10Wi%—¹ ¢Ş­„O|yöÏ?o*õ„û|*ÌÉK.ÅÀ\\¥•\\æ\n€Š:a18|¸Ø½u]ñäİs›Ê@œ°LXÖY©ñ\'—b`®ÒJ.s@EVŞíìÓ‰â¬Ôø“K10Wi%—¹ ¢F+­œ}:QÂ÷Æë“Ö“K10Wi%—¹ ¢F+ñƒı{M¼>i=¹s•Vr™+\0*j´b —\\Š¹J+¹ÌÕXõôôœŞÙÙ9­££ãÖòë@™Ê*S\r¾ZX>^\0ã ¤•\\Š¹J+¹ÌÕ{ÕÕÕuIY W”yk¸\\¶š°üŠğıñ:Å ­äRÌUZÉe®ZUÅ/”…qÓ(Er,ÙÖo€÷@1H+¹s•Vr™«wÓÓÓ3µ££ã¶²$‹ã÷¿ÿıbÙ²eÅ£>Z<ÿüóÅ¾}ûŠ |\r·‡ûÃrñ÷†õ…õ†õÇÛQSNÛ¸qã¿.]ºô,ØûãÿxhöìÙµRÿ‘şğ‡ÊÛ[¸pá-½½½gÇßŸ3Å ­äRÌUZÉe®ŞIy<?»««ë¯E±»»»X¼xq±sçÎZ¹lUX>|_øş¨x>¶o˜äÊãÆÔ»ï¾ûöyóæı£¯¯¯øÅ/~QlÚ´iÔßnÃíáşY³f›3gÎ¶«¯¾úkñúr¤¤•\\Š¹J+¹ÌÕ‰”Eóü2»\ZËá¢E‹Š;v¼½I¾GáûÃz¢Ò¹#l/Ş`’*äw.\\8.lÜ¸±8vìX|,UX.,İu×ùÎw¾óXGGÇgâuçD1H+¹s•Vr™«ÑŸÙ)›á¬äªU«âCû¸„õEg;w8Ó	“\\ylxßÚµk—]sÍ5ÅêÕ«‹£GÆÇ–„ïßßÓÓóFÎ¯TTÒJ.ÅÀ\\¥•\\æ*SÙx½···xüñÇãÃùIÖÖßP:ŸğœN˜¤ÊcÂûV¬XñĞìÙ³‹gy&>^ŒIXO__ß¡ò·ÛYñör ¤•\\Š¹J+¹ÌUløB#g6OUÙ¬ëo<Ó¶ï0	„3›ıııÅàà`|œ—°¾ò7ÛƒW^yåÅñ6«N1H+¹s•Vr™«FÃo}t¬^şîºë®øĞ}J„í4œå<æ-“`’Ù°aÃwCÙ<Yg6cåzë[ßzmúôéçÅÛ®2Å ­äRÌUZÉe®\Zu6¼ÏfxaO;E/$Úï©òÿÿ©7İtÓPxÎå©´råÊ×º»»ï·_eŠAZÉ¥˜«´’Ë\\Õ…«M—ÒÇûjô÷*l¯ñÒzW¿€Q¬Y³fqx5úX_ Ôª°ş¾¾¾=åÁåËñ>T•bVr)æ*­ä2Wuÿü¸ÊZÙï—9ÂvÎr®ˆ÷ÈLùÿıi7ÜpÃ?Â[µÃƒ>¸¿<¸<ïGU)i%—b`®ÒJ.stwwŸÑÙğÙèí>»Y¶ÛP8ß\nûï+‘\r6\\qõÕW·ü>›ã¶3cÆŒıÓ§O?+Ş—””ÀûÊ\\ßSÒJêÅÀ\\U3©ÏU]+óUŞ?­^ôÂ•­‰}æ´x_Œ,Y²äğ	Aí´`Á‚§:::fÇû’’†ƒà;Àƒ´’z10WÕLêsU×Ê|•·ÿ¼¾ÜwÜÛ*l¿aŸï+‘…îi×åôº{ï½wsgâÏÙi8¾ã\\1H+©sUÍ¤>Wu­ÌWWW×ºúı<òH|xn«°ıú¾„ıjÜO 3?úÑ†¶mÛN©-[¶l/0‰÷%%£¸G=€+i%õb0Ê<™«\n$õ¹ªe®šæ«üúRıövûcaû\rûøRôŸä¤¿¿ÿø«¯¾\ZN©}ûö,.»â}IÉ(ì8µxŠÁ³Ï>[{‚~|{czè¡¦ÛxàâÀM·§œÔ‹Á(sÇ\\%˜Ôçªn”yŠæëÍúßÛ}ì…í×÷¥««ë@üßdäª«®*9N©r{F9V2©ƒp óÍ7kŞºukñ‰O|¢Ø¿ÿÈıCCCo[şÂ/,ÂsyÃ§€„‘…Bpùå—7ÜpCÓºÃú{î¹¦ÛSHüó©j&ã\\…Ë««V­*öîİÛtßD\'şùä’vûcaû\rûs4~|2rÍ5×i÷o¹{öìy®³ºg8ïë¬À¥ÏÓ¦Mï{ZÌš5+œ)¾ıío3gÎ3Z|îsŸ+xâ‰‘å/ºè¢â¾ûî«=à_zé¥µÛ¦OŸ^Üyçµ³X¬•Ì3fùÈGŠßüæ7MÛL!©Ÿ‰\Ze&ı\\…ÛæÏŸ_[WÈ§?ıéZ±·=‘I}®êF™«¦ù\ngë··ûØs†&‘üàÚı<¿ıíotVï9œo+u©ƒO}êSáßyäïúĞ‡FŠÀ­·ŞZÌ›7¯ØµkW­„3OguVqşùççw^ño|£VB1øío[|å+_©•‰\'Ÿ|²øÒ—¾T+\nçØ˜«æ¹\nß{ÆgëÖ­+jóµråÊ¦mOdRŸ«ºVæ«Ós8‰0wîÜgÛı*õ;ï¼sUgu^¥ŞtÀn”j1xå•WŠ¯~õ«µı|à#şä\'?9rIüĞ¡CµpÉ%—ë×¯¯]ú<÷Üs‹sÎ9§øğ‡?\\|şóŸ/®¿şúâõ×_Y÷…sÌÌÕèsÕßß_<öØcáùİµù\nÏóŒ·=‘I}®êZ™/¯R&Ä‚ni÷ûp^{íµ«+ğ>œ\'<`7Jµ„|ô£y¾İ™g9rûÇ>ö±·-÷Æo_üâk—?¿ùÍoW\\qEíöp&ê—¿üeÓz§(œcf®N<W!á,iıÒ{JI}®êZ™¯NïÃ	L„ŞŞŞ³ûúúµñ“†^),{Rÿ¤¡V¥\\>şñ===µË–áLTøZÿs}™_ıêWµqúé§k×®-Ö¬Yó¶bk¯wŠÂyÊMÆ¹\ngB»»»“|{.st&ôICßûŞ÷7NŸ4¹›3gÎíº¬¾|ùò;:}–z[.]†w„ËüàG.}N:µvÉ3,388Xüş÷¿¹ô9Z1xúé§‹¥K—¬wŠÂyÊM¶¹\n.Cµï—YG{;¥‰L.sø,u`Â”_»îºë=z4>&œTåúw”–­W^yå—ã}¨ª”‹ÁO~ò“âğáÃµ?‡³RõÛö³Ÿ5½}Mc1¸ì²ËŠ›nº©xÿûß_¬X±¢ö*ã¹sçÖ¿wÛm·Õ\ngWWW±aÃ†¦mNtr)“i®Ârá•ïK–,©ı\"^L^<ow\"“Ë\\Õ•Çáõ²·xñâøPİa»\r…3éçô\'Ñµ×^ûØêÕ«Ç…“èxù@õëòÀ²:Şv•¥\\\Z.oÆ·…lÙ²¥øéOZ|ö³Ÿ­ÈÛo¿½8í´Ój7Şxcí9zá•ÆáRg¸Êğ[×„„³Zñú&:¹ƒÉ4Waù)\rs¾?^çD&—¹ª+é¿¸^öÂÏ İg9ÃöÊ_ZG.§‡ı‰÷ÈÔôéÓÏëíí=øÌ3ÏÄÇ†“âOúÓ’òÀ²;l\'Şv•U¥\\pÁM·…„3U7ß|sqñÅ×^ä±}ûöâ–[niZ®*É¥˜«´’Ë\\5*Ç›ê…oÑ¢Eñ!û”\nÛk8»¹)Ş7 såoœ—Ìœ9óPxşÕÉT>ØÜUT^Îñ·ØªƒúsëFK|´ÊÉ¥˜«´’Ë\\5*÷_(ËÇêÅ/¼uU;„í4”Íca?â}&îîîY½½½NÖ™Îá3›»ÊÌŒ·•ƒªƒÉ’\\Š¹J+¹ÌU¬££ã¶zù—Öüñø~R…õ7^JÛ÷	˜DÂ™È«®ºêµ•+W¾6Ö…\r?gó•ÏlÖ)i%—b`®ÒJ.sëéé™Z£Ÿ¨ÀğöV§ªt†õ–Û9£\Z¶¶ï0É”¿y~¦üwm__ß|p«ïÓY.7¸|ùòeåÁdk™5a=ñºs¢¤•\\Š¹J+¹ÌÕhÊãôÙeÂ;ˆŒœéMz2…õ5ÙŞŞÙñ¾\0“Xx£òÀ°~ÆŒ¯ÏŸ?ÿÉ§¶lÙòÒŞ½{ß(#ÿş÷¿oÛ¼yó#¿ûİïVÎ™3gM¹ìŞ°|No}ôNƒ´’K10Wi%—¹:‘²ßX:CÂ{ÆûêõğıÑ„je3l/Ş€šğÉ@å¢¿££#|úÃ\r§ğõááÛûsù¡V)i%—b`®ÒJ.sõN:ÿy¦säòzH8ÛŞÊjçÎq—|Gaùğ}ÑYÍÚeô°xÛ\0¼Å ­äRÌUZÉe®ŞMxNåğ‰â¢XûÌeË–>úhñüóÏûöí«•Ëğ5ü=Üî>®²ãa½³	0FŠAZÉ¥˜«´’Ë\\µjø-“FŞ§sœÙä­\0ÆI1H+¹s•Vr™«÷*¼7sç??sä³×[LX~Eøşx\0ŒbVr)æ*­ä2WcÕÓÓszY §uttÜZ~(óB™CÃå2|\r¾ZX>^\0ã ¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0¥¤•\\Š¹J+¹Ì\0500p|hh¨éJÚŸòçğrYÇ?£*2Wé$§¹ ¢Ö¯_ÿòàà`Óƒ”´?/¾øâò²<ÿŒªÈ\\¥“œæ\n€ŠZ·nİå÷ßÿë»wïŞëŒÔÄ¤üwß½}ûöÿ*KÁKe¾ÿŒªÈ\\M|rœ+\0*,<…3 eŞ\nÏõ’¶\'ü»‡ÿ¬JAøïşï2W“,ç\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€Iìÿ\0DÌšŸVñ®é\0\0\0\0IEND®B`‚',1);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57695',2,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0labelHiddensq\0~\0\0t\0readonlyq\0~\0\"t\0disabledq\0~\0t\0hiddenq\0~\0\"t\0	clearableq\0~\0t\0showPasswordq\0~\0\"t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconPositiont\0reart\0\rshowWordLimitq\0~\0\"t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0\"t\0appendButtonDisabledq\0~\0\"t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0@ƒq\0~\0t\0inputq\0~\0\rt\0\ntext-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"q\0~\0t\0\ninput46537q\0~\0t\0è¯·å‡ç†ç”±q\0~\0q\0~\0q\0~\0t\0textq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0q\0~\0!q\0~\0\"q\0~\0#q\0~\0\"q\0~\0$q\0~\0q\0~\0%q\0~\0\"q\0~\0&q\0~\0q\0~\0\'q\0~\0\"q\0~\0(q\0~\0\"q\0~\0)q\0~\0q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,sq\0~\0\0\0\0\0w\0\0\0\0xq\0~\0-t\0rearq\0~\0/q\0~\0\"q\0~\00q\0~\0q\0~\01q\0~\0q\0~\02q\0~\0\"q\0~\03q\0~\0\"q\0~\04t\0\rcustom-searchq\0~\06q\0~\0q\0~\07q\0~\0q\0~\08q\0~\0q\0~\09q\0~\0q\0~\0:q\0~\0q\0~\0;q\0~\0q\0~\0<q\0~\0q\0~\0=q\0~\0x\0q\0~\0>t\0\ninput46537x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0ü¬q\0~\0t\0\ndate-rangeq\0~\0\rt\0date-range-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0q\0~\0t\0daterange83468q\0~\0t\0è¯·å‡èŒƒå›´q\0~\0q\0~\0q\0~\0t\0	dateranget\0startPlaceholderq\0~\0t\0endPlaceholderq\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0t\0\rautoFullWidthq\0~\0q\0~\0!q\0~\0\"q\0~\0#q\0~\0\"q\0~\0$q\0~\0q\0~\0%q\0~\0\"q\0~\0&q\0~\0t\0editableq\0~\0\"t\0formatt\0\nYYYY-MM-DDt\0valueFormatt\0\nYYYY-MM-DDq\0~\0(q\0~\0\"q\0~\0)q\0~\0q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,q\0~\0q\0~\0-t\0rearq\0~\06q\0~\0q\0~\07q\0~\0q\0~\09q\0~\0q\0~\0:q\0~\0q\0~\0;q\0~\0q\0~\0<q\0~\0x\0q\0~\0>t\0daterange83468x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulest\0\nlabelWidthsq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0,q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('57700',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('62508',2,'hist.var-formJson',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\nwidgetListsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0t\0keysr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0*¡t\0typet\0inputt\0icont\0\ntext-fieldt\0formItemFlagsr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexpt\0optionssq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"t\0namet\0å•Šå•Št\0labelt\0	è¯·å‡äººt\0\nlabelAlignt\0label-left-alignq\0~\0t\0textt\0defaultValuet\0\0t\0placeholderq\0~\0t\0columnWidtht\0200pxt\0sizeq\0~\0t\0labelHiddensq\0~\0\0t\0readonlyq\0~\0\"t\0disabledq\0~\0t\0hiddenq\0~\0\"t\0	clearableq\0~\0t\0showPasswordq\0~\0\"t\0requiredq\0~\0t\0requiredHintq\0~\0t\0\nvalidationq\0~\0t\0validationHintq\0~\0t\0customClassq\0~\0t\0labelIconPositiont\0reart\0\rshowWordLimitq\0~\0\"t\0\nprefixIconq\0~\0t\0\nsuffixIconq\0~\0t\0appendButtonq\0~\0\"t\0appendButtonDisabledq\0~\0\"t\0\nbuttonIcont\0\rcustom-searcht\0	onCreatedq\0~\0t\0	onMountedq\0~\0t\0onInputq\0~\0t\0onChangeq\0~\0t\0onFocusq\0~\0t\0onBlurq\0~\0t\0\nonValidateq\0~\0t\0onAppendButtonClickq\0~\0x\0t\0idt\0\ninput54555x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0@ƒq\0~\0t\0inputq\0~\0\rt\0\ntext-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0\"q\0~\0t\0\ninput46537q\0~\0t\0è¯·å‡ç†ç”±q\0~\0q\0~\0q\0~\0t\0textq\0~\0q\0~\0q\0~\0q\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0q\0~\0!q\0~\0\"q\0~\0#q\0~\0\"q\0~\0$q\0~\0q\0~\0%q\0~\0\"q\0~\0&q\0~\0q\0~\0\'q\0~\0\"q\0~\0(q\0~\0\"q\0~\0)q\0~\0q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,sq\0~\0\0\0\0\0w\0\0\0\0xq\0~\0-t\0rearq\0~\0/q\0~\0\"q\0~\00q\0~\0q\0~\01q\0~\0q\0~\02q\0~\0\"q\0~\03q\0~\0\"q\0~\04t\0\rcustom-searchq\0~\06q\0~\0q\0~\07q\0~\0q\0~\08q\0~\0q\0~\09q\0~\0q\0~\0:q\0~\0q\0~\0;q\0~\0q\0~\0<q\0~\0q\0~\0=q\0~\0x\0q\0~\0>t\0\ninput46537x\0sq\0~\0\0?@\0\0\0\0\0w\0\0\0\0\0\0q\0~\0sq\0~\0\0\0ü¬q\0~\0t\0\ndate-rangeq\0~\0\rt\0date-range-fieldq\0~\0q\0~\0q\0~\0sq\0~\0\0?@\0\0\0\0\00w\0\0\0@\0\0\0q\0~\0t\0daterange83468q\0~\0t\0è¯·å‡èŒƒå›´q\0~\0q\0~\0q\0~\0t\0	dateranget\0startPlaceholderq\0~\0t\0endPlaceholderq\0~\0q\0~\0t\0200pxq\0~\0 q\0~\0t\0\rautoFullWidthq\0~\0q\0~\0!q\0~\0\"q\0~\0#q\0~\0\"q\0~\0$q\0~\0q\0~\0%q\0~\0\"q\0~\0&q\0~\0t\0editableq\0~\0\"t\0formatt\0\nYYYY-MM-DDt\0valueFormatt\0\nYYYY-MM-DDq\0~\0(q\0~\0\"q\0~\0)q\0~\0q\0~\0*q\0~\0q\0~\0+q\0~\0q\0~\0,q\0~\0q\0~\0-t\0rearq\0~\06q\0~\0q\0~\07q\0~\0q\0~\09q\0~\0q\0~\0:q\0~\0q\0~\0;q\0~\0q\0~\0<q\0~\0x\0q\0~\0>t\0daterange83468x\0xt\0\nformConfigsq\0~\0\0?@\0\0\0\0\0w\0\0\0 \0\0\0t\0	modelNamet\0formDatat\0refNamet\0vFormt\0	rulesNamet\0rulest\0\nlabelWidthsq\0~\0\0\0\0Pt\0\rlabelPositiont\0leftq\0~\0 q\0~\0q\0~\0t\0label-left-alignt\0cssCodeq\0~\0q\0~\0,q\0~\0t\0	functionsq\0~\0t\0\nlayoutTypet\0PCt\0jsonVersionsq\0~\0\0\0\0t\0\ronFormCreatedq\0~\0t\0\ronFormMountedq\0~\0t\0onFormDataChangeq\0~\0t\0onFormValidateq\0~\0x\0x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('62513',1,'hist.var-daterange83468',NULL,'¬í\0sr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0w\0\0\0t\0\n2025-08-19t\0\n2025-08-21x',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('70004',1,'hist.var-form',NULL,'¬í\0sr\0java.util.LinkedHashMap4ÀN\\lÀû\0Z\0accessOrderxr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0\nt\0createBypt\0\ncreateTimept\0updateBypt\0\nupdateTimept\0remarkpt\0formIdsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexr\0java.lang.Number†¬•”à‹\0\0xp\0\0ct\0formNamet\0è¯·å‡å¤–éƒ¨é¡µé¢t\0formContentpt\0\nformRoutert\0/qingjiat\0\nformSubmitt\0*qingjiaServiceImpl.insert(Qingjia qingjia)x\0',NULL);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('7515',1,'flow_yvmruh6h.bpmn','7514','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:bioc=\"http://bpmn.io/schema/bpmn/biocolor/1.0\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"http://www.flowable.org/processdef\">\n  <process id=\"flow_rmnt89qb\" name=\"flow_yvmruh6h\">\n    <startEvent id=\"start_event\" name=\"å¼€å§‹\">\n      <outgoing>Flow_1hhdvmu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_04q4vtx\" name=\"å®¡æ‰¹\" flowable:assignee=\"2\" flowable:userType=\"assignee\" flowable:dataType=\"fixed\">\n      <incoming>Flow_1hhdvmu</incoming>\n      <outgoing>Flow_0omvgyh</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1hhdvmu\" sourceRef=\"start_event\" targetRef=\"Activity_04q4vtx\" />\n    <endEvent id=\"Event_0kjk81i\" name=\"ç»“æŸ\">\n      <incoming>Flow_0omvgyh</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0omvgyh\" sourceRef=\"Activity_04q4vtx\" targetRef=\"Event_0kjk81i\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"flow_rmnt89qb\">\n      <bpmndi:BPMNShape id=\"BPMNShape_start_event\" bpmnElement=\"start_event\" bioc:stroke=\"\">\n        <omgdc:Bounds x=\"-75\" y=\"135\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"-73\" y=\"172\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_04q4vtx_di\" bpmnElement=\"Activity_04q4vtx\">\n        <omgdc:Bounds x=\"10\" y=\"110\" width=\"100\" height=\"80\" />\n        <bpmndi:BPMNLabel />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0kjk81i_di\" bpmnElement=\"Event_0kjk81i\">\n        <omgdc:Bounds x=\"172\" y=\"132\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds x=\"179\" y=\"175\" width=\"23\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge id=\"Flow_1hhdvmu_di\" bpmnElement=\"Flow_1hhdvmu\">\n        <di:waypoint x=\"-45\" y=\"150\" />\n        <di:waypoint x=\"10\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0omvgyh_di\" bpmnElement=\"Flow_0omvgyh\">\n        <di:waypoint x=\"110\" y=\"150\" />\n        <di:waypoint x=\"172\" y=\"150\" />\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('7516',1,'flow_yvmruh6h.flow_rmnt89qb.png','7514','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0%\0\0\0È\0\0\0®Ê÷Ÿ\0\0\r„IDATx^íİleÇqåê?œFcÄŸ91ñÿ=ü‡SÈı¡9[ÙJP)%´JÕDOcCsğ1ï¼@4††^š»X¼–\n-X´Å“Š¥P*J¥h¡-BûÜóvÖé3KÙvÛí³û¼_É7mggæyØùğÌìììu×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0’L)õ»¦¦¦ïŞ½û×ªª*µmÛ6*É¥Ÿ÷şšššSÕÕÕsÌ×p¤ÿèBµµµ©uéÒ%*É%Ï»<ÿ;wî<¯Cê1ó5œ\"#$Ù!Ì…J~µ¶¶¶ëPÚk¾F€Sä’%¯ƒ¥^ó5œ\"ç4Ìƒš¸’×Ã|\0§ÄJÎµª¦¯?RõÛWx%¿Ë4s>*±\"”à¼xB©ëìIu°²P}÷ß¿)™&™óS£/B	Î‹\'”NÔo’_-õ[BóS£/B	Î‹\'”íX\n#¿ä1s~jôE(Áyñ„ÒÁmËCaä—<fÎO¾%8P²«%8/P’wÛÌ0òK3ç§F_„œO(5~õ÷Pù%™óS£/B	Î‹\'”:NşOüüo¡@’iò˜9?5ú\"”à¼xBIêØ¾âP(É4s>*±\"”à¼¸B©·W5Öş3J2MÍOº%8ïZ¡$Wlşê½P ù%qU÷Ø¡ç]5”ô¨µ±Z}¿µ DfÉ<2/£¦Ä‹P‚ób…ÒµFGW+FM‰¡çÅ\n¥xFGW+YÖ\\Jp^¬P2ƒf¤e®Š¿%8/V(QW„R|şù)‘H$cŞ¼ykõÏ*]ÇtuëRƒ?åïªÁÇ3d~s°¡dWJÃËÊÊš­C¦L×¥Á\0Š·dş2YŞ\\\',C(ÙU„Rl:Lş¨C¥.FØŒ¦êd}f°¡dWJCéÃ®Éúì:HúÍpyå•WTII‰Ú¿¿:zô¨êèèPB~Êß2]—ùÌee}²^Y¿Ùæ˜Ó}š´{÷î¿^TTÔşÆoôäååyÿ ÜÜÜË¯½öZ§vdåÊ•k.\\x—¹¼k%»ŠPúŞgïÒ#šï‚aòÌ3Ï¨uëÖ©––/€â%óËr²¼N¤³í1¡Û¼uëÖõ………¿æää¨÷ß_ÕÕÕÅLP™./Z´¨/??¿iñâÅ6×ç\nBÉ®\"”è0š®ëd0@V¯^­Nœ814mFH–—õÁtBÚ3û2/ê‘OÓô(Iõõõ™}‰Iæ“ù_zé¥Ë/¼ğÂ7z8÷sİéP²«¥è)\ZH2ºÙ¼y³¹û&DÖgŒšNŒÉˆI¯ûúÊÊÊ’%K–¨òòruåÊ³í¸Èr²¼>¾¼àÚÙyBÉ®r=”äOğmáÂ…êÛo¿5wÙ1!ë•õ‚é@Bç˜ô:¯/++Û“——§~üñG³½Q‘õèC¿n ‹ÌöÒ¡dW¹Jƒ\'µ£#¤ñ\n$Ÿ¬?8b’öÍ>ÅMFH¹¹¹ª­­Íl\'!²>]O?ıô,³ÍtD(ÙU.‡ÒàÛş}~@lÙ²ÅÜ=Ç…´-õêrÚÚÚ%Æj„dÒëíöÙgÏfffN3ÛN7„’]år(E×!ÉÉèd2N~×™}–^~òªU«zäĞxÚ´iÓY=¬Ûj¶Ÿn%»ÊÕP’#“àa[¢ï²”´<ŒÑ‘REEÅ:y—m´\'µã%ëÏÉÉ9£;÷\'³é„P²«\\\r¥ÈÀGG¼@ë‰&‚´-•™}ŒI/7iÙ²e¿ÊÛøÉğå—_ÓÛeö#Jv•‹¡¤G(¿>Ë–ìQ’OÚ\r„Ò%é—Ù×ÚÚÚ¹‹/û:¤DI;óçÏ?—™™9Õì‹íô“ºC×Lsº‰P²«Ò-”âÙõã~ÈQĞD2>’’aö5dÃ†\rÛäJìd***:8oŞ¼<³/¶<±Ãn„’]•†¡tÍíPOÏŸoãÆæ.˜TÒ~ Ïï™}\rY¹rå™dºù¶oß^‰÷øÒ\"\'vØ‚P²«Ò8”®ºfeeUûïÛ·ÏÜ“JÚ÷û\"ı\nö3¦×_½§©©É\\Ï¸jhhhÖüÚì‹íbl17\nBÉ®r ”BÛ¡şyÜŸìıÛ$íúxÜøç„åææöÿòË/æzÆUGGG—îÜI³/¶‹±˜åm©J‡öNFšÓÍÚ³gOhÚ®]»TggghºmåP(·Ã‹şßÉŞ¿MÒ¾ß=Rê4ÿ=!,P—/_6×3®t{1È´)ÛCI6’‹/z¿766ª;ï¼S;w.úxOOOh™‡~Ø»„\\©+oŒHÍ™3G-[¶,4¯me¾>®U²÷o“´èÏ3ƒB–,Yr9ÙIzæÌ™#‘ô\Z)íˆ¤Ğá[QQ‘ÊÈÈkÆäV32ŠPÏ=÷œÊÎÎö>LùÀ¨YfæÌ™jÇŞ\'ÁüqoZff¦úä“O¼‘VWWW¨[Ê¡‘Rt;”‰?=Ùû·iÄ#¥W_}µ3ÙÇœ?üğÃ¾HzœS\ZF>ÛCé¾ûî“× ú÷Í7ß\r¡µk×ªÂÂBuòäÀwÍIÉÈhêÔ©júôéjÚ´iêÉ\'ŸôBHBéã?V<òˆff;¶”¡Ú#©|N©  àp²ß}Óÿ»n¤ö»o¡ ÈöP:}ú´zôÑG½°‘ºñÆ£¿ß{ï½êÈ‘#Ñy»»»½\0š={¶ª©©ñßî¹çu÷İw«[n¹E=øàƒêÍ7ßTçÏŸµcK¥q(]u;LéwßôP~M²¯SZºtiyŠ^§tÕ ÈöP’ºõÖ[£ç•î¸ãèôÛn»-4ï…ÔŒ3¼C¸§zJÍ;×›.#¥>ø 4¿m•†¡tÍí0’Ê×)É=µsrrú’xE÷iİ±3©xEw¼R!”n¿ıv¹ŸwØ%#%ùéÿœïÃ?ôlÊ”)ª²²RUTT	%9§d®Û¶J·PŠGÄ¢+º_~ùåà\\ûŠn‘ŸŸ,Y‡p¥¥¥#|ömÂK½äD·²İtÓMÑÃ·É“\'{‡lş|r/¬Ï>û,zø+”:¤Š‹‹CmØR.†RJöMÈMşåÚI¸K€Ü³·‘»L|½ıöÛª··×û]FMşôwß}7æ%ÁPzâ‰\'ÔªU«Ô\r7Ü ÊÊÊ¼wå\n\n\nBËØR.†’ˆ¤ê]|K—.ı¦¼¼¼ß\\éê×;ÂGºcåfÛé&B)XrxfNó«¡¡A½óÎ;êşûïWµµµjıúõjÒ¤IŞÆ¶bÅ\nï|”¼3\'÷Í1—µ¥\\\r%î§”••=tÑı”„ÜRnY;^wüâ‹/6èµrçIûê¡‡\nMóKFSo½õ–š5k–wÂ»¹¹Y­Y³&4ŸÍåj(‰HªŞyÒ\'ß:’İ=Ö÷èÖòİ©S#NÊ•j¡<‡«bÎ¥R¹J)}nŸ|ëˆ1uÕˆip„$ß7•m¶•®R-”Ò½\\%1ßf<lKèÛL|2¢Y°`ÁY¹§öhO~ËIíÁsH§]!ù%»ÊõP’ï]‹|•¶ãı½oº½èÈLÚMè{ß‚ä›muªVÊ=µå¶ñ^Ç¤çk+---ÑiÔUÁ7äR]®‡’Ğûâ]‘o¬˜Æãrƒ#¤Áöÿ†\\“¼}¯W\\3şüóË—/ÿ¾ªªê`CCÃñöööº]?ÿüsS}}ı¾O?ıtS~~~…·]æO÷·ı‡C(ÙU„Ò\0ÓƒÁ$%\'£}WN–7Nj{$í™}Sr¶n(W|äsk{ÿ8ù¹wpzn:_©/BÉ®\"”~1Eå¤dÔ$—x´´´˜y3,™_–3FGŞ!›´c¶	D(ÙU„ÒPrgğä·&ŞGRJJJÔşıûÕÑ£Gå†Œ^\0ÉOù[¦ËãÆGGüê—õÙ9$ŒBÉ®\"”b¼\\ zS‚U—ĞÛş_„’]E(\rO®OŒ|$%úY¹8Kæ/“åÍuÂ2„’]E(ÅGvMÑ!“¡ÁÖêŸUºéê ù)W\r>!ó›ë€¥%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚ó%»ŠP‚óªªªúSı«®Ó¥ôëpJ‡R¯ù\ZN©©©9ÕÖÖÚA¨ä×O?ıTªCi¯ù\ZN©®®³sçÎó­­­íŒ˜&¦ôóŞÚÜÜü/HÇu=f¾F€sdGÿ¡u]’s\ZTÒKwyş	$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Øëÿœ;¸%¬q©\0\0\0\0IEND®B`‚',1);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('batch.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','true',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.task-related-entities-count','true',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('common.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('entitylink.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('eventsubscription.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('identitylink.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('job.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','72501',30);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(6.8.0.0)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('task.schema.version','6.8.0.0',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('variable.schema.version','6.8.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('42509',1,'flow_rmnt89qb:11:20008','42501','42508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-14 11:02:50.465','2025-08-14 11:02:50.469',1,4,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('42510',1,'flow_rmnt89qb:11:20008','42501','42508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-14 11:02:50.470','2025-08-14 11:02:50.470',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('42511',2,'flow_rmnt89qb:11:20008','42501','42508','Activity_04q4vtx','42512',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-14 11:02:50.470','2025-08-14 11:03:06.052',3,15582,'é©³å›ï¼šåŠ ç­','');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('45009',1,'flow_rmnt89qb:11:20008','45001','45008','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-14 15:30:55.342','2025-08-14 15:30:55.345',1,3,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('45010',1,'flow_rmnt89qb:11:20008','45001','45008','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-14 15:30:55.346','2025-08-14 15:30:55.346',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('45011',3,'flow_rmnt89qb:11:20008','45001','45008','Activity_04q4vtx','45012',NULL,'å®¡æ‰¹','userTask','2','2025-08-14 15:30:55.347','2025-08-14 15:31:27.204',3,31857,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('45018',1,'flow_rmnt89qb:11:20008','45001','45008','Flow_0omvgyh',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-14 15:31:27.205','2025-08-14 15:31:27.205',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('45019',1,'flow_rmnt89qb:11:20008','45001','45008','Event_0kjk81i',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2025-08-14 15:31:27.205','2025-08-14 15:31:27.207',2,2,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47509',1,'flow_rmnt89qb:11:20008','47501','47508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 11:38:48.197','2025-08-18 11:38:48.200',1,3,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47510',1,'flow_rmnt89qb:11:20008','47501','47508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 11:38:48.201','2025-08-18 11:38:48.201',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47511',2,'flow_rmnt89qb:11:20008','47501','47508','Activity_04q4vtx','47512',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 11:38:48.201','2025-08-18 15:29:38.785',3,13850584,'Change activity to Event_0kjk81i','');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47526',1,'flow_rmnt89qb:12:47517','47518','47525','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:26:53.737','2025-08-18 14:26:53.737',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47527',1,'flow_rmnt89qb:12:47517','47518','47525','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:26:53.738','2025-08-18 14:26:53.738',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47528',1,'flow_rmnt89qb:12:47517','47518','47525','Activity_04q4vtx','47529',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:26:53.738',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47539',1,'flow_rmnt89qb:12:47517','47531','47538','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:28:47.365','2025-08-18 14:28:47.365',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47540',1,'flow_rmnt89qb:12:47517','47531','47538','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:28:47.365','2025-08-18 14:28:47.365',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47541',3,'flow_rmnt89qb:12:47517','47531','47538','Activity_04q4vtx','47542',NULL,'å®¡æ‰¹','userTask','2','2025-08-18 14:28:47.365','2025-08-18 14:33:38.784',3,291419,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47548',1,'flow_rmnt89qb:12:47517','47531','47538','Flow_0omvgyh',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:33:38.784','2025-08-18 14:33:38.784',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47549',1,'flow_rmnt89qb:12:47517','47531','47538','Event_0kjk81i',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2025-08-18 14:33:38.786','2025-08-18 14:33:38.787',2,1,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50009',1,'flow_rmnt89qb:12:47517','50001','50008','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:35:18.038','2025-08-18 14:35:18.039',1,1,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50010',1,'flow_rmnt89qb:12:47517','50001','50008','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:35:18.039','2025-08-18 14:35:18.039',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50011',1,'flow_rmnt89qb:12:47517','50001','50008','Activity_04q4vtx','50012',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:35:18.039',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52509',1,'flow_rmnt89qb:12:47517','52501','52508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52510',1,'flow_rmnt89qb:12:47517','52501','52508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52511',1,'flow_rmnt89qb:12:47517','52501','52508','Activity_04q4vtx','52512',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:37:26.486',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52522',1,'flow_rmnt89qb:12:47517','52514','52521','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52523',1,'flow_rmnt89qb:12:47517','52514','52521','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52524',1,'flow_rmnt89qb:12:47517','52514','52521','Activity_04q4vtx','52525',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:37:29.862',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('55021',1,'flow_rmnt89qb:14:55008','55009','55020','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 15:29:18.483','2025-08-18 15:29:18.487',1,4,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('55022',1,'flow_rmnt89qb:14:55008','55009','55020','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 15:29:18.488','2025-08-18 15:29:18.488',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('55023',2,'flow_rmnt89qb:14:55008','55009','55020','Activity_04q4vtx','55024',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 15:29:18.489','2025-08-18 15:29:23.598',3,5109,'Change activity to Event_0kjk81i','');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('55027',1,'flow_rmnt89qb:14:55008','55009','55026','Event_0kjk81i',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2025-08-18 15:29:23.605','2025-08-18 15:29:23.607',1,2,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('55029',1,'flow_rmnt89qb:11:20008','47501','55028','Event_0kjk81i',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2025-08-18 15:29:38.788','2025-08-18 15:29:38.788',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57511',1,'flow_rmnt89qb:15:55033','57501','57510','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 07:54:46.308','2025-08-19 07:54:46.313',1,5,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57512',1,'flow_rmnt89qb:15:55033','57501','57510','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 07:54:46.314','2025-08-19 07:54:46.314',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57513',1,'flow_rmnt89qb:15:55033','57501','57510','Activity_04q4vtx','57514',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 07:54:46.315',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57552',1,'flow_p82g6ib8:4:57539','57540','57551','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:04:46.496','2025-08-19 08:04:46.496',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57553',1,'flow_p82g6ib8:4:57539','57540','57551','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:04:46.496','2025-08-19 08:04:46.496',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57554',1,'flow_p82g6ib8:4:57539','57540','57551','Activity_0vemk0z','57555',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:04:46.496',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57570',1,'flow_p82g6ib8:4:57539','57558','57569','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57571',1,'flow_p82g6ib8:4:57539','57558','57569','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:06:51.969','2025-08-19 08:06:51.969',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57572',1,'flow_p82g6ib8:4:57539','57558','57569','Activity_0vemk0z','57573',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:06:51.969',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57588',1,'flow_p82g6ib8:4:57539','57576','57587','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.317',1,2,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57589',1,'flow_p82g6ib8:4:57539','57576','57587','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:15:20.317','2025-08-19 08:15:20.317',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57590',1,'flow_p82g6ib8:4:57539','57576','57587','Activity_0vemk0z','57591',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:15:20.317',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57606',1,'flow_rmnt89qb:17:57523','57594','57605','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57607',1,'flow_rmnt89qb:17:57523','57594','57605','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57608',1,'flow_rmnt89qb:17:57523','57594','57605','Activity_04q4vtx','57609',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:15:56.145',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57618',1,'flow_rmnt89qb:17:57523','57611','57617','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57619',1,'flow_rmnt89qb:17:57523','57611','57617','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57620',1,'flow_rmnt89qb:17:57523','57611','57617','Activity_04q4vtx','57621',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:16:51.824',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57630',1,'flow_rmnt89qb:17:57523','57623','57629','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57631',1,'flow_rmnt89qb:17:57523','57623','57629','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57632',1,'flow_rmnt89qb:17:57523','57623','57629','Activity_04q4vtx','57633',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:17:35.150',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57650',1,'flow_rmnt89qb:19:57642','57643','57649','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57651',1,'flow_rmnt89qb:19:57642','57643','57649','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57652',1,'flow_rmnt89qb:19:57642','57643','57649','Activity_04q4vtx','57653',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 08:19:55.310',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57663',1,'flow_rmnt89qb:19:57642','57656','57662','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57664',1,'flow_rmnt89qb:19:57642','57656','57662','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57665',1,'flow_rmnt89qb:19:57642','57656','57662','Activity_04q4vtx','57666',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 08:21:10.227',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57681',1,'flow_p82g6ib8:4:57539','57669','57680','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57682',1,'flow_p82g6ib8:4:57539','57669','57680','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57683',1,'flow_p82g6ib8:4:57539','57669','57680','Activity_0vemk0z','57684',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:22:16.203',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57703',1,'flow_p82g6ib8:5:57690','57691','57702','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:24:03.370','2025-08-19 08:24:03.370',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57704',1,'flow_p82g6ib8:5:57690','57691','57702','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:24:03.370','2025-08-19 08:24:03.370',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57705',2,'flow_p82g6ib8:5:57690','57691','57702','Activity_0vemk0z','57706',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 08:24:03.370','2025-08-19 08:31:03.496',3,420126,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('60002',1,'flow_p82g6ib8:5:57690','57691','57702','Flow_1y6yxk7',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:31:03.499','2025-08-19 08:31:03.499',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('60003',2,'flow_p82g6ib8:5:57690','57691','57702','Activity_005chiy','60004',NULL,'å®¡æ‰¹2','userTask','1','2025-08-19 08:31:03.500','2025-08-19 08:55:14.763',2,1451263,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62502',1,'flow_p82g6ib8:5:57690','57691','57702','Flow_0wd9u4i',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:55:14.764','2025-08-19 08:55:14.764',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62503',1,'flow_p82g6ib8:5:57690','57691','57702','Event_0e956to',NULL,NULL,NULL,'endEvent',NULL,'2025-08-19 08:55:14.765','2025-08-19 08:55:14.766',2,1,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62516',1,'flow_p82g6ib8:5:57690','62504','62515','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:16:19.607','2025-08-19 09:16:19.607',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62517',1,'flow_p82g6ib8:5:57690','62504','62515','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:16:19.607','2025-08-19 09:16:19.607',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62518',2,'flow_p82g6ib8:5:57690','62504','62515','Activity_0vemk0z','62519',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:16:19.607','2025-08-20 09:32:07.506',3,87347899,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62529',1,'flow_rmnt89qb:19:57642','62522','62528','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62530',1,'flow_rmnt89qb:19:57642','62522','62528','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62531',1,'flow_rmnt89qb:19:57642','62522','62528','Activity_04q4vtx','62532',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:16:43.481',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65008',1,'flow_rmnt89qb:19:57642','65001','65007','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65009',1,'flow_rmnt89qb:19:57642','65001','65007','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65010',1,'flow_rmnt89qb:19:57642','65001','65007','Activity_04q4vtx','65011',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:18:55.198',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65022',1,'flow_rmnt89qb:19:57642','65014','65021','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65023',1,'flow_rmnt89qb:19:57642','65014','65021','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65024',1,'flow_rmnt89qb:19:57642','65014','65021','Activity_04q4vtx','65025',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:22:32.889',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67509',1,'flow_rmnt89qb:19:57642','67501','67508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:34:34.918','2025-08-19 09:34:34.919',1,1,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67510',1,'flow_rmnt89qb:19:57642','67501','67508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:34:34.920','2025-08-19 09:34:34.920',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67511',1,'flow_rmnt89qb:19:57642','67501','67508','Activity_04q4vtx','67512',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:34:34.920',NULL,3,NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67523',1,'flow_rmnt89qb:19:57642','67515','67522','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:34:53.895','2025-08-19 09:34:53.895',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67524',1,'flow_rmnt89qb:19:57642','67515','67522','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:34:53.895','2025-08-19 09:34:53.895',2,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67525',2,'flow_rmnt89qb:19:57642','67515','67522','Activity_04q4vtx','67526',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:34:53.895','2025-08-20 09:31:42.555',3,86208660,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70005',1,'flow_rmnt89qb:19:57642','67515','67522','Flow_1473gi7',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-20 09:31:42.560','2025-08-20 09:31:42.560',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70006',2,'flow_rmnt89qb:19:57642','67515','67522','Activity_0lpu6za','70007',NULL,'å®¡æ‰¹2','userTask','1','2025-08-20 09:31:42.561','2025-08-20 09:38:32.940',2,410379,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70011',1,'flow_p82g6ib8:5:57690','62504','62515','Flow_1y6yxk7',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-20 09:32:07.506','2025-08-20 09:32:07.506',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70012',2,'flow_p82g6ib8:5:57690','62504','62515','Activity_005chiy','70013',NULL,'å®¡æ‰¹2','userTask','1','2025-08-20 09:32:07.506','2025-08-20 09:38:38.968',2,391462,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70017',1,'flow_rmnt89qb:19:57642','67515','67522','Flow_18puk91',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-20 09:38:32.941','2025-08-20 09:38:32.941',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70018',1,'flow_rmnt89qb:19:57642','67515','67522','Event_1gcd18p',NULL,NULL,'ç»“æŸ','endEvent',NULL,'2025-08-20 09:38:32.941','2025-08-20 09:38:32.942',2,1,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70020',1,'flow_p82g6ib8:5:57690','62504','62515','Flow_0wd9u4i',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-20 09:38:38.969','2025-08-20 09:38:38.969',1,0,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`TRANSACTION_ORDER_`,`DURATION_`,`DELETE_REASON_`,`TENANT_ID_`) values ('70021',1,'flow_p82g6ib8:5:57690','62504','62515','Event_0e956to',NULL,NULL,NULL,'endEvent',NULL,'2025-08-20 09:38:38.969','2025-08-20 09:38:38.969',2,0,NULL,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('42514','3','2025-08-14 11:03:06.032',NULL,'42512','42501','AddComment','åŠ ç­','åŠ ç­');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('45014','1','2025-08-14 15:31:27.160',NULL,'45012','45001','AddComment','å¥½çš„','å¥½çš„');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('45017','event','2025-08-14 15:31:27.170',NULL,'45012',NULL,'AddUserLink','2_|_assignee',NULL);
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('47544','1','2025-08-18 14:33:38.765',NULL,'47542','47531','AddComment','é€šè¿‡','é€šè¿‡');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('47547','event','2025-08-18 14:33:38.771',NULL,'47542',NULL,'AddUserLink','2_|_assignee',NULL);
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('60001','1','2025-08-19 08:31:03.421',NULL,'57706','57691','AddComment','1','1');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('62501','1','2025-08-19 08:55:14.683',NULL,'60004','57691','AddComment','hao','hao');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('70001','1','2025-08-20 09:31:42.377',NULL,'67526','67515','AddComment','åŒæ„','åŒæ„');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('70010','1','2025-08-20 09:32:07.496',NULL,'62519','62504','AddComment','123','123');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('70016','1','2025-08-20 09:38:32.935',NULL,'70007','67515','AddComment','å¥½çš„','å¥½çš„');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('70019','1','2025-08-20 09:38:38.963',NULL,'70013','62504','AddComment','234','234');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_entitylink` */

DROP TABLE IF EXISTS `act_hi_entitylink`;

CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_entitylink` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('42502',NULL,'starter','100',NULL,'2025-08-14 11:02:50.459','42501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('42513','3','candidate',NULL,'42512','2025-08-14 11:02:50.484',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('45002',NULL,'starter','100',NULL,'2025-08-14 15:30:55.331','45001',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('45013','3','candidate',NULL,'45012','2025-08-14 15:30:55.362',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('45015',NULL,'assignee','2','45012','2025-08-14 15:31:27.168',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('45016',NULL,'participant','2',NULL,'2025-08-14 15:31:27.170','45001',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47502',NULL,'starter','100',NULL,'2025-08-18 11:38:48.193','47501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47513','3','candidate',NULL,'47512','2025-08-18 11:38:48.211',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47519',NULL,'starter','1',NULL,'2025-08-18 14:26:53.733','47518',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47530','3','candidate',NULL,'47529','2025-08-18 14:26:53.738',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47532',NULL,'starter','1',NULL,'2025-08-18 14:28:47.363','47531',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47543','3','candidate',NULL,'47542','2025-08-18 14:28:47.365',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47545',NULL,'assignee','2','47542','2025-08-18 14:33:38.770',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47546',NULL,'participant','2',NULL,'2025-08-18 14:33:38.771','47531',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('50002',NULL,'starter','1',NULL,'2025-08-18 14:35:18.029','50001',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('50013','3','candidate',NULL,'50012','2025-08-18 14:35:18.052',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52502',NULL,'starter','1',NULL,'2025-08-18 14:37:26.485','52501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52513','3','candidate',NULL,'52512','2025-08-18 14:37:26.486',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52515',NULL,'starter','1',NULL,'2025-08-18 14:37:29.860','52514',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52526','3','candidate',NULL,'52525','2025-08-18 14:37:29.862',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('55010',NULL,'starter','100',NULL,'2025-08-18 15:29:18.478','55009',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('55025','3','candidate',NULL,'55024','2025-08-18 15:29:18.506',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57502',NULL,'starter','1',NULL,'2025-08-19 07:54:46.298','57501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57515','3','candidate',NULL,'57514','2025-08-19 07:54:46.341',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57541',NULL,'starter','100',NULL,'2025-08-19 08:04:46.491','57540',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57556',NULL,'assignee','1','57555','2025-08-19 08:04:46.496',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57557',NULL,'participant','1',NULL,'2025-08-19 08:04:46.497','57540',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57559',NULL,'starter','100',NULL,'2025-08-19 08:06:51.968','57558',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57574',NULL,'assignee','1','57573','2025-08-19 08:06:51.969',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57575',NULL,'participant','1',NULL,'2025-08-19 08:06:51.969','57558',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57577',NULL,'starter','100',NULL,'2025-08-19 08:15:20.313','57576',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57592',NULL,'assignee','1','57591','2025-08-19 08:15:20.317',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57593',NULL,'participant','1',NULL,'2025-08-19 08:15:20.317','57576',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57595',NULL,'starter','100',NULL,'2025-08-19 08:15:56.144','57594',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57610','3','candidate',NULL,'57609','2025-08-19 08:15:56.145',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57612',NULL,'starter','100',NULL,'2025-08-19 08:16:51.824','57611',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57622','3','candidate',NULL,'57621','2025-08-19 08:16:51.824',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57624',NULL,'starter','100',NULL,'2025-08-19 08:17:35.150','57623',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57634','3','candidate',NULL,'57633','2025-08-19 08:17:35.150',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57644',NULL,'starter','100',NULL,'2025-08-19 08:19:55.310','57643',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57654',NULL,'assignee','2','57653','2025-08-19 08:19:55.311',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57655',NULL,'participant','2',NULL,'2025-08-19 08:19:55.311','57643',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57657',NULL,'starter','100',NULL,'2025-08-19 08:21:10.226','57656',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57667',NULL,'assignee','2','57666','2025-08-19 08:21:10.227',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57668',NULL,'participant','2',NULL,'2025-08-19 08:21:10.227','57656',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57670',NULL,'starter','100',NULL,'2025-08-19 08:22:16.203','57669',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57685',NULL,'assignee','1','57684','2025-08-19 08:22:16.203',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57686',NULL,'participant','1',NULL,'2025-08-19 08:22:16.204','57669',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57692',NULL,'starter','100',NULL,'2025-08-19 08:24:03.369','57691',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57707',NULL,'assignee','2','57706','2025-08-19 08:24:03.370',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57708',NULL,'participant','2',NULL,'2025-08-19 08:24:03.370','57691',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('60005',NULL,'assignee','1','60004','2025-08-19 08:31:03.508',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('60006',NULL,'participant','1',NULL,'2025-08-19 08:31:03.510','57691',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62505',NULL,'starter','100',NULL,'2025-08-19 09:16:19.606','62504',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62520',NULL,'assignee','2','62519','2025-08-19 09:16:19.616',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62521',NULL,'participant','2',NULL,'2025-08-19 09:16:19.616','62504',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62523',NULL,'starter','100',NULL,'2025-08-19 09:16:43.481','62522',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62533',NULL,'assignee','2','62532','2025-08-19 09:16:43.481',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62534',NULL,'participant','2',NULL,'2025-08-19 09:16:43.481','62522',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65002',NULL,'starter','100',NULL,'2025-08-19 09:18:55.198','65001',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65012',NULL,'assignee','2','65011','2025-08-19 09:18:55.198',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65013',NULL,'participant','2',NULL,'2025-08-19 09:18:55.198','65001',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65015',NULL,'starter','100',NULL,'2025-08-19 09:22:32.888','65014',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65026',NULL,'assignee','2','65025','2025-08-19 09:22:32.889',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65027',NULL,'participant','2',NULL,'2025-08-19 09:22:32.889','65014',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67502',NULL,'starter','100',NULL,'2025-08-19 09:34:34.915','67501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67513',NULL,'assignee','2','67512','2025-08-19 09:34:34.932',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67514',NULL,'participant','2',NULL,'2025-08-19 09:34:34.932','67501',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67516',NULL,'starter','100',NULL,'2025-08-19 09:34:53.895','67515',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67527',NULL,'assignee','2','67526','2025-08-19 09:34:53.895',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67528',NULL,'participant','2',NULL,'2025-08-19 09:34:53.895','67515',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('70008',NULL,'assignee','1','70007','2025-08-20 09:31:42.577',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('70009',NULL,'participant','1',NULL,'2025-08-20 09:31:42.580','67515',NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('70014',NULL,'assignee','1','70013','2025-08-20 09:32:07.506',NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`CREATE_TIME_`,`PROC_INST_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('70015',NULL,'participant','1',NULL,'2025-08-20 09:32:07.508','62504',NULL,NULL,NULL,NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_SUPER_PROCINST` (`SUPER_PROCESS_INSTANCE_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('42501',2,'42501',NULL,'flow_rmnt89qb:11:20008','2025-08-14 11:02:50.452','2025-08-14 11:03:06.072',15620,'100','start_event',NULL,NULL,'é©³å›ï¼šåŠ ç­','',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('45001',2,'45001',NULL,'flow_rmnt89qb:11:20008','2025-08-14 15:30:55.322','2025-08-14 15:31:27.229',31907,'100','start_event','Event_0kjk81i',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('47501',2,'47501',NULL,'flow_rmnt89qb:11:20008','2025-08-18 11:38:48.183','2025-08-18 15:29:38.795',13850612,'100','start_event','Event_0kjk81i',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('47518',1,'47518',NULL,'flow_rmnt89qb:12:47517','2025-08-18 14:26:53.733',NULL,NULL,'1','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('47531',2,'47531',NULL,'flow_rmnt89qb:12:47517','2025-08-18 14:28:47.363','2025-08-18 14:33:38.799',291436,'1','start_event','Event_0kjk81i',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('50001',1,'50001',NULL,'flow_rmnt89qb:12:47517','2025-08-18 14:35:18.013',NULL,NULL,'1','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52501',1,'52501',NULL,'flow_rmnt89qb:12:47517','2025-08-18 14:37:26.479',NULL,NULL,'1','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52514',1,'52514',NULL,'flow_rmnt89qb:12:47517','2025-08-18 14:37:29.860',NULL,NULL,'1','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('55009',2,'55009',NULL,'flow_rmnt89qb:14:55008','2025-08-18 15:29:18.477','2025-08-18 15:29:23.623',5146,'100','start_event','Event_0kjk81i',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57501',1,'57501',NULL,'flow_rmnt89qb:15:55033','2025-08-19 07:54:46.289',NULL,NULL,'1','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57540',1,'57540',NULL,'flow_p82g6ib8:4:57539','2025-08-19 08:04:46.491',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57558',1,'57558',NULL,'flow_p82g6ib8:4:57539','2025-08-19 08:06:51.968',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57576',1,'57576',NULL,'flow_p82g6ib8:4:57539','2025-08-19 08:15:20.313',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57594',1,'57594',NULL,'flow_rmnt89qb:17:57523','2025-08-19 08:15:56.144',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57611',1,'57611',NULL,'flow_rmnt89qb:17:57523','2025-08-19 08:16:51.824',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57623',1,'57623',NULL,'flow_rmnt89qb:17:57523','2025-08-19 08:17:35.150',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57643',1,'57643',NULL,'flow_rmnt89qb:19:57642','2025-08-19 08:19:55.310',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57656',1,'57656',NULL,'flow_rmnt89qb:19:57642','2025-08-19 08:21:10.226',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57669',1,'57669',NULL,'flow_p82g6ib8:4:57539','2025-08-19 08:22:16.203',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57691',2,'57691',NULL,'flow_p82g6ib8:5:57690','2025-08-19 08:24:03.369','2025-08-19 08:55:14.779',1871410,'100','start_event','Event_0e956to',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('62504',2,'62504',NULL,'flow_p82g6ib8:5:57690','2025-08-19 09:16:19.605','2025-08-20 09:38:38.974',87739369,'100','start_event','Event_0e956to',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('62522',1,'62522',NULL,'flow_rmnt89qb:19:57642','2025-08-19 09:16:43.481',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65001',1,'65001',NULL,'flow_rmnt89qb:19:57642','2025-08-19 09:18:55.185',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65014',1,'65014',NULL,'flow_rmnt89qb:19:57642','2025-08-19 09:22:32.888',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('67501',1,'67501',NULL,'flow_rmnt89qb:19:57642','2025-08-19 09:34:34.907',NULL,NULL,'100','start_event',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_hi_procinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('67515',2,'67515',NULL,'flow_rmnt89qb:19:57642','2025-08-19 09:34:53.895','2025-08-20 09:38:32.968',86619073,'100','start_event','Event_1gcd18p',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('42512',2,'flow_rmnt89qb:11:20008',NULL,'Activity_04q4vtx','42501','42508',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-14 11:02:50.470',NULL,'2025-08-14 11:03:06.049',15579,'é©³å›ï¼šåŠ ç­',50,NULL,NULL,NULL,'','2025-08-14 11:03:06.049');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('45012',3,'flow_rmnt89qb:11:20008',NULL,'Activity_04q4vtx','45001','45008',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,'2','2025-08-14 15:30:55.347',NULL,'2025-08-14 15:31:27.201',31854,NULL,50,NULL,NULL,NULL,'','2025-08-14 15:31:27.201');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('47512',2,'flow_rmnt89qb:11:20008',NULL,'Activity_04q4vtx','47501','47508',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 11:38:48.201',NULL,'2025-08-18 15:29:38.787',13850586,'Change activity to Event_0kjk81i',50,NULL,NULL,NULL,'','2025-08-18 15:29:38.787');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('47529',1,'flow_rmnt89qb:12:47517',NULL,'Activity_04q4vtx','47518','47525',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 14:26:53.738',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-18 14:26:53.738');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('47542',3,'flow_rmnt89qb:12:47517',NULL,'Activity_04q4vtx','47531','47538',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,'2','2025-08-18 14:28:47.365',NULL,'2025-08-18 14:33:38.783',291418,NULL,50,NULL,NULL,NULL,'','2025-08-18 14:33:38.783');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('50012',1,'flow_rmnt89qb:12:47517',NULL,'Activity_04q4vtx','50001','50008',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 14:35:18.039',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-18 14:35:18.052');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('52512',1,'flow_rmnt89qb:12:47517',NULL,'Activity_04q4vtx','52501','52508',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 14:37:26.486',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-18 14:37:26.486');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('52525',1,'flow_rmnt89qb:12:47517',NULL,'Activity_04q4vtx','52514','52521',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 14:37:29.862',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-18 14:37:29.862');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('55024',2,'flow_rmnt89qb:14:55008',NULL,'Activity_04q4vtx','55009','55020',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-18 15:29:18.489',NULL,'2025-08-18 15:29:23.602',5113,'Change activity to Event_0kjk81i',50,NULL,NULL,NULL,'','2025-08-18 15:29:23.602');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57514',1,'flow_rmnt89qb:15:55033',NULL,'Activity_04q4vtx','57501','57510',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-19 07:54:46.315',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 07:54:46.341');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57555',1,'flow_p82g6ib8:4:57539',NULL,'Activity_0vemk0z','57540','57551',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'1','2025-08-19 08:04:46.496',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:04:46.496');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57573',1,'flow_p82g6ib8:4:57539',NULL,'Activity_0vemk0z','57558','57569',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'1','2025-08-19 08:06:51.969',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:06:51.969');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57591',1,'flow_p82g6ib8:4:57539',NULL,'Activity_0vemk0z','57576','57587',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'1','2025-08-19 08:15:20.317',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:15:20.317');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57609',1,'flow_rmnt89qb:17:57523',NULL,'Activity_04q4vtx','57594','57605',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-19 08:15:56.145',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:15:56.145');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57621',1,'flow_rmnt89qb:17:57523',NULL,'Activity_04q4vtx','57611','57617',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-19 08:16:51.824',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:16:51.824');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57633',1,'flow_rmnt89qb:17:57523',NULL,'Activity_04q4vtx','57623','57629',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,NULL,NULL,'2025-08-19 08:17:35.150',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:17:35.150');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57653',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','57643','57649',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 08:19:55.310',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:19:55.311');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57666',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','57656','57662',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 08:21:10.227',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:21:10.227');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57684',1,'flow_p82g6ib8:4:57539',NULL,'Activity_0vemk0z','57669','57680',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'1','2025-08-19 08:22:16.203',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:22:16.203');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('57706',2,'flow_p82g6ib8:5:57690',NULL,'Activity_0vemk0z','57691','57702',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 08:24:03.370',NULL,'2025-08-19 08:31:03.493',420123,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:31:03.493');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('60004',2,'flow_p82g6ib8:5:57690',NULL,'Activity_005chiy','57691','57702',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹2',NULL,NULL,NULL,'1','2025-08-19 08:31:03.500',NULL,'2025-08-19 08:55:14.759',1451259,NULL,50,NULL,NULL,NULL,'','2025-08-19 08:55:14.759');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('62519',2,'flow_p82g6ib8:5:57690',NULL,'Activity_0vemk0z','62504','62515',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:16:19.607',NULL,'2025-08-20 09:32:07.505',87347898,NULL,50,NULL,NULL,NULL,'','2025-08-20 09:32:07.505');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('62532',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','62522','62528',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:16:43.481',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 09:16:43.481');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('65011',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','65001','65007',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:18:55.198',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 09:18:55.198');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('65025',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','65014','65021',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:22:32.889',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 09:22:32.889');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('67512',1,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','67501','67508',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:34:34.920',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2025-08-19 09:34:34.932');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('67526',2,'flow_rmnt89qb:19:57642',NULL,'Activity_04q4vtx','67515','67522',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,NULL,'2','2025-08-19 09:34:53.895',NULL,'2025-08-20 09:31:42.540',86208645,NULL,50,NULL,NULL,NULL,'','2025-08-20 09:31:42.540');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('70007',2,'flow_rmnt89qb:19:57642',NULL,'Activity_0lpu6za','67515','67522',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹2',NULL,NULL,NULL,'1','2025-08-20 09:31:42.561',NULL,'2025-08-20 09:38:32.939',410378,NULL,50,NULL,NULL,NULL,'','2025-08-20 09:38:32.939');
insert  into `act_hi_taskinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`,`LAST_UPDATED_TIME_`) values ('70013',2,'flow_p82g6ib8:5:57690',NULL,'Activity_005chiy','62504','62515',NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹2',NULL,NULL,NULL,'1','2025-08-20 09:32:07.506',NULL,'2025-08-20 09:38:38.967',391461,NULL,50,NULL,NULL,NULL,'','2025-08-20 09:38:38.967');

/*Table structure for table `act_hi_tsk_log` */

DROP TABLE IF EXISTS `act_hi_tsk_log`;

CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_tsk_log` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('42504',0,'42501','42501',NULL,'formJson','serializable',NULL,NULL,NULL,'42505',NULL,NULL,NULL,NULL,'2025-08-14 11:02:50.464','2025-08-14 11:02:50.464');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('42506',0,'42501','42501',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'è´ºç§‹é›¨',NULL,'2025-08-14 11:02:50.464','2025-08-14 11:02:50.464');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('42507',0,'42501','42501',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-14 11:02:50.464','2025-08-14 11:02:50.464');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('45004',1,'45001','45001',NULL,'formJson','serializable',NULL,NULL,NULL,'45005',NULL,NULL,NULL,NULL,'2025-08-14 15:30:55.342','2025-08-14 15:31:27.197');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('45006',1,'45001','45001',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'heqiuyu',NULL,'2025-08-14 15:30:55.342','2025-08-14 15:31:27.194');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('45007',0,'45001','45001',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-14 15:30:55.342','2025-08-14 15:30:55.342');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47504',0,'47501','47501',NULL,'formJson','serializable',NULL,NULL,NULL,'47505',NULL,NULL,NULL,NULL,'2025-08-18 11:38:48.197','2025-08-18 11:38:48.197');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47506',0,'47501','47501',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'å•Š',NULL,'2025-08-18 11:38:48.197','2025-08-18 11:38:48.197');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47507',0,'47501','47501',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-18 11:38:48.197','2025-08-18 11:38:48.197');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47521',0,'47518','47518',NULL,'formJson','serializable',NULL,NULL,NULL,'47522',NULL,NULL,NULL,NULL,'2025-08-18 14:26:53.737','2025-08-18 14:26:53.737');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47523',0,'47518','47518',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'heqiuyu',NULL,'2025-08-18 14:26:53.737','2025-08-18 14:26:53.737');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47524',0,'47518','47518',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-18 14:26:53.737','2025-08-18 14:26:53.737');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47534',1,'47531','47531',NULL,'formJson','serializable',NULL,NULL,NULL,'47535',NULL,NULL,NULL,NULL,'2025-08-18 14:28:47.364','2025-08-18 14:33:38.782');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47536',1,'47531','47531',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'o',NULL,'2025-08-18 14:28:47.364','2025-08-18 14:33:38.781');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('47537',0,'47531','47531',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-18 14:28:47.364','2025-08-18 14:28:47.364');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('50004',0,'50001','50001',NULL,'formJson','serializable',NULL,NULL,NULL,'50005',NULL,NULL,NULL,NULL,'2025-08-18 14:35:18.036','2025-08-18 14:35:18.036');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('50006',0,'50001','50001',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL,'2025-08-18 14:35:18.036','2025-08-18 14:35:18.036');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('50007',0,'50001','50001',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-18 14:35:18.036','2025-08-18 14:35:18.036');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52504',0,'52501','52501',NULL,'formJson','serializable',NULL,NULL,NULL,'52505',NULL,NULL,NULL,NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52506',0,'52501','52501',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52507',0,'52501','52501',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52517',0,'52514','52514',NULL,'formJson','serializable',NULL,NULL,NULL,'52518',NULL,NULL,NULL,NULL,'2025-08-18 14:37:29.860','2025-08-18 14:37:29.860');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52519',0,'52514','52514',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('52520',0,'52514','52514',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('55012',0,'55009','55009',NULL,'formJson','serializable',NULL,NULL,NULL,'55013',NULL,NULL,NULL,NULL,'2025-08-18 15:29:18.482','2025-08-18 15:29:18.482');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('55014',0,'55009','55009',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'heqiuyu',NULL,'2025-08-18 15:29:18.482','2025-08-18 15:29:18.482');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('55015',0,'55009','55009',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,'2025-08-18 15:29:18.482','2025-08-18 15:29:18.482');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('55017',0,'55009','55009',NULL,'daterange83468','serializable',NULL,NULL,NULL,'55018',NULL,NULL,NULL,NULL,'2025-08-18 15:29:18.482','2025-08-18 15:29:18.482');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('55019',0,'55009','55009',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-18 15:29:18.482','2025-08-18 15:29:18.482');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57504',0,'57501','57501',NULL,'formJson','serializable',NULL,NULL,NULL,'57505',NULL,NULL,NULL,NULL,'2025-08-19 07:54:46.307','2025-08-19 07:54:46.307');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57506',0,'57501','57501',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 07:54:46.307','2025-08-19 07:54:46.307');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57507',0,'57501','57501',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 07:54:46.307','2025-08-19 07:54:46.307');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57508',0,'57501','57501',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 07:54:46.307','2025-08-19 07:54:46.307');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57509',0,'57501','57501',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'2025-08-19 07:54:46.307','2025-08-19 07:54:46.307');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57543',0,'57540','57540',NULL,'formJson','serializable',NULL,NULL,NULL,'57544',NULL,NULL,NULL,NULL,'2025-08-19 08:04:46.495','2025-08-19 08:04:46.495');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57545',0,'57540','57540',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'å•Š',NULL,'2025-08-19 08:04:46.495','2025-08-19 08:04:46.495');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57546',0,'57540','57540',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'å•Š',NULL,'2025-08-19 08:04:46.495','2025-08-19 08:04:46.495');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57548',0,'57540','57540',NULL,'daterange83468','serializable',NULL,NULL,NULL,'57549',NULL,NULL,NULL,NULL,'2025-08-19 08:04:46.495','2025-08-19 08:04:46.495');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57550',0,'57540','57540',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:04:46.496','2025-08-19 08:04:46.496');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57561',0,'57558','57558',NULL,'formJson','serializable',NULL,NULL,NULL,'57562',NULL,NULL,NULL,NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57563',0,'57558','57558',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57564',0,'57558','57558',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'213',NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57566',0,'57558','57558',NULL,'daterange83468','serializable',NULL,NULL,NULL,'57567',NULL,NULL,NULL,NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57568',0,'57558','57558',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57579',0,'57576','57576',NULL,'formJson','serializable',NULL,NULL,NULL,'57580',NULL,NULL,NULL,NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.315');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57581',0,'57576','57576',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.315');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57582',0,'57576','57576',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.315');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57584',0,'57576','57576',NULL,'daterange83468','serializable',NULL,NULL,NULL,'57585',NULL,NULL,NULL,NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.315');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57586',0,'57576','57576',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.315');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57596',0,'57594','57594',NULL,'__v_isShallow','boolean',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-08-19 08:15:56.144','2025-08-19 08:15:56.144');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57597',0,'57594','57594',NULL,'__v_isRef','boolean',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,'2025-08-19 08:15:56.144','2025-08-19 08:15:56.144');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57599',0,'57594','57594',NULL,'_rawValue','serializable',NULL,NULL,NULL,'57600',NULL,NULL,NULL,NULL,'2025-08-19 08:15:56.144','2025-08-19 08:15:56.144');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57602',0,'57594','57594',NULL,'_value','serializable',NULL,NULL,NULL,'57603',NULL,NULL,NULL,NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57604',0,'57594','57594',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57613',0,'57611','57611',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'qwe',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57614',0,'57611','57611',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57615',0,'57611','57611',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57616',0,'57611','57611',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57625',0,'57623','57623',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57626',0,'57623','57623',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57627',0,'57623','57623',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57628',0,'57623','57623',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57645',0,'57643','57643',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57646',0,'57643','57643',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57647',0,'57643','57643',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57648',0,'57643','57643',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57658',0,'57656','57656',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 08:21:10.226','2025-08-19 08:21:10.226');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57659',0,'57656','57656',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57660',0,'57656','57656',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57661',0,'57656','57656',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57672',0,'57669','57669',NULL,'formJson','serializable',NULL,NULL,NULL,'57673',NULL,NULL,NULL,NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57674',0,'57669','57669',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57675',0,'57669','57669',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57677',0,'57669','57669',NULL,'daterange83468','serializable',NULL,NULL,NULL,'57678',NULL,NULL,NULL,NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57679',0,'57669','57669',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57694',2,'57691','57691',NULL,'formJson','serializable',NULL,NULL,NULL,'57695',NULL,NULL,NULL,NULL,'2025-08-19 08:24:03.369','2025-08-19 08:55:14.759');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57696',2,'57691','57691',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:24:03.369','2025-08-19 08:55:14.754');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57697',2,'57691','57691',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 08:24:03.369','2025-08-19 08:55:14.755');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57699',2,'57691','57691',NULL,'daterange83468','serializable',NULL,NULL,NULL,'57700',NULL,NULL,NULL,NULL,'2025-08-19 08:24:03.369','2025-08-19 08:55:14.757');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('57701',0,'57691','57691',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 08:24:03.369','2025-08-19 08:24:03.369');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62507',2,'62504','62504',NULL,'formJson','serializable',NULL,NULL,NULL,'62508',NULL,NULL,NULL,NULL,'2025-08-19 09:16:19.607','2025-08-20 09:38:38.966');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62509',2,'62504','62504',NULL,'å•Šå•Š','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 09:16:19.607','2025-08-20 09:38:38.965');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62510',2,'62504','62504',NULL,'input46537','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,'2025-08-19 09:16:19.607','2025-08-20 09:38:38.966');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62512',2,'62504','62504',NULL,'daterange83468','serializable',NULL,NULL,NULL,'62513',NULL,NULL,NULL,NULL,'2025-08-19 09:16:19.607','2025-08-20 09:38:38.966');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62514',0,'62504','62504',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:16:19.607','2025-08-19 09:16:19.607');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62524',0,'62522','62522',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62525',0,'62522','62522',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62526',0,'62522','62522',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('62527',0,'62522','62522',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65003',0,'65001','65001',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65004',0,'65001','65001',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65005',0,'65001','65001',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65006',0,'65001','65001',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65016',0,'65014','65014',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65017',0,'65014','65014',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65018',0,'65014','65014',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65019',0,'65014','65014',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'57639',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('65020',0,'65014','65014',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67503',0,'67501','67501',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 09:34:34.916','2025-08-19 09:34:34.916');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67504',0,'67501','67501',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 09:34:34.916','2025-08-19 09:34:34.916');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67505',0,'67501','67501',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 09:34:34.916','2025-08-19 09:34:34.916');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67506',0,'67501','67501',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'57639',NULL,'2025-08-19 09:34:34.916','2025-08-19 09:34:34.916');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67507',0,'67501','67501',NULL,'INITIATOR','long',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:34:34.916','2025-08-19 09:34:34.916');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67517',2,'67515','67515',NULL,'applicantName','string',NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL,'2025-08-19 09:34:53.895','2025-08-20 09:38:32.939');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67518',2,'67515','67515',NULL,'leaveType','string',NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL,'2025-08-19 09:34:53.895','2025-08-20 09:38:32.937');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67519',2,'67515','67515',NULL,'taskId','string',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'2025-08-19 09:34:53.895','2025-08-20 09:38:32.939');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67520',2,'67515','67515',NULL,'deployId','string',NULL,NULL,NULL,NULL,NULL,NULL,'57639',NULL,'2025-08-19 09:34:53.895','2025-08-20 09:38:32.939');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('67521',2,'67515','67515',NULL,'INITIATOR','integer',NULL,NULL,NULL,NULL,NULL,100,'100',NULL,'2025-08-19 09:34:53.895','2025-08-20 09:38:32.939');
insert  into `act_hi_varinst`(`ID_`,`REV_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('70003',1,'67515','67515',NULL,'form','serializable',NULL,NULL,NULL,'70004',NULL,NULL,NULL,NULL,'2025-08-20 09:31:42.537','2025-08-20 09:38:32.938');

/*Table structure for table `act_id_bytearray` */

DROP TABLE IF EXISTS `act_id_bytearray`;

CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_bytearray` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`) USING BTREE,
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `act_id_membership_ibfk_1` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `act_id_membership_ibfk_2` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_priv` */

DROP TABLE IF EXISTS `act_id_priv`;

CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_priv` */

/*Table structure for table `act_id_priv_mapping` */

DROP TABLE IF EXISTS `act_id_priv_mapping`;

CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`) USING BTREE,
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `act_id_priv_mapping_ibfk_1` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_priv_mapping` */

/*Table structure for table `act_id_property` */

DROP TABLE IF EXISTS `act_id_property`;

CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_property` */

insert  into `act_id_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','6.8.0.0',1);

/*Table structure for table `act_id_token` */

DROP TABLE IF EXISTS `act_id_token`;

CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_token` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `act_procdef_info_ibfk_1` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_procdef_info_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('10001','flow_yvmruh6h',NULL,NULL,'','2025-08-13 17:34:12.257',NULL,NULL,'10001',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('10005','flow_yvmruh6h',NULL,NULL,'','2025-08-14 07:59:03.789',NULL,NULL,'10005',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('10009','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:00:51.796',NULL,NULL,'10009',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('12501','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:06:38.991',NULL,NULL,'12501',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('15001','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:09:37.900',NULL,NULL,'15001',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('15005','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:13:24.160',NULL,NULL,'15005',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('15009','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:15:26.081',NULL,NULL,'15009',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('17501','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:17:27.469',NULL,NULL,'17501',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('20001','flow_yvmruh6h_å›é€€ç‰ˆæœ¬_1755131614402','rollback',NULL,'','2025-08-14 08:33:34.403',NULL,NULL,'20001',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('20005','flow_yvmruh6h',NULL,NULL,'','2025-08-14 08:41:41.767',NULL,NULL,'20005',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('47514','flow_yvmruh6h',NULL,NULL,'','2025-08-18 14:09:40.510',NULL,NULL,'47514',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('55001','flow_yvmruh6h_å›é€€ç‰ˆæœ¬_1755500547417','rollback',NULL,'','2025-08-18 15:02:27.420',NULL,NULL,'55001',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('55005','flow_yvmruh6h_å›é€€ç‰ˆæœ¬_1755502025163','rollback',NULL,'','2025-08-18 15:27:05.164',NULL,NULL,'55005',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('55030','flow_yvmruh6h_å›é€€ç‰ˆæœ¬_1755500547417_å›é€€ç‰ˆæœ¬_1755502199924','rollback',NULL,'','2025-08-18 15:29:59.924',NULL,NULL,'55030',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57516','è¯·å‡',NULL,NULL,'','2025-08-19 08:01:42.399',NULL,NULL,'57516',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57520','è¯·å‡å¤–éƒ¨é¡µé¢','leave',NULL,'','2025-08-19 08:02:00.139',NULL,NULL,'57520',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57524','ç»“æŸ',NULL,NULL,'','2025-08-19 08:03:24.644',NULL,NULL,'57524',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57528','ç»“æŸ',NULL,NULL,'','2025-08-19 08:03:42.295',NULL,NULL,'57528',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57532','ç»“æŸ',NULL,NULL,'','2025-08-19 08:03:57.988',NULL,NULL,'57532',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57536','è¯·å‡å†…éƒ¨é¡µé¢',NULL,NULL,'','2025-08-19 08:04:14.133',NULL,NULL,'57536',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57635','è¯·å‡å¤–éƒ¨é¡µé¢','leave',NULL,'','2025-08-19 08:18:45.711',NULL,NULL,'57635',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57639','è¯·å‡å¤–éƒ¨é¡µé¢','leave',NULL,'','2025-08-19 08:19:12.758',NULL,NULL,'57639',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('57687','è¯·å‡å†…éƒ¨é¡µé¢',NULL,NULL,'','2025-08-19 08:23:23.724',NULL,NULL,'57687',NULL);
insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`KEY_`,`TENANT_ID_`,`DEPLOY_TIME_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`PARENT_DEPLOYMENT_ID_`,`ENGINE_VERSION_`) values ('7514','flow_yvmruh6h',NULL,NULL,'','2025-08-13 17:09:13.153',NULL,NULL,'7514',NULL);

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `act_re_model_ibfk_1` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `act_re_model_ibfk_2` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_re_model_ibfk_3` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_p82g6ib8:1:57527',2,NULL,'ç»“æŸ','flow_p82g6ib8',1,'57524','ç»“æŸ.bpmn','ç»“æŸ.flow_p82g6ib8.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_p82g6ib8:2:57531',2,NULL,'ç»“æŸ','flow_p82g6ib8',2,'57528','ç»“æŸ.bpmn','ç»“æŸ.flow_p82g6ib8.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_p82g6ib8:3:57535',2,NULL,'ç»“æŸ','flow_p82g6ib8',3,'57532','ç»“æŸ.bpmn','ç»“æŸ.flow_p82g6ib8.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_p82g6ib8:4:57539',2,NULL,'è¯·å‡å†…éƒ¨é¡µé¢','flow_p82g6ib8',4,'57536','è¯·å‡å†…éƒ¨é¡µé¢.bpmn','è¯·å‡å†…éƒ¨é¡µé¢.flow_p82g6ib8.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_p82g6ib8:5:57690',2,NULL,'è¯·å‡å†…éƒ¨é¡µé¢','flow_p82g6ib8',5,'57687','è¯·å‡å†…éƒ¨é¡µé¢.bpmn','è¯·å‡å†…éƒ¨é¡µé¢.flow_p82g6ib8.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:10:20004',1,'http://www.flowable.org/processdef','flow_yvmruh6h','flow_rmnt89qb',10,'20001','null.bpmn','null.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:11:20008',4,NULL,'flow_yvmruh6h','flow_rmnt89qb',11,'20005','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:12:47517',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',12,'47514','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:13:55004',1,'http://www.flowable.org/processdef','flow_yvmruh6h','flow_rmnt89qb',13,'55001','null.bpmn','null.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:14:55008',1,'http://www.flowable.org/processdef','flow_yvmruh6h','flow_rmnt89qb',14,'55005','null.bpmn','null.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:15:55033',1,'http://www.flowable.org/processdef','flow_yvmruh6h','flow_rmnt89qb',15,'55030','null.bpmn','null.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:16:57519',2,NULL,'è¯·å‡','flow_rmnt89qb',16,'57516','è¯·å‡.bpmn','è¯·å‡.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:17:57523',2,'leave','è¯·å‡å¤–éƒ¨é¡µé¢','flow_rmnt89qb',17,'57520','è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:18:57638',2,'leave','è¯·å‡å¤–éƒ¨é¡µé¢','flow_rmnt89qb',18,'57635','è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:19:57642',2,'leave','è¯·å‡å¤–éƒ¨é¡µé¢','flow_rmnt89qb',19,'57639','è¯·å‡å¤–éƒ¨é¡µé¢.bpmn','è¯·å‡å¤–éƒ¨é¡µé¢.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:1:7517',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',1,'7514','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:2:10004',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',2,'10001','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:3:10008',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',3,'10005','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:4:10012',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',4,'10009','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:5:12504',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',5,'12501','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:6:15004',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',6,'15001','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:7:15008',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',7,'15005','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:8:15012',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',8,'15009','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);
insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`ENGINE_VERSION_`,`DERIVED_FROM_`,`DERIVED_FROM_ROOT_`,`DERIVED_VERSION_`) values ('flow_rmnt89qb:9:17504',2,NULL,'flow_yvmruh6h','flow_rmnt89qb',9,'17501','flow_yvmruh6h.bpmn','flow_yvmruh6h.flow_rmnt89qb.png',NULL,0,1,1,'',NULL,NULL,NULL,0);

/*Table structure for table `act_ru_actinst` */

DROP TABLE IF EXISTS `act_ru_actinst`;

CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_actinst` */

insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47526',1,'flow_rmnt89qb:12:47517','47518','47525','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:26:53.737','2025-08-18 14:26:53.737',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47527',1,'flow_rmnt89qb:12:47517','47518','47525','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:26:53.738','2025-08-18 14:26:53.738',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('47528',1,'flow_rmnt89qb:12:47517','47518','47525','Activity_04q4vtx','47529',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:26:53.738',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50009',1,'flow_rmnt89qb:12:47517','50001','50008','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:35:18.038','2025-08-18 14:35:18.039',1,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50010',1,'flow_rmnt89qb:12:47517','50001','50008','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:35:18.039','2025-08-18 14:35:18.039',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('50011',1,'flow_rmnt89qb:12:47517','50001','50008','Activity_04q4vtx','50012',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:35:18.039',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52509',1,'flow_rmnt89qb:12:47517','52501','52508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52510',1,'flow_rmnt89qb:12:47517','52501','52508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:37:26.486','2025-08-18 14:37:26.486',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52511',1,'flow_rmnt89qb:12:47517','52501','52508','Activity_04q4vtx','52512',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:37:26.486',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52522',1,'flow_rmnt89qb:12:47517','52514','52521','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52523',1,'flow_rmnt89qb:12:47517','52514','52521','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-18 14:37:29.862','2025-08-18 14:37:29.862',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('52524',1,'flow_rmnt89qb:12:47517','52514','52521','Activity_04q4vtx','52525',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-18 14:37:29.862',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57511',1,'flow_rmnt89qb:15:55033','57501','57510','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 07:54:46.308','2025-08-19 07:54:46.313',5,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57512',1,'flow_rmnt89qb:15:55033','57501','57510','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 07:54:46.314','2025-08-19 07:54:46.314',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57513',1,'flow_rmnt89qb:15:55033','57501','57510','Activity_04q4vtx','57514',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 07:54:46.315',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57552',1,'flow_p82g6ib8:4:57539','57540','57551','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:04:46.496','2025-08-19 08:04:46.496',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57553',1,'flow_p82g6ib8:4:57539','57540','57551','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:04:46.496','2025-08-19 08:04:46.496',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57554',1,'flow_p82g6ib8:4:57539','57540','57551','Activity_0vemk0z','57555',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:04:46.496',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57570',1,'flow_p82g6ib8:4:57539','57558','57569','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:06:51.968','2025-08-19 08:06:51.968',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57571',1,'flow_p82g6ib8:4:57539','57558','57569','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:06:51.969','2025-08-19 08:06:51.969',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57572',1,'flow_p82g6ib8:4:57539','57558','57569','Activity_0vemk0z','57573',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:06:51.969',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57588',1,'flow_p82g6ib8:4:57539','57576','57587','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:15:20.315','2025-08-19 08:15:20.317',2,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57589',1,'flow_p82g6ib8:4:57539','57576','57587','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:15:20.317','2025-08-19 08:15:20.317',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57590',1,'flow_p82g6ib8:4:57539','57576','57587','Activity_0vemk0z','57591',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:15:20.317',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57606',1,'flow_rmnt89qb:17:57523','57594','57605','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57607',1,'flow_rmnt89qb:17:57523','57594','57605','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:15:56.145','2025-08-19 08:15:56.145',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57608',1,'flow_rmnt89qb:17:57523','57594','57605','Activity_04q4vtx','57609',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:15:56.145',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57618',1,'flow_rmnt89qb:17:57523','57611','57617','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57619',1,'flow_rmnt89qb:17:57523','57611','57617','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:16:51.824','2025-08-19 08:16:51.824',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57620',1,'flow_rmnt89qb:17:57523','57611','57617','Activity_04q4vtx','57621',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:16:51.824',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57630',1,'flow_rmnt89qb:17:57523','57623','57629','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57631',1,'flow_rmnt89qb:17:57523','57623','57629','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:17:35.150','2025-08-19 08:17:35.150',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57632',1,'flow_rmnt89qb:17:57523','57623','57629','Activity_04q4vtx','57633',NULL,'å®¡æ‰¹','userTask',NULL,'2025-08-19 08:17:35.150',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57650',1,'flow_rmnt89qb:19:57642','57643','57649','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57651',1,'flow_rmnt89qb:19:57642','57643','57649','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:19:55.310','2025-08-19 08:19:55.310',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57652',1,'flow_rmnt89qb:19:57642','57643','57649','Activity_04q4vtx','57653',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 08:19:55.310',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57663',1,'flow_rmnt89qb:19:57642','57656','57662','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57664',1,'flow_rmnt89qb:19:57642','57656','57662','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:21:10.227','2025-08-19 08:21:10.227',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57665',1,'flow_rmnt89qb:19:57642','57656','57662','Activity_04q4vtx','57666',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 08:21:10.227',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57681',1,'flow_p82g6ib8:4:57539','57669','57680','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57682',1,'flow_p82g6ib8:4:57539','57669','57680','Flow_1i02yp6',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 08:22:16.203','2025-08-19 08:22:16.203',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('57683',1,'flow_p82g6ib8:4:57539','57669','57680','Activity_0vemk0z','57684',NULL,'å®¡æ‰¹1','userTask','1','2025-08-19 08:22:16.203',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62529',1,'flow_rmnt89qb:19:57642','62522','62528','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62530',1,'flow_rmnt89qb:19:57642','62522','62528','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:16:43.481','2025-08-19 09:16:43.481',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('62531',1,'flow_rmnt89qb:19:57642','62522','62528','Activity_04q4vtx','62532',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:16:43.481',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65008',1,'flow_rmnt89qb:19:57642','65001','65007','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65009',1,'flow_rmnt89qb:19:57642','65001','65007','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:18:55.198','2025-08-19 09:18:55.198',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65010',1,'flow_rmnt89qb:19:57642','65001','65007','Activity_04q4vtx','65011',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:18:55.198',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65022',1,'flow_rmnt89qb:19:57642','65014','65021','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889',0,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65023',1,'flow_rmnt89qb:19:57642','65014','65021','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:22:32.889','2025-08-19 09:22:32.889',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('65024',1,'flow_rmnt89qb:19:57642','65014','65021','Activity_04q4vtx','65025',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:22:32.889',NULL,NULL,3,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67509',1,'flow_rmnt89qb:19:57642','67501','67508','start_event',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2025-08-19 09:34:34.918','2025-08-19 09:34:34.919',1,1,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67510',1,'flow_rmnt89qb:19:57642','67501','67508','Flow_1hhdvmu',NULL,NULL,NULL,'sequenceFlow',NULL,'2025-08-19 09:34:34.920','2025-08-19 09:34:34.920',0,2,NULL,'');
insert  into `act_ru_actinst`(`ID_`,`REV_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TRANSACTION_ORDER_`,`DELETE_REASON_`,`TENANT_ID_`) values ('67511',1,'flow_rmnt89qb:19:57642','67501','67508','Activity_04q4vtx','67512',NULL,'å®¡æ‰¹1','userTask','2','2025-08-19 09:34:34.920',NULL,NULL,3,NULL,'');

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_deadletter_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_deadletter_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_entitylink` */

DROP TABLE IF EXISTS `act_ru_entitylink`;

CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_entitylink` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR_SCOPEREF_` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `act_ru_event_subscr_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_execution_ibfk_1` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_execution_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `act_ru_execution_ibfk_4` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('47518',1,'47518',NULL,NULL,'flow_rmnt89qb:12:47517',NULL,'47518',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-18 14:26:53.733','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('47525',1,'47518',NULL,'47518','flow_rmnt89qb:12:47517',NULL,'47518','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-18 14:26:53.737',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('50001',1,'50001',NULL,NULL,'flow_rmnt89qb:12:47517',NULL,'50001',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-18 14:35:18.013','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('50008',1,'50001',NULL,'50001','flow_rmnt89qb:12:47517',NULL,'50001','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-18 14:35:18.036',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52501',1,'52501',NULL,NULL,'flow_rmnt89qb:12:47517',NULL,'52501',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-18 14:37:26.479','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52508',1,'52501',NULL,'52501','flow_rmnt89qb:12:47517',NULL,'52501','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-18 14:37:26.486',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52514',1,'52514',NULL,NULL,'flow_rmnt89qb:12:47517',NULL,'52514',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-18 14:37:29.860','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('52521',1,'52514',NULL,'52514','flow_rmnt89qb:12:47517',NULL,'52514','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-18 14:37:29.862',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57501',1,'57501',NULL,NULL,'flow_rmnt89qb:15:55033',NULL,'57501',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 07:54:46.289','1',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57510',1,'57501',NULL,'57501','flow_rmnt89qb:15:55033',NULL,'57501','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 07:54:46.307',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57540',1,'57540',NULL,NULL,'flow_p82g6ib8:4:57539',NULL,'57540',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:04:46.491','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57551',1,'57540',NULL,'57540','flow_p82g6ib8:4:57539',NULL,'57540','Activity_0vemk0z',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:04:46.496',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57558',1,'57558',NULL,NULL,'flow_p82g6ib8:4:57539',NULL,'57558',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:06:51.968','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57569',1,'57558',NULL,'57558','flow_p82g6ib8:4:57539',NULL,'57558','Activity_0vemk0z',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:06:51.968',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57576',1,'57576',NULL,NULL,'flow_p82g6ib8:4:57539',NULL,'57576',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:15:20.313','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57587',1,'57576',NULL,'57576','flow_p82g6ib8:4:57539',NULL,'57576','Activity_0vemk0z',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:15:20.315',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57594',1,'57594',NULL,NULL,'flow_rmnt89qb:17:57523',NULL,'57594',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:15:56.144','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57605',1,'57594',NULL,'57594','flow_rmnt89qb:17:57523',NULL,'57594','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:15:56.145',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57611',1,'57611',NULL,NULL,'flow_rmnt89qb:17:57523',NULL,'57611',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:16:51.824','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57617',1,'57611',NULL,'57611','flow_rmnt89qb:17:57523',NULL,'57611','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:16:51.824',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57623',1,'57623',NULL,NULL,'flow_rmnt89qb:17:57523',NULL,'57623',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:17:35.150','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57629',1,'57623',NULL,'57623','flow_rmnt89qb:17:57523',NULL,'57623','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:17:35.150',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57643',1,'57643',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'57643',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:19:55.310','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57649',1,'57643',NULL,'57643','flow_rmnt89qb:19:57642',NULL,'57643','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:19:55.310',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57656',1,'57656',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'57656',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:21:10.226','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57662',1,'57656',NULL,'57656','flow_rmnt89qb:19:57642',NULL,'57656','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:21:10.227',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57669',1,'57669',NULL,NULL,'flow_p82g6ib8:4:57539',NULL,'57669',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 08:22:16.203','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('57680',1,'57669',NULL,'57669','flow_p82g6ib8:4:57539',NULL,'57669','Activity_0vemk0z',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 08:22:16.203',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('62522',1,'62522',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'62522',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 09:16:43.481','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('62528',1,'62522',NULL,'62522','flow_rmnt89qb:19:57642',NULL,'62522','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 09:16:43.481',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65001',1,'65001',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'65001',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 09:18:55.185','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65007',1,'65001',NULL,'65001','flow_rmnt89qb:19:57642',NULL,'65001','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 09:18:55.198',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65014',1,'65014',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'65014',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 09:22:32.888','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('65021',1,'65014',NULL,'65014','flow_rmnt89qb:19:57642',NULL,'65014','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 09:22:32.889',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('67501',1,'67501',NULL,NULL,'flow_rmnt89qb:19:57642',NULL,'67501',NULL,1,0,1,0,0,1,NULL,'',NULL,'start_event','2025-08-19 09:34:34.907','100',NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ROOT_PROC_INST_ID_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`IS_MI_ROOT_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`START_ACT_ID_`,`START_TIME_`,`START_USER_ID_`,`LOCK_TIME_`,`LOCK_OWNER_`,`IS_COUNT_ENABLED_`,`EVT_SUBSCR_COUNT_`,`TASK_COUNT_`,`JOB_COUNT_`,`TIMER_JOB_COUNT_`,`SUSP_JOB_COUNT_`,`DEADLETTER_JOB_COUNT_`,`EXTERNAL_WORKER_JOB_COUNT_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`CALLBACK_ID_`,`CALLBACK_TYPE_`,`REFERENCE_ID_`,`REFERENCE_TYPE_`,`PROPAGATED_STAGE_INST_ID_`,`BUSINESS_STATUS_`) values ('67508',1,'67501',NULL,'67501','flow_rmnt89qb:19:57642',NULL,'67501','Activity_04q4vtx',1,0,0,0,0,1,NULL,'',NULL,NULL,'2025-08-19 09:34:34.918',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `act_ru_external_job` */

DROP TABLE IF EXISTS `act_ru_external_job`;

CREATE TABLE `act_ru_external_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`) USING BTREE,
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  CONSTRAINT `act_ru_external_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_external_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_external_job` */

/*Table structure for table `act_ru_history_job` */

DROP TABLE IF EXISTS `act_ru_history_job`;

CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_history_job` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_identitylink_ibfk_1` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_2` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_identitylink_ibfk_3` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47519',1,NULL,'starter','1',NULL,'47518',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('47530',1,'3','candidate',NULL,'47529',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('50002',1,NULL,'starter','1',NULL,'50001',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('50013',1,'3','candidate',NULL,'50012',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52502',1,NULL,'starter','1',NULL,'52501',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52513',1,'3','candidate',NULL,'52512',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52515',1,NULL,'starter','1',NULL,'52514',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('52526',1,'3','candidate',NULL,'52525',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57502',1,NULL,'starter','1',NULL,'57501',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57515',1,'3','candidate',NULL,'57514',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57541',1,NULL,'starter','100',NULL,'57540',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57557',1,NULL,'participant','1',NULL,'57540',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57559',1,NULL,'starter','100',NULL,'57558',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57575',1,NULL,'participant','1',NULL,'57558',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57577',1,NULL,'starter','100',NULL,'57576',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57593',1,NULL,'participant','1',NULL,'57576',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57595',1,NULL,'starter','100',NULL,'57594',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57610',1,'3','candidate',NULL,'57609',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57612',1,NULL,'starter','100',NULL,'57611',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57622',1,'3','candidate',NULL,'57621',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57624',1,NULL,'starter','100',NULL,'57623',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57634',1,'3','candidate',NULL,'57633',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57644',1,NULL,'starter','100',NULL,'57643',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57655',1,NULL,'participant','2',NULL,'57643',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57657',1,NULL,'starter','100',NULL,'57656',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57668',1,NULL,'participant','2',NULL,'57656',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57670',1,NULL,'starter','100',NULL,'57669',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('57686',1,NULL,'participant','1',NULL,'57669',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62523',1,NULL,'starter','100',NULL,'62522',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('62534',1,NULL,'participant','2',NULL,'62522',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65002',1,NULL,'starter','100',NULL,'65001',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65013',1,NULL,'participant','2',NULL,'65001',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65015',1,NULL,'starter','100',NULL,'65014',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('65027',1,NULL,'participant','2',NULL,'65014',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67502',1,NULL,'starter','100',NULL,'67501',NULL,NULL,NULL,NULL,NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`) values ('67514',1,NULL,'participant','2',NULL,'67501',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_suspended_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_suspended_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_task_ibfk_1` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_2` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `act_ru_task_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('47529',1,'47525','47518','flow_rmnt89qb:12:47517',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-18 14:26:53.738',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('50012',1,'50008','50001','flow_rmnt89qb:12:47517',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-18 14:35:18.039',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('52512',1,'52508','52501','flow_rmnt89qb:12:47517',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-18 14:37:26.486',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('52525',1,'52521','52514','flow_rmnt89qb:12:47517',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-18 14:37:29.862',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57514',1,'57510','57501','flow_rmnt89qb:15:55033',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-19 07:54:46.315',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57555',1,'57551','57540','flow_p82g6ib8:4:57539',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_0vemk0z',NULL,'1',NULL,50,'2025-08-19 08:04:46.496',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57573',1,'57569','57558','flow_p82g6ib8:4:57539',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_0vemk0z',NULL,'1',NULL,50,'2025-08-19 08:06:51.969',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57591',1,'57587','57576','flow_p82g6ib8:4:57539',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_0vemk0z',NULL,'1',NULL,50,'2025-08-19 08:15:20.317',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57609',1,'57605','57594','flow_rmnt89qb:17:57523',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-19 08:15:56.145',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57621',1,'57617','57611','flow_rmnt89qb:17:57523',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-19 08:16:51.824',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57633',1,'57629','57623','flow_rmnt89qb:17:57523',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹',NULL,NULL,'Activity_04q4vtx',NULL,NULL,NULL,50,'2025-08-19 08:17:35.150',NULL,NULL,1,'',NULL,NULL,1,0,1,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57653',1,'57649','57643','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 08:19:55.310',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57666',1,'57662','57656','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 08:21:10.227',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('57684',1,'57680','57669','flow_p82g6ib8:4:57539',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_0vemk0z',NULL,'1',NULL,50,'2025-08-19 08:22:16.203',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('62532',1,'62528','62522','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 09:16:43.481',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('65011',1,'65007','65001','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 09:18:55.198',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('65025',1,'65021','65014','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 09:22:32.889',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`TASK_DEF_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`SCOPE_DEFINITION_ID_`,`PROPAGATED_STAGE_INST_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`,`CLAIM_TIME_`,`IS_COUNT_ENABLED_`,`VAR_COUNT_`,`ID_LINK_COUNT_`,`SUB_TASK_COUNT_`) values ('67512',1,'67508','67501','flow_rmnt89qb:19:57642',NULL,NULL,NULL,NULL,NULL,NULL,'å®¡æ‰¹1',NULL,NULL,'Activity_04q4vtx',NULL,'2',NULL,50,'2025-08-19 09:34:34.920',NULL,NULL,1,'',NULL,NULL,1,0,0,0);

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `act_ru_timer_job_ibfk_1` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_2` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_3` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_4` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_timer_job_ibfk_5` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `act_ru_variable_ibfk_1` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_2` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `act_ru_variable_ibfk_3` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('47521',1,'serializable','formJson','47518','47518',NULL,NULL,NULL,NULL,'47520',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('47523',1,'string','å•Šå•Š','47518','47518',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'heqiuyu',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('47524',1,'long','INITIATOR','47518','47518',NULL,NULL,NULL,NULL,NULL,NULL,1,'1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('50004',1,'serializable','formJson','50001','50001',NULL,NULL,NULL,NULL,'50003',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('50006',1,'string','å•Šå•Š','50001','50001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('50007',1,'long','INITIATOR','50001','50001',NULL,NULL,NULL,NULL,NULL,NULL,1,'1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52504',1,'serializable','formJson','52501','52501',NULL,NULL,NULL,NULL,'52503',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52506',1,'string','å•Šå•Š','52501','52501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52507',1,'long','INITIATOR','52501','52501',NULL,NULL,NULL,NULL,NULL,NULL,1,'1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52517',1,'serializable','formJson','52514','52514',NULL,NULL,NULL,NULL,'52516',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52519',1,'string','å•Šå•Š','52514','52514',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'taskid',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('52520',1,'long','INITIATOR','52514','52514',NULL,NULL,NULL,NULL,NULL,NULL,1,'1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57504',1,'serializable','formJson','57501','57501',NULL,NULL,NULL,NULL,'57503',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57506',1,'string','applicantName','57501','57501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57507',1,'string','leaveType','57501','57501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57508',1,'string','taskId','57501','57501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57509',1,'long','INITIATOR','57501','57501',NULL,NULL,NULL,NULL,NULL,NULL,1,'1',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57543',1,'serializable','formJson','57540','57540',NULL,NULL,NULL,NULL,'57542',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57545',1,'string','å•Šå•Š','57540','57540',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'å•Š',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57546',1,'string','input46537','57540','57540',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'å•Š',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57548',1,'serializable','daterange83468','57540','57540',NULL,NULL,NULL,NULL,'57547',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57550',1,'long','INITIATOR','57540','57540',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57561',1,'serializable','formJson','57558','57558',NULL,NULL,NULL,NULL,'57560',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57563',1,'string','å•Šå•Š','57558','57558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57564',1,'string','input46537','57558','57558',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'213',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57566',1,'serializable','daterange83468','57558','57558',NULL,NULL,NULL,NULL,'57565',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57568',1,'long','INITIATOR','57558','57558',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57579',1,'serializable','formJson','57576','57576',NULL,NULL,NULL,NULL,'57578',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57581',1,'string','å•Šå•Š','57576','57576',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57582',1,'string','input46537','57576','57576',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57584',1,'serializable','daterange83468','57576','57576',NULL,NULL,NULL,NULL,'57583',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57586',1,'long','INITIATOR','57576','57576',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57596',1,'boolean','__v_isShallow','57594','57594',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57597',1,'boolean','__v_isRef','57594','57594',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57599',1,'serializable','_rawValue','57594','57594',NULL,NULL,NULL,NULL,'57598',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57602',1,'serializable','_value','57594','57594',NULL,NULL,NULL,NULL,'57601',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57604',1,'long','INITIATOR','57594','57594',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57613',1,'string','applicantName','57611','57611',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'qwe',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57614',1,'string','leaveType','57611','57611',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57615',1,'string','taskId','57611','57611',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57616',1,'long','INITIATOR','57611','57611',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57625',1,'string','applicantName','57623','57623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57626',1,'string','leaveType','57623','57623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57627',1,'string','taskId','57623','57623',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57628',1,'long','INITIATOR','57623','57623',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57645',1,'string','applicantName','57643','57643',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57646',1,'string','leaveType','57643','57643',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57647',1,'string','taskId','57643','57643',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57648',1,'long','INITIATOR','57643','57643',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57658',1,'string','applicantName','57656','57656',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57659',1,'string','leaveType','57656','57656',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57660',1,'string','taskId','57656','57656',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57661',1,'long','INITIATOR','57656','57656',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57672',1,'serializable','formJson','57669','57669',NULL,NULL,NULL,NULL,'57671',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57674',1,'string','å•Šå•Š','57669','57669',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57675',1,'string','input46537','57669','57669',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57677',1,'serializable','daterange83468','57669','57669',NULL,NULL,NULL,NULL,'57676',NULL,NULL,NULL,NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('57679',1,'long','INITIATOR','57669','57669',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('62524',1,'string','applicantName','62522','62522',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('62525',1,'string','leaveType','62522','62522',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('62526',1,'string','taskId','62522','62522',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('62527',1,'long','INITIATOR','62522','62522',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65003',1,'string','applicantName','65001','65001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65004',1,'string','leaveType','65001','65001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65005',1,'string','taskId','65001','65001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65006',1,'long','INITIATOR','65001','65001',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65016',1,'string','applicantName','65014','65014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65017',1,'string','leaveType','65014','65014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65018',1,'string','taskId','65014','65014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65019',1,'string','deployId','65014','65014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'57639',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('65020',1,'long','INITIATOR','65014','65014',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('67503',1,'string','applicantName','67501','67501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'è¯·é—®',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('67504',1,'string','leaveType','67501','67501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sick',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('67505',1,'string','taskId','67501','67501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('67506',1,'string','deployId','67501','67501',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'57639',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`SCOPE_ID_`,`SUB_SCOPE_ID_`,`SCOPE_TYPE_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('67507',1,'long','INITIATOR','67501','67501',NULL,NULL,NULL,NULL,NULL,NULL,100,'100',NULL);

/*Table structure for table `f_goods` */

DROP TABLE IF EXISTS `f_goods`;

CREATE TABLE `f_goods` (
  `id` varchar(100) NOT NULL COMMENT 'id',
  `goods_name` varchar(100) DEFAULT NULL COMMENT 'å•†å“åç§°',
  `goods_type` varchar(10) DEFAULT NULL COMMENT 'å•†å“åˆ†ç±»',
  `goods_price` varchar(100) DEFAULT NULL COMMENT 'å•†å“ä»·æ ¼',
  `goods_inventory` varchar(100) DEFAULT NULL COMMENT 'å•†å“åº“å­˜',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(255) DEFAULT NULL COMMENT 'åˆ›å»ºäººid',
  `create_name` varchar(255) DEFAULT NULL COMMENT 'åˆ›å»ºäººåç§°',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `update_by` varchar(255) DEFAULT NULL COMMENT 'æ›´æ–°äººid',
  `update_name` varchar(255) DEFAULT NULL COMMENT 'æ›´æ–°äººåç§°',
  `del_flag` char(1) DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è¯†',
  `img_url` text COMMENT 'å•†å“å›¾ç‰‡',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å•†å“ä¿¡æ¯è¡¨';

/*Data for the table `f_goods` */

insert  into `f_goods`(`id`,`goods_name`,`goods_type`,`goods_price`,`goods_inventory`,`create_time`,`create_by`,`create_name`,`update_time`,`update_by`,`update_name`,`del_flag`,`img_url`) values ('1','test','æœè£…','0','7',NULL,NULL,NULL,'2025-11-07 21:35:51','ç®¡ç†å‘˜','1','0','/profile/upload/2025/11/07/ScreenShot_2025-09-26_110030_540_20251107213211A001.png');

/*Table structure for table `flow_initiator_config` */

DROP TABLE IF EXISTS `flow_initiator_config`;

CREATE TABLE `flow_initiator_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `deploy_id` varchar(50) NOT NULL COMMENT 'æµç¨‹éƒ¨ç½²ID',
  `proc_def_id` varchar(64) NOT NULL COMMENT 'æµç¨‹å®šä¹‰ID',
  `proc_def_key` varchar(255) NOT NULL COMMENT 'æµç¨‹å®šä¹‰Key',
  `initiator_type` tinyint(2) NOT NULL COMMENT 'å‘èµ·äººç±»å‹ï¼š1-ç”¨æˆ·ï¼Œ2-éƒ¨é—¨ï¼Œ3-è§’è‰²',
  `initiator_id` varchar(64) NOT NULL COMMENT 'å‘èµ·äººIDï¼ˆç”¨æˆ·IDã€éƒ¨é—¨IDæˆ–è§’è‰²IDï¼‰',
  `initiator_name` varchar(255) DEFAULT NULL COMMENT 'å‘èµ·äººåç§°',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(20) DEFAULT NULL COMMENT 'åˆ›å»ºäººå‘˜',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ›´æ–°æ—¶é—´',
  `update_by` varchar(20) DEFAULT NULL COMMENT 'æ›´æ–°äººå‘˜',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_deploy_id` (`deploy_id`) USING BTREE,
  KEY `idx_proc_def_id` (`proc_def_id`) USING BTREE,
  KEY `idx_proc_def_key` (`proc_def_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æµç¨‹å‘èµ·äººé…ç½®è¡¨';

/*Data for the table `flow_initiator_config` */

insert  into `flow_initiator_config`(`id`,`deploy_id`,`proc_def_id`,`proc_def_key`,`initiator_type`,`initiator_id`,`initiator_name`,`create_time`,`create_by`,`update_time`,`update_by`) values (1,'17501','flow_rmnt89qb:9:17504','flow_rmnt89qb',3,'3','é¢†å¯¼ç»„','2025-08-14 08:17:28','admin','2025-08-14 08:17:27',NULL);
insert  into `flow_initiator_config`(`id`,`deploy_id`,`proc_def_id`,`proc_def_key`,`initiator_type`,`initiator_id`,`initiator_name`,`create_time`,`create_by`,`update_time`,`update_by`) values (2,'20005','flow_rmnt89qb:11:20008','flow_rmnt89qb',3,'2','æ™®é€šè§’è‰²','2025-08-14 08:41:42','admin','2025-08-14 08:41:41',NULL);
insert  into `flow_initiator_config`(`id`,`deploy_id`,`proc_def_id`,`proc_def_key`,`initiator_type`,`initiator_id`,`initiator_name`,`create_time`,`create_by`,`update_time`,`update_by`) values (3,'57516','flow_rmnt89qb:16:57519','flow_rmnt89qb',3,'2','æ™®é€šè§’è‰²','2025-08-19 08:01:43','admin','2025-08-19 08:01:42',NULL);
insert  into `flow_initiator_config`(`id`,`deploy_id`,`proc_def_id`,`proc_def_key`,`initiator_type`,`initiator_id`,`initiator_name`,`create_time`,`create_by`,`update_time`,`update_by`) values (4,'57520','flow_rmnt89qb:17:57523','flow_rmnt89qb',3,'2','æ™®é€šè§’è‰²','2025-08-19 08:02:00','admin','2025-08-19 08:02:00',NULL);
insert  into `flow_initiator_config`(`id`,`deploy_id`,`proc_def_id`,`proc_def_key`,`initiator_type`,`initiator_id`,`initiator_name`,`create_time`,`create_by`,`update_time`,`update_by`) values (5,'57639','flow_rmnt89qb:19:57642','flow_rmnt89qb',3,'2','æ™®é€šè§’è‰²','2025-08-19 08:19:13','admin','2025-08-19 08:19:12',NULL);

/*Table structure for table `flw_channel_definition` */

DROP TABLE IF EXISTS `flw_channel_definition`;

CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_channel_definition` */

/*Table structure for table `flw_ev_databasechangelog` */

DROP TABLE IF EXISTS `flw_ev_databasechangelog`;

CREATE TABLE `flw_ev_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_ev_databasechangelog` */

insert  into `flw_ev_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-08-12 17:07:40',1,'EXECUTED','8:1b0c48c9cf7945be799d868a2626d687','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.3.5',NULL,NULL,'4989660819');
insert  into `flw_ev_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-08-12 17:07:41',2,'EXECUTED','8:0ea825feb8e470558f0b5754352b9cda','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.3.5',NULL,NULL,'4989660819');
insert  into `flw_ev_databasechangelog`(`ID`,`AUTHOR`,`FILENAME`,`DATEEXECUTED`,`ORDEREXECUTED`,`EXECTYPE`,`MD5SUM`,`DESCRIPTION`,`COMMENTS`,`TAG`,`LIQUIBASE`,`CONTEXTS`,`LABELS`,`DEPLOYMENT_ID`) values ('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2025-08-12 17:07:41',3,'EXECUTED','8:3c2bb293350b5cbe6504331980c9dcee','customChange','',NULL,'4.3.5',NULL,NULL,'4989660819');

/*Table structure for table `flw_ev_databasechangeloglock` */

DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;

CREATE TABLE `flw_ev_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_ev_databasechangeloglock` */

insert  into `flw_ev_databasechangeloglock`(`ID`,`LOCKED`,`LOCKGRANTED`,`LOCKEDBY`) values (1,'\0',NULL,NULL);

/*Table structure for table `flw_event_definition` */

DROP TABLE IF EXISTS `flw_event_definition`;

CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_event_definition` */

/*Table structure for table `flw_event_deployment` */

DROP TABLE IF EXISTS `flw_event_deployment`;

CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_event_deployment` */

/*Table structure for table `flw_event_resource` */

DROP TABLE IF EXISTS `flw_event_resource`;

CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_event_resource` */

/*Table structure for table `flw_ru_batch` */

DROP TABLE IF EXISTS `flw_ru_batch`;

CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_ru_batch` */

/*Table structure for table `flw_ru_batch_part` */

DROP TABLE IF EXISTS `flw_ru_batch_part`;

CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`) USING BTREE,
  CONSTRAINT `flw_ru_batch_part_ibfk_1` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

/*Data for the table `flw_ru_batch_part` */

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `table_name` varchar(200) DEFAULT '' COMMENT 'è¡¨åç§°',
  `table_comment` varchar(500) DEFAULT '' COMMENT 'è¡¨æè¿°',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT 'å…³è”å­è¡¨çš„è¡¨å',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT 'å­è¡¨å…³è”çš„å¤–é”®å',
  `class_name` varchar(100) DEFAULT '' COMMENT 'å®ä½“ç±»åç§°',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT 'ä½¿ç”¨çš„æ¨¡æ¿ï¼ˆcrudå•è¡¨æ“ä½œ treeæ ‘è¡¨æ“ä½œï¼‰',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT 'å‰ç«¯æ¨¡æ¿ç±»å‹ï¼ˆelement-uiæ¨¡ç‰ˆ element-plusæ¨¡ç‰ˆï¼‰',
  `package_name` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŒ…è·¯å¾„',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆæ¨¡å—å',
  `business_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆä¸šåŠ¡å',
  `function_name` varchar(50) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½å',
  `function_author` varchar(50) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½ä½œè€…',
  `gen_type` char(1) DEFAULT '0' COMMENT 'ç”Ÿæˆä»£ç æ–¹å¼ï¼ˆ0zipå‹ç¼©åŒ… 1è‡ªå®šä¹‰è·¯å¾„ï¼‰',
  `gen_path` varchar(200) DEFAULT '/' COMMENT 'ç”Ÿæˆè·¯å¾„ï¼ˆä¸å¡«é»˜è®¤é¡¹ç›®è·¯å¾„ï¼‰',
  `row_type` char(2) DEFAULT NULL COMMENT 'å•è¡Œè¿˜æ˜¯åŒè¡Œ 1å•è¡Œ 2åŒè¡Œ',
  `options` varchar(1000) DEFAULT NULL COMMENT 'å…¶å®ƒç”Ÿæˆé€‰é¡¹',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ä»£ç ç”Ÿæˆä¸šåŠ¡è¡¨';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`tpl_web_type`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`row_type`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'sys_post','å²—ä½ä¿¡æ¯è¡¨',NULL,NULL,'SysPost','crud','element-plus','com.ruoyi.system','system','post','å²—ä½ä¿¡æ¯','ruoyi','0','/','2','{\"parentMenuId\":0}','admin','2025-08-26 14:06:47','','2025-08-26 15:05:37',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç¼–å·',
  `table_id` bigint(20) DEFAULT NULL COMMENT 'å½’å±è¡¨ç¼–å·',
  `column_name` varchar(200) DEFAULT NULL COMMENT 'åˆ—åç§°',
  `column_comment` varchar(500) DEFAULT NULL COMMENT 'åˆ—æè¿°',
  `column_type` varchar(100) DEFAULT NULL COMMENT 'åˆ—ç±»å‹',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVAç±»å‹',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVAå­—æ®µå',
  `is_pk` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸»é”®ï¼ˆ1æ˜¯ï¼‰',
  `is_increment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦è‡ªå¢ï¼ˆ1æ˜¯ï¼‰',
  `is_required` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¿…å¡«ï¼ˆ1æ˜¯ï¼‰',
  `is_insert` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸ºæ’å…¥å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_edit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ç¼–è¾‘å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_list` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆ—è¡¨å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `is_query` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦æŸ¥è¯¢å­—æ®µï¼ˆ1æ˜¯ï¼‰',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT 'æŸ¥è¯¢æ–¹å¼ï¼ˆç­‰äºã€ä¸ç­‰äºã€å¤§äºã€å°äºã€èŒƒå›´ï¼‰',
  `html_type` varchar(200) DEFAULT NULL COMMENT 'æ˜¾ç¤ºç±»å‹ï¼ˆæ–‡æœ¬æ¡†ã€æ–‡æœ¬åŸŸã€ä¸‹æ‹‰æ¡†ã€å¤é€‰æ¡†ã€å•é€‰æ¡†ã€æ—¥æœŸæ§ä»¶ï¼‰',
  `dict_type` varchar(200) DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `sort` int(11) DEFAULT NULL COMMENT 'æ’åº',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ä»£ç ç”Ÿæˆä¸šåŠ¡è¡¨å­—æ®µ';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (62,3,'post_id','å²—ä½ID','bigint(20)','Long','postId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (63,3,'post_code','å²—ä½ç¼–ç ','varchar(64)','String','postCode','0','0','1','1','1','1','1','EQ','input','',2,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (64,3,'post_name','å²—ä½åç§°','varchar(50)','String','postName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (65,3,'post_sort','æ˜¾ç¤ºé¡ºåº','int(4)','Integer','postSort','0','0','1','1','1','1','1','EQ','select','sys_process_category',4,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (66,3,'status','çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰','char(1)','String','status','0','0','1','1','1','1','1','EQ','radio','',5,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (67,3,'create_by','åˆ›å»ºè€…','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',6,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (68,3,'create_time','åˆ›å»ºæ—¶é—´','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',7,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (69,3,'update_by','æ›´æ–°è€…','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',8,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (70,3,'update_time','æ›´æ–°æ—¶é—´','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');
insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values (71,3,'remark','å¤‡æ³¨','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',10,'admin','2025-08-26 14:06:47','','2025-08-26 15:05:37');

/*Table structure for table `qingjia` */

DROP TABLE IF EXISTS `qingjia`;

CREATE TABLE `qingjia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL COMMENT 'æµç¨‹id',
  `applicant_name` varchar(255) DEFAULT NULL COMMENT 'åç§°',
  `leave_type` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `create_by` varchar(255) DEFAULT NULL COMMENT 'åˆ›å»ºäºº',
  PRIMARY KEY (`id`,`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

/*Data for the table `qingjia` */

insert  into `qingjia`(`id`,`task_id`,`applicant_name`,`leave_type`,`create_time`,`create_by`) values (1,'67512','è¯·é—®','sick',NULL,NULL);
insert  into `qingjia`(`id`,`task_id`,`applicant_name`,`leave_type`,`create_time`,`create_by`) values (2,'67526','è¯·é—®','sick',NULL,NULL);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_nameçš„å¤–é”®',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  `blob_data` blob COMMENT 'å­˜æ”¾æŒä¹…åŒ–Triggerå¯¹è±¡',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Blobç±»å‹çš„è§¦å‘å™¨è¡¨';

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `calendar_name` varchar(200) NOT NULL COMMENT 'æ—¥å†åç§°',
  `calendar` blob NOT NULL COMMENT 'å­˜æ”¾æŒä¹…åŒ–calendarå¯¹è±¡',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æ—¥å†ä¿¡æ¯è¡¨';

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_nameçš„å¤–é”®',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cronè¡¨è¾¾å¼',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT 'æ—¶åŒº',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='Cronç±»å‹çš„è§¦å‘å™¨è¡¨';

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `entry_id` varchar(95) NOT NULL COMMENT 'è°ƒåº¦å™¨å®ä¾‹id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_nameçš„å¤–é”®',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  `instance_name` varchar(200) NOT NULL COMMENT 'è°ƒåº¦å™¨å®ä¾‹å',
  `fired_time` bigint(13) NOT NULL COMMENT 'è§¦å‘çš„æ—¶é—´',
  `sched_time` bigint(13) NOT NULL COMMENT 'å®šæ—¶å™¨åˆ¶å®šçš„æ—¶é—´',
  `priority` int(11) NOT NULL COMMENT 'ä¼˜å…ˆçº§',
  `state` varchar(16) NOT NULL COMMENT 'çŠ¶æ€',
  `job_name` varchar(200) DEFAULT NULL COMMENT 'ä»»åŠ¡åç§°',
  `job_group` varchar(200) DEFAULT NULL COMMENT 'ä»»åŠ¡ç»„å',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¹¶å‘',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT 'æ˜¯å¦æ¥å—æ¢å¤æ‰§è¡Œ',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å·²è§¦å‘çš„è§¦å‘å™¨è¡¨';

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `job_name` varchar(200) NOT NULL COMMENT 'ä»»åŠ¡åç§°',
  `job_group` varchar(200) NOT NULL COMMENT 'ä»»åŠ¡ç»„å',
  `description` varchar(250) DEFAULT NULL COMMENT 'ç›¸å…³ä»‹ç»',
  `job_class_name` varchar(250) NOT NULL COMMENT 'æ‰§è¡Œä»»åŠ¡ç±»åç§°',
  `is_durable` varchar(1) NOT NULL COMMENT 'æ˜¯å¦æŒä¹…åŒ–',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT 'æ˜¯å¦å¹¶å‘',
  `is_update_data` varchar(1) NOT NULL COMMENT 'æ˜¯å¦æ›´æ–°æ•°æ®',
  `requests_recovery` varchar(1) NOT NULL COMMENT 'æ˜¯å¦æ¥å—æ¢å¤æ‰§è¡Œ',
  `job_data` blob COMMENT 'å­˜æ”¾æŒä¹…åŒ–jobå¯¹è±¡',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ä»»åŠ¡è¯¦ç»†ä¿¡æ¯è¡¨';

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `lock_name` varchar(40) NOT NULL COMMENT 'æ‚²è§‚é”åç§°',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å­˜å‚¨çš„æ‚²è§‚é”ä¿¡æ¯è¡¨';

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æš‚åœçš„è§¦å‘å™¨è¡¨';

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `instance_name` varchar(200) NOT NULL COMMENT 'å®ä¾‹åç§°',
  `last_checkin_time` bigint(13) NOT NULL COMMENT 'ä¸Šæ¬¡æ£€æŸ¥æ—¶é—´',
  `checkin_interval` bigint(13) NOT NULL COMMENT 'æ£€æŸ¥é—´éš”æ—¶é—´',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='è°ƒåº¦å™¨çŠ¶æ€è¡¨';

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_nameçš„å¤–é”®',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  `repeat_count` bigint(7) NOT NULL COMMENT 'é‡å¤çš„æ¬¡æ•°ç»Ÿè®¡',
  `repeat_interval` bigint(12) NOT NULL COMMENT 'é‡å¤çš„é—´éš”æ—¶é—´',
  `times_triggered` bigint(10) NOT NULL COMMENT 'å·²ç»è§¦å‘çš„æ¬¡æ•°',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ç®€å•è§¦å‘å™¨çš„ä¿¡æ¯è¡¨';

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_nameçš„å¤–é”®',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggersè¡¨trigger_groupçš„å¤–é”®',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'Stringç±»å‹çš„triggerçš„ç¬¬ä¸€ä¸ªå‚æ•°',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'Stringç±»å‹çš„triggerçš„ç¬¬äºŒä¸ªå‚æ•°',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'Stringç±»å‹çš„triggerçš„ç¬¬ä¸‰ä¸ªå‚æ•°',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'intç±»å‹çš„triggerçš„ç¬¬ä¸€ä¸ªå‚æ•°',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'intç±»å‹çš„triggerçš„ç¬¬äºŒä¸ªå‚æ•°',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'longç±»å‹çš„triggerçš„ç¬¬ä¸€ä¸ªå‚æ•°',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'longç±»å‹çš„triggerçš„ç¬¬äºŒä¸ªå‚æ•°',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimalç±»å‹çš„triggerçš„ç¬¬ä¸€ä¸ªå‚æ•°',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimalç±»å‹çš„triggerçš„ç¬¬äºŒä¸ªå‚æ•°',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Booleanç±»å‹çš„triggerçš„ç¬¬ä¸€ä¸ªå‚æ•°',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Booleanç±»å‹çš„triggerçš„ç¬¬äºŒä¸ªå‚æ•°',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='åŒæ­¥æœºåˆ¶çš„è¡Œé”è¡¨';

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT 'è°ƒåº¦åç§°',
  `trigger_name` varchar(200) NOT NULL COMMENT 'è§¦å‘å™¨çš„åå­—',
  `trigger_group` varchar(200) NOT NULL COMMENT 'è§¦å‘å™¨æ‰€å±ç»„çš„åå­—',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_detailsè¡¨job_nameçš„å¤–é”®',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_detailsè¡¨job_groupçš„å¤–é”®',
  `description` varchar(250) DEFAULT NULL COMMENT 'ç›¸å…³ä»‹ç»',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT 'ä¸Šä¸€æ¬¡è§¦å‘æ—¶é—´ï¼ˆæ¯«ç§’ï¼‰',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT 'ä¸‹ä¸€æ¬¡è§¦å‘æ—¶é—´ï¼ˆé»˜è®¤ä¸º-1è¡¨ç¤ºä¸è§¦å‘ï¼‰',
  `priority` int(11) DEFAULT NULL COMMENT 'ä¼˜å…ˆçº§',
  `trigger_state` varchar(16) NOT NULL COMMENT 'è§¦å‘å™¨çŠ¶æ€',
  `trigger_type` varchar(8) NOT NULL COMMENT 'è§¦å‘å™¨çš„ç±»å‹',
  `start_time` bigint(13) NOT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` bigint(13) DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT 'æ—¥ç¨‹è¡¨åç§°',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT 'è¡¥å¿æ‰§è¡Œçš„ç­–ç•¥',
  `job_data` blob COMMENT 'å­˜æ”¾æŒä¹…åŒ–jobå¯¹è±¡',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='è§¦å‘å™¨è¯¦ç»†ä¿¡æ¯è¡¨';

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_company` */

DROP TABLE IF EXISTS `sys_company`;

CREATE TABLE `sys_company` (
  `scp_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'å”¯ä¸€ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT 'å…³è”è‹¥ä¾éƒ¨é—¨ID',
  `scp_party_name` varchar(300) NOT NULL COMMENT 'å…¬å¸åç§°',
  `scp_short_name` varchar(50) DEFAULT NULL COMMENT 'å…¬å¸ç®€ç§°',
  `scp_pid` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ä¸Šçº§èŠ‚ç‚¹',
  `scp_add_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `scp_update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `scp_update_userid` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°äººID',
  `scp_update_username` varchar(30) DEFAULT NULL COMMENT 'æ›´æ–°äººå§“å',
  `scp_province` varchar(30) DEFAULT NULL COMMENT 'çœä»½',
  `scp_city` varchar(100) DEFAULT NULL COMMENT 'åŸå¸‚',
  `scp_address` varchar(300) DEFAULT NULL COMMENT 'é€šä¿¡åœ°å€',
  `scp_status` varchar(30) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `scp_desp` varchar(4000) DEFAULT NULL COMMENT 'ç®€ä»‹',
  `scp_type` varchar(30) NOT NULL COMMENT 'å…¬å¸ç±»å‹',
  `scp_add_userid` bigint(20) DEFAULT NULL COMMENT 'æ·»åŠ äººID',
  `scp_add_username` varchar(30) NOT NULL COMMENT 'æ·»åŠ äººå§“å',
  `scp_confirm_username` varchar(50) DEFAULT NULL COMMENT 'ç¡®è®¤äººå§“å',
  `scp_confirm_userid` bigint(20) DEFAULT NULL COMMENT 'ç¡®è®¤äººID',
  `scp_confirm_date` datetime DEFAULT NULL COMMENT 'ç¡®è®¤æ—¶é—´',
  `scp_buss_type` varchar(50) DEFAULT 'RFQ' COMMENT 'ä¸šåŠ¡ç±»å‹',
  `scp_audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¶é—´',
  `scp_audit_user_id` bigint(20) DEFAULT '0' COMMENT 'å®¡æ‰¹äººID',
  `scp_audit_user_name` varchar(50) DEFAULT NULL COMMENT 'å®¡æ‰¹äººå§“å',
  `scp_user_mac` varchar(1) DEFAULT NULL COMMENT 'æŒ‡å®šè¯¥å…¬å¸è´¦å·ç™»é™†æ˜¯å¦é”å®šMACåœ°å€',
  `scp_code` varchar(100) DEFAULT NULL COMMENT 'å…¬å¸ç¼–ç ',
  `scp_score` int(11) DEFAULT NULL COMMENT 'ä¾›åº”å•†å¾—åˆ†',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `scp_paidincapital` decimal(18,2) DEFAULT NULL COMMENT 'å®ç¼´èµ„æœ¬',
  `scp_taxpaymentgrade` varchar(20) DEFAULT NULL COMMENT 'çº³ç¨ç­‰çº§',
  `scp_canbaonumber` int(11) DEFAULT NULL COMMENT 'å‚ä¿äººæ•°',
  `scp_salespromise` decimal(18,2) DEFAULT NULL COMMENT 'å”®åæ‰¿è¯º',
  `scp_creditscore` decimal(18,2) DEFAULT NULL COMMENT 'ä¼æŸ¥æŸ¥å¾—åˆ†',
  `scp_tuijian` decimal(18,2) DEFAULT NULL COMMENT 'æ¨èå•ä½',
  `scp_fuzhai` decimal(18,2) DEFAULT NULL COMMENT 'è´Ÿå€ºæ€»é¢',
  `scp_zichan` decimal(18,2) DEFAULT NULL COMMENT 'èµ„äº§æ€»é¢',
  `scp_cunhuo` decimal(18,2) DEFAULT NULL COMMENT 'å¹´åˆåº“å­˜ï¼ˆä¸Šå¹´å­˜è´§æŠ¥è¡¨æ•°æ®ï¼‰',
  `scp_cunhuonianmo` decimal(18,2) DEFAULT NULL COMMENT 'å¹´æœ«åº“å­˜ï¼ˆä¸Šå¹´å­˜è´§æŠ¥è¡¨æ•°æ®ï¼‰',
  `scp_xiaoshoucb` decimal(18,2) DEFAULT NULL COMMENT 'é”€å”®æˆæœ¬ï¼ˆä¸Šå¹´è´¢åŠ¡æŠ¥è¡¨æ•°æ®ï¼‰',
  PRIMARY KEY (`scp_id`) USING BTREE,
  KEY `idx_sys_company_dept_id` (`dept_id`) USING BTREE,
  KEY `idx_sys_company_status` (`scp_status`) USING BTREE,
  KEY `idx_sys_company_type` (`scp_type`) USING BTREE,
  KEY `idx_sys_company_pid` (`scp_pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='é‡‡è´­æ–¹å…¬å¸ä¿¡æ¯è¡¨';

/*Data for the table `sys_company` */

insert  into `sys_company`(`scp_id`,`dept_id`,`scp_party_name`,`scp_short_name`,`scp_pid`,`scp_add_date`,`scp_update_date`,`scp_update_userid`,`scp_update_username`,`scp_province`,`scp_city`,`scp_address`,`scp_status`,`scp_desp`,`scp_type`,`scp_add_userid`,`scp_add_username`,`scp_confirm_username`,`scp_confirm_userid`,`scp_confirm_date`,`scp_buss_type`,`scp_audit_date`,`scp_audit_user_id`,`scp_audit_user_name`,`scp_user_mac`,`scp_code`,`scp_score`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`scp_paidincapital`,`scp_taxpaymentgrade`,`scp_canbaonumber`,`scp_salespromise`,`scp_creditscore`,`scp_tuijian`,`scp_fuzhai`,`scp_zichan`,`scp_cunhuo`,`scp_cunhuonianmo`,`scp_xiaoshoucb`) values (9,200,'è‡ªè´¡å¸‚è½»å·¥ä¸šè®¾è®¡ç ”ç©¶é™¢æœ‰é™è´£ä»»å…¬å¸',NULL,-1,'2025-08-14 15:11:55',NULL,NULL,NULL,'åŒ—äº¬å¸‚','ä¸œåŸåŒº','è‡ªè´¡å¸‚æ²¿æ»©åŒºé«˜æ–°å·¥ä¸šå›­åŒºé‡‘å·è·¯15å·æœåŠ¡ä¸­å¿ƒç»¼åˆæ¥¼4-2å·425æˆ¿é—´','A','è‡ªè´¡å¸‚è½»å·¥ä¸šè®¾è®¡ç ”ç©¶é™¢æœ‰é™è´£ä»»å…¬å¸','SELLER',-1,'test001-å§“å',NULL,NULL,NULL,'RFQ',NULL,0,NULL,NULL,'TGFB9',NULL,'','2025-08-14 15:11:54','','2025-08-14 15:11:54',NULL,1200.00,NULL,100,NULL,NULL,NULL,0.00,0.00,0.00,0.00,0.00);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'å‚æ•°ä¸»é”®',
  `config_name` varchar(100) DEFAULT '' COMMENT 'å‚æ•°åç§°',
  `config_key` varchar(100) DEFAULT '' COMMENT 'å‚æ•°é”®å',
  `config_value` varchar(500) DEFAULT '' COMMENT 'å‚æ•°é”®å€¼',
  `config_type` char(1) DEFAULT 'N' COMMENT 'ç³»ç»Ÿå†…ç½®ï¼ˆYæ˜¯ Nå¦ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å‚æ•°é…ç½®è¡¨';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ä¸»æ¡†æ¶é¡µ-é»˜è®¤çš®è‚¤æ ·å¼åç§°','sys.index.skinName','skin-blue','Y','admin','2025-08-12 17:06:45','',NULL,'è“è‰² skin-blueã€ç»¿è‰² skin-greenã€ç´«è‰² skin-purpleã€çº¢è‰² skin-redã€é»„è‰² skin-yellow');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'ç”¨æˆ·ç®¡ç†-è´¦å·åˆå§‹å¯†ç ','sys.user.initPassword','123456','Y','admin','2025-08-12 17:06:45','',NULL,'åˆå§‹åŒ–å¯†ç  123456');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'ä¸»æ¡†æ¶é¡µ-ä¾§è¾¹æ ä¸»é¢˜','sys.index.sideTheme','theme-light','Y','admin','2025-08-12 17:06:45','admin','2025-08-14 14:02:46','æ·±è‰²ä¸»é¢˜theme-darkï¼Œæµ…è‰²ä¸»é¢˜theme-light');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'è´¦å·è‡ªåŠ©-éªŒè¯ç å¼€å…³','sys.account.captchaEnabled','false','Y','admin','2025-08-12 17:06:45','admin','2025-08-14 15:26:40','æ˜¯å¦å¼€å¯éªŒè¯ç åŠŸèƒ½ï¼ˆtrueå¼€å¯ï¼Œfalseå…³é—­ï¼‰');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,'è´¦å·è‡ªåŠ©-æ˜¯å¦å¼€å¯ç”¨æˆ·æ³¨å†ŒåŠŸèƒ½','sys.account.registerUser','false','Y','admin','2025-08-12 17:06:45','admin','2025-08-14 15:28:45','æ˜¯å¦å¼€å¯æ³¨å†Œç”¨æˆ·åŠŸèƒ½ï¼ˆtrueå¼€å¯ï¼Œfalseå…³é—­ï¼‰');
insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,'ç”¨æˆ·ç™»å½•-é»‘åå•åˆ—è¡¨','sys.login.blackIPList','','Y','admin','2025-08-12 17:06:45','',NULL,'è®¾ç½®ç™»å½•IPé»‘åå•é™åˆ¶ï¼Œå¤šä¸ªåŒ¹é…é¡¹ä»¥;åˆ†éš”ï¼Œæ”¯æŒåŒ¹é…ï¼ˆ*é€šé…ã€ç½‘æ®µï¼‰');

/*Table structure for table `sys_customer_user` */

DROP TABLE IF EXISTS `sys_customer_user`;

CREATE TABLE `sys_customer_user` (
  `sus_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'å”¯ä¸€ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'å…³è”è‹¥ä¾ç”¨æˆ·ID',
  `sus_party_id` bigint(20) NOT NULL COMMENT 'æ‰€åœ¨å…¬å¸ID',
  `sus_usname` varchar(300) NOT NULL COMMENT 'ç”¨æˆ·å',
  `sus_uspasswd` varchar(300) NOT NULL COMMENT 'åŠ å¯†å¯†ç ',
  `sus_adddate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `sus_realname` varchar(100) NOT NULL COMMENT 'çœŸå®å§“å',
  `sus_jobsite` varchar(100) DEFAULT NULL COMMENT 'èŒç§°/å²—ä½',
  `sus_phone` varchar(100) DEFAULT NULL COMMENT 'å›ºå®šç”µè¯',
  `sus_telphone` varchar(100) DEFAULT NULL COMMENT 'æ‰‹æœºå·',
  `sus_email` varchar(100) DEFAULT NULL COMMENT 'ç”µå­é‚®ç®±',
  `sus_fax` varchar(100) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `sus_address` varchar(300) DEFAULT NULL COMMENT 'é‚®å¯„åœ°å€',
  `sus_startdate` datetime DEFAULT NULL COMMENT 'å¯ç”¨æ—¶é—´',
  `sus_enddate` datetime DEFAULT NULL COMMENT 'å¤±æ•ˆæ—¶é—´',
  `sus_update_date` datetime DEFAULT NULL COMMENT 'æœ€åæ›´æ–°æ—¶é—´',
  `sus_update_userid` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°äººID',
  `sus_update_usname` varchar(100) DEFAULT NULL COMMENT 'æ›´æ–°äººåç§°',
  `sus_status` varchar(100) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `sus_pid` bigint(20) DEFAULT NULL COMMENT 'ç›´æ¥ä¸Šçº§',
  `sus_add_userid` bigint(20) DEFAULT NULL COMMENT 'æ·»åŠ äººID',
  `sus_add_usname` varchar(100) DEFAULT NULL COMMENT 'æ·»åŠ äººå§“å',
  `sus_sex` varchar(10) DEFAULT NULL COMMENT 'æ€§åˆ«ï¼ˆ0ç”· 1å¥³ 2æœªçŸ¥ï¼‰',
  `sus_recommend` varchar(1000) DEFAULT NULL COMMENT 'æ¨èå•ä½',
  `sus_encrtpwd` varchar(100) DEFAULT NULL COMMENT 'exchange å¯†ç 1',
  `sus_functionpwd` varchar(100) DEFAULT NULL COMMENT 'exchange å¯†ç 2',
  `sus_partners` varchar(500) DEFAULT NULL COMMENT 'æ­£ç»‘å®šID',
  `sus_isplatform` varchar(100) DEFAULT NULL COMMENT 'æ˜¯å¦å…¨å¹³å°',
  `sus_inbind` varchar(300) DEFAULT NULL COMMENT 'åç»‘å®šID',
  `sus_linkman2` varchar(100) DEFAULT NULL COMMENT 'è”ç³»äºº2ï¼ˆé¢„ç•™å­—æ®µï¼‰',
  `sus_phone2` varchar(100) DEFAULT NULL COMMENT 'å›ºå®šç”µè¯2ï¼ˆé¢„ç•™å­—æ®µï¼‰',
  `sus_feedate` datetime DEFAULT NULL COMMENT 'ç”¨æˆ·ç¼´è´¹æˆªæ­¢æ—¶é—´',
  `sus_callphone2` varchar(100) DEFAULT NULL COMMENT 'æ‰‹æœºå·2ï¼ˆé¢„ç•™å­—æ®µï¼‰',
  `sus_isopen` varchar(10) DEFAULT 'Y' COMMENT 'æ˜¯å¦å…¬å¼€(Y,N)',
  `sus_endbidbefore` varchar(10) DEFAULT 'Y' COMMENT 'åœæ­¢åº”ç­”æå‰å¯ç”¨é¡¹',
  `sus_confirm_username` varchar(50) DEFAULT NULL COMMENT 'ç¡®è®¤äººå§“å',
  `sus_confirm_userid` bigint(20) DEFAULT NULL COMMENT 'ç¡®è®¤äººID',
  `sus_confirm_date` datetime DEFAULT NULL COMMENT 'ç¡®è®¤æ—¶é—´',
  `sus_audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¶é—´',
  `sus_audit_user_id` bigint(20) DEFAULT '0' COMMENT 'å®¡æ‰¹äººID',
  `sus_audit_user_name` varchar(50) DEFAULT NULL COMMENT 'å®¡æ‰¹äººå§“å',
  `sus_dept_id` bigint(20) DEFAULT NULL COMMENT 'æ‰€å±éƒ¨é—¨ID',
  `sus_dept_name` varchar(1000) DEFAULT NULL COMMENT 'æ‰€å±éƒ¨é—¨åç§°',
  `sus_last_update_password_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'æœ€åæ›´æ–°å¯†ç æ—¶é—´',
  `sus_last_logdate` datetime DEFAULT NULL COMMENT 'æœ€åç™»å½•æ—¶é—´',
  `sus_last_log_address` varchar(50) DEFAULT NULL COMMENT 'æœ€åç™»å½•åœ°å€',
  `sus_last_log_ip` varchar(50) DEFAULT NULL COMMENT 'æœ€åç™»å½•IP',
  `sus_islocked` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦é”å®šï¼ˆ0æ­£å¸¸ 1é”å®šï¼‰',
  `sus_lock_date` datetime DEFAULT NULL COMMENT 'é”å®šæ—¶é—´',
  `sus_attempt_count` int(11) DEFAULT '0' COMMENT 'å°è¯•æ¬¡æ•°',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`sus_id`) USING BTREE,
  UNIQUE KEY `sus_usname` (`sus_usname`) USING BTREE,
  KEY `idx_sys_customer_user_user_id` (`user_id`) USING BTREE,
  KEY `idx_sys_customer_user_party_id` (`sus_party_id`) USING BTREE,
  KEY `idx_sys_customer_user_status` (`sus_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å®¢æˆ·ç”¨æˆ·ä¿¡æ¯è¡¨';

/*Data for the table `sys_customer_user` */

insert  into `sys_customer_user`(`sus_id`,`user_id`,`sus_party_id`,`sus_usname`,`sus_uspasswd`,`sus_adddate`,`sus_realname`,`sus_jobsite`,`sus_phone`,`sus_telphone`,`sus_email`,`sus_fax`,`sus_address`,`sus_startdate`,`sus_enddate`,`sus_update_date`,`sus_update_userid`,`sus_update_usname`,`sus_status`,`sus_pid`,`sus_add_userid`,`sus_add_usname`,`sus_sex`,`sus_recommend`,`sus_encrtpwd`,`sus_functionpwd`,`sus_partners`,`sus_isplatform`,`sus_inbind`,`sus_linkman2`,`sus_phone2`,`sus_feedate`,`sus_callphone2`,`sus_isopen`,`sus_endbidbefore`,`sus_confirm_username`,`sus_confirm_userid`,`sus_confirm_date`,`sus_audit_date`,`sus_audit_user_id`,`sus_audit_user_name`,`sus_dept_id`,`sus_dept_name`,`sus_last_update_password_date`,`sus_last_logdate`,`sus_last_log_address`,`sus_last_log_ip`,`sus_islocked`,`sus_lock_date`,`sus_attempt_count`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,100,9,'TEST001','$2a$10$VLG/ykvkxQLlg6TBQ6J78ubV722adbfZf3UlCtWPq0ILRJ4ktG1YO','2025-08-14 15:11:54','test001-å§“å','æ”¯æ´','0311-11112222','13322221111','4333@qq.com','','æ²³åŒ—ç§¦çš‡å²›',NULL,NULL,'2025-08-14 17:19:24',NULL,NULL,'A',0,-1,NULL,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','Y',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2025-08-14 15:11:54',NULL,NULL,NULL,'0',NULL,0,'','2025-08-14 15:11:54','','2025-08-14 15:11:54',NULL);

/*Table structure for table `sys_deploy_form` */

DROP TABLE IF EXISTS `sys_deploy_form`;

CREATE TABLE `sys_deploy_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®',
  `form_id` bigint(20) DEFAULT NULL COMMENT 'è¡¨å•ä¸»é”®',
  `deploy_id` varchar(50) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ä¸»é”®',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9642 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æµç¨‹å®ä¾‹å…³è”è¡¨å•';

/*Data for the table `sys_deploy_form` */

insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9623,3936,'1');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9624,3936,'5');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9625,3936,'9');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9626,3936,'13');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9627,3936,'2509');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9628,3936,'5008');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9629,3936,'7514');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9630,3936,'10001');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9631,3936,'10005');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9632,3936,'20005');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9633,3936,'47514');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9634,3938,'55001');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9635,3938,'55005');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9637,3939,'55030');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9638,3939,'57520');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9639,3938,'57536');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9640,3939,'57639');
insert  into `sys_deploy_form`(`id`,`form_id`,`deploy_id`) values (9641,3938,'57687');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'éƒ¨é—¨id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT 'çˆ¶éƒ¨é—¨id',
  `ancestors` varchar(50) DEFAULT '' COMMENT 'ç¥–çº§åˆ—è¡¨',
  `dept_name` varchar(30) DEFAULT '' COMMENT 'éƒ¨é—¨åç§°',
  `order_num` int(4) DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `leader` varchar(20) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(11) DEFAULT NULL COMMENT 'è”ç³»ç”µè¯',
  `email` varchar(50) DEFAULT NULL COMMENT 'é‚®ç®±',
  `status` char(1) DEFAULT '0' COMMENT 'éƒ¨é—¨çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='éƒ¨é—¨è¡¨';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (100,0,'0','è‹¥ä¾ç§‘æŠ€',0,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (101,100,'0,100','æ·±åœ³æ€»å…¬å¸',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (102,100,'0,100','é•¿æ²™åˆ†å…¬å¸',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (103,101,'0,100,101','ç ”å‘éƒ¨é—¨',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (104,101,'0,100,101','å¸‚åœºéƒ¨é—¨',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (105,101,'0,100,101','æµ‹è¯•éƒ¨é—¨',3,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (106,101,'0,100,101','è´¢åŠ¡éƒ¨é—¨',4,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (107,101,'0,100,101','è¿ç»´éƒ¨é—¨',5,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (108,102,'0,100,102','å¸‚åœºéƒ¨é—¨',1,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);
insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values (109,102,'0,100,102','è´¢åŠ¡éƒ¨é—¨',2,'è‹¥ä¾','15888888888','ry@qq.com','0','0','admin','2025-08-12 17:06:45','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'å­—å…¸ç¼–ç ',
  `dict_sort` int(4) DEFAULT '0' COMMENT 'å­—å…¸æ’åº',
  `dict_label` varchar(100) DEFAULT '' COMMENT 'å­—å…¸æ ‡ç­¾',
  `dict_value` varchar(100) DEFAULT '' COMMENT 'å­—å…¸é”®å€¼',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `css_class` varchar(100) DEFAULT NULL COMMENT 'æ ·å¼å±æ€§ï¼ˆå…¶ä»–æ ·å¼æ‰©å±•ï¼‰',
  `list_class` varchar(100) DEFAULT NULL COMMENT 'è¡¨æ ¼å›æ˜¾æ ·å¼',
  `is_default` char(1) DEFAULT 'N' COMMENT 'æ˜¯å¦é»˜è®¤ï¼ˆYæ˜¯ Nå¦ï¼‰',
  `status` char(1) DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å­—å…¸æ•°æ®è¡¨';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,1,'ç”·','0','sys_user_sex','','','Y','0','admin','2025-08-12 17:06:45','',NULL,'æ€§åˆ«ç”·');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,2,'å¥³','1','sys_user_sex','','','N','0','admin','2025-08-12 17:06:45','',NULL,'æ€§åˆ«å¥³');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,3,'æœªçŸ¥','2','sys_user_sex','','','N','0','admin','2025-08-12 17:06:45','',NULL,'æ€§åˆ«æœªçŸ¥');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,1,'æ˜¾ç¤º','0','sys_show_hide','','primary','Y','0','admin','2025-08-12 17:06:45','',NULL,'æ˜¾ç¤ºèœå•');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,2,'éšè—','1','sys_show_hide','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'éšè—èœå•');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,1,'æ­£å¸¸','0','sys_normal_disable','','primary','Y','0','admin','2025-08-12 17:06:45','',NULL,'æ­£å¸¸çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (7,2,'åœç”¨','1','sys_normal_disable','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'åœç”¨çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,1,'æ­£å¸¸','0','sys_job_status','','primary','Y','0','admin','2025-08-12 17:06:45','',NULL,'æ­£å¸¸çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (9,2,'æš‚åœ','1','sys_job_status','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'åœç”¨çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (10,1,'é»˜è®¤','DEFAULT','sys_job_group','','','Y','0','admin','2025-08-12 17:06:45','',NULL,'é»˜è®¤åˆ†ç»„');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (11,2,'ç³»ç»Ÿ','SYSTEM','sys_job_group','','','N','0','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿåˆ†ç»„');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (12,1,'æ˜¯','Y','sys_yes_no','','primary','Y','0','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿé»˜è®¤æ˜¯');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (13,2,'å¦','N','sys_yes_no','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿé»˜è®¤å¦');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (14,1,'é€šçŸ¥','1','sys_notice_type','','warning','Y','0','admin','2025-08-12 17:06:45','',NULL,'é€šçŸ¥');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (15,2,'å…¬å‘Š','2','sys_notice_type','','success','N','0','admin','2025-08-12 17:06:45','',NULL,'å…¬å‘Š');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (16,1,'æ­£å¸¸','0','sys_notice_status','','primary','Y','0','admin','2025-08-12 17:06:45','',NULL,'æ­£å¸¸çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (17,2,'å…³é—­','1','sys_notice_status','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'å…³é—­çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (18,99,'å…¶ä»–','0','sys_oper_type','','info','N','0','admin','2025-08-12 17:06:45','',NULL,'å…¶ä»–æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (19,1,'æ–°å¢','1','sys_oper_type','','info','N','0','admin','2025-08-12 17:06:45','',NULL,'æ–°å¢æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (20,2,'ä¿®æ”¹','2','sys_oper_type','','info','N','0','admin','2025-08-12 17:06:45','',NULL,'ä¿®æ”¹æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (21,3,'åˆ é™¤','3','sys_oper_type','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'åˆ é™¤æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (22,4,'æˆæƒ','4','sys_oper_type','','primary','N','0','admin','2025-08-12 17:06:45','',NULL,'æˆæƒæ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (23,5,'å¯¼å‡º','5','sys_oper_type','','warning','N','0','admin','2025-08-12 17:06:45','',NULL,'å¯¼å‡ºæ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (24,6,'å¯¼å…¥','6','sys_oper_type','','warning','N','0','admin','2025-08-12 17:06:45','',NULL,'å¯¼å…¥æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (25,7,'å¼ºé€€','7','sys_oper_type','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'å¼ºé€€æ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (26,8,'ç”Ÿæˆä»£ç ','8','sys_oper_type','','warning','N','0','admin','2025-08-12 17:06:45','',NULL,'ç”Ÿæˆæ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (27,9,'æ¸…ç©ºæ•°æ®','9','sys_oper_type','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'æ¸…ç©ºæ“ä½œ');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (28,1,'æˆåŠŸ','0','sys_common_status','','primary','N','0','admin','2025-08-12 17:06:45','',NULL,'æ­£å¸¸çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (29,2,'å¤±è´¥','1','sys_common_status','','danger','N','0','admin','2025-08-12 17:06:45','',NULL,'åœç”¨çŠ¶æ€');
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (100,0,'ç³»ç»ŸæŒ‡å®š','fixed','exp_data_type',NULL,'default','N','0','admin','2024-03-12 09:04:46','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (101,0,'åŠ¨æ€é€‰æ‹©','dynamic','exp_data_type',NULL,'default','N','0','admin','2024-03-12 09:05:02','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (104,0,'ä»»åŠ¡ç›‘å¬','1','sys_listener_type',NULL,'default','N','0','admin','2022-12-25 11:47:26','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (105,2,'æ‰§è¡Œç›‘å¬','2','sys_listener_type',NULL,'default','N','0','admin','2022-12-25 11:47:37','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (106,0,'JAVAç±»','classListener','sys_listener_value_type',NULL,'default','N','0','admin','2022-12-25 11:48:55','admin','2024-09-05 21:38:02',NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (107,0,'è¡¨è¾¾å¼','expressionListener','sys_listener_value_type',NULL,'default','N','0','admin','2022-12-25 11:49:05','admin','2024-09-05 21:38:10',NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (108,0,'ä»£ç†è¡¨è¾¾å¼','delegateExpressionListener','sys_listener_value_type',NULL,'default','N','0','admin','2022-12-25 11:49:16','admin','2024-09-05 21:38:16',NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (109,0,'è¯·å‡','leave','sys_process_category',NULL,'default','N','0','admin','2024-03-12 09:08:42','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (110,0,'æŠ¥é”€','expense','sys_process_category',NULL,'default','N','0','admin','2024-03-12 09:09:02','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (111,0,'æœè£…','æœè£…','f_goods_type',NULL,'primary','N','0','admin','2025-11-07 21:40:25','',NULL,NULL);
insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (112,1,'é‹å¸½','é‹å¸½','f_goods_type',NULL,'primary','N','0','admin','2025-11-07 21:40:45','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'å­—å…¸ä¸»é”®',
  `dict_name` varchar(100) DEFAULT '' COMMENT 'å­—å…¸åç§°',
  `dict_type` varchar(100) DEFAULT '' COMMENT 'å­—å…¸ç±»å‹',
  `status` char(1) DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å­—å…¸ç±»å‹è¡¨';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ç”¨æˆ·æ€§åˆ«','sys_user_sex','0','admin','2025-08-12 17:06:45','',NULL,'ç”¨æˆ·æ€§åˆ«åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'èœå•çŠ¶æ€','sys_show_hide','0','admin','2025-08-12 17:06:45','',NULL,'èœå•çŠ¶æ€åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'ç³»ç»Ÿå¼€å…³','sys_normal_disable','0','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿå¼€å…³åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'ä»»åŠ¡çŠ¶æ€','sys_job_status','0','admin','2025-08-12 17:06:45','',NULL,'ä»»åŠ¡çŠ¶æ€åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (5,'ä»»åŠ¡åˆ†ç»„','sys_job_group','0','admin','2025-08-12 17:06:45','',NULL,'ä»»åŠ¡åˆ†ç»„åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (6,'ç³»ç»Ÿæ˜¯å¦','sys_yes_no','0','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿæ˜¯å¦åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (7,'é€šçŸ¥ç±»å‹','sys_notice_type','0','admin','2025-08-12 17:06:45','',NULL,'é€šçŸ¥ç±»å‹åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (8,'é€šçŸ¥çŠ¶æ€','sys_notice_status','0','admin','2025-08-12 17:06:45','',NULL,'é€šçŸ¥çŠ¶æ€åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (9,'æ“ä½œç±»å‹','sys_oper_type','0','admin','2025-08-12 17:06:45','',NULL,'æ“ä½œç±»å‹åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (10,'ç³»ç»ŸçŠ¶æ€','sys_common_status','0','admin','2025-08-12 17:06:45','',NULL,'ç™»å½•çŠ¶æ€åˆ—è¡¨');
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (100,'è¡¨è¾¾å¼ç±»å‹','exp_data_type','0','admin','2024-03-12 09:03:02','',NULL,NULL);
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (102,'ç›‘å¬ç±»å‹','sys_listener_type','0','admin','2022-12-18 22:03:07','',NULL,NULL);
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (103,'ç›‘å¬å€¼ç±»å‹','sys_listener_value_type','0','admin','2022-12-18 22:03:39','',NULL,NULL);
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (104,'ç›‘å¬å±æ€§','sys_listener_event_type','0','admin','2022-12-18 22:04:29','',NULL,NULL);
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (105,'æµç¨‹åˆ†ç±»','sys_process_category','0','admin','2024-03-12 09:08:18','',NULL,NULL);
insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (106,'å•†å“ç±»å‹','f_goods_type','0','admin','2025-11-07 21:39:36','',NULL,NULL);

/*Table structure for table `sys_expression` */

DROP TABLE IF EXISTS `sys_expression`;

CREATE TABLE `sys_expression` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è¡¨å•ä¸»é”®',
  `name` varchar(50) DEFAULT NULL COMMENT 'è¡¨è¾¾å¼åç§°',
  `expression` varchar(255) DEFAULT NULL COMMENT 'è¡¨è¾¾å¼å†…å®¹',
  `data_type` varchar(255) DEFAULT NULL COMMENT 'è¡¨è¾¾å¼ç±»å‹',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºäººå‘˜',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°äººå‘˜',
  `status` tinyint(2) DEFAULT '0' COMMENT 'çŠ¶æ€',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æµç¨‹è¡¨è¾¾å¼';

/*Data for the table `sys_expression` */

/*Table structure for table `sys_form` */

DROP TABLE IF EXISTS `sys_form`;

CREATE TABLE `sys_form` (
  `form_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è¡¨å•ä¸»é”®',
  `form_name` varchar(50) DEFAULT NULL COMMENT 'è¡¨å•åç§°',
  `form_content` longtext COMMENT 'è¡¨å•å†…å®¹',
  `form_router` varchar(255) DEFAULT NULL COMMENT 'è¡¨å•è·¯ç”±',
  `form_submit` varchar(255) DEFAULT NULL COMMENT 'è¡¨å•æäº¤æ–¹æ³•',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºäººå‘˜',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°äººå‘˜',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`form_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3940 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æµç¨‹è¡¨å•';

/*Data for the table `sys_form` */

insert  into `sys_form`(`form_id`,`form_name`,`form_content`,`form_router`,`form_submit`,`create_time`,`update_time`,`create_by`,`update_by`,`remark`) values (3938,'è¯·å‡','{\"widgetList\":[{\"key\":76449,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"å•Šå•Š\",\"label\":\"è¯·å‡äºº\",\"labelAlign\":\"label-left-align\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":true,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input54555\"},{\"key\":16515,\"type\":\"input\",\"icon\":\"text-field\",\"formItemFlag\":true,\"options\":{\"name\":\"input46537\",\"label\":\"è¯·å‡ç†ç”±\",\"labelAlign\":\"\",\"type\":\"text\",\"defaultValue\":\"\",\"placeholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"showPassword\":false,\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":[],\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"minLength\":null,\"maxLength\":null,\"showWordLimit\":false,\"prefixIcon\":\"\",\"suffixIcon\":\"\",\"appendButton\":false,\"appendButtonDisabled\":false,\"buttonIcon\":\"custom-search\",\"onCreated\":\"\",\"onMounted\":\"\",\"onInput\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\",\"onAppendButtonClick\":\"\"},\"id\":\"input46537\"},{\"key\":64684,\"type\":\"date-range\",\"icon\":\"date-range-field\",\"formItemFlag\":true,\"options\":{\"name\":\"daterange83468\",\"label\":\"è¯·å‡èŒƒå›´\",\"labelAlign\":\"\",\"type\":\"daterange\",\"defaultValue\":null,\"startPlaceholder\":\"\",\"endPlaceholder\":\"\",\"columnWidth\":\"200px\",\"size\":\"\",\"autoFullWidth\":true,\"labelWidth\":null,\"labelHidden\":false,\"readonly\":false,\"disabled\":false,\"hidden\":false,\"clearable\":true,\"editable\":false,\"format\":\"YYYY-MM-DD\",\"valueFormat\":\"YYYY-MM-DD\",\"required\":false,\"requiredHint\":\"\",\"validation\":\"\",\"validationHint\":\"\",\"customClass\":\"\",\"labelIconClass\":null,\"labelIconPosition\":\"rear\",\"labelTooltip\":null,\"onCreated\":\"\",\"onMounted\":\"\",\"onChange\":\"\",\"onFocus\":\"\",\"onBlur\":\"\",\"onValidate\":\"\"},\"id\":\"daterange83468\"}],\"formConfig\":{\"modelName\":\"formData\",\"refName\":\"vForm\",\"rulesName\":\"rules\",\"labelWidth\":80,\"labelPosition\":\"left\",\"size\":\"\",\"labelAlign\":\"label-left-align\",\"cssCode\":\"\",\"customClass\":\"\",\"functions\":\"\",\"layoutType\":\"PC\",\"jsonVersion\":3,\"onFormCreated\":\"\",\"onFormMounted\":\"\",\"onFormDataChange\":\"\",\"onFormValidate\":\"\"}}',NULL,NULL,'2025-08-18 15:25:40',NULL,NULL,NULL,'1');
insert  into `sys_form`(`form_id`,`form_name`,`form_content`,`form_router`,`form_submit`,`create_time`,`update_time`,`create_by`,`update_by`,`remark`) values (3939,'è¯·å‡å¤–éƒ¨é¡µé¢',NULL,'/qingjia','qingjiaServiceImpl.insert(Qingjia qingjia)','2025-08-18 15:40:10',NULL,NULL,NULL,'');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä»»åŠ¡ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'ä»»åŠ¡åç§°',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT 'ä»»åŠ¡ç»„å',
  `invoke_target` varchar(500) NOT NULL COMMENT 'è°ƒç”¨ç›®æ ‡å­—ç¬¦ä¸²',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cronæ‰§è¡Œè¡¨è¾¾å¼',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT 'è®¡åˆ’æ‰§è¡Œé”™è¯¯ç­–ç•¥ï¼ˆ1ç«‹å³æ‰§è¡Œ 2æ‰§è¡Œä¸€æ¬¡ 3æ”¾å¼ƒæ‰§è¡Œï¼‰',
  `concurrent` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦å¹¶å‘æ‰§è¡Œï¼ˆ0å…è®¸ 1ç¦æ­¢ï¼‰',
  `status` char(1) DEFAULT '0' COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1æš‚åœï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT '' COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å®šæ—¶ä»»åŠ¡è°ƒåº¦è¡¨';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ç³»ç»Ÿé»˜è®¤ï¼ˆæ— å‚ï¼‰','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'ç³»ç»Ÿé»˜è®¤ï¼ˆæœ‰å‚ï¼‰','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'ç³»ç»Ÿé»˜è®¤ï¼ˆå¤šå‚ï¼‰','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-08-12 17:06:45','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ä»»åŠ¡æ—¥å¿—ID',
  `job_name` varchar(64) NOT NULL COMMENT 'ä»»åŠ¡åç§°',
  `job_group` varchar(64) NOT NULL COMMENT 'ä»»åŠ¡ç»„å',
  `invoke_target` varchar(500) NOT NULL COMMENT 'è°ƒç”¨ç›®æ ‡å­—ç¬¦ä¸²',
  `job_message` varchar(500) DEFAULT NULL COMMENT 'æ—¥å¿—ä¿¡æ¯',
  `status` char(1) DEFAULT '0' COMMENT 'æ‰§è¡ŒçŠ¶æ€ï¼ˆ0æ­£å¸¸ 1å¤±è´¥ï¼‰',
  `exception_info` varchar(2000) DEFAULT '' COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å®šæ—¶ä»»åŠ¡è°ƒåº¦æ—¥å¿—è¡¨';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_listener` */

DROP TABLE IF EXISTS `sys_listener`;

CREATE TABLE `sys_listener` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è¡¨å•ä¸»é”®',
  `name` varchar(128) DEFAULT NULL COMMENT 'åç§°',
  `type` char(2) DEFAULT NULL COMMENT 'ç›‘å¬ç±»å‹',
  `event_type` varchar(32) DEFAULT NULL COMMENT 'äº‹ä»¶ç±»å‹',
  `value_type` varchar(32) DEFAULT NULL COMMENT 'å€¼ç±»å‹',
  `value` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œå†…å®¹',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'åˆ›å»ºäººå‘˜',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'æ›´æ–°äººå‘˜',
  `status` tinyint(2) DEFAULT '0' COMMENT 'çŠ¶æ€',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æµç¨‹ç›‘å¬';

/*Data for the table `sys_listener` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è®¿é—®ID',
  `user_name` varchar(50) DEFAULT '' COMMENT 'ç”¨æˆ·è´¦å·',
  `ipaddr` varchar(128) DEFAULT '' COMMENT 'ç™»å½•IPåœ°å€',
  `login_location` varchar(255) DEFAULT '' COMMENT 'ç™»å½•åœ°ç‚¹',
  `browser` varchar(50) DEFAULT '' COMMENT 'æµè§ˆå™¨ç±»å‹',
  `os` varchar(50) DEFAULT '' COMMENT 'æ“ä½œç³»ç»Ÿ',
  `status` char(1) DEFAULT '0' COMMENT 'ç™»å½•çŠ¶æ€ï¼ˆ0æˆåŠŸ 1å¤±è´¥ï¼‰',
  `msg` varchar(255) DEFAULT '' COMMENT 'æç¤ºæ¶ˆæ¯',
  `login_time` datetime DEFAULT NULL COMMENT 'è®¿é—®æ—¶é—´',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ç³»ç»Ÿè®¿é—®è®°å½•';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values (1,'admin','127.0.0.1','å†…ç½‘IP','Chrome 14','Windows 10','0','ç™»å½•æˆåŠŸ','2025-11-07 21:23:26');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'èœå•ID',
  `menu_name` varchar(50) NOT NULL COMMENT 'èœå•åç§°',
  `parent_id` bigint(20) DEFAULT '0' COMMENT 'çˆ¶èœå•ID',
  `order_num` int(4) DEFAULT '0' COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `path` varchar(200) DEFAULT '' COMMENT 'è·¯ç”±åœ°å€',
  `component` varchar(255) DEFAULT NULL COMMENT 'ç»„ä»¶è·¯å¾„',
  `query` varchar(255) DEFAULT NULL COMMENT 'è·¯ç”±å‚æ•°',
  `route_name` varchar(50) DEFAULT '' COMMENT 'è·¯ç”±åç§°',
  `is_frame` int(1) DEFAULT '1' COMMENT 'æ˜¯å¦ä¸ºå¤–é“¾ï¼ˆ0æ˜¯ 1å¦ï¼‰',
  `is_cache` int(1) DEFAULT '0' COMMENT 'æ˜¯å¦ç¼“å­˜ï¼ˆ0ç¼“å­˜ 1ä¸ç¼“å­˜ï¼‰',
  `menu_type` char(1) DEFAULT '' COMMENT 'èœå•ç±»å‹ï¼ˆMç›®å½• Cèœå• FæŒ‰é’®ï¼‰',
  `visible` char(1) DEFAULT '0' COMMENT 'èœå•çŠ¶æ€ï¼ˆ0æ˜¾ç¤º 1éšè—ï¼‰',
  `status` char(1) DEFAULT '0' COMMENT 'èœå•çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `perms` varchar(100) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `icon` varchar(100) DEFAULT '#' COMMENT 'èœå•å›¾æ ‡',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT '' COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2056 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='èœå•æƒé™è¡¨';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ç³»ç»Ÿç®¡ç†',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿç®¡ç†ç›®å½•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'ç³»ç»Ÿç›‘æ§',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿç›‘æ§ç›®å½•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'ç³»ç»Ÿå·¥å…·',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-08-12 17:06:45','',NULL,'ç³»ç»Ÿå·¥å…·ç›®å½•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (100,'ç”¨æˆ·ç®¡ç†',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-08-12 17:06:45','',NULL,'ç”¨æˆ·ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (101,'è§’è‰²ç®¡ç†',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-08-12 17:06:45','',NULL,'è§’è‰²ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (102,'èœå•ç®¡ç†',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-08-12 17:06:45','',NULL,'èœå•ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (103,'éƒ¨é—¨ç®¡ç†',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-08-12 17:06:45','',NULL,'éƒ¨é—¨ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (104,'å²—ä½ç®¡ç†',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-08-12 17:06:45','',NULL,'å²—ä½ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (105,'å­—å…¸ç®¡ç†',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-08-12 17:06:45','',NULL,'å­—å…¸ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (106,'å‚æ•°è®¾ç½®',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-08-12 17:06:45','',NULL,'å‚æ•°è®¾ç½®èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (107,'é€šçŸ¥å…¬å‘Š',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-08-12 17:06:45','',NULL,'é€šçŸ¥å…¬å‘Šèœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (108,'æ—¥å¿—ç®¡ç†',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-08-12 17:06:45','',NULL,'æ—¥å¿—ç®¡ç†èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (109,'åœ¨çº¿ç”¨æˆ·',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-08-12 17:06:45','',NULL,'åœ¨çº¿ç”¨æˆ·èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (110,'å®šæ—¶ä»»åŠ¡',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-08-12 17:06:45','',NULL,'å®šæ—¶ä»»åŠ¡èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (111,'æ•°æ®ç›‘æ§',2,3,'druid','monitor/druid/index','','',1,0,'C','1','1','monitor:druid:list','druid','admin','2025-08-12 17:06:45','admin','2025-08-14 15:12:30','æ•°æ®ç›‘æ§èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (112,'æœåŠ¡ç›‘æ§',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-08-12 17:06:45','',NULL,'æœåŠ¡ç›‘æ§èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (113,'ç¼“å­˜ç›‘æ§',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-08-12 17:06:45','',NULL,'ç¼“å­˜ç›‘æ§èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (114,'ç¼“å­˜åˆ—è¡¨',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-08-12 17:06:45','',NULL,'ç¼“å­˜åˆ—è¡¨èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (115,'è¡¨å•æ„å»º',3,1,'build','tool/build/index','','',1,0,'C','1','1','tool:build:list','build','admin','2025-08-12 17:06:45','admin','2025-08-14 15:11:56','è¡¨å•æ„å»ºèœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (116,'ä»£ç ç”Ÿæˆ',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-08-12 17:06:45','',NULL,'ä»£ç ç”Ÿæˆèœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (117,'ç³»ç»Ÿæ¥å£',3,3,'swagger','tool/swagger/index','','',1,0,'C','1','1','tool:swagger:list','swagger','admin','2025-08-12 17:06:45','admin','2025-08-14 15:12:01','ç³»ç»Ÿæ¥å£èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (500,'æ“ä½œæ—¥å¿—',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-08-12 17:06:45','',NULL,'æ“ä½œæ—¥å¿—èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (501,'ç™»å½•æ—¥å¿—',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-08-12 17:06:45','',NULL,'ç™»å½•æ—¥å¿—èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1000,'ç”¨æˆ·æŸ¥è¯¢',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1001,'ç”¨æˆ·æ–°å¢',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1002,'ç”¨æˆ·ä¿®æ”¹',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1003,'ç”¨æˆ·åˆ é™¤',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1004,'ç”¨æˆ·å¯¼å‡º',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1005,'ç”¨æˆ·å¯¼å…¥',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1006,'é‡ç½®å¯†ç ',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1007,'è§’è‰²æŸ¥è¯¢',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1008,'è§’è‰²æ–°å¢',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1009,'è§’è‰²ä¿®æ”¹',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1010,'è§’è‰²åˆ é™¤',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1011,'è§’è‰²å¯¼å‡º',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1012,'èœå•æŸ¥è¯¢',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1013,'èœå•æ–°å¢',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1014,'èœå•ä¿®æ”¹',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1015,'èœå•åˆ é™¤',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1016,'éƒ¨é—¨æŸ¥è¯¢',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1017,'éƒ¨é—¨æ–°å¢',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1018,'éƒ¨é—¨ä¿®æ”¹',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1019,'éƒ¨é—¨åˆ é™¤',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1020,'å²—ä½æŸ¥è¯¢',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1021,'å²—ä½æ–°å¢',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1022,'å²—ä½ä¿®æ”¹',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1023,'å²—ä½åˆ é™¤',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1024,'å²—ä½å¯¼å‡º',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1025,'å­—å…¸æŸ¥è¯¢',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1026,'å­—å…¸æ–°å¢',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1027,'å­—å…¸ä¿®æ”¹',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1028,'å­—å…¸åˆ é™¤',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1029,'å­—å…¸å¯¼å‡º',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1030,'å‚æ•°æŸ¥è¯¢',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1031,'å‚æ•°æ–°å¢',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1032,'å‚æ•°ä¿®æ”¹',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1033,'å‚æ•°åˆ é™¤',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1034,'å‚æ•°å¯¼å‡º',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1035,'å…¬å‘ŠæŸ¥è¯¢',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1036,'å…¬å‘Šæ–°å¢',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1037,'å…¬å‘Šä¿®æ”¹',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1038,'å…¬å‘Šåˆ é™¤',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1039,'æ“ä½œæŸ¥è¯¢',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1040,'æ“ä½œåˆ é™¤',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1041,'æ—¥å¿—å¯¼å‡º',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1042,'ç™»å½•æŸ¥è¯¢',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1043,'ç™»å½•åˆ é™¤',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1044,'æ—¥å¿—å¯¼å‡º',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1045,'è´¦æˆ·è§£é”',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1046,'åœ¨çº¿æŸ¥è¯¢',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1047,'æ‰¹é‡å¼ºé€€',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1048,'å•æ¡å¼ºé€€',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1049,'ä»»åŠ¡æŸ¥è¯¢',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1050,'ä»»åŠ¡æ–°å¢',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1051,'ä»»åŠ¡ä¿®æ”¹',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1052,'ä»»åŠ¡åˆ é™¤',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1053,'çŠ¶æ€ä¿®æ”¹',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1054,'ä»»åŠ¡å¯¼å‡º',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1055,'ç”ŸæˆæŸ¥è¯¢',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1056,'ç”Ÿæˆä¿®æ”¹',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1057,'ç”Ÿæˆåˆ é™¤',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1058,'å¯¼å…¥ä»£ç ',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1059,'é¢„è§ˆä»£ç ',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1060,'ç”Ÿæˆä»£ç ',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2020,'æµç¨‹ç®¡ç†',0,6,'flowable',NULL,NULL,NULL,1,0,'M','0','0','','cascader','tony','2021-03-25 11:35:09','admin','2022-12-29 17:39:22','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2022,'æµç¨‹å®šä¹‰',2020,2,'definition','flowable/definition/index',NULL,NULL,1,0,'C','0','0','','job','tony','2021-03-25 13:53:55','admin','2022-12-29 17:40:39','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2023,'ä»»åŠ¡ç®¡ç†',0,7,'task',NULL,NULL,NULL,1,0,'M','0','0','','dict','tony','2021-03-26 10:53:10','admin','2021-03-29 09:37:40','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2024,'å¾…åŠä»»åŠ¡',2023,2,'todo','flowable/task/todo/index',NULL,NULL,1,1,'C','0','0','','cascader','admin','2021-03-26 10:55:52','admin','2021-03-30 09:26:36','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2025,'å·²åŠä»»åŠ¡',2023,3,'finished','flowable/task/finished/index',NULL,NULL,1,1,'C','0','0','','time-range','admin','2021-03-26 10:57:54','admin','2021-03-30 09:26:50','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2026,'å·²å‘ä»»åŠ¡',2023,1,'process','flowable/task/myProcess/index',NULL,NULL,1,1,'C','0','0','','guide','admin','2021-03-30 09:26:23','admin','2022-12-12 09:58:07','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2027,'è¡¨å•é…ç½®',2020,2,'form','flowable/task/form/index',NULL,NULL,1,1,'C','0','0','flowable:form:list','form','admin','2021-03-30 22:55:12','admin','2023-08-19 15:54:57','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2028,'æ–°å¢',2027,1,'',NULL,NULL,NULL,1,0,'F','0','0','flowable:form:add','#','admin','2021-07-07 14:23:37','admin','2023-08-16 09:17:38','');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2029,'åˆ é™¤',2027,3,'',NULL,NULL,NULL,1,0,'F','0','0','flowable:form:remove','#','admin','2021-07-07 14:24:10','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2030,'ç¼–è¾‘',2027,2,'',NULL,NULL,NULL,1,0,'F','0','0','flowable:form:edit','#','admin','2021-07-07 14:24:31','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2031,'æ–°å¢',2026,1,'',NULL,NULL,NULL,1,0,'F','0','0','system:deployment:add','#','admin','2021-07-07 14:25:22','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2032,'ç¼–è¾‘',2026,2,'',NULL,NULL,NULL,1,0,'F','0','0','system:deployment:edit','#','admin','2021-07-07 14:25:47','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2033,'åˆ é™¤',2026,3,'',NULL,NULL,NULL,1,0,'F','0','0','system:deployment:remove','#','admin','2021-07-07 14:26:02','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2034,'æŸ¥è¯¢',2027,4,'',NULL,NULL,NULL,1,0,'F','0','0','flowable:form:query','#','admin','2021-07-08 14:05:22','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2035,'ä¿®æ”¹å¯†ç ',100,8,'',NULL,NULL,NULL,1,0,'F','0','0','system:user:updatePwd','#','admin','2022-04-29 11:27:13','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2036,'æµç¨‹è¡¨è¾¾å¼',2020,3,'expression','flowable/expression/index',NULL,NULL,1,1,'C','0','0','system:expression:list','list','admin','2022-12-12 17:12:19','admin','2022-12-12 17:13:44','æµç¨‹è¾¾å¼èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2037,'æµç¨‹è¾¾å¼æŸ¥è¯¢',2036,1,'#','',NULL,NULL,1,0,'F','0','0','system:expression:query','#','admin','2022-12-12 17:12:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2038,'æµç¨‹è¾¾å¼æ–°å¢',2036,2,'#','',NULL,NULL,1,0,'F','0','0','system:expression:add','#','admin','2022-12-12 17:12:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2039,'æµç¨‹è¾¾å¼ä¿®æ”¹',2036,3,'#','',NULL,NULL,1,0,'F','0','0','system:expression:edit','#','admin','2022-12-12 17:12:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2040,'æµç¨‹è¾¾å¼åˆ é™¤',2036,4,'#','',NULL,NULL,1,0,'F','0','0','system:expression:remove','#','admin','2022-12-12 17:12:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2041,'æµç¨‹è¾¾å¼å¯¼å‡º',2036,5,'#','',NULL,NULL,1,0,'F','0','0','system:expression:export','#','admin','2022-12-12 17:12:19','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2042,'æµç¨‹ç›‘å¬',2020,4,'listener','flowable/listener/index',NULL,NULL,1,0,'C','0','0','system:listener:list','monitor','admin','2022-12-25 11:44:16','admin','2022-12-29 08:59:21','æµç¨‹ç›‘å¬èœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2043,'æµç¨‹ç›‘å¬æŸ¥è¯¢',2042,1,'#','',NULL,NULL,1,0,'F','0','0','system:listener:query','#','admin','2022-12-25 11:44:16','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2044,'æµç¨‹ç›‘å¬æ–°å¢',2042,2,'#','',NULL,NULL,1,0,'F','0','0','system:listener:add','#','admin','2022-12-25 11:44:16','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2045,'æµç¨‹ç›‘å¬ä¿®æ”¹',2042,3,'#','',NULL,NULL,1,0,'F','0','0','system:listener:edit','#','admin','2022-12-25 11:44:16','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2046,'æµç¨‹ç›‘å¬åˆ é™¤',2042,4,'#','',NULL,NULL,1,0,'F','0','0','system:listener:remove','#','admin','2022-12-25 11:44:16','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2047,'æµç¨‹ç›‘å¬å¯¼å‡º',2042,5,'#','',NULL,NULL,1,0,'F','0','0','system:listener:export','#','admin','2022-12-25 11:44:16','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2048,'qingjia',2023,1,'qingjia','system/qingjia/index',NULL,'',1,0,'C','0','0','system:qingjia:list','#','admin','2025-08-26 11:57:45','',NULL,'qingjiaèœå•');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2049,'qingjiaæŸ¥è¯¢',2048,1,'#','',NULL,'',1,0,'F','0','0','system:qingjia:query','#','admin','2025-08-26 11:57:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2050,'qingjiaæ–°å¢',2048,2,'#','',NULL,'',1,0,'F','0','0','system:qingjia:add','#','admin','2025-08-26 11:57:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2051,'qingjiaä¿®æ”¹',2048,3,'#','',NULL,'',1,0,'F','0','0','system:qingjia:edit','#','admin','2025-08-26 11:57:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2052,'qingjiaåˆ é™¤',2048,4,'#','',NULL,'',1,0,'F','0','0','system:qingjia:remove','#','admin','2025-08-26 11:57:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2053,'qingjiaå¯¼å‡º',2048,5,'#','',NULL,'',1,0,'F','0','0','system:qingjia:export','#','admin','2025-08-26 11:57:45','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2054,'æˆ‘çš„ç³»ç»Ÿ',0,0,'sxgpra',NULL,NULL,'',1,0,'M','0','0',NULL,'dashboard','admin','2025-11-07 21:28:18','',NULL,'');
insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2055,'å•†å“ç®¡ç†',2054,1,'sxgpraGoods','sxgpra/goods/index',NULL,'',1,0,'C','0','0',NULL,'example','admin','2025-11-07 21:31:03','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'å…¬å‘ŠID',
  `notice_title` varchar(50) NOT NULL COMMENT 'å…¬å‘Šæ ‡é¢˜',
  `notice_type` char(1) NOT NULL COMMENT 'å…¬å‘Šç±»å‹ï¼ˆ1é€šçŸ¥ 2å…¬å‘Šï¼‰',
  `notice_content` longblob COMMENT 'å…¬å‘Šå†…å®¹',
  `status` char(1) DEFAULT '0' COMMENT 'å…¬å‘ŠçŠ¶æ€ï¼ˆ0æ­£å¸¸ 1å…³é—­ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='é€šçŸ¥å…¬å‘Šè¡¨';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'æ¸©é¦¨æé†’ï¼š2018-07-01 è‹¥ä¾æ–°ç‰ˆæœ¬å‘å¸ƒå•¦','2','æ–°ç‰ˆæœ¬å†…å®¹','0','admin','2025-08-12 17:06:45','',NULL,'ç®¡ç†å‘˜');
insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'ç»´æŠ¤é€šçŸ¥ï¼š2018-07-01 è‹¥ä¾ç³»ç»Ÿå‡Œæ™¨ç»´æŠ¤','1','ç»´æŠ¤å†…å®¹','0','admin','2025-08-12 17:06:45','',NULL,'ç®¡ç†å‘˜');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'æ—¥å¿—ä¸»é”®',
  `title` varchar(50) DEFAULT '' COMMENT 'æ¨¡å—æ ‡é¢˜',
  `business_type` int(2) DEFAULT '0' COMMENT 'ä¸šåŠ¡ç±»å‹ï¼ˆ0å…¶å®ƒ 1æ–°å¢ 2ä¿®æ”¹ 3åˆ é™¤ï¼‰',
  `method` varchar(200) DEFAULT '' COMMENT 'æ–¹æ³•åç§°',
  `request_method` varchar(10) DEFAULT '' COMMENT 'è¯·æ±‚æ–¹å¼',
  `operator_type` int(1) DEFAULT '0' COMMENT 'æ“ä½œç±»åˆ«ï¼ˆ0å…¶å®ƒ 1åå°ç”¨æˆ· 2æ‰‹æœºç«¯ç”¨æˆ·ï¼‰',
  `oper_name` varchar(50) DEFAULT '' COMMENT 'æ“ä½œäººå‘˜',
  `dept_name` varchar(50) DEFAULT '' COMMENT 'éƒ¨é—¨åç§°',
  `oper_url` varchar(255) DEFAULT '' COMMENT 'è¯·æ±‚URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT 'ä¸»æœºåœ°å€',
  `oper_location` varchar(255) DEFAULT '' COMMENT 'æ“ä½œåœ°ç‚¹',
  `oper_param` varchar(2000) DEFAULT '' COMMENT 'è¯·æ±‚å‚æ•°',
  `json_result` varchar(2000) DEFAULT '' COMMENT 'è¿”å›å‚æ•°',
  `status` int(1) DEFAULT '0' COMMENT 'æ“ä½œçŠ¶æ€ï¼ˆ0æ­£å¸¸ 1å¼‚å¸¸ï¼‰',
  `error_msg` varchar(2000) DEFAULT '' COMMENT 'é”™è¯¯æ¶ˆæ¯',
  `oper_time` datetime DEFAULT NULL COMMENT 'æ“ä½œæ—¶é—´',
  `cost_time` bigint(20) DEFAULT '0' COMMENT 'æ¶ˆè€—æ—¶é—´',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='æ“ä½œæ—¥å¿—è®°å½•';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (1,'èœå•ç®¡ç†',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"æˆ‘çš„ç³»ç»Ÿ\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"sxgpra\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:28:18',174);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (2,'èœå•ç®¡ç†',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/menu','127.0.0.1','å†…ç½‘IP','{\"children\":[],\"component\":\"sxgpra/goods/index\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"å•†å“ç®¡ç†\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2054,\"path\":\"sxgpraGoods\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:31:03',277);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (3,'å•†å“ä¿¡æ¯',2,'com.sxgpra.goods.controller.GoodsController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/sxgpra/goods','127.0.0.1','å†…ç½‘IP','{\"delFlag\":\"0\",\"goodsInventory\":\"7\",\"goodsName\":\"test\",\"goodsPrice\":\"0\",\"goodsType\":\"test\",\"id\":\"1\",\"imgUrl\":\"/profile/upload/2025/11/07/ScreenShot_2025-09-26_110030_540_20251107213211A001.png\",\"params\":{},\"updateBy\":\"ç®¡ç†å‘˜\",\"updateName\":\"1\",\"updateTime\":\"2025-11-07 21:32:20\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:37:35',94);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (4,'å­—å…¸ç±»å‹',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/type','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"dictName\":\"å•†å“ç±»å‹\",\"dictType\":\"f_goods_type\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:39:36',321);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (5,'å­—å…¸æ•°æ®',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/data','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"æœè£…\",\"dictSort\":0,\"dictType\":\"f_goods_type\",\"dictValue\":\"æœè£…\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:40:25',133);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (6,'å­—å…¸æ•°æ®',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','ç ”å‘éƒ¨é—¨','/system/dict/data','127.0.0.1','å†…ç½‘IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"é‹å¸½\",\"dictSort\":1,\"dictType\":\"f_goods_type\",\"dictValue\":\"é‹å¸½\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:40:46',160);
insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values (7,'å•†å“ä¿¡æ¯',2,'com.sxgpra.goods.controller.GoodsController.edit()','PUT',1,'admin','ç ”å‘éƒ¨é—¨','/sxgpra/goods','127.0.0.1','å†…ç½‘IP','{\"delFlag\":\"0\",\"goodsInventory\":\"7\",\"goodsName\":\"test\",\"goodsPrice\":\"0\",\"goodsType\":\"æœè£…\",\"id\":\"1\",\"imgUrl\":\"/profile/upload/2025/11/07/ScreenShot_2025-09-26_110030_540_20251107213211A001.png\",\"params\":{},\"updateBy\":\"ç®¡ç†å‘˜\",\"updateName\":\"1\",\"updateTime\":\"2025-11-07 21:35:50\"}','{\"msg\":\"æ“ä½œæˆåŠŸ\",\"code\":200}',0,NULL,'2025-11-07 21:41:05',189);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'å²—ä½ID',
  `post_code` varchar(64) NOT NULL COMMENT 'å²—ä½ç¼–ç ',
  `post_name` varchar(50) NOT NULL COMMENT 'å²—ä½åç§°',
  `post_sort` int(4) NOT NULL COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `status` char(1) NOT NULL COMMENT 'çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='å²—ä½ä¿¡æ¯è¡¨';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'ceo','è‘£äº‹é•¿',1,'0','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'se','é¡¹ç›®ç»ç†',2,'0','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'hr','äººåŠ›èµ„æº',3,'0','admin','2025-08-12 17:06:45','',NULL,'');
insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (4,'user','æ™®é€šå‘˜å·¥',4,'0','admin','2025-08-12 17:06:45','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'è§’è‰²ID',
  `role_name` varchar(30) NOT NULL COMMENT 'è§’è‰²åç§°',
  `role_key` varchar(100) NOT NULL COMMENT 'è§’è‰²æƒé™å­—ç¬¦ä¸²',
  `role_sort` int(4) NOT NULL COMMENT 'æ˜¾ç¤ºé¡ºåº',
  `data_scope` char(1) DEFAULT '1' COMMENT 'æ•°æ®èŒƒå›´ï¼ˆ1ï¼šå…¨éƒ¨æ•°æ®æƒé™ 2ï¼šè‡ªå®šæ•°æ®æƒé™ 3ï¼šæœ¬éƒ¨é—¨æ•°æ®æƒé™ 4ï¼šæœ¬éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®æƒé™ï¼‰',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'èœå•æ ‘é€‰æ‹©é¡¹æ˜¯å¦å…³è”æ˜¾ç¤º',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'éƒ¨é—¨æ ‘é€‰æ‹©é¡¹æ˜¯å¦å…³è”æ˜¾ç¤º',
  `status` char(1) NOT NULL COMMENT 'è§’è‰²çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='è§’è‰²ä¿¡æ¯è¡¨';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'è¶…çº§ç®¡ç†å‘˜','admin',1,'1',1,1,'0','0','admin','2025-08-12 17:06:45','',NULL,'è¶…çº§ç®¡ç†å‘˜');
insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,'æ™®é€šè§’è‰²','common',2,'2',1,1,'0','0','admin','2025-08-12 17:06:45','admin','2025-08-14 15:11:46','æ™®é€šè§’è‰²');
insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (3,'é¢†å¯¼ç»„','lead',0,'1',1,1,'0','0','admin','2025-08-14 07:57:59','',NULL,NULL);

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ID',
  `dept_id` bigint(20) NOT NULL COMMENT 'éƒ¨é—¨ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='è§’è‰²å’Œéƒ¨é—¨å…³è”è¡¨';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,100);
insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,101);
insert  into `sys_role_dept`(`role_id`,`dept_id`) values (2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ID',
  `menu_id` bigint(20) NOT NULL COMMENT 'èœå•ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='è§’è‰²å’Œèœå•å…³è”è¡¨';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,3);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,100);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,101);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,102);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,103);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,104);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,105);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,106);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,107);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,108);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,109);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,110);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,111);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,112);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,113);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,114);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,115);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,116);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,117);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,500);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,501);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1000);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1001);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1002);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1003);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1004);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1005);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1006);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1007);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1008);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1009);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1010);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1011);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1012);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1013);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1014);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1015);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1016);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1017);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1018);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1019);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1020);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1021);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1022);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1023);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1024);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1025);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1026);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1027);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1028);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1029);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1030);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1031);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1032);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1033);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1034);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1035);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1036);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1037);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1038);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1039);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1040);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1041);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1042);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1043);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1044);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1045);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1046);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1047);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1048);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1049);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1050);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1051);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1052);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1053);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1054);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1055);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1056);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1057);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1058);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1059);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,1060);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2020);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2022);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2023);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2024);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2025);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2026);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2027);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2028);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2029);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2030);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2031);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2032);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2033);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2034);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2036);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2037);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2038);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2039);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2040);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2041);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2042);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2043);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2044);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2045);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2046);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (2,2047);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2020);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2022);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2023);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2024);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2025);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2026);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2027);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2028);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2029);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2030);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2031);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2032);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2033);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2034);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2036);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2037);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2038);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2039);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2040);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2041);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2042);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2043);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2044);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2045);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2046);
insert  into `sys_role_menu`(`role_id`,`menu_id`) values (3,2047);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ç”¨æˆ·ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT 'éƒ¨é—¨ID',
  `user_name` varchar(30) NOT NULL COMMENT 'ç”¨æˆ·è´¦å·',
  `nick_name` varchar(30) NOT NULL COMMENT 'ç”¨æˆ·æ˜µç§°',
  `user_type` varchar(2) DEFAULT '00' COMMENT 'ç”¨æˆ·ç±»å‹ï¼ˆ00ç³»ç»Ÿç”¨æˆ·ï¼‰',
  `email` varchar(50) DEFAULT '' COMMENT 'ç”¨æˆ·é‚®ç®±',
  `phonenumber` varchar(11) DEFAULT '' COMMENT 'æ‰‹æœºå·ç ',
  `sex` char(1) DEFAULT '0' COMMENT 'ç”¨æˆ·æ€§åˆ«ï¼ˆ0ç”· 1å¥³ 2æœªçŸ¥ï¼‰',
  `avatar` varchar(100) DEFAULT '' COMMENT 'å¤´åƒåœ°å€',
  `password` varchar(100) DEFAULT '' COMMENT 'å¯†ç ',
  `status` char(1) DEFAULT '0' COMMENT 'å¸å·çŠ¶æ€ï¼ˆ0æ­£å¸¸ 1åœç”¨ï¼‰',
  `del_flag` char(1) DEFAULT '0' COMMENT 'åˆ é™¤æ ‡å¿—ï¼ˆ0ä»£è¡¨å­˜åœ¨ 2ä»£è¡¨åˆ é™¤ï¼‰',
  `login_ip` varchar(128) DEFAULT '' COMMENT 'æœ€åç™»å½•IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»å½•æ—¶é—´',
  `create_by` varchar(64) DEFAULT '' COMMENT 'åˆ›å»ºè€…',
  `create_time` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT '' COMMENT 'æ›´æ–°è€…',
  `update_time` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remark` varchar(500) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ç”¨æˆ·ä¿¡æ¯è¡¨';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,103,'admin','ç®¡ç†å‘˜','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-11-07 21:18:10','admin','2025-08-12 17:06:45','','2025-11-07 21:23:25','ç®¡ç†å‘˜');
insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (2,105,'ry','è‹¥ä¾','00','ry@qq.com','15666666666','1','','$2a$10$oJUdnl7iEoEYvpn77prvfugQNMpO23N8bqzgttNpaRA0uXEDKkkna','0','0','127.0.0.1','2025-08-20 08:20:27','admin','2025-08-12 17:06:45','admin','2025-08-20 08:20:27','æµ‹è¯•å‘˜');
insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (100,100,'ceshi1','æµ‹è¯•1','00','','','0','','$2a$10$0JKnO8An2YeOMBSTEmJ/R.b.uLUQo184rx55i97tDHE.MgBZ6Bd8q','0','0','127.0.0.1','2025-08-20 08:47:11','admin','2025-08-12 17:20:05','admin','2025-08-20 08:47:11',NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT 'ç”¨æˆ·ID',
  `post_id` bigint(20) NOT NULL COMMENT 'å²—ä½ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ç”¨æˆ·ä¸å²—ä½å…³è”è¡¨';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values (1,1);
insert  into `sys_user_post`(`user_id`,`post_id`) values (2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT 'ç”¨æˆ·ID',
  `role_id` bigint(20) NOT NULL COMMENT 'è§’è‰²ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='ç”¨æˆ·å’Œè§’è‰²å…³è”è¡¨';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1);
insert  into `sys_user_role`(`user_id`,`role_id`) values (2,3);
insert  into `sys_user_role`(`user_id`,`role_id`) values (100,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

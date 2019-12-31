/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : 127.0.0.1:3306
Source Database       : yxdb

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-11-30 22:51:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_package_desc
-- ----------------------------
DROP TABLE IF EXISTS `app_package_desc`;
CREATE TABLE `app_package_desc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `package_version_id` bigint(20) NOT NULL COMMENT '包版本id',
  `package_desc` varchar(255) NOT NULL COMMENT '包描述',
  `desc_index` tinyint(2) NOT NULL DEFAULT '0' COMMENT '描述index',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App包版本描述表';

-- ----------------------------
-- Records of app_package_desc
-- ----------------------------

-- ----------------------------
-- Table structure for app_package_version
-- ----------------------------
DROP TABLE IF EXISTS `app_package_version`;
CREATE TABLE `app_package_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_type` tinyint(2) NOT NULL COMMENT 'app类型，详见AppTypeEnum枚举',
  `package_version` varchar(64) NOT NULL COMMENT '包版本',
  `package_url` varchar(255) NOT NULL COMMENT '包下载地址',
  `upgrade_mode` tinyint(2) NOT NULL COMMENT '升级方式（枚举类：AppUpgradeModeEnum）',
  `version_status` tinyint(2) NOT NULL COMMENT '版本状态（枚举类：AppVersionStatusEnum）',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='App包版本表';

-- ----------------------------
-- Records of app_package_version
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_no` varchar(64) NOT NULL COMMENT '标的编号(原标的id)',
  `title` varchar(64) NOT NULL COMMENT '借款标题',
  `borrow_user_id` bigint(20) NOT NULL COMMENT '受托人id',
  `asset_type` tinyint(2) NOT NULL COMMENT '借款类型：1、安享系列；2、私享系列；详见字典表',
  `guarantee_id` bigint(20) NOT NULL COMMENT '保障机构id',
  `use_type` tinyint(2) NOT NULL COMMENT '借款用途：1、个人消费；2、短息周转；详见字典表',
  `is_activity` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否参与活动：1、是；0、否',
  `is_company` tinyint(2) NOT NULL COMMENT '是否为企业借款：1、是；0、否',
  `repurchase_mode` tinyint(2) NOT NULL COMMENT '还款方式：1、按月等额本息；2、按月先息后本；3、按日计息,到期还本息',
  `is_transfer` tinyint(2) NOT NULL COMMENT '是否可转让：1、是；0、否；',
  `product_amount` decimal(18,2) NOT NULL COMMENT '借款金额',
  `product_deadline` int(5) NOT NULL COMMENT '借款期限',
  `profit` decimal(18,6) NOT NULL COMMENT '年收益',
  `service_fee` decimal(18,6) DEFAULT NULL COMMENT '借款人服务费率',
  `stop_bid_amount` decimal(18,6) DEFAULT NULL COMMENT '截标金额',
  `stop_bid_time` datetime DEFAULT NULL COMMENT '截标时间',
  `bid_server_fee` decimal(18,6) DEFAULT NULL COMMENT '投资人服务费率',
  `time_count` int(11) NOT NULL COMMENT '招标天数',
  `min_bid_amount` decimal(18,2) NOT NULL COMMENT '最小投标金额',
  `max_bid_amount` decimal(18,2) DEFAULT NULL COMMENT '最大投标金额',
  `borrow_desc` text COMMENT '借款描述',
  `guarantee_desc` text COMMENT '反担保',
  `risk_desc` text COMMENT '风控描述',
  `product_status` tinyint(2) NOT NULL COMMENT '标地状态',
  `product_type` tinyint(2) NOT NULL COMMENT '标的类型',
  `bid_amount` decimal(18,6) DEFAULT '0.000000' COMMENT '已发起意向投标金额',
  `invest_begin_date` datetime DEFAULT NULL COMMENT '招标开始时间',
  `invest_end_date` datetime DEFAULT NULL COMMENT '招标结束时间',
  `root_product_id` bigint(20) DEFAULT NULL COMMENT '分债权首债权id',
  `full_bid_date` datetime DEFAULT NULL COMMENT '满标时间',
  `is_add_profit` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否加息，1：是；2：否；',
  `add_profit_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '加息出资方，1：借款人；2：平台；',
  `add_profit` decimal(18,2) DEFAULT NULL COMMENT '加息',
  `auto_loan` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否自动放款：0、手动；1、自动',
  `channel_flow` varchar(64) DEFAULT NULL COMMENT '流水号（终审产生）',
  `index_show` tinyint(2) NOT NULL DEFAULT '0' COMMENT '优先在首页显示：1、是；0、否',
  `product_rating` tinyint(2) DEFAULT NULL COMMENT '对应productRatingEnum枚举值',
  `is_del` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:有效；1、无效',
  `subject_no` varchar(32) DEFAULT NULL COMMENT '银行返回的标的编号',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '修改者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `advance_payment_user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '推荐方平台注册 id（垫付账户id）',
  `is_new_data` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否新系统数据：1、是；0、老系统数据',
  `source` tinyint(2) NOT NULL DEFAULT '1' COMMENT '标的来源：1、后台添加；2、流标产生；3、债权产生',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product_title` (`title`) USING BTREE,
  UNIQUE KEY `idx_product_no` (`product_no`) USING BTREE,
  KEY `idx_isdel_assettype_productstatus` (`asset_type`,`is_del`,`product_status`) USING BTREE,
  KEY `idx_isdel_productstatus_producttype` (`product_status`,`product_type`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3451 DEFAULT CHARSET=utf8 COMMENT='标的信息表';

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_check
-- ----------------------------
DROP TABLE IF EXISTS `product_check`;
CREATE TABLE `product_check` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint(20) NOT NULL COMMENT '标的id',
  `first_check_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '初审状态：1、审核通过；0、不通过',
  `first_check_remark` text COMMENT '初审描述',
  `final_check_status` tinyint(2) DEFAULT NULL COMMENT '终审状态',
  `final_check_remark` text COMMENT '终审描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) NOT NULL DEFAULT '999999' COMMENT '创建者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) NOT NULL DEFAULT '999999' COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28887 DEFAULT CHARSET=utf8 COMMENT='标的审核信息表';

-- ----------------------------
-- Records of product_check
-- ----------------------------

-- ----------------------------
-- Table structure for product_file
-- ----------------------------
DROP TABLE IF EXISTS `product_file`;
CREATE TABLE `product_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` bigint(20) NOT NULL COMMENT '标的id',
  `url` varchar(255) NOT NULL COMMENT '文件url',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=316181 DEFAULT CHARSET=utf8 COMMENT='标的文件表';

-- ----------------------------
-- Records of product_file
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_1', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_100', 'DEFAULT', '0 0 11 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_2', 'DEFAULT', '0 0/1 * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_97', 'DEFAULT', '0 0 12 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_98', 'DEFAULT', '0 0 12 * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('YXScheduler', 'TASK_99', 'DEFAULT', '0 0 11 * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_1', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_100', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074001B757365724C6F67696E4C6F674372656174655461626C655461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016EB57E94907874000C302030203131202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006474000765786563757465740006323031393132740027E5889BE5BBBAE794A8E688B7E799BBE99986E697A5E5BF97E8A1A8EFBC88E697A0E58F82EFBC89737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_2', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000D3020302F31202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_97', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400157379734C6F674372656174655461626C655461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016EB549BD387874000C302030203132202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000617400076578656375746570740027E5889BE5BBBAE7B3BBE7BB9FE6938DE4BD9CE697A5E5BF97E8A1A8EFBC88E697A0E58F82EFBC89737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_98', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B78707400157379734C6F674372656174655461626C655461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016EB57C9CA87874000C302030203132202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000006274000765786563757465740006323031393132740027E5889BE5BBBAE7B3BBE7BB9FE6938DE4BD9CE697A5E5BF97E8A1A8EFBC88E69C89E58F82EFBC89737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `qrtz_job_details` VALUES ('YXScheduler', 'TASK_99', 'DEFAULT', null, 'com.yx.job.rpc.service.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720022636F6D2E79782E6A6F622E6D6F64656C2E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B787074001B757365724C6F67696E4C6F674372656174655461626C655461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016EB57DB5E87874000C302030203131202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000637400076578656375746570740027E5889BE5BBBAE794A8E688B7E799BBE99986E697A5E5BF97E8A1A8EFBC88E697A0E58F82EFBC89737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('YXScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('YXScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('YXScheduler', 'DESKTOP-6GEURDT1575017245698', '1575030891626', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1575017280000', '-1', '5', 'PAUSED', 'CRON', '1575017246000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_100', 'DEFAULT', 'TASK_100', 'DEFAULT', null, '1575082800000', '-1', '5', 'WAITING', 'CRON', '1575017246000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1575017280000', '-1', '5', 'PAUSED', 'CRON', '1575017246000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_97', 'DEFAULT', 'TASK_97', 'DEFAULT', null, '1575086400000', '-1', '5', 'WAITING', 'CRON', '1575017246000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_98', 'DEFAULT', 'TASK_98', 'DEFAULT', null, '1575086400000', '-1', '5', 'WAITING', 'CRON', '1575017246000', '0', null, '2', '');
INSERT INTO `qrtz_triggers` VALUES ('YXScheduler', 'TASK_99', 'DEFAULT', 'TASK_99', 'DEFAULT', null, '1575082800000', '-1', '5', 'WAITING', 'CRON', '1575017246000', '0', null, '2', '');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/1 * * * ?', '1', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/1 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');
INSERT INTO `schedule_job` VALUES ('97', 'sysLogCreateTableTask', 'execute', null, '0 0 12 * * ?', '0', '创建系统操作日志表（无参）', '2019-11-29 11:52:19');
INSERT INTO `schedule_job` VALUES ('98', 'sysLogCreateTableTask', 'execute', '201912', '0 0 12 * * ?', '0', '创建系统操作日志表（有参）', '2019-11-29 12:47:53');
INSERT INTO `schedule_job` VALUES ('99', 'userLoginLogCreateTableTask', 'execute', null, '0 0 11 * * ?', '0', '创建用户登陆日志表（无参）', '2019-11-29 12:49:05');
INSERT INTO `schedule_job` VALUES ('100', 'userLoginLogCreateTableTask', 'execute', '201912', '0 0 11 * * ?', '0', '创建用户登陆日志表（无参）', '2019-11-29 12:50:02');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1440664 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_content`;
CREATE TABLE `sys_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `model_type` tinyint(2) DEFAULT NULL COMMENT '板块id（ContentModelTypeEnum.java中有详细解释）',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '内容是否有效，0-待发布，1-发布，2-下线',
  `url` varchar(255) DEFAULT NULL COMMENT 'url路径(http://XXX/XX/X）',
  `title` varchar(255) DEFAULT NULL COMMENT '内容标题',
  `content` longtext COMMENT '内容描述',
  `description` varchar(255) DEFAULT NULL COMMENT '本条数据的描述',
  `model_time` date DEFAULT NULL COMMENT '时间字段，如：model_type=2时，该数据为发展历程，则model_time为发展历程的时间，此字段会根据model_type的值而改变时间的定义',
  `model_type_types` tinyint(2) DEFAULT NULL COMMENT '用于每种model_type中的类型，如：1、服务协议，服务协议中有注册服务协议、和投资、借款协议，在枚举中查看详情，枚举的命名规则为ContentModelTypeEnum.java中的参数名+type',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `client_type` tinyint(2) DEFAULT NULL COMMENT '客户端类型,枚举中有详细介绍',
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`) USING BTREE,
  KEY `idx_status_modeltype_types` (`model_type`,`status`,`model_type_types`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of sys_content
-- ----------------------------
INSERT INTO `sys_content` VALUES ('1', '3', '1', null, '每日充值是否有额度限制？', '<p><!--[if gte mso 9]><xml><o:DocumentProperties><o:Revision>1</o:Revision><o:Pages>1</o:Pages><o:Lines>1</o:Lines><o:Paragraphs>1</o:Paragraphs></o:DocumentProperties></xml><![endif]--><!--[if gte mso 9]><xml><o:OfficeDocumentSettings></o:OfficeDocumentSettings></xml><![endif]--><!--[if gte mso 9]><xml><w:WordDocument><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery><w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery><w:DocumentKind>DocumentNotSpecified</w:DocumentKind><w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing><w:PunctuationKerning></w:PunctuationKerning><w:View>Normal</w:View><w:Compatibility><w:DontGrowAutofit/><w:BalanceSingleByteDoubleByteWidth/><w:DoNotExpandShiftReturn/><w:UseFELayout/></w:Compatibility><w:Zoom>0</w:Zoom></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml><w:LatentStyles DefLockedState=\"false\"  DefUnhideWhenUsed=\"true\"  DefSemiHidden=\"true\"  DefQFormat=\"false\"  DefPriority=\"99\"  LatentStyleCount=\"260\" >\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footer\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"caption\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of figures\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope return\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"line number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"page number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of authorities\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"macro\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toa heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Title\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Closing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Default Paragraph Font\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Message Header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Subtitle\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Salutation\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Date\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Note Heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Block Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Hyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"FollowedHyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Strong\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Emphasis\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Document Map\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Plain Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"E-mail Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal (Web)\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Acronym\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Cite\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Code\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Definition\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Keyboard\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Preformatted\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Sample\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Typewriter\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Variable\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Table\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation subject\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / a / i\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / 1.1 / 1.1.1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Article / Section\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Contemporary\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Elegant\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Professional\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Balloon Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Theme\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Placeholder Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No Spacing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Paragraph\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Intense Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 6\" ></w:LsdException>\n</w:LatentStyles></xml><![endif]--><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span><font face=\"宋体\">每日支付限额参照存管银行标准。</font></span><span></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span><font face=\"宋体\">移动端在【账户】</font>-【充值】-【充值须知】中的限额列表查看。</span><span></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span>PC端在【账户中心】-【充值管理】中的限额列表查看。</span><span></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span><font face=\"宋体\">如有其他疑问，可联系在线客服或客服热线：</font>400-051-6868。</span><span></span></p><span></span></p>', null, null, null, null, null, '2018-10-19 10:01:44', '1016151836104032272', '2019-01-03 17:00:10', '1016151836104032281');
INSERT INTO `sys_content` VALUES ('2', '3', '1', null, '投资人申请提现后何时到账？', '<p><br></p><p><span><!--[if gte mso 9]><xml><o:DocumentProperties><o:Revision>1</o:Revision><o:Pages>1</o:Pages><o:Lines>1</o:Lines><o:Paragraphs>1</o:Paragraphs></o:DocumentProperties></xml><![endif]--><!--[if gte mso 9]><xml><o:OfficeDocumentSettings></o:OfficeDocumentSettings></xml><![endif]--><!--[if gte mso 9]><xml><w:WordDocument><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery><w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery><w:DocumentKind>DocumentNotSpecified</w:DocumentKind><w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing><w:PunctuationKerning></w:PunctuationKerning><w:View>Normal</w:View><w:Compatibility><w:DontGrowAutofit></w:DontGrowAutofit><w:BalanceSingleByteDoubleByteWidth></w:BalanceSingleByteDoubleByteWidth><w:DoNotExpandShiftReturn></w:DoNotExpandShiftReturn><w:UseFELayout></w:UseFELayout></w:Compatibility><w:Zoom>0</w:Zoom></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml><w:LatentStyles DefLockedState=\"false\"  DefUnhideWhenUsed=\"true\"  DefSemiHidden=\"true\"  DefQFormat=\"false\"  DefPriority=\"99\"  LatentStyleCount=\"260\" >\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footer\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"caption\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of figures\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope return\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"line number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"page number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of authorities\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"macro\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toa heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Title\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Closing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Default Paragraph Font\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Message Header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Subtitle\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Salutation\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Date\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Note Heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Block Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Hyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"FollowedHyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Strong\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Emphasis\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Document Map\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Plain Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"E-mail Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal (Web)\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Acronym\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Cite\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Code\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Definition\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Keyboard\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Preformatted\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Sample\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Typewriter\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Variable\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Table\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation subject\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / a / i\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / 1.1 / 1.1.1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Article / Section\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Contemporary\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Elegant\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Professional\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Balloon Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Theme\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Placeholder Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No Spacing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Paragraph\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Intense Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 6\" ></w:LsdException>\n</w:LatentStyles></xml><![endif]--></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span>提现分为（T＋1）提现和（T+0）提现两种方式，具体时间以您选择的提现方式为准。</span><span></span></p><p></p><p><span></span><span>如有其他疑问，可联系在线客服或客服热线：</span><span>400-051-6868。</span></p>', null, null, null, null, null, '2018-10-19 10:01:58', '1016151836104032272', '2019-01-21 08:50:29', '1016151836104032281');
INSERT INTO `sys_content` VALUES ('3', '3', '1', null, '可以用信用卡充值吗？ ', '<p><!--[if gte mso 9]><xml><o:DocumentProperties><o:Revision>1</o:Revision><o:Pages>1</o:Pages><o:Lines>1</o:Lines><o:Paragraphs>1</o:Paragraphs></o:DocumentProperties></xml><![endif]--><!--[if gte mso 9]><xml><o:OfficeDocumentSettings></o:OfficeDocumentSettings></xml><![endif]--><!--[if gte mso 9]><xml><w:WordDocument><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery><w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery><w:DocumentKind>DocumentNotSpecified</w:DocumentKind><w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing><w:PunctuationKerning></w:PunctuationKerning><w:View>Normal</w:View><w:Compatibility><w:DontGrowAutofit/><w:BalanceSingleByteDoubleByteWidth/><w:DoNotExpandShiftReturn/><w:UseFELayout/></w:Compatibility><w:Zoom>0</w:Zoom></w:WordDocument></xml><![endif]--><!--[if gte mso 9]><xml><w:LatentStyles DefLockedState=\"false\"  DefUnhideWhenUsed=\"true\"  DefSemiHidden=\"true\"  DefQFormat=\"false\"  DefPriority=\"99\"  LatentStyleCount=\"260\" >\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"heading 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toc 9\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footer\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"index heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"caption\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of figures\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"envelope return\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"footnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"line number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"page number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote reference\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"endnote text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"table of authorities\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"macro\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"toa heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Bullet 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Number 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Title\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Closing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Default Paragraph Font\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Continue 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Message Header\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Subtitle\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Salutation\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Date\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text First Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Note Heading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Body Text Indent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Block Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Hyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"FollowedHyperlink\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Strong\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Emphasis\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Document Map\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Plain Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"E-mail Signature\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal (Web)\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Acronym\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Address\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Cite\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Code\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Definition\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Keyboard\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Preformatted\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Sample\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Typewriter\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"HTML Variable\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Normal Table\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"annotation subject\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / a / i\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"1 / 1.1 / 1.1.1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Article / Section\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Simple 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Classic 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Colorful 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Columns 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 7\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table List 8\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table 3D effects 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Contemporary\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Elegant\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Professional\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Subtle 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Web 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Balloon Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Table Theme\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Placeholder Text\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"No Spacing\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"List Paragraph\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Intense Quote\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 1\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 2\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 3\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 4\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 5\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Light Grid Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Shading 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium List 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 1 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 2 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Medium Grid 3 Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Dark List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Shading Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful List Accent 6\" ></w:LsdException>\n<w:LsdException Locked=\"false\"  Priority=\"99\"  SemiHidden=\"false\"  Name=\"Colorful Grid Accent 6\" ></w:LsdException>\n</w:LatentStyles></xml><![endif]--><p class=\"MsoNormal\" style=\"text-align: justify;\" align=\"justify\"><span><font face=\"宋体\">不可以，我平台暂时只支持借记卡充值。</font></span><span></span></p><span></span></p>', null, null, null, null, null, '2018-10-19 10:02:17', '1016151836104032272', '2019-01-02 13:12:09', '1016151836104032281');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门编号',
  `sort_no` int(3) DEFAULT NULL COMMENT '排序号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '1', 'YX管理平台', '0', '1', '0', '0', '1', 'qw', '1', '2016-06-28 18:04:06', '1', '2019-11-29 12:45:43');
INSERT INTO `sys_dept` VALUES ('2', '1', '开发', '1', '2', null, '1', null, null, '1', '2018-08-13 09:54:49', '1', '2018-08-13 09:56:30');
INSERT INTO `sys_dept` VALUES ('3', '1', '产品', '1', '3', null, '1', null, null, '1', '2018-08-13 09:55:01', '1', '2018-08-17 10:04:22');
INSERT INTO `sys_dept` VALUES ('4', '1', '测试', '1', '4', null, '0', null, null, '1', '2018-08-13 09:55:16', '1', '2018-08-13 09:55:16');
INSERT INTO `sys_dept` VALUES ('5', '1', '设计', '1', '5', null, '0', null, null, '1', '2018-08-13 09:55:37', '1', '2018-08-13 09:55:37');
INSERT INTO `sys_dept` VALUES ('6', '1', '运维', '1', '6', null, '1', null, null, '1', '2018-08-13 09:55:50', '1', '2018-08-13 09:56:30');
INSERT INTO `sys_dept` VALUES ('7', '1', '开发', '1', '2', null, '0', null, null, '1', '2018-08-13 09:56:39', '1', '2018-08-13 09:56:39');
INSERT INTO `sys_dept` VALUES ('8', '1', '运维', '1', '6', null, '0', null, null, '1', '2018-08-13 09:56:48', '1', '2018-08-13 09:56:48');
INSERT INTO `sys_dept` VALUES ('9', '1', '产品', '1', '7', null, '0', null, null, '1', '2018-08-17 10:04:33', '1', '2018-08-17 10:04:33');
INSERT INTO `sys_dept` VALUES ('10', '1', '人事', '1', '10', null, '0', null, null, '1', '2018-08-24 12:56:41', '1', '2018-08-24 12:56:41');
INSERT INTO `sys_dept` VALUES ('11', '1', '财务部', '1', '1', null, '0', null, null, '1016151836104032278', '2018-10-17 11:27:23', '1016151836104032278', '2018-10-17 11:29:45');
INSERT INTO `sys_dept` VALUES ('12', '1', '运营管理部', '1', '11', null, '0', null, null, '1016151836104032271', '2018-12-12 09:20:50', '1016151836104032271', '2018-12-12 09:20:50');

-- ----------------------------
-- Table structure for sys_dic
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_` varchar(50) NOT NULL,
  `code_` varchar(50) DEFAULT NULL,
  `code_text` varchar(100) DEFAULT NULL,
  `parent_type` varchar(50) DEFAULT NULL,
  `parent_code` varchar(50) DEFAULT NULL,
  `sort_no` int(2) DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type__code_` (`type_`,`code_`,`is_del`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('1', 'SEX', '0', '未知', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2017-12-31 00:50:07');
INSERT INTO `sys_dic` VALUES ('2', 'SEX', '1', '男', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:12');
INSERT INTO `sys_dic` VALUES ('3', 'SEX', '2', '女', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2017-12-30 23:35:11');
INSERT INTO `sys_dic` VALUES ('4', 'LOCKED', '0', '激活', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('5', 'LOCKED', '1', '锁定', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:10');
INSERT INTO `sys_dic` VALUES ('6', 'ROLETYPE', '1', '业务角色', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('7', 'ROLETYPE', '2', '管理角色', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('8', 'ROLETYPE', '3', '系统内置角色', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:08');
INSERT INTO `sys_dic` VALUES ('9', 'LEAF', '0', '树枝节点', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2017-12-27 15:24:38');
INSERT INTO `sys_dic` VALUES ('10', 'LEAF', '1', '叶子节点', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('11', 'EDITABLE', '0', '只读', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('12', 'EDITABLE', '1', '可编辑', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('13', 'ENABLE', '0', '禁用', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:05');
INSERT INTO `sys_dic` VALUES ('14', 'ENABLE', '1', '启用', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:04');
INSERT INTO `sys_dic` VALUES ('15', 'AUTHORIZELEVEL', '1', '访问权限', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('16', 'AUTHORIZELEVEL', '2', '管理权限', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:02');
INSERT INTO `sys_dic` VALUES ('17', 'MENUTYPE', '1', '系统菜单', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('18', 'MENUTYPE', '2', '业务菜单', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('19', 'USERTYPE', '1', '经办员', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:50');
INSERT INTO `sys_dic` VALUES ('20', 'USERTYPE', '2', '管理员', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:48');
INSERT INTO `sys_dic` VALUES ('21', 'USERTYPE', '3', '系统内置用户', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('22', 'EXPAND', '0', '收缩', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('23', 'EXPAND', '1', '展开', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:46');
INSERT INTO `sys_dic` VALUES ('24', 'CRUD', 'add', '新增', null, null, '1', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:56');
INSERT INTO `sys_dic` VALUES ('25', 'CRUD', 'read', '查询', null, null, '2', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:58');
INSERT INTO `sys_dic` VALUES ('26', 'CRUD', 'update', '修改', null, null, '3', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('27', 'CRUD', 'delete', '删除', null, null, '4', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('28', 'CRUD', 'open', '打开', null, null, '5', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:00');
INSERT INTO `sys_dic` VALUES ('29', 'CRUD', 'close', '关闭', null, null, '6', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('30', 'CRUD', 'run', '执行', null, null, '7', '0', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');

-- ----------------------------
-- Table structure for sys_email_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_log`;
CREATE TABLE `sys_email_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `uuid` varchar(64) NOT NULL COMMENT '唯一id标识',
  `email` varchar(255) NOT NULL COMMENT '收件人邮箱',
  `subject` varchar(255) DEFAULT NULL,
  `content` text COMMENT '邮件内容',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '状态：0、未激活；1、已激活',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_email_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `operation_` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `operation_type` tinyint(1) DEFAULT NULL COMMENT '操作类型',
  `method_` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params_` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `result_` tinyint(1) DEFAULT NULL COMMENT '操作结果',
  `time_` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip_` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `source` tinyint(2) DEFAULT '0' COMMENT '来源：1、pc;2、APP;3、WX;4、安卓；5、IOS',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_username_operation` (`user_name`,`operation_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=183742 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log_201904
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_201904`;
CREATE TABLE `sys_log_201904` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `operation_` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `operation_type` tinyint(1) DEFAULT NULL COMMENT '操作类型',
  `method_` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params_` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `result_` tinyint(1) DEFAULT NULL COMMENT '操作结果',
  `time_` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip_` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `source` tinyint(2) DEFAULT '0' COMMENT '来源：1、pc;2、APP;3、WX;4、安卓；5、IOS',
  `remark_` varchar(500) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT '0' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_username_operation` (`user_name`,`operation_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=197793 DEFAULT CHARSET=utf8 COMMENT='系统日志201904';

-- ----------------------------
-- Records of sys_log_201904
-- ----------------------------
INSERT INTO `sys_log_201904` VALUES ('197012', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"9f9f4f9a-e7f5-4428-b4cd-f390e042a40f\",\"captchaValue\":\"77yc\",\"password\":\"****\"}]', '1', '47', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 08:53:19', '0', '2019-04-12 08:53:19');
INSERT INTO `sys_log_201904` VALUES ('197013', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '92', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 08:59:34', '0', '2019-04-12 08:59:34');
INSERT INTO `sys_log_201904` VALUES ('197014', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '117', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 08:59:34', '0', '2019-04-12 08:59:34');
INSERT INTO `sys_log_201904` VALUES ('197015', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '157', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 08:59:34', '0', '2019-04-12 08:59:34');
INSERT INTO `sys_log_201904` VALUES ('197016', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '295', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 08:59:34', '0', '2019-04-12 08:59:34');
INSERT INTO `sys_log_201904` VALUES ('197017', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:00:38', '0', '2019-04-12 09:00:38');
INSERT INTO `sys_log_201904` VALUES ('197018', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '70', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:00:38', '0', '2019-04-12 09:00:38');
INSERT INTO `sys_log_201904` VALUES ('197019', '44300', 'YX18920012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '85', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:00:39', '0', '2019-04-12 09:00:39');
INSERT INTO `sys_log_201904` VALUES ('197020', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '131', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:00:39', '0', '2019-04-12 09:00:39');
INSERT INTO `sys_log_201904` VALUES ('197021', '44300', 'YX18920012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '197', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:00:39', '0', '2019-04-12 09:00:39');
INSERT INTO `sys_log_201904` VALUES ('197022', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '180', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:00:54', '0', '2019-04-12 09:00:54');
INSERT INTO `sys_log_201904` VALUES ('197023', '44316', 'YX13300812345', '风险测评--判断用户是否有过测评记录', '2', 'com.yx.mobile.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '74', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:14', '0', '2019-04-12 09:01:14');
INSERT INTO `sys_log_201904` VALUES ('197024', '44316', 'YX13300812345', '风险测评--题目列表', '2', 'com.yx.wx.server.controller.user.RiskAssessmentController.selectAllQuestion', null, '1', '285', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:01:15', '0', '2019-04-12 09:01:15');
INSERT INTO `sys_log_201904` VALUES ('197025', '44316', 'YX13300812345', '风险测评--题目列表', '2', 'com.yx.wx.server.controller.user.RiskAssessmentController.selectAllQuestion', null, '1', '310', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:01:15', '0', '2019-04-12 09:01:15');
INSERT INTO `sys_log_201904` VALUES ('197026', '44316', 'YX13300812345', '风险测评--答案提交', '2', 'com.yx.wx.server.controller.user.RiskAssessmentController.confirmAnswer', null, '1', '852', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:01:24', '0', '2019-04-12 09:01:24');
INSERT INTO `sys_log_201904` VALUES ('197027', '44316', 'YX13300812345', '风险测评--获取测评结果', '2', 'com.yx.wx.server.controller.user.RiskAssessmentController.getRiskResult', null, '1', '53', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:01:25', '0', '2019-04-12 09:01:25');
INSERT INTO `sys_log_201904` VALUES ('197028', '44316', 'YX13300812345', '自动出借授权（新）', '1', 'com.yx.mobile.server.controller.auth.AuthController.autoBidAuthNew', null, '1', '415', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:31', '0', '2019-04-12 09:01:31');
INSERT INTO `sys_log_201904` VALUES ('197029', '44316', 'YX13300812345', '自动出借授权（新）', '1', 'com.yx.mobile.server.controller.auth.AuthController.autoBidAuthNew', null, '0', '300', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:32', '0', '2019-04-12 09:01:32');
INSERT INTO `sys_log_201904` VALUES ('197030', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '66', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:43', '0', '2019-04-12 09:01:43');
INSERT INTO `sys_log_201904` VALUES ('197031', '44316', 'YX13300812345', '开户未完成调用该接口', '9', 'com.yx.mobile.server.controller.user.UserController.openAccountCancel', null, '1', '113', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:43', '0', '2019-04-12 09:01:43');
INSERT INTO `sys_log_201904` VALUES ('197032', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '151', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:43', '0', '2019-04-12 09:01:43');
INSERT INTO `sys_log_201904` VALUES ('197033', '44316', 'YX13300812345', '转账授权', '1', 'com.yx.mobile.server.controller.auth.AuthController.transferAuth', null, '1', '372', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:48', '0', '2019-04-12 09:01:48');
INSERT INTO `sys_log_201904` VALUES ('197034', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '84', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:58', '0', '2019-04-12 09:01:58');
INSERT INTO `sys_log_201904` VALUES ('197035', '44316', 'YX13300812345', '开户未完成调用该接口', '9', 'com.yx.mobile.server.controller.user.UserController.openAccountCancel', null, '1', '75', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:58', '0', '2019-04-12 09:01:58');
INSERT INTO `sys_log_201904` VALUES ('197036', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '205', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:01:58', '0', '2019-04-12 09:01:58');
INSERT INTO `sys_log_201904` VALUES ('197037', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '181', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:01', '0', '2019-04-12 09:02:01');
INSERT INTO `sys_log_201904` VALUES ('197038', '44316', 'YX13300812345', '出借撤销授权', '1', 'com.yx.mobile.server.controller.auth.AuthController.bidCancelAuth', null, '1', '366', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:34', '0', '2019-04-12 09:02:34');
INSERT INTO `sys_log_201904` VALUES ('197039', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '85', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:44', '0', '2019-04-12 09:02:44');
INSERT INTO `sys_log_201904` VALUES ('197040', '44316', 'YX13300812345', '开户未完成调用该接口', '9', 'com.yx.mobile.server.controller.user.UserController.openAccountCancel', null, '1', '115', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:44', '0', '2019-04-12 09:02:44');
INSERT INTO `sys_log_201904` VALUES ('197041', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '164', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:44', '0', '2019-04-12 09:02:44');
INSERT INTO `sys_log_201904` VALUES ('197042', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '182', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:02:47', '0', '2019-04-12 09:02:47');
INSERT INTO `sys_log_201904` VALUES ('197043', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '181', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 09:03:07', '0', '2019-04-12 09:03:07');
INSERT INTO `sys_log_201904` VALUES ('197044', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197045', '44300', 'YX18920012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '103', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197046', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '119', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197047', '44300', 'YX18920012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '5', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197048', '44300', 'YX18920012345', '借款人--实名认证关闭', '9', 'com.yx.web.server.controller.user.FddUserController.authenticationCancel', null, '1', '24', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197049', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '69', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:39', '0', '2019-04-12 09:04:39');
INSERT INTO `sys_log_201904` VALUES ('197050', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:04:41', '0', '2019-04-12 09:04:41');
INSERT INTO `sys_log_201904` VALUES ('197051', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '70', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:05:06', '0', '2019-04-12 09:05:06');
INSERT INTO `sys_log_201904` VALUES ('197052', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:05:06', '0', '2019-04-12 09:05:06');
INSERT INTO `sys_log_201904` VALUES ('197053', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '71', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:09:44', '0', '2019-04-12 09:09:44');
INSERT INTO `sys_log_201904` VALUES ('197054', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:09:44', '0', '2019-04-12 09:09:44');
INSERT INTO `sys_log_201904` VALUES ('197055', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:13:41', '0', '2019-04-12 09:13:41');
INSERT INTO `sys_log_201904` VALUES ('197056', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:13:42', '0', '2019-04-12 09:13:42');
INSERT INTO `sys_log_201904` VALUES ('197057', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '126', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:13:42', '0', '2019-04-12 09:13:42');
INSERT INTO `sys_log_201904` VALUES ('197058', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '15', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:14:00', '0', '2019-04-12 09:14:00');
INSERT INTO `sys_log_201904` VALUES ('197059', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:14:13', '0', '2019-04-12 09:14:13');
INSERT INTO `sys_log_201904` VALUES ('197060', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:14:13', '0', '2019-04-12 09:14:13');
INSERT INTO `sys_log_201904` VALUES ('197061', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '98', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:14:13', '0', '2019-04-12 09:14:13');
INSERT INTO `sys_log_201904` VALUES ('197062', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '83', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:20:55', '0', '2019-04-12 09:20:55');
INSERT INTO `sys_log_201904` VALUES ('197063', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '122', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:20:57', '0', '2019-04-12 09:20:57');
INSERT INTO `sys_log_201904` VALUES ('197064', '1016151836104032286', '李文英', '发送短信', '9', 'com.yx.admin.server.controller.common.CommonController.sendSms', '[]', '1', '284', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:21:28', '0', '2019-04-12 09:21:28');
INSERT INTO `sys_log_201904` VALUES ('197065', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:21:45', '0', '2019-04-12 09:21:45');
INSERT INTO `sys_log_201904` VALUES ('197066', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:21:59', '0', '2019-04-12 09:21:59');
INSERT INTO `sys_log_201904` VALUES ('197067', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '65', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:03', '0', '2019-04-12 09:22:03');
INSERT INTO `sys_log_201904` VALUES ('197068', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:04', '0', '2019-04-12 09:22:04');
INSERT INTO `sys_log_201904` VALUES ('197069', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:12', '0', '2019-04-12 09:22:12');
INSERT INTO `sys_log_201904` VALUES ('197070', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:28', '0', '2019-04-12 09:22:28');
INSERT INTO `sys_log_201904` VALUES ('197071', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:33', '0', '2019-04-12 09:22:33');
INSERT INTO `sys_log_201904` VALUES ('197072', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '68', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:36', '0', '2019-04-12 09:22:36');
INSERT INTO `sys_log_201904` VALUES ('197073', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:37', '0', '2019-04-12 09:22:37');
INSERT INTO `sys_log_201904` VALUES ('197074', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:38', '0', '2019-04-12 09:22:38');
INSERT INTO `sys_log_201904` VALUES ('197075', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:39', '0', '2019-04-12 09:22:39');
INSERT INTO `sys_log_201904` VALUES ('197076', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '67', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:40', '0', '2019-04-12 09:22:40');
INSERT INTO `sys_log_201904` VALUES ('197077', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '65', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:46', '0', '2019-04-12 09:22:46');
INSERT INTO `sys_log_201904` VALUES ('197078', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '0', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:48', '0', '2019-04-12 09:22:48');
INSERT INTO `sys_log_201904` VALUES ('197079', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"6aae2d1698854ca18db183293aa4dbe5\",\"id\":\"651\",\"smsCode\":\"345374\"}]', '1', '1414', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 09:22:54', '0', '2019-04-12 09:22:54');
INSERT INTO `sys_log_201904` VALUES ('197080', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '83', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:23:06', '0', '2019-04-12 09:23:06');
INSERT INTO `sys_log_201904` VALUES ('197081', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:23:06', '0', '2019-04-12 09:23:06');
INSERT INTO `sys_log_201904` VALUES ('197082', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:24:51', '0', '2019-04-12 09:24:51');
INSERT INTO `sys_log_201904` VALUES ('197083', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '52', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:24:51', '0', '2019-04-12 09:24:51');
INSERT INTO `sys_log_201904` VALUES ('197084', '44189', 'YX13699170634', '借款人--实名认证关闭', '9', 'com.yx.wx.server.controller.user.FddUserController.authenticationCancel', null, '1', '115', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:24:51', '0', '2019-04-12 09:24:51');
INSERT INTO `sys_log_201904` VALUES ('197085', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '925', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:26:07', '0', '2019-04-12 09:26:07');
INSERT INTO `sys_log_201904` VALUES ('197086', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '70', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:26:16', '0', '2019-04-12 09:26:16');
INSERT INTO `sys_log_201904` VALUES ('197087', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '62', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:26:17', '0', '2019-04-12 09:26:17');
INSERT INTO `sys_log_201904` VALUES ('197088', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:26:31', '0', '2019-04-12 09:26:31');
INSERT INTO `sys_log_201904` VALUES ('197089', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:26:37', '0', '2019-04-12 09:26:37');
INSERT INTO `sys_log_201904` VALUES ('197090', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '97', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 09:26:37', '0', '2019-04-12 09:26:37');
INSERT INTO `sys_log_201904` VALUES ('197091', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '63', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:12', '0', '2019-04-12 09:27:12');
INSERT INTO `sys_log_201904` VALUES ('197092', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:12', '0', '2019-04-12 09:27:12');
INSERT INTO `sys_log_201904` VALUES ('197093', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '56', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:13', '0', '2019-04-12 09:27:13');
INSERT INTO `sys_log_201904` VALUES ('197094', '44189', 'YX13699170634', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '46', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:13', '0', '2019-04-12 09:27:13');
INSERT INTO `sys_log_201904` VALUES ('197095', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '95', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:13', '0', '2019-04-12 09:27:13');
INSERT INTO `sys_log_201904` VALUES ('197096', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:27:19', '0', '2019-04-12 09:27:19');
INSERT INTO `sys_log_201904` VALUES ('197097', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '957', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:15', '0', '2019-04-12 09:30:15');
INSERT INTO `sys_log_201904` VALUES ('197098', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:22', '0', '2019-04-12 09:30:22');
INSERT INTO `sys_log_201904` VALUES ('197099', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '116', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:24', '0', '2019-04-12 09:30:24');
INSERT INTO `sys_log_201904` VALUES ('197100', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '943', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:29', '0', '2019-04-12 09:30:29');
INSERT INTO `sys_log_201904` VALUES ('197101', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '81', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:35', '0', '2019-04-12 09:30:35');
INSERT INTO `sys_log_201904` VALUES ('197102', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '80', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:30:37', '0', '2019-04-12 09:30:37');
INSERT INTO `sys_log_201904` VALUES ('197103', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:45:30', '0', '2019-04-12 09:45:30');
INSERT INTO `sys_log_201904` VALUES ('197104', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '125', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:45:30', '0', '2019-04-12 09:45:30');
INSERT INTO `sys_log_201904` VALUES ('197105', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '68', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:49:00', '0', '2019-04-12 09:49:00');
INSERT INTO `sys_log_201904` VALUES ('197106', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:49:01', '0', '2019-04-12 09:49:01');
INSERT INTO `sys_log_201904` VALUES ('197107', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '125', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:50:03', '0', '2019-04-12 09:50:03');
INSERT INTO `sys_log_201904` VALUES ('197108', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '107', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:59:16', '0', '2019-04-12 09:59:16');
INSERT INTO `sys_log_201904` VALUES ('197109', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '125', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:59:16', '0', '2019-04-12 09:59:16');
INSERT INTO `sys_log_201904` VALUES ('197110', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '69', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:59:31', '0', '2019-04-12 09:59:31');
INSERT INTO `sys_log_201904` VALUES ('197111', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 09:59:31', '0', '2019-04-12 09:59:31');
INSERT INTO `sys_log_201904` VALUES ('197112', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '995', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:01:02', '0', '2019-04-12 10:01:02');
INSERT INTO `sys_log_201904` VALUES ('197113', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:01:09', '0', '2019-04-12 10:01:09');
INSERT INTO `sys_log_201904` VALUES ('197114', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '73', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:01:11', '0', '2019-04-12 10:01:11');
INSERT INTO `sys_log_201904` VALUES ('197115', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '81', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:01:23', '0', '2019-04-12 10:01:23');
INSERT INTO `sys_log_201904` VALUES ('197116', '44300', 'YX18920012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '178', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:01:23', '0', '2019-04-12 10:01:23');
INSERT INTO `sys_log_201904` VALUES ('197117', '1016151836104032273', '颜秉豪', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"yanbinghao\",\"captchaId\":\"360048ca-25c2-4112-b87b-98bb92455d2c\",\"captchaValue\":\"4av1\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 10:02:51', '0', '2019-04-12 10:02:51');
INSERT INTO `sys_log_201904` VALUES ('197118', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '89', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:05:47', '0', '2019-04-12 10:05:47');
INSERT INTO `sys_log_201904` VALUES ('197119', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '14', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:47', '0', '2019-04-12 10:05:47');
INSERT INTO `sys_log_201904` VALUES ('197120', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '43', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:47', '0', '2019-04-12 10:05:47');
INSERT INTO `sys_log_201904` VALUES ('197121', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '84', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:48', '0', '2019-04-12 10:05:48');
INSERT INTO `sys_log_201904` VALUES ('197122', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '204', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:48', '0', '2019-04-12 10:05:48');
INSERT INTO `sys_log_201904` VALUES ('197123', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '227', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:48', '0', '2019-04-12 10:05:48');
INSERT INTO `sys_log_201904` VALUES ('197124', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '166', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:05:50', '0', '2019-04-12 10:05:50');
INSERT INTO `sys_log_201904` VALUES ('197125', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '169', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:06:13', '0', '2019-04-12 10:06:13');
INSERT INTO `sys_log_201904` VALUES ('197126', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '89', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:20', '0', '2019-04-12 10:08:20');
INSERT INTO `sys_log_201904` VALUES ('197127', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:20', '0', '2019-04-12 10:08:20');
INSERT INTO `sys_log_201904` VALUES ('197128', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '914', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:28', '0', '2019-04-12 10:08:28');
INSERT INTO `sys_log_201904` VALUES ('197129', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '83', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:33', '0', '2019-04-12 10:08:33');
INSERT INTO `sys_log_201904` VALUES ('197130', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '81', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:35', '0', '2019-04-12 10:08:35');
INSERT INTO `sys_log_201904` VALUES ('197131', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '959', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:42', '0', '2019-04-12 10:08:42');
INSERT INTO `sys_log_201904` VALUES ('197132', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:47', '0', '2019-04-12 10:08:47');
INSERT INTO `sys_log_201904` VALUES ('197133', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:50', '0', '2019-04-12 10:08:50');
INSERT INTO `sys_log_201904` VALUES ('197134', '44300', 'YX18920012345', '还款', '1', 'com.yx.web.server.controller.plan.RepaymentPlanController.repay', null, '1', '915', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:08:57', '0', '2019-04-12 10:08:57');
INSERT INTO `sys_log_201904` VALUES ('197135', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '85', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:09:02', '0', '2019-04-12 10:09:02');
INSERT INTO `sys_log_201904` VALUES ('197136', '44300', 'YX18920012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '79', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 10:09:04', '0', '2019-04-12 10:09:04');
INSERT INTO `sys_log_201904` VALUES ('197137', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '64', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:10:03', '0', '2019-04-12 10:10:03');
INSERT INTO `sys_log_201904` VALUES ('197138', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '17', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:10:03', '0', '2019-04-12 10:10:03');
INSERT INTO `sys_log_201904` VALUES ('197139', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '121', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:10:04', '0', '2019-04-12 10:10:04');
INSERT INTO `sys_log_201904` VALUES ('197140', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '202', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:10:04', '0', '2019-04-12 10:10:04');
INSERT INTO `sys_log_201904` VALUES ('197141', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:12:15', '0', '2019-04-12 10:12:15');
INSERT INTO `sys_log_201904` VALUES ('197142', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '71', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:25:30', '0', '2019-04-12 10:25:30');
INSERT INTO `sys_log_201904` VALUES ('197143', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-12 10:25:30', '0', '2019-04-12 10:25:30');
INSERT INTO `sys_log_201904` VALUES ('197144', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '210', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-12 10:25:38', '0', '2019-04-12 10:25:38');
INSERT INTO `sys_log_201904` VALUES ('197145', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"3cc4acab-1445-4a5e-9d6a-f02c90f6df4c\",\"captchaValue\":\"9f1y\",\"password\":\"****\"}]', '1', '26', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 10:43:03', '0', '2019-04-12 10:43:03');
INSERT INTO `sys_log_201904` VALUES ('197146', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '57', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:48:01', '0', '2019-04-12 10:48:01');
INSERT INTO `sys_log_201904` VALUES ('197147', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '7', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:48:01', '0', '2019-04-12 10:48:01');
INSERT INTO `sys_log_201904` VALUES ('197148', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '111', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:48:02', '0', '2019-04-12 10:48:02');
INSERT INTO `sys_log_201904` VALUES ('197149', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '111', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:48:02', '0', '2019-04-12 10:48:02');
INSERT INTO `sys_log_201904` VALUES ('197150', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '194', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:48:02', '0', '2019-04-12 10:48:02');
INSERT INTO `sys_log_201904` VALUES ('197151', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '62', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:48:21', '0', '2019-04-12 10:48:21');
INSERT INTO `sys_log_201904` VALUES ('197152', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:48:22', '0', '2019-04-12 10:48:22');
INSERT INTO `sys_log_201904` VALUES ('197153', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '98', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:48:22', '0', '2019-04-12 10:48:22');
INSERT INTO `sys_log_201904` VALUES ('197154', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '34', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:55:02', '0', '2019-04-12 10:55:02');
INSERT INTO `sys_log_201904` VALUES ('197155', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '65', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 10:55:12', '0', '2019-04-12 10:55:12');
INSERT INTO `sys_log_201904` VALUES ('197156', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '19', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:55:12', '0', '2019-04-12 10:55:12');
INSERT INTO `sys_log_201904` VALUES ('197157', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '121', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:55:12', '0', '2019-04-12 10:55:12');
INSERT INTO `sys_log_201904` VALUES ('197158', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '204', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 10:55:12', '0', '2019-04-12 10:55:12');
INSERT INTO `sys_log_201904` VALUES ('197159', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:56:38', '0', '2019-04-12 10:56:38');
INSERT INTO `sys_log_201904` VALUES ('197160', '44189', 'YX13699170634', '借款人--实名认证关闭', '9', 'com.yx.wx.server.controller.user.FddUserController.authenticationCancel', null, '1', '80', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:56:38', '0', '2019-04-12 10:56:38');
INSERT INTO `sys_log_201904` VALUES ('197161', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '96', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 10:56:38', '0', '2019-04-12 10:56:38');
INSERT INTO `sys_log_201904` VALUES ('197162', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '50', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:45', '0', '2019-04-12 11:03:45');
INSERT INTO `sys_log_201904` VALUES ('197163', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:45', '0', '2019-04-12 11:03:45');
INSERT INTO `sys_log_201904` VALUES ('197164', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '46', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:45', '0', '2019-04-12 11:03:45');
INSERT INTO `sys_log_201904` VALUES ('197165', '44313', 'YX13300512345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '132', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:45', '0', '2019-04-12 11:03:45');
INSERT INTO `sys_log_201904` VALUES ('197166', '44313', 'YX13300512345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '96', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:46', '0', '2019-04-12 11:03:46');
INSERT INTO `sys_log_201904` VALUES ('197167', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:54', '0', '2019-04-12 11:03:54');
INSERT INTO `sys_log_201904` VALUES ('197168', '44313', 'YX13300512345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '194', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:03:54', '0', '2019-04-12 11:03:54');
INSERT INTO `sys_log_201904` VALUES ('197169', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:04:19', '0', '2019-04-12 11:04:19');
INSERT INTO `sys_log_201904` VALUES ('197170', '44313', 'YX13300512345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '180', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:04:31', '0', '2019-04-12 11:04:31');
INSERT INTO `sys_log_201904` VALUES ('197171', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:04:35', '0', '2019-04-12 11:04:35');
INSERT INTO `sys_log_201904` VALUES ('197172', '44313', 'YX13300512345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '190', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:04:36', '0', '2019-04-12 11:04:36');
INSERT INTO `sys_log_201904` VALUES ('197173', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:04:44', '0', '2019-04-12 11:04:44');
INSERT INTO `sys_log_201904` VALUES ('197174', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"3e08395a-f025-4304-9bfb-e5dcee87d992\",\"captchaValue\":\"fs3w\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 11:06:17', '0', '2019-04-12 11:06:17');
INSERT INTO `sys_log_201904` VALUES ('197175', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:07:54', '0', '2019-04-12 11:07:54');
INSERT INTO `sys_log_201904` VALUES ('197176', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '72', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 11:08:29', '0', '2019-04-12 11:08:29');
INSERT INTO `sys_log_201904` VALUES ('197177', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '62', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-12 11:08:29', '0', '2019-04-12 11:08:29');
INSERT INTO `sys_log_201904` VALUES ('197178', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '224', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-12 11:08:31', '0', '2019-04-12 11:08:31');
INSERT INTO `sys_log_201904` VALUES ('197179', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '227', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-12 11:08:54', '0', '2019-04-12 11:08:54');
INSERT INTO `sys_log_201904` VALUES ('197180', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:10:10', '0', '2019-04-12 11:10:10');
INSERT INTO `sys_log_201904` VALUES ('197181', '1016151836104032273', '颜秉豪', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"yanbinghao\",\"captchaId\":\"dc3e1f87-f3dd-40ec-ab82-298b5fbb5eee\",\"captchaValue\":\"fajz\",\"password\":\"****\"}]', '1', '58', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 11:19:34', '0', '2019-04-12 11:19:34');
INSERT INTO `sys_log_201904` VALUES ('197182', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '64', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:50', '0', '2019-04-12 11:20:50');
INSERT INTO `sys_log_201904` VALUES ('197183', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:50', '0', '2019-04-12 11:20:50');
INSERT INTO `sys_log_201904` VALUES ('197184', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '85', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:51', '0', '2019-04-12 11:20:51');
INSERT INTO `sys_log_201904` VALUES ('197185', '44166', '二麻子哥', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '84', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:51', '0', '2019-04-12 11:20:51');
INSERT INTO `sys_log_201904` VALUES ('197186', '44166', '二麻子哥', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '77', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:51', '0', '2019-04-12 11:20:51');
INSERT INTO `sys_log_201904` VALUES ('197187', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:54', '0', '2019-04-12 11:20:54');
INSERT INTO `sys_log_201904` VALUES ('197188', '44166', '二麻子哥', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '218', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:20:55', '0', '2019-04-12 11:20:55');
INSERT INTO `sys_log_201904` VALUES ('197189', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '85', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:23:54', '0', '2019-04-12 11:23:54');
INSERT INTO `sys_log_201904` VALUES ('197190', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:27:35', '0', '2019-04-12 11:27:35');
INSERT INTO `sys_log_201904` VALUES ('197191', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:27:42', '0', '2019-04-12 11:27:42');
INSERT INTO `sys_log_201904` VALUES ('197192', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:27:45', '0', '2019-04-12 11:27:45');
INSERT INTO `sys_log_201904` VALUES ('197193', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:27:59', '0', '2019-04-12 11:27:59');
INSERT INTO `sys_log_201904` VALUES ('197194', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:28:07', '0', '2019-04-12 11:28:07');
INSERT INTO `sys_log_201904` VALUES ('197195', '44166', '二麻子哥', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:30:43', '0', '2019-04-12 11:30:43');
INSERT INTO `sys_log_201904` VALUES ('197196', '44313', 'YX13300512345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 11:33:35', '0', '2019-04-12 11:33:35');
INSERT INTO `sys_log_201904` VALUES ('197197', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"0f46fe8d-6b21-4acf-9fba-996df0744383\",\"captchaValue\":\"gjqm\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 13:05:45', '0', '2019-04-12 13:05:45');
INSERT INTO `sys_log_201904` VALUES ('197198', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"262af689-71a9-4dc0-8d77-04c7a03e2738\",\"captchaValue\":\"s9og\",\"password\":\"****\"}]', '1', '29', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 13:08:49', '0', '2019-04-12 13:08:49');
INSERT INTO `sys_log_201904` VALUES ('197199', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:12:17', '0', '2019-04-12 13:12:17');
INSERT INTO `sys_log_201904` VALUES ('197200', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:12:17', '0', '2019-04-12 13:12:17');
INSERT INTO `sys_log_201904` VALUES ('197201', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '87', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:12:18', '0', '2019-04-12 13:12:18');
INSERT INTO `sys_log_201904` VALUES ('197202', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '89', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:12:18', '0', '2019-04-12 13:12:18');
INSERT INTO `sys_log_201904` VALUES ('197203', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '1612', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:12:19', '0', '2019-04-12 13:12:19');
INSERT INTO `sys_log_201904` VALUES ('197204', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '98', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:13:17', '0', '2019-04-12 13:13:17');
INSERT INTO `sys_log_201904` VALUES ('197205', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '45', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:13:17', '0', '2019-04-12 13:13:17');
INSERT INTO `sys_log_201904` VALUES ('197206', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '284', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:13:17', '0', '2019-04-12 13:13:17');
INSERT INTO `sys_log_201904` VALUES ('197207', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '96', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:14:18', '0', '2019-04-12 13:14:18');
INSERT INTO `sys_log_201904` VALUES ('197208', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '97', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:14:18', '0', '2019-04-12 13:14:18');
INSERT INTO `sys_log_201904` VALUES ('197209', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '46', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:14:18', '0', '2019-04-12 13:14:18');
INSERT INTO `sys_log_201904` VALUES ('197210', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '51', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:15:45', '0', '2019-04-12 13:15:45');
INSERT INTO `sys_log_201904` VALUES ('197211', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '69', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:15:45', '0', '2019-04-12 13:15:45');
INSERT INTO `sys_log_201904` VALUES ('197212', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '15', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:15:45', '0', '2019-04-12 13:15:45');
INSERT INTO `sys_log_201904` VALUES ('197213', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '40', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:14', '0', '2019-04-12 13:16:14');
INSERT INTO `sys_log_201904` VALUES ('197214', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '52', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:14', '0', '2019-04-12 13:16:14');
INSERT INTO `sys_log_201904` VALUES ('197215', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '93', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:14', '0', '2019-04-12 13:16:14');
INSERT INTO `sys_log_201904` VALUES ('197216', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197217', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '55', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197218', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '67', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197219', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '16', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197220', '44317', 'YX13300912345', '借款人--实名认证关闭', '9', 'com.yx.web.server.controller.user.FddUserController.authenticationCancel', null, '1', '35', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197221', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:16:25', '0', '2019-04-12 13:16:25');
INSERT INTO `sys_log_201904` VALUES ('197222', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '43', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:17:16', '0', '2019-04-12 13:17:16');
INSERT INTO `sys_log_201904` VALUES ('197223', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '97', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:17:16', '0', '2019-04-12 13:17:16');
INSERT INTO `sys_log_201904` VALUES ('197224', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '11', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:17:16', '0', '2019-04-12 13:17:16');
INSERT INTO `sys_log_201904` VALUES ('197225', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '52', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:20:42', '0', '2019-04-12 13:20:42');
INSERT INTO `sys_log_201904` VALUES ('197226', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '31', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:20:42', '0', '2019-04-12 13:20:42');
INSERT INTO `sys_log_201904` VALUES ('197227', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '64', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:20:42', '0', '2019-04-12 13:20:42');
INSERT INTO `sys_log_201904` VALUES ('197228', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '94', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:47:49', '0', '2019-04-12 13:47:49');
INSERT INTO `sys_log_201904` VALUES ('197229', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '49', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:47:49', '0', '2019-04-12 13:47:49');
INSERT INTO `sys_log_201904` VALUES ('197230', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '39', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:47:50', '0', '2019-04-12 13:47:50');
INSERT INTO `sys_log_201904` VALUES ('197231', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '139', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:47:50', '0', '2019-04-12 13:47:50');
INSERT INTO `sys_log_201904` VALUES ('197232', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '253', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 13:47:50', '0', '2019-04-12 13:47:50');
INSERT INTO `sys_log_201904` VALUES ('197233', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"99877e82-c206-45b8-b29c-7f5bc400314a\",\"captchaValue\":\"a2g6\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 13:56:54', '0', '2019-04-12 13:56:54');
INSERT INTO `sys_log_201904` VALUES ('197234', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"290cf8d8-ba76-4474-b7a2-6c15d3b45345\",\"captchaValue\":\"58vk\",\"password\":\"****\"}]', '1', '26', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 15:06:25', '0', '2019-04-12 15:06:25');
INSERT INTO `sys_log_201904` VALUES ('197235', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '108', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 15:13:40', '0', '2019-04-12 15:13:40');
INSERT INTO `sys_log_201904` VALUES ('197236', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '43', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:13:41', '0', '2019-04-12 15:13:41');
INSERT INTO `sys_log_201904` VALUES ('197237', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '107', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:13:41', '0', '2019-04-12 15:13:41');
INSERT INTO `sys_log_201904` VALUES ('197238', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '275', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:13:41', '0', '2019-04-12 15:13:41');
INSERT INTO `sys_log_201904` VALUES ('197239', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:14:13', '0', '2019-04-12 15:14:13');
INSERT INTO `sys_log_201904` VALUES ('197240', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '85', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:19:17', '0', '2019-04-12 15:19:17');
INSERT INTO `sys_log_201904` VALUES ('197241', '44316', 'YX13300812345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '55', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:19:19', '0', '2019-04-12 15:19:19');
INSERT INTO `sys_log_201904` VALUES ('197242', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 15:19:39', '0', '2019-04-12 15:19:39');
INSERT INTO `sys_log_201904` VALUES ('197243', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '39', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:19:39', '0', '2019-04-12 15:19:39');
INSERT INTO `sys_log_201904` VALUES ('197244', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '102', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:19:39', '0', '2019-04-12 15:19:39');
INSERT INTO `sys_log_201904` VALUES ('197245', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '306', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:19:39', '0', '2019-04-12 15:19:39');
INSERT INTO `sys_log_201904` VALUES ('197246', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '106', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 15:33:59', '0', '2019-04-12 15:33:59');
INSERT INTO `sys_log_201904` VALUES ('197247', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 15:34:00', '0', '2019-04-12 15:34:00');
INSERT INTO `sys_log_201904` VALUES ('197248', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '60', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 15:34:00', '0', '2019-04-12 15:34:00');
INSERT INTO `sys_log_201904` VALUES ('197249', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '88', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 15:52:21', '0', '2019-04-12 15:52:21');
INSERT INTO `sys_log_201904` VALUES ('197250', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '7', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:52:21', '0', '2019-04-12 15:52:21');
INSERT INTO `sys_log_201904` VALUES ('197251', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '70', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:52:21', '0', '2019-04-12 15:52:21');
INSERT INTO `sys_log_201904` VALUES ('197252', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '110', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:52:21', '0', '2019-04-12 15:52:21');
INSERT INTO `sys_log_201904` VALUES ('197253', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '207', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:52:21', '0', '2019-04-12 15:52:21');
INSERT INTO `sys_log_201904` VALUES ('197254', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"282cc596-b37b-456b-9b32-b090c4fabdea\",\"captchaValue\":\"dy55\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-12 15:53:05', '0', '2019-04-12 15:53:05');
INSERT INTO `sys_log_201904` VALUES ('197255', '44166', '二麻子哥', '获取微信分享链接', '9', 'com.yx.mobile.server.controller.referrer.ReferrerController.getWxSharUrl', null, '1', '91', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:54:42', '0', '2019-04-12 15:54:42');
INSERT INTO `sys_log_201904` VALUES ('197256', '44166', '二麻子哥', '获取二维码链接', '9', 'com.yx.mobile.server.controller.referrer.ReferrerController.getQrcodeUrl', null, '1', '126', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:54:42', '0', '2019-04-12 15:54:42');
INSERT INTO `sys_log_201904` VALUES ('197257', '44166', '二麻子哥', '查询用户推荐借款人列表', '1', 'com.yx.mobile.server.controller.referrer.ReferrerController.myReferrerBorrow', null, '1', '152', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:54:45', '0', '2019-04-12 15:54:45');
INSERT INTO `sys_log_201904` VALUES ('197258', '44166', '二麻子哥', '查询用户推荐列表', '1', 'com.yx.mobile.server.controller.referrer.ReferrerController.myReferrer', null, '1', '123', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:54:46', '0', '2019-04-12 15:54:46');
INSERT INTO `sys_log_201904` VALUES ('197259', '44166', '二麻子哥', '查询用户推荐列表', '1', 'com.yx.mobile.server.controller.referrer.ReferrerController.myReferrer', null, '1', '120', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:55:05', '0', '2019-04-12 15:55:05');
INSERT INTO `sys_log_201904` VALUES ('197260', '44166', '二麻子哥', '查询用户推荐借款人列表', '1', 'com.yx.mobile.server.controller.referrer.ReferrerController.myReferrerBorrow', null, '1', '120', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:55:06', '0', '2019-04-12 15:55:06');
INSERT INTO `sys_log_201904` VALUES ('197261', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '25', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:55:54', '0', '2019-04-12 15:55:54');
INSERT INTO `sys_log_201904` VALUES ('197262', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '120', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:56:05', '0', '2019-04-12 15:56:05');
INSERT INTO `sys_log_201904` VALUES ('197263', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '119', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:56:38', '0', '2019-04-12 15:56:38');
INSERT INTO `sys_log_201904` VALUES ('197264', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '132', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:57:04', '0', '2019-04-12 15:57:04');
INSERT INTO `sys_log_201904` VALUES ('197265', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '133', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 15:58:02', '0', '2019-04-12 15:58:02');
INSERT INTO `sys_log_201904` VALUES ('197266', '1016151836104032274', '唐华亮', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"tanghualiang\",\"captchaId\":\"da95c505-bc71-4625-b9a5-364bb2aba3c9\",\"captchaValue\":\"1834\",\"password\":\"****\"}]', '1', '82', '127.0.0.1', '6', null, '1', '0', '0', '2019-04-12 16:04:25', '0', '2019-04-12 16:04:25');
INSERT INTO `sys_log_201904` VALUES ('197267', '1016151836104032274', '唐华亮', '用户登出', '4', 'com.yx.admin.server.controller.sys.LoginController.logout', '[]', '1', '5', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-12 16:05:09', '0', '2019-04-12 16:05:09');
INSERT INTO `sys_log_201904` VALUES ('197268', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"42a38a77-a3a3-479d-bbfa-55330f881d8d\",\"captchaValue\":\"uzcu\",\"password\":\"****\"}]', '1', '36', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-12 16:05:29', '0', '2019-04-12 16:05:29');
INSERT INTO `sys_log_201904` VALUES ('197269', '1', '管理员', '用户新增', '1', 'com.yx.admin.server.controller.sys.SysUserController.add', '[{\"account\":\"xushanxiong\",\"deptId\":\"5\",\"email\":\"xu222131@sina.com\",\"enable\":1,\"idCard\":\"\",\"phone\":\"15817444928\",\"position\":\"\",\"qq\":\"\",\"role\":[],\"sex\":1,\"userName\":\"许想想\",\"weiBo\":\"\",\"weiXin\":\"\"}]', '1', '411', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-12 16:07:20', '0', '2019-04-12 16:07:20');
INSERT INTO `sys_log_201904` VALUES ('197270', '1', '管理员', '用户修改', '2', 'com.yx.admin.server.controller.sys.SysUserController.modify', '[{\"account\":\"xushanxiong\",\"deptId\":\"1\",\"email\":\"xu222131@sina.com\",\"enable\":1,\"id\":\"1016151836104032293\",\"idCard\":\"\",\"phone\":\"15817444928\",\"position\":\"\",\"qq\":\"\",\"role\":[],\"sex\":1,\"userName\":\"许想想\",\"weiBo\":\"\",\"weiXin\":\"\"}]', '1', '168', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-12 16:07:46', '0', '2019-04-12 16:07:46');
INSERT INTO `sys_log_201904` VALUES ('197271', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '92', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:06:44', '0', '2019-04-12 16:06:44');
INSERT INTO `sys_log_201904` VALUES ('197272', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:06:44', '0', '2019-04-12 16:06:44');
INSERT INTO `sys_log_201904` VALUES ('197273', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '48', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:06:45', '0', '2019-04-12 16:06:45');
INSERT INTO `sys_log_201904` VALUES ('197274', '1', '管理员', '用户修改', '2', 'com.yx.admin.server.controller.sys.SysUserController.modify', '[{\"account\":\"xushanxiong\",\"deptId\":\"1\",\"email\":\"xu222131@sina.com\",\"enable\":1,\"id\":\"1016151836104032293\",\"idCard\":\"\",\"phone\":\"15817444928\",\"position\":\"\",\"qq\":\"\",\"role\":[\"1\"],\"sex\":1,\"userName\":\"许想想\",\"weiBo\":\"\",\"weiXin\":\"\"}]', '1', '198', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-12 16:08:00', '0', '2019-04-12 16:08:00');
INSERT INTO `sys_log_201904` VALUES ('197275', '1', '管理员', '用户登出', '4', 'com.yx.admin.server.controller.sys.LoginController.logout', '[]', '1', '3', '127.0.0.1', '6', null, '1', '0', '0', '2019-04-12 16:08:06', '0', '2019-04-12 16:08:06');
INSERT INTO `sys_log_201904` VALUES ('197276', '1016151836104032293', '许想想', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"xushanxiong\",\"captchaId\":\"fa0edac2-7cad-4dab-bccd-6dffaceb83dd\",\"captchaValue\":\"ki8b\",\"password\":\"****\"}]', '1', '34', '127.0.0.1', '6', null, '1', '0', '0', '2019-04-12 16:08:22', '0', '2019-04-12 16:08:22');
INSERT INTO `sys_log_201904` VALUES ('197277', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '247', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:13:28', '0', '2019-04-12 16:13:28');
INSERT INTO `sys_log_201904` VALUES ('197278', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '226', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:15:48', '0', '2019-04-12 16:15:48');
INSERT INTO `sys_log_201904` VALUES ('197279', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '206', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:17:25', '0', '2019-04-12 16:17:25');
INSERT INTO `sys_log_201904` VALUES ('197280', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '145', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:18:07', '0', '2019-04-12 16:18:07');
INSERT INTO `sys_log_201904` VALUES ('197281', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '113', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:18:40', '0', '2019-04-12 16:18:40');
INSERT INTO `sys_log_201904` VALUES ('197282', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '120', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 16:19:52', '0', '2019-04-12 16:19:52');
INSERT INTO `sys_log_201904` VALUES ('197283', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '137', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:19:56', '0', '2019-04-12 16:19:56');
INSERT INTO `sys_log_201904` VALUES ('197284', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '207', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:26:52', '0', '2019-04-12 16:26:52');
INSERT INTO `sys_log_201904` VALUES ('197285', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-12 16:27:02', '0', '2019-04-12 16:27:02');
INSERT INTO `sys_log_201904` VALUES ('197286', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '35', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:27:02', '0', '2019-04-12 16:27:02');
INSERT INTO `sys_log_201904` VALUES ('197287', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '64', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:27:02', '0', '2019-04-12 16:27:02');
INSERT INTO `sys_log_201904` VALUES ('197288', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '64', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:27:02', '0', '2019-04-12 16:27:02');
INSERT INTO `sys_log_201904` VALUES ('197289', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '149', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:27:03', '0', '2019-04-12 16:27:03');
INSERT INTO `sys_log_201904` VALUES ('197290', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '249', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:36:03', '0', '2019-04-12 16:36:03');
INSERT INTO `sys_log_201904` VALUES ('197291', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '258', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-12 16:47:09', '0', '2019-04-12 16:47:09');
INSERT INTO `sys_log_201904` VALUES ('197292', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '94', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:48:52', '0', '2019-04-12 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197293', '44212', '1380000444', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:48:52', '0', '2019-04-12 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197294', '44212', '1380000444', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '45', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:48:52', '0', '2019-04-12 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197295', '44212', '1380000444', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '105', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:48:52', '0', '2019-04-12 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197296', '44212', '1380000444', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '112', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:48:52', '0', '2019-04-12 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197297', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '59', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:49:26', '0', '2019-04-12 16:49:26');
INSERT INTO `sys_log_201904` VALUES ('197298', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:49:26', '0', '2019-04-12 16:49:26');
INSERT INTO `sys_log_201904` VALUES ('197299', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '87', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:49:26', '0', '2019-04-12 16:49:26');
INSERT INTO `sys_log_201904` VALUES ('197300', '44212', '1380000444', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '53', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:20', '0', '2019-04-12 16:50:20');
INSERT INTO `sys_log_201904` VALUES ('197301', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '55', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:28', '0', '2019-04-12 16:50:28');
INSERT INTO `sys_log_201904` VALUES ('197302', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:28', '0', '2019-04-12 16:50:28');
INSERT INTO `sys_log_201904` VALUES ('197303', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '84', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:28', '0', '2019-04-12 16:50:28');
INSERT INTO `sys_log_201904` VALUES ('197304', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '84', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:28', '0', '2019-04-12 16:50:28');
INSERT INTO `sys_log_201904` VALUES ('197305', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '72', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:50:29', '0', '2019-04-12 16:50:29');
INSERT INTO `sys_log_201904` VALUES ('197306', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '80', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:52:19', '0', '2019-04-12 16:52:19');
INSERT INTO `sys_log_201904` VALUES ('197307', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '98', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:52:19', '0', '2019-04-12 16:52:19');
INSERT INTO `sys_log_201904` VALUES ('197308', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '57', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-12 16:52:19', '0', '2019-04-12 16:52:19');
INSERT INTO `sys_log_201904` VALUES ('197309', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '106', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:55:35', '0', '2019-04-12 16:55:35');
INSERT INTO `sys_log_201904` VALUES ('197310', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '106', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:55:35', '0', '2019-04-12 16:55:35');
INSERT INTO `sys_log_201904` VALUES ('197311', '44189', 'YX13699170634', '借款人--实名认证关闭', '9', 'com.yx.wx.server.controller.user.FddUserController.authenticationCancel', null, '1', '109', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 16:55:35', '0', '2019-04-12 16:55:35');
INSERT INTO `sys_log_201904` VALUES ('197312', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '62', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:10:51', '0', '2019-04-12 17:10:51');
INSERT INTO `sys_log_201904` VALUES ('197313', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '101', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:10:51', '0', '2019-04-12 17:10:51');
INSERT INTO `sys_log_201904` VALUES ('197314', '44189', 'YX13699170634', '借款人--实名认证关闭', '9', 'com.yx.wx.server.controller.user.FddUserController.authenticationCancel', null, '1', '144', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:10:51', '0', '2019-04-12 17:10:51');
INSERT INTO `sys_log_201904` VALUES ('197315', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '60', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:20', '0', '2019-04-12 17:34:20');
INSERT INTO `sys_log_201904` VALUES ('197316', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:28', '0', '2019-04-12 17:34:28');
INSERT INTO `sys_log_201904` VALUES ('197317', '44166', '二麻子哥', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '98', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:28', '0', '2019-04-12 17:34:28');
INSERT INTO `sys_log_201904` VALUES ('197318', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '244', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:28', '0', '2019-04-12 17:34:28');
INSERT INTO `sys_log_201904` VALUES ('197319', '44166', '二麻子哥', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '46', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:58', '0', '2019-04-12 17:34:58');
INSERT INTO `sys_log_201904` VALUES ('197320', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '246', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:34:58', '0', '2019-04-12 17:34:58');
INSERT INTO `sys_log_201904` VALUES ('197321', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '216', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:35:16', '0', '2019-04-12 17:35:16');
INSERT INTO `sys_log_201904` VALUES ('197322', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '222', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:35:39', '0', '2019-04-12 17:35:39');
INSERT INTO `sys_log_201904` VALUES ('197323', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '222', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:35:49', '0', '2019-04-12 17:35:49');
INSERT INTO `sys_log_201904` VALUES ('197324', '44166', '二麻子哥', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '67', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:35:58', '0', '2019-04-12 17:35:58');
INSERT INTO `sys_log_201904` VALUES ('197325', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '231', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:36:13', '0', '2019-04-12 17:36:13');
INSERT INTO `sys_log_201904` VALUES ('197326', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '224', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:36:38', '0', '2019-04-12 17:36:38');
INSERT INTO `sys_log_201904` VALUES ('197327', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '102', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:31', '0', '2019-04-12 17:56:31');
INSERT INTO `sys_log_201904` VALUES ('197328', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:31', '0', '2019-04-12 17:56:31');
INSERT INTO `sys_log_201904` VALUES ('197329', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:31', '0', '2019-04-12 17:56:31');
INSERT INTO `sys_log_201904` VALUES ('197330', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:35', '0', '2019-04-12 17:56:35');
INSERT INTO `sys_log_201904` VALUES ('197331', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '51', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:36', '0', '2019-04-12 17:56:36');
INSERT INTO `sys_log_201904` VALUES ('197332', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '91', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-12 17:56:36', '0', '2019-04-12 17:56:36');
INSERT INTO `sys_log_201904` VALUES ('197333', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"60ddd109-382a-45fb-9fa9-b5c342a682d8\",\"captchaValue\":\"sbi8\",\"password\":\"****\"}]', '1', '48', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 10:40:28', '0', '2019-04-13 10:40:28');
INSERT INTO `sys_log_201904` VALUES ('197334', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":0,\"id\":\"5\"}]', '1', '58', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 11:08:31', '0', '2019-04-13 11:08:31');
INSERT INTO `sys_log_201904` VALUES ('197335', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":1,\"id\":\"5\"}]', '1', '60', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 11:08:33', '0', '2019-04-13 11:08:33');
INSERT INTO `sys_log_201904` VALUES ('197336', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '1078', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:24:59', '0', '2019-04-13 11:24:59');
INSERT INTO `sys_log_201904` VALUES ('197337', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"a74c6fa2-07ed-47a9-8206-5a8229ea1dcb\",\"captchaValue\":\"9cz5\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 11:25:10', '0', '2019-04-13 11:25:10');
INSERT INTO `sys_log_201904` VALUES ('197338', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '27', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 11:25:33', '0', '2019-04-13 11:25:33');
INSERT INTO `sys_log_201904` VALUES ('197339', '0', '0', '注册获取短信验证码', '9', 'com.yx.web.server.controller.user.UserController.registerSmsCode', null, '0', '1', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 11:27:11', '0', '2019-04-13 11:27:11');
INSERT INTO `sys_log_201904` VALUES ('197340', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '15', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 11:27:11', '0', '2019-04-13 11:27:11');
INSERT INTO `sys_log_201904` VALUES ('197341', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '13', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:27:39', '0', '2019-04-13 11:27:39');
INSERT INTO `sys_log_201904` VALUES ('197342', '0', '0', '注册获取短信验证码', '9', 'com.yx.web.server.controller.user.UserController.registerSmsCode', null, '1', '379', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:27:48', '0', '2019-04-13 11:27:48');
INSERT INTO `sys_log_201904` VALUES ('197343', '0', '0', '企业用户注册', '1', 'com.yx.web.server.controller.user.UserController.companyRegister', null, '1', '404', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:35', '0', '2019-04-13 11:28:35');
INSERT INTO `sys_log_201904` VALUES ('197344', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '57', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:36', '0', '2019-04-13 11:28:36');
INSERT INTO `sys_log_201904` VALUES ('197345', '44320', 'YX13500000000', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '52', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:36', '0', '2019-04-13 11:28:36');
INSERT INTO `sys_log_201904` VALUES ('197346', '44320', 'YX13500000000', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '66', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:38', '0', '2019-04-13 11:28:38');
INSERT INTO `sys_log_201904` VALUES ('197347', '44320', 'YX13500000000', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:38', '0', '2019-04-13 11:28:38');
INSERT INTO `sys_log_201904` VALUES ('197348', '44320', 'YX13500000000', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '129', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:38', '0', '2019-04-13 11:28:38');
INSERT INTO `sys_log_201904` VALUES ('197349', '44320', 'YX13500000000', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '50', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:28:47', '0', '2019-04-13 11:28:47');
INSERT INTO `sys_log_201904` VALUES ('197350', '44320', 'YX13500000000', '企业开通存管账户', '9', 'com.yx.web.server.controller.user.UserController.companyAccountOpen', null, '1', '380', '112.96.38.1', '1', null, '1', '0', '0', '2019-04-13 11:30:26', '0', '2019-04-13 11:30:26');
INSERT INTO `sys_log_201904` VALUES ('197351', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '56', '112.96.38.1', '3', null, '1', '0', '0', '2019-04-13 11:33:43', '0', '2019-04-13 11:33:43');
INSERT INTO `sys_log_201904` VALUES ('197352', '44320', 'YX13500000000', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '17', '112.96.38.1', '3', null, '1', '0', '0', '2019-04-13 11:33:43', '0', '2019-04-13 11:33:43');
INSERT INTO `sys_log_201904` VALUES ('197353', '44320', 'YX13500000000', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '80', '112.96.38.1', '3', null, '1', '0', '0', '2019-04-13 11:33:43', '0', '2019-04-13 11:33:43');
INSERT INTO `sys_log_201904` VALUES ('197354', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"311a31a9-ffeb-4e27-b061-f5689bb32e75\",\"captchaValue\":\"evp3\",\"password\":\"****\"}]', '1', '69', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 13:47:48', '0', '2019-04-13 13:47:48');
INSERT INTO `sys_log_201904` VALUES ('197355', '1016151836104032271', '张晓文', '借款申请列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPage', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '130', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 13:51:50', '0', '2019-04-13 13:51:50');
INSERT INTO `sys_log_201904` VALUES ('197356', '1016151836104032271', '张晓文', '借款申请初审的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageFirst', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '48', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 13:52:39', '0', '2019-04-13 13:52:39');
INSERT INTO `sys_log_201904` VALUES ('197357', '1016151836104032271', '张晓文', '借款复审申请的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageSecond', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '45', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 13:52:56', '0', '2019-04-13 13:52:56');
INSERT INTO `sys_log_201904` VALUES ('197358', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"d539e37a-f58a-4b34-8f95-46d8adfd7118\",\"captchaValue\":\"pf2r\",\"password\":\"****\"}]', '1', '27', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:21:23', '0', '2019-04-13 14:21:23');
INSERT INTO `sys_log_201904` VALUES ('197359', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '62', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:18', '0', '2019-04-13 14:22:18');
INSERT INTO `sys_log_201904` VALUES ('197360', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '62', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:18', '0', '2019-04-13 14:22:18');
INSERT INTO `sys_log_201904` VALUES ('197361', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '80', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:19', '0', '2019-04-13 14:22:19');
INSERT INTO `sys_log_201904` VALUES ('197362', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '131', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:19', '0', '2019-04-13 14:22:19');
INSERT INTO `sys_log_201904` VALUES ('197363', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '199', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:19', '0', '2019-04-13 14:22:19');
INSERT INTO `sys_log_201904` VALUES ('197364', '44318', 'YX13301012345', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:24', '0', '2019-04-13 14:22:24');
INSERT INTO `sys_log_201904` VALUES ('197365', '1016151836104032288', '张绍刚', '客户余额查询', '9', 'com.yx.admin.server.controller.user.UserInfoController.queryAccountInfo', '[{\"id\":\"44317\"}]', '1', '171', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:22:31', '0', '2019-04-13 14:22:31');
INSERT INTO `sys_log_201904` VALUES ('197366', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:57', '0', '2019-04-13 14:22:57');
INSERT INTO `sys_log_201904` VALUES ('197367', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:57', '0', '2019-04-13 14:22:57');
INSERT INTO `sys_log_201904` VALUES ('197368', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '53', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:58', '0', '2019-04-13 14:22:58');
INSERT INTO `sys_log_201904` VALUES ('197369', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '86', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:58', '0', '2019-04-13 14:22:58');
INSERT INTO `sys_log_201904` VALUES ('197370', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '164', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:22:58', '0', '2019-04-13 14:22:58');
INSERT INTO `sys_log_201904` VALUES ('197371', '1016151836104032288', '张绍刚', '客户余额查询', '9', 'com.yx.admin.server.controller.user.UserInfoController.queryAccountInfo', '[{\"id\":\"44316\"}]', '1', '151', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:23:12', '0', '2019-04-13 14:23:12');
INSERT INTO `sys_log_201904` VALUES ('197372', '44317', 'YX13300912345', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:22', '0', '2019-04-13 14:23:22');
INSERT INTO `sys_log_201904` VALUES ('197373', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:27', '0', '2019-04-13 14:23:27');
INSERT INTO `sys_log_201904` VALUES ('197374', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:27', '0', '2019-04-13 14:23:27');
INSERT INTO `sys_log_201904` VALUES ('197375', '44316', 'YX13300812345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '63', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:28', '0', '2019-04-13 14:23:28');
INSERT INTO `sys_log_201904` VALUES ('197376', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '86', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:28', '0', '2019-04-13 14:23:28');
INSERT INTO `sys_log_201904` VALUES ('197377', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '167', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:23:28', '0', '2019-04-13 14:23:28');
INSERT INTO `sys_log_201904` VALUES ('197378', '1016151836104032288', '张绍刚', '客户余额查询', '9', 'com.yx.admin.server.controller.user.UserInfoController.queryAccountInfo', '[{\"id\":\"44315\"}]', '1', '152', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:23:43', '0', '2019-04-13 14:23:43');
INSERT INTO `sys_log_201904` VALUES ('197379', '1016151836104032288', '张绍刚', '客户余额查询', '9', 'com.yx.admin.server.controller.user.UserInfoController.queryAccountInfo', '[{\"id\":\"44308\"}]', '1', '160', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:24:14', '0', '2019-04-13 14:24:14');
INSERT INTO `sys_log_201904` VALUES ('197380', '44316', 'YX13300812345', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '60', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:19', '0', '2019-04-13 14:24:19');
INSERT INTO `sys_log_201904` VALUES ('197381', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '62', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:24', '0', '2019-04-13 14:24:24');
INSERT INTO `sys_log_201904` VALUES ('197382', '44308', 'YX18911012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '79', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:25', '0', '2019-04-13 14:24:25');
INSERT INTO `sys_log_201904` VALUES ('197383', '44308', 'YX18911012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '45', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:25', '0', '2019-04-13 14:24:25');
INSERT INTO `sys_log_201904` VALUES ('197384', '44308', 'YX18911012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '108', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:25', '0', '2019-04-13 14:24:25');
INSERT INTO `sys_log_201904` VALUES ('197385', '44308', 'YX18911012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '168', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:24:25', '0', '2019-04-13 14:24:25');
INSERT INTO `sys_log_201904` VALUES ('197386', '1016151836104032288', '张绍刚', '客户余额查询', '9', 'com.yx.admin.server.controller.user.UserInfoController.queryAccountInfo', '[{\"id\":\"44307\"}]', '1', '152', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 14:24:39', '0', '2019-04-13 14:24:39');
INSERT INTO `sys_log_201904` VALUES ('197387', '44308', 'YX18911012345', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '87', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:47:48', '0', '2019-04-13 14:47:48');
INSERT INTO `sys_log_201904` VALUES ('197388', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '63', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:01', '0', '2019-04-13 14:48:01');
INSERT INTO `sys_log_201904` VALUES ('197389', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:01', '0', '2019-04-13 14:48:01');
INSERT INTO `sys_log_201904` VALUES ('197390', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '69', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:02', '0', '2019-04-13 14:48:02');
INSERT INTO `sys_log_201904` VALUES ('197391', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '77', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:02', '0', '2019-04-13 14:48:02');
INSERT INTO `sys_log_201904` VALUES ('197392', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '223', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:02', '0', '2019-04-13 14:48:02');
INSERT INTO `sys_log_201904` VALUES ('197393', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:09', '0', '2019-04-13 14:48:09');
INSERT INTO `sys_log_201904` VALUES ('197394', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '171', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:09', '0', '2019-04-13 14:48:09');
INSERT INTO `sys_log_201904` VALUES ('197395', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '48', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:48', '0', '2019-04-13 14:48:48');
INSERT INTO `sys_log_201904` VALUES ('197396', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '96', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:48', '0', '2019-04-13 14:48:48');
INSERT INTO `sys_log_201904` VALUES ('197397', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '182', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:48', '0', '2019-04-13 14:48:48');
INSERT INTO `sys_log_201904` VALUES ('197398', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:48:56', '0', '2019-04-13 14:48:56');
INSERT INTO `sys_log_201904` VALUES ('197399', '44318', 'YX13301012345', '自动出借授权（新）', '1', 'com.yx.web.server.controller.auth.AuthController.autoBidAuthNew', null, '1', '434', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:11', '0', '2019-04-13 14:49:11');
INSERT INTO `sys_log_201904` VALUES ('197400', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:23', '0', '2019-04-13 14:49:23');
INSERT INTO `sys_log_201904` VALUES ('197401', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '46', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:26', '0', '2019-04-13 14:49:26');
INSERT INTO `sys_log_201904` VALUES ('197402', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '53', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:26', '0', '2019-04-13 14:49:26');
INSERT INTO `sys_log_201904` VALUES ('197403', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '44', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:27', '0', '2019-04-13 14:49:27');
INSERT INTO `sys_log_201904` VALUES ('197404', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '49', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:32', '0', '2019-04-13 14:49:32');
INSERT INTO `sys_log_201904` VALUES ('197405', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '164', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:32', '0', '2019-04-13 14:49:32');
INSERT INTO `sys_log_201904` VALUES ('197406', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:52', '0', '2019-04-13 14:49:52');
INSERT INTO `sys_log_201904` VALUES ('197407', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '167', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 14:49:53', '0', '2019-04-13 14:49:53');
INSERT INTO `sys_log_201904` VALUES ('197408', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"9fb82e07-7a77-46aa-8f12-9a746ceca9d1\",\"captchaValue\":\"40i6\",\"password\":\"****\"}]', '1', '66', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 15:53:36', '0', '2019-04-13 15:53:36');
INSERT INTO `sys_log_201904` VALUES ('197409', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '57', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:43', '0', '2019-04-13 16:20:43');
INSERT INTO `sys_log_201904` VALUES ('197410', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:43', '0', '2019-04-13 16:20:43');
INSERT INTO `sys_log_201904` VALUES ('197411', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '38', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:44', '0', '2019-04-13 16:20:44');
INSERT INTO `sys_log_201904` VALUES ('197412', '44317', 'YX13300912345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '118', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:44', '0', '2019-04-13 16:20:44');
INSERT INTO `sys_log_201904` VALUES ('197413', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '57', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:44', '0', '2019-04-13 16:20:44');
INSERT INTO `sys_log_201904` VALUES ('197414', '44317', 'YX13300912345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:50', '0', '2019-04-13 16:20:50');
INSERT INTO `sys_log_201904` VALUES ('197415', '44317', 'YX13300912345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '173', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:20:51', '0', '2019-04-13 16:20:51');
INSERT INTO `sys_log_201904` VALUES ('197416', '44317', 'YX13300912345', '用户退出', '4', 'com.yx.web.server.controller.user.UserController.logout', null, '1', '57', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:04', '0', '2019-04-13 16:21:04');
INSERT INTO `sys_log_201904` VALUES ('197417', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:14', '0', '2019-04-13 16:21:14');
INSERT INTO `sys_log_201904` VALUES ('197418', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:14', '0', '2019-04-13 16:21:14');
INSERT INTO `sys_log_201904` VALUES ('197419', '44316', 'YX13300812345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '43', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:14', '0', '2019-04-13 16:21:14');
INSERT INTO `sys_log_201904` VALUES ('197420', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '87', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:14', '0', '2019-04-13 16:21:14');
INSERT INTO `sys_log_201904` VALUES ('197421', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '164', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:14', '0', '2019-04-13 16:21:14');
INSERT INTO `sys_log_201904` VALUES ('197422', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:21', '0', '2019-04-13 16:21:21');
INSERT INTO `sys_log_201904` VALUES ('197423', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '182', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:21', '0', '2019-04-13 16:21:21');
INSERT INTO `sys_log_201904` VALUES ('197424', '44316', 'YX13300812345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '43', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:38', '0', '2019-04-13 16:21:38');
INSERT INTO `sys_log_201904` VALUES ('197425', '44316', 'YX13300812345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '41', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:38', '0', '2019-04-13 16:21:38');
INSERT INTO `sys_log_201904` VALUES ('197426', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '65', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:38', '0', '2019-04-13 16:21:38');
INSERT INTO `sys_log_201904` VALUES ('197427', '44316', 'YX13300812345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '177', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:21:40', '0', '2019-04-13 16:21:40');
INSERT INTO `sys_log_201904` VALUES ('197428', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '63', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:43:57', '0', '2019-04-13 16:43:57');
INSERT INTO `sys_log_201904` VALUES ('197429', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '15', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-13 16:44:06', '0', '2019-04-13 16:44:06');
INSERT INTO `sys_log_201904` VALUES ('197430', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"3764aac0-97fc-4dc4-b9b4-4213840c84f2\",\"captchaValue\":\"qeje\",\"password\":\"****\"}]', '1', '25', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 16:45:49', '0', '2019-04-13 16:45:49');
INSERT INTO `sys_log_201904` VALUES ('197431', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"2b14b269-c063-41a9-97f1-ec2f1c3ac954\",\"captchaValue\":\"44tu\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 16:48:41', '0', '2019-04-13 16:48:41');
INSERT INTO `sys_log_201904` VALUES ('197432', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"46fdcc72-744e-4e77-80c3-1c2f7cdada7d\",\"captchaValue\":\"fpnj\",\"password\":\"****\"}]', '1', '38', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 16:59:41', '0', '2019-04-13 16:59:41');
INSERT INTO `sys_log_201904` VALUES ('197433', '1016151836104032288', '张绍刚', '用户登出', '4', 'com.yx.admin.server.controller.sys.LoginController.logout', '[]', '1', '8', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 17:00:05', '0', '2019-04-13 17:00:05');
INSERT INTO `sys_log_201904` VALUES ('197434', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"ed854873-cb85-477a-b11e-7915096ebbdc\",\"captchaValue\":\"KEZE\",\"password\":\"****\"}]', '1', '44', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 17:01:33', '0', '2019-04-13 17:01:33');
INSERT INTO `sys_log_201904` VALUES ('197435', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"2273da3f-6e5e-4504-8307-6fb362e23893\",\"captchaValue\":\"j6u0\",\"password\":\"****\"}]', '1', '63', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 17:43:35', '0', '2019-04-13 17:43:35');
INSERT INTO `sys_log_201904` VALUES ('197436', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"45c7a774-1b0a-47d8-84b7-38407c6ad9da\",\"captchaValue\":\"gnrx\",\"password\":\"****\"}]', '1', '64', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-13 18:01:30', '0', '2019-04-13 18:01:30');
INSERT INTO `sys_log_201904` VALUES ('197437', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"81aa0bb2-1d6e-4604-90ea-bdb05e52888b\",\"captchaValue\":\"zqyy\",\"password\":\"****\"}]', '1', '5862', '0:0:0:0:0:0:0:1', '6', null, '1', '0', '0', '2019-04-14 21:48:14', '0', '2019-04-14 21:48:14');
INSERT INTO `sys_log_201904` VALUES ('197438', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"f5efc261-60fa-402b-b82b-7e995594771a\",\"captchaValue\":\"hqcq\",\"password\":\"****\"}]', '1', '36', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 08:57:31', '0', '2019-04-15 08:57:31');
INSERT INTO `sys_log_201904` VALUES ('197439', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '100', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 09:14:44', '0', '2019-04-15 09:14:44');
INSERT INTO `sys_log_201904` VALUES ('197440', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '62', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 09:14:45', '0', '2019-04-15 09:14:45');
INSERT INTO `sys_log_201904` VALUES ('197441', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '315', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 09:17:47', '0', '2019-04-15 09:17:47');
INSERT INTO `sys_log_201904` VALUES ('197442', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"9221eee7-ac03-4bcf-9ac6-eba9278b3853\",\"captchaValue\":\"f98y\",\"password\":\"****\"}]', '1', '37', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:35:22', '0', '2019-04-15 09:35:22');
INSERT INTO `sys_log_201904` VALUES ('197443', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"e1da71fb-6cac-405f-b04b-89e0aa445326\",\"captchaValue\":\"p54m\",\"password\":\"****\"}]', '1', '61', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:50:10', '0', '2019-04-15 09:50:10');
INSERT INTO `sys_log_201904` VALUES ('197444', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"cb267988-be4e-4171-b58b-65964e1ec1b1\",\"captchaValue\":\"sr3x\",\"password\":\"****\"}]', '1', '33', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:50:57', '0', '2019-04-15 09:50:57');
INSERT INTO `sys_log_201904` VALUES ('197445', '1016151836104032271', '张晓文', '修改内容标方法', '2', 'com.yx.admin.server.controller.sys.SysContentController.update', null, '1', '980', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:51:26', '0', '2019-04-15 09:51:26');
INSERT INTO `sys_log_201904` VALUES ('197446', '1016151836104032271', '张晓文', '修改内容标方法', '2', 'com.yx.admin.server.controller.sys.SysContentController.update', null, '1', '319', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:51:42', '0', '2019-04-15 09:51:42');
INSERT INTO `sys_log_201904` VALUES ('197447', '1016151836104032271', '张晓文', '修改内容标方法', '2', 'com.yx.admin.server.controller.sys.SysContentController.update', null, '1', '241', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 09:51:58', '0', '2019-04-15 09:51:58');
INSERT INTO `sys_log_201904` VALUES ('197448', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"b4ecb545-d73a-4700-83b8-5078106a3bae\",\"captchaValue\":\"k8j8\",\"password\":\"****\"}]', '1', '32', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:10:18', '0', '2019-04-15 10:10:18');
INSERT INTO `sys_log_201904` VALUES ('197449', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '257', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 10:13:17', '0', '2019-04-15 10:13:17');
INSERT INTO `sys_log_201904` VALUES ('197450', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"e1b822b7-4975-42b7-8b39-ee6fd9e4881a\",\"captchaValue\":\"cczk\",\"password\":\"****\"}]', '1', '28', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:20:45', '0', '2019-04-15 10:20:45');
INSERT INTO `sys_log_201904` VALUES ('197451', '1016151836104032271', '张晓文', '新增活动信息', '1', 'com.yx.admin.server.controller.activity.ActivityInfoController.addActivityModel', '[{\"activityEffectiveType\":1,\"activityName\":\"11111\",\"activityOrganizer\":1,\"forecastOutlay\":11111,\"remark\":\"\"}]', '1', '96', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:22:23', '0', '2019-04-15 10:22:23');
INSERT INTO `sys_log_201904` VALUES ('197452', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '223', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 10:24:14', '0', '2019-04-15 10:24:14');
INSERT INTO `sys_log_201904` VALUES ('197453', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '55', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 10:25:02', '0', '2019-04-15 10:25:02');
INSERT INTO `sys_log_201904` VALUES ('197454', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '112', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:02', '0', '2019-04-15 10:25:02');
INSERT INTO `sys_log_201904` VALUES ('197455', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '168', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:02', '0', '2019-04-15 10:25:02');
INSERT INTO `sys_log_201904` VALUES ('197456', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '284', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:03', '0', '2019-04-15 10:25:03');
INSERT INTO `sys_log_201904` VALUES ('197457', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '220', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:11', '0', '2019-04-15 10:25:11');
INSERT INTO `sys_log_201904` VALUES ('197458', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:37', '0', '2019-04-15 10:25:37');
INSERT INTO `sys_log_201904` VALUES ('197459', '44309', 'YX13300112345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '61', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:40', '0', '2019-04-15 10:25:40');
INSERT INTO `sys_log_201904` VALUES ('197460', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '66', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 10:25:48', '0', '2019-04-15 10:25:48');
INSERT INTO `sys_log_201904` VALUES ('197461', '44310', 'YX13300212345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '99', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:49', '0', '2019-04-15 10:25:49');
INSERT INTO `sys_log_201904` VALUES ('197462', '44310', 'YX13300212345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '99', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:49', '0', '2019-04-15 10:25:49');
INSERT INTO `sys_log_201904` VALUES ('197463', '44310', 'YX13300212345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '190', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:49', '0', '2019-04-15 10:25:49');
INSERT INTO `sys_log_201904` VALUES ('197464', '44310', 'YX13300212345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:51', '0', '2019-04-15 10:25:51');
INSERT INTO `sys_log_201904` VALUES ('197465', '44310', 'YX13300212345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '222', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:51', '0', '2019-04-15 10:25:51');
INSERT INTO `sys_log_201904` VALUES ('197466', '44310', 'YX13300212345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '183', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:25:57', '0', '2019-04-15 10:25:57');
INSERT INTO `sys_log_201904` VALUES ('197467', '44310', 'YX13300212345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '60', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:23', '0', '2019-04-15 10:26:23');
INSERT INTO `sys_log_201904` VALUES ('197468', '44310', 'YX13300212345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '53', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:28', '0', '2019-04-15 10:26:28');
INSERT INTO `sys_log_201904` VALUES ('197469', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '33', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 10:26:39', '0', '2019-04-15 10:26:39');
INSERT INTO `sys_log_201904` VALUES ('197470', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '54', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 10:26:47', '0', '2019-04-15 10:26:47');
INSERT INTO `sys_log_201904` VALUES ('197471', '44311', 'YX13300312345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '56', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:47', '0', '2019-04-15 10:26:47');
INSERT INTO `sys_log_201904` VALUES ('197472', '44311', 'YX13300312345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '96', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:47', '0', '2019-04-15 10:26:47');
INSERT INTO `sys_log_201904` VALUES ('197473', '44311', 'YX13300312345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '225', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:47', '0', '2019-04-15 10:26:47');
INSERT INTO `sys_log_201904` VALUES ('197474', '44311', 'YX13300312345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '187', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:26:59', '0', '2019-04-15 10:26:59');
INSERT INTO `sys_log_201904` VALUES ('197475', '44311', 'YX13300312345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '59', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:30:13', '0', '2019-04-15 10:30:13');
INSERT INTO `sys_log_201904` VALUES ('197476', '44311', 'YX13300312345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '63', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:30:15', '0', '2019-04-15 10:30:15');
INSERT INTO `sys_log_201904` VALUES ('197477', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 10:30:28', '0', '2019-04-15 10:30:28');
INSERT INTO `sys_log_201904` VALUES ('197478', '44291', 'YX18906012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '42', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:30:29', '0', '2019-04-15 10:30:29');
INSERT INTO `sys_log_201904` VALUES ('197479', '44291', 'YX18906012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '149', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:30:29', '0', '2019-04-15 10:30:29');
INSERT INTO `sys_log_201904` VALUES ('197480', '44291', 'YX18906012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '204', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:30:29', '0', '2019-04-15 10:30:29');
INSERT INTO `sys_log_201904` VALUES ('197481', '44291', 'YX18906012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '82', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 10:41:05', '0', '2019-04-15 10:41:05');
INSERT INTO `sys_log_201904` VALUES ('197482', '1016151836104032273', '颜秉豪', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"yanbinghao\",\"captchaId\":\"750b8b14-7c8f-4f42-aaf3-d085c2a298b0\",\"captchaValue\":\"dvss\",\"password\":\"****\"}]', '1', '37', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:43:03', '0', '2019-04-15 10:43:03');
INSERT INTO `sys_log_201904` VALUES ('197483', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '80', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 10:47:06', '0', '2019-04-15 10:47:06');
INSERT INTO `sys_log_201904` VALUES ('197484', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '285', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 10:47:06', '0', '2019-04-15 10:47:06');
INSERT INTO `sys_log_201904` VALUES ('197485', '1016151836104032286', '李文英', '发送短信', '9', 'com.yx.admin.server.controller.common.CommonController.sendSms', '[]', '1', '354', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:59:03', '0', '2019-04-15 10:59:03');
INSERT INTO `sys_log_201904` VALUES ('197486', '1016151836104032286', '李文英', '根据标的id放款', '1', 'com.yx.admin.server.controller.product.ProductController.loan', '[{\"captchaId\":\"5747cb7d9bfe4d4ebcc385f848a87deb\",\"id\":\"688\",\"smsCode\":\"713480\"}]', '1', '1350', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 10:59:23', '0', '2019-04-15 10:59:23');
INSERT INTO `sys_log_201904` VALUES ('197487', '44291', 'YX18906012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '208', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 11:11:32', '0', '2019-04-15 11:11:32');
INSERT INTO `sys_log_201904` VALUES ('197488', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"17ecef7a-feab-47d1-9bbe-5b233412b7cb\",\"captchaValue\":\"kze0\",\"password\":\"****\"}]', '1', '63', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:17:49', '0', '2019-04-15 11:17:49');
INSERT INTO `sys_log_201904` VALUES ('197489', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"44839d93-f5a5-414a-b773-e1eb5cd7daaf\",\"captchaValue\":\"oz96\",\"password\":\"****\"}]', '1', '51', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:34:17', '0', '2019-04-15 11:34:17');
INSERT INTO `sys_log_201904` VALUES ('197490', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":1,\"id\":\"131\",\"paramKey\":\"FLOW_PRODUCT_SMS_PHONE\",\"paramValue\":\"19999999990\",\"remark\":\"流标成功发送通知短信的手机号码名单\"}]', '1', '60', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:34:55', '0', '2019-04-15 11:34:55');
INSERT INTO `sys_log_201904` VALUES ('197491', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":1,\"id\":\"132\",\"paramKey\":\"LOAN_PRODUCT_SMS_PHONE\",\"paramValue\":\"19999999990\",\"remark\":\"放款成功发送通知短信的手机号码名单\"}]', '1', '60', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:35:23', '0', '2019-04-15 11:35:23');
INSERT INTO `sys_log_201904` VALUES ('197492', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":1,\"id\":\"133\",\"paramKey\":\"ADVANCE_PRODUCT_SMS_PHONE\",\"paramValue\":\"19999999990\",\"remark\":\"垫付成功发送通知短信的手机号码名单\"}]', '1', '61', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:35:32', '0', '2019-04-15 11:35:32');
INSERT INTO `sys_log_201904` VALUES ('197493', '1016151836104032271', '张晓文', '参数修改', '2', 'com.yx.admin.server.controller.sys.SysParamController.modify', '[{\"enable\":1,\"id\":\"134\",\"paramKey\":\"SENDEMAIL_REPAYMENTPLAN\",\"paramValue\":\"19999999990@qq.com\",\"remark\":\"定时发送待还还款计划信息\"}]', '1', '62', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:35:46', '0', '2019-04-15 11:35:46');
INSERT INTO `sys_log_201904` VALUES ('197494', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"2f462a32-5757-4d00-a211-3eb244ed871e\",\"captchaValue\":\"j3pe\",\"password\":\"****\"}]', '1', '36', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:37:15', '0', '2019-04-15 11:37:15');
INSERT INTO `sys_log_201904` VALUES ('197495', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"d9acee62-af46-4f80-be51-2e59ab2c3245\",\"captchaValue\":\"fawt\",\"password\":\"****\"}]', '1', '64', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 11:53:38', '0', '2019-04-15 11:53:38');
INSERT INTO `sys_log_201904` VALUES ('197496', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '31', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 13:10:36', '0', '2019-04-15 13:10:36');
INSERT INTO `sys_log_201904` VALUES ('197497', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 13:10:50', '0', '2019-04-15 13:10:50');
INSERT INTO `sys_log_201904` VALUES ('197498', '44235', 'YX18811537937', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '56', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 13:10:50', '0', '2019-04-15 13:10:50');
INSERT INTO `sys_log_201904` VALUES ('197499', '44235', 'YX18811537937', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '96', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 13:10:50', '0', '2019-04-15 13:10:50');
INSERT INTO `sys_log_201904` VALUES ('197500', '44235', 'YX18811537937', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '231', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 13:10:50', '0', '2019-04-15 13:10:50');
INSERT INTO `sys_log_201904` VALUES ('197501', '1016151836104032280', '刘建官', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liujianguan\",\"captchaId\":\"86b72211-0058-4656-baa6-00a6748fe819\",\"captchaValue\":\"sut9\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 13:11:08', '0', '2019-04-15 13:11:08');
INSERT INTO `sys_log_201904` VALUES ('197502', '44235', 'YX18811537937', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '186', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 13:14:21', '0', '2019-04-15 13:14:21');
INSERT INTO `sys_log_201904` VALUES ('197503', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"0496bf0e-bf58-41a6-8fe2-c8d679186950\",\"captchaValue\":\"yz54\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 13:26:59', '0', '2019-04-15 13:26:59');
INSERT INTO `sys_log_201904` VALUES ('197504', '1016151836104032286', '李文英', '借款申请列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPage', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '88', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 13:28:44', '0', '2019-04-15 13:28:44');
INSERT INTO `sys_log_201904` VALUES ('197505', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"b42d7759-6d57-4a72-8a64-6c624ab0aaff\",\"captchaValue\":\"schq\",\"password\":\"****\"}]', '1', '33', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 13:54:38', '0', '2019-04-15 13:54:38');
INSERT INTO `sys_log_201904` VALUES ('197506', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '58', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:08:00', '0', '2019-04-15 14:08:00');
INSERT INTO `sys_log_201904` VALUES ('197507', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '31', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:08:10', '0', '2019-04-15 14:08:10');
INSERT INTO `sys_log_201904` VALUES ('197508', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '32', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:08:21', '0', '2019-04-15 14:08:21');
INSERT INTO `sys_log_201904` VALUES ('197509', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '31', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:08:40', '0', '2019-04-15 14:08:40');
INSERT INTO `sys_log_201904` VALUES ('197510', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '32', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:08:47', '0', '2019-04-15 14:08:47');
INSERT INTO `sys_log_201904` VALUES ('197511', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '62', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 14:09:01', '0', '2019-04-15 14:09:01');
INSERT INTO `sys_log_201904` VALUES ('197512', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '56', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:09:01', '0', '2019-04-15 14:09:01');
INSERT INTO `sys_log_201904` VALUES ('197513', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '43', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:09:02', '0', '2019-04-15 14:09:02');
INSERT INTO `sys_log_201904` VALUES ('197514', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '244', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:09:02', '0', '2019-04-15 14:09:02');
INSERT INTO `sys_log_201904` VALUES ('197515', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '64', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:13', '0', '2019-04-15 14:09:13');
INSERT INTO `sys_log_201904` VALUES ('197516', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '53', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:13', '0', '2019-04-15 14:09:13');
INSERT INTO `sys_log_201904` VALUES ('197517', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '92', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:13', '0', '2019-04-15 14:09:13');
INSERT INTO `sys_log_201904` VALUES ('197518', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '14', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:16', '0', '2019-04-15 14:09:16');
INSERT INTO `sys_log_201904` VALUES ('197519', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '0', '29', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:33', '0', '2019-04-15 14:09:33');
INSERT INTO `sys_log_201904` VALUES ('197520', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '15', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:37', '0', '2019-04-15 14:09:37');
INSERT INTO `sys_log_201904` VALUES ('197521', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:09:45', '0', '2019-04-15 14:09:45');
INSERT INTO `sys_log_201904` VALUES ('197522', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:10:54', '0', '2019-04-15 14:10:54');
INSERT INTO `sys_log_201904` VALUES ('197523', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:10:56', '0', '2019-04-15 14:10:56');
INSERT INTO `sys_log_201904` VALUES ('197524', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTU1MzA4NTU0NjgzIiwidXNlcl9pZCI6NDQxODksImNoYW5uZWxfdHlwZSI6NCwiaWF0IjoxNTU1MzA4NTUyfQ.DdzYQO7IMqqZAelnyXgMcCjHRIPin47CM3gpmn2jySdvbnmpA8DAoimBICKlHa0gecWL8yMl7XUCwGroSLw5AA\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '519', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:10:58', '0', '2019-04-15 14:10:58');
INSERT INTO `sys_log_201904` VALUES ('197525', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:12', '0', '2019-04-15 14:11:12');
INSERT INTO `sys_log_201904` VALUES ('197526', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '4', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:12', '0', '2019-04-15 14:11:12');
INSERT INTO `sys_log_201904` VALUES ('197527', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '0', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:52', '0', '2019-04-15 14:11:52');
INSERT INTO `sys_log_201904` VALUES ('197528', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '2', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:53', '0', '2019-04-15 14:11:53');
INSERT INTO `sys_log_201904` VALUES ('197529', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:56', '0', '2019-04-15 14:11:56');
INSERT INTO `sys_log_201904` VALUES ('197530', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '96', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:56', '0', '2019-04-15 14:11:56');
INSERT INTO `sys_log_201904` VALUES ('197531', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '200', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:56', '0', '2019-04-15 14:11:56');
INSERT INTO `sys_log_201904` VALUES ('197532', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:11:58', '0', '2019-04-15 14:11:58');
INSERT INTO `sys_log_201904` VALUES ('197533', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:12:08', '0', '2019-04-15 14:12:08');
INSERT INTO `sys_log_201904` VALUES ('197534', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '56', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:12:33', '0', '2019-04-15 14:12:33');
INSERT INTO `sys_log_201904` VALUES ('197535', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '32', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:12:34', '0', '2019-04-15 14:12:34');
INSERT INTO `sys_log_201904` VALUES ('197536', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '210', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:12:34', '0', '2019-04-15 14:12:34');
INSERT INTO `sys_log_201904` VALUES ('197537', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTU1MzA4NTU0NjgzIiwidXNlcl9pZCI6NDQxODksImNoYW5uZWxfdHlwZSI6NCwiaWF0IjoxNTU1MzA4NTUyfQ.DdzYQO7IMqqZAelnyXgMcCjHRIPin47CM3gpmn2jySdvbnmpA8DAoimBICKlHa0gecWL8yMl7XUCwGroSLw5AA\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '309', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:15:44', '0', '2019-04-15 14:15:44');
INSERT INTO `sys_log_201904` VALUES ('197538', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '14', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:15:46', '0', '2019-04-15 14:15:46');
INSERT INTO `sys_log_201904` VALUES ('197539', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:15:48', '0', '2019-04-15 14:15:48');
INSERT INTO `sys_log_201904` VALUES ('197540', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '97', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:15:48', '0', '2019-04-15 14:15:48');
INSERT INTO `sys_log_201904` VALUES ('197541', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:15:59', '0', '2019-04-15 14:15:59');
INSERT INTO `sys_log_201904` VALUES ('197542', '44189', 'YX13699170634', '用户退出', '4', 'com.yx.wx.server.controller.user.UserController.logout', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:16:00', '0', '2019-04-15 14:16:00');
INSERT INTO `sys_log_201904` VALUES ('197543', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:16:01', '0', '2019-04-15 14:16:01');
INSERT INTO `sys_log_201904` VALUES ('197544', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '0', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:16:52', '0', '2019-04-15 14:16:52');
INSERT INTO `sys_log_201904` VALUES ('197545', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '11', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:16:54', '0', '2019-04-15 14:16:54');
INSERT INTO `sys_log_201904` VALUES ('197546', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:17:02', '0', '2019-04-15 14:17:02');
INSERT INTO `sys_log_201904` VALUES ('197547', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:18:35', '0', '2019-04-15 14:18:35');
INSERT INTO `sys_log_201904` VALUES ('197548', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '307', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:19:27', '0', '2019-04-15 14:19:27');
INSERT INTO `sys_log_201904` VALUES ('197549', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:19:51', '0', '2019-04-15 14:19:51');
INSERT INTO `sys_log_201904` VALUES ('197550', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '88', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:04', '0', '2019-04-15 14:20:04');
INSERT INTO `sys_log_201904` VALUES ('197551', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:04', '0', '2019-04-15 14:20:04');
INSERT INTO `sys_log_201904` VALUES ('197552', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '56', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:04', '0', '2019-04-15 14:20:04');
INSERT INTO `sys_log_201904` VALUES ('197553', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:32', '0', '2019-04-15 14:20:32');
INSERT INTO `sys_log_201904` VALUES ('197554', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:33', '0', '2019-04-15 14:20:33');
INSERT INTO `sys_log_201904` VALUES ('197555', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '116', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:33', '0', '2019-04-15 14:20:33');
INSERT INTO `sys_log_201904` VALUES ('197556', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:41', '0', '2019-04-15 14:20:41');
INSERT INTO `sys_log_201904` VALUES ('197557', '44189', 'YX13699170634', '用户退出', '4', 'com.yx.wx.server.controller.user.UserController.logout', null, '1', '53', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:42', '0', '2019-04-15 14:20:42');
INSERT INTO `sys_log_201904` VALUES ('197558', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '33', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:47', '0', '2019-04-15 14:20:47');
INSERT INTO `sys_log_201904` VALUES ('197559', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '31', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:20:54', '0', '2019-04-15 14:20:54');
INSERT INTO `sys_log_201904` VALUES ('197560', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '291', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:05', '0', '2019-04-15 14:21:05');
INSERT INTO `sys_log_201904` VALUES ('197561', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '2', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:18', '0', '2019-04-15 14:21:18');
INSERT INTO `sys_log_201904` VALUES ('197562', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '55', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:26', '0', '2019-04-15 14:21:26');
INSERT INTO `sys_log_201904` VALUES ('197563', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '51', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:26', '0', '2019-04-15 14:21:26');
INSERT INTO `sys_log_201904` VALUES ('197564', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:26', '0', '2019-04-15 14:21:26');
INSERT INTO `sys_log_201904` VALUES ('197565', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:29', '0', '2019-04-15 14:21:29');
INSERT INTO `sys_log_201904` VALUES ('197566', '44189', 'YX13699170634', '用户退出', '4', 'com.yx.wx.server.controller.user.UserController.logout', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:30', '0', '2019-04-15 14:21:30');
INSERT INTO `sys_log_201904` VALUES ('197567', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:35', '0', '2019-04-15 14:21:35');
INSERT INTO `sys_log_201904` VALUES ('197568', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '54', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:36', '0', '2019-04-15 14:21:36');
INSERT INTO `sys_log_201904` VALUES ('197569', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '93', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:36', '0', '2019-04-15 14:21:36');
INSERT INTO `sys_log_201904` VALUES ('197570', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:21:38', '0', '2019-04-15 14:21:38');
INSERT INTO `sys_log_201904` VALUES ('197571', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:24:14', '0', '2019-04-15 14:24:14');
INSERT INTO `sys_log_201904` VALUES ('197572', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '0', '56', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:06', '0', '2019-04-15 14:25:06');
INSERT INTO `sys_log_201904` VALUES ('197573', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '23', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:10', '0', '2019-04-15 14:25:10');
INSERT INTO `sys_log_201904` VALUES ('197574', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:14', '0', '2019-04-15 14:25:14');
INSERT INTO `sys_log_201904` VALUES ('197575', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"15358465031\"}]', '1', '292', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:27', '0', '2019-04-15 14:25:27');
INSERT INTO `sys_log_201904` VALUES ('197576', '44309', 'YX13300112345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:25:41', '0', '2019-04-15 14:25:41');
INSERT INTO `sys_log_201904` VALUES ('197577', '44309', 'YX13300112345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '259', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-15 14:25:41', '0', '2019-04-15 14:25:41');
INSERT INTO `sys_log_201904` VALUES ('197578', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:43', '0', '2019-04-15 14:25:43');
INSERT INTO `sys_log_201904` VALUES ('197579', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '3', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:44', '0', '2019-04-15 14:25:44');
INSERT INTO `sys_log_201904` VALUES ('197580', '44189', 'YX13699170634', '用户退出', '4', 'com.yx.wx.server.controller.user.UserController.logout', null, '1', '52', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:44', '0', '2019-04-15 14:25:44');
INSERT INTO `sys_log_201904` VALUES ('197581', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:25:45', '0', '2019-04-15 14:25:45');
INSERT INTO `sys_log_201904` VALUES ('197582', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:26:06', '0', '2019-04-15 14:26:06');
INSERT INTO `sys_log_201904` VALUES ('197583', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '2', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:26:06', '0', '2019-04-15 14:26:06');
INSERT INTO `sys_log_201904` VALUES ('197584', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:26:59', '0', '2019-04-15 14:26:59');
INSERT INTO `sys_log_201904` VALUES ('197585', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '303', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:27:08', '0', '2019-04-15 14:27:08');
INSERT INTO `sys_log_201904` VALUES ('197586', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '3', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:27:23', '0', '2019-04-15 14:27:23');
INSERT INTO `sys_log_201904` VALUES ('197587', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:27:41', '0', '2019-04-15 14:27:41');
INSERT INTO `sys_log_201904` VALUES ('197588', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '32', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:27:52', '0', '2019-04-15 14:27:52');
INSERT INTO `sys_log_201904` VALUES ('197589', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '32', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:27:56', '0', '2019-04-15 14:27:56');
INSERT INTO `sys_log_201904` VALUES ('197590', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '9', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:29:02', '0', '2019-04-15 14:29:02');
INSERT INTO `sys_log_201904` VALUES ('197591', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '58', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:29:17', '0', '2019-04-15 14:29:17');
INSERT INTO `sys_log_201904` VALUES ('197592', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '377', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:29:36', '0', '2019-04-15 14:29:36');
INSERT INTO `sys_log_201904` VALUES ('197593', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '3', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:29:50', '0', '2019-04-15 14:29:50');
INSERT INTO `sys_log_201904` VALUES ('197594', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:30:44', '0', '2019-04-15 14:30:44');
INSERT INTO `sys_log_201904` VALUES ('197595', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:30:50', '0', '2019-04-15 14:30:50');
INSERT INTO `sys_log_201904` VALUES ('197596', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '8', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:30:51', '0', '2019-04-15 14:30:51');
INSERT INTO `sys_log_201904` VALUES ('197597', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '8', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:30:52', '0', '2019-04-15 14:30:52');
INSERT INTO `sys_log_201904` VALUES ('197598', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '30', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:30:57', '0', '2019-04-15 14:30:57');
INSERT INTO `sys_log_201904` VALUES ('197599', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"15358465031\"}]', '1', '326', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:31:16', '0', '2019-04-15 14:31:16');
INSERT INTO `sys_log_201904` VALUES ('197600', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:31:47', '0', '2019-04-15 14:31:47');
INSERT INTO `sys_log_201904` VALUES ('197601', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '4', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:31:47', '0', '2019-04-15 14:31:47');
INSERT INTO `sys_log_201904` VALUES ('197602', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"15358465031\"}]', '1', '564', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:44:33', '0', '2019-04-15 14:44:33');
INSERT INTO `sys_log_201904` VALUES ('197603', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '564', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:44:33', '0', '2019-04-15 14:44:33');
INSERT INTO `sys_log_201904` VALUES ('197604', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '157', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:44:49', '0', '2019-04-15 14:44:49');
INSERT INTO `sys_log_201904` VALUES ('197605', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '36', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:44:54', '0', '2019-04-15 14:44:54');
INSERT INTO `sys_log_201904` VALUES ('197606', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '10', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:44:54', '0', '2019-04-15 14:44:54');
INSERT INTO `sys_log_201904` VALUES ('197607', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '349', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:53:48', '0', '2019-04-15 14:53:48');
INSERT INTO `sys_log_201904` VALUES ('197608', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '0', '199', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 14:53:58', '0', '2019-04-15 14:53:58');
INSERT INTO `sys_log_201904` VALUES ('197609', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '216', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:22:27', '0', '2019-04-15 15:22:27');
INSERT INTO `sys_log_201904` VALUES ('197610', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '101', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:23:58', '0', '2019-04-15 15:23:58');
INSERT INTO `sys_log_201904` VALUES ('197611', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"15358465031\"}]', '1', '290', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:13', '0', '2019-04-15 15:24:13');
INSERT INTO `sys_log_201904` VALUES ('197612', '0', '0', '短信验证码验证', '9', 'com.yx.wx.server.controller.user.UserController.smsCodeValidate', null, '1', '1', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:43', '0', '2019-04-15 15:24:43');
INSERT INTO `sys_log_201904` VALUES ('197613', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '1', '252', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:43', '0', '2019-04-15 15:24:43');
INSERT INTO `sys_log_201904` VALUES ('197614', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '607', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:58', '0', '2019-04-15 15:24:58');
INSERT INTO `sys_log_201904` VALUES ('197615', '44166', '二麻子哥', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '75', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:58', '0', '2019-04-15 15:24:58');
INSERT INTO `sys_log_201904` VALUES ('197616', '44166', '二麻子哥', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '294', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:24:58', '0', '2019-04-15 15:24:58');
INSERT INTO `sys_log_201904` VALUES ('197617', '0', '0', '发送短信', '9', 'com.yx.wx.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":4,\"phone\":\"13699170634\"}]', '1', '326', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:33:37', '0', '2019-04-15 15:33:37');
INSERT INTO `sys_log_201904` VALUES ('197618', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPassword', null, '1', '168', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:33:51', '0', '2019-04-15 15:33:51');
INSERT INTO `sys_log_201904` VALUES ('197619', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '35', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:33:56', '0', '2019-04-15 15:33:56');
INSERT INTO `sys_log_201904` VALUES ('197620', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '32', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:01', '0', '2019-04-15 15:34:01');
INSERT INTO `sys_log_201904` VALUES ('197621', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '31', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:06', '0', '2019-04-15 15:34:06');
INSERT INTO `sys_log_201904` VALUES ('197622', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:11', '0', '2019-04-15 15:34:11');
INSERT INTO `sys_log_201904` VALUES ('197623', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '48', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:12', '0', '2019-04-15 15:34:12');
INSERT INTO `sys_log_201904` VALUES ('197624', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '120', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:12', '0', '2019-04-15 15:34:12');
INSERT INTO `sys_log_201904` VALUES ('197625', '0', '0', '获取图形验证码', '9', 'com.yx.mobile.server.controller.user.UserController.queryCaptcha', '[]', '1', '179', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:34:40', '0', '2019-04-15 15:34:40');
INSERT INTO `sys_log_201904` VALUES ('197626', '0', '0', '获取图形验证码', '9', 'com.yx.mobile.server.controller.user.UserController.queryCaptcha', '[]', '1', '21', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:34:45', '0', '2019-04-15 15:34:45');
INSERT INTO `sys_log_201904` VALUES ('197627', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '65', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:51', '0', '2019-04-15 15:34:51');
INSERT INTO `sys_log_201904` VALUES ('197628', '44189', 'YX13699170634', '用户退出', '4', 'com.yx.wx.server.controller.user.UserController.logout', null, '1', '97', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:34:51', '0', '2019-04-15 15:34:51');
INSERT INTO `sys_log_201904` VALUES ('197629', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.mobile.server.controller.user.UserController.restPasswordCaptchaValidate', null, '0', '41', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:34:52', '0', '2019-04-15 15:34:52');
INSERT INTO `sys_log_201904` VALUES ('197630', '0', '0', '获取图形验证码', '9', 'com.yx.mobile.server.controller.user.UserController.queryCaptcha', '[]', '1', '26', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:34:56', '0', '2019-04-15 15:34:56');
INSERT INTO `sys_log_201904` VALUES ('197631', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '18', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:35:07', '0', '2019-04-15 15:35:07');
INSERT INTO `sys_log_201904` VALUES ('197632', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.mobile.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '36', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:35:09', '0', '2019-04-15 15:35:09');
INSERT INTO `sys_log_201904` VALUES ('197633', '0', '0', '重置登录密码-验证图形验证码(登录前)', '2', 'com.yx.wx.server.controller.user.UserController.restPasswordCaptchaValidate', null, '1', '33', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:35:18', '0', '2019-04-15 15:35:18');
INSERT INTO `sys_log_201904` VALUES ('197634', '0', '0', '发送短信', '9', 'com.yx.mobile.server.controller.user.UserController.sendSms', '[{\"accessToken\":\"\",\"channelType\":2,\"phone\":\"15358465031\"}]', '1', '259', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:35:32', '0', '2019-04-15 15:35:32');
INSERT INTO `sys_log_201904` VALUES ('197635', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"9bae66b4-e981-4dff-8303-7de6e28bb558\",\"captchaValue\":\"buqb\",\"password\":\"****\"}]', '1', '131', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 15:36:02', '0', '2019-04-15 15:36:02');
INSERT INTO `sys_log_201904` VALUES ('197636', '0', '0', '重置登录密码(登录前)', '2', 'com.yx.mobile.server.controller.user.UserController.restPassword', null, '1', '180', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:36:17', '0', '2019-04-15 15:36:17');
INSERT INTO `sys_log_201904` VALUES ('197637', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '66', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-15 15:36:27', '0', '2019-04-15 15:36:27');
INSERT INTO `sys_log_201904` VALUES ('197638', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 15:36:28', '0', '2019-04-15 15:36:28');
INSERT INTO `sys_log_201904` VALUES ('197639', '44166', '二麻子哥', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '95', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 15:36:28', '0', '2019-04-15 15:36:28');
INSERT INTO `sys_log_201904` VALUES ('197640', '44166', '二麻子哥', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '304', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-15 15:36:28', '0', '2019-04-15 15:36:28');
INSERT INTO `sys_log_201904` VALUES ('197641', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '37', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:38:59', '0', '2019-04-15 15:38:59');
INSERT INTO `sys_log_201904` VALUES ('197642', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '37', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-15 15:40:26', '0', '2019-04-15 15:40:26');
INSERT INTO `sys_log_201904` VALUES ('197643', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"d3dc1fc2-f204-49f4-9f98-8b3465412e2f\",\"captchaValue\":\"phsb\",\"password\":\"****\"}]', '1', '36', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 15:54:33', '0', '2019-04-15 15:54:33');
INSERT INTO `sys_log_201904` VALUES ('197644', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"243e35f7-8153-403d-a4e0-df0ed5e9a1d3\",\"captchaValue\":\"k432\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-15 17:21:54', '0', '2019-04-15 17:21:54');
INSERT INTO `sys_log_201904` VALUES ('197645', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"f79af853-6ca6-4e9e-b890-3232b0077389\",\"captchaValue\":\"abmy\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 09:01:08', '0', '2019-04-16 09:01:08');
INSERT INTO `sys_log_201904` VALUES ('197646', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '134', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 09:25:14', '0', '2019-04-16 09:25:14');
INSERT INTO `sys_log_201904` VALUES ('197647', '44312', 'YX13300412345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '81', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 09:25:14', '0', '2019-04-16 09:25:14');
INSERT INTO `sys_log_201904` VALUES ('197648', '44312', 'YX13300412345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '84', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 09:25:15', '0', '2019-04-16 09:25:15');
INSERT INTO `sys_log_201904` VALUES ('197649', '44312', 'YX13300412345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '277', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 09:25:15', '0', '2019-04-16 09:25:15');
INSERT INTO `sys_log_201904` VALUES ('197650', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"30f58377-e16f-4d36-8619-4e769375ebcd\",\"captchaValue\":\"54tr\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 10:08:45', '0', '2019-04-16 10:08:45');
INSERT INTO `sys_log_201904` VALUES ('197651', '1016151836104032286', '李文英', '借款申请初审的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageFirst', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '362', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 10:28:42', '0', '2019-04-16 10:28:42');
INSERT INTO `sys_log_201904` VALUES ('197652', '1016151836104032286', '李文英', '借款复审申请的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageSecond', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '47', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 10:28:52', '0', '2019-04-16 10:28:52');
INSERT INTO `sys_log_201904` VALUES ('197653', '1016151836104032286', '李文英', '借款申请初审的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageFirst', '[{\"asc\":true,\"current\":3,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":20,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '51', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 10:29:09', '0', '2019-04-16 10:29:09');
INSERT INTO `sys_log_201904` VALUES ('197654', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '155', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:23:47', '0', '2019-04-16 11:23:47');
INSERT INTO `sys_log_201904` VALUES ('197655', '44184', 'YX15313883202', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '119', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:23:48', '0', '2019-04-16 11:23:48');
INSERT INTO `sys_log_201904` VALUES ('197656', '44184', 'YX15313883202', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '135', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:23:48', '0', '2019-04-16 11:23:48');
INSERT INTO `sys_log_201904` VALUES ('197657', '44184', 'YX15313883202', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '231', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:23:48', '0', '2019-04-16 11:23:48');
INSERT INTO `sys_log_201904` VALUES ('197658', '44184', 'YX15313883202', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '476', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:23:49', '0', '2019-04-16 11:23:49');
INSERT INTO `sys_log_201904` VALUES ('197659', '44184', 'YX15313883202', '推荐奖励分享链接', '9', 'com.yx.web.server.controller.referrer.ReferrerController.getQrcodeUrl', null, '1', '103', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:24:58', '0', '2019-04-16 11:24:58');
INSERT INTO `sys_log_201904` VALUES ('197660', '44184', 'YX15313883202', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '225', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:25:17', '0', '2019-04-16 11:25:17');
INSERT INTO `sys_log_201904` VALUES ('197661', '44184', 'YX15313883202', '推荐奖励分享链接', '9', 'com.yx.web.server.controller.referrer.ReferrerController.getQrcodeUrl', null, '1', '150', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:30:00', '0', '2019-04-16 11:30:00');
INSERT INTO `sys_log_201904` VALUES ('197662', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '284', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 11:33:23', '0', '2019-04-16 11:33:23');
INSERT INTO `sys_log_201904` VALUES ('197663', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"01a0a56f-4f1b-48ae-9ef2-42070507ff9a\",\"captchaValue\":\"eea2\",\"password\":\"****\"}]', '1', '34', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 11:44:43', '0', '2019-04-16 11:44:43');
INSERT INTO `sys_log_201904` VALUES ('197664', '1016151836104032286', '李文英', '借款复审申请的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageSecond', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '7', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 11:44:44', '0', '2019-04-16 11:44:44');
INSERT INTO `sys_log_201904` VALUES ('197665', '1016151836104032286', '李文英', '借款申请初审的列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPageFirst', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '51', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 11:44:44', '0', '2019-04-16 11:44:44');
INSERT INTO `sys_log_201904` VALUES ('197666', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"6dc36d25-1224-4203-a35f-7d0cc3b8ad5a\",\"captchaValue\":\"s81x\",\"password\":\"****\"}]', '1', '34', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 13:12:59', '0', '2019-04-16 13:12:59');
INSERT INTO `sys_log_201904` VALUES ('197667', '1016151836104032280', '刘建官', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liujianguan\",\"captchaId\":\"64095489-b6cc-4923-bcf6-9e9918bec3e2\",\"captchaValue\":\"5baz\",\"password\":\"****\"}]', '1', '117', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 14:24:43', '0', '2019-04-16 14:24:43');
INSERT INTO `sys_log_201904` VALUES ('197668', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"7503a596-7f8c-42c6-8055-33ebf0b77181\",\"captchaValue\":\"223g\",\"password\":\"****\"}]', '1', '196', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 14:30:15', '0', '2019-04-16 14:30:15');
INSERT INTO `sys_log_201904` VALUES ('197669', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"5e5e5360-b412-4f96-930a-2f936520581c\",\"captchaValue\":\"yydy\",\"password\":\"****\"}]', '1', '33', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 15:20:52', '0', '2019-04-16 15:20:52');
INSERT INTO `sys_log_201904` VALUES ('197670', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"70d607ee-b960-437a-afeb-fd04614e2f41\",\"captchaValue\":\"x99v\",\"password\":\"****\"}]', '1', '32', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 15:22:19', '0', '2019-04-16 15:22:19');
INSERT INTO `sys_log_201904` VALUES ('197671', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"f1e06cce-21e6-48c5-b5af-d916c147afb1\",\"captchaValue\":\"oc9u\",\"password\":\"****\"}]', '1', '31', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 15:54:39', '0', '2019-04-16 15:54:39');
INSERT INTO `sys_log_201904` VALUES ('197672', '1016151836104032277', '刘雪丽', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liuxueli\",\"captchaId\":\"cb5fa826-0c46-4a11-bb7a-e3e61279c422\",\"captchaValue\":\"qkbv\",\"password\":\"****\"}]', '1', '37', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 16:23:54', '0', '2019-04-16 16:23:54');
INSERT INTO `sys_log_201904` VALUES ('197673', '1016151836104032277', '刘雪丽', '用户登出', '4', 'com.yx.admin.server.controller.sys.LoginController.logout', '[]', '1', '12', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 16:24:41', '0', '2019-04-16 16:24:41');
INSERT INTO `sys_log_201904` VALUES ('197674', '1016151836104032277', '刘雪丽', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liuxueli\",\"captchaId\":\"eb802bf1-213d-40b7-850c-43355ae17900\",\"captchaValue\":\"r095\",\"password\":\"****\"}]', '1', '30', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-16 16:25:07', '0', '2019-04-16 16:25:07');
INSERT INTO `sys_log_201904` VALUES ('197675', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '717', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 17:50:11', '0', '2019-04-16 17:50:11');
INSERT INTO `sys_log_201904` VALUES ('197676', '44312', 'YX13300412345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '57', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:50:11', '0', '2019-04-16 17:50:11');
INSERT INTO `sys_log_201904` VALUES ('197677', '44312', 'YX13300412345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '34', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:50:26', '0', '2019-04-16 17:50:26');
INSERT INTO `sys_log_201904` VALUES ('197678', '44312', 'YX13300412345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '231', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:50:26', '0', '2019-04-16 17:50:26');
INSERT INTO `sys_log_201904` VALUES ('197679', '44312', 'YX13300412345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '50', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:50:45', '0', '2019-04-16 17:50:45');
INSERT INTO `sys_log_201904` VALUES ('197680', '44312', 'YX13300412345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '79', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:50:47', '0', '2019-04-16 17:50:47');
INSERT INTO `sys_log_201904` VALUES ('197681', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '56', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 17:51:02', '0', '2019-04-16 17:51:02');
INSERT INTO `sys_log_201904` VALUES ('197682', '44315', 'YX13300712345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '50', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:51:02', '0', '2019-04-16 17:51:02');
INSERT INTO `sys_log_201904` VALUES ('197683', '44315', 'YX13300712345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '43', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:51:03', '0', '2019-04-16 17:51:03');
INSERT INTO `sys_log_201904` VALUES ('197684', '44315', 'YX13300712345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '214', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:51:03', '0', '2019-04-16 17:51:03');
INSERT INTO `sys_log_201904` VALUES ('197685', '44315', 'YX13300712345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '47', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:51:13', '0', '2019-04-16 17:51:13');
INSERT INTO `sys_log_201904` VALUES ('197686', '44315', 'YX13300712345', '用户退出', '4', 'com.yx.mobile.server.controller.user.UserController.logout', null, '1', '51', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-16 17:51:15', '0', '2019-04-16 17:51:15');
INSERT INTO `sys_log_201904` VALUES ('197687', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '30', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 17:51:54', '0', '2019-04-16 17:51:54');
INSERT INTO `sys_log_201904` VALUES ('197688', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '34', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 17:52:07', '0', '2019-04-16 17:52:07');
INSERT INTO `sys_log_201904` VALUES ('197689', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '29', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-16 17:52:29', '0', '2019-04-16 17:52:29');
INSERT INTO `sys_log_201904` VALUES ('197690', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '96', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:06', '0', '2019-04-16 17:54:06');
INSERT INTO `sys_log_201904` VALUES ('197691', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '28', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:12', '0', '2019-04-16 17:54:12');
INSERT INTO `sys_log_201904` VALUES ('197692', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '29', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:13', '0', '2019-04-16 17:54:13');
INSERT INTO `sys_log_201904` VALUES ('197693', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '30', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:14', '0', '2019-04-16 17:54:14');
INSERT INTO `sys_log_201904` VALUES ('197694', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '0', '27', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:14', '0', '2019-04-16 17:54:14');
INSERT INTO `sys_log_201904` VALUES ('197695', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '54', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:19', '0', '2019-04-16 17:54:19');
INSERT INTO `sys_log_201904` VALUES ('197696', '44212', '1380000444', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '99', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:19', '0', '2019-04-16 17:54:19');
INSERT INTO `sys_log_201904` VALUES ('197697', '44212', '1380000444', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '104', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:19', '0', '2019-04-16 17:54:19');
INSERT INTO `sys_log_201904` VALUES ('197698', '44212', '1380000444', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '118', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:19', '0', '2019-04-16 17:54:19');
INSERT INTO `sys_log_201904` VALUES ('197699', '44212', '1380000444', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '270', '124.65.160.218', '1', null, '1', '0', '0', '2019-04-16 17:54:20', '0', '2019-04-16 17:54:20');
INSERT INTO `sys_log_201904` VALUES ('197700', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"431a4af2-f2cf-4e4d-b860-0f88509fdc6a\",\"captchaValue\":\"tv33\",\"password\":\"****\"}]', '1', '34', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 08:59:02', '0', '2019-04-17 08:59:02');
INSERT INTO `sys_log_201904` VALUES ('197701', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '0', '35', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-17 10:57:30', '0', '2019-04-17 10:57:30');
INSERT INTO `sys_log_201904` VALUES ('197702', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '55', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-17 10:57:50', '0', '2019-04-17 10:57:50');
INSERT INTO `sys_log_201904` VALUES ('197703', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '129', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-17 10:57:51', '0', '2019-04-17 10:57:51');
INSERT INTO `sys_log_201904` VALUES ('197704', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '93', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-17 10:57:51', '0', '2019-04-17 10:57:51');
INSERT INTO `sys_log_201904` VALUES ('197705', '44277', 'YX18901012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '227', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-17 10:57:51', '0', '2019-04-17 10:57:51');
INSERT INTO `sys_log_201904` VALUES ('197706', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '90', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-17 10:58:08', '0', '2019-04-17 10:58:08');
INSERT INTO `sys_log_201904` VALUES ('197707', '44277', 'YX18901012345', '借款人--点击去认证调用该接口', '9', 'com.yx.mobile.server.controller.user.FddUserController.getAuthenticationUrl', null, '1', '1732', '124.65.160.218', '5', null, '1', '0', '0', '2019-04-17 10:58:11', '0', '2019-04-17 10:58:11');
INSERT INTO `sys_log_201904` VALUES ('197708', '0', '0', '用户登录', '4', 'com.yx.mobile.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '2', null, '1', '0', '0', '2019-04-17 11:00:30', '0', '2019-04-17 11:00:30');
INSERT INTO `sys_log_201904` VALUES ('197709', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '49', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:30', '0', '2019-04-17 11:00:30');
INSERT INTO `sys_log_201904` VALUES ('197710', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '87', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:30', '0', '2019-04-17 11:00:30');
INSERT INTO `sys_log_201904` VALUES ('197711', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '118', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:30', '0', '2019-04-17 11:00:30');
INSERT INTO `sys_log_201904` VALUES ('197712', '44277', 'YX18901012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '190', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:30', '0', '2019-04-17 11:00:30');
INSERT INTO `sys_log_201904` VALUES ('197713', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '118', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:49', '0', '2019-04-17 11:00:49');
INSERT INTO `sys_log_201904` VALUES ('197714', '44277', 'YX18901012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '182', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:00:49', '0', '2019-04-17 11:00:49');
INSERT INTO `sys_log_201904` VALUES ('197715', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '120', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:01:21', '0', '2019-04-17 11:01:21');
INSERT INTO `sys_log_201904` VALUES ('197716', '44277', 'YX18901012345', '余额查询', '9', 'com.yx.mobile.server.controller.user.UserController.queryBalance', null, '1', '179', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:01:21', '0', '2019-04-17 11:01:21');
INSERT INTO `sys_log_201904` VALUES ('197717', '44277', 'YX18901012345', '用户信息', '4', 'com.yx.mobile.server.controller.user.UserController.info', null, '1', '91', '124.65.160.218', '4', null, '1', '0', '0', '2019-04-17 11:01:26', '0', '2019-04-17 11:01:26');
INSERT INTO `sys_log_201904` VALUES ('197718', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '84', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:36:59', '0', '2019-04-17 11:36:59');
INSERT INTO `sys_log_201904` VALUES ('197719', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '35', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:00', '0', '2019-04-17 11:37:00');
INSERT INTO `sys_log_201904` VALUES ('197720', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '0', '35', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:02', '0', '2019-04-17 11:37:02');
INSERT INTO `sys_log_201904` VALUES ('197721', '0', '0', '用户登录', '4', 'com.yx.wx.server.controller.user.UserController.login', null, '1', '61', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:12', '0', '2019-04-17 11:37:12');
INSERT INTO `sys_log_201904` VALUES ('197722', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '65', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:13', '0', '2019-04-17 11:37:13');
INSERT INTO `sys_log_201904` VALUES ('197723', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '96', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:13', '0', '2019-04-17 11:37:13');
INSERT INTO `sys_log_201904` VALUES ('197724', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '46', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:18', '0', '2019-04-17 11:37:18');
INSERT INTO `sys_log_201904` VALUES ('197725', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '86', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:18', '0', '2019-04-17 11:37:18');
INSERT INTO `sys_log_201904` VALUES ('197726', '44189', 'YX13699170634', '余额查询', '9', 'com.yx.wx.server.controller.user.UserController.queryBalance', null, '1', '49', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:25', '0', '2019-04-17 11:37:25');
INSERT INTO `sys_log_201904` VALUES ('197727', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '88', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:25', '0', '2019-04-17 11:37:25');
INSERT INTO `sys_log_201904` VALUES ('197728', '44189', 'YX13699170634', '借款人--实名认证关闭', '9', 'com.yx.wx.server.controller.user.FddUserController.authenticationCancel', null, '1', '99', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:37:26', '0', '2019-04-17 11:37:26');
INSERT INTO `sys_log_201904` VALUES ('197729', '44189', 'YX13699170634', '用户信息', '4', 'com.yx.wx.server.controller.user.UserController.info', null, '1', '87', '124.65.160.218', '3', null, '1', '0', '0', '2019-04-17 11:41:44', '0', '2019-04-17 11:41:44');
INSERT INTO `sys_log_201904` VALUES ('197730', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"f4d11554-cff3-481c-8a9c-3d937aa1f4b2\",\"captchaValue\":\"hkpq\",\"password\":\"****\"}]', '1', '35', '121.35.1.74', '6', null, '1', '0', '0', '2019-04-17 14:32:59', '0', '2019-04-17 14:32:59');
INSERT INTO `sys_log_201904` VALUES ('197731', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"0d2f8a95-782e-44ad-becb-5dc006b0d3de\",\"captchaValue\":\"s1ib\",\"password\":\"****\"}]', '1', '62', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 15:13:27', '0', '2019-04-17 15:13:27');
INSERT INTO `sys_log_201904` VALUES ('197732', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"026c008b-49ba-4280-ba10-82bcd2ffc428\",\"captchaValue\":\"ognq\",\"password\":\"****\"}]', '1', '60', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 15:16:16', '0', '2019-04-17 15:16:16');
INSERT INTO `sys_log_201904` VALUES ('197733', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"6dafdd3c-cabe-4f83-bfc8-8ed64505f19e\",\"captchaValue\":\"3988\",\"password\":\"****\"}]', '1', '35', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 15:18:06', '0', '2019-04-17 15:18:06');
INSERT INTO `sys_log_201904` VALUES ('197734', '1016151836104032273', '颜秉豪', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"yanbinghao\",\"captchaId\":\"8c59e653-9f20-4451-b62d-ce053325cacb\",\"captchaValue\":\"wwzu\",\"password\":\"****\"}]', '1', '74', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 15:48:43', '0', '2019-04-17 15:48:43');
INSERT INTO `sys_log_201904` VALUES ('197735', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"45641de3-f3fb-47e2-abd1-a7ee5b6579ea\",\"captchaValue\":\"cvdp\",\"password\":\"****\"}]', '1', '31', '121.35.1.74', '6', null, '1', '0', '0', '2019-04-17 15:57:52', '0', '2019-04-17 15:57:52');
INSERT INTO `sys_log_201904` VALUES ('197736', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '865', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:22', '0', '2019-04-17 16:18:22');
INSERT INTO `sys_log_201904` VALUES ('197737', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '87', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:22', '0', '2019-04-17 16:18:22');
INSERT INTO `sys_log_201904` VALUES ('197738', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '78', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:23', '0', '2019-04-17 16:18:23');
INSERT INTO `sys_log_201904` VALUES ('197739', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '191', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:23', '0', '2019-04-17 16:18:23');
INSERT INTO `sys_log_201904` VALUES ('197740', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '269', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:23', '0', '2019-04-17 16:18:23');
INSERT INTO `sys_log_201904` VALUES ('197741', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '5', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:28', '0', '2019-04-17 16:18:28');
INSERT INTO `sys_log_201904` VALUES ('197742', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '54', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:34', '0', '2019-04-17 16:18:34');
INSERT INTO `sys_log_201904` VALUES ('197743', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '98', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:34', '0', '2019-04-17 16:18:34');
INSERT INTO `sys_log_201904` VALUES ('197744', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '765', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:35', '0', '2019-04-17 16:18:35');
INSERT INTO `sys_log_201904` VALUES ('197745', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '54', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:18:35', '0', '2019-04-17 16:18:35');
INSERT INTO `sys_log_201904` VALUES ('197746', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '73', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:19:37', '0', '2019-04-17 16:19:37');
INSERT INTO `sys_log_201904` VALUES ('197747', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '184', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:19:38', '0', '2019-04-17 16:19:38');
INSERT INTO `sys_log_201904` VALUES ('197748', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '54', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:20:45', '0', '2019-04-17 16:20:45');
INSERT INTO `sys_log_201904` VALUES ('197749', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '182', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:20:45', '0', '2019-04-17 16:20:45');
INSERT INTO `sys_log_201904` VALUES ('197750', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '55', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:21:59', '0', '2019-04-17 16:21:59');
INSERT INTO `sys_log_201904` VALUES ('197751', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '177', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:22:00', '0', '2019-04-17 16:22:00');
INSERT INTO `sys_log_201904` VALUES ('197752', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '72', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:23:51', '0', '2019-04-17 16:23:51');
INSERT INTO `sys_log_201904` VALUES ('197753', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '53', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:24:42', '0', '2019-04-17 16:24:42');
INSERT INTO `sys_log_201904` VALUES ('197754', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '186', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:24:42', '0', '2019-04-17 16:24:42');
INSERT INTO `sys_log_201904` VALUES ('197755', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '52', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:24:45', '0', '2019-04-17 16:24:45');
INSERT INTO `sys_log_201904` VALUES ('197756', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '187', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:24:46', '0', '2019-04-17 16:24:46');
INSERT INTO `sys_log_201904` VALUES ('197757', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '72', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:31:21', '0', '2019-04-17 16:31:21');
INSERT INTO `sys_log_201904` VALUES ('197758', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '181', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:31:21', '0', '2019-04-17 16:31:21');
INSERT INTO `sys_log_201904` VALUES ('197759', '1', '管理员', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"admin\",\"captchaId\":\"305dc80a-7c39-4d93-9a53-be85ba1e3487\",\"captchaValue\":\"t5es\",\"password\":\"****\"}]', '1', '46', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-17 16:43:31', '0', '2019-04-17 16:43:31');
INSERT INTO `sys_log_201904` VALUES ('197760', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '78', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:48:52', '0', '2019-04-17 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197761', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '172', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 16:48:52', '0', '2019-04-17 16:48:52');
INSERT INTO `sys_log_201904` VALUES ('197762', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"ff6c7eda-c620-4130-9844-66d750bed277\",\"captchaValue\":\"iw1d\",\"password\":\"****\"}]', '1', '30', '121.35.1.74', '6', null, '1', '0', '0', '2019-04-17 16:50:48', '0', '2019-04-17 16:50:48');
INSERT INTO `sys_log_201904` VALUES ('197763', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '193', '121.35.1.74', '1', null, '1', '0', '0', '2019-04-17 18:47:17', '0', '2019-04-17 18:47:17');
INSERT INTO `sys_log_201904` VALUES ('197764', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"207f2425-4da1-4a38-980f-1fec02f22781\",\"captchaValue\":\"wos7\",\"password\":\"****\"}]', '1', '29', '121.35.1.74', '6', null, '1', '0', '0', '2019-04-17 21:21:45', '0', '2019-04-17 21:21:45');
INSERT INTO `sys_log_201904` VALUES ('197765', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"0a040a48-9bc8-4fe1-9ee9-95c8a11698b3\",\"captchaValue\":\"mzgg\",\"password\":\"****\"}]', '1', '29', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-18 08:54:22', '0', '2019-04-18 08:54:22');
INSERT INTO `sys_log_201904` VALUES ('197766', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"234e9387-2c96-4805-9fd4-a2f554d69454\",\"captchaValue\":\"frpl\",\"password\":\"****\"}]', '1', '47', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 09:40:24', '0', '2019-04-18 09:40:24');
INSERT INTO `sys_log_201904` VALUES ('197767', '0', '0', '实时获取平台注册人数', '9', 'com.yx.web.server.controller.user.UserController.queryRegisterCountResult', null, '1', '127', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 10:09:23', '0', '2019-04-18 10:09:23');
INSERT INTO `sys_log_201904` VALUES ('197768', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"45a57312-be91-4073-970e-1c898c68759b\",\"captchaValue\":\"fa2r\",\"password\":\"****\"}]', '1', '75', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 10:41:59', '0', '2019-04-18 10:41:59');
INSERT INTO `sys_log_201904` VALUES ('197769', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"a1e5c3ce-13a5-4559-b037-a16fdd083cd7\",\"captchaValue\":\"c2xu\",\"password\":\"****\"}]', '1', '32', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-18 13:36:00', '0', '2019-04-18 13:36:00');
INSERT INTO `sys_log_201904` VALUES ('197770', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"19a1f571-68ed-4c16-9acb-a349451a0dda\",\"captchaValue\":\"qhh2\",\"password\":\"****\"}]', '1', '26', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 14:08:30', '0', '2019-04-18 14:08:30');
INSERT INTO `sys_log_201904` VALUES ('197771', '1016151836104032288', '张绍刚', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangshaogang\",\"captchaId\":\"436e1722-a798-4948-bc0a-7ba8f993208a\",\"captchaValue\":\"qkau\",\"password\":\"****\"}]', '1', '35', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 14:58:52', '0', '2019-04-18 14:58:52');
INSERT INTO `sys_log_201904` VALUES ('197772', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"c93d5522-5983-49fe-aa78-c09d9383f327\",\"captchaValue\":\"c9v1\",\"password\":\"****\"}]', '1', '27', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 15:43:58', '0', '2019-04-18 15:43:58');
INSERT INTO `sys_log_201904` VALUES ('197773', '1016151836104032271', '张晓文', '借款申请列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPage', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '153', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 15:43:59', '0', '2019-04-18 15:43:59');
INSERT INTO `sys_log_201904` VALUES ('197774', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"4cf4a756-d484-474b-8cfa-bddc1f09c86c\",\"captchaValue\":\"395n\",\"password\":\"****\"}]', '1', '28', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-18 16:22:34', '0', '2019-04-18 16:22:34');
INSERT INTO `sys_log_201904` VALUES ('197775', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '63', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:20:52', '0', '2019-04-18 17:20:52');
INSERT INTO `sys_log_201904` VALUES ('197776', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '90', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:20:53', '0', '2019-04-18 17:20:53');
INSERT INTO `sys_log_201904` VALUES ('197777', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '127', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:20:53', '0', '2019-04-18 17:20:53');
INSERT INTO `sys_log_201904` VALUES ('197778', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '133', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:20:53', '0', '2019-04-18 17:20:53');
INSERT INTO `sys_log_201904` VALUES ('197779', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '211', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:20:53', '0', '2019-04-18 17:20:53');
INSERT INTO `sys_log_201904` VALUES ('197780', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '134', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 17:21:10', '0', '2019-04-18 17:21:10');
INSERT INTO `sys_log_201904` VALUES ('197781', '1016151836104032271', '张晓文', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"zhangxiaowen\",\"captchaId\":\"2e9d0c9a-820f-4b86-a29c-137fa6707eff\",\"captchaValue\":\"ttpw\",\"password\":\"****\"}]', '1', '30', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 20:16:51', '0', '2019-04-18 20:16:51');
INSERT INTO `sys_log_201904` VALUES ('197782', '1016151836104032271', '张晓文', '借款申请列表', '1', 'com.yx.admin.server.controller.borrowApply.BorrowApplyController.selectPage', '[{\"asc\":true,\"current\":1,\"limit\":2147483647,\"offset\":0,\"offsetCurrent\":0,\"openSort\":true,\"pages\":0,\"records\":[],\"searchCount\":true,\"size\":10,\"total\":0}]', '1', '19', '121.35.0.118', '6', null, '1', '0', '0', '2019-04-18 20:16:52', '0', '2019-04-18 20:16:52');
INSERT INTO `sys_log_201904` VALUES ('197783', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '47', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-18 21:46:23', '0', '2019-04-18 21:46:23');
INSERT INTO `sys_log_201904` VALUES ('197784', '1016151836104032286', '李文英', '用户登录', '4', 'com.yx.admin.server.controller.sys.LoginController.login', '[{\"account\":\"liwenying\",\"captchaId\":\"8c48846f-356c-4f14-a34d-4366c2de292d\",\"captchaValue\":\"qq9t\",\"password\":\"****\"}]', '1', '62', '124.65.160.218', '6', null, '1', '0', '0', '2019-04-19 08:59:19', '0', '2019-04-19 08:59:19');
INSERT INTO `sys_log_201904` VALUES ('197785', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '34', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 09:16:07', '0', '2019-04-19 09:16:07');
INSERT INTO `sys_log_201904` VALUES ('197786', '0', '0', '获取图形验证码', '9', 'com.yx.web.server.controller.user.UserController.queryCaptcha', null, '1', '13', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 09:16:23', '0', '2019-04-19 09:16:23');
INSERT INTO `sys_log_201904` VALUES ('197787', '0', '0', '用户登录', '4', 'com.yx.web.server.controller.user.UserController.login', null, '1', '101', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 10:04:24', '0', '2019-04-19 10:04:24');
INSERT INTO `sys_log_201904` VALUES ('197788', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '75', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 10:04:24', '0', '2019-04-19 10:04:24');
INSERT INTO `sys_log_201904` VALUES ('197789', '44318', 'YX13301012345', '用户信息', '4', 'com.yx.web.server.controller.user.UserController.info', null, '1', '148', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 10:04:25', '0', '2019-04-19 10:04:25');
INSERT INTO `sys_log_201904` VALUES ('197790', '44318', 'YX13301012345', '风险测评--获取测评结果', '2', 'com.yx.web.server.controller.user.RiskAssessmentController.isFirstRisk', null, '1', '151', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 10:04:25', '0', '2019-04-19 10:04:25');
INSERT INTO `sys_log_201904` VALUES ('197791', '44318', 'YX13301012345', '余额查询', '9', 'com.yx.web.server.controller.user.UserController.queryBalance', null, '1', '236', '121.35.0.118', '1', null, '1', '0', '0', '2019-04-19 10:04:25', '0', '2019-04-19 10:04:25');
INSERT INTO `sys_log_201904` VALUES ('197792', '0', '0', '获取图形验证码', '9', 'com.yx.wx.server.controller.user.UserController.queryCaptcha', '[]', '1', '2102', '121.35.0.118', '3', null, '1', '0', '0', '2019-04-19 11:18:01', '0', '2019-04-19 11:18:01');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` smallint(2) DEFAULT '2' COMMENT '菜单类型(0：目录1：菜单2：按钮)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(50) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `sort_no` int(2) DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=946758603266957599 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '0', 'icon-xitongguanli', '#', '1', '1', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-30 23:35:04');
INSERT INTO `sys_menu` VALUES ('2', '系统用户管理', '1', '1', 'icon-yonghuguanli', 'page/user/userList.html', '0', '1', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-30 23:33:43');
INSERT INTO `sys_menu` VALUES ('3', '部门管理', '1', '1', 'icon-bumenguanli', 'page/dept/deptList.html', '0', '2', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:41:08');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', '1', 'icon-caidanguanli', 'page/menu/menuList.html', '0', '3', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:41:28');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', '1', '1', 'icon-jiaoseguanli', 'page/role/roleList.html', '0', '4', '1', '', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 15:51:49');
INSERT INTO `sys_menu` VALUES ('7', '字典管理', '1', '1', 'icon-ccgl-shujuzidian-1', 'page/dic/dicList.html', '0', '7', '1', 'sys:dic', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 23:10:16');
INSERT INTO `sys_menu` VALUES ('8', '参数管理', '1', '1', 'icon-xitongcanshuguanli', 'page/param/paramList.html', '0', '8', '1', '', '', '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:42:19');
INSERT INTO `sys_menu` VALUES ('9', '日志管理', '1', '1', 'icon-ccgl-shujuzidian-1', 'page/log/logList.html', '0', '9', '1', 'sys:log:read', '', '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-29 23:07:05');
INSERT INTO `sys_menu` VALUES ('18', '新增', '2', '2', null, null, '0', '2', '1', 'sys:user:add', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('19', '修改', '2', '2', null, null, '0', '3', '1', 'sys:user:update', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('21', '删除', '2', '2', null, null, '0', '4', '1', 'sys:user:delete', null, '0', '1', '1', '2017-12-19 12:37:20', '1', '2017-12-19 12:37:23');
INSERT INTO `sys_menu` VALUES ('22', '应用监控', '1', '1', 'icon-jiaoseguanli', 'druid/webapp.html', '0', '12', '1', 'sys:sql:read', null, '0', '1', '1', '2016-06-20 09:16:56', '1', '2017-12-28 22:44:36');
INSERT INTO `sys_menu` VALUES ('945569164808769538', '新增', '2', '5', null, null, '0', '2', '1', 'sys:role:add', null, '0', '1', '1', '2017-12-26 16:17:11', '1', '2018-12-08 20:11:07');
INSERT INTO `sys_menu` VALUES ('945569292122673153', '修改', '2', '5', null, null, '0', '3', '1', 'sys:role:update', null, '0', '1', '1', '2017-12-26 16:17:42', '1', '2018-12-08 20:11:16');
INSERT INTO `sys_menu` VALUES ('945569401908580354', '删除', '2', '5', null, null, '0', '4', '1', 'sys:role:delete', null, '0', '1', '1', '2017-12-26 16:18:08', '1', '2017-12-26 16:20:08');
INSERT INTO `sys_menu` VALUES ('945570894350995458', '新增', '2', '3', null, null, '0', '2', '1', 'sys:dept:add', null, '0', '1', '1', '2017-12-26 16:24:04', '1', '2017-12-26 16:24:53');
INSERT INTO `sys_menu` VALUES ('945570988546674689', '修改', '2', '3', null, null, '0', '3', '1', 'sys:dept:update', null, '0', '1', '1', '2017-12-26 16:24:26', '1', '2018-12-08 20:04:37');
INSERT INTO `sys_menu` VALUES ('945571061959577601', '删除', '2', '3', null, null, '0', '4', '1', 'sys:dept:delete', null, '0', '1', '1', '2017-12-26 16:24:44', '1', '2017-12-26 16:24:56');
INSERT INTO `sys_menu` VALUES ('945571423827349506', '新增', '2', '4', null, null, '0', '2', '1', 'sys:menu:add', null, '0', '1', '1', '2017-12-26 16:26:10', '1', '2017-12-26 16:26:51');
INSERT INTO `sys_menu` VALUES ('945571487333306370', '修改', '2', '4', null, null, '0', '3', '1', 'sys:menu:update', null, '0', '1', '1', '2017-12-26 16:26:25', '1', '2018-12-08 20:00:41');
INSERT INTO `sys_menu` VALUES ('945571554194706434', '删除', '2', '4', null, null, '0', '4', '1', 'sys:menu:delete', null, '0', '1', '1', '2017-12-26 16:26:41', '1', '2017-12-30 23:33:32');
INSERT INTO `sys_menu` VALUES ('946651550468222977', '新增', '2', '8', null, null, '0', '2', '1', 'sys:param:add', null, '0', '1', '1', '2017-12-29 15:58:12', '1', '2017-12-29 23:34:44');
INSERT INTO `sys_menu` VALUES ('946651788901822466', '修改', '2', '8', null, null, '0', '3', '1', 'sys:param:update', null, '0', '1', '1', '2017-12-29 15:59:09', '1', '2018-12-08 20:17:34');
INSERT INTO `sys_menu` VALUES ('946651900851990530', '删除', '2', '8', null, null, '0', '4', '1', 'sys:param:delete', null, '0', '1', '1', '2017-12-29 15:59:36', '1', '2017-12-29 23:34:48');
INSERT INTO `sys_menu` VALUES ('946748446155739137', '查看', '2', '2', null, null, '0', '1', '1', 'sys:user:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758013140967425', '查看', '2', '3', null, null, '0', '1', '1', 'sys:dept:read', null, '0', '1', '1', '2017-12-29 23:01:15', '1', '2017-12-30 23:24:45');
INSERT INTO `sys_menu` VALUES ('946758083039043585', '查看', '2', '4', null, null, '0', '1', '1', 'sys:menu:read', null, '0', '1', '1', '2017-12-29 23:01:32', '1', '2017-12-29 23:35:15');
INSERT INTO `sys_menu` VALUES ('946758190165762049', '查看', '2', '5', null, null, '0', '1', '1', 'sys:role:read', null, '0', '1', '1', '2017-12-29 23:01:57', '1', '2017-12-29 23:35:13');
INSERT INTO `sys_menu` VALUES ('946758541132537857', '查看', '2', '8', null, null, '0', '1', '1', 'sys:param:read', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957314', '定时任务管理', '1', '1', 'icon-jiaoseguanli', 'page/job/scheduleJobList.html', '0', '13', '1', null, null, '0', '1', '1', '2018-07-10 16:14:37', '1', '2018-07-10 16:14:37');
INSERT INTO `sys_menu` VALUES ('946758603266957315', '用户管理', '0', '0', 'icon-xitongguanli', null, '0', '2', '1', null, null, '0', '1', '1', '2018-07-22 16:55:40', '1', '2018-07-22 16:55:40');
INSERT INTO `sys_menu` VALUES ('946758603266957316', '用户列表', '1', '946758603266957315', 'icon-jiaoseguanli', 'page/userInfo/userInfoList.html', '0', '1', '1', null, null, '0', '1', '1', '2018-07-22 16:58:01', '1', '2018-07-22 16:58:01');
INSERT INTO `sys_menu` VALUES ('946758603266957317', '借款管理', '0', '0', 'icon-jiaoseguanli', null, '0', '3', '1', null, null, '0', '1', '1', '2018-07-22 16:58:28', '1', '2018-07-22 16:58:28');
INSERT INTO `sys_menu` VALUES ('946758603266957318', '标的管理', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productList.html', '0', '1', '1', null, null, '0', '1', '1', '2018-07-22 17:08:08', '1', '2018-07-22 17:08:08');
INSERT INTO `sys_menu` VALUES ('946758603266957329', '运营管理', '0', '0', 'icon-jiaoseguanli', null, '0', '9', '1', null, null, '0', '1', '1', '2018-07-24 11:26:36', '1', '2018-08-08 11:48:32');
INSERT INTO `sys_menu` VALUES ('946758603266957349', '文件上传', '1', '1', 'icon-caidanguanli', 'page/oss/sysOssList.html', '0', '13', '1', null, null, '0', '1', '1', '2018-07-29 17:14:05', '1', '2018-07-29 17:14:05');
INSERT INTO `sys_menu` VALUES ('946758603266957351', '发标审核列表', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productFirstList.html', '0', '3', '1', null, null, '0', '1', '1', '2018-08-01 09:30:49', '1016151836104032271', '2018-12-13 10:03:22');
INSERT INTO `sys_menu` VALUES ('946758603266957352', '发标复核列表', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productFinalList.html', '0', '4', '1', null, null, '0', '1', '1', '2018-08-01 09:31:57', '1016151836104032271', '2018-12-13 10:04:05');
INSERT INTO `sys_menu` VALUES ('946758603266957360', '轮播图', '1', '946758603266957329', 'icon-jiaoseguanli', 'page/slideshow/slideshowList.html', '0', '3', '1', null, null, '0', '1', '1', '2018-08-09 15:29:31', '1', '2018-08-10 10:09:27');
INSERT INTO `sys_menu` VALUES ('946758603266957362', '文件-图片上传', '1', '1', 'icon-qianniu', 'page/product/uploadDemo.html', '0', '100', '1', null, null, '0', '1', '1', '2018-08-12 16:23:27', '1', '2018-09-29 14:55:17');
INSERT INTO `sys_menu` VALUES ('946758603266957363', '消息中心', '1', '946758603266957329', 'icon-jiaoseguanli', 'page/messageCenter/messageCenterList.html', '0', '9', '1', null, null, '0', '1', '1', '2018-08-15 20:01:12', '1', '2018-08-16 09:37:17');
INSERT INTO `sys_menu` VALUES ('946758603266957364', '招标中列表', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productBidingList.html', '0', '5', '1', null, null, '0', '1', '1', '2018-08-17 17:59:40', '1', '2018-08-17 17:59:40');
INSERT INTO `sys_menu` VALUES ('946758603266957365', '已还款列表', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productPayOffList.html', '0', '6', '1', null, null, '0', '1', '1', '2018-08-19 18:57:10', '1', '2018-08-19 18:57:10');
INSERT INTO `sys_menu` VALUES ('946758603266957366', '还款中列表', '1', '946758603266957317', 'icon-jiaoseguanli', 'page/product/productRepaymentingList.html', '0', '7', '1', null, null, '0', '1', '1', '2018-08-19 19:01:51', '1', '2018-08-19 19:01:51');
INSERT INTO `sys_menu` VALUES ('946758603266957375', '常见问题', '1', '946758603266957329', 'icon-jiaoseguanli', 'page/commonProblem/commonProblemList.html', '0', '16', '1', null, null, '0', '1', '1', '2018-08-22 10:10:21', '1', '2018-08-22 11:27:12');
INSERT INTO `sys_menu` VALUES ('946758603266957412', 'App版本管理', '1', '1', 'icon-shake', 'page/appVersion/appVersionList.html', '0', '14', '1', null, null, '0', '1', '1016151836104032273', '2018-12-05 15:46:42', '1016151836104032273', '2018-12-05 15:48:28');
INSERT INTO `sys_menu` VALUES ('946758603266957413', '新增', '2', '7', null, null, '0', '2', '1', 'sys:dic:add', null, '0', '1', '1', '2017-12-26 16:17:11', '1', '2018-12-08 20:11:07');
INSERT INTO `sys_menu` VALUES ('946758603266957414', '修改', '2', '7', null, null, '0', '3', '1', 'sys:dic:update', null, '0', '1', '1', '2017-12-26 16:17:42', '1', '2018-12-08 20:11:16');
INSERT INTO `sys_menu` VALUES ('946758603266957415', '删除', '2', '7', null, null, '0', '4', '1', 'sys:dic:delete', null, '0', '1', '1', '2017-12-26 16:18:08', '1', '2017-12-26 16:20:08');
INSERT INTO `sys_menu` VALUES ('946758603266957416', '查看', '2', '7', null, null, '0', '1', '1', 'sys:dic:read', null, '0', '1', '1', '2017-12-29 23:01:57', '1', '2017-12-29 23:35:13');
INSERT INTO `sys_menu` VALUES ('946758603266957417', '查看', '2', '9', null, null, '0', '1', '1', 'sys:log:read', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957418', '新增', '2', '946758603266957314', null, null, '0', '2', '1', 'sys:job:add', null, '0', '1', '1', '2017-12-29 15:58:12', '1', '2017-12-29 23:34:44');
INSERT INTO `sys_menu` VALUES ('946758603266957419', '修改', '2', '946758603266957314', null, null, '0', '3', '1', 'sys:job:update', null, '0', '1', '1', '2017-12-29 15:59:09', '1', '2018-12-08 20:17:34');
INSERT INTO `sys_menu` VALUES ('946758603266957420', '删除', '2', '946758603266957314', null, null, '0', '4', '1', 'sys:job:delete', null, '0', '1', '1', '2017-12-29 15:59:36', '1', '2017-12-29 23:34:48');
INSERT INTO `sys_menu` VALUES ('946758603266957421', '查看', '2', '946758603266957314', null, null, '0', '1', '1', 'sys:job:read', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957422', '暂停、恢复', '2', '946758603266957314', null, null, '0', '5', '1', 'sys:job:pauseAndResume', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957423', '立即运行', '2', '946758603266957314', null, null, '0', '6', '1', 'sys:job:run', null, '0', '1', '1', '2017-12-29 23:03:21', '1', '2017-12-29 23:35:09');
INSERT INTO `sys_menu` VALUES ('946758603266957424', '新增', '2', '946758603266957316', null, null, '0', '2', '1', 'sys:userInfo:add', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('946758603266957425', '查看', '2', '946758603266957316', null, null, '0', '1', '1', 'sys:userInfo:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957426', '启用、禁用', '2', '946758603266957316', null, null, '0', '3', '1', 'sys:userInfo:enableAndDisable', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957427', '导出', '2', '946758603266957316', null, null, '0', '4', '1', 'sys:userInfo:export', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957428', '重置密码', '2', '946758603266957316', null, null, '0', '5', '1', 'sys:userInfo:restPassword', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957431', '查看', '2', '946758603266957318', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957432', '新增', '2', '946758603266957318', null, null, '0', '2', '1', 'sys:product:add', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('946758603266957433', '修改', '2', '946758603266957318', null, null, '0', '3', '1', 'sys:product:update', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('946758603266957434', '删除', '2', '946758603266957318', null, null, '0', '4', '1', 'sys:product:delete', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957435', '导出', '2', '946758603266957318', null, null, '0', '5', '1', 'sys:product:export', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957436', '流标', '2', '946758603266957318', null, null, '0', '6', '1', 'sys:product:flow', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957437', '放款', '2', '946758603266957318', null, null, '0', '7', '1', 'sys:product:loan', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957438', '查看', '2', '946758603266957351', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 22:28:24');
INSERT INTO `sys_menu` VALUES ('946758603266957439', '审核', '2', '946758603266957351', null, null, '0', '2', '1', 'sys:product:firstCheck', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('946758603266957440', '查看', '2', '946758603266957352', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 22:28:40');
INSERT INTO `sys_menu` VALUES ('946758603266957441', '审核', '2', '946758603266957352', null, null, '0', '2', '1', 'sys:product:finalCheck', null, '0', '1', '1', '2017-12-19 11:22:58', '1', '2018-12-08 19:43:00');
INSERT INTO `sys_menu` VALUES ('946758603266957442', '查看', '2', '946758603266957364', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957443', '导出', '2', '946758603266957364', null, null, '0', '2', '1', 'sys:product:export', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957444', '流标', '2', '946758603266957364', null, null, '0', '3', '1', 'sys:product:flow', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957445', '置顶、取消', '2', '946758603266957364', null, null, '0', '4', '1', 'sys:product:pushAndCancel', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957446', '查看', '2', '946758603266957365', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957447', '导出', '2', '946758603266957365', null, null, '0', '2', '1', 'sys:product:export', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957448', '查看', '2', '946758603266957366', null, null, '0', '1', '1', 'sys:product:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957449', '导出', '2', '946758603266957366', null, null, '0', '2', '1', 'sys:product:export', null, '0', '1', '1', '2017-12-19 12:35:36', '1', '2018-12-08 19:43:17');
INSERT INTO `sys_menu` VALUES ('946758603266957520', '查看', '2', '946758603266957360', null, null, '0', '1', '1', 'sys:sysSlideshow:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957521', '添加', '2', '946758603266957360', null, null, '0', '2', '1', 'sys:sysSlideshow:add', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957522', '修改', '2', '946758603266957360', null, null, '0', '3', '1', 'sys:sysSlideshow:update', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957523', '发布、下线', '2', '946758603266957360', null, null, '0', '5', '1', 'sys:sysSlideshow:downAndUp', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-09 17:42:45');
INSERT INTO `sys_menu` VALUES ('946758603266957532', '查看', '2', '946758603266957363', null, null, '0', '1', '1', 'sys:sysMessageCenter:read', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957533', '添加', '2', '946758603266957363', null, null, '0', '2', '1', 'sys:sysMessageCenter:add', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957534', '修改', '2', '946758603266957363', null, null, '0', '3', '1', 'sys:sysMessageCenter:update', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957535', '置顶、取消', '2', '946758603266957363', null, null, '0', '4', '1', 'sys:sysMessageCenter:rank', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957536', '发布、下线', '2', '946758603266957363', null, null, '0', '5', '1', 'sys:sysMessageCenter:downAndUp', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-08 19:43:34');
INSERT INTO `sys_menu` VALUES ('946758603266957547', '启用、禁用', '2', '2', null, null, '0', '5', '1', 'sys:user:enableAndDisable', null, '0', '1', '1', '2017-12-29 22:23:13', '1', '2018-12-14 13:04:59');
INSERT INTO `sys_menu` VALUES ('946758603266957550', '修改推荐人手机号码', '2', '946758603266957316', null, null, '0', '6', '1', 'sys:userInfo:updateRefphone', null, '0', '1', '1', '2018-12-14 13:23:04', '1', '2018-12-14 13:23:56');
INSERT INTO `sys_menu` VALUES ('946758603266957555', '编辑', '2', '946758603266957351', null, null, '0', '3', '1', 'sys:product:update', null, '0', '1', '1', '2018-12-14 15:26:49', '1', '2018-12-14 23:26:42');
INSERT INTO `sys_menu` VALUES ('946758603266957556', '编辑', '2', '946758603266957352', null, null, '0', '3', '1', 'sys:product:update', null, '0', '1', '1', '2018-12-14 15:27:04', '1', '2018-12-14 23:26:39');
INSERT INTO `sys_menu` VALUES ('946758603266957557', '修改标的名称', '2', '946758603266957351', null, null, '0', '4', '1', 'sys:product:updateProductTitle', null, '0', '1', '1', '2018-12-14 15:29:46', '1', '2018-12-14 23:24:25');
INSERT INTO `sys_menu` VALUES ('946758603266957558', '修改标的名称', '2', '946758603266957352', null, null, '0', '4', '1', 'sys:product:updateProductTitle', null, '0', '1', '1', '2018-12-14 15:29:58', '1', '2018-12-14 23:24:13');
INSERT INTO `sys_menu` VALUES ('946758603266957563', '满标放款提醒', '1', '946758603266957317', 'icon-clock', 'page/product/remindPhoneList.html', '0', '2', '1', null, null, '0', '1', '1016151836104032273', '2019-01-23 10:33:18', '1016151836104032273', '2019-01-23 17:45:17');
INSERT INTO `sys_menu` VALUES ('946758603266957568', '标的管理-关闭处理中的订单', '2', '946758603266957318', null, null, '0', null, '1', 'sys:product:failBidOrder', null, '0', '1', '1016151836104032273', '2019-01-29 11:46:56', '1016151836104032273', '2019-01-29 11:46:56');
INSERT INTO `sys_menu` VALUES ('946758603266957576', '账户金额冻结', '2', '946758603266957316', null, null, '0', null, '1', 'sys:userInfo:accountThawing', null, '0', '1', '1016151836104032271', '2019-02-21 10:26:16', '1016151836104032271', '2019-02-21 10:32:23');
INSERT INTO `sys_menu` VALUES ('946758603266957577', '账户金额解冻', '2', '946758603266957316', null, null, '0', null, '1', 'sys:userInfo:accountFreeze', null, '0', '1', '1016151836104032271', '2019-02-21 10:26:40', '1016151836104032271', '2019-02-21 10:26:40');

-- ----------------------------
-- Table structure for sys_message_center
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_center`;
CREATE TABLE `sys_message_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '内容标题',
  `url` varchar(255) DEFAULT NULL COMMENT 'url路径',
  `content` longtext NOT NULL COMMENT '内容描述',
  `description` varchar(255) DEFAULT NULL COMMENT '本条数据的描述',
  `sketch` varchar(255) DEFAULT NULL COMMENT '内容简述，用于手机上标的下的简洁描述两行...',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文件url',
  `type` tinyint(2) NOT NULL COMMENT '1.公告列表2.视频专区3.行业质询4.媒体报道5.存管动态6.网贷知识7.政策法规',
  `ranking` tinyint(2) NOT NULL DEFAULT '0' COMMENT '置顶：0-不置顶 1,-置顶',
  `status` tinyint(2) NOT NULL COMMENT '内容是否有效，0-待发布 1-上线，2-下线',
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`) USING BTREE,
  KEY `idx_type_status` (`type`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息中心表';

-- ----------------------------
-- Records of sys_message_center
-- ----------------------------
INSERT INTO `sys_message_center` VALUES ('1', '什么是互联网金融？', null, '<p style=\"text-align: center;\"><strong><br/></strong></p><p style=\"text-align: center;\"><strong>什么是互联网金融？</strong></p><p><strong><br/></strong></p><p>&nbsp; &nbsp; 互联网金融是传统金融机构与互联网企业利用互联网技术和信息通信技术实现资金融通、支付、投资和信息中介服务的新型金融业务模式。互联网与金融深度融合是大势所趋，将对金融产品、业务、组织和服务等方面产生更加深刻的影响。促进互联网金融健康发展，有利于提升金融服务质量和效率，深化金融改革，促进金融创新发展，扩大金融业对内对外开放，构建多层次金融体系。</p>', '互联网金融是传统金融机构与互联网企业利用互联网技术和信息通信技术实现资金融通、支付、投资和信息中介服务的新型金融业务模式。互联网与金融深度融合是大势所趋，将对金融产品、业务、组织和服务等方面产生更加深刻的影响。促进互联网金融健康发展，有利于提升金融服务质量和效率，深化金融改革，促进金融创新发展，扩大金融业对内对外开放，构建多层次金融体系。', '互联网金融是传统金融机构与互联网企业利用互联网技术和信息通信技术实现...', '什么是互联网金融？', null, '6', '0', '1', '2018-10-19 10:24:00', '1016151836104032272', '2018-10-19 10:24:00', '1016151836104032271');
INSERT INTO `sys_message_center` VALUES ('2', '什么是网络借贷？', null, '<p style=\"text-align: center;\"><span><b>什么是网络借贷？</b></span></p><p><span>网络借贷是指个体和个体之间通过互联网平台实现的直接借贷。个体包含自然人、法人及其他组织。</span></p>', '网络借贷是指个体和个体之间通过互联网平台实现的直接借贷。个体包含自然人、法人及其他组织。', '网络借贷是指个体和个体之间通过互联网平台实现的直接借贷...', '什么是网络借贷？', null, '6', '0', '1', '2018-10-19 10:25:08', '1016151836104032272', '2018-10-19 10:25:08', '1016151836104032272');
INSERT INTO `sys_message_center` VALUES ('3', '什么是网络借贷信息中介机构？', null, '<p style=\"text-align: center;\"><strong><span style=\"font-size: 20px;\">什么是网络借贷信息中介机构？</span></strong></p><p><strong><span style=\"font-size: 20px;\"><br/></span></strong></p><p>网络借贷信息中介机构是指依法设立，专门从事网络借贷信息中介业务活动的金融信息中介公司。该类机构以互联网为主要渠道，为借款人与出借人（即贷款人）实现直接借贷提供信息搜集、信息公布、资信评估、信息交互、借贷撮合等服务。</p>', '网络借贷信息中介机构是指依法设立，专门从事网络借贷信息中介业务活动的金融信息中介公司。该类机构以互联网为主要渠道，为借款人与出借人（即贷款人）实现直接借贷提供信息搜集、信息公布、资信评估、信息交互、借贷撮合等服务。', '网络借贷信息中介机构是指依法设立，专门从事网络借贷...', '什么是网络借贷信息中介机构？', null, '6', '0', '1', '2018-10-19 10:25:55', '1016151836104032272', '2018-10-19 10:25:55', '1016151836104032271');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2737 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('1', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180729/07a2c1b3ef7c42978cbc826e0a8744e8.jpg', '2018-07-29 18:43:10', null, '2018-07-29 18:43:10', null);
INSERT INTO `sys_oss` VALUES ('3', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/994fc20396474ac391400e91c4810b8d.jpg', '2018-07-31 16:45:35', null, '2018-07-31 16:45:35', null);
INSERT INTO `sys_oss` VALUES ('4', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/e2b413ca06bf475190f02c7eead3770b.jpg', '2018-07-31 16:46:22', null, '2018-07-31 16:46:22', null);
INSERT INTO `sys_oss` VALUES ('5', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/c93a649ec14940f380cc81defeac74b3.jpg', '2018-07-31 16:46:37', null, '2018-07-31 16:46:37', null);
INSERT INTO `sys_oss` VALUES ('6', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/0d65626c009c42b0b3862e889e5ed76f.jpg', '2018-07-31 16:54:08', null, '2018-07-31 16:54:08', null);
INSERT INTO `sys_oss` VALUES ('7', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/29ebc43874314eb0a29bb3b88f375887.jpg', '2018-07-31 16:54:09', null, '2018-07-31 16:54:09', null);
INSERT INTO `sys_oss` VALUES ('8', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/01a75b935aff4e9084c924fec28ab998.jpg', '2018-07-31 16:54:09', null, '2018-07-31 16:54:09', null);
INSERT INTO `sys_oss` VALUES ('9', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/543f44260b6f4753a6e33c6442d84d6f.jpg', '2018-07-31 16:56:45', null, '2018-07-31 16:56:45', null);
INSERT INTO `sys_oss` VALUES ('10', 'https://yinxin-oss-public.oss-cn-beijing.aliyuncs.com/upload/20180731/f75803e4f2ea4d2abfdc93c99ddf151c.jpg', '2018-07-31 16:56:45', null, '2018-07-31 16:56:45', null);

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `param_key` varchar(100) NOT NULL COMMENT '参数键名',
  `param_value` text NOT NULL COMMENT '参数键值',
  `catalog_id` bigint(20) DEFAULT NULL,
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_by` bigint(20) NOT NULL DEFAULT '999999' COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL DEFAULT '999999' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sp_idx_param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COMMENT='全局参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO `sys_param` VALUES ('9', 'CLOUD_STORAGE_CONFIG_KEY', '{\"accessKeyId\":\"youraccesskeyid\",\"accessKeySecret\":\"youracessskeysecret\",\"bucketName\":\"yx-oss-public\",\"domain\":\"https://yx-oss-public.oss-cn-qingdao.aliyuncs.com\",\"endPoint\":\"https://oss-cn-qingdao.aliyuncs.com\",\"prefix\":\"upload\",\"type\":1}', null, 'oss设置', '1', '0', '1', '2018-07-26 17:39:25', '1', '2019-11-29 10:44:36');
INSERT INTO `sys_param` VALUES ('25', 'PDF_FONT', '/root/yx-framework/simhei.ttf', null, 'pdf中文包', '1', '0', '1', '2018-08-10 07:57:40', '1', '2019-03-18 16:13:20');
INSERT INTO `sys_param` VALUES ('37', 'GESTURE_ERR_COUNT', '5', null, '手势密码错误最大次数', '1', '0', '1', '2018-08-24 14:38:48', '1', '2018-08-24 14:38:48');
INSERT INTO `sys_param` VALUES ('75', 'WX_SERVER_URL', 'http://wx-test.yx-framework.com', null, '微信的BASE_URL', '1', '0', '1', '2018-11-05 14:57:12', '1', '2019-11-29 10:45:28');
INSERT INTO `sys_param` VALUES ('76', 'PC_SERVER_URL', 'http://web-test.yx-framework.com', null, 'PC的BASE_URL', '1', '0', '1', '2018-11-05 14:57:59', '1', '2019-11-29 10:45:46');
INSERT INTO `sys_param` VALUES ('110', 'EXPORT_MIN_TIME', '1', null, '手动导出EXCEL最小时间间隔（分钟）', '1', '0', '1', '2018-12-06 17:44:47', '1', '2018-12-06 18:39:09');
INSERT INTO `sys_param` VALUES ('119', 'UEDITOR_CONFIG', '/root/yx-framework/config.json', null, 'ueditor初始化配置文件', '1', '0', '1', '2018-12-24 11:01:33', '1', '2018-12-24 11:01:33');
INSERT INTO `sys_param` VALUES ('122', 'RESOURCE_SERVER_URL', 'http://resource-test.yx-framework.com', null, 'RESOURCE的BASE_URL', '1', '0', '1', '2018-12-25 11:48:17', '1', '2019-11-29 10:46:05');
INSERT INTO `sys_param` VALUES ('123', 'USER_LOGIN_LOG_CREATE_TABLE_SQL', 'CREATE TABLE `user_login_log_${date}` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT,\r\n  `user_id` bigint(20) NOT NULL DEFAULT \'0\',\r\n  `channel_type` tinyint(2) NOT NULL DEFAULT \'0\' COMMENT \'渠道类型：对应ChannelTypeEnum枚举类\',\r\n  `channel_version` varchar(128) NOT NULL DEFAULT \'0\' COMMENT \'版本号\',\r\n  `ip` varchar(128) NOT NULL DEFAULT \'0\',\r\n  `dervice_name` varchar(255) DEFAULT NULL COMMENT \'设备名称\',\r\n  `login_time` datetime NOT NULL COMMENT \'登陆时间\',\r\n  PRIMARY KEY (`id`),\r\n  KEY `idx_user_id` (`user_id`) USING BTREE,\r\n  KEY `idx_userid_channeltype` (`user_id`,`channel_type`) USING BTREE\r\n) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT=\'用户登陆日志表${date}\';\r\n', null, '用户登陆日志建表SQL', '1', '0', '1', '2018-12-29 12:55:24', '1', '2018-12-29 12:57:09');
INSERT INTO `sys_param` VALUES ('124', 'SYS_LOG_CREATE_TABLE_SQL', 'CREATE TABLE `sys_log_${date}` (\r\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT \'id\',\r\n  `user_id` bigint(20) DEFAULT NULL COMMENT \'用户id\',\r\n  `user_name` varchar(30) DEFAULT NULL COMMENT \'用户名\',\r\n  `operation_` varchar(50) DEFAULT NULL COMMENT \'用户操作\',\r\n  `operation_type` tinyint(1) DEFAULT NULL COMMENT \'操作类型\',\r\n  `method_` varchar(200) DEFAULT NULL COMMENT \'请求方法\',\r\n  `params_` varchar(5000) DEFAULT NULL COMMENT \'请求参数\',\r\n  `result_` tinyint(1) DEFAULT NULL COMMENT \'操作结果\',\r\n  `time_` bigint(20) NOT NULL COMMENT \'执行时长(毫秒)\',\r\n  `ip_` varchar(64) DEFAULT NULL COMMENT \'IP地址\',\r\n  `source` tinyint(2) DEFAULT \'0\' COMMENT \'来源：1、pc;2、APP;3、WX;4、安卓；5、IOS\',\r\n  `remark_` varchar(500) DEFAULT NULL,\r\n  `enable_` tinyint(1) NOT NULL DEFAULT \'1\',\r\n  `is_del` tinyint(1) DEFAULT \'0\' COMMENT \'是否删除\',\r\n  `create_by` bigint(20) NOT NULL COMMENT \'创建者\',\r\n  `create_time` datetime NOT NULL COMMENT \'创建时间\',\r\n  `update_by` bigint(20) DEFAULT \'0\' COMMENT \'更新者\',\r\n  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'更新时间\',\r\n  PRIMARY KEY (`id`),\r\n  KEY `idx_user_id` (`user_id`) USING BTREE,\r\n  KEY `idx_username_operation` (`user_name`,`operation_`) USING BTREE\r\n) ENGINE=InnoDB AUTO_INCREMENT=183355 DEFAULT CHARSET=utf8 COMMENT=\'系统日志${date}\';', null, '系统操作日志建表SQL', '1', '0', '1', '2018-12-29 12:55:58', '1', '2018-12-29 16:01:35');
INSERT INTO `sys_param` VALUES ('125', 'IS_SINGLE_SIGN_ON_KEY', '1', null, '是否校验单点登录（1：是；2：否；）', '1', '0', '999999', '2019-01-11 05:37:40', '1', '2019-02-18 16:39:35');
INSERT INTO `sys_param` VALUES ('135', 'JPUSH_CONFIG_KEY', '{\"appKey\":\"19b59e17401fcfec1b25c1109fe\",\"masterSecret\":\"47f9f0ab1153411e7a53d930612e\"}', null, '极光推送配置参数', '1', '0', '1', '2019-02-24 15:27:22', '1', '2019-11-29 12:52:50');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '1', '1', '1', '0', null, '1', '2016-06-20 09:16:56', '1016151836104032273', '2019-03-28 17:32:04');
INSERT INTO `sys_role` VALUES ('2', '开发人员', '1', '1', '1', '0', '开发人员', '1', '2018-07-12 12:47:48', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role` VALUES ('3', '测试人员', '1', '1', '1', '0', null, '1', '2018-08-13 10:13:29', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role` VALUES ('4', '产品人员', '1', '1', '1', '0', null, '1', '2018-08-13 10:13:58', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role` VALUES ('5', '设计人员', '1', '1', '1', '0', null, '1', '2018-08-17 11:10:13', '1', '2018-08-17 11:10:13');
INSERT INTO `sys_role` VALUES ('6', '运维人员', '1', '1', '1', '0', null, '1', '2018-08-17 11:10:26', '1', '2018-08-17 11:10:26');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `permission_` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=947478195886290282 DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('947478195886276405', '3', '1', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276406', '3', '2', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276407', '3', '946748446155739137', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276408', '3', '18', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276409', '3', '19', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276410', '3', '21', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276411', '3', '3', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276412', '3', '946758013140967425', null, '1', '0', null, '1', '2018-11-30 10:27:39', '1', '2018-11-30 10:27:39');
INSERT INTO `sys_role_menu` VALUES ('947478195886276413', '3', '945570894350995458', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276414', '3', '945570988546674689', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276415', '3', '945571061959577601', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276416', '3', '4', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276417', '3', '946758083039043585', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276418', '3', '945571423827349506', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276419', '3', '945571487333306370', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276420', '3', '945571554194706434', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276421', '3', '5', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276422', '3', '946758190165762049', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276423', '3', '945569164808769538', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276424', '3', '945569292122673153', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276425', '3', '945569401908580354', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276426', '3', '7', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276427', '3', '8', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276428', '3', '946758541132537857', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276429', '3', '946651550468222977', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276430', '3', '946651788901822466', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276431', '3', '946651900851990530', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276432', '3', '9', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276433', '3', '22', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276434', '3', '946758603266957314', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276435', '3', '946758603266957349', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276436', '3', '946758603266957362', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276437', '3', '946758603266957315', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276438', '3', '946758603266957316', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276439', '3', '946758603266957322', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276440', '3', '946758603266957317', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276441', '3', '946758603266957318', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276442', '3', '946758603266957350', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276443', '3', '946758603266957351', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276444', '3', '946758603266957352', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276445', '3', '946758603266957323', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276446', '3', '946758603266957324', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276447', '3', '946758603266957326', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276448', '3', '946758603266957345', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276449', '3', '946758603266957346', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276450', '3', '946758603266957348', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276451', '3', '946758603266957347', null, '1', '0', null, '1', '2018-11-30 10:27:40', '1', '2018-11-30 10:27:40');
INSERT INTO `sys_role_menu` VALUES ('947478195886276452', '3', '946758603266957356', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276453', '3', '946758603266957357', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276454', '3', '946758603266957329', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276455', '3', '946758603266957342', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276456', '3', '946758603266957359', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276457', '3', '946758603266957360', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276458', '3', '946758603266957361', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276459', '3', '946758603266957382', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276460', '3', '946758603266957340', null, '1', '0', null, '1', '2018-11-30 10:27:41', '1', '2018-11-30 10:27:41');
INSERT INTO `sys_role_menu` VALUES ('947478195886276461', '4', '1', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276462', '4', '2', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276463', '4', '946748446155739137', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276464', '4', '18', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276465', '4', '19', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276466', '4', '21', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276467', '4', '3', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276468', '4', '946758013140967425', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276469', '4', '945570894350995458', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276470', '4', '945570988546674689', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276471', '4', '945571061959577601', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276472', '4', '4', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276473', '4', '946758083039043585', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276474', '4', '945571423827349506', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276475', '4', '945571487333306370', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276476', '4', '945571554194706434', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276477', '4', '5', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276478', '4', '946758190165762049', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276479', '4', '945569164808769538', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276480', '4', '945569292122673153', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276481', '4', '945569401908580354', null, '1', '0', null, '1', '2018-11-30 10:27:46', '1', '2018-11-30 10:27:46');
INSERT INTO `sys_role_menu` VALUES ('947478195886276482', '4', '7', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276483', '4', '8', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276484', '4', '946758541132537857', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276485', '4', '946651550468222977', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276486', '4', '946651788901822466', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276487', '4', '946651900851990530', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276488', '4', '9', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276489', '4', '22', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276490', '4', '946758603266957314', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276491', '4', '946758603266957349', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276492', '4', '946758603266957362', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276493', '4', '946758603266957315', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276494', '4', '946758603266957316', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276495', '4', '946758603266957322', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276496', '4', '946758603266957317', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276497', '4', '946758603266957318', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276498', '4', '946758603266957350', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276499', '4', '946758603266957351', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276500', '4', '946758603266957352', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276501', '4', '946758603266957323', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276502', '4', '946758603266957324', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276503', '4', '946758603266957326', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276504', '4', '946758603266957345', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276505', '4', '946758603266957346', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276506', '4', '946758603266957348', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276507', '4', '946758603266957347', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276508', '4', '946758603266957356', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276509', '4', '946758603266957357', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276510', '4', '946758603266957395', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276511', '4', '946758603266957397', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276512', '4', '946758603266957399', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276513', '4', '946758603266957396', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276514', '4', '946758603266957398', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276515', '4', '946758603266957400', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276516', '4', '946758603266957401', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276517', '4', '946758603266957402', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276518', '4', '946758603266957329', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276519', '4', '946758603266957342', null, '1', '0', null, '1', '2018-11-30 10:27:47', '1', '2018-11-30 10:27:47');
INSERT INTO `sys_role_menu` VALUES ('947478195886276520', '4', '946758603266957359', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276521', '4', '946758603266957360', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276522', '4', '946758603266957361', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276523', '4', '946758603266957377', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276524', '4', '946758603266957378', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276525', '4', '946758603266957386', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276526', '4', '946758603266957387', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276527', '4', '946758603266957388', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276528', '4', '946758603266957389', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276529', '4', '946758603266957390', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276530', '4', '946758603266957391', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276531', '4', '946758603266957382', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276532', '4', '946758603266957340', null, '1', '0', null, '1', '2018-11-30 10:27:48', '1', '2018-11-30 10:27:48');
INSERT INTO `sys_role_menu` VALUES ('947478195886276989', '2', '1', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276990', '2', '2', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276991', '2', '946748446155739137', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276992', '2', '3', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276993', '2', '946758013140967425', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276994', '2', '4', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276995', '2', '946758083039043585', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276996', '2', '5', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276997', '2', '946758190165762049', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276998', '2', '7', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886276999', '2', '946758603266957416', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277000', '2', '8', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277001', '2', '946758541132537857', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277002', '2', '9', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277003', '2', '946758603266957417', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277004', '2', '22', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277005', '2', '946758603266957314', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277006', '2', '946758603266957421', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277007', '2', '946758603266957349', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277008', '2', '946758603266957412', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277009', '2', '946758603266957362', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277010', '2', '946758603266957315', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277011', '2', '946758603266957316', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277012', '2', '946758603266957425', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277013', '2', '946758603266957322', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277014', '2', '946758603266957429', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277015', '2', '946758603266957317', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277016', '2', '946758603266957318', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277017', '2', '946758603266957431', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277018', '2', '946758603266957351', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277019', '2', '946758603266957438', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277020', '2', '946758603266957352', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277021', '2', '946758603266957440', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277022', '2', '946758603266957364', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277023', '2', '946758603266957442', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277024', '2', '946758603266957365', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277025', '2', '946758603266957446', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277026', '2', '946758603266957366', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277027', '2', '946758603266957448', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277028', '2', '946758603266957368', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277029', '2', '946758603266957450', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277030', '2', '946758603266957370', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277031', '2', '946758603266957452', null, '1', '0', null, '1', '2018-12-09 21:34:12', '1', '2018-12-09 21:34:12');
INSERT INTO `sys_role_menu` VALUES ('947478195886277032', '2', '946758603266957410', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277033', '2', '946758603266957455', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277034', '2', '946758603266957393', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277035', '2', '946758603266957453', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277036', '2', '946758603266957394', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277037', '2', '946758603266957457', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277038', '2', '946758603266957323', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277039', '2', '946758603266957324', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277040', '2', '946758603266957326', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277041', '2', '946758603266957345', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277042', '2', '946758603266957461', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277043', '2', '946758603266957346', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277044', '2', '946758603266957465', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277045', '2', '946758603266957348', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277046', '2', '946758603266957472', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277047', '2', '946758603266957347', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277048', '2', '946758603266957467', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277049', '2', '946758603266957356', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277050', '2', '946758603266957357', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277051', '2', '946758603266957476', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277052', '2', '946758603266957395', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277053', '2', '946758603266957397', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277054', '2', '946758603266957478', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277055', '2', '946758603266957399', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277056', '2', '946758603266957483', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277057', '2', '946758603266957396', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277058', '2', '946758603266957488', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277059', '2', '946758603266957398', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277060', '2', '946758603266957493', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277061', '2', '946758603266957400', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277062', '2', '946758603266957498', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277063', '2', '946758603266957401', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277064', '2', '946758603266957503', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277065', '2', '946758603266957402', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277066', '2', '946758603266957506', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277067', '2', '946758603266957403', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277068', '2', '946758603266957511', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277069', '2', '946758603266957405', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277070', '2', '946758603266957515', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277071', '2', '946758603266957408', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277072', '2', '946758603266957407', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277073', '2', '946758603266957329', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277074', '2', '946758603266957342', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277075', '2', '946758603266957517', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277076', '2', '946758603266957359', null, '1', '0', null, '1', '2018-12-09 21:34:13', '1', '2018-12-09 21:34:13');
INSERT INTO `sys_role_menu` VALUES ('947478195886277077', '2', '946758603266957360', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277078', '2', '946758603266957520', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277079', '2', '946758603266957361', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277080', '2', '946758603266957524', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277081', '2', '946758603266957409', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277082', '2', '946758603266957528', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277083', '2', '946758603266957363', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277084', '2', '946758603266957532', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277085', '2', '946758603266957367', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277086', '2', '946758603266957369', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277087', '2', '946758603266957375', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277088', '2', '946758603266957376', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277089', '2', '946758603266957379', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277090', '2', '946758603266957537', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277091', '2', '946758603266957380', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277092', '2', '946758603266957381', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277093', '2', '946758603266957411', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277094', '2', '946758603266957377', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277095', '2', '946758603266957378', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277096', '2', '946758603266957386', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277097', '2', '946758603266957387', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277098', '2', '946758603266957388', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277099', '2', '946758603266957389', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277100', '2', '946758603266957390', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277101', '2', '946758603266957391', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277102', '2', '946758603266957382', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277103', '2', '946758603266957340', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277104', '2', '946758603266957539', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277105', '2', '946758603266957384', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277106', '2', '946758603266957540', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277107', '2', '946758603266957385', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277108', '2', '946758603266957542', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277109', '2', '946758603266957383', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277110', '2', '946758603266957544', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277111', '2', '946758603266957392', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886277112', '2', '946758603266957546', null, '1', '0', null, '1', '2018-12-09 21:34:14', '1', '2018-12-09 21:34:14');
INSERT INTO `sys_role_menu` VALUES ('947478195886289998', '1', '1', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886289999', '1', '2', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290000', '1', '946748446155739137', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290001', '1', '18', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290002', '1', '19', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290003', '1', '21', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290004', '1', '946758603266957547', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290005', '1', '3', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290006', '1', '946758013140967425', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290007', '1', '945570894350995458', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290008', '1', '945570988546674689', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290009', '1', '945571061959577601', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290010', '1', '4', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290011', '1', '946758083039043585', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290012', '1', '945571423827349506', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290013', '1', '945571487333306370', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290014', '1', '945571554194706434', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290015', '1', '5', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290016', '1', '946758190165762049', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290017', '1', '945569164808769538', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290018', '1', '945569292122673153', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290019', '1', '945569401908580354', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290020', '1', '7', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290021', '1', '946758603266957416', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290022', '1', '946758603266957413', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290023', '1', '946758603266957414', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290024', '1', '946758603266957415', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290025', '1', '8', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290026', '1', '946758541132537857', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290027', '1', '946651550468222977', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290028', '1', '946651788901822466', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290029', '1', '946651900851990530', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290030', '1', '9', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:53', '1016151836104032273', '2019-03-28 17:32:53');
INSERT INTO `sys_role_menu` VALUES ('947478195886290031', '1', '946758603266957417', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290032', '1', '22', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290033', '1', '946758603266957314', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290034', '1', '946758603266957421', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290035', '1', '946758603266957418', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290036', '1', '946758603266957419', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290037', '1', '946758603266957420', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290038', '1', '946758603266957422', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290039', '1', '946758603266957423', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290040', '1', '946758603266957349', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290041', '1', '946758603266957559', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290042', '1', '946758603266957560', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290043', '1', '946758603266957412', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290044', '1', '946758603266957362', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290045', '1', '946758603266957315', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290046', '1', '946758603266957316', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290047', '1', '946758603266957576', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290048', '1', '946758603266957577', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290049', '1', '946758603266957425', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290050', '1', '946758603266957424', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290051', '1', '946758603266957426', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290052', '1', '946758603266957427', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290053', '1', '946758603266957428', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290054', '1', '946758603266957550', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290055', '1', '946758603266957322', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290056', '1', '946758603266957429', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290057', '1', '946758603266957430', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290058', '1', '946758603266957582', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290059', '1', '946758603266957587', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290060', '1', '946758603266957588', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290061', '1', '946758603266957583', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290062', '1', '946758603266957317', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290063', '1', '946758603266957318', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290064', '1', '946758603266957568', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290065', '1', '946758603266957431', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290066', '1', '946758603266957432', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290067', '1', '946758603266957433', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290068', '1', '946758603266957434', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290069', '1', '946758603266957435', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290070', '1', '946758603266957436', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290071', '1', '946758603266957437', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290072', '1', '946758603266957563', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290073', '1', '946758603266957351', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290074', '1', '946758603266957438', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290075', '1', '946758603266957439', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290076', '1', '946758603266957555', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:54', '1016151836104032273', '2019-03-28 17:32:54');
INSERT INTO `sys_role_menu` VALUES ('947478195886290077', '1', '946758603266957557', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290078', '1', '946758603266957352', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290079', '1', '946758603266957440', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290080', '1', '946758603266957441', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290081', '1', '946758603266957556', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290082', '1', '946758603266957558', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290083', '1', '946758603266957364', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290084', '1', '946758603266957442', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290085', '1', '946758603266957443', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290086', '1', '946758603266957444', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290087', '1', '946758603266957445', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290088', '1', '946758603266957365', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290089', '1', '946758603266957446', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290090', '1', '946758603266957447', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290091', '1', '946758603266957366', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290092', '1', '946758603266957448', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290093', '1', '946758603266957449', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290094', '1', '946758603266957368', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290095', '1', '946758603266957450', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290096', '1', '946758603266957451', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290097', '1', '946758603266957370', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290098', '1', '946758603266957452', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290099', '1', '946758603266957410', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290100', '1', '946758603266957455', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290101', '1', '946758603266957456', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290102', '1', '946758603266957393', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290103', '1', '946758603266957453', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290104', '1', '946758603266957460', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290105', '1', '946758603266957454', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290106', '1', '946758603266957394', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290107', '1', '946758603266957457', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290108', '1', '946758603266957458', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290109', '1', '946758603266957459', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290110', '1', '946758603266957548', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290111', '1', '946758603266957564', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290112', '1', '946758603266957551', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290113', '1', '946758603266957552', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290114', '1', '946758603266957572', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290115', '1', '946758603266957549', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290116', '1', '946758603266957553', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290117', '1', '946758603266957554', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290118', '1', '946758603266957561', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290119', '1', '946758603266957573', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290120', '1', '946758603266957574', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:55', '1016151836104032273', '2019-03-28 17:32:55');
INSERT INTO `sys_role_menu` VALUES ('947478195886290121', '1', '946758603266957575', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290122', '1', '946758603266957589', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290123', '1', '946758603266957590', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290124', '1', '946758603266957595', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290125', '1', '946758603266957591', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290126', '1', '946758603266957592', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290127', '1', '946758603266957593', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290128', '1', '946758603266957594', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290129', '1', '946758603266957596', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290130', '1', '946758603266957597', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290131', '1', '946758603266957598', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290132', '1', '946758603266957323', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290133', '1', '946758603266957324', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290134', '1', '946758603266957326', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290135', '1', '946758603266957345', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290136', '1', '946758603266957461', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290137', '1', '946758603266957462', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290138', '1', '946758603266957463', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290139', '1', '946758603266957464', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290140', '1', '946758603266957346', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290141', '1', '946758603266957465', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290142', '1', '946758603266957466', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290143', '1', '946758603266957348', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290144', '1', '946758603266957472', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290145', '1', '946758603266957473', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290146', '1', '946758603266957474', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290147', '1', '946758603266957475', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290148', '1', '946758603266957347', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290149', '1', '946758603266957467', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290150', '1', '946758603266957468', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290151', '1', '946758603266957471', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290152', '1', '946758603266957469', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290153', '1', '946758603266957356', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290154', '1', '946758603266957357', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290155', '1', '946758603266957476', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290156', '1', '946758603266957477', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290157', '1', '946758603266957395', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290158', '1', '946758603266957397', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290159', '1', '946758603266957478', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290160', '1', '946758603266957479', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290161', '1', '946758603266957480', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290162', '1', '946758603266957481', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290163', '1', '946758603266957482', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:56', '1016151836104032273', '2019-03-28 17:32:56');
INSERT INTO `sys_role_menu` VALUES ('947478195886290164', '1', '946758603266957566', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290165', '1', '946758603266957567', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290166', '1', '946758603266957399', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290167', '1', '946758603266957483', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290168', '1', '946758603266957484', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290169', '1', '946758603266957485', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290170', '1', '946758603266957486', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290171', '1', '946758603266957487', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290172', '1', '946758603266957396', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290173', '1', '946758603266957488', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290174', '1', '946758603266957489', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290175', '1', '946758603266957490', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290176', '1', '946758603266957491', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290177', '1', '946758603266957492', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290178', '1', '946758603266957398', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290179', '1', '946758603266957493', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290180', '1', '946758603266957494', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290181', '1', '946758603266957495', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290182', '1', '946758603266957496', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290183', '1', '946758603266957497', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290184', '1', '946758603266957400', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290185', '1', '946758603266957498', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290186', '1', '946758603266957499', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290187', '1', '946758603266957500', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290188', '1', '946758603266957501', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290189', '1', '946758603266957502', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290190', '1', '946758603266957401', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290191', '1', '946758603266957503', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290192', '1', '946758603266957504', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290193', '1', '946758603266957505', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290194', '1', '946758603266957402', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290195', '1', '946758603266957506', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290196', '1', '946758603266957507', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290197', '1', '946758603266957508', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290198', '1', '946758603266957509', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290199', '1', '946758603266957510', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290200', '1', '946758603266957403', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290201', '1', '946758603266957511', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290202', '1', '946758603266957512', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290203', '1', '946758603266957513', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290204', '1', '946758603266957514', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290205', '1', '946758603266957405', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290206', '1', '946758603266957569', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290207', '1', '946758603266957515', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290208', '1', '946758603266957406', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:57', '1016151836104032273', '2019-03-28 17:32:57');
INSERT INTO `sys_role_menu` VALUES ('947478195886290209', '1', '946758603266957570', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290210', '1', '946758603266957565', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290211', '1', '946758603266957516', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290212', '1', '946758603266957408', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290213', '1', '946758603266957571', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290214', '1', '946758603266957407', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290215', '1', '946758603266957562', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290216', '1', '946758603266957329', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290217', '1', '946758603266957342', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290218', '1', '946758603266957517', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290219', '1', '946758603266957518', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290220', '1', '946758603266957519', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290221', '1', '946758603266957359', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290222', '1', '946758603266957360', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290223', '1', '946758603266957520', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290224', '1', '946758603266957521', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290225', '1', '946758603266957522', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290226', '1', '946758603266957523', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290227', '1', '946758603266957361', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290228', '1', '946758603266957524', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290229', '1', '946758603266957525', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290230', '1', '946758603266957526', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290231', '1', '946758603266957527', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290232', '1', '946758603266957409', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290233', '1', '946758603266957528', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290234', '1', '946758603266957529', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290235', '1', '946758603266957530', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290236', '1', '946758603266957531', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290237', '1', '946758603266957363', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290238', '1', '946758603266957532', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290239', '1', '946758603266957533', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290240', '1', '946758603266957534', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290241', '1', '946758603266957535', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290242', '1', '946758603266957536', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290243', '1', '946758603266957367', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290244', '1', '946758603266957369', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290245', '1', '946758603266957375', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290246', '1', '946758603266957376', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290247', '1', '946758603266957379', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290248', '1', '946758603266957537', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290249', '1', '946758603266957538', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290250', '1', '946758603266957380', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290251', '1', '946758603266957381', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290252', '1', '946758603266957411', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290253', '1', '946758603266957377', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:58', '1016151836104032273', '2019-03-28 17:32:58');
INSERT INTO `sys_role_menu` VALUES ('947478195886290254', '1', '946758603266957378', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290255', '1', '946758603266957386', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290256', '1', '946758603266957387', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290257', '1', '946758603266957388', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290258', '1', '946758603266957389', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290259', '1', '946758603266957390', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290260', '1', '946758603266957391', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290261', '1', '946758603266957382', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290262', '1', '946758603266957340', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290263', '1', '946758603266957539', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290264', '1', '946758603266957384', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290265', '1', '946758603266957540', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290266', '1', '946758603266957541', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290267', '1', '946758603266957385', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290268', '1', '946758603266957542', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290269', '1', '946758603266957543', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290270', '1', '946758603266957383', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290271', '1', '946758603266957544', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290272', '1', '946758603266957545', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290273', '1', '946758603266957392', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290274', '1', '946758603266957546', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290275', '1', '946758603266957578', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290276', '1', '946758603266957579', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290277', '1', '946758603266957580', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290278', '1', '946758603266957581', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290279', '1', '946758603266957584', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290280', '1', '946758603266957585', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');
INSERT INTO `sys_role_menu` VALUES ('947478195886290281', '1', '946758603266957586', null, '1', '0', null, '1016151836104032273', '2019-03-28 17:32:59', '1016151836104032273', '2019-03-28 17:32:59');

-- ----------------------------
-- Table structure for sys_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `sys_slideshow`;
CREATE TABLE `sys_slideshow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL COMMENT '类型 1：轮播图 2：开屏广告',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '内容是否有效，0-已禁用，1-发布中，2-已下线',
  `url` varchar(255) NOT NULL COMMENT '点击图片后进入那个网址',
  `title` varchar(255) NOT NULL COMMENT '内容标题',
  `file_path` varchar(255) NOT NULL COMMENT '图片的路径',
  `client_type` tinyint(2) NOT NULL COMMENT '客户端:1、pc；2、wx;  3、mobile；',
  `create_time` datetime NOT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL COMMENT '活动消息开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '活动消息结束时间',
  `before_url` varchar(255) DEFAULT NULL COMMENT '活动消息开始前图片链接到的地址',
  PRIMARY KEY (`id`),
  KEY `idx_title` (`title`) USING BTREE,
  KEY `idx_client_status_type` (`client_type`,`status`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='轮播图表';

-- ----------------------------
-- Records of sys_slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms_log`;
CREATE TABLE `sys_sms_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '接收短信用户id',
  `bus_id` bigint(20) DEFAULT NULL,
  `phone` bigint(11) DEFAULT NULL COMMENT '手机号',
  `vcode` int(6) DEFAULT NULL COMMENT '验证码',
  `type` tinyint(2) NOT NULL COMMENT '类型：',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '短信内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_phone_type` (`phone`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4906 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='发送短信记录表';

-- ----------------------------
-- Records of sys_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account_` varchar(20) DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_type` varchar(2) DEFAULT '1' COMMENT '用户类型(1普通用户2管理员3系统用户)',
  `user_name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `name_pinyin` varchar(64) DEFAULT NULL COMMENT '姓名拼音',
  `sex_` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) DEFAULT NULL COMMENT '头像',
  `phone_` varchar(50) DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `wei_xin` varchar(32) DEFAULT NULL COMMENT '微信',
  `wei_bo` varchar(32) DEFAULT NULL COMMENT '微博',
  `qq_` varchar(32) DEFAULT NULL COMMENT 'QQ',
  `birth_day` date DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `enable_` tinyint(1) DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016151836104032295 DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'MDY0YTgzZDc4YjZmNjczNGEzNGY5ZGQ3OWRjMzM4YTU=', '3', '管理员', 'GUANLIYUAN', '0', 'http://118.190.43.148/group1/M00/00/00/dr4rlFjNBguAfJl7AAcOE67NTFk744.png', '13021974641', '', '', '', null, null, now(), '1', '', null, null, '0', '1', '', '2016-05-06 10:06:52', '1', '2019-01-25 10:54:06', '1');
INSERT INTO `sys_user` VALUES ('1016151836104032294', 'test', 'NDBiYzYwNWUzMjljYTIyNDY4NjAzOTcwOTY1ZmFkY2Q=', '1', '测试', null, '1', null, '13012341234', 'thl9090@163.com', null, null, null, null, '2019-11-29', '1', null, null, null, '0', '1', null, '2019-11-29 13:48:54', '1', '2019-11-29 13:48:54', null);

-- ----------------------------
-- Table structure for sys_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------
INSERT INTO `sys_user_menu` VALUES ('1', '1', '1', 'read', '1', '0', null, '0', '2017-08-28 16:24:01', '0', '2017-08-28 16:24:01');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `remark_` varchar(5000) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_role_id` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016151836292776024 DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1016151836292775995', '1', '1', '1', '0', null, '1', '2019-01-25 10:54:06', '1', '2019-01-25 10:54:06');
INSERT INTO `sys_user_role` VALUES ('1016151836292776023', '1016151836104032294', '2', '1', '0', null, '1', '2019-11-29 13:48:54', '1', '2019-11-29 13:48:54');

-- ----------------------------
-- Table structure for user_hand_pwd
-- ----------------------------
DROP TABLE IF EXISTS `user_hand_pwd`;
CREATE TABLE `user_hand_pwd` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '密码',
  `exkey` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT '加密密钥',
  `is_used` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用：0、否；1、是',
  `fail_count` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='用户手势密码表';

-- ----------------------------
-- Records of user_hand_pwd
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `phone` bigint(11) NOT NULL COMMENT '手机号码',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `exkey` varchar(255) NOT NULL COMMENT '加密秘钥',
  `user_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户类型:1、个人用户；2、企业用户',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `id_type` tinyint(2) DEFAULT '1' COMMENT '证件类型：1、身份证;2、组织机构代码证',
  `id_number` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `acno` varchar(32) DEFAULT NULL COMMENT '存管银行账号',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户状态:1、有效；0、无效',
  `account_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '存管账户状态：0、未开通；1、已开通；',
  `company_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `source` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户来源：1：PC;2：wx;3：ANDROID；4：IOS',
  `ref_phone` bigint(11) DEFAULT NULL COMMENT '推荐人手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `cust_no` varchar(64) DEFAULT NULL COMMENT '客户号码',
  `cust_type` tinyint(2) DEFAULT NULL COMMENT '客户类型（客户类型是争对的鄂托克银行存管类型）:1、个人出借用户；2、个人融资用户，3、企业融资用户，4、企业担保用户',
  `register_phone` bigint(11) DEFAULT NULL COMMENT '客户注册手机号',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `card_no` varchar(32) DEFAULT NULL COMMENT '绑定的银行卡号',
  `bank_mobile` bigint(11) DEFAULT NULL COMMENT '银行预留手机号',
  `is_new_user` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否新用户：0、老系统用户迁移过来的；1、新系统新注册的用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44321 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('44298', '15501075560', 'ee20f617e762260101648294ea86078082a4703f', '6bbcb7d444', '1', 'YX15501075560', null, '1', null, null, '1', '0', null, '1', null, null, '2019-03-26 10:29:25', null, '2019-03-26 10:29:25', null, null, null, null, null, null, null, '1');
INSERT INTO `user_info` VALUES ('44319', '19999999911', '174c770148d59bbddfc2f04be59baf509cd66bb9', 'ac064c0a94', '1', 'YX19999999911', null, '1', null, null, '1', '0', null, '1', null, null, '2019-04-10 15:08:03', '1016151836104032271', '2019-04-10 15:08:03', '1016151836104032271', null, null, null, null, null, null, '1');
INSERT INTO `user_info` VALUES ('44320', '13500000000', 'a07040f4c968aebdc48e43561071a2cc678c5e3c', '8a1032b2cc', '2', 'YX13500000000', null, '2', '', null, '1', '0', '阿迪咖啡阿斯顿发', '1', null, null, '2019-04-13 11:28:35', null, '2019-11-29 13:08:52', null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `channel_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '渠道类型：对应ChannelTypeEnum枚举类',
  `channel_version` varchar(128) NOT NULL DEFAULT '0' COMMENT '版本号',
  `ip` varchar(128) NOT NULL DEFAULT '0',
  `dervice_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_userid_channeltype` (`user_id`,`channel_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户登陆日志表';

-- ----------------------------
-- Records of user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_login_log_201904
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log_201904`;
CREATE TABLE `user_login_log_201904` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `channel_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '渠道类型：对应ChannelTypeEnum枚举类',
  `channel_version` varchar(128) NOT NULL DEFAULT '0' COMMENT '版本号',
  `ip` varchar(128) NOT NULL DEFAULT '0',
  `dervice_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `login_time` datetime NOT NULL COMMENT '登陆时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_userid_channeltype` (`user_id`,`channel_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=utf8 COMMENT='用户登陆日志表201904';

-- ----------------------------
-- Records of user_login_log_201904
-- ----------------------------

-- ----------------------------
-- Table structure for user_message_log
-- ----------------------------
DROP TABLE IF EXISTS `user_message_log`;
CREATE TABLE `user_message_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '用户',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `is_read` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已读：0，否；1，是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6866 DEFAULT CHARSET=utf8 COMMENT='消息日志表';

-- ----------------------------
-- Records of user_message_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_suggestion
-- ----------------------------
DROP TABLE IF EXISTS `user_suggestion`;
CREATE TABLE `user_suggestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `source` tinyint(2) DEFAULT NULL COMMENT '来源：1-PC；2-app 3-wx ;4-Android；5、ios',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '反馈内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='用户意见反馈列表';

-- ----------------------------
-- Records of user_suggestion
-- ----------------------------

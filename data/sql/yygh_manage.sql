/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 5.7.34-log : Database - yygh_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yygh_manage` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `yygh_manage`;

/*Table structure for table `hospital_set` */

DROP TABLE IF EXISTS `hospital_set`;

CREATE TABLE `hospital_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
  `sign_key` varchar(50) DEFAULT NULL COMMENT '签名秘钥',
  `api_url` varchar(100) DEFAULT NULL COMMENT '统一挂号平台api地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医院设置表';

/*Data for the table `hospital_set` */

insert  into `hospital_set`(`id`,`hoscode`,`sign_key`,`api_url`,`create_time`,`update_time`,`is_deleted`) values 
(1,'1000_0','eac53fae12dbe5d1404d42e9651ede05','http://localhost','2020-06-09 17:22:31','2020-07-16 15:11:25',0);

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `schedule_id` bigint(20) DEFAULT NULL COMMENT '排班id',
  `patient_id` bigint(20) DEFAULT NULL COMMENT '就诊人id',
  `number` int(11) DEFAULT NULL COMMENT '预约号序',
  `fetch_time` varchar(50) DEFAULT NULL COMMENT '建议取号时间',
  `fetch_address` varchar(255) DEFAULT NULL COMMENT '取号地点',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '医事服务费',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `quit_time` datetime DEFAULT NULL COMMENT '退号时间',
  `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `order_info` */

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '编号',
  `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
  `depcode` varchar(30) DEFAULT NULL COMMENT '科室编号',
  `title` varchar(20) DEFAULT NULL COMMENT '职称',
  `docname` varchar(20) DEFAULT NULL COMMENT '医生名称',
  `skill` text COMMENT '擅长技能',
  `work_date` date DEFAULT NULL COMMENT '安排日期',
  `work_time` tinyint(3) DEFAULT '0' COMMENT '安排时间（0：上午 1：下午）',
  `reserved_number` int(11) DEFAULT '0' COMMENT '可预约数',
  `available_number` int(11) DEFAULT '0' COMMENT '剩余预约数',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '挂号费',
  `status` tinyint(3) DEFAULT NULL COMMENT '排班状态（-1：停诊 0：停约 1：可约）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生日程安排表';

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`hoscode`,`depcode`,`title`,`docname`,`skill`,`work_date`,`work_time`,`reserved_number`,`available_number`,`amount`,`status`,`create_time`,`update_time`,`is_deleted`) values 
(1,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-22',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(2,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-22',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(3,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-22',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(4,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-23',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(5,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-23',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(6,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-23',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(7,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-24',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(8,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-24',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(9,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-24',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(10,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-25',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(11,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-25',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(12,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-25',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(13,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-26',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(14,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-26',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(15,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-26',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(16,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-27',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(17,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-27',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(18,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-27',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(19,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-28',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(20,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-28',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(21,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-28',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(22,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-29',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(23,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-29',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(24,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-29',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(25,'1000_0','200040878','医师','','内分泌科常见病。','2021-09-30',0,33,22,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(26,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-30',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(27,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-30',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(29,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-09-30',0,40,6,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(30,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-09-30',1,27,10,100,1,'2021-09-22 17:31:54','2021-09-22 17:31:54',0),
(31,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-01',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(32,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-01',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(33,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-01',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(34,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-02',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(35,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-02',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(36,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-02',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(37,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-03',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(38,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-03',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(39,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-03',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(40,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-04',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(41,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-04',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(42,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-04',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(43,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-05',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(44,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-05',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(45,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-05',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(46,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-06',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(47,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-06',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(48,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-06',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(49,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-07',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(50,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-07',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(51,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-07',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(52,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-08',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(53,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-08',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(54,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-08',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(55,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-09',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(56,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-09',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(57,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-09',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(58,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-10',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(59,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-10',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(60,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-10',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(61,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-11',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(62,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-11',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(63,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-11',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(64,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-12',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(65,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-12',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(66,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-12',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(67,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-13',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(68,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-13',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(69,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-13',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(70,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-14',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(71,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-14',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(72,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-14',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(73,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-15',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(74,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-15',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(75,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-15',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(76,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-16',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(77,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-16',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(78,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-16',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(79,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-17',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(80,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-17',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(81,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-17',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(82,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-18',0,33,22,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(83,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-18',0,40,6,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(84,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-18',1,27,10,100,1,'2021-09-22 17:31:55','2021-09-22 17:31:55',0),
(85,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-19',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(86,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-19',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(87,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-19',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(88,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-20',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(89,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-20',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(90,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-20',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(91,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-21',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(92,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-21',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(93,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-21',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(94,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-22',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(95,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-22',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(96,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-22',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(97,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-23',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(98,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-23',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(99,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-23',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(100,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-24',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(101,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-24',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(102,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-24',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(103,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-25',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(104,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-25',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(105,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-25',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(106,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-26',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(107,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-26',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(108,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-26',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(109,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-27',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(110,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-27',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(111,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-27',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(112,'1000_0','200040878','医师','','内分泌科常见病。','2021-10-28',0,33,22,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(113,'1000_0','200040878','副主任医师','裴育','骨质疏松和骨代谢疾病、糖尿病、甲状腺疾病。','2021-10-28',0,40,6,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0),
(114,'1000_0','200040878','副主任医师','邵迎红','内分泌与代谢性疾病。','2021-10-28',1,27,10,100,1,'2021-09-22 17:31:56','2021-09-22 17:31:56',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

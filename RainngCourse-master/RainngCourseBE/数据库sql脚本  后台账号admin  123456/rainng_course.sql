/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.5.40 : Database - rainng_course
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rainng_course` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rainng_course`;

/*Table structure for table `rc_admin` */

DROP TABLE IF EXISTS `rc_admin`;

CREATE TABLE `rc_admin` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT ,
  `admin_username` varchar(255) NOT NULL ,
  `admin_password` char(32) NOT NULL ,
  `admin_privilege` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `idx_admin_username` (`admin_username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `rc_admin` */

insert  into `rc_admin`(`admin_id`,`admin_username`,`admin_password`,`admin_privilege`) values 
(1,'admin','81a5f5a9bfde4cdcb5b9fe1f8508df2a',255),
(2,'azure99','81a5f5a9bfde4cdcb5b9fe1f8508df2a',96);

/*Table structure for table `rc_class` */

DROP TABLE IF EXISTS `rc_class`;

CREATE TABLE `rc_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_major_id` int(10) unsigned NOT NULL ,
  `class_grade` int(10) unsigned NOT NULL,
  `class_name` varchar(32) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk_major_id` (`class_major_id`) USING BTREE,
  KEY `idx_class_name` (`class_name`) USING BTREE,
  CONSTRAINT `rc_class_ibfk_1` FOREIGN KEY (`class_major_id`) REFERENCES `rc_major` (`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `rc_class` */

insert  into `rc_class`(`class_id`,`class_major_id`,`class_grade`,`class_name`) values 
(1,1,2017,'计信1班'),
(2,1,2019,'计信1班'),
(3,4,2017,'数学1班'),
(4,5,2017,'测试班级1'),
(5,5,2017,'测试班级2'),
(6,5,2017,'测试班级3'),
(7,5,2017,'测试班级4'),
(8,5,2017,'测试班级5'),
(9,5,2017,'测试班级6'),
(10,5,2017,'测试班级7'),
(11,5,2017,'测试班级8'),
(12,5,2017,'测试班级9'),
(13,5,2017,'测试班级10'),
(14,5,2019,'演示班级1'),
(15,5,2019,'演示班级2'),
(16,5,2019,'演示班级3'),
(17,5,2019,'演示班级4'),
(18,5,2019,'演示班级5'),
(19,5,2019,'演示班级6'),
(20,5,2019,'演示班级7'),
(21,5,2019,'演示班级8'),
(22,5,2019,'演示班级9'),
(23,5,2019,'演示班级10');

/*Table structure for table `rc_course` */

DROP TABLE IF EXISTS `rc_course`;

CREATE TABLE `rc_course` (
  `course_id` int(10) unsigned NOT NULL AUTO_INCREMENT ,
  `course_teacher_id` int(10) unsigned NOT NULL ,
  `course_name` varchar(64) NOT NULL ,
  `course_grade` int(10) unsigned NOT NULL ,
  `course_time` varchar(16) NOT NULL,
  `course_location` varchar(32) NOT NULL ,
  `course_credit` int(10) unsigned NOT NULL ,
  `course_selected_count` int(10) unsigned NOT NULL DEFAULT '0',
  `course_max_size` int(10) unsigned NOT NULL,
  `course_exam_date` datetime DEFAULT NULL ,
  `course_exam_location` varchar(32) DEFAULT NULL ,
  PRIMARY KEY (`course_id`),
  KEY `fk_course_teacher_id` (`course_teacher_id`) USING BTREE,
  KEY `idx_course_name` (`course_name`) USING BTREE,
  CONSTRAINT `rc_course_ibfk_1` FOREIGN KEY (`course_teacher_id`) REFERENCES `rc_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `rc_course` */

insert  into `rc_course`(`course_id`,`course_teacher_id`,`course_name`,`course_grade`,`course_time`,`course_location`,`course_credit`,`course_selected_count`,`course_max_size`,`course_exam_date`,`course_exam_location`) values 
(1,1,'C语言程序设计',2017,'1-1-2','信工楼107',5,17,50,NULL,NULL),
(2,1,'Java程序设计',2019,'1-3-2','信工楼106',4,0,30,NULL,NULL),
(3,1,'数据库实用技术',2017,'2-3-2','C区202',2,1,50,NULL,NULL),
(4,1,'ASP.Net开发',2017,'5-5-3','E区315',2,1,1,NULL,NULL),
(5,1,'Spring企业级开发',2017,'3-9-2','信工楼101',3,1,10,NULL,NULL),
(6,3,'数据库概论',2017,'3-1-2','C区106',5,1,40,NULL,NULL),
(7,3,'Photoshop',2017,'2-3-2','C区222',2,0,20,NULL,NULL),
(8,4,'计算机网络',2017,'4-1-3','信工楼109',5,0,20,NULL,NULL);

/*Table structure for table `rc_department` */

DROP TABLE IF EXISTS `rc_department`;

CREATE TABLE `rc_department` (
  `department_id` int(10) unsigned NOT NULL AUTO_INCREMENT ,
  `department_name` varchar(32) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `rc_department` */

insert  into `rc_department`(`department_id`,`department_name`) values 
(1,'计算机系'),
(2,'数学系'),
(3,'物理系'),
(4,'化学系'),
(5,'测试系1'),
(6,'测试系2'),
(7,'测试系3'),
(8,'测试系4'),
(9,'测试系5'),
(10,'测试系6'),
(11,'测试系7'),
(12,'测试系8'),
(13,'测试系9'),
(14,'测试系10'),
(15,'临时系1'),
(16,'临时系2'),
(17,'临时系3'),
(18,'临时系4'),
(19,'临时系5'),
(20,'临时系6'),
(21,'临时系7'),
(22,'临时系8'),
(23,'临时系9'),
(24,'临时系10'),
(25,'演示系1'),
(26,'演示系2'),
(27,'演示系3'),
(28,'演示系4'),
(29,'演示系5'),
(30,'演示系6'),
(31,'演示系7'),
(32,'演示系8'),
(33,'演示系9'),
(34,'演示系10'),
(35,'演示系11'),
(36,'演示系12'),
(37,'演示系13'),
(38,'演示系14'),
(39,'演示系15'),
(40,'演示系16'),
(41,'演示系17'),
(42,'演示系18'),
(43,'演示系19'),
(44,'演示系20');

/*Table structure for table `rc_major` */

DROP TABLE IF EXISTS `rc_major`;

CREATE TABLE `rc_major` (
  `major_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `major_department_id` int(10) unsigned NOT NULL ,
  `major_name` varchar(32) NOT NULL ,
  PRIMARY KEY (`major_id`),
  KEY `fk_major_department_id` (`major_department_id`) USING BTREE,
  KEY `idx_major_name` (`major_name`) USING BTREE,
  CONSTRAINT `rc_major_ibfk_1` FOREIGN KEY (`major_department_id`) REFERENCES `rc_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `rc_major` */

insert  into `rc_major`(`major_id`,`major_department_id`,`major_name`) values 
(1,1,'计算机科学与技术'),
(2,1,'软件工程'),
(3,1,'信息工程'),
(4,2,'应用数学'),
(5,2,'数学师范'),
(6,5,'测试专业1'),
(7,5,'测试专业2'),
(8,5,'测试专业3'),
(9,5,'测试专业4'),
(10,5,'测试专业5'),
(11,5,'测试专业6'),
(12,5,'测试专业7'),
(13,5,'测试专业8'),
(14,5,'测试专业9'),
(15,5,'测试专业10'),
(16,6,'临时专业1'),
(17,6,'临时专业2'),
(18,6,'临时专业3'),
(19,6,'临时专业4'),
(20,6,'临时专业5'),
(21,6,'临时专业6'),
(22,6,'临时专业7'),
(23,6,'临时专业8'),
(24,6,'临时专业9'),
(25,6,'临时专业10'),
(26,7,'演示专业1'),
(27,7,'演示专业2'),
(28,7,'演示专业3'),
(29,7,'演示专业4'),
(30,7,'演示专业5'),
(31,7,'演示专业6'),
(32,7,'演示专业7'),
(33,7,'演示专业8'),
(34,7,'演示专业9'),
(35,7,'演示专业10'),
(36,7,'演示专业11'),
(37,7,'演示专业12'),
(38,7,'演示专业13'),
(39,7,'演示专业14'),
(40,7,'演示专业15'),
(41,7,'演示专业16'),
(42,7,'演示专业17'),
(43,7,'演示专业18'),
(44,7,'演示专业19'),
(45,7,'演示专业20'),
(46,1,'计算机技术与科学');

/*Table structure for table `rc_student` */

DROP TABLE IF EXISTS `rc_student`;

CREATE TABLE `rc_student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT ,
  `student_class_id` int(10) unsigned NOT NULL ,
  `student_number` char(12) NOT NULL,
  `student_name` varchar(20) NOT NULL ,
  `student_password` char(32) NOT NULL,
  `student_email` varchar(64) DEFAULT NULL ,
  `student_birthday` datetime DEFAULT NULL ,
  `student_sex` tinyint(3) unsigned NOT NULL ,
  `student_last_login_time` datetime DEFAULT NULL ,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `idx_student_number` (`student_number`) USING BTREE,
  KEY `fk_student_class_id` (`student_class_id`) USING BTREE,
  KEY `idx_student_name` (`student_name`) USING BTREE,
  CONSTRAINT `rc_student_ibfk_1` FOREIGN KEY (`student_class_id`) REFERENCES `rc_class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `rc_student` */

insert  into `rc_student`(`student_id`,`student_class_id`,`student_number`,`student_name`,`student_password`,`student_email`,`student_birthday`,`student_sex`,`student_last_login_time`) values 
(1,1,'811010001','小李','81a5f5a9bfde4cdcb5b9fe1f8508df2a','715035273@qq.com','1998-08-19 00:00:00',0,'2020-06-10 18:15:11'),
(2,1,'811010002','小宋','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(3,1,'811010003','李同学1','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(4,1,'811010004','李同学2','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(5,1,'811010005','李同学3','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(6,1,'811010006','李同学4','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(7,1,'811010007','李同学5','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(8,1,'811010008','李同学6','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(9,1,'811010009','李同学7','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(10,1,'811010010','李同学8','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(11,1,'811010011','李同学9','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,0,NULL),
(12,1,'811010012','张同学1','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(13,1,'811010013','张同学2','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(14,1,'811010014','张同学3','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(15,1,'811010015','张同学4','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(16,1,'811010016','张同学5','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(17,1,'811010017','张同学6','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(18,1,'811010018','张同学7','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(19,3,'811020001','王同学1','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(20,3,'811020002','王同学2','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(21,3,'811020003','王同学3','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(22,3,'811020004','王同学4','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(23,3,'811020005','王同学5','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(24,3,'811020006','王同学6','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(25,3,'811020007','王同学7','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(26,3,'811020008','王同学8','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(27,3,'811020009','王同学9','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL),
(28,3,'811020010','王同学10','81a5f5a9bfde4cdcb5b9fe1f8508df2a',NULL,NULL,1,NULL);

/*Table structure for table `rc_student_course` */

DROP TABLE IF EXISTS `rc_student_course`;

CREATE TABLE `rc_student_course` (
  `sc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sc_student_id` int(10) unsigned NOT NULL ,
  `sc_course_id` int(10) unsigned NOT NULL,
  `sc_daily_score` int(10) unsigned DEFAULT NULL,
  `sc_exam_score` int(10) unsigned DEFAULT NULL,
  `sc_score` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `fk_sc_course_id` (`sc_course_id`) USING BTREE,
  KEY `fk_sc_student_id` (`sc_student_id`) USING BTREE,
  CONSTRAINT `rc_student_course_ibfk_1` FOREIGN KEY (`sc_course_id`) REFERENCES `rc_course` (`course_id`),
  CONSTRAINT `rc_student_course_ibfk_2` FOREIGN KEY (`sc_student_id`) REFERENCES `rc_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `rc_student_course` */

insert  into `rc_student_course`(`sc_id`,`sc_student_id`,`sc_course_id`,`sc_daily_score`,`sc_exam_score`,`sc_score`) values 
(2,2,1,NULL,NULL,NULL),
(3,3,1,NULL,NULL,NULL),
(4,4,1,NULL,NULL,NULL),
(5,5,1,NULL,NULL,NULL),
(6,6,1,NULL,NULL,NULL),
(7,7,1,NULL,NULL,NULL),
(8,8,1,NULL,NULL,NULL),
(9,9,1,NULL,NULL,NULL),
(10,10,1,NULL,NULL,NULL),
(11,11,1,NULL,NULL,NULL),
(12,12,1,NULL,NULL,NULL),
(13,13,1,NULL,NULL,NULL),
(14,14,1,NULL,NULL,NULL),
(15,15,1,NULL,NULL,NULL),
(16,16,1,NULL,NULL,NULL),
(17,17,1,NULL,NULL,NULL),
(18,18,1,NULL,NULL,NULL),
(19,1,3,98,100,99),
(20,1,4,NULL,NULL,NULL),
(21,1,6,NULL,NULL,NULL),
(22,1,5,NULL,NULL,NULL);

/*Table structure for table `rc_teacher` */

DROP TABLE IF EXISTS `rc_teacher`;

CREATE TABLE `rc_teacher` (
  `teacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_department_id` int(10) unsigned NOT NULL,
  `teacher_number` char(12) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_password` char(32) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `idx_teacher_number` (`teacher_number`) USING BTREE,
  KEY `fk_teacher_department_id` (`teacher_department_id`) USING BTREE,
  CONSTRAINT `rc_teacher_ibfk_1` FOREIGN KEY (`teacher_department_id`) REFERENCES `rc_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `rc_teacher` */

insert  into `rc_teacher`(`teacher_id`,`teacher_department_id`,`teacher_number`,`teacher_name`,`teacher_password`) values 
(1,1,'11010001','张三','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(2,3,'11020001','宋老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(3,1,'11010002','宋老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(4,1,'11010003','张老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(5,1,'11010004','吕老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(6,1,'11010005','王老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(7,1,'11010006','丁老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(8,1,'11010007','高老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a'),
(9,1,'11010008','赵老师','81a5f5a9bfde4cdcb5b9fe1f8508df2a');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

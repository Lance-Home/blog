/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.31 : Database - blog_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `blog_db`;

/*Table structure for table `flyway_schema_history` */

DROP TABLE IF EXISTS `flyway_schema_history`;

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  KEY `flyway_schema_history_s_idx` (`success`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `flyway_schema_history` */

insert  into `flyway_schema_history`(`installed_rank`,`version`,`description`,`type`,`script`,`checksum`,`installed_by`,`installed_on`,`execution_time`,`success`) values
(1,'1','<< Flyway Baseline >>','BASELINE','<< Flyway Baseline >>',NULL,'root','2020-08-11 09:03:16',0,1),
(2,'3.2','update','SQL','V3.2__update.sql',-53734780,'root','2020-08-11 09:03:16',42,1);

/*Table structure for table `mto_channel` */

DROP TABLE IF EXISTS `mto_channel`;

CREATE TABLE `mto_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_channel` */

insert  into `mto_channel`(`id`,`key_`,`name`,`status`,`thumbnail`,`weight`) values
(1,'banner','banner',1,'',3),
(2,'blog','博客',0,'',2),
(3,'jotting','随笔',0,'',1),
(4,'share','分享',0,'',0);

/*Table structure for table `mto_comment` */

DROP TABLE IF EXISTS `mto_comment`;

CREATE TABLE `mto_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `pid` bigint(20) NOT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IK_POST_ID` (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_comment` */

/*Table structure for table `mto_favorite` */

DROP TABLE IF EXISTS `mto_favorite`;

CREATE TABLE `mto_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IK_USER_ID` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_favorite` */

/*Table structure for table `mto_links` */

DROP TABLE IF EXISTS `mto_links`;

CREATE TABLE `mto_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_links` */

/*Table structure for table `mto_message` */

DROP TABLE IF EXISTS `mto_message`;

CREATE TABLE `mto_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `event` int(11) NOT NULL,
  `from_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_message` */

/*Table structure for table `mto_options` */

DROP TABLE IF EXISTS `mto_options`;

CREATE TABLE `mto_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_` varchar(32) DEFAULT NULL,
  `type` int(5) DEFAULT '0',
  `value` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_options` */

insert  into `mto_options`(`id`,`key_`,`type`,`value`) values
(1,'site_name',0,'如风'),
(2,'site_domain',0,'http://mtons.com'),
(3,'site_keywords',0,'mtons,博客,社区'),
(4,'site_description',0,'Mtons, 做一个有内涵的技术社区'),
(5,'site_metas',0,''),
(6,'site_copyright',0,'Copyright © Mtons'),
(7,'site_icp',0,''),
(8,'qq_callback',0,''),
(9,'qq_app_id',0,''),
(10,'qq_app_key',0,''),
(11,'weibo_callback',0,''),
(12,'weibo_client_id',0,''),
(13,'weibo_client_sercret',0,''),
(14,'github_callback',0,''),
(15,'github_client_id',0,''),
(16,'github_secret_key',0,''),
(17,'theme',0,'classic'),
(18,'mail_smtp_host',0,'smtp.163.com'),
(19,'mail_smtp_password',0,'xueyongxin@.'),
(20,'mail_smtp_username',0,'yongxin_xue@163.com'),
(21,'site_logo',0,'/dist/images/logo/logo.png'),
(22,'editor',0,'markdown'),
(23,'site_favicon',0,'/dist/images/logo/m.png'),
(24,'upyun_oss_password',0,''),
(25,'upyun_oss_src',0,''),
(26,'qiniu_oss_src',0,''),
(27,'aliyun_oss_endpoint',0,'oss-cn-shanghai.aliyuncs.com'),
(28,'storage_scheme',0,'aliyun'),
(29,'qiniu_oss_domain',0,''),
(30,'qiniu_oss_key',0,''),
(31,'upyun_oss_operator',0,''),
(32,'upyun_oss_domain',0,''),
(33,'aliyun_oss_bucket',0,'lance-blogs'),
(34,'qiniu_oss_bucket',0,''),
(35,'aliyun_oss_src',0,'blog/'),
(36,'upyun_oss_bucket',0,''),
(37,'aliyun_oss_key',0,'LTAI4GJxvnHS1VJ5JSZDzWPB'),
(38,'aliyun_oss_secret',0,'7m3z4RgGHdkdnzOPGBPNJhJpGcAubc'),
(39,'qiniu_oss_secret',0,'');

/*Table structure for table `mto_post` */

DROP TABLE IF EXISTS `mto_post`;

CREATE TABLE `mto_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `favors` int(11) NOT NULL,
  `featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(140) DEFAULT NULL,
  `tags` varchar(64) DEFAULT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IK_CHANNEL_ID` (`channel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_post` */

/*Table structure for table `mto_post_attribute` */

DROP TABLE IF EXISTS `mto_post_attribute`;

CREATE TABLE `mto_post_attribute` (
  `id` bigint(20) NOT NULL,
  `content` longtext,
  `editor` varchar(16) DEFAULT 'tinymce',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_post_attribute` */

/*Table structure for table `mto_post_resource` */

DROP TABLE IF EXISTS `mto_post_resource`;

CREATE TABLE `mto_post_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IK_POST_ID` (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_post_resource` */

/*Table structure for table `mto_post_tag` */

DROP TABLE IF EXISTS `mto_post_tag`;

CREATE TABLE `mto_post_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  `weight` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IK_TAG_ID` (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_post_tag` */

/*Table structure for table `mto_resource` */

DROP TABLE IF EXISTS `mto_resource`;

CREATE TABLE `mto_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` bigint(20) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `md5` varchar(100) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_MD5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_resource` */

insert  into `mto_resource`(`id`,`amount`,`create_time`,`md5`,`path`,`update_time`) values
(1,0,NULL,'B8TRHC67COJ06IV7LSC202SLK','/storage/thumbnails/_signature/B8TRHC67COJ06IV7LSC202SLK.jpg','2020-08-11 09:28:32'),
(2,0,NULL,'1ADACF05JJ9Q6TAC5FOV1UCNJO','//lance-blogs.oss-cn-shanghai.aliyuncs.com/blog/d595670fe98cb1722acf50383c19a188.png','2020-08-15 18:37:25'),
(3,0,NULL,'1DPSU1ST4MEML28EDOQCN88BJI','//lance-blogs.oss-cn-shanghai.aliyuncs.com/blog/d230c3e18b698a55dbc6472cd17bd18e.jpg','2020-08-15 18:41:13');

/*Table structure for table `mto_security_code` */

DROP TABLE IF EXISTS `mto_security_code`;

CREATE TABLE `mto_security_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `created` datetime NOT NULL,
  `expired` datetime NOT NULL,
  `key_` varchar(64) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `target` varchar(64) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_shxjkbkgnpxa80pnv4ts57o19` (`key_`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_security_code` */

insert  into `mto_security_code`(`id`,`code`,`created`,`expired`,`key_`,`status`,`target`,`type`) values
(1,'167806','2020-08-11 10:12:30','2020-08-11 10:42:30','1',0,'yongxin_xue@163.com',1),
(2,'448294','2020-08-11 09:58:04','2020-08-11 10:28:04','yongxin_xue@163.com',0,'yongxin_xue@163.com',3),
(3,'482379','2020-08-11 09:58:27','2020-08-11 10:28:27','it-555@qq.com',0,'it-555@qq.com',3);

/*Table structure for table `mto_tag` */

DROP TABLE IF EXISTS `mto_tag`;

CREATE TABLE `mto_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `latest_post_id` bigint(20) NOT NULL,
  `name` varchar(32) NOT NULL,
  `posts` int(11) NOT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_9ki38gg59bw5agwxsc4xtednf` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_tag` */

/*Table structure for table `mto_user` */

DROP TABLE IF EXISTS `mto_user`;

CREATE TABLE `mto_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT '/dist/images/ava/default.png',
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` int(5) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `gender` int(5) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `comments` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `signature` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_USERNAME` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_user` */

insert  into `mto_user`(`id`,`username`,`name`,`avatar`,`email`,`password`,`status`,`created`,`updated`,`last_login`,`gender`,`role_id`,`comments`,`posts`,`signature`) values
(1,'admin','信哥','//lance-blogs.oss-cn-shanghai.aliyuncs.com/blog/4695c93ffb08ffe49656c3f43dedd55d.jpg','xueyongxin.co@gmail.com','1D0C2Q3EHU053N8TUFV3MVQH03',0,'2020-08-06 17:52:41','2017-07-26 11:08:36','2020-08-15 18:51:38',0,1,0,0,''),
(2,'lance','lance','/storage/avatars/000/000/002_240.jpg',NULL,'1LEF3EVAIOFJ5IBN16VK6Q9CSP',1,'2020-08-11 09:05:06',NULL,'2020-08-11 09:17:01',0,NULL,0,0,NULL);

/*Table structure for table `mto_user_oauth` */

DROP TABLE IF EXISTS `mto_user_oauth`;

CREATE TABLE `mto_user_oauth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `access_token` varchar(128) DEFAULT NULL,
  `expire_in` varchar(128) DEFAULT NULL,
  `oauth_code` varchar(128) DEFAULT NULL,
  `oauth_type` int(11) DEFAULT NULL,
  `oauth_user_id` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `mto_user_oauth` */

/*Table structure for table `shiro_permission` */

DROP TABLE IF EXISTS `shiro_permission`;

CREATE TABLE `shiro_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_NAME` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `shiro_permission` */

insert  into `shiro_permission`(`id`,`description`,`name`,`parent_id`,`version`,`weight`) values
(1,'进入后台','admin',0,0,0),
(2,'栏目管理','channel:list',0,0,0),
(3,'编辑栏目','channel:update',2,0,0),
(4,'删除栏目','channel:delete',2,0,0),
(5,'文章管理','post:list',0,0,0),
(6,'编辑文章','post:update',5,0,0),
(7,'删除文章','post:delete',5,0,0),
(8,'评论管理','comment:list',0,0,0),
(9,'删除评论','comment:delete',8,0,0),
(10,'用户管理','user:list',0,0,0),
(11,'用户授权','user:role',10,0,0),
(12,'修改密码','user:pwd',10,0,0),
(13,'激活用户','user:open',10,0,0),
(14,'关闭用户','user:close',10,0,0),
(15,'角色管理','role:list',0,0,0),
(16,'修改角色','role:update',15,0,0),
(17,'删除角色','role:delete',15,0,0),
(18,'主题管理','theme:index',0,0,0),
(19,'系统配置','options:index',0,0,0),
(20,'修改配置','options:update',19,0,0);

/*Table structure for table `shiro_role` */

DROP TABLE IF EXISTS `shiro_role`;

CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(140) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `shiro_role` */

insert  into `shiro_role`(`id`,`description`,`name`,`status`) values
(1,NULL,'admin',0),
(2,NULL,'lance',0);

/*Table structure for table `shiro_role_permission` */

DROP TABLE IF EXISTS `shiro_role_permission`;

CREATE TABLE `shiro_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `shiro_role_permission` */

insert  into `shiro_role_permission`(`id`,`permission_id`,`role_id`) values
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,1),
(7,7,1),
(8,8,1),
(9,9,1),
(10,10,1),
(11,11,1),
(12,12,1),
(13,13,1),
(14,14,1),
(15,15,1),
(16,16,1),
(17,17,1),
(18,18,1),
(19,19,1),
(20,20,1);

/*Table structure for table `shiro_user_role` */

DROP TABLE IF EXISTS `shiro_user_role`;

CREATE TABLE `shiro_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `shiro_user_role` */

insert  into `shiro_user_role`(`id`,`role_id`,`user_id`) values
(1,1,1),
(2,2,2),
(3,1,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

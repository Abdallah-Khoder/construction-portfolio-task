/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-11.8.9-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: constructify_db
-- ------------------------------------------------------
-- Server version	11.8.9-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Current Database: `constructify_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `constructify_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `constructify_db`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',3,'add_permission'),
(6,'Can change permission',3,'change_permission'),
(7,'Can delete permission',3,'delete_permission'),
(8,'Can view permission',3,'view_permission'),
(9,'Can add group',2,'add_group'),
(10,'Can change group',2,'change_group'),
(11,'Can delete group',2,'delete_group'),
(12,'Can view group',2,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add nav item',11,'add_navitem'),
(26,'Can change nav item',11,'change_navitem'),
(27,'Can delete nav item',11,'delete_navitem'),
(28,'Can view nav item',11,'view_navitem'),
(29,'Can add projects section',14,'add_projectssection'),
(30,'Can change projects section',14,'change_projectssection'),
(31,'Can delete projects section',14,'delete_projectssection'),
(32,'Can view projects section',14,'view_projectssection'),
(33,'Can add site settings',17,'add_sitesettings'),
(34,'Can change site settings',17,'change_sitesettings'),
(35,'Can delete site settings',17,'delete_sitesettings'),
(36,'Can view site settings',17,'view_sitesettings'),
(37,'Can add about feature',7,'add_aboutfeature'),
(38,'Can change about feature',7,'change_aboutfeature'),
(39,'Can delete about feature',7,'delete_aboutfeature'),
(40,'Can view about feature',7,'view_aboutfeature'),
(41,'Can add about section',8,'add_aboutsection'),
(42,'Can change about section',8,'change_aboutsection'),
(43,'Can delete about section',8,'delete_aboutsection'),
(44,'Can view about section',8,'view_aboutsection'),
(45,'Can add hero section',10,'add_herosection'),
(46,'Can change hero section',10,'change_herosection'),
(47,'Can delete hero section',10,'delete_herosection'),
(48,'Can view hero section',10,'view_herosection'),
(49,'Can add hero counter',9,'add_herocounter'),
(50,'Can change hero counter',9,'change_herocounter'),
(51,'Can delete hero counter',9,'delete_herocounter'),
(52,'Can view hero counter',9,'view_herocounter'),
(53,'Can add project category',13,'add_projectcategory'),
(54,'Can change project category',13,'change_projectcategory'),
(55,'Can delete project category',13,'delete_projectcategory'),
(56,'Can view project category',13,'view_projectcategory'),
(57,'Can add project',12,'add_project'),
(58,'Can change project',12,'change_project'),
(59,'Can delete project',12,'delete_project'),
(60,'Can view project',12,'view_project'),
(61,'Can add service',15,'add_service'),
(62,'Can change service',15,'change_service'),
(63,'Can delete service',15,'delete_service'),
(64,'Can view service',15,'view_service'),
(65,'Can add services section',16,'add_servicessection'),
(66,'Can change services section',16,'change_servicessection'),
(67,'Can delete services section',16,'delete_servicessection'),
(68,'Can view services section',16,'view_servicessection'),
(69,'Can add track record stat',19,'add_trackrecordstat'),
(70,'Can change track record stat',19,'change_trackrecordstat'),
(71,'Can delete track record stat',19,'delete_trackrecordstat'),
(72,'Can view track record stat',19,'view_trackrecordstat'),
(73,'Can add track record section',18,'add_trackrecordsection'),
(74,'Can change track record section',18,'change_trackrecordsection'),
(75,'Can delete track record section',18,'delete_trackrecordsection'),
(76,'Can view track record section',18,'view_trackrecordsection'),
(77,'Can add Token',20,'add_token'),
(78,'Can change Token',20,'change_token'),
(79,'Can delete Token',20,'delete_token'),
(80,'Can view Token',20,'view_token'),
(81,'Can add Token',21,'add_tokenproxy'),
(82,'Can change Token',21,'change_tokenproxy'),
(83,'Can delete Token',21,'delete_tokenproxy'),
(84,'Can view Token',21,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES
(1,'pbkdf2_sha256$1500000$eeq1TDxlVN4bb0H48kdyTp$Bj9/yozDrsgBqbz94N63OXfjQvKNSiG1p/mD3a2vRx8=','2026-10-21 08:14:38.608989',1,'admin','','','',1,1,'2026-10-21 08:13:54.481675');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES
('ad25f359b18c6160c352398d013c5d277280676e','2026-10-24 14:34:25.959050',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES
(1,'2026-10-21 10:56:04.020073','1','Building Tomorrow\'s Infrastructure',1,'[{\"added\": {}}, {\"added\": {\"name\": \"hero counter\", \"object\": \"25+ Years Experience\"}}, {\"added\": {\"name\": \"hero counter\", \"object\": \"850+ Projects Completed\"}}, {\"added\": {\"name\": \"hero counter\", \"object\": \"120+ Team Experts\"}}, {\"added\": {\"name\": \"hero counter\", \"object\": \"35+ Industry Awards\"}}]',10,1),
(2,'2026-10-21 11:04:03.630364','1','We Build With Precision, Passion & Purpose',1,'[{\"added\": {}}, {\"added\": {\"name\": \"about feature\", \"object\": \"Licensed & Insured\"}}, {\"added\": {\"name\": \"about feature\", \"object\": \"On-Time Delivery\"}}, {\"added\": {\"name\": \"about feature\", \"object\": \"Expert Workforce\"}}, {\"added\": {\"name\": \"about feature\", \"object\": \"Award Winning\"}}]',8,1),
(3,'2026-10-21 11:10:39.978784','1','Our Services',1,'[{\"added\": {}}, {\"added\": {\"name\": \"service\", \"object\": \"Residential Building\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Commercial Projects\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Renovation & Remodeling\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Road & Infrastructure\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Project Management\"}}, {\"added\": {\"name\": \"service\", \"object\": \"Architecture & Design\"}}]',16,1),
(4,'2026-10-21 11:14:18.238982','1','Numbers That Speak for Our Commitment',1,'[{\"added\": {}}, {\"added\": {\"name\": \"track record stat\", \"object\": \"850+ Projects Delivered\"}}, {\"added\": {\"name\": \"track record stat\", \"object\": \"620+ Satisfied Clients\"}}, {\"added\": {\"name\": \"track record stat\", \"object\": \"120+ Skilled Workers\"}}, {\"added\": {\"name\": \"track record stat\", \"object\": \"35+ Industry Awards\"}}]',18,1),
(5,'2026-10-21 11:15:11.509042','1','Our Projects',1,'[{\"added\": {}}]',14,1),
(6,'2026-10-21 11:15:44.903975','1','Residential',1,'[{\"added\": {}}]',13,1),
(7,'2026-10-21 11:16:00.553898','2','Commercial',1,'[{\"added\": {}}]',13,1),
(8,'2026-10-21 11:16:17.364397','3','Infrastructure',1,'[{\"added\": {}}]',13,1),
(9,'2026-10-21 11:20:11.082871','1','Sunset Ridge Villa',1,'[{\"added\": {}}]',12,1),
(10,'2026-10-21 11:21:18.868343','2','Metro Business Hub',1,'[{\"added\": {}}]',12,1),
(11,'2026-10-21 11:22:16.866067','3','Riverside Highway Bridge',1,'[{\"added\": {}}]',12,1),
(12,'2026-10-21 11:24:40.624893','4','Lakeview Apartments',1,'[{\"added\": {}}]',12,1),
(13,'2026-10-21 11:25:37.488217','5','Central Shopping Plaza',1,'[{\"added\": {}}]',12,1),
(14,'2026-10-21 11:27:44.648229','6','Northern Rail Terminal',1,'[{\"added\": {}}]',12,1),
(15,'2026-10-21 11:29:08.687111','1','Constructify',1,'[{\"added\": {}}]',17,1),
(16,'2026-10-21 11:29:35.736294','1','Home',1,'[{\"added\": {}}]',11,1),
(17,'2026-10-21 11:29:48.769523','2','About',1,'[{\"added\": {}}]',11,1),
(18,'2026-10-21 11:30:06.126380','3','Services',1,'[{\"added\": {}}]',11,1),
(19,'2026-10-21 11:30:28.452307','4','Projects',1,'[{\"added\": {}}]',11,1),
(20,'2026-10-21 11:30:49.449410','5','Team',1,'[{\"added\": {}}]',11,1),
(21,'2026-10-21 11:31:04.580428','6','Pages',1,'[{\"added\": {}}]',11,1),
(22,'2026-10-21 11:31:21.232305','7','Contact',1,'[{\"added\": {}}]',11,1),
(23,'2026-10-23 07:04:55.772078','1','We Build With Precision, Passion & Purpose',2,'[{\"changed\": {\"fields\": [\"Image secondary\"]}}]',8,1),
(24,'2026-10-23 07:40:26.743751','1','We Build With Precision, Passion & Purpose',2,'[{\"changed\": {\"fields\": [\"Image secondary\"]}}]',8,1),
(25,'2026-10-23 07:50:01.134511','1','Building Tomorrow\'s Infrastructure',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',10,1),
(26,'2026-10-23 07:50:39.420232','1','Building Tomorrow\'s Infrastructure',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',10,1),
(27,'2026-10-23 07:51:19.728696','1','Building Tomorrow\'s Infrastructure',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',10,1),
(28,'2026-10-24 05:29:48.653691','1','Our Services',2,'[{\"changed\": {\"name\": \"service\", \"object\": \"Architecture & Design\", \"fields\": [\"Icon\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(1,'admin','logentry'),
(2,'auth','group'),
(3,'auth','permission'),
(4,'auth','user'),
(20,'authtoken','token'),
(21,'authtoken','tokenproxy'),
(5,'contenttypes','contenttype'),
(7,'portfolio','aboutfeature'),
(8,'portfolio','aboutsection'),
(9,'portfolio','herocounter'),
(10,'portfolio','herosection'),
(11,'portfolio','navitem'),
(12,'portfolio','project'),
(13,'portfolio','projectcategory'),
(14,'portfolio','projectssection'),
(15,'portfolio','service'),
(16,'portfolio','servicessection'),
(17,'portfolio','sitesettings'),
(18,'portfolio','trackrecordsection'),
(19,'portfolio','trackrecordstat'),
(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-10-21 08:12:32.799161'),
(2,'auth','0001_initial','2026-10-21 08:12:33.634079'),
(3,'admin','0001_initial','2026-10-21 08:12:33.815073'),
(4,'admin','0002_logentry_remove_auto_add','2026-10-21 08:12:33.830063'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-10-21 08:12:33.847287'),
(6,'contenttypes','0002_remove_content_type_name','2026-10-21 08:12:33.966594'),
(7,'auth','0002_alter_permission_name_max_length','2026-10-21 08:12:34.064377'),
(8,'auth','0003_alter_user_email_max_length','2026-10-21 08:12:34.133990'),
(9,'auth','0004_alter_user_username_opts','2026-10-21 08:12:34.163773'),
(10,'auth','0005_alter_user_last_login_null','2026-10-21 08:12:34.269871'),
(11,'auth','0006_require_contenttypes_0002','2026-10-21 08:12:34.275787'),
(12,'auth','0007_alter_validators_add_error_messages','2026-10-21 08:12:34.304672'),
(13,'auth','0008_alter_user_username_max_length','2026-10-21 08:12:34.378090'),
(14,'auth','0009_alter_user_last_name_max_length','2026-10-21 08:12:34.447171'),
(15,'auth','0010_alter_group_name_max_length','2026-10-21 08:12:34.517537'),
(16,'auth','0011_update_proxy_permissions','2026-10-21 08:12:34.554234'),
(17,'auth','0012_alter_user_first_name_max_length','2026-10-21 08:12:34.634223'),
(18,'sessions','0001_initial','2026-10-21 08:12:34.736987'),
(19,'portfolio','0001_initial','2026-10-21 08:20:17.967578'),
(20,'authtoken','0001_initial','2026-10-24 14:27:44.673660'),
(21,'authtoken','0002_auto_20160226_1747','2026-10-24 14:27:44.704115'),
(22,'authtoken','0003_tokenproxy','2026-10-24 14:27:44.709467'),
(23,'authtoken','0004_alter_tokenproxy_options','2026-10-24 14:27:44.715939');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES
('ald2ob78scptf8nmvkblv6llkx1xq709','.eJxVjLsOwjAMAP_FM4oIeZB0ZO83VLFjkwJKpKadEP-OKnWA9e50b5jStpZp67xMc4YBNJx-GSZ6ct1FfqR6b4paXZcZ1Z6ow3Y1tsyv29H-DUrqBQYgYyOSu1jJ3gUJ-pwJrywckninoyAl8Z4NxxBJozXBaBbH2rLFgPD5AgaION0:1xJRT4:gzJKvK_8JOkR5HkK4lDguC_-JYNIr7J29ZSoQlxJ9ZM','2026-11-04 08:14:38.613940');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_aboutfeature`
--

DROP TABLE IF EXISTS `portfolio_aboutfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_aboutfeature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  `about_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_aboutfeatu_about_id_daad32a3_fk_portfolio` (`about_id`),
  CONSTRAINT `portfolio_aboutfeatu_about_id_daad32a3_fk_portfolio` FOREIGN KEY (`about_id`) REFERENCES `portfolio_aboutsection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_aboutfeature`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_aboutfeature` WRITE;
/*!40000 ALTER TABLE `portfolio_aboutfeature` DISABLE KEYS */;
INSERT INTO `portfolio_aboutfeature` VALUES
(1,'bi-shield-check','Licensed & Insured','Fully certified with comprehensive coverage for every project we undertake.',1,1),
(2,'bi-clock','On-Time Delivery','Proven track record of completing projects within schedule and budget.',2,1),
(3,'bi-people','Expert Workforce','Over 120 skilled professionals across all construction disciplines.',3,1),
(5,'bi-trophy','Award Winning','Recognized with 35+ industry awards for quality and innovation.',4,1);
/*!40000 ALTER TABLE `portfolio_aboutfeature` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_aboutsection`
--

DROP TABLE IF EXISTS `portfolio_aboutsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_aboutsection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `small_heading` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image_main` varchar(100) NOT NULL,
  `image_secondary` varchar(100) NOT NULL,
  `badge_number` varchar(20) NOT NULL,
  `badge_label` varchar(50) NOT NULL,
  `btn1_text` varchar(50) NOT NULL,
  `btn2_text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_aboutsection`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_aboutsection` WRITE;
/*!40000 ALTER TABLE `portfolio_aboutsection` DISABLE KEYS */;
INSERT INTO `portfolio_aboutsection` VALUES
(1,'ABOUT CONSTRUCTIFY','We Build With Precision, Passion & Purpose','Since 1998, we have been delivering world-class construction services across residential, commercial, and infrastructure sectors. Our commitment to quality craftsmanship and client satisfaction drives everything we do.','about/pexels-njeromin-12314551_YJeaaKE.jpg','about/pexels-westarmoney-10631119.jpg','25+','Years of Experience','Start Your Project','View Our Work');
/*!40000 ALTER TABLE `portfolio_aboutsection` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_herocounter`
--

DROP TABLE IF EXISTS `portfolio_herocounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_herocounter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `label` varchar(100) NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  `hero_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_herocounte_hero_id_9eb5bb7f_fk_portfolio` (`hero_id`),
  CONSTRAINT `portfolio_herocounte_hero_id_9eb5bb7f_fk_portfolio` FOREIGN KEY (`hero_id`) REFERENCES `portfolio_herosection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_herocounter`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_herocounter` WRITE;
/*!40000 ALTER TABLE `portfolio_herocounter` DISABLE KEYS */;
INSERT INTO `portfolio_herocounter` VALUES
(1,'25+','Years Experience',1,1),
(2,'850+','Projects Completed',2,1),
(3,'120+','Team Experts',3,1),
(5,'35+','Industry Awards',4,1);
/*!40000 ALTER TABLE `portfolio_herocounter` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_herosection`
--

DROP TABLE IF EXISTS `portfolio_herosection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_herosection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `badge_text` varchar(150) NOT NULL,
  `title` varchar(200) NOT NULL,
  `highlight_word` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `primary_btn_text` varchar(50) NOT NULL,
  `secondary_btn_text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_herosection`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_herosection` WRITE;
/*!40000 ALTER TABLE `portfolio_herosection` DISABLE KEYS */;
INSERT INTO `portfolio_herosection` VALUES
(1,'Trusted Construction Partner Since 1998','Building Tomorrow\'s Infrastructure','Today','Voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae.','hero/pexels-felix-haumann-1938529-10143241_awalGZF.jpg','Explore Our Projects','Request a Quote');
/*!40000 ALTER TABLE `portfolio_herosection` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_navitem`
--

DROP TABLE IF EXISTS `portfolio_navitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_navitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `anchor` varchar(100) NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_navitem`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_navitem` WRITE;
/*!40000 ALTER TABLE `portfolio_navitem` DISABLE KEYS */;
INSERT INTO `portfolio_navitem` VALUES
(1,'Home','#home',1),
(2,'About','#about',2),
(3,'Services','#services',3),
(4,'Projects','#projects',4),
(5,'Team','#team',5),
(6,'Pages','#pages',6),
(7,'Contact','#contact',7);
/*!40000 ALTER TABLE `portfolio_navitem` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_project`
--

DROP TABLE IF EXISTS `portfolio_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_project_category_id_d3e22b6f_fk_portfolio` (`category_id`),
  CONSTRAINT `portfolio_project_category_id_d3e22b6f_fk_portfolio` FOREIGN KEY (`category_id`) REFERENCES `portfolio_projectcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_project`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_project` WRITE;
/*!40000 ALTER TABLE `portfolio_project` DISABLE KEYS */;
INSERT INTO `portfolio_project` VALUES
(1,'Sunset Ridge Villa','Premium residential complex with contemporary architecture','projects/pexels-ranamatloob567-34378030.jpg',1,1),
(2,'Metro Business Hub','Premium residential complex with contemporary architecture','projects/pexels-pixabay-358549.jpg',2,2),
(3,'Riverside Highway Bridge','Premium residential complex with contemporary architecture','projects/pexels-stonesdonotdisappear-21273650.jpg',3,3),
(4,'Lakeview Apartments','Premium residential complex with contemporary architecture','projects/pexels-dylan-leagh-86004871-9039850.jpg',4,1),
(5,'Central Shopping Plaza','Premium residential complex with contemporary architecture','projects/pexels-jansher-chakkittammal-230257630-20776189.jpg',5,2),
(6,'Northern Rail Terminal','Premium residential complex with contemporary architecture','projects/pexels-ann-h-45017-34657983.jpg',6,3);
/*!40000 ALTER TABLE `portfolio_project` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_projectcategory`
--

DROP TABLE IF EXISTS `portfolio_projectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_projectcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_projectcategory`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_projectcategory` WRITE;
/*!40000 ALTER TABLE `portfolio_projectcategory` DISABLE KEYS */;
INSERT INTO `portfolio_projectcategory` VALUES
(1,'Residential','residential'),
(2,'Commercial','commercial'),
(3,'Infrastructure','infrastructure');
/*!40000 ALTER TABLE `portfolio_projectcategory` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_projectssection`
--

DROP TABLE IF EXISTS `portfolio_projectssection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_projectssection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `subtitle` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_projectssection`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_projectssection` WRITE;
/*!40000 ALTER TABLE `portfolio_projectssection` DISABLE KEYS */;
INSERT INTO `portfolio_projectssection` VALUES
(1,'Our Projects','Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum');
/*!40000 ALTER TABLE `portfolio_projectssection` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_service`
--

DROP TABLE IF EXISTS `portfolio_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  `section_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_service_section_id_e8b78a23_fk_portfolio` (`section_id`),
  CONSTRAINT `portfolio_service_section_id_e8b78a23_fk_portfolio` FOREIGN KEY (`section_id`) REFERENCES `portfolio_servicessection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_service`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_service` WRITE;
/*!40000 ALTER TABLE `portfolio_service` DISABLE KEYS */;
INSERT INTO `portfolio_service` VALUES
(1,'bi-house','Residential Building','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',1,1),
(2,'bi-building','Commercial Projects','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',2,1),
(3,'bi-hammer','Renovation & Remodeling','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',3,1),
(4,'bi-signpost','Road & Infrastructure','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',4,1),
(5,'bi-clipboard-check','Project Management','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',5,1),
(6,'bi-rulers','Architecture & Design','Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.',6,1);
/*!40000 ALTER TABLE `portfolio_service` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_servicessection`
--

DROP TABLE IF EXISTS `portfolio_servicessection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_servicessection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `subtitle` longtext NOT NULL,
  `side_image` varchar(100) NOT NULL,
  `cta_title` varchar(200) NOT NULL,
  `cta_link_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_servicessection`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_servicessection` WRITE;
/*!40000 ALTER TABLE `portfolio_servicessection` DISABLE KEYS */;
INSERT INTO `portfolio_servicessection` VALUES
(1,'Our Services','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur','services/pexels-volker-braun-2149703592-33122153.jpg','We Deliver Excellence in Every Project','Get a Free Consultation');
/*!40000 ALTER TABLE `portfolio_servicessection` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_sitesettings`
--

DROP TABLE IF EXISTS `portfolio_sitesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_sitesettings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `cta_button_text` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_sitesettings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_sitesettings` WRITE;
/*!40000 ALTER TABLE `portfolio_sitesettings` DISABLE KEYS */;
INSERT INTO `portfolio_sitesettings` VALUES
(1,'Constructify','+1 (555) 234-6789','Get Estimate');
/*!40000 ALTER TABLE `portfolio_sitesettings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_trackrecordsection`
--

DROP TABLE IF EXISTS `portfolio_trackrecordsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_trackrecordsection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `small_heading` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `link_text` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_trackrecordsection`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_trackrecordsection` WRITE;
/*!40000 ALTER TABLE `portfolio_trackrecordsection` DISABLE KEYS */;
INSERT INTO `portfolio_trackrecordsection` VALUES
(1,'OUR TRACK RECORD','Numbers That Speak for Our Commitment','Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore.','View Our Projects');
/*!40000 ALTER TABLE `portfolio_trackrecordsection` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `portfolio_trackrecordstat`
--

DROP TABLE IF EXISTS `portfolio_trackrecordstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_trackrecordstat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `label` varchar(100) NOT NULL,
  `order` int(10) unsigned NOT NULL CHECK (`order` >= 0),
  `section_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_trackrecor_section_id_88206fb4_fk_portfolio` (`section_id`),
  CONSTRAINT `portfolio_trackrecor_section_id_88206fb4_fk_portfolio` FOREIGN KEY (`section_id`) REFERENCES `portfolio_trackrecordsection` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_trackrecordstat`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `portfolio_trackrecordstat` WRITE;
/*!40000 ALTER TABLE `portfolio_trackrecordstat` DISABLE KEYS */;
INSERT INTO `portfolio_trackrecordstat` VALUES
(1,'bi-bar-chart','850+','Projects Delivered',1,1),
(2,'bi-emoji-smile','620+','Satisfied Clients',2,1),
(3,'bi-people','120+','Skilled Workers',3,1),
(4,'bi-trophy','35+','Industry Awards',4,1);
/*!40000 ALTER TABLE `portfolio_trackrecordstat` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-10-25  9:00:37

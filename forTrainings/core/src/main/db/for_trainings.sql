CREATE DATABASE  IF NOT EXISTS `for_trainings` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `for_trainings`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: for_trainings
-- ------------------------------------------------------
-- Server version	5.6.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','b59c67bf196a4758191e42f76670ceba','Anton Grigoriev','toxa.z@mail.ru',NULL),(2,'masha','c3cc6e312d2bad42cf535aac3a259abd','Maria Grakova','mariagracova96@gmail.com',NULL),(3,'stas','c211c9e7e7689217c0cb99aafe30f3d7','Stanislav Petrovich','staspetrovichbsu@gmail.com',NULL),(4,'kolya','ec3da25081aa81b637fe6faa3debe26e','Nikolay Lebedev','nickylebedev@gmail.com',NULL),(5,'dima','0f5b25cd58319cde0e6e33715b66db4c','Dmitriy Nedelko',NULL,NULL),(6,'maks','051f7661ee7c287be66ee572768ec8f5','Maksim Skavish',NULL,NULL),(7,'main','fad58de7366495db4650cfefac2fcd61','Vasilenko Janna',NULL,NULL),(8,'jesus','110d46fcd978c24f306cd7fa23464d73','Jesus Christ',NULL,NULL),(9,'king','b2086154f101464aab3328ba7e060deb','Stephen King',NULL,NULL),(10,'vlad','d701fde59d74f76803087b6632186caf','Vladislav Dracula',NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_feedback`
--

DROP TABLE IF EXISTS `employee_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `understand` tinyint(4) DEFAULT NULL,
  `interested` tinyint(4) DEFAULT NULL,
  `continueWithThisTrainer` tinyint(4) DEFAULT NULL,
  `smthNew` tinyint(4) DEFAULT NULL,
  `recommend` tinyint(4) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `other` text,
  PRIMARY KEY (`id`),
  KEY `fk_employee_employee_feedback_idx` (`employee_id`),
  KEY `fk_training_employee_feedback_idx` (`training_id`),
  CONSTRAINT `fk_employee_employee_feedback` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training_employee_feedback` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_feedback`
--

LOCK TABLES `employee_feedback` WRITE;
/*!40000 ALTER TABLE `employee_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_notice`
--

DROP TABLE IF EXISTS `employee_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_notice` (
  `employee_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complete` tinyint(4) NOT NULL DEFAULT '0',
  KEY `fk_employee_employee_notice_idx` (`employee_id`),
  KEY `fk_notice_employee_notice_idx` (`notice_id`),
  KEY `fk_role_employee_notice_idx` (`role_id`),
  CONSTRAINT `fk_employee_employee_notice` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_notice_employee_notice` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_employee_notice` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_notice`
--

LOCK TABLES `employee_notice` WRITE;
/*!40000 ALTER TABLE `employee_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role`
--

DROP TABLE IF EXISTS `employee_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_role` (
  `employee_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`role_id`),
  KEY `fk_role_employee_role_idx` (`role_id`),
  CONSTRAINT `fk_employee_employee_role` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_role_employee_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role`
--

LOCK TABLES `employee_role` WRITE;
/*!40000 ALTER TABLE `employee_role` DISABLE KEYS */;
INSERT INTO `employee_role` VALUES (1,1),(7,1),(8,2),(2,3),(3,3),(4,3);
/*!40000 ALTER TABLE `employee_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tag`
--

DROP TABLE IF EXISTS `employee_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tag` (
  `employee_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`tag_id`),
  KEY `fk_tag_employee_tag_idx` (`tag_id`),
  CONSTRAINT `fk_employee_employee_tag` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tag_employee_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tag`
--

LOCK TABLES `employee_tag` WRITE;
/*!40000 ALTER TABLE `employee_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meet`
--

DROP TABLE IF EXISTS `meet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `training_id_idx` (`training_id`),
  CONSTRAINT `fk_training_meet` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet`
--

LOCK TABLES `meet` WRITE;
/*!40000 ALTER TABLE `meet` DISABLE KEYS */;
INSERT INTO `meet` VALUES (1,1,'2015-07-02 09:00:00'),(2,1,'2015-07-07 10:00:00'),(3,1,'2015-07-09 09:00:00'),(4,1,'2015-07-14 09:00:00'),(5,1,'2015-07-15 09:00:00'),(6,1,'2015-07-21 09:00:00'),(7,1,'2015-07-23 09:00:00'),(8,1,'2015-07-28 12:00:00'),(9,1,'2015-07-30 09:00:00'),(10,1,'2015-08-04 09:00:00'),(11,1,'2015-08-06 09:00:00'),(12,1,'2015-08-11 09:00:00'),(13,1,'2015-08-13 11:00:00'),(14,1,'2015-08-18 09:00:00'),(15,1,'2015-08-20 09:00:00'),(16,1,'2015-08-25 09:00:00'),(17,1,'2015-08-27 09:00:00'),(18,2,'2015-07-08 12:00:00'),(19,3,'2015-09-01 03:00:00'),(20,4,'2015-06-04 09:00:00'),(21,5,'2015-09-07 09:00:00'),(26,13,'2015-07-31 16:55:00'),(27,14,'2015-07-01 03:10:00'),(28,14,'2015-07-30 11:30:00'),(29,15,'2015-07-22 11:50:00'),(30,15,'2015-07-31 02:00:00'),(31,16,'2015-07-01 10:25:00'),(32,16,'2015-07-31 11:30:00'),(33,16,'2015-07-06 10:25:00'),(34,16,'2015-07-13 10:25:00'),(35,16,'2015-07-20 10:25:00'),(36,16,'2015-07-27 10:25:00'),(37,16,'2015-07-08 10:25:00'),(38,16,'2015-07-15 10:25:00'),(39,16,'2015-07-22 10:25:00'),(40,16,'2015-07-29 10:25:00'),(41,17,'2015-07-01 03:30:00'),(42,17,'2015-07-31 07:30:00'),(43,17,'2015-07-06 03:30:00'),(44,17,'2015-07-13 03:30:00'),(45,17,'2015-07-20 03:30:00'),(46,17,'2015-07-27 03:30:00'),(47,17,'2015-07-08 03:30:00'),(48,17,'2015-07-15 03:30:00'),(49,17,'2015-07-22 03:30:00'),(50,17,'2015-07-29 03:30:00'),(51,16,'2015-07-29 03:30:00');
/*!40000 ALTER TABLE `meet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meet_version`
--

DROP TABLE IF EXISTS `meet_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meet_version` (
  `old_version` int(11) NOT NULL,
  `new_version` int(11) NOT NULL,
  PRIMARY KEY (`old_version`,`new_version`),
  KEY `fk_meet(new)_meet_version_idx` (`new_version`),
  CONSTRAINT `fk_meet(new)_meet_version` FOREIGN KEY (`new_version`) REFERENCES `meet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_meet(old)_meet_version` FOREIGN KEY (`old_version`) REFERENCES `meet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet_version`
--

LOCK TABLES `meet_version` WRITE;
/*!40000 ALTER TABLE `meet_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `meet_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `id`,
 1 AS `training_id`,
 1 AS `name`,
 1 AS `annotation`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_training_notice_idx` (`training_id`),
  CONSTRAINT `fk_training_notice` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `subscribe_id` int(11) NOT NULL,
  `meet_id` int(11) NOT NULL,
  `absent` tinyint(4) NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`subscribe_id`,`meet_id`),
  KEY `meet_id_idx` (`meet_id`),
  CONSTRAINT `fk_meet_participant` FOREIGN KEY (`meet_id`) REFERENCES `meet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subscribe_particicpant` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'external'),(3,'trainer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchevent`
--

DROP TABLE IF EXISTS `searchevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchevent` (
  `id` int(11) NOT NULL,
  `annotation` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `training_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchevent`
--

LOCK TABLES `searchevent` WRITE;
/*!40000 ALTER TABLE `searchevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `status` varchar(15) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_employee_subscribe_idx` (`employee_id`),
  KEY `fk_training_subscribe_idx` (`training_id`),
  CONSTRAINT `fk_employee_subscribe` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training_subscribe` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (1,1,1,'approve','2015-05-31 21:00:00'),(2,2,1,'approve','2015-06-01 21:00:00'),(3,3,1,'approve','2015-06-02 21:00:00'),(4,4,1,'approve','2015-06-03 21:00:00'),(5,5,1,'approve','2015-06-04 21:00:00'),(6,6,1,'wait','2015-06-05 21:00:00'),(7,7,1,'wait','2015-06-06 21:00:00'),(8,9,1,'wait','2015-06-07 21:00:00'),(9,1,2,'approve','2015-05-31 21:00:00'),(10,2,2,'approve','2015-06-14 21:00:00'),(11,3,4,'approve','2015-06-08 21:00:00'),(12,9,5,'approve','2015-06-02 21:00:00');
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL DEFAULT 'token',
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_token_idx` (`employee_id`),
  CONSTRAINT `fk_employee_token` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,'240715155447552311879',1),(2,'token',2),(3,'token',3),(4,'240715155508-2059738913',4),(5,'token',5),(6,'token',6),(7,'token',7),(8,'token',8),(9,'240715155455295800428',9);
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_feedback`
--

DROP TABLE IF EXISTS `trainer_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_employee_trainer_feedback_idx1` (`employee_id`),
  KEY `fk_training_trainer_feedback_idx` (`training_id`),
  CONSTRAINT `fk_employee_trainer_feedback` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training_trainer_feedback` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_feedback`
--

LOCK TABLES `trainer_feedback` WRITE;
/*!40000 ALTER TABLE `trainer_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `annotation` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `target` varchar(45) NOT NULL,
  `paid` tinyint(4) NOT NULL,
  `internal` tinyint(4) NOT NULL,
  `approve` tinyint(4) NOT NULL,
  `max_participants` int(11) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trainer_id_idx` (`trainer_id`),
  CONSTRAINT `fk_employee_training` FOREIGN KEY (`trainer_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,8,'English','Just English','Just do it','Everybody',0,0,1,12,'203'),(2,4,'CORE JAVA ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on CORE JAVA.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Medium-level JAVA developers.',0,0,1,10,NULL),(3,4,'Advanced Java','Sun trainings is a best online center in Hyderabad. We are providing very best online training on Advanced Java.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Hight-level JAVA developers.',0,0,0,7,NULL),(4,2,'ORACLE DBA ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on ORACLE DBA.','Course Name : ORACLE DBA                                                                    24*7 Technical Support\nDuration         : 35 hours\nFaculty            : Realtime experience \n\n           Sun trainings is a best online center in Hyderabad. We are providing very best online training on ORACLE DBA.\n\nHighlights in our training:\n\n*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Oracle users.',1,0,1,9,NULL),(5,3,'MongoDB ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on MongoDB.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','DB developers.',0,0,1,10,NULL),(13,1,'dfgdg','dfgdfgdg','sdfssf','sdfsf',1,1,0,6,'sdfsf'),(14,1,'Normal','Hahaton','Description','228',0,0,0,13,'333'),(15,4,'Testing','adfadf','aefaefaef','aefaef',0,1,0,7,'aefaef'),(16,4,'TESTINGGGG','sregg','rdgdrg','sgsegseg',0,1,1,7,'srgsg'),(17,4,'saefegs','efsefsef','sefsef','sefsef',1,1,1,4,'sefsef');
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_tag`
--

DROP TABLE IF EXISTS `training_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_tag` (
  `training_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`training_id`,`tag_id`),
  KEY `fk_tag_training_tag_idx` (`tag_id`),
  CONSTRAINT `fk_tag_training_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training_training_tag` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_tag`
--

LOCK TABLES `training_tag` WRITE;
/*!40000 ALTER TABLE `training_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_version`
--

DROP TABLE IF EXISTS `training_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_version` (
  `old_version` int(11) NOT NULL,
  `new_version` int(11) NOT NULL,
  PRIMARY KEY (`old_version`,`new_version`),
  KEY `fk_training(new)_training_version_idx` (`new_version`),
  CONSTRAINT `fk_training(new)_training_version` FOREIGN KEY (`new_version`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training(old)_training_version` FOREIGN KEY (`old_version`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_version`
--

LOCK TABLES `training_version` WRITE;
/*!40000 ALTER TABLE `training_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `meet`.`id` AS `id`,`training`.`id` AS `training_id`,`training`.`name` AS `name`,`training`.`annotation` AS `annotation`,`meet`.`date` AS `date` from (`training` join `meet`) where ((`training`.`approve` = 1) and (`meet`.`training_id` = `training`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-24 16:47:49

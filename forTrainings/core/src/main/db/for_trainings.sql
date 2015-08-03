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
INSERT INTO `employee` VALUES (1,'admin','b59c67bf196a4758191e42f76670ceba','Anton Grigoriev','toxa.z@mail.ru',NULL),(2,'masha','c3cc6e312d2bad42cf535aac3a259abd','Maria Grakova','mariagracova96@gmail.com',NULL),(3,'stas','c211c9e7e7689217c0cb99aafe30f3d7','Stanislav Petrovich','staspetrovichbsu@gmail.com',NULL),(4,'kolya','ec3da25081aa81b637fe6faa3debe26e','Nikolay Lebedev','nickylebedev@gmail.com',NULL),(5,'dima','0f5b25cd58319cde0e6e33715b66db4c','Dmitriy Nedelko',NULL,NULL),(6,'maks','051f7661ee7c287be66ee572768ec8f5','Maksim Skavish',NULL,NULL),(7,'main','fad58de7366495db4650cfefac2fcd61','Vasilenko Janna','toxa.z@mail.ru',NULL),(8,'jesus','110d46fcd978c24f306cd7fa23464d73','Jesus Christ',NULL,NULL),(9,'king','b2086154f101464aab3328ba7e060deb','Stephen King',NULL,NULL),(10,'vlad','d701fde59d74f76803087b6632186caf','Vladislav Dracula',NULL,NULL);
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
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_employee_feedback_idx` (`employee_id`),
  KEY `fk_training_employee_feedback_idx` (`training_id`),
  CONSTRAINT `fk_employee_employee_feedback` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_training_employee_feedback` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_feedback`
--

LOCK TABLES `employee_feedback` WRITE;
/*!40000 ALTER TABLE `employee_feedback` DISABLE KEYS */;
INSERT INTO `employee_feedback` VALUES (1,1,1,'2015-07-28 16:27:02',1,1,1,1,1,1,'1',0,NULL);
/*!40000 ALTER TABLE `employee_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_notice`
--

DROP TABLE IF EXISTS `employee_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_employee_employee_notice_idx` (`employee_id`),
  KEY `fk_notice_employee_notice_idx` (`notice_id`),
  CONSTRAINT `fk_employee_employee_notice` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_notice_employee_notice` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_notice`
--

LOCK TABLES `employee_notice` WRITE;
/*!40000 ALTER TABLE `employee_notice` DISABLE KEYS */;
INSERT INTO `employee_notice` VALUES (1,7,1,1),(2,7,2,1),(3,7,3,1),(4,7,4,1),(5,7,5,1),(6,7,6,1),(7,7,7,1),(8,7,8,1),(9,7,9,1),(10,7,10,1),(11,7,11,1),(12,7,12,1),(13,7,13,1),(14,7,14,1),(15,7,15,0),(16,7,16,0),(17,7,17,1),(26,7,50,0),(47,1,53,0),(48,2,53,0),(49,3,53,0),(50,4,53,0),(51,5,53,0),(52,6,53,0),(53,7,53,0),(54,8,53,0),(55,9,53,0),(56,10,53,0),(57,1,54,0),(58,2,54,0),(59,3,54,0),(60,4,54,0),(61,5,54,0),(62,6,54,0),(63,7,54,0),(64,8,54,0),(65,9,54,0),(66,10,54,0),(67,1,55,0),(68,2,55,0),(69,3,55,0),(70,4,55,0),(71,5,55,0),(72,6,55,0),(73,7,55,0),(74,8,55,0),(75,9,55,0),(76,10,55,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet`
--

LOCK TABLES `meet` WRITE;
/*!40000 ALTER TABLE `meet` DISABLE KEYS */;
INSERT INTO `meet` VALUES (1,1,'2015-07-02 09:00:00'),(2,1,'2015-07-07 10:00:00'),(3,1,'2015-07-09 09:00:00'),(4,1,'2015-07-14 09:00:00'),(5,1,'2015-07-15 09:00:00'),(6,1,'2015-07-21 09:00:00'),(7,1,'2015-07-23 09:00:00'),(8,1,'2015-07-28 12:00:00'),(9,1,'2015-07-30 09:00:00'),(10,1,'2015-08-04 09:00:00'),(11,1,'2015-08-06 09:00:00'),(12,1,'2015-08-11 09:00:00'),(13,1,'2015-08-13 11:00:00'),(14,1,'2015-08-18 09:00:00'),(15,1,'2015-08-20 09:00:00'),(16,1,'2015-08-25 09:00:00'),(17,1,'2015-08-27 09:00:00'),(18,2,'2015-07-08 12:00:00'),(19,3,'2015-09-01 03:00:00'),(20,4,'2015-06-04 09:00:00'),(21,5,'2015-09-07 09:00:00'),(27,14,'2015-07-01 03:10:00'),(28,14,'2015-07-30 11:30:00'),(70,30,'2015-07-31 11:30:00'),(71,31,'2015-09-30 07:30:00'),(72,33,'2015-08-01 06:00:00'),(73,33,'2015-08-02 06:00:00'),(74,33,'2015-08-09 06:00:00'),(75,33,'2015-08-16 06:00:00'),(76,33,'2015-08-23 06:00:00'),(77,33,'2015-08-30 06:00:00'),(78,33,'2015-09-06 06:00:00'),(79,33,'2015-09-13 06:00:00'),(80,33,'2015-09-20 06:00:00'),(81,33,'2015-09-27 06:00:00'),(82,33,'2015-08-03 06:00:00'),(83,33,'2015-08-10 06:00:00'),(84,33,'2015-08-17 06:00:00'),(85,33,'2015-08-24 06:00:00'),(86,33,'2015-08-31 06:00:00'),(87,33,'2015-09-07 06:00:00'),(88,33,'2015-09-14 06:00:00'),(89,33,'2015-09-21 06:00:00'),(90,33,'2015-09-28 06:00:00'),(91,33,'2015-08-04 06:00:00'),(92,33,'2015-08-11 06:00:00'),(93,33,'2015-08-18 06:00:00'),(94,33,'2015-08-25 06:00:00'),(95,33,'2015-09-01 06:00:00'),(96,33,'2015-09-08 06:00:00'),(97,33,'2015-09-15 06:00:00'),(98,33,'2015-09-22 06:00:00'),(99,33,'2015-09-29 06:00:00'),(100,33,'2015-08-05 06:00:00'),(101,33,'2015-08-12 06:00:00'),(102,33,'2015-08-19 06:00:00'),(103,33,'2015-08-26 06:00:00'),(104,33,'2015-09-02 06:00:00'),(105,33,'2015-09-09 06:00:00'),(106,33,'2015-09-16 06:00:00'),(107,33,'2015-09-23 06:00:00'),(108,33,'2015-08-06 06:00:00'),(109,33,'2015-08-13 06:00:00'),(110,33,'2015-08-20 06:00:00'),(111,33,'2015-08-27 06:00:00'),(112,33,'2015-09-03 06:00:00'),(113,33,'2015-09-10 06:00:00'),(114,33,'2015-09-17 06:00:00'),(115,33,'2015-09-24 06:00:00'),(116,33,'2015-08-07 06:00:00'),(117,33,'2015-08-14 06:00:00'),(118,33,'2015-08-21 06:00:00'),(119,33,'2015-08-28 06:00:00'),(120,33,'2015-09-04 06:00:00'),(121,33,'2015-09-11 06:00:00'),(122,33,'2015-09-18 06:00:00'),(123,33,'2015-09-25 06:00:00'),(124,33,'2015-08-08 06:00:00'),(125,33,'2015-08-15 06:00:00'),(126,33,'2015-08-22 06:00:00'),(127,33,'2015-08-29 06:00:00'),(128,33,'2015-09-05 06:00:00'),(129,33,'2015-09-12 06:00:00'),(130,33,'2015-09-19 06:00:00'),(131,33,'2015-09-26 06:00:00'),(132,33,'2015-09-30 06:05:00'),(133,34,'2015-08-01 17:12:00'),(134,45,'2015-08-20 11:50:00'),(135,45,'2015-08-20 11:50:00'),(136,45,'2015-08-20 11:50:00'),(137,46,'2015-08-01 14:53:00'),(140,49,'2015-08-28 11:45:00'),(141,50,'2015-08-22 15:50:00'),(142,51,'2015-08-28 15:30:00');
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
  `theme` text NOT NULL,
  `text` text NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender_id` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_training_notice_idx` (`training_id`),
  CONSTRAINT `fk_training_notice` FOREIGN KEY (`training_id`) REFERENCES `training` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,1,'gvb','cbgcb','2015-07-31 07:30:58',2,'warning',NULL),(2,2,'fg','fgdfg','2015-07-31 07:30:58',3,'warning',NULL),(3,1,'sdg','sdg','2015-11-08 21:00:00',4,'info',NULL),(4,1,'ef','ef','2015-11-08 21:00:00',2,'info',NULL),(5,1,'sd','sdav','2015-11-08 21:00:00',2,'info',NULL),(6,1,'agf','afeafe','2015-11-08 21:00:00',2,'info',NULL),(7,1,'df','sadf','2015-11-08 21:00:00',3,'info',NULL),(8,1,'adff','asfafs','2015-11-08 21:00:00',5,'info',NULL),(9,1,'dsf','adf','2015-11-08 21:00:00',2,'info',NULL),(10,2,'saf','feewqf','2015-11-08 21:00:00',5,'info',NULL),(11,3,'srgwrhetah','zvsdgs','2015-11-08 21:00:00',6,'info',NULL),(12,3,'time transfer','meet time transfer from 12:00 to 13:00','2015-07-31 08:11:05',4,'warning',NULL),(13,2,'addition successfully completed','you was added to the Core Java training participants list','2015-07-31 08:15:18',5,'success',NULL),(14,14,'feedback','this was awesome training','2015-09-11 21:00:00',1,'info',NULL),(15,1,'addition successfully completed','you was added to the English training participants list','2015-07-31 08:15:18',1,'success',NULL),(16,2,'date transfer','meet date transfer from 2015-10-12 to 2015-10-13','2015-07-31 08:15:18',7,'warning',NULL),(17,3,'addition successfully completed','you was added to the Advanced Java training participants list','2015-10-11 21:00:00',7,'success',NULL),(50,34,'Meet is coming!','Meet of training Schedule test trainingwill be in3 hour','2015-08-01 14:12:00',1,'info',NULL),(53,49,'New training','There is the new training TEST EMAIL in system','2015-08-02 15:20:13',7,'info',NULL),(54,50,'New training','There is the new training rgeret in system','2015-08-02 15:22:15',7,'info',NULL),(55,51,'New training','There is the new training ergrg in system','2015-08-02 15:46:37',7,'info',NULL);
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
  `absent` tinyint(4) DEFAULT '0',
  `reason` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_subscribe_participant_idx` (`subscribe_id`),
  CONSTRAINT `fk_subscribe_participant` FOREIGN KEY (`subscribe_id`) REFERENCES `subscribe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (1,1,1,'Approve','2015-08-01 09:50:43'),(2,2,1,'Approve','2015-07-30 13:24:59'),(3,3,1,'Approve','2015-07-30 13:24:59'),(4,4,1,'Approve','2015-07-30 13:24:59'),(5,5,1,'Approve','2015-07-30 13:24:59'),(6,6,1,'Wait','2015-07-30 13:24:59'),(7,7,1,'Wait','2015-07-30 13:24:59'),(8,9,1,'Wait','2015-07-30 13:24:59'),(9,1,2,'Approve','2015-07-30 13:24:59'),(10,2,2,'Approve','2015-07-30 13:24:59'),(11,3,4,'Approve','2015-07-30 13:24:59'),(12,9,5,'Approve','2015-07-30 13:24:59'),(18,8,2,'Approve','2015-07-30 13:24:59'),(19,7,34,'Approve','2015-08-03 06:29:12');
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
  `value` varchar(45) DEFAULT 'token',
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
INSERT INTO `token` VALUES (1,'010815122730-540119915',1),(2,'token',2),(3,'token',3),(4,'240715155508-2059738913',4),(5,'310715151646-2122411317',5),(6,'token',6),(7,'0308150926211296953224',7),(8,'2907151047191192705113',8),(9,'240715155455295800428',9);
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
  `approve` tinyint(4) NOT NULL DEFAULT '0',
  `max_participants` int(11) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `trainer_id_idx` (`trainer_id`),
  CONSTRAINT `fk_employee_training` FOREIGN KEY (`trainer_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
INSERT INTO `training` VALUES (1,8,'English','Just English','Just do it','Everybody',0,0,1,12,'203',0),(2,4,'CORE JAVA ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on CORE JAVA.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Medium-level JAVA developers.',0,0,1,10,NULL,0),(3,4,'Advanced Java','Sun trainings is a best online center in Hyderabad. We are providing very best online training on Advanced Java.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Hight-level JAVA developers.',0,0,0,7,NULL,0),(4,2,'ORACLE DBA ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on ORACLE DBA.','Course Name : ORACLE DBA                                                                    24*7 Technical Support\nDuration         : 35 hours\nFaculty            : Realtime experience \n\n           Sun trainings is a best online center in Hyderabad. We are providing very best online training on ORACLE DBA.\n\nHighlights in our training:\n\n*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','Oracle users.',1,0,1,9,NULL,0),(5,3,'MongoDB ','Sun trainings is a best online center in Hyderabad. We are providing very best online training on MongoDB.','*  Very in depth course material with real time scenarios.\n*  We are providing class with highly qualified trainer.\n*  We will provide class and demo session at student flexible timings.\n*  In training case studies and real time scenarios covered.\n*  We will give 24*7 technical supports.\n*  Each topic coverage with real time solutions.\n*  We are providing normal track,weekend,fast track classes.\n*  We will give every recorded session for play later.\n*  We are giving placement support by multiple consultancies in INDIA, USA, Australia, UK etc.\n*  We are providing certification oriented trainings with 100% pass guarantee.\n*  We will give full support while attending the interviews and contact me any time after completion of the course.','DB developers.',0,0,1,10,NULL,0),(14,1,'Normal','Hahaton','Description','228',0,0,0,13,'333',0),(30,1,'test','asdasd','asdasdasd','sadasd',1,1,0,5,'asd',0),(31,1,'TEST TEST','sdgsg','wefwef','wefwef',1,1,0,5,'wefwef',0),(33,1,'TEST TEST TEST','dfef','hjh','iu',1,1,0,56,'kj',0),(34,1,'Schedule test training','test','test','test',0,0,1,1,'1',0),(45,1,'TESTINGG','sdvds','sdfsdf','sdfdsf',1,1,0,4,'sdfs',0),(46,1,'T','erg','wrgwgrw','wgrg',1,1,1,4,'rgwrg',0),(49,7,'TEST EMAIL','ergre','reg','erg',1,1,0,1,'reg',0),(50,7,'rgeret','ege','rec','ecrg',1,1,0,2,'ercgc',0),(51,7,'ergrg','erg','erg','erg',1,1,0,1,'reg',0);
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
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `old_id` int(11) NOT NULL,
  `json` text NOT NULL,
  `entity_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
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

-- Dump completed on 2015-08-03 12:48:28

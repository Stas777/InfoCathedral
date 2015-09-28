CREATE DATABASE  IF NOT EXISTS `InfoCathedral` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `InfoCathedral`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: InfoCathedral
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `cathedras`
--

DROP TABLE IF EXISTS `cathedras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cathedras` (
  `cathedra_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `historical_information` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cathedra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cathedras`
--

LOCK TABLES `cathedras` WRITE;
/*!40000 ALTER TABLE `cathedras` DISABLE KEYS */;
/*!40000 ALTER TABLE `cathedras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_number` int(11) NOT NULL,
  `cathedras_cathedra_id` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`cathedras_cathedra_id`),
  KEY `fk_groups_cathedras1_idx` (`cathedras_cathedra_id`),
  CONSTRAINT `fk_groups_cathedras1` FOREIGN KEY (`cathedras_cathedra_id`) REFERENCES `cathedras` (`cathedra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `research_interests` varchar(500) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `e-mail` varchar(70) DEFAULT NULL,
  `other_information` varchar(1000) DEFAULT NULL,
  `groups_group_id` int(11) NOT NULL,
  `is_praepostor` tinyint(1) NOT NULL,
  PRIMARY KEY (`student_id`,`groups_group_id`),
  KEY `fk_students_groups_idx` (`groups_group_id`),
  CONSTRAINT `fk_students_groups` FOREIGN KEY (`groups_group_id`) REFERENCES `groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(500) NOT NULL,
  `cathedras_cathedra_id` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`,`cathedras_cathedra_id`),
  KEY `fk_subjects_cathedras1_idx` (`cathedras_cathedra_id`),
  CONSTRAINT `fk_subjects_cathedras1` FOREIGN KEY (`cathedras_cathedra_id`) REFERENCES `cathedras` (`cathedra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `degree` varchar(45) NOT NULL,
  `biography` varchar(1000) DEFAULT NULL,
  `research_interests` varchar(200) NOT NULL,
  `phone` int(11) NOT NULL,
  `e-mail` varchar(70) NOT NULL,
  `literature` varchar(1000) NOT NULL,
  `is_curator` tinyint(1) NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_has_subjects`
--

DROP TABLE IF EXISTS `teachers_has_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers_has_subjects` (
  `teachers_teacher_id` int(11) NOT NULL,
  `subjects_subject_id` int(11) NOT NULL,
  `subjects_cathedras_cathedra_id` int(11) NOT NULL,
  PRIMARY KEY (`teachers_teacher_id`,`subjects_subject_id`,`subjects_cathedras_cathedra_id`),
  KEY `fk_teachers_has_subjects_subjects1_idx` (`subjects_subject_id`,`subjects_cathedras_cathedra_id`),
  KEY `fk_teachers_has_subjects_teachers1_idx` (`teachers_teacher_id`),
  CONSTRAINT `fk_teachers_has_subjects_teachers1` FOREIGN KEY (`teachers_teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_subjects_subjects1` FOREIGN KEY (`subjects_subject_id`, `subjects_cathedras_cathedra_id`) REFERENCES `subjects` (`subject_id`, `cathedras_cathedra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_has_subjects`
--

LOCK TABLES `teachers_has_subjects` WRITE;
/*!40000 ALTER TABLE `teachers_has_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers_has_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-21 18:49:30

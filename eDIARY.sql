CREATE DATABASE  IF NOT EXISTS `e_diary` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_diary`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: e_diary
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence` (
  `class_id` bigint DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5cuk0wwn7rqweg444o7fbpj2` (`class_id`),
  KEY `FKjsf7gefkccsmvo5u1ax6lieyi` (`student_id`),
  CONSTRAINT `FKg5cuk0wwn7rqweg444o7fbpj2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `FKjsf7gefkccsmvo5u1ax6lieyi` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
INSERT INTO `absence` VALUES (NULL,'2025-06-20 00:00:00.000000',1,13,'first try rolling sorry'),(1,'2025-06-20 00:00:00.000000',2,10002,'pak shmurka v kenefa'),(1,'2025-06-21 00:00:00.000000',3,6,'pak ebe jeni '),(1,'2025-06-21 00:00:00.000000',4,10002,'OTNOWO shmurka w kenefaaa'),(1,'2025-06-21 00:00:00.000000',5,10002,'za treti put shmurka v kenefa, prosto ne mogaaaaaaaa'),(1,'2025-06-27 00:00:00.000000',6,10002,'prosto go nqma momcheto'),(3,'2025-06-20 00:00:00.000000',7,10014,'kara motor'),(1,'2025-06-20 00:00:00.000000',8,10013,'pie bira v koridora'),(2,'2025-06-28 00:00:00.000000',9,10011,'pushi icos po wreme na chas, tova ne e normalno tq e 1vi klas!!?!?!?!');
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_students`
--

DROP TABLE IF EXISTS `class_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_students` (
  `class_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`class_id`,`student_id`),
  KEY `fk_student` (`student_id`),
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_students`
--

LOCK TABLES `class_students` WRITE;
/*!40000 ALTER TABLE `class_students` DISABLE KEYS */;
INSERT INTO `class_students` VALUES (1,10002),(2,10005),(2,10011),(1,10013),(3,10014);
/*!40000 ALTER TABLE `class_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_teachers`
--

DROP TABLE IF EXISTS `class_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_teachers` (
  `class_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`class_id`,`teacher_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `class_teachers_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `class_teachers_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_teachers`
--

LOCK TABLES `class_teachers` WRITE;
/*!40000 ALTER TABLE `class_teachers` DISABLE KEYS */;
INSERT INTO `class_teachers` VALUES (1,2),(1,10),(1,11),(1,10003),(3,10012);
/*!40000 ALTER TABLE `class_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school_id` bigint DEFAULT NULL,
  `teacher_id` bigint DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpmbjltak5i0knqcgyydru2f18` (`school_id`),
  KEY `FK9r6phdgb34r4wd6ui07h3qfs5` (`teacher_id`),
  CONSTRAINT `FK9r6phdgb34r4wd6ui07h3qfs5` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKpmbjltak5i0knqcgyydru2f18` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,1,10003,'12A','Class 12a'),(2,1,NULL,'1A','Class 1A'),(3,1,10012,'1B','Class 1B'),(4,1,NULL,'1C','Class 1C'),(5,1,NULL,'1D','Class 1D'),(6,1,NULL,'2A','Class 2A'),(7,1,NULL,'2B','Class 2B'),(8,1,NULL,'2C','Class 2C'),(9,1,NULL,'2D','Class 2D'),(10,1,NULL,'3A','Class 3A'),(11,1,NULL,'3B','Class 3B'),(12,1,NULL,'3C','Class 3C'),(13,1,NULL,'3D','Class 3D'),(14,1,NULL,'4A','Class 4A'),(15,1,NULL,'4B','Class 4B'),(16,1,NULL,'4C','Class 4C'),(17,1,NULL,'4D','Class 4D'),(18,1,NULL,'5A','Class 5A'),(19,1,NULL,'5B','Class 5B'),(20,1,NULL,'5C','Class 5C'),(21,1,NULL,'5D','Class 5D'),(22,1,NULL,'6A','Class 6A'),(23,1,NULL,'6B','Class 6B'),(24,1,NULL,'6C','Class 6C'),(25,1,NULL,'6D','Class 6D'),(26,1,NULL,'7A','Class 7A'),(27,1,NULL,'7B','Class 7B'),(28,1,NULL,'7C','Class 7C'),(29,1,NULL,'7D','Class 7D'),(30,1,NULL,'8A','Class 8A'),(31,1,NULL,'8B','Class 8B'),(32,1,NULL,'8C','Class 8C'),(33,1,NULL,'8D','Class 8D'),(34,1,NULL,'9A','Class 9A'),(35,1,NULL,'9B','Class 9B'),(36,1,NULL,'9C','Class 9C'),(37,1,NULL,'9D','Class 9D'),(38,1,NULL,'10A','Class 10A'),(39,1,NULL,'10B','Class 10B'),(40,1,NULL,'10C','Class 10C'),(41,1,NULL,'10D','Class 10D'),(42,1,NULL,'11A','Class 11A'),(43,1,NULL,'11B','Class 11B'),(44,1,NULL,'11C','Class 11C'),(45,1,NULL,'11D','Class 11D'),(47,1,NULL,'12B','Class 12B'),(48,1,NULL,'12C','Class 12C'),(49,1,NULL,'12D','Class 12D');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum` (
  `class_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school_id` bigint DEFAULT NULL,
  `semester_id` bigint DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `teacher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7rkrm9wsyaikmx60quc7o6vmb` (`school_id`),
  KEY `FKkc80ue7iwwp62mwgklkwy8tc4` (`class_id`),
  KEY `FKph1h84mnwhuj0os6al31cf7y1` (`subject_id`),
  KEY `FK5qcsf8my2xoesjrpeywoc3w1y` (`semester_id`),
  KEY `FK2u2irio3oibs4rj4ywtkfgyv1` (`teacher_id`),
  CONSTRAINT `FK2u2irio3oibs4rj4ywtkfgyv1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK5qcsf8my2xoesjrpeywoc3w1y` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  CONSTRAINT `FK7rkrm9wsyaikmx60quc7o6vmb` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `FKkc80ue7iwwp62mwgklkwy8tc4` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `FKph1h84mnwhuj0os6al31cf7y1` FOREIGN KEY (`subject_id`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (1,1,2,2,6,11),(1,2,2,2,8,2),(1,3,2,2,2,10),(2,4,2,2,9,NULL);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (2,1),(3,2),(4,3),(5,4),(6,5);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_student` (
  `user_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`student_id`),
  KEY `fk_parent_student_student` (`student_id`),
  CONSTRAINT `fk_parent_student_parent` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_parent_student_student` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_student`
--

LOCK TABLES `parent_student` WRITE;
/*!40000 ALTER TABLE `parent_student` DISABLE KEYS */;
INSERT INTO `parent_student` VALUES (10018,10002),(10018,10011),(10017,10013);
/*!40000 ALTER TABLE `parent_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_DIRECTOR'),(5,'ROLE_PARENT'),(4,'ROLE_STUDENT'),(3,'ROLE_TEACHER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `class_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `semester_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_schedule_map`
--

DROP TABLE IF EXISTS `schedule_schedule_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_schedule_map` (
  `schedule_id` bigint NOT NULL,
  `schedule_map` bigint DEFAULT NULL,
  `schedule_map_key` varchar(255) NOT NULL,
  PRIMARY KEY (`schedule_id`,`schedule_map_key`),
  CONSTRAINT `FK56k2cg07k94dk1xdgdxbkyo1s` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_schedule_map`
--

LOCK TABLES `schedule_schedule_map` WRITE;
/*!40000 ALTER TABLE `schedule_schedule_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_schedule_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `director_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKiqdojbcblibv7mb0v1kyugjbe` (`director_id`),
  CONSTRAINT `FK7su5xu7e0wqd5gfex7gl1ljvb` FOREIGN KEY (`director_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (NULL,1,'Admin Street 1','Admin School'),(4,2,'ul.prqsnaMarula 17','Jackson Peterson \"55\"');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_students`
--

DROP TABLE IF EXISTS `school_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_students` (
  `school_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`school_id`,`student_id`),
  KEY `FKtw2u90vwcg5d2uu785wsbuqa` (`student_id`),
  CONSTRAINT `FKjxjyeqhcbtapfdkf91fh8co15` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `FKtw2u90vwcg5d2uu785wsbuqa` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_students`
--

LOCK TABLES `school_students` WRITE;
/*!40000 ALTER TABLE `school_students` DISABLE KEYS */;
INSERT INTO `school_students` VALUES (2,6),(2,13);
/*!40000 ALTER TABLE `school_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_subject`
--

DROP TABLE IF EXISTS `school_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_subject`
--

LOCK TABLES `school_subject` WRITE;
/*!40000 ALTER TABLE `school_subject` DISABLE KEYS */;
INSERT INTO `school_subject` VALUES (1,'Mathematics'),(2,'Bulgarian Language'),(3,'English Language'),(4,'Physics'),(5,'Chemistry'),(6,'Biology'),(7,'Geography'),(8,'History'),(9,'Philosophy'),(10,'Music'),(11,'Physical Education'),(12,'Information Technology'),(13,'Art'),(14,'German Language'),(15,'French Language');
/*!40000 ALTER TABLE `school_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_teachers`
--

DROP TABLE IF EXISTS `school_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_teachers` (
  `school_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`school_id`,`teacher_id`),
  KEY `FKbmu3fnn3m8ocvy1v0jgr2sku9` (`teacher_id`),
  CONSTRAINT `FKbmu3fnn3m8ocvy1v0jgr2sku9` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKs0leomfeox7jmt19hhg1e406g` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_teachers`
--

LOCK TABLES `school_teachers` WRITE;
/*!40000 ALTER TABLE `school_teachers` DISABLE KEYS */;
INSERT INTO `school_teachers` VALUES (1,10003),(1,10012);
/*!40000 ALTER TABLE `school_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `end_date` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES ('2025-06-30 00:00:00.000000',2,'2025-09-19 00:00:00.000000','AWAS');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_grades`
--

DROP TABLE IF EXISTS `student_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_grades` (
  `grade_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school_subject_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9d80ryoi0ty46u5k8y1rcihyj` (`grade_id`),
  KEY `FKfvn9jmx7pqb8qudtt3s5qre0p` (`school_subject_id`),
  KEY `FKeht8egn1vmfbvggdqjine260s` (`student_id`),
  CONSTRAINT `FK9d80ryoi0ty46u5k8y1rcihyj` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `FKeht8egn1vmfbvggdqjine260s` FOREIGN KEY (`student_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKfvn9jmx7pqb8qudtt3s5qre0p` FOREIGN KEY (`school_subject_id`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_grades`
--

LOCK TABLES `student_grades` WRITE;
/*!40000 ALTER TABLE `student_grades` DISABLE KEYS */;
INSERT INTO `student_grades` VALUES (5,1,12,6),(3,2,7,6),(4,3,10,6),(1,4,1,10005),(1,5,1,10002),(1,6,1,10002),(1,7,1,10002),(3,8,4,10014),(5,9,8,10013),(1,10,6,10011),(1,11,10,10011),(1,12,10,10011);
/*!40000 ALTER TABLE `student_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `class_id` bigint DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `school_id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UKi1pkkkteed13wt581o8vanlx8` (`student_id`),
  KEY `FKhfk8g53bxnqit19g58eoa6gaf` (`class_id`),
  KEY `FKhbkxju61kpht7qnnhemgjv3u7` (`school_id`),
  CONSTRAINT `FKhbkxju61kpht7qnnhemgjv3u7` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `FKhfk8g53bxnqit19g58eoa6gaf` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10019 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,2,2,'Minkow21@email.com','Minko','Minkow','$2a$10$L6ij4vszhYhktjPFv/R2tuvcfcatp76a8Z0CF/c1Sfbw09NTjApli',NULL,'ROLE_TEACHER'),(1,4,2,'MKP@abv.com','Makov','Picha','$2a$10$nUXQU4D.mPJxVSnYMfUXeeLkYKuKisEzHjDjU4Ti1.zX6k.pPDkqC',NULL,'ROLE_DIRECTOR'),(1,6,2,'PP@gmail.com','Pesho','Peshovich','$2a$10$ydAedUd5pjisi/Eu1kfLTO/85ByjzI5dFIFoa5MMBmlYDWKW05tfO','U692337','ROLE_STUDENT'),(1,10,2,'buchvata12@teacher.com','Qvor','Buchvarow','$2a$10$WdxWnCRiVe6EI4ZnicxQvewYpN2GSjm2hk45EGd5sUxlKdMTo1SnW',NULL,'ROLE_TEACHER'),(1,11,2,'TS133@teacher.com','Tony','StorarOOOO','$2a$10$wvnMKUOodURBtunYwzzfLuKAtDGjDCyD30ljRtLINFsw6imzDkT/G',NULL,'ROLE_TEACHER'),(NULL,12,1,'Jackkov@director.com','jACK','Jackov','$2a$10$O6AyhNlip.6DoZHCou.c.e.dleaRN5s6yef15CsBOWu74mb6ryJKK',NULL,'ROLE_DIRECTOR'),(NULL,13,2,'jboi@student.bg','Jacki','boi','$2a$10$9Iv1dgQUecVTWMtEB80aL.hNe8q/iHf8S61tuLCpPHZKjzAK4ca0q','A386519','ROLE_STUDENT'),(NULL,9999,1,'admin@example.com','Admin','User','$2a$10$MuygdvQjC5kBAC2u5dckhe/BDUfWxLb.qAiw9bcpCDzvWS.pHea/m',NULL,'ROLE_ADMIN'),(1,10002,1,'Devyrche@student.bg','Gosho','Devuru','$2a$10$tdLnnkAagEZtjnvo4vBwseUsFWD3b3TewzyGYi3Y/ZSlgP8l20t6G','M855259','ROLE_STUDENT'),(1,10003,1,'Kremiko13@teacher.bg','Kremiko','KremikowskoKowalski','$2a$10$sV4qEgD9S6KOv3UBgEhv4uDwJzG7wCALYgODt6jLDbBs9pV6JgzJu',NULL,'ROLE_TEACHER'),(2,10004,1,'PetqAlexandrowa@student.bg','Petq','Aleksandrowa','$2a$10$zZrMnDUCEqctb0yWXIYJDupBLqpPHK62trGqdMEHLml4dxMOtGOHS','E104904','ROLE_STUDENT'),(2,10005,1,'AnyLalova@student.com','Any','Lalova','$2a$10$sUd7cNlfqVHyvjoj1SirouvPs8u/8PYrYPRqJtivt77X98eJOwn5m','L691302','ROLE_STUDENT'),(2,10011,1,'AqVidenowa@student.com','Aq','Videnowa','$2a$10$HVdPxvYlg7Y22KpMtLKMH.m.o8/c9GvqP9lKJsyaKuY7ttQv/ivyq','T961551','ROLE_STUDENT'),(3,10012,1,'blackkitty69lmao@gmail.com','Lachezar','Parev','$2a$10$grUY229IJ2n6rz7s9yJ2uu8O04oGIGNH9a1nBbteZfTYPeWXD9O5e',NULL,'ROLE_TEACHER'),(1,10013,1,'alov@student.bg','Angel','Angelov','$2a$10$.UH5LQStpzrAq1Yip6eovecVCefS0S1J0Ne2LfYEgzKSUr6J2OhS6','P885484','ROLE_STUDENT'),(3,10014,1,'Kpetrov@student.bg','Krasi','Petrov','$2a$10$zMz7CUaa0p/GilTJzlE06OTzjrbvB4o5D1hsCbKgmMW2OkpFFclPu','A179715','ROLE_STUDENT'),(NULL,10015,1,'Mm@parent.bg','Mariq','Marinova','$2a$10$3FKWioEheuKpl.YxPY5TDO7ZICWe8qMYYGKjAfLdf32oyev5FVIIW','10014','ROLE_PARENT'),(NULL,10017,1,'pestr123132@parent.bg','MariqNa','Marinovana','$2a$10$KE1epcyr3Ymas377QGtcbOYXOZDtJBNf9AVNSah5DAfOwlqn2WemW','10013','ROLE_PARENT'),(NULL,10018,1,'Gdev@parent.bg','Gergana','Devuru','$2a$10$0UqVkGCqxOWvgSWSHp1YeeIxpW9vB6iRA2e6HSFrlHyfEhoCvNmbe','10002','ROLE_PARENT');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (3,2),(2,4),(4,6),(3,10),(3,11),(2,12),(4,13),(1,9999),(4,10002),(3,10003),(4,10004),(4,10005),(4,10011),(3,10012),(4,10013),(4,10014),(5,10015),(5,10017),(5,10018);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_school_subjects`
--

DROP TABLE IF EXISTS `user_school_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_school_subjects` (
  `school_subject_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`school_subject_id`,`user_id`),
  KEY `FK2w05iyx77g5ylvscfr9y65wjq` (`user_id`),
  CONSTRAINT `FK2w05iyx77g5ylvscfr9y65wjq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKsosaqifnmr8pjkj8mvjkyrftv` FOREIGN KEY (`school_subject_id`) REFERENCES `school_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_school_subjects`
--

LOCK TABLES `user_school_subjects` WRITE;
/*!40000 ALTER TABLE `user_school_subjects` DISABLE KEYS */;
INSERT INTO `user_school_subjects` VALUES (14,2),(2,10),(4,11),(13,11),(4,10002),(5,10002),(6,10002),(13,10002),(14,10002),(15,10002),(1,10003),(3,10004),(5,10004),(6,10004),(12,10004),(13,10004),(14,10004),(1,10005),(2,10005),(3,10005),(14,10005),(15,10005),(2,10011),(3,10011),(4,10011),(7,10011),(8,10011),(9,10011),(13,10011),(2,10012),(3,10012),(3,10013),(4,10013),(1,10014),(6,10014),(9,10014),(11,10014),(12,10014),(14,10014),(15,10014);
/*!40000 ALTER TABLE `user_school_subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-28 21:41:33

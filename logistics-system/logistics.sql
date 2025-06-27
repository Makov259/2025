CREATE DATABASE  IF NOT EXISTS `logistics_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `logistics_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: logistics_db
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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (3,'ul.lekosejivee 6',' Bary Uroda ltd'),(4,'ul.Tupalka 17','MakovLTD'),(5,'Bqla Riba str. 199','Jackson Peterson LTD');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cost` double NOT NULL,
  `delivered_at` date DEFAULT NULL,
  `courier_id` bigint DEFAULT NULL,
  `shipment_id` bigint DEFAULT NULL,
  `delivery_type` enum('ADDRESS_DELIVERY','OFFICE_PICKUP') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkjmg1ekjenp2d3ugbbjtw89s2` (`shipment_id`),
  KEY `FKnk1ypfk6688hawcud7tkr6tal` (`courier_id`),
  CONSTRAINT `FKeapiqogofye96mxqa3mklavm3` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`id`),
  CONSTRAINT `FKnk1ypfk6688hawcud7tkr6tal` FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (11,0,NULL,16,NULL,NULL),(12,0,NULL,24,NULL,NULL),(13,0,NULL,24,NULL,NULL),(14,0,NULL,25,NULL,NULL),(15,0,NULL,25,NULL,NULL),(16,0,NULL,25,NULL,NULL),(17,0,NULL,24,NULL,NULL),(19,8.8,'2025-06-26',16,14,NULL),(23,0,NULL,30,25,NULL),(24,187.23499999999999,'2025-06-27',25,26,'ADDRESS_DELIVERY'),(25,0,NULL,28,27,NULL),(26,0,NULL,24,28,NULL);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqfmw2uo0g1kab0x3fb0uq5wkw` (`company_id`),
  CONSTRAINT `FKqfmw2uo0g1kab0x3fb0uq5wkw` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES (1,NULL,'Blvrd.Hristo Botev  #259',NULL),(3,NULL,'Blvrd.Hristo Botev  #77',NULL),(4,NULL,'Blvrd.Hristo Botev  #44',NULL),(8,'ul.lekosejivee 6','Ofiice5',3),(9,'ul.lekosejivee 7','Office6',3),(11,'Blvrd.Hristo Botev  #77','Office 19',4),(12,'Blvrd.Hristo Botev  #74','Ofiice 122',3),(13,'ul.prqsnaDinq 174','Ofiice 4stars',5);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` enum('ROLE_ADMIN','ROLE_CLIENT','ROLE_EMPLOYEE') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_CLIENT'),(3,'ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `weight` double NOT NULL,
  `origin_office_id` bigint DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  `status` enum('DELIVERED','IN_TRANSIT','PENDING') DEFAULT NULL,
  `registered_by_employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK35bt7o7brd8yi7dmwab7b13cd` (`origin_office_id`),
  KEY `FK4m1hym51mgnrdl4dqiqm0lg6d` (`receiver_id`),
  KEY `FK8pdg3io23qk7pvnoo5d8qknjk` (`sender_id`),
  KEY `FKgxjmokgmnudu32jq7kbc2o671` (`registered_by_employee_id`),
  CONSTRAINT `FK35bt7o7brd8yi7dmwab7b13cd` FOREIGN KEY (`origin_office_id`) REFERENCES `office` (`id`),
  CONSTRAINT `FK4m1hym51mgnrdl4dqiqm0lg6d` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK8pdg3io23qk7pvnoo5d8qknjk` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKgxjmokgmnudu32jq7kbc2o671` FOREIGN KEY (`registered_by_employee_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (14,'2025-06-25','BotevGrad',4.4,11,15,15,'DELIVERED',16),(25,'2025-06-12','Sofia',4.4,11,15,27,'PENDING',24),(26,'2025-06-27','Sandanski',66.5,NULL,15,27,'DELIVERED',1),(27,'2025-06-28','Lyulin',44,NULL,15,27,'PENDING',1),(28,'2025-06-13','BotevGrad',56.6,8,27,32,'PENDING',30);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `type` enum('COURIER','OFFICE_WORKER') DEFAULT NULL,
  `office_id` bigint DEFAULT NULL,
  `client_company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2yuxsfrkkrnkn5emoobcnnc3r` (`company_id`),
  KEY `FKmrlaeiw7ten8d3sjejpif4tyf` (`office_id`),
  KEY `FK8b2554hyvgjh9igjjqeeywnml` (`client_company_id`),
  CONSTRAINT `FK2yuxsfrkkrnkn5emoobcnnc3r` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FK8b2554hyvgjh9igjjqeeywnml` FOREIGN KEY (`client_company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `FKmrlaeiw7ten8d3sjejpif4tyf` FOREIGN KEY (`office_id`) REFERENCES `office` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mak@admin.com','$2a$10$LnjpcJTryV8SVAPidYRMseVZyN9Vjk5hEtBNb7QIrdMi0SvF6DW/y','Mak',NULL,NULL,NULL,NULL),(15,'baba@email.com','$2a$10$5emrzmACvTFbR1TzUePE/u7T/l.I9o/XOriuZakUE7CchTj7cV3IW','BabaQga1',NULL,NULL,NULL,4),(16,'chichko@email.com','$2a$10$zHwAn6siIC59z5G7XbJ9eetP0p0wQEBlfgnegDARm1Rp1PLxQOs2q','Dqdo',3,'COURIER',8,NULL),(24,'yeye@yeye.com','$2a$10$nrvVlKri9aRSKplHqFHVLOT7qBu5O0A6mr0sNSnYwVMmpRkrMxki.','yeye',4,'COURIER',11,NULL),(25,'Igracha@abv.bg','$2a$10$Fc1v5hr3IXUCTnniaOgJfeOHT8yy2kDqq0O470UaKej65hoz4F.Uu','Toshko',3,'COURIER',12,NULL),(27,'dzip@abv.bg','$2a$10$M/WA62/MzgcdnmeQNObeOudZhYUeulE6hXqJ.mqKiUmPsIluOPh9q','Petar',NULL,NULL,NULL,3),(28,'persi@abv.bg','$2a$10$9CgZpEC/9o3qunvxD/17wOMNMn06pCVY3L5xcgG.LLgCnpVkz5t8q','Persi',5,'COURIER',13,NULL),(29,'ikre@abv.bg','$2a$10$Q6Oxg2yL2OCX9d7vEhQ3ieO26l43MdZeLUQSUArcehl4Tg8G.rDuW','Tisho',3,'OFFICE_WORKER',12,NULL),(30,'hala@abv.bg','$2a$10$WTb9TUvtljiXJl9rlggfEe9zRV0k/c5ai2vzhLvP1gDdJR5M4qHy.','Dqdo2',3,'COURIER',8,NULL),(32,'Qna1@client.bg','$2a$10$NVF1PX9mtuLC1xTOnfcRFe1qIU5RS1DwwTYs/NN3RVCMOGJeAobxe','Qna',NULL,NULL,NULL,NULL);
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
INSERT INTO `user_roles` VALUES (1,1),(2,15),(3,16),(3,24),(3,25),(2,27),(3,28),(3,29),(3,30),(2,32);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8l9m1j8m30mdmdcbbt1c4trkd` (`company_id`),
  CONSTRAINT `FK8l9m1j8m30mdmdcbbt1c4trkd` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-27 12:16:45

-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: examen_sustitutorio
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `territory_id` int DEFAULT NULL,
  `account_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rowguid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_person` (`person_id`),
  CONSTRAINT `fk_customer_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`business_entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,10,5,'AW00000001','660e8400-e29b-41d4-a716-446655440111','2026-04-21 00:40:00');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `business_entity_id` int NOT NULL AUTO_INCREMENT,
  `person_type` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_style` bit(1) DEFAULT NULL,
  `title` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suffix` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_promotion` int DEFAULT NULL,
  `additional_contact_info` text COLLATE utf8mb4_unicode_ci,
  `demographics` text COLLATE utf8mb4_unicode_ci,
  `rowguid` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`business_entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'EM',0x01,'Sr','Juan','Carlos','Perez','Jr',1,'Celular: 999999999','Lima Peru','550e8400-e29b-41d4-a716-446655440000','2026-04-21 00:30:00');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;

--
-- Dumping routines for database 'examen_sustitutorio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-20 20:02:49

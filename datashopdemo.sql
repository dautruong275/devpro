-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopbook
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_self_joining_idx` (`parent_id`),
  CONSTRAINT `fk_self_joining` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (7,'Java','java 2',NULL,'2022-04-05 11:53:56','2022-04-03 00:54:37',NULL,NULL,1,'java'),(8,'Reactjs','Reactjs',NULL,'2022-03-23 16:43:17','2022-03-23 15:50:13',NULL,NULL,1,'reactjs'),(9,'Html','html',NULL,NULL,NULL,NULL,NULL,1,'html');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `request_type` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(1000) COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (1,'a','b','c',NULL,'d',NULL,NULL,NULL,NULL,1),(2,'ac','b','c',NULL,'d',NULL,NULL,NULL,NULL,1),(3,'ac','b','c',NULL,'d',NULL,NULL,NULL,NULL,1),(4,'ac','b','c',NULL,'d',NULL,NULL,NULL,NULL,1),(5,'aa','aâ','',NULL,'',NULL,NULL,NULL,NULL,1),(6,'aa','aâ','a',NULL,'a',NULL,NULL,NULL,NULL,1),(7,'a','a','a',NULL,'a',NULL,NULL,NULL,NULL,1),(8,'a2','a','a',NULL,'a',NULL,NULL,NULL,NULL,1),(9,'a2','a','a',NULL,'a',NULL,NULL,NULL,NULL,1),(10,'a2','a','a',NULL,'a',NULL,NULL,NULL,NULL,1),(11,'a2','a','aq',NULL,'a',NULL,NULL,NULL,NULL,1),(12,'a2','a','aq',NULL,'a',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `price_sale` decimal(13,2) DEFAULT NULL,
  `short_description` varchar(3000) COLLATE utf8mb4_bin NOT NULL,
  `detail_description` longtext COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fr_category_products_idx` (`category_id`),
  CONSTRAINT `fr_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (1,'java Titel 0',1000.00,1000.00,'ShortDescription 1','Details 1','product/avatar/1.jpg','java-titel-0-1',0,7,NULL,NULL,NULL,NULL,1),(2,'java Titel 1',1000.00,1000.00,'ShortDescription 1','Details 2',NULL,'java-titel-1-2',0,7,NULL,NULL,NULL,NULL,1),(3,'java Titel 3',1000.00,1000.00,'ShortDescription 1','Details 3',NULL,'java-titel-3',0,7,NULL,NULL,NULL,NULL,1),(4,'java Titel 4',1000.00,1000.00,'ShortDescription 1','Details 4',NULL,'java-titel-4',0,7,NULL,NULL,NULL,NULL,1),(5,'java Titel 5',1000.00,1000.00,'ShortDescription 1','Details 5',NULL,'java-titel-5',0,7,NULL,NULL,NULL,NULL,1),(6,'java Titel 6',1000.00,1000.00,'ShortDescription 1','Details 6',NULL,'java-titel-5',0,7,NULL,NULL,NULL,NULL,1),(7,'java Titel 7',1000.00,1000.00,'ShortDescription 1','Details 7',NULL,'java-titel-7',0,7,NULL,NULL,NULL,NULL,1),(8,'java Titel 8',1000.00,NULL,'ShortDescription 1','Details 8',NULL,'java-titel-8',0,7,'2022-03-19 21:02:57',NULL,NULL,NULL,1),(9,'java Titel 9',1000.00,1000.00,'ShortDescription 1','Details 10',NULL,'java-titel-9',0,7,NULL,NULL,NULL,NULL,1),(10,'java Titel 10',1000.00,12.00,'ShortDescription 1','Details 11','product/avatar/275971019_3146112802373210_1065370372550244513_n.jpg','java-titel-10',0,7,NULL,NULL,NULL,NULL,1),(11,'java Titel 111',2000.00,2000.00,'ShortDescription 1','Details 12',NULL,'java-titel-111',0,7,NULL,NULL,NULL,NULL,1),(12,'Reactjs 1',12.00,12.00,'222','Reactjs 1',NULL,'reactjs-1',0,8,NULL,NULL,NULL,NULL,1),(13,'Reactjs 2',123.00,123.00,'123','Reactjs 2',NULL,'reactjs-2',0,8,NULL,NULL,NULL,NULL,1),(14,'Reactjs 3',123.00,123.00,'123','Reactjs 3',NULL,'reactjs-3',0,8,NULL,NULL,NULL,NULL,1),(15,'java 1',120.00,102.00,'java','java','product/avatar/275971019_3146112802373210_1065370372550244513_n.jpg','java-1',0,7,NULL,NULL,NULL,NULL,1),(16,'Reactjs',1.00,1.00,'1','Reactjs','product/avatar/275304135_2720592778084233_4997104479545571244_n.jpg','reactjs',0,8,NULL,NULL,NULL,NULL,1),(17,'java 2',12.00,2.00,'2','java 2','product/avatar/275971019_3146112802373210_1065370372550244513_n.jpg','java-2',0,7,NULL,NULL,NULL,NULL,1),(18,'Reactjs 5',1.00,2.00,'12','Reactjs 5',NULL,'reactjs-5',0,8,NULL,NULL,NULL,NULL,1),(19,'Reactjs 6',1.00,2.00,'12','Reactjs 6',NULL,'reactjs-6',0,8,NULL,NULL,NULL,NULL,1),(20,'Reactjs 7',1.00,2.00,'12','Reactjs 7',NULL,'reactjs-7',0,8,NULL,NULL,NULL,NULL,1),(21,'Reactjs 8',2.00,2.00,'2','Reactjs 8',NULL,'reactjs-8',0,8,NULL,NULL,NULL,NULL,1),(22,'HTML Javascript',100000.00,10000.00,'HTML Javascript','HTML Javascript',NULL,'html-javascript',0,9,NULL,NULL,NULL,NULL,1),(23,'HTML Javascript 2',100000.00,100000.00,'HTML Javascript 2','HTML Javascript 2',NULL,'html-javascript-2-23',0,9,NULL,NULL,NULL,NULL,1),(24,'HTML Javascript 3',100000.00,100000.00,'HTML Javascript 3','HTML Javascript 3',NULL,NULL,0,9,NULL,NULL,NULL,NULL,1),(25,'HTML Javascript 5',100000.00,100000.00,'HTML Javascript 4','HTML Javascript 4',NULL,NULL,0,9,NULL,NULL,NULL,NULL,1),(26,'HTML Javascript 5',100000.00,100000.00,'HTML Javascript 5','HTML Javascript 5',NULL,'html-javascript-5-26',0,9,NULL,NULL,NULL,NULL,1),(27,'HTML Javascript 6',100000.00,100000.00,'HTML Javascript 6','HTML Javascript 6',NULL,NULL,0,9,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `product_id` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_imgae_idx` (`product_id`),
  CONSTRAINT `fk_products_imgae` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
INSERT INTO `tbl_products_images` VALUES (1,'275971019_3146112802373210_1065370372550244513_n.jpg','product/pictures/275971019_3146112802373210_1065370372550244513_n.jpg',NULL,NULL,NULL,NULL,1,15,'name 15'),(3,'275971019_3146112802373210_1065370372550244513_n.jpg','product/pictures/275971019_3146112802373210_1065370372550244513_n.jpg',NULL,NULL,NULL,NULL,1,10,'name 10'),(4,'275966835_1785437644988918_927860029987016349_n.jpg','product/pictures/275966835_1785437644988918_927860029987016349_n.jpg',NULL,NULL,NULL,NULL,1,17,'name 17'),(5,'275940840_1785437568322259_9097545737826294456_n.jpg','product/pictures/275940840_1785437568322259_9097545737826294456_n.jpg',NULL,NULL,NULL,NULL,1,17,'name 17'),(7,'275940840_1785437568322259_9097545737826294456_n.jpg','product/pictures/275940840_1785437568322259_9097545737826294456_n.jpg',NULL,NULL,NULL,NULL,1,16,'name 16'),(8,'275133606_3187310134886464_3384467456229135081_n.jpg','product/pictures/275133606_3187310134886464_3384467456229135081_n.jpg',NULL,NULL,NULL,NULL,1,1,'name 1'),(9,'25299001_1228909277242608_7793025871796145185_n.jpg','product/pictures/25299001_1228909277242608_7793025871796145185_n.jpg',NULL,NULL,NULL,NULL,1,1,'name 1');
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (1,'Admin','Admin',NULL,NULL,NULL,NULL,1),(2,'Guest','Guest',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `customer_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `cutomer_email` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (1,'1648881003038',NULL,NULL,NULL,NULL,NULL,NULL,1,'Truong',NULL,'dau@gmail.com','123',NULL);
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_product_saleorder_idx` (`product_id`),
  KEY `fk_saleorder_product_idx` (`saleorder_id`),
  CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (1,1,1,2,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,'admin','$2a$04$9xKJuf6/LaGLSl2/0hL26OGcgBuTMCIoCZ6PLvB3Ejni.UvxoaxX.',NULL,NULL,NULL,NULL,NULL,1),(2,'admin3','$2a$04$Xp1W1omxjwUUTWwgbA0SNu7pFLFINBDIoyNn5NDXk3cFskWpQ157a',NULL,NULL,NULL,NULL,NULL,1),(3,'admin2','$2a$04$Xp1W1omxjwUUTWwgbA0SNu7pFLFINBDIoyNn5NDXk3cFskWpQ157a',NULL,NULL,NULL,NULL,NULL,1),(4,'admin4','$2a$04$9xKJuf6/LaGLSl2/0hL26OGcgBuTMCIoCZ6PLvB3Ejni.UvxoaxX.',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`user_id`),
  KEY `fk_users` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_users` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (1,1),(4,2);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-05 20:06:00

CREATE DATABASE  IF NOT EXISTS `myeshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `myeshop`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: myeshop
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `es_attribute`
--

DROP TABLE IF EXISTS `es_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_attribute` (
  `ATTRIBUTE_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ATTRIBUTE_ID`),
  KEY `FK_g5kkeajqn24ohu2724jawt6vh` (`product_id`),
  CONSTRAINT `FK_g5kkeajqn24ohu2724jawt6vh` FOREIGN KEY (`product_id`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_attribute`
--

LOCK TABLES `es_attribute` WRITE;
/*!40000 ALTER TABLE `es_attribute` DISABLE KEYS */;
INSERT INTO `es_attribute` VALUES (200,'2015-07-01 18:25:50',NULL,'Name',200),(201,'2015-07-01 18:25:50',NULL,'Operating System',200),(202,'2015-07-01 18:25:50',NULL,'Processor',200),(203,'2015-07-01 18:25:50',NULL,'Chipset',200),(204,'2015-07-01 18:25:50',NULL,'Memory',200),(205,'2015-07-01 18:25:50',NULL,'Storage',200),(206,'2015-07-01 18:25:50',NULL,'Screen Size',200),(207,'2015-07-01 18:25:50',NULL,'Graphics',200),(208,'2015-07-01 18:25:50',NULL,'Network',200),(300,'2015-07-02 21:24:41',NULL,'Name',300),(301,'2015-07-02 21:24:41',NULL,'Operating System',300),(302,'2015-07-02 21:24:41',NULL,'Processor',300),(303,'2015-07-02 21:24:41',NULL,'Chipset',300),(304,'2015-07-02 21:24:41',NULL,'Memory',300),(305,'2015-07-02 21:24:41',NULL,'Storage',300),(306,'2015-07-02 21:24:41',NULL,'Screen Size',300),(307,'2015-07-02 21:24:41',NULL,'Graphics',300),(308,'2015-07-02 21:24:41',NULL,'Network',300),(350,'2015-07-02 21:26:01',NULL,'Name',350),(351,'2015-07-02 21:26:01',NULL,'Operating System',350),(352,'2015-07-02 21:26:01',NULL,'Processor',350),(353,'2015-07-02 21:26:01',NULL,'Chipset',350),(354,'2015-07-02 21:26:01',NULL,'Memory',350),(355,'2015-07-02 21:26:01',NULL,'Storage',350),(356,'2015-07-02 21:26:01',NULL,'Screen Size',350),(357,'2015-07-02 21:26:01',NULL,'Graphics',350),(358,'2015-07-02 21:26:01',NULL,'Network',350),(400,'2015-07-02 21:26:39',NULL,'Name',400),(401,'2015-07-02 21:26:40',NULL,'Operating System',400),(402,'2015-07-02 21:26:40',NULL,'Processor',400),(403,'2015-07-02 21:26:40',NULL,'Chipset',400),(404,'2015-07-02 21:26:40',NULL,'Memory',400),(405,'2015-07-02 21:26:40',NULL,'Storage',400),(406,'2015-07-02 21:26:40',NULL,'Screen Size',400),(407,'2015-07-02 21:26:40',NULL,'Graphics',400),(408,'2015-07-02 21:26:40',NULL,'Network',400),(450,'2015-07-02 21:26:41',NULL,'Name',450),(451,'2015-07-02 21:26:41',NULL,'Operating System',450),(452,'2015-07-02 21:26:41',NULL,'Processor',450),(453,'2015-07-02 21:26:41',NULL,'Chipset',450),(454,'2015-07-02 21:26:41',NULL,'Memory',450),(455,'2015-07-02 21:26:41',NULL,'Storage',450),(456,'2015-07-02 21:26:41',NULL,'Screen Size',450),(457,'2015-07-02 21:26:41',NULL,'Graphics',450),(458,'2015-07-02 21:26:41',NULL,'Network',450),(500,'2015-07-02 21:26:42',NULL,'Name',500),(501,'2015-07-02 21:26:42',NULL,'Operating System',500),(502,'2015-07-02 21:26:42',NULL,'Processor',500),(503,'2015-07-02 21:26:42',NULL,'Chipset',500),(504,'2015-07-02 21:26:42',NULL,'Memory',500),(505,'2015-07-02 21:26:42',NULL,'Storage',500),(506,'2015-07-02 21:26:42',NULL,'Screen Size',500),(507,'2015-07-02 21:26:42',NULL,'Graphics',500),(508,'2015-07-02 21:26:42',NULL,'Network',500),(550,'2015-07-02 21:26:43',NULL,'Name',550),(551,'2015-07-02 21:26:43',NULL,'Operating System',550),(552,'2015-07-02 21:26:43',NULL,'Processor',550),(553,'2015-07-02 21:26:43',NULL,'Chipset',550),(554,'2015-07-02 21:26:43',NULL,'Memory',550),(555,'2015-07-02 21:26:43',NULL,'Storage',550),(556,'2015-07-02 21:26:43',NULL,'Screen Size',550),(557,'2015-07-02 21:26:43',NULL,'Graphics',550),(558,'2015-07-02 21:26:43',NULL,'Network',550),(600,'2015-07-02 21:26:44',NULL,'Name',600),(601,'2015-07-02 21:26:44',NULL,'Operating System',600),(602,'2015-07-02 21:26:44',NULL,'Processor',600),(603,'2015-07-02 21:26:44',NULL,'Chipset',600),(604,'2015-07-02 21:26:44',NULL,'Memory',600),(605,'2015-07-02 21:26:44',NULL,'Storage',600),(606,'2015-07-02 21:26:44',NULL,'Screen Size',600),(607,'2015-07-02 21:26:44',NULL,'Graphics',600),(608,'2015-07-02 21:26:44',NULL,'Network',600),(650,'2015-07-02 21:26:45',NULL,'Name',650),(651,'2015-07-02 21:26:46',NULL,'Operating System',650),(652,'2015-07-02 21:26:46',NULL,'Processor',650),(653,'2015-07-02 21:26:46',NULL,'Chipset',650),(654,'2015-07-02 21:26:46',NULL,'Memory',650),(655,'2015-07-02 21:26:46',NULL,'Storage',650),(656,'2015-07-02 21:26:46',NULL,'Screen Size',650),(657,'2015-07-02 21:26:46',NULL,'Graphics',650),(658,'2015-07-02 21:26:46',NULL,'Network',650),(700,'2015-07-02 21:26:47',NULL,'Name',700),(701,'2015-07-02 21:26:47',NULL,'Operating System',700),(702,'2015-07-02 21:26:47',NULL,'Processor',700),(703,'2015-07-02 21:26:47',NULL,'Chipset',700),(704,'2015-07-02 21:26:47',NULL,'Memory',700),(705,'2015-07-02 21:26:47',NULL,'Storage',700),(706,'2015-07-02 21:26:47',NULL,'Screen Size',700),(707,'2015-07-02 21:26:47',NULL,'Graphics',700),(708,'2015-07-02 21:26:47',NULL,'Network',700),(750,'2015-07-02 21:26:48',NULL,'Name',750),(751,'2015-07-02 21:26:48',NULL,'Operating System',750),(752,'2015-07-02 21:26:48',NULL,'Processor',750),(753,'2015-07-02 21:26:48',NULL,'Chipset',750),(754,'2015-07-02 21:26:48',NULL,'Memory',750),(755,'2015-07-02 21:26:48',NULL,'Storage',750),(756,'2015-07-02 21:26:48',NULL,'Screen Size',750),(757,'2015-07-02 21:26:48',NULL,'Graphics',750),(758,'2015-07-02 21:26:48',NULL,'Network',750),(800,'2015-07-02 21:26:49',NULL,'Name',800),(801,'2015-07-02 21:26:49',NULL,'Operating System',800),(802,'2015-07-02 21:26:49',NULL,'Processor',800),(803,'2015-07-02 21:26:49',NULL,'Chipset',800),(804,'2015-07-02 21:26:49',NULL,'Memory',800),(805,'2015-07-02 21:26:49',NULL,'Storage',800),(806,'2015-07-02 21:26:49',NULL,'Screen Size',800),(807,'2015-07-02 21:26:49',NULL,'Graphics',800),(808,'2015-07-02 21:26:49',NULL,'Network',800),(850,'2015-07-02 21:26:50',NULL,'Name',850),(851,'2015-07-02 21:26:51',NULL,'Operating System',850),(852,'2015-07-02 21:26:51',NULL,'Processor',850),(853,'2015-07-02 21:26:51',NULL,'Chipset',850),(854,'2015-07-02 21:26:51',NULL,'Memory',850),(855,'2015-07-02 21:26:51',NULL,'Storage',850),(856,'2015-07-02 21:26:51',NULL,'Screen Size',850),(857,'2015-07-02 21:26:51',NULL,'Graphics',850),(858,'2015-07-02 21:26:51',NULL,'Network',850),(900,NULL,NULL,'Name',900),(911,NULL,NULL,'Graphics',250),(912,NULL,NULL,'Chipset',250),(913,NULL,NULL,'Processor',250),(914,NULL,NULL,'Network',250),(915,NULL,NULL,'Name',250),(916,NULL,NULL,'Operating System',250),(917,NULL,NULL,'Screen Size',250),(918,NULL,NULL,'Storage',250),(919,NULL,NULL,'Memory',250);
/*!40000 ALTER TABLE `es_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category`
--

DROP TABLE IF EXISTS `es_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `CATEGORY_IMAGE` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `VISIBLE` bit(1) DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `DEPTH` int(11) DEFAULT NULL,
  `LINEAGE` varchar(255) DEFAULT NULL,
  `CODE` varchar(100) NOT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK_a7frlr0e1o3tu0s4u7dlntes3` (`PARENT_ID`),
  CONSTRAINT `FK_a7frlr0e1o3tu0s4u7dlntes3` FOREIGN KEY (`PARENT_ID`) REFERENCES `es_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category`
--

LOCK TABLES `es_category` WRITE;
/*!40000 ALTER TABLE `es_category` DISABLE KEYS */;
INSERT INTO `es_category` VALUES (100,NULL,'2015-06-22 21:46:25','2015-12-15 18:36:37',0,'\0',NULL,NULL,NULL,'laptop-tablets','\0'),(150,NULL,'2015-06-22 23:00:57','2015-06-23 18:57:28',0,'\0',NULL,NULL,NULL,'','\0'),(151,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(152,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(153,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(154,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(155,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(156,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(157,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(158,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(159,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(160,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(161,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(162,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(163,NULL,'2015-06-22 23:00:57','2015-06-23 20:58:09',0,'\0',NULL,NULL,NULL,'','\0'),(200,NULL,'2015-06-24 23:55:39','2015-06-25 00:04:34',0,'\0',100,NULL,NULL,'','\0'),(250,NULL,'2015-06-25 00:02:38',NULL,0,'\0',200,NULL,NULL,'','\0'),(300,NULL,'2015-06-25 00:03:53',NULL,0,'\0',200,NULL,NULL,'','\0'),(350,NULL,'2015-06-25 00:04:13',NULL,0,'\0',200,NULL,NULL,'','\0'),(400,NULL,'2015-06-25 00:04:34',NULL,0,'\0',200,NULL,NULL,'','\0'),(450,NULL,'2015-06-25 00:05:33','2015-06-25 00:07:08',0,'\0',100,NULL,NULL,'','\0'),(500,NULL,'2015-06-25 00:06:33',NULL,0,'\0',450,NULL,NULL,'','\0'),(550,NULL,'2015-06-25 00:06:51',NULL,0,'\0',450,NULL,NULL,'','\0'),(600,NULL,'2015-06-25 00:07:08',NULL,0,'\0',450,NULL,NULL,'','\0'),(700,NULL,'2015-12-07 14:53:51','2015-12-07 14:54:24',0,'\0',NULL,NULL,NULL,'testcat',''),(750,NULL,'2015-12-07 14:58:56',NULL,0,'\0',NULL,NULL,NULL,'11',''),(800,NULL,'2015-12-07 17:10:53','2015-12-07 17:11:01',0,'\0',NULL,NULL,NULL,'aa','');
/*!40000 ALTER TABLE `es_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category_description`
--

DROP TABLE IF EXISTS `es_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category_description` (
  `CATEGORY_DESCRIPTION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `LANGUAGE_ID` int(11) DEFAULT NULL,
  `SEF_URL` varchar(120) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_DESCRIPTION_ID`),
  KEY `FK_4lbqovwosjaega59v68v3kcnk` (`CATEGORY_ID`),
  KEY `FK_eykxvwykuk94ssitg8hhv15sw` (`LANGUAGE_ID`),
  CONSTRAINT `FK_4lbqovwosjaega59v68v3kcnk` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `es_category` (`CATEGORY_ID`),
  CONSTRAINT `FK_eykxvwykuk94ssitg8hhv15sw` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `es_language` (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category_description`
--

LOCK TABLES `es_category_description` WRITE;
/*!40000 ALTER TABLE `es_category_description` DISABLE KEYS */;
INSERT INTO `es_category_description` VALUES (50,'Test Description','Laptop & Tablets',100,1,'laptop-&-tablets',NULL,NULL),(100,NULL,'Destop Systems',150,1,'desktop-systems',NULL,NULL),(101,NULL,'Hardware & Parts',151,1,'hardware-&-parts',NULL,NULL),(102,NULL,'Peripherals',152,1,'peripherals',NULL,NULL),(103,NULL,'Storage',153,1,'storage',NULL,NULL),(104,NULL,'Networking',154,1,'networking',NULL,NULL),(105,NULL,'Security',155,1,'security',NULL,NULL),(106,NULL,'Softwares',156,1,'softwares',NULL,NULL),(107,NULL,'Gaming',157,1,'gaming',NULL,NULL),(108,NULL,'Electronics',158,1,'electronics',NULL,NULL),(109,NULL,'Cables & Accessories',159,1,'cables-&-accessories',NULL,NULL),(110,NULL,'Gadgets',160,1,'gadgets',NULL,NULL),(111,NULL,'Mobile Phone Accessories',161,1,'mobile-phone-accessories',NULL,NULL),(112,NULL,'* Clearance *',162,1,'clearance',NULL,NULL),(113,NULL,'All Brands & Brand Stores',163,1,'all-brands-&-brand-stores',NULL,NULL),(150,NULL,'Máy Tính',150,2,'may-tinh',NULL,NULL),(200,NULL,'Laptop & Máy Tính Bảng',100,2,'laptop-&-may-tinh-bang',NULL,NULL),(201,NULL,'Phần Cứng & Linh Kiện',151,2,'phan-cung-&-linh-kien',NULL,NULL),(202,NULL,'Thiết Bị Ngoại Vi',152,2,'thiet-bi-ngoai-vi',NULL,NULL),(203,NULL,'Thiết Bị Lưu Trữ',153,2,'thiet-bi-luu-tru',NULL,NULL),(204,NULL,'Thiết Bị Mạng',154,2,'thiet-bi-mang',NULL,NULL),(205,NULL,'Bảo Mật',155,2,'bao-mat',NULL,NULL),(206,NULL,'Phần Mềm',156,2,'phan-mem',NULL,NULL),(207,NULL,'Thiết Bị Game',157,2,'thiet-bi-game',NULL,NULL),(208,NULL,'Điện Tử',158,2,'dien-tu',NULL,NULL),(209,NULL,'Cáp & Phụ Kiện',159,2,'cap-&-phu-kien',NULL,NULL),(210,NULL,'Phụ Tùng',160,2,'phu-tung',NULL,NULL),(211,NULL,'Phụ Kiện Mobile',161,2,'phu-kien-mobile',NULL,NULL),(212,NULL,'* Xả Hàng *',162,2,'xa-hang',NULL,NULL),(213,NULL,'Tất Cả Nhãn Hiệu & Cửa Hàng',163,2,'tat-ca-nhan-hieu-&-cua-hang',NULL,NULL),(250,NULL,'Laptop Acessories',200,1,'laptop-accessories',NULL,NULL),(300,NULL,'Laptop Bags',250,1,'laptop-bags',NULL,NULL),(350,NULL,'Laptop Batteries',300,1,'laptop-batteries',NULL,NULL),(400,NULL,'Laptop Coolers',350,1,'laptop-coolers',NULL,NULL),(450,NULL,'Laptop Power Adapters',400,1,'laptop-power-adapters',NULL,NULL),(500,NULL,'Portable Storage',450,1,'portable-storage',NULL,NULL),(550,NULL,'Flash Memory Cards',500,1,'flash-memory-cards',NULL,NULL),(600,NULL,'Portable Hard Drives',550,1,'portable-hard-drives',NULL,NULL),(650,NULL,'USB Flash Drives',600,1,'usb-flash-drives',NULL,NULL),(750,'Test cat1','Test cat',700,1,'testcat',NULL,NULL),(800,'11','11',750,1,'11',NULL,NULL),(850,'aa','111',800,1,'aa',NULL,NULL);
/*!40000 ALTER TABLE `es_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_category_product`
--

DROP TABLE IF EXISTS `es_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_category_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `CATEGORY_ID` bigint(20) NOT NULL,
  KEY `FK_tg0niv6hltu7tjrmaphoencv9` (`CATEGORY_ID`),
  KEY `FK_7092q54j4udf03um1o44ycsa3` (`PRODUCT_ID`),
  CONSTRAINT `FK_7092q54j4udf03um1o44ycsa3` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`),
  CONSTRAINT `FK_tg0niv6hltu7tjrmaphoencv9` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `es_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_category_product`
--

LOCK TABLES `es_category_product` WRITE;
/*!40000 ALTER TABLE `es_category_product` DISABLE KEYS */;
INSERT INTO `es_category_product` VALUES (200,100),(250,100),(300,100),(350,100),(400,100),(450,100),(500,100),(550,100),(600,100),(650,100),(700,100),(750,100),(800,100),(850,100),(900,100);
/*!40000 ALTER TABLE `es_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_country`
--

DROP TABLE IF EXISTS `es_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_country` (
  `COUNTRY_ID` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_country`
--

LOCK TABLES `es_country` WRITE;
/*!40000 ALTER TABLE `es_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_customer`
--

DROP TABLE IF EXISTS `es_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_customer` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ANONYMOUS` bit(1) DEFAULT NULL,
  `BILLING_ADDRESS` varchar(255) DEFAULT NULL,
  `BILLING_CITY` varchar(255) DEFAULT NULL,
  `BILLING_COMPANY` varchar(255) DEFAULT NULL,
  `BILLING_STREET_ADDRESS` varchar(255) DEFAULT NULL,
  `BILLING_FIRST_NAME` varchar(255) DEFAULT NULL,
  `BILLING_LAST_NAME` varchar(255) DEFAULT NULL,
  `BILLING` varchar(255) DEFAULT NULL,
  `CUSTOMER_COMPANY` varchar(255) DEFAULT NULL,
  `CUSTOMER_DOB` datetime DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(255) DEFAULT NULL,
  `DELIVERY_CITY` varchar(255) DEFAULT NULL,
  `DELIVERY_COMPANY` varchar(255) DEFAULT NULL,
  `DELIVERY_STREET_ADDRESS` varchar(255) DEFAULT NULL,
  `DELIVERY_FIRST_NAME` varchar(255) DEFAULT NULL,
  `DELIVERY_LAST_NAME` varchar(255) DEFAULT NULL,
  `DELIVERY_PHONE` varchar(255) DEFAULT NULL,
  `CUSTOMER_EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `CUSTOMER_NICK` varchar(255) DEFAULT NULL,
  `CUSTOMER_PASSWORD` varchar(255) DEFAULT NULL,
  `DBILLING_COUNTRY_ID` bigint(20) DEFAULT NULL,
  `DELIVERY_COUNTRY_ID` bigint(20) DEFAULT NULL,
  `CUSTOMER_ENABLE` bit(1) DEFAULT NULL,
  `CUSTOMER_USER_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_FIRST_NAME` varchar(255) DEFAULT NULL,
  `CUSTOMER_LAST_NAME` varchar(255) DEFAULT NULL,
  `billing_company_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `billing_country_id` bigint(20) DEFAULT NULL,
  `billing_phone` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `delivery_company_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  KEY `FK_71yf9jp98fj8sqfsdwndridan` (`DBILLING_COUNTRY_ID`),
  KEY `FK_qp56s5jn5aa52coy7wu3vt22t` (`DELIVERY_COUNTRY_ID`),
  KEY `FK_3tj8nk72rd0o68avyf5e9f8bi` (`billing_country_id`),
  CONSTRAINT `FK_3tj8nk72rd0o68avyf5e9f8bi` FOREIGN KEY (`billing_country_id`) REFERENCES `es_country` (`COUNTRY_ID`),
  CONSTRAINT `FK_71yf9jp98fj8sqfsdwndridan` FOREIGN KEY (`DBILLING_COUNTRY_ID`) REFERENCES `es_country` (`COUNTRY_ID`),
  CONSTRAINT `FK_qp56s5jn5aa52coy7wu3vt22t` FOREIGN KEY (`DELIVERY_COUNTRY_ID`) REFERENCES `es_country` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_customer`
--

LOCK TABLES `es_customer` WRITE;
/*!40000 ALTER TABLE `es_customer` DISABLE KEYS */;
INSERT INTO `es_customer` VALUES (50,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3883-11-10 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'phatnguyentanit@gmail.com','Male',NULL,'$2a$12$a4c6pI9lRZbJCsdrfLJ2vOmIinsV0cD3sH/0K5R8Smb7BUO.KuX3a',NULL,NULL,'','phatnguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(550,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'vinguyen@gmail.com','Female',NULL,'$2a$10$yS1c5LtAJ1vcBAA2CO.iz.YeWhSJB5NGddjcqMGmK2iRmTeyGhgVO',NULL,NULL,'','vinguyen','Vi','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(600,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'datnguyen@gmail.com','Male',NULL,'$2a$10$JwmtqcmzHHO9UD/nMfbgjeSAWTBYb19fWiDSbSPqIbrGwKCjmJJuS',NULL,NULL,'','datnguyen','Dat','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(650,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'longle@gmail.com','Male',NULL,'$2a$10$Cs8XlvaO0VX3ODdqtrzdJeAAkFVKO9A8z6eY35nY4gz8SeIFrcccO',NULL,NULL,'','longnguyen','Long','Le',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(700,'\0','Long An',NULL,NULL,'TMA Solutions','Duc','Bui','083745632',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ducbui@gmail.com','Male',NULL,'$2a$10$/xJSsIbUYn7tflqwEdzcIuCEcHHQ.486toVBYdYXKW6y.NTSthi7C',NULL,NULL,'','ducbui','Duc','Bui',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(750,'\0','My Tho',NULL,NULL,'Axon Active Vietnam','Hang','Nguyen','083647896',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hangnguyen@gmail.com','Female',NULL,'$2a$10$qCipTul/wD935/l032a/wOGKnaRWIki8vWPXCLDWU3Y6IMf.uA5cK',NULL,NULL,'','hangnguyen','Hang','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(850,'\0','District 12, Ho Chi Minh, Vietnam',NULL,NULL,'TMA Solutions','Hong','Nguyen','0909139883',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hongnguye@gmail.com','Female',NULL,'$2a$10$uX7U.2L.8CzKmFvc2r2Ms.q88tMrI0cANomuPAyptyMXyuy7X2L9O',NULL,NULL,'','hongnguyen','Hong','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(900,'\0','Le Duc Tho, Go Vap',NULL,NULL,NULL,'Phat','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'phat@manifera.com','Male',NULL,'$2a$10$IKKBUGEuxTCyBbzNNRT94.QX7o5ZSTbz4vDnTk0WldicQx9SUbgQm',NULL,NULL,'','phatnguyen','Phat','Nguyen','Manifera',NULL,NULL,'22','2015-12-04 18:51:07',NULL,NULL),(901,'\0','BBB',NULL,NULL,NULL,'Test','Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'test@manifera.com','Male',NULL,'$2a$10$H3BmzngazQCxKc3zediMPOAd8MaDKfZSe.Oo7s.qgOpoEbBUX09ci',NULL,NULL,'','testuser01','Test','Test','AAA',NULL,NULL,'2222','2015-12-04 18:52:41',NULL,NULL),(950,'\0','District 12, Ho Chi Minh, Vietnam',NULL,NULL,NULL,'Phat','Nguyen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'phatnguyentanit@gmail.com','Male',NULL,'$2a$10$noPbgiSeE6IhOMS0jettT.B9HIFerrcbr/yQHbpE6DT5qF0UHNVOG',NULL,NULL,'','phat1','Phat','Nguyen','TMA Solutions',NULL,NULL,'0909139883','2016-02-28 12:33:36',NULL,NULL);
/*!40000 ALTER TABLE `es_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_customer_role`
--

DROP TABLE IF EXISTS `es_customer_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_customer_role` (
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`,`ROLE_ID`),
  KEY `FK_6ifiomqe8095vflneuk6a0kpm` (`ROLE_ID`),
  CONSTRAINT `FK_6ifiomqe8095vflneuk6a0kpm` FOREIGN KEY (`ROLE_ID`) REFERENCES `es_role` (`ROLE_ID`),
  CONSTRAINT `FK_castt2q0hdk721lrh774tc8pk` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `es_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_customer_role`
--

LOCK TABLES `es_customer_role` WRITE;
/*!40000 ALTER TABLE `es_customer_role` DISABLE KEYS */;
INSERT INTO `es_customer_role` VALUES (50,50),(550,50),(600,50),(650,50),(700,50),(750,50),(850,50),(900,50),(901,50),(950,50);
/*!40000 ALTER TABLE `es_customer_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_id_gen`
--

DROP TABLE IF EXISTS `es_id_gen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_id_gen` (
  `GEN_NAME` varchar(255) DEFAULT NULL,
  `GEN_VAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_id_gen`
--

LOCK TABLES `es_id_gen` WRITE;
/*!40000 ALTER TABLE `es_id_gen` DISABLE KEYS */;
INSERT INTO `es_id_gen` VALUES ('LANGUAGE_ID',1),('CATEGORY_ID',17),('CATEGORY_DESCRIPTION_ID',18),('ATTRIBUTE_ID',19),('PRODUCT_ID',19),('PRODUCT_ATTRIBUTE_VALUE_ID',18),('PRODUCT_IMAGE_ID',7),('PRODUCT_RELATIONSHIP_ID',3),('CUSTOMER_ID',20),('ROLE_ID',3),('USER_ID',1),('order_id',1),('order_line_id',1),('product_description_id',2);
/*!40000 ALTER TABLE `es_id_gen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_language`
--

DROP TABLE IF EXISTS `es_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_language` (
  `LANGUAGE_ID` int(11) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  PRIMARY KEY (`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_language`
--

LOCK TABLES `es_language` WRITE;
/*!40000 ALTER TABLE `es_language` DISABLE KEYS */;
INSERT INTO `es_language` VALUES (1,'en','2015-06-22 20:28:05',NULL,NULL),(2,'vn','2015-06-22 20:28:05',NULL,NULL);
/*!40000 ALTER TABLE `es_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_order`
--

DROP TABLE IF EXISTS `es_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_order` (
  `ORDER_ID` bigint(20) NOT NULL,
  `CUSTOMER_ID` bigint(20) DEFAULT NULL,
  `ORDER_STATUS_ID` int(11) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_p0a741ofdnfo7gs4cugth1fql` (`CUSTOMER_ID`),
  KEY `FK_c61rjo54cpdqejturoq2i7pkj` (`ORDER_STATUS_ID`),
  CONSTRAINT `FK_c61rjo54cpdqejturoq2i7pkj` FOREIGN KEY (`ORDER_STATUS_ID`) REFERENCES `es_order_status` (`ORDER_STATUS_ID`),
  CONSTRAINT `FK_p0a741ofdnfo7gs4cugth1fql` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `es_customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_order`
--

LOCK TABLES `es_order` WRITE;
/*!40000 ALTER TABLE `es_order` DISABLE KEYS */;
INSERT INTO `es_order` VALUES (1,901,NULL,'PENDING','2015-12-04 18:52:47',NULL),(2,901,NULL,'PENDING','2015-12-05 14:50:22',NULL),(3,901,NULL,'PENDING','2015-12-05 14:50:50',NULL);
/*!40000 ALTER TABLE `es_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_order_line`
--

DROP TABLE IF EXISTS `es_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_order_line` (
  `ORDER_LINE_ID` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `product_product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ORDER_LINE_ID`),
  KEY `FK_k4vj5sdd4nmaeoh3t9cgx01tk` (`ORDER_ID`),
  KEY `FK_rmw1ks79x08rlxtm3h02l2wi6` (`PRODUCT_ID`),
  KEY `FK_jayinf742mrhjxvuoocghpb1d` (`product_product_id`),
  CONSTRAINT `FK_jayinf742mrhjxvuoocghpb1d` FOREIGN KEY (`product_product_id`) REFERENCES `es_product` (`PRODUCT_ID`),
  CONSTRAINT `FK_k4vj5sdd4nmaeoh3t9cgx01tk` FOREIGN KEY (`ORDER_ID`) REFERENCES `es_order` (`ORDER_ID`),
  CONSTRAINT `FK_rmw1ks79x08rlxtm3h02l2wi6` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_order_line`
--

LOCK TABLES `es_order_line` WRITE;
/*!40000 ALTER TABLE `es_order_line` DISABLE KEYS */;
INSERT INTO `es_order_line` VALUES (1,1,1,NULL,NULL,NULL,600),(2,1,2,NULL,NULL,NULL,550),(3,1,3,NULL,NULL,NULL,550);
/*!40000 ALTER TABLE `es_order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_order_status`
--

DROP TABLE IF EXISTS `es_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_order_status` (
  `ORDER_STATUS_ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_order_status`
--

LOCK TABLES `es_order_status` WRITE;
/*!40000 ALTER TABLE `es_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_permission`
--

DROP TABLE IF EXISTS `es_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_permission` (
  `PERMISSION_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_permission`
--

LOCK TABLES `es_permission` WRITE;
/*!40000 ALTER TABLE `es_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product`
--

DROP TABLE IF EXISTS `es_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product` (
  `PRODUCT_ID` bigint(20) NOT NULL,
  `AVAILABLE` bit(1) DEFAULT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `QUANTITY_ORDERED` int(11) DEFAULT NULL,
  `REVIEW_COUNT` int(11) DEFAULT NULL,
  `SKU` varchar(255) DEFAULT NULL,
  `SORT_ORDER` int(11) DEFAULT NULL,
  `PRODUCT_PRICE` decimal(19,2) DEFAULT NULL,
  `CLEARANCE` bit(1) DEFAULT NULL,
  `FEATURED_SELLER` bit(1) DEFAULT NULL,
  `NEW_RELEASE` bit(1) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product`
--

LOCK TABLES `es_product` WRITE;
/*!40000 ALTER TABLE `es_product` DISABLE KEYS */;
INSERT INTO `es_product` VALUES (200,'','2015-07-01 18:25:50','2015-12-24 10:19:52',NULL,NULL,NULL,NULL,2000.00,'','\0','\0','\0'),(250,'','2015-07-02 21:21:00','2015-12-24 10:20:01',NULL,NULL,NULL,NULL,550.00,'','\0','\0','\0'),(300,'','2015-07-02 21:24:41','2015-12-24 10:20:14',NULL,NULL,NULL,NULL,900.00,'','\0','\0','\0'),(350,'','2015-07-02 21:26:01','2015-12-24 10:20:25',NULL,NULL,NULL,NULL,1200.00,'','\0','\0','\0'),(400,'','2015-07-02 21:26:40','2015-12-24 10:20:35',NULL,NULL,NULL,NULL,1500.00,'','','\0','\0'),(450,'','2015-07-02 21:26:41','2015-12-24 10:20:47',NULL,NULL,NULL,NULL,720.00,'','','\0','\0'),(500,'','2015-07-02 21:26:42','2015-12-24 10:21:00',NULL,NULL,NULL,NULL,450.00,'','','\0','\0'),(550,'','2015-07-02 21:26:43','2015-12-24 10:21:12',NULL,NULL,NULL,NULL,810.00,'','','\0','\0'),(600,'','2015-07-02 21:26:44','2015-12-24 10:21:22',NULL,NULL,NULL,NULL,230.00,'','','','\0'),(650,'','2015-07-02 21:26:46','2015-12-24 10:21:32',NULL,NULL,NULL,NULL,650.00,'','','','\0'),(700,'','2015-07-02 21:26:47','2015-12-24 10:21:44',NULL,NULL,NULL,NULL,550.00,'','','','\0'),(750,'','2015-07-02 21:26:48','2015-12-24 10:22:01',NULL,NULL,NULL,NULL,350.00,'','','','\0'),(800,'','2015-07-02 21:26:49','2015-12-24 10:22:16',NULL,NULL,NULL,NULL,800.00,'','','','\0'),(850,'','2015-07-02 21:26:51','2015-12-24 10:22:28',NULL,NULL,NULL,NULL,300.00,'','','','\0'),(900,'','2015-12-15 18:36:37','2015-12-15 18:37:41',NULL,NULL,NULL,NULL,255.00,'\0','\0','\0','\0');
/*!40000 ALTER TABLE `es_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product_attribute`
--

DROP TABLE IF EXISTS `es_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product_attribute` (
  `product_id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`),
  KEY `FK_h6nyfam8ffjl4a1moc1sy9cgc` (`attribute_id`),
  CONSTRAINT `FK_h6nyfam8ffjl4a1moc1sy9cgc` FOREIGN KEY (`attribute_id`) REFERENCES `es_attribute` (`ATTRIBUTE_ID`),
  CONSTRAINT `FK_k5obg5ow7lbyi8m05082bvka8` FOREIGN KEY (`product_id`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product_attribute`
--

LOCK TABLES `es_product_attribute` WRITE;
/*!40000 ALTER TABLE `es_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product_attribute_value`
--

DROP TABLE IF EXISTS `es_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product_attribute_value` (
  `PRODUCT_ATTRIBUTE_VALUE_ID` bigint(20) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `ATTRIBUTE_ID` bigint(20) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ATTRIBUTE_VALUE_ID`),
  KEY `FK_hf3mosq2fbnfwg3u1nhoaoj0i` (`ATTRIBUTE_ID`),
  CONSTRAINT `FK_hf3mosq2fbnfwg3u1nhoaoj0i` FOREIGN KEY (`ATTRIBUTE_ID`) REFERENCES `es_attribute` (`ATTRIBUTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product_attribute_value`
--

LOCK TABLES `es_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `es_product_attribute_value` DISABLE KEYS */;
INSERT INTO `es_product_attribute_value` VALUES (150,'ACER Aspire V5-572P 15.6\" Notebook Intel Core i3 4GB 500GB Win 8 Touch',200,NULL,NULL),(151,'Windows 8',201,NULL,NULL),(152,'Intel Core i3-3227U',202,NULL,NULL),(153,'Intel HM77 Express',203,NULL,NULL),(154,'4GB RAM',204,NULL,NULL),(155,'4GB RAM',205,NULL,NULL),(156,'15.6\" (1366 x 768) Resolution with Touchscreen',206,NULL,NULL),(157,'Intel HD Graphics 4000',207,NULL,NULL),(158,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',208,NULL,NULL),(250,'Toshiba Satellite Pro L50 PSKTBA-002001 15.6\" Notebook i7 6GB 1TB Win7/8.1 Pro',300,NULL,NULL),(251,'Windows 8',301,NULL,NULL),(252,'Intel Core i3-3227U',302,NULL,NULL),(253,'Intel HM77 Express',303,NULL,NULL),(254,'4GB RAM',304,NULL,NULL),(255,'4GB RAM',305,NULL,NULL),(256,'15.6\" (1366 x 768) Resolution with Touchscreen',306,NULL,NULL),(257,'Intel HD Graphics 4000',307,NULL,NULL),(258,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',308,NULL,NULL),(300,'Lenovo B5070 59434410 15.6\" Core i3-4005U 4GB 500GB Windows 7/8.1 Pro',350,NULL,NULL),(301,'Windows 8',351,NULL,NULL),(302,'Intel Core i3-3227U',352,NULL,NULL),(303,'Intel HM77 Express',353,NULL,NULL),(304,'4GB RAM',354,NULL,NULL),(305,'4GB RAM',355,NULL,NULL),(306,'15.6\" (1366 x 768) Resolution with Touchscreen',356,NULL,NULL),(307,'Intel HD Graphics 4000',357,NULL,NULL),(308,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',358,NULL,NULL),(350,'MSI GS70 2QE-001AU Gaming Laptop 17.3\" Core i7 16GB 384GB+1TB GTX970 3GB Win 8.1',400,NULL,NULL),(351,'Windows 8',401,NULL,NULL),(352,'Intel Core i3-3227U',402,NULL,NULL),(353,'Intel HM77 Express',403,NULL,NULL),(354,'4GB RAM',404,NULL,NULL),(355,'4GB RAM',405,NULL,NULL),(356,'15.6\" (1366 x 768) Resolution with Touchscreen',406,NULL,NULL),(357,'Intel HD Graphics 4000',407,NULL,NULL),(358,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',408,NULL,NULL),(400,'HP 250 G3 J8K64PA 15.6\" Notebook Intel Core i3 4GB 500GB Win7 Pro ',450,NULL,NULL),(401,'Windows 8',451,NULL,NULL),(402,'Intel Core i3-3227U',452,NULL,NULL),(403,'Intel HM77 Express',453,NULL,NULL),(404,'4GB RAM',454,NULL,NULL),(405,'4GB RAM',455,NULL,NULL),(406,'15.6\" (1366 x 768) Resolution with Touchscreen',456,NULL,NULL),(407,'Intel HD Graphics 4000',457,NULL,NULL),(408,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',458,NULL,NULL),(450,'ASUS ZENBOOK UX305FA 13.3\" Ultrabook Intel Core M-5Y71 4GB 256GB SSD Win8.1',500,NULL,NULL),(451,'Windows 8',501,NULL,NULL),(452,'Intel Core i3-3227U',502,NULL,NULL),(453,'Intel HM77 Express',503,NULL,NULL),(454,'4GB RAM',504,NULL,NULL),(455,'4GB RAM',505,NULL,NULL),(456,'15.6\" (1366 x 768) Resolution with Touchscreen',506,NULL,NULL),(457,'Intel HD Graphics 4000',507,NULL,NULL),(458,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',508,NULL,NULL),(500,'ASUS Transformer Book T100TAF-BING-DK024B 10.1\" Notebook Atom 2GB 32GB Win 8.1',550,NULL,NULL),(501,'Windows 8',551,NULL,NULL),(502,'Intel Core i3-3227U',552,NULL,NULL),(503,'Intel HM77 Express',553,NULL,NULL),(504,'4GB RAM',554,NULL,NULL),(505,'4GB RAM',555,NULL,NULL),(506,'15.6\" (1366 x 768) Resolution with Touchscreen',556,NULL,NULL),(507,'Intel HD Graphics 4000',557,NULL,NULL),(508,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',558,NULL,NULL),(550,'MSI GE70 2QD-697AU Apache Gaming Laptop 17.3\" Core i7 8GB 1TB GTX950M Win 8.1',600,NULL,NULL),(551,'Windows 8',601,NULL,NULL),(552,'Intel Core i3-3227U',602,NULL,NULL),(553,'Intel HM77 Express',603,NULL,NULL),(554,'4GB RAM',604,NULL,NULL),(555,'4GB RAM',605,NULL,NULL),(556,'15.6\" (1366 x 768) Resolution with Touchscreen',606,NULL,NULL),(557,'Intel HD Graphics 4000',607,NULL,NULL),(558,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',608,NULL,NULL),(600,'MSI CR61 2M-096AU 15.6\" HD Core i5 4GB 500GB Intel HD Graphics Win 7 Pro',650,NULL,NULL),(601,'Windows 8',651,NULL,NULL),(602,'Intel Core i3-3227U',652,NULL,NULL),(603,'Intel HM77 Express',653,NULL,NULL),(604,'4GB RAM',654,NULL,NULL),(605,'4GB RAM',655,NULL,NULL),(606,'15.6\" (1366 x 768) Resolution with Touchscreen',656,NULL,NULL),(607,'Intel HD Graphics 4000',657,NULL,NULL),(608,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',658,NULL,NULL),(650,'Toshiba Satellite Pro L50 PSKTBA-001001 15.6\" Notebook i5 4GB 750GB M260 Win7/8',700,NULL,NULL),(651,'Windows 8',701,NULL,NULL),(652,'Intel Core i3-3227U',702,NULL,NULL),(653,'Intel HM77 Express',703,NULL,NULL),(654,'4GB RAM',704,NULL,NULL),(655,'4GB RAM',705,NULL,NULL),(656,'15.6\" (1366 x 768) Resolution with Touchscreen',706,NULL,NULL),(657,'Intel HD Graphics 4000',707,NULL,NULL),(658,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',708,NULL,NULL),(700,'ASUS ZENBOOK UX305FA 13.3\" Ultrabook Intel Core M-5Y71 4GB 256GB SSD Win8.1',750,NULL,NULL),(701,'Windows 8',751,NULL,NULL),(702,'Intel Core i3-3227U',752,NULL,NULL),(703,'Intel HM77 Express',753,NULL,NULL),(704,'4GB RAM',754,NULL,NULL),(705,'4GB RAM',755,NULL,NULL),(706,'15.6\" (1366 x 768) Resolution with Touchscreen',756,NULL,NULL),(707,'Intel HD Graphics 4000',757,NULL,NULL),(708,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',758,NULL,NULL),(750,'Lenovo B5070 59434406 15.6\" Notebook Core i7-4510U 4GB 500GB Win7/8 Pro',800,NULL,NULL),(751,'Windows 8',801,NULL,NULL),(752,'Intel Core i3-3227U',802,NULL,NULL),(753,'Intel HM77 Express',803,NULL,NULL),(754,'4GB RAM',804,NULL,NULL),(755,'4GB RAM',805,NULL,NULL),(756,'15.6\" (1366 x 768) Resolution with Touchscreen',806,NULL,NULL),(757,'Intel HD Graphics 4000',807,NULL,NULL),(758,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',808,NULL,NULL),(800,'Lenovo T440p 14in i5-4300M 8GB 500GB W7/W8.1P',850,NULL,NULL),(801,'Windows 8',851,NULL,NULL),(802,'Intel Core i3-3227U',852,NULL,NULL),(803,'Intel HM77 Express',853,NULL,NULL),(804,'4GB RAM',854,NULL,NULL),(805,'4GB RAM',855,NULL,NULL),(806,'15.6\" (1366 x 768) Resolution with Touchscreen',856,NULL,NULL),(807,'Intel HD Graphics 4000',857,NULL,NULL),(808,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',858,NULL,NULL),(850,'AAAA',900,'2015-12-15 18:36:35',NULL),(861,'Intel HD Graphics 4000',911,NULL,NULL),(862,'Intel HM77 Express',912,NULL,NULL),(863,'Intel Core i3-3227U',913,NULL,NULL),(864,'Wireless: 802.11 a/g/n Ethernet: 1x 10/100/1000',914,NULL,NULL),(865,'Toshiba Satellite Pro L50 PSKTBA-002001 15.6',915,NULL,NULL),(866,'Windows 8',916,NULL,NULL),(867,'15.6',917,NULL,NULL),(868,'4GB RAM',918,NULL,NULL),(869,'4GB RAM',919,NULL,NULL);
/*!40000 ALTER TABLE `es_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product_description`
--

DROP TABLE IF EXISTS `es_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product_description` (
  `PRODUCT_DESCRIPTION_ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LANGUAGE_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_DESCRIPTION_ID`),
  KEY `FK_7rvh9vmk1whqknwpte4j4pwxu` (`LANGUAGE_ID`),
  KEY `FK_b73xe4hvqgvv6nex7yf4bcl08` (`PRODUCT_ID`),
  CONSTRAINT `FK_7rvh9vmk1whqknwpte4j4pwxu` FOREIGN KEY (`LANGUAGE_ID`) REFERENCES `es_language` (`LANGUAGE_ID`),
  CONSTRAINT `FK_b73xe4hvqgvv6nex7yf4bcl08` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product_description`
--

LOCK TABLES `es_product_description` WRITE;
/*!40000 ALTER TABLE `es_product_description` DISABLE KEYS */;
INSERT INTO `es_product_description` VALUES (1,'Description sample',NULL,1,200,NULL,NULL),(2,'CCC',NULL,1,900,NULL,NULL),(3,'CCC',NULL,1,NULL,NULL,NULL),(50,'',NULL,1,250,NULL,NULL),(51,'',NULL,1,300,NULL,NULL),(52,'',NULL,1,350,NULL,NULL),(53,'',NULL,1,400,NULL,NULL),(54,'',NULL,1,450,NULL,NULL),(55,'',NULL,1,500,NULL,NULL),(56,'',NULL,1,550,NULL,NULL),(57,'',NULL,1,600,NULL,NULL),(58,'',NULL,1,650,NULL,NULL),(59,'',NULL,1,700,NULL,NULL),(60,'',NULL,1,750,NULL,NULL),(61,'',NULL,1,800,NULL,NULL),(62,'',NULL,1,850,NULL,NULL);
/*!40000 ALTER TABLE `es_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product_image`
--

DROP TABLE IF EXISTS `es_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product_image` (
  `PRODUCT_IMAGE_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `IMAGE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `THUMBNAIL` varchar(255) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `IMAGE_SIZE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FK_i2hsu082dl758ma30p3uuke07` (`PRODUCT_ID`),
  CONSTRAINT `FK_i2hsu082dl758ma30p3uuke07` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product_image`
--

LOCK TABLES `es_product_image` WRITE;
/*!40000 ALTER TABLE `es_product_image` DISABLE KEYS */;
INSERT INTO `es_product_image` VALUES (50,NULL,NULL,'ab55105.jpg','1435979538750',NULL,200,'SMALL'),(51,NULL,NULL,'ab55165.jpg','1435979538956',NULL,250,'SMALL'),(52,NULL,NULL,'ab57895.jpg','1435979538959',NULL,300,'SMALL'),(53,NULL,NULL,'ab60365.jpg','1435979538962',NULL,350,'SMALL'),(54,NULL,NULL,'ab62558_3.jpg','1435979538965',NULL,400,'SMALL'),(55,NULL,NULL,'ab62560_4.jpg','1435979538968',NULL,450,'SMALL'),(56,NULL,NULL,'ab55105.jpg','1435979538971',NULL,500,'SMALL'),(57,NULL,NULL,'ab62558_3.jpg','1435979538974',NULL,550,'SMALL'),(58,NULL,NULL,'ab55105.jpg','1435979538978',NULL,600,'SMALL'),(59,NULL,NULL,'ab57895.jpg','1435979538982',NULL,650,'SMALL'),(60,NULL,NULL,'ab55105.jpg','1435979538985',NULL,700,'SMALL'),(61,NULL,NULL,'ab55105.jpg','1435979538990',NULL,750,'SMALL'),(62,NULL,NULL,'ab55105.jpg','1435979538994',NULL,800,'SMALL'),(63,NULL,NULL,'ab57895.jpg','1435979538997',NULL,850,'SMALL'),(200,'2015-07-05 19:40:21',NULL,'ab55105.jpg',NULL,NULL,600,'TINY'),(201,'2015-07-05 19:40:21',NULL,'ab55105_1.jpg',NULL,NULL,600,'TINY'),(202,'2015-07-05 19:40:21',NULL,'ab55105_2.jpg',NULL,NULL,600,'TINY'),(203,'2015-07-05 19:40:21',NULL,'ab55105_3.jpg',NULL,NULL,600,'TINY'),(204,'2015-07-05 19:40:21',NULL,'ab55105_4.jpg',NULL,NULL,600,'TINY'),(205,'2015-07-05 19:40:21',NULL,'ab55105_5.jpg',NULL,NULL,600,'TINY'),(250,'2015-07-06 22:43:17',NULL,'ab60177_2.jpg',NULL,NULL,600,'MEDIUM'),(251,'2015-07-06 22:43:17',NULL,'ab60177_3.jpg',NULL,NULL,600,'MEDIUM'),(252,'2015-07-06 22:43:17',NULL,'ab60177_4.jpg',NULL,NULL,600,'MEDIUM'),(253,'2015-07-06 22:43:17',NULL,'ab60177_5.jpg',NULL,NULL,600,'MEDIUM'),(254,'2015-07-06 22:43:17',NULL,'ab60177_6.jpg',NULL,NULL,600,'MEDIUM'),(255,'2015-07-06 22:43:17',NULL,'ab60177_7.jpg',NULL,NULL,600,'MEDIUM'),(300,'2015-12-15 18:36:36',NULL,'m_null_1450175795786.png','car.png',NULL,900,'MEDIUM'),(301,'2015-12-15 18:36:37',NULL,'b_1450175795786.png','car.png',NULL,900,'BIG'),(302,'2015-12-15 18:36:36',NULL,'t_null_1450175795786.png','car.png',NULL,900,'TINY'),(303,'2015-12-15 18:36:36',NULL,'s_null_1450175795786.png','car.png',NULL,900,'SMALL');
/*!40000 ALTER TABLE `es_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_product_relationship`
--

DROP TABLE IF EXISTS `es_product_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_product_relationship` (
  `PRODUCT_RELATIONSHIP_ID` bigint(20) NOT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `RELATED_PRODUCT_ID` bigint(20) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_RELATIONSHIP_ID`),
  KEY `FK_lo5xdw4kx3nv1nejlhavhenac` (`PRODUCT_ID`),
  KEY `FK_btjny1xn5urh4o5429r6d8fcr` (`RELATED_PRODUCT_ID`),
  CONSTRAINT `FK_btjny1xn5urh4o5429r6d8fcr` FOREIGN KEY (`RELATED_PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`),
  CONSTRAINT `FK_lo5xdw4kx3nv1nejlhavhenac` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_product_relationship`
--

LOCK TABLES `es_product_relationship` WRITE;
/*!40000 ALTER TABLE `es_product_relationship` DISABLE KEYS */;
INSERT INTO `es_product_relationship` VALUES (1,600,200,NULL,NULL),(2,600,250,NULL,NULL),(3,600,300,NULL,NULL),(4,600,350,NULL,NULL),(5,600,400,NULL,NULL),(6,600,450,NULL,NULL),(7,600,500,NULL,NULL),(8,600,550,NULL,NULL),(50,200,200,'2015-12-15 10:46:58',NULL),(51,200,250,'2015-12-15 10:46:58',NULL),(52,200,300,'2015-12-15 10:46:58',NULL),(100,900,250,'2015-12-15 18:37:41',NULL),(101,900,200,'2015-12-15 18:37:41',NULL),(102,250,250,'2015-12-16 12:09:17',NULL),(103,250,200,'2015-12-16 12:09:17',NULL),(104,250,300,'2015-12-16 12:09:17',NULL),(105,250,400,'2015-12-16 12:09:24',NULL),(106,250,350,'2015-12-16 12:09:24',NULL),(107,200,350,'2015-12-16 23:49:39',NULL),(108,200,400,'2015-12-16 23:49:39',NULL);
/*!40000 ALTER TABLE `es_product_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_role`
--

DROP TABLE IF EXISTS `es_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_role` (
  `ROLE_ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_role`
--

LOCK TABLES `es_role` WRITE;
/*!40000 ALTER TABLE `es_role` DISABLE KEYS */;
INSERT INTO `es_role` VALUES (50,'ROLE_CUSTOMER',NULL,NULL),(100,'ROLE_ADMIN',NULL,NULL);
/*!40000 ALTER TABLE `es_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_role_permission`
--

DROP TABLE IF EXISTS `es_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_role_permission` (
  `ROLE_ID` bigint(20) NOT NULL,
  `PERMISSION_ID` bigint(20) NOT NULL,
  KEY `FK_lpwdowetkrxg5fps93ywj48xu` (`PERMISSION_ID`),
  KEY `FK_8mwuim20fdchocd94xtrofgki` (`ROLE_ID`),
  CONSTRAINT `FK_8mwuim20fdchocd94xtrofgki` FOREIGN KEY (`ROLE_ID`) REFERENCES `es_role` (`ROLE_ID`),
  CONSTRAINT `FK_lpwdowetkrxg5fps93ywj48xu` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `es_permission` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_role_permission`
--

LOCK TABLES `es_role_permission` WRITE;
/*!40000 ALTER TABLE `es_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_shopping_cart`
--

DROP TABLE IF EXISTS `es_shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_shopping_cart` (
  `SHOPPING_CART_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `SHOPPING_CART_CODE` varchar(255) NOT NULL,
  PRIMARY KEY (`SHOPPING_CART_ID`),
  UNIQUE KEY `UK_kn4w0xp86y31i5sg1hj3q8bhe` (`SHOPPING_CART_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_shopping_cart`
--

LOCK TABLES `es_shopping_cart` WRITE;
/*!40000 ALTER TABLE `es_shopping_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_shopping_cart_item`
--

DROP TABLE IF EXISTS `es_shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_shopping_cart_item` (
  `SHOPPING_CART_ITEM_ID` bigint(20) NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_MODIFIED` datetime DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `SHOPPING_CART_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SHOPPING_CART_ITEM_ID`),
  UNIQUE KEY `UK_h9sg8xmieq7l6waloa6kg832q` (`PRODUCT_ID`),
  KEY `FK_6gp57y3nn9ktjl9n3yt26rtn7` (`SHOPPING_CART_ID`),
  CONSTRAINT `FK_6gp57y3nn9ktjl9n3yt26rtn7` FOREIGN KEY (`SHOPPING_CART_ID`) REFERENCES `es_shopping_cart` (`SHOPPING_CART_ID`),
  CONSTRAINT `FK_h9sg8xmieq7l6waloa6kg832q` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `es_product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_shopping_cart_item`
--

LOCK TABLES `es_shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `es_shopping_cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_student`
--

DROP TABLE IF EXISTS `es_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_student` (
  `STUDENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_student`
--

LOCK TABLES `es_student` WRITE;
/*!40000 ALTER TABLE `es_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `es_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_user`
--

DROP TABLE IF EXISTS `es_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_user` (
  `USER_ID` bigint(20) NOT NULL,
  `ADMIN_NAME` varchar(255) DEFAULT NULL,
  `ADMIN_PASSWORD` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_ACCESS` datetime DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `LOGIN_ACCESS` datetime DEFAULT NULL,
  `ADMIN_USER_NAME` varchar(255) DEFAULT NULL,
  `ADMIN_EMAIL_ADDRESS` varchar(255) DEFAULT NULL,
  `CUSTOMER_ENABLE` bit(1) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_user`
--

LOCK TABLES `es_user` WRITE;
/*!40000 ALTER TABLE `es_user` DISABLE KEYS */;
INSERT INTO `es_user` VALUES (1,NULL,'$2a$10$rMSBcxUMkDcTZQZCYx2BeeTFh2sLwemGiSxKeGSp050.UyFehKe7C','Phat',NULL,'Nguyen',NULL,'admin','admin@gmail.com','',NULL,NULL);
/*!40000 ALTER TABLE `es_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `es_user_role`
--

DROP TABLE IF EXISTS `es_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `es_user_role` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK_ql867wf71dsve3q2s5310a46k` (`ROLE_ID`),
  KEY `FK_kafgn840ry790566loticop4n` (`USER_ID`),
  CONSTRAINT `FK_kafgn840ry790566loticop4n` FOREIGN KEY (`USER_ID`) REFERENCES `es_user` (`USER_ID`),
  CONSTRAINT `FK_ql867wf71dsve3q2s5310a46k` FOREIGN KEY (`ROLE_ID`) REFERENCES `es_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `es_user_role`
--

LOCK TABLES `es_user_role` WRITE;
/*!40000 ALTER TABLE `es_user_role` DISABLE KEYS */;
INSERT INTO `es_user_role` VALUES (1,100);
/*!40000 ALTER TABLE `es_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'myeshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-16 23:24:26

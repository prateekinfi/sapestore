-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sapestore
--

CREATE DATABASE IF NOT EXISTS sapestore;
USE sapestore;

--
-- Definition of table `book_rent`
--

DROP TABLE IF EXISTS `book_rent`;
CREATE TABLE `book_rent` (
  `book_rent_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `is_returned` bit(1) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `is_late_fee_paid` bit(1) DEFAULT NULL,
  PRIMARY KEY (`book_rent_id`),
  KEY `FKe6xfapmm2vx199xlnmc6tswuy` (`isbn`),
  KEY `FKt1x509xtyewif4k5vq95jhpnh` (`user_id`),
  KEY `FKrka54gyx67lus5j9dtq4huck0` (`order_id`),
  CONSTRAINT `FKe6xfapmm2vx199xlnmc6tswuy` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`),
  CONSTRAINT `FKrka54gyx67lus5j9dtq4huck0` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`),
  CONSTRAINT `FKt1x509xtyewif4k5vq95jhpnh` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_rent`
--

/*!40000 ALTER TABLE `book_rent` DISABLE KEYS */;
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (598,'2018-04-05 15:26:23',0x01,'2018-04-05 18:15:46','2018-03-31 15:29:21','2220000000000',99,1256,0x01),
 (599,'2018-04-05 15:26:23',0x01,'2018-04-05 18:17:43','2018-03-31 15:29:21','9580000000000',99,1256,0x01),
 (610,'2018-04-05 18:21:50',0x01,'2018-04-06 10:05:34','2018-05-05 00:00:00','9470000000000',137,1278,0x01),
 (611,'2018-04-05 18:21:50',0x01,'2018-04-05 18:22:31','2018-05-05 00:00:00','9880000000000',137,1278,0x01),
 (612,'2018-04-05 18:21:50',0x01,'2018-04-06 15:09:25','2018-05-05 00:00:00','9782000000000',137,1278,0x01),
 (613,'2018-04-05 18:24:02',0x01,'2018-04-06 15:10:30','2018-05-05 00:00:00','9220000000000',137,1279,0x01),
 (614,'2018-04-05 18:24:02',0x01,'2018-04-06 10:21:34','2018-05-05 00:00:00','1170000000000',137,1279,0x01),
 (615,'2018-04-06 09:46:29',0x01,'2018-04-06 10:05:37','2018-05-06 00:00:00','9470000000000',99,1284,0x01),
 (616,'2018-04-06 09:50:18',0x01,'2018-04-06 11:29:30','2018-05-06 00:00:00','1170000000000',99,1288,0x01);
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (617,'2018-04-06 10:05:37',0x01,'2018-04-06 11:01:50','2018-05-06 00:00:00','1170000000000',137,1298,0x01),
 (618,'2018-04-06 11:08:56',0x01,'2018-04-06 11:28:12','2018-05-06 00:00:00','1170000000000',137,1309,0x01),
 (619,'2018-04-06 11:37:29',0x01,'2018-04-06 15:09:28','2018-05-06 00:00:00','9639000000000',137,1313,0x01),
 (620,'2018-04-06 11:37:29',0x00,'2018-04-06 19:35:41','2018-05-06 00:00:00','9782000000000',137,1313,0x01),
 (621,'2018-04-06 12:10:26',0x01,'2018-04-06 19:35:41','2018-05-06 00:00:00','9360000000000',137,1320,0x01),
 (622,'2018-04-06 12:10:26',0x00,'2018-04-06 19:35:41','2018-05-06 00:00:00','2220000000000',137,1320,0x01),
 (623,'2018-04-06 12:10:26',0x00,'2018-04-06 19:35:41','2018-05-06 00:00:00','1170000000000',137,1320,0x01),
 (624,'2018-04-06 12:13:50',0x01,'2018-04-06 14:44:57','2018-05-06 00:00:00','9220000000000',137,1321,0x01),
 (625,'2018-04-06 12:13:50',0x00,'2018-04-06 14:44:57','2018-05-06 00:00:00','9639000000000',137,1321,0x01);
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (626,'2018-04-06 12:21:16',0x01,'2018-04-06 13:00:50','2018-05-06 00:00:00','9360000000000',137,1322,0x01),
 (627,'2018-04-06 12:32:14',0x01,'2018-04-06 14:39:01','2018-04-08 12:34:56','9638000000000',137,1323,0x01),
 (628,'2018-04-06 12:38:10',0x01,'2018-04-06 13:21:02','2018-04-04 12:41:12','9560000000000',137,1324,0x01),
 (629,'2018-04-06 12:55:33',0x01,'2018-04-06 13:01:34','2018-04-04 12:58:48','9220000000000',137,1325,0x01),
 (630,'2018-04-06 12:55:33',0x01,'2018-04-06 13:15:51','2018-04-04 12:58:48','9560000000000',137,1325,0x01),
 (631,'2018-04-06 14:47:18',0x00,'2018-04-06 14:57:48','2018-04-07 14:49:57','9560000000000',137,1331,0x01),
 (632,'2018-04-06 14:47:18',0x01,'2018-04-06 15:10:26','2018-04-07 14:49:57','9638000000000',137,1331,0x01),
 (633,'2018-04-06 15:45:41',0x01,'2018-04-06 16:30:28','2018-04-07 16:11:46','123',137,1336,0x00),
 (634,'2018-04-06 15:45:41',0x00,'2018-04-06 19:35:41','2018-04-07 16:11:46','9580000000000',137,1336,0x01);
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (635,'2018-04-06 16:34:47',0x01,'2018-04-09 12:47:17','2018-05-06 00:00:00','5560000000000',137,1350,0x01),
 (636,'2018-04-06 19:30:50',0x00,'2018-04-06 19:52:37','2018-04-07 19:52:37','95812',139,1358,0x00),
 (637,'2018-04-06 19:30:50',0x00,'2018-04-06 19:52:37','2018-04-07 19:52:37','9220000000000',139,1358,0x01),
 (638,'2018-04-06 19:30:50',0x00,'2018-04-06 19:52:37','2018-04-07 19:52:37','9780000000000',139,1358,0x01),
 (639,'2018-04-06 19:30:50',0x00,'2018-04-06 19:52:37','2018-04-07 19:52:37','2220000000000',139,1358,0x01),
 (640,'2018-04-06 19:30:52',0x01,'2018-04-09 12:46:44','2018-05-06 00:00:00','95812',139,1359,0x01),
 (641,'2018-04-06 19:30:52',0x01,'2018-04-09 12:47:21','2018-05-06 00:00:00','9220000000000',139,1359,0x01),
 (642,'2018-04-06 19:30:52',0x01,'2018-04-09 12:46:47','2018-05-06 00:00:00','9780000000000',139,1359,0x01),
 (643,'2018-04-06 19:30:52',0x01,'2018-04-09 12:46:49','2018-05-06 00:00:00','2220000000000',139,1359,0x01);
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (644,'2018-04-06 19:34:27',0x01,'2018-04-09 10:13:49','2018-05-06 00:00:00','95812',139,1360,0x01),
 (645,'2018-04-06 19:34:27',0x01,'2018-04-09 12:47:24','2018-05-06 00:00:00','9360000000000',139,1360,0x01),
 (646,'2018-04-07 09:33:14',0x01,'2018-04-09 12:46:20','2018-05-07 00:00:00','9360000000000',5,1369,0x01),
 (647,'2018-04-09 09:53:57',0x01,'2018-04-09 10:31:52','2018-04-10 09:54:59','5454000000000',5,1374,0x00),
 (648,'2018-04-09 10:03:36',0x01,'2018-04-09 10:48:57','2018-05-09 00:00:00','5560000000000',5,1376,0x01),
 (649,'2018-04-09 10:07:22',0x01,'2018-04-09 12:47:49','2018-04-10 10:39:48','9350000000000',137,1377,0x01),
 (650,'2018-04-09 10:18:04',0x01,'2018-04-09 12:47:52','2018-04-10 10:18:38','1170000000000',155,1379,0x01),
 (651,'2018-04-09 10:20:43',0x01,'2018-04-09 12:14:08','2018-05-09 00:00:00','7777777777777',155,1380,0x01),
 (652,'2018-04-09 10:21:06',0x00,'2018-04-09 10:28:43','2018-04-07 10:24:13','9350000000000',137,1381,0x01);
INSERT INTO `book_rent` (`book_rent_id`,`created_date`,`is_returned`,`last_modified_date`,`return_date`,`isbn`,`user_id`,`order_id`,`is_late_fee_paid`) VALUES 
 (653,'2018-04-09 10:21:06',0x01,'2018-04-09 17:11:13','2018-04-07 10:24:13','7777777777777',137,1381,0x01),
 (654,'2018-04-09 10:36:23',0x01,'2018-04-09 11:47:25','2018-05-09 00:00:00','9781473647770',10,1386,0x01),
 (655,'2018-04-09 10:42:08',0x00,'2018-04-09 10:42:42','2018-04-07 10:42:42','9780141359151',155,1387,0x00),
 (656,'2018-04-09 10:42:08',0x01,'2018-04-09 17:10:23','2018-04-07 10:42:42','9781473647770',155,1387,0x00),
 (657,'2018-04-09 10:47:16',0x01,'2018-04-09 12:46:51','2018-05-09 00:00:00','7777777777777',19,1388,0x01),
 (658,'2018-04-09 11:02:32',0x00,'2018-04-09 11:46:27','2018-04-07 11:06:01','7777777777777',19,1391,0x01),
 (659,'2018-04-09 12:43:58',0x01,'2018-04-09 12:44:38','2018-04-10 12:44:38','7777777777777',165,1423,0x01),
 (660,'2018-04-09 12:51:56',0x01,'2018-04-09 12:59:06','2018-04-11 12:59:06','9780141359151',155,1425,0x01),
 (661,'2018-04-09 13:00:24',0x01,'2018-04-09 16:16:34','2018-04-11 13:01:55','9820000000000',155,1426,0x01);
/*!40000 ALTER TABLE `book_rent` ENABLE KEYS */;


--
-- Definition of table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `isbn` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `average_rating` float DEFAULT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `full_image` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `late_fees` double DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `rent_price` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `short_desc` varchar(255) DEFAULT NULL,
  `thumb_image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`isbn`),
  KEY `FK8el3ddb59ciucupyc17vu7835` (`category_id`),
  CONSTRAINT `FK8el3ddb59ciucupyc17vu7835` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('0132335530000','Douglas E Commer',0,'The Internet Book','2018-04-06 17:22:21','0132335530000full.jpg','2018-04-06 17:22:21',12,'Commer Publishers.',50,720,'Internet Book, The: Everything You Need to Know About Computer Networking and How the Internet Works','0132335530000thumb.jpg',4),
 ('1170000000000','Ranjan Rajveer',4.83,'MESSI : Superstar In Dreams','2018-04-05 10:51:56','1170000000000full.jpg','2018-04-09 17:57:15',25,'Veer Publishing & Co.',75,800,'Messi: More Than a Superstar by Luca Caioli is a biography about the world-class soccer player, Lionel Messi. The book begins with his birth and slowly guides the reader through the life of the star and love of his life','1170000000000thumb.jpg',12),
 ('123','Bjarne Stroustrup',4.5,'C++ Programming Language','2018-03-29 15:56:45','123full.jpg','2018-04-09 17:57:15',0,'David Thomas',30,300,'C book','123thumb.jpg',1),
 ('123111','Robert T Kiyosaki',0,'T Rich Dad Poor Dad','2018-04-09 11:31:07','123111full.jpg','2018-04-09 11:31:07',20,'APC Publishers',45,450,'RichDadPoorDad','123111thumb.jpg',1);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('2220000000000','Rachel Renee Russell',4.67,'Dork Diaries 1','2018-03-20 17:08:00','2220000000000full.jpg','2018-04-09 17:57:15',9,'Lady Pippin Publishing',94,978,'book of the New York Times bestselling Dork Diaries series.','2220000000000thumb.jpg',3),
 ('2399000000000','Amit Saraf',0,'Manufacturing','2018-04-06 17:55:11','2399000000000full.jpg','2018-04-06 17:55:11',12,'ABP Publishers',12,120,'To make this subject easy & interesting main concentration is given on concepts and tries to explain the concepts with proper method.','2399000000000thumb.jpg',11),
 ('3111','Karl Marks',0,'T Das Kapital','2018-04-09 11:31:09','3111full.jpg','2018-04-09 11:31:09',20,'Rupa Publication',5,55,'DasKapital','3111thumb.jpg',1),
 ('3216540000','Zidane',5,'Cristiano Ronaldo: Four Times Ballon d\'Or Champion','2018-04-09 12:10:37','3216540000full.jpg','2018-04-09 17:57:15',255,'Mess Mess Messi Publications',956,9674,'Cristiano Ronaldo dos Santos Aveiro GOIH, ComM is a Portuguese professional footballer who plays as a forward for Spanish club Real Madrid and the Portugal national team','3216540000thumb.jpg',12),
 ('3620000000000','Walter Isaacson',5,'Steve Jobs','2018-03-20 17:08:00','3620000000000full.jpg','2018-04-09 17:57:15',5,'Academic Press',60,666,'Based on more than forty interviews with Jobs conducted over two years','3620000000000thumb.jpg',14);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('5454000000000','Christina Baker Kline',0,'Orphan Train','2018-03-29 14:31:52','5454000000000full.jpg','2018-03-29 14:36:02',16,'William Morrow Paperbacks',43,434,'The author of Bird in Hand and The Way Life Should Be delivers her most ambitious and powerful novel to date: a captivating story of two very different women who build an unexpected friendship','5454000000000thumb.jpg',8),
 ('5560000000000','Nayantara Shehgal',3.5,'A Voice of Freedom','2018-03-20 17:08:00','5560000000000full.jpg','2018-04-09 17:57:15',9,'W W Norton and co Inc.',75,786,'Voice of Freedom is a participatory photography project in Israel for formerly trafficked women.','5560000000000thumb.jpg',1),
 ('7777000000000','Nagi Maehashi',0,'The Food Photography','2018-04-06 17:19:32','7777000000000full.jpg','2018-04-06 17:19:32',10,'Meaghan Cook Press',22,230,'This book will not only inspire you to be a better photographer, but it will actually make you one','7777000000000thumb.jpg',5),
 ('7777777777777','M N Dutt',3.75,'Mahabharat','2018-04-06 18:00:43','7777777777777full.jpg','2018-04-09 17:57:15',100,'New Indian Books',120,1200,'The Mahabharata is a curious mixture of history and mythology','7777777777777thumb.jpg',10);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('787700000000','Robert T Kiyosaki',0,'Rich Dad Poor Dad','2018-04-06 17:32:21','787700000000full.jpg','2018-04-06 17:32:21',2,'APC Publishers',12,120,'Rich Dad Poor Dad is a 1997 book written by Robert Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy','787700000000thumb.jpg',2),
 ('789456','Robin Sharma',4.5,'Monk Who Sold His Ferrari','2018-04-06 15:37:47','789456full.jpg','2018-04-09 17:57:15',50,'HarperSanFrancisco',12,123,'goodbook','789456thumb.jpg',8),
 ('8888000000000','Andre Bazin',4.5,'What is Cinema?','2018-04-06 17:17:02','8888000000000full.jpg','2018-04-09 17:57:15',10,'University of California Press',23,230,'Andr Bazin\'s What Is Cinema? (volumes I and II) have been classics of film studies for as long as they\'ve been available','8888000000000thumb.jpg',9),
 ('9110000000000','Paulo Coelho',0,'The Zaheer','2018-03-20 17:08:00','9110000000000full.jpg','2018-03-29 14:36:02',9,'Harper Collins',75,764,'A guide book or travel guide is \"a book of information about a place, designed for the use of visitors or tourists','9110000000000thumb.jpg',8);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9150000000000','Mulkraj Anand',0,'Coolie','2018-03-20 17:08:00','9150000000000full.jpg','2018-03-29 14:36:02',8,'Harper Collins',64,654,'Coolie is a novel by Mulk Raj Anand first published in 1936','9150000000000thumb.jpg',8),
 ('9210000000000','Karl Marks',0,'Das Kapital','2018-03-20 17:08:00','9210000000000full.jpg','2018-04-06 17:39:33',8,'Rupa Publication',64,654,'It is a critical analysis of political economy','9210000000000thumb.jpg',7),
 ('9220000000000','Ram Mohan Roy',0,'A Gift of Monotheists','2018-03-20 17:08:00','9220000000000full.jpg','2018-03-29 14:36:03',7,'iUniverse',35,450,'A cart or barrow from which apples and other fruit are sold in the street.','9220000000000thumb.jpg',7),
 ('9350000000000','R. Kippling',5,'Jungle Book','2018-03-20 17:08:00','9350000000000full.jpg','2018-04-09 17:57:15',8,'Academic Press',63,677,'The Jungle Book (1894) is a collection of stories by English Nobel laureate Rudyard Kipling.','9350000000000thumb.jpg',8),
 ('9360000000000','G. B. Shaw',4.5,'Apple Cart','2018-03-20 17:08:00','9360000000000full.jpg','2018-04-09 17:57:15',7,'Maple Press',35,450,'A cart or barrow from which apples and other fruit are sold in the street.','9360000000000thumb.jpg',8);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9470000000000','Maxim Gorkay',0,'Mother Mother','2018-03-20 17:08:00','9470000000000full.jpg','2018-04-06 16:56:37',1,'Maple Press',17,220,'The definition can also be extended to non-\',\'Dteail about test book','9470000000000thumb.jpg',8),
 ('9560000000000','Jawahar Lal Nehru',0,'The Discovery of India','2018-03-20 17:08:00','9560000000000full.jpg','2018-04-06 16:45:53',1,'Kogan Page',19,212,'In The Discovery of India','9560000000000thumb.jpg',7),
 ('9580000000000','Surendra Nath Bandhopadhye',0,'A Nation is Making','2018-03-20 17:08:00','9580000000000full.jpg','2018-04-06 16:56:37',3,'Harpel Perennial',20,222,'A nation in making; Being the reminiscences of fifty years of public life','9580000000000thumb.jpg',7),
 ('95812','Helen Keller',4.5,'The Story of My Life','2018-04-06 15:41:02','95812full.jpg','2018-04-09 17:57:15',20,'Bharati Bhavan',5,55,'The Story of My Life, first published in 1903.','95812thumb.jpg',8),
 ('9630000000000','Charls Dikens',0,'A Tale of Two Cities','2018-03-20 17:08:00','9630000000000full.jpg','2018-04-06 16:41:00',7,'South Asia Books',40,444,'A guide book or travel guide is \"a book of information about a place, designed for the use of visitors or tourists','9630000000000thumb.jpg',8);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9638000000000','R. K. Narayanan',0,'Guide','2018-03-20 17:08:00','9638000000000full.jpg','2018-04-06 16:41:09',8,'Star Publication',64,786,'A guide book or travel guide is \"a book of information about a place, designed for the use of visitors or tourists','9638000000000thumb.jpg',8),
 ('9639000000000','Arthur Cotterell',4.5,'A History of Southeast Asia','2018-03-20 17:08:00','9639000000000full.jpg','2018-04-09 17:57:15',9,'South Asia Books',92,977,'A guide book or travel guide is \"a book of information about a place, designed for the use of visitors or tourists\".[1] Travel guides can also take the form of travel websites.','9639000000000thumb.jpg',1),
 ('9700000000000','Ronald,John,Rafal,Jonathan',0,'Access Contest','2018-03-20 17:08:00','9700000000000full.jpg','2018-04-06 16:50:26',7,'Kogan Page',78,793,'A daily battle for rights and freedoms in cyberspace is being waged in Asia.','9700000000000thumb.jpg',11),
 ('9729000000000','Nancy Buckingham',3.67,'Tell Me Why #1','2018-03-20 17:08:00','9729000000000full.jpg','2018-04-09 17:57:15',7,'Penguin books',74,342,'The world we knew is gone.','9729000000000thumb.jpg',1);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9780000000000','Rolf Dobelli',4.25,'The Art of Thinking Clearly','2018-03-20 17:08:00','9780000000000full.jpg','2018-04-09 17:57:15',2,'AA Publishing',41,444,'The Art of Thinking Clearly by world-class thinker and entrepreneur Rolf Dobelli is an eye-opening look at human psychology and reasoning.','9780000000000thumb.jpg',8),
 ('9780000000067','Ken Blanchard',0.5,'The One Minute Manager','2018-04-06 17:14:20','9780000000067full.jpg','2018-04-09 17:57:15',10,'William Morrow & Co',60,600,'The One Minute Manager is a very short book by Ken Blanchard and Spencer Johnson.','9780000000067thumb.jpg',2),
 ('978013233559','Olivier Hersent',0,'The Internet Of Things','2018-04-06 17:27:10','978013233559full.jpg','2018-04-06 17:27:10',2,'Wiley India',6.33,64.99,'This book describes the Home Area Networking, Building Automation and AMI protocols and their evolution towards open protocols based on IP.','978013233559thumb.jpg',4),
 ('9780141359151','John Green',5,'The Fault in Our Stars','2018-04-03 18:28:06','9780141359151full.jpg','2018-04-09 17:57:15',50,'Penguin Books',37.25,374.25,'The Fault in Our Stars is award-winning author John Green\'s most ambitious work','9780141359151thumb.jpg',8);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9781473647770','David Perlmutter',5,'Grain Brain','2018-03-29 14:34:03','9781473647770full.jpg','2018-04-09 17:57:15',23,'Penguin Books',23,952,'Its about gluten intolerance, a gluten free diet or the foods that help improve brain health.','9781473647770thumb.jpg',6),
 ('9782000000000','Ramesh Chandra Dutta',0,'Economic History of India','2018-03-20 17:08:00','9782000000000full.jpg','2018-04-06 16:56:37',7,'Perason India',71,737,'Egeon, a merchant of Syracuse, is condemned to death in Ephesus for violating the ban against travel between the two rival cities. ','9782000000000thumb.jpg',7),
 ('9788177091878','H C Verma',5,'Concepts of Physics 1','2018-03-29 17:09:19','9788177091878full.jpg','2018-04-09 17:57:15',50,'Bharati Bhawan Publishers & Distributors',50,540,'This book is a gem for IIT JEE and AIEEE aspirants who have completed 10th standard.','9788177091878thumb.jpg',1),
 ('9820000000000','Katharin Mayo',4.75,'Mother India','2018-03-20 17:08:00','9820000000000full.jpg','2018-04-09 17:57:16',2,'AA Publishing',22,630,'It is the story of a poverty-stricken village woman named Radha','9820000000000thumb.jpg',8);
INSERT INTO `books` (`isbn`,`author`,`average_rating`,`book_title`,`created_date`,`full_image`,`last_modified_date`,`late_fees`,`publisher`,`rent_price`,`sell_price`,`short_desc`,`thumb_image`,`category_id`) VALUES 
 ('9880000000000','John',4.5,'Rafa','2018-03-20 17:08:00','9880000000000full.jpg','2018-04-09 11:23:39',8,'Kogan Page',62,645,'Egeon, a merchant of Syracuse, is condemned to death in Ephesus for violating the ban against travel between the two rival cities.','9880000000000thumb.jpg',12),
 ('9900010011112','William Shakespeare',4.5,'As You Like It','2018-04-06 15:17:24','9900010011112full.jpg','2018-04-09 11:23:39',10,'Bharti Bhavan',20,340,'As You Like It is a pastoral comedy by William Shakespeare','9900010011112thumb.jpg',8),
 ('9960000000000','John Milton',3.75,'Paradise Lost','2018-03-20 17:08:00','9960000000000full.jpg','2018-04-09 11:23:39',2,'BelGrave house',20,631,'A guide book or travel guide is \"a book of information about a place, designed for the use of visitors or tourists\".[1] Travel guides can also take the form of travel websites.','9960000000000thumb.jpg',10);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


--
-- Definition of table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE `cart_details` (
  `cart_details_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) DEFAULT NULL,
  `purchase_type` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_details_id`),
  KEY `FKmckpnoiba7pi881nfdjmghnnm` (`cart_id`),
  CONSTRAINT `FKmckpnoiba7pi881nfdjmghnnm` FOREIGN KEY (`cart_id`) REFERENCES `user_cart` (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1245 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart_details`
--

/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` (`cart_details_id`,`isbn`,`purchase_type`,`quantity`,`cart_id`) VALUES 
 (20,'234567800000',0,8,5),
 (25,'9880000000000',1,1,7),
 (78,'9960000000000',0,3,9),
 (79,'9782000000000',1,1,9),
 (80,'9880000000000',0,1,9),
 (81,'9470000000000',0,1,9),
 (407,'9782000000000',1,1,4),
 (422,'9470000000000',1,1,33),
 (1034,'9780000000000',1,1,28),
 (1035,'9900010011112',1,1,28),
 (1170,'3111',1,1,8),
 (1231,'9780141359151',1,1,24),
 (1232,'9638000000000',1,1,1),
 (1233,'9560000000000',1,1,1),
 (1234,'9960000000000',1,1,1),
 (1235,'9880000000000',1,1,1),
 (1236,'123',0,1,1),
 (1242,'9470000000000',1,1,48),
 (1243,'3216540000',1,1,48),
 (1244,'9960000000000',1,1,16);
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`,`category_name`,`created_date`,`last_modified_date`) VALUES 
 (1,'Academic and Professional','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (2,'Business and Management','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (3,'Comics and Graphic Novels','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (4,'Computers and Internet','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (5,'Food and Wine','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (6,'Health','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (7,'History and Politics','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (8,'Literature and Fiction','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (9,'Music Films and Entertainment','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (10,'Religion and Spirituality','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (11,'Science and Technology','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (12,'Sports and Games','2018-03-20 21:16:11','2018-03-20 21:16:11'),
 (14,'Biography','2018-04-06 17:36:47','2018-04-06 17:36:47');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK6p2u50v8fg2y0js6djc6xanit` (`state_id`),
  CONSTRAINT `FK6p2u50v8fg2y0js6djc6xanit` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (1,'Bellflower','2018-03-20 16:01:00','2018-03-20 16:01:00','90706',3),
 (2,'Avon Park','2018-03-20 16:01:00','2018-03-20 16:01:00','33825',1),
 (3,'Palo Alto ','2018-03-20 16:01:00','2018-03-20 16:01:00','94020',2),
 (4,'Los Angeles','2018-03-20 16:01:00','2018-03-20 16:01:00','90001',2),
 (5,'Tallahassee','2018-03-20 16:01:00','2018-03-20 16:01:00','32301',1),
 (6,'Bell','2018-03-20 16:01:00','2018-03-20 16:01:00','90040',1),
 (7,'Cape Coral','2018-03-20 16:01:00','2018-03-20 16:01:00','33903',1),
 (8,'Eatonville','2018-03-20 16:01:00','2018-03-20 16:01:00','98328',1),
 (9,'Esto','2018-03-20 16:01:00','2018-03-20 16:01:00','32425',1),
 (10,'Gretna','2018-03-20 16:01:00','2018-03-20 16:01:00','70053',1),
 (11,'Hollywood','2018-03-20 16:01:00','2018-03-20 16:01:00','90028',1),
 (12,'Lake Mary','2018-03-20 16:01:00','2018-03-20 16:01:00','32746',1),
 (13,'Margate','2018-03-20 16:01:00','2018-03-20 16:01:00','33063',1),
 (14,'Moody','2018-03-20 16:01:00','2018-03-20 16:01:00','35004',3);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (15,'McMullen','2018-03-20 16:01:00','2018-03-20 16:01:00','78007',3),
 (16,'Leeds','2018-03-20 16:01:00','2018-03-20 16:01:00','35094',3),
 (17,'Irondale','2018-03-20 16:01:00','2018-03-20 16:01:00','35210',3),
 (18,'Geneva','2018-03-20 16:01:00','2018-03-20 16:01:00','60134',3),
 (19,'Florala','2018-03-20 16:01:00','2018-03-20 16:01:00','36442',3),
 (20,'Cardiff','2018-03-20 16:01:00','2018-03-20 16:01:00','92007',3),
 (21,'Troy','2018-03-20 16:01:00','2018-03-20 16:01:00','48007',3),
 (22,'San Francisco','2018-03-20 16:01:00','2018-03-20 16:01:00','94016',2),
 (23,'San Jose','2018-03-20 16:01:00','2018-03-20 16:01:00','94088',2),
 (24,'Long Beach','2018-03-20 16:01:00','2018-03-20 16:01:00','90712',2),
 (25,'Orange','2018-03-20 16:01:00','2018-03-20 16:01:00','92705',2),
 (26,'Redding','2018-03-20 16:01:00','2018-03-20 16:01:00','96001',3),
 (27,'Corona','2018-03-20 16:01:00','2018-03-20 16:01:00','92877',2),
 (28,'Santa Cruz','2018-03-20 16:01:00','2018-03-20 16:01:00','95060',2);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (29,'Napa','2018-03-20 16:01:00','2018-03-20 16:01:00','94558',2),
 (30,'Dothan','2018-03-20 16:01:00','2018-03-20 16:01:00','36301',2),
 (31,'Sugar Land','2018-03-20 16:01:00','2018-03-20 16:01:00','77478',4),
 (32,'McKinney','2018-03-20 16:01:00','2018-03-20 16:01:00','75013',4),
 (33,'Conroe','2018-03-20 16:01:00','2018-03-20 16:01:00','77301',4),
 (34,'Denton','2018-03-20 16:01:00','2018-03-20 16:01:00','75065',4),
 (35,'Allen','2018-03-20 16:01:00','2018-03-20 16:01:00','75002',4),
 (36,'Elephant','2018-03-20 16:01:00','2018-03-20 16:01:00','87935',4),
 (37,'Tyler','2018-03-20 16:01:00','2018-03-20 16:01:00','75701',4),
 (38,'San Marcos','2018-03-20 16:01:00','2018-03-20 16:01:00','92024',4),
 (39,'Abilene','2018-03-20 16:01:00','2018-03-20 16:01:00','79601',4),
 (40,'Abilene','2018-03-20 16:01:00','2018-03-20 16:01:00','79601',4),
 (41,'Newark','2018-03-20 16:01:00','2018-03-20 16:01:00','71010',5),
 (42,'Atlantic City','2018-03-20 16:01:00','2018-03-20 16:01:00','82010',5);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (43,'Jersey City','2018-03-20 16:01:00','2018-03-20 16:01:00','73990',5),
 (44,'Trenton','2018-03-20 16:01:00','2018-03-20 16:01:00','86010',5),
 (45,'Hoboken','2018-03-20 16:01:00','2018-03-20 16:01:00','70300',5),
 (46,'Princeton','2018-03-20 16:01:00','2018-03-20 16:01:00','85440',5),
 (47,'Paterson','2018-03-20 16:01:00','2018-03-20 16:01:00','75220',5),
 (48,'Paramus','2018-03-20 16:01:00','2018-03-20 16:01:00','76530',5),
 (49,'Jackson Township','2018-03-20 16:01:00','2018-03-20 16:01:00','85270',5),
 (50,'Livingston','2018-03-20 16:01:00','2018-03-20 16:01:00','77351',5),
 (51,'Hughes','2018-03-20 16:01:00','2018-03-20 16:01:00','72348',6),
 (52,'Bettles','2018-03-20 16:01:00','2018-03-20 16:01:00','99726',6),
 (53,'Wales','2018-03-20 16:01:00','2018-03-20 16:01:00','10810',6),
 (54,'Ruby','2018-03-20 16:01:00','2018-03-20 16:01:00','22545',6),
 (55,'Hydaburg','2018-03-20 16:01:00','2018-03-20 16:01:00','99922',6),
 (56,'Noorvik','2018-03-20 16:01:00','2018-03-20 16:01:00','99763',6);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (57,'Gambell','2018-03-20 16:01:00','2018-03-20 16:01:00','90040',6),
 (58,'Selawik','2018-03-20 16:01:00','2018-03-20 16:01:00','33903',6),
 (59,'Craig','2018-03-20 16:01:00','2018-03-20 16:01:00','98328',6),
 (60,'Petersburg','2018-03-20 16:01:00','2018-03-20 16:01:00','32425',6),
 (61,'Auburn','2018-03-20 16:01:00','2018-03-20 16:01:00','70053',7),
 (62,'Hampton','2018-03-20 16:01:00','2018-03-20 16:01:00','90028',7),
 (63,'Clarkston','2018-03-20 16:01:00','2018-03-20 16:01:00','32746',7),
 (64,'Garden City','2018-03-20 16:01:00','2018-03-20 16:01:00','33063',7),
 (65,'Thomaston','2018-03-20 16:01:00','2018-03-20 16:01:00','35004',7),
 (66,'Cedartown','2018-03-20 16:01:00','2018-03-20 16:01:00','78007',7),
 (67,'Vidalia','2018-03-20 16:01:00','2018-03-20 16:01:00','35094',7),
 (68,'Cairo','2018-03-20 16:01:00','2018-03-20 16:01:00','35210',7),
 (69,'dallas','2018-03-20 16:01:00','2018-03-20 16:01:00','60134',7),
 (70,'Bainbridge','2018-03-20 16:01:00','2018-03-20 16:01:00','36442',7);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (71,'Bedford','2018-03-20 16:01:00','2018-03-20 16:01:00','92007',8),
 (72,'Columbia City','2018-03-20 16:01:00','2018-03-20 16:01:00','48007',8),
 (73,'Columbus','2018-03-20 16:01:00','2018-03-20 16:01:00','94016',8),
 (74,'Delphi','2018-03-20 16:01:00','2018-03-20 16:01:00','94088',8),
 (75,'Frankfort','2018-03-20 16:01:00','2018-03-20 16:01:00','90712',8),
 (76,'Franklin','2018-03-20 16:01:00','2018-03-20 16:01:00','92705',8),
 (77,'Greensburg','2018-03-20 16:01:00','2018-03-20 16:01:00','96001',8),
 (78,'Hobart','2018-03-20 16:01:00','2018-03-20 16:01:00','92877',8),
 (79,'Lawrenceburg','2018-03-20 16:01:00','2018-03-20 16:01:00','95060',8),
 (80,'Linton','2018-03-20 16:01:00','2018-03-20 16:01:00','94558',8),
 (81,'ada','2018-03-20 16:01:00','2018-03-20 16:01:00','36301',9),
 (82,'Avon Park','2018-03-20 16:01:00','2018-03-20 16:01:00','77478',9),
 (83,'Bellbrook','2018-03-20 16:01:00','2018-03-20 16:01:00','75013',9),
 (84,'Bellevue','2018-03-20 16:01:00','2018-03-20 16:01:00','77301',9);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (85,'Brooklyn','2018-03-20 16:01:00','2018-03-20 16:01:00','75065',9),
 (86,'Brookville','2018-03-20 16:01:00','2018-03-20 16:01:00','75002',9),
 (87,'Cambridge','2018-03-20 16:01:00','2018-03-20 16:01:00','87935',9),
 (88,'Campbell','2018-03-20 16:01:00','2018-03-20 16:01:00','75701',9),
 (89,'Canfield','2018-03-20 16:01:00','2018-03-20 16:01:00','92024',9),
 (90,'Cheviot','2018-03-20 16:01:00','2018-03-20 16:01:00','79601',9),
 (91,'Warren','2018-03-20 16:01:00','2018-03-20 16:01:00','79601',10),
 (92,'Lansing','2018-03-20 16:01:00','2018-03-20 16:01:00','71013',10),
 (93,'Dearborn','2018-03-20 16:01:00','2018-03-20 16:01:00','36442',10),
 (94,'Livonia','2018-03-20 16:01:00','2018-03-20 16:01:00','92007',10),
 (95,'Canton','2018-03-20 16:01:00','2018-03-20 16:01:00','48007',10),
 (96,'Macomb','2018-03-20 16:01:00','2018-03-20 16:01:00','94016',10),
 (97,'Southfield','2018-03-20 16:01:00','2018-03-20 16:01:00','94088',10),
 (98,'Shelby','2018-03-20 16:01:00','2018-03-20 16:01:00','90712',10);
INSERT INTO `city` (`city_id`,`city_name`,`created_date`,`last_modified_date`,`postal_code`,`state_id`) VALUES 
 (99,'Westland','2018-03-20 16:01:00','2018-03-20 16:01:00','92720',10),
 (100,'Flint','2018-03-20 16:01:00','2018-03-20 16:01:00','96001',10);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`,`country_name`,`created_date`,`last_modified_date`) VALUES 
 (1,'USA','2018-03-19 23:58:38','2018-03-20 16:01:00');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `unique_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `is_for_purchase` bit(1) DEFAULT NULL,
  `is_for_rent` bit(1) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  `rent_quantity` int(11) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unique_no`),
  KEY `FKocp9rqsnv1we54njqgpgegu1r` (`isbn`),
  CONSTRAINT `FKocp9rqsnv1we54njqgpgegu1r` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` (`unique_no`,`created_date`,`is_for_purchase`,`is_for_rent`,`last_modified_date`,`purchase_quantity`,`rent_quantity`,`isbn`) VALUES 
 (1,'2018-03-24 16:15:16',0x01,0x01,'2018-04-06 17:23:38',30,48,'2220000000000'),
 (2,'2018-03-26 16:44:41',0x01,0x01,'2018-04-09 10:18:48',15,6,'3620000000000'),
 (3,'2018-03-26 16:44:41',0x01,0x01,'2018-04-09 10:18:59',9,3,'5560000000000'),
 (4,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 16:43:30',100,100,'9110000000000'),
 (5,'2018-03-26 16:44:41',0x01,0x01,'2018-03-26 16:44:41',10,4,'9150000000000'),
 (6,'2018-03-26 16:44:41',0x01,0x01,'2018-03-26 16:44:41',10,5,'9210000000000'),
 (7,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 16:45:19',10,8,'9220000000000'),
 (8,'2018-03-26 16:44:41',0x01,0x01,'2018-04-09 10:23:34',193,100,'9350000000000'),
 (9,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 16:46:10',300,197,'9360000000000'),
 (10,'2018-03-26 16:44:41',0x01,0x01,'2018-04-09 16:16:05',1,10,'9470000000000'),
 (12,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 16:45:53',100,100,'9560000000000'),
 (14,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:03:31',12,22,'9580000000000');
INSERT INTO `inventory` (`unique_no`,`created_date`,`is_for_purchase`,`is_for_rent`,`last_modified_date`,`purchase_quantity`,`rent_quantity`,`isbn`) VALUES 
 (15,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:05:52',80,50,'9630000000000'),
 (17,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 16:20:46',58,60,'9638000000000'),
 (18,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:03:51',88,296,'9639000000000'),
 (19,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:06:23',10,50,'9700000000000'),
 (21,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 10:06:59',7,4,'9729000000000'),
 (22,'2018-03-26 16:44:41',0x01,0x01,'2018-04-06 10:06:47',10,4,'9780000000000'),
 (23,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:04:09',211,327,'9782000000000'),
 (24,'2018-03-26 16:44:41',0x01,0x01,'2018-04-05 16:05:32',88,49,'9820000000000'),
 (25,'2018-03-26 16:44:42',0x01,0x01,'2018-04-05 16:04:22',0,19,'9880000000000'),
 (26,'2018-03-26 16:44:42',0x01,0x01,'2018-04-05 16:04:52',17,10,'9960000000000'),
 (35,'2018-03-29 14:31:52',0x01,0x01,'2018-04-09 09:57:24',3,4,'5454000000000'),
 (36,'2018-03-29 14:34:03',0x01,0x01,'2018-03-29 14:34:03',117,97,'9781473647770');
INSERT INTO `inventory` (`unique_no`,`created_date`,`is_for_purchase`,`is_for_rent`,`last_modified_date`,`purchase_quantity`,`rent_quantity`,`isbn`) VALUES 
 (42,'2018-03-29 15:56:45',0x01,0x01,'2018-04-09 09:57:10',999,37,'123'),
 (43,'2018-03-29 17:09:19',0x01,0x01,'2018-04-04 11:44:13',997,500,'9788177091878'),
 (67,'2018-04-03 18:28:06',0x01,0x01,'2018-04-06 18:23:57',396,98,'9780141359151'),
 (84,'2018-04-05 10:51:56',0x01,0x01,'2018-04-09 10:18:15',96,31,'1170000000000'),
 (126,'2018-04-06 15:17:24',0x01,0x01,'2018-04-06 15:17:24',1000,500,'9900010011112'),
 (131,'2018-04-06 15:37:47',0x01,0x01,'2018-04-06 15:37:47',55,65,'789456'),
 (134,'2018-04-06 15:41:02',0x01,0x01,'2018-04-06 15:41:02',24,22,'95812'),
 (140,'2018-04-06 17:14:20',0x01,0x01,'2018-04-06 17:14:20',100,100,'9780000000067'),
 (141,'2018-04-06 17:17:02',0x01,0x01,'2018-04-06 17:17:02',100,200,'8888000000000'),
 (142,'2018-04-06 17:19:32',0x01,0x01,'2018-04-06 17:19:32',100,50,'7777000000000'),
 (143,'2018-04-06 17:22:21',0x00,0x00,'2018-04-09 16:59:20',0,0,'0132335530000'),
 (144,'2018-04-06 17:27:10',0x01,0x01,'2018-04-06 17:27:10',100,100,'978013233559');
INSERT INTO `inventory` (`unique_no`,`created_date`,`is_for_purchase`,`is_for_rent`,`last_modified_date`,`purchase_quantity`,`rent_quantity`,`isbn`) VALUES 
 (145,'2018-04-06 17:32:21',0x01,0x01,'2018-04-06 17:32:21',100,100,'787700000000'),
 (146,'2018-04-06 17:55:11',0x01,0x01,'2018-04-06 17:55:11',100,100,'2399000000000'),
 (147,'2018-04-06 18:00:43',0x01,0x01,'2018-04-06 18:00:43',100,93,'7777777777777'),
 (159,'2018-04-09 11:31:07',0x01,0x01,'2018-04-09 11:31:07',25,25,'123111'),
 (160,'2018-04-09 11:31:09',0x01,0x01,'2018-04-09 11:31:09',25,25,'3111'),
 (161,'2018-04-09 12:10:37',0x01,0x01,'2018-04-09 12:10:37',324,65,'3216540000');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_verified` bit(1) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `token_generated_date` datetime DEFAULT NULL,
  `token_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `UK_mdn86t4w3fej4iei71lv79w6f` (`user_name`),
  KEY `FK5ajtethlf6rmcnipoat0r1qrb` (`user_id`),
  CONSTRAINT `FK5ajtethlf6rmcnipoat0r1qrb` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (1,'2018-03-22 13:14:58',0x00,0x00,'2018-03-22 13:42:07',NULL,'2018-03-22 13:42:07','5ae3eac2-d9a4-4500-a47c-78b8280dc210','vsanse','8B64D2451B7A8F3FD17390F88EA35917',1),
 (2,'2018-03-22 13:42:34',0x00,0x00,'2018-04-03 19:14:33',NULL,'2018-04-03 19:14:33','e669f352-9879-4594-aadb-7e88c20da9f8','vishu','3FC0A7ACF087F549AC2B266BAF94B8B1',2),
 (3,'2018-03-22 13:43:05',0x00,0x00,'2018-03-28 12:25:06',NULL,NULL,NULL,'vishalmujumdar','A0E2842A48F4B678D1E9A5872C07BD6D',3),
 (4,'2018-03-22 13:57:51',0x00,0x00,'2018-03-24 18:51:30',NULL,'2018-03-24 18:51:30','0d1d9685-3ea7-4532-ab59-32d22b1dd257','ksha','25D55AD283AA400AF464C76D713C07AD',4),
 (5,'2018-03-22 17:02:57',0x00,0x01,'2018-04-09 15:01:06',NULL,'2018-04-06 09:19:36','8657ecc6-675e-468c-872d-fd2957db69f2','prachithapliyal10@gmail.com','368C601C9D0D574764E425ECC8EEF60A',5),
 (6,'2018-03-22 17:07:44',0x00,0x00,'2018-03-27 16:14:27',NULL,'2018-03-27 16:14:27','3040a581-d6ea-44e7-a622-af9e5eee42f5','a','4124BC0A9335C27F086F24BA207A4912',6);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (7,'2018-03-22 17:18:26',0x00,0x00,'2018-03-22 17:18:26',NULL,NULL,NULL,'navu','09B80A86065734F0C58BEFDD30E80E8F',7),
 (8,'2018-03-23 08:39:55',0x00,0x00,'2018-03-23 08:39:55',NULL,NULL,NULL,'xx','4A8A08F09D37B73795649038408B5F33',8),
 (9,'2018-03-23 09:26:47',0x00,0x00,'2018-03-23 09:26:47',NULL,NULL,NULL,'j','7B774EFFE4A349C6DD82AD4F4F21D34C',9),
 (10,'2018-03-23 09:30:49',0x00,0x01,'2018-04-09 11:06:44',NULL,'2018-04-09 10:33:09','025bb77c-7c63-444d-916b-c2ff06d01410','absvgdf','368C601C9D0D574764E425ECC8EEF60A',10),
 (11,'2018-03-23 09:33:51',0x00,0x00,'2018-03-27 15:12:38',NULL,'2018-03-27 15:12:38','95a3fc1d-c05d-4ca8-9eb7-7b6a38e4ef83','p','83878C91171338902E0FE0FB97A8C47A',11),
 (12,'2018-03-23 10:30:07',0x00,0x00,'2018-03-23 10:30:07',NULL,NULL,NULL,'test','97EED2A2741515AC3F659C5F63D4EB7A',14),
 (13,'2018-03-23 10:29:48',0x00,0x00,'2018-04-02 16:12:09',NULL,'2018-04-02 16:12:09','75912277-6a2a-40fc-8552-9bbc526a5b57','thakur','95F70335C1E28EB9F01E3DCA665187FF',15),
 (14,'2018-03-23 10:35:04',0x00,0x00,'2018-04-02 16:12:21',NULL,'2018-04-02 16:12:21','9e6803eb-dd17-4f42-a719-cad36f63e3f2','ad','0CC175B9C0F1B6A831C399E269772661',16);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (15,'2018-03-23 10:36:26',0x00,0x00,'2018-03-23 10:36:26',NULL,NULL,NULL,'7','03C7C0ACE395D80182DB07AE2C30F034',18),
 (16,'2018-03-23 10:38:20',0x00,0x01,'2018-04-09 10:17:12',NULL,'2018-04-04 14:24:05','8fb9b9c7-2af8-41cc-bb89-404fafed2f26','shreya','25F9E794323B453885F5181F1B624D0B',19),
 (18,'2018-03-23 10:59:22',0x00,0x00,'2018-04-03 23:06:02',NULL,'2018-04-03 23:06:02','071f6d0c-c1d4-41a2-9444-65072f554120','q','0AB7FACF236F7A9FD08B9A57D4FC10EE',22),
 (19,'2018-03-23 11:43:14',0x00,0x00,'2018-03-23 11:43:14',NULL,NULL,NULL,'l','2DB95E8E1A9267B7A1188556B2013B33',23),
 (20,'2018-03-23 12:40:17',0x00,0x00,'2018-03-28 14:20:49',NULL,'2018-03-28 14:20:49','6f7c3e1e-0d02-4baa-b73d-e6aa94bb6618','vb','E9AD559F94FBA77B26482D168E0A6908',24),
 (21,'2018-03-23 12:55:48',0x00,0x01,'2018-04-09 14:09:35',NULL,'2018-04-04 11:47:28','08846efb-5a51-428a-af5b-d5c4da9d9dc6','aditya.dobhal','25F9E794323B453885F5181F1B624D0B',26),
 (23,'2018-03-23 13:01:02',0x00,0x00,'2018-03-23 13:01:02',NULL,NULL,NULL,'adi','099B3B060154898840F0EBDFB46EC78F',28);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (24,'2018-03-23 14:35:06',0x00,0x00,'2018-03-26 10:42:30',NULL,'2018-03-26 10:42:30','bf3f6675-c764-4122-a675-93a942792884','aaaa','578D5AD6D436B446A5DB03A558112DDF',30),
 (25,'2018-03-23 16:09:34',0x00,0x00,'2018-04-02 14:13:21',NULL,'2018-04-02 14:13:21','50ab5f5a-e7e9-44ec-b088-bc52fdc3c666','sakshi','773E306FD551975CD27E40FCC0FBE3A3',31),
 (26,'2018-03-23 16:14:37',0x00,0x00,'2018-03-26 14:26:15',NULL,'2018-03-26 14:26:15','a73c7280-3e31-4c0a-902a-a1cac8d62319','ab','0CC175B9C0F1B6A831C399E269772661',33),
 (27,'2018-03-23 16:16:06',0x00,0x00,'2018-03-26 14:26:16',NULL,'2018-03-26 14:26:16','c22e233a-fdf2-47aa-9db3-849e26f33b96','abc','0CC175B9C0F1B6A831C399E269772661',34),
 (28,'2018-03-23 18:30:35',0x00,0x00,'2018-03-23 18:30:35',NULL,NULL,NULL,'sagar','11E83F0F17A13ACCF02A837B5D563E2C',35),
 (29,'2018-03-23 19:12:17',0x00,0x00,'2018-03-23 19:12:17',NULL,NULL,NULL,'pgar','prateek123',37),
 (30,'2018-03-24 17:23:43',0x00,0x00,'2018-04-09 16:32:54',NULL,'2018-04-02 16:12:06','de44cee1-aba9-4ee7-9d1a-d59cea087f55','thakursagar','B4078C14FBCB7B3EF69A5F915A753D5B',38);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (31,'2018-03-24 18:17:55',0x00,0x00,'2018-03-24 18:17:55',NULL,NULL,NULL,'mehran','78E9C8087EB1516F5ACF58A36DAF6194',39),
 (32,'2018-03-24 18:51:54',0x00,0x00,'2018-03-24 18:51:54',NULL,NULL,NULL,'asdas','B4078C14FBCB7B3EF69A5F915A753D5B',40),
 (33,'2018-03-26 09:17:23',0x00,0x00,'2018-04-04 13:59:25',NULL,NULL,NULL,'PrachiThapliyal','1A01B667D658BC8DDADDC296909BDC36',41),
 (34,'2018-03-26 09:46:58',0x00,0x01,'2018-04-02 14:32:05',NULL,'2018-04-02 14:31:31','9af6c2f2-cddc-4774-90d3-32b486beee60','veersrish101','0659C7992E268962384EB17FAFE88364',42),
 (35,'2018-03-26 09:51:45',0x00,0x00,'2018-04-09 16:18:36',NULL,'2018-04-05 09:37:15','6ac85218-a1a3-41ae-a3f5-9042e2ac230a','tgarg9','ED4E7298B1F3F1A3E233E7385E788D85',43),
 (36,'2018-03-26 09:55:25',0x00,0x00,'2018-03-26 10:44:54',NULL,'2018-03-26 10:44:54','dd132eae-6464-441e-82a2-4bf511ab2ed8','kladha','25D55AD283AA400AF464C76D713C07AD',44),
 (37,'2018-03-26 10:43:01',0x00,0x00,'2018-03-26 19:53:25',NULL,'2018-03-26 19:53:25','f45d1d8f-2d97-4a53-a6ac-86e2fd50b110','abcdefghijklmnopqrstuvwxyz','CBF11C02FAED18AD0BB69BD6285178F5',48);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (38,'2018-03-26 10:45:21',0x00,0x00,'2018-04-09 14:25:41',NULL,'2018-04-09 09:29:05','32670fb1-6341-426a-b4e5-b3cc92756efd','sapient','691EC91F8FC238EDEE46CDE1E4731402',49),
 (39,'2018-03-26 10:43:43',0x00,0x00,'2018-03-28 14:18:03',NULL,NULL,NULL,'vbisht','E9AD559F94FBA77B26482D168E0A6908',50),
 (40,'2018-03-26 10:43:47',0x00,0x00,'2018-04-03 09:28:16',NULL,'2018-04-03 09:28:16','d394f471-8aff-4dab-8bf7-1be23defe085','SHREYA1','F430D1F5D67E8DA6A429A0417A537E1C',51),
 (41,'2018-03-26 10:44:50',0x00,0x00,'2018-03-26 10:46:19',NULL,'2018-03-26 10:46:19','61bccbfc-8915-47d8-8cb1-202ae3264e7b','tseth1','ED4E7298B1F3F1A3E233E7385E788D85',52),
 (42,'2018-03-26 10:46:11',0x00,0x00,'2018-03-26 10:54:40',NULL,'2018-03-26 10:54:40','9a7a58ce-183d-4608-99b0-cbb41b954f04','aditya','442E0AA812E5C50C41A8726EC6AF8870',53),
 (43,'2018-03-26 10:46:24',0x00,0x00,'2018-04-09 17:17:54',NULL,NULL,NULL,'pallavi','25F9E794323B453885F5181F1B624D0B',54);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (44,'2018-03-26 11:32:41',0x00,0x00,'2018-03-28 16:20:22',NULL,NULL,NULL,'vyad5','25D55AD283AA400AF464C76D713C07AD',57),
 (45,'2018-03-26 11:32:53',0x00,0x00,'2018-03-26 11:32:53',NULL,NULL,NULL,'aaaaaa','442E0AA812E5C50C41A8726EC6AF8870',58),
 (46,'2018-03-26 12:10:31',0x00,0x00,'2018-03-26 12:10:31',NULL,NULL,NULL,'prateek','25D55AD283AA400AF464C76D713C07AD',59),
 (47,'2018-03-26 12:35:37',0x00,0x00,'2018-03-26 16:05:27',NULL,NULL,NULL,'aditya10','25D55AD283AA400AF464C76D713C07AD',60),
 (48,'2018-03-26 14:00:44',0x00,0x00,'2018-03-26 14:00:44',NULL,NULL,NULL,'salsalal','7DD8C8E30FDC70F1A7CD8E7BD62395D0',61),
 (49,'2018-03-26 14:22:54',0x00,0x00,'2018-03-26 14:22:54',NULL,NULL,NULL,'stanuj','613A9001C83F9C13F6630EBAD3BACF00',62),
 (50,'2018-03-26 14:35:19',0x00,0x00,'2018-03-26 14:35:19',NULL,NULL,NULL,'Razorfish','767FE49694D7CF668F47D717C49B9E13',63),
 (51,'2018-03-26 15:00:20',0x00,0x00,'2018-04-03 11:25:30',NULL,'2018-04-03 11:25:30','a9c48118-b20a-4831-b844-1255b8739651','vikas','25D55AD283AA400AF464C76D713C07AD',64);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (52,'2018-03-26 15:01:59',0x00,0x00,'2018-03-26 15:01:59',NULL,NULL,NULL,'vikas1','25D55AD283AA400AF464C76D713C07AD',65),
 (53,'2018-03-26 15:03:56',0x00,0x00,'2018-03-26 15:03:56',NULL,NULL,NULL,'vikas12','25D55AD283AA400AF464C76D713C07AD',66),
 (54,'2018-03-26 15:05:19',0x00,0x00,'2018-03-26 15:05:19',NULL,NULL,NULL,'vikas2','25D55AD283AA400AF464C76D713C07AD',67),
 (55,'2018-03-26 16:17:00',0x00,0x00,'2018-03-26 20:21:00',NULL,NULL,NULL,'abcde','578D5AD6D436B446A5DB03A558112DDF',68),
 (56,'2018-03-26 16:54:55',0x00,0x00,'2018-03-26 16:54:55',NULL,NULL,NULL,'sap_digitas','482C811DA5D5B4BC6D497FFA98491E38',69),
 (57,'2018-03-26 17:13:58',0x00,0x00,'2018-03-26 17:13:58',NULL,NULL,NULL,'testUser','25DF916B353D4BA24E3B2731F55CA882',70),
 (58,'2018-03-26 19:43:47',0x00,0x00,'2018-03-26 19:43:47',NULL,NULL,NULL,'abcdefghijklmnopqrstuvwxyz1','F06F2B64EE918E735C50678F5FF066F2',71),
 (60,'2018-03-27 11:08:43',0x00,0x01,'2018-04-06 11:06:01',NULL,'2018-04-03 12:28:56','36b2a99b-f674-47e3-9419-66d4b4268cb3','abhan95','1FFDBC3EB59E4BA0755DB58CEF169778',77);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (61,'2018-03-27 12:07:06',0x00,0x00,'2018-03-27 12:07:06',NULL,NULL,NULL,'abcdeabcdeabcdeabcdeabcdea','25D55AD283AA400AF464C76D713C07AD',78),
 (62,'2018-03-27 13:54:06',0x00,0x00,'2018-03-28 10:20:32',NULL,'2018-03-28 10:20:32','4194476e-dbb6-4563-8fa7-04ee0eb06573','prachi','D8398E38E4A54822B964134AEAA2E165',79),
 (63,'2018-03-27 14:53:05',0x00,0x00,'2018-03-29 14:36:50',NULL,NULL,NULL,'prachi10','0BCBBF73E55E58DF87527A6D406D0FA9',80),
 (64,'2018-03-27 15:13:55',0x00,0x00,'2018-03-27 15:13:55',NULL,NULL,NULL,'prachi101','0BCBBF73E55E58DF87527A6D406D0FA9',81),
 (65,'2018-03-27 17:11:23',0x00,0x00,'2018-03-27 17:11:23',NULL,NULL,NULL,'keshav1234','DD9D21E22391090DDCE7C6ED58C6412D',82),
 (66,'2018-03-28 08:50:25',0x00,0x00,'2018-04-03 12:45:22',NULL,'2018-04-03 11:50:58','33bc3f94-aabb-473f-a262-f189c4fa2892','khushi123','B4F1AD4EFAD256223FCB6126F9BD7385',83),
 (67,'2018-03-28 09:06:49',0x00,0x00,'2018-03-28 09:06:49',NULL,NULL,NULL,'khushi1','25D55AD283AA400AF464C76D713C07AD',84);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (68,'2018-03-28 09:21:43',0x00,0x00,'2018-03-28 09:21:43',NULL,NULL,NULL,'aditi123','2B6AF4C5A1A6387FD6FBFF6C7089A76D',85),
 (69,'2018-03-28 09:52:46',0x00,0x00,'2018-03-28 09:52:46',NULL,NULL,NULL,'vyad6','25D55AD283AA400AF464C76D713C07AD',86),
 (70,'2018-03-28 09:57:10',0x00,0x00,'2018-04-02 16:22:36',NULL,'2018-04-02 16:22:36','f1f9487b-e78a-47e7-80e2-94dba0c4d82e','henry','25F9E794323B453885F5181F1B624D0B',87),
 (71,'2018-03-28 09:58:53',0x00,0x00,'2018-03-28 09:58:53',NULL,NULL,NULL,'vyad7','25D55AD283AA400AF464C76D713C07AD',88),
 (72,'2018-03-28 09:59:58',0x00,0x00,'2018-03-28 10:09:10',NULL,'2018-03-28 10:09:10','a2dc17b3-a6d9-4632-a4ea-ca321c93ab24','sunaina','25F9E794323B453885F5181F1B624D0B',89),
 (73,'2018-03-28 10:09:16',0x00,0x00,'2018-03-28 10:09:16',NULL,NULL,NULL,'bhavana','25F9E794323B453885F5181F1B624D0B',90),
 (74,'2018-03-28 10:12:59',0x00,0x00,'2018-03-28 10:12:59',NULL,NULL,NULL,'prachi111','1A01B667D658BC8DDADDC296909BDC36',91);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (75,'2018-03-28 10:20:55',0x00,0x00,'2018-04-02 15:34:23',NULL,NULL,NULL,'prach11','1A01B667D658BC8DDADDC296909BDC36',92),
 (76,'2018-03-28 10:31:37',0x00,0x00,'2018-04-03 09:31:54',NULL,'2018-04-03 09:31:54','3ebfde62-6d4f-4dab-a426-0062f69b1fca','ajain','25F9E794323B453885F5181F1B624D0B',93),
 (79,'2018-03-28 10:57:24',0x00,0x00,'2018-03-28 10:57:24',NULL,NULL,NULL,'qazwsx','8A9170C42EFFA2F6B3346818338D8EE3',96),
 (80,'2018-03-28 12:48:59',0x00,0x00,'2018-03-28 12:52:22',NULL,'2018-03-28 12:52:22','237b8bd2-3468-4aa8-a3c0-12372ce3a205','12','578D5AD6D436B446A5DB03A558112DDF',97),
 (81,'2018-03-28 13:24:25',0x00,0x00,'2018-03-28 13:24:25',NULL,NULL,NULL,'rsingla','359C95FC5A9652CD47C265F556FDE987',98),
 (82,'2018-03-28 14:21:41',0x00,0x00,'2018-04-09 16:28:41',NULL,'2018-04-06 16:52:05','76e76444-e467-42bd-a187-6923ce12c17e','vb123','00F7FC67CB14BD9BB6ABF6385EA59F34',99),
 (83,'2018-03-28 14:32:59',0x00,0x00,'2018-03-28 14:32:59',NULL,NULL,NULL,'vb1234','68F43C8272E5B808FB0B2A0EEFF46D1F',100);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (84,'2018-03-28 15:07:44',0x00,0x00,'2018-03-28 15:08:15',NULL,NULL,NULL,'prachi222','FC9BDFA11BEBA02131E2DB8CFF35DF47',101),
 (87,'2018-03-28 16:00:56',0x00,0x00,'2018-03-28 16:00:56',NULL,NULL,NULL,'addddd','25D55AD283AA400AF464C76D713C07AD',104),
 (93,'2018-03-29 12:21:35',0x00,0x00,'2018-03-29 12:27:47',NULL,NULL,NULL,'mohandas','A7F1AB5740211857C2945B8832F28889',111),
 (94,'2018-03-29 13:59:11',0x00,0x00,'2018-03-29 13:59:11',NULL,NULL,NULL,'adddddd','25D55AD283AA400AF464C76D713C07AD',112),
 (95,'2018-03-29 14:47:12',0x00,0x00,'2018-03-29 14:47:12',NULL,NULL,NULL,'abhan951','93A66FCA8C017B1803E20EA5F55A464E',113),
 (96,'2018-03-29 22:50:50',0x00,0x00,'2018-04-03 15:46:08',NULL,'2018-04-03 15:46:08','ae804b75-bef4-43a4-b2d9-4e9df666231f','ccccc','B95E04D2820BB1DA245C6F9A1273AD28',114),
 (97,'2018-03-29 23:17:33',0x00,0x00,'2018-03-29 23:17:33',NULL,NULL,NULL,'xedro','16A9733968596A00EEF7E673046CE6DD',115),
 (98,'2018-04-02 14:14:08',0x00,0x00,'2018-04-02 14:14:08',NULL,NULL,NULL,'sakshi_k','773E306FD551975CD27E40FCC0FBE3A3',116);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (99,'2018-04-02 15:19:03',0x00,0x00,'2018-04-02 15:21:23',NULL,'2018-04-02 15:20:56','3501b630-cc8a-41b2-bff4-7012b19ed973','vyad25','55E45D5A71D538CD392E74A0FF23747C',117),
 (100,'2018-04-02 16:16:46',0x00,0x00,'2018-04-02 16:18:26',NULL,'2018-04-02 16:18:26','be05499e-ddba-4fda-adaf-888742dee090','swati','56467F0B2BE99421FAA52776D31D98EE',119),
 (101,'2018-04-03 09:32:28',0x00,0x00,'2018-04-06 09:19:15',NULL,'2018-04-06 09:19:15','6bf2c6e1-de00-489a-8148-5fc2b5a652fa','ajain1','702140C403565A01209CDA7A1C4097C1',120),
 (102,'2018-04-03 09:40:39',0x00,0x01,'2018-04-06 10:41:08',NULL,'2018-04-06 10:40:43','706c7bef-9d27-46ee-a45a-a076d27bfd7a','aditi_madaan','D67804709BCAD0DE0EDB8861A0918877',121),
 (103,'2018-04-03 10:48:06',0x00,0x00,'2018-04-03 10:48:06',NULL,NULL,NULL,'khushi1234','8C3B4E0723398AA778FD8C1D08983297',122),
 (104,'2018-04-03 15:46:34',0x00,0x00,'2018-04-03 15:46:34',NULL,NULL,NULL,'aaaaa','4423F3812D3EAEDA369E9CBE963A7854',123);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (106,'2018-04-03 18:02:21',0x00,0x00,'2018-04-03 18:02:21',NULL,NULL,NULL,'123456789','25F9E794323B453885F5181F1B624D0B',125),
 (110,'2018-04-04 09:36:23',0x00,0x00,'2018-04-04 09:36:23',NULL,NULL,NULL,'vsanse1','3FC0A7ACF087F549AC2B266BAF94B8B1',132),
 (111,'2018-04-04 09:48:21',0x00,0x01,'2018-04-09 09:42:19',NULL,'2018-04-09 09:41:42','ec397b0c-5950-446d-bfac-2b6eee951f56','keshav','3FC0A7ACF087F549AC2B266BAF94B8B1',133),
 (113,'2018-04-04 10:08:52',0x00,0x00,'2018-04-04 10:08:52',NULL,NULL,NULL,'ashu.s','8CFA2282B17DE0A598C010F5F0109E7D',135),
 (114,'2018-04-04 10:17:08',0x00,0x01,'2018-04-09 16:33:10',NULL,NULL,NULL,'vishu123','8E0A4056E0A3449E9322E3250F71E34F',137),
 (115,'2018-04-04 11:23:25',0x00,0x00,'2018-04-04 11:23:25',NULL,NULL,NULL,'prachithapl','368C601C9D0D574764E425ECC8EEF60A',138),
 (116,'2018-04-04 12:41:00',0x00,0x01,'2018-04-05 10:55:56',NULL,'2018-04-05 10:57:27','cde264ae-0d30-4a60-838e-c77ed7c2eeae','khushi','25D55AD283AA400AF464C76D713C07AD',139),
 (117,'2018-04-04 13:56:45',0x00,0x00,'2018-04-04 13:56:45',NULL,NULL,NULL,'asasa','578D5AD6D436B446A5DB03A558112DDF',140);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (118,'2018-04-04 14:07:21',0x00,0x00,'2018-04-09 16:56:59',NULL,NULL,NULL,'Tarun','25D55AD283AA400AF464C76D713C07AD',141),
 (122,'2018-04-04 14:28:27',0x00,0x00,'2018-04-04 14:28:27',NULL,NULL,NULL,'sid123','25F9E794323B453885F5181F1B624D0B',145),
 (124,'2018-04-04 14:42:56',0x00,0x00,'2018-04-04 14:42:56',NULL,NULL,NULL,'siddharth','8AB18827EB6877F6D400EE67EC732EE7',147),
 (125,'2018-04-04 14:47:17',0x00,0x01,'2018-04-09 14:09:08',NULL,'2018-04-04 14:48:03','c4b5dcf2-6a0d-445d-bd82-7cfdca7db3fb','siddharthgupta','578D5AD6D436B446A5DB03A558112DDF',148),
 (127,'2018-04-04 14:56:40',0x00,0x00,'2018-04-04 14:56:40',NULL,NULL,NULL,'prachithapliyalt','DB32DB4324B078144F368E327BE99D56',150),
 (128,'2018-04-04 15:00:31',0x00,0x00,'2018-04-05 11:44:16',NULL,'2018-04-05 11:44:16','34b21da2-00d5-492f-8a7f-af8ccb7bc02c','khushi12','25D55AD283AA400AF464C76D713C07AD',151),
 (129,'2018-04-04 14:58:18',0x00,0x00,'2018-04-09 09:38:57',NULL,'2018-04-09 09:38:57','55090087-89d8-4c73-8bcb-ef2096ca7b16','kladha1','691EC91F8FC238EDEE46CDE1E4731402',152);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (130,'2018-04-04 14:58:40',0x00,0x00,'2018-04-04 14:58:40',NULL,NULL,NULL,'prachii','368C601C9D0D574764E425ECC8EEF60A',153),
 (131,'2018-04-04 15:43:25',0x00,0x01,'2018-04-05 13:35:25',NULL,'2018-04-04 15:44:12','952ac53f-2067-4cff-8eab-bf3e9ccb5ceb','abhi10','6EBE76C9FB411BE97B3B0D48B791A7C9',154),
 (132,'2018-04-05 11:00:24',0x00,0x01,'2018-04-09 14:34:58',NULL,'2018-04-09 10:11:25','4ab62c9d-648b-4756-a83d-18543beb7878','veersrish','E807F1FCF82D132F9BB018CA6738A19F',155),
 (133,'2018-04-05 14:38:35',0x00,0x00,'2018-04-05 14:38:35',NULL,NULL,NULL,'vsanser','0D0E2338B8F6AF31AC7227AAED4E819C',156),
 (135,'2018-04-06 10:25:46',0x00,0x00,'2018-04-06 10:25:46',NULL,NULL,NULL,'prachiiii','174A8AA2ED1D77A12D133A5BB2C4D00A',159),
 (136,'2018-04-06 12:03:25',0x00,0x00,'2018-04-06 12:03:25',NULL,NULL,NULL,'srishti','35FF6F6F54F472346785E6C725AB29EB',160),
 (137,'2018-04-06 16:57:47',0x00,0x00,'2018-04-09 14:39:06',NULL,'2018-04-09 14:37:38','405823cf-63a6-46ac-9514-d57b4649cab3','ashu.18','3FC0A7ACF087F549AC2B266BAF94B8B1',161);
INSERT INTO `login` (`login_id`,`created_date`,`is_active`,`is_verified`,`last_modified_date`,`otp`,`token_generated_date`,`token_id`,`user_name`,`user_password`,`user_id`) VALUES 
 (138,'2018-04-06 16:59:26',0x00,0x00,'2018-04-09 15:57:19',NULL,NULL,NULL,'palakh`','3FC0A7ACF087F549AC2B266BAF94B8B1',162),
 (139,'2018-04-06 17:01:31',0x00,0x00,'2018-04-09 16:13:48',NULL,'2018-04-06 17:29:23','094aa1bd-0fbf-4047-a146-778ecb3c61b2','messi','25D55AD283AA400AF464C76D713C07AD',163),
 (140,'2018-04-06 17:15:52',0x00,0x00,'2018-04-06 17:15:52',NULL,NULL,NULL,'prat123','25D55AD283AA400AF464C76D713C07AD',164),
 (141,'2018-04-09 12:04:24',0x00,0x01,'2018-04-09 17:15:48',NULL,'2018-04-09 12:42:35','e1dda5f4-0d07-4866-ab1a-b028435bb794','riya123','25F9E794323B453885F5181F1B624D0B',165),
 (142,'2018-04-09 14:51:20',0x00,0x00,'2018-04-09 14:54:35',NULL,NULL,NULL,'ssalal','B4078C14FBCB7B3EF69A5F915A753D5B',166),
 (143,'2018-04-09 14:55:30',0x00,0x00,'2018-04-09 14:55:49',NULL,NULL,NULL,'sagarsalal','B4078C14FBCB7B3EF69A5F915A753D5B',167);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `order_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `item_price` float DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `purchase_type` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FKkv782vqb3bg5su4kw1puj3t1j` (`isbn`),
  KEY `FKii1vcsoitl3124dakasioxsm0` (`order_id`),
  CONSTRAINT `FKii1vcsoitl3124dakasioxsm0` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`),
  CONSTRAINT `FKkv782vqb3bg5su4kw1puj3t1j` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=936 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (680,'2018-04-05 15:26:23',94,'2018-04-05 15:26:23',0x00,1,'2220000000000',1256),
 (681,'2018-04-05 15:26:23',20,'2018-04-05 15:26:23',0x00,1,'9580000000000',1256),
 (682,'2018-04-05 15:28:23',645,'2018-04-05 15:28:23',0x01,1,'9880000000000',1257),
 (683,'2018-04-05 15:28:23',737,'2018-04-05 15:28:23',0x01,1,'9782000000000',1257),
 (684,'2018-04-05 15:29:10',450,'2018-04-05 15:29:10',0x01,1,'9220000000000',1258),
 (685,'2018-04-05 15:29:10',222,'2018-04-05 15:29:10',0x01,1,'9580000000000',1258),
 (686,'2018-04-05 15:29:10',978,'2018-04-05 15:29:10',0x01,1,'2220000000000',1258),
 (687,'2018-04-05 15:29:10',212,'2018-04-05 15:29:10',0x01,1,'9560000000000',1258),
 (688,'2018-04-05 15:29:10',220,'2018-04-05 15:29:10',0x01,1,'9470000000000',1258),
 (689,'2018-04-05 15:29:10',737,'2018-04-05 15:29:10',0x01,1,'9782000000000',1258),
 (690,'2018-04-05 15:29:10',631,'2018-04-05 15:29:10',0x01,1,'9960000000000',1258),
 (691,'2018-04-05 15:29:10',800,'2018-04-05 15:29:10',0x01,1,'1170000000000',1258);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (719,'2018-04-05 16:21:42',450,'2018-04-05 16:21:42',0x01,1,'9360000000000',1274),
 (720,'2018-04-05 16:21:42',977,'2018-04-05 16:21:42',0x01,1,'9639000000000',1274),
 (721,'2018-04-05 16:21:42',222,'2018-04-05 16:21:42',0x01,1,'9580000000000',1274),
 (722,'2018-04-05 16:21:42',212,'2018-04-05 16:21:42',0x01,1,'9560000000000',1274),
 (723,'2018-04-05 16:21:42',737,'2018-04-05 16:21:42',0x01,1,'9782000000000',1274),
 (724,'2018-04-05 16:19:53',800,'2018-04-05 16:19:53',0x01,1,'1170000000000',1275),
 (725,'2018-04-05 16:20:36',800,'2018-04-05 16:20:36',0x01,1,'1170000000000',1276),
 (726,'2018-04-05 16:23:20',800,'2018-04-05 16:23:20',0x01,1,'1170000000000',1277),
 (727,'2018-04-05 18:21:50',17,'2018-04-05 18:21:50',0x00,1,'9470000000000',1278),
 (728,'2018-04-05 18:21:50',62,'2018-04-05 18:21:50',0x00,1,'9880000000000',1278),
 (729,'2018-04-05 18:21:50',71,'2018-04-05 18:21:50',0x00,1,'9782000000000',1278),
 (730,'2018-04-05 18:24:02',35,'2018-04-05 18:24:02',0x00,1,'9220000000000',1279);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (731,'2018-04-05 18:24:02',75,'2018-04-05 18:24:02',0x00,1,'1170000000000',1279),
 (732,'2018-04-06 09:20:55',645,'2018-04-06 09:20:55',0x01,1,'9880000000000',1280),
 (733,'2018-04-06 09:21:25',450,'2018-04-06 09:21:25',0x01,1,'9220000000000',1281),
 (734,'2018-04-06 09:21:25',222,'2018-04-06 09:21:25',0x01,1,'9580000000000',1281),
 (735,'2018-04-06 09:42:21',220,'2018-04-06 09:42:21',0x01,1,'9470000000000',1282),
 (736,'2018-04-06 09:42:21',737,'2018-04-06 09:42:21',0x01,1,'9782000000000',1282),
 (737,'2018-04-06 09:42:29',786,'2018-04-06 09:42:29',0x01,1,'5560000000000',1283),
 (738,'2018-04-06 09:46:29',17,'2018-04-06 09:46:29',0x00,2,'9470000000000',1284),
 (739,'2018-04-06 09:46:29',737,'2018-04-06 09:46:29',0x01,4,'9782000000000',1284),
 (740,'2018-04-06 09:46:29',800,'2018-04-06 09:46:29',0x01,1,'1170000000000',1284),
 (741,'2018-04-06 09:44:24',220,'2018-04-06 09:44:24',0x01,1,'9470000000000',1285),
 (742,'2018-04-06 09:45:17',977,'2018-04-06 09:45:17',0x01,1,'9639000000000',1286);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (743,'2018-04-06 09:45:38',977,'2018-04-06 09:45:38',0x01,1,'9639000000000',1287),
 (744,'2018-04-06 09:45:38',645,'2018-04-06 09:45:38',0x01,1,'9880000000000',1287),
 (745,'2018-04-06 09:50:18',220,'2018-04-06 09:50:18',0x01,2,'9470000000000',1288),
 (746,'2018-04-06 09:50:18',737,'2018-04-06 09:50:18',0x01,1,'9782000000000',1288),
 (747,'2018-04-06 09:50:18',75,'2018-04-06 09:50:18',0x00,2,'1170000000000',1288),
 (748,'2018-04-06 09:52:04',342,'2018-04-06 09:52:04',0x01,1,'9729000000000',1289),
 (749,'2018-04-06 09:52:39',645,'2018-04-06 09:52:39',0x01,1,'9880000000000',1290),
 (750,'2018-04-06 09:52:39',737,'2018-04-06 09:52:39',0x01,1,'9782000000000',1290),
 (751,'2018-04-06 09:55:38',220,'2018-04-06 09:55:38',0x01,1,'9470000000000',1291),
 (752,'2018-04-06 09:55:38',800,'2018-04-06 09:55:38',0x01,1,'1170000000000',1291),
 (753,'2018-04-06 09:55:54',978,'2018-04-06 09:55:54',0x01,1,'2220000000000',1292),
 (754,'2018-04-06 09:55:54',645,'2018-04-06 09:55:54',0x01,1,'9880000000000',1292);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (755,'2018-04-06 09:56:04',222,'2018-04-06 09:56:04',0x01,1,'9580000000000',1293),
 (756,'2018-04-06 09:56:15',631,'2018-04-06 09:56:15',0x01,1,'9960000000000',1294),
 (757,'2018-04-06 09:56:23',977,'2018-04-06 09:56:23',0x01,1,'9639000000000',1295),
 (758,'2018-04-06 10:01:17',977,'2018-04-06 10:01:17',0x01,1,'9639000000000',1296),
 (759,'2018-04-06 10:01:17',737,'2018-04-06 10:01:17',0x01,1,'9782000000000',1296),
 (760,'2018-04-06 10:00:14',342,'2018-04-06 10:00:14',0x01,1,'9729000000000',1297),
 (761,'2018-04-06 10:05:37',737,'2018-04-06 10:05:37',0x01,4,'9782000000000',1298),
 (762,'2018-04-06 10:05:37',75,'2018-04-06 10:05:37',0x00,3,'1170000000000',1298),
 (763,'2018-04-06 10:03:57',977,'2018-04-06 10:03:57',0x01,2,'9639000000000',1299),
 (764,'2018-04-06 10:10:07',450,'2018-04-06 10:10:07',0x01,1,'9220000000000',1300),
 (765,'2018-04-06 10:10:39',222,'2018-04-06 10:10:39',0x01,1,'9580000000000',1301),
 (766,'2018-04-06 10:11:02',800,'2018-04-06 10:11:02',0x01,1,'1170000000000',1302);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (767,'2018-04-06 10:36:41',450,'2018-04-06 10:36:41',0x01,1,'9220000000000',1303),
 (768,'2018-04-06 10:36:41',800,'2018-04-06 10:36:41',0x01,1,'1170000000000',1303),
 (769,'2018-04-06 10:35:09',666,'2018-04-06 10:35:09',0x01,1,'3620000000000',1304),
 (770,'2018-04-06 10:35:09',540,'2018-04-06 10:35:09',0x01,2,'9788177091878',1304),
 (771,'2018-04-06 10:36:25',220,'2018-04-06 10:36:25',0x01,1,'9470000000000',1305),
 (772,'2018-04-06 10:41:49',737,'2018-04-06 10:41:49',0x01,1,'9782000000000',1306),
 (773,'2018-04-06 10:41:49',800,'2018-04-06 10:41:49',0x01,1,'1170000000000',1306),
 (774,'2018-04-06 10:44:15',800,'2018-04-06 10:44:15',0x01,1,'1170000000000',1307),
 (776,'2018-04-06 11:08:56',645,'2018-04-06 11:08:56',0x01,2,'9880000000000',1309),
 (777,'2018-04-06 11:08:56',75,'2018-04-06 11:08:56',0x00,1,'1170000000000',1309),
 (778,'2018-04-06 11:15:43',737,'2018-04-06 11:15:43',0x01,1,'9782000000000',1310),
 (779,'2018-04-06 11:18:13',631,'2018-04-06 11:18:13',0x01,1,'9960000000000',1311);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (780,'2018-04-06 11:18:03',800,'2018-04-06 11:18:03',0x01,1,'1170000000000',1312),
 (781,'2018-04-06 11:37:29',92,'2018-04-06 11:37:29',0x00,3,'9639000000000',1313),
 (782,'2018-04-06 11:37:29',71,'2018-04-06 11:37:29',0x00,2,'9782000000000',1313),
 (783,'2018-04-06 11:57:07',450,'2018-04-06 11:57:07',0x01,1,'9220000000000',1314),
 (784,'2018-04-06 11:57:07',977,'2018-04-06 11:57:07',0x01,1,'9639000000000',1314),
 (785,'2018-04-06 11:55:45',786,'2018-04-06 11:55:45',0x01,1,'5560000000000',1315),
 (786,'2018-04-06 12:01:48',786,'2018-04-06 12:01:48',0x01,1,'5560000000000',1316),
 (787,'2018-04-06 12:04:26',786,'2018-04-06 12:04:26',0x01,1,'5560000000000',1317),
 (788,'2018-04-06 12:06:06',220,'2018-04-06 12:06:06',0x01,1,'9470000000000',1318),
 (789,'2018-04-06 12:09:54',450,'2018-04-06 12:09:54',0x01,1,'9360000000000',1319),
 (790,'2018-04-06 12:09:54',977,'2018-04-06 12:09:54',0x01,1,'9639000000000',1319),
 (791,'2018-04-06 12:09:54',800,'2018-04-06 12:09:54',0x01,1,'1170000000000',1319);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (792,'2018-04-06 12:10:26',35,'2018-04-06 12:10:26',0x00,1,'9360000000000',1320),
 (793,'2018-04-06 12:10:26',94,'2018-04-06 12:10:26',0x00,1,'2220000000000',1320),
 (794,'2018-04-06 12:10:26',75,'2018-04-06 12:10:26',0x00,1,'1170000000000',1320),
 (795,'2018-04-06 12:13:50',35,'2018-04-06 12:13:50',0x00,1,'9220000000000',1321),
 (796,'2018-04-06 12:13:50',92,'2018-04-06 12:13:50',0x00,1,'9639000000000',1321),
 (797,'2018-04-06 12:21:16',35,'2018-04-06 12:21:16',0x00,1,'9360000000000',1322),
 (798,'2018-04-06 12:32:14',64,'2018-04-06 12:32:14',0x00,1,'9638000000000',1323),
 (799,'2018-04-06 12:38:10',19,'2018-04-06 12:38:10',0x00,1,'9560000000000',1324),
 (800,'2018-04-06 12:55:33',35,'2018-04-06 12:55:33',0x00,2,'9220000000000',1325),
 (801,'2018-04-06 12:55:33',19,'2018-04-06 12:55:33',0x00,1,'9560000000000',1325),
 (802,'2018-04-06 13:01:01',222,'2018-04-06 13:01:01',0x01,1,'9580000000000',1326),
 (803,'2018-04-06 13:06:58',222,'2018-04-06 13:06:58',0x01,1,'9580000000000',1327);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (804,'2018-04-06 13:07:16',222,'2018-04-06 13:07:16',0x01,1,'9580000000000',1328),
 (805,'2018-04-06 13:15:45',222,'2018-04-06 13:15:45',0x01,1,'9580000000000',1329),
 (806,'2018-04-06 13:35:38',342,'2018-04-06 13:35:38',0x01,1,'9729000000000',1330),
 (807,'2018-04-06 14:47:18',19,'2018-04-06 14:47:18',0x00,1,'9560000000000',1331),
 (808,'2018-04-06 14:47:18',64,'2018-04-06 14:47:18',0x00,60,'9638000000000',1331),
 (809,'2018-04-06 15:07:32',450,'2018-04-06 15:07:32',0x01,1,'9220000000000',1332),
 (810,'2018-04-06 15:30:30',222,'2018-04-06 15:30:30',0x01,1,'9580000000000',1333),
 (811,'2018-04-06 15:31:02',645,'2018-04-06 15:31:02',0x01,1,'9880000000000',1334),
 (812,'2018-04-06 15:31:38',222,'2018-04-06 15:31:38',0x01,1,'9580000000000',1335),
 (813,'2018-04-06 15:45:41',30,'2018-04-06 15:45:41',0x00,1,'123',1336),
 (814,'2018-04-06 15:45:41',20,'2018-04-06 15:45:41',0x00,1,'9580000000000',1336),
 (815,'2018-04-06 16:14:25',764,'2018-04-06 16:14:25',0x01,1,'9110000000000',1338);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (816,'2018-04-06 16:14:27',764,'2018-04-06 16:14:27',0x01,1,'9110000000000',1339),
 (817,'2018-04-06 16:14:30',764,'2018-04-06 16:14:30',0x01,1,'9110000000000',1341),
 (818,'2018-04-06 16:15:49',764,'2018-04-06 16:15:49',0x01,1,'9110000000000',1342),
 (819,'2018-04-06 16:16:53',666,'2018-04-06 16:16:53',0x01,1,'3620000000000',1343),
 (820,'2018-04-06 16:16:53',977,'2018-04-06 16:16:53',0x01,1,'9639000000000',1343),
 (821,'2018-04-06 16:17:53',764,'2018-04-06 16:17:53',0x01,2,'9110000000000',1344),
 (822,'2018-04-06 16:30:31',450,'2018-04-06 16:30:31',0x01,1,'9220000000000',1345),
 (823,'2018-04-06 16:30:31',212,'2018-04-06 16:30:31',0x01,1,'9560000000000',1345),
 (824,'2018-04-06 16:30:58',800,'2018-04-06 16:30:58',0x01,1,'1170000000000',1346),
 (825,'2018-04-06 16:31:02',800,'2018-04-06 16:31:02',0x01,1,'1170000000000',1347),
 (826,'2018-04-06 16:34:42',450,'2018-04-06 16:34:42',0x01,1,'9360000000000',1348),
 (827,'2018-04-06 16:34:42',978,'2018-04-06 16:34:42',0x01,1,'2220000000000',1348);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (828,'2018-04-06 16:34:42',220,'2018-04-06 16:34:42',0x01,1,'9470000000000',1348),
 (829,'2018-04-06 16:34:42',737,'2018-04-06 16:34:42',0x01,1,'9782000000000',1348),
 (830,'2018-04-06 16:34:42',786,'2018-04-06 16:34:42',0x01,1,'9638000000000',1348),
 (831,'2018-04-06 16:34:43',450,'2018-04-06 16:34:43',0x01,1,'9360000000000',1349),
 (832,'2018-04-06 16:34:43',978,'2018-04-06 16:34:43',0x01,1,'2220000000000',1349),
 (833,'2018-04-06 16:34:43',220,'2018-04-06 16:34:43',0x01,1,'9470000000000',1349),
 (834,'2018-04-06 16:34:43',737,'2018-04-06 16:34:43',0x01,1,'9782000000000',1349),
 (835,'2018-04-06 16:34:43',786,'2018-04-06 16:34:43',0x01,1,'9638000000000',1349),
 (836,'2018-04-06 16:34:47',75,'2018-04-06 16:34:47',0x00,3,'5560000000000',1350),
 (837,'2018-04-06 16:36:11',212,'2018-04-06 16:36:11',0x01,1,'9560000000000',1351),
 (838,'2018-04-06 16:36:23',645,'2018-04-06 16:36:23',0x01,1,'9880000000000',1352),
 (839,'2018-04-06 16:36:47',220,'2018-04-06 16:36:47',0x01,1,'9470000000000',1353);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (840,'2018-04-06 16:42:24',222,'2018-04-06 16:42:24',0x01,1,'9580000000000',1354),
 (841,'2018-04-06 16:42:50',450,'2018-04-06 16:42:50',0x01,1,'9360000000000',1355),
 (842,'2018-04-06 16:42:50',220,'2018-04-06 16:42:50',0x01,1,'9470000000000',1355),
 (843,'2018-04-06 17:32:01',630,'2018-04-06 17:32:01',0x01,1,'9820000000000',1356),
 (844,'2018-04-06 17:32:41',630,'2018-04-06 17:32:41',0x01,1,'9820000000000',1357),
 (845,'2018-04-06 19:30:50',5,'2018-04-06 19:30:50',0x00,1,'95812',1358),
 (846,'2018-04-06 19:30:50',35,'2018-04-06 19:30:50',0x00,1,'9220000000000',1358),
 (847,'2018-04-06 19:30:50',41,'2018-04-06 19:30:50',0x00,1,'9780000000000',1358),
 (848,'2018-04-06 19:30:50',94,'2018-04-06 19:30:50',0x00,1,'2220000000000',1358),
 (849,'2018-04-06 19:30:52',5,'2018-04-06 19:30:52',0x00,1,'95812',1359),
 (850,'2018-04-06 19:30:52',35,'2018-04-06 19:30:52',0x00,1,'9220000000000',1359),
 (851,'2018-04-06 19:30:52',41,'2018-04-06 19:30:52',0x00,1,'9780000000000',1359);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (852,'2018-04-06 19:30:52',94,'2018-04-06 19:30:52',0x00,1,'2220000000000',1359),
 (853,'2018-04-06 19:34:27',5,'2018-04-06 19:34:27',0x00,1,'95812',1360),
 (854,'2018-04-06 19:34:27',35,'2018-04-06 19:34:27',0x00,1,'9360000000000',1360),
 (855,'2018-04-06 19:46:24',666,'2018-04-06 19:46:24',0x01,1,'3620000000000',1361),
 (856,'2018-04-06 19:46:28',666,'2018-04-06 19:46:28',0x01,1,'3620000000000',1362),
 (857,'2018-04-06 19:47:19',55,'2018-04-06 19:47:19',0x01,1,'95812',1366),
 (858,'2018-04-06 22:32:00',300,'2018-04-06 22:32:00',0x01,10000000,'123',1368),
 (859,'2018-04-07 09:33:14',35,'2018-04-07 09:33:14',0x00,2,'9360000000000',1369),
 (860,'2018-04-09 09:25:57',540,'2018-04-09 09:25:57',0x01,1,'9788177091878',1370),
 (861,'2018-04-09 09:25:57',952,'2018-04-09 09:25:57',0x01,1,'9781473647770',1370),
 (862,'2018-04-09 09:25:57',800,'2018-04-09 09:25:57',0x01,1,'1170000000000',1370),
 (863,'2018-04-09 09:27:04',374.25,'2018-04-09 09:27:04',0x01,1,'9780141359151',1371);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (864,'2018-04-09 09:27:04',952,'2018-04-09 09:27:04',0x01,1,'9781473647770',1371),
 (865,'2018-04-09 09:41:55',666,'2018-04-09 09:41:55',0x01,1,'3620000000000',1372),
 (866,'2018-04-09 09:52:52',123,'2018-04-09 09:52:52',0x01,1,'789456',1373),
 (867,'2018-04-09 09:52:52',434,'2018-04-09 09:52:52',0x01,5,'5454000000000',1373),
 (868,'2018-04-09 09:53:57',43,'2018-04-09 09:53:57',0x00,5,'5454000000000',1374),
 (869,'2018-04-09 09:59:58',666,'2018-04-09 09:59:58',0x01,25,'3620000000000',1375),
 (870,'2018-04-09 09:59:58',677,'2018-04-09 09:59:58',0x01,11,'9350000000000',1375),
 (871,'2018-04-09 10:03:36',75,'2018-04-09 10:03:36',0x00,10,'5560000000000',1376),
 (872,'2018-04-09 10:07:22',63,'2018-04-09 10:07:22',0x00,1,'9350000000000',1377),
 (873,'2018-04-09 10:17:02',800,'2018-04-09 10:17:02',0x01,1,'1170000000000',1378),
 (874,'2018-04-09 10:18:04',75,'2018-04-09 10:18:04',0x00,1,'1170000000000',1379),
 (875,'2018-04-09 10:20:43',120,'2018-04-09 10:20:43',0x00,1,'7777777777777',1380);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (876,'2018-04-09 10:21:06',63,'2018-04-09 10:21:06',0x00,5,'9350000000000',1381),
 (877,'2018-04-09 10:21:06',120,'2018-04-09 10:21:06',0x00,3,'7777777777777',1381),
 (878,'2018-04-09 10:21:16',374.25,'2018-04-09 10:21:16',0x01,1,'9780141359151',1382),
 (879,'2018-04-09 10:34:25',666,'2018-04-09 10:34:25',0x01,1,'3620000000000',1383),
 (880,'2018-04-09 10:34:40',677,'2018-04-09 10:34:40',0x01,1,'9350000000000',1384),
 (881,'2018-04-09 10:35:03',677,'2018-04-09 10:35:03',0x01,3,'9350000000000',1385),
 (882,'2018-04-09 10:36:23',374.25,'2018-04-09 10:36:23',0x01,1,'9780141359151',1386),
 (883,'2018-04-09 10:36:23',23,'2018-04-09 10:36:23',0x00,2,'9781473647770',1386),
 (884,'2018-04-09 10:42:08',37.25,'2018-04-09 10:42:08',0x00,1,'9780141359151',1387),
 (885,'2018-04-09 10:42:08',23,'2018-04-09 10:42:08',0x00,1,'9781473647770',1387),
 (886,'2018-04-09 10:47:16',120,'2018-04-09 10:47:16',0x00,1,'7777777777777',1388),
 (887,'2018-04-09 10:53:30',977,'2018-04-09 10:53:30',0x01,1,'9639000000000',1389);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (888,'2018-04-09 10:53:30',220,'2018-04-09 10:53:30',0x01,1,'9470000000000',1389),
 (889,'2018-04-09 10:53:30',737,'2018-04-09 10:53:30',0x01,1,'9782000000000',1389),
 (890,'2018-04-09 10:53:30',631,'2018-04-09 10:53:30',0x01,1,'9960000000000',1389),
 (891,'2018-04-09 10:54:34',666,'2018-04-09 10:54:34',0x01,1,'3620000000000',1390),
 (892,'2018-04-09 11:02:32',120,'2018-04-09 11:02:32',0x00,1,'7777777777777',1391),
 (893,'2018-04-09 11:06:57',952,'2018-04-09 11:06:57',0x01,1,'9781473647770',1392),
 (894,'2018-04-09 11:07:43',666,'2018-04-09 11:07:43',0x01,1,'3620000000000',1393),
 (895,'2018-04-09 11:12:51',666,'2018-04-09 11:12:51',0x01,1,'3620000000000',1394),
 (896,'2018-04-09 11:23:10',666,'2018-04-09 11:23:10',0x01,1,'3620000000000',1393),
 (897,'2018-04-09 11:26:23',666,'2018-04-09 11:26:23',0x01,1,'3620000000000',1396),
 (898,'2018-04-09 11:38:12',666,'2018-04-09 11:38:12',0x01,1,'3620000000000',1397),
 (899,'2018-04-09 11:39:24',666,'2018-04-09 11:39:24',0x01,1,'3620000000000',1398);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (900,'2018-04-09 11:45:24',666,'2018-04-09 11:45:24',0x01,1,'3620000000000',1399),
 (901,'2018-04-09 11:46:16',666,'2018-04-09 11:46:16',0x01,1,'3620000000000',1400),
 (902,'2018-04-09 11:47:20',666,'2018-04-09 11:47:20',0x01,1,'3620000000000',1401),
 (903,'2018-04-09 11:48:56',666,'2018-04-09 11:48:56',0x01,1,'3620000000000',1402),
 (904,'2018-04-09 11:55:39',666,'2018-04-09 11:55:39',0x01,1,'3620000000000',1403),
 (905,'2018-04-09 11:56:47',666,'2018-04-09 11:56:47',0x01,1,'3620000000000',1404),
 (906,'2018-04-09 11:58:19',666,'2018-04-09 11:58:19',0x01,1,'3620000000000',1405),
 (907,'2018-04-09 11:59:59',666,'2018-04-09 11:59:59',0x01,1,'3620000000000',1406),
 (908,'2018-04-09 12:00:50',666,'2018-04-09 12:00:50',0x01,1,'3620000000000',1407),
 (909,'2018-04-09 12:01:30',666,'2018-04-09 12:01:30',0x01,1,'3620000000000',1408),
 (910,'2018-04-09 12:02:28',666,'2018-04-09 12:02:28',0x01,1,'3620000000000',1409),
 (911,'2018-04-09 12:05:03',666,'2018-04-09 12:05:03',0x01,1,'3620000000000',1410);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (912,'2018-04-09 12:10:03',666,'2018-04-09 12:10:03',0x01,1,'3620000000000',1411),
 (913,'2018-04-09 12:14:11',666,'2018-04-09 12:14:11',0x01,1,'3620000000000',1412),
 (914,'2018-04-09 12:15:04',666,'2018-04-09 12:15:04',0x01,1,'3620000000000',1413),
 (915,'2018-04-09 12:17:22',666,'2018-04-09 12:17:22',0x01,1,'3620000000000',1414),
 (916,'2018-04-09 12:19:03',666,'2018-04-09 12:19:03',0x01,1,'3620000000000',1415),
 (917,'2018-04-09 12:25:55',666,'2018-04-09 12:25:55',0x01,1,'3620000000000',1416),
 (918,'2018-04-09 12:32:02',666,'2018-04-09 12:32:02',0x01,1,'3620000000000',1417),
 (919,'2018-04-09 12:33:21',666,'2018-04-09 12:33:21',0x01,1,'3620000000000',1418),
 (920,'2018-04-09 12:34:16',666,'2018-04-09 12:34:16',0x01,1,'3620000000000',1419),
 (921,'2018-04-09 12:35:04',666,'2018-04-09 12:35:04',0x01,1,'3620000000000',1420),
 (922,'2018-04-09 12:40:52',666,'2018-04-09 12:40:52',0x01,1,'3620000000000',1421),
 (923,'2018-04-09 12:43:06',666,'2018-04-09 12:43:06',0x01,1,'3620000000000',1422);
INSERT INTO `order_details` (`order_detail_id`,`created_date`,`item_price`,`last_modified_date`,`purchase_type`,`quantity`,`isbn`,`order_id`) VALUES 
 (924,'2018-04-09 12:43:58',666,'2018-04-09 12:43:58',0x01,1,'3620000000000',1423),
 (925,'2018-04-09 12:43:58',120,'2018-04-09 12:43:58',0x00,1,'7777777777777',1423),
 (926,'2018-04-09 12:44:30',666,'2018-04-09 12:44:30',0x01,1,'3620000000000',1424),
 (927,'2018-04-09 12:51:56',37.25,'2018-04-09 12:51:56',0x00,1,'9780141359151',1425),
 (928,'2018-04-09 13:00:24',22,'2018-04-09 13:00:24',0x00,1,'9820000000000',1426),
 (929,'2018-04-09 14:07:04',666,'2018-04-09 14:07:04',0x01,1,'3620000000000',1427),
 (930,'2018-04-09 14:16:53',786,'2018-04-09 14:16:53',0x01,1,'5560000000000',1428),
 (931,'2018-04-09 14:26:13',374.25,'2018-04-09 14:26:13',0x01,1,'9780141359151',1429),
 (932,'2018-04-09 14:58:01',677,'2018-04-09 14:58:01',0x01,1,'9350000000000',1430),
 (933,'2018-04-09 15:20:20',677,'2018-04-09 15:20:20',0x01,1,'9350000000000',1431),
 (934,'2018-04-09 16:49:19',677,'2018-04-09 16:49:19',0x01,1,'9350000000000',1432),
 (935,'2018-04-09 16:49:19',9674,'2018-04-09 16:49:19',0x01,1,'3216540000',1432);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;


--
-- Definition of table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
CREATE TABLE `shipping_address` (
  `shipping_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `FKpp40r6fg2o5iucc5r3hsc4wox` (`city_id`),
  KEY `FKfcs6eqhyd4bp638r6eqxu77sf` (`country_id`),
  KEY `FKatbgaqk1hhhhkyyuebylpeh7q` (`order_id`),
  KEY `FK6wb1na0lx53hw79voyhaiophn` (`state_id`),
  KEY `FKilmh1is3sdv0h8xdsrh0yn5f3` (`user_id`),
  CONSTRAINT `FK6wb1na0lx53hw79voyhaiophn` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `FKatbgaqk1hhhhkyyuebylpeh7q` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`),
  CONSTRAINT `FKfcs6eqhyd4bp638r6eqxu77sf` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FKilmh1is3sdv0h8xdsrh0yn5f3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKpp40r6fg2o5iucc5r3hsc4wox` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_address`
--

/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (1,'54/10, OppositeLocal President House ','Almora, U.K.','2018-02-12 10:20:00','2018-03-21 00:20:10','ssalal@sapient.com','9999999991',7,1,NULL,1,4,'33903'),
 (2,'23/43, Lokhandwala,  Andheri West','Mumbai, Maharashtra','2018-02-15 09:20:00','2018-03-20 11:20:10','sallllubhai@gmail.com','8888888881',14,1,NULL,3,26,'35004'),
 (3,'Backside of Railway Station','Ratlam, Maharashtra','2018-02-19 09:20:00','2018-03-24 11:20:10','salals@gmail.com','7777777771',25,1,NULL,2,43,'92705'),
 (4,'aaa','aaa','2018-04-04 11:22:00','2018-04-04 11:22:00','vb@g.co',NULL,99,1,NULL,10,4,'92720'),
 (5,'aaaa','','2018-04-04 11:23:17','2018-04-04 11:23:17','vb@g.co',NULL,69,1,NULL,7,4,'60134'),
 (6,'aaaa','','2018-04-04 13:04:19','2018-04-04 13:04:19','vb@g.co',NULL,51,1,NULL,6,4,'72348'),
 (7,'asdasd','','2018-04-04 13:49:39','2018-04-04 13:49:39','ksharma61@sapient.com',NULL,79,1,NULL,8,4,'95060'),
 (8,'adfasd','','2018-04-04 13:50:00','2018-04-04 13:50:00','ksharma61@sapient.com',NULL,11,1,NULL,1,4,'90028');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (9,'sadas','','2018-04-04 13:52:23','2018-04-04 13:52:23','ksharma61@sapient.com',NULL,18,1,NULL,3,4,'60134'),
 (10,'sadad','','2018-04-04 13:52:36','2018-04-04 13:52:36','ksharma61@sapient.com',NULL,70,1,NULL,7,4,'36442'),
 (11,'safolal','garokal','2018-04-04 13:54:48','2018-04-04 13:54:48','ksharma61@sapient.com',NULL,13,1,NULL,1,4,'33063'),
 (12,'ww','','2018-04-04 13:53:50','2018-04-04 13:53:50','ak@gmail.com',NULL,31,1,NULL,4,87,'77478'),
 (13,'xx','xscc','2018-04-04 13:55:16','2018-04-04 13:55:16','shreyag932@gmail.com',NULL,53,1,NULL,6,4,'10810'),
 (14,'wersf','','2018-04-04 13:55:20','2018-04-04 13:55:20','ak@gmail.com',NULL,15,1,NULL,3,4,'78007'),
 (15,'guyg','ygyg','2018-04-04 13:55:58','2018-04-04 13:55:58','shreyag932@gmail.com',NULL,81,1,NULL,9,4,'36301'),
 (16,'r','','2018-04-04 13:56:33','2018-04-04 13:56:33','ak@gmail.com',NULL,96,1,NULL,10,4,'94016'),
 (17,'11111','','2018-04-04 14:00:37','2018-04-04 14:00:37','prachi@kj',NULL,41,1,NULL,5,4,'71010');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (18,'asd','','2018-04-04 14:29:05','2018-04-04 14:29:05','hgu@hg.m',NULL,92,1,NULL,10,145,'71013'),
 (19,'jgyfhj','','2018-04-04 14:53:11','2018-04-04 14:53:11','ksharma61@sapient.com',NULL,54,1,NULL,6,139,'22545'),
 (20,'DGFHF','','2018-04-04 14:54:53','2018-04-04 14:54:53','hgu@hg.m',NULL,86,1,NULL,9,145,'75002'),
 (21,'sdfg','','2018-04-04 14:59:10','2018-04-04 14:59:10','pthapliyal@sapient.co',NULL,62,1,NULL,7,153,'90028'),
 (22,'gehu bell','','2018-04-04 14:59:50','2018-04-04 14:59:50','pthapliyal@sapient.co',NULL,20,1,NULL,3,153,'92007'),
 (23,'aaaaaaa','hm','2018-04-04 15:02:14','2018-04-04 15:02:14','a@b.com',NULL,15,1,NULL,3,151,'78007'),
 (24,'qwerty','abc','2018-04-04 15:00:12','2018-04-04 15:00:12','pthapliyal@sapient.co',NULL,14,1,NULL,3,4,'35004'),
 (25,'abc','','2018-04-04 15:11:50','2018-04-04 15:11:50','a@b.com',NULL,32,1,NULL,4,151,'75013'),
 (26,'Dehradun','def','2018-04-04 15:17:04','2018-04-04 15:17:04','vb@g.co',NULL,79,1,NULL,8,99,'95060');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (27,'Alabama','Hel point','2018-04-04 15:16:22','2018-04-04 15:16:22','vb@g.co',NULL,35,1,NULL,4,99,'75002'),
 (28,'pop','58','2018-04-04 15:22:56','2018-04-04 15:22:56','vb@g.co',NULL,86,1,NULL,9,99,'75002'),
 (29,'gurgaon','gurgaon','2018-04-04 15:57:36','2018-04-04 15:57:36','sumathur@sapient.com',NULL,36,1,NULL,4,4,'87935'),
 (30,'poy','','2018-04-05 10:32:47','2018-04-05 10:32:47','prachithapliyal10@gmail.com',NULL,29,1,NULL,2,4,'94558'),
 (31,'ppp','','2018-04-05 10:33:02','2018-04-05 10:33:02','prachithapliyal10@gmail.com',NULL,2,1,NULL,1,4,'33825'),
 (32,'po[','','2018-04-05 10:33:15','2018-04-05 10:33:15','prachithapliyal10@gmail.com',NULL,1,1,NULL,3,5,'90706'),
 (33,'d','','2018-04-05 10:41:50','2018-04-05 10:41:50','ak@gmail.com',NULL,26,1,NULL,3,87,'96001'),
 (34,'Dehradun','','2018-04-05 12:15:52','2018-04-05 12:15:52','a@b.com',NULL,14,1,NULL,3,151,'35004'),
 (35,'jkbhkh','','2018-04-05 12:35:31','2018-04-05 12:35:31','amadaan2@sapient.com',NULL,30,1,NULL,2,4,'36301');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (36,'Minnesota','','2018-04-05 13:31:52','2018-04-05 13:31:52','skhanwani@sapient.com',NULL,91,1,NULL,10,4,'79601'),
 (37,'Dehradun','def','2018-04-05 15:10:26','2018-04-05 15:10:26','amadaan2@sapient.com',NULL,61,1,NULL,7,4,'70053'),
 (38,'line1','','2018-04-05 17:15:33','2018-04-05 17:15:33','amadaan2@sapient.com',NULL,77,1,NULL,8,137,'96001'),
 (39,'fddcvf','line2','2018-04-05 17:15:57','2018-04-05 17:15:57','amadaan2@sapient.com',NULL,97,1,NULL,10,4,'94088'),
 (40,'street 1','','2018-04-06 09:18:47','2018-04-06 09:18:47','adityadobhal.22@gmail.com',NULL,51,1,NULL,6,4,'72348'),
 (41,'kj','','2018-04-06 09:19:18','2018-04-06 09:19:18','adityadobhal.22@gmail.com',NULL,99,1,NULL,10,4,'92720'),
 (42,'ewraewre','','2018-04-06 09:20:00','2018-04-06 09:20:00','adityadobhal.22@gmail.com',NULL,36,1,NULL,4,4,'87935'),
 (43,'bsvsf','','2018-04-06 10:06:15','2018-04-06 10:06:15','prachithapliyal10@gmail.com',NULL,48,1,NULL,5,5,'76530');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (44,'ssdsa','','2018-04-06 10:24:02','2018-04-06 10:24:02','adityadobhal.22@gmail.com',NULL,5,1,NULL,1,4,'32301'),
 (45,'sda','dsa','2018-04-06 10:24:21','2018-04-06 10:24:21','adityadobhal.22@gmail.com',NULL,64,1,NULL,7,4,'33063'),
 (46,'sda','','2018-04-06 10:24:52','2018-04-06 10:24:52','adityadobhal.22@gmail.com',NULL,91,1,NULL,10,4,'79601'),
 (47,'zsdfgsdf','dfsdf','2018-04-06 10:30:01','2018-04-06 10:30:01','amadaan2@sapient.com',NULL,68,1,NULL,7,4,'35210'),
 (48,'as','','2018-04-06 10:30:57','2018-04-06 10:30:57','adityadobhal.22@gmail.com',NULL,86,1,NULL,9,4,'75002'),
 (49,'sss','','2018-04-06 10:31:16','2018-04-06 10:31:16','adityadobhal.22@gmail.com',NULL,53,1,NULL,6,4,'10810'),
 (50,'Michonff','','2018-04-06 10:41:40','2018-04-06 10:41:40','aditimadaan0302@gmail.com',NULL,53,1,NULL,6,4,'10810'),
 (51,'Dehradun','def','2018-04-06 11:12:14','2018-04-06 11:12:14','amadaan2@sapient.com',NULL,59,1,NULL,6,4,'98328');
INSERT INTO `shipping_address` (`shipping_id`,`address_line1`,`address_line2`,`created_date`,`last_modified_date`,`mail`,`mobile`,`city_id`,`country_id`,`order_id`,`state_id`,`user_id`,`postal_code`) VALUES 
 (52,'jhjhghkgghkghk,','jbjm','2018-04-06 11:18:07','2018-04-06 11:18:07','abhan95@gmail.com',NULL,20,1,NULL,3,4,'92007'),
 (53,'gurgaon','','2018-04-06 16:09:03','2018-04-06 16:09:03','adityadobhal.22@gmail.com',NULL,19,1,NULL,3,4,'36442'),
 (54,'hjrLK','','2018-04-09 11:52:49','2018-04-09 11:52:49','shreyag932@gmail.com',NULL,68,1,NULL,7,4,'35210'),
 (55,'House No. 258','','2018-04-09 12:43:49','2018-04-09 12:43:49','pallavi.14bcs1150@abes.ac.in',NULL,35,1,NULL,4,4,'75002'),
 (56,'Gurgoan','','2018-04-09 13:57:53','2018-04-09 13:57:53','pallavi.14bcs1150@abes.ac.in',NULL,23,1,NULL,2,4,'94088'),
 (57,'cvbhv','nvbnv','2018-04-09 14:57:57','2018-04-09 14:57:57','amadaan2@sapient.com',NULL,56,1,NULL,6,137,'99763'),
 (58,'gur.jjnh','','2018-04-09 15:02:52','2018-04-09 15:02:52','pallavi.14bcs1150@abes.ac.in',NULL,11,1,NULL,1,4,'90028'),
 (59,'Gurgaon','','2018-04-09 16:48:39','2018-04-09 16:48:39','pallavi.14bcs1150@abes.ac.in',NULL,16,1,NULL,3,4,'35094');
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `state_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FKghic7mqjt6qb9vq7up7awu0er` (`country_id`),
  CONSTRAINT `FKghic7mqjt6qb9vq7up7awu0er` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`state_id`,`created_date`,`last_modified_date`,`state_name`,`country_id`) VALUES 
 (1,'2018-03-20 16:01:00','2018-03-20 16:01:00','Florida',1),
 (2,'2018-03-20 16:01:00','2018-03-20 16:01:00','California',1),
 (3,'2018-03-20 16:01:00','2018-03-20 16:01:00','Alabama',1),
 (4,'2018-03-20 16:01:00','2018-03-20 16:01:00','Texas',1),
 (5,'2018-03-20 16:01:00','2018-03-20 16:01:00','New Jersey',1),
 (6,'2018-03-20 16:01:00','2018-03-20 16:01:00','Alaska',1),
 (7,'2018-03-20 16:01:00','2018-03-20 16:01:00','Georgia',1),
 (8,'2018-03-20 16:01:00','2018-03-20 16:01:00','Indiana',1),
 (9,'2018-03-20 16:01:00','2018-03-20 16:01:00','Ohio',1),
 (10,'2018-03-20 16:01:00','2018-03-20 16:01:00','Michigan',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
CREATE TABLE `subscription` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` (`subscription_id`,`isbn`,`user_id`) VALUES 
 (2,'0132335530000',165);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;


--
-- Definition of table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE `transaction_history` (
  `unique_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`unique_no`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_history`
--

/*!40000 ALTER TABLE `transaction_history` DISABLE KEYS */;
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (1,'2018-04-06 11:08:58','2018-04-06 11:08:58',1309,'pending'),
 (2,'2018-04-06 11:09:56','2018-04-06 11:09:56',1309,'dispatched'),
 (3,'2018-04-06 11:10:15','2018-04-06 11:10:15',1309,'confirmed'),
 (4,'2018-04-06 11:43:31','2018-04-06 11:43:31',1311,'dispatched'),
 (5,'2018-04-06 11:43:31','2018-04-06 11:43:31',1310,'dispatched'),
 (6,'2018-04-06 11:43:31','2018-04-06 11:43:31',1306,'dispatched'),
 (7,'2018-04-06 11:57:10','2018-04-06 11:57:10',1314,'pending'),
 (8,'2018-04-06 12:00:09','2018-04-06 12:00:09',1313,'dispatched'),
 (9,'2018-04-06 12:09:57','2018-04-06 12:09:57',1319,'pending'),
 (10,'2018-04-06 12:10:29','2018-04-06 12:10:29',1320,'pending'),
 (11,'2018-04-06 12:11:06','2018-04-06 12:11:06',1320,'dispatched'),
 (12,'2018-04-06 12:16:16','2018-04-06 12:16:16',1321,'dispatched'),
 (13,'2018-04-06 12:24:07','2018-04-06 12:24:07',1322,'dispatched'),
 (14,'2018-04-06 12:34:56','2018-04-06 12:34:56',1323,'dispatched'),
 (15,'2018-04-06 12:34:59','2018-04-06 12:34:59',1314,'dispatched');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (16,'2018-04-06 12:35:52','2018-04-06 12:35:52',1314,'confirmed'),
 (17,'2018-04-06 12:41:12','2018-04-06 12:41:12',1324,'dispatched'),
 (18,'2018-04-06 12:58:48','2018-04-06 12:58:48',1325,'dispatched'),
 (19,'2018-04-06 13:51:47','2018-04-06 13:51:47',1330,'dispatched'),
 (20,'2018-04-06 13:53:09','2018-04-06 13:53:09',1329,'dispatched'),
 (21,'2018-04-06 14:35:04','2018-04-06 14:35:04',1330,'confirmed'),
 (22,'2018-04-06 14:37:25','2018-04-06 14:37:25',1329,'confirmed'),
 (23,'2018-04-06 14:38:39','2018-04-06 14:38:39',1315,'confirmed'),
 (24,'2018-04-06 14:39:13','2018-04-06 14:39:13',1326,'confirmed'),
 (25,'2018-04-06 14:39:20','2018-04-06 14:39:20',1325,'confirmed'),
 (26,'2018-04-06 14:40:39','2018-04-06 14:40:39',1310,'confirmed'),
 (27,'2018-04-06 14:45:18','2018-04-06 14:45:18',1297,'confirmed'),
 (28,'2018-04-06 14:45:32','2018-04-06 14:45:32',1305,'confirmed'),
 (29,'2018-04-06 14:49:57','2018-04-06 14:49:57',1331,'dispatched');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (30,'2018-04-06 15:07:35','2018-04-06 15:07:35',1332,'pending'),
 (31,'2018-04-06 15:08:24','2018-04-06 15:08:24',1317,'confirmed'),
 (32,'2018-04-06 15:30:32','2018-04-06 15:30:32',1333,'pending'),
 (33,'2018-04-06 15:31:06','2018-04-06 15:31:06',1334,'pending'),
 (34,'2018-04-06 15:31:40','2018-04-06 15:31:40',1335,'pending'),
 (35,'2018-04-06 15:45:45','2018-04-06 15:45:45',1336,'pending'),
 (36,'2018-04-06 15:47:44','2018-04-06 15:47:44',1337,'pending'),
 (37,'2018-04-06 16:11:09','2018-04-06 16:11:09',1337,'confirmed'),
 (38,'2018-04-06 16:11:46','2018-04-06 16:11:46',1336,'dispatched'),
 (39,'2018-04-06 16:11:56','2018-04-06 16:11:56',1336,'confirmed'),
 (40,'2018-04-06 16:12:34','2018-04-06 16:12:34',1316,'confirmed'),
 (41,'2018-04-06 16:13:42','2018-04-06 16:13:42',1335,'dispatched'),
 (42,'2018-04-06 16:13:57','2018-04-06 16:13:57',1335,'confirmed'),
 (43,'2018-04-06 16:14:33','2018-04-06 16:14:33',1341,'pending'),
 (44,'2018-04-06 16:15:52','2018-04-06 16:15:52',1342,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (45,'2018-04-06 16:16:11','2018-04-06 16:16:11',1342,'dispatched'),
 (46,'2018-04-06 16:16:21','2018-04-06 16:16:21',1342,'confirmed'),
 (47,'2018-04-06 16:16:26','2018-04-06 16:16:26',1341,'dispatched'),
 (48,'2018-04-06 16:16:37','2018-04-06 16:16:37',1341,'confirmed'),
 (49,'2018-04-06 16:16:56','2018-04-06 16:16:56',1343,'pending'),
 (50,'2018-04-06 16:17:56','2018-04-06 16:17:56',1344,'pending'),
 (51,'2018-04-06 16:22:03','2018-04-06 16:22:03',1344,'confirmed'),
 (52,'2018-04-06 16:22:07','2018-04-06 16:22:07',1340,'dispatched'),
 (53,'2018-04-06 16:22:20','2018-04-06 16:22:20',1340,'confirmed'),
 (54,'2018-04-06 16:28:48','2018-04-06 16:28:48',1272,'dispatched'),
 (55,'2018-04-06 16:28:48','2018-04-06 16:28:48',1271,'dispatched'),
 (56,'2018-04-06 16:28:48','2018-04-06 16:28:48',1270,'dispatched'),
 (57,'2018-04-06 16:28:48','2018-04-06 16:28:48',1269,'dispatched'),
 (58,'2018-04-06 16:28:48','2018-04-06 16:28:48',1268,'dispatched'),
 (59,'2018-04-06 16:28:48','2018-04-06 16:28:48',1267,'dispatched');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (60,'2018-04-06 16:29:57','2018-04-06 16:29:57',1266,'confirmed'),
 (61,'2018-04-06 16:29:57','2018-04-06 16:29:57',1265,'confirmed'),
 (62,'2018-04-06 16:29:57','2018-04-06 16:29:57',1264,'confirmed'),
 (63,'2018-04-06 16:29:57','2018-04-06 16:29:57',1263,'confirmed'),
 (64,'2018-04-06 16:29:57','2018-04-06 16:29:57',1262,'confirmed'),
 (65,'2018-04-06 16:29:57','2018-04-06 16:29:57',1261,'confirmed'),
 (66,'2018-04-06 16:29:57','2018-04-06 16:29:57',1260,'confirmed'),
 (67,'2018-04-06 16:29:57','2018-04-06 16:29:57',1259,'confirmed'),
 (68,'2018-04-06 16:30:28','2018-04-06 16:30:28',1273,'confirmed'),
 (69,'2018-04-06 16:30:28','2018-04-06 16:30:28',1272,'confirmed'),
 (70,'2018-04-06 16:30:28','2018-04-06 16:30:28',1271,'confirmed'),
 (71,'2018-04-06 16:30:28','2018-04-06 16:30:28',1270,'confirmed'),
 (72,'2018-04-06 16:30:28','2018-04-06 16:30:28',1269,'confirmed'),
 (73,'2018-04-06 16:30:28','2018-04-06 16:30:28',1268,'confirmed'),
 (74,'2018-04-06 16:30:28','2018-04-06 16:30:28',1267,'confirmed');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (75,'2018-04-06 16:30:34','2018-04-06 16:30:34',1345,'pending'),
 (76,'2018-04-06 16:31:02','2018-04-06 16:31:02',1347,'pending'),
 (77,'2018-04-06 16:31:04','2018-04-06 16:31:04',1347,'pending'),
 (78,'2018-04-06 16:34:46','2018-04-06 16:34:46',1349,'pending'),
 (79,'2018-04-06 16:34:49','2018-04-06 16:34:49',1350,'pending'),
 (80,'2018-04-06 16:35:05','2018-04-06 16:35:05',1349,'pending'),
 (81,'2018-04-06 16:36:14','2018-04-06 16:36:14',1351,'pending'),
 (82,'2018-04-06 16:36:26','2018-04-06 16:36:26',1352,'pending'),
 (83,'2018-04-06 16:36:50','2018-04-06 16:36:50',1353,'pending'),
 (84,'2018-04-06 16:39:35','2018-04-06 16:39:35',1353,'dispatched'),
 (85,'2018-04-06 16:39:35','2018-04-06 16:39:35',1343,'dispatched'),
 (86,'2018-04-06 16:39:36','2018-04-06 16:39:36',1353,'dispatched'),
 (87,'2018-04-06 16:39:36','2018-04-06 16:39:36',1343,'dispatched'),
 (88,'2018-04-06 16:42:26','2018-04-06 16:42:26',1354,'pending'),
 (89,'2018-04-06 16:42:53','2018-04-06 16:42:53',1355,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (90,'2018-04-06 17:32:04','2018-04-06 17:32:04',1356,'pending'),
 (91,'2018-04-06 17:32:44','2018-04-06 17:32:44',1357,'pending'),
 (92,'2018-04-06 17:31:05','2018-04-06 17:31:05',1357,'dispatched'),
 (93,'2018-04-06 17:53:02','2018-04-06 17:53:02',1356,'dispatched'),
 (94,'2018-04-06 19:30:53','2018-04-06 19:30:53',1359,'pending'),
 (95,'2018-04-06 19:30:54','2018-04-06 19:30:54',1359,'pending'),
 (96,'2018-04-06 19:34:30','2018-04-06 19:34:30',1360,'pending'),
 (97,'2018-04-06 19:46:28','2018-04-06 19:46:28',1362,'pending'),
 (98,'2018-04-06 19:46:31','2018-04-06 19:46:31',1363,'pending'),
 (99,'2018-04-06 19:46:57','2018-04-06 19:46:57',1365,'pending'),
 (100,'2018-04-06 19:47:22','2018-04-06 19:47:22',1366,'pending'),
 (101,'2018-04-06 19:47:45','2018-04-06 19:47:45',1367,'pending'),
 (102,'2018-04-06 19:52:37','2018-04-06 19:52:37',1358,'dispatched'),
 (103,'2018-04-06 19:53:10','2018-04-06 19:53:10',1358,'confirmed'),
 (104,'2018-04-06 19:54:12','2018-04-06 19:54:12',1359,'confirmed');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (105,'2018-04-06 22:32:02','2018-04-06 22:32:02',1368,'pending'),
 (106,'2018-04-07 09:33:17','2018-04-07 09:33:17',1369,'pending'),
 (107,'2018-04-09 09:26:00','2018-04-09 09:26:00',1370,'pending'),
 (108,'2018-04-09 09:27:07','2018-04-09 09:27:07',1371,'pending'),
 (109,'2018-04-09 09:39:51','2018-04-09 09:39:51',1371,'dispatched'),
 (110,'2018-04-09 09:40:07','2018-04-09 09:40:07',1371,'dispatched'),
 (111,'2018-04-09 09:40:22','2018-04-09 09:40:22',1370,'dispatched'),
 (112,'2018-04-09 09:40:34','2018-04-09 09:40:34',1371,'confirmed'),
 (113,'2018-04-09 09:41:57','2018-04-09 09:41:57',1372,'pending'),
 (114,'2018-04-09 09:52:55','2018-04-09 09:52:55',1373,'pending'),
 (115,'2018-04-09 09:53:59','2018-04-09 09:53:59',1374,'pending'),
 (116,'2018-04-09 09:54:59','2018-04-09 09:54:59',1374,'dispatched'),
 (117,'2018-04-09 09:55:12','2018-04-09 09:55:12',1374,'confirmed'),
 (118,'2018-04-09 10:00:02','2018-04-09 10:00:02',1375,'pending'),
 (119,'2018-04-09 10:03:39','2018-04-09 10:03:39',1376,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (120,'2018-04-09 10:07:25','2018-04-09 10:07:25',1377,'pending'),
 (121,'2018-04-09 10:17:05','2018-04-09 10:17:05',1378,'pending'),
 (122,'2018-04-09 10:18:07','2018-04-09 10:18:07',1379,'pending'),
 (123,'2018-04-09 10:18:39','2018-04-09 10:18:39',1379,'dispatched'),
 (124,'2018-04-09 10:20:47','2018-04-09 10:20:47',1380,'pending'),
 (125,'2018-04-09 10:21:09','2018-04-09 10:21:09',1381,'pending'),
 (126,'2018-04-09 10:21:20','2018-04-09 10:21:20',1382,'pending'),
 (127,'2018-04-09 10:24:13','2018-04-09 10:24:13',1381,'dispatched'),
 (128,'2018-04-09 10:23:14','2018-04-09 10:23:14',1382,'confirmed'),
 (129,'2018-04-09 10:23:29','2018-04-09 10:23:29',1381,'confirmed'),
 (130,'2018-04-09 10:23:29','2018-04-09 10:23:29',1257,'confirmed'),
 (131,'2018-04-09 10:23:47','2018-04-09 10:23:47',1380,'confirmed'),
 (132,'2018-04-09 10:25:26','2018-04-09 10:25:26',1378,'dispatched'),
 (133,'2018-04-09 10:25:39','2018-04-09 10:25:39',1378,'confirmed');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (134,'2018-04-09 10:34:29','2018-04-09 10:34:29',1383,'pending'),
 (135,'2018-04-09 10:34:42','2018-04-09 10:34:42',1384,'pending'),
 (136,'2018-04-09 10:35:07','2018-04-09 10:35:07',1385,'pending'),
 (137,'2018-04-09 10:36:26','2018-04-09 10:36:26',1386,'pending'),
 (138,'2018-04-09 10:39:48','2018-04-09 10:39:48',1377,'dispatched'),
 (139,'2018-04-09 10:42:11','2018-04-09 10:42:11',1387,'pending'),
 (140,'2018-04-09 10:42:42','2018-04-09 10:42:42',1387,'dispatched'),
 (141,'2018-04-09 10:40:49','2018-04-09 10:40:49',1377,'confirmed'),
 (142,'2018-04-09 10:47:19','2018-04-09 10:47:19',1388,'pending'),
 (143,'2018-04-09 10:53:33','2018-04-09 10:53:33',1389,'pending'),
 (144,'2018-04-09 10:54:37','2018-04-09 10:54:37',1390,'pending'),
 (145,'2018-04-09 11:02:34','2018-04-09 11:02:34',1391,'pending'),
 (146,'2018-04-09 11:06:01','2018-04-09 11:06:01',1391,'dispatched'),
 (147,'2018-04-09 11:06:59','2018-04-09 11:06:59',1392,'pending'),
 (148,'2018-04-09 11:07:45','2018-04-09 11:07:45',1393,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (149,'2018-04-09 11:12:57','2018-04-09 11:12:57',1394,'pending'),
 (150,'2018-04-09 11:20:42','2018-04-09 11:20:42',1394,'dispatched'),
 (151,'2018-04-09 11:20:55','2018-04-09 11:20:55',1385,'confirmed'),
 (152,'2018-04-09 11:21:11','2018-04-09 11:21:11',1385,'confirmed'),
 (153,'2018-04-09 11:21:15','2018-04-09 11:21:15',1384,'confirmed'),
 (154,'2018-04-09 11:21:27','2018-04-09 11:21:27',1394,'confirmed'),
 (155,'2018-04-09 11:25:10','2018-04-09 11:25:10',1393,'dispatched'),
 (156,'2018-04-09 11:23:14','2018-04-09 11:23:14',1393,'pending'),
 (157,'2018-04-09 11:26:26','2018-04-09 11:26:26',1396,'pending'),
 (158,'2018-04-09 11:26:39','2018-04-09 11:26:39',1395,'dispatched'),
 (159,'2018-04-09 11:26:40','2018-04-09 11:26:40',1395,'confirmed'),
 (160,'2018-04-09 11:29:51','2018-04-09 11:29:51',1396,'dispatched'),
 (161,'2018-04-09 11:30:08','2018-04-09 11:30:08',1392,'confirmed'),
 (162,'2018-04-09 11:36:38','2018-04-09 11:36:38',1390,'dispatched');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (163,'2018-04-09 11:38:14','2018-04-09 11:38:14',1397,'pending'),
 (164,'2018-04-09 11:39:27','2018-04-09 11:39:27',1398,'pending'),
 (165,'2018-04-09 11:43:41','2018-04-09 11:43:41',1398,'confirmed'),
 (166,'2018-04-09 11:45:27','2018-04-09 11:45:27',1399,'pending'),
 (167,'2018-04-09 11:45:58','2018-04-09 11:45:58',1397,'confirmed'),
 (168,'2018-04-09 11:46:20','2018-04-09 11:46:20',1400,'pending'),
 (169,'2018-04-09 11:47:22','2018-04-09 11:47:22',1401,'pending'),
 (170,'2018-04-09 11:48:59','2018-04-09 11:48:59',1402,'pending'),
 (171,'2018-04-09 11:55:42','2018-04-09 11:55:42',1403,'pending'),
 (172,'2018-04-09 11:56:50','2018-04-09 11:56:50',1404,'pending'),
 (173,'2018-04-09 11:58:22','2018-04-09 11:58:22',1405,'pending'),
 (174,'2018-04-09 12:00:02','2018-04-09 12:00:02',1406,'pending'),
 (175,'2018-04-09 12:00:55','2018-04-09 12:00:55',1407,'pending'),
 (176,'2018-04-09 12:01:33','2018-04-09 12:01:33',1408,'pending'),
 (177,'2018-04-09 12:02:31','2018-04-09 12:02:31',1409,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (178,'2018-04-09 12:05:05','2018-04-09 12:05:05',1410,'pending'),
 (179,'2018-04-09 12:10:06','2018-04-09 12:10:06',1411,'pending'),
 (180,'2018-04-09 12:14:15','2018-04-09 12:14:15',1412,'pending'),
 (181,'2018-04-09 12:15:06','2018-04-09 12:15:06',1413,'pending'),
 (182,'2018-04-09 12:17:26','2018-04-09 12:17:26',1414,'pending'),
 (183,'2018-04-09 12:19:07','2018-04-09 12:19:07',1415,'pending'),
 (184,'2018-04-09 12:25:58','2018-04-09 12:25:58',1416,'pending'),
 (185,'2018-04-09 12:32:06','2018-04-09 12:32:06',1417,'pending'),
 (186,'2018-04-09 12:33:25','2018-04-09 12:33:25',1418,'pending'),
 (187,'2018-04-09 12:34:19','2018-04-09 12:34:19',1419,'pending'),
 (188,'2018-04-09 12:35:07','2018-04-09 12:35:07',1420,'pending'),
 (189,'2018-04-09 12:37:31','2018-04-09 12:37:31',1368,'dispatched'),
 (190,'2018-04-09 12:39:23','2018-04-09 12:39:23',1368,'confirmed'),
 (191,'2018-04-09 12:40:55','2018-04-09 12:40:55',1421,'pending'),
 (192,'2018-04-09 12:43:10','2018-04-09 12:43:10',1422,'pending');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (193,'2018-04-09 12:44:01','2018-04-09 12:44:01',1423,'pending'),
 (194,'2018-04-09 12:44:33','2018-04-09 12:44:33',1424,'pending'),
 (195,'2018-04-09 12:44:38','2018-04-09 12:44:38',1423,'dispatched'),
 (196,'2018-04-09 12:45:20','2018-04-09 12:45:20',1423,'confirmed'),
 (197,'2018-04-09 12:51:59','2018-04-09 12:51:59',1425,'pending'),
 (198,'2018-04-09 12:59:06','2018-04-09 12:59:06',1425,'dispatched'),
 (199,'2018-04-09 13:00:26','2018-04-09 13:00:26',1426,'pending'),
 (200,'2018-04-09 13:01:55','2018-04-09 13:01:55',1426,'dispatched'),
 (201,'2018-04-09 13:53:53','2018-04-09 13:53:53',1424,'dispatched'),
 (202,'2018-04-09 13:55:13','2018-04-09 13:55:13',1422,'confirmed'),
 (203,'2018-04-09 14:07:06','2018-04-09 14:07:06',1427,'pending'),
 (204,'2018-04-09 14:16:56','2018-04-09 14:16:56',1428,'pending'),
 (205,'2018-04-09 14:26:16','2018-04-09 14:26:16',1429,'pending'),
 (206,'2018-04-09 14:28:47','2018-04-09 14:28:47',1429,'dispatched'),
 (207,'2018-04-09 14:43:55','2018-04-09 14:43:55',1428,'dispatched');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (208,'2018-04-09 14:44:14','2018-04-09 14:44:14',1428,'confirmed'),
 (209,'2018-04-09 14:50:46','2018-04-09 14:50:46',1427,'dispatched'),
 (210,'2018-04-09 14:51:19','2018-04-09 14:51:19',1427,'confirmed'),
 (211,'2018-04-09 14:58:05','2018-04-09 14:58:05',1430,'pending'),
 (212,'2018-04-09 15:20:23','2018-04-09 15:20:23',1431,'pending'),
 (213,'2018-04-09 15:34:44','2018-04-09 15:34:44',1429,'confirmed'),
 (214,'2018-04-09 15:34:51','2018-04-09 15:34:51',1424,'confirmed'),
 (215,'2018-04-09 15:53:06','2018-04-09 15:53:06',1421,'dispatched'),
 (216,'2018-04-09 15:54:01','2018-04-09 15:54:01',1426,'confirmed'),
 (217,'2018-04-09 15:58:36','2018-04-09 15:58:36',1426,'confirmed'),
 (218,'2018-04-09 15:59:12','2018-04-09 15:59:12',1425,'confirmed'),
 (219,'2018-04-09 15:59:32','2018-04-09 15:59:32',1425,'confirmed'),
 (220,'2018-04-09 16:10:37','2018-04-09 16:10:37',1431,'confirmed'),
 (221,'2018-04-09 16:10:48','2018-04-09 16:10:48',1430,'confirmed');
INSERT INTO `transaction_history` (`unique_no`,`created_date`,`last_modified_date`,`order_id`,`status`) VALUES 
 (222,'2018-04-09 16:46:09','2018-04-09 16:46:09',1420,'confirmed'),
 (223,'2018-04-09 16:49:22','2018-04-09 16:49:22',1432,'pending'),
 (224,'2018-04-09 17:08:46','2018-04-09 17:08:46',1421,'confirmed'),
 (225,'2018-04-09 17:20:19','2018-04-09 17:20:19',1432,'confirmed');
/*!40000 ALTER TABLE `transaction_history` ENABLE KEYS */;


--
-- Definition of table `user_cart`
--

DROP TABLE IF EXISTS `user_cart`;
CREATE TABLE `user_cart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  UNIQUE KEY `UK_mk3cp7wbsbrr31nkd19bb63i7` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_cart`
--

/*!40000 ALTER TABLE `user_cart` DISABLE KEYS */;
INSERT INTO `user_cart` (`cart_id`,`user_id`) VALUES 
 (12,5),
 (47,10),
 (8,19),
 (11,26),
 (18,31),
 (1,38),
 (4,41),
 (3,42),
 (37,43),
 (23,49),
 (25,51),
 (16,54),
 (20,59),
 (27,62),
 (5,64),
 (13,77),
 (14,83),
 (40,84),
 (6,87),
 (9,92),
 (2,99),
 (7,117),
 (10,119),
 (17,120),
 (38,121),
 (15,123),
 (19,132),
 (21,133),
 (22,135),
 (24,137),
 (26,138),
 (28,139),
 (29,141),
 (30,145),
 (31,147),
 (32,148),
 (34,151),
 (35,152),
 (33,153),
 (36,154),
 (39,155),
 (41,159),
 (42,160),
 (43,161),
 (44,162),
 (45,163),
 (46,164),
 (48,165),
 (49,166),
 (50,167);
/*!40000 ALTER TABLE `user_cart` ENABLE KEYS */;


--
-- Definition of table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKbbwlke5ei3gh1ki65yiiojmck` (`user_id`),
  KEY `FKo2lj94xaujs1se8whlhc37nj7` (`shipping_address_id`),
  CONSTRAINT `FKbbwlke5ei3gh1ki65yiiojmck` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKo2lj94xaujs1se8whlhc37nj7` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`shipping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_order`
--

/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1256,'2018-04-05 15:26:23',0x00,'2018-04-06 09:42:51','COD',114,'confirmed',99,NULL),
 (1257,'2018-04-05 15:28:23',0x00,'2018-04-09 10:23:29','COD',1382,'confirmed',139,NULL),
 (1258,'2018-04-05 15:29:10',0x00,'2018-04-05 18:10:57','COD',4250,'confirmed',139,NULL),
 (1259,'2018-04-05 16:01:06',0x00,'2018-04-06 16:29:57','COD',3996.25,'confirmed',137,NULL),
 (1260,'2018-04-05 16:03:10',0x00,'2018-04-06 16:29:57','COD',0,'confirmed',137,NULL),
 (1261,'2018-04-05 16:03:20',0x00,'2018-04-06 16:29:57','COD',0,'confirmed',137,NULL),
 (1262,'2018-04-05 16:03:52',0x00,'2018-04-06 16:29:57','COD',800,'confirmed',137,NULL),
 (1263,'2018-04-05 16:06:12',0x00,'2018-04-06 16:29:57','COD',0,'confirmed',137,NULL),
 (1264,'2018-04-05 16:06:23',0x00,'2018-04-06 16:29:57','COD',1714,'confirmed',137,NULL),
 (1265,'2018-04-05 16:04:12',0x00,'2018-04-06 16:29:57','COD',800,'confirmed',5,NULL),
 (1266,'2018-04-05 16:05:50',0x00,'2018-04-06 16:29:57','COD',800,'confirmed',5,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1267,'2018-04-05 16:08:07',0x00,'2018-04-06 16:30:28','COD',1382,'confirmed',137,NULL),
 (1268,'2018-04-05 16:09:46',0x00,'2018-04-06 16:30:28','COD',645,'confirmed',137,NULL),
 (1269,'2018-04-05 16:08:20',0x00,'2018-04-06 16:30:28','COD',800,'confirmed',5,NULL),
 (1270,'2018-04-05 16:09:05',0x00,'2018-04-06 16:30:28','COD',800,'confirmed',5,NULL),
 (1271,'2018-04-05 16:09:31',0x00,'2018-04-06 16:30:28','COD',800,'confirmed',5,NULL),
 (1272,'2018-04-05 16:09:54',0x00,'2018-04-06 16:30:28','COD',800,'confirmed',5,NULL),
 (1273,'2018-04-05 16:10:47',0x00,'2018-04-06 16:30:28','COD',800,'confirmed',5,NULL),
 (1274,'2018-04-05 16:21:42',0x00,'2018-04-05 16:21:42','COD',2598,'pending',137,NULL),
 (1275,'2018-04-05 16:19:53',0x00,'2018-04-05 16:19:53','COD',800,'pending',148,NULL),
 (1276,'2018-04-05 16:20:36',0x00,'2018-04-05 18:08:17','COD',800,'confirmed',148,NULL),
 (1277,'2018-04-05 16:23:19',0x00,'2018-04-05 18:08:17','COD',800,'confirmed',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1278,'2018-04-05 18:21:50',0x00,'2018-04-05 18:22:14','COD',150,'dispatched',137,NULL),
 (1279,'2018-04-05 18:24:01',0x00,'2018-04-06 09:39:24','COD',110,'confirmed',137,NULL),
 (1280,'2018-04-06 09:20:55',0x00,'2018-04-06 09:20:55','COD',645,'pending',26,NULL),
 (1281,'2018-04-06 09:21:25',0x00,'2018-04-06 09:36:35','COD',672,'dispatched',26,NULL),
 (1282,'2018-04-06 09:42:21',0x00,'2018-04-06 09:42:51','COD',957,'confirmed',99,NULL),
 (1283,'2018-04-06 09:42:29',0x00,'2018-04-06 09:42:29','COD',786,'pending',19,NULL),
 (1284,'2018-04-06 09:46:29',0x00,'2018-04-06 09:46:29','COD',3782,'pending',99,NULL),
 (1285,'2018-04-06 09:44:24',0x00,'2018-04-06 09:57:17','COD',220,'dispatched',5,30),
 (1286,'2018-04-06 09:45:17',0x00,'2018-04-06 09:45:17','COD',977,'pending',19,NULL),
 (1287,'2018-04-06 09:45:38',0x00,'2018-04-06 09:45:38','COD',1622,'pending',5,NULL),
 (1288,'2018-04-06 09:50:18',0x00,'2018-04-06 09:50:18','COD',1327,'pending',99,27);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1289,'2018-04-06 09:52:04',0x00,'2018-04-06 09:52:04','COD',342,'pending',19,NULL),
 (1290,'2018-04-06 09:52:39',0x00,'2018-04-06 09:52:39','COD',1382,'pending',137,NULL),
 (1291,'2018-04-06 09:55:38',0x00,'2018-04-06 09:55:38','COD',1020,'pending',137,NULL),
 (1292,'2018-04-06 09:55:54',0x00,'2018-04-06 09:55:54','COD',1623,'pending',137,NULL),
 (1293,'2018-04-06 09:56:04',0x00,'2018-04-06 09:56:04','COD',222,'pending',137,NULL),
 (1294,'2018-04-06 09:56:15',0x00,'2018-04-06 09:56:15','COD',631,'pending',137,NULL),
 (1295,'2018-04-06 09:56:23',0x00,'2018-04-06 09:56:23','COD',977,'pending',137,NULL),
 (1296,'2018-04-06 10:01:17',0x00,'2018-04-06 10:01:17','COD',1714,'pending',139,NULL),
 (1297,'2018-04-06 10:00:14',0x00,'2018-04-06 14:45:18','COD',342,'confirmed',19,NULL),
 (1298,'2018-04-06 10:05:37',0x00,'2018-04-06 10:05:37','COD',3173,'pending',137,38),
 (1299,'2018-04-06 10:03:57',0x00,'2018-04-06 10:03:57','COD',1954,'pending',5,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1300,'2018-04-06 10:10:07',0x00,'2018-04-06 10:10:07','COD',450,'pending',19,NULL),
 (1301,'2018-04-06 10:10:39',0x00,'2018-04-06 10:10:39','COD',222,'pending',19,NULL),
 (1302,'2018-04-06 10:11:02',0x00,'2018-04-06 10:11:02','COD',800,'pending',19,NULL),
 (1303,'2018-04-06 10:36:41',0x00,'2018-04-06 11:31:25','COD',1250,'dispatched',121,NULL),
 (1304,'2018-04-06 10:35:09',0x00,'2018-04-06 10:35:09','COD',1746,'pending',26,NULL),
 (1305,'2018-04-06 10:36:25',0x00,'2018-04-06 14:45:32','COD',220,'confirmed',26,NULL),
 (1306,'2018-04-06 10:41:49',0x00,'2018-04-06 11:43:31','COD',1537,'dispatched',121,NULL),
 (1307,'2018-04-06 10:44:15',0x00,'2018-04-06 10:55:34','COD',800,'dispatched',121,NULL),
 (1308,'2018-04-06 10:44:18',0x00,'2018-04-06 11:01:00','COD',800,'confirmed',121,NULL),
 (1309,'2018-04-06 11:08:56',0x00,'2018-04-06 11:10:15','COD',1365,'confirmed',137,NULL),
 (1310,'2018-04-06 11:15:43',0x00,'2018-04-06 14:40:39','COD',737,'confirmed',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1311,'2018-04-06 11:18:13',0x00,'2018-04-06 11:43:31','COD',631,'dispatched',77,NULL),
 (1312,'2018-04-06 11:18:03',0x00,'2018-04-06 11:23:28','COD',800,'dispatched',148,NULL),
 (1313,'2018-04-06 11:37:29',0x00,'2018-04-06 12:00:09','COD',418,'dispatched',137,NULL),
 (1314,'2018-04-06 11:57:07',0x00,'2018-04-06 12:35:52','COD',1427,'confirmed',137,NULL),
 (1315,'2018-04-06 11:55:45',0x00,'2018-04-06 14:38:39','COD',786,'confirmed',19,NULL),
 (1316,'2018-04-06 12:01:48',0x00,'2018-04-06 16:12:34','COD',786,'confirmed',19,NULL),
 (1317,'2018-04-06 12:04:26',0x00,'2018-04-06 15:08:24','COD',786,'confirmed',19,NULL),
 (1318,'2018-04-06 12:06:06',0x00,'2018-04-06 14:04:05','COD',220,'confirmed',148,NULL),
 (1319,'2018-04-06 12:09:54',0x00,'2018-04-06 13:54:12','COD',2227,'confirmed',137,NULL),
 (1320,'2018-04-06 12:10:26',0x00,'2018-04-06 12:11:06','COD',204,'dispatched',137,NULL),
 (1321,'2018-04-06 12:13:50',0x00,'2018-04-06 12:16:16','COD',127,'dispatched',137,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1322,'2018-04-06 12:21:16',0x00,'2018-04-06 12:24:07','COD',35,'dispatched',137,NULL),
 (1323,'2018-04-06 12:32:14',0x00,'2018-04-06 12:34:56','COD',64,'dispatched',137,NULL),
 (1324,'2018-04-06 12:38:10',0x00,'2018-04-06 12:41:12','COD',19,'dispatched',137,NULL),
 (1325,'2018-04-06 12:55:33',0x00,'2018-04-06 14:39:20','COD',89,'confirmed',137,NULL),
 (1326,'2018-04-06 13:01:01',0x00,'2018-04-06 14:39:12','COD',222,'confirmed',148,NULL),
 (1327,'2018-04-06 13:06:58',0x00,'2018-04-06 13:53:56','COD',222,'confirmed',148,NULL),
 (1328,'2018-04-06 13:07:16',0x00,'2018-04-06 14:01:51','COD',222,'confirmed',148,NULL),
 (1329,'2018-04-06 13:15:45',0x00,'2018-04-06 14:37:25','COD',222,'confirmed',148,NULL),
 (1330,'2018-04-06 13:35:38',0x00,'2018-04-06 14:35:04','COD',342,'confirmed',19,NULL),
 (1331,'2018-04-06 14:47:18',0x00,'2018-04-06 14:49:56','COD',3859,'dispatched',137,NULL),
 (1332,'2018-04-06 15:07:32',0x00,'2018-04-06 15:07:32','COD',450,'pending',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1333,'2018-04-06 15:30:29',0x00,'2018-04-06 15:30:29','COD',222,'pending',148,NULL),
 (1334,'2018-04-06 15:31:02',0x00,'2018-04-06 15:31:02','COD',645,'pending',148,NULL),
 (1335,'2018-04-06 15:31:37',0x00,'2018-04-06 16:13:56','COD',222,'confirmed',148,NULL),
 (1336,'2018-04-06 15:45:41',0x00,'2018-04-06 16:11:56','COD',50,'confirmed',137,NULL),
 (1337,'2018-04-06 15:47:40',0x00,'2018-04-06 16:11:09','COD',0,'confirmed',137,NULL),
 (1338,'2018-04-06 16:14:25',0x00,'2018-04-06 16:14:25','COD',764,'pending',26,NULL),
 (1339,'2018-04-06 16:14:27',0x00,'2018-04-06 16:14:27','COD',764,'pending',26,NULL),
 (1340,'2018-04-06 16:14:27',0x00,'2018-04-06 16:22:20','COD',764,'confirmed',26,NULL),
 (1341,'2018-04-06 16:14:30',0x00,'2018-04-06 16:16:37','COD',764,'confirmed',26,NULL),
 (1342,'2018-04-06 16:15:48',0x00,'2018-04-06 16:16:21','COD',764,'confirmed',26,NULL),
 (1343,'2018-04-06 16:16:53',0x00,'2018-04-06 16:39:35','COD',1643,'dispatched',5,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1344,'2018-04-06 16:17:53',0x00,'2018-04-06 16:22:03','COD',1528,'confirmed',26,NULL),
 (1345,'2018-04-06 16:30:31',0x00,'2018-04-06 16:30:31','COD',662,'pending',5,NULL),
 (1346,'2018-04-06 16:30:58',0x00,'2018-04-06 16:30:58','COD',800,'pending',5,NULL),
 (1347,'2018-04-06 16:31:02',0x00,'2018-04-06 16:31:02','COD',800,'pending',5,NULL),
 (1348,'2018-04-06 16:34:42',0x00,'2018-04-06 16:34:42','COD',3171,'pending',19,NULL),
 (1349,'2018-04-06 16:34:43',0x00,'2018-04-06 16:34:43','COD',3171,'pending',19,NULL),
 (1350,'2018-04-06 16:34:47',0x00,'2018-04-06 16:34:47','COD',225,'pending',137,38),
 (1351,'2018-04-06 16:36:11',0x00,'2018-04-06 16:36:11','COD',212,'pending',19,NULL),
 (1352,'2018-04-06 16:36:23',0x00,'2018-04-06 16:36:23','COD',645,'pending',19,NULL),
 (1353,'2018-04-06 16:36:47',0x00,'2018-04-06 16:39:35','COD',220,'dispatched',19,NULL),
 (1354,'2018-04-06 16:42:24',0x00,'2018-04-06 16:42:24','COD',222,'pending',26,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1355,'2018-04-06 16:42:50',0x00,'2018-04-06 16:42:50','COD',670,'pending',26,NULL),
 (1356,'2018-04-06 17:32:01',0x00,'2018-04-06 17:53:02','COD',630,'dispatched',137,NULL),
 (1357,'2018-04-06 17:32:41',0x00,'2018-04-06 17:31:05','COD',630,'dispatched',137,NULL),
 (1358,'2018-04-06 19:30:50',0x00,'2018-04-06 19:53:10','COD',175,'confirmed',139,NULL),
 (1359,'2018-04-06 19:30:52',0x00,'2018-04-06 19:54:12','COD',175,'confirmed',139,NULL),
 (1360,'2018-04-06 19:34:27',0x00,'2018-04-06 19:34:27','COD',40,'pending',139,NULL),
 (1361,'2018-04-06 19:46:24',0x00,'2018-04-06 19:46:24','COD',666,'pending',137,NULL),
 (1362,'2018-04-06 19:46:28',0x00,'2018-04-06 19:46:28','COD',666,'pending',137,NULL),
 (1366,'2018-04-06 19:47:19',0x00,'2018-04-06 19:47:19','COD',55,'pending',137,NULL),
 (1367,'2018-04-06 19:47:43',0x00,'2018-04-06 19:47:43','COD',0,'pending',137,NULL),
 (1368,'2018-04-06 22:32:00',0x00,'2018-04-09 12:39:23','COD',3000000000,'confirmed',137,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1369,'2018-04-07 09:33:14',0x00,'2018-04-07 09:33:14','COD',70,'pending',5,32),
 (1370,'2018-04-09 09:25:57',0x00,'2018-04-09 09:40:22','COD',2292,'dispatched',133,NULL),
 (1371,'2018-04-09 09:27:04',0x00,'2018-04-09 09:40:34','COD',1326.25,'confirmed',133,NULL),
 (1372,'2018-04-09 09:41:55',0x00,'2018-04-09 09:41:55','COD',666,'pending',148,NULL),
 (1373,'2018-04-09 09:52:52',0x00,'2018-04-09 09:52:52','COD',2293,'pending',5,32),
 (1374,'2018-04-09 09:53:57',0x00,'2018-04-09 09:55:12','COD',215,'confirmed',5,43),
 (1375,'2018-04-09 09:59:58',0x00,'2018-04-09 09:59:58','COD',24097,'pending',137,NULL),
 (1376,'2018-04-09 10:03:36',0x00,'2018-04-09 10:03:36','COD',750,'pending',5,NULL),
 (1377,'2018-04-09 10:07:22',0x00,'2018-04-09 10:40:49','COD',63,'confirmed',137,NULL),
 (1378,'2018-04-09 10:17:02',0x00,'2018-04-09 10:25:39','COD',800,'confirmed',155,NULL),
 (1379,'2018-04-09 10:18:04',0x00,'2018-04-09 10:18:38','COD',75,'dispatched',155,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1380,'2018-04-09 10:20:43',0x00,'2018-04-09 10:23:47','COD',120,'confirmed',155,NULL),
 (1381,'2018-04-09 10:21:06',0x00,'2018-04-09 10:23:29','COD',675,'confirmed',137,NULL),
 (1382,'2018-04-09 10:21:16',0x00,'2018-04-09 10:23:14','COD',374.25,'confirmed',26,NULL),
 (1383,'2018-04-09 10:34:25',0x00,'2018-04-09 10:34:25','COD',666,'pending',10,NULL),
 (1384,'2018-04-09 10:34:40',0x00,'2018-04-09 11:21:15','COD',677,'confirmed',10,NULL),
 (1385,'2018-04-09 10:35:03',0x00,'2018-04-09 11:20:55','COD',2031,'confirmed',10,NULL),
 (1386,'2018-04-09 10:36:23',0x00,'2018-04-09 10:36:23','COD',420.25,'pending',10,NULL),
 (1387,'2018-04-09 10:42:08',0x00,'2018-04-09 10:42:42','COD',60.25,'dispatched',155,NULL),
 (1388,'2018-04-09 10:47:16',0x00,'2018-04-09 10:47:16','COD',120,'pending',19,NULL),
 (1389,'2018-04-09 10:53:30',0x00,'2018-04-09 10:53:30','COD',2565,'pending',87,NULL),
 (1390,'2018-04-09 10:54:34',0x00,'2018-04-09 11:36:38','COD',666,'dispatched',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1391,'2018-04-09 11:02:32',0x00,'2018-04-09 11:06:01','COD',120,'dispatched',19,NULL),
 (1392,'2018-04-09 11:06:57',0x00,'2018-04-09 11:30:07','COD',952,'confirmed',10,NULL),
 (1393,'2018-04-09 11:07:43',0x00,'2018-04-09 11:25:10','COD',666,'dispatched',148,NULL),
 (1394,'2018-04-09 11:12:51',0x00,'2018-04-09 11:21:27','COD',666,'confirmed',148,NULL),
 (1395,'2018-04-09 11:23:10',0x00,'2018-04-09 11:26:40','COD',666,'confirmed',148,NULL),
 (1396,'2018-04-09 11:26:23',0x00,'2018-04-09 11:29:51','COD',666,'dispatched',148,NULL),
 (1397,'2018-04-09 11:38:12',0x00,'2018-04-09 11:45:58','COD',666,'confirmed',148,NULL),
 (1398,'2018-04-09 11:39:24',0x00,'2018-04-09 11:43:41','COD',666,'confirmed',148,NULL),
 (1399,'2018-04-09 11:45:24',0x00,'2018-04-09 11:45:24','COD',666,'pending',148,NULL),
 (1400,'2018-04-09 11:46:16',0x00,'2018-04-09 11:46:16','COD',666,'pending',148,NULL),
 (1401,'2018-04-09 11:47:19',0x00,'2018-04-09 11:47:19','COD',666,'pending',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1402,'2018-04-09 11:48:56',0x00,'2018-04-09 11:48:56','COD',666,'pending',148,NULL),
 (1403,'2018-04-09 11:55:39',0x00,'2018-04-09 11:55:39','COD',666,'pending',148,NULL),
 (1404,'2018-04-09 11:56:47',0x00,'2018-04-09 11:56:47','COD',666,'pending',148,NULL),
 (1405,'2018-04-09 11:58:19',0x00,'2018-04-09 11:58:19','COD',666,'pending',148,NULL),
 (1406,'2018-04-09 11:59:59',0x00,'2018-04-09 11:59:59','COD',666,'pending',148,NULL),
 (1407,'2018-04-09 12:00:50',0x00,'2018-04-09 12:00:50','COD',666,'pending',148,NULL),
 (1408,'2018-04-09 12:01:30',0x00,'2018-04-09 12:01:30','COD',666,'pending',148,NULL),
 (1409,'2018-04-09 12:02:28',0x00,'2018-04-09 12:02:28','COD',666,'pending',148,NULL),
 (1410,'2018-04-09 12:05:03',0x00,'2018-04-09 12:05:03','COD',666,'pending',148,NULL),
 (1411,'2018-04-09 12:10:03',0x00,'2018-04-09 12:10:03','COD',666,'pending',148,NULL),
 (1412,'2018-04-09 12:14:11',0x00,'2018-04-09 12:14:11','COD',666,'pending',148,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1413,'2018-04-09 12:15:04',0x00,'2018-04-09 12:15:04','COD',666,'pending',148,NULL),
 (1414,'2018-04-09 12:17:22',0x00,'2018-04-09 12:17:22','COD',666,'pending',148,NULL),
 (1415,'2018-04-09 12:19:03',0x00,'2018-04-09 12:19:03','COD',666,'pending',148,NULL),
 (1416,'2018-04-09 12:25:55',0x00,'2018-04-09 12:25:55','COD',666,'pending',148,NULL),
 (1417,'2018-04-09 12:32:02',0x00,'2018-04-09 12:32:02','COD',666,'pending',148,NULL),
 (1418,'2018-04-09 12:33:21',0x00,'2018-04-09 12:33:21','COD',666,'pending',148,NULL),
 (1419,'2018-04-09 12:34:16',0x00,'2018-04-09 12:34:16','COD',666,'pending',148,NULL),
 (1420,'2018-04-09 12:35:04',0x00,'2018-04-09 16:46:09','COD',666,'confirmed',148,NULL),
 (1421,'2018-04-09 12:40:52',0x00,'2018-04-09 17:08:46','COD',666,'confirmed',148,NULL),
 (1422,'2018-04-09 12:43:06',0x00,'2018-04-09 13:55:13','COD',666,'confirmed',148,NULL),
 (1423,'2018-04-09 12:43:58',0x00,'2018-04-09 12:45:20','COD',786,'confirmed',165,NULL);
INSERT INTO `user_order` (`order_id`,`created_date`,`is_active`,`last_modified_date`,`payment_mode`,`price`,`status`,`user_id`,`shipping_address_id`) VALUES 
 (1424,'2018-04-09 12:44:30',0x00,'2018-04-09 15:34:51','COD',666,'confirmed',148,NULL),
 (1425,'2018-04-09 12:51:56',0x00,'2018-04-09 15:59:12','COD',37.25,'confirmed',155,NULL),
 (1426,'2018-04-09 13:00:24',0x00,'2018-04-09 15:54:01','COD',22,'confirmed',155,NULL),
 (1427,'2018-04-09 14:07:04',0x00,'2018-04-09 14:51:19','COD',666,'confirmed',165,NULL),
 (1428,'2018-04-09 14:16:53',0x00,'2018-04-09 14:44:14','COD',786,'confirmed',148,NULL),
 (1429,'2018-04-09 14:26:13',0x00,'2018-04-09 15:34:44','COD',374.25,'confirmed',155,NULL),
 (1430,'2018-04-09 14:58:01',0x00,'2018-04-09 16:10:48','COD',677,'confirmed',137,57),
 (1431,'2018-04-09 15:20:20',0x00,'2018-04-09 16:10:37','COD',677,'confirmed',121,NULL),
 (1432,'2018-04-09 16:49:19',0x00,'2018-04-09 17:20:19','COD',10351,'confirmed',165,NULL);
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `is_admin` bit(1) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_jhck7kjdogc7yia7qamc89ypv` (`mail`),
  KEY `FKkpqrx37esphstf2tqxbt89avn` (`city_id`),
  KEY `FK5t4yyo3f0ctxayh7voqv51fmg` (`country_id`),
  KEY `FKrbachxgjwxcvfw47e1425qrgr` (`state_id`),
  CONSTRAINT `FK5t4yyo3f0ctxayh7voqv51fmg` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FKkpqrx37esphstf2tqxbt89avn` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `FKrbachxgjwxcvfw47e1425qrgr` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (1,'Dehradun','','2018-03-22 13:14:58','vishal',0x01,0x00,'2018-03-22 13:14:58','sanerwal','vishal@gmail.com','8755411742',16,1,3),
 (2,'Dehradun','','2018-03-22 13:42:34','Vishal',0x01,0x00,'2018-03-27 16:23:15','Sanserwal','vishal24@gmail.com','8755411742',32,1,4),
 (3,'Sapient Razorfish','Sector 144','2018-03-22 13:43:05','Vishal',0x01,0x00,'2018-03-28 12:25:06','Mujumdar','vmujumdar2@sapient.com','0000000000',19,1,3),
 (4,'abc','def','2018-03-22 13:57:51','khushi',0x00,0x00,'2018-03-22 14:11:32','sharma','ksha62@sapient.com','9929978406',82,1,7),
 (5,'abc ','','2018-03-22 17:02:57','Prachi',0x00,0x00,'2018-03-22 17:02:57','Thapliyal','prachithapliyal10@gmail.com','8279586155',22,1,2),
 (6,'aaa','aa','2018-03-22 17:07:44','a',0x01,0x00,'2018-03-23 14:15:53','a','a','11',8,1,1),
 (7,'fbfvz','dfbgzdb','2018-03-22 17:18:26','Navneet',0x00,0x00,'2018-03-22 17:18:26','G','navu@gmail.com','4562145878',89,1,9),
 (8,'ok','hjk','2018-03-23 08:39:55','xx',0x00,0x00,'2018-03-23 08:39:55','xx','gh','90',98,1,10);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (9,'i','i','2018-03-23 09:26:47','j',0x00,0x00,'2018-03-23 09:26:47','j','ol','o',49,1,5),
 (10,'fsdgd','dsg','2018-03-23 09:30:49','Prachi1',NULL,0x00,'2018-04-09 11:06:44','Thapliyal','pthapliyal@sapient.com','7542',96,1,10),
 (11,'p','p','2018-03-23 09:33:51','p',NULL,0x00,'2018-03-23 09:33:51','p','p','7542',34,1,4),
 (14,'qqq','qqqq','2018-03-23 10:30:07','test',0x01,0x00,'2018-03-23 10:30:07','test','test@gmail.com','87554',34,1,4),
 (15,'abc','xyzx','2018-03-23 10:29:48','sagar',0x01,0x00,'2018-03-23 10:29:48','salal','sagarsalal105@gmail.com','9690344359',15,1,3),
 (16,'asdas','sadddddd','2018-03-23 10:35:04','ad',0x01,0x00,'2018-03-23 11:15:06','ad','a@gmail.com','8',48,1,4),
 (18,'7','','2018-03-23 10:36:26','a',0x00,0x00,'2018-03-23 10:36:26','a','e','9',24,1,2),
 (19,'ghazia','s','2018-03-23 10:38:20','shreya',0x00,0x00,'2018-04-09 10:17:11','garg','shreyag932@gmail.com','8527238720',37,1,4),
 (21,'6','','2018-03-23 10:44:31','shreya',0x00,0x00,'2018-03-23 10:44:31','garg','2','6',79,1,8);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (22,'a','a','2018-03-23 10:59:22','vishal',0x01,0x00,'2018-03-23 10:59:22','v','a@b.c','11',52,1,6),
 (23,'l','l','2018-03-23 11:43:14','l',NULL,0x00,'2018-03-23 11:43:14','l','l','4844646944',51,1,6),
 (24,'hga','jbsdfh','2018-03-23 12:40:17','Vaibhav',0x01,0x00,'2018-03-23 12:40:17','bisht','vb@g.com','989898',22,1,2),
 (26,'abc abc','assd','2018-03-23 12:55:48','Aditya',0x01,0x00,'2018-04-06 16:37:51','Dobhal','adityadobhal.22@gmail.com','1111111111',71,1,8),
 (27,'g','g','2018-03-23 13:00:22','Aditya',0x01,0x00,'2018-03-23 13:00:22','Dobhal','gdfgfdg','9799',96,1,10),
 (28,'dsa','dsf','2018-03-23 13:01:02','ad',0x01,0x00,'2018-03-23 13:01:02','ad','dasada','23232',39,1,4),
 (30,'aaaa','aaaa','2018-03-23 14:35:06','a',0x01,0x00,'2018-03-23 14:35:06','a','aasas','a',95,1,10),
 (31,'pl 1','b road','2018-03-23 16:09:34','sakshi',0x00,0x00,'2018-03-23 16:09:34','khanwani','skhanwani@sapient.com','9112233445',57,1,6),
 (33,'v','v','2018-03-23 16:14:37','a',0x01,0x00,'2018-03-23 16:14:37','a','ab','9',70,1,7);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (34,'1','1','2018-03-23 16:16:06','ab',0x01,0x00,'2018-03-23 16:16:06','a','abc','7',80,1,8),
 (35,'Line 1','Line 2','2018-03-23 18:30:35','sagar',0x01,0x00,'2018-03-23 18:30:35','salal','sagar@mail.com','1234567890',86,1,9),
 (37,'sector 6','2','2018-03-23 19:12:17','prateek',0x01,0x00,'2018-03-23 19:12:17','garg','pgar13@sapient.com','9898989898',6,1,1),
 (38,'line 1','line 2','2018-03-24 17:23:43','sagar',0x01,0x01,'2018-03-28 12:34:06','salal','sagarsalal@gmail.com','9690344359',88,1,9),
 (39,'paras','','2018-03-24 18:17:55','mehran',0x01,0x00,'2018-03-24 18:17:55','ahmed','mehranahmed@gmail.com','7906005381',65,1,7),
 (40,'sad','asdas','2018-03-24 18:51:53','sada',0x01,0x00,'2018-03-24 18:51:53','asdasd','ksha621@sapient.com','1234567890',91,1,10),
 (41,'......','','2018-03-26 09:17:23','Prachi',0x00,0x00,'2018-04-04 13:59:25','Thapliyal','prachi@kj','9778517775',24,1,2),
 (42,'swarnim vihar','','2018-03-26 09:46:58','RANJAN',0x01,0x00,'2018-03-26 09:46:58','RAJVEER','rkumar205@sapient.com','8084627612',49,1,5);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (43,'fbfvz','','2018-03-26 09:51:45','Tarun',0x01,0x01,'2018-03-26 09:51:45','Garg','garg.tarun939@gmail.com','9803973125',78,1,8),
 (44,'dczxcv','','2018-03-26 09:55:25','keshav',0x01,0x00,'2018-03-26 09:55:25','ladha','ladhasonucacs@gmail.com','8471830376',99,1,10),
 (46,'htfhgfhgfhg','','2018-03-26 10:25:49','ad',0x01,0x00,'2018-03-26 10:25:49','ad','hghgfhg@hn','9999999999',14,1,3),
 (47,'a','a','2018-03-26 10:39:31','a',0x01,0x00,'2018-03-26 10:39:31','a','a@a','9999999999',32,1,4),
 (48,'a','a','2018-03-26 10:43:00','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',0x01,0x00,'2018-03-26 11:04:10','aaaaaaa','aa@a','9999999999',91,1,10),
 (49,'dczxcv','','2018-03-26 10:45:21','aaaaa',0x01,0x00,'2018-03-26 10:45:21','sdfa','ladfhfghhasonucacs@gmail.com','8471830376',7,1,1),
 (50,'Oxygen Business Park','Sector-144, Noida','2018-03-26 10:43:43','Vaibhav',0x01,0x00,'2018-03-28 14:18:03','Bisht','vbisht164@gmail.com','9634974807',10,1,1);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (51,'aaaaa','','2018-03-26 10:43:47','shreya',0x00,0x00,'2018-03-29 10:46:20','garg','shreya@gmail.com','6666666666',4,1,2),
 (52,'ghj','hhj','2018-03-26 10:44:50','tarun',0x01,0x00,'2018-03-26 10:44:50','sethia','tarun@gmail.com','9999517545',51,1,6),
 (53,'asdasd','','2018-03-26 10:46:11','ad',0x01,0x00,'2018-03-26 10:46:11','ad','ad@gmail','9999999999',63,1,7),
 (54,'oo','oo','2018-03-26 10:46:24','Pallavi',0x00,0x01,'2018-03-26 10:46:24','Mandal','pallavimandal11@gmail.com','9654104464',97,1,10),
 (57,'1 1 1','111111','2018-03-26 11:32:41','vikas',0x01,0x00,'2018-03-28 16:20:22','yadav','vyad@gmail.com','1234567899',61,1,7),
 (58,'dsadas','sadas','2018-03-26 11:32:53','ad',0x01,0x00,'2018-03-26 11:32:53','ad','sd@g','9999999999',83,1,9),
 (59,'abc','xyz','2018-03-26 12:10:31','prateek',0x01,0x01,'2018-03-26 12:10:31','garg','asd@asd','1234567892',4,1,2),
 (60,'dadssad','','2018-03-26 12:35:37','aa',0x01,0x00,'2018-03-26 16:05:27','aa','adi@gmail','1111111111',24,1,2);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (61,'noida','','2018-03-26 14:00:44','Sallu',0x00,0x00,'2018-03-26 14:00:44','Salal','sagarsalal1234512341@gmail.com','9685741235',11,1,1),
 (62,'hqwkhd','jljhioyhi','2018-03-26 14:22:54','Shivani',0x00,0x00,'2018-03-26 14:22:54','Tanuja','sjhsyu@klyui','9999999999',87,1,9),
 (63,'Line','','2018-03-26 14:35:19','Mr X',0x01,0x00,'2018-03-26 14:35:19','Mr Y','testyahoo@com','1234567890',7,1,1),
 (64,'12','12','2018-03-26 15:00:20','a',0x01,0x00,'2018-04-02 15:12:46','a','v@gmail.com','1234567897',63,1,7),
 (65,'22','2','2018-03-26 15:01:59','v',0x01,0x00,'2018-03-26 15:01:59','v','vv@gmail.com','1234567896',89,1,9),
 (66,'1','1','2018-03-26 15:03:56','v',0x01,0x00,'2018-03-26 15:03:56','v','vvv@gmail.com','9874563211',24,1,2),
 (67,'12','12','2018-03-26 15:05:18','v',0x01,0x00,'2018-03-26 15:05:18','v','cc@gmail.com','1234567896',97,1,10),
 (68,'a','','2018-03-26 16:16:59','a',0x01,0x00,'2018-03-26 20:21:00','a','aa@aa','9999999999',28,1,2);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (69,'wqqe','qwe','2018-03-26 16:54:55','Sapient Digitas',0x01,0x00,'2018-03-26 16:54:55','Razorfish','test$1@yaho.123','9876543210',79,1,8),
 (70,'Prahallad Pur','','2018-03-26 17:13:58','R',0x01,0x00,'2018-03-26 17:13:58','K','rk@gmail.com','7428453409',48,1,5),
 (71,'abcdefghijklmnopqrstuvwxyz1','','2018-03-26 19:43:47','a',0x01,0x00,'2018-03-26 19:43:47','a','abcdefghijklmnopqrstuvwxyz1@a','111111111111111',60,1,6),
 (72,'','','2018-03-26 19:48:35','',0x01,0x00,'2018-03-26 19:48:35','','aa@aaa','1111111111',40,1,4),
 (77,'patiala','','2018-03-27 11:08:43','abha',0x00,0x00,'2018-04-06 11:06:01','nayyar','abhan95@gmail.com','9779558810',49,1,5),
 (78,'fdggs','','2018-03-27 12:07:06','a',0x01,0x00,'2018-03-27 12:07:06','A','a@g','9999999999',65,1,7),
 (79,'pp','','2018-03-27 13:54:05','Prachi',0x00,0x00,'2018-03-27 13:54:05','Thapliyal','prachi@gmail.com','9999999999',22,1,2),
 (80,'Paghds','','2018-03-27 14:53:05','Prachi',0x00,0x00,'2018-03-29 14:36:50','Thapliyal','prachithapliyal@gmail.com','9191991918',92,1,10);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (81,'praf','','2018-03-27 15:13:55','Prachi',0x00,0x00,'2018-03-27 15:13:55','Thapliyal','prachit@gmail.com','1111111111',51,1,6),
 (82,'awrfmsdr;gef','','2018-03-27 17:11:23','zsdfvjn',0x01,0x00,'2018-03-27 17:11:23','jcvnskv','kesjh@gma.fgvf','1231231234',22,1,2),
 (83,'Flat-201, Plot-93, Mauji Colony, Malviya Nagar, Jaipur-302017','','2018-03-28 08:50:24','Khushi',0x00,0x00,'2018-04-03 11:50:46','Sharma','khushisharma.email@gmail.com','9929978406',85,1,9),
 (84,'Flat-201, Plot-93, Mauji Colony, Malviya Nagar, Jaipur-302017','','2018-03-28 09:06:49','Khushi',0x00,0x00,'2018-03-28 09:06:49','Sharma','khushisharma1.email@gmail.com','9929978406',90,1,9),
 (85,'123rtnhngb','','2018-03-28 09:21:43','aditi',0x00,0x00,'2018-03-28 09:21:43','madaan','aditi@gmail.com','9874563210',87,1,9),
 (86,'','','2018-03-28 09:52:46','vikas',0x01,0x00,'2018-03-28 09:52:46','v','v1@gmail.com','9720857857',75,1,8),
 (87,'dsfds','','2018-03-28 09:57:10','aa',0x01,0x00,'2018-03-29 15:01:14','aa','ak@gmail.com','9999999999',16,1,3);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (88,'1','','2018-03-28 09:58:53','c',0x01,0x00,'2018-03-28 09:58:53','vbn','v@gmail.v kkkkk','9720857857',12,1,1),
 (89,'noida','','2018-03-28 09:59:58','sunaina',0x00,0x00,'2018-03-28 09:59:58','srivastava','srivastavasunaina8@gmail.com','1234567891',6,1,1),
 (90,'DCGRBDBN H','','2018-03-28 10:09:16','bhavana',0x00,0x00,'2018-03-28 10:09:16','singh','srivastavasunaina@gmail.com','1234567897',63,1,7),
 (91,'abc','','2018-03-28 10:12:59','Prachii',0x00,0x00,'2018-03-28 10:12:59','Thapliyal','prachip@gmail.com','9764319764',92,1,10),
 (92,'fchg','','2018-03-28 10:20:55','Prachi',0x00,0x00,'2018-04-02 15:32:33','thapliyal','prachii@gmail.com','9797979797',70,1,7),
 (93,'line1','line2','2018-03-28 10:31:37','akshat',0x01,0x00,'2018-03-28 10:31:37','jain','ajain@gmail.com','1234567890',63,1,7),
 (94,'','','2018-03-28 10:54:35','q',0x01,0x00,'2018-03-28 10:54:35','q','DC1@abc.im    .sdoa.dad','9999999999',18,1,3);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (95,'','','2018-03-28 10:55:50','q',0x01,0x00,'2018-03-28 10:55:50','q','ad@gmail.com   .fsd.fds.fdsf.','9999999999',3,1,2),
 (96,'','','2018-03-28 10:57:24','ad',0x01,0x00,'2018-03-28 10:57:24','ad','aa@aaa.com','9999999999',36,1,4),
 (97,'','','2018-03-28 12:48:59','q',0x00,0x00,'2018-03-28 12:48:59','q','aa@aaaa.d dsalasd.asd.d.s.d.ddasd','9999999999',24,1,2),
 (98,'line1','line2','2018-03-28 13:24:25','Reema',0x00,0x00,'2018-03-28 13:24:25','Singla','r@gmail.com','1234567890',15,1,3),
 (99,'dehradun','','2018-03-28 14:21:41','vb',0x01,0x00,'2018-04-06 14:18:23','b','vb@g.co','1111111879',10,1,1),
 (100,'Dehradun','','2018-03-28 14:32:59','vb',0x01,0x00,'2018-03-28 14:32:59','v','vb@g.c','1148486468',75,1,8),
 (101,'hdkjsbv','','2018-03-28 15:07:44','prachi',0x00,0x00,'2018-03-28 15:08:15','thapliyal','pra@gmail.com','9764312649',26,1,3),
 (102,'','','2018-03-28 15:58:43','q',0x01,0x00,'2018-03-28 15:58:43','a','aa@aaa.d dadas.ad.as.da','9999999999',89,1,9);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (103,'','','2018-03-28 15:59:41','ad',0x01,0x00,'2018-03-28 15:59:41','q','ad@gmail.com dshds.fs','9999999999',32,1,4),
 (104,'','','2018-03-28 16:00:56','aa',0x01,0x00,'2018-03-28 16:00:56','asa','addd@g.com','9999999999',13,1,1),
 (105,'','','2018-03-28 16:01:53','q',0x01,0x00,'2018-03-28 16:01:53','q','a@gmail.com bashjgas.asdasd','9999999999',31,1,4),
 (106,'','','2018-03-28 16:02:50','q',0x01,0x00,'2018-03-28 16:02:50','q','addddd@g.com','9999999999',83,1,9),
 (108,'asdsd','','2018-03-29 10:31:00','q',0x01,0x00,'2018-03-29 10:31:00','q','df@gmail.com','9999999999',92,1,10),
 (109,'fghtyuyu','','2018-03-29 10:41:50','q',0x01,0x00,'2018-03-29 10:41:50','q','adk@gmail.com','9999999999',72,1,8),
 (110,'yhyturd','','2018-03-29 10:46:38','q',0x01,0x00,'2018-03-29 10:46:38','q','adddddd@g.com','9999999999',17,1,3),
 (111,'ddddddddddddddddddddddd','dddddddddd','2018-03-29 12:21:35','ss',0x01,0x00,'2018-03-29 12:27:47','ss','aa@gmail.com','7777777777',44,1,5);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (112,'aassad','','2018-03-29 13:59:11','q',0x01,0x00,'2018-03-29 13:59:11','q','adj@gmail.com','9999999999',94,1,10),
 (113,'patiala','','2018-03-29 14:47:12','abha',0x00,0x00,'2018-03-29 14:47:12','nayyar','anayyar8@sapient.com','7889240257',29,1,2),
 (114,'Dehradun','','2018-03-29 22:50:49','CKNCKN',0x00,0x00,'2018-03-29 22:50:49','CDC','a@b.c1','1111111111',91,1,10),
 (115,'line1','','2018-03-29 23:17:33','prakhar',0x01,0x00,'2018-03-29 23:17:33','aggarwal','xedro@gmail.com','1234567890',66,1,7),
 (116,'12,salaka','','2018-04-02 14:14:08','sakshi',0x00,0x00,'2018-04-02 14:14:08','khanwani','sakshikhanwani.sk@gmail.com','9780886317',31,1,4),
 (117,'House no 3 Vikas nagar','USA','2018-04-02 15:19:03','vikas',0x01,0x00,'2018-04-02 15:20:29','yadav','cse.vikasyadav@gmail.com','9720857855',71,1,8),
 (119,'geu 3','','2018-04-02 16:16:46','Swati',0x00,0x00,'2018-04-02 16:16:46','Thapliyal','swati@gmail.com','9764649764',25,1,2);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (120,'line1','line2','2018-04-03 09:32:28','akshat',0x01,0x00,'2018-04-03 09:32:28','jain','ajain@gmail.coma','1234567890',22,1,2),
 (121,'Minnesota','','2018-04-03 09:40:39','Aditi',0x00,0x00,'2018-04-03 09:40:39','Madaan','aditimadaan0302@gmail.com','9876055760',99,1,10),
 (122,'abcde','abcde','2018-04-03 10:48:06','khushi',0x01,0x00,'2018-04-03 10:48:06','sharma','khullar2201@gmail.com','9929978405',100,1,10),
 (123,'aaaaa','','2018-04-03 15:46:34','ab',0x01,0x00,'2018-04-03 15:46:34','a','a@b.c13','9690344359',11,1,1),
 (125,'aaaaaa','aaaa','2018-04-03 18:02:21','aa',0x01,0x00,'2018-04-03 18:02:21','aa','1111@gmail.com','9999999999',84,1,9),
 (126,'sjkdbhwbs','sjkldfhlik','2018-04-03 18:03:50','Tarun',0x01,0x00,'2018-04-03 18:03:50','Garg','tgarg9@sapient.com','9803973125',34,1,4),
 (132,'dehradun','','2018-04-04 09:36:23','vishal',0x01,0x00,'2018-04-04 09:36:23','sanserwal','vsanserwal@sapient.com','1234567890',55,1,6);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (133,'sector 144','','2018-04-04 09:48:21','keshav',0x01,0x00,'2018-04-04 09:48:21','ladha','kladha@sapient.com','9876543210',85,1,9),
 (135,'Race Course','','2018-04-04 10:08:52','Ashutosh',0x01,0x01,'2018-04-04 10:08:52','S','ashutosh.18@aol.com','9872491881',4,1,2),
 (137,'fddcvf','','2018-04-04 10:17:08','Vishal',0x01,0x00,'2018-04-06 13:46:23','sanserwal','amadaan2@sapient.com','9874563210',98,1,10),
 (138,'gehu bell','','2018-04-04 11:23:24','Prachi',0x00,0x00,'2018-04-04 11:23:24','Thapliyal','prachithapliyal11@gmail.com','9746316497',60,1,6),
 (139,'Flat-201, Plot-93, Mauji Colony, Malviya Nagar, Jaipur-302017','','2018-04-04 12:40:59','Khushi',0x00,0x00,'2018-04-04 12:40:59','Sharma','ksharma61@sapient.com','9929978406',94,1,10),
 (140,'','','2018-04-04 13:56:45','a',0x01,0x00,'2018-04-04 13:56:45','a','ass@ads.ads','1111111111',45,1,5),
 (141,'Sector 21, Gurgaon','','2018-04-04 14:07:21','Tarun',0x01,0x00,'2018-04-04 14:07:21','Sethia','tarunjainsethia@gmail.com','9761912219',35,1,4);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (143,'abc tata','','2018-04-04 14:24:35','q',0x01,0x00,'2018-04-04 14:24:35','q','sidrox061@gmail.com','8587937925',23,1,2),
 (144,'jh hg','','2018-04-04 14:26:44','q',0x01,0x00,'2018-04-04 14:26:44','q','pallavimandal151@gmail.com','7894561230',47,1,5),
 (145,'uytgy','','2018-04-04 14:28:27','sid',0x01,0x00,'2018-04-04 14:28:27','das','hgu@hg.m','1239954785',96,1,10),
 (146,'uas  ad','','2018-04-04 14:36:28','q',0x01,0x00,'2018-04-04 14:36:28','q','sid06@gmail.com','7894561230',33,1,4),
 (147,'Mohan Nagar','','2018-04-04 14:42:56','sid',0x01,0x00,'2018-04-04 14:42:56','sid','sid@gmail.com','8587937925',62,1,7),
 (148,'aaaaaa','','2018-04-04 14:47:17','Siddhart',0x01,0x00,'2018-04-06 13:25:35','Gupta','sidrox06@gmail.com','8587937925',63,1,7),
 (149,'jhfgjh','','2018-04-04 14:54:00','v',0x00,0x00,'2018-04-04 14:54:00','q','a@b.co','1234567890',57,1,6),
 (150,'ABCXH','','2018-04-04 14:56:40','Prachi',0x00,0x00,'2018-04-04 14:56:40','T','prachithapliyal1@gmail.com','9760645645',11,1,1);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (151,'kjgjk','','2018-04-04 15:00:31','vvvvv',0x00,0x00,'2018-04-04 15:00:31','sdfgsdfg dfgdfg','a@b.com','2222222222',59,1,6),
 (152,'t67utyuhj','','2018-04-04 14:58:18','kladha',0x01,0x00,'2018-04-04 14:58:18','adf','keshav1314057@gmail.com','8989898989',25,1,2),
 (153,'cvcbcv','','2018-04-04 14:58:40','Prachi',0x00,0x00,'2018-04-04 14:58:40','Thapliyal','pthapliyal@sapient.co','9764326549',91,1,10),
 (154,'Gurgaon','','2018-04-04 15:43:25','Abhi',0x01,0x00,'2018-04-04 15:43:25','Sharma','sumathur@sapient.com','9997913959',62,1,7),
 (155,'House no. 156, Gate no. 2, Sector-82','Swarnim Vihar','2018-04-05 11:00:24','Ranjan',0x01,0x00,'2018-04-05 11:00:24','Rajveer','rajranjan267@gmail.com','8084627612',64,1,7),
 (156,'jhjhg','','2018-04-05 14:38:35','vishal',0x01,0x00,'2018-04-05 14:38:35','san','a@ss.cc','8755411742',34,1,4),
 (158,'22 jump street','Vibhav','2018-04-05 15:25:19','mehran',0x01,0x00,'2018-04-05 15:25:19','ahmed','mahmed8@sapient.com','8439420375',3,1,2);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (159,'bnbv','','2018-04-06 10:25:46','Prachi',0x00,0x00,'2018-04-06 10:25:46','Thapliyal','pr@gmail.com','9779797999',40,1,4),
 (160,'gurgoan','','2018-04-06 12:03:25','srishti',0x00,0x00,'2018-04-06 12:03:25','Garg','sgar48@sapient.com','9899092675',14,1,3),
 (161,'qwerrouhy rnfweuohfounf','','2018-04-06 16:57:47','ashu',0x01,0x00,'2018-04-06 16:57:47','singh','ashu491881@gmail.com','9879879875',16,1,3),
 (162,'H.No. C-11, Krishna Park','','2018-04-06 16:59:26','Prateek',0x01,0x00,'2018-04-06 16:59:26','Alakh','palakh@sapient.com','9690341607',6,1,1),
 (163,'123421','ue 2','2018-04-06 17:01:31','Prateek',0x01,0x01,'2018-04-06 17:01:31','Garg','shadyprateek@gmail.com','7788552233',41,1,5),
 (164,'11323','abc','2018-04-06 17:15:52','Prateek',0x01,0x00,'2018-04-06 17:15:52','Garg','shadyinfi@gmail.com','8877445566',74,1,8),
 (165,'Gurgoan','','2018-04-09 12:04:24','riya',0x00,0x00,'2018-04-09 12:04:24','sharma','pallavi.14bcs1150@abes.ac.in','8723096757',42,1,5);
INSERT INTO `users` (`user_id`,`address_line1`,`address_line2`,`created_date`,`first_name`,`gender`,`is_admin`,`last_modified_date`,`last_name`,`mail`,`mobile`,`city_id`,`country_id`,`state_id`) VALUES 
 (166,'sector 50','','2018-04-09 14:51:20','sagar',0x01,0x00,'2018-04-09 14:51:20','salal','ssalal@sapient.com','9690344359',6,1,1),
 (167,'abcde','','2018-04-09 14:55:30','Sagar',0x01,0x00,'2018-04-09 14:55:30','Salal','sagar@sapient.com','9690344359',72,1,8);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Definition of table `wish_items`
--

DROP TABLE IF EXISTS `wish_items`;
CREATE TABLE `wish_items` (
  `wish_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) DEFAULT NULL,
  `wish_list_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`wish_item_id`),
  KEY `FKrs6352a2o6qe1h0gudse3s4go` (`isbn`),
  KEY `FK7sdq9tkdebpjdwpoq48ok83gu` (`wish_list_id`),
  CONSTRAINT `FK7sdq9tkdebpjdwpoq48ok83gu` FOREIGN KEY (`wish_list_id`) REFERENCES `wish_list` (`wish_list_id`),
  CONSTRAINT `FKrs6352a2o6qe1h0gudse3s4go` FOREIGN KEY (`isbn`) REFERENCES `books` (`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wish_items`
--

/*!40000 ALTER TABLE `wish_items` DISABLE KEYS */;
INSERT INTO `wish_items` (`wish_item_id`,`isbn`,`wish_list_id`) VALUES 
 (38,'3620000000000',11),
 (53,'3620000000000',16),
 (54,'2220000000000',16),
 (78,'3620000000000',18),
 (80,'9110000000000',18),
 (82,'3620000000000',19),
 (85,'3620000000000',20),
 (86,'9110000000000',20),
 (141,'9782000000000',18),
 (182,'5560000000000',5),
 (205,'2220000000000',14),
 (211,'9470000000000',10),
 (226,'2220000000000',4),
 (227,'9110000000000',10),
 (239,'9220000000000',22),
 (240,'9220000000000',4),
 (241,'9220000000000',19),
 (246,'9630000000000',23),
 (252,'9639000000000',10),
 (253,'9880000000000',10),
 (259,'9150000000000',19),
 (282,'9360000000000',7),
 (283,'9360000000000',9),
 (285,'9782000000000',30),
 (286,'9780000000000',7),
 (287,'9470000000000',7),
 (288,'9782000000000',7),
 (289,'2220000000000',7),
 (290,'9880000000000',7),
 (291,'9639000000000',7),
 (292,'9220000000000',7),
 (293,'9560000000000',7),
 (294,'9580000000000',7),
 (296,'9960000000000',31),
 (307,'9470000000000',5),
 (308,'9880000000000',5),
 (309,'2220000000000',5);
INSERT INTO `wish_items` (`wish_item_id`,`isbn`,`wish_list_id`) VALUES 
 (310,'9960000000000',5),
 (311,'9638000000000',5),
 (314,'123',7),
 (317,'9782000000000',27),
 (319,'9880000000000',33),
 (320,'9639000000000',33),
 (325,'5454000000000',27),
 (335,'9210000000000',35),
 (336,'2220000000000',35),
 (337,'3620000000000',35),
 (338,'9788177091878',35),
 (340,'9960000000000',24),
 (350,'2220000000000',32),
 (361,'1170000000000',40),
 (364,'9220000000000',41),
 (365,'2220000000000',41),
 (366,'9638000000000',41),
 (367,'9360000000000',41),
 (368,'9630000000000',41),
 (369,'9639000000000',41),
 (371,'9470000000000',41),
 (372,'9560000000000',41),
 (373,'9781473647770',41),
 (374,'3620000000000',41),
 (375,'5454000000000',41),
 (376,'9110000000000',41),
 (377,'2220000000000',42),
 (378,'9729000000000',42),
 (379,'9360000000000',42),
 (380,'3620000000000',42),
 (381,'9220000000000',42),
 (382,'9960000000000',42),
 (383,'9150000000000',42),
 (384,'5454000000000',42),
 (386,'9700000000000',42),
 (387,'9782000000000',42);
INSERT INTO `wish_items` (`wish_item_id`,`isbn`,`wish_list_id`) VALUES 
 (400,'9639000000000',32),
 (404,'9880000000000',46),
 (410,'1170000000000',32),
 (428,'9580000000000',47),
 (429,'1170000000000',46),
 (430,'9880000000000',32),
 (431,'9781473647770',48),
 (433,'3620000000000',49),
 (449,'9360000000000',36),
 (451,'3620000000000',43),
 (452,'9780000000067',43),
 (453,'9639000000000',43),
 (455,'787700000000',43),
 (456,'9350000000000',32),
 (457,'5560000000000',43),
 (464,'3620000000000',50),
 (470,'3620000000000',51),
 (471,'9780141359151',32),
 (472,'3620000000000',44),
 (474,'9820000000000',52),
 (475,'9820000000000',22),
 (476,'7777777777777',38),
 (477,'9960000000000',38),
 (478,'9781473647770',38),
 (482,'3216540000',44),
 (483,'2220000000000',44),
 (484,'0132335530000',51);
/*!40000 ALTER TABLE `wish_items` ENABLE KEYS */;


--
-- Definition of table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
CREATE TABLE `wish_list` (
  `wish_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`wish_list_id`),
  KEY `FKit8ap20bpapw291y78egje6f3` (`user_id`),
  CONSTRAINT `FKit8ap20bpapw291y78egje6f3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wish_list`
--

/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` (`wish_list_id`,`created_date`,`last_modified_date`,`user_id`) VALUES 
 (4,'2018-03-24 13:02:02','2018-03-24 13:02:02',2),
 (5,'2018-03-24 18:28:07','2018-03-24 18:28:07',38),
 (6,'2018-03-26 09:19:41','2018-03-26 09:19:41',26),
 (7,'2018-03-26 09:20:56','2018-03-26 09:20:56',41),
 (8,'2018-03-26 09:21:29','2018-03-26 09:21:29',19),
 (9,'2018-03-26 09:53:42','2018-03-26 09:53:42',42),
 (10,'2018-03-26 11:01:14','2018-03-26 11:01:14',54),
 (11,'2018-03-26 11:21:54','2018-03-26 11:21:54',48),
 (12,'2018-03-26 11:23:19','2018-03-26 11:23:19',51),
 (13,'2018-03-26 11:32:53','2018-03-26 11:32:53',57),
 (14,'2018-03-26 12:13:26','2018-03-26 12:13:26',59),
 (15,'2018-03-26 14:13:59','2018-03-26 14:13:59',60),
 (16,'2018-03-26 14:23:12','2018-03-26 14:23:12',62),
 (17,'2018-03-26 16:02:35','2018-03-26 16:02:35',64),
 (18,'2018-03-26 16:17:56','2018-03-26 16:17:56',68),
 (19,'2018-03-26 16:43:06','2018-03-26 16:43:06',3),
 (20,'2018-03-26 17:15:46','2018-03-26 17:15:46',70),
 (21,'2018-03-27 13:10:57','2018-03-27 13:10:57',NULL);
INSERT INTO `wish_list` (`wish_list_id`,`created_date`,`last_modified_date`,`user_id`) VALUES 
 (22,'2018-03-27 13:11:01','2018-03-27 13:11:01',1),
 (23,'2018-03-27 14:23:24','2018-03-27 14:23:24',79),
 (24,'2018-03-27 14:57:22','2018-03-27 14:57:22',77),
 (25,'2018-03-28 10:03:28','2018-03-28 10:03:28',89),
 (26,'2018-03-28 10:11:18','2018-03-28 10:11:18',90),
 (27,'2018-03-28 10:37:27','2018-03-28 10:37:27',92),
 (28,'2018-03-28 12:27:20','2018-03-28 12:27:20',50),
 (29,'2018-03-28 15:05:32','2018-03-28 15:05:32',87),
 (30,'2018-03-28 16:09:40','2018-03-28 16:09:40',80),
 (31,'2018-03-29 12:46:52','2018-03-29 12:46:52',111),
 (32,'2018-03-29 12:57:00','2018-03-29 12:57:00',99),
 (33,'2018-04-02 15:22:06','2018-04-02 15:22:06',117),
 (34,'2018-04-03 10:42:27','2018-04-03 10:42:27',120),
 (35,'2018-04-03 11:49:29','2018-04-03 11:49:29',83),
 (36,'2018-04-03 17:41:30','2018-04-03 17:41:30',5),
 (37,'2018-04-04 11:48:42','2018-04-04 11:48:42',49),
 (38,'2018-04-04 14:49:40','2018-04-04 14:49:40',148),
 (39,'2018-04-04 15:02:38','2018-04-04 15:02:38',145);
INSERT INTO `wish_list` (`wish_list_id`,`created_date`,`last_modified_date`,`user_id`) VALUES 
 (40,'2018-04-05 11:01:45','2018-04-05 11:01:45',155),
 (41,'2018-04-05 11:30:54','2018-04-05 11:30:54',133),
 (42,'2018-04-05 13:48:55','2018-04-05 13:48:55',151),
 (43,'2018-04-05 16:48:32','2018-04-05 16:48:32',137),
 (44,'2018-04-06 09:53:56','2018-04-06 09:53:56',141),
 (45,'2018-04-06 10:19:30','2018-04-06 10:19:30',121),
 (46,'2018-04-06 10:26:21','2018-04-06 10:26:21',159),
 (47,'2018-04-06 12:09:38','2018-04-06 12:09:38',160),
 (48,'2018-04-06 16:59:42','2018-04-06 16:59:42',161),
 (49,'2018-04-06 17:17:24','2018-04-06 17:17:24',162),
 (50,'2018-04-09 10:32:58','2018-04-09 10:32:58',10),
 (51,'2018-04-09 12:06:04','2018-04-09 12:06:04',165),
 (52,'2018-04-09 14:08:36','2018-04-09 14:08:36',149),
 (53,'2018-04-09 14:08:45','2018-04-09 14:08:45',NULL);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

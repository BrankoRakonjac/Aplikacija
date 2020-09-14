/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS `aplikacija`;
CREATE DATABASE IF NOT EXISTS `aplikacija` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aplikacija`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
	(1, 'brankorakonjac', '29CF5FF4983D18D7F57376CE45893620C6AA0A37DDDE2DA18760151A26077004787ABC67B1ED1A0AC1D741A0BE2EE6FAA8D9B679A0FE35AE8D49B8AFE0ED57FD'),
	(2, 'ivanajasovic', 'jasamosa'),
	(3, 'pperisc', 'D42644540C0A033AD344B79C78FA4E875E4F57671E80A2FA7D4B33D474E520F7C22665FA5A8D7F838EA0D775DAD12525D53F5EE35668AE4E8F7221C65CB2624E'),
	(5, 'branjo', 'A1013A69EF34D094479B22B5C736B50ECA0329BBE3D125D68AFAD41EE551514D268C8B4F8A717CC863D69C41152586C5641E6FDD1EBE82E44E5CB1222FC4DB87'),
	(7, 'adminnn', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D'),
	(8, 'admin1', 'C7AD44CBAD762A5DA0A452F9E854FDC1E0E7A52A38015F23F3EAB1D80B931DD472634DFAC71CD34EBC35D16AB7FB8A90C81F975113D6C7538DC69DD8DE9077EC'),
	(9, 'test', 'EE26B0DD4AF7E749AA1A8EE3C10AE9923F618980772E473F8819A5D4940E0DB27AC185F8A0E1D5F84F88BC887FD67B143732C304CC5FA9AD8E6F57F50028A8FF');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

DROP TABLE IF EXISTS `administrator_token`;
CREATE TABLE IF NOT EXISTS `administrator_token` (
  `administrator_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `administrator_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_token_id`),
  KEY `fk_administrator_token_administrator_id` (`administrator_id`),
  CONSTRAINT `fk_administrator_token_administrator_id` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator_token`;
/*!40000 ALTER TABLE `administrator_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator_token` ENABLE KEYS */;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `excerpt` varchar(255) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `status` enum('available','visible','hidden') NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
	(1, 'ACME HDD GB', 5, 'kratak opis', 'detaljan opis', 'available', 0, '2020-08-17 02:49:32'),
	(2, 'ACME HD11 1024GB', 5, 'neki kratki tekst 2', 'neki malo duzi tekst o proizvodu', 'visible', 1, '2020-08-18 00:19:50'),
	(3, 'ACME laptop', 3, 'kratki opis', 'detaljan opis', 'available', 0, '2020-08-20 17:13:23');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_feature`;
CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `feature_id` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_feature`;
/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
	(1, 1, 1, '512'),
	(2, 1, 3, 'SATA 3.0'),
	(3, 1, 2, 'SSD'),
	(6, 2, 1, '1024GB'),
	(7, 2, 2, 'SATA 3.0'),
	(8, 3, 8, 'ACME'),
	(9, 3, 9, '15,6'),
	(10, 3, 10, 'bez op');
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_price`;
CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_artical_id` (`article_id`),
  CONSTRAINT `fk_article_price_artical_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_price`;
/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
	(1, 1, 45.00, '2020-08-17 16:40:47'),
	(2, 3, 43.00, '2020-08-17 16:40:57'),
	(3, 2, 56.89, '2020-08-18 00:19:50'),
	(4, 3, 340.00, '2020-08-22 16:54:16');
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
	(1, 1, '2020-08-24 21:46:08'),
	(2, 1, '2020-08-24 22:09:29'),
	(3, 1, '2020-08-24 23:55:29'),
	(4, 1, '2020-08-24 23:58:54'),
	(5, 1, '2020-08-26 01:26:38'),
	(6, 1, '2020-08-26 02:01:44'),
	(7, 1, '2020-08-26 02:04:29'),
	(8, 1, '2020-08-26 02:13:13'),
	(9, 1, '2020-08-26 02:20:00'),
	(10, 1, '2020-08-26 02:24:39'),
	(11, 1, '2020-08-26 02:39:12'),
	(12, 1, '2020-08-26 02:45:40'),
	(13, 1, '2020-08-26 02:48:54'),
	(14, 1, '2020-08-26 02:53:38'),
	(15, 1, '2020-08-31 23:10:42'),
	(16, 1, '2020-08-31 23:15:20'),
	(17, 1, '2020-09-01 00:08:26'),
	(18, 1, '2020-09-01 01:03:06'),
	(19, 1, '2020-09-01 01:07:57'),
	(20, 1, '2020-09-01 02:35:11');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart_article`;
CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart_article`;
/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantity`) VALUES
	(1, 1, 1, 4),
	(3, 2, 2, 2),
	(4, 3, 3, 3),
	(5, 4, 3, 3),
	(6, 5, 1, 3),
	(7, 5, 2, 1),
	(8, 6, 2, 1),
	(9, 6, 1, 3),
	(10, 7, 1, 3),
	(11, 8, 1, 3),
	(12, 9, 1, 3),
	(13, 10, 1, 3),
	(14, 11, 1, 3),
	(15, 12, 1, 3),
	(16, 13, 1, 3),
	(17, 14, 1, 3),
	(30, 15, 1, 5),
	(31, 16, 1, 2),
	(32, 17, 1, 3),
	(33, 18, 1, 2),
	(34, 19, 2, 2);
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`),
  UNIQUE KEY `uq_category_image_path` (`image_path`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Racunarske komponente', 'assets/pc.jpg', NULL),
	(2, 'Kucna elektronika', 'assets/home.jpg', NULL),
	(3, 'Laptop racunari', 'assets/pc/laptop.jpg', 1),
	(4, 'Memoriska', 'assets/pc/memory.jpg', 1),
	(5, 'hard', 'assets/pc/memory/hdd.jpg', 4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `feature`;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(9, 'dijagonala e', 3),
	(1, 'Kapacitet', 5),
	(5, 'Napon', 2),
	(10, 'OP', 3),
	(7, 'Proizvodjac', 2),
	(8, 'Proizvodjac', 3),
	(2, 'Tehnologija', 5),
	(3, 'Tip', 5);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('rejected','accepted','shipped','pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
	(1, '2020-08-24 21:50:48', 1, 'shipped'),
	(2, '2020-08-24 23:55:23', 2, 'pending'),
	(3, '2020-08-24 23:57:13', 3, 'pending'),
	(4, '2020-08-25 00:00:37', 4, 'pending'),
	(5, '2020-08-26 01:27:49', 5, 'rejected'),
	(6, '2020-08-26 02:02:43', 6, 'pending'),
	(7, '2020-08-26 02:09:22', 7, 'pending'),
	(8, '2020-08-26 02:13:24', 8, 'pending'),
	(9, '2020-08-26 02:20:14', 9, 'pending'),
	(10, '2020-08-26 02:24:45', 10, 'pending'),
	(11, '2020-08-26 02:39:22', 11, 'pending'),
	(12, '2020-08-26 02:45:50', 12, 'pending'),
	(13, '2020-08-26 02:49:00', 13, 'pending'),
	(14, '2020-08-26 02:53:43', 14, 'pending'),
	(15, '2020-08-31 23:10:42', 15, 'pending'),
	(16, '2020-08-31 23:15:20', 16, 'pending'),
	(17, '2020-09-01 00:08:26', 17, 'pending'),
	(18, '2020-09-01 01:03:05', 18, 'pending'),
	(19, '2020-09-01 01:07:56', 19, 'pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `uq_photo_image_path` (`image_path`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
	(9, 2, '2020822-1518237363-bane.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  `forename` varchar(64) NOT NULL DEFAULT '0',
  `surname` varchar(64) NOT NULL DEFAULT '0',
  `phone_number` varchar(24) NOT NULL DEFAULT '0',
  `postal_address` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
	(1, 'test@test.rs', '8D2F4D9C7F87141F0810F1ACD6C0462FF0319BB049AA88EA4E310649628091DE316CF1392E19AF4F0A327826545F63E4E969838F5E7D572A475DE3255B738ACA', 'Pera', 'Peric', '+381645669454', 'velislava t.'),
	(3, 'test@test123.rs', '9E8C8260680E943A8EC5361D67B05880C3C52E91ECE81F291C211FA0494230D2179B8100F62772AB52DB0D3A63C552899B5977A438891F81634AFEE7A39BD9A0', 'brenjo', 'rako', '+381645669545', ' Milosa crnjanskog');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `user_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_token_id`),
  KEY `fk_user_token_user_id` (`user_id`),
  CONSTRAINT `fk_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 1, '2020-08-26 19:05:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTEzOTkyNC4yNDgsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTg0NjE1MjR9.oUofKRGx2MQZLUPD_Pw2U4Dtvz60Sj7fTtPn_2c6p4U', '2020-09-26 17:05:24', 1),
	(2, 1, '2020-08-26 23:15:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTE1NDkwMi4zMywiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjYuMyIsImlhdCI6MTU5ODQ3NjUwMn0.4xpWYG8Zx2zpAOwGjBGkjAhuLoF8y8w_1MXEZj5wWh8', '2020-09-26 21:15:02', 1),
	(3, 1, '2020-08-27 00:25:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJ1c2VybmFtZSI6InRlc3RAdGVzdC5ycyIsImV4dCI6MTYwMTE1OTE1NC4wMywiaXAiOiI6OjEiLCJ1YSI6IlBvc3RtYW5SdW50aW1lLzcuMjYuMyIsImlhdCI6MTU5ODQ4MDc1NH0.blIW40h8BifSxD7Lb9yKCYnBbmUJf4mjuDxJRAcx4LQ', '2020-09-26 22:25:54', 1),
	(4, 1, '2020-08-28 23:59:06', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzMDM0Ni43ODMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjUxOTQ2fQ.F7-yr9CxykkhmFELAmLce7gkNXHHKaK_AuWeLw-ATYU', '2020-09-28 23:00:00', 1),
	(5, 1, '2020-08-29 00:57:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzMzg1Ni41MjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjU1NDU2fQ._czVQlybFaYlJFlc83nQOtFKKpJr28htP_t74bGUssY', '2020-09-29 00:00:00', 1),
	(6, 1, '2020-08-29 01:20:04', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzNTIwNC4zMjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjU2ODA0fQ.EtDeriRLQ1DmBYLXH6fPRfRTUmUFTthzSG74PrtgYtk', '2020-09-29 01:00:00', 1),
	(7, 1, '2020-08-29 02:32:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTMzOTUyOC44ODIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NjYxMTI4fQ.BFBfq7SIGcqpf5p8-xKBfoZF9oIsVsdHWZRX2HwaypQ', '2020-09-29 02:00:00', 1),
	(8, 1, '2020-08-29 20:53:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQwNTU5OC43NTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4NzI3MTk4fQ.jRDtQW3eKmlHhm8k_5gwOvjolIsDbGFF_SvbKnVJ8rk', '2020-09-29 20:00:00', 1),
	(9, 1, '2020-08-30 00:14:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQxNzY4NS4yMTMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0OyBydjo3OS4wKSBHZWNrby8yMDEwMDEwMSBGaXJlZm94Lzc5LjAiLCJpYXQiOjE1OTg3MzkyODV9.lu185aypeexCIjTJpN8sh-dDmgFh8fOz-uZ5AS04Txg', '2020-09-30 00:00:00', 1),
	(10, 1, '2020-08-30 17:24:32', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTQ3OTQ3Mi4xNzUsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTg4MDEwNzJ9.RQEAts2vNotrUSLE4uEcuLx7hL-Y9ug6-nLo-2zDnrw', '2020-09-30 17:00:00', 1),
	(11, 1, '2020-08-31 19:41:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU3NDA4OC41NzgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4ODk1Njg4fQ.XpxsOh4DmPsGuQdxTnA6hkWkKFGkVOYbkpMIUo8JDEg', '2020-10-01 19:00:00', 1),
	(12, 1, '2020-08-31 19:41:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU3NDEwOC45MTgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4ODk1NzA4fQ.4i7AxalkZelYPAmqTXlKFAURDcizqKhoyrKD7FieJTs', '2020-10-01 19:00:00', 1),
	(13, 1, '2020-08-31 23:14:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU4Njg5OC4wODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTA4NDk4fQ.s-Ddg5mt8H2MYUW1pGk11cci9EcASPxCPNC66qJu42g', '2020-10-01 23:00:00', 1),
	(14, 1, '2020-09-01 00:08:10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MDA5MC45MDUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTExNjkwfQ.sqCrByGxnOihOUFewmjYriuPKb-J0QHcXnnkJAGLDHM', '2020-10-02 00:00:00', 1),
	(15, 1, '2020-09-01 01:02:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MzM2NS4yNTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTE0OTY1fQ.hQR4Ajqh2kxu71vE5Edyh7VRF3U2bOatynLEBzvZCDk', '2020-10-02 01:00:00', 1),
	(16, 1, '2020-09-01 01:07:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTU5MzY0My45ODEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTE1MjQzfQ.xQHWeRbCH9JjHrhRWNgLCuX8m5GLw-217gzSTnBYl1o', '2020-10-02 01:00:00', 1),
	(17, 1, '2020-09-01 02:56:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNS44MTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE1fQ.BwLtEm8nEQ-TNZh1Sz9YwqQRY2HJR9mMBurkZ50ZFZE', '2020-10-02 00:56:55', 1),
	(18, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy4zODksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.VpM_riU885dH2xw7jiRLin2cYByJ57Df6aHWYQlploY', '2020-10-02 00:56:57', 1),
	(19, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy42MDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.4n1bMrSFMe6FNQzVU7jQxY0LbyL-jq1mKrEt5Lur2tY', '2020-10-02 00:56:57', 1),
	(20, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy43OTQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.4uh-Tq6R-VgkjH6thntS8V4sLveOs4JWJcSx5-Gfr7I', '2020-10-02 00:56:57', 1),
	(21, 1, '2020-09-01 02:56:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDIxNy45ODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODE3fQ.39ECrnpBM24w2KbuPGh4_8KxLmhsxM484uN9GNXs9Ys', '2020-10-02 00:56:57', 1),
	(22, 1, '2020-09-01 02:57:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTYwMDI0Mi44ODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODQuMC40MTQ3LjEzNSBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk4OTIxODQyfQ.MaDirgkVh5NLv8vTT-aC8HG_u9iWc9r-A1pIwHozRes', '2020-10-02 00:57:22', 1);
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

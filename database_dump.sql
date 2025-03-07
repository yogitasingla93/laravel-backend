-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: astudio-assessment
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_values_project_id_foreign` (`project_id`),
  CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_values_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_values`
--

LOCK TABLES `attribute_values` WRITE;
/*!40000 ALTER TABLE `attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('text','number','date','select') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'Department','text','2025-03-07 06:40:57','2025-03-07 06:40:57'),(2,'Start Date','date','2025-03-07 06:41:13','2025-03-07 06:41:13');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` char(36) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `finished_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_04_110650_create_projects_table',1),(5,'2025_03_04_110707_create_timesheets_table',1),(6,'2025_03_04_111758_create_project_user_table',1),(7,'2025_03_04_133506_create_personal_access_tokens_table',1),(8,'2025_03_05_151427_create_attributes_table',1),(9,'2025_03_05_151436_create_attribute_values_table',1),(10,'2025_03_06_201319_create_oauth_auth_codes_table',1),(11,'2025_03_06_201320_create_oauth_access_tokens_table',1),(12,'2025_03_06_201321_create_oauth_refresh_tokens_table',1),(13,'2025_03_06_201322_create_oauth_clients_table',1),(14,'2025_03_06_201323_create_oauth_personal_access_clients_table',1),(15,'2025_03_06_201649_create_oauth_auth_codes_table',2),(16,'2025_03_06_201650_create_oauth_access_tokens_table',2),(17,'2025_03_06_201651_create_oauth_refresh_tokens_table',2),(18,'2025_03_06_201652_create_oauth_clients_table',2),(19,'2025_03_06_201653_create_oauth_personal_access_clients_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0a85d422514ba4fdfbba93c3d19373e07dca77419ca8028178847fc46f2fa547dfd2e6b87a0f7376',11,1,'YourAppName','[]',0,'2025-03-07 04:41:39','2025-03-07 04:41:39','2025-09-07 10:11:39'),('17c6ce8a0ab509fd39bad3d026d6b0e529a3a89212e88fd1d65007bbb364fafa988c2f47c882a6e3',12,1,'YourAppName','[]',0,'2025-03-07 05:37:38','2025-03-07 05:37:38','2025-09-07 11:07:38'),('8e28a1f12f758e92438b706582f21c20c7d0bb72c17202deb054a5c1396a4c4e3eecf37eb4543d2d',13,1,'YourAppName','[]',0,'2025-03-07 06:28:12','2025-03-07 06:28:12','2025-09-07 11:58:12'),('b207ce9040c0df4cda47b100e083a06e5a2b484e13eb25193692e9c1067432cd6e750a159cb4893f',12,1,'yourappname','[]',1,'2025-03-07 05:35:46','2025-03-07 06:05:30','2025-09-07 11:05:46'),('bd03d5f34b3a936856f11270a306fe6acd4159d5648ddb73d0dade63f3e33d675bbc5bb7ba366ccd',13,1,'yourappname','[]',0,'2025-03-07 06:26:44','2025-03-07 06:26:44','2025-09-07 11:56:44'),('ca0383ae613be5392e89f3e0597d446ed84041d18d986394c0efbf8950b4ed1e531b33f572758a65',11,1,'yourappname','[]',0,'2025-03-07 04:38:15','2025-03-07 04:38:15','2025-09-07 10:08:15');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','FJan3FvM5kcaV94wzMesUep2xTD32xSiQk0eGDBj',NULL,'http://localhost',1,0,0,'2025-03-06 14:47:12','2025-03-06 14:47:12'),(2,NULL,'Laravel Password Grant Client','Fxq10P03hQXyVxLMjnMWBfmGjXIkdlWMA8HQ3N9N','users','http://localhost',0,1,0,'2025-03-06 14:47:13','2025-03-06 14:47:13');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2025-03-06 14:47:12','2025-03-06 14:47:12');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_user_id_foreign` (`user_id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES (2,1,2,NULL,NULL),(3,2,3,NULL,NULL),(4,2,4,NULL,NULL),(5,3,5,NULL,NULL),(6,3,6,NULL,NULL),(7,4,7,NULL,NULL),(8,4,8,NULL,NULL),(9,5,9,NULL,NULL),(10,5,10,NULL,NULL),(11,6,11,NULL,NULL),(12,6,12,NULL,NULL),(13,7,13,NULL,NULL),(14,7,14,NULL,NULL),(15,8,15,NULL,NULL),(16,8,16,NULL,NULL),(17,9,17,NULL,NULL),(18,9,18,NULL,NULL),(19,10,19,NULL,NULL),(20,10,20,NULL,NULL);
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (2,'Mollitia saepe illum.','Necessitatibus optio voluptatem expedita voluptas illum porro. Commodi odit architecto architecto omnis. Quae consectetur et voluptatem optio veniam. Architecto dolores quo nihil. Nihil magnam non ut aut.','active','2025-03-06 14:43:29','2025-03-06 14:43:29'),(3,'Voluptatibus quibusdam qui.','Nemo illum iusto quis quisquam nostrum unde id. Dolor provident quaerat laudantium qui aut sint sunt. Ipsam dolorem enim accusamus est sequi minus qui. A hic voluptas numquam aut.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(4,'Voluptas magni voluptas excepturi.','Aut rerum molestias tempora. Esse incidunt itaque nisi in mollitia quis ad. Id officia unde necessitatibus.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(5,'Aut error ratione.','Harum vel vitae corporis et iusto impedit. Eaque vel quis ea doloremque ratione. Pariatur porro necessitatibus aspernatur ut in amet perspiciatis debitis. Repellat nihil qui delectus est officia et.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(6,'Officiis alias in magnam.','Optio autem sunt est ex voluptates. Atque nemo illo adipisci rerum omnis et. Eos dicta minima eos autem culpa id illum aut.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(7,'Ut tempora rem.','Eveniet deleniti in aut deserunt sunt. Laborum vero dolores omnis ut. Assumenda voluptatibus inventore vel omnis tempora.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(8,'Possimus molestiae.','Sit magni aut optio. Sapiente dolore voluptate iste tempore vitae delectus. Nesciunt alias aut eligendi atque nulla fugit. Nobis iure doloremque quae illum.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(9,'Upddate test Distinctio culpa excepturi nobis.','minima autem ut corporis labore et occaecati. Cupiditate consectetur ipsam repellendus. Facilis ut quod in sint ut. Veniam consequatur architecto ratione id harum.','active','2025-03-06 14:43:30','2025-03-07 06:30:38'),(10,'Repellat inventore asperiores recusandae.','Voluptatem quis similique mollitia voluptate excepturi. Vitae ipsum nemo illum. Reprehenderit ex nostrum dolore voluptatem. Sunt inventore tenetur ut iure eos.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(11,'Fugiat vel quaerat.','Non ex vitae sed suscipit quam voluptas doloremque. Fugiat quis sed nobis nisi sequi magni. Magni vel sequi magnam ducimus reprehenderit et numquam iure.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(12,'Ea non impedit vitae.','Ut qui iusto enim autem accusamus voluptatibus. Totam eum omnis occaecati error saepe sed et explicabo. Explicabo pariatur velit adipisci quam et sit est.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(13,'Dolores rerum et possimus.','Est est ut reprehenderit incidunt id quasi. Et repellat at voluptatem quaerat in quis. Dolores repellendus tempore qui.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(14,'Esse laudantium.','Voluptatem expedita occaecati delectus. Assumenda quia assumenda unde nam. Sequi rem quam necessitatibus itaque.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(15,'Temporibus vel voluptas veniam.','Provident veniam est quae aut sed. Odio consequatur molestiae quidem. Placeat iusto qui odit dolorem molestias quasi et.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(16,'Laboriosam vero sint dolores.','Voluptatem deserunt ea quam eveniet dolorum est rem. Et ipsum quis rerum et nostrum. Et odit suscipit ipsum et sit ratione.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(17,'Adipisci maxime et doloribus.','Reiciendis et hic fugiat vel eius voluptas. Inventore autem et perspiciatis rerum consequuntur voluptatem quo temporibus. Est ipsam saepe earum accusantium sit alias.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(18,'Nisi dolores dolorem.','Mollitia qui porro sint debitis quos. Corporis cupiditate expedita nisi et adipisci aliquam dolore. Suscipit nemo libero iusto iure ab non maxime. Distinctio ut natus et quis non provident reiciendis unde.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(19,'Porro sint sed fugiat.','Rerum deserunt unde quidem recusandae quam voluptatem. Et nostrum eos fugiat aliquid sit aut excepturi. Esse a omnis assumenda voluptatem et. Corrupti veritatis nostrum voluptatem repellat explicabo consectetur doloribus.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(20,'Quae minus natus.','Qui unde delectus qui ipsam ea fugiat. Autem sunt esse qui minus ab. Corrupti perferendis eum pariatur omnis cumque officia. Natus aliquam fuga et qui nobis sint.','active','2025-03-06 14:43:30','2025-03-06 14:43:30'),(21,'Project A',NULL,'active','2025-03-07 05:44:22','2025-03-07 05:44:22'),(22,'Project A',NULL,'active','2025-03-07 06:29:14','2025-03-07 06:29:14');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('s0CgSfNQ5PTvXsULHD1bSGmO3sQmY1kSzcM1Eo1c',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlRPUjMzQzI1ZVp4V0JDb3FRdWZjMkpFbFFwc3hXRWlkejZYaXp2ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZXN0Ijt9fQ==',1741335633),('xnXftWYFAyuXNrfeERrIQuK4nAuPRFCRe8mBPCeo',NULL,'127.0.0.1','PostmanRuntime/7.43.0','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZjVzSU9TM1NjdjNhbnRUZ0dCT2djSHBRV2VaM2tLOGpkczY1WmVETiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1741336005),('ZLWqWBq9Sc8ERmHQNxwzTqNwdqJmoZGOQdeqKL7j',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMk5RS1JZc296WWVkdkZ1WGd6MlByYjFjYm42dEdlRmYzb3owck94YiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=',1741292941);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `hours` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesheets_user_id_foreign` (`user_id`),
  KEY `timesheets_project_id_foreign` (`project_id`),
  CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,1,2,NULL,'2003-11-23',6,'2025-03-06 14:43:29','2025-03-06 14:43:29'),(2,1,2,NULL,'1974-08-03',8,'2025-03-06 14:43:29','2025-03-06 14:43:29'),(3,1,2,NULL,'1976-11-02',7,'2025-03-06 14:43:29','2025-03-06 14:43:29'),(4,2,3,NULL,'2002-08-05',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(5,2,3,NULL,'2012-06-08',5,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(6,2,3,NULL,'2013-03-28',5,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(7,3,5,NULL,'2011-02-22',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(8,3,5,NULL,'2022-10-15',5,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(9,3,5,NULL,'2006-08-27',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(10,4,8,NULL,'1984-04-29',3,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(11,4,8,NULL,'2018-12-26',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(12,4,8,NULL,'2003-09-27',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(13,5,9,NULL,'1993-03-16',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(14,5,9,NULL,'2010-03-31',6,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(15,5,9,NULL,'1977-03-12',8,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(16,6,12,NULL,'1984-03-17',7,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(17,6,12,NULL,'2004-07-05',8,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(18,6,12,NULL,'1988-08-05',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(19,7,14,NULL,'2012-03-07',3,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(20,7,14,NULL,'2008-01-26',8,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(21,7,14,NULL,'2014-09-02',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(22,8,15,NULL,'1994-01-21',6,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(23,8,15,NULL,'2000-12-21',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(24,8,15,NULL,'2016-02-01',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(25,9,17,NULL,'2009-11-19',5,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(26,9,17,NULL,'2007-10-15',7,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(27,9,17,NULL,'2014-07-28',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(28,10,19,NULL,'1989-10-18',4,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(29,10,19,NULL,'2023-03-27',2,'2025-03-06 14:43:30','2025-03-06 14:43:30'),(30,10,19,NULL,'2004-10-16',7,'2025-03-06 14:43:30','2025-03-06 14:43:30');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Chelsea','Johnson','chagenes@example.org','2025-03-06 14:43:29','xDm9XyLrvt','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(2,'Dora','Dickens','belle07@example.org','2025-03-06 14:43:29','7DZYW9KakL','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(3,'Elmer','Hand','arthur44@example.net','2025-03-06 14:43:29','ynYD4yxHbP','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(4,'Shanie','Schamberger','adriana33@example.net','2025-03-06 14:43:29','iMZMoUASSP','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(5,'Osvaldo','O\'Keefe','reymundo.rosenbaum@example.org','2025-03-06 14:43:29','wyGUr0I2J5','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(6,'Amani','Orn','runte.joel@example.com','2025-03-06 14:43:29','EjUOcik6XA','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(7,'Jevon','Abbott','ashlynn.roob@example.com','2025-03-06 14:43:29','oC29CNcPh5','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(8,'Alfredo','Leannon','bfisher@example.net','2025-03-06 14:43:29','2VeIk1RdQj','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(9,'Jenifer','Gerhold','qcummings@example.net','2025-03-06 14:43:29','JhmgPoDsoF','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(10,'Franz','Runte','domenico.blanda@example.org','2025-03-06 14:43:29','ACtITBmTo4','$2y$12$GvQFF6ZGFpWwynaa951DUevdtQVYnN5AUsCNHg.5Vs5etTclGQI4q','2025-03-06 14:43:29','2025-03-06 14:43:29'),(11,'John','Doe','johndoe@example.com',NULL,NULL,'$2y$12$nn3nt6QSmMcU.w7noiTIZO8YpFUPVDqbauyjsioj2f9XYPnAi5.lW','2025-03-07 04:38:15','2025-03-07 04:38:15'),(12,'Jane','Doe','janedoe@example.com',NULL,NULL,'$2y$12$vE45MNeTIWSCS1uWwURFt.RHb0bsc8Q7UBPUwdVay2jU1zT5ezWMa','2025-03-07 05:35:46','2025-03-07 05:35:46'),(13,'siya','Doe','siyadoe@example.com',NULL,NULL,'$2y$12$PD8qpX25xgFrllSzHwdHXOgkWhRQ398oYdptDSv.zlrysneENMJOi','2025-03-07 06:26:44','2025-03-07 06:26:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 18:50:01

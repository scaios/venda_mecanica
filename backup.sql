-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: database_mecanica
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (11,'Hatch','2025-06-11 19:33:04','2025-06-11 19:33:04'),(12,'Sedan','2025-06-11 19:33:04','2025-06-11 19:33:04'),(13,'SUV','2025-06-11 19:33:04','2025-06-11 19:33:04'),(14,'Picape','2025-06-11 19:33:04','2025-06-11 19:33:04'),(15,'Utilitário','2025-06-11 19:33:04','2025-06-11 19:33:04'),(16,'Conversível','2025-06-11 19:33:04','2025-06-11 19:33:04'),(17,'Coupé','2025-06-11 19:33:04','2025-06-11 19:33:04'),(18,'Minivan','2025-06-11 19:33:04','2025-06-11 19:33:04'),(19,'Perua','2025-06-11 19:33:04','2025-06-11 19:33:04'),(20,'Crossover','2025-06-11 19:33:04','2025-06-11 19:33:04'),(21,'Elétrico','2025-06-11 19:33:04','2025-06-11 19:33:04'),(22,'Esportivo','2025-06-11 19:33:04','2025-06-11 19:33:04'),(23,'Luxo','2025-06-11 19:33:04','2025-06-11 19:33:04'),(24,'Off-road','2025-06-11 19:33:04','2025-06-11 19:33:04'),(25,'Compacto','2025-06-11 19:33:04','2025-06-11 19:33:04'),(26,'Médio','2025-06-11 19:33:04','2025-06-11 19:33:04'),(27,'Grande','2025-06-11 19:33:04','2025-06-11 19:33:04');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'CAIO FERNANDO SCHNEIDER DA SILVA','04082942050','51980569252','caioofernando44@gmail.com','2025-06-11 20:18:44','2025-06-11 20:18:44'),(2,'João da Silva','123.456.789-00','51999999999','joao@email.com','2025-06-11 17:51:57','2025-06-11 17:51:57'),(3,'Maria Oliveira','987.654.321-00','51988888888','maria@email.com','2025-06-11 17:51:57','2025-06-11 17:51:57'),(4,'gabriel','033625860744','5198038515','junin@gmail.com','2025-06-11 22:02:56','2025-06-11 22:02:56');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'Preto','2025-06-11 17:36:42','2025-06-11 17:36:42'),(2,'Branco','2025-06-11 17:36:42','2025-06-11 17:36:42'),(3,'Prata','2025-06-11 17:36:42','2025-06-11 17:36:42'),(4,'Preto','2025-06-11 17:51:52','2025-06-11 17:51:52'),(5,'Branco','2025-06-11 17:51:52','2025-06-11 17:51:52'),(6,'Prata','2025-06-11 17:51:52','2025-06-11 17:51:52'),(7,'Preto','2025-06-11 19:32:55','2025-06-11 19:32:55'),(8,'Branco','2025-06-11 19:32:55','2025-06-11 19:32:55'),(9,'Prata','2025-06-11 19:32:55','2025-06-11 19:32:55'),(10,'Cinza','2025-06-11 19:32:55','2025-06-11 19:32:55'),(11,'Vermelho','2025-06-11 19:32:55','2025-06-11 19:32:55'),(12,'Azul','2025-06-11 19:32:55','2025-06-11 19:32:55'),(13,'Verde','2025-06-11 19:32:55','2025-06-11 19:32:55'),(14,'Amarelo','2025-06-11 19:32:55','2025-06-11 19:32:55'),(15,'Laranja','2025-06-11 19:32:55','2025-06-11 19:32:55'),(16,'Marrom','2025-06-11 19:32:55','2025-06-11 19:32:55'),(17,'Rosa','2025-06-11 19:32:55','2025-06-11 19:32:55'),(18,'Bege','2025-06-11 19:32:55','2025-06-11 19:32:55'),(19,'Dourado','2025-06-11 19:32:55','2025-06-11 19:32:55'),(20,'Roxo','2025-06-11 19:32:55','2025-06-11 19:32:55'),(21,'Vinho','2025-06-11 19:32:55','2025-06-11 19:32:55'),(22,'Azul Marinho','2025-06-11 19:32:55','2025-06-11 19:32:55'),(23,'Verde Musgo','2025-06-11 19:32:55','2025-06-11 19:32:55'),(24,'Branco Perolado','2025-06-11 19:32:55','2025-06-11 19:32:55'),(25,'Preto Fosco','2025-06-11 19:32:55','2025-06-11 19:32:55'),(26,'Cinza Chumbo','2025-06-11 19:32:55','2025-06-11 19:32:55');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cors`
--

DROP TABLE IF EXISTS `cors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cors`
--

LOCK TABLES `cors` WRITE;
/*!40000 ALTER TABLE `cors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
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
-- Table structure for table `metodo_pagamento`
--

DROP TABLE IF EXISTS `metodo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pagamento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pagamento`
--

LOCK TABLES `metodo_pagamento` WRITE;
/*!40000 ALTER TABLE `metodo_pagamento` DISABLE KEYS */;
INSERT INTO `metodo_pagamento` VALUES (2,'Cartão Debito','2025-06-11 20:25:24','2025-06-11 21:59:34'),(3,'Dinheiro','2025-06-11 17:52:00','2025-06-11 17:52:00'),(4,'Troca','2025-06-11 17:52:00','2025-06-11 22:55:48'),(5,'Pix','2025-06-11 17:52:00','2025-06-11 17:52:00');
/*!40000 ALTER TABLE `metodo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_06_11_032318_create_clientes_table',1),(5,'2025_06_11_033552_create_cors_table',1),(6,'2025_06_11_034009_create_categorias_table',1),(7,'2025_06_11_034529_create_modelos_table',1),(8,'2025_06_11_034818_create_veiculos_table',1),(9,'2025_06_11_034952_create_vendedors_table',1),(10,'2025_06_11_035157_create_metodo_pagamentos_table',1),(11,'2025_06_11_035559_create_vendas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `id_categoria` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_modelo_categoria` (`id_categoria`),
  CONSTRAINT `fk_modelo_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (5,'Azera',17,'2025-06-11 19:33:33','2025-06-11 19:33:33'),(6,'Accord',17,'2025-06-11 19:33:33','2025-06-11 19:33:33'),(7,'Passat',17,'2025-06-11 19:33:33','2025-06-11 19:33:33'),(8,'300C',17,'2025-06-11 19:33:33','2025-06-11 19:33:33'),(9,'Focus',16,'2025-06-11 19:34:21','2025-06-11 19:34:21'),(10,'308',16,'2025-06-11 19:34:21','2025-06-11 19:34:21'),(11,'Elantra',16,'2025-06-11 19:34:21','2025-06-11 19:34:21'),(12,'C4 Lounge',16,'2025-06-11 19:34:21','2025-06-11 19:34:21'),(13,'Up!',15,'2025-06-11 19:34:23','2025-06-11 19:34:23'),(14,'March',15,'2025-06-11 19:34:23','2025-06-11 19:34:23'),(15,'Picanto',15,'2025-06-11 19:34:23','2025-06-11 19:34:23'),(16,'Mobi',15,'2025-06-11 19:34:23','2025-06-11 19:34:23'),(17,'Troller T4',14,'2025-06-11 19:34:25','2025-06-11 19:34:25'),(18,'Wrangler',14,'2025-06-11 19:34:25','2025-06-11 19:34:25'),(19,'Jimny',14,'2025-06-11 19:34:25','2025-06-11 19:34:25'),(20,'Defender',14,'2025-06-11 19:34:25','2025-06-11 19:34:25'),(21,'Classe E',13,'2025-06-11 19:34:27','2025-06-11 19:34:27'),(22,'Série 7',13,'2025-06-11 19:34:27','2025-06-11 19:34:27'),(23,'A8',13,'2025-06-11 19:34:27','2025-06-11 19:34:27'),(24,'Jaguar XF',13,'2025-06-11 19:34:27','2025-06-11 19:34:27'),(25,'911',12,'2025-06-11 19:34:29','2025-06-11 19:34:29'),(26,'Camaro',12,'2025-06-11 19:34:29','2025-06-11 19:34:29'),(27,'Mustang',12,'2025-06-11 19:34:29','2025-06-11 19:34:29'),(28,'R8',12,'2025-06-11 19:34:29','2025-06-11 19:34:29'),(29,'M2',12,'2025-06-11 19:34:29','2025-06-11 19:34:29'),(30,'Leaf',11,'2025-06-11 19:34:30','2025-06-11 19:34:30'),(31,'i3',11,'2025-06-11 19:34:30','2025-06-11 19:34:30'),(32,'Bolt EV',11,'2025-06-11 19:34:30','2025-06-11 19:34:30'),(33,'Model 3',11,'2025-06-11 19:34:30','2025-06-11 19:34:30'),(34,'e-Up!',11,'2025-06-11 19:34:30','2025-06-11 19:34:30');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
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
INSERT INTO `sessions` VALUES ('jObrQYc1zj3xIZZLsriPAW0fLMWdBhI56oBRe2KI',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 OPR/119.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnFTUlBYZ1dTUWlwZE9HZ2pTZVZid3RqMUVhN3EwTnUzdW1WSXVnZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1749687489),('Khxh6CbSObkfdGSO0ktx1tAnzbXXoEcTkpPLVxty',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 OPR/119.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXlBSEY2SjFOTmhiMWJtS2Z4SXFEME9nb1VmNnhjSEVDeHZzaUtPSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly81ODgyLTIwMC0xNTktMTYzLTY4Lm5ncm9rLWZyZWUuYXBwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1749685568),('PQuiraifcdZjLlvAN4DvB9CHGDnHY9Uc0TpEJh9S',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 OPR/119.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXAzMVRLa1hZdW9aTVZWY1U1cWpNR1N2eEZ6OWNHcmNDTlRkOGFKSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1749655057);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_modelo` bigint unsigned NOT NULL,
  `id_cor` bigint unsigned NOT NULL,
  `ano` int NOT NULL,
  `valor` decimal(12,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_veiculo_modelo` (`id_modelo`),
  KEY `fk_veiculo_cor` (`id_cor`),
  CONSTRAINT `fk_veiculo_cor` FOREIGN KEY (`id_cor`) REFERENCES `cor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_veiculo_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (7,7,3,1999,28000.00,'2025-06-11 22:52:26','2025-06-11 22:52:26');
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` bigint unsigned NOT NULL,
  `id_vendedor` bigint unsigned NOT NULL,
  `id_veiculo` bigint unsigned NOT NULL,
  `id_metodo_pagamento` bigint unsigned NOT NULL,
  `data_venda` date DEFAULT (curdate()),
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_venda_cliente` (`id_cliente`),
  KEY `fk_venda_vendedor` (`id_vendedor`),
  KEY `fk_venda_veiculo` (`id_veiculo`),
  KEY `fk_venda_metodo` (`id_metodo_pagamento`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_venda_metodo` FOREIGN KEY (`id_metodo_pagamento`) REFERENCES `metodo_pagamento` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_venda_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_venda_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (6,1,2,7,4,'2025-06-04','2025-06-11 22:57:48','2025-06-11 22:57:48');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `percentual_comissao` decimal(5,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'asas','12122121212121','1212121212121212','asas@gmail.com',3.00,'2025-06-11 20:35:20','2025-06-11 20:35:20'),(2,'Carlos Vendas','111.222.333-44','51977777777','carlos@email.com',5.00,'2025-06-11 17:51:58','2025-06-11 17:51:58'),(3,'Ana Vendas','555.666.777-88','51966666666','ana@email.com',7.50,'2025-06-11 17:51:58','2025-06-11 17:51:58');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedors`
--

DROP TABLE IF EXISTS `vendedors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentual_comissao` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendedors_cpf_unique` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedors`
--

LOCK TABLES `vendedors` WRITE;
/*!40000 ALTER TABLE `vendedors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-11 23:51:17

-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `autor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'Don Quijote de la Mancha','Miguel de Cervantes','7'),(2,'Historia de dos Ciudades','Charles Dickens','10'),(3,'El señor de los Anillos','J. R. R. Tolkien','15'),(4,'El principito','Antoine de Saint-Exupéry','17'),(5,'Sueño en el pabellón rojo','Cao Xueqin','6'),(6,'Las aventuras de Alicia en el país de las Maravillas','Lewis Carroll','5'),(7,'Y no quedó ninguno','Agatha Christie','4'),(8,'El león, la bruja y el armario','C. S. Lewis','5'),(9,'Ella','Henry Rider Haggard','5'),(10,'El código Da Vinci','Dan Brown','8'),(11,'El guardián entre el centeno','J. D. Salinger','4'),(12,'Memorias de una geisha','Arthur Golden','15');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librosprestados`
--

DROP TABLE IF EXISTS `librosprestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librosprestados` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_prestamo` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `cantidad` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librosprestados`
--

LOCK TABLES `librosprestados` WRITE;
/*!40000 ALTER TABLE `librosprestados` DISABLE KEYS */;
INSERT INTO `librosprestados` VALUES (2,4,10,'4'),(3,4,11,'6'),(5,1,1,'5'),(9,3,4,'14'),(13,3,1,'9'),(21,2,1,'7'),(22,2,11,'6'),(24,3,11,'1'),(25,3,7,'1'),(26,5,7,'1'),(27,7,7,'1');
/*!40000 ALTER TABLE `librosprestados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_08_10_204925_create_socios_table',2),(6,'2022_08_10_220339_create_socios_table',3),(7,'2022_08_11_190925_create_libros_table',4),(8,'2022_08_11_205251_create_prestamos_table',5),(9,'2022_08_12_004308_create_libros_prestados_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_socio` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `fecha` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,1,1,'11/08/22 - 17:34','Creado',''),(2,16,1,'11/08/22 - 17:36','Creado',''),(3,18,1,'11/08/22 - 17:36','Creado',''),(4,15,1,'11/08/22 - 19:52','Creado',''),(7,20,1,'15/08/22 - 11:28','Creado',''),(8,22,1,'23/08/22 - 10:58','Creado',''),(9,21,1,'23/08/22 - 11:03','Creado',''),(10,18,1,'23/08/22 - 11:14','Creado',''),(11,18,1,'23/08/22 - 11:14','Creado',''),(12,18,1,'23/08/22 - 11:14','Creado','');
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
INSERT INTO `socios` VALUES (1,'Vanya Rendon','Puerta Madero, Morelia. Mich.'),(14,'Adrian Garcia','Morelia, Mich.'),(15,'Eduardo López','Morelia, Mich.'),(16,'Susana Rendon','Morelia, Mich.'),(18,'Reyna Colorado','Xalapa, Ver.'),(19,'Jorge Jacome','Xalapa, Ver.'),(20,'Alejandra Arreguin','Morelia, Mich.'),(21,'Axel','Romero'),(22,'Shanti','Morelia, Mich.');
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Adrian Garcia','adrian@garcia.com',NULL,'$2y$10$/TxYqdixOI.U1/s4TAyVUOECz6FPFKPLd.KwppufjdOG5O3B10ITi','Administrador','IFE','','OjF7sBLtEjvh3zdTAlrDikbarvjcWmmB0NqI8bmaZbAN88s2Vvf8fazciOuY','2022-08-10 02:50:36','2022-08-10 02:50:36'),(3,'Naranti','admin@naranti.mx',NULL,'$2y$10$qoe7gzMQtBId576iNivU0edPKGROovcbnZyRWfvqhLbT/lzUsAaC2','Administrador','RFC','',NULL,'2022-08-11 01:43:27','2022-08-11 01:43:27');
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

-- Dump completed on 2022-08-30 21:20:06
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fragmentum
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `comentario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_user_id_foreign` (`user_id`),
  KEY `comentarios_post_id_foreign` (`post_id`),
  CONSTRAINT `comentarios_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,4,3,'La comprensión no basta de coraje.','2022-08-24 21:54:37','2022-08-24 21:54:37'),(2,2,20,'El desarrollo es más sutil cuando se hace en silencio.','2022-08-31 02:53:40','2022-08-31 02:53:40'),(3,2,17,'No dejo nada al azar.','2022-08-31 04:37:16','2022-08-31 04:37:16');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `follower_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_user_id_foreign` (`user_id`),
  KEY `followers_follower_id_foreign` (`follower_id`),
  CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (10,4,2,NULL,NULL),(11,2,4,NULL,NULL),(12,2,5,NULL,NULL),(14,5,4,NULL,NULL),(15,2,7,NULL,NULL),(16,5,7,NULL,NULL),(17,2,8,NULL,NULL),(18,4,8,NULL,NULL),(19,5,2,NULL,NULL);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (6,4,3,'2022-08-24 21:53:41','2022-08-24 21:53:41'),(7,2,3,'2022-08-25 02:45:13','2022-08-25 02:45:13'),(8,2,18,'2022-08-30 04:08:18','2022-08-30 04:08:18'),(9,2,15,'2022-08-31 02:34:33','2022-08-31 02:34:33'),(11,2,17,'2022-08-31 04:37:30','2022-08-31 04:37:30');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2022_08_19_221040_add_username_to_users_table',2),(9,'2022_08_22_003459_create_posts_table',3),(11,'2022_08_22_215745_create_comentarios_table',4),(12,'2022_08_23_223133_create_likes_table',5),(13,'2022_08_26_141049_add_imagen_fiel_to_users_table',6),(14,'2022_08_26_144213_create_followers_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (3,'Comprensión','La comprensión mutua sería enormemente facilitada por el uso de una lengua universal.','217eee44-d491-49b2-8a03-4843317daa49.jpg',2,'2022-08-22 23:10:06','2022-08-22 23:10:06'),(7,'La utilidad','El hierro es, con diferencia, el factor más importante del progreso moderno… Su nombre es sinónimo de utilidad.','451f3570-82e2-4cff-abc1-4196e99be233.jpg',2,'2022-08-23 00:22:48','2022-08-23 00:22:48'),(9,'El sol','El sol es el resorte que lo maneja todo. El sol preserva la vida humana y suministra toda la energía humana.','d90c1399-ff12-49e7-a292-bd3f1fe21b1f.png',2,'2022-08-23 00:24:18','2022-08-23 00:24:18'),(11,'Edison','Toda alabanza al vigoroso y pionero trabajo de Edison es poca, pero todo lo que ha hecho se ha forjado en formas conocidas y pasajeras.','02bf9758-7f1e-44bb-b713-42efd0794024.jpg',2,'2022-08-23 00:25:37','2022-08-23 00:25:37'),(12,'El hijo','Como un hijo de mi patria, creo que es mi deber ayudar a la ciudad de Zagreb en todos los aspectos con mi asesoramiento y trabajo.','375077e9-041d-4f6e-a2a6-ab55bd06a654.jpg',2,'2022-08-23 00:26:04','2022-08-23 00:26:04'),(13,'El equilibrio','El ejercicio moderado, que asegura un equilibrio correcto entre la mente y el cuerpo, así como una mayor eficiencia en el rendimiento es, por supuesto, un requisito primario.','1254803f-74e9-4e9a-816c-639a1c68a112.jpg',2,'2022-08-23 00:26:37','2022-08-23 00:26:37'),(14,'Las ideas.','La idea vino como un flash de rayos y en un instante, la verdad se reveló.','db5c7fcc-cfcf-4520-a005-63b0c9bcac25.jpg',2,'2022-08-24 03:19:04','2022-08-24 03:19:04'),(15,'Vicios','El whisky, el vino, el té, el café, el tabaco, el amor y otros estimulantes semejantes son responsables del acortamiento de las vidas de muchos, y deberían utilizarse con moderación.','390f2f66-99fc-47af-8736-b54eee11de27.jpg',5,'2022-08-30 03:32:20','2022-08-30 03:32:20'),(16,'El mundo exterior.','La mayoría de las personas están tan absortas en la contemplación del mundo exterior que son totalmente ajenas a lo que está pasando dentro de sí mismas.','3bbd4244-4ee7-48b5-89ca-87eac7db4135.jpg',5,'2022-08-30 03:33:29','2022-08-30 03:33:29'),(17,'El futuro.','Hacer pronósticos es arriesgado. Nadie puede adivinar el futuro lejano. El progreso y los inventos evolucionan en direcciones diferentes a aquellas que se anticiparon.','9fe0b6d2-194b-4610-bdff-f638f66ca388.jpg',5,'2022-08-30 03:34:37','2022-08-30 03:34:37'),(18,'Observar.','La observación deficiente es simplemente una forma de ignorancia y es responsable de muchas nociones malsanas y de muchas ideas estúpidas que prevalecen.','f724181b-95ca-4801-b21d-a8d4ca4c6ff6.jpg',4,'2022-08-30 03:36:28','2022-08-30 03:36:28'),(19,'¿Ayudar?','La ciencia no es sino una perversión de sí misma, a menos que tenga como objetivo final el mejoramiento de la humanidad.','0f797d8f-306c-4237-8fe8-36f8e19eb94e.jpg',4,'2022-08-30 03:37:14','2022-08-30 03:37:14'),(20,'Progresivo.','El desarrollo progresivo del hombre depende vitalmente de la invención; es el producto más importante de su cerebro creativo.','f97d56bf-3de3-4a30-b9ab-8ceec1a0c46d.jpg',4,'2022-08-30 03:37:49','2022-08-30 03:37:49'),(21,'Movimiento.','El movimiento implica un cuerpo que es movido y una fuerza que lo impulsa contra una resistencia.','c979436b-5090-458f-a5e3-067d093085d0.jpg',2,'2022-08-31 04:10:02','2022-08-31 04:10:02'),(22,'Método.','Mi método es diferente. Yo no me precipito al trabajo real. Cuando tengo una idea, comienzo por conformarla en mi imaginación. Cambio la construcción, hago mejoras y manejo el dispositivo en mi mente','b4a0568c-9aa0-4be8-b65f-d4108e34699f.jpg',2,'2022-08-31 04:36:21','2022-08-31 04:36:21');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Bruno','adrian@garcia.com',NULL,'$2y$10$Fs6vcbccHBRWHauPvn.wf.6JNJ7OHLyZxPz7nRhPuyCjLjQndpe9u','2kzAqftVkZNcGiEv6qWGwL20GpX4RnK8ITMZWM7NnESd9vs5Lt1Kv2iBQ1lU','2022-08-20 03:42:27','2022-08-26 19:20:43','dimebruce','4d866884-9710-4fc0-b15f-5f1f3ef95566.jpg'),(3,'Lola López','lola@lopez.com',NULL,'$2y$10$KRGaRcilD/36FpiUE.3IFuxHHWG1GO7MVe.w8oY7gchpVG4ULu/ba',NULL,'2022-08-20 03:58:02','2022-08-20 03:58:02','lolalopez',NULL),(4,'Susana Rendon','susana@rendon.com',NULL,'$2y$10$CSSPJ4NMf14y32hvpWvjUemRqPCxaquYh3LwNyFclrXHcaRBSPYn6',NULL,'2022-08-20 04:01:54','2022-08-20 04:01:54','susanarendon',NULL),(5,'Bruno Díaz','bruno@diaz.com',NULL,'$2y$10$HppqUtsKQbwOPtd.V8MxJOXZeu0ER/n4C4uPEogdX5P8Fb0C5TIwC',NULL,'2022-08-30 03:23:58','2022-08-30 03:23:58','batman',NULL),(6,'Eduardo Garcia','eduardo@garcia.com',NULL,'$2y$10$ETfrI1oQGQqeoKPtkloGnOPxulHAZ9ZFUoUMgkXt5PJOvxpoad.qi',NULL,'2022-08-30 22:39:58','2022-08-30 22:39:58','eduardogarcia',NULL),(7,'Jesus de Veracruz','jesus@veracruz.com',NULL,'$2y$10$j./wIWBvmjy.yUqS.R.qD.o2WwUVRag9xDH6wa5iv.GFBj7hRAc.q',NULL,'2022-08-30 22:43:43','2022-08-30 22:43:43','jesusdeveracruz',NULL),(8,'Nik Zaret','nik@zaret.com',NULL,'$2y$10$U794e8haCHwXAk49kssuFerxL5j4uVQ3/3KEbv6kDOh6H5qJ26Hh6',NULL,'2022-08-30 22:52:04','2022-08-30 22:52:20','nikarte','f68209bc-de77-4ab3-84f1-660fd4c4c9a3.png');
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

-- Dump completed on 2022-08-30 21:20:06

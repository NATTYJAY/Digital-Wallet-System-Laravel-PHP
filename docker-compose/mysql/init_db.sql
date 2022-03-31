-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: laravel_wallet_auth
-- ------------------------------------------------------
-- Server version	8.0.23

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2022_03_29_010756_create_wallet_table',1);
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'test','admin','test@test.com',NULL,'$2y$04$vMzNwB3aAgnXI8onQAfB1e42muxy.NdPE1mFADrDa/JXIMEPj0KBy',NULL,'2022-03-30 15:48:12','2022-03-30 15:48:12'),(13,'Kiley Wyman','admin','glory1@yahoo.com','2022-03-30 15:58:56','$2y$04$gnHyrWzYW6qAr96kXxdPgu5G3VL5vlbcczC430JPPUkel2.S7EFvq','bGGsjiOZfy','2022-03-30 15:58:56','2022-03-30 16:55:29'),(14,'Miss Alena Mitchell PhD','admin','johanna.frami@example.net','2022-03-30 15:58:56','$2y$04$Uq/4Paq4KHeiurj4MwWfv.VdyACtVm.BYYCpqU9/ea.bxxDsY6kRq','juQgTJmnM9','2022-03-30 15:58:56','2022-03-30 15:58:56'),(16,'Mrs. Alta Swaniawski MD','admin','dylan08@example.com','2022-03-30 15:59:09','$2y$04$b5.E1nlyr3wPuEfdOgHQzeQZRoZ8AV1gE4yYPUqQ.C9Pfq55PjyPS','RyoBERgsqT','2022-03-30 15:59:09','2022-03-30 15:59:09'),(17,'Miss Aubree McDermott DVM','admin','cummerata.elroy@example.net','2022-03-30 15:59:09','$2y$04$0AW6o0o.PIatihPwvdIZL.A0K6DnbRSooNAt5Y/0TUaIFhZ9GnumG','XVRG5b5IKD','2022-03-30 15:59:09','2022-03-30 15:59:09'),(19,'Juston Weissnat','admin','shyanne.mccullough@example.com','2022-03-30 15:59:33','$2y$04$uYv9A4SfqKNYjX1YaHEeau9hX5BbJkci4dlYPWjROz3NBQlbEx9bm','antPkqc9T7','2022-03-30 15:59:33','2022-03-30 15:59:33'),(20,'Evalyn Block PhD','admin','drew14@example.com','2022-03-30 15:59:33','$2y$04$ByiQnfaj8z.n6PMD8iluvu0yjcGskx1HHb4iZKYEcwuxUwM7JnQ7e','4XUbjzweib','2022-03-30 15:59:33','2022-03-30 15:59:33'),(22,'Mr. Jerod Larson','admin','elise.kirlin@example.com','2022-03-30 16:00:13','$2y$04$N8DuuyvsFaqCQ.3GyLGlmOJhAJ2x3pqfvfKQhuNMZx/F6zPvwWMZW','bu2chzBlkO','2022-03-30 16:00:13','2022-03-30 16:00:13'),(24,'Theodore Parisian','admin','jtorp@example.org','2022-03-30 16:03:07','$2y$04$9TAGmxpIPb4ktKuDhRK4AOMy8jEr.2DNKWEFPZDhxjo5hFAtx20kq','QRAaw4eFF4','2022-03-30 16:03:07','2022-03-30 16:03:07'),(25,'Brandyn Graham','admin','ikshlerin@example.net','2022-03-30 16:03:07','$2y$04$zg0wiiMZc4xZAsiFn/xpKejAs/FqlfisH5xCCJqMUfjN.uObRAc2.','vcmKW34ObT','2022-03-30 16:03:07','2022-03-30 16:03:07'),(27,'Alvena Haag','admin','littel.marianne@example.org','2022-03-30 16:03:18','$2y$04$nMedWD30NBNptFDCpLIvgOIpu7AwAFwnyYSvbvc8s99GTdJjRbwGu','58e82TUlkx','2022-03-30 16:03:18','2022-03-30 16:03:18'),(28,'Prof. Reva Lindgren DVM','admin','linda26@example.net','2022-03-30 16:03:18','$2y$04$6kXB3xmTWwnY/s4E/iMnr.6.mZ6PbVjakDh0dJTh4xidPyY19oU12','Em7t5kolWQ','2022-03-30 16:03:18','2022-03-30 16:03:18'),(30,'Leta Bartell','admin','cummerata.isom@example.com','2022-03-30 16:03:37','$2y$04$9SSKSom0mfnGnzsXE.DjZO5xrcgfTMtIXdXb8Fa.zV90mrd952GZ6','sKzqJmIqXd','2022-03-30 16:03:37','2022-03-30 16:03:37'),(31,'Mr. Colton Kulas','admin','vondricka@example.org','2022-03-30 16:03:37','$2y$04$8XeXtjEY5CTG2WSDDa0lFuvXGPumvXyCs5.N.slZjGOPOLHk1VUdu','l7OtzFHEi1','2022-03-30 16:03:37','2022-03-30 16:03:37'),(33,'Mrs. Althea Zieme','admin','gerlach.cathrine@example.com','2022-03-30 16:03:50','$2y$04$u2CJ6jC4VOzfEQnijDEKBOXlFaIAs2r0iSY0yBjroZQSxUasfh84K','chbeackOVf','2022-03-30 16:03:50','2022-03-30 16:03:50'),(34,'Vicente Ledner','admin','damore.marielle@example.com','2022-03-30 16:03:50','$2y$04$.0O9G/af4XUGnPbEm83lcOs0uDvkznPZdD1WNnS2ARiTXcqW6YxtW','Y3cjA76ecg','2022-03-30 16:03:50','2022-03-30 16:03:50'),(36,'Ernest Schimmel','admin','moore.deonte@example.org','2022-03-30 16:04:04','$2y$04$aF3S4oU/inWzNjv0zhU.heKY/vGa2SiHEaNkaoD1WiYtw8GD0ER02','qjs7Ij3Xuq','2022-03-30 16:04:04','2022-03-30 16:04:04'),(37,'Corrine Walker III','admin','satterfield.rosie@example.com','2022-03-30 16:04:04','$2y$04$qU8lM0z/r98Pjafosvf1YOLWGkLthZsySObRh00qaIa0.j4apdlFq','mvkkfZBYxP','2022-03-30 16:04:04','2022-03-30 16:04:04'),(39,'Lilliana Hand MD','admin','granville.stracke@example.org','2022-03-30 16:04:11','$2y$04$5.tNsHjuJhomFZO5jsfjI.3nAG30n/OVwY.Dp/z/QwM8ljeCrwv2i','AzyHqH7mJv','2022-03-30 16:04:11','2022-03-30 16:04:11'),(40,'Annamae Upton','admin','beer.trycia@example.com','2022-03-30 16:04:11','$2y$04$mjFedqSnxZTAf8La5Wv67eDF.p4O1DVjfE1TBe8Cw.99kE5xZ0G8e','B6j12cwdXC','2022-03-30 16:04:11','2022-03-30 16:04:11'),(42,'Emma Koelpin','admin','homenick.furman@example.net','2022-03-30 16:04:24','$2y$04$GZ6lk03Y93z0n20vyZnniuDFuWl1Bb8oXbAeA22hfwFbOKyY6uOlW','utevGurTzx','2022-03-30 16:04:24','2022-03-30 16:04:24'),(43,'Kiel O\'Kon','admin','fferry@example.net','2022-03-30 16:04:24','$2y$04$pKPuksBKIu2tvF/.1zOTduXPp0yrRVP2PcH/odU7lqOkClmqW34GW','CaR7lBwgVf','2022-03-30 16:04:24','2022-03-30 16:04:24'),(45,'Nya Rempel','admin','dbreitenberg@example.net','2022-03-30 16:04:35','$2y$04$k6pqFvcPzSZ63/UCFiroZeG6HhBkGyefYtFlPx.lEY27UEOgEiMPO','KBzi1Mp3Af','2022-03-30 16:04:35','2022-03-30 16:04:35'),(46,'Jimmie Rath','admin','agrant@example.org','2022-03-30 16:04:35','$2y$04$fPQM2G.8B29IRB4W2h/AFeNdp/vD1r7zXbl2gTc1XFK/Lfqkw4zpe','8QR602v5Xz','2022-03-30 16:04:35','2022-03-30 16:04:35'),(48,'Mike Schowalter','admin','kiehn.zoe@example.net','2022-03-30 16:05:01','$2y$04$PXG8DaB9WOyfINMpYzw8P.udMMRKdlfY9f9.3HRo4VKGCma2pqE1W','CSllNq9GUP','2022-03-30 16:05:01','2022-03-30 16:05:01'),(49,'Dr. Ari Crona DDS','admin','karianne.flatley@example.com','2022-03-30 16:05:01','$2y$04$yQjBpB8vn5MhnZofd1VjwOKeyEJ/eJx6gFMTOXSZn9ZACt8TYOJUa','eY4U7btfy5','2022-03-30 16:05:01','2022-03-30 16:05:01'),(51,'Jevon O\'Kon II','admin','andres54@example.net','2022-03-30 16:09:57','$2y$04$.xRHzVWvAFFYerm51FmIU.dMuC9r05ZrkfS4eo67ptNL4jza2dKk6','gPXuNNtiIC','2022-03-30 16:09:57','2022-03-30 16:09:57'),(52,'Miss Rosella Howe','admin','qsatterfield@example.org','2022-03-30 16:09:57','$2y$04$ZVTK9f8fZ1k.YBF82et51egSo8WJlj7VtneAGpn3rpbtIY.Or43Fu','VuRuJxHmqH','2022-03-30 16:09:57','2022-03-30 16:09:57'),(53,'q7}2,9@~Ll)tHxN+a`nl','admin','boris06@example.org',NULL,'$2y$04$8TCZLAOxQX8WMBaxP4p.AesX7xpIsbQFIgSCdD6xS6EUBKe41kEtu',NULL,'2022-03-30 16:09:57','2022-03-30 16:09:57'),(55,'Esteban Barrows V','admin','kylee45@example.com','2022-03-30 16:10:06','$2y$04$3kV2aH8jHTPMb90W7ohatOz0FCCPTGtL/vSiDxZ13jo80CTMRFrQa','e9wSwNcWH0','2022-03-30 16:10:06','2022-03-30 16:10:06'),(56,'Lenora Schmidt','admin','sigmund89@example.org','2022-03-30 16:10:06','$2y$04$3xurmulRk62d9qiFD2mzpOAp5d3jOzsHEBovVq1CkfrN60Ctualzy','xW3XSOK222','2022-03-30 16:10:06','2022-03-30 16:10:06'),(57,'fd#Lf=_C1m9KwCx%g=3D','admin','juwan05@example.org',NULL,'$2y$04$u6xqvL2VMGwhvWeKtiju3eb5e0H2fpNZEgr7X.rCry.tnNO8ooKUq',NULL,'2022-03-30 16:10:06','2022-03-30 16:10:06'),(59,'Annabelle Gusikowski','admin','guiseppe.hoeger@example.com','2022-03-30 16:10:28','$2y$04$00Lar4rMZJuD3c8DgTAkDOSVX5INKzX/VK6duqcIcazGoRS6FK3mW','toN5Zj8SHn','2022-03-30 16:10:28','2022-03-30 16:10:28'),(60,'Miss Margret Haag Jr.','admin','kyle.schultz@example.org','2022-03-30 16:10:28','$2y$04$Q2XUYmYXhZKCe.ZZIz2LgOZhps.nY6Zdd6OFOn0ugARcAbIAMKv7.','VyQWvaz1xV','2022-03-30 16:10:28','2022-03-30 16:10:28'),(61,'\"AKBgV8,->?rCSo2-oay','admin','glory12@yahoo.com',NULL,'$2y$04$JVG9PPRXpVEtaC1DqgRB/.EVD1WmrVu52/h3EMOlG2Zz47xI2f0C6',NULL,'2022-03-30 16:10:28','2022-03-30 17:01:24'),(63,'Christy Torphy I','admin','ymaggio@example.com','2022-03-30 16:17:01','$2y$04$wsjidIgSsg9OFmgYau.8IeocYqKtcFUXxWCppdXCJR2jBFFbbsK9i','5rQYbrh3L8','2022-03-30 16:17:01','2022-03-30 16:17:01'),(64,'Josiane Wintheiser DVM','admin','murphy.dejah@example.com','2022-03-30 16:17:01','$2y$04$vj9J.Gou0BjLsOvYJBtHYOEnZNi.8qwXttQG8cFfJgP.UQpG.DyqG','KZMgFDh0Jo','2022-03-30 16:17:01','2022-03-30 16:17:01'),(65,'JRy*?GISF9*xtR|:jF_q','admin','kyle63@example.com',NULL,'$2y$04$F8SZYkXK6NGvYizYQiqr3OH69yJl/xsxk1Xv.ctqBGe2kshh9SmGm',NULL,'2022-03-30 16:17:01','2022-03-30 16:17:01'),(67,'Lemuel Effertz Sr.','admin','jolie12@example.net','2022-03-30 16:17:10','$2y$04$gdZFjBqfHPKUmOP6D6Ntkuhy.hJljTIa8COjSUpBmsRmDWwC67pS.','qsPivLqxH2','2022-03-30 16:17:10','2022-03-30 16:17:10'),(68,'Selmer Haag','admin','seamus.spinka@example.com','2022-03-30 16:17:10','$2y$04$DSatbMCIWwblgyBOOR70Vu9aXd.anSm7GrIlYW1cHTN7J3.rApt3u','gOPzRGosrc','2022-03-30 16:17:10','2022-03-30 16:17:10'),(69,'*snKRsw_hP3a,pmzq/[b','admin','gbarrows@example.org',NULL,'$2y$04$WqSPOyyC7ROx1m90onVZHOLcBm6cR.uoftei58E4zxNkOmg3mlGWC',NULL,'2022-03-30 16:17:10','2022-03-30 16:17:10'),(71,'Mr. Emiliano Okuneva Jr.','admin','hegmann.melisa@example.com','2022-03-30 16:19:16','$2y$04$BForBi7GlHf3.Y5CqZQzI.T3SNfaZw8tKUDGaGLozpTW1quQC/tWi','KJS379FMoK','2022-03-30 16:19:16','2022-03-30 16:19:16'),(72,'Janiya Collier','admin','xoreilly@example.com','2022-03-30 16:19:16','$2y$04$hFt9OGl7TUghLL1lI6cl1eXf2ICULl9N5ZfbnNx8utVIHNrVwpRrq','bD9woE9ejl','2022-03-30 16:19:16','2022-03-30 16:19:16'),(74,'Milford Parker','admin','piper97@example.org','2022-03-30 16:19:32','$2y$04$jfoF/5BwA6bqoaJ/ZSZEkuuWVQM.Z3WsAjdQU2uSBJilbAjboLM/2','L6pCRYUuHX','2022-03-30 16:19:32','2022-03-30 16:19:32'),(75,'Tyree Veum','admin','huel.colt@example.org','2022-03-30 16:19:32','$2y$04$ePrLGHZ.RR3dSLXEVk1FTeCvvtor1qVcdkt6K0QfF3LtqsxuCgSHi','unkVM7uoKk','2022-03-30 16:19:32','2022-03-30 16:19:32'),(77,'Mandy McLaughlin','admin','anibal95@example.net','2022-03-30 16:19:48','$2y$04$2jm4qrZN9ivgLuxHUyYCROlFYKUVbqkTViiErdb.pbz0bQkKqQuUi','R3sCRPIpRn','2022-03-30 16:19:48','2022-03-30 16:19:48'),(78,'Linwood Feeney','admin','pearlie.kerluke@example.net','2022-03-30 16:19:48','$2y$04$4.bGAPVM9.p9UpKlfxYwi.El49UADOTvhTRBpz6tU5hjv8mwTZfw6','qex4MY9GDr','2022-03-30 16:19:48','2022-03-30 16:19:48'),(80,'Diamond Okuneva Sr.','admin','georgianna.nikolaus@example.org','2022-03-30 16:21:14','$2y$04$aBEvI3X4WbW25ydsn9rhAOR3IvSv3On.QAomJ44pnNn4Yz42/i6S.','4aCpEKo9Wv','2022-03-30 16:21:14','2022-03-30 16:21:14'),(81,'Miss Anabel Miller V','admin','dell43@example.org','2022-03-30 16:21:14','$2y$04$OZ4ZqaZkFy4uoz6kA.NMceZyj85r7nc27QBkhMi8MMyqfvKRmEehC','ILb1jyBpti','2022-03-30 16:21:14','2022-03-30 16:21:14'),(83,'Ilene Hayes','admin','wolf.mitchel@example.org','2022-03-30 16:22:00','$2y$04$wyJmiePxpJ923zcRl3kWSuzHX46CBbcXt5zlLcL7AaaUtX0pZymaO','ycthZ7KWve','2022-03-30 16:22:00','2022-03-30 16:22:00'),(84,'Dr. Mable Bode IV','admin','jayson.bailey@example.org','2022-03-30 16:22:00','$2y$04$hm0rZmKryjTltg8SDn9ccubEgr5p.2vKcnpIDiakF6JRoeffjQ4p6','HZDDBPKTDv','2022-03-30 16:22:00','2022-03-30 16:22:00'),(86,'Lucas Beahan','admin','talia85@example.com','2022-03-30 16:22:33','$2y$04$AaaGwx/EFpyC2wFm5ZRhVuN2kopAigGcNTrG3ALAR4XN6VBDRJ/Le','wzWnyDzarN','2022-03-30 16:22:33','2022-03-30 16:22:33'),(87,'Kian Feeney','admin','lamont75@example.org','2022-03-30 16:22:33','$2y$04$YzNsD/zO8JLuyZ5jD1XoPet5/MzSxhcbCAsu3hWyVschyg48rvysu','CL1EkR3QUo','2022-03-30 16:22:33','2022-03-30 16:22:33'),(88,'==\"g5l\\>5+(Ow+Lc.eJ[','admin','chanel.murazik@example.com',NULL,'$2y$04$jB3/VU3xT1ssT5El3o9XU.mPUsbXgRveDUZ1./IPzS44APACFx0Jy',NULL,'2022-03-30 16:22:34','2022-03-30 16:22:34'),(90,'Shayna Moore','admin','myah.goyette@example.com','2022-03-30 16:22:49','$2y$04$Clh6jeH1mfJbwX9kv9PHn.CTK2fCxrLbLpZJDWlIoavtQFKdOl/Ty','mOYMxu4Xu5','2022-03-30 16:22:49','2022-03-30 16:22:49'),(91,'Jacky Willms III','admin','cummerata.shayna@example.com','2022-03-30 16:22:49','$2y$04$TJdiN7oJMkh6sOupcKoZW.TdkjwaKAi93Ca5T4zX90rOxG/TV37h6','0sYx4tinWO','2022-03-30 16:22:49','2022-03-30 16:22:49'),(92,'&a<z^zrp0\'TM8#dF?\"7]','admin','qhalvorson@example.org',NULL,'$2y$04$gOrQvUBsWNBbAfUhP/Rdt.Y4etFsob9aqiI/Qiodc22gXbNJXHqYO',NULL,'2022-03-30 16:22:49','2022-03-30 16:22:49'),(94,'Francisco Harvey III','admin','borer.rocky@example.com','2022-03-30 16:23:08','$2y$04$/tE3FRaEoiv9dUIqff/.SuFexX/DvgK8UcT26HGKTddp5h5GOxQlm','WQ4W8njY7R','2022-03-30 16:23:08','2022-03-30 16:23:08'),(95,'Trevor Senger DVM','admin','waelchi.kellie@example.org','2022-03-30 16:23:08','$2y$04$ENevWrmpQDNeTX6uNMqhzuVtN0b2Tdx1gS4oWLFg54UCOPyR853b6','Bl8DPvTMoS','2022-03-30 16:23:08','2022-03-30 16:23:08'),(96,',19C^X0dP@X5BN]SnZX\'','admin','mgraham@example.net',NULL,'$2y$04$Y3R/gsBE/Kn2/EkZ2hVhTeO0l3GBqN22wWhPt9ZcsCj5xNXiiOUCu',NULL,'2022-03-30 16:23:08','2022-03-30 16:23:08'),(98,'Marquis Jakubowski Sr.','admin','qhahn@example.org','2022-03-30 16:23:20','$2y$04$Bya528K0X2wkG61.VPcn4O356jPttR.FRsdXxMb6TLPqjluk0I6iy','tdhfyj8kEy','2022-03-30 16:23:20','2022-03-30 16:23:20'),(99,'Dr. Tyrese Bechtelar','admin','kelsi17@example.net','2022-03-30 16:23:20','$2y$04$qdOptUDc6d71GDkZxowtcOzTHuyDYTrBNCHqLatarPtTwd0YYMKiG','U61oCMBmBb','2022-03-30 16:23:20','2022-03-30 16:23:20'),(100,'NEt(DW[DThMG_|em@,XO','admin','wilburn77@example.com',NULL,'$2y$04$R1RsnQDmwxNyNpnoRP1i0e11c1vIc9aR/.eMkhhJVTtjOcPBfgjO2',NULL,'2022-03-30 16:23:20','2022-03-30 16:23:20'),(101,'*?6~U;OvCC&^\'/3f`Dja','admin','unicolas@example.com',NULL,'$2y$04$QBpbuJFxDJCLTUS2aZDfue5hczqZ8J2poxz3IgnY3pGrRfIyqq0RG',NULL,'2022-03-30 16:30:43','2022-03-30 16:30:43'),(103,'Simeon Schiller','admin','jason69@example.com','2022-03-30 16:30:43','$2y$04$o82V9Ss04w3mpR6iGZwifOGo9yeKuqf/zzENfjYy2trqsHckYtPLC','F9ZWOilem5','2022-03-30 16:30:43','2022-03-30 16:30:43'),(104,'dVgUhM.izO=kkVZ8EXA(','admin','sasha.gislason@example.com','2022-03-30 16:30:43','$2y$04$ZvMq1pss57J1C/y0D1OoF.9KAHtolHF23FEwxOI1y.eFzjo6kaOtq','WGMLYkpxDm','2022-03-30 16:30:43','2022-03-30 16:30:43'),(105,'~UEhirYMoI[1MTxn(W>p','admin','hayes.herbert@example.com',NULL,'$2y$04$PINpHXI1GPmmK.oB1jzDqeGP.5RD7dvIZYLSWxoKXqsvKVc5he07S',NULL,'2022-03-30 16:30:55','2022-03-30 16:30:55'),(107,'Dr. Evans Schmeler','admin','madilyn.gusikowski@example.com','2022-03-30 16:30:55','$2y$04$5xcGJL3CtQZ471/vA6QWs.l2z0./phbjHL4RjxN0utMiJQCm61D4W','YOH9YQGwW7','2022-03-30 16:30:55','2022-03-30 16:30:55'),(108,'5Ys;;}^z-8d@LPi2!6.;','admin','mkeeling@example.org','2022-03-30 16:30:55','$2y$04$m6zXM6fb2BR4q85N12POnesk3zyvx4s57CGt6SlPDQW9IbhFQrhNe','fRAxu8V6ZC','2022-03-30 16:30:55','2022-03-30 16:30:56'),(109,'admin@admin.com','admin','admin@admin.com',NULL,'$2y$10$u01CKOZwRP/s/EqFjGs9FuYjY1tEOWW4pxyjqJepz5Ek1Tg9.HoXu',NULL,'2022-03-30 16:52:04','2022-03-30 16:52:04'),(110,'Oz@lVcD*Oj$d5&\\,CEl#','admin','bud.muller@example.com',NULL,'$2y$04$ueSZWZv6PoLizK3SWCmVWubr5ptFa0F4NxWx0WYcOHwksyS9EGEWu',NULL,'2022-03-30 17:02:02','2022-03-30 17:02:02'),(112,'Sandra Lehner Sr.','admin','wintheiser.laisha@example.org','2022-03-30 17:02:02','$2y$04$vRbba7HsPCWuGUtF7MVznecqeDCIUVsPTSETzfvAnMRxQqQ8nENJ.','UuVnnN09rn','2022-03-30 17:02:02','2022-03-30 17:02:02'),(113,'Mr. Mervin Bradtke PhD','admin','xpurdy@example.com','2022-03-30 17:02:02','$2y$04$wRSl8joDT3CU01jFOsJIHeiwYEOpZ1opyImRs8z4uTmnZeW2a8fTi','dlclnV5Tcs','2022-03-30 17:02:02','2022-03-30 17:02:02'),(114,',ICJ=@3v[]VufGI#BC}8','admin','tmclaughlin@example.org',NULL,'$2y$04$/ZYJV2tOE.UGsO5UufpLPuDy4ZBnAMtoyEqr3mOdFM1p3Ck4AAXEK',NULL,'2022-03-30 17:03:17','2022-03-30 17:03:17'),(116,'Miss Katrine Kozey III','admin','monahan.cathryn@example.net','2022-03-30 17:03:17','$2y$04$6IVGWwwtNKgiKJwfxYo4vOnAobq.SxJ3ASXpiF3q8q0qhPa.qP3Qu','zgrdYA7wng','2022-03-30 17:03:17','2022-03-30 17:03:17'),(117,'Emie Sipes','admin','oleuschke@example.net','2022-03-30 17:03:17','$2y$04$6tO6/DKPTjnJxIUbmgyYoud7hkJZa1M.erkktF2edLAqO28pKTUiq','Xyc4o11auU','2022-03-30 17:03:17','2022-03-30 17:03:17'),(118,'BwbwnKC:To5Z5_uHi\\+2','admin','mwilliamson@example.com',NULL,'$2y$04$S7GM9pmTXmPSK9SF99Olg.Xx/JHBnaeagFDeT73RMTSKnS7MBO.Va',NULL,'2022-03-30 17:09:37','2022-03-30 17:09:37'),(120,'Dr. Brandon Gerhold','admin','carlos.mitchell@example.com','2022-03-30 17:09:37','$2y$04$Tb3do46P2i7TtVeXNgkPcO0ysYGn.V1wq5DDwA3z51FIZs0KuceGa','c375HZukkN','2022-03-30 17:09:37','2022-03-30 17:09:37'),(121,'Mr. Devonte Gutkowski DDS','admin','opagac@example.com','2022-03-30 17:09:37','$2y$04$XUtfpsvZYb/pr5gwuEJ7xuwXCeWakpi1n8kcG.7SPTB9e0v.GWoz.','LxVc9oqMZF','2022-03-30 17:09:37','2022-03-30 17:09:37'),(122,'w2Zb=s>MCwPA9_iwh<01','admin','anya48@example.com',NULL,'$2y$04$QSXT1di/MxdVY3eoIRb.m.b7yMThcNO0OWt.QrzgtcGWjTNkqhvAe',NULL,'2022-03-30 17:10:07','2022-03-30 17:10:07'),(124,'Prof. Walker Kuvalis DVM','admin','susana.leffler@example.com','2022-03-30 17:10:07','$2y$04$7wn/w7DCa.Nv0ecek1uuQunQohODnHwhTIhQ7njRUaEL17rN5jH4a','FdEx3vm9wo','2022-03-30 17:10:07','2022-03-30 17:10:07'),(125,'Ernestine Bauch DDS','admin','lexus.corkery@example.org','2022-03-30 17:10:07','$2y$04$KYv5zPO2pmOJAMYjblbamuZPp1zD5avd1S3JfqETfktdsVE0Tjz6i','GiDRWNFdFf','2022-03-30 17:10:07','2022-03-30 17:10:07'),(126,'r[J.[im}pjoIv;*\"s\\hl','admin','ecorkery@example.net',NULL,'$2y$04$I1PkOw9c5Nuc4fhTFQN6IORohMb4vZ1arKvXhk7YVcAo7s1Qd6VPa',NULL,'2022-03-30 17:11:54','2022-03-30 17:11:54'),(128,'Althea Parker','admin','fmccullough@example.net','2022-03-30 17:11:54','$2y$04$p58KtEAHY.nS/8VbVy/rlOBBJNxk2S.ujYmkposanehndTt57Afoa','egPDfnE4wo','2022-03-30 17:11:54','2022-03-30 17:11:54'),(129,'Dr. Aletha Kiehn','admin','judy86@example.com','2022-03-30 17:11:54','$2y$04$B36l1iS4cLCtHdWzJSmOS.Lp9wm3VLTQXyODPX2dcDa0OD3CuB1Fu','i8dwq2Czee','2022-03-30 17:11:54','2022-03-30 17:11:54'),(130,'gT@HeZ}/-9EVXHTI8MU@','admin','ludwig04@example.com',NULL,'$2y$04$mr2mLL7DN9BG95kW95olDO.CqJJR2bbUf0b2mPd4xext8uB0G2Znm',NULL,'2022-03-30 17:12:41','2022-03-30 17:12:41'),(132,'Ms. Zita Will I','admin','kkoss@example.org','2022-03-30 17:12:41','$2y$04$w9IBV11b3qmNH8/Za6/Jo.MOCREGKlAihhwGcwDC/gletUkYTjp4.','8KrM0scsJY','2022-03-30 17:12:41','2022-03-30 17:12:41'),(133,'Drake Tromp IV','admin','goldner.neha@example.com','2022-03-30 17:12:41','$2y$04$SjihkWJ..ZkWDxYCwXtqauftdVVusWCnPBzTzFZ.EQJWm4CMP7ISK','I2xRIcilMu','2022-03-30 17:12:41','2022-03-30 17:12:41'),(134,'{ZJ#jnmL86`CUA#}-q?+','admin','allen59@example.com',NULL,'$2y$04$dbVZNPAxJhKB7qtzk.sOIuP29M9S4v8p3jFodN40CJYzUW1XrPRWG',NULL,'2022-03-30 17:17:29','2022-03-30 17:17:29'),(136,'Rhianna Rau III','admin','shodkiewicz@example.org','2022-03-30 17:17:29','$2y$04$nUjpeyVci6ygEGEBKMXhqOMRG3OO5hYuShm04t6rKMWYqAEnIDtbu','1CtLglHIN0','2022-03-30 17:17:29','2022-03-30 17:17:29'),(137,'Mrs. Alisa Hettinger II','admin','sgreen@example.net','2022-03-30 17:17:29','$2y$04$7bgoxrEduX/y2SmhTdbj4OPV3QTIwqesi1bESiwM0C2Xo6NEefYci','xvulbf8o7j','2022-03-30 17:17:29','2022-03-30 17:17:29'),(138,'16<xyyqS6&DUpYi#}60U','admin','mose75@example.net',NULL,'$2y$04$JKcn4ZL4EucvmURTYZI64.mU5S5pb1MDWwcB0W13PqS3Ynd/priF6',NULL,'2022-03-30 17:17:32','2022-03-30 17:17:32'),(140,'Dr. Everardo Olson','admin','krajcik.nichole@example.com','2022-03-30 17:17:32','$2y$04$gt6exGaDyx1bGFxnJAlkM.Jrw/HR03lbuAldY4Fnq4Bw1mbWsx.WG','Fwos04qc6j','2022-03-30 17:17:32','2022-03-30 17:17:32'),(141,'Vickie Haley','admin','vmohr@example.com','2022-03-30 17:17:32','$2y$04$k68L6rxv2AzLgLNtSezQpOYo7nUr9UM3TCQvmjuAF1yYWyGLOHF6S','IIK5MxwG9e','2022-03-30 17:17:32','2022-03-30 17:17:32'),(142,'r&]?u0w%RCgf,9f45d0%','admin','celestino.kozey@example.net',NULL,'$2y$04$5phcn1LpIrz6rpIF31riCuhveH83/jTiAtgCi/71UG6UuQTc78QJO',NULL,'2022-03-30 17:17:51','2022-03-30 17:17:52'),(144,'George Cole','admin','okuneva.maia@example.net','2022-03-30 17:17:52','$2y$04$QYm5HiR7AXCN3CxxVSLTCOOMlASg5OqGLGOMIjxPGZx0etvgjl5sa','2xdO6bZTqF','2022-03-30 17:17:52','2022-03-30 17:17:52'),(145,'Prof. Myrtice Kautzer','admin','orpha.hagenes@example.org','2022-03-30 17:17:52','$2y$04$ZL2gfFY1yCPrHvwaOQwx4O1s7Q1EqnOUPaxqcP70FN6/KbSgIKwVa','bCTpI0gQX9','2022-03-30 17:17:52','2022-03-30 17:17:52'),(146,'Op?q9z3guein390%rL[8','admin','oquigley@example.org',NULL,'$2y$04$8vtvAUifVOpY0J7lTR9dlO3m9rndBBWycZgnTxzLSXqoC6D7YN1eW',NULL,'2022-03-30 17:23:50','2022-03-30 17:23:50'),(148,'Krista Orn','admin','alice37@example.com','2022-03-30 17:23:50','$2y$04$e.EZqEWSnWPzz2oH548s8.GA3/089berX4mpmsVwqBO.HgGDc.tfq','7VWnqqgysL','2022-03-30 17:23:50','2022-03-30 17:23:50'),(149,'Ms. Sandrine Beahan Sr.','admin','jordon.abernathy@example.org','2022-03-30 17:23:50','$2y$04$wlbrQYdwXXPhpixfJDpu/uQJws99YvM5y2Z9ljC4IRIybIBpC1qVe','33EqXO1ZBF','2022-03-30 17:23:50','2022-03-30 17:23:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `balance` double(8,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_user_id_index` (`user_id`),
  CONSTRAINT `wallet_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (2,6,0.000,'2022-03-30 15:48:12','2022-03-30 15:48:12'),(3,28,0.000,'2022-03-30 16:03:18','2022-03-30 16:03:18'),(4,31,0.000,'2022-03-30 16:03:37','2022-03-30 16:03:37'),(5,34,0.000,'2022-03-30 16:03:50','2022-03-30 16:03:50'),(6,37,0.000,'2022-03-30 16:04:04','2022-03-30 16:04:04'),(7,40,0.000,'2022-03-30 16:04:11','2022-03-30 16:04:11'),(8,43,0.000,'2022-03-30 16:04:24','2022-03-30 16:04:24'),(9,46,0.000,'2022-03-30 16:04:35','2022-03-30 16:04:35'),(10,49,0.000,'2022-03-30 16:05:01','2022-03-30 16:05:01'),(11,52,0.000,'2022-03-30 16:09:57','2022-03-30 16:09:57'),(12,53,0.000,'2022-03-30 16:09:57','2022-03-30 16:09:57'),(13,56,0.000,'2022-03-30 16:10:06','2022-03-30 16:10:06'),(14,57,0.000,'2022-03-30 16:10:06','2022-03-30 16:10:06'),(15,60,0.000,'2022-03-30 16:10:28','2022-03-30 16:10:28'),(16,61,0.000,'2022-03-30 16:10:28','2022-03-30 16:10:28'),(17,64,0.000,'2022-03-30 16:17:01','2022-03-30 16:17:01'),(18,65,0.000,'2022-03-30 16:17:01','2022-03-30 16:17:01'),(19,68,0.000,'2022-03-30 16:17:10','2022-03-30 16:17:10'),(20,69,0.000,'2022-03-30 16:17:10','2022-03-30 16:17:10'),(21,72,0.000,'2022-03-30 16:19:16','2022-03-30 16:19:16'),(22,75,0.000,'2022-03-30 16:19:32','2022-03-30 16:19:32'),(23,78,0.000,'2022-03-30 16:19:48','2022-03-30 16:19:48'),(24,81,0.000,'2022-03-30 16:21:14','2022-03-30 16:21:14'),(25,84,0.000,'2022-03-30 16:22:00','2022-03-30 16:22:00'),(26,87,0.000,'2022-03-30 16:22:34','2022-03-30 16:22:34'),(27,88,0.000,'2022-03-30 16:22:34','2022-03-30 16:22:34'),(28,91,0.000,'2022-03-30 16:22:49','2022-03-30 16:22:49'),(29,92,0.000,'2022-03-30 16:22:49','2022-03-30 16:22:49'),(30,95,0.000,'2022-03-30 16:23:08','2022-03-30 16:23:08'),(31,96,0.000,'2022-03-30 16:23:08','2022-03-30 16:23:08'),(32,99,0.000,'2022-03-30 16:23:20','2022-03-30 16:23:20'),(33,100,0.000,'2022-03-30 16:23:20','2022-03-30 16:23:20'),(34,101,0.000,'2022-03-30 16:30:43','2022-03-30 16:30:43'),(35,104,0.000,'2022-03-30 16:30:43','2022-03-30 16:30:43'),(36,105,0.000,'2022-03-30 16:30:55','2022-03-30 16:30:55'),(37,108,0.000,'2022-03-30 16:30:55','2022-03-30 16:30:55'),(38,109,0.000,'2022-03-30 16:52:04','2022-03-30 16:52:04'),(39,110,0.000,'2022-03-30 17:02:02','2022-03-30 17:02:02'),(40,113,0.000,'2022-03-30 17:02:02','2022-03-30 17:02:02'),(41,114,0.000,'2022-03-30 17:03:17','2022-03-30 17:03:17'),(42,117,0.000,'2022-03-30 17:03:17','2022-03-30 17:03:17'),(43,118,0.000,'2022-03-30 17:09:37','2022-03-30 17:09:37'),(44,121,0.000,'2022-03-30 17:09:37','2022-03-30 17:09:37'),(45,122,0.000,'2022-03-30 17:10:07','2022-03-30 17:10:07'),(46,125,0.000,'2022-03-30 17:10:07','2022-03-30 17:10:07'),(47,126,0.000,'2022-03-30 17:11:54','2022-03-30 17:11:54'),(48,129,0.000,'2022-03-30 17:11:54','2022-03-30 17:11:54'),(49,130,0.000,'2022-03-30 17:12:41','2022-03-30 17:12:41'),(50,133,0.000,'2022-03-30 17:12:41','2022-03-30 17:12:41'),(51,134,0.000,'2022-03-30 17:17:29','2022-03-30 17:17:29'),(52,137,0.000,'2022-03-30 17:17:29','2022-03-30 17:17:29'),(53,138,0.000,'2022-03-30 17:17:32','2022-03-30 17:17:32'),(54,141,0.000,'2022-03-30 17:17:32','2022-03-30 17:17:32'),(55,142,0.000,'2022-03-30 17:17:51','2022-03-30 17:17:51'),(56,145,0.000,'2022-03-30 17:17:52','2022-03-30 17:17:52'),(57,146,0.000,'2022-03-30 17:23:50','2022-03-30 17:23:50'),(58,149,0.000,'2022-03-30 17:23:50','2022-03-30 17:23:50');
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-31  0:49:02


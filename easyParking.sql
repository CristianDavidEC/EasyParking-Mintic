-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: easy_parking
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
-- Table structure for table `registro_parqueadero`
--

DROP TABLE IF EXISTS `registro_parqueadero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_parqueadero` (
  `id_registro_parqueo` int NOT NULL AUTO_INCREMENT COMMENT 'Código registro',
  `fecha_ingreso` datetime DEFAULT NULL COMMENT 'Fecha ingreso',
  `fecha_salida` datetime DEFAULT NULL COMMENT 'Fecha salida',
  `numero_plaza` int DEFAULT NULL COMMENT 'Número plaza',
  `tiempo_parqueo_min` int DEFAULT NULL COMMENT 'Tiempo de parqueo en minutos',
  `valor_parqueo` int DEFAULT NULL COMMENT 'Valor parqueo',
  `estado` tinyint DEFAULT NULL COMMENT 'Estado plaza (0 vacio / 1 ocupado)',
  `nombre_propietario` varchar(100) DEFAULT NULL COMMENT 'Código propietario vehículo',
  `doc_propietario` int DEFAULT NULL,
  `cel_propietario` int DEFAULT NULL,
  `placa_vehiculo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_registro_parqueo`),
  KEY `plaza` (`estado`),
  KEY `id_propietario` (`nombre_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_parqueadero`
--

LOCK TABLES `registro_parqueadero` WRITE;
/*!40000 ALTER TABLE `registro_parqueadero` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_parqueadero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-07 19:57:28

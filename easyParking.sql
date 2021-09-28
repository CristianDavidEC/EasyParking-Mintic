CREATE DATABASE  IF NOT EXISTS `easy_parking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `easy_parking`;
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
-- Table structure for table `parqueadero`
--

DROP TABLE IF EXISTS `parqueadero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parqueadero` (
  `id_paqueadero` int NOT NULL AUTO_INCREMENT COMMENT 'Código',
  `nombre_parqueadero` varchar(100) DEFAULT NULL COMMENT 'Nombre parqueadero',
  `plazas` int DEFAULT NULL COMMENT 'Plazas disponibles',
  `hora_apertura` time DEFAULT NULL COMMENT 'Hora apertura',
  `hora_cierre` time DEFAULT NULL COMMENT 'Hora cierre',
  `valor_servicio` int DEFAULT NULL COMMENT 'Costo por minuto para los carros',
  `correo_parqueadero` varchar(100) DEFAULT NULL COMMENT 'Correo parqueadero',
  `telefono_parqueadero` double DEFAULT NULL COMMENT 'Teléfono parqueadero',
  `direccion_parqueadero` varchar(100) DEFAULT NULL COMMENT 'Dirección parqueadero',
  PRIMARY KEY (`id_paqueadero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parqueadero`
--

LOCK TABLES `parqueadero` WRITE;
/*!40000 ALTER TABLE `parqueadero` DISABLE KEYS */;
INSERT INTO `parqueadero` VALUES (1,'Easy Parking',10,'08:00:00','18:00:00',100,'easy-parking@park.org',8570000,'Diagonal 89a #117-50 Bogotá');
/*!40000 ALTER TABLE `parqueadero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `id_propietario` int NOT NULL AUTO_INCREMENT COMMENT 'Código propietario',
  `nombre_propietario` varchar(100) DEFAULT NULL COMMENT 'Nombre propietario',
  `documento_propietario` varchar(20) DEFAULT NULL COMMENT 'Documento propietario',
  `celular_propietario` double DEFAULT NULL COMMENT 'Celular propietario',
  `placa_vehiculo_propietario` varchar(20) DEFAULT NULL COMMENT 'Placa vehículo propietario',
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,'Jhonatan Ortiz','123456',3157759459,'abc-123');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

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
  `id_propietario` int DEFAULT NULL COMMENT 'Código propietario vehículo',
  PRIMARY KEY (`id_registro_parqueo`),
  KEY `plaza` (`estado`),
  KEY `id_propietario` (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_parqueadero`
--

LOCK TABLES `registro_parqueadero` WRITE;
/*!40000 ALTER TABLE `registro_parqueadero` DISABLE KEYS */;
INSERT INTO `registro_parqueadero` VALUES (1,'2021-09-17 08:50:23','2021-09-17 12:50:30',1,240,240000,0,1),(2,'2021-09-23 13:47:39','2021-09-17 14:47:39',2,60,60000,0,1),(3,'2021-09-24 13:45:09','2021-09-24 15:45:09',3,120,120000,0,1);
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

-- Dump completed on 2021-09-28 18:52:37

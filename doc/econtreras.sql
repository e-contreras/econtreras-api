-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: econtreras
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB

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
-- Table structure for table `atr_mercaderias`
--

DROP TABLE IF EXISTS `atr_mercaderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atr_mercaderias` (
  `atributos_id` int(11) NOT NULL,
  `mercaderias_id` int(11) NOT NULL,
  `valor` varchar(100) NOT NULL,
  PRIMARY KEY (`atributos_id`,`mercaderias_id`),
  KEY `fk_atributos_has_mercaderias_mercaderias1_idx` (`mercaderias_id`),
  KEY `fk_atributos_has_mercaderias_atributos1_idx` (`atributos_id`),
  CONSTRAINT `fk_atributos_has_mercaderias_atributos1` FOREIGN KEY (`atributos_id`) REFERENCES `atributos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atributos_has_mercaderias_mercaderias1` FOREIGN KEY (`mercaderias_id`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atr_mercaderias`
--

LOCK TABLES `atr_mercaderias` WRITE;
/*!40000 ALTER TABLE `atr_mercaderias` DISABLE KEYS */;
/*!40000 ALTER TABLE `atr_mercaderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atributos`
--

DROP TABLE IF EXISTS `atributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atributos` (
  `id` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `label` varchar(45) NOT NULL,
  `tip_dato` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  `creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atributos_usuarios1_idx` (`usu_alta`),
  KEY `fk_atributos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_atributos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_atributos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atributos`
--

LOCK TABLES `atributos` WRITE;
/*!40000 ALTER TABLE `atributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `atributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barrios`
--

DROP TABLE IF EXISTS `barrios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barrios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_barrio_ciudades1_idx` (`ciudad`),
  KEY `fk_barrio_usuarios1_idx` (`usu_alta`),
  KEY `fk_barrio_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_barrio_ciudades1` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrio_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrio_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
INSERT INTO `barrios` VALUES (1,'San Isidro',6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `barrios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_atributos`
--

DROP TABLE IF EXISTS `cat_atributos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_atributos` (
  `categoria` int(11) NOT NULL,
  `atributo` int(11) NOT NULL,
  PRIMARY KEY (`categoria`,`atributo`),
  KEY `fk_categorias_has_atributos_atributos1_idx` (`atributo`),
  KEY `fk_categorias_has_atributos_categorias1_idx` (`categoria`),
  CONSTRAINT `fk_categorias_has_atributos_atributos1` FOREIGN KEY (`atributo`) REFERENCES `atributos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_has_atributos_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_atributos`
--

LOCK TABLES `cat_atributos` WRITE;
/*!40000 ALTER TABLE `cat_atributos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_atributos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_mercaderias`
--

DROP TABLE IF EXISTS `cat_mercaderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_mercaderias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cat_productos_usuarios1_idx` (`usu_alta`),
  KEY `fk_cat_productos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_cat_productos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cat_productos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_mercaderias`
--

LOCK TABLES `cat_mercaderias` WRITE;
/*!40000 ALTER TABLE `cat_mercaderias` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_mercaderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cat_pro_proveedores`
--

DROP TABLE IF EXISTS `cat_pro_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cat_pro_proveedores` (
  `cat_productos_id` int(11) NOT NULL,
  `proveedores_id` int(11) NOT NULL,
  PRIMARY KEY (`cat_productos_id`,`proveedores_id`),
  KEY `fk_cat_productos_has_proveedores_proveedores1_idx` (`proveedores_id`),
  KEY `fk_cat_productos_has_proveedores_cat_productos1_idx` (`cat_productos_id`),
  CONSTRAINT `fk_cat_productos_has_proveedores_cat_productos1` FOREIGN KEY (`cat_productos_id`) REFERENCES `cat_mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cat_productos_has_proveedores_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cat_pro_proveedores`
--

LOCK TABLES `cat_pro_proveedores` WRITE;
/*!40000 ALTER TABLE `cat_pro_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_pro_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `categoria_padre` int(11) DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_usuarios1_idx` (`usu_alta`),
  KEY `fk_categorias_usuarios2_idx` (`usu_modificacion`),
  KEY `FKcst1ufleeljk2nphfiu64n52c` (`categoria_padre`),
  CONSTRAINT `FKcst1ufleeljk2nphfiu64n52c` FOREIGN KEY (`categoria_padre`) REFERENCES `categorias` (`id`),
  CONSTRAINT `fk_categorias_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'ElectrodmÃ©stico',0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'RefrigeraciÃ³n',0,NULL,NULL,NULL,NULL,NULL,NULL),(3,'TecnologÃ­a',0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'ClimatizaciÃ³n',0,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Lavado',0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Muebles',0,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Deportes',0,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Maquinas, herramientas y equipos',0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ciudad` varchar(100) NOT NULL,
  `departamento` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudad_departamentos1_idx` (`departamento`),
  KEY `fk_ciudades_usuarios1_idx` (`usu_alta`),
  KEY `fk_ciudades_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_ciudad_departamentos1` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ciudades_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ciudades_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'	AsunciÃ³n',1,NULL,NULL,NULL,NULL),(2,'Ciudad del Este',17,NULL,NULL,NULL,NULL),(3,'Luque',12,NULL,NULL,NULL,NULL),(4,'San Lorenzo',12,NULL,NULL,NULL,NULL),(5,'CapiatÃ¡',12,NULL,NULL,NULL,NULL),(6,'LambarÃ©',12,NULL,NULL,NULL,NULL),(7,'Fernando de la Mora',12,NULL,NULL,NULL,NULL),(8,'Limpio',12,NULL,NULL,NULL,NULL),(9,'Ã‘emby',12,NULL,NULL,NULL,NULL),(10,'EncarnaciÃ³n',8,NULL,NULL,NULL,NULL),(11,'CaaguazÃº',6,NULL,NULL,NULL,NULL),(12,'Coronel Oviedo',6,NULL,NULL,NULL,NULL),(13,'Pedro Juan Caballero',14,NULL,NULL,NULL,NULL),(14,'ItauguÃ¡',12,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `borrado` smallint(6) NOT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `persona` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs73ngegswuolwn1px611m6fd0` (`persona`),
  CONSTRAINT `FKs73ngegswuolwn1px611m6fd0` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_not_deb_detalles`
--

DROP TABLE IF EXISTS `com_not_deb_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `com_not_deb_detalles` (
  `id` int(11) NOT NULL,
  `comp_not_debito` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `cant` int(11) NOT NULL,
  `monto` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_not_deb_detalles_comp_not_debitos1` (`comp_not_debito`),
  CONSTRAINT `fk_com_not_deb_detalles_comp_not_debitos1` FOREIGN KEY (`comp_not_debito`) REFERENCES `comp_not_debitos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_not_deb_detalles`
--

LOCK TABLES `com_not_deb_detalles` WRITE;
/*!40000 ALTER TABLE `com_not_deb_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_not_deb_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_not_debitos`
--

DROP TABLE IF EXISTS `comp_not_debitos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comp_not_debitos` (
  `id` int(11) NOT NULL,
  `num_not_debito` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `proveedor` int(11) NOT NULL,
  `num_doc_relacionado` int(11) DEFAULT NULL,
  `usu_alta` int(11) NOT NULL,
  `usu_modificacion` int(11) NOT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comp_not_debitos_proveedores1_idx` (`proveedor`),
  KEY `fk_comp_not_debitos_usuarios1_idx` (`usu_alta`),
  KEY `fk_comp_not_debitos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_comp_not_debitos_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_not_debitos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comp_not_debitos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_not_debitos`
--

LOCK TABLES `comp_not_debitos` WRITE;
/*!40000 ALTER TABLE `comp_not_debitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `comp_not_debitos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_token`
--

DROP TABLE IF EXISTS `confirmation_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmation_token` (
  `id` int(11) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_token`
--

LOCK TABLES `confirmation_token` WRITE;
/*!40000 ALTER TABLE `confirmation_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuotas` (
  `id` int(11) NOT NULL,
  `cuota` int(11) DEFAULT NULL,
  `ponderador` decimal(19,2) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ynoyjpclo1etwrr68b4k1eo3` (`categoria_id`),
  CONSTRAINT `FK8ynoyjpclo1etwrr68b4k1eo3` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_departamento` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departamentos_usuarios1_idx` (`usu_alta`),
  KEY `fk_departamentos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_departamentos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_departamentos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Capital',NULL,NULL,NULL,NULL),(2,'ConcepciÃ³n',NULL,NULL,NULL,NULL),(3,'San Pedro',NULL,NULL,NULL,NULL),(4,'Cordillera',NULL,NULL,NULL,NULL),(5,'GuairÃ¡',NULL,NULL,NULL,NULL),(6,'CaaguazÃº',NULL,NULL,NULL,NULL),(7,'CaazapÃ¡',NULL,NULL,NULL,NULL),(8,'ItaupÃºa',NULL,NULL,NULL,NULL),(9,'Misiones',NULL,NULL,NULL,NULL),(10,'ParaguarÃ­',NULL,NULL,NULL,NULL),(11,'Alto ParanÃ¡',NULL,NULL,NULL,NULL),(12,'Central',NULL,NULL,NULL,NULL),(13,'Ã‘eembucÃº',NULL,NULL,NULL,NULL),(14,'Amamabay',NULL,NULL,NULL,NULL),(15,'CanindeyÃº',NULL,NULL,NULL,NULL),(16,'Presidente Ayes',NULL,NULL,NULL,NULL),(17,'Alto Paraguay',NULL,NULL,NULL,NULL),(18,'BoquerÃ³n',NULL,NULL,NULL,NULL),(19,'otroDepartamento',NULL,NULL,NULL,NULL),(20,'string',NULL,NULL,NULL,NULL),(21,'anotheroneasdfadfsa',NULL,NULL,NULL,NULL),(22,'asdfas',NULL,NULL,NULL,NULL),(23,'afdas',NULL,NULL,NULL,NULL),(24,'dsfasfdsfasdfsa',NULL,NULL,NULL,NULL),(25,'Captial',NULL,NULL,NULL,NULL),(26,'testxx',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depositos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `borrado` binary(1) NOT NULL DEFAULT '0',
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (1,'DEPOSITO 1','0','4 MOJONES'),(2,'DEPOSITO 2','0','VILLA ELISA');
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoluciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_alta` datetime NOT NULL,
  `comentarios` text NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `mercaderia` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_devoluciones_mercaderias1_idx` (`mercaderia`),
  CONSTRAINT `fk_devoluciones_mercaderias1` FOREIGN KEY (`mercaderia`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

LOCK TABLES `devoluciones` WRITE;
/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direcciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_principal` varchar(100) NOT NULL,
  `cal_secundaria` varchar(100) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `barrio` int(11) NOT NULL,
  `edificio` varchar(45) DEFAULT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `tipo_direccion` varchar(45) DEFAULT NULL,
  `apartamento` varchar(45) DEFAULT NULL,
  `persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_direcciones_barrio1_idx` (`barrio`),
  KEY `fk_direcciones_usuarios1_idx` (`usu_alta`),
  KEY `fk_direcciones_usuarios2_idx` (`usu_modificacion`),
  KEY `FKjj2qnsmaxmr82uuwblerrst1w` (`persona`),
  CONSTRAINT `FKjj2qnsmaxmr82uuwblerrst1w` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_direcciones_barrio1` FOREIGN KEY (`barrio`) REFERENCES `barrios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Feliz Perez Cardozo','Emiliano R. Fernandez','123',1,'1',NULL,'1',NULL,NULL,NULL,NULL,NULL,'1',NULL);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_traslado`
--

DROP TABLE IF EXISTS `dt_traslado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dt_traslado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cant` int(11) NOT NULL,
  `traslado` int(11) NOT NULL,
  `motivo` text DEFAULT NULL,
  `productos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dt_traslado_traslados1_idx` (`traslado`),
  KEY `fk_dt_traslado_productos1_idx` (`productos_id`),
  CONSTRAINT `fk_dt_traslado_productos1` FOREIGN KEY (`productos_id`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dt_traslado_traslados1` FOREIGN KEY (`traslado`) REFERENCES `traslados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_traslado`
--

LOCK TABLES `dt_traslado` WRITE;
/*!40000 ALTER TABLE `dt_traslado` DISABLE KEYS */;
/*!40000 ALTER TABLE `dt_traslado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'CREADO'),(2,'CONFIRMADO'),(3,'CANCELADO');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventos_usuarios1_idx` (`usu_alta`),
  KEY `fk_eventos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_eventos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_eventos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_comp_detalle`
--

DROP TABLE IF EXISTS `fac_comp_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_comp_detalle` (
  `productos_id` int(11) NOT NULL,
  `fac_compras_id` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`productos_id`,`fac_compras_id`),
  KEY `fk_productos_has_fac_compras_fac_compras1_idx` (`fac_compras_id`),
  KEY `fk_productos_has_fac_compras_productos1_idx` (`productos_id`),
  CONSTRAINT `fk_productos_has_fac_compras_fac_compras1` FOREIGN KEY (`fac_compras_id`) REFERENCES `fac_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_fac_compras_productos1` FOREIGN KEY (`productos_id`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_comp_detalle`
--

LOCK TABLES `fac_comp_detalle` WRITE;
/*!40000 ALTER TABLE `fac_comp_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_comp_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_compras`
--

DROP TABLE IF EXISTS `fac_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `num_factura` varchar(45) NOT NULL,
  `sol_presupuesto` int(11) DEFAULT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fac_compras_proveedores1_idx` (`proveedor`),
  KEY `fk_fac_compras_sol_presupuestos1_idx` (`sol_presupuesto`),
  KEY `fk_fac_compras_usuarios1_idx` (`usu_alta`),
  KEY `fk_fac_compras_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_fac_compras_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fac_compras_sol_presupuestos1` FOREIGN KEY (`sol_presupuesto`) REFERENCES `sol_presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fac_compras_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fac_compras_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_compras`
--

LOCK TABLES `fac_compras` WRITE;
/*!40000 ALTER TABLE `fac_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_ven_detalles`
--

DROP TABLE IF EXISTS `fac_ven_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_ven_detalles` (
  `producto` int(11) NOT NULL,
  `fac_venta` int(11) NOT NULL,
  `solicitud` int(11) DEFAULT NULL,
  `cant` int(11) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`producto`,`fac_venta`),
  KEY `fk_productos_has_fac_ventas_fac_ventas1_idx` (`fac_venta`),
  KEY `fk_productos_has_fac_ventas_productos1_idx` (`producto`),
  KEY `fk_fac_ven_detalles_solicitudes1_idx` (`solicitud`),
  CONSTRAINT `fk_fac_ven_detalles_solicitudes1` FOREIGN KEY (`solicitud`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_fac_ventas_fac_ventas1` FOREIGN KEY (`fac_venta`) REFERENCES `fac_ventas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_fac_ventas_productos1` FOREIGN KEY (`producto`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_ven_detalles`
--

LOCK TABLES `fac_ven_detalles` WRITE;
/*!40000 ALTER TABLE `fac_ven_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_ven_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fac_ventas`
--

DROP TABLE IF EXISTS `fac_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fac_ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_factura` varchar(45) NOT NULL,
  `fec_emision` datetime NOT NULL,
  `fac_ven_timbrado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fac_ventas_fac_ven_timbrado1_idx` (`fac_ven_timbrado`),
  CONSTRAINT `fk_fac_ventas_fac_ven_timbrado1` FOREIGN KEY (`fac_ven_timbrado`) REFERENCES `timbrados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fac_ventas`
--

LOCK TABLES `fac_ventas` WRITE;
/*!40000 ALTER TABLE `fac_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `fac_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` longblob NOT NULL,
  `orden` int(11) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `formato` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imagenes_usuarios1_idx` (`usu_alta`),
  KEY `fk_imagenes_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_imagenes_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imagenes_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
INSERT INTO `imagenes` VALUES (23,'ÿØÿà\0JFIF\0,,\0\0ÿáÊExif\0\0II*\0\0\0\0\0\Z\0\0\0\0J\0\0\0\0\0\0\0R\0\0\0(\0\0\0\0\0\0\01\0\0\0\0Z\0\0\02\0\0\0\0f\0\0\0z\0\0\0,\0\0\0\0\0,\0\0\0\0\0GIMP 2.10.8\02019:10:28 11:04:27\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0æ\0\0\0\0\0\0\0Ü\0\0\0\0\0\0\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ÓğïÑ¤CÕ&#ôºõ^+‰øy&ûkµí”qøƒşİ¨â¡€Í´m©vÒm¤ˆnZUãuxß¾©ÏHÇş„kÖ¼Rß¾‰}xï‹_:»z*¨ı	©Æ[Ò\'0zÓ’)%$\"3c®2´ô‘òJŞ¤çZRû%ÇüñÊ²Ïÿ\0<Ÿò®\r>æê3$1^FGr;Îé÷‚0æİöœs^ŸÌS°\\æ~Ë?üòÊ²Ïÿ\0<Ÿò®¡´›àØìÜ5Ó¯†6ï†8¬9¿²Ïÿ\0<Ÿò¤û,ÿ\0óÉÿ\0*é¿³/ªKgqM:}Ø¡÷`œ{´X.seŸê_şù¦›iÿ\0ç‹ÿ\0ß&ºs§^)æÚ@yão§ZbÙ\\3ºˆxÆYOS°\\æ´ÿ\0óÅÿ\0ï“Mû<¿óÉÿ\0ï“]Ci÷JÅ~Ï!+ŒásŒŒÒ>wRÖòsÓåÍ;Î`Ã\'xÛşù¤òÜuSùWNl.‚îò$ûÛ~éÎÉ¦ıšàdéŸºh°\\æpGcHtR+.Uƒ:ƒ\\ù$RjÃ6¼\'(‡Äút„ÿ\0Ë`¿ŸÖ½éR¾wÓ%ú¼ßóÎeÈ×ÑÈ¹P}k9€Í”ï,Ò¦	N	R)vTû)vP\"¿—Hc«[(Ù@|ºvÊ±åÒˆè8Ï†9kÛıˆÇåº½Àü.Aı‹rØäM°ş?Ö½	WŠÑŒn(ÅI¶“â|RÙ¾UôZñ¯É»Yœz? ?Æ½ƒÄÍMı…x¶»)“Y¼ôR?¥gOâeKáFA­m(£1ÿ\0kü+&¶´Ñş†§ÔšÙÎ‡O¶ÔšÕ^ÒUT.p23=Ê’\'Õo¢ÌÇÉ!NH?åJé4Zİé0ÜKu{¶r#ü+A<¥Æ7%Åúîäàg¿¥2NWìÚá\0yêFá×8½ê9,õV…$\nàe°L“Ó\rußğŠiá†.õŸ½áï\\Ï‰¬HšÙ-.®YdRçÌ“sÔ­%°Z`YIà0ãò*9«f²K1V1œàã\'\'õ¨µn¬®ä‘\\÷ˆúæ¬R¸E00\r´¹=A#ùPäëG$û‹@R23´“øäUiÎ¡\rÄm3’\\|ÃàƒÎ=*àÒ55wMÀ !ÎR¿¶º·ºŠ¦y$ 0É\'ß—Z\0´-õˆçıÙÅº¨^ cúşµ²j¶±oìR\0ÏõÇó5$ñjºhó¤¸sƒ¾[®Â‘,/ïàI<âèø8fïÈ~\rÚIÌWäo‰Ç9ıj–7ÕfˆKîŒœœJxÓµ#S/ÈW¦ş0ÿ\0^Ÿ¨¤`E&¶×Àç(î)RyÊD™Ë\nç&\\Lãı£]mì2Gpë+~¤õÌ\\¦.ëCcHŠ>ãù×Ò:[ı£K´›ûğ«~`WÎ\0`?ºq_CxF_´øSL—Ö©–ÁÔØO	OU§…ö¨-”»*m´í”Ê6U”»(¿—FÎ:UŸ.—Ëö¢Àp_w‹\rF\'\"dûéøW¡ÅaøOÃ±xoEÑ_Ì•ù¤ÇŞcı+ ÅS¸ Šx0Âš\0ó|îÔæö¯Ô}õÛú¿ó9¯h×W2w&¼Fã¬Ç?Æä*inËŸB­nØ.,ãúf°« ´´‹ıÑ[#6uV_m‹O\ZÓ[«Gº(¼Í¸çùT¥µ0„ŸôíçŸLúÖbi¶Ó[Äí©(b¹Ø@ùzq÷½é²i–kŒšš1Uf³®8ÇZ\\·¾Ô®,üßí¹cq¿åy8Æ?<š«äÜjÑ$÷Z’3òª&|)¯¥[Y“Qœ\0Bà\0O=óíúÖM4wËo%Ìl\n.‡€pxı*ÃhaUÛmş\\½œ‘éíY\n\0Ômô¸‚zg·½Cm§Irò¡‘\"hØ+	1“çTÕ™Aˆ`àõ§}¥w¤äŒğM\0]’ÀÇv°Õ·!mÃ8ÈÏ¥-Í‹ZÆî·Õ$òÎ29ë‘íT)E7L™å?é¨N@É$g¨üëUşË*Î°›…Ç¼a:t¬ÑN˜Ë7vío9İ\\ÕNkœ¼L]=o(¬›Õÿ\0Kj–hŠJŸ0ã¯î¿$ó¼`º\n~F¼L&\0>„W±|(“Ìğ“GŞ+—Oä­b%¹Ü*ÔiÊ´ğ• 4-8%H©R |ºpNjq=bö \nş]8GíVÄ5 ƒŒâ€3Õ0Ò¤NíNÅ\00-6Qˆœú\n›ÙÛk!ÿ\0f€<«Ä2bÚù‡]¯ü«Æg9½+\ZõßÉ·M»oPxûŸÜEï“J–Ì¹îDk£„bøşü«œ®˜\rªĞb¶‰›\ZI¨]îÁQK1è\0É­®Ä¤3XE#\0€™ì…ÇN”­®[x,ÂÜ#†b@l:ã5B1È*pÀƒèE6µ·WœØ[Ÿ—*	éÛëùûRÅ®¤qF¯a…\0˜œ¥ 2À8ƒƒĞúÒÖ ÖÑĞ+ÙD~R¤ñèGß­Cª]Û^]y–ĞùIé€?A@…-œ RŠ1Jµ\0(§M¤AY·ë‹¿ÂµsT5ÅÊŸQQ\"ÑT¦aoašõ/„gOÕ ÁpóıjódtdzŠï¾I‹ıZì‘Éúb…°¥¹ë\nµ*¥\nµ*­H„T©V<ö§¢JP@¬ga!$Š–8È«*¸ª°ÖøÔ‚ŠœQŠv…¶—ìQŠÅRÔÎÍ>SşÍ^¬Íu¶iSjOa­Ïñd›4;–MyTœGÿ\0b½/ÆÒlĞœy±ú\ZóIÆ\nEé|#äj2ê=MtÌ	rRq\\å°İwõp?ZèpÎÀI<V¨†h\né–6¶¯ócuúZQáËÒÅsğ@Û»¹\'ü\rY»Òµ˜şVºy3’Gœ{×?_Ò¨İ¦§kqSİKæ¹ÈQ)$‘ùç5B#—F¼†İ®$U…\rŞ½?¯åSÿ\0Â=zc”.ç\\í\'sÀúÿ\0LúN© 1£*ÀÈq÷ˆ¡ª²Åx·±Úµã1}¥Nö#ı?ÏZ\0[öÒ2òª0\\ÉÉ8©çĞn­Ğ¾äePÅÈ8Æÿ\0\\~t§D¾iDip„ğÛÎ3¸Éştÿ\0ì}IÔ82¿Şİ&:òsí@	m¡ÜÎ¨ùE‰€%ÎùÇçS?‡îQI.¼)\'ØÕRÊÚîåeò%#ËÆpØÿ\0õRéö3ê)!Iöùx1=?à:@:=âha’<2È¥¾˜Ç¨¤mà^ı•\n³•,¼ã#5\"è·¤nG^İêÙ##·‡ò¨—Mœê\"ÊFÄ»IãæÇÅ\0XşÂœFÌ]xV89Æ?Æ–×GóàŠcpª@é’2HéøUY,fŠâY”™HÛ°ç©Å]]ä¶HÊœl,q¸qü©‚{	lÂ™\ná‰²u ‘Ÿ­mÜØÜÛÛÇ$äá@ÏLŒÖ6¥Ñ½K)\r‡‘]wÂy<¿^EıûQú\ZämÛ]\'Ãy<¯ˆd/×šÁ#İTè¹¦ ©”T‘jÌk*(ÅXQL	TqRMQOHBÑEÀÅÅ´b³(JÄñ3íÒŸŞ·+ñkãNÔÒ–À·<_Ço.4õrLZóëõ˜ô\0~•ÜxõÏ—jŸïÕk…¹?¾oÃùUSøG=Å²¯àíƒ]%²Ê÷1¬ó‹\0˜àçµsš7ñş?Êº[Q+]Â ;f.qƒ+TC4’×Yaşq$‹ıèæã®}}i³é\Z´í1yÜã|”Î02}Í[T×¢ù@É~\0\0p9é×õ¨Z=sÊáäe +ÀÏê?:b(ãU7æ>ssÁ\'Í>™Îsô©²u?9d™ÊRÂS&v…£ôªó=ıà–G’+‚¿{wÍŸÒ¯5¦¶%hšæ@¤íæü c\'4^ÎJæÙ¦‚y<¸ÉÎe#ä÷üjH?´mµ(­Öä¤²€ÈÚz¥14ıZÕÏ”®%d}óÏû<ı*9ìµT•îeHüÀ6ö¯1@bÑ/Sšl,¤ıFš=Ğ¨yåQG×§z©b÷·²ÖñĞ\"î%ä \0*ÃYêqÆÏ,ååéNr?8¤“i×6Ğ<“ÊB‚¡[9\'€?Iu,Ü#®%\\üÇç\0Vt/5ÌEæşî5óH=ñÇõ©ôå¸™Ï“.Ò˜ÆO\'üûP3@iZˆ‘góxSó+r¸Çİj­6{)R9\n–rBàõÁÅ?û&÷abé°’_‘š‚òÒ{2¾s¸9äc?ÎËW\Z\\ö™$(@ #9ÿ\0\nÈÔÕ!÷­6Óî#³ûKà!†O\'5—¨ôlú\ZBÕ»à™|¯ioÙĞş\"¹¸¥ãµkxn\'ÅºD…âƒô\"¤ô²\n™G¥B•:õ¬Àš?z°•]8©ÔÓ@N´ày¨ÔÓª 9¢˜8éNÈª\Z3MÍ¬Æ;5ÊøÅñl‹ï]>kñ”™1­L¶w<_ÇRfêŞ?@?RÂ¸»“›‰ûFºß8mjö×ük”î‘©5¤>rÎ˜3¨Gì	ı+¡¤Iãh¿Ö~¹â°4¯øüÏ¢šŞ·•¡¸UPÌŒ2	¢%šu¬yë#2òÆYNqbjt“\\B¬cT}Ò08ã¨8©&§y‘È±ÈÌà•<– œşBu«Ò¡LI…]«„Æaøf˜†ËöıRfÔc‡,İòr1Ğu=E>Iõ¡m š)mˆÉ’=¡sÆOz†=Nò,J‘ÆŸËÛòå½G~”’ê—’’ÒylK‡Ã(##8şf€sªZÌÑËtá³¿åaƒ‘×­S—Q¼pû®dmçæÉë×üM-ÜòİJe—nãÉ#5Q•½¿1@I¤E`®Êa€=ELú…ÜºK™˜àŒ´„ğzÕM§Ô~b—í/ç@#Ğ0Ge0Àd{Ô°]K&)	%N\rTı¥üêEí/ç@>ÙpÉ±§¯M¥)Í<³cÌ‘ß76qU\0ÿ\0h~u*GÌ?:\0¶\'®Æ‘ŠúÅA~shM8îÙÍ£j@gDı+GN¸ò5;Yÿ\0çÄMú‘Xñ75r7ÃnÏFFüš•´>±Œ‚ „TËTôù<Ûy?½·æ]SŠÄd«S)Å@*@i:šp54üŠw\\Òæ¢\rNİLF8j]Õj\\Ô€ıÕÄx½óv‹è+³İ\\ŠŸv£AS=Š†çø­÷xˆs÷GôÊ]‰wˆ®[?túW:Mkåí+ş>ÛıÃ[H¬ä…RÄàÕ‹¥ÇÄ‡Ñ?­t\Z}ÚÙİyÌ…şV\\;Œw­lK!£if\0I<ŞºD×¬¤fY˜ã<€6œcv?‡ı¯Ò«Ï¬ÛHCÇb\"uÎÖV~ï½\0bÇo4§Ã#œg\n¤ñMttY•‚·*Hàı+z×^ŠÙp,ÉÆ6‘ `—Ûõ5Æ»°¬o`T†ÁqŒƒœıŞô…5¼Ñ¢<‘:¬Ÿp‘÷ºtüÅ#Xİ\r¬İ«=S[w% QgŒ6àL™ ñŞÃŠªšûAF¶İ™ÉÉşõ\0d5¼ë»t2\r€3eO\0ô&Ÿö+Î¦»1€;ÕÏí÷U(¶Ñl`€ƒ“¸Çò§CâK˜*7`\0ÜÄ’pN;ûÒ¸ÍÊHÑ˜[z€ÅG\'œ~4è,®fI8]„dÂ¤ãZ°¾ f2,0‚T.0zwïÒŸˆn¢İ¶8rXŸ»Ó8Èı8¬.Ü?ú<Š’ÊG¥M:í•\n@òPÀ¢“Ö¤>$¼d(Vó·sÏ×“Kˆ/T(Y+Ğ•É÷üğ?*w`2K;˜#ß4.‹»nXcš¯sÍ³ı*üÚõÍÍ’[2¢…ãrä:b³¤9‰†h@b£sVÕ•/¯–Oê+=O5v™d±·ò¤3ê¯Iæø{O[tşBµ–¹ßËçx3I~æİk¡ZÀd ÓÁ¨Å<Z`J\Z—<Ty¥Ï4À—4n¨Á§SŒ\r.jÔíÔ?5çŞ#}Ú›û\nïY†\ryÖºùÔf9éQ=Šç‹êòyš½óÿ\0´ßú¬Š»s/™5Ä„rÜşuG5°\r+ıdßîQ[ú]Ä6÷Ló’¡^<šÀÒğÍßåÏü+@\Z:i5\rF™¾Ïó0r	Sœ“ÇOÔÒG}£”Ioó\0£ı^zr39®o}&ÿ\0zb±ÔOHÃªBÁN6¯”1‘»¯<õ•ºD-ÖÛ‡e.~a€	ÏNk–ó=éL™Í07eÕtœ¶ÛC÷HPa^IÏ_qùVN­{oy<fÙ#U +\01É<`ûÕ\'54€CÁ¤ÍÓ3IŒ~iÊÕiÀûĞêÔõj€\Z\ZXVÅ<¿îÛéUÔãŠyoı)NCWlé6êÃôªzÿ\0ï\Z¹`ßéQóÔãô¤Qô¯ÃI¼ÿ\0\0ém×•ü+¯Â|%|øİ3Ÿ-Ù¯õ®ìVOpCÅ8\Zh¥ c¥¤£4x§\n`4ñLgÿÙÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÂ\0Ğ\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ùÆ7Øë^Æ2—•«CÉ€@\0á1‹-<é¢å×Sy5>ïáå±3æf2@†4ì’”Yd%-¥ ÓÉY`Ğ„\Zˆy!èI[\"\r\n2SA:€I%,\r\0X:Œ¤§@@Œ”¦“ (mÈöCÁ[\nçÙ7úÏ­¯5koBa€°®XKå=C\0VĞR14¦\0P\r”PıN/·É”¼êŠÔ\nÉŒ@Ó‚Ò\05x×9Ç¦•×ÍÎùúgá^ş·‹gÉÏRLË)¹E*\Z\r¦T¢Ğ \nWQ†@´bFĞ‰‘[I€JÄ1Y ˆ¥B\0µ€3*Æ F$\Zt¬¦™\\ÈE“Væ¹¿Ò}tÜÆ­hä`0% \Z‚DR€€\0Z€4™fš2€LØ²gçÏSb¿~™Ê[VÕfPÄ H™%jËEÏ|—.¾	Ò\rNöyçy³ÉÄÉ$–²R¡ª\r$,2m!€j	\0™bV €b*Ù\0ÄII\"V%À\Z²b…Hr¡£‘ØA*f­Q’Ë?Ayïo…-¨€(4XX\n(4\0d«!«$\nD!\\˜Ÿ=SÔë÷ùÏÖdjÚ¬À¡€	X¤HbqåÎrëÇñëçšFŸ¯?û|øªÏhÌÊ\0 (\0Ó bH\rP\0™` \0\0\0Ä\nÅ` €’5d ;PÑ	hPÅTL´	+&Ê‡*d¶€ftGİ8_¥`ÖÇLI@PhÁXĞ@5\0($@ĞÅ+šÏ½Æµ÷¦vù[y•Y:€f€€(`Î¹~=9>q&3ïÏå~Î5¬ÙkóA¢¾½gmcHñZ«&†A@Ø‘´ÚH`Ò\"ÂPÆË#oGÌ5D\\\\aTDĞÎ;NŒRHDŠÄ&Ñ5#ÊJ…`JÎ@\nÛ%õI+ö.wëÜ¨c‚€€ªc$hÀ(*c\0$ \0€\0¡’ËçŞı\rgíÌô9enÊÉ–²\ZŒY´$BZ ¬×%Ç§+Ãª1\')èçóŸo\ryéËÃš	@åÜë;mb„ °¦£Yd¥4$Pf2FÔ£\nY1P:Bƒ2ÕTÉm\"G¨‚:›–KM+‹Ye4Ä²•‚Éæ—‰Ê‚ĞG®c_Tç¯·òdª(0¦8L\0ˆa+#B\0€C\0Á¡\róÏ£mŸ²W[–F¬ešÄ\0\0\0IZ’æÆ¸ş=¹=b1ë<_¯‡	êç«g×—‹\ZBF%5»Ókpµ—’	 †kG)&PnHó¡0°Hè	cY«@Îj5¬ÔÄ´ÔÖóPjÅ4[:¡À£I‘ táH‚è¥óÇ=‚š\"¬“Õ&è˜¿ yec\n`1€Œ\0a\n`*˜ ¹0QŸÎ™“ë7=ÆVÓ2<Ğ` Qxq®7‡nw—YŒzÏëáÈz¹éÙöeâÆÕIQ»Óka¬€< z*$&–LÀyÒBj“ir*˜j±f…,¬HóQZ’<é-¥3\"¦J0¨Â	Evªq$G9„Í\0°3Éˆì±Iòd(¡C b0À\0!‚L@)h”aL s@1+gó?«{Ï§Yô¬È6²5ˆ\0\0C\0Í~uÄpí¢ãÒ*5Ÿœzøó>:šÏ™åÀ@€£ Ô÷\\±ê²ñ7&iG,¶×>3ÇT@#\"Õõ™³<\0¨)Z<:\0”g²OF5â\'DÏJù‰Ôa(gŒ¨Š‰n“rÂºÜxØ$\n¢³Ìá:ßÔ¼™óYCcµ\01€#ŒY´\0À\0C€JÂÄ0\n2¢FP–½Zè3>‡gÒ2ÈYMXf… \0\01Õç\\7Ú~=1Ôk?1õñÒú8é«Ñ™ãÅ €iÔk>š©è>—ÎùL\ZjOTl4ÕÆ¢;Óã	MxŒîÏŸ(Ïq«ÕÔ>g˜öµÁje3V«JÁ™tÎq)Gu.¬è#çgI¦Óf5ñšD÷™íÑÄr\'¥<Ç¶4æÏZñf „f5Ñfùñ´ÂŠË2oêM†k(`–°!\0ĞÚJD’\0Õ\nÊJ£$Ë(3òw¡Ö@¥—•İ\0Ñ‹ 5sh“Sp¾nú®{LzÇÊ½¼4ıùë£&^\\ì,¶€g©ÜôØJËèøc Êf<DVébOzêÌf¾ÍéóÆ»V|§¢”¼éĞ&3yuóóé3<ñ–îô¼g©:“‹ÓPvùš“ 8³¬ÕÔnf”†’û™ñ™»lË&¨“fi´ÙÄsº*’ÓeâÅ`\"†;†ÎÂkôß\'CPÚeŒ\rŒ• É‚\01\0L±\041\0Ùb°?$w½©ŞÇÒËË!MÑC€dPÖI¥Æ¸_7}o=Æ¦-cä^Ş\ZîüüPfùó Be´‹g©ÜÉeG‘‚ è…•¡dÅc\'ZS.)X¬¥^ZÓJÙ¡œ²K65¬ŒÊD^¬™sci&Rzó(Í^s(VF»GA‰½>^P\0\n=,çÑ|¦5C(¡˜\0À €Ä5*\0$ ,6àƒ,VãSè\\õŞ§ÓÎ¬¢Æ¶B0Õ$\0Z.=8_?£ÁcL=1ñ¿oŸËÓ>sndlÁJ‘×]¹w!	bÍI„	l‘™S@QEË\"D*¦„@2“à\n\ni‰’´$cŒjÆŒ	K,µ1&§\Z×â€²	BŞ}ƒ—ïÜŸGåltÆP\0ÀµZIbh\Z€d k@ÙbÎ¦P4,‹ıZúg<ı~Vue5²QU““0+ãÓ…óú<™Ö4ÁÓ÷yqôÎ#Ö\0ÎkzíåÔvÇG™å<‘¤ÓÌzùåzŒ¿4e›4ÚiˆÏ ·LbOiá¯CZ¤ÀnÌ¦ù8ÓÕc=k‰6¦ÖkÁ—‹Yó†±’\nk1)Äî=Ç‰|\nVR­0¦¯\Z×cr&•¹°Lr}·“ë¼¶ÇT0(c(R\0Ğ5PA,…kHl°Î€\0d˜X!\"?úçĞ¹>›ŸD«™¢Úc(\Z™)B@ 1œ×.œ/ş\\ê$ñôçñ_™\\‡Š\"h\rC.§W®nĞynÎÈÕå½Ó4µİ\Zøè\0Í£Ï©ÌTIëº×™³ŸéPÇ™6Åjé»7Àt²a7VéâÓ—­&æË.£Êz.|çA.¨« âtñ^[34IÃ]#¹™Ö”ñ›;~iX©îµ­j9¤c“©îÖ<Éõş/¸rİ±\Z… =Z€Ñ€Æ,è9­“€òcÑ\rFeø·Ó®ë“ìws4[TX#\0PbŒ1ÌñéÃpï‡:ÄÆ§·?‘û¼òŠµñ3A³×©Òë›”î=•éŒšsæ(ÊoãÄc3“šSÊg¯Y¢ÑåA*4zGfsC«€õr0³ÕdG•|õ¨Ü÷å¹ÆèÅs·6ñ¥<5”æ4“q–àÁ¤ºÂnæ} ƒÏo+Slí×5§æ€õ=šÇ‘>¥Å÷ş[±”1Œ¡ª)jÑY\"´@Œb@hÃ9­1ä\0Å <ô´Ê@ükß}W\'ÜN½š[,°ˆ\0j\0€Få8õâøwÃ–+n_4÷ù¹ãm/‚Yš	@`l5‡BÆé.ZÉÉCÕd€É‡\0ˆ¾J–QØ´ÖsLfƒ4&ÊÈSD1æ¢©¦Å5À0ZTPİ2KB$‚El‘Ñ¬ËMÎ¡VĞ¯?ešíO¡ó~”åmk5Œ°ÑC\0¡ˆyĞ\0ic$d”0È€üqŞoytı\nÏFË\\†B€\0\0@\0Ë—ÜwØ2ÇsËöåó_›Pm¥ÖË3LH\0Í³½Ò¬aj:ù^Mí@²rò±JüM-3&œóé%Ma\nV	·5ë€vdËhºm‚±À‚3ÚyD´<¨\n-±—-H5&;\Zk²Ñæ T—k&óõYáÔéy¿Xr¹óXÆ=\0c‚±€#†@´ dŒ\0\0ĞÏÆş~î}¿MgÂ“\"äP¥ˆ†\n\0Ï¼o¼ŸØ£Ïèáóßga´“Wè\rÜí¸Ö^A’ß§Ög†=†2\"O%zÏDjyˆgéÏûiÆ}7Ù_:ÓÄ½¦^íf\rmLò†ZÔ3éY6|ûJ_Rõœç„÷W\ZF£;,±™—C1\"66ûrĞ…µ–¶,ñ§šÙ$ğşh£C%Œ,ËyàÔöåû…õ\rYm0(c(C`\Zƒ\0\nˆcEÒ?õÏ‘Yâm\"Œ‹jÊT°D%IãÍâ¼ı¹]påƒyâ=œ8G²“[\njKT7»Î×Y¡eûÔbùÏ)˜ÇóÅ^ƒa\r‘¢7‡ÂvÕôxòœv§„¬ï¼Ê™Æz+rkdĞ5`kÎ™EgÎ4j¿Pç4‡ƒYå}´}*!PRAÜ`:EÕ.6“<qåµyNw6U4™vPìWšÔ¬¿^p»­L°0”‚€PÄ0É@1\rt»]B~¹çœQ¹¦1H\0\0\ZükˆáÛšç¼F-gçŞÏ?ß•¯~ZéT¨b#¡Şv:Ê†d·ê<õ°¤&Af²lC$r*|³YòS%S*VPhH\nÅ4Ù¡]cf¨3gRÉHˆg¤¢J:ÕæD’eT^VZÆ3ÎbKSÈsØ°ÓÉ²#ÔZÏ£YòŸ¬8:Œê¤ÕŒ\n c*\0À\0¥c\0ÑŒQC\Z!ˆb(T~:õgOÏ_¬yg~d,É4\0\0\0´HÄ³\ZáxvçùîZÏÍ=~7¿-{r×Ë2±(:=çÛ¬ÔĞî”Í’0”\0š@Öu’,²åcÑšŠY\nb™\Zat™¨’õ¤Ép†\"ÆR°FXR\"IMIç9ØÆÑ=e#LzÏ·¦u‡ê>ë:¹(m2€tÀcŠŠÆ\nÆ0(HX4@1P…LüiéÏ7ôŸ\'s3eµR€@ÄÙ(ŸøNtœºA‹¦>cíáÄ÷åŸ,Òø4† j3§Ôô%UdÓÜ#¹8*ôi}ÇŒÈk“Úo%Õ*óŞÏ“((£Í§¬éòä\rá©k×\'€V!¨:uY\0Që¯\Zâ<†ÄÒ\n™î—Üj\0¥b3M\rbP”µæ9øÀ<€ÖiÃ¬lzóÑáúcú_=RPÚ TÂ(\n‚°@jÀ° %¡¢\ZØ\0\rX¨?\ZzqäÍûï\'ÓfrÓ•€\nR± &—ø>µ·&\rÏ•ı\'×Ü²fø¤5A¨Î³S:dó>¤\"UdK·<æ¨ùÎ¦Äí%õ\ZùñÖç^¤è&yó;^ƒç;ÎCé8×„ÈÖÙŸ2sÇ±=€¸ŒÃh´írõæä)2ió{2u²8iŸ£1ÚO¤fë†{GœõÒÇ©¯RøNUX7€ÑÇŒy¬ĞÓ›¼yì?Fó¿[ç«F6¨U1Ã V$¡¨2€H)A¤”´2„%±P~Sïoï™ŸH’áƒ@À«™*h`€hyïƒáßYÏqs‡yù\'·ÏÇõç°&_.Ca(\rlêúfÙwM2f}Lã£(ôÎD¹Zğ³„çSÚo¥ÄUœ±°k¥Ms¿kë“ÓĞtXf\ZúÃf`x‚ßthäØµ{ĞÔ3tqzYÕæú5;ÃŠÓÌv™°	-$Êx.´\'¿3vz—RÖ¯œÓMxò: Öp³ííÏŸÎ~õÏ_oÂ”*MX¨@P@d´	†\nÀ DP\0‹–‹$`U0@ü7Ş<_×9›¹0i”rh\Z€€sÜ·Âyûøs¼W8wŸû|Ü¯\\mLù²ÖÎ¿¦S5l3Y»cUR\"…%5#Ab •2ò\Zj¬)BŒ\n»èĞI˜Ã¦ê5f:C‡¢	@J*ó-4%CVRÓS3Co	¤ÃÅ“Ñ¬½g>œô:ÏØùkô\'5-„XÚ¡S(`0‹B¤\nÔÁ\0À¡‚ÑB@#?÷}‡ĞXË.5`!Œ\0„ˆËœç×…áÛÅ›¿§/{¼üÏLîu„%\0oYìu˜,‚‰(\n´bC!P’:=t(¢Jh1fQ:1hò¨4CÈ†-„PÀcÍ@1€Úy;¦9¦Râ4ÙkòW£ÖaœšÆ“Yún/éJZ( še2t;Xä¡Ğm˜âÆTŒ\rXS!#ÏÉ\'éNoUÍ(m\0Œ‚\0aË˜ç×ˆáÛË›ŒÓvåò_oŸœŞw†¯= R®Mg²Ö`{¨YjUb2@f®tØµì\ZeËÔB¢é:<™ ¡\0fPi%hdCĞˆ@Aš@4d®²Õ¸Í6Zü™aU¥ë2ÊÖ5\ZÏk‹ú»“\"ĞÆTÓ)WTPT9hR¬‚†U á‰SX-\n¨b2\"ÎJóö•-Ó€(\0ƒ.[—N\'‡|XÙç{òùo³—=qº]\\ÜHÑ›³`PlwyÙfDó¥Ï	¼é­dÉu¯ĞÖ^D\"©@)PĞI@0Ôb*\ZªP\n$¡Í±ËC¶šp4k2¬¯Z©+Lšåß&óºÃõÿ\0&Yl¡ª4)¦XÑ”Ğ(e\0U\"€²‡k”R1ÖR	9†3—(6¬e\00  Í—\'Ë§Ã¾)¬w<‡~?5öñÒI¸53R\n	lØÜôÛ!@z+e‘jf×Zd<Fû-=z­Ì<È(Óh´2 BV4XH$\ZŒdÔ*˜±AŒ\0sl©hvÓUjcS•ezÖK+L‰\'||ûÏ«Øœ›	h°)¦ÑS@Ë¡¤–Se:2Š(E[`PIEÕ\')qŸ*V9¦€\0€ª’ yZã¸õä¸õÇ&8ü¾{ìã£6ìê³PM&ÓYßêSHdØ\0\nš–DzÑ\"ÉÒS\"¼é2Â€@\0P†Š€1 z!\Z±,˜mMPKm1š¨ÔeQmUÎM2Y)àß5¾jkõ÷&û ¦TÓPàATT·  P#Ğc*™d™Ä\0e1™‰,G)q›!h&˜ÀtÀ(d\'®3^[\\rbÓçŞ\\/·£-£:¬ĞS@€\rŞ¦ÛRÕ¢&Àb‡42Ö”•‘tÅbdZÎ¡š\0BPÄ‡\0b+$=M!2ÁhP€mPæ™rX\Z¸Óeq‘¢g.™w™g_¼äß?×ënN·eĞTĞC†PÊ«Xí`–\n,tÊ2YC3YEéœ–s\ZeCÄ\0PÀ Z×çëÍóí9ÁgÍ½œ8G=}ÎĞÕæ¡CH{©µÔb @!˜àôP±Ê&USJeĞ\nŠÉ…!À<Ö\Zˆ`0À¡ªÇ\0æ˜k åqSTÓ’–šf·-&Vdf]¬ß?WNZEı]ÉŞâ…À[L`2‹(-ŒªŒ¢š°ª,¢Äç+Z±²Ìq˜ª¬§ÌÊi„(`\00„PS\\GŸ¯;Ï´g8lù³‡èçæ¹÷\ZÌÔ P}©´Ô ¤b((@-&Ê¬%H®[J¬¡”\08c†ÂÊÅ`\0P0(j\0¨1 zËå¦ª[VÕ¹ü¨ÈYFm(×oŸ£§.uSr}3*Ú`PÆd\0VRX:£#(mQtŠ3\0ÏK,5«C%\"âB™ÆòPÚP`\0\nÄ€2ºyÓ‡áÓCÏsX4ùO¯ÍÅöÁ³]4PÒGgEfÃQ…¨©˜\'UB€fèÃ\ZÀÒòP‡¢›Ïg˜3hV1\0K`ˆt‡\0ŠhF£\ZgH5šTŞˆ±gU5mSLòaÎ3xÖIrYzdÔ³[¬ú7Ç™¯Ó\\Ÿ[Å š¢€ªe8\0È–QUE’S6zt=F5ÈYt1C8îF6˜À`\0P„¥Í.tá¸tÓóéŠÌ:|—×æâ{cÙx&€PH‡gMg¯S!#è\\ğ¬Ü<½ç>t$v§š<fªëÀt¬êFÈ÷.ŒÏ\'°ÒË²<ºœÁb\rA%\nĞhF¬¢•6CRÃ&½)Xój*)«h<Ø×6ÎLk$¹,½2ÙGƒyÉ¾<½~Šäûf-4ÀÈ:°¢ÄPêÊ2ˆ\0³%Q”ì£6ˆÊ (z1C\näyh€\0 V\0dI çÓ…ãÓW¸ÓÏ¬|İÇŒëÏe!€•\nà®«Yõ#&™ô´çbja¥6¥/>8Ò›Šö\ZCŸ:	® åÎÓ³Êeå½8ŠÓW‡g“èĞæeˆ \Z±% Î“5 B,m²³–Š¶³pg\\öK…oY“%Í×Šâzræ­ûÆ~ålm”2‚,tÊ,±ˆ£!C¬€QEµœ Ğ2‚ÚD!ˆ@r|tÆ\"‰,@@\0\0\0ƒçÓƒáÓ[Ï¬êyu{¸ò]yídÃ6™22la]n³YFÄõ\"Ì$Î^ãæúfkÌµÈx\r¤¸ŒIë<G¨@{rîMrÕåŞ–C4jR‘„Ñ¬°CPŒ\nš(eka(\\¬»o7Ísù,²FK¬©“yºóÜ`éË·ì~‘år”Õ\02¢‡TYb,È# T2€ô³˜c*Œš°JÎKÏ¦-À\0 €\0kÍséÃy»x3¬zºİrøïÒòó6ns|‡‘X¡C¹ë·œ¶‚d%AjÈ¬œ‰A’:z,¨šbÍd#§¥dÌ‘B”Ñ#0€«¤6h\0` \"¥@ËiHÊ\0@¶›U•µRÙçÍÑfa\\¹Y”Ï¦M0Üø:rÒC™ıUÇYUÊ2†QEUPÀÈd2\\Á‘«)š™\0Êd EQ%	Z\0\"N[Ï¦=À`!Œ‘Œ@HW—çÓˆáÛÇ›txü—ßçæ,ŞÆ°Ç4‚\0î{=äµ\0ˆZ¡Ã\"P	\Z1Î™º4¬¨¨cª‘ŠS ÀC€d\ZĞ¤aABiÈÇ¥1–ĞÕe‘«–<hæ|ùŞ\\²i”ÎdÑ\\êúrÔ×Yœş¹ã¯BÔ \0ePŒ•`YEs&fƒ;(Ë¥ª\nQ\0\0\0\0)çĞV€	( D1%å9tâyuòæâ®w¿/•ûxsÉ¾M;QŠ…rAZ¦³(D\0´AR Í@Q\Z0ÎõyÒf†1B\"ÀqdÓ1€\0\Z`È!”\"‰ª¬qC(xÖFˆ³¤ÍògYLÆC=—rjêõÏ[¬îpıÍïÎ²(PPUŠ,ÉY,ªc3L†6r™t“ PÆ®ÉV4\0\0\0å<ú¡i@\0”0\0–^K—N/‡_>n=¹.ü¾iíá MêiZX²;”KTdÔí5œBJ$\0¤)$y Éˆy!èÃ:X©JEÀÇ\0\00Æ\00Š˜]Œ¬jÚ¨£¥ÍñgYLÆc5;/SM®~kœÇì>-Öt-È1•Aqb¬†B•fBŒ de•£(  ¡…I@\0\0\0rüt$\ZP€\0\0\0C\'7åÛã×cÔâ;óùÇ·Ë§7’é–d@$ôjözÎ!IU\0ĞÊÔbiH‡¢[^óÀÌ(4èËrº²Æ´,Ë79ºƒqZƒŞšáíºËMè·Ù–³PŠ6¦·İšMd6±â=zÖĞĞg(©»j¤¢KxrÊe³)™rYZÆ—\\ñna?^quôË-ª( ª(eÌXd¦T3.óCTÀT\0\0\0\0\0rütÃ&\Z\0† \0\ZüŞ7—nG\\ŠÎÕÏçş¿.¤İæé•\"#éÔìµœMH†w±œä++>«p«Ê*\Z×$˜«nrqïkèñÂ³í³ÎD¾ÓĞhO5wyZóÆ;0UëÍ2zÍî/<uzs&döœE}-f0[²Ê58ó¦Ëê·›³C¬óÇq–àÑİe&gÌa]W-º\\ëÁ•™¬Ìe3\\Ş³¤Ö+sN~¸âíùêÊ)ªEÓc(²À¡ÖPŒÃŞrŒAV\0U2@¢J\0\0˜óìˆh€Š\0\0€\rl¼GÜ·.¸£ÏÍıœ¸Ojm¬ÒçNTrÍ:íg\n„¯Ë;ºÈz¤×è„b—g–Ü•Z3„Ûè9{ãÈ(£ 9óÔr\Zx«ªËÙoO›ëR!µÌ\n0²OxNR»Ì³é–O§	§]›ÓeÏƒ%b2×\nwÙ#Y^ÃÕ\Zõ–ù²’„ÖŸ:ÖIg£7Ğd³#7¶£\\çS@~´å>Ï@ËjÆ2†]f$£!@JÎC93&”ÀePI@\0\0\03çØ= \n\02(1\0F¦^#‡nk\\f+Ÿ˜{9q^>DÙY©Î‰PB&Ä›M:]g\Z³ghjM„j	“İ¦sÌxmÍ”ãÏX~ºL¢‘à«$’²Á¤VÏ/=f=Yiõ¯Fb=éŒöšÃØyyvÍ•L9¨ÉgŸKS\'zHá ŒÍ—I/6Ü2ZŒëU‰Ì¾“5dKÛS®f±ËŸª9O«óÒ,ÈĞQcé™e(²ÅYDÎB€É£\nc¨$ \0\0\0™óì\rŒ’€’’B€\0‰4Ø×Ë¯=Ç®#Ÿ.÷y¸Üq›tò¹`µ\0Îãsy¬¨ZL 	õ#ÖFŒvIR @¥A“\rJ‡œØ-„¶€Ë‚D…0†ĞÈSH`a2Â¬i`µšídÖ¯7OdË9˜ÍfZË©­eïŸ\Z~›å>ÓÏU5EhÊ(¡YtŒàU3(Y“@)…Y%\0	Z\0\0\0s>}…h\0Ä\0\0’:@h±®—].¸Ì?\'÷y¸Üıª]\\ªT4‰g}¹¶ÖT-&FÖCZ€´\Z ±\\Æ¶Ph	,öeä)hVd	}ç€\n=D@YæŠi2M¹¤ZVz®}F²,¤¹3KYEÖ·7I^^†r‹n¯Xñ3Ï\"~‡ç>óeÆ™ZQ”E\0Ædª(Êdª(E[(­(t0(\0\0\0\0\0æxî€ \0\0l\0 Ğc\\\'úlï8kä^ÿ\07Ó>ó<š¸B% @tç³ÑÊÌÇÕòåÖsÚxeØ›èã´ó˜úy\r6¦æì…©ÆëO3¹›.L\'¸Ù\ZƒĞ™M:ïe<FÇ7k§3£;èy#M[l´ÅhO4º]d_¨e¡—s;b6˜odmn3E#×§KL¹uóZÌ†l³õ¬¥§—SÍ¾|³?pçHòÕf²‹+@¢†JÊIÊ#51²‹ÒÊP0\0\0\0\0›ã¶\0\0 \0ŠÀ\0Qˆç1®‡}NzbL?únCyÙ•&º	©&ùûôµ‘FÈúî\Z“V‹Ot¾aWÍ´ƒo¨÷ÜÌÆ±däºMnµy$b:ì´æèğ˜D»sÂÓç\ZÕæú£Ñ§	 vëËrh+s–¢=é¾>e.¿YÛ/s—5ÛŸ/ÔgS–ÀÚÙ¯1.s×\Zºİ×ÎDÕ„¾9­e³r™õs˜µ<{çÍ3õnwõ\'-dÍ¢Š+K”XêÆe(´Êe—¥  \0u@\0\0\0\09Ç`\0\0\0PP@Iˆæ¹ë…áß[5<ÛÏÆ>‡Ÿ—Öv¢_tfI4êh:=ccK@yu–=EÆÓMta6µÀ‘©è;ns–k5×½”˜š†«ÆXcÖb¬:ÀwØ{“èÒÄx*µräI˜Œ³XÌ¢<Ã2Ëfı­q­¬§Y3Éu Xäz•&Ùqä9üZË5e2™š&u{ç¥;¬?]pÖX±µEhÊÉ—¥”1Õ•YÍX´¡Œt\0L\0\0\0\0\0ç8ìB\0\0 HÀA\0s–ç®‡}tÖ$×o?úngSn`_&t³$*iPtúÇ¶–ˆb+&!TÅ $@ƒNjYi [JÆEP<€ÖBæòáÒÔ2©B©\neA-LU.B¦˜Ä]…—•’ÛyÍ*Ë-e2™)O\\ë‡ıÃ^¨¡µ”4¡ä£,\n¬¥VB™¡\nÑeP\0: À\0\0\0çxí\0Ä\0\0@ €ó—-ñ:ø1\Zn¼¾MíósZ›Ã_5¨@2€¢ºİã50RÑ… €PQ HÅ“(¢j‚Ä^jÊÆ=G­5b2ÈCĞœøèÑPp\r«ÂÖÒfŠ¸cZó§—”ÒÍcË5d-œ¦Qš½cÂläı‹É·Å¢î™E‹JŠ(º³ ‹¹ÈI4¢É.˜€`U!€\0\0ÎñÚŠ$\0`*\0„Œä¹o‡áÛÌŞ#œëËå¾ß7?©º5™Ö&‰\0*¿¦3TØ_N]©¬Ó—€“tmrğ\Z\r,¦¼Õ:Ê=ù!Ä“¸>i¥›y(r£¦¬¬ß¡Œã±˜õÉ¢=ç´ñ¯ òFÈÑ9ÀhBÃNlmñ|·‰ £pj5|Mi\\ò„l,óÚgN¼æ›7Y,Êe,¦hÖjc	?crtX¬»«‡¦@Ê2V@,.rŒ Ò€aT\0\n`0À\0çxì\n\0\0#A`#Åq¼ºq|:ù×œ—n?8öpç¤Ş\Zv¤DBĞ;c j!æı.ÍñÖcYOf¦œğ™µç¦¾?XôÛåÜá¯:#BY®Ó‰Ò¨ód4ô6ÜPãèñ†1åë\\DYç7‡oS>uµ¯9­šíõ¼5¢Am{Ìå1ïõ¯›\Zë¹Öbä<×<Á­»¢ìóšl_6Y,Èe[F²ç-)?_ñvİ1”QCÑ™I.²EMÎq\Z1€\0é)cP@\0\0sœvÂ‚¢D1ˆHÁAXÄx3®\'—N?‡\\‹N+¿{|ú\\]á£h$	tgc¬YZ¨»Ë,èQáÕ’Œg’°øàë]Tk\rqî=Æ‡Nh£wnãÚ|ÿ\0lEMuå¹ôå‰f#SÔh„ç“qkkÔvQó½Tzùt$ĞefÏ1èZŞ¼â€ôfb2k(StU˜M>/—+·!•2I®¹õÙ¤O×\\ß=Ùc`2ô¢€ËY\0,W,È¦ACF5ÍfBh(C$ç¸ì\0D…\0€J‡`%ÖeÄréÉqí‰¬Gêóp®\Zeİ.“5	™»]á\0°Ğ]¹Äh‚ Ò1²† IÕ	S>ö¼ÌùÕ„Ó–då\0–YE]¸¶)(µ i @-IsUÖJyrÉ›˜Ì”U#Zlæ®Zò×ÑùjÊ¶ŠL„Œ½2“0Xè2Ü²Z¡¥¡¢(aL@c, 0ã´:\n\0€š\0”€—S—Ë§+Ç¶œú¼Ü?«†µ½ÊésP™‘4ªí÷Œc\0´&-ÓM\"Y‘CĞ©‚¦F¥”¬PL•J€¦A…®CTTŒ÷.4†È^@ÚU–0ÆXî±\Zc_–LÜ†DÊ]Ÿs<µ~¬å¯«òÕÜƒJŒº2Š1%)rÊh)–dÒJé€\0€  \n9Ş;\n$\nGL$ @#Mp¼zs\\zá·¹üÇÑÇõsğÆÌÓÊ„\r‚bë·ÜÄ5mK;fKq5¶™æÏyœ×ÖøæÄ!D):Èòœá\'xÖ4¦U!Â2*a;ŞzÉ©Édô›\r<G<P5ôŒ¾yr†Õ™­6iä=1ä6X{ÎwWš‹¦d™ì²ó8á¥ºŒïW3’(ÊÕ³{Í/—7ÜÏ#géŞO´óİeehË1—AE™lÉj‘èC \0\0cM-…\0C\"¨$ @I£Î¸^=9Ş=qÛ‡\\şYëãÇwç‡-‘§$JÈÓ&Æ¦±´G|ÎÂKkW[SÉ–#ÏTnA&Sç½VgÕrãnº3ËÅõ3ä25­2ë4n2Õ\Zúç4ÑŒ¸ú/=hÓl4ö\ZáÌZXî\\-6ç©z²Õ›ÊğpØO6œÕÓ:9£/9¤Ói¥é+§Æõ9ÎH³#TÎMç\"ù³}Ìò~äûÏ=²Ê`Qz# ‰ «!BdlB+@:\0‚´fƒ–è\0\0’¨%‘qËÏã\\7.ÚzÄ°Ÿ(÷yøş¹šÙšLÈ\rPY «Ó¹¸ÀÎÓ-Ö[Ãåº»ã ¬1§ËŞQì7GÆôñíC‡P¬¼–r\'Ğ£’:Xå§MIª·ÜiæQ¢ÕeÙÙó×w¦¿3]ÑèËÄjjŒçVrH‹,ëMY”öeæ5U» ×ë^V^Yãhbµ+,dšŒoQ•–djõœ·>^Ó•>ÿ\0‡è>;ÈQaV=Õ–€Ì‚(Ã«1\n¹\n ¢ƒJ%SÀJ#4·CÄ0\0ÕÊ1Ís˜×Ë¶“¡q§È½Ş~?®sW¼ÓfÀµ\0ÉYôî®<”ázò2˜×é¢ ’rí\rœfšŠ€É\nÏ\\u«Â\n˜É€Ô‘dŠ¶G%4™\nPb2†ÇAK@2¢‰ªİTÉ•S.ZŒ²Mn7£Ê‹25zÎkŠ1åí9“ìø~˜ã¼ƒtÃL‚VR2Ë º¡€\\åehÀ’é Ğòİ€\0I@M\0d17Ìã\\/º{ÆaÖ~AïáÇo;=§A¤N &}s¼ùtY8JÃQ*¥£È„-\0\0©‘ˆJ‰$¢D\0HŒl²šr ¦)X²eê±%2€ ƒ&\ZŒy[BPÆdM6X\ZìkE4ä³%4Ï¦Mg7 Ñ×ÒrıcÇy!Å¶RP‹2h„e˜@XÂ™UdŒL†R@EhÄPéfƒ–Ø\0J\0¦ Cß-Ï\\7>ºÎ{ÆÏ›Yø×¿‡-¼ì«!«Æ \0Z ˜õ¦ç—G“…e\nÔ!lepŒšzŠÂcD01¨n2Ó‘£ b²\r¢@tŠ•@µ2ĞÆYBÆ^HzŒySM,\n(­Ø\ZÜëA92e³“ZÍ¬œÌ×WQ—ì;Í;YHé%EYS%\"¨(’Ê\0+@‘if‡–ÀJ$`!ˆ\0\0TÏ4¼Ÿ=püzëóÓÏƒxø×Ñósu¶­Î¤\r\0™ØiÖÙ…¥rÆo\rä¼Ñ×³ÂÑ\Zøõ9oO®CêÉá4f#j¾Ã“<‡i\'\r¦«II&•†d”1Û:<œ)ÇJ(Š\0(YCZ\Z0,¡€×Æƒ=rÓ%¶dÜÈ928ÜÇì;ØåCe^”<²\0Ç£(PÈM1aLcÑ\02@ÑsÛ\Zˆ\0\0C\n¼=q{øòÅ&£§?‘ıİn9¯ÎZ ™ÚiÓÙJe„täIá7zsç{–ˆí+æÆÆ_fœB3êkÊŒ¼g§RN(Û›Éx½5äŒdÒ%Aæ2J‘£Æ™@	c\npÆ¡b(\n ŠKeeQâšçòœ„«3wr“#\"=‘û÷Yd`2ÌÚH²2ô Ê4¡@] f‡¢(	ÀÑsĞ0\n\0\0\02®?—N+ŸO&w~,öñç™İ[à<“P,å´Å­g{©:<¦2\'ls‘·<5”ØLá15ê<tİ]é5§G—ŒÓ›SNlÇf¯M~iŒ 2‘-”\"€Ci’ÍŒ`QV¢àŠF5fE–h¢ÕER3Ã.—\ZÀ	z”z¢¨=±/ì>7©ÉËCVA¥B(­(E–02SD€SCe†€Ú“IÌ\0ÅLP\0\0†H2	®7—N/ŸO>w[¿?›ûys‰¾­Yå•9ZA.óSs¬-J¦QW 5hÆNª\0Íg[\Z,I%$r‘ª1Œ’„\"€c¬±0F5e(ÍRØÄPËJ<Réq¯)iz”e2•X\rn¾_×Üom“•–PZ# Š:dÌ¦!#tÊÆ*¢FĞô’šƒIÌ\0d”H2\0no¼¾|±YÇz9üçÛËL›é­)…”&¤¥‘ÆóYÛÙ@ˆË„¡hŒ¦e^t´2²e¨+1“ CS¬¬Ù’Y	j€E™×(¡AT\"€\nÀÈ¹\0±„ƒ\"‰u×‹7!zÍl³\"ùÍÔ¼ü~»àïñ¬ƒÆ1ØËĞYªÄ”\në PÅ@ÊÃ@hy˜\0\0\0TÊ\Z¬Ş3y=qeŠ8?g×ÏNo¤Ñ¨–˜”t:ÎÂá‚²K,m$\nÑ$²-gL&u@2¢,cÖe\0TC2K@„H…i	\0ÆP‡T8 @1”PÖÆQCËI<Ë¨Î¼Y¡zÎC%™F˜\rä¼Ô~µã¯¦sÕŒc(¡YEè‡•‹V\02¨(‚Ä:`P\0hÄ“@iˆ` \\¡B5ßÇ§+¸òÆÇÎ½œ¸O-a»4M,VcÑ@YÑêl,bF+\rP(MH™[6§…L \nœ–˜ÂYg%$ˆB¥C²Ú™\0FU\"À`QTZ Q`´RXÔCD`·Mx1FC&æbŒA›ÉÇê¾WëXÓŠ@ÙE€-ˆhÆPÊA–$EHŒ¡Ğ!\Z<æ†Ğ\0\0 \04¹ßÇ§5âÊ,ù‡·—ß–¼İå¢jeDèHvtzë‘×\0ÁÔƒ1M¥\"\0(Cªr’I¶YB$\0‘*ÔSJF$  ¡# éE-P#,cVRQJ\0ÊJ<öés¯%£-™CLGE›ÇGêWíÖH\0¡Œ,£ ŠY+@hÌ‚”T$¢ˆª’2†*`’e\nD…Q% \0I¢Îø~=¹Ş[“ÇÊ½Ü¹^Ü¼fßDĞ\"5F@YÓêzõ‡¥AV$¢JSRJÄˆ±°ÊjU3$€„$€z«\"\0 U”ÒáÊ‚íc¦2‡¢†1c1[¥ÍÖbÑIm[6—©ˆè³yôw7Şy\\ŠÆZ*‘hÀš@\n €UCTR VÀÑÌƒ€:@ÀD\Zï†ãÛEËpb¸ù/»—-ÛM¦&¤ê6Œ\\ôúÏ«QÂ†5eÔŒ`@‹!’!#\ZĞR	p²•1”H\"1€„5yŒ€dLA^ƒ¯B3	5Â,«w&¾niT1”PPÌ6é³u˜ Ó+Us‘2Y„èóy#ïœß¢¹ZVPÊPÉRZP„Vˆeˆ ª‡)”¸ÌˆÉVHÆ!YFd\0Š\0\0‘‰q¯=Ï|7º|n7 ÷rå:ò³`ºag@‘4‘…F³ê ™h÷Ìç5zÕ+™¢:-On^}Ç’N˜¼¹Vºk9óÉdu’^GJÉ¼9c¢QšÍ)å^«.4ë#Îéõù‰ôS‰<Zk$ÖéãÓ®æŞW>y\rùÍ@8ùt‡~kÂ¶†Èoi5E+0Ù¨Îµ8¨È–Væe»1eÑfr§Ú¹ßÓ\\–Ó)B¨˜@0+S!Œ¢L…Çk%%’¬B³DÃ€€\0IÆ¼ç-ğüºêq¼f-óøÇ·5ÛƒÙ›§S4%IYÔë>Š²mfË9úfn¯^yãNztÖ©ŸšëòâíëJ“x¯›C…ÜóÎ^·KÌi5¢7yzL&Äç“Ìo—Ó—!§ª;Lµ\Zz£Èb<&*ŞÌİ6˜Y÷˜Ûš:ßrGºß!¸3(á¦“MxÊZ#SM5¨åA³FM³.K0åĞfs‡Õ9ßÕ¼–ÓePXÆ\"€½F \"‰bµ€,Œ\0\n$Ò9€ á“`P¡D„æ9oˆåÛ[ÁæéËâ^ÿ\0>ƒo{YòÔ´fH\0w=V³–Ö\"²uÛYŠ8ã°³Ù¦Àâè=ç<uùz òfëËÔô#Ô×Q™óó6Ü¡õi8C©]aæ’LKÒš>•5åOrxDœñ¥Ó´1æé%wd’x,Üiâa¨·HtùyÌvægu×›->]¬ø,ÂSL›5YÖ“RÑ’¯RìYÖó3DwØ~¿äÉ5C¨4°µ”ˆZX ÇH%°Ğ\ZÈÊ\0A¢œØ+`\0\n\0óœ¿-ñ\\»k±`×tÇÆ½ü´¨×4³ \0;³Y»XßI¼¬òúO.YÎ±87°G<mÍAÖŠ<¥¯˜OêË^4GÄgO1Kå\"Lf%&ÒDŒR1S¨¨¡ˆ«&²T à/TeçYKÓ³r°(,ÕçZ,Û£%ËÔËbÎ·yjN«öO\'¢iE(	ak \"Ë\0\0 ©P€id¨1•H:F†sEª\0† \0@È¼·-q|{x3\'M/Yò_.›qÖ¿%6	m N·\\Ş«cQš[2£Õ–³@)H’”Z¸É¨& š‘H‚,“œÈšC£*¤!\0„[O\"æµB†1•\0S2š¢¬ ¬€È4Öµ¢Ææ,¥—sZmq|&å?gyîÆV‚ƒJlCaª\rÄP°$ÈP„\nÈc4\"”$°Ä1/™y.ZãxöòfNœ×iò¿W.›&|õãÉM‚@ì/9İ`¬¥¬Ü£äô*dÖÈÔyJã& šDM\"n<yD²@ÉQ“Š$aH2cÔm<Íj°(E„U\0QVXUˆ¡¯®Ee™l­6XÎÜ¿³<÷u+ÊTR0µ€ÆŒ5hHÀ0Z$¢@¡ALc>À\nÆ\"€	\nC„xrä¹ôã¸ôóÍÁÇú9üÛÕÏQnÑŸob@€×±¹Ç¼±S:‘d³4#Ş™Q&ÔÕ…Ì•[SÛ›¤&±™a4«¸Î~|o^ƒÎ#¹“æcju™–Eq0ÀJÚH#êÊ‹\0ÚÆ1XÕ56]ÍKC¦6m¡|KÏsÔ¢·2™=ùÌ™cöG+ÓbƒÆ5`PP/@HÃ zÔ$ ¡L‹(ç¦Ô\0€\n€€,×åÇòíÈòŞ¨8_O>×ÏS.ÍvoœC@€×µ¹óï à:“g—¶Låé³45ÌHË:jçÌU¿5kà6‘«7u®kæõõLçZ{<Ş£Ä`³çCik3(LÓr†\"›2#jPó¦1…Ë,`1Ì…4Úhk4´U13‘ª_\ZóÜõ­Ê2™O^^—?,×ìWµÅ\nÄZÉe\n‘B/D4bÉ•¢	l’€²F2¬naAR \0ÒˆRëWåÓ”çÓcOú±Åz1«]«:Œ±‚*!›iÜöVaÔBŠ;y=Ùf­™ÉWxpõä;I$ò[Œö³Ê¸O%mş\\&˜±’<æª¨Í–aŸ+\"\nŠBÊJ„*6ÄË!Æ;¦ĞÊ€Y¡´ÆQY”-™rSLñš<oÎ]E3“W*ûdÎ«/×<oĞ±¦4cTX†0 `P\0Ñ”IK#FAcV1ŒEØi†:EJ1S€¥Õ/Ë§-Ï¤F$ù—«ŸèçàojÎ›:@R„3m;ÖÏ2HÙ&x=,ÅPe–À%@y×eÏéÍiˆˆ’c@ƒ\0Z\"2\0P)¶±(6Pê†PC(FPÆ1ÈJ*Ji3KùÇrË[jõŒ‹è]ë<ì~±äú‡-°Ke:P\0#\0BD \Z…ˆ¡Æs7A@\n §Íã9tæó¼rÂ|ŸÕÇ–ëŸmšÓ*\'1ŠT1ç¶¹óh²Ñ¨di°Uµ2!PÁPÄe@a¶rÆ’Ö9”M!Q4(	E,Z\01´3E\0ÂÂ.V*±ŒtôiCÚñšzòŒz:¢òÈgg¡¹å4ıUÃ__å¦C†@€+\Z0€Š\r-\0EcXµŠ\0á2Q’º\\Ş+—MwãOúøó}3åºÚ3¦T¬™Aè‹™ì®|ú<¥^šuMD€R)@DÊ$Lq©¬s!€‘\0¡“”„©Jd\",‘Ğ<˜ì¡42Ë\0*Ç\nVU13F[¥£KÆyM_>1•£ª2EÆS¤g‘ÛôçŸ_oæe(P†P1‚\0¡HÄ0\0ô¬PÆ1€Ğ9}bšLĞ+\0\0+£ÍâyõÒóéŒÂçñÏg=ØãÜiáˆ3@Vz®:vpJ‡°Y#¹ ´$C‰-@ÔCš((	DcÍDD\nêC´B„‰A\0šC¹b†\01µHĞ*˜à(EØQV…Kc“Êjs¯#B²êõ«Êäê“?Eáú˜-2Ä\"’Jô 4b(K@4SX¦©”5\nˆ`	®‹7‰ç×OÏ¤®&>!ìã¥Ú£Új¢@CP67;ÔÇ6eB€j²@ \rFBP]K.ÆM¨RI WI™\0”A€J¡\04‚åÔË)¤”’ÚÈR0Ò‡kLzRà5yéâTÍ\rš/zÉ‘\'^œÁ÷<?GqĞR°(@P€À€Ã@2@\n\0¡Cg\'¼8\n\0)P\0ˆ^:âytÕóÔnùÙøo·Ï«¬˜×©­Z!ª\0f6¢µ¤f–aè‘+±\n¨šbÌ4TÇ‡+jlŒæ,Ø‰¦ 	a)QÊÒÕ\0Ùêˆ™¡XÙmP3m\ZÉ‘«Lº V<›OA—X^wáÈ¦PÌ†A/ZÎšÏ«s~Ÿã§•h\rh@P1€\0Ñ@@\Z²uóh4e`r;æá”!PÆ$#óÙ¼_.ºîzÇgƒyø¯³¢½z]uŒÈÒ\0¡nÓÜ;M!È)cÑd”Iˆtƒ1hé’2¦`vÆs:‰©„*„È¨˜š	IhL±]1LĞ‹Qi4&m¦VOTeìÄ¬¼†«A—eß‚P†Y”KÔ³ª³é<ß«¸éå@VªAA@1¨4\0CÔ\rJÚ\rÊ(“ÿÄ\05\0\0\0\0\01! 02@\"3A#$4P%5BD6&CÿÚ\0\0Ípéí!AğÌkRÊÒªŞµèÃzrng+ìT²§¾±YîÏf*õzÇ¥?6ıÃêßRncìbÔiüF>·„ ­ìz8õ³A½C‘ÿ\0Ã\ZXö¥”£ú(`^âæ’Íÿ\0ÆÏ©ŸK?2¥ÛÃÇñ\"?Íµ3?\"åøc‡#²ÇŞ†•°:¿ˆZ‡Ğ·ÃG3şPR¡b“já#øõŸVŞ¦~iÜn‡Â>ÀèiMÍ¤¡­šu÷“û(5Ï©ÌU¾=\\wí¥\\oàéŸ“š¶–ÖŞ¡·¢f0Üì>˜x;A©³Z4çw!ö»Û%âŸ£k]Zèš…tM+¢m@Í°Ğ²m]jèÛWFØk¤m]#jé×FŞº6õÒ7®‘½t«¥BºfõÒ¶®‘µt¨WFŞºFÁ]#zéWHŞº6ÕÒ7®\nèĞ®‰\Zè‘¡bt	WBA®€•Ğ–ºWAzè+Ëï^]]\0×—œkËÔ¯/Rº/åëW@µtW@½tkWFµtkWHµtª×N¥x\nxG¯õá+Ã5r\Z¹F±èşhWŸü|÷âƒj74egà«°?F¸„Ö`Ş>ëÙ¬ĞöÆû»3[[LVjÕjµ«j·}µµ~}Uƒ²ÕkU‚­V½Z¹k¿U\\B·®s…s¹Ï\\ç®s×ˆp¯õÎzç5sÕÊ4¯)“ï.é¡µpIù_üÌü\\I\\67øKaş£½q ÿ\0½“œ?g¾;nìVıÙï\ro®k…½\\z¹î6åïOpOßÂ‡ä–ÿ\0&Ú3vÕÂ¦»?„½Hj5ÄÆ¤h™WdûØì¶ôG´{1éæ±Xõ‰ÿ\0¡ÎØp¬ü9Rÿ\0›\Z{µ®7ìü\'ÿ\0:ñ İÉ=„ÊŞÜ÷²ãÖuÄ)…6îa×Ëcµ_\ZÚ­VÖÚ¶G¨UÛ%›9Õkk-ÚÌ&l©idTnfÌVsF/)µµ\"ÙU‚ÖÖ×ĞÉµjÍc\\wìû±Ú¸Û*Àş´÷/ù6Ö\'t¹m\\\'ğÜSñŞúñîù0º$ÚœöçV¡üJÍ#Éâ=$jQ°¾	Qè#d\ZÆ¶l¢rqíQEfqh6—`Ó¤‹gÖ,ÃËJñTÑ^aHönY1fÁÄI Å³6íÙø1¯ëËYït¯:Vl\Z¼dÍF.\ZÅ7k,ÉŸGTLóÀlŒäè°ê<µ›tÜ„pF-2~Ò5±\\ÆÅ5¦ÍørL54”{V€î%¬ÎªÉŠ* ¡V}A¸ÿ\0›’ˆAªlé¬08kåD3•¢“ÈE¶<TÒğa|Zg³¥Wˆ9R/¬ á!håÛcÈ2{\Z«*Fu<Zà·»¥Ú*İ_$yÈœ{…¤jè%GaX,§r[m”J™›¿øø ì…0‚˜®Ùo„âûµ›Ès6O.}İíöm¦(ƒ»šJ5‡J›…[$İ‚ÍJÙúí1’U²‘®Uh´4#ò0xÜ#\Z=EÄzR€ù·€Éf)0ŠrÑ&­1pËø±n\\¬ÑÉ–=Ö3–2¬»jŞ>EfŠÅ.vªÂÅòÇî›Ìº-•Yºän/Š¯R’>I›…\r6¹oàŒlÈ¦é„[”3o&Q˜q×ó\"ÀïÅU8…2|<ºh=ŒU“ù4N‹ÈÖêš!ªF|‘ÌÚ uaà›,Ùü!”¬oí¥•ªé¨09Å0Â¹ m<‘„Ï™B¸rRyªİaeyÀ³Òë8:šœıîâ{Üû‘rAŸÄŒøÙøÑü±\ná]—øN)ŞçĞv©3sH-ô³Fœn­hRgĞÇ©Ìöâ†aÓ{$.Qí½&ıD™ézñ¡0ÎÎp7P°‰Y\ZêW+…€|e„ê¼v°u+wnÎN±Ø‘ï ¸\\Êªıâ´³÷Íßxå¹x»®ÃÓ½•î\rŒçÚÛÙÂªsÄÿ\0‰kënÖgşeÆ¸WuôÇ¯ør4çîPÑ÷§{¼uıtr·Üî\nÁtŞ¹F„+>5ğs”IÛÈb‡~t«>…­êrÖuµc[iŠ>åyîï_t[c‚xúµcçg[z <‹Æ/}ÿ\0‚8uN>æ‡öœ×QĞşÚå=ıÄ÷c±‚*¬³¶§xöBf¢„#µÁtUl­ ‰×póàE¬Rî©ä;¶äDÂ¹c_§„ñèÁ<^¼‰àIGH9—ŠYúÃì®ÍäËä¯% Tjg„p”;h§NŠæ1ÓCù#Ë¼`åˆ¡ñr¬’ˆ£cŒùu­æj8Ë¬²\n·9#]©I¶YskÃ\0€†‘¾XıºHÌ¿\"gt\r\rr\ngË”LŠ¥¯ãBCK^¼#Ø1«Â8išA¢«„s4W]ã	Ç-	°ôä/è)º-w®Séÿ\01na;Sİ·×ğM‡x[sèäÜ¨Sı¸şîÌh\\æØuŠõOoçÓÇr$ğ\'.’¨½®\"J88É4w\"EÀ¹:„áÃ_ôÚÅPü9Ã89Yg*¼œÏøâîIO®q%\r51p›âoÌæı73â–=S	¸zIeÉğÇW‡‘2.—Mdß×\r(p‘’YÉİÎ»r…OÊ¦˜.WÍÌ£~$3÷=4@$¥0·Y$ªˆOLíææd2,š>qÈô’NGÏÕ]j‹ËB<v£Õj\r\Z£^\ZAÄ_†ÍÏ˜\0…†Õµ›¶r+ÊÙM8äO,vä1\rnm\rNw\'~Qm	=‹÷Q&´á‚}?L<Âı$~–D/1Ÿ†rnum÷ï¬èÑÚ­æUÛ³8zå?>~)ª©Õ=\"²ˆ(¬ôŠÉ´–|È®¤]»£K¿QK¿M’Ï™&I©$Î«÷J¹s,õÙ?PIr¬åg\n~ ’ğİK<vEgŸ®½ğ[L<j‹©\'.éy—nùË‘lIç<UÂ´ÙÊ¬×s0wòYW¥s2³”‡ˆ–5áÅÉ¥œığ¿Vš8+e×—#‡.¦v³ùB>Y)J?]R¨åË”¢$œHG4eZ&Ìü¢5\ZüX*Œ[Ôt’\rAƒöÌ”XÄ2µõ6J¨äÜªõ±ßY½Yh£{«\Z/ö{Òİ$6W„Ë-ş.;×¸ŒÔ•‚¯µæà}Æ†¦\rhğ±72^ÌĞ÷2ävu†ºUë¤s]ŠèÜtnk¡s]ªè×Dæº7Ñ.Ñ¹®‰À×Fà+£^„-é‡«0>düC»>²ßg½¾åûkpÒ¶–.>~t·¤¾æá³ˆ-[6ÇÁ[†ÀmgÍfGø©è›#ŞÃïÕ€k:pÙ	ĞxI×†@®BW!k”µÊZå\n°ŸMnE´°W)jgiK_O\"~)x*rş{s«å_ŠÉ\n*hBx†yå‰}´\\[ê™ô-Y£RŸo»4Úœû OÊğŞû‡Š\\µnY‚Ù§Á_Úÿ\0`xˆŒ÷í¥_üıñ»ŸRå¡\\ƒ;*-•|é~f‹.º¬²dt²hâŞ§ş	Sê±Dr4uÜ§ áïòZ:Të\"ñgu¿,°ŞODÎoÓÄ ™±×ÒƒÉ4c\r#MXB¾¨æ­”UÔs5c[ÅF¸bV0hÖæU¬kgŠ­ÑVDbÑ	ÿ\0Ë4lP¹aY,h¸¤Ÿ•(fn*Ö6€İO$o\nG\r|^%jŞÇl´A²Eğ\\Å\Zò -5Šj-‹â9Z(¥Ac.‚Ñ FèÄ¢hç	•%uSÛ®;ûİTaùßêKüzKr£Oá?/+?‚âŸÚ\rqá!°¥ƒÿ\0_¾7[Ñ=È\"°FŠ‡:1¾)ğWêcQY\nY«€xí§Í\\çÆç`Ï§;¹luÈàdnºÓç1Vl£ÄU;„ªSşÆ¶¢tƒ	£eâ7+U´á±I2pùRlæ…o%İ±ŸÌkV¢ph’“õbnÆŸ„ÚM_´†Ò¬Î0úF&ŠÏš$dÃ³]´Œ\n*§.ùº ¨öë\Z5²ŞO‰ÍŠ£\ZŠŠE3Hñ¬$P;ö¹›ÃJ·Xñğáâ0a\Zn©$îÅ’¨²ÑÍHebAVçÔÔ=ª;*è)‡¾(Üì?ÁµZ±è,\ZÛ^;v?Å?Ğhkˆ÷ZDy-©m‘íÎŒûaX«Qv¦<PÉ»_Õñõú½€Wë#_¬Wë5úÁ•~°g_¬WêöuúÁ~°g_«ÙWêöUúÁˆWêæén¡Î¹Ó:ç\\Õ¯®hoE1‹_EUM^\"”8UÄu*Ê”<u€\n²áDYbkÆMÙ®±”:nFŒª‡?TàA%•Dz…ùúÇBn­È¸N“rá!PçTúŸs{mDÙG³¹Ã‡ç‰ùÖ¬v[Lw@[ß³ğÓúÆ³Û¿‘°:Fœ{;Ù[Õ¾˜«ú¹ÿ\0>óÕ¦{0w[ƒA²Ü §<GÆµc[v˜î\nÍréšgÊvËØ\rÁŠxÎÔü~­¥MyW›¸H6u°÷´Ù¶™¢€tèí\\µ3¶i:‡pÑËS\"ÁÛŠ;e‘P\"Ÿ˜‰¶YS9`í®s­,],z&][€·-z$#u•AcÁZı3‘SS$Uç˜7&!ÊwıNTU00`«õA(øg«W Ğ”B¹M¯-êÂ5a¿-.ÍvÁV©Y#K³]½+™#u;EÒE£fj5¶–Ó\Z\"’‹¨©‘À·ÓmMïX¿»ÜzWtÙn	?ğ>M¯®{ÿ\0\Z[¶)ºª¤¢v/\0šàº§»›:\r9ú¥×İD²ëßŞßúÔ\Züê?rŒü#—K1†zª®à[&ğñÁ~~¸ìÀ‰2rı€ÆS“!YD¤çß»o\\D>+\náÆÄ]ùf$BWúüHŠÊ\'ÄŠ¬ª<O7.í“ú\'ºnQÛø„oSÇ2Ñ¨x®…r±¥JåYwîæ×fùéSe11$1ïzƒ?x·K\r§9KÆatn\n³ä#)‰\ZIO\rI“¤ˆM½ğ\n£µWLQğ©_¸Aå;ç¾dP¤éœ!›¬‹-¤JÍt$‰È¢„Š\01õ°üŠÀåÛ·(Æ­2Ùûµ9ûÚÛU(w@»+À‡ú>F{í~üV;!‘¬S\nà4¹!>\0áÎ{´=wÇÜèûÜıŞàÉ>Æ©0B5†s5ãÜÚN™ùÙ‰x„¦lãˆzŠ?!ÎÆyÃA}\"ÕÂtÑÈ7YÜâoT0Y\n}4GÌé›Å˜¸<ãP²zóN²ñÕ™bw²²M¤OH˜…VNQ¤ŸK0x‹ÙfÙù¬HªÖoÃ–]ëÖ^BÒÇ•IÔŒÃæ*pÙ2º×’\Z¶aM‰r’>E 4yå@EÅ=f}Äœ‚y7±®™¬ò!ópåçNB%ºîê¢?qö5F¼dh§Œ«ñ‹\'\rd£N¼¤©ÓÁ«§®#<Gb_Ô“â;6§§!euÅf­zS`&èîğ)ÿ\0“ßŸW\ZÛ³¨zµZ¹7ñŒL§YHv^_ğ\r‡Tçß¡°˜Ş²tv3ÔîØ  \"QI.™ù«MÈ¸B”UUÍŠe,íQEÔõs¥ı-©L:û¹ìÆŠûİ¶SÕåèçÒ\r1İjÍZ­\\ºÛKiËzÅoV­ÆŠk×@™Âÿ\0øwN=ãV§GåDŸ×rå7>¹ÔãP«àµ[Lö_Ñ¿ÊÏyğï½MÁ·±ÎÊğzœ²!ëg¶ÕCj¶ Ó~În]3[^¸g…V“U»t›#¦=sÓ±¥½ùÒLlÃØÍ=ÌÜ(Ù¯ÏbAõŸİkjÙ¿P¯é‡%1¸aÉ‘†qM Î²Nádw\'d’ĞJ²|>a+Æk1pÊ!g æd›6áç›+Ãkø;zvíÇø8ĞØuÛm\rM‡ÕÂêr».=löÚúd{-Ûjä\Z¶¼ºX£V-rÚ‡” Ñ\"\"¹õÔö¼Áıô56nXåöb—½Š=èn¡şæ™¦À\"´ğ\rNótoö‰â&Ë§áææñ/$2SxeŞ*ùÑ“:ü7Îİ¬MÂ†0FnUOLi‘·ÂÆ™ĞØsöûµ4÷½\n‚?*‰î^üü «k?ŠµèB¾‚‡%ª×˜µ{R>Ï„¶QóC\\Bk0wÌ\rS¢l{0ıóûõAu[*´Ä‹ŠZbEÁ™’YÓrMSrñËÃ¶zåó#?*r³•YÉ<cN¥_½fe¦ŞUûP,¼;³XÔ?Ä\r»~ßm´Gû/ª$ÃvGñi…mÚ\Z†5ZÕj±k4^jÍnr’‚ö˜’ö|%°ğhÚñ/õß›öRŞ°Û½†îr?>€|zôƒµÈ~Õg¶Ô9~D\r—…?<oÁ(_[im>šÉ¾m§%ô!m9h	Ë§/ {êÖ¿)=¿	|=Å\r\rq1ªO`G`SfÚã\\Ôin¾jŞ–~F{³ÛËz–ô}ºÑ£ìáé~ˆÁ³?4OÄÇm¾Ÿ¤¡Š\n½ZÔ)ˆQ,ô„1k4p¸Z±X¡°Ñ>Š}CCC\\I»©?¼•Â—û=ñwĞêõO¹îÜ|œUûÖöcPÓ5š_î:¢Ãg\\\"~xÏZİßŠµõ\nÈ*Õõ}@)†@\nµ¨B‚‹\\…\nå½xtZ/ÃsO´\'¾©)1»”iÏ²±İ\Zô-¦4@F³ñ­¦{sñUÇ`Phça[úí¾—<{µÏ¥šÇeªÕŠ¶™ÒÕk×&Ö¾¹úh—¡_ó½°m¹~8Óš} ĞíR¦ç–÷Ò§{z¿k°sV45f·ì<;ôš#\ZíÂ=–îL‡XîZ¹f§n{3ÙŸš·ª¦ú™Ğº;öŸväúà“Ğz¬Pw_Kijä½b‚‹¹³X¢’ô^`  æ½ù´\0«|‘§T÷}MN~©g#u’§{›¾?ìkšáe–ê&\\*âA„:hÜ:šéG@y‚IğÛeéœB®İ#Ã‘îNùº\r—mÿ\0åØ°XcXÁ¤ù¬t:24Ú®)ä*i³ˆh“Ç“ÑŒŠ²0Égğ‹5X¼>ÔW„‹f£d£QMô“#*§\r¤İI8£Ç)äh IHt£	¦>~{3¡Ãê ì\r{	ıcì·÷¾+éµg³jØ ™oG\0\n%ë›²Ş†~ íN©æhhø0İâ¿u»ûšc=švp©\rÔ«ñÌ‡GËÃ‰*İ^eø`†ëáÊ°LÒ£ÄåI@áxdÏäü8ï§ RA°9Ç‡Ş?’1ÿ\0\'ÄMŒ¬‚‹tnÊ>p_Uh£g)<ât”~*õså?A\"Ùjag/ßºh»=;zô3éŸsİÛjsöİ+ÀêYÏ«Ë§%´µ«5a\nÚ­ô…¨»ˆÅ¸Ó{Wº‚ÕŸO?ôîûèiMŠÜGuîg;­ÜÛfˆI¿hO<—\ZFIò:—’xT¤Ÿ·\"rOÒ<<M+²îz§m&\0YY$ÃÄ8Ã•İ³Ç-æIûÀŠ²òNo\' Ìª¿x²ËLÊ®F¯38ÊIA’‘=*ıëŠNIÊ‡x²Î™•\"É9ráÑû±XøúïSjSe4\rsKöÙ}·aûÜ¯ï—Õ\n½ëq­€3E_{f¹m ‡-ÖóZÀ\rƒ–ƒmæŸÆœ{èiÙ¹PGd	¹Û{œ\rÖÓ=¨ÿ\0[³†{s¦{sÛC¾~´¿İìÍZ8{ïàõ?x¾ß@;·\Z\rè\0·Øk4>ïÀmE£Ç®]óş\n¸wK{èjPÖe†D÷6÷©¹û¿$ş·n>.k—Ó?\r\\9Ş Ğ(4\Zcï’\'*œ,§)É¹{1¥»¿j\0Ó›é\n-àHVãV¸š‰ğ•ÃÁ½-¹¨jlÜ±Ë},	îkB7ï.md}úÖş¥û³ëgÒÍz»•Ï¿@ím³™/w\rî³fÕKkéËm@*ÖM€¶\' \rútü€­<¥}Ô5Ä#f?¨@±Ğöc¼¾å6øA­½Ö={iŸ|9ì.¹¢lòN g1GçaÙnìê¬×!‚†Â4[ÔY¢~tÏøSÁµq¡®%â¿ÙrM’ïGŞ°}uH„:”ª* }qØÙƒ·´¢fLúãµ8©[V{¼©ÿ\0H\0#O\"1JÔåƒ¦eĞÑ:<h‚p³ØõØµÄs†¨RÀË@Š‘1\n’‡*9+XeœK¨jkšÀÔû<’öB\nó‡Ïİ´·e¨*ô@½ô{dFƒ´\ZãüéàÑô\Zâsí%±QÚ¿ù»Ñû‹}İ@·Y±‰fÚV-ÙÅ¼~.á±£ğô’E}ù\ZpĞò%tvrSRá‰%ŒŞ!Ã—KE:Eòñ®[»{áÓFN­´k„Y»—v¿¸E³¸UÙ³y³$T€Y\'_¦ÏØªÁËt|ue!Ø·gİÁ _Â‹V±FY	(óÆ9n‘TÜ0tÎÊ%Gew\n\rZ0fªœ=#Ğ‘Ó=hm\"ñ‘ÂJy¤j#ŠjÈê@JÆ¢Å\"D·Eq\'lşl§{0Xv‡%#ƒ¦\'”­Ñºr,‘hòm(ÔnÓÄ“`Ùª9¤UPü7ØˆÆGŸ¡áôzV:?¢I‹G,Ñ)ÔşÇ>Ê\n\rô\n\rìê@\0RŠ5p™ï¨w[\\W(…^Ô®j&›…f±W×Ÿğ\\SÚ6hk‰ws+÷ö©³nö¿}`²Ú³°¹âÒ¤ÏR¼ìã‘~óËÙÎÈÒQ–+‡3FÜ6ˆƒÈÇ†’‘„n«‰ˆ¤Nú^œÒH”i‘NÏ‡°rÂ@;>lQá¸tNşÓd$X&±e¸®M1Ä“}@ÈG£Ô=â:$äÑ“M–F*K‘ÉÒX%Ô;âGæpıã\'+ÅL´Q(ÙT^•ƒòç•nòJ\\NW‰LÙcq$Ë7}FjmS¢Úq©’Rj5ëùp:/¸†=3¥Ä‹)Ñ×\\^ T4’‘—–@ã5<Ác8šTÈµâ¦\"5ÃŞ\ZÌã¤:¹Ùµˆh·IÙ·‰»¹EH‘tÅr¹ûT3O6YïÙ`nWœ{²Òş…´\r‡4Z\Zè!A¾€ã9§´4:q\0İü¨ÿ\0%§7ï`t¡¿r± ”Qâ‡\0ƒé·nÊ—.T”táË™GNİ?âÊ~(2\r8…ë&ÉÌ<Ié·q„k4ù£¯ÔÒbåé^?œ\"LSéô	=&D˜Í¿`Gİ¿U¼‹Æ©û¢5jñÃ3|åŠË8YÊ¨ªtTy*ıø8våÙÜÉ>xRMI•ÜQTèêç,‹ò6;ÇJ#ç2”E•ICÉÈ4WU¹üe¼eÜ¸r8£ªª¦YÊî+¬wá&ª©œàu\\.ãB˜J a-\\@LsÆYEê\Z1Ì}\0æ\n\r-Ir	Ìñƒç\\ĞÒßf‚‹Eì~±nŠK\n7Ñ®{íA¨}#š=fƒê®JÎ™\0ÛüGC`z:KØòÒ_S¤iÎÈ÷ÆØÎÇsc°5Ï \ZgáŞÿ\0\'†(ioe‚‚³£ïfZ{Và…{\\zY®[VÖ÷\0±Y¯Íc]ÿ\0Á\Zw‡£©†4Ã£s,•;ö÷ÄîïKj[wZ±­»UEDMé.ÍÓP·s–.Ù–±¢mœ­FAbˆª¡–fé\n·zeæ;øµ¥Øİ²Î•uñ™uÏ ¶å¢ĞPPo«Ï²Oê«²¼§ò¨»ömßkéô×ÒZ½ë5k×¶³E¬Ğ†l;§¹\rJ4šŸu\"ÓßB l¶{	îi	\Zâ6(Wâ4X4Y¼Tƒ¢²é*xiDÒgÃNfáº­T¤,\nÏôl›pñ[_,•¤`%B&9û•ÖNvJv³L$Ûµa+*œtŠébMä;†H#ÃÎ–(T?”s<|İó‰!á—D]äjÌ£Ã~\"ªÔÉ±.ı«ÓI9Šhİ8QeÇ\"+¹#S›‰Ş9s5 ”zË6‹Om0ŒR\rÛÇ Vó	\ZïIlèÑL[É·‰GÎ &­F¦*¿–\"²iGB¨é›8õ¤Ñ…ê‘‰¦à¯˜´#ØÆ°&¹£ê\Zºşº çe¸%[8×€oC¶¡q¬P\\\0(w¯Çv~yö”ós‡Øêrz9yïïˆ\rû£Ô8Ery¯:mœ¼D¯ø‘üƒ³ÊÊ½nÖzq\' IE–ikˆÔS~¡ÿ\0**LC†¸o‘›O—$	\rÊÊ¼ñ–WNmÔKM-ÔÊ´#&Ü6ñw/ˆnš}›ãğä$j¥—\"+ºâ\\[ˆÖ;’qƒ–°¯4áÖŞ<¢ÍeM)0T]ÆéÂæ´¤’ä`¯œ¬ÃüÈHõ™S6ì,İ¹ŸñÔt·X)?*¥sQˆu/ßG¼w1(÷¬9ZPéÃix’pËY¸¨ğ`î)4’‰rnxRõ\rb«Æâg$Hì™ößù Ş‚ƒU·EıBËpr¶X˜¬vb³İ{Qw«oEª×®ZÏøªaå9ÜÚ,6\"{“&GŞïïwÅ{k\ZÃ¿`e¤ã$Û5\\Ó(„šœC\ZEM¤•>™#„ÕâtŒ‰ÎeMÜ²§âvËSù\'2+\ZTã\ZÏˆdÅ¹`İ„ã†N$$ÜÉâ˜M¯\ZWNŒñfÏ\"i™¼y>ıêlæß°A´«Æk’Uònš¾rÍÃªõ™»v\Z6xá‘Ó~ñÜ¾tôÚ$¢ˆÇ2‡YÂË™%•@ıc®tœ¸Bsœê¹p¸Ë‚\'¡N%YC‘ªp¥nıú¯×¤Ä¥9åcÛ§\\ÃYÒõŠ½ûï6Æ«Ú‚ƒm¹Òÿ\0îpªœ´\\k3VĞ*×«Z‰¶C¦Õo«!øÓá©‡”ä~º\ZxnVÄâ‡¹·¹Øşÿ\0|méŸ[\ZçĞÇ¡K>¸wqıê}Í1AA«-&_¯‡‡è@Üéj÷ Ş±[ÕªÛïX®kë1şÔòœ{´•àf÷·ËÖï-™÷g³5jÆ¸×šÆ–Ó”mê·láÙÛE¿yBQ)¨‰J1LAìm	 åØhîË¼+–Ş¢Ù[e¨4ÆßÙ’®=”Œ?;öc\\Vkz½l:Z‚õŠ½ZÚ\0ı_â-O)o~“†å_ş½0¸¶÷)ïïcıÄYu5­LD¡QÒ×¨ŸÎø„’•Z<éJšŠš‡¢\"¢RfåÁE›«‹ÀuÚ¹jvŒ9® Y`†¬Ñâ$’Axy&éº‰~É7q/Ø¤´s¦í4áÅy•o5…fÁÌ‚ªpû”ÛG´|‹^0‘FqË?¤àÌysj4<œŸš¤H\0æmâ¾G†ù–jÀŠ¾âNÆÒ9ÿ\0š„EB-³¶	G\"¤O‘6]¤”kD\Z¥ÕÎã\ZµVt‘ÈÓxæÉ§*É6/(„1Íåñ-•$[T¥	\rGnS*.5^—û¸ĞºŞú#ô¼’\r FÎ`wŠô³A[\rª÷¬PVÔñ–§”¯»N#à:°0Gs¶Èöc±§ô4µ´á¤ÈŠ*,uUl¬»¦ÒÅ	Äğ8…èù»Éˆ¢œ®âpí‚cˆzƒÇ†•PS“çDÙ¨¦]{ş½Ú²ó.—s?5\"t]Ï_M½]ÈÉqRş,tEÏ”ğòÒ\nGÁMœéÄÇÿ\0/‡¦Õìô\\±°Iãòˆ¯\r.ÕÃ.l’ÉpÛ•/Æ8;F´F7ˆ\\Ç¼AÌ;PšE³§|@ÁT]q;…_JÅ3qç²Jxïô@‘³2?çd%á¥-#!f%VñSMÙ–Ÿ,õDLòqƒƒ¹s×DÜÔR„NAX§\'–h¹ÎÃªgRïÑéÜê¶àçß mÙøÃÉ\"Øƒgœ0{ÅwZ±@¯É¶  ØsACµZÔ\0“Õè=På¯‡£GÍ\rq Ù³áş29o°z\röcÙÃÒm›Ò±\\>ÜÑ2QÍäHˆ… Mzêc!	ù‚M¡ŸÅ4s+ÖIé ¢È·oÂN)uOÎ¥B>${âÏE4x3ŞjŒ¡<éÌò’S‰ÌÄ¢OÏ¤„Ÿ^2C w’Ïfb¨ğôzÊuhƒc¯>²í›L9A«N!|Í·Htvÿ\0¡Naò›ñ“fÂºæX8–cÃê\\\nëÎJ;EK·+Û¬Ù#«Öt;…–¥¼Z…ã§§\'GeQcU¥.±HñÑ¥®µ•ÊM|eD¸ 1‹Ú§µÎÃm@¬hí¿ûq;>á-ã´Ç¡šÆ…åĞnZöÕêÖ¯Î(h=-èÅ 5şKå^\'¢KÚ#²>‚e³Â¨Fôj½n4±â #ÙŠÎ¸ôÚ½tÈë.ªçÓÍÙzÏ~5Çf},éõ0âõzĞõÎ#£¼çì05pj—m¦{Ê^a´Í^‚‚¾°¡\r/W¡È\rôÎ¸íåµ\0ßä9ÃÑ¡×‰w^Pnd(»7ï-Íu¨;‡ácLÖ*õnšßÒ·kfÎ(rxg·Á>}½¦jú:÷­»tlW}\0;Ãzê$¶—«èUëcVáYôÄ/ñÆaïgîşTów—\"FÔkÕ©”Sù\nuñ’Š0t‚Ëpô“tB˜´ë\\È4I³µQùs2Å÷£PBVË5M¬lSEX•Á*ÕÊk3¹L23‘E\ZºDœ¦¶¼<›¢›	–M;|w1R\rJh92S>|wÒÑ‹G«¯Œj‰ã¡J\"i#ù[f‘*¹E„74„»6è.Ÿª$<W„üü8¢Gm\ZÈ±hFu?f‹M/D)rÁ6$kbÉÎ§ãcSî>Ö4À§AC»aÙn	1|jH+5ŠŞ·¬ÖkÏm1 ëŠÏ¡ŠÏÄ6û^è:No+$#Ô%°f}åŞììáC¬hSÊÌµ;Ù©—mÜ¾^\nãc¡)ÃØ,îIÔ;·“l#™R°°ıË(âÇ‹¦ÜB¬‰ mK\"Ï‰›œ“¹#;`ÅóæÍÙqÍnåVa	üÒ‡ˆlux˜Äáw\0JñRì‘ØEE¦åù%^•(ÒJ¬œf±\"Ù´™TÖLçeÄUK=4_ğòÊ™Áùô½~c?bX®_1›æóhõ¢0iYXÖ‹) ‹g¸…dV_ˆ8…ïRıVË#?‰ÆmÚ8Ó‡ÈSÊ²`±æ\Z¶[Ï¤Ù¹ê;‚£ûT\Z_W>Ä÷l ~çŸ÷Ãnğ×`\nå5\0(¼Úb‰¶ƒ½}4™ïÇ`ŞŠno†zw‡Úš¤šaé¹—KØãf½ä÷+¦júp°ÿ\0ÉMº#e%\\&Á¤jBåï¼ßE38Ağê+fğı<—¶QY.![™ß²8é?F1áÜ¨ãH2³4azGèÍ4_ˆú6,Ã¨yn!~¿Rú@ğ‹£ñ’­§™× »÷òP`òuüSÕç¤’‘{#åÜF‰dÕ‹9k4N^e¦#\rÍJq\"&JBs®k%%æŠ–Ú\"¤‚šü£ú„ı=õ!Ä†”:rHÈLdÜ±]YwË¹[ˆ$\\(ywÊ;:‡TèÍÈ Ù¤Ôƒ8r³¥4Ie9åŸ¬©Ÿ»3‡/\\»6£Jı¬ê\ZwM°ÿ\0½Á\'úƒ´ºg²Ú\0Ø/EÒåĞFÔ\\ÚŞ­z¸†¡¦ıÂøgÃÊz7ÔiAÿ\0–s~t¶+­Û÷¥ï[ßØ‚Ë71ÕPN³—h‹(€˜æPzÇ\"ŠNœ¡Ep±e•ó7H·AdKÁiwşbû[f™™p¬¬S45¿£}\0mW¿~*ı—¿mõ½õ½_²ı˜Ğû“´4[t˜ıI<-—à³Pb¯èg³óz½´ÅÃş˜yOzÅh¦»åw2TóÙ~ôw;Ÿ½è‡mõÇn>%ôÍc\\é}o¥û/W¬úcFß¸4?±‡Û{÷¸=^Z\rôÏ ]¨Fô\Z{h\0¹oÛù¬UÍ Õ­İš·ÆVS¡ú´8Øè}éSÜ÷¶ûÎ~ÿ\0nk”kpÓ‰¦*ÓGUĞœ*C¦tnÜ×“Ê<vó[ĞÅgLvş	¨vâ¶ôÃ=†ÜøíÆ†Än$6?\r©ÊDÆäĞ5kaìÍmA r…Z­X ¬Ö+ñ€Óa¬ê?U¼¿jyN½ú9?\"lÜ}ÈÓÏ¹Yîe»—¯ÙF\"·\"Í±Ø_ˆ‘`Ñƒvë:Z.\rGÙJÇÓ¸0ZsÍY0sÄí‘jíøuğ::’xÊ\\çqÃÍxxê úËÔ7\n–ñì\nşd‘Ş4S¤Xº}$şBQb8‘ÔjŞ€k/éç»:†»‡qÃ÷‡Ğ®K<84ÀÜÌıNkéŠ\n¸\0æƒ”+–Ôzå·f5½f³W¡­´½´ÍoğV§”ãß¤‰¿ƒ†ŸûGayºõèïí­õ-}B õ3îz‰HÔz‡œT¨I›÷,LC*Ná¶¾;öÎ|bC²;×üHğ®äV0´áSQ(¨¬Ü’q´Ñu¦å×nâ[ˆgˆ»©n)xdª¦JÓ7,†\"y!’ó™£/b™3÷ç]»C×Ï£}CmT÷ŸcçLkšÅ0-%\\<k/nhÎà (ögNzÍ_nË…õÍ§à6¬Ök~ËëÍWøkS±¥½Ô54nXÓìÊö2ç#u‡¾+w†¿¤\\¬lY®İË˜™Øê–~İòéI5B66q6ÍŞÎ˜ÈDÍ:œñíÆÆø íÒ³Oø…ú*sâ°ZN\\ò”ÍÚŒœ/ÄïÜÌÛÇœ¹YâìfÇ¤²ë.ª’MQZrUr6|é™ìÅoò1­ïŞQ×:/—-z¾¥Õ®ËÉû vsÃ‡ç‰ï¾÷¾›hC½m¦k4Qµb¹¯ACµÚgMôÅmW 6¼ÚoCğW§”·¾†¸„Ö[f÷·™Àş÷|G÷¿!Ûš·n*ôuU9oég°{ñ®=\\ú9 îåéÏŞÆ½^Ô]«:#³™Ë³Î=âµÍf±W×}\0ÖÜ+ñE­è·\næ«[\\éj\r«éìcà¯O)_vœL?Ãwıdıí½ËXOß»Íâb³¦;s¨ë}-\\§ Hõà­^õà-]:ã^õÓ8\Zé–\Zé•®jé•\néÏ]1ë§¯Õà–¼¯µà’¼\"xD\ZğÑ\nğÓ®D«‘\Zåm\\­‚¹[WñªÍèü‹ïNşåú–³¡6rÿ\0“À‹<àãŞ;·¸ÒÕa\nÅb¯jÅZô]ëó?Û4Õù¡ĞtÇeşôò8 öMàØ‰nvûPög\\Ô6Îk:@GÁN¼¨QF¼ëÃJ¹\nğĞ¯\r½r!\\ˆW+`®FÕfuf•üZş-]¥s6®fõÎŞ¼Fõâ¡^2!^9¼rW]H€u&\nêNÔ©]RÕÔ¯]RõÕ9\ZêW¯jñÕ¯õÎzŞ¯WÑ Ó?k¯whiÿ\0ĞïtX+¾\n=ÛkëíA¥ê÷\r\0/¦(v«^†³X7%}Umoz-m§7Åq‡›Ğè5Äæı×ô#ìô!şígÕÇf*×øùîÎ¹øŞ·±Î˜Ğ;e–·l6sÁ#él:â¶\roz½‡:«j\ZÍ}U€«ÖÕpì¿e«ê€4çhw×‰\rüùıä¨ŸkQí‰Íûó¦;àcÓüü¯Æ¶¥w#ÉŞ}”Ëbì·\\Ö;ïzÎ™Ò÷×Æ€5{UíX¬UŠ:}!_V›VÕšÍoØmş©ÎdğóI¿Ùtk\rı¯·ß-Ûm3è~}øX«öb±A¦;oGö¯öµÏb»Ğ]]–àsÿ\0:¯¦tÅf¬=˜¬haÓjæ­ôÎ¹¡\ZØKôÖt±«pÒúoXĞwõ/Úzu‡zIÄ—zk¬Ô¯õ½¯ë÷â³Ûø¬vg·=˜ìÎ£¨é~ÂÆ¬ÑQZ\Z:\"MS!Õ;¦Ùvf£âÜHŠè™ºÈ#ã+%´m_Ó?µo³ÙU¤wn¾Ëp:–}Ú\ZçAĞVkm1¥¯C½\0iGmp¬V+jæøG§c³Á¶£µ)cJ¸ÜéíNvmèFÿ\0OŒÙªõiåãUí·cfK½5tƒb—˜Ï …£!´mª9JpŸ‚¸èÁ9”Šgşr5«Q2§’+7Éğ¸ÓÖK0pß‡ˆT%¡–¨È¤\"Û¢x‚*9Vf8¶Ôù›vQnaE‘S8©Ãh¿na\n¼<ÊU“‰M¤ˆATóf•Ìá=MãE˜­L ¬N\'LÄfÒ\rUÑyé“’pÕÅwİ“éÀ´±oyÍâ[C¶+iB\"Ø1¦fâ=Vq­•l›%Ú“š­©Ãè[ì÷©ímıw{ƒ\rg!İm.5}B±_B³¦ka¬ÕôÍ+j\nÍZ¯[†™¬é¸ü)İ;Íš\Zÿ\0-MÅ*wö½ı˜vGß©š‰#×’j2YxF¾W‰\\¼‡CÇ?*”„3\'Ô„ò5$é±š¸ÿ\0©E8[ˆTä¤!Z6Fd¨\'‘€H§¸P/#ĞÀªöI——¼bÍGÎ€¼<ÁÏÿ\0ÙH1Qñ¦•…J¸uÄ~°?+™iw®”â>)9ÆUqñxG‡„|Ú{şâ)¹¢ØË¦åx8¦}sù9!^ZVMãx¨sxl8iûÇ/à(9„t¼»†`òiìY%6&R\r‚U“¦\'4¢ññIÀúoê„–ò²&ñòrgl‹6òÑÅ(q$oˆYé1fœûåaTB_êáî !Ô`Ã™.nQ?\nğùhØÏĞ<2È°e8f¨;_©q¾œÔcl·Xì\r´SØÏt^}îPAPô1Ù¾ƒ®{CnËŞ‚ÕjÅoW×5ùü÷gÓS`yN}Ú*<©¶ÏîGjyìôí¨TmºÎ%Êñôæ¶„á]Ô»¾\'Rç3~êZ®gíœ1’bw²ï\néÿ\0¢Dh‹Ãş+IS¹“!ÉÃ®+Ã—…JbÈ´!¼ÿ\0ˆ[¬´ÔEc¦—ˆ~3<TÙud»;˜„3SIZ2›~±Ã˜§²Q¢°åb.¼Ğ‘¼Æ¯Õqbàåy´Q|şD\"£RQ”_Fâ¼ÒQQzB*)Ë3´‹‘A(&¦`³’7Oã˜w1æZ	Êî‘p	 ç.s3é›i¸ğjæJ4Ë›ˆØ	ÜÎ¶U×ê†Â2Rí$hŠ±!ÏÄ¾\",¸€X‘ìç\\	ñ\"é\"ÚyV„‹yÕ4#Ç-)gÀ*OuéOf¡ØmÊÃtß‡ïp©ùh¸ôóê\\k5ŠÏhl#½c³€­<§>üPÓÓr´CéHşä©àïè4øŞÈ—X¬îmƒÕñGÈ“‰\Z¦ƒi¶ÍÜ¯,ÖPÒOÁÌ\"ñÏêv÷k6‹g(Í¶nq;£I¶\0£Ò<Pt’7)Éúb¤Ú|Í\'9LŞ|±\\Ÿˆ\\œëM,ºÊq<‚…SˆŸš–|¸yãß	iW..B¼âDhÒOM^hü×;\ZëÑœ¬5â¼C×=ëš¹Æ¹Ä+˜kš¯[éz¿mï®*ıC©LbĞ¨sVh;M®h;`ûR!õğé¬š_Q=/Çf+šÕzÎ›öçN^ÌéŸˆµ<\Z[si.nXÒñÿ\0ö–çy÷s®{PÚ;\\h(ĞëÉ¾rJÇmûsCÙÑï½c\\ëĞ«éĞø¹»ƒXÊ’÷À\rê<üì}0¬z?N—ËĞíW¯§Li.?jyKÕ¤ñí†¿ûGÜëïz·A Õ†³X«^±ÙO3Ø:ô®|-1®},PkŸVŞˆPıÏB7ß\'˜YHcsEvgÒÍ™Öúg]»ñYø‹SÁ¥=Úq1¬ÀÜİ7şÑ¥·[Ğÿ\0ä¬Péƒ\'¤[6J^cËEmqY£G8#Õ†Ù®[Rñ«6i£XÄ:ÅICˆíDAeC§\\ÙPA~&Lî\n³eÛ‹hEè^x„Š‘XÄŒ~uœ²tÀçp«î¿§ŸW:g»†ûİ¡¶±£e$êÖsÃ‡ñ!½¡¬ëJŞtÍcà­‡”vœPã+ô¢Pú‘¥~ç m›ã³†ÿ\0íWUŸ›Í¥\'0o%á¤ÌY©\ZYö\0\nùsÄ)Ä€7‡ˆlœ£¶É»vXF„+yç)$äÅ›wÔ9‰qÉ2ò`Ìdx‘²~c\"«ÖGâ‡‹32KÇ¶•W¬áädœFÉ½<¬ä³Æ’\\G\"åµM(g0ÿ\0ò^ôÇ`z˜ìÆ—µfƒLkz½ï)±ôÎ¹«Ó²ÒaPÿ\0Ùá^ÒÇÂÅÕŠ¿f4\r½PÕjx4léÅ\'°º\"•!“îoA]‹ÙÃ\r•3ç®M;ÅH)ÔC™\'ì¼;©Gí¿§a#\Zåy)GDèÕ’ƒ‡\'F+CI”±‘Ë‹¿X<RZ69VnYÆ,„Ô¤rËKÎ²;•Ü·p#)ì¦yŠJñr¸l£DO‘‡o\ZÍ¼œÃfÏdx€­_Ù#TŠ\'”’)ROè˜Òşoß9‡@ôØël¯p\r2ûò{„VÎø(×ŠìÇÌÇÅq‡t:ñ9®íàÚ‰I{{3Ú¾ÇÔ6¤d7\'š¿¡“|j	\'Á^bò‚MøPÈ<\ZëİĞI>·\\è(Ò\r^bîºÇ#@ùÕunkª^º•†˜>;wkº„tyYPpŸŒz:†5sˆW9ëœá\\ÕÌj¹ëS\Zã\\Õı`Öõå¶2ÿ\0{»Øl´–ääğ!ù™üKwb³XìÎ¸Ó>¸íKïO¯šòO6U*.Éz/?µšÇv;oXĞ+=›Uõèu0ögĞÌV~NjÔ:­N>ötÇ`R;.÷ì³8àÿ\0ª8s‡•ÿ\0\\»±º¤Ø/ûûs»İÏa»3ÙÎm/Ù}G\\ú·í¿ÃÅf‹Ü-‡_{³\Z%÷\\n’JÜæÿ\0¨l9ÃÁÔié¹å\\û‰…vo®;Z…Ü¸İzÅf­Wüê\Z^ı—×\Zçágà€ú8¬ö-½:÷÷“î«qG+p!¹$şftÍg·?\0Øs‡zÜïœéS³ÙÈòİñÍsã\\ĞÖ+\Zâ±è^ú‡¥Ÿ—[5Š½+‡>v>Z3KÅyÂJrMÿ\0‹Ÿ\\øs‡c¾Š\ZÅGŞ®ÔZ—Ù?B3ûİ›g³zÆ¸\Z½g»z¿`í®+­ı\\k~ûíÙšÆŠûî\ZçLéùHßÄŠêxxü²ßågÒ=:Ã¬èìü­›ıT¥%N}£èEnó5Š¾µ^¯§6¦41¥ëœ÷«éšÇ«PÖ{o¥ô\réQú\\îJÅ\rf)Ú0ÙÔZÜş5ızÿÄ\0!\0\0\0\0\0\0\0\0\0P` 0@p1ÿÚ\0?ıØÿ\0Ï*eÅÑı¿;RåûPıËÊÆ,‚w•\n²è°ú/Ş‡”bÈ/2BE‹ê±mî>d\"åÉu\\¾÷o4xKråËíñá,eËë/Í‹m~hğ˜üì[kóG„´…ÜÅ~hğ—ÔX´DF¬—BšôTF¬—BšôD\"5ôõÒÅ ¡¬µÒÅbò.—SÓñî\"^EV2]Lz[=É÷¤5çbö¡äW–<%ïLoÎÅíCÈÇËÖ%^Xğ–±,…¼‘«?OƒÜ¿’5géğ…ãB«%‰¶>YãB«\'«¡ä\n²%Ö÷ÕãB¬‰u¿ˆ!VCÖ^„…YYzEV>ô-%èQXüÒ^…óX¶‡-\n<%æ¹}ZjÉy®_C–…\Z²^kĞå ¡p›/¬±è\\$‹k,yô!\nŒ–´ÇŸB¨ÉkLyô!V]oPcÏ¡\n²ëzƒ}U–²èô!VZË£Ğ¸~oQyô.§[Ô^}„ºŞ ÇŸBá.·¨1è«\'ñÈÕ“øÚ!Y,[WC£Ï¢‘\"åõt:<ú!Y\\yôF³¸óèU˜ş6…YãhUş6…YãhB?Å¥¶^‹6„!“ğ1Z[ªÍÆŒdµÔX¶v4c%İrúr._8¸1ümpcøâàş8¸?FŒcÕ–Œ†1ãHB¬¾6„*Ëãh\\%ñ´*²U¹‹¡p—ÆĞ¸KãhUc­‹t>ûßĞªÇ[—è}÷/¿¡UXZ\ZXõ…¡¡VD»Pş\Z…V>Ô?†¡V]*‡€bÌ¡V]*‡€bÌ¡V_B¬¾8…YlV-™B¬¶+—Ìª²^W¦¼Ò«%åzkÍF²ÀØ¶÷\ZËrûÒàø±u¡ü)puBºĞ÷¿ÿÄ\0!\0\0\0\0\0\0\0\0\0\0P 0@`1AÿÚ\0?ëÜll‰›n\\~=’ğŒlt›Ø¼s%áë¢òóƒc¬>‹ç—˜ü¶i‘ã±l=‹qØ¶û,[–^[4ÈçìX±bÅ«bÅ‹rËÁ²[4x×ƒcá—ƒd¶hñ¯ÇÃ,sEºŒ•Q¦*>ãXñ­—êH•Q¦*>ãXü%Tiñ/Çà™*£O‰xæ<kMŒuDx¼#â–5¦Æ:¢<H^ñK\ZÇÔë§–xIcXú’Ù§–xIcXú’¯é§÷È>)cXú’¯é§÷È>)cXúl–Íß^ñ’ª4W-‹tW¨H}IlÑç{¬[}‹g^2Äº’Ù£Ğ¶Ûğ¯.›%Xš~aQ’ÆË¦ÉVŸ˜Td±¯§\"U‰§æPÇ}9¬M?2¨ñ¦ÇXÍËßRC¬æåà%³L^eQ?-šBó*ŒyùlÑóJ²ÏËfšU–~[4|Ôk,ü¶hù¨ÖYæJ¨ÓóJŒyæJ¨Óê\\¿…TcÏH•Qy”*K=\"UDæP©,ô‡X‘âBñèTyéˆ‚#Ä…ãĞ¨óÒª4şùég¥Tiıó¨cÎËf—Ÿ–v[4{·/¶åórÎÊ¨ÑéÜ¿‹–vUFNÅ¸l[m‹-¶Å²rÎËfŸ–vUı4|ü³’%Uô‡ÎËğ:Ü¿\rËí¹z¾ÕËôåœ‘*¯¤~vŸ]ö¬[§,ãaô‡Î­‹mşOä±bÅ·ÿ\0\'ó¶Å¸ì[,ãaô‡Ìm‹deœ‘*Ãè¾uî_Ã±æä:Ãè¾tî^·/Ù¹|km±ºéwWƒcÍÉ\rWG±bÛlX±m¶-¾Å‹Æ±æØë£èe›c®¡–n[4rOeËâ¥›–Í%ˆ¹zÜ¾×–i’Ù§ğ_0¶,X·ªE¹l[¸óL–Í?‚ù‡±nkâeŒ•Q\nX¶>Å±+>ÉU¥Ëãî_³ò?H}ıÍHtı!ôCô5!ÓôÓû±l«%™éúiıòì|L–eìÑôLy—Thú&<ÃÍG,ÃÍG,ÃQ¥èå˜cª4½³u_HtX»lEËÕó\\u¹}÷/Äøå˜cªúCçE÷¶¾kõß³c¾ùÑc\\÷/İ±l]Œb!ô_:Vç±jØ±bÅ‹VÅ‹ç±l]º~‘.Ç]?HÇ—c®—Iù9eØë¥Ò~NYylÒôŒyylÒôŒyf=š~–Yf=š~–Yf1Ö¿¤yf1Ö·FåÏèş¼ƒËÊ±ô¬yyQô¬xÿÄ\0F\0\0!1 Q\"02Aaq3@B‘#PRb¡±r’4‚Á$CSc¢Ñsá²Âğ`ÿÚ\0\0?¹\n?0V{tø[©dç#î˜\nõDİk¶Ü7;5Û®Üökÿ\0üæÀ{ròş§/¾ŠùÇÂİk´“à‹j1ùU†VW=®vëØçÛ”Çò[îë¨¤/…¶ÍT®¾ŒqZè€äĞ‹‰â·]¶_|¬£ü¥Ãâôø;<”næÑğ§ËmAÒñ²É|ã¿Åe÷>¬Œå\'İzmçueàâ&¹ÖßÊ\0ø©-àJqÓ-™¬øp¸Ø×¼x>ŠÛ×}½wÑ_|ï¢ÊG[úW¼?EïÑd÷}¼wÑwÏÑ_¾‹7ÛôY¾ÿ\0¢ï¢ï¼—xın?E©ú/ş•±¢Ôı®ú,‰ú,äwÑd÷}§è½çì½áşÕï?e”Ÿ²÷¿²÷¿²÷¶ıŒÿ\0²÷ß²÷à/|½ò÷­ú¯zÕ”Í^ù§õ^ñ¿UßgÕwÛõY=§õ]æıV£ê¬6d?u“WuwÃVl?Eİı–m*Øe˜ı–‹E¢ÑiÚTGı?wk®È¹…¾Ü>xLHînDğëµæß.Ì†ÜÖJäph²^œvãÉ[eÏŠöáÓf‹NV«[-OÕkû­uY9\\¹w–ªø–¿²µïú/ı…˜EÜoÑg>‰ÀF¹v6R3›>îaòYä½ñ4ø½ú£î³ì$\'—Ãë÷}†›^/«V|vV	€üÀ»£¿%u üÿ\0‰%	W@[^[kı{m>?¸rÔvVTÇ›íñÖø\09+0å‡â\"g&©É›\0ãÕµw¹«¸jT.i™YñAÂáÌ§Ó¿Vå–Ë[ƒ0´Yğ6 {ÆÈÓ<gê°‘§[4Y…®°JÜ$ç˜GrÂmä‹O‡ˆ¾6ŞË=¹¬•Ş,Ë_‚üd=vA!:=¥÷kÚ×5;(?¶b”ù+š;\0y¹^ÛF<ÅÔB`ì.îÜÕC\";x©H\\ÙX/¢t³ü¿*†º8buœÂ£¬v ä£é\n;´8õšVYæ½6<½¿:³ºÍÅª•ñÂæ>pOŠ|òã,ÜT®¦ì|\"÷(×Õ_€\n/c»e&ÎaB–JyIM¨i°QÏVŒ½Ö„Î“¤¸\0õØT5®\0ïİEÒ4aÍ6-)Œ˜¶Y/g—½ˆ¿5+@LĞuT&xåvğ_ÑªFÄnĞl\n†¦«·¾\n,äûLÆ^\n9gœ†HÜ²ÍIRù®Ğü-hb©êvæo%¡sİ½ÏO\r5;Ë¤“; œï@ü9\'Dÿ\0”Ù2XÍˆÍR´»]g;$\0ê†Úån¢­Æá«\0R‹|å{Cga¶¶:&ÁC$»nH:\'ÏM8Fs²Ş:V\\ùvŠj6IŠ<C’E<N‘¹–‹ox­ônkš2¸)®¸ÏÍÁğT²d:·(c\Z¡+†Z\\¯g\rÌ¬%¶ıVåÂÅc1¢ÈØM¼–şAfyğG`Fşm¿İ¯a\Z‹¬Ôíü¿ äy9lşƒ;\0T:–\ZÜ©à5Q<X\\©[-Dm.ÍÉğ‰¢mC¥5†¶!$n¾ª(b©ˆº3{™NÚ¨·Î×XçfìŠö‘^ÂÂî|Ô®–xÜÙ³k¹)©ª:B2\\Ûôî­ˆoEµSÅ5K\ZdsNèºÉÃp»¨ÿ\0L5,šÎÍ­^ÑKîÚìğâ²yŞ™3ïŸrÔ6©òëşûÛ›¼GUŸ	½L¥q	×µÔrK+X\ZoÖ*\Zøê#{…ğë™[¿Ë{”İÍ|F˜·6Hí¯¦Ê2ş­•<.t]ÛÚUL³ÄXz¢Çª.Š¢#¹f`9}†ëÚC¬q¨‹gˆºõœ›[€öS‰¿Ò…tç¨]o@Œ”Õ1nÎwÉUToAİæ|Ğ‰¾*	‡ü¶Øæ‹eu·Â.„Ò›71ª“¶\"J¨‹rfÔèg$an—²©„Sn‰VİTR3ŞoSÄ­µ˜-f«iH¼„Ü4ø©a[¸Î¤(ĞE‚ÍRå¢¥.=Ò¢šv`êª6<ı°Q9#«ÍRÈñ¨ñWivrsğA‘{ßE$n•Æ2t¿	ã²f©Üs¼cîÛkpBËÅKÁğeZÛou9üÖú,¼^‚Ó°Œu—a§G‚ü9qg³$Á[B^ö¶×²e<pˆ¢i¾uÌöYIG¶ğõŸåËf‹%ï—æWq¿©]W¸©c ëpV=ô…Úw‘1Jæ_“–&ÎñÌ‹Û3Á>7[İë±šëµpş¥oi—û•ÖíõŸÌ·&¢BŞW[¸ªÀ…¿|Ä¼gršeœ»c$4äÛ=î™_iÓFş³¼H@ÎA·åá¿1Çt\r¶D?\rÇİ±ùJÅJ\'Á•–ÜÔÇşã”Ô‚<Zl`äÑÁ’·g¦Ë„ÊÂñkpâ\"×ì¬{}>É‡òö\0ìs/İ}¾íi9a(áK—ÉğeiÀ÷TLõØîÀ-™lwŒídØ…åÀgaªÅÚ2×>Jìõ(Á;,æóÙ…¢÷Ff6öùn¾ÌYN:‡,A2BÜœ™$»Öô¶=Ñtöµ™ÆlsBl6ÛUI¾¦Š<=ßÌ¢0±£ì×±º;HsØœÛJtÍ\nI×9şˆ¾œDr™´@^ô¬QÇtÖO´M—u¼öˆğâÑo#Šá¥mœŞ{7MÈsAòÃ0ëf2*IOlQ\\áu3,áÍbe;ÏúQdl$ù‰‘oÊ°Ÿ\r‘²x±‡jŒ?²YI\räVËÉa!\\3_%Í ú+¹¶WUÖÙº¹jÈh®Z´Ø÷DË†•º¨qmô°RDÍ\Zë+{p°ÛÃ±²¨ˆø8»qÔFß*˜ŸÂ>­vÈîM*ê&Ûädã[–Ë,“Ü³¶J.:£B‹Zé\ZÛ®J*dLØğSÙ<˜Èù¶=¤‚ğÜ®¥’ï$‚©ßM¡?ib¦Š£Ç&]2Îp%ÖÕI|ìÿ\0÷QîÍÎ1¢“ï‡;§±ò¼õôº ¸ùTf,\" u]\ZÙÚò`Ñ­TçN«F¾hØ¿ct)—7´œÕ²åmİcâ€©$¼?©r¨ÜÉ^	=b\n§t†îxªzJ§IM+[Ôp99JÚ‡âyÎãcb!®áK²<°Jì œ•+ ™ÌiŠùA.²9œ”ÓY\0–•##6kä±^ÎÙm—)ÃE³¾È<¤F×Â4L’3l›à™9\r­\'«ª§s™Õ~å‰ïh¥UOs\\ m£¸S²ª²Mº–Õ{[¡Œ¹³r[éCFVÈl¨©{1îv´£GU,áqfèª©Ÿgsåª¨§š1f]¸B°ÙQ½FßÕBòÆ·;d½ÓFXçYÄêŸ	XúÖR¶¢™avá+ª-À<»\r”±Ÿw4•Nyáø2QÛ9ü…­Õ™¼Ñá¾Ö>dNÌöo!±õ	“{3kšÜÖêQ¿#víØFN-Í%uÉÏ`–apX#säd2õÊEĞßK“|,½Iï\ZaS²{G¦!a—¨|SŸöÅ™ê„*àdwVêyC­ŸuXº3oÄf™ø|J—·,±aë&6RŞ¯Ì\Z·2`7m±aÍ{1İnínâövà’?Âöİ7zl£@ê¯e‘±`òjöBÈ°[ğ¦1ĞÂüÁÅ¨Í+±9ÆûQ	³›h9Ô:ú&6XbyØßCpB{,[Ñó¯k4Q4+Í;1í¾|-a<Á3¢ÇoS*¤¢ëNÕ2yh¬ær“UÎ¥¶zÚªa¸İ¹§Rëä˜şŠ‘ÙÛÑÄÒß´eÑĞYç™^ÆiZs=oKE®vâcò{S¥£§JÑJfdt¹+Ë$8²ˆºf{$ß4–ÈÛ(æ‰³\0ÜôL«@Är^×^qdğB27}ˆç„}šlÅÈö+ ?İ¦âÖòOiğw%+‰®Ã¶SÌY>{ŸÂÕˆ£éØ5jµÛÕÿ\0¢î¢÷Gè½Ó¯è½Éú,¡wÑ{—}¹v~Kİ;è½É¿¢÷.ú/tï¢÷.ú/tï¢÷Gè½Ùú+ÙëÛİ¦ÖÏU„ÖKıÊäŞÿ\0«f\\\Zì!]Sºú»îÒ]—Š|G0Bw›¾ğ}\\ÔÆ©qZ§øv\0‘¦Û+w€zŞ!{¶ıp}t}wö]Ñô]ÑôZ¢ÓöZ~Ë,ì™	„œ~ -ÿ\0éh>‹AôUüvÚ\'lWiEøn—aÃs)Ñ?VºÛCã’cêlzgÙ\Z­ßÙšßñË>À…u‰Ò@ûNÇ3{¦€u@ówÃ]0szˆ[À¢‰ì	?…e³-‘67€×=Épd„—cH9¬!ø2ïYH×¼oì8ì¤ö‡\0øÜZrRTÎnÑ¥‚öˆª£Å®è¨^âXÉ~r;©äT¶FÔu”²{Cs”ßª£ƒ1ÈXy/e¶;6åÅINù[0\rÄÇ„ıÍCc•®?d[ÉuµòUDŸù§l‡æ¦•Ñ¼³şb&~c¶FË¼7?%%=1”HÁ|VO¤¦|»æ¶áçE «—Œ}SºBxİÙ±^Ú\'sp½Â¦=#œ3½Â«ª¯s¢`•ÄjY¢‘Â–ËˆRUPºO±ïµíQÍÒSá2æÖ€¨ŒÄÏ”ŸM¬€b6RSAWyãoáÉ<\Z‹Hß–ÉğS×Nß–È´øm{ã¬Ås1Ù{Sjã\0w¿*ßSV±ÌçrN«¥ªdë/iQåŞ¿‚54•\r™­ÖÉ•µ¯îİG •¦\'ü÷ÉIUŒù*rfÇLx´Fš	šë—_$éà¨l¡ºÙ	ÄñvˆÔC;$‘XÌ‘ï¯HÆ×^Ş|ÇdkÙÁ5Ã;†Ëá®ÃÕ\"÷Q?À>Ê1o‡ŸÔ£ÑŠë]O`óùvèTÒC<.-–Àñê†h\\Â‚¢$g¹b¥ŠXAv AEĞ²œuü“é¢6»z©±ÏÑıa•Å¬ƒE8–,à”Çê\'hË©`’™ÎBàğrÍE;)Üc`p6<Óªã„M­ÍñD¶Ÿt}ßQU¼ıTml[Ëä÷ª?ù]³4ê]\0‘İlÜª::J†F÷õŠİ2¡’øİ§lÒK<mÆ0æå3¦ pw”’xÀ`-ïsUqÈbtúÅsvªŠ)¥§›)è÷±cÜu“Kˆ£ÖÍ?¢ëœû—@ğUWFI#c™Ù±ÇB¤öšˆ„dgİÍRÕQ9§0¸_ENÈÈw³wìvÅA³SÙìqEp9¹O½e†>©áí¶q)#[­}µ›Èë¶áUÄXnìÚ«Şîªæaï÷Ue8yz«}_WxÜ,iT³Rõğ³	²†|çwU-˜zŒë*¸™<‘eIslÛá¿yTDÊ]Õòh¿yUFXn]ÉU3\rÔĞ0]áş­·‡’Ó°¹VP?œm?ŸÀ	-¯$×ZÖuòP;›/ğğ°x4«…êš;	éÀ|pÈÉnÑàº›è½ÌßEî&ú/òó}ùy¾‹ü¼ß²ÿ\0/7Ñ—›è¿ËËû/òÓıÿ\0/7Ğ/òó}÷}÷ı÷2ÑK8ùŞ]ÜÕ¶æ´ZmÌ,öe³<íæ¬Ókù¬7àÒ¼ÛLÕ÷ÏÍ\\=ÙşewçúíÂÙ-ÉËgz9Y³È?Ô¬É¤…KÕ…²MŸtõQ&WH@¸«C;Û~N[ÇÈâîwX]Q!.òÅÜÓäVøÌòñó·†¢Kÿ\0RÂ*%XcFÿ\0©E3ÚN½eW—Ìğ[°h²Tæ÷ê[îÈünk%I%ïxşŒüŠAÈÛc.ÁÇ™ÛnÃ_‚Ï°Ëî\0ˆã\\<Ó\0ùK‡Ãç³^Ã5§¿ÙeÜcÍusıT”¸|¸Gå	æú›¡dåØgâî74>Åİo$7ğ9—Òá2Zz6¶RáİD.eù…ö0¹ß¢İK˜îD-ìtïs|‚Á.}59—ËMƒvÌVğQ¶ğ9‹j·BšLZ÷VêxË\\<Ù`·‚™å¾Aa…Öäc#q#ÉnÄn.N´êëÕØÇM6ø‹¨›CO`è¯`·oiSŠXdl¶´—XšÂG¢ÜÅ‘×4Xákd±“o-—¶ŠåiÁklÕ”n™¶Ş·sÛ£¨ŞÛ½0ÌÜ8Ûˆz(ëÙ5ñ:Øl®6²yfÉİSK=FÜo=¹pbs²F7äFK,Ö|éÃŒ,ù&©ÊOŠËƒM—+M™x¬¸õRgek\'ƒ~Brëÿ\0Ÿ42BÜ»gn¨S\'»ñX)½´ã-Í¤…N`v9ÖAóœR	¢cê#¥\Zã¾åFà7„7?4*z.»w+3ÎJ¢²¥Û©È{Ão…MFkŸRçfÌM:ìcãykğTÒ1öpf¡Rˆe ½—qñTS¿9¶%’´¹Ø]%³˜wvÊ×A”ç™·xO1¿)ğ›\'˜lOktòRSS´[>®·Y T1R–¶ñ|*‚µ¢Ò¹—Ñt|¯Ì»3’‚N‡ª¸×„ñU0Ëc¾\'á¶Š\ZJ¼!¡ÿ\0+lŸMOM†\'aÁ‡UM=4lµ@Í-æ¤¦¦¦‡¬Û¼–óR:&F%‡),ÑİP@öG¾˜~ÃUö{ìŒï3a-ù•}Ed–E¯WæRô“bƒ|÷Øo;­Lª¨e+ªc~‘œœÕJE,.ŞÅâİ=66L\ruìB¡¬e4C1†ä h§…ÛÈ¾a¢Š	ÙE \n7ÑÑÁ=&ÖN8mˆ<‹ØøªI½’\'ü¤dÕVÇÓÄ|@*ˆ¥£c·MÅ¦†j(ÀˆbB™ÔQ313RÕnšùAÂÀã’3TÃr´ÿ\0Ë:ìlf&œ1:/cl³ímÈREGhbá™QOM”_…ÖìYøQôŸÏ‡{4ÛP~L†_ÿ\0rV·jçæÃYLılçsâPDrÛŸ`pX(İ=.ù·Ñ!€GÏ:¦Ò{°fÓ{	¡¿ü*8*èÛ#¢îºê\'š(÷‘|×F¦kjÍ‰HÙ˜ÙãŸ7µËuOÑ±Ã›ÎÁ+áŞ[å½“%›£ÚŞOQŞˆ0ÅùüiMÃ¼Ócja9µ{Pè¿·9÷²_â$âçü/k‹¢şØ››¹\ná@üc>úß6²S«±lk¥isd¢“Ù¤k£Ë½à¡ˆÒÊ74âğQÒŠy[¹aÄ£¬u<í™Ò,lŸÒ3Gq&E¡GSÑ°JÙZü_hr^ÙQM8”÷šİ\nulxc;g’öˆc²›kk\'—GöaßE$­=AÕg Tx[j—·óØÇS‚^I”A¶|––ksOèîÆ\'‡7ÁZ…Ó—Ä m[¥l3…véæ†ğØxØ(a‰ò™)Û…½Uª’VË0Ø5^×jöºz‰Û|÷!¹)\'µ±¸œ¶EIY$‘ºMºœ:I~×«İğSŞINó«İğS¾I$8†ÕRÊ÷ÉbÜ-³TÔrc4ò‡[4}‘òºCùrÙîÌ4£UM3ÌÅØ­‡$\'¨‘ñ?B0¦G\0\"(›fğŸ>ÇõR3œ¯{l¼>¼m°(G|“cfeÇ’‚Œã:Ş¿x.T²ŸÌvX§zñ…–[q4ÚË«% å›¾àïšÌµ²¾ÍäÒ9çÌì1Ó`³Ì#,ÎÄçfOcŸÁÜx=òWLi®ÇŒ¿« ³YšÓe¸2ğ\\×ø¥K>Î#Ô¿âø3Á#ÏƒIR8Z¯°Ÿ>Á¾@-~N×_¸šo¨à¿ÙJãâmû|M¯·[,Õöx«¶Üöj°‹ìÍdoú,ñB·²Œ0´õŸşÉ”ğ6ÌnCáçwäRyä³áË€+y[€DòÌ«M4M¿ÌJÃ,ñ~;ä˜ç½¯cô{Pj†@Ã¡yQ™daŠNì9!4•Qt±B«Ú¢->i›ê¨¡tÖ¼£O8Ìg—Š2—F3.%\Zºi¢¨‰½ì^ÑÑ|Óæ§¨Šmßy­r¿ŞÙ®Ë-6–óX¯ª¥$é0ø\\ÊÈvyg}™l³¿…‹š¾ªÆù««Ùzù¦Åpµ¹n<Çls×l¶ñW.ØO1Ø4y£~\0wT‘òb¡‹õTb_Æ©]I‹²	°Ì,ç8`BëËNá¯%\rOØÓÜùø«»¡½¢Àa›,°nlÛaºÿ\0…³úà*©¦‹ˆUä:Ÿìª?¡\"îïY«_€ËŠüZü8#°-Y„Ç~´ñgğ¹ÿ\0½¹ì¹*ø­urVBÿ\0¢Ã¯è¬.J½ş¡Xúb—š°\0]\\ü=öÍÍA¶×5tN¹vó)Ş»n„Ğ›8y&‰g¾~è[¹ê1Ÿt#µ7Œ‹X´-Ì5`ğ\"ë{S1yóEÔÓ`ºÄs¾krÊ¾¨æĞQš¢R÷Ÿ±RÍ†ëEEÇ+Yna©³G†§\nzŒ8ÏUª\\5ÿ\0¿—¶k÷g¡ìç°€£â`=¾œY\r/¶ûlÑ{y+,\\öİ¾3oR°Şèxy]dHò!f4òV,¿Â¶Q³›ÔlòØûv¿4~Ü6û³õì=UÑ\nÜãm8úË’¶«0°€³Vmîy\"l@,@h³,Ğ\ZóD{ó\nÖ·è®|U‰!\\}UÁôø˜ê£e­ÕW^½€Õ\\öÚqh³ìóM¹«piñ®€+$. ¿€·Áe¶ë.ŞÊÍ%u–FŞ\nö¹>K«è­â€9Ù_R|•°_Ğ­-ú,¼Yşˆ7?U„ı‰Ğ+;ÄÄ/£Voa°_Ÿ`HğiÙ—\\WÛnÖ»uàÓ±¿Âë¶ü/€Z&+‘ÚeØØ\rVKÓe¶[EpnJÏ/„f­k­,¬r5¢ÊÍjÒËªˆÅu÷VG%ãñ!§Á-€vhß‚ÈmÓµÓîW·˜ìUÓæR³“¯ğy¬‚¸ICê¬¬Q Ù\\•w<W€]_D×]YXl±Í_gÃ_„ƒá„\' ˜<»	Ì[†á¤úc•¼¸5Yš/ntŠÚİ>x!ÄÈóv|YìÍg°E%Î6nj¡İ¼x_‹/¹ˆæ8­°4\nK9LËêWío¶Û/°â¯{lÍb&Öæ¹x«²Ìi’Ìiä±Ö<Öadº»søùO\'ÿ\0”.š.ÂL¹p˜ƒº…JÙ|!¾H¼¼1ÍÏ(¿£zF9ÜÍ[dçŠ¶±íùNŠ–ˆÔ4w4§\"Óg~‰ÑSô®\'³¼Š£~Í…Tuu”õ+…¡—|`\'T¶½­Áßn¡•¾ï›5\nYM[[M³YˆPV\n˜‡«„„Èå•Ïæù”’EYN\r¾à56«¤k[JÇ÷:¸‰PG„Ì¨÷oÑ•hª¹ƒ/ª¨–y¡wRÙÿ\0ËóQEOÒğ›é \Z)kºA®sš>ÕÂÁWÒ±FÂ9f˜7­’9EØñâ£=!ÒQÓÉ/u˜q!zæ¾SòÛ.ŸÁg¶üöTZ|bã°ìtÙem›4½Ğeš¸ıÕÿ\0Erë\rÁ½·ŠÍögñ¶Ûªß™È‘Í\0½`tÍÜ\"ë|ªKÁ ç…VPÒ»xñÈf¤¨™®dmiÅqeS3FN¹ÓÍr°rª hç—“ĞtMnñß½P>ñ*V67¾ú*á€æÂ2HBófÍÔr–™™KTòô\'\nH\"©‘¯ëDà¥İÊxŞ\"75Sò5I8‚C­eK5/GCYfÜVTtÎ§m!k¾ËªZŸGÒ»¨güöÒFqË=U8–	[wZƒƒ]bÀ‚§poü®K£N0Çc—¢§ueTÒ6!Ö½_DÌt‹,°ŒÖæ¦<×?¹Â#†ÛõDZè¨óï3‹.ÃU¢ÍY]fªä^êç ­mVCE`<V&öVÍ\\åeŠöº¹WûŠêWßÀ”P²w`Êî¿Öîš¥Ñ%ŸHËû#QCšó™<Öî¦©Å¼¬·PVJÖë`S¤ª@]Şë)ŒõÂ:ÂÛ1ò•¾¯éø¤c~F»*Z¦7{®…tÂß™ae|ÀNFBâçïtS3@¶ec¥ñ“È¬Ur<rAí6#5¹š¶RÃáu‚š²FWB¢Z‰Lî»‹u%|¥¼®·”Óº7²+~êÙ±épäúévİÈ	«%~qw&2ºªiaÄ1´»Áoº?§éâ§ÊÌÇ†Ê–\ZüN¨·’ßTÊdqçñ\Zvã4GôOÏM”ŞYpiÚçöiÑgãŠÚY¯ŠÄBÀ­–AfuV9®{2ËîI<\ZT²y,ÖIçÏ°Ì•}¹l×fk.V{3YvZün}¶h®ë·>$ëì§<¤ííeª¶«¬l°³Ãeš¬Óæ‡‰&ë3lÖC$+\"¹ıÄQÛ1ü…HA²×a>}„#òßm¶\\+í×àuø\\ş^;£~ÁÍ*ÈXèğP<û];­v_’°k?Ùe••ÇŠÂN«D¸]X¬ÖŸqÁ)Dìº¿j!ùœVÙ®İx4Û®Í{¶__ºæ8n6¸d.hÌNæÆñæx2YíÌ[×eÖjÜ‘V>\nü—ğ³]o`®½~å>e¡0fVvËÍyv0~AÃ¯Ï›sà·Çgğ>]ƒ¿«aP8Ÿ¸yö7Us••š³\Z,-ñVEsã’¹õW\"ÖYê±}Èx#DĞ5Ïc•û\0­È\0µÛ¯a…€•»71ÚÙÍ·‘öZwI‡NŠFZlGö\ZÆR“mñ\\peÁíÛ›Dït\0Ìœ“g©ŠÍq¶NÙê\"Ã½f{}¼àİ~ö{D,°.æë&Ç>ˆ\\YÜQTË„6lÛÃ_¿„´g`ìöãm…¤^öEíÄ7½–ˆ¾š<“â|ÌŠFjÇw•–|L?§aê¬³ñ\nr¿óÅ§k’¸V%fæ¯­–jÄ,+2¬GÜ¤pBÎeD/ Y§öÍ;> j™[ÒoŸ\'»‰HÚÎ¥ŠÍ¸³U©b½¼IÈ&™˜Ü.È8ÇîÆmÕrd“µ˜\\m“”“TK~Îòeú¢úWÓ—Â|_’•ÒI•½\\İo¢{Fí¸M®çkèŸFdŒØârÿ\0v!¶‡šöYÒ‹©¾ªG	 /Œ]Ñ‡u•ÂSÇwú©kbtQ´âlRxù©{Ä½×96éÕqTÓÔFÓgî¢evú)\"q·PŞÊ\n‡É£¨iELêÈù¸šâQ†IâkE†ğœ®|é% –ø„\"2Çşg›B®9ZÂç_½\"¨dòU?tÜô)µb®)˜]‡¨…UDì¦ˆ›8w½³Èğì¯p„o±4üî_k_bÃ}áÔ“>fC]é]¢öÖWE4D€Ì-ï\'ÆÇµ›ù.ç¸äÖ…ÑÔ6xfÑá¶T4ÓÎÚx˜Ë¹îüGÁ\n\nŠÖ»»&hPUô, a{‡?!U8%†07B>÷ë±‘5â6Í.ñï?+B‚xjw±Î2%¶L›¥+}Ÿ{›‰Ê:\"íãf¶yì´Âå¸bj¨•®tÔÌ»ú½OE¢’¦\n’g…¸Ì)%ÜN</i\ngO(mKzÙgú(©¥©˜Å‚ùŒEª*RéZø£ê\0ßå1²K»ï2Èò>P©êi&{›?â$Cör[½àŸJóöÕ:K)ëÁ“ì£ÍULÜŞY„\\óSÏD|¬â:¤©\'¦t»øsxrÃ—xZ|ûa_Å0càóØéÁuWVj$x+šÅmVº¬‚ıÏ9S[É£fcË°Œsr}¹ğ0N@û1š±ˆÜZ5 d©hé‰ş³ì¡¥›)%}ìy*n§ÊYŸ’¤¢\rqÃö6æ¨º:]ÒuÈUW=—|cE¼T•UYnA.¸Rô„—SµÅƒ’3TÆE¯3®İ-\'ºk‰ÀU%U²nñ·o‚M)lú¥áYOW¾•û¼VğSÑöš»03È¯²êºypÈB©}FF¯«OŠª¢h¹Ş‚Õ%#şÎ–`Ç?Ğu”B!öX3úZ˜Ëı+~^*YçŒ·|q3útPAnûÀU-ÍŠ˜âT³æf\'ú*:V3ì fòWeR¶Œ–©ÑÄ_ôÂ×¶:Ş\n?ÀF™‡ì©òıWFRQBK\\1>Ã+ùªZja(\Z^÷ø*.‹¦§‘İ[¿~eÑıÃ‹ua%¿M§l/Gnµº¾e0°ı”?şª3S‘’]æ¿(U=!3pÆeÂÛœİé²¢\"ÊÑµÏT…øE4‘æ~¨n£q‰Íh·T!8™JÍ}†¤·y#^ö‹éu(4ÑPÓŒğâÎOıì’\rwĞ8)ú\Z·1ŒR~kæ©é¡÷ÆzçsFöFŒ7ùB¾g¶8Å„w9½Qôh6´aÎTîŞ42(ÚÆ¶ù»eU4¦Í»\\Q“F<9ŒôQĞB~Î˜[ıJY³¦“\n#~ÖbysÜ|”ÿ\0Ôˆ…FBnØs›¸}ØFyìŒù§°ø;³×=—WWXt\\ø£aª:d®²ÎË/c¶k÷C\Z<ˆÖÛæ{Ç7\'“Ïe¶biµ§¨¤Š ºèDQ’6Ù6	© ›wÜs‚öª‚ïl¬—\0pÒÃ$ğÆ4x4j›na½dêh7yñ©éÁÚ;î:§²œ0ãæ«Cñ½ıüCUí8™¶=TêÍíÜìÆKu3Ãc×†ÇSÓ½¸Ny‹ÙKj=ñ»{ÈÃ1œğ¹·[ê©±‘RAO1ceÉÖO¢R\"{®à’–L.\"Ú/h§—È¶‰ÓÔHdyñ(K³šnAµUÍ.	*e/-ä›MKÖh\nöfVÈ2XœI\'šBò×\n/Ün½‘µR´ÃtÊwÎó}ÆßEon—?4&B>`Q‰õ²¹§À¹o ‘Ìxño÷®2^øïšÇQ;ŞGâvÌrÈç;K’¨™Ï¶Y•¸2ˆôÃ‰cŠG1ÃÄ-î3÷Åuöó9öæí˜šmèQÂmt\rˆXŞnNw%^G9Ş¥\\æ†\"M²Ì­6\\sâ®šÙ‰âëY<tVğÊü·¯ğK=¶Z£äx/²Û#w,#Ä&NS3úVgnAkÅ¦ÍV^*ú­}U€Wµ–¯{Ù¬¾æ#‚ÜƒSÜ<J	ƒÏƒ^Å¼Q6âÏ±ÏáïÁ‡Ëü9mÍgà¯È§´x³f]öä×š°VÊ¿šÙºŞGƒÀú\'Í¦Á§—»tÙ~\rx°M˜uëpÚÿ\0¾ÌøêˆL{Áv_ÅkÅªaÃ¼n{rW†GÛ.«n·OÁçå-Ín¢Œ—Ÿ”ĞtôòG|ºÍÙ‘â¸Êä¨¦tñHÙtÀxw4ìÄóátUşaÚ<y_°\'‘@#ê˜Ían—¢¹$«{¬V²\nË0®>ë*W¸æù `ä;ëè×/u¾u¥-üEc©ey6’Œ4Ûx%c§¤‘ÀxÙ$Œ‰Xl·ÒQH®ŠZ‰c”<6ñ0|ÈÁ;pÈ5KC³Ğ¨!‹£©[,ì»º½ÕU-U26ã»†iõ”ôQFÎM!£$jc¥êóu®…Em;§Ö)ûğÀc8cİ²2ÓàãÍıkí‚š¥©|‡6(©56îÍŞ¸Æ¦} 2ÿ\0Ò\ZÑâS*ÌĞÍ†ñ›¦ÔSBéÛë[Ñ:¢²H`œÿ\0”)Y_HqÜ;/D(+úB\"è›“ÜlÔb’x[·Ú“•Ï‚öCŞm‡×³‘€TwElV[¨êY>]æ‚Ô6^$]}KªdX×!+§‡½nÌŠš›\r1âµüSºRµ÷ÁfµÎ:¼©C\\X#“x÷òê°C‰ÁÎ´L¿‚öt™5-ïÙ½_54Ïh Ä\\ü9á\n7A])k×¼y…ä˜>(®Ë7[óQÕtƒäh˜Ú(ãgy£O˜šZzìËUIHT9¬dmhÌŸ\rdÒ€ì\"\"ß>iıSŒ{Sãöq Œx¼#O¾xBÿ\0\rÒŒ±ƒÕ¸RQ¹²–—Ë;—4ê9]#¥8œ\0wqªZY$sç…Î õZ¤ª¨$SÂ:Şg’ª(ë`s¯4ÆÕSÍ!so½ñYp8sp=eŸŠ9*SÏ%’Ë²±6@4ì²µ¯eÖV_²¶ŠÎW«?º§xæòµW@xØJîL<-™’l‡G°õa‹¾*ˆ§7%ø¦ÿ\0Ò1 /a¢s£Š¬nJ)fm÷l—·Ñ×ÈúYÏY¸´º¥€NıäÇñx\"\\nNÈb>.Oş›\ZÔàr}cì=gHÏ›ZÛ*ş—×»wq´iú*‘”eNÏİIWPÛšç¾ãÄ©+_›+ÜC­–Ø\Z~Sèªd¾Aö¢ÇTé\ZÚ—Ùû±Ö>J\nJ*	\"§ÂËw5)¨fæ¶™¸y*º†·¯PñŠ6ÕEƒtİõ“ñ¸o¥Şæ>U0÷4ïş5)•o‚ûÉmOˆî©å¥l®«›ÅãªËòZìŒ#ûO¢–²­(ÿ\0ˆ9áLéYi5Q~wö´_V8*nŒ‡6Ó<K/õ*‡Æ~ÖºÍôh\nrÎø€àRÔÎ-TèoÖõO«£-{¢v±§¢\"=ÌµLÌK•Q]&áŒ5¬Ä{şŠ’NŒ¡ŠO±hlÇäR6z†Í%úÎ¾È!¶¯{ML{ºX­×qùB’©‡ lÏÑ;¥Üm,°68Ûù¥g±®?òÚ\\¤•ÆÛÌxnœj%iªx8\n™òLÇî¢.uÍÉWtœ®ëˆÉúªç™ZÙ‘.?º¨¤£š\'ÊÙ.ÜcP¢oHt“¯ulğ4ÕIM‡ì³Ï‡^¸ı(ù\"oª¥:Ùíşx³5Û–Ï]™ee„­ıW¢ÄV«?Ub~ê.äï?„ìƒáØJ\'«}Q¯”i„§ÖĞ—³¿Xİ\Zº¸¥–SÉËüBšÂù¸8§ÕÑtaOùŞíÿ\0â4Ó¿ïf™IKO¸§iÅ†÷*<İülÂ×¸ß\n/~d›š3g4­ìı\r“ş2Vö Û³MC£M\rÇ‰Äx¯b†3cpóà¤…‘F÷HìXŞT³½­˜Ï“ñ&ïƒXÆdÈØ:­Ûjjz{ŸÍë#;£‰„ÿ\0Óm‚4ñÜÃÛÙ\nçÏyİä‰æ65İì\r¶/Têzi\0iÏ6èŸW·–Ag‹£Z\'¼§ç!{La“Óš}U,Ñ?¤Ëótº´~U+?ÿ\0E$/uú÷ı6ïieÀâ-’5QÔ<Jí]uªwIngh––¼x‚‹äq$æI+ó>B?[Ø$s<AFoh—xrÆš&	äeõÂå¼{‰qÎ÷_m<·âuÖå•”¶j±1Ö#‘[·Èâ)•5U™F°´-ô†Öî·ğÏn bêQÑtF)&sÜåp±åi¶ãÕö¸y\'zlˆßI{;¬–—Zk³«š¹ËÁz«…ªõWä®>é•ÇÁ¥NîmÎ×vŸ ;KlË‚ã³Ë†á_´Óâ(úìÏˆ·ôWæˆ½¬ä×·Ä_‚ü:­6Ø+4è²\Zù­V^^ëº¬ÕÚ>å<ŸÈT¤\\İ—N>}„¦ú;{™ğgÁ{~Ü7áÍe·uK	‘ü‚>ÍLã„Øæò°<ZÙl´q¹Öü-ºÀğZyÂ&\0æÜFØ½ˆµ¶:½²Ã£³ìoÏ´x\'ÛŸ`áùòNj§xñ¼9qf.¹-6dŠ½ÊçeÕW9ì·Ü¤ğK‘ËW«Dùö<ßÂ\"…·\',gJt	Nx/eÔÕ;ØæÒãeÕÿ\0„Æ¾™“âÊÎ(AO…­Àß4T[¢Á×y¹cdn rìØç[“Q|q¸™ pÁO+Àñk	La§”÷zº¡£˜HtfÖê¢FãŸX-í-+äÂ\n£‚¯Ş¼âvVÓh©’‘â3Í2Yé\\Í›i“TÓá6ïx¦OS»ó(«d`İKëm«•ğD[NÌX‹z×Uu5ĞDrF·\nİS2öÔ“OªÏ‰­¾&¿öRôl-ÂÃŒ_­eUZí!ˆ»>jIß+\"ùd9\\¨h™S¬{q—³Á¨ÒtHlDm“sr¥Œ0ºV¹Ã«“!ªéa¨vbOèúš¦Ã+M»¸±-Ìõ­ˆ’ámÖ}¼W±ÔTìü7Ã|YÙb´‰`hŒC‡l»É›&—¬óøB¥4R:_kî]¶RQšÇ\Z–6î³zI==KD#˜Z¤¯ßøßm2QÕRÕ80»ä\Z4(+(§{Ù)ù‚e_IÔ=›Şã:Êïä4³¶í8zÉ”¯Ş‰!‹©a—ê¢–¸Ëzwzú£/»r×`‚îq¶J:JÇÊù`p«nGÔïsöxOò½š¢Iù	,h=Öù©!a¸kˆÏ‚à#Ø;ú•‡4Z|U9äË}6ç’·\rïÁ®ªÎ«kåªÕ_’ºÍ^Û4û¢Àêö¨Ç7—eŸ‹øg­p¹—Fwºîy¹ÍGDtqùèÕşCKiÃ·}ÜÊ’\nXã\r6ÅÕÓ$i(áa»¾ÕöÌ•S#£‰Îr|‘x÷j>U µâaÏôOšµñÁLÛˆi›Şrª’Gà€g`9ª©cŒGGNÎ£m¯ª$‹_5’Š”èNvQôoEı<Ã„ZİéÜá»\"Ø¨è(üKÃXé<@PP1×Â\ZÏÔ¨ú¢Şè¢…ÍgWŸ‰+pq]vÅ+úÓLo/ÿ\0¼;äyuUEÜÒï?™PR=ÅÒ;íŞ«)œnap{UIÑ»¡n9¨í53@$[	ñ\nÉµš7a£«u§=zÉlÿ\0ı&R†¸ËS&\'°\r~ê2_Y%²(S˜#/’ªL\0à½—¤(Üi+?/Š–•’ß][£Nè$.Å•†ªš\ZÖa$cÂO’{È#u>\'¸\0U5ã8âcÇ–J§¤^	İÆKğqT‹=®2??ÕO6¸¤\'mFÔÆÂ÷Ædf#ÕÄ£I²ÄbË«§‚©e5i!ÌÈòsê·G»+ÕEƒw—o¥ÿ\0Ò£ i¶(ñ½R„GYÜêâ©]G8ŒbÇå\nƒ£#~!O…®*¢ºbØã¹ïªy:2š\'Ş+o¿\n{%˜JàzÎd”Ù¡éõSu`Şc¿‚}XîFÓoáOPìÎœÇLOzÜø}GªüÑ(^áF9b¿Gf¶Y-5Ùe—†k=Îjÿ\0¢Ë-–Y+Ù\\qåñ„ğFÑã\"‰‹TOašg›Ïéê²@·¯ébü\rr‘ÌnêÕj’®:¿k™×,kGòªºR¶L7ÕçÍ>ZJ¯l©uÖÑTšú‚6¹fTó¸am™~²|‘Æèàspâ9ŸêRIå¬šOÆl\ZŸA	&i]×ËÁ>–§xç8Ü°òt`f#İS0%£’ŞQÓH¯Å4ïz\\tlQ;N³Üy¯ñIã%¦LVñQÕÁG…‘¿}ç¯h¡ -tiŞ#’ÿ\0‡¦İ0»}ç;Ïm;[¶Ó3\0ÍDL805¸®½––†İQ¼À18€¥’­ŸñîOŸ4®»nNÀël×±º”D;½^ê}›ĞŸ–A{/e‡v@Í¤êuó\'K­ÖÍd¡±Œ²k/ğøeÃ¦y¯gV–Œ›vŞËÚ_+Œ¤ßóºİûGú°‹¯i38Ë{ãºÜMUÔ:ØZéì‚RİàÂërXij7;î©r¨®¬«‰ò9–‹®\\J¹7Ú²¹Å¢Í¹LÕJìí»´L†ª­å¤üÎÉ\Z†U²®¤‚#k{­ó(Ë)ÄçfIW–G:ÃÄ Ù¦sƒ{·+sò~åuy¦{íÍËr%xaùo—JòrÕbi·¡W¾ÛìiòÛ§>[#ğº $áÉgÁ¢µÖk2³åâ½Uœ¬M×5p6fV~*Úö•ŸõY|Q·™%BßÈ®¤>WÙŸ^eÜàæ½€ĞJAÍİ{#akùíÓ¶¾ÒúY°8‹dŒ³<¹ÇÄ•~ÒÛr<7ø[¦KUb´Z-vÇe~ADIù”­<Áá×†ÊÛ/¥•¬¬Uœ­mí²áX­5VçÁn+°|UÖ{iÚ|ŠcOƒÉ-âŞÆå~Û>ÎûtÙŸBûtã½öXíSG‰ÅÉSlÈíAõ:mc¹ ?*iäå;yµ¼6<7\näk²Ë•ï¦Ì¼UõZ¬MÙnjÊÇ²ºÏáÉácGƒ@\"{6l²Ñj‰¤ƒs²Ïs¶+¡°¼\nuDÌ¬ığ®™	ïi©¦ß[+€·S0µÃÀ„kd­bz‘™ğXl£¤k££l½Ë‹¸¨Ü*[3fÍ„6ËE¢§¨é*oh’«0ÛÛUWHÑ7uI	ùÏ?\r—ä±Xı˜Òï@®öY„1Bñ}.İVêFáàBšFâæÙb\02½¶èª$¨¡k·/sÜUKı…´²Ó·teé 2[[#%E)kC°ê£sé}á³zÁ*¡´MÎB‹‹\0‰Ïp­|¸$\'£Ûñ>G;ÕÇjç`kEï’gDÓHF*‡ƒ™ü«Ú$\Zx‰³]+µ^Ï5D±»0ßôO’¦ŠCöl=ÔÍı\\0Ë\'r\'j…Õ‘3«rÿ\0öR«\"lmî¸ñRÉ5\\h@Zø<”Ì¡›ˆ3tÄee§®eH&ÚÛDl$Ø&ÓOÒ-mS¾L9/b–¯Gİï\'¾*‹J,7xráÿ\0W¶4ò6Yr²¿š,iÖ;«ö-jÇÇe´Ù‹[/E¢²³‡ì®‹¼Wå·_¹-É­	÷ç°ç«‡c¾‘7ğ!UWÔû¸^J§dz9‰”%ÎÔİ^¯5lÒË%· »3ä§6ç›¬,‰Á){MÛÖÉŠyŒ†K=øµôT¦İà»ÁuÍ”U¥†™çWq•=U%;¢tñr‚zÚjš§ºÂlm5?FÄÙdf,wî+í‰ôóîª¡m°•FÕ¹ÛÖõ?¥©½GA|’7œSa¦§ˆ‰0õŞ­Ê}0BZ\ZmÏ5K,PÀ9îàêáôU1Eö¬=ÖYVÃ(½ÉÁqâe;ÅßU7ÙFôvÎZ4¥¸Ï‚¤¥9H¾}‡Ì©*¦ûZ·7©ˆxŸ™UtÙ’¨õb¸ê´ş%ş%q«¨/Ç#ï“|“ú1±°1îë8kÁQQWŒG;÷}NòuEÀb‰şñî=g*N‹¤¸tÍŞIm\\åCA3®àÌoÍRµ‡ş\"qpy_ÅUWÌç?s7%c}úÙçÁ_Sÿ\0Pî•¯¶˜ú­UXÎ£è.—§pÅœ.:‹ª söF<iÉROQšBàOÍlÔ“L	uôî„ÇÉ\r–~®Z€îCÕ\nŠšœçLüYùd¤ÇNçnåÉ1Ô·•˜ğ—l!ş?²}ePÂÖÈì7ùŠd•\rÃÏ‘·*jÙY…†Rø5FÜû\0y9Bˆş(ì­~<—/]–²È¬Íÿ\0Eªæ¿e{¡ç–jÁ[’çuoöZi³Ó‹^.ªóñ{ÙÍRÌ­ÍçØ°rcG@C£a=çïe^ß¶t[¸ÿ\0UCÅËØ˜~Î›ÿ\0ÉLb\0>l±8ècéÈ’Kab§¥v>G½=ÔÇ>Fâ\ZÈ¼póTı†î‹ÿ\0R§\'³n¢îyQ©¢¨ª;H3b{ë1o‰ëb\nÇd~ÜY»üÚ/nu}4tÂMåÃ¼9/lqÃ·mqºJVWÄö—ÇfîqºöÙE€»í}-¢poGM=Ev(àŠÂwŠmDÎİÅÖ—NavîŠ8^ÖåŞ\'ÅC0f\ZzrÑ”/ñF9ÕXGU¾i¯„½î~r‘£À úl[¨Ø\ZË…\'Etõ¬sñbbm?FÒáks2HzÎP³£asp‹=ÇÅh´C(tlt3†³6õşešO`i«˜[)=ßDØOg–É!ÌºÊ+C»l,ÀÑu+\0š9…œÒP{ÚÖ5‚ÌcFMÚ[×²¤—\n½¶jƒÚmctÎ•…ÍdÉÙã‹šı‘ X<·¬Q	»ŸŞÄ/tÊ©%ûF¦]Õ\rÛ®ĞHW:_µow-–Cw8Ü¯dŠ{4i–hÇÙóFj‡—8óZllÑ;›¡2wÔ¸º>êö³1Şšêõ[Ï†A}3Zñú+[DB¥<ú¼ìÍdV¶Y«g\rjá[šä¬®<V¬…¬¯dnFêàê®\nñ%cÎ\\zíÏá,8%wıßá\\z¡’gŸ`¼†İÌp<´ó^ò^uq)¦yœü9•\'á<Á[Ç¸’sÌ­ÁøË|—ØLö_‘[ÆHàãó·†G¬eÙœõO}l‡›…²k…{[ú|Éğµ½g\'Õ6<-97‰ªn(»Ôñô4‰*œ÷èòVsìmn,¸mÁ¢Ïn½û]H.ÁÙ\"/dE•3¯k?ıöÛeöŞ÷¿[-ª½®êø+Z÷Vµ•¯²ÊÚø.WÙ¢¹W²×²Íd~\"I‰zËÁeıVœaË%~Û.×^Ã!³^¶_à2ZqçÃ¢xæŞ,öDáä‰æ£\'å‘\\ñæ/·=™”A¿%ŠÅešÈéà­kz¬z¬³Ù×V*Á+sY{ğê´W&Ë#ñWä§äyØ`òì\Z<Óÿ\0«°Ïn{,„q‹—eª4õ1ápÏn( •Ş+±¹§Ì-{tZ-ó(&Ã®mYåğ¶ìï¶üzp‘¥òì5E¾KDûx9sì¯mvè­Íkk+æ?Usš¸ÉXçà®3YÓeìµW²Ë5ä½EZùí±Ídrà×á¤yğiSQ+ P›ØF?2“×n«%jÖÊûèÆ•5-;#°ÄlöĞó&•O%#ct¦ÿ\0šÈAO{Ï$èªÆíç*4½€›b\"ä¯b¦êÄlóo•{\rF6uKİ›œ¡¡»æŞÀ(ëïi†ÿ\0—eõ²§”:ÒÊë-Ñª	ëGüCÔ¸Í2¢¶¶*FËîÃ…Ë”MYt¾Y4sQ¾*ğbsq>L6°O·2qO?rŒÔufgJâ]Õµ©Ÿ{‡º<Óê*\'q… —çÕUCÜsîÕ’Ï°±YpçÁ®Ì»[+ñ5n<Ñ\néí*ó`<6WÛ–ËX’±>{-k+Úë_¢½ŠÌj¬²WµÕ¯å¢æ´µ•î¬Ô™ı–—ôW\nú-K%™YìÓá§?‘Ê[xØ+l·%cÇõó§[†0F†êcø¢Š!âå¹iÊ­å3Ã\\r½•EA7–cÖ>¨H{õœºK¤¢7ğg \n8Æv7w¢1Å› ´Øİ‘ª“/Dæ›$ÈÛâë((½Š)‹#¿Ú\r´âmû£K)Xáh©İ‡É­Wdgv fJ.‰ˆõ\"h/ÍWÕ0]Ï¶Ø&2¢<%ÍÄ+|ş¥8ï:ßÂöèÉièÛ›²Íşen©Ã=QcÅˆ6à×µÏ‚Üyv\Zö@§z«ñş«Ñ<Ní\r–ÙešÕsX‡ìk5’±6Z®væµ²°?UÊü‚±ğWğÑ]¥i»9¬Bÿ\0ªÍz«åúì¸ş«<¯æ¼U•‚ÿ\0Ò½–‹\\ıUÁY	İÍ¶NÜÈk±İ„^9¢t¹¾Û-&ÑÊéN¯/Fjh7AÙÛÖöJGÉ7âÅk-üÛ¿Çw^êJFQŞY?æM6úàGS2’w°êäö>-änÕ©ğô]txûÏhë/o­;ªFf\\O{È&E0Æ:‘3ğµAÑÔîã®ñ¥Öÿ\0Ùã•ÃL~i¡i3GY6¢-[i„a`k¯„\r}S*åÂwY± uB}Læï~y`¥p\0ój3Ï!{Ï‰B\nŒ,n™b’­Å§[M,˜16ÆÊû4áÓ†ı®}½ø‡’}¿hßÂ|”·ïØ_øW9¬ößEvE ßÇ5}n¬UŸÖKOªÉbİu\r®¬sÙbs.ğV²ÏùYøy¬¶ØÙem—µş\nüÜÅÿ\0í°“âŸëØGotO\rï¶Ë.ÇÈâ€•—]¦œwís‰Ï±(êƒOÊç,Âµ¸n6ä­ªÌ«µ×i\Zz¬Çì¬rıgÉjé³-kUÕÍYÁi²Ë=šü<rYDÁâ\\¯}ÑpÊæüy¦‘áuŸ¶ßƒ3ØgÁm–5áÌ++Ûf‡è¬ãèP¿ûW¹wÑ{—ıq;è½Ù^í{¿İiû­÷k7û‚ïF?Ôz?î^ò/î^ö/î_æ\"ú¯ó/ó¯óı\nÿ\00Ï¡^ı¿Ehÿ\0Åg?ş+ßÿ\0à½ñşÕïœÒ½óÿ\0µ{×ı}ÿ\0Eÿ\01u/úğfæĞx³WY¬WÕ0§ƒá\'ªË=™+%Ïf«\"³=¨`U•ŠÏ5uÿ\0¥˜·¢åú/ı…•ŠÏøY®^‹%™Z«é³šÓê~£ÁNÑââTÚ±]\\”Mûy1ßÇ\r‹¬¿Ìş•HşÕïÿ\0eş`j¸¨·úU·÷ÿ\0JÎ¢ßéYOÿ\0ŠÎcı«9Ïö¯~ÿ\0í^úCş•ß”şŠØ¥_óOê´—û–M“û—»yıWº?Ü½Éşåî?uş\\õÕ¥gêJÊ5î#ú/qÿ\0J¶ê/ì^î/í]Øÿ\0µhßÑ«_Ù{ÅïH^ıßUïŸıËŞ»ê½ã¾«¾~«7ª×f¼Vø]v4ùpê¯°%o%¿Šœœa}–>\në=¹+ãny.jÀ+ÙrğW?Ê°ÎêíÉu‰ú,Í×¢¾+/ş–z.ª±_úW#öY®ğYŸ(çÁOäJŒ_F\r„Ÿ\r¶â“Ê7+™ñe²İ»síl­Á†¿»sÙ–Æv\r*ç’aüÊvó\rì´Z«®EìˆU}—Z]\\”Oò¹z/ır5W°V!b&×Z­oú+ÿ\0%fè²5_¢ÿ\0Ú¹jÉ\\Ÿ¢ºËá˜Ãá\ZËÁ£øWGÓ±˜ÿ\0Ú<ğçØf8³Y†Ëe»ğçÁŸœ\Z&~½ƒ¼—¡OëËö{3ËeˆÓÉ_eŠ¶Û·øWÂ­¢¸7ô\\•ŠÌè®\r•­Óg;¬–«š×gT+û«|à->\rhOmôÉjŸı=C¹Gşû3ìmØçÅÛñeØëğZö¥ş#Å®Áê‚>¨yÄv[‹!¦ÍUœ?u‘W!]¾!eä³Yd¹«[fU­˜Y²ËõZÙZÅX¬–j×²æ³fn½vh­¯ê¯—·\Z8òº$Æ¨ùûíÍe¶Û4ÙnÚİ–ce¶eÅf4›r0ÅG&İap·†{\Zùa{Cû·n»2Z!L.s²\0ÓUzf´Ù}åƒâ*H$ÉÌu“\"k€Äm™Q™Çosêö‡Íz;°¨]ªaø˜üxòÙašº½ï~EgÅ‘VÙ‘Y«İ\\ÿ\0+<Õï{«ìä²Íx¬òWÕkª¶«[z®u)?õOì‰>%Y©iØL|ÀYì×`‚Üy”\"¨-$‹äUû<dá9ìöÂËE{\\”ârÍ6´U²LFÖhOélØ[rÖ·a«İ‘òaÍIÏ‹~›[TÆ8Ï ¢¦3Iºp»‰ÕS>‘Ò;~zÇ`‰‚åÆÁ6‚æi,²ùŠTt„1Ì~Aš4µ¬<|“&é*áM¼î°·4É‚XŸ“^ï™gÏ5-+_‹µL†İÎ6\n)+œ÷;¯¦ÊV9ƒÚª>ĞMTõL{åÌ°7E¹%ç,6Í:¢Ÿ%·îø­ÛGXºÙ7°–ÀìÜªGı×!rì¬;k lmnM±[ØÃZÓİ/6º4õ-³‡#±•FHéÃ»¸İš¡ºîºÔGİÇâ™M ¹—İ‘ó-Ã«â6¾é{bò‚GÑDóÒqºfœãTøÕ×F»ò²e_IÕ„¹±­¦×PTo 9+›\\ı×Í’’·¢æî{íqSWÖ¹Û¨Í°…%{#›rpÅ¢8t&Èƒø¸uÛ~KÑ]Q<øºßQÅ–Û^Öáæ´È,•í®Í4Ù}–y,É+[~ªúİfl½‹ÿ\0¥r¯ªÖŞ…dAW<Ö¶Yx,ÿ\0sğÒËo™åX€}Œ®/nÍ6°«“%š²8†Âú•bpèåî¼ä¢µÇcs5»Éòºh¦ÃpÌ¿uhúJ\"ç¿KwSQÒQˆwÃü!QÛØœl£!\\a–lÚÀßå‚f›gÊJg˜İl•ôš·/ô¦BÍ\\l è˜=İ3zßÔS*z^¯u¼î1º¨YJâè±‹8©ã–]ÛKºÏ>\nSÑõ™#*öù¤¦’i<>€©)op3o¢e4YìFg•¦ÅäüÊ;xDº2!&îû›d\'GR´¿ÆPT%P>Ê¸¿Uş\"@2cÆ½¨ågï$ä‰­ˆ=±ú¢Óò1 &½ùá}…ÿ\0©S‹óşUÿ\0û\'t« /š\\ nÿ\0©P““ß’Šİ&ïşWü§aşJ¢)m$İão%]Ó­8Ğ”øê\'{Æ«jËnêv’Õš¡Ä;Dù*¨4pÙî8œP•ñJëèÕÑò8ÜŸ?%KM<æxYÔ¿ŠÜôÅPoS«\'0¢4Õûâdh-·‚1pÆÇÕ]ï+~Ê™•ĞÊ@©„ÙQRts\\×Dë5Î)‚jÉe¬\'–W²®ZâLuÄ¶*S]|\\òV ¦s%¾¤ªoÙPÕEœA\n«–2p]JĞ/…÷Èy®„ânYy*¸æˆËıÕ³O¤ è™bˆæòB\ZH]‡æ-OŸ[‹;Á¢’ş>6ek*?)GóØØğ\\+İrôV\"Ë0µÕ]e²ëK««ÿ\02¬VeYXlÍ–]eqû+“u’¾«’¸øW¼|¡=÷ù\\v50~½‰ó—ı¸bş¤ÖßHÂ¡J_ÅNIùSñ\\¨Àü\n&H:ïpÂªeJAi†„))é_#œìòlÓ)ŞëuîlyEÙ±MÒ³_wLÛê(M1ï¾îPÊÖ“e´T¬sH±0§Â/w_ ªÏäO¶\">I °¶\'O4[dï0†y¡\rhÂâÌ³EÌ§yi—+edÉ\"ä{xªVM0°Í—u{]\'^•Ùåò¨:9¦ÒÔ}´Ê:f9­2\\”:;¢ŸqŸz÷´ŠY_óÇÕ<“+è%ahÄT\rMy0u@Qô„7gjSë£;ÆÌîëFa2Bë4X^%O,CíŞm%šª*Ã?â%û67Åg¿UMMSQ¸taUttï–^ëËš·‘Vã.¹{rR:\Z†ÉíëİÃ$* ©¹ğë÷Q¨¤®i2:ï»ÖG†ùæS(„şäu5ÕS¶­äI0õ1f„Â¡­kFõN‹üæœ˜™ş#úFbÀ½–ho‡¹f÷S)+˜êÍ.ÅÔ±º\rÑ¸ÂÆ¯hšÓ~<!GYcãålıV6Qaü×@ËFA÷ÏøX÷u¹¹{9¦ha°F ¼„¸•i ybr²&\02[ºhÖë’’JCun\\eé)àÂqº”ç6…Ïı0±ahôm¸dôâ×aFÊê\'	Ge˜Y+‚­ÁÕÛkìÓo¢¹,Ö‹5áú`³+UŸŠÖÇÓfedUÂÌşQ•!?YÁäµì\ZOŒ¤şË%İüĞoî¨åš—¸oê·RXxXè›©¸OªÈqêL”®mªŒº‡zĞİ\n”áî·AûŞ4y)õ®†I%~·r¨¨l2ÔjK´_åå·õ¦ôttîsÖÕbm;òÏŞ!‚öæäc0ƒ~en™@ò[šjvµ§=J{™yÏTjÄ1ï\\-|Ó${#&3vê½¢Hb2,Fô ]‡«ùV	\\ÒÓùBÜ	\0Œ|¸BŞLüDfÕÔ}¿Ò¿Ì¿ê®j$?êVm\\ƒıJæ¢_îYÔ<ÿ\0©g3¾«¬óõ]óõV\'n«U’å³Ÿ|Ùn\rvâi²ë9ñob¦êèù95ÜÇe~|\Zì²É\\.Kš¸;¶õW¾Í6_ıÖ‹%bVŠÄ.Vk-•Ú±H9ì·$&ö1ê÷v[ØIÒëu5D…§À»f[l²ì9ıá}—Oóiá×€‹ SÚÕÿ\0mş;…›vX›-oÁ¢Õh¯¢Ïe†‹?\r¹–[?úZ·Ùa’Õ\\<vºqæíš«rã×e8¶¸¿•–ËßnŸuªÕfx3W[óÄŠÙqgÙæ­e¯kª×f½Jı…‚8]RŸûMíòW<69ìºæ®³Ée³^<Õí¢çğ\'€4|Ò\0ñr°ğY\'“Ï±¥Ÿü¸wup™oİ±²’`„9©è¶Ù u–»9£¤_„F]aÏeì¬¬E¿E\r\\„}¶	Ï¯‡µ€Ãt÷DÜ-.8[ÉYŒ$AX‹Ynw£VğÂğÑãdÉœÀì9á!Pˆa»œÒlÖ¬3Âæøš¥®vğ”l\rï-É§”<ç‡\n1EG!-×$i›M&ñº‹ Ê¨°ß0¤–SrĞü{5ìuøçØ‘ç³ÕS;ËıøórË†ÅiËpÚûrì<W5m5ŸÀZ<_tÀ2ñWTãçØÒ·şÀ<1YLé¡l½|8\\ \"<!€áÃ’ô´ñ¥Ì3TÔ‚–Q8ğouGGts%¿¼‘ÁSº\nl2ÌŞ³\Zšz9073p¢ª±›[ª¦¯©¥¬îÄÕRCÒ1²+e¢©–˜Fê ë3Ê1WQ}³]‹N©Tó¶Éie$o‰—uŞì”‘nÚw’{y§ÓSSÆ,áŒÛ¼¢#-ëu‚§§èØ>ÃÊÕu·Œ¼h©O`d¼G%dÂò	‚’¯¤fC%šæW5ş•¸‚L-\09S²	0o‰ÖTu2fòå\'ÿ\0\'ÿ\0·ÅäµÛ¯hÜÑy¯Õ°óLoá{¿¹xvÚlËf\\:ü{3ÛNÏê)ŸÒ®Bº7ñì`i:BÁÂ*@û8õ%ÜHıæ¿*eX÷xCu[šƒmÃ±f½¨´Ø:ÍËÀ&TôuUm°“d×º£y-µl+w#å-:‹()¡!¯iÏ¨èéßŞğœ÷ô•¢eo)]†£‰·UEM;wµ%×ê+!3v:Ø‚–g¼`îµFg9¸±ıV8Ä¦úw}T5áêa4ÑM[¸k[ln½§íÎ¶ÍA,Äâï¹Å@è&|-¶ó&P>±¡Ã­qÍIÑÕRî±nr2¾ñÅÖ.$kÉ2¢:¶YÙ?¬2Q>¤b@Ä]í¾ç0AñG£[{æH)Ía¸ám³N\r{\r8Áºxóì,Q	 x§²úKşßŸe‘Y¶ø]TMåÓÈl¿dÖòŸÆÍ»7pÌæƒÈ¯óRr³ª_ıÊÂ¦Oª÷ò}U›S/÷,ê$ú¯órÿ\03\'÷,ªõ]j‰«•„ïªëNóş¥‡~ü¿2ÊW~^ıÙù®ùú¨ê$7Àt%\Z™e¤æ@*:J&nà<ÎedvZ÷Y™W]¹ğÜv:l×Šÿ\0½{nI™øª†òxş}µÌø4Ùe—·YmºğÙ–Ë…ÿ\0×ÀçÁ‡“\ZòW(C²på„~ÊëU}ºöW\'.ËOˆÏ±Ó‹^_†Û3BÊüÂgõ*¦_åaş~\"ád85ì2øM6HNv-²!X§zpdx@æT™üÜzvâÍeÅs³]·ã¿ÃeÅ¯i¯ºaÈ©?4?Áø¾ê˜ó•ç°Æ!ÍíRÌVª÷Ù‘í/Øß±¶ËöÚ+|öéÁ’ü#°	‡’°üHF|bwc§i§m{ì·ÃHà5£³è;ç	Ç™âÓà³Û—]…ø2àµ¾ü>‹-¬$|½€!]m\rÕ+GÇş?\rªÏ¶Ñiğ9¬¶|}õk°\\ê{O\']_mÖ]†K5sÇŸ¸tøm;=;Hı¼a[™GÄª9?î´}~öã·aˆËd¯>qN#ğ,6LÏ^\r8XO€qı—U…}¹lËm»;v9¬†ËÊ÷Wì²í3á·gôÙŸˆ‹y§³Õ1å+?Ÿ¸5à²ÏgÿÄ\0)\0\0\0\0\0\0!1AQaq ‘¡±ğ0ÁÑñá@ÿÚ\0\0?!M@9÷ôD	($¨‹	b„Ì˜„ „b•669°TˆH\nŸïCa0èV—Ø—ßLXmˆ6ÄÖÙqäXGC“¼ğÎrŞÂ(ùú>øyyƒ$Êg\'¯fØé1»\"eÀh\r£úC,\"™˜„%¡ƒ\ZĞ„&	¢\r& ÑB	1dL„ƒ¥j¸/°…DˆLÏ¢‚ÄÏMQ¾6+Nğ?<`;o’K÷‹‡a·±~‹Šğ±pë8/ø67õœ/Ñ_E!Ş(<%ì]áG 5pş<[!ë$ü˜LBaX™‡xï™›\ZÇ$!%„!‚zÄ1ïÀ8/A3éŸO9¶=¸lv?ğÂaïß´°ƒ‘Øø;)ÍD>cåc_B™xKr!HB}ƒ „ø4‡‰õ¢è„)Ñ¿¢1ĞAı¦Ü$!0–!	‰‰ŒÄÙL¨BËDÄd&!¶LBz+H~†ùÛ‹ô!1B}3ê˜³£ü†{@û‰¶Ğ+ñ¿Bş&2ké˜,Må!#¾\nB‚àŞõX‚C¼o$4\"a­±À¡\"”„ ñ\"kË“¡DÂÂŸA›¢ë&‘´$, ñO¢¸„!B˜„Ã$&0X„ÇBääB“€oÌ;YöBÓ˜²ÿ\0Á>e«x³ÅÂo°	ğŠ|bÍÑCNŒfÄ!CˆÀšÂ—d|df¸ğYšáèFĞ§(n3§XlãÀeC+òù\rLiÌco0/à1 Û9“9`&ŞÁùÁ<\rn/D×Ç†˜2Q°›\"§£<FiLZpc-\ZEF}Ïtï8YÃ˜V^Ğî¨ÓŠ]Íºx#è4S±ô>JR~£´¶íˆB ‘>¾F„LÂb„\'Ó	õ8 ¡Ù1-ÑlGZœ, ³2ñ6H¾“Ç+sÔ_ùÀsHÕ#ìrÃÂ	|¤Zca´\'±VÂnğ\"èA!­‹È¯›Lë‘	CDĞ_S!\"!¦É™àƒD±(5Â„	„¶{\nùáÓsy„ÆÑV“—rg€|@}b.Ï$P)Î¯¢“c6~§íô½B™˜„&ÈB„2ñ	²A‚I“„ ¨¦ÓŞÑH_Zÿ\0úcCıÃøGæ¿A.Jœ‘ùK/	#öğøÊËÖÑX–Ç“¸z)À£x)+è]<A›Æ´³Z+ÄÑ¹¶u…n¹ìßÒØ¥Ğ‹°[xL\"İô-?ÿ\0Ïœ.WÓ	˜ñ	™„‰ˆB„!¿¢apL%¢	ÈAtzr?càçí\n		ƒ Ñ1ÄwpñÑÿ\0ÈB\'ÜÕøa¼ 2¯ZÃjÃ}‘}i\r«‹£¡µ\nC€ƒÅ:ºÅ\r	,¹LO16Uñ\nš;4QÆTs\Z§DÂ!¬Bu‰ú,xBqâU­1~PûãÈäXÑ³„Ó½\n~Â8/‚„!3>˜%˜BhÙLBn1‰ˆB™D!±]ã‘ĞsóŒ.p–a?ÆÆäv^†;M%Êÿ\0,µå_Ú£b”bäĞ ş‚Úöèe6¼A/F±,R¨&åèA4Ğ¯¡¹iN„›¡ïÆÇ¢œğ)>YÓ‡9r8ìb°ÈÉ¤b°9bFĞù›(AxR…\rÌö‡d\Z\rañ‰¤S‘a3&ÂÆª’\ZL°kyhm„ögDÄ\Z0 GÅâB}\rk0hëè˜˜„Ìú6Ba¬ÌL,Q4CÖä4pÛÿ\0À1!\\‹üsnpë\rìğı¶Åúü‰`Lô	\n‰¡klû!Pk|¢ğx”ïÈø	øiÑãyü³¨”/\\›`¬½¿M•‹‚¨M›÷ô‡ø×\"xNÑiW¾! oKœÛ¹şó\"F*F¼&l­Ûå1Ÿ>S„¹dâZmñ±ì’‹¤îÑ,îÛ®¶\"Â¦íËaÿ\0-\nr=-¥÷<_?4’:óYDêI?}»,×Ÿ3RÅå–Ñ‘ó¸rØçûÒ2z|]¯:ğø—-Ğga&/¤_± ?²>¸WÒNÇœêÃ®Šøª,rY%ÚT\"¢{x_,¶=\\fh¦µ¾#8ÊŞÊ•ó·ø[5qk†.ÂñÊˆş&?É&EBÍ–àh¼6äpÆÅô©ò±¯¦lŒ$¤^ˆ¿$!)b}„\'Ó	‰ôB		30i‰E, >}¡şD!üënGc´ôåı\r<ä†ëò\'¤Á6†´,LWšÑÀÄ}â¨«¬£ƒ=&øØ2K”¥Á]myL¸¼š¥ÍÌ,d§æs¡_Aoğ6±¦–Ïğ-Ğİû-Éød‡ˆ†\\¿g#ØwîìÜ•~¨Õ¦x?²»ãµ’h•¾©P*\\Øùç|ƒÎåÁÏå(M‰Ó‹z‘a[^à,çÿ\0”8B]KÒ=I%­õÀıåzcøû…r×Hn\Z³\\Ä÷¨TÆkå•¢vşŸÑÏc’â_ö7ÙïòCJûRàFü6YÏ!¨WE£~áîƒgÔåšŸÜxš\"<È¿Ş?ŒÊ¼(öÑ°\ZíZ&ß¡¶ Ó„;L•ói¥©Ø€;ò‚§¡gKc×Êè¸£Ğ¢6¸×ÑĞ×èP±À ³?àˆ™˜˜˜˜„Ä\'Ò‘\ZÄ!>˜B	}kOéŒœíá1KŸâkXF\"è>×_dÿ\0a›ÏDJKÑY19?!­!ÊÆÌìLm–#lMƒq‰‰±ZÃ<[AE|H!PwĞ–m¿-ª>\Z;X\'›9àT”?P°±½|mµğ_—óA_á™‘½¡Ò‡k³Àñ‡ÎÊ‰»\'uœœ	^²O‚R‚\Z¸SÌÛyˆ’à=I3ªQÏŠ[‚aGíM1$şÂA\n‘&§£±›Áğw„„ĞĞ>ªÍAFmï…1BÂ_TÌÄÌ!	‰˜B˜…ı!//±Æ‰ùÇäH˜/¥[äk¸cÁ¡ú\rı£cşEÆzp¸¥±%‚N”¦‡ë±òiá=á\r0PJµÈÉ–Î†èSœ!£…ØÔ*Ù‰…È\\ŠŞAâï\rln!©Á5q7šYMœÆ„mgÏ\r€Ÿ`Å:Î‹´_¨ÁåÇùg0„\'Õ	¼Ç11ÑBbba!¢	†RD ‰…¡šà.\Zã‘ıç‘_\\/Ñ1aôpÇ¶Ml/Ë\'2‘¿cè~û.ÃÖAşø)^ÅÑ2\\èpı>z$Ç#{qÍ\rzrX©*F›äğ»bE<-Šœhâª&M$ı‘ödÛ£C.\'1)ÃTòl¬ªºQ®»4•¨•e‘CÒ×”Ä¨N½“4i®wìF7J2 )®M²Ø!^~˜—¨®…ÍNqqˆÔÆY{kG…?câwà´–„ÒI­°[åÁü sBí¤:tö0…g4j³W9èåÓäƒç€²Ì6OA-!\"‚{È %‰ĞÒl›9ˆJ?#D´Ÿc°OĞ4MQèÃ#Lã\Z¿«	¡şÀY™„ú!1„‰„ˆO¦0ŸD!BÍÈ¿Gğ†Ì×ó1_BúgÕÊ1l>EyÍøBµv/˜~æÉ¿#gÛ•Ï”2NØIv¹£î1íû‚\0HI­±—“hÏÃ4ß%Àäj*†¦Wsîß˜_ÈĞóôKY¿¥˜‚v-†“î9\r¼ùÌşlrM`´´O1v–‡ià³o7Ş]@&ƒ›<û·pEgTG§Ù§Ó€É¥zò:‡;ÊlEZK|14\\\\*¦ˆxĞÙ¸Š©\Zì†mUÂg¦O\rG¯ ¿O•(”Â	i-_qŒ¾×û7RgrÓÑ{\r/ntjƒÆæ.³4<¶ÆßÁêª“ÇRM¸Êğ÷ÓgrJæRÑZ ­Kôƒl¢lœšP«ß-ûdğ\\éAoò&ßïÕšüøãÀ¯ä¬ÕÃùÄ8ØÎ(%´Ğ„>òcO\n}…F}Ç›ü„A(YKH„!3>©ôB\"}\r	ˆ$>H5OØ;d<ûˆBBÂÍÃúùÇ˜‘ÑıÃG’¬à]µû ğøÆòGˆ~ÆØ6le8²#	Fxk¸¸ØVT¤ŸOË Ï;é¡§BçiğˆRl¥K	1•ÿ\0œRrj~µŞŒR†zİ‰“0áqäOBhÕ5£*D»hu“/ì\"÷.‚é¨½ŒŒØcc{øK#¥¡éÒ}4e4µ<ljx\"?‘OUO¸Õ7 Ü9©uYpFë\\šp=½,Åû×úûU¿-Œ~C”kÙÙ‡YßÉº!Âî¤Ø¬İxñĞ§\rïl®¥xş8\"Jş)î’`÷1û¥z÷ºåW´DßÁt²Ñ‰‘xB!‡’H‹IªY³‹ªpN‹¿1ÚZ×ba¦ıìnô­‰âMkWHOFXäç¢,á; kCĞ7¡@sê|îÊìõôÂD!2Ğ‰„±LBb˜˜hH™ã„ú~|4Îf‡u…øB±¬Ï©eê7İtN\rœà[x¼±›§†‡\"èl¤F‹ø(öß¶rI¨\'›ƒùBş£a!NøEkÊ+$JÁ60œöä\r/¦æ\Z‡÷a/¥!6¶Y¡¨iB!¶Û¡Éâa,!w…†p‰Q.\Z\Zbş1¡ì!2,Üı…qÈ~QÃ„±˜Kük„úX‚×„&fÎXëìCŠÅÉúhNé!D\'Ó?À©¶ÇØÏìğ%Ly@&vvC¦,zÀÿ\0ƒm1#a-„fl£dĞú3<`‹Ä&×NÁ[ÂõòD\r/8>x&¯	-ò-$3áœãË}Â£Ñƒë¡0«ÄsYŸå1\rV9l‘B—pøZÍcE1¤è¸H‚ìPï\ZI›!«Gûf[§bCà˜$ĞïC6úÌ¯¦0„!LÆL$Mâ\raLÎÃ·°9!¥ò3ÈĞ’t4+…õ<Qö=Œ?Kÿ\0Š)œŸ–\'è9öoè¢{#ø\\„×äA$÷GÍi/¹eŸqÇĞû\"»rl¥\ZTÑû„)“Q\'bØ¾ø¤JÑSÂ5âóKªĞ­v-¯3Üå\rõ0{´\\Ù;”y\"ÿ\0èv¤%‡µzâ8)‡ïiİ­5ß°ÿ\0ob—j?dA@×U¿D8¥­×	Àmñ\"=€¨Lse¹L*#›]ºé\n‚<}ìGäv	yH‡ÃGÒ§¸¹3ÊºEˆº“PçìNybÖwyH¨i\\Ä­ğ2Mæ®ç† M¾M	”ı47æ\r‰@òOƒlü“æ+§/côê\'I|ösHùêÜØñ†¨W©­ßHUû	PÅ‡-¥aûõ&AßEösèvMÛ\0à¯D«Ê©3¾…_Ôï³ƒQ„3”]¡üÑ’øc. \ZÂÄ&a$LÂ‚Z!ØğEmı0„\'¬B˜„ĞœCêgä#Çó„!ébà˜mã\Zo–a|p9h}<§tÛ£\"{5E¸Fı‚P<ìˆz‚il°ı¾cÒœ½I{°jãQô%	ûußàbàŞ×^UïîŒ­/Dm>´Ä8%ñŸnÃf­7¶8Æšˆ\ZKöT})õQ_ÁÕ&MO9\ZHñö%ş¦Æk¡De,|§à™5&†4Ë%èn3PH…ë4èÇİe½eÌ~Œ²ä2ìYœÈ’}ÃÇAøÖ¿átSá­SîF›ÒbºÌo†²`ª\ZøQÍ=Sn\\Qcf¸$ÿ\0ÒûšL‡ß‰>CDÇ®«+GH½65¤r!‹ŸòÓüĞ£5g³„¬‚ÅQïCpÒ†^Í1{3®M*¹£¯Š/d)aªÔk¦TÓÎ=8¹8U]µíÁâhÏbà¼á›¤ —äŞbxšı‡0şÜ‹™HKèŸD ¾©‰ˆ%DÅ¯6|ğ|æh˜†°İàÎüm|†õ\0HB)OğÁ´ÇÓQ¼°~YTèŸ¡^Ã›ÌƒtRõ˜4 §ì^,:Óÿ\0§ÿ\0ÿ\0§ÿ\0ÿ\0£Oü_ôÿ\0ÉÓûÿ\0öç¿éÿ\0–ÿ\0¥¿ù÷ßäş¹şÏë¿ìşùşÆÇ÷#r¤ÿ\0¢“WÚ73A¤š\"AÈÔzCF%ô\"û\n$-òŸE[>€ëêx5„9`w»ƒ»öÎö<tûPïco.(–Ñ‚š\rBx	ÑÃWğnñ¦œİ{7çX¾KH<“‘ìçÙ½{´\n•Æ†|²4ø\0ÍüŒ·À£“ÃD°>$szä<vzÏèJz?àUd&Ä0Jqv<?	é™ë3ê„X„!4A›äd8ƒd ‡|aşPYÉÎÎ˜$‘?Á>†6˜ãl443ñ¿,Oü ĞšzG—²©YÂ\"\rx›‚lvf“\n7w¼4¬Øôt\\#xèë&²ñÀe/Òînò™y.±1¸\'‹™‰¡¬$}ƒ²aC@jô.	tç\"ÌÊÄÄ ˆ$AN‚Tr ¬CDÅ-‰Pa-ƒB¦h\r\' ‘´éM	œƒúé¢B×>¶hxF1OéÂ\ræìrá×İŸZĞœašÖ\ráBcàğ}úş²b|·1	*Ôšô,Ùú3ŞÏÃY9QJ\rá½ÖÍ®ú{G9\ná¸¼qJ‡¾GM‡,>Xµ?-‡>\\üšµ©µ\n70úÔ‹{½Ój.Fw›š^Ï…˜4².µJàgø	ê°»Á¯hW\n,&ğ#º„İ	qüp‚T6ql}1~§|ñ¾öˆÄ–°!Òo¯3ŠhI¾™}\n4úa–_„$Y]hOƒòC°4%˜D$a ÷Å<ö„ˆ%ˆBéH„ÂD –à$ “\r)„RTvâ)ÈPìÅºœ¯àcƒ¯ø&^9ÿ\0Ã81è0øìkÁøÛ_tKçÛB|ÁœbØk™ªˆ‚§º^d×=!Îly+\0À4¼sãL†F©ZôĞó6=ÜØ»£5ócM£ÈÃ(­xÔFîì&ìÔ6Â:¹WÀĞ<nIª}~æï9Q„jôu4¼’Íá·B¾Âr»,gÙ6ú›~×„{ü“·é¸<2Ó“_6›8vêÕ(åx˜ô@®k7A@’mDø×lÛBœšÚß’qmÉÛp!‡D´g<6- 2Ö:ÒE¨~ºZôKÅ›ŞR¶~Ût´>ç·<ÉÏ\'Ãé8çÉ0~k¿ˆ¢+ş½¿,r@º”ßC\'©Ôã=Tªœàà˜íkèj-/wÎòP¿©Á¹ÅÖf½rÖiñèExvæÄ®ŠàíMà˜å±ê0xÙÅò\'İb ¼|‹¼èiîÀBÂ_B!¢acD!Má	\rpˆ$$éÎ	D\Zû¡¦@Ae/>Q´ï·¶HAs¡/ñÏ§˜æ9˜ÊŒ2•üj³lÀ{”ÕÁ\Z8õÙ¯ˆlDÃV\róÊİ5ìsgª‡>YÕ7àÔ\Zwg¾ şB_t85JpŸ	óá¯¹‡äYN´Lğ1³dövÙ¶º¼p%âzvş2>[oøÆÀ5áèw;Èhh\\\'€ŒÇ]òŠ±	µÛ_cS9ÍM/P©ÃšchÔ‹ñì´Îš¿\ZŸà{Í5ó	ƒäQè=ò›çRÒ_Á~´}±ÈòÑº$…t[UW#<}UğmñÖ“í_isš‰®Ä&“;uTÊ}1#¹OµÈ¬öÜ¤‘Ë\'Wx\\ı†MCßC`+½\ZFõ0¥=%½ú.‡{«C¢Ò¼?ê\ZTîá¡ºïJÄ1Cëœ&’Y[Ãküâ@_‰a-Ü§ÛxŠK<yDá~j4\'Ç]ùƒ«]JÍ<¤›;ø7)õË(Ø…Ñğ5¡!ŠOäæÚá†.‰…†²˜‘†°‘–$á(kbQôGÓ\rVH‚I®?±3…¹4{thúšˆd’ò¸÷D°¾‡‰ôÌòœCïò1œ¡ñçåcı¤ì²á‹ùV?±q±p¾Ã5LrØ\"±š—²‹ê»÷)Î\Z¶…„\"ˆÑ÷Ca&_pmÓP?›21¼ÃµÚ~†Ù~¾[\"ÅcúnÂ\ZÂ¾\n9•¥SæÀSÄ¦mÁ\n ¿(%}ôpÁq‰‰‚AáK¼¨ùúšà¸ÆòĞH—!ÈN5\rHœŠ`Çì$ì¨ğ+üs1chrAÕÒ\ráOc—ä|3²ìa,D	‚ÛƒË\"ƒz\Zö2—a±qÀÛ8aqÑJT…‡‚©„Ôç¸šÎ²–iÙ¡q”\\@˜…ÎÇ ‚	á[w¹¡=ÓüÏ!!\"a,(\"		,ÜàÖQø8X7½‚EªPA%<ñ\\\"ô-±\ZA¢Óßª4É\n†¤\"~Ÿj ïÃË…Xá\"}I…õñf–>ÃA‹÷µïT€œ¢ÅÁ3_V¶t˜¹éŞ‘¢\r!ÀŠ×C¼ZtÀ£`<­oÉÁ&ûŸÁmEÉ·×É$²dôê=’ùB¨î”’9à\nÍ#Äsp×’há…ÄÏxÈÇ¾\"­ŸCH‚[;ÃúÕx¢f¾±D‘1	¹sá„„¦‚$&¾Æ’iv¸\'òNK	\"bBØdÄbPM‚C#çcCJr$˜Ì^ÉÇ®Á´¾Ì›Wd»	uèMíBÔ,jbR.{~ÄY]\'	$Aa	…w’béx›sïŠz(ü˜ö\rŸ ¼4³Â¿X/çbØ^›<ç\0œ§ÿ\0ğäÓÍç‚Lnqúv\\±|¢Tz‰÷‘QH—öÒ\ZAÖ¬ÏW¡&ÙÛIˆØòx4+¡PVuØ}¸–t&şƒÎ‹—hë+à¤Ø]âlhÖ\n…1ØÄÖ.¾•ÎŠP¶\"şùÆğ…”HGŞ~CgÜH„TA	°ˆB	\Z¦ÄˆLE±ó‹A÷„EãbZ{Güœøkğœ³‹±×PNˆ®_\näşŠ„€éÓŞ‡‚¤ÆÜÙÖsC‘4ÿ\0øšqœ¿#CˆÏ3·Cû Ü7†\\½øÂ™Ä‡ZËùpÿ\0Í\nL½\nr|!ğlx¿À‡àŸjuÑ×D½$>ƒ¬r:¾ãklm±‰,ËVåbÁ“¶Çrå?³,Eì¢~„–|íş†q^n¯î„vŞIÛâ¨µ•I„°Ãù6tB¼:.\n**ñÙw„<Ì2bEÂäï.‚‚Xƒä%_`¹„…›µäzóOvÿ\0·! Ñô.rô‚X›\"¤@Iìhâ$QÖB>š…Ôh¢È/ıÕÖÄŸ/‚§J4ëî¨qhtÅ_åZb»ÂºÜgâ)!4¡	¦&&\'Ñ>‰ˆLúÄ660ü¥áû11ŞÂeáŸqâÇùGF…pô‹¡j2W‡²š¦Ä•\"è9¼´,–8cŒ?’å1<¡4M\r\"aŞBdÂ™gdO£[6„	alƒ?7ı…æ4A}Kf¿ÁÒ’#pRBWã	ù=$9â	W.BR²Ç<¢[‰	G–+O¸¾AKµäwº@ŞÜì¥=ÂIş@+C.\0]	˜O®}™ßq‹Ïcãˆ•œX˜x2QósğB ²/¡ó‰¬QaäJ5‚‡É»ƒ±d¼,ğ1	 æ4!dK\ZL1wôtCb4\\WĞ—ĞŸx„.RûI\n¿CãÙ—âğ„õ…™3$tQ]\Zğv;¬U‡#P›XVĞ\rV;]$F¨Z Nı¹„ë¶è`–·èeöéh‰_¢$hB	éè4ü¾GHP\'O“âĞÚÜyy\r¦H“€ÖGñBkŸ¡\"}P˜ë<Úg,ì»ã¯¸ï¡ôEêÀºú5Š|‘\n\r¾Ø¢eÙ}Øx—²¹‚¸&õ±a¡.EÃf÷GLT‚bäw›ŠQ­aÇdÃ&±}”£ ˆ&,Aã@·9Á\rGñ“ı‰D”45øÏ·û¡ëa‚ÂYBJòk¡>Š˜Bä[æªÀ&ÂşÂ´Â_1×ä_%\nP×ŞD)b?bb_3Ù~¨s]<³g\r.¹ è„ĞtEÿ\0~‹3ü3˜m1†ñcx ü¼tš_&ğŞWè÷¢-´$&<(4Æfˆ&ÅÖR)}‚fòà¬o—ôÂ¯z\Z¿U4@Å:b¢á ‘Ş;Ïx¥ØÄ5…õ#¦%¡!bºZ\Zbü³\"=óP+Æ?’]‰„A\"‚D\rh$.pŠZ4E5\Z\nX¤	=ÛbÁm‚q1F¦¦áÿ\0P,øpØ’¹¿,ûkb¾¢ßc\\n÷Ğİ@—ß^•’ºy}°±¬Â0˜‰ı<Ó†pa‡_˜Eå‚è‚ÊxGé°“ƒàŒ|}\Zo\nåCn”%€æ(ã=v>àå\nÑ&–z\Z›‚l%¡f\\¿m•!Khôû¨XkDPƒN&Pë\ra2Ä·”\\=|9E4±pÅ„´LnóÀÔc±Q!0B„O€ó€¡	cXÕÂBYKÄôAjƒ!©‰©{ÜÈdˆ‚tùNÅn=(_\"\'–4»1]lÚ!;†–ßìÍ×npˆßç±ûù·J}„ ‘2ó?ÁÁ¦=bi¼ò}ƒıÑ’Ï¡~ó¢! ­µğ‰­xÒTïB™\'ÔÌ¸ ±€.ÅQ&1õ[?òãUˆâ’èßzÂ>\n­`óÃ—I\r[c¶¨jum~K“»š4¼\"”\\şÄaËïÂãé#°j	Ö“óáã™3²Ìå–9Ç]İö£P‰^)½/“€ÏÉ_³\'Ëğ_šÈÔ€Ú&Š‹u¯¦mgLà¢Ì7àß?¡¬}ÄAbı%¡Q8úL›bèDĞQŠß¨˜\'E„Ê–ÅARöí¹¶¨ªÕè%ÇŸ—‘(;?fÿ\0’mğyGO¶Í?ô‚#`-òb KMá3ÆÒ!O¢}êf¦>™ûÃXòëÈm} ÎB&B¤=&(UâàC ’kcÚ¡‡ä£{MÚİÕ¢OØ×Î·ä\"Ö~\rNvHÕèÔ‰q>¯àífoåŒ³*9VÅ÷µ¢@äÉ\0Å®RÂ-’kà@Ó‹ò\'›ÿ\0bÚQGj$?­vyÒGHµû•%V®\\wEm9>uU>M2š™M=y\ZbÌ2Uò¢œí½æ2A«©½‹âÃõ«ìµ2QàÉ³²	á!r}Ê,z4Lòj‹B$%¢lHHKÖ?0$Ğ°¹\rÄ¿\0_´ÚZı!a\"”°—²	\"	ÅÈ´ù	0#¢º:ÿ\0èGÇçÂ6úbÜÑ|ˆvÊÃ¯ş€š]9è	$Øİ¹ÄÃ™ŸDÌ\'ø81´ÆÊô	çŸ°Î«¶ Å~áö\'d9Wàà}¸{ı¡ÿ\0ÈŸèj™á¿¼øò_xmğÇ<-™ÃcüJ§vŸ§›¯´%èÉ±7ÈmSìÛ#Ã—h†$ZRßKçü!ü[‡áŒ¨$zª÷Ïé~Ã+yL\'rWğ:¡Ôù‘ÄÁÂEê\\VSò„İÇt~Q¾%Ûğjt¬âÄAE—ÅLò-„çè¤\Z&{(Êüäû“+éMœBFï`¿,%ôV˜ê8r6†-Ü‡!|}„6Û ‘¡V-â¿Qğ§à[ô`ZğòÀ%¾H}ô5ùDb<HXòÇS8Œ)6O§œ<BŸçå9Na¢Æs†¿o-òÄDMlv7‡‡DÙØ¦9ÁX45¬7D¢kÀØObÑÁÀ«€t­\r‘â„X.#³HßĞŞÂŞÙ42C£S*„´A,oøv	¥…*!…¦+ã7Ú\\qğäàZ$s6%ˆp¾àô¢tôB²¤Jú¢I…Œ\r¥Ä]¼±Ò„#lDxŞÈä\Zÿ\0\nõ=!=½ˆm\nß¢âO¡ı„Ñ13¼Be‹öq?§Ï‹€ßf|×’bãò\'·ìAÑ †ĞVÚÑ´ÑCã‘‚	§DLë	¯bŒ„\rbb F‚çèˆ¹¸I„¶3b&ZÂÅÏGB¢…NPß€¿r;‚ÇAxirBY™V+ÿ\0°¿!)y«f¯ Ò;ü<\nv!ÄW¢û¤%$váö¢\"6x¬ó´n®—	üs‚_Sÿ\0l\r\nÏŠü±Ò£ÿ\0’q\"çí›Æ_\ZQ»ƒĞÇğ;¸X4„‚Aã²¦ìlRc;h°ÙäI“è$\"f\rá!¤oá™¯¡âPáš\"o(\nıCq	Ã	ù1£Ûô!T –`#œ@£.ƒ-¡éIÈŞôWA[¦›|||ŠT*×÷Km¶Ê¯}}\Zì:m¶§\0‰(6qŠÅşşYôq““äeœóş¡]¤õûïÀ¯àxcyhxX\n—ûpÚYFƒ—Ñ£fÁ¦óÀockÃ³½†‘…Ó0B\ZØš‚”ìgXİ\Z+-ãd&B·ŒD,Ì!a\\,)MGb‰0ÅIª/äÿ\0”„£Ä6.b	a#‘+!.é(Ó×Hñ—±ØğöÍpß!®\Zè\'IˆSH%|ĞO‘k£ÿ\0ãŸ\\Ù	‡Ö1ª5Ÿ.¸`ï\nüƒèA+^¿Ö\"@Ã–[‡$~N†	“Â4öÍûÖdÃ‘X4ƒmõ#çùMf+0ğ}šjt½7…‚¡¢	!qÙñGè6!;¹èß²?X„V©úBØ£Ôw©\'İ²üWì¥&:ÇhcŠà¶ó³‘2-5êßOÙ0¥<PFŸ¬©/±øzš>=Şb$ö°Î+’h]…×¡şÂˆBÅQ_dÎoaŒ\'àÜ™%²è“¯’\ràªø	Úæ:\"‡c¦ì¥¶5ÑT‰>ˆÙ\ZèŞÜ¦İ+³hpîü³±‰‰şiõL/­œøÁ¶Æñù0ñ nléäh¸Şï† ïröæ!ol[šæçKØã”ËöØÚ‹jøgK{ E¯³L€b­öÈSí-ßØi¸¢D6\0Úäè1Š§¥P˜‡‰Ôò÷‰Õ4‰©ƒAi*êoBõ%µÛ,EL ÕïJÑAµÜfú¼M®X¶±æOÄ—mcş\'U€yFıÆ1r½¾!@æ[Ìş,±é·ôCî^äÎIX¿Ó&ø(Øüìı!™•7+ïâAHvË>Û‚Ër\Z™·sÆˆNN·x%cÈ*ÍÜğ(‚7Ó¿5¯oñöµwŸà¨}`¸‚¦¸ys,_ö\rTô:©Wø£qÊmrŠ…y³²¡µX‹r¢æH’Ö.„xíÁ¾’4WG{0ƒ‹!“^[‚Ğ3ŠO]ˆ[M^kk_7Ø‡Š‘¸ùy¹°û*H¦AËPã]Èvr+ƒøÅÇ Ÿpr[8“M#â€ùàÔ…ÈÅÀ…Â‚u“‚Š:bI6\ZKì¶h‚åCÁ	04˜’Ÿ¿‚á;Ûè/óÏòÌ6˜úx3ÿ\0¤‚Î¤ìr¾Eô˜ø·Ä?‘bBcgH*¿“”º´oO+“|±¡	nN%§ù4ˆkâº=a§oÚ¾g¶G\rß8ôTfÏ5.jú7@z”g‰\Z¿öÇ9Ù	s´&M³æ(X[9‹|¯²ÇŞÉ´ş\r¡a&–ÊÒÑ±H›”ã8Îi&Ô¿cf¼Y)ù”8Úÿ\0‡¯	Y±û7¨¾oİœˆW	ÿ\0Ñ‰Xı»M5öÚ3â•ÁU¥=^]cÛû½µ÷£ ôa\'$—ÎÆåÁƒöë–m±$G]%\rÌü6nPJóİ—ëEÒu¾ä¬ëóoKòØŞiø1hY[Úr\"šsav\ZtüÅşDi®­š¤Oì‡eRZÒiâ,8¨+Ëá!fwm½ÒøGL33çf°0¼Úâ-nÚOÃ‚(ÚñvÜln<fz¤õç„~e3ÜßŞS-äLJ¿‘Jq:Ip‘‘uJ±4Û|´(\'2WñËşØH×VØD[–3\\7ÌàTGÖ•¤ıú‡d\0º.ı¼C€†ÉÇÅ „˜øàVÓàø*Y‹Oíş±XB”‚àX˜	\Z±ØåL[N¥\0¤€-/05mÜC{^ƒşÙ_‘ÛØ›’	¼¯ó¼OğO¡ãƒLäÇĞÙááûg,¥HI\r¼%ô/Ç#Ÿ˜l{hp49t[HZ….²ûçY²Bº>q•.’D¨$—E/’ZY¹¯İ<|_m=¥lQ	;@IWvĞ¦6ò‘‰ÊWŠŸ¢0/:ñ\r¸îM~ÉäSç~áİ¸§áó¼‹L-^’£×aÃËÃÔÇ€|îŸÉ»€}OäæÁ¤Ã+ºæ‡ñı$¯Âï…¥	ıi®ô+ µRğŸ#·²Û{62Îëå\rRı~M³À‹:>ˆù^„–OÛ‘ÆÖÂfİx=3ÙânUİ<ì5„Æ z¬Ş¾FP4o‹îjC92|\n¹ùGŞY-óH^\rgüŒGeüÃ‘]0v„üX©­4ĞÄËÕcYü¹ÿ\0#m£ù)(ôZ@KtØ‘¥òÎàß+úA¶ÛlxL8…íàÄj HKß1ŠsBèƒì&+x! $ò!o ¬H$æÚä;XO˜²Ø8è·7‹°ÚCv\rGMQ&¿a`ZÅ/_ş)ô/ğ¾¸Æ7‹?àÇ]ğĞ/–(bZ½}4:ó‚[ö^Ç·…]‹”B\nC”¡HpklQ›C&‰¡hØ¤ÂKxMpŸ£¼¦PPşš\'±a`ŞŠ:Â<aÄOÖ.1d©pÔ&ÛjìpeÄ,âK%«Æ<Şr\r“€ÿ\0»ÕòvÇ$‘¯=WaûFŠZA%ì¿Zÿ\0òO§ˆÛœã¥ÿ\0˜ ï8ŒÙiWLx™¬|‹èøÃ+èN›hikZ‰à“Ã…2Cô{O¾vM.D˜Ú–Ğ¿®’ĞXİc€.é,÷\rl4V¦ôı	LâØ[ú6#Ü­}Ğ-\rËsˆ–°FLóW­2W¶[CÛ—{ÅÅ™Qñ.>IH¼[+û<*5ÎãÆGcûDfØ›C˜á[â·gb\"f¬\"°¶$ELzcu ‘¬9Œ“ûĞ—CÈ”Ó„%	?•šOÀ†O©èÈá„Oÿ\02ÿ\0\ZÚ¸Î?ë‹€ô7ˆ\"‚h}=Ÿøñ˜Ş\"8=öÒç‘õQò{ê63tZ!ìÒ§\Z^Ñ¬ŠA7ûŒsÍú¸œ<7ÄĞî×èaïÎ6%¶Zú&i\"D™W„ÇaÔµ¥Vødx3–’´Ğ\"*¬ş˜†„Tì¼\\\"šFQj¾¡¹Ä^=Li_Kø4Øu]û‘”4%´×~(i¨jü»D!2”&“Š.IqS‰ø’òÇV3ôa‡Q™}´3\"Cm$Ÿˆë³Ş¦ô’K³‡Œ§”Ÿèçâ·cI¾p¬ËUâ–•Fõ.0ı>˜‘üY?ÌeBt¾œS;¼$;%IvÇ¹¢]|å!èTµïÛİ´CŒşû¡˜V/ôà„6•ü×¤5ÅÁ‹n4^OŠŸàŒ\ZÇå&\"òr¾uñ¨¶ÍŒó,™U¤B_¥É±_O#ŠüœiúŞ’ÂtË—ğ„Y~B¸o‚¿s})ÅÃĞü€\\ˆsw…	|‘\"·ùOK‡ñhS]‚ĞBÂŒCXÜöc¥èM²¶5À…t>øö%6ä&å’*Ö4tOÿ\0ÿ\0†Aà·##Ü¶öPş‘ú&ùÅ4}˜‹²å¨?!îCë…šyWù®¡±ÆşÈŠ:Ô›í¸EOÜV;¢…Nı>øUV²3¢ÖÛÛoà‰¥¡¥+å_ö:°ÔyÚÅ\r^}bİ	¼$fßÌá2Ø…@yr[|\'–.jßØo5Ÿ‚3-gâ§ÂĞñ*ö-<³±sÔi;BpHéÇûì\nóÈ·N×é“q¥ÓæNñÃE=\Z-\'øÜÆü†ØGU6ÿ\0ÃöÆ¨f(š‹^ÒàØÄ4¾QáùB¯ú\'Iåİı#j>V\'ù/òjÖƒÃå›çUi®Å8îO>ÆPşù“„:HA|:Tèa„l¯Éçà|-±ªšÓÎM|±ºf3ĞzƒÑ±~Ò9áĞ×ÏösY^ÆÍ¸\'ˆ»l©Z“rQŒööÿ\0C\Z¸ò|°Ûâµ«Á,+µ|¥$mo}$w„ôtEz?à|„÷‰e&Q@ït‚û\0WTG‡„$	¦Q¡´ÏäOa!\'áS}‚|ScîĞV¶pkğ8-9£HğÑæsÿ\0Í?ü.[‘è1‰óÀ¿ØlpˆÑÅÖtş¦ÇÈè¢š\rİÓö]Kk5cüeMiWæ›XÛ5g™†´şaÂ$SÊD¢ı³¥³â†©Yş[!…šû!étµöMR_¤r`ê®R»ë}Â‚iº$O4÷¤Øİ9\")û»)¶Ş­E¸%œw—àÚ¤úo¤2.³ææâ\r»í°ëv “M\'ÏÉÜ[«ÚÒF\'Ç=-\r£İfïà\"¯#‹ø3Îdc4TcáÀ¾ëÑZ;&jCî±¶ûhâõDLà¸àS6¾F¬İÊüÁ©§§D´~F>Â5øáXÙã84+1Õ:×àz}ûOJÁÎˆãÆ†MO=j¯Ê\Z”^ÄÚ~Â.óy@´\"›nÌTCĞ±Áì~@BP­“A³î€ße~Ê_¡?ÙÇ‰–áµÏbXı íà==RWÔsÊIĞÕ¯AjGCM~„oÜ6ãû‚šğA=ı+üëüëò&‡›ğˆø‹òWM ¯Ìhk}ßLG‚{Å.ñĞÓèà-lä‡V%ŞÄÄA\\4Æpv‘0ƒ8º\ZËKéHÒÄÇ!Ì©¾‡q÷ÂA1¾(•şH)(w£˜WWä³œÄu¡•òG&æ‚	bM4Çö+K°$İpàßäG`[FÅÅúoøfgÔş¶Ğá«ìşúØ“˜M}†ùaĞÙ6Q¿¢@$Q7ˆ±MÔ\ZòpIÀƒWB¨(†ÆÁsÁÌIZÎŸ\'¼®NDÅÂc±¥Œß­»½Äül;PvËÃDhlÙÓiÍúÑş3ı›6\\\'\r½™W€­´4xìa~«ÚBÌÆücHXX¥EŠ!÷„Lq<VùÇò-@±7ãşQnW¼4E\"Şiùü>I+ğ	úm\Z-×ÈiğDZç‚íGYC‹™şáâ}/éy}¾ê¢ü™+Ä×áß!ôrá”\\‰<ø/Ğ÷/Â\nP-W>l~xÏC­mAkáØ#CÓ}¸,±$ßgN§ÁKäócHNãòni	óõí!·“ ö×?B¶\'gÂàk×À´‡i-\ZõR¿s”Ì®â}Å`•.øÕ¢ÜıPİ¾Dèrèİõ¢°<Z?{… Ú¤oîQ|vO¹_À„­ú‘Å’Î_–ÇaS¶Õ]48‡3iÎq¦àÏï´FÁV‰z\Z•|6Í•©½vè¶Oµ“v’PMVÃoŠÓ	ÕSkuê\rvÇ€†ét‡F}[UhPàóÄ¾E„ş£@ãËm	”é¥Ñä7Íë¦ÍVwU=2N¹Sk÷±4›@K˜àö\n\\O]¡2=KË¦œQüD)%QRÊZÖ¼¨Ù3eÙUÃÃ”Î®Íğû2k\Z¤kRÔ£Z\n\n]°Ğ+—èÊ,+HåèL&6†õ‹ì&1›~@€ÿ\0c?pÊ	ë&•úsäØt\\¶ÿ\0’Û|	¤\0?§É«^õG«cqlÖ˜]¬\"ı¹¿ş\nO§‹Lä·ÀŸ³ßğ’[/·ôl5£GbEş˜BbEÌò[òbÜïz+¤%Òÿ\0‡¦ÄRI¥ÎÎx\"@úé×Ò>&Ô/Ìq´½³BŸ¦‘‰Ší¯b¸ÜêDöı!/pùo,j¡M>NÆØs½€äôŸhÃvŞÏ „¯½%òn‚÷î®‹“¥jÛîAûK¾ßb…ÑÊ^ñ¾Ø‡áM­®ßbbhëk­«æüÚBZ|5±/ØÚ¢<f8W¯ô:Åd\\’{ƒÜPÅË[éğs¤–¬ûB„áîïàCoÒ(±Ê_†¢JÇ‰+k[ò‹!Åö-QPgjO\Z\'ÔÜpÇ·J5JsÀÚP»âãò£j®í$Çp‹5Eª>İçäqÕö¿èüt ßO†PSGÔC ª/Ê/‹ŞÖ«üÈ1Ğ¤P†*‘¥_TåÑÂM¼.ÊÊß‹’v‘Ë#¿¤¶8oÛeĞêÜSò°,O£øÎ¡b…ÍäG)¯hg\ZÊNNèX.P}/äV&›ğĞ_BvŞ„Køz+€\\U¦:t k–fœ,6Ñ¸ßÿ\0Ó3èkøÎqğ8şÿ\0~#ıŠ\\»qÿ\0N±ıá-„ş‘Ğ‘¸Vl`è¶*Å{:Ú^X¶\rè¥|†.‚ñ\nl—	WÛlUŞ¦í“±êe4ÉñÎbßct?«í¸¬6»^•üøª!c±®éÂØY>ÛC;\'æ×§¥N2|£î(V‡gÅuø¡Ó¾SòÇ~†úq±{4¥l]\\M÷¼WúÁrœrİúB(Ñ[™Á!€_?ÛeG<‡ÃôÉá\Z\'ûÖÎ6/	ı47NïÀß¼EV¨’‘»IŸr“#vÔNÍQ9¢™}ÔCù1u½¾åCÃ0Š¸û‚ô~ùân\'/p“|»àmÆ”öîY{ù<XÕH—Vå‡oå\n’TÛšŞÚ jûY~Y–+8¼lTÑÍ/ƒİÊ)í÷(·Aß¡G_ˆòÑp	È„İl9¡üÀ­†Óc˜_„‰ÈÅa\'\Z\ZúĞ›ë­~~@×äw²ü\n¼+‚¢8‚ÂC@(Î½3M\r·nÃ…ĞßğhM¬	Óíïj.±½‰¦¼òZ^Avİ“¹ù¯\"Øéuƒ…›ÿ\0ãcTpäğù\Z ø©¿’kôĞ>\ndÎŠ&ôs^@ÙÖ!¦áèsğöxæg?#‹hŠ9\n_A½3p¸mŒ…Cb‘záëîs‘ë›h!<6š(ŸÈ¢	—EA	£v1Ï\"• ˜™b9B™DÍıÅÃ[‘×€\'xurÚZšâi¶î,!„¨\\e2×ÀBÑìÁ¬Bº5ƒ\\O°õò;²P;i´¼—Am¶ì6×n™`\'Ëÿ\0;Åÿ\0cns‹¬67±ê?ë!´Ÿñà€aåã’{ïäÆÉ¥³dÆ…6!èà\",\\B>„4¨šƒƒ!V;W…Åä.*\'pmb¡Ğ’lbho\ruì£È}²KË}!×‹Ù9á‘ôtkèèäBw²‰ì»?,MA ÄğQ¯¼{…Á÷‚¾ÌÙ¯¶V¼‚äe¬V¿¥Í4¸fêÓär>OBZÿ\0Ğ7ßlŸ(œ.†ÒáË±\\t£—«^„úú\'3´\n%ì4ğ™¿+	ıßøè˜B__Èúc\ZßÒ-œ#şDLø\rÏˆkéáùÆƒÆdj¸^xOØ³Â§ğƒMw&nb¡+aŸ>„IF{GãC¯\'¦jr&ßÈÍ‰XÑ¹&Î\"wØˆ‰÷HˆiÀ£aàhZK¥tWw ĞùĞpéùà7§œYş†É˜·Ø&uº·ğUg~ø§ÑşDÇf“q&ñNC@ôYzI}¼×Q¨Şÿ\0ku$¾[§×o„„ìu©1Ö®ã*¢¤Şâ†µ>6(˜şÙÂ¦lIğnöC03¤^[ B½Ë~^–Ì¤-x3ıãItG[œd†ŞL°=bo„â³¢–»l¾¶!ğ¦¸RdWğ‰ÀovO•J-G!œ®ÛÇêZWâ—fwå­¬%ebò$§l$r™T²è£Ø%\ZƒìÅô1—CA´ÒIšè[BmŞÁj&¼Ï¶ıq·Ê;€ü€á¹öŞào×ŸqÊ—èa1Kÿ\0ãaù#ŒvBØ,pe!^+‘¨‚´Ë²”“Y©ö;3íİ\"ğG_„™âS}ŞÍŞ9ç¾ (â©HEÔ¥äñ¸Ö´0Üëùc\Z\ruü\Zê³Z§:§uŒ2–Á?s–,–Ÿ‚Š;q%GBš·…n¯P¢¸|Æ ‹òÈéÀèÖ+HnŒ>’ˆ§õ³bD ElÆl¶şˆ1æÄ”“\n“İ&Eé´­²^,¥$ÒOo™\n^¦ø1äDù¦op-iqª;êŸ¯B¸_~¯t0Í}Ó¼\rC|®Í>ÌzŸq·ıBÂF÷ZWØ)6_Î)?öVr–à7~GÚ/ğš/ğØwCØw0Û¨w)ûh6\0¹òãŞ6Ïßlcºù¹åÔ&ŸJi|‘a.p_ÊóúóÏI\Záó\"³ÇVëéa\"¡ëè7à\n8ØâÜ¢hŒ÷ƒ×¸|²ı3	‰\rh}‰¾W¦\r”Mh4|Êa´h.Pj Ë³±\r=š$íÿ\0è>8^ÅLô¹Ó—M\\lŞ‚¿IQh#öü=-ÈŞ(~¸_ô|ØşD¾ÀŞsşI¡›(ÙO¶$×gë	£l#yÖ†Ğóü\\9ßTàëğÒ¶SÊª.h	%å»\ZŞ%ÆÛ/¥´›ò†m	¯¶.“f¡§ÙÃ]òâé!VfV—¥än14jG3‡îjœSw{	.¥”áç¤{`\r)×	kõtJ€sìïÁ§\rÜåQT¹=[/,†˜>™ü±šˆš»UÊAöItqêùq!núC”}êâbƒr­tçp·‹s_¹”9ô´—ºCP÷´OÅ5Á~ïH\\¡~ jóï,»Â*šeÁúÑ½äÃ/™NavÄ˜¦’‘øh…™Ã/S<xwBx¦Ö’÷³‚ˆ_8„©k^Pê\Zµ4‹™gûfšñ>“6X´R&ûÙÛÅ…eé“u´’ûTMgC^àP¢¸Í¼\0 Ø+C¸!“}‘½ØF O¤ş%ÁR‡É§J*^AĞ“a\"„¡U°{ãî?ù#·è:—³vˆET?‘(zô°\r\0¢¡\\\\ÙÃ5>ÂóùÎÇŒ‡ßtÍÿ\0ˆÿ\0Ã¶‹˜1½Å¿s¿ªĞ Gìù\'úú^ –,å„ø	E™¡œrÚm‹`xÚ|\n¬õÈĞÂÏS£¥NÈ­ıŠšìªûc¯#ò5r)Ù¿È®fÔù6l1÷e<„ë~–ÄÈrWqvÍB¥Š@Í*P´Ú4‘¸´\"èLo’¶6RŸq´]‰*\\BÙÈk…a«’{r‰‰Ø®â‰7<„Ê#O±E ÛX‰ì¥¢ü\0(ÀÅx#_ˆèO¬®–A¶jĞ†¼=„’*ù s„ÀÜ¾wğ)A_‚7­Rï±ÑÃP‚åè#¢±ok¹£æıoërÜá±àùMÜœÏI‡ÌRáÓb¯–}€¿B*ŞG±7F„šCè¸EÅÙÉPpÔ!Gh‡8w(Bl\\ƒ¢{(¦	´.9øbz+LlO¸7bŠ!V+£A5„ÅGp5y‚ˆBl|¿”9ó¾‚Ç~@˜“\ná1\"©Èò&)è„pxÛò*ßØœ	ÈtGÏòÚ.«Á;.ùh\'¾ùê%o‘VX+›kÈ_Â+/ÚQËÎ©Ap²nqô_ópÑ—ü_$ùCşÂç[+ ÊÍàè;6Ä±Ø’ƒ05Ä+ò0“B\\ÈpŒå4ûLìÜ åõú=x÷\'û(%PƒLÜ\nÀ\\Yz/ì˜ÓmºÇècG(™¡0ĞD6!øÎÇ*ĞÏ¸™GÌO$+¸LE“bgGôAş‡#lLLBE~ƒ2¤mÎåø=p³hœì¿ÌSs\\0¹5Pí°v—ØyC˜wî\'±Ãm»ĞìW65^½mÓH¡·ÜØœöA?bóÀâ‡$-\n—Bz6kà¼b¬=ı	şVÓøcì68+¼oÂ@m\"Ú^ƒ¬àÒBü#ù+•ÌØÈş-\"´•hß+_»|&Î\\­ÌÛ.£÷ÌWmœ5àv\'BüQb~]t^™_$öWŸ+MÑºw´Š¡kœŸ›bq¯°d¨Ôä•á	\rAÑş®Î•ÀİÚ~Ã6vKíWÙVI¯‚¹	!ıªßBXM¶õÕŠów¢Ş90~Åçî?C–îfØáÀÛ™´WpŸ@4Ø¬OÀƒi”_8^Ãù)D}…Ş´ÂğQ6!=‹‘6QÇ\rÉ7Èÿ\0Â#Êmïjà†ùôIÿ\0À™\0Óù¼\rö\Z—ïóÈÿ\0èŠÏ\0¦äw¢\nj€îô†/E£i/¹6 ,Ø_‡ª,FE}}ÿ\0†¯¥´ÆÛ\Z°øê ¾(ïÍ8ZìAvÿ\0ş1¼Óş¶Æ\\b¿’1Ğçü!İT¿İ!ßÜFàwÃ{º,Ÿ?%œ—¶’å\rÒ‚\r‘5Àûx\Z‹Ü9¸Uõ@9L5óÈìŸ!2\'K‚»‰}‡ Jï­şÙ¿š¼\\¥÷d@Ó»7Òc\0Æ(ü²d|IùDhİÙ³ô¥ [c™†uè’^[e3¯hs\rŒ!¡—\noQ³³töQ«Š Û]\rèCbÂ‰\n·ÉJU ¡ÑDR#5	ìoXååviòÂaT8Œ¸Gì3Æı¹ˆBniOä%±Àëú *»\"!PêQÿ\0 ö_`µØ¯1®GWNA>‡N0=Úl=OåNWòçf‡æ5=8\"IÆ qÁÓ€•è½=>¨Àh†ó@ÛĞÄı¿¢—ü§‚h-cŸÒdõŸ¤b³ûì}Œw,Ú#K‡GSû\rlÑpŒKTo·¶=T?âÌÛÚ‡c¶<÷ä´ãûxĞ²’€±|4/húSõ\r&g+¶yÈğæD|‰mß•L{Ë%ÓltàHj“¡_\'å¢,Ó‡f›º~U£vOsÆÓùBLÜT*ŸÂeÜÿ\0İCx\Z.EtèkGBì4R	1åC¢¸&ÆP)J&(™!A!1`»y*ÁkØ-qMc ªO\Z»hf!—¹?¤÷„Q=ap)_a½4‡.¯È‡#X	!†¸¤	\'H\ZPNá5§Àšg¤	›Ê„ä‡®Ó÷cØi¯=€/·À÷zàí	U¨iôÃyÃÙtøì­ô¾\n×‘¦Ø7èö_\"ÕisqKô÷lr|æ¯ÿ\0bt‡·ö(SØ~q0ù!Q¿üA/qœ‡Á¨#N…¨Ú?„Š\"øE ÚÃGMW¬\Z˜O‘óÈÎ&¡qR\r¦<+ÖÇFÒ	ètA2½ã¡1rB3ÁEAääèI\Zó‹¡AÃOxº’•å3¨¡Bš$%Ãc‘­ö×Tú/û9A Ó&†Û,Á>qäWìÈC3@i·Ñ»ş„×#Àh¯9àÇ/Wïİ8ùBƒ_±=4Ïäû^É@ü¦™Äƒ_!Ñm²Ûé¿áeL}m†GÀÿ\0FÊ¹ÈT×´#ôQ¹ğqq>oÑvè‘\rãBá„ˆˆòç#ú& T tQ°Õ\Z\"R¢8¨)X#¡Øû¼eeÊÿ\0âOñÿ\0¢‡õÿ\0%ú‘„şâ!MÀ—ığ_ûßğjÿ\0éÿ\01N‡ô>Çÿ\0V:Å3Æ~XÎ>ïÉ·ú¿‘7Ñâè¿øúOşq¹ïô^ÒØ©vjCú¢†g°A¥èQù0{U6YiäÂŠ…¶¨\r&[C±îBìxÜS	OW?h\Z¦ÏhGĞ\\Bos†™°Oz~ÏïÀm¢øLÉvÁ|o€@ßÒè[khSËÊm„ª%÷è$ş±K‹ôÓ¡ôC”|ÿ\0å†B{ÂçË+ä\r-? C(ßĞ?°a4QH˜ª»_ó‡ÿ\0fkHÿ\0\\\'([æ:?`)‚å·ï“úŸûë?Ûÿ\0â?ô_òƒ‹øgö\'ü5ÿ\0›şü“şúğ:t–¡ÿ\0s›kş¦å_ÑÙÿ\0Ü¿é/û?Û\Z¶úS ş?ù(ÿ\0æ¨{µ\r}ñ¦DÛÿ\0Qÿ\0²Ä¶™‹\'bï8ú†‹‡àw<±:bzÂ˜º>âBLOœ$6àš.Î¹Âéò~\"Q	‰èOAõ¡Dù\r!mÏöH_CŒÌ.~º8°Æã—ôŞÀÏƒäü„×x@¥Š\nÓ})è.¡ğc{Á6	-üUV´ƒj/ö˜;ş¤¶ÿ\0–W»A\ZZëà=†ßÑÇÙş‹ş\'ô¾„í˜Ş*şƒcOıˆM‰8„Á£CÚZ|\\şhıòZ\"•¼¦ h®‡¬|±I†±ªvq…\Z)ÈĞÖ‹1X‡´EC›ÁDI@Şh„ãap\\.KìhRL¸j	«„8›ÁÈ6?°˜Äx¨\'¬} $ÇŸä_ÉBÂÂÂcbrÓˆÄˆ	ÒlG×&á~°Z°iº!¹kÙ‡~h;Qa)Ò©vpiıéŠş-ú|…ÿ\0dUº_<	+Ãà¯q!<áA\\KAYøù*Ï¯¯¢æáÆÜ}Cäe¿÷&&ú\"‹oà+ôÙÖ6pDÖ«û‰âÂÂ*°+¬5³\\1b½ÁıçLv2;Èşã¡räĞXMÌt.D°®G8Mv50šÃî\'£¡•¤)°MçdØ¥Ş?$8a¦?ùà<&ø3M—\rĞ°´(–õ]n‹äöÙ_j—aíIBÂÔœ _0Õpùl|(16HspÕp¥t],¦$û>K¿ôÑÃì_óğsoÀlcG_\Z}Ï0J˜`\"éL_î6&„”âEtØ¦ÑVÏcD ˜lá¡ÙXä{?¡6=6Ù£XàL–)¼®H*i	èÛÁc]\nôh”9DÄIú¹¡BÁ,6nù6&AgE±¢àO¸	P§\'	Ó@M¤Ø½™lvº5½äUà~—±ä^E{›äñp+Ø×Üèjr	¢tŠ{\"ğ%Ø®Ø»AXŞ®tÇ&)æ;M $¦˜..(ŠV)qÀxá¹ùßàâ+ÿ\0€1K ĞÃ/Phº:Âe?¡¶]|ˆş[hœFà6E’xĞÅ†ÅŞU°àõ‡P¼á7¡=‚Ô]\r—Fà›ÓùLaÓG¶œß¡ı–M²äšÂà=g$¾°Ş‚l8ÏíÍ±c…½ÕÙğ6+BÒP&àç¬Ü{È¸<KîÈÒ«GsB×\nœ¸¢z?\0¹\Z!\n&-[E÷F0ŸÊ¢8	¶¶À–‡Œòº¯¹Dôp\\pcó«Ğh+°ûÁÒ*X>_ivNÇYhv\Zı…7¥|\n¿ĞÍE WıÈZkò›n^Æ«oCÙğäIy…/!Á|}»ÿ\0má1Ñá¸0gÊa{\r€Ø˜ƒúi<\0½!/¹-îĞ´&\r8pñJ±ò1ğW¿D’í¶$|)y_„¢APºÕû3SÅ|í%:òU‘u÷P]ŒçÁÌƒ”Ö¶´/ˆå«…</cHy„ËòÙ\09?	\ZâúÜ#SKÃ~\Z ÂÚË±ú7½¢ú#UÓÏBZ++Óz…rü³Æ§[¢+ç©¢µny\\¦43µÔ…Ê·³±á–ê*6é´O¤æhOè{øîlbÑ6Ú]Æ ùï¡WO‘4Än¢M\'ö¡=½Î-œ®Ïâ„ÙŸ¯cÌÀĞ‹tª6ı!À¹Æ×ãGL/ÆPåóâuät«°ì`mÛÒE`´Ù®–Ùp?»q6[µœ:ä	ñàbÅBèuòL§§è‹¬Ävt#	sĞ2ñûG/º»t:`ÛNz×ä„óøÌ•x>	X›×ò¡>èoH{è¶ø¾`Šc&½ƒn)\n¿€5Øë¿àà7ĞÅq~şXşğq_&ŸÔ%‡•ô,ôÅ\nG}a5}È5ìûÒczò?´îÑÅhdvøÙıâùÆ0@»b¿	D˜œ|J/CîÑ?!ËMÒQHo__)¯S\Zê%ØäûœºŞŸÙæóºÅàT,^çÎµ‡\Z©÷b¼úwj¢rİ‘M¾vëcµãÉi¤]]hA¡‰ÄS¥EI¦ü¿Ö\"^Õe± İÏÒÅâ™ÂçŞ*h¥7Ğíìºû@™™\'Ù2¨¦ÓiíLÿ\0rêWŒ„T¥²Îi×Y½ßÙuÒ¶è¶+G¶ßü7èş¡¤ô¹$%Òç^ù4U°yBÉ¢_*ŠÈü^½!ä|ûl‚ƒìàËğ‚$ÿ\0sDlqğwíö?c(Zb=¤×ãİêË9:ç§\n¢\no¥CÀ5[ËbĞÌ,ÔıÔËÓ\ZšEÍÁ‚>Ù³çsÓù6Çz™\\&œ#doêÅ\nœ±\Z¼„ö(?ã\Z´)ëÀx¡gLM¬ºù>â–˜4Ú³Uß‘ò^M¤¸·>ÁIä&Dû\r¤´Zü¸ğŠYa:ıº/\0ùû1ø¬7´ÚgÜ5§û#`ß‹àUíˆà_ğ¯Ôâúc Æyp?Âÿ\0¹Uò%yŸ´Ã:ÏÑö—ôUÃzB¾½ÈúäŸìp#ñÆşÂ¶`u÷\Z–sĞà3¹L4€²^÷†„inÓàn¡{‰.G)\Z!E¾Pnù¦IÌ\rR[†h¸°4^\n…`\\…•ğ(bå7%\"øÏ);rJËiËw’Ù«|1gpx’£×E½·ÿ\0FÔT=>è\rÚÈI•ÛÓì‡	xm(Sƒ‰5\nùº~jïı²üèº|šGonh”~Ø¾Ã\\ë)©;ĞÉ5»J»bî>H¿ØÖŒ×Ê”ò?\\ØŸØÍøvœ¿ch+{t…9¾­en*¿\Z<Ô*cªÃ»ÕTŞ„±“¹%_a~ª´¤ï\'oı)¦şÄæ6ğWU6/î¿öÎ5êıìGfi=ØvP]×ğö9¯ô)ÔyïîTöÛ.¾úö`ş&nàp¥ñG§ÁÕôÅÀ9[ãòoaÒ®_Üm§Úizb{6¼¥›ÿ\0Ñ6´š“õ„õ…ŒwxG2ˆ.^=1Kö\'ìmp}3–)÷0{@á‡r\r½Ñ&Ğ‘96Úíò*#_¡@z®†·Ø+^ÌR¶šòğ	§¦(–ÈJ\r*‚ÂxëêX¥Ï¹6>‡i¢ş(ü‰rÁ‡„Å÷ÄxÄ\"H:)QãÃ:OÎÆªÒUğÜàqb;¢üt/†±KşP>±)ø\'—®ßÙÁ¼~>z4I°]~¤+6¿B´>ëÿ\0…×øĞõ}Ã[ü­nşô=Ù6Ö,SsƒtÖÇÉ9\n¢Bìõ*VÊ 3÷ry9à.í~MÎM\\‘F³^?rf)Yî×ğM=_ˆ+£¼\'…ö­¿H°#vÈä%e×ì£\"\rëDÉÈIKe\\ÇRÛAØ«Ù}…\'2‰ãBCÂmr¹ƒzÅèP£Ëz¢LLb5æĞŠ[ÎïÁûÁ	šÄÆõƒüıGy»\ZÒ\nPÈæ`™|¼!íä-&]/‘´ğØIyh\Z$	8UP¢ôÒ+l1±Â¢`¹(ğŠ]ææ”m<wL3ÉÅ~tt®ö5}HP2ğ“eÃS_ $)§‚i¡ôğŠi…Bò‡®K’t8bÎ‡´ErQAº]g†vQÒ)yÙs¨jr(L›\r¦5¼jE¬6%…*(š˜LB.iELm@ëúŞÍHo‘õàöÓ˜{¨şpXY¹*ÉºìpÅ44Ş½Ò¾@ïä«¡iğUBîŒ{…ê„Øhš¡-rù}‹\n \\\\Ü_¢—,ğ/¶îÇæmÀ¿B±±mÀõühë„¢\n¾Q¿·ÈŒU‚d”LehR›£[9BÂÄÁ­‚A°Ş1$<‡Ö#g[¿$…Nù\r6 ‹Î.Î1À™°ôÁLÑQ}‰ë	”GÜF®1MÌTtjœ¾ã_cU\\.yĞ±¨ö<ö¸’?´\na-·Í_XYW	6UòÙªQ»Øô#dhF \\vaÄÅpáp4Q5\r£4‹Xš{B07¯}Åúµ—4‡\rŒÿ\0Á˜FìÒ°uŒ&±0Şş¨ÄĞ½‡XõF¢öáÈ’é4›;AVåû$4%¼\r±¡	ıı‰6=ƒZ‡\Z\Zv&¢ï˜ÒòÇßp¿ûÁoHgèÕ\Z-ÚG\\ÙÏÀÛr	İ/ØŠ;òIü¡ 6çæxPí)QVrje±Q­a¨«‰ù>Ë“¾ã`:í?ÀÇ+é{46\\hRˆBcX¦Îp@ğ˜³Dø8\n•\"ì\"´ÙÀ¶\'¬PÄ^D#J¿¢ S°¨¡ÄCåJü:±	$QÚaÈ˜x\Zàlª`ºÁ2zbAÖ<aYW¹Ñ[dç	‹ĞO°à‡!=ü¬æaŒ÷#ø!Ÿ+î%·U~C\'î2±q¡ş†ØÓòUÈ?àSz©Ä©},Á>û¥R~ş(Ê+N£ô©WVßÉy9ä—ÁU®%¯\"lŠã‚d_Í­(UJáéAŠ^ıÒÄhçÚE\ZäôZ±ßr¢¯wïM/BÂv†R/¾\0Ê»ºoÜ?[Øúûú~†’-/ÈäÎåòhÙi¿D¢²ùp\\™úí¿%8½Ú¶Í,gÿ\0¾øa‘‹h‚J“±îT$0åØ˜™t/¡p(r(hA–+•V+.03ù\n‹óB(¶ô\'±@—AíÑ\\‡—û\'›€ÏsI¿ ºã\Z.†°xß‡‹`rà“h×û}\nbpDÜ—ZOˆVÀÒœbXOêO1GÓã6áˆôÀ¿$#äsÉûÃ? úQJp §HLİ¼šĞ¯­Z¦9ÄIÛò*p~$iÇÑå÷8e?CX_ÏùX÷Álµq§¿P~ÑT¬¼J/\r£kàtgÌ’:9±‹{Ÿ˜2­¯¡Äh›é7ò‹É§v—±ºŠ”Øœ»W¾P†	uØB«)>-íú%#õKŞ‘‡¤–}Ê]œˆç’Âê¯†Íb]ô×ˆ£-q¦AŠ±›—Ïä×G_[§¢œq\'å\Zóô}±ÑØèªt\'Ş.¼ xäM‘¬r¶.ÊÍaíˆû•ÉEJË£ó‡ÚÃ|@y~ğXDÉãfşŠñÙ~…¬Sœ}ò¸ÂÒäÓ„\r%•Š\\_ª·Âö1ğäÉüêhèwxÇ¡\"ü„p;¸Ài¿’\n\nßÆ•Xºò?Í?ê3öè\n‹î»@:‡J„qˆÁ˜…lO{rEøØÿ\0,›Ú5äk:„Kæ#nMš9á¿6nÎ‹PÍ…ÏxAÑé\r)I¬6pwÆ+o=ğ¸åŒQ1ü‰û¬!=‰¯°ÔÔtş	™¦¹’²X‚ú´j€bäo4.¸X(Ï°i^Ââ†á@½Äîıeš/¡á¨Òèm³d)ôü_„h½€6áq‰„ö3õ€zƒa]…¤1JšÑÌ»\r¨H	•âù\'¡÷7_e6‰\r‰¡µô{Ï,2*(/è-\r,kKBã*Ùp9ÂhUE±p(@–‡Ø¶(2¨DD…\"1s\"·äAö`ÙG~?]eÂßÒ‹,\"áTÂì)º&:ÅXüì.M]ˆòssÑJ9mÇÛğaË>¨òâ5Ä˜×Ğ&Iè„|™H…ÖB,•\nìPOf¦&\'¢*\r®ÂÔª‰€òĞ¸lC)ËÊçv6&²šœâë-¢‰‰ÓRÖ4¡Â;\"c{‹8vM|/à¤HS\rC$À0_İı*ÿ\0\"ä1%sĞ±\rQèI—x‘âaè¥úÑÊ>ã]êL‘°Ÿ¿œRa¿¡~ ~Æğßî*il@Qar	”mø9rQß\'\'±÷¬bâ]•\r†ôÇE\rlF¢	 –ÇÆ6n­±*8(¤Œ¢x¢äbãys&J‡g\"àMR	°àK+	³ƒ÷JÄ/¡aM&òd&úSÈHtª”ªCÆ:éCb­’bU)Kô/¸Ûc\Zì€şÆ¿s4D|è<®J„Ïög‹]´²¶!Ø\ryÃc“õMHì‚¢ˆ8}†:)pã…É\rhØwFÆáÈàA-“…pMšA[Î\'KŒRã~Ar	ãÖ>}CGBTùa\Z¾G@mB{Ç÷ÅôïëX¢8yOc£C_GC\Z.fV˜x(™ssJ,Q‹–Øğ‚º€§Î1ùCWÈn\r±}şĞÑS½¯Ğ®\Z)¢¼4V… Ø‹Â‰•á¨œe+aÇpl6ÙØñ¼:JA”ât+Šno	†ñ±0™P·ÅŞh!—ó8XBQJ\r÷Oä[›>Ùüâ+¢?hoÚ~‡Üÿ\0¹?Ø‹……ş‘flØÔeĞã	ï0šè„(nÜ)qJh}ËÒÃ|ˆ˜ÿ\0P#z-hu_±_0uì1TeÂÁ=aWü\08‰P}Czc¦±E	Ğ¼Ñ[6>ÎŠ5¼É:7kÈÛ¦)¢®Ø=`ÚÄÖğ]ã±ìN,W#ÒÁGyCbàÓ+8Ar,÷Šlrı‡Â¼ÅÄš¡6ÍØQòŸ¶­Š\'£¡Øî‰¿%ö\";ÇÂ)×ÓØ–&³qŞS*Îâå`…T¢ÂáÿÚ\0\0\0\0\0\0”m´’É$˜@ 	mÓm \0$@95\"lÁ	$—Ö½“Il’·ÿ\0ÒHÖÈD´mõ›I&Òmd›I¶’I&É ”oü’Yl‚ @¤Œòï!64A%kl”-·ÿ\0oü“YnŞo¶òXŞóD¼í$Ÿ¶Öm$›I´’Ë&éL‘[/öK*Y\00I$’íêÉ´Ñ\r$M´’I}·ßK½¿Ù¶Û}·ÿ\0ovÚIÒ_}·Ûmô’ı$»Ù¾’ÈÉl6KgÒË\"C4“Ûe–°‰$‘\r4M¤“@ï¶ÛI·ÛK¾Ûmöûm~Û²[í½»K´’m,›I¶ÖHÉ@°6nOöïj¤ m´R%0@\0ÒH–Û$I\0[$R&Ò$€%¼’M¶Ûoÿ\0ßm-›í$²I-¶I¶û@ñ~Öoj\0}ôR¥ˆ$ÒÈ¶ÀI i\"R\0@ 	%4€g´’işÛm÷Ûm$›,’I$–I¶ÛH°}¶Û|Jƒ\0‚RÙd µ.`lN»%¶Á7\"j–ÉÈJlÖÛAø’I¾ÛI¿Ûÿ\0¶ûíşûm$’m$’¶Òh±\0ï¶ÛìŸ\0‚ÒY.d¥*Ğl›o¶Ç¥jRHÉÛìÒAà’K¶ûI¶Ûo÷ÿ\0m¾Ûm,’m,’¶Ò$²doÿ\0ÿ\0ÿ\0ğ€@’I\"	É³I¶Òm¶Ém&Él’Il’I%²I%çû¶ëI&ÛYöÛÿ\0(;m-²Iô²ƒ¾Û$²@ı¿ÿ\0ığ\0À›É ‰l–ÉA²@m¶Ém²Il’@l’Il²[%$»\rÿ\0ëI&ßÉ¿ûmi;}m’I¼–·ÿ\0l–ßı³[¼Ca{I\"›%²[$’[lÛ$Àl’Il–Ól¶Ûl“_şÛI´¶Yd–J\0)m$²Kÿ\0ÒKnßl–ÓíûôKaÉ\"›¥şÉ%¶Ûl\"Ûl@\'²[,–Òl¶Ûl’{ÿ\0ûI´»I-¶JA\rí$–I¶ÒI&û\0”’ï\"Û`h\0RÉ¦»l’Il’I$šI%#K$×Ö@Ğ	4\nI$©\rµ²%–Im¿Ka\0lŸ”²m\"[\0”²ïbË i¥It›H’[l’I%²I%\'Ûl’Ò,’I$I$‰\r&’…%²Ù%¿I(\0|¿\0Ü–ı$Ûl&ÖÉ%›ı¶\0AVI )$¶Û$–É$[m–ÉmËI¶Û%¶Òm²ÉA¶Û$”’É/Ò%²@i‘%¤H\0	H&Ö[´›ï²€	¦rÉğ3%’[$–É$Él“ÀmËI´›%¶Òm²Àaÿ\0ÿ\0$”²I.Ò§²` l JH)I$–[-¿ï²A(”[I\"[$–É–Û	k[’M4Ûy\0‚i§·ÖI.Ò$’R(‘RH@Û`ƒ(\0Ú\0)\0I$’KmŸÿ\0ò(”[Ib[$’I$’I\"[°$’\0‚I%·ÒK$›.R(‘vJ$€š@(\0È@  \0!´Öm.öÿ\0¶Y,–RÉ H¶Ûm¶Û.–V–ÒI²Qm\"[m¶ÉM¤›î;M\0\0\0\0$Òm¤’I¤$dÒí\'òmòƒ —VÉ$	A¶Ûm¶Û,\0–ÒI³Ql’[m¶ÉM¤›lI	\0’\0$¶ši&›I&\02 ¶ÒIm¿ÿ\0´€!¥RÉ [	&Û$’I°Id\0\0‰\0’I$’IM¶ö\0Œ´	’D²\0I$$Ò@\0’@\0\0öÒÛm»ÿ\0´€!¥RK`R@_¤–Ò¼Í$Ñ2€•ŸóM$’i]şò4È´)²\0\04’@\0’@\0\0$¶Ûe»Û&Rd·òş‰$’I%²V´›I¦Ûlò@,”‰%¶Ûm$šl—á` 	€„€\n@$’@$BI{$²ËmŸI&$²rì‰$–É%²R 	\0É$’I$	$’@}¤›LÖÀ@ \rD€@4’@$BI\0e‡öÙôŸÛ&B`“{I²š$–À$\r!¦‰$Ûe¶Ûl’I%$’$‰\0–Ò\0ß4D²JFÀ’@\0	$–Òe†öI½¿[Âd’WK²–$–À$Ûm§	$–Ûe²Ù,ßû\'´›e‰\0¾Û\0\0û¦’ÈÀ\0›@\0\0	$–ÒAşöËm»Z’D•’JÛ|’I$i-¶`¤’inšÍ7»M$—ûl&Ä$úIÈÛn\nRI&àJFé 	m¶Û¶öÙdŸÚ’”²JÛd’I% uş`$\rì’Í7ûi¤Ÿûl.À¤²IHÛìBrXÀHÉ 	m¶Ûmô²¶ØR!¥›ÉÛ‚I$’@$Ÿé´“I$’ml’D%÷ûï²R¤˜\r¦ûm&Ä\0\0J\0I$›m$’ı²\0M¶ÚPE¶ûKÛ Id–Ä$–Í$’i$šMnÓI%—ÛorV$	1¦Ûm&À€Ğ\0H\0I$›m$’5±\0Ùi\0ÉÖH›ï¶Ò0´“ß¦ši%³i%²`$š[}&ä¤)!&ÉüL„`I%’I$’I$’%ğ\0Û`É@òH„ÛıöÒ ô“–Û¦ÒI%²m5ò@6’[}/Ä$‘9&ÉlL¤ I$²I$’I,€}a\0’€(—ÿ\0H†ûm¶Àm¾Àh–ÛnÒIlšI4šI$’r5”¨$²IH–ß$ \0ĞI´’I&À$’I}( ’I€–òH†Ûí¶Àı¶Èhßü’I~ÖÉ4šI¦ÓR%¨¤²Il–Û¤\0\0\0˜\0I´’I&À$›[$H\0\ndµ‚Y%´–Ê¦Òm²I$Ú@$’Iì’I$ÓM€–À¥²[¥”2A0Él&Û€E’’I$’l’aoşû$ `¥‚%¼»Ê®ÛH–Ûl’Àm²I$Úm$›I\0Şé%b¥%e0É$&ß¶’I$’l’I§÷Û\0	 6	€J@´’lÛm¶Él–Û$I$°‰|‚@lšI¥\"i¤\0–è–[Y% É$’I$’$–ÛMöûA¤I$Ê@µ–lÛ$’I$’I\0I$°‰l‚@l›I&m6›“Ì”ÛKe€I$’I$’$Ûí¶ÛH	$’I$\0•’I6ÒHl’IHòyl†ßígÛ}&Û$”‰î‘H‚I$”S\0\0\0$’m&É%·ûm6ßX@\0€@\0\0R\r,’I6ÒHl’Ml²Yl‚_7&ÿ\0}&Ò5õ‰¤II0S\0$’m&É%ôÛm¶ÛX\0\0\0$‘ X\r›IÛlÖ@}²R%\'ûi¶Ûı¶ÿ\0o&û~š{Y&Úì[B\0H$’I&É%¶šÍ¶ÛÊ\0\0‚I\0‘\0Ø›Éûn–Àı²V%\'ßk¶Ûm·Û}.Ûl’_ï¶^|†Û(B€\0$’I&É%¶ßm¶Û! ’I\0 š%?Û}Ûµ k·ÒbM4ÒIm²M$’_4”lÒlÒ(\0¤\0I$’I\"ImöÛm¶Ûi$I$\0Š$ß}Û$\0!¶À\0’I%²Id’I,’K$”‰$^|Ò€$@I$’I\"Moöÿ\0}¶Ûş™-’I$ ‰ M²mÛl„,–Ém¶Ù%´$’I,–Ù$’Il–Ÿl(LÈ¦\0\0I$’I¶É¶ûm¶ÛüÑ-’A$$‰ E’İÛ$”$’I$’I$$’I$’Y%²I$’›ì\0jH¤\0I$’I¶Émöûm¶ÛşÒi0M¶%–Ùo° l	–É.àIöÿ\0°[ü›§°@\0R\"JH@d’I&Éo¾ÛÍ¶Ûü“I$E¶”‹%’IP6m°\0ì”‰–É%\'ÉI¶Ûmô›K,‰í°D\0R	2XX\0\0$’I&ÉoşÛm¶Û¤šI$¶°K–öÈólIe°	!’I$’Rl–I%²A%Il–ÉR„ÒY!\0$’I²Iı¶Ûm¶Û6ÚI$Ô’²ßÖH[mÉe´‰3’[m&Òl–I$’A%·Û$–I[„ÒÉ $’I²IışÛm¶Û6Ûmÿ\0l€²\nl¢²I$’I@\0\0!’I$[$°l’k$›\"l’I$Èï \0’m²Iÿ\0öÛm¶Û´›mıl€¢l†¶Éì¶ÉH\0\0¡¾Iì_l³[&Ó{$©Ib›^’I%0ˆí 6\0’m²I}şÛm¶Û6›m¥ı °% Ğ°9­¾ÉmIm²@nÛì\0	&—Éµõ’\nI²@&Ûmd \0’m²Mm·Ûm¶Û4Óm§ı€¨$H2H°)$’I%É$’@$I$\0	m·É$\0I\n\04Ûm, \0’m²I}¿ûm¶Û·ûm¶v!0mm’²IAÛ$²[l’[l”	m¶Ê%–Ém\"Ao\0	„ûm\"‹Id’\0’I¶É$¥¶Û·óm6r¡0m$²°	H’I$²I$šIl”	,’H$—É$Ó\'d‰\"Òm²™Yd–\0’I¶É$ŸŞ%öß·ÿ\0Íÿ\0kv$h\n\'ÒA·Ò²Ih|²€–Á°%´ÒA¶Û$É÷Í5 IdšÉ´¶\0\0\0I´“$ÿ\0oöÛ·öÉÿ\0kv$ gòA¶Ò²[k4’l–ÓM°%ôÒC¾ÛmoÉ“¶‰% I$˜K´’\0\0\0I´›4–ÿ\0íÿ\0û´ÚMlM¶ ”\0m÷ö-°²I$–ĞlR%²É–Él&òl’[ \0jRL›Kd²\0\0\0I$›Lš[ÿ\0¶ß´“MìM¶ ”%&Ö%¶“!¶É$’À\0@$–m’Ûl&ÒH’[`\0èRL›Yd’\0\0I$›lš[öŸ¤ÚI\0Dº`\n“ ´ÀI¶[$–I\0’I$‰ I}´€$–É–Ëm°–ÙI$€$\0\0$›m²Mm¾Ÿ¦šm\0¿À“i2’@¶I$–Ûe¶Él	 ’Imô’í²Iˆ’[m±\0–ÙIe 4\0\0$›m²IíşÛ¤’Dm¿@„%$‰$“À%’{$–ÒI³_í°\"[’I4–Ài¶ÛÉ´iFÉ	.ÒH\0\0\0’I¶û$Û´Úd“m¿„’fÈ\0“Û%²[$–ÒI²[m´’\"[$’I$–Äi¶ÛI°MÉ	&ÒÈ@\0\0’I¶Û$–û¶	$’I\0&%-¤%&É\0\0e&ÉI\"I\0@Y(m ’}¶Ûm&Û}²\ZH²Yl–$€\0\0\0I$›$’I4I$’6\0$%$„¥\nIl’e¶Ûm²I€\0\rI } ’möÛm¶Ûm°H²Yd’$€\0\0\0I$›$’I¤’\0	H¤\0Hà\0’Û%\"@H’II²KX›I$’É$›m´›M&Ûm$š4–Ñ¶ûI,€\0\0\0I$’I²@\0D€\0-ÈälÄ –Ò\"@HÒ[I°H›I$›I$‰mµ›]&Û$š$–ÑöÛI$ \0\0\0I$’I²@’@ “jIdĞ$Ñ\r&ÖI \0!ùH”I&ÒI&RI$€I$’I¶Ûm ’%´YşÛH‰\0\0\0I$’I \0’I\0ƒkId’[\0-¶ÒI \0!0[l”‘I&ÒI&RI$€K$’I÷Ûm ’%¶ĞöûX‰\0\0\0I$’I \06I$‘÷Û\0\"Û!¡´Í&—1¶›|’SY$–H–¿I$’‰&RI´Ÿm lÙI÷ßI&É\0\0\0’I$’¦I¶Û\0¶ !´í&“!şÉlÓWK$–HÖ»I%’FRY´›m ;lÙYşÛÉ&É\0\0\0’I$’~Ó{íÿ\0û\0’I)?!›m¶ûY´›%6›í´’XßY+[&é%¶Ûm°RK¢[]$›m$€\0\0&Òm¶Òîš[möû\0’PI(\Z»m·ûÉ¾Û}5›í´’H–ÛI*[&É\'¶ßm°RH‚[Md›m$€\0\0&Òm¶Òo¾ßÿ\0÷Ó,–%$¶¸\0 –Ğ\0% 	l–À%’I%²B m²Im RìÛofÛíöÀ\0\0\0¶Òm¶ÛmşÛÿ\0÷ñlÔ‰!,¶ğH–Ğ\0”ˆ% ‰l–À%’I$\0\0l’Io$RH2ÛmnßoöÀ\0\0\0¶Òm¶Ûòo÷ùH€l¶fÀ%°I \0%&%&À%²	HI$\0	$QYòH€’o$¿I´ \0\0$	%¶Ûï»ï·ùH–’,’…&Ğ$I \0$›%&Òl²	\"M$`\rlAI²HÈ›ol›Ù´€€\0$	%¶Ûm¾ÛışÑ	”\0\'\'Ö&Ó%²KI&Äl–àHRì²m%òm¶É&É&†I ,¿I¶Ò$\0\0$’I%¶Ò}¾ûï¶ñ\0%d’\r&Óm²KI.àl–àHrlºi4’m¾É$í$‚É\"RdŸI¿Ò&\0\0$’I%¾Ò÷Û÷ë) €Y,²‰²IH€\0ÉH\"@$_\0·ÖiòrZ’II Éé$_ìMd²m¶û&€\0šI4–Òoÿ\0ÿ\0ÿ\0ÿ\0ÉM$\0[.ò	²I¶ÉHÛH\"@$[¶Ói²RÚ’IHMi$[l\0Ge¶}·ß$€’šI&–Ò}·ÿ\0ı÷È¢\0[gò(’@\0€I&Û$–Û$—m}¶ÒmfÒm·Û\0’@BVí0@+´Ÿm·ÿ\0m%¤Ğ ¤’Rıöû}öÈ @Ygö(’PJ\0\0\0[$’[$–Éo÷Òo&Òm¶ûšRÈVI @e|»¿Ûm-€\0\0¤’R~ßÛmÿ\0Ãd„€fÉ’[M¦Ûm·Ûl‰múiıt›nÛÙ÷Ôo´‰I$\0#nÿ\0m·öí%’ÈI¦’@üÖÿ\0¶Ãd€€ƒ&éM¦ÛY¶Ûmœ‰ıºIo6Öm¿ßK¶Ğí´‰I&R\0\0’fßı¿öı%²XM&’DK¶ßışÃ0’ÈßI\"Rl\0\0l”‰%¶ÍI²Io¶Öm´›é¶Ò \'\"ZÙĞ\ZenßmşÛ}e€H\0\r$’DÉÿ\0Ûm¿Ã\0¤’Zÿ\0iøK$€|”‰$ÉIóIm¶Òm¶ßi²rü@¥²WÉ°\Zegûı¿ßm%€JH	6“@å¿ßí¾À RK$’odÓ%6ÉlÖßI %¶è\0–ÓY´»]$–4	X@I$’$\0;ı·ÿ\0}/ÒIfälÓIg¶Ûo¶Á!&[Il–m$“2Il–ÉH\0\0%öÀ´–É´›O¥š,\rHPI$’$@ÿ\0¶ßï&ÒI\'àl’MÿÄ\0\0\0\0\0\0\0\0\0\0\0 01@P!`AÿÚ\0?Eé˜O\n$$uccb_£dqæ™rŠP_±\Z\\Ò”¼\"ØØ„Ræ—Z]RÄ†)JQ1=ĞˆMXc°³K­)KšR—ÂÇÇİcfÂ‚		bÆÆÉ2‚e1<¶0—„B„Ræ—Z]aF2\r”¥(„÷B!5l¬iu¥)sJRøXøÜk(^g/²c!5!5„\'¢–—ÊÇá„Ì\'½‰Pğ…áq´/²c!3XRë	½/†–—ÊÇá„Ì\'½@Ÿ¥öR”º±”¥(˜™J67ŠRå12—ZR”¥î,\rŒ¥Í)J1áºÒ”¥(ØÙKºSùíAøĞ°Z_e)K«JR‰‰”¢m‰f—)‰”ºÒ”¥)ŠÂ±\"—4¥)ş4ºÒ”¥(ØÙKºPŸÏQ/\ZlxuÖ2<Ò±æ—)‰ê1ğ±îØûáHK–”¥û¬b‰xĞ³cÃ®°™¥óK”ÄõøXóKš%Â—-)K÷Xñ^4.ğc,c)ulo4»Òë	Ç	Ç	ä&RåìãBï1âÆ=öÆóK½.°œpœp8R—(_ÅIğyü¬{ÒøÓõ(–´¿ué>	¼Œ~V=ï‘1?J‹Z_’”`òa±12—-æÒ…Ë	˜Ma7Bòñ„)ua¾kü/˜<›)rØØØŞa=(\\t¤&a5„İcËÆı?ua¾¹KÇBÄ•rÒøĞ¾˜ÇÊ4¼t!†Á{Ê^:\\ÒğÒøĞ¾˜Ç–cñÖ^8N„á¥åøßCÖŒcÊËr~:ÃÁáÇ	Âœ4¼£èzÂqŒyBùŠRˆ^;ëZ)ull¥òÒ”¼-İ³KÊ„!n„1å}A²”Bñß[iull¥/’”¥Ş”N‰]P³KÊ„!n„1å}HuãZİD!v2B)xéF<±ïBYcË:¨D …–1(_-^5­ÔB·cì„Š^:Q,{Â‚XòÇÎ…ª!eŒcÊËgQŒBñè?…ˆhk0™„OXN\ZŠ²˜Ÿ/à™Bùo1Ç¯àÿ\0¼l~!¡¬Âfh|qk	ÃK”ÄÊ^6xBùo?¨Æt;rQF÷LOZ\\Ñ±cöÒˆD&a„³	»C5âÇâõÎ‡nJİ1=irØØ„1ûiD\"0‚BY„İ¡¿à=0Îša5cç„!8iuü?>[+øL3¦˜MXùáN\Z]i~[+ø\'QŒqóK«ÆßË¥çBÕGŠş	ÔclÒêÇ¹±¾:_}/:¨Z<WßBÁicí\r		p°Âa1Û	Î…ª[Á}ô,–1îĞĞ—!fc½°œèZ¡e±à»ûèX®‡‘p±øÆ†„\"ãÒ‰‰óßBÅ\"ácñŒhB!>=(˜Ÿ1ıõªÏĞ<Ò‘“šzPµ¥Í/\Zbe(Æ!kĞí÷Ö«?aş8XóJÈNXOJ´¹¥ãLL¥Ä-z¿ƒ\'‘kK–Æü¿‡ç&¯¡åÃóT-_CÑÛâ¯q<‹Z\\¶7å¥)xa5},|l{Òê…«èz;Yş<RğVa†…z]á3	ªèB[á˜Ä/¼XØãÅ/fÁNØ·¥Ş0š¡n„!e±±pLbŞx<!nÇçcÕÃKËBe…EpyBø+ÚğxBİÇtcÕÃKËBe…D°yBû}±Xÿ\0NƒÂî\'»cz¡j„1”¿-1<¡jØØô!}¾Ø¬§Aáwbİ±ê…ªÆRüµDò…«ccĞ…ôXø{b´±ˆ\\ğP¾ÕV†„(_E‡¶+K…Á_à!h…«CB	”/¿è6P²„1ŒyBôÒëKÊ…šR—…T,Òå±¼¡|î·àÙBÊÆ1åÓK­)KÆ…šR—…T,Òå(_thhéÇüÈ\\06<Âs¡f\"ÅŒBû£C\\€ÇæBá„ñ±÷˜Nt,ÂdX±ˆ_tc:²…çBò…ÃKÃKçcåXÂ_uc:²…ç]ˆcÊ\r/\r/•c.Å÷ş‡l¡yá>jKªiJ\\Ò¯àş‡l¡yá>jÃeÕ4¥.Oßº…¨çnXMi}0œ(\\èY„ã„Õí¡h±†ıå„Ö—Ó	Â…Î…˜N8MXşïs Ø9D/8!zÒêÇØÇš]ØóKñ4wè0Ã‰şˆ\\çnÇ­.¬}Œy¥İ4¿\rD‡ö¨X-Å.iu‚Cbb|ğ‚BY„áBç¥Ş”¥)JQŒBòÆ3¨Ãûd,â—4º ‹˜Ÿ< ‘3	Â…ÃKšR—{ŠR—/¡ˆCXÇ‹í(BÎ³	í¥á¥Õ¥ò¡s±ı÷Š³¬Â{ixiuB)|¨\\ì}¼XØØâe.isK­/µŒBá¥çBİ(Yllcû¨]âÆÆÇ)sKš]i_µŒBá¥çBİ(Ylxu±0Ã`¸Ğµ¥á¥Ö”¥ğÒùix‰Œeş±Fl\Z´¼4ºÒ”¾\Z_-/(ÆRÿ\0X°hh„İ¡­aNxLÂxi|,|hCè_p±`ĞÑ	»CZÂœğ™„ğÒøXøĞ†=Ğ¾öÙ¥İŒ¥Ë…ÆØŞiuc)~Zô¥(…öşƒè­ØÊ\\±ˆ\\méK«KòĞ·¥ÊÙ(ô!nÇ¬dÕc¹XùP½è\\h_dı?G¡v=a5BÄ.V>T/z\Z×í±h‚$,¡×:*]Xûú(YBõBúı¶Ğ‚$,¦?:*]XÊ_…”!T/ª…ªü,±æ†—t/l\'–ziD/¶…ªãî…–<Òæ—Z]Ğ½°ZQé¥¾ïc¡K‚~ˆBì~±ô?+yc#&P³1ˆD\'Ùìt)qQBİÖ!s¾‡åcï,d&P³1ˆD\'×B;4±ˆõcóÂo	Êó®ZR”¥ÊB[Â0…õPÇM/±ˆõcóÂo	Êó®ZR”¥ÊB[Â0…õĞML|,|4¥)KÂ„1æ—V<ÂjÇ¬!	½(„1ê»…Ã\n!}d š˜øXøiJR—…cÍ.¬y„Õ!!XBzQcÕv!…¡±ë,Œc	Œd&«±|°Ÿ4¼0œ(ZÒ‘ˆCìF1„ÇĞû!5]ˆcå„øp™¥á„áBÖ”BBÃúä,ŞD!2—v<Âeb…¬\'\r(…Ê„B…—z^ú¨Y¼ˆhe.ìy„ÊÅXN\ZQ•„E/.ô¢àQ!!/…Ê…’Br´4BfŒŒ„!MXz¡5cñÂeô=a8ér–ì%•(\'+CD&b!B„&¬=Pš±øá2ú°œ¥ÊDİë¼P„Ç¹)JR—4¹ŠQ–”LLcìoZQ1>!¡¬¦\'–=P†>6?®ñBxÑ?2R”¥.iFB)D.ZQ11ŒLOvÆÊ\\Ò‰‰ğ¡\r\r¢bycÕcãcù?ÿÄ\0\0\0\0\0\0\0\0\0\0\0 01@P!`AÿÚ\0?Jy[ƒÉ{â„)s½ä„İÇKå„á¥Ì ´¾M(ÔWÀƒGlPh¥!v?/–\".\Z\\ÂIäÒùXÇ¥ÁÔ¥çcş£·ÌByXúr—%KÎÇü)Ûæ!!ÂÇ‹ï)ú\'àÇºü!B›¤%˜B„!„ˆB„ÏB„!	’„!5A¡®#ù¨C…ŞPOÁt\"—XB„!7H™„!BHH„!ˆŠR„!BÔ!5A¡®#ùì~™ˆX!wŠD&R\Z\Zá„Õ!/\r(˜™K­.¬yBû¡Â³11îñ]ˆ„ÊBCC\\„Õ!/\r(˜™K­.¬yBû‚AÂ³±a×Á{iJQv.††³J~œ´¢[Ô^\Z]iJ]ØõBù;ƒ…ebÃ®ï»ÖÆÊRˆCCY¥)yiD.·¥á¥Ö”¥İT/“±ûå‡Q|–<Âf„!5„³Be¬Âf®,±ÿ\0Ë¢ø,y„Ä!BšBY„!	„.³	˜N4.¸P²ÇüZtÎ…Šá¡®q–”ü*ñ¶7åBü¤\'œéÃC\\â-)KãloÊ„.+ùHMT/a±¿Á+Xcİ¥ËCD\'&a8a2Æ!ÍBÑd!ı…álq±±1E†=ĞÓ÷hh„ã„Ì\'&XÄ!y¨Z=Ğ‡üx±‹\rat-[)JR”ll¥)DÄ÷„&”¹c³	çL}Ğ…üx±‹\rat,Ò”¥)J66R”¢b{Ä~kK–1?‡ç1ŞèBùÆ¢xÛğq±½F=ĞŠ_nÆÊ^,>v?\nÆ?™Iãl[©t/&[±ñ¡xXü(CşdÇéZX÷BĞÑBd„!L‰	o	ËJByéwLO÷ÇÑß+CèZ¡L„!B		o	ËJByéwLLCÅ|µƒğ½Vığc)WJR”¥)K½)JRæ”¥Í)J&&1”¢by¥)sJR”¾‚ùÒÁø^óØ_ÁŒ¥ác+)JR•”¥Ş”¥)sJRæ”¥CÊby¥)sJR”¾‚ùÓÁÂÃGc¦Xö[ÂpÂqÂš±ñÂœ4¼-ì†üæŞ~0ß¢Øé–=¶„á„ã„!5cã„!<mîã_:7…ŒêwÊ~‹ùÂ…½.isJ67–†²…ÎÆ!~=Øò…”.t\'¸oÂÆt;åEüáBŞ—4¹¥ËCYBçc†?ìyBÊ:ç±GŞWôOÎ$-\Z\Z!B„!Acú,b—ğyŞSôéÄ…£CD!B„!!EŒBú1ÄğbŸ§ùÂ…Ê„1êÇôXò˜ŸÑØüO!	úOÎ.T!V?¢Ç”Äÿ\0„Ş„t?Ş.4/l\'<&¬{±ğÇÂ?CÒ‡ûÂ…Æ…í„ç„Õv>øøO:Ì…‡Qp¡oJˆB”¥)FÆóJRæ”¥ã¥ñ¡ef<!¸/ŠÂzVd,:‹…z\\ô¥)J67šR—4¥//,{1á¥Á|VÖb‹¸>-aB0„!B„!B‚ÇÂ…å„ËÇšŠ!\r…‡^\"°„!B„!B„!B‘ˆC\n–,ciD/àÅDğ_Ó ÈOÇªD&¨CÇ˜ˆBfÏ	ÂĞĞÆBY/ïK3 ÈOÇª	ªÆ1æ„Ì\'…¡¡Œ„²,_Üx66vÄ¸¿‡cÕBì¿‚màÙNØ—ğìz¡C	ƒû·‹ø-bÅ.èZÒ”¥(ØÙK˜B”¥!\nR”ll¥)u¥Öå¼Ò”ºÒ”¥.¬z¡]Ÿ}xLLÒî…­)JR”ºô¥.zR”ll¥)J\\ÒêØŞXûÍ)K­)JRêÇª…ÙK÷O®\nÇº°™²ĞÑú~˜d!B		\r\r‚BY„!L´4Behh„!5„İt/¾}pV=Ğµ„È…–†ˆLŒd& ĞÖD„³B™ƒD!0„44BšBv2—T/àXAvuËèBÁ„óÂjÇ«Ç”-PŸw!Ó,{¡_Ï	«¬cPµB}ó§Et-ôÄÊQ[JQcÏJRíĞ„1åŒ¥ÊÇš^Qt-ï:L{¡k&&RˆBÓJRˆCĞÙRŸ§é	¥CXÊ\\¡y¥å÷BĞşç¾àÇ”,¡b„ –xL>3Ú\ZÉBjBC&xˆˆNMRİZ]/¿¹ï¸1å(Y„D ‘JBf—…¡¢¢¢„Ô„†<Ò„\'&©v=h˜³}ıÇmÂ—t,¶6&&R”¹)uü?\nR—4¥.iJR¥)JR”¥Í.iJR—ZR”lo,Ã.ûÅ.èYllLO%.J]iJR—4¥.iJ\\ô¥)JR”¸e.iJR—ZR”lo,ÁŒy¤.…ı\'ç;CY„!Bx±”¤ –a¬cce)B\r\r‚BY„Ö„!3BjÇº‚{éJ_;øbBôŸœí\rf„É<XõÄ„¸F1—ŸB\r\r‚BY„&„!	˜BV=Ğ„ßJRùØöK‰ã1îÇËJRñ±ğ¿´cÚ.$/ŒÇ»-)JøØø_Ú1âÄ!Rî…˜LÒæ”¥)J\\¶6R”¥)JR”¢bzK—,{Òê…–10ƒûF<X„I¥İ0™¥ÏéYJR”LXll¥)J\\”¥&\'¡”¤!K–=ÿ\0OİP²Æ!fcáhõ|l…šQ±²,d&RÌ ĞÑ	¨Bš¶!	…MáL„DBBC	»ìyBŞşÃÔ\\l…šQ±²,d!0–a†ˆB$!M(‘	”&ğ„!B‚BC	»ìyBŞşÉ²Gc¨¸Ä.³	«è|ô¿<cÚòÇĞşÃcdÇQqˆ]fWĞùé~xÇµå¡ıµªâ!f”¥)D2—(ZÒê„R”¥/\n[¡yØøV,iBÁê¸ˆY¥Í(†RåZ]PŠR”¥áBët/;\nÅë¼¨XK‰BëXLÂœº^š_xò/®ò¡a.$!­a3BoKª^š_xò/³cì¢~‹‰ÓK”ÄùXøa<¬|+îv<Õr„ùXøa<¬|+í}Ã?DüÍ.èZ±ğÒëK–2—–•¥ùØõ¥ËÙt;}“ôOÌÒî…«\r.´¹cç„åB)GĞùØõ¥ËÙtÅã±Ó}Ë	álo…4ºÒ”¼lÁºbñØéÆ„>‡åˆ‹ÂØß\niu¥)xØÿ\0‡h:“…0‚A¡JRåll¥)sK–ÆÄÄòÃg¥Lc)JR”LLaŠ\\õ—~²ˆZ¤.ì}¨A	Â…˜AKúR”¹B)J\\Ò‹\r‰‰å°„)GC)JR”LOÊRxB”BÕ»ßgì~E/\nâ([Â<…)K­)JB™„!B$!$$Bf„!„µcÕcûö~ÇäRğ¡kŞ„Âğ™!9øB0„!Bd„!„ˆLÂ„ –¬z¡jyÂë,{¡oKˆ$&!nisKšR—V2¢”«4¹Bá¥äcÙ¬ô;}g™ì.²Çºô¹hlBİ¡¼Òæ—4¥.¬e)Kš\\¡pÒò1ì…Öz¾«²ş~q¡f”q2”¥Í)JRæ—,zÒåËJR”¹¥àcşÇ¬¿£ë4£‰”¥.iJR—4¹cÖ—(^ZR”¥Í(˜Ÿğrç¡¹hh„!B„!L®ÄB™„!>\'…ûÏB+.Z\Z!B„!B+±„&aO‡	áA~L\'\ZÎ°‡ûÃ!b•¡®NXN6=Ğ¶cÂï¯•„ãYÖĞÿ\0xa!ŒBò´5Ã	Ë8Ø÷BÙ[¾¾µkgà/Ö´¼p™¥)J\\Òæ”¥)~\r.µZ^7Ğõ¿¨ú³ğª^|¥)J\\Òæ”¥)~\r.´ºÒñ¾‡­üf>V<eü±uäHK4º®Å˜LÂd\'!<­ñÒ¡¡®1²—á±ò±à†üô]yÍ.«±f0ƒd\'\'•±²—†”hkŒc)~ÿÄ\0(\0\0\0\0\0\0\0q0¡\0 @PÁ1!`AQa±p‘ÿÚ\0\0?K—çşsƒƒƒ¯ç—^Íc/*2\'Åİ¬†Ş;\'w¿ÙíOó{ú,¯ZÌÅ¨|R*â7œY¥æ5ÂĞ,ı9bÒœ?ñh:ëÂ>p-\\ZQkM”;T•DŒ½Qn\ré›¡º[Å7–-UYüÿ\0ãÚ»yÌZ®-8µ_29ÎËÿ\0ÿ\0ø£ÆCÆtÎÒÆËKæ_p4Î·±?üÎfò‹[]¿KóÔfñÌkcÿ\0[Ş§‹@´Hçò£‹J-aóø´…§ç#°ñÒĞçQ£	gêk©âş[\'÷şr‹@µşï/û_Å¥:1j>µ¾tñÊ-SûÖ?äğ´çV4gGµvşPsŸìîûÑ×ÿ\0ÕçÁŸ\Z3ëÛˆ3‚HÆ¥¡˜\"Øœ_?mºsìÚ…­ ¾«c±;k—çoäÙ8¬÷±\0¨8Y·œRİjÊ\rë»7¿šÿ\0íEş™À´k,Y/¯œ\Zşıâ;R¦¿¿ğÜ¸^ßÖ°püşƒ*¾üÎ ş<4³ÿ\0Úkn’I~ûñfÃ®‰ó_„*UX›ŒQğRö-ÒœÅ§9g·ÿ\0OŸÅ©üZ|ó)??»›©”Éÿ\0û7ûÍêy›à«gõıÿ\0Ö´¼U~ÃœŞØßÅ©ç¿ïœ¨´\"Äéáù©ÿ\0ö÷\ry|r?üã¿ÿ\0-7P÷âŸüçıàQøØ´k!hWÿ\0ş;u>}¨r>~§ø´AÌYOûÀ´@´âĞ-G¸µ<Z©Î7F×çÅñkwáMèñ½>ùJ87\Z‰<GsÇ0ÌV}×=åÿ\0Ç5§¢gÇïGæ;™È«7Ÿ¾NŒš¤n„#§ù#y³²ÎïÃ;ßÎ_hg—Í_¹àgÜOÿ\0ÌLJœ}Å‘ï4ÜŞÙ9né(~NğvÉø`æ–OÜğ²İPÊš[‰ñísÚÉ˜ï¹ÜgŸÂÙÖååÿ\0£¤ßØòS\\W”ÜTl?Ç?µÊ‘°ïê™Kõ×\n§Í÷\0üQkW»²Ò¤ñC“’™\nÛæÜ?•ÁáÁ—ºÒ•|¿õ37ßÆ®9ÿ\0¨öÖ&å<l‡ÉIùÕtÁƒÊSš<å;_ÿ\0œÏó€Ô@ßÊşÅ’çşynÅ|~ŞoÏİ1}öòE‘	£à~mÃ®@ïfçL‡pŒ=nÑìÔØï’’Ex>~âş«¬L>ıXyUñ»ëJ0}•-rq^lÌK9ÑçÚê*ëÈ¢ùÚs\rv…<R%<OJï.ûËµıL÷<ÛĞ¯xb°Şêæ‹1{‡¦âÓıÎûâ½@İìœÎşÒRıUî°RyÌä-Dç²ø´@µÇıKüZ“ş·4+}>í©G7½–üÿ\0òİáGî ¼;ıóæ÷­â·\"òp³4eşe÷Wşš¿%nÃê>¬1½10Gx“Ÿ.ˆrìMì1Á\Z·v[é$xäMÍ/9‹HZg<äs9N½y#ép_<KåâÔqXŞş}hfyWÿ\0çâÃºEMï:Jÿ\0ù¼ïõóµ¿·~ã1ß4zqı«ÿ\0ÂÖ÷şîªxµ1iY‡Çÿ\0JîÎûW7ÌgÛÔ¥&”sM4ß²±º•Û=¸h½xõÚ¿Õ!¿ˆÁÿ\0Tö Kz/ÌEî\Zu‰¡—W±-h×Lg~\rdòË£D8eÑócğCAøÿ\0uÓtÖ—xm@`\0ï‹bhêLt~.iÁ2éœQBŸõò8rIÑ:ùÁ£ÿ\05ş-Ğ-Ö‹t6Æ¾vA|[ÏN8½û§îğQa;!b‚R›¬¨ÜßàßªĞcfÔı¢cN‰xKä^¦âìg$,BÜÄÿ\0\\Æw‹©¬ñEe&Ûp?*	»übìŸ{.ñÈùÚ\'51doÁæàœÕü§´4öÈµPù*YĞm<Hx³ØÒ\\nù\rë“¯êI›cn<|Ùª½û0-–ë`ïğ[\0ÔÏn´?Êÿ\0ÿ\0`f¿ÿ\0‹+‹KOß½‰Ÿ0ÇL?øï‘wøÁê¯¥oâvXDïÉu¾|S¿Á7y÷mÂºâ-¾“5ğ7¨»`F¯Ş<ßÒ,Ù\nŞ\06ƒvÀÜç¶Öq·˜ƒøÃëwó¶`š½ÆıÙeÍ%ñ_o r²Û¿Oãpİ™Bvº¡ïÎÌzíÉÒ˜OóÌ.t¯ã›¯3ó!£ììÆäaJßQ¨ta:¼òÏ]úO«ùÊ-O£8œZ¿4¿‹WE‘T3Ä·ÿ\0{Ÿ°´ÛÇş|eïx‡¨’¦ÙW8cÆ	‚ÊàxÜu÷ï†øğXµŸÿ\0ÿ\0»Ùoİ´ºKyM~-Ğ,§aı°ìÎÅ Z‘j½z ¤$SıÁÇÇá=Æ¼a¢´¦R•@½äÔlf|OqnÙ6²ôÿ\0¦é¥ĞŞşóncu¾û‘¾ış,ƒ½æëäÎw~-ÊwâĞ-ú\rìÂù¿cÿ\0ıÃâ*éïûÒ=ØÌOûH®äêô0ıÀ9¯!¦ÛÜz‚ûøA¸É¢~›â^”®nä¯TM=\"Mä§¤ÏpŞ4û‘÷÷ ~çœëÔéĞûçß–¯öğwÃ“Ô;È?7øoıÆ>šê£¾®/xDÅ¾“øQgÔj¹Èwı3ãütğ×eödƒ¹!ª1|QÄ{Ï»÷ß³\"÷ğ¼Zˆ´³˜µ_ûFùÊtØ´J-#Wiuvcåù×Ïğş;…h£Åö?O¤Ö^Y.ö&×†é¢ş¾=\n!WtãL×ıŠÔõ$E>Qr÷Jæéùdÿ\0:VMŞ±“·´,¿óïı¹ÿ\0)æGĞoá‰ş|7Or@İœm²€l]ÔY|‡†À«ÂşäuŞ©Æct-aßœ£üu|Ç°oö\ræm	öŞ%]0fİ7Ş5Âók¿i½&4óƒ®r;/z,…]Øˆ¾7ã)À²\'ùítBırûø?	Ûùµ¹Z»}ÓûÂÎÍ:ÆlË=[İ}³ŸGª™¾2ã[6üƒédnü\nš}ôºsÏêy!qc»ÈK¶\n?Ø´k~Fÿ\0‰¶»§Ú í¨Y°Ö¦1u£«ñiNYÓw‹Iœ8<\'Á—\0oÛïqî>»W×ïÿ\0·úoOÆ÷:wÍÖûùº?œÎ9MY\0ïTwâÓk}¶Ş-•}^-g¼zópˆñoÃHµáp™Y§Ó-Õµ®½Üò\rïuuŠZJºÃİüÌà-˜\ZñÊ¸“Á¤Ò{ğñ5—\Zf»ú/ìùëÂO,ùP²æ§¬³û è[{‰°ĞŒûßƒ= éı}Díú[zëjûıú_\"¿84<èâËÿ\0¥Úº7Zfÿ\0ßÉ§ñ§W4íVÎ2¥õøtï~ø÷–É<‚’ü=]¤ÓlórÅ Ô¤©²šm¹ğ4>¾ág$;Ú0çúóÿ\0rj€Óáp¶÷z_]u×ùè§şO¥ë°1ÜKÁ6ıÀg˜³ªˆ»½l%ïÅbÕ|ûp ºÄQÿ\0·/@+ŒC{İÖ#—\'K¦GŸ8vqoÓ¯Iÿ\0kiMîŸ8š€ûbUáÔ¢ûP—d¶;]éZŠd^QkoÕ¯ÇÓ÷¬§aÿ\0¿õO¾í¿ÊLŠÛÍìÓùÚ½Ÿ (Ùù»åG‡ì	óVsÉâşLÿ\0;7^;ÛW÷´8v6™Mmıó¿~GŸÃëo…Whiúƒ·ØŒ¿ñÀ{æ}0şİõY\"îe`S~Êõˆ\ryV>½Hú<_®áHîğÔC]ëyoİQGùƒ‹ÛÁ-<oùü2®x¸¯¾^ëÃ÷ü’_V\\ñİÑÇI„n¥	¿ªyËØ°»#Ï?Œ8:~ÇËXÃµšÛ~-Wó_÷İşüÿ\0®÷ª;ÂÏ:E¦ÒÍw…½9ıL&Š\0\n÷‰3ÙºŸşÕÿ\0ÿ\0{©\"Û§´>ñe¿\Zıı¼jñdjE½‹#…ˆ|g-`ZË¿ßd;#y©ïlÌGOÊ\"WÅ­îÏ¶ì{ÿ\0›ÔüR®÷?Ïÿ\0~êqVÿ\0¼E”¶>å\Z‹\'ÿ\0Ç†½ó–3ô:û÷Ïúp•-Ãöø?<-eõšaéšSÊ,xºşÉß>v\'·€<¸<åÃİPñm%İ¼G?Îm>7ú>€¼Â½×ûşÅ–ÿ\0Å\rqkÏØıÓöP7¿óœèÙ«Ñ™ÿ\0ÿ\0|ZË¨Wùï—Z9M•ü5¸éÁÈàñ½(¯2âí“ı×§e&\\ù*yÇ¶\nÖÓ,?eC¹o\"ß}ŒíõC2D_ß£Ùë´;¼wkïßóıöãGûè4r¾hûŞ-Gõ–-×ÿ\0X¿‡`‰áõ«¡z2-üÆ‡koOI3Ó÷œn¬¯øâ+±ù°ñÙ4÷,\0—>>êÑïé0„oK<\\wá® bé?®æ÷ÓÍgŞ·Ñ£üÚÿ\0çjßÌ_Ş’C2p-Mó´½ÿ\0Çïp´÷mlìa4Ï¯”ÿ\0Ö¡q±nbØ/ùÛıëéŸUÿ\0şğo/zÿ\0¹½Åÿ\0÷(§Lj<^ñe¦Ã±|/õ·¾œsëàó¥v„ç¯)dÏ+ÁzL08æ,¦uä¾Õs´($-{oAÃşyÜæ|Ñ³…¨²\Z¾w{£œ/_]öÃküï;™ú½bğ¯ñ;]{\\òxWP{âÕ¦ş+Ñ8¿ıÍõıt;æ/ŞCOé½‡õjçïNkTÍ÷(·øSŸø¥ÿ\0‹%—¸²î~ûe‹§iÿ\0·p¹¨ãûÕ0°¯\'RüğU=·Œ]Œê+§jİÿ\0û²4†”ÇpßH{ÿ\0»ÌÏn¿ı›Æµ=F÷K›?şÿ\0dğ™b\Z§O‹Aİ{>½:Ñ÷5e9óoâ}W%Òÿ\0:²ğØy¾¨÷™ÁÑkó¨È\Züukò}u’|­ş3¾÷`ã¿kvÛ¦Vœ#ZíüêãRÂÊãGXØûæ~4/«Y!ákïÓ»kÑKİz\nÕ|¥o·o1„ßÏâûÏélâÔbÈüÿ\0$Ù~êÛ_lú?N{¬ÿ\01õñ­åó&ÉsŞgË‰êú!ù†\njC—ë3·:†•ŸÁ|í9•h6hZø‘¶™ŞfKze]q¢¼¬%Æ#İ•¢w•ıÅ³»÷³çóy¶oçıºşÛÆñô6\n<@ğs×W³ƒƒj\r|šjÂÃóSŸg…ß‡ıjèù~oâïu§òÓw±”x‡»¤ÇìAÍùÇÙzÑ\'¼¼½Ÿ~ÍYt÷ş˜>õ®É³@y¡Í´ô/z¸i6s»\\¢ôâß{ÂÆ¹êùƒKw)×ãƒ—»ıÿ\0ÿ\0·ßÕãGñÿ\0Íwçmæ´¯±.57Ç1›\\CÒA:Oÿ\0,G¾û´ä~İõÉµ€ñZÒq‹ç\nÑı%ï@¼Ælvò\ZÁÚsva¾á\Zw…¾İüç&=tåİBpÀ.Ôq°vı™úóÂ»ÜÉã›µi¿íyÏ¸7§Ï».şj_ÚËï²í^ş-/[ö:A…:v9äÇà1è»JşrÈ—|&¥ëŒ±÷¢î_vŞï)¯÷mŸu“ÚWéÎ®Õ{Ÿ»÷¿}î/»ä¥§Ö”ÿ\0âÕS1R‘r3úãÃwÕõûşQá¿Íåñü	bĞ-_ëqï½ãt/×å:=ùô\Zÿ\0ÿ\0™ÿ\0åÿ\0¾¶û›÷¶õüĞ¦é~\n»ıßáŠNù÷…§¦7^nSÀ»AòX—ÏŸñ¦ş×øbŞİäç¤DÅO¿ÙÔĞ×{åJ»·X_xµ?õNşîgÿ\0ß•åfm—Ó¾çiŸôÌ\\éÚ$Îë·\'h£ÒÚvûZX®ÁO6é}çÿ\07ş}ù·ÿ\0\'ÿ\0şëõ¬µƒNı‹-üïõKëPÀcçÊªıÇVX ü¡¶fIº§.wó«Ê?IƒØü-6ÓÎ½ÿ\0wq‰èT;ûÍ	§§·—f¶ÅúÖüsYŞyv^3ìfö¨¦i¶èpöøäÑDv¢ØâsÌ;Ú|±ÎÜïİÿ\0Š÷ÙÀ2#—çûvö&ÓråñCËŞzÌÑlWê¶Ø±äñ–¹^î\n¢Ø¦ºàUJìşùÿ\0ú¿B ¶ëAwdD÷×˜ôkànü±oC[*OŸËÆt1ÿ\0?Gİ)düöŒû^V)Îµce¦wTkná{ñ“OChöÍ·uÃóvôİã®DnĞôûBŒ3…Ìú9×yØÏıèTsµÀ\nî¤_\nÃ•ÜÄqåóÏ«Yzõ­˜„ÿ\0¬õIëÖ7‚¨†×x7ÃMDkÛb7O¸3u•ôVƒşqØ\0|È-†š¯íh}òabvÿ\0O©ır8\\¼=>ß×æôÔüFö§ø	¢oõ*\n-Òá~iµUO+@«&~å†*¿ºZ*i¤°“lÃÌ±–Ù#‘Éšn‰µlÛ¢-ût=Ö‚s×F®ràƒß<Ó×H¶îõˆ/Z¢šãŸÛC÷IİzÇ®ËÉ„;ß±5×íœúÌŸ¶œoöy÷¤öü³	Ï«æQ wxá+ı-´ëîfŒXmhàí&Ò·¿âÚ„ÖÜsüëëÇÏ7“ìDÓza[Ü¥ÀÃŸÃ¶`ñç)ÃÈñğÌñ¼[¦o°]\rŸÚ.³\\m®Ì3±·±ØµjEF^sBLœ§úÂ«a¾Ì­û¨º5ä6²ƒ}35œşŸãÓë3šÈfÙß¹ò½çgâ§hŞ}µ?×%åC[¿·wl|äŸW`v©¨æıó‚#2‚V‰én;áeÀÂ¿p—ï®“ïàğ-º$Øü¦?ëQÈ^ß7¬$[e±O²;èı|[sï5Á‹ÃüÄoéïk†˜dÇ±œÚıvàWÔş._úíæ}áCÿ\0ıkÿ\0ÏïWøíûÜÏñï,^k¾ÕâÇş¿Ïã¬psÆ¢£˜Q¯¦àèà—ËîiŞúÏ§õ×sùƒ¯·ŸÈßß5¥¿ş=îicÆô©’ŒéUœóµùu¸\nuÔ;1ñûßîŞäıÕü½È_>ÿ\0ÏÀõ{ ªÙNôÿ\0×ı74Ò;øÅ÷EÀ›ãÜ®4îüê~Ø‡-ÏMa»xbuÉó{;ÿ\0HBô@€‘\"7IÏ|†+?SSÎòâ\r«ĞÏ»Ñx.á‘?PG|›–×ïäŞîÿ\0@2¶š%ş®TfHª‰÷ë¤×š\\örS}¯ É±úTÙ¦‡fÄlùr\r—ªÔÁó¹ıƒ¾òGRÆ>¦H8h%è¹}Æ¥î±ëÜ…çC[ğ±ÚXC÷°ı.¹	êc=øÜ\'g„êŸ[İî#KÙ¯ù|ş À:©Âå77v0•ÁÇ 7ó2Ñ)\rWë<~†¿„œóç¯¡İf&¿Ø&£]z{±ğ¾	¥/Tü| 0B\"m°öá»Hw1»Àonb¥Õcın<^ Ïg¬çæ%†ğ{úr—È—n‘J}y–²¥ó½ê†YÁæJk[xÉ‰U-{õ‚_oïæ0şbÓGl@ISIÓÈÔr<|0ß»8õÏÈmÿ\0%ºX÷?qÀp‘pP^tú>ü}@wIÆÜÚ÷‰¥¬ó`·|¹º]ß‡+‹[CıâL?âAUÀ:wq÷ıoÀó,—]öM¶WyKiTÕŠê¸ç“šr&ñ?Ï\r‘ã˜¥%¥a;›pI:¼9ã4S¬Y}¥Á—æ;šQÏ¥L®l\Zoñ×r<»\n”¯±SÇ“ˆ+ĞmÄûĞÎf~ü¢‹ïØÊhô|]{ógÚî“à¾®ı‹/8ëğË­vÙf¬ÑøuãŒı‰ö«á¤×UªŞÍİÍğ^ûåÏİó^-WŞT¿Å¿öù/ìıñ#[8ÚûKEKg:{/Æ³>=Å¦-_»ıôß1ìVùŸZÆÆ¯ÂØZÛş[öô}şõè½Ÿ¤÷87»ƒëk\ZÀ¢ˆ=õ°IyµMty¼ñB¢ş”Ï\\?¹,­üı­MÕş\']Ï/ìÈ|üßî¤Ë^8oú|£Ìë38¢Íó°§£Æp‘Z›Á³â½ñÿ\0V{<!7ÅòiÜè^ìOíÿ\0z?·¨í¸íÊ¡[ˆ7Ø¨Ú‚VŞ)+¬{êÉüùê8xÚ””,KrŸ²…çL[*§õMÀsóËTÑÿ\0t“¶+y…ßjøk{V¾oì][PÏ‘\Z×Ôhõô¸ÜgmYßi‡ä—séíOfQ÷‘®ğşÿ\0€ë¼H]-s\'ÎQF¿ Å\'çÏ[Çóx´ıı\r‘l‡šûÇrñ‹@¶@Œ~\'W!µF ÉûU‹x4ÉChqŞ±ıbT Î<J­÷D¨§­ñ³»·ëÌr‡0,Ú$\0ü5‚øÒMWnpºôİ?¿‹ã•Ôƒö¸ve† #\'ôàqEV;wø=\n&[ÄÙvÖíøÛ1¤ÓLF/#™Kà¿xIcşe³\rNuÉí`á:R×\nh:5\07Pû|^ÔHqtÀÇ½iÃøö;‰µèKv9ùüg?!¥\\”ğéûIº¬7¼=›“2ûaE®2SjåšÏÿ\0h½ä?ˆ_¨ñ†øÃ{¶ñ£vü§ÏT²³\\\"\n°¡ÌÅ®\ra]/Hëåú(Ö¡\\oÚ\ZßïœK…=·!@\'Š4¯šfîpvèÔtÿ\0Ò;ÎêñŒ~²ı\\\\¼N|µï?j6Ôü»¡p˜ÙBiŒ}&=Ö¥°óïp×;ò¾pàîğ‚>jæ+¢ã’`½òåİè}¬scû¸Ô~-yÜË—v÷~‹m\rØ¿ÛŸcNÿ\0ÄÙQ|¨°ã\rú+ñ=’?Æ½­ç×k¯‡ŸŠãcîåû}Äjïº°•ıÁ/z·¾osŞÿ\0ÿ\0ƒ‰ôÜÓ	§p¾.§;ïâºU–Xæ™ë,\\iYÍWôE—Àç8à4}%:‹´?º¤=%›¤íš÷óCÍ¼¦³xÿ\0\nh¿÷G6?şôçŞ±§rö”_‡ò·ÿ\0Íƒâ¸ºâóûì1™GÆµŸÒÇeùÅ¯?òqĞxş©¿›ŸølB\"Ÿ¸SeaGÙ§w|?Ûeƒ‚]¹ì{÷>“Şğc—×†½ëWÔşßó[qÀ5áG¯Ş\Z“°å×{%1?5‹OQ7h…ûÑ,T9_ã-\'QÜZñú&¸ïê¨|bq…µ=Ÿf¡~•wÂ³‡Ûã¯\'çµõøkX.ëÔVßÌä†C|Zßïœg{åu<Î<.ÃoÌŞ3.ÙËnÏ%?AõƒüŞ\rñî}°{ùåıx›ÙÓIKm?NÌŒ\\S85nx˜ğùlŞ6p”³ºğÄ>n—¹H¶–·mCWÕ¼/vz{ÿ\0ØÖ»´Ey&yé\"Ù™4\Zû\r‡ ·œRûÄ&aÑ\'–ƒ7qÇãmü/£ëÿ\0š­Ï¸›Ş|Ÿ\rÌ.R$pœ0ëI®‚0ã¼Ûä)ºp{v‡¢zQÓ*ÁÄÚ>¾†îóMï‹fŠè·¬q¸ùš-›2~+>º¯5¿ö¨L÷é¼Á“Ú®ŞpÍ‡Ã¯ÆòÇ5ùÏk©Áï#µNr÷ß±&?«»ÍÅŒ¶Ñ—S¯§¶Ñ]óTÛØ/š®Ÿv¬=ƒ€EL‹?,2-ÄXO]Ò\rÁÙ”Ò‡Ü’ºü.åÆ»Aït{_NúÍ…öáÌ—ù\ZéÁ|bWéÍ7qôÜsÒ‹mn9õí3öYàÓª_?¹3“Ù U¹šß\\„¬gp¸şá8ã¶îáGì–öN;š=çÍæ7ÅµrbœøYñD|ãŒ/3°?–9OF#ÓEĞ=v¨?ùıØãHzëÛÿ\0m\0ñî=gAŞànöJsğ…~·hÒëEŞ½	ÿ\0fòÿ\0ğV¼r?ĞŞüŞ>×öoíÙÓuõë¾û‰½wÄ7Fö|R:ps€²`ü×Ê5¦\Z»ãSO{=øQÓõ!½¾u#ıkîMï7«ÿ\0ìŞq¬÷Å¬;üŞoW[tİFiïM-\rÿ\0şşí\rõï«Çïøÿ\0´v>MÂÓ^¾Ï‰ª“ú¸æöÚ}š§¾©4>¿»/Ów‚‡MŒ}yƒíP÷//ö8I×[ışvV÷Ëİúü?éşÂ¿ï­Ü¦ıO\"ø\'Š¤xõ˜tÜ›Óxø½@¡÷—áb-ıgO µ Î2£ª<}ïúp²[£]­õèü®OéÅ]DÇé¹uÉÚ<£¯+OÃ<Æ8q8K O†:¦Ùâ[?uç0şB‹íøOî×œõ×òWşçò—ÌçE§á§¸Á¼¿_ƒÅòş&ÿ\0ünX´í÷wŞ‡ñLRğÚ:\'èÄú9şp	ix†Á½æÍÇåólÓÀÇ\\WÛÄ¥CñÎÕƒ@[“ÙbÉêE-Ø.~_ìÄ§gda½šnä[¢ŞV[·ñ–ûó>j çGıö:¾½‰ß®Cı÷Æô¯í&Şÿ\0æŸ\róü\'›yı·ºïj.K÷z{EíÃaºœº|BûŒ’ì¬‹ıĞ$ÏşWïê\\ƒ;ıwºO–ñh’-^áò`é±®ºé*l6Ç^mî\Zµh>Uyƒcã«3C«d7eÜ^|œşqh`tóˆö®óıÎfëÿ\0¸Á¼°Øëÿ\0¯Ùhß%âT¶Ğ±ñÂ~¡‡³Sf|xSGÓu¹Z¦Æÿ\0èı;?ZÍÿ\0ş)ÖDhŒ…*ÁöÆú:ÏÏXÚÿ\0òz_ão^­‡·ÿ\0~İşnŸ}¿xuùç/ãÜÖ|úÍ>ùı|j²­Ö?ôbEmÄ>ì0ñÌaçù²&ú÷›kó™³©üÖéÍì6÷håsÈípØ¥v;õ[?Ny‰»sÍü®7GšØñ*¿Ö¨\\¡øã×çd/Hv³øşÿ\0ïwòQNÉ|ÌHV¿¤4n\'[œAÁÇ¯Ú·áÏ“˜ãÒïW \Z;=ú¹·ƒx7®+_ï(IÃÜtO9¾[_½óÎÑšmÍè|~?-Ş8nÒşÿ\0ı©ƒ4ó­Ä·Ÿ‡© HòÎ©iÏ¼¦÷ÿ\0îÃÿ\0ÿ\0ÿ\0šĞş/şoŞ“É6AI°ys·ê\Z’{”ÃüV>ß·ï¬ğØo~ŞÎùî3yfçêS{¹¼ÿ\0ï»›î››¯şÿ\0gfõ÷#tÿ\0÷÷»—l¯Å)±Ó_ü?± HİÉfµÇéx0}²Âl¼ëìûÅ>ŸtÅE\Zÿ\0tîÿ\0ó‡¿°íìıçûŸ¶_‹û÷ï¹s¸ŞÍà_ÿ\0ƒ“äcx7üMjòõ~1Nq‰rà¯^^Âée¼å~xuü?êB‚§ô¿·¾éêíÖ_‹;ç¾ß>İ&ÆÎÿ\0ë¯s¬ïÏÿ\0ºşÏµï³ûı,Nä‡f€ün!õ®·Gqæğ‘Hıa½l—«âõ{Ué7GÓx7—·Æÿ\0şâTøôÆæôcÚğÚş?¶ü|n7ÁûÏ]¸gp†öêG½×pãb÷Çß7ç0.È%»^;mÿ\0Î/ı}Å^7»©pIßÅGİhÁ½»ÙäçX¥Ş{ãk¨@•ìªã¯şa#L˜?{Şù^ÿ\0œ?^¬C~‘¸¯[Ç†şœÖ¯×O)®ãÍbâ¯k÷‹î<]¨I¶Í ÜP\r\'µõ¾±Úë—j¡s~OGê‚­¯ó´£‹>9·ù]GÓ*ßI&›;ORË\nÏŞ?JG¦XÚÑëMŸ¡¸L˜ö…\Zæ˜]ºoˆÿ\0´/nÛœvWŞVs÷Î\rÌƒÿ\0|.ËÄĞ¹Û0ğY»ú¶ÙØwWnxØò$o=}|ºJı‚Â|E4!ÉË™•pœºò\'—şÅŞDİÆYX£Îé®ãùGy¡[I¿C$QCx—§?…\\û–÷X¿JşÏ~	1åbÏ¾BÂLe®çÒÒBí„Øå¾0—İÙ0‚s8¥S0Tf ÷¹ÃWyÃ¢˜CÚdyæ…ï5³Ğú]–^É‰<@öu/ÈTt’~³Ò»øİÄ}|´ÄÖ‹Ís?\\€´¹#í!ÊçøÃ¯—¯¸c›ÿ\0óêósñ­/ÍW¿QÏ,¨Ô\'ñyÆÂÌ½áº!üJwğ ¯âu“ï}$Ÿçğ\"–yf¹âA01îx\"t’7FZf‘õ£GzF¶P(Ÿ§ã5¨»gæUöwS\'Aİs@ÉW]¤Åíü\n­Ğo•Ñí¸YÖkúO+™ÇÂêïæËíq¯kŞe* Ré1ñ©â%yt{â šÍæMo4¤ú(æ½•ÙÀWÙwä\Z9tzˆYwáînó°öşÏÎİ§ûQ/%ÂÎjj¦ÿ\0ôkofÓ»`vQİİÕù¢İ­!/Ÿğá_‹ú¶ù°”Ù3 ÓéoÏ6(MàŞÍJm\rgqƒºu4ŞÆÿ\0€Ôéİ»F“8›ö ¸| Ûn‚mğı?/nødÂ/á+½Juç¼§ù´MÔ)oo]è½ñ\n÷ä[I<·²QÜÂ¿¸uucµ¶5³|/äÚ,‘£æ¾Uêùz½í›Óù°³Ìÿ\0ğyÂÓe\'ÎßÑöš¼Ñÿ\0û£çó/O=fôf÷¿kÒìP×ÿ\0¥İbÇ¾Ø‹®aÈÏeùßUüŞ\\Şı¿oÏï¿ÿ\0›¥4Ïe|ãBˆŠæéša£V¸¿”¯ÿ\0dQç}æ1 `h~Ö»êfåÉÃ¿uÕŸèèÀ­ÿ\0±²v£ñfşmMmëy‚ÓşuıÕëèŞmµ«Ïşñ«#óÊ¿ôç¼İ+3ÛÜ‹ï»«ú®xïY›û+Ğ¸üÇ\\}ù3Ïµ\0~óÏsÕö*Xa}ñz½|N ¸¡÷h\"ùæìBS¨sŒØ¶„¯ûÍÛxÁ>>d÷ïëWØ´8à´ÿ\0­ç÷Şñº©’ï×.->cKÆøõ[7ã?lÿ\0º©—íı€ÏBî>úıñ=)»I¨şÜoÛP×íLV&;g±ÈÁõìÖò‡ß>v(<ÚÖºüÛlŒëê‡\"£§1Oâ$EUNg»ùæÅ­Z\0PØÆÿ\0>pÿ\0hÏÿ\0oœıæ›éØ?ÿ\0§¼ëæyzS¯ÂŞj´ïú•fO\Zóî¯¿;÷›^Ú?>|æéhËßÌ°ñé.8¶syxRøÄßÿ\0›ù¯z˜ÓhJhë†7«dÙCà}7£ïqˆß¤~÷á?º­·Ç…Ú²Æß†¶®ƒî¹Óÿ\0?â¿Îxb\ræ_¦ïAC&ì?‰ÌÇŒÀm‰òó3¿¿7ïÚüŸ¾ËŞësYş`ã‚=Ş7©4¾ÿ\0Õ…úg|`PŒüõüFîÌœ_zû¡~y€aK?Ä¨ÎÊGƒ¶>E,k¨	cø¸¤oeäÙÇÏç{ü¯oŞÃçoÎş–¼ÏW(²—º‹óxÈÙZrÍÑF¦ÚÁÕÀ6/6UÚå7·ÿ\0Ùèß^—7Éßüïé÷»ÿ\0¿õŸ»ì6[«\',ÍŞ*ÿ\0›ÛyŸÛıù½^e7¶IÛË°¶fædôœß\nİîÿ\0ºûîß±_ï)ÜËÉOÿ\0ø§÷ıo”²(Íñ;ÏöÕ<ç}ÿ\0ŠŞù¾pÖ}ÏÇ™¡å~bB1Ú÷ï§ífîwaÏ»İo¿íñ[óşîıŸSŸş‘àäşE”ÿ\0¿Ííÿ\0¼üëãOêÂçuAöÿ\0õ×?×:øÎVÅ^ş©Ş5®j}÷ğêÿ\07Wıûá¹ª-0/ı-(ÿ\0­—ÿ\0­èæ¯Átÿ\0­Aß—u¡¨’·WÛ¨:7åû.Ó¿¼§ÿ\0½l·ßØúwIÛÔ¼´På7´çİ×è´@£Şo8Æ·}š×˜öuÇ>?Õólüß_§Îõ}^çÇÌÿ\0ò§åÚßÿ\0~d1¬ùzQ1]_š¡Ç?Êù<\'­¾+?æŸòO»›Ó_ÿÙ',1,0,NULL,NULL,NULL,NULL,'b7d2a5e4-5418-4562-8807-764d12ea4e23','jpeg'),(24,'',1,0,NULL,NULL,NULL,NULL,'',''),(25,'ÿØÿà\0JFIF\0,,\0\0ÿáÊExif\0\0II*\0\0\0\0\0\Z\0\0\0\0J\0\0\0\0\0\0\0R\0\0\0(\0\0\0\0\0\0\01\0\0\0\0Z\0\0\02\0\0\0\0f\0\0\0z\0\0\0,\0\0\0\0\0,\0\0\0\0\0GIMP 2.10.8\02019:10:28 11:04:27\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0æ\0\0\0\0\0\0\0Ü\0\0\0\0\0\0\0\0\0ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ÓğïÑ¤CÕ&#ôºõ^+‰øy&ûkµí”qøƒşİ¨â¡€Í´m©vÒm¤ˆnZUãuxß¾©ÏHÇş„kÖ¼Rß¾‰}xï‹_:»z*¨ı	©Æ[Ò\'0zÓ’)%$\"3c®2´ô‘òJŞ¤çZRû%ÇüñÊ²Ïÿ\0<Ÿò®\r>æê3$1^FGr;Îé÷‚0æİöœs^ŸÌS°\\æ~Ë?üòÊ²Ïÿ\0<Ÿò®¡´›àØìÜ5Ó¯†6ï†8¬9¿²Ïÿ\0<Ÿò¤û,ÿ\0óÉÿ\0*é¿³/ªKgqM:}Ø¡÷`œ{´X.seŸê_şù¦›iÿ\0ç‹ÿ\0ß&ºs§^)æÚ@yão§ZbÙ\\3ºˆxÆYOS°\\æ´ÿ\0óÅÿ\0ï“Mû<¿óÉÿ\0ï“]Ci÷JÅ~Ï!+ŒásŒŒÒ>wRÖòsÓåÍ;Î`Ã\'xÛşù¤òÜuSùWNl.‚îò$ûÛ~éÎÉ¦ıšàdéŸºh°\\æpGcHtR+.Uƒ:ƒ\\ù$RjÃ6¼\'(‡Äút„ÿ\0Ë`¿ŸÖ½éR¾wÓ%ú¼ßóÎeÈ×ÑÈ¹P}k9€Í”ï,Ò¦	N	R)vTû)vP\"¿—Hc«[(Ù@|ºvÊ±åÒˆè8Ï†9kÛıˆÇåº½Àü.Aı‹rØäM°ş?Ö½	WŠÑŒn(ÅI¶“â|RÙ¾UôZñ¯É»Yœz? ?Æ½ƒÄÍMı…x¶»)“Y¼ôR?¥gOâeKáFA­m(£1ÿ\0kü+&¶´Ñş†§ÔšÙÎ‡O¶ÔšÕ^ÒUT.p23=Ê’\'Õo¢ÌÇÉ!NH?åJé4Zİé0ÜKu{¶r#ü+A<¥Æ7%Åúîäàg¿¥2NWìÚá\0yêFá×8½ê9,õV…$\nàe°L“Ó\rußğŠiá†.õŸ½áï\\Ï‰¬HšÙ-.®YdRçÌ“sÔ­%°Z`YIà0ãò*9«f²K1V1œàã\'\'õ¨µn¬®ä‘\\÷ˆúæ¬R¸E00\r´¹=A#ùPäëG$û‹@R23´“øäUiÎ¡\rÄm3’\\|ÃàƒÎ=*àÒ55wMÀ !ÎR¿¶º·ºŠ¦y$ 0É\'ß—Z\0´-õˆçıÙÅº¨^ cúşµ²j¶±oìR\0ÏõÇó5$ñjºhó¤¸sƒ¾[®Â‘,/ïàI<âèø8fïÈ~\rÚIÌWäo‰Ç9ıj–7ÕfˆKîŒœœJxÓµ#S/ÈW¦ş0ÿ\0^Ÿ¨¤`E&¶×Àç(î)RyÊD™Ë\nç&\\Lãı£]mì2Gpë+~¤õÌ\\¦.ëCcHŠ>ãù×Ò:[ı£K´›ûğ«~`WÎ\0`?ºq_CxF_´øSL—Ö©–ÁÔØO	OU§…ö¨-”»*m´í”Ê6U”»(¿—FÎ:UŸ.—Ëö¢Àp_w‹\rF\'\"dûéøW¡ÅaøOÃ±xoEÑ_Ì•ù¤ÇŞcı+ ÅS¸ Šx0Âš\0ó|îÔæö¯Ô}õÛú¿ó9¯h×W2w&¼Fã¬Ç?Æä*inËŸB­nØ.,ãúf°« ´´‹ıÑ[#6uV_m‹O\ZÓ[«Gº(¼Í¸çùT¥µ0„ŸôíçŸLúÖbi¶Ó[Äí©(b¹Ø@ùzq÷½é²i–kŒšš1Uf³®8ÇZ\\·¾Ô®,üßí¹cq¿åy8Æ?<š«äÜjÑ$÷Z’3òª&|)¯¥[Y“Qœ\0Bà\0O=óíúÖM4wËo%Ìl\n.‡€pxı*ÃhaUÛmş\\½œ‘éíY\n\0Ômô¸‚zg·½Cm§Irò¡‘\"hØ+	1“çTÕ™Aˆ`àõ§}¥w¤äŒğM\0]’ÀÇv°Õ·!mÃ8ÈÏ¥-Í‹ZÆî·Õ$òÎ29ë‘íT)E7L™å?é¨N@É$g¨üëUşË*Î°›…Ç¼a:t¬ÑN˜Ë7vío9İ\\ÕNkœ¼L]=o(¬›Õÿ\0Kj–hŠJŸ0ã¯î¿$ó¼`º\n~F¼L&\0>„W±|(“Ìğ“GŞ+—Oä­b%¹Ü*ÔiÊ´ğ• 4-8%H©R |ºpNjq=bö \nş]8GíVÄ5 ƒŒâ€3Õ0Ò¤NíNÅ\00-6Qˆœú\n›ÙÛk!ÿ\0f€<«Ä2bÚù‡]¯ü«Æg9½+\ZõßÉ·M»oPxûŸÜEï“J–Ì¹îDk£„bøşü«œ®˜\rªĞb¶‰›\ZI¨]îÁQK1è\0É­®Ä¤3XE#\0€™ì…ÇN”­®[x,ÂÜ#†b@l:ã5B1È*pÀƒèE6µ·WœØ[Ÿ—*	éÛëùûRÅ®¤qF¯a…\0˜œ¥ 2À8ƒƒĞúÒÖ ÖÑĞ+ÙD~R¤ñèGß­Cª]Û^]y–ĞùIé€?A@…-œ RŠ1Jµ\0(§M¤AY·ë‹¿ÂµsT5ÅÊŸQQ\"ÑT¦aoašõ/„gOÕ ÁpóıjódtdzŠï¾I‹ıZì‘Éúb…°¥¹ë\nµ*¥\nµ*­H„T©V<ö§¢JP@¬ga!$Š–8È«*¸ª°ÖøÔ‚ŠœQŠv…¶—ìQŠÅRÔÎÍ>SşÍ^¬Íu¶iSjOa­Ïñd›4;–MyTœGÿ\0b½/ÆÒlĞœy±ú\ZóIÆ\nEé|#äj2ê=MtÌ	rRq\\å°İwõp?ZèpÎÀI<V¨†h\né–6¶¯ócuúZQáËÒÅsğ@Û»¹\'ü\rY»Òµ˜şVºy3’Gœ{×?_Ò¨İ¦§kqSİKæ¹ÈQ)$‘ùç5B#—F¼†İ®$U…\rŞ½?¯åSÿ\0Â=zc”.ç\\í\'sÀúÿ\0LúN© 1£*ÀÈq÷ˆ¡ª²Åx·±Úµã1}¥Nö#ı?ÏZ\0[öÒ2òª0\\ÉÉ8©çĞn­Ğ¾äePÅÈ8Æÿ\0\\~t§D¾iDip„ğÛÎ3¸Éştÿ\0ì}IÔ82¿Şİ&:òsí@	m¡ÜÎ¨ùE‰€%ÎùÇçS?‡îQI.¼)\'ØÕRÊÚîåeò%#ËÆpØÿ\0õRéö3ê)!Iöùx1=?à:@:=âha’<2È¥¾˜Ç¨¤mà^ı•\n³•,¼ã#5\"è·¤nG^İêÙ##·‡ò¨—Mœê\"ÊFÄ»IãæÇÅ\0XşÂœFÌ]xV89Æ?Æ–×GóàŠcpª@é’2HéøUY,fŠâY”™HÛ°ç©Å]]ä¶HÊœl,q¸qü©‚{	lÂ™\ná‰²u ‘Ÿ­mÜØÜÛÛÇ$äá@ÏLŒÖ6¥Ñ½K)\r‡‘]wÂy<¿^EıûQú\ZämÛ]\'Ãy<¯ˆd/×šÁ#İTè¹¦ ©”T‘jÌk*(ÅXQL	TqRMQOHBÑEÀÅÅ´b³(JÄñ3íÒŸŞ·+ñkãNÔÒ–À·<_Ço.4õrLZóëõ˜ô\0~•ÜxõÏ—jŸïÕk…¹?¾oÃùUSøG=Å²¯àíƒ]%²Ê÷1¬ó‹\0˜àçµsš7ñş?Êº[Q+]Â ;f.qƒ+TC4’×Yaşq$‹ıèæã®}}i³é\Z´í1yÜã|”Î02}Í[T×¢ù@É~\0\0p9é×õ¨Z=sÊáäe +ÀÏê?:b(ãU7æ>ssÁ\'Í>™Îsô©²u?9d™ÊRÂS&v…£ôªó=ıà–G’+‚¿{wÍŸÒ¯5¦¶%hšæ@¤íæü c\'4^ÎJæÙ¦‚y<¸ÉÎe#ä÷üjH?´mµ(­Öä¤²€ÈÚz¥14ıZÕÏ”®%d}óÏû<ı*9ìµT•îeHüÀ6ö¯1@bÑ/Sšl,¤ıFš=Ğ¨yåQG×§z©b÷·²ÖñĞ\"î%ä \0*ÃYêqÆÏ,ååéNr?8¤“i×6Ğ<“ÊB‚¡[9\'€?Iu,Ü#®%\\üÇç\0Vt/5ÌEæşî5óH=ñÇõ©ôå¸™Ï“.Ò˜ÆO\'üûP3@iZˆ‘góxSó+r¸Çİj­6{)R9\n–rBàõÁÅ?û&÷abé°’_‘š‚òÒ{2¾s¸9äc?ÎËW\Z\\ö™$(@ #9ÿ\0\nÈÔÕ!÷­6Óî#³ûKà!†O\'5—¨ôlú\ZBÕ»à™|¯ioÙĞş\"¹¸¥ãµkxn\'ÅºD…âƒô\"¤ô²\n™G¥B•:õ¬Àš?z°•]8©ÔÓ@N´ày¨ÔÓª 9¢˜8éNÈª\Z3MÍ¬Æ;5ÊøÅñl‹ï]>kñ”™1­L¶w<_ÇRfêŞ?@?RÂ¸»“›‰ûFºß8mjö×ük”î‘©5¤>rÎ˜3¨Gì	ı+¡¤Iãh¿Ö~¹â°4¯øüÏ¢šŞ·•¡¸UPÌŒ2	¢%šu¬yë#2òÆYNqbjt“\\B¬cT}Ò08ã¨8©&§y‘È±ÈÌà•<– œşBu«Ò¡LI…]«„Æaøf˜†ËöıRfÔc‡,İòr1Ğu=E>Iõ¡m š)mˆÉ’=¡sÆOz†=Nò,J‘ÆŸËÛòå½G~”’ê—’’ÒylK‡Ã(##8şf€sªZÌÑËtá³¿åaƒ‘×­S—Q¼pû®dmçæÉë×üM-ÜòİJe—nãÉ#5Q•½¿1@I¤E`®Êa€=ELú…ÜºK™˜àŒ´„ğzÕM§Ô~b—í/ç@#Ğ0Ge0Àd{Ô°]K&)	%N\rTı¥üêEí/ç@>ÙpÉ±§¯M¥)Í<³cÌ‘ß76qU\0ÿ\0h~u*GÌ?:\0¶\'®Æ‘ŠúÅA~shM8îÙÍ£j@gDı+GN¸ò5;Yÿ\0çÄMú‘Xñ75r7ÃnÏFFüš•´>±Œ‚ „TËTôù<Ûy?½·æ]SŠÄd«S)Å@*@i:šp54üŠw\\Òæ¢\rNİLF8j]Õj\\Ô€ıÕÄx½óv‹è+³İ\\ŠŸv£AS=Š†çø­÷xˆs÷GôÊ]‰wˆ®[?túW:Mkåí+ş>ÛıÃ[H¬ä…RÄàÕ‹¥ÇÄ‡Ñ?­t\Z}ÚÙİyÌ…şV\\;Œw­lK!£if\0I<ŞºD×¬¤fY˜ã<€6œcv?‡ı¯Ò«Ï¬ÛHCÇb\"uÎÖV~ï½\0bÇo4§Ã#œg\n¤ñMttY•‚·*Hàı+z×^ŠÙp,ÉÆ6‘ `—Ûõ5Æ»°¬o`T†ÁqŒƒœıŞô…5¼Ñ¢<‘:¬Ÿp‘÷ºtüÅ#Xİ\r¬İ«=S[w% QgŒ6àL™ ñŞÃŠªšûAF¶İ™ÉÉşõ\0d5¼ë»t2\r€3eO\0ô&Ÿö+Î¦»1€;ÕÏí÷U(¶Ñl`€ƒ“¸Çò§CâK˜*7`\0ÜÄ’pN;ûÒ¸ÍÊHÑ˜[z€ÅG\'œ~4è,®fI8]„dÂ¤ãZ°¾ f2,0‚T.0zwïÒŸˆn¢İ¶8rXŸ»Ó8Èı8¬.Ü?ú<Š’ÊG¥M:í•\n@òPÀ¢“Ö¤>$¼d(Vó·sÏ×“Kˆ/T(Y+Ğ•É÷üğ?*w`2K;˜#ß4.‹»nXcš¯sÍ³ı*üÚõÍÍ’[2¢…ãrä:b³¤9‰†h@b£sVÕ•/¯–Oê+=O5v™d±·ò¤3ê¯Iæø{O[tşBµ–¹ßËçx3I~æİk¡ZÀd ÓÁ¨Å<Z`J\Z—<Ty¥Ï4À—4n¨Á§SŒ\r.jÔíÔ?5çŞ#}Ú›û\nïY†\ryÖºùÔf9éQ=Šç‹êòyš½óÿ\0´ßú¬Š»s/™5Ä„rÜşuG5°\r+ıdßîQ[ú]Ä6÷Ló’¡^<šÀÒğÍßåÏü+@\Z:i5\rF™¾Ïó0r	Sœ“ÇOÔÒG}£”Ioó\0£ı^zr39®o}&ÿ\0zb±ÔOHÃªBÁN6¯”1‘»¯<õ•ºD-ÖÛ‡e.~a€	ÏNk–ó=éL™Í07eÕtœ¶ÛC÷HPa^IÏ_qùVN­{oy<fÙ#U +\01É<`ûÕ\'54€CÁ¤ÍÓ3IŒ~iÊÕiÀûĞêÔõj€\Z\ZXVÅ<¿îÛéUÔãŠyoı)NCWlé6êÃôªzÿ\0ï\Z¹`ßéQóÔãô¤Qô¯ÃI¼ÿ\0\0ém×•ü+¯Â|%|øİ3Ÿ-Ù¯õ®ìVOpCÅ8\Zh¥ c¥¤£4x§\n`4ñLgÿÙÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÂ\0Ğ\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ùÆ7Øë^Æ2—•«CÉ€@\0á1‹-<é¢å×Sy5>ïáå±3æf2@†4ì’”Yd%-¥ ÓÉY`Ğ„\Zˆy!èI[\"\r\n2SA:€I%,\r\0X:Œ¤§@@Œ”¦“ (mÈöCÁ[\nçÙ7úÏ­¯5koBa€°®XKå=C\0VĞR14¦\0P\r”PıN/·É”¼êŠÔ\nÉŒ@Ó‚Ò\05x×9Ç¦•×ÍÎùúgá^ş·‹gÉÏRLË)¹E*\Z\r¦T¢Ğ \nWQ†@´bFĞ‰‘[I€JÄ1Y ˆ¥B\0µ€3*Æ F$\Zt¬¦™\\ÈE“Væ¹¿Ò}tÜÆ­hä`0% \Z‚DR€€\0Z€4™fš2€LØ²gçÏSb¿~™Ê[VÕfPÄ H™%jËEÏ|—.¾	Ò\rNöyçy³ÉÄÉ$–²R¡ª\r$,2m!€j	\0™bV €b*Ù\0ÄII\"V%À\Z²b…Hr¡£‘ØA*f­Q’Ë?Ayïo…-¨€(4XX\n(4\0d«!«$\nD!\\˜Ÿ=SÔë÷ùÏÖdjÚ¬À¡€	X¤HbqåÎrëÇñëçšFŸ¯?û|øªÏhÌÊ\0 (\0Ó bH\rP\0™` \0\0\0Ä\nÅ` €’5d ;PÑ	hPÅTL´	+&Ê‡*d¶€ftGİ8_¥`ÖÇLI@PhÁXĞ@5\0($@ĞÅ+šÏ½Æµ÷¦vù[y•Y:€f€€(`Î¹~=9>q&3ïÏå~Î5¬ÙkóA¢¾½gmcHñZ«&†A@Ø‘´ÚH`Ò\"ÂPÆË#oGÌ5D\\\\aTDĞÎ;NŒRHDŠÄ&Ñ5#ÊJ…`JÎ@\nÛ%õI+ö.wëÜ¨c‚€€ªc$hÀ(*c\0$ \0€\0¡’ËçŞı\rgíÌô9enÊÉ–²\ZŒY´$BZ ¬×%Ç§+Ãª1\')èçóŸo\ryéËÃš	@åÜë;mb„ °¦£Yd¥4$Pf2FÔ£\nY1P:Bƒ2ÕTÉm\"G¨‚:›–KM+‹Ye4Ä²•‚Éæ—‰Ê‚ĞG®c_Tç¯·òdª(0¦8L\0ˆa+#B\0€C\0Á¡\róÏ£mŸ²W[–F¬ešÄ\0\0\0IZ’æÆ¸ş=¹=b1ë<_¯‡	êç«g×—‹\ZBF%5»Ókpµ—’	 †kG)&PnHó¡0°Hè	cY«@Îj5¬ÔÄ´ÔÖóPjÅ4[:¡À£I‘ táH‚è¥óÇ=‚š\"¬“Õ&è˜¿ yec\n`1€Œ\0a\n`*˜ ¹0QŸÎ™“ë7=ÆVÓ2<Ğ` Qxq®7‡nw—YŒzÏëáÈz¹éÙöeâÆÕIQ»Óka¬€< z*$&–LÀyÒBj“ir*˜j±f…,¬HóQZ’<é-¥3\"¦J0¨Â	Evªq$G9„Í\0°3Éˆì±Iòd(¡C b0À\0!‚L@)h”aL s@1+gó?«{Ï§Yô¬È6²5ˆ\0\0C\0Í~uÄpí¢ãÒ*5Ÿœzøó>:šÏ™åÀ@€£ Ô÷\\±ê²ñ7&iG,¶×>3ÇT@#\"Õõ™³<\0¨)Z<:\0”g²OF5â\'DÏJù‰Ôa(gŒ¨Š‰n“rÂºÜxØ$\n¢³Ìá:ßÔ¼™óYCcµ\01€#ŒY´\0À\0C€JÂÄ0\n2¢FP–½Zè3>‡gÒ2ÈYMXf… \0\01Õç\\7Ú~=1Ôk?1õñÒú8é«Ñ™ãÅ €iÔk>š©è>—ÎùL\ZjOTl4ÕÆ¢;Óã	MxŒîÏŸ(Ïq«ÕÔ>g˜öµÁje3V«JÁ™tÎq)Gu.¬è#çgI¦Óf5ñšD÷™íÑÄr\'¥<Ç¶4æÏZñf „f5Ñfùñ´ÂŠË2oêM†k(`–°!\0ĞÚJD’\0Õ\nÊJ£$Ë(3òw¡Ö@¥—•İ\0Ñ‹ 5sh“Sp¾nú®{LzÇÊ½¼4ıùë£&^\\ì,¶€g©ÜôØJËèøc Êf<DVébOzêÌf¾ÍéóÆ»V|§¢”¼éĞ&3yuóóé3<ñ–îô¼g©:“‹ÓPvùš“ 8³¬ÕÔnf”†’û™ñ™»lË&¨“fi´ÙÄsº*’ÓeâÅ`\"†;†ÎÂkôß\'CPÚeŒ\rŒ• É‚\01\0L±\041\0Ùb°?$w½©ŞÇÒËË!MÑC€dPÖI¥Æ¸_7}o=Æ¦-cä^Ş\ZîüüPfùó Be´‹g©ÜÉeG‘‚ è…•¡dÅc\'ZS.)X¬¥^ZÓJÙ¡œ²K65¬ŒÊD^¬™sci&Rzó(Í^s(VF»GA‰½>^P\0\n=,çÑ|¦5C(¡˜\0À €Ä5*\0$ ,6àƒ,VãSè\\õŞ§ÓÎ¬¢Æ¶B0Õ$\0Z.=8_?£ÁcL=1ñ¿oŸËÓ>sndlÁJ‘×]¹w!	bÍI„	l‘™S@QEË\"D*¦„@2“à\n\ni‰’´$cŒjÆŒ	K,µ1&§\Z×â€²	BŞ}ƒ—ïÜŸGåltÆP\0ÀµZIbh\Z€d k@ÙbÎ¦P4,‹ıZúg<ı~Vue5²QU““0+ãÓ…óú<™Ö4ÁÓ÷yqôÎ#Ö\0ÎkzíåÔvÇG™å<‘¤ÓÌzùåzŒ¿4e›4ÚiˆÏ ·LbOiá¯CZ¤ÀnÌ¦ù8ÓÕc=k‰6¦ÖkÁ—‹Yó†±’\nk1)Äî=Ç‰|\nVR­0¦¯\Z×cr&•¹°Lr}·“ë¼¶ÇT0(c(R\0Ğ5PA,…kHl°Î€\0d˜X!\"?úçĞ¹>›ŸD«™¢Úc(\Z™)B@ 1œ×.œ/ş\\ê$ñôçñ_™\\‡Š\"h\rC.§W®nĞynÎÈÕå½Ó4µİ\Zøè\0Í£Ï©ÌTIëº×™³ŸéPÇ™6Åjé»7Àt²a7VéâÓ—­&æË.£Êz.|çA.¨« âtñ^[34IÃ]#¹™Ö”ñ›;~iX©îµ­j9¤c“©îÖ<Éõş/¸rİ±\Z… =Z€Ñ€Æ,è9­“€òcÑ\rFeø·Ó®ë“ìws4[TX#\0PbŒ1ÌñéÃpï‡:ÄÆ§·?‘û¼òŠµñ3A³×©Òë›”î=•éŒšsæ(ÊoãÄc3“šSÊg¯Y¢ÑåA*4zGfsC«€õr0³ÕdG•|õ¨Ü÷å¹ÆèÅs·6ñ¥<5”æ4“q–àÁ¤ºÂnæ} ƒÏo+Slí×5§æ€õ=šÇ‘>¥Å÷ş[±”1Œ¡ª)jÑY\"´@Œb@hÃ9­1ä\0Å <ô´Ê@ükß}W\'ÜN½š[,°ˆ\0j\0€Få8õâøwÃ–+n_4÷ù¹ãm/‚Yš	@`l5‡BÆé.ZÉÉCÕd€É‡\0ˆ¾J–QØ´ÖsLfƒ4&ÊÈSD1æ¢©¦Å5À0ZTPİ2KB$‚El‘Ñ¬ËMÎ¡VĞ¯?ešíO¡ó~”åmk5Œ°ÑC\0¡ˆyĞ\0ic$d”0È€üqŞoytı\nÏFË\\†B€\0\0@\0Ë—ÜwØ2ÇsËöåó_›Pm¥ÖË3LH\0Í³½Ò¬aj:ù^Mí@²rò±JüM-3&œóé%Ma\nV	·5ë€vdËhºm‚±À‚3ÚyD´<¨\n-±—-H5&;\Zk²Ñæ T—k&óõYáÔéy¿Xr¹óXÆ=\0c‚±€#†@´ dŒ\0\0ĞÏÆş~î}¿MgÂ“\"äP¥ˆ†\n\0Ï¼o¼ŸØ£Ïèáóßga´“Wè\rÜí¸Ö^A’ß§Ög†=†2\"O%zÏDjyˆgéÏûiÆ}7Ù_:ÓÄ½¦^íf\rmLò†ZÔ3éY6|ûJ_Rõœç„÷W\ZF£;,±™—C1\"66ûrĞ…µ–¶,ñ§šÙ$ğşh£C%Œ,ËyàÔöåû…õ\rYm0(c(C`\Zƒ\0\nˆcEÒ?õÏ‘Yâm\"Œ‹jÊT°D%IãÍâ¼ı¹]påƒyâ=œ8G²“[\njKT7»Î×Y¡eûÔbùÏ)˜ÇóÅ^ƒa\r‘¢7‡ÂvÕôxòœv§„¬ï¼Ê™Æz+rkdĞ5`kÎ™EgÎ4j¿Pç4‡ƒYå}´}*!PRAÜ`:EÕ.6“<qåµyNw6U4™vPìWšÔ¬¿^p»­L°0”‚€PÄ0É@1\rt»]B~¹çœQ¹¦1H\0\0\ZükˆáÛšç¼F-gçŞÏ?ß•¯~ZéT¨b#¡Şv:Ê†d·ê<õ°¤&Af²lC$r*|³YòS%S*VPhH\nÅ4Ù¡]cf¨3gRÉHˆg¤¢J:ÕæD’eT^VZÆ3ÎbKSÈsØ°ÓÉ²#ÔZÏ£YòŸ¬8:Œê¤ÕŒ\n c*\0À\0¥c\0ÑŒQC\Z!ˆb(T~:õgOÏ_¬yg~d,É4\0\0\0´HÄ³\ZáxvçùîZÏÍ=~7¿-{r×Ë2±(:=çÛ¬ÔĞî”Í’0”\0š@Öu’,²åcÑšŠY\nb™\Zat™¨’õ¤Ép†\"ÆR°FXR\"IMIç9ØÆÑ=e#LzÏ·¦u‡ê>ë:¹(m2€tÀcŠŠÆ\nÆ0(HX4@1P…LüiéÏ7ôŸ\'s3eµR€@ÄÙ(ŸøNtœºA‹¦>cíáÄ÷åŸ,Òø4† j3§Ôô%UdÓÜ#¹8*ôi}ÇŒÈk“Úo%Õ*óŞÏ“((£Í§¬éòä\rá©k×\'€V!¨:uY\0Që¯\Zâ<†ÄÒ\n™î—Üj\0¥b3M\rbP”µæ9øÀ<€ÖiÃ¬lzóÑáúcú_=RPÚ TÂ(\n‚°@jÀ° %¡¢\ZØ\0\rX¨?\ZzqäÍûï\'ÓfrÓ•€\nR± &—ø>µ·&\rÏ•ı\'×Ü²fø¤5A¨Î³S:dó>¤\"UdK·<æ¨ùÎ¦Äí%õ\ZùñÖç^¤è&yó;^ƒç;ÎCé8×„ÈÖÙŸ2sÇ±=€¸ŒÃh´írõæä)2ió{2u²8iŸ£1ÚO¤fë†{GœõÒÇ©¯RøNUX7€ÑÇŒy¬ĞÓ›¼yì?Fó¿[ç«F6¨U1Ã V$¡¨2€H)A¤”´2„%±P~Sïoï™ŸH’áƒ@À«™*h`€hyïƒáßYÏqs‡yù\'·ÏÇõç°&_.Ca(\rlêúfÙwM2f}Lã£(ôÎD¹Zğ³„çSÚo¥ÄUœ±°k¥Ms¿kë“ÓĞtXf\ZúÃf`x‚ßthäØµ{ĞÔ3tqzYÕæú5;ÃŠÓÌv™°	-$Êx.´\'¿3vz—RÖ¯œÓMxò: Öp³ííÏŸÎ~õÏ_oÂ”*MX¨@P@d´	†\nÀ DP\0‹–‹$`U0@ü7Ş<_×9›¹0i”rh\Z€€sÜ·Âyûøs¼W8wŸû|Ü¯\\mLù²ÖÎ¿¦S5l3Y»cUR\"…%5#Ab •2ò\Zj¬)BŒ\n»èĞI˜Ã¦ê5f:C‡¢	@J*ó-4%CVRÓS3Co	¤ÃÅ“Ñ¬½g>œô:ÏØùkô\'5-„XÚ¡S(`0‹B¤\nÔÁ\0À¡‚ÑB@#?÷}‡ĞXË.5`!Œ\0„ˆËœç×…áÛÅ›¿§/{¼üÏLîu„%\0oYìu˜,‚‰(\n´bC!P’:=t(¢Jh1fQ:1hò¨4CÈ†-„PÀcÍ@1€Úy;¦9¦Râ4ÙkòW£ÖaœšÆ“Yún/éJZ( še2t;Xä¡Ğm˜âÆTŒ\rXS!#ÏÉ\'éNoUÍ(m\0Œ‚\0aË˜ç×ˆáÛË›ŒÓvåò_oŸœŞw†¯= R®Mg²Ö`{¨YjUb2@f®tØµì\ZeËÔB¢é:<™ ¡\0fPi%hdCĞˆ@Aš@4d®²Õ¸Í6Zü™aU¥ë2ÊÖ5\ZÏk‹ú»“\"ĞÆTÓ)WTPT9hR¬‚†U á‰SX-\n¨b2\"ÎJóö•-Ó€(\0ƒ.[—N\'‡|XÙç{òùo³—=qº]\\ÜHÑ›³`PlwyÙfDó¥Ï	¼é­dÉu¯ĞÖ^D\"©@)PĞI@0Ôb*\ZªP\n$¡Í±ËC¶šp4k2¬¯Z©+Lšåß&óºÃõÿ\0&Yl¡ª4)¦XÑ”Ğ(e\0U\"€²‡k”R1ÖR	9†3—(6¬e\00  Í—\'Ë§Ã¾)¬w<‡~?5öñÒI¸53R\n	lØÜôÛ!@z+e‘jf×Zd<Fû-=z­Ì<È(Óh´2 BV4XH$\ZŒdÔ*˜±AŒ\0sl©hvÓUjcS•ezÖK+L‰\'||ûÏ«Øœ›	h°)¦ÑS@Ë¡¤–Se:2Š(E[`PIEÕ\')qŸ*V9¦€\0€ª’ yZã¸õä¸õÇ&8ü¾{ìã£6ìê³PM&ÓYßêSHdØ\0\nš–DzÑ\"ÉÒS\"¼é2Â€@\0P†Š€1 z!\Z±,˜mMPKm1š¨ÔeQmUÎM2Y)àß5¾jkõ÷&û ¦TÓPàATT·  P#Ğc*™d™Ä\0e1™‰,G)q›!h&˜ÀtÀ(d\'®3^[\\rbÓçŞ\\/·£-£:¬ĞS@€\rŞ¦ÛRÕ¢&Àb‡42Ö”•‘tÅbdZÎ¡š\0BPÄ‡\0b+$=M!2ÁhP€mPæ™rX\Z¸Óeq‘¢g.™w™g_¼äß?×ënN·eĞTĞC†PÊ«Xí`–\n,tÊ2YC3YEéœ–s\ZeCÄ\0PÀ Z×çëÍóí9ÁgÍ½œ8G=}ÎĞÕæ¡CH{©µÔb @!˜àôP±Ê&USJeĞ\nŠÉ…!À<Ö\Zˆ`0À¡ªÇ\0æ˜k åqSTÓ’–šf·-&Vdf]¬ß?WNZEı]ÉŞâ…À[L`2‹(-ŒªŒ¢š°ª,¢Äç+Z±²Ìq˜ª¬§ÌÊi„(`\00„PS\\GŸ¯;Ï´g8lù³‡èçæ¹÷\ZÌÔ P}©´Ô ¤b((@-&Ê¬%H®[J¬¡”\08c†ÂÊÅ`\0P0(j\0¨1 zËå¦ª[VÕ¹ü¨ÈYFm(×oŸ£§.uSr}3*Ú`PÆd\0VRX:£#(mQtŠ3\0ÏK,5«C%\"âB™ÆòPÚP`\0\nÄ€2ºyÓ‡áÓCÏsX4ùO¯ÍÅöÁ³]4PÒGgEfÃQ…¨©˜\'UB€fèÃ\ZÀÒòP‡¢›Ïg˜3hV1\0K`ˆt‡\0ŠhF£\ZgH5šTŞˆ±gU5mSLòaÎ3xÖIrYzdÔ³[¬ú7Ç™¯Ó\\Ÿ[Å š¢€ªe8\0È–QUE’S6zt=F5ÈYt1C8îF6˜À`\0P„¥Í.tá¸tÓóéŠÌ:|—×æâ{cÙx&€PH‡gMg¯S!#è\\ğ¬Ü<½ç>t$v§š<fªëÀt¬êFÈ÷.ŒÏ\'°ÒË²<ºœÁb\rA%\nĞhF¬¢•6CRÃ&½)Xój*)«h<Ø×6ÎLk$¹,½2ÙGƒyÉ¾<½~Šäûf-4ÀÈ:°¢ÄPêÊ2ˆ\0³%Q”ì£6ˆÊ (z1C\näyh€\0 V\0dI çÓ…ãÓW¸ÓÏ¬|İÇŒëÏe!€•\nà®«Yõ#&™ô´çbja¥6¥/>8Ò›Šö\ZCŸ:	® åÎÓ³Êeå½8ŠÓW‡g“èĞæeˆ \Z±% Î“5 B,m²³–Š¶³pg\\öK…oY“%Í×Šâzræ­ûÆ~ålm”2‚,tÊ,±ˆ£!C¬€QEµœ Ğ2‚ÚD!ˆ@r|tÆ\"‰,@@\0\0\0ƒçÓƒáÓ[Ï¬êyu{¸ò]yídÃ6™22la]n³YFÄõ\"Ì$Î^ãæúfkÌµÈx\r¤¸ŒIë<G¨@{rîMrÕåŞ–C4jR‘„Ñ¬°CPŒ\nš(eka(\\¬»o7Ísù,²FK¬©“yºóÜ`éË·ì~‘år”Õ\02¢‡TYb,È# T2€ô³˜c*Œš°JÎKÏ¦-À\0 €\0kÍséÃy»x3¬zºİrøïÒòó6ns|‡‘X¡C¹ë·œ¶‚d%AjÈ¬œ‰A’:z,¨šbÍd#§¥dÌ‘B”Ñ#0€«¤6h\0` \"¥@ËiHÊ\0@¶›U•µRÙçÍÑfa\\¹Y”Ï¦M0Üø:rÒC™ıUÇYUÊ2†QEUPÀÈd2\\Á‘«)š™\0Êd EQ%	Z\0\"N[Ï¦=À`!Œ‘Œ@HW—çÓˆáÛÇ›txü—ßçæ,ŞÆ°Ç4‚\0î{=äµ\0ˆZ¡Ã\"P	\Z1Î™º4¬¨¨cª‘ŠS ÀC€d\ZĞ¤aABiÈÇ¥1–ĞÕe‘«–<hæ|ùŞ\\²i”ÎdÑ\\êúrÔ×Yœş¹ã¯BÔ \0ePŒ•`YEs&fƒ;(Ë¥ª\nQ\0\0\0\0)çĞV€	( D1%å9tâyuòæâ®w¿/•ûxsÉ¾M;QŠ…rAZ¦³(D\0´AR Í@Q\Z0ÎõyÒf†1B\"ÀqdÓ1€\0\Z`È!”\"‰ª¬qC(xÖFˆ³¤ÍògYLÆC=—rjêõÏ[¬îpıÍïÎ²(PPUŠ,ÉY,ªc3L†6r™t“ PÆ®ÉV4\0\0\0å<ú¡i@\0”0\0–^K—N/‡_>n=¹.ü¾iíá MêiZX²;”KTdÔí5œBJ$\0¤)$y Éˆy!èÃ:X©JEÀÇ\0\00Æ\00Š˜]Œ¬jÚ¨£¥ÍñgYLÆc5;/SM®~kœÇì>-Öt-È1•Aqb¬†B•fBŒ de•£(  ¡…I@\0\0\0rüt$\ZP€\0\0\0C\'7åÛã×cÔâ;óùÇ·Ë§7’é–d@$ôjözÎ!IU\0ĞÊÔbiH‡¢[^óÀÌ(4èËrº²Æ´,Ë79ºƒqZƒŞšáíºËMè·Ù–³PŠ6¦·İšMd6±â=zÖĞĞg(©»j¤¢KxrÊe³)™rYZÆ—\\ñna?^quôË-ª( ª(eÌXd¦T3.óCTÀT\0\0\0\0\0rütÃ&\Z\0† \0\ZüŞ7—nG\\ŠÎÕÏçş¿.¤İæé•\"#éÔìµœMH†w±œä++>«p«Ê*\Z×$˜«nrqïkèñÂ³í³ÎD¾ÓĞhO5wyZóÆ;0UëÍ2zÍî/<uzs&döœE}-f0[²Ê58ó¦Ëê·›³C¬óÇq–àÑİe&gÌa]W-º\\ëÁ•™¬Ìe3\\Ş³¤Ö+sN~¸âíùêÊ)ªEÓc(²À¡ÖPŒÃŞrŒAV\0U2@¢J\0\0˜óìˆh€Š\0\0€\rl¼GÜ·.¸£ÏÍıœ¸Ojm¬ÒçNTrÍ:íg\n„¯Ë;ºÈz¤×è„b—g–Ü•Z3„Ûè9{ãÈ(£ 9óÔr\Zx«ªËÙoO›ëR!µÌ\n0²OxNR»Ì³é–O§	§]›ÓeÏƒ%b2×\nwÙ#Y^ÃÕ\Zõ–ù²’„ÖŸ:ÖIg£7Ğd³#7¶£\\çS@~´å>Ï@ËjÆ2†]f$£!@JÎC93&”ÀePI@\0\0\03çØ= \n\02(1\0F¦^#‡nk\\f+Ÿ˜{9q^>DÙY©Î‰PB&Ä›M:]g\Z³ghjM„j	“İ¦sÌxmÍ”ãÏX~ºL¢‘à«$’²Á¤VÏ/=f=Yiõ¯Fb=éŒöšÃØyyvÍ•L9¨ÉgŸKS\'zHá ŒÍ—I/6Ü2ZŒëU‰Ì¾“5dKÛS®f±ËŸª9O«óÒ,ÈĞQcé™e(²ÅYDÎB€É£\nc¨$ \0\0\0™óì\rŒ’€’’B€\0‰4Ø×Ë¯=Ç®#Ÿ.÷y¸Üq›tò¹`µ\0Îãsy¬¨ZL 	õ#ÖFŒvIR @¥A“\rJ‡œØ-„¶€Ë‚D…0†ĞÈSH`a2Â¬i`µšídÖ¯7OdË9˜ÍfZË©­eïŸ\Z~›å>ÓÏU5EhÊ(¡YtŒàU3(Y“@)…Y%\0	Z\0\0\0s>}…h\0Ä\0\0’:@h±®—].¸Ì?\'÷y¸Üıª]\\ªT4‰g}¹¶ÖT-&FÖCZ€´\Z ±\\Æ¶Ph	,öeä)hVd	}ç€\n=D@YæŠi2M¹¤ZVz®}F²,¤¹3KYEÖ·7I^^†r‹n¯Xñ3Ï\"~‡ç>óeÆ™ZQ”E\0Ædª(Êdª(E[(­(t0(\0\0\0\0\0æxî€ \0\0l\0 Ğc\\\'úlï8kä^ÿ\07Ó>ó<š¸B% @tç³ÑÊÌÇÕòåÖsÚxeØ›èã´ó˜úy\r6¦æì…©ÆëO3¹›.L\'¸Ù\ZƒĞ™M:ïe<FÇ7k§3£;èy#M[l´ÅhO4º]d_¨e¡—s;b6˜odmn3E#×§KL¹uóZÌ†l³õ¬¥§—SÍ¾|³?pçHòÕf²‹+@¢†JÊIÊ#51²‹ÒÊP0\0\0\0\0›ã¶\0\0 \0ŠÀ\0Qˆç1®‡}NzbL?únCyÙ•&º	©&ùûôµ‘FÈúî\Z“V‹Ot¾aWÍ´ƒo¨÷ÜÌÆ±däºMnµy$b:ì´æèğ˜D»sÂÓç\ZÕæú£Ñ§	 vëËrh+s–¢=é¾>e.¿YÛ/s—5ÛŸ/ÔgS–ÀÚÙ¯1.s×\Zºİ×ÎDÕ„¾9­e³r™õs˜µ<{çÍ3õnwõ\'-dÍ¢Š+K”XêÆe(´Êe—¥  \0u@\0\0\0\09Ç`\0\0\0PP@Iˆæ¹ë…áß[5<ÛÏÆ>‡Ÿ—Öv¢_tfI4êh:=ccK@yu–=EÆÓMta6µÀ‘©è;ns–k5×½”˜š†«ÆXcÖb¬:ÀwØ{“èÒÄx*µräI˜Œ³XÌ¢<Ã2Ëfı­q­¬§Y3Éu Xäz•&Ùqä9üZË5e2™š&u{ç¥;¬?]pÖX±µEhÊÉ—¥”1Õ•YÍX´¡Œt\0L\0\0\0\0\0ç8ìB\0\0 HÀA\0s–ç®‡}tÖ$×o?úngSn`_&t³$*iPtúÇ¶–ˆb+&!TÅ $@ƒNjYi [JÆEP<€ÖBæòáÒÔ2©B©\neA-LU.B¦˜Ä]…—•’ÛyÍ*Ë-e2™)O\\ë‡ıÃ^¨¡µ”4¡ä£,\n¬¥VB™¡\nÑeP\0: À\0\0\0çxí\0Ä\0\0@ €ó—-ñ:ø1\Zn¼¾MíósZ›Ã_5¨@2€¢ºİã50RÑ… €PQ HÅ“(¢j‚Ä^jÊÆ=G­5b2ÈCĞœøèÑPp\r«ÂÖÒfŠ¸cZó§—”ÒÍcË5d-œ¦Qš½cÂläı‹É·Å¢î™E‹JŠ(º³ ‹¹ÈI4¢É.˜€`U!€\0\0ÎñÚŠ$\0`*\0„Œä¹o‡áÛÌŞ#œëËå¾ß7?©º5™Ö&‰\0*¿¦3TØ_N]©¬Ó—€“tmrğ\Z\r,¦¼Õ:Ê=ù!Ä“¸>i¥›y(r£¦¬¬ß¡Œã±˜õÉ¢=ç´ñ¯ òFÈÑ9ÀhBÃNlmñ|·‰ £pj5|Mi\\ò„l,óÚgN¼æ›7Y,Êe,¦hÖjc	?crtX¬»«‡¦@Ê2V@,.rŒ Ò€aT\0\n`0À\0çxì\n\0\0#A`#Åq¼ºq|:ù×œ—n?8öpç¤Ş\Zv¤DBĞ;c j!æı.ÍñÖcYOf¦œğ™µç¦¾?XôÛåÜá¯:#BY®Ó‰Ò¨ód4ô6ÜPãèñ†1åë\\DYç7‡oS>uµ¯9­šíõ¼5¢Am{Ìå1ïõ¯›\Zë¹Öbä<×<Á­»¢ìóšl_6Y,Èe[F²ç-)?_ñvİ1”QCÑ™I.²EMÎq\Z1€\0é)cP@\0\0sœvÂ‚¢D1ˆHÁAXÄx3®\'—N?‡\\‹N+¿{|ú\\]á£h$	tgc¬YZ¨»Ë,èQáÕ’Œg’°øàë]Tk\rqî=Æ‡Nh£wnãÚ|ÿ\0lEMuå¹ôå‰f#SÔh„ç“qkkÔvQó½Tzùt$ĞefÏ1èZŞ¼â€ôfb2k(StU˜M>/—+·!•2I®¹õÙ¤O×\\ß=Ùc`2ô¢€ËY\0,W,È¦ACF5ÍfBh(C$ç¸ì\0D…\0€J‡`%ÖeÄréÉqí‰¬Gêóp®\Zeİ.“5	™»]á\0°Ğ]¹Äh‚ Ò1²† IÕ	S>ö¼ÌùÕ„Ó–då\0–YE]¸¶)(µ i @-IsUÖJyrÉ›˜Ì”U#Zlæ®Zò×ÑùjÊ¶ŠL„Œ½2“0Xè2Ü²Z¡¥¡¢(aL@c, 0ã´:\n\0€š\0”€—S—Ë§+Ç¶œú¼Ü?«†µ½ÊésP™‘4ªí÷Œc\0´&-ÓM\"Y‘CĞ©‚¦F¥”¬PL•J€¦A…®CTTŒ÷.4†È^@ÚU–0ÆXî±\Zc_–LÜ†DÊ]Ÿs<µ~¬å¯«òÕÜƒJŒº2Š1%)rÊh)–dÒJé€\0€  \n9Ş;\n$\nGL$ @#Mp¼zs\\zá·¹üÇÑÇõsğÆÌÓÊ„\r‚bë·ÜÄ5mK;fKq5¶™æÏyœ×ÖøæÄ!D):Èòœá\'xÖ4¦U!Â2*a;ŞzÉ©Édô›\r<G<P5ôŒ¾yr†Õ™­6iä=1ä6X{ÎwWš‹¦d™ì²ó8á¥ºŒïW3’(ÊÕ³{Í/—7ÜÏ#géŞO´óİeehË1—AE™lÉj‘èC \0\0cM-…\0C\"¨$ @I£Î¸^=9Ş=qÛ‡\\şYëãÇwç‡-‘§$JÈÓ&Æ¦±´G|ÎÂKkW[SÉ–#ÏTnA&Sç½VgÕrãnº3ËÅõ3ä25­2ë4n2Õ\Zúç4ÑŒ¸ú/=hÓl4ö\ZáÌZXî\\-6ç©z²Õ›ÊğpØO6œÕÓ:9£/9¤Ói¥é+§Æõ9ÎH³#TÎMç\"ù³}Ìò~äûÏ=²Ê`Qz# ‰ «!BdlB+@:\0‚´fƒ–è\0\0’¨%‘qËÏã\\7.ÚzÄ°Ÿ(÷yøş¹šÙšLÈ\rPY «Ó¹¸ÀÎÓ-Ö[Ãåº»ã ¬1§ËŞQì7GÆôñíC‡P¬¼–r\'Ğ£’:Xå§MIª·ÜiæQ¢ÕeÙÙó×w¦¿3]ÑèËÄjjŒçVrH‹,ëMY”öeæ5U» ×ë^V^Yãhbµ+,dšŒoQ•–djõœ·>^Ó•>ÿ\0‡è>;ÈQaV=Õ–€Ì‚(Ã«1\n¹\n ¢ƒJ%SÀJ#4·CÄ0\0ÕÊ1Ís˜×Ë¶“¡q§È½Ş~?®sW¼ÓfÀµ\0ÉYôî®<”ázò2˜×é¢ ’rí\rœfšŠ€É\nÏ\\u«Â\n˜É€Ô‘dŠ¶G%4™\nPb2†ÇAK@2¢‰ªİTÉ•S.ZŒ²Mn7£Ê‹25zÎkŠ1åí9“ìø~˜ã¼ƒtÃL‚VR2Ë º¡€\\åehÀ’é Ğòİ€\0I@M\0d17Ìã\\/º{ÆaÖ~AïáÇo;=§A¤N &}s¼ùtY8JÃQ*¥£È„-\0\0©‘ˆJ‰$¢D\0HŒl²šr ¦)X²eê±%2€ ƒ&\ZŒy[BPÆdM6X\ZìkE4ä³%4Ï¦Mg7 Ñ×ÒrıcÇy!Å¶RP‹2h„e˜@XÂ™UdŒL†R@EhÄPéfƒ–Ø\0J\0¦ Cß-Ï\\7>ºÎ{ÆÏ›Yø×¿‡-¼ì«!«Æ \0Z ˜õ¦ç—G“…e\nÔ!lepŒšzŠÂcD01¨n2Ó‘£ b²\r¢@tŠ•@µ2ĞÆYBÆ^HzŒySM,\n(­Ø\ZÜëA92e³“ZÍ¬œÌ×WQ—ì;Í;YHé%EYS%\"¨(’Ê\0+@‘if‡–ÀJ$`!ˆ\0\0TÏ4¼Ÿ=püzëóÓÏƒxø×Ñósu¶­Î¤\r\0™ØiÖÙ…¥rÆo\rä¼Ñ×³ÂÑ\Zøõ9oO®CêÉá4f#j¾Ã“<‡i\'\r¦«II&•†d”1Û:<œ)ÇJ(Š\0(YCZ\Z0,¡€×Æƒ=rÓ%¶dÜÈ928ÜÇì;ØåCe^”<²\0Ç£(PÈM1aLcÑ\02@ÑsÛ\Zˆ\0\0C\n¼=q{øòÅ&£§?‘ıİn9¯ÎZ ™ÚiÓÙJe„täIá7zsç{–ˆí+æÆÆ_fœB3êkÊŒ¼g§RN(Û›Éx½5äŒdÒ%Aæ2J‘£Æ™@	c\npÆ¡b(\n ŠKeeQâšçòœ„«3wr“#\"=‘û÷Yd`2ÌÚH²2ô Ê4¡@] f‡¢(	ÀÑsĞ0\n\0\0\02®?—N+ŸO&w~,öñç™İ[à<“P,å´Å­g{©:<¦2\'ls‘·<5”ØLá15ê<tİ]é5§G—ŒÓ›SNlÇf¯M~iŒ 2‘-”\"€Ci’ÍŒ`QV¢àŠF5fE–h¢ÕER3Ã.—\ZÀ	z”z¢¨=±/ì>7©ÉËCVA¥B(­(E–02SD€SCe†€Ú“IÌ\0ÅLP\0\0†H2	®7—N/ŸO>w[¿?›ûys‰¾­Yå•9ZA.óSs¬-J¦QW 5hÆNª\0Íg[\Z,I%$r‘ª1Œ’„\"€c¬±0F5e(ÍRØÄPËJ<Réq¯)iz”e2•X\rn¾_×Üom“•–PZ# Š:dÌ¦!#tÊÆ*¢FĞô’šƒIÌ\0d”H2\0no¼¾|±YÇz9üçÛËL›é­)…”&¤¥‘ÆóYÛÙ@ˆË„¡hŒ¦e^t´2²e¨+1“ CS¬¬Ù’Y	j€E™×(¡AT\"€\nÀÈ¹\0±„ƒ\"‰u×‹7!zÍl³\"ùÍÔ¼ü~»àïñ¬ƒÆ1ØËĞYªÄ”\në PÅ@ÊÃ@hy˜\0\0\0TÊ\Z¬Ş3y=qeŠ8?g×ÏNo¤Ñ¨–˜”t:ÎÂá‚²K,m$\nÑ$²-gL&u@2¢,cÖe\0TC2K@„H…i	\0ÆP‡T8 @1”PÖÆQCËI<Ë¨Î¼Y¡zÎC%™F˜\rä¼Ô~µã¯¦sÕŒc(¡YEè‡•‹V\02¨(‚Ä:`P\0hÄ“@iˆ` \\¡B5ßÇ§+¸òÆÇÎ½œ¸O-a»4M,VcÑ@YÑêl,bF+\rP(MH™[6§…L \nœ–˜ÂYg%$ˆB¥C²Ú™\0FU\"À`QTZ Q`´RXÔCD`·Mx1FC&æbŒA›ÉÇê¾WëXÓŠ@ÙE€-ˆhÆPÊA–$EHŒ¡Ğ!\Z<æ†Ğ\0\0 \04¹ßÇ§5âÊ,ù‡·—ß–¼İå¢jeDèHvtzë‘×\0ÁÔƒ1M¥\"\0(Cªr’I¶YB$\0‘*ÔSJF$  ¡# éE-P#,cVRQJ\0ÊJ<öés¯%£-™CLGE›ÇGêWíÖH\0¡Œ,£ ŠY+@hÌ‚”T$¢ˆª’2†*`’e\nD…Q% \0I¢Îø~=¹Ş[“ÇÊ½Ü¹^Ü¼fßDĞ\"5F@YÓêzõ‡¥AV$¢JSRJÄˆ±°ÊjU3$€„$€z«\"\0 U”ÒáÊ‚íc¦2‡¢†1c1[¥ÍÖbÑIm[6—©ˆè³yôw7Şy\\ŠÆZ*‘hÀš@\n €UCTR VÀÑÌƒ€:@ÀD\Zï†ãÛEËpb¸ù/»—-ÛM¦&¤ê6Œ\\ôúÏ«QÂ†5eÔŒ`@‹!’!#\ZĞR	p²•1”H\"1€„5yŒ€dLA^ƒ¯B3	5Â,«w&¾niT1”PPÌ6é³u˜ Ó+Us‘2Y„èóy#ïœß¢¹ZVPÊPÉRZP„Vˆeˆ ª‡)”¸ÌˆÉVHÆ!YFd\0Š\0\0‘‰q¯=Ï|7º|n7 ÷rå:ò³`ºag@‘4‘…F³ê ™h÷Ìç5zÕ+™¢:-On^}Ç’N˜¼¹Vºk9óÉdu’^GJÉ¼9c¢QšÍ)å^«.4ë#Îéõù‰ôS‰<Zk$ÖéãÓ®æŞW>y\rùÍ@8ùt‡~kÂ¶†Èoi5E+0Ù¨Îµ8¨È–Væe»1eÑfr§Ú¹ßÓ\\–Ó)B¨˜@0+S!Œ¢L…Çk%%’¬B³DÃ€€\0IÆ¼ç-ğüºêq¼f-óøÇ·5ÛƒÙ›§S4%IYÔë>Š²mfË9úfn¯^yãNztÖ©ŸšëòâíëJ“x¯›C…ÜóÎ^·KÌi5¢7yzL&Äç“Ìo—Ó—!§ª;Lµ\Zz£Èb<&*ŞÌİ6˜Y÷˜Ûš:ßrGºß!¸3(á¦“MxÊZ#SM5¨åA³FM³.K0åĞfs‡Õ9ßÕ¼–ÓePXÆ\"€½F \"‰bµ€,Œ\0\n$Ò9€ á“`P¡D„æ9oˆåÛ[ÁæéËâ^ÿ\0>ƒo{YòÔ´fH\0w=V³–Ö\"²uÛYŠ8ã°³Ù¦Àâè=ç<uùz òfëËÔô#Ô×Q™óó6Ü¡õi8C©]aæ’LKÒš>•5åOrxDœñ¥Ó´1æé%wd’x,Üiâa¨·HtùyÌvægu×›->]¬ø,ÂSL›5YÖ“RÑ’¯RìYÖó3DwØ~¿äÉ5C¨4°µ”ˆZX ÇH%°Ğ\ZÈÊ\0A¢œØ+`\0\n\0óœ¿-ñ\\»k±`×tÇÆ½ü´¨×4³ \0;³Y»XßI¼¬òúO.YÎ±87°G<mÍAÖŠ<¥¯˜OêË^4GÄgO1Kå\"Lf%&ÒDŒR1S¨¨¡ˆ«&²T à/TeçYKÓ³r°(,ÕçZ,Û£%ËÔËbÎ·yjN«öO\'¢iE(	ak \"Ë\0\0 ©P€id¨1•H:F†sEª\0† \0@È¼·-q|{x3\'M/Yò_.›qÖ¿%6	m N·\\Ş«cQš[2£Õ–³@)H’”Z¸É¨& š‘H‚,“œÈšC£*¤!\0„[O\"æµB†1•\0S2š¢¬ ¬€È4Öµ¢Ææ,¥—sZmq|&å?gyîÆV‚ƒJlCaª\rÄP°$ÈP„\nÈc4\"”$°Ä1/™y.ZãxöòfNœ×iò¿W.›&|õãÉM‚@ì/9İ`¬¥¬Ü£äô*dÖÈÔyJã& šDM\"n<yD²@ÉQ“Š$aH2cÔm<Íj°(E„U\0QVXUˆ¡¯®Ee™l­6XÎÜ¿³<÷u+ÊTR0µ€ÆŒ5hHÀ0Z$¢@¡ALc>À\nÆ\"€	\nC„xrä¹ôã¸ôóÍÁÇú9üÛÕÏQnÑŸob@€×±¹Ç¼±S:‘d³4#Ş™Q&ÔÕ…Ì•[SÛ›¤&±™a4«¸Î~|o^ƒÎ#¹“æcju™–Eq0ÀJÚH#êÊ‹\0ÚÆ1XÕ56]ÍKC¦6m¡|KÏsÔ¢·2™=ùÌ™cöG+ÓbƒÆ5`PP/@HÃ zÔ$ ¡L‹(ç¦Ô\0€\n€€,×åÇòíÈòŞ¨8_O>×ÏS.ÍvoœC@€×µ¹óï à:“g—¶Låé³45ÌHË:jçÌU¿5kà6‘«7u®kæõõLçZ{<Ş£Ä`³çCik3(LÓr†\"›2#jPó¦1…Ë,`1Ì…4Úhk4´U13‘ª_\ZóÜõ­Ê2™O^^—?,×ìWµÅ\nÄZÉe\n‘B/D4bÉ•¢	l’€²F2¬naAR \0ÒˆRëWåÓ”çÓcOú±Åz1«]«:Œ±‚*!›iÜöVaÔBŠ;y=Ùf­™ÉWxpõä;I$ò[Œö³Ê¸O%mş\\&˜±’<æª¨Í–aŸ+\"\nŠBÊJ„*6ÄË!Æ;¦ĞÊ€Y¡´ÆQY”-™rSLñš<oÎ]E3“W*ûdÎ«/×<oĞ±¦4cTX†0 `P\0Ñ”IK#FAcV1ŒEØi†:EJ1S€¥Õ/Ë§-Ï¤F$ù—«ŸèçàojÎ›:@R„3m;ÖÏ2HÙ&x=,ÅPe–À%@y×eÏéÍiˆˆ’c@ƒ\0Z\"2\0P)¶±(6Pê†PC(FPÆ1ÈJ*Ji3KùÇrË[jõŒ‹è]ë<ì~±äú‡-°Ke:P\0#\0BD \Z…ˆ¡Æs7A@\n §Íã9tæó¼rÂ|ŸÕÇ–ëŸmšÓ*\'1ŠT1ç¶¹óh²Ñ¨di°Uµ2!PÁPÄe@a¶rÆ’Ö9”M!Q4(	E,Z\01´3E\0ÂÂ.V*±ŒtôiCÚñšzòŒz:¢òÈgg¡¹å4ıUÃ__å¦C†@€+\Z0€Š\r-\0EcXµŠ\0á2Q’º\\Ş+—MwãOúøó}3åºÚ3¦T¬™Aè‹™ì®|ú<¥^šuMD€R)@DÊ$Lq©¬s!€‘\0¡“”„©Jd\",‘Ğ<˜ì¡42Ë\0*Ç\nVU13F[¥£KÆyM_>1•£ª2EÆS¤g‘ÛôçŸ_oæe(P†P1‚\0¡HÄ0\0ô¬PÆ1€Ğ9}bšLĞ+\0\0+£ÍâyõÒóéŒÂçñÏg=ØãÜiáˆ3@Vz®:vpJ‡°Y#¹ ´$C‰-@ÔCš((	DcÍDD\nêC´B„‰A\0šC¹b†\01µHĞ*˜à(EØQV…Kc“Êjs¯#B²êõ«Êäê“?Eáú˜-2Ä\"’Jô 4b(K@4SX¦©”5\nˆ`	®‹7‰ç×OÏ¤®&>!ìã¥Ú£Új¢@CP67;ÔÇ6eB€j²@ \rFBP]K.ÆM¨RI WI™\0”A€J¡\04‚åÔË)¤”’ÚÈR0Ò‡kLzRà5yéâTÍ\rš/zÉ‘\'^œÁ÷<?GqĞR°(@P€À€Ã@2@\n\0¡Cg\'¼8\n\0)P\0ˆ^:âytÕóÔnùÙøo·Ï«¬˜×©­Z!ª\0f6¢µ¤f–aè‘+±\n¨šbÌ4TÇ‡+jlŒæ,Ø‰¦ 	a)QÊÒÕ\0Ùêˆ™¡XÙmP3m\ZÉ‘«Lº V<›OA—X^wáÈ¦PÌ†A/ZÎšÏ«s~Ÿã§•h\rh@P1€\0Ñ@@\Z²uóh4e`r;æá”!PÆ$#óÙ¼_.ºîzÇgƒyø¯³¢½z]uŒÈÒ\0¡nÓÜ;M!È)cÑd”Iˆtƒ1hé’2¦`vÆs:‰©„*„È¨˜š	IhL±]1LĞ‹Qi4&m¦VOTeìÄ¬¼†«A—eß‚P†Y”KÔ³ª³é<ß«¸éå@VªAA@1¨4\0CÔ\rJÚ\rÊ(“ÿÄ\05\0\0\0\0\01! 02@\"3A#$4P%5BD6&CÿÚ\0\0Ípéí!AğÌkRÊÒªŞµèÃzrng+ìT²§¾±YîÏf*õzÇ¥?6ıÃêßRncìbÔiüF>·„ ­ìz8õ³A½C‘ÿ\0Ã\ZXö¥”£ú(`^âæ’Íÿ\0ÆÏ©ŸK?2¥ÛÃÇñ\"?Íµ3?\"åøc‡#²ÇŞ†•°:¿ˆZ‡Ğ·ÃG3şPR¡b“já#øõŸVŞ¦~iÜn‡Â>ÀèiMÍ¤¡­šu÷“û(5Ï©ÌU¾=\\wí¥\\oàéŸ“š¶–ÖŞ¡·¢f0Üì>˜x;A©³Z4çw!ö»Û%âŸ£k]Zèš…tM+¢m@Í°Ğ²m]jèÛWFØk¤m]#jé×FŞº6õÒ7®‘½t«¥BºfõÒ¶®‘µt¨WFŞºFÁ]#zéWHŞº6ÕÒ7®\nèĞ®‰\Zè‘¡bt	WBA®€•Ğ–ºWAzè+Ëï^]]\0×—œkËÔ¯/Rº/åëW@µtW@½tkWFµtkWHµtª×N¥x\nxG¯õá+Ã5r\Z¹F±èşhWŸü|÷âƒj74egà«°?F¸„Ö`Ş>ëÙ¬ĞöÆû»3[[LVjÕjµ«j·}µµ~}Uƒ²ÕkU‚­V½Z¹k¿U\\B·®s…s¹Ï\\ç®s×ˆp¯õÎzç5sÕÊ4¯)“ï.é¡µpIù_üÌü\\I\\67øKaş£½q ÿ\0½“œ?g¾;nìVıÙï\ro®k…½\\z¹î6åïOpOßÂ‡ä–ÿ\0&Ú3vÕÂ¦»?„½Hj5ÄÆ¤h™WdûØì¶ôG´{1éæ±Xõ‰ÿ\0¡ÎØp¬ü9Rÿ\0›\Z{µ®7ìü\'ÿ\0:ñ İÉ=„ÊŞÜ÷²ãÖuÄ)…6îa×Ëcµ_\ZÚ­VÖÚ¶G¨UÛ%›9Õkk-ÚÌ&l©idTnfÌVsF/)µµ\"ÙU‚ÖÖ×ĞÉµjÍc\\wìû±Ú¸Û*Àş´÷/ù6Ö\'t¹m\\\'ğÜSñŞúñîù0º$ÚœöçV¡üJÍ#Éâ=$jQ°¾	Qè#d\ZÆ¶l¢rqíQEfqh6—`Ó¤‹gÖ,ÃËJñTÑ^aHönY1fÁÄI Å³6íÙø1¯ëËYït¯:Vl\Z¼dÍF.\ZÅ7k,ÉŸGTLóÀlŒäè°ê<µ›tÜ„pF-2~Ò5±\\ÆÅ5¦ÍørL54”{V€î%¬ÎªÉŠ* ¡V}A¸ÿ\0›’ˆAªlé¬08kåD3•¢“ÈE¶<TÒğa|Zg³¥Wˆ9R/¬ á!håÛcÈ2{\Z«*Fu<Zà·»¥Ú*İ_$yÈœ{…¤jè%GaX,§r[m”J™›¿øø ì…0‚˜®Ùo„âûµ›Ès6O.}İíöm¦(ƒ»šJ5‡J›…[$İ‚ÍJÙúí1’U²‘®Uh´4#ò0xÜ#\Z=EÄzR€ù·€Éf)0ŠrÑ&­1pËø±n\\¬ÑÉ–=Ö3–2¬»jŞ>EfŠÅ.vªÂÅòÇî›Ìº-•Yºän/Š¯R’>I›…\r6¹oàŒlÈ¦é„[”3o&Q˜q×ó\"ÀïÅU8…2|<ºh=ŒU“ù4N‹ÈÖêš!ªF|‘ÌÚ uaà›,Ùü!”¬oí¥•ªé¨09Å0Â¹ m<‘„Ï™B¸rRyªİaeyÀ³Òë8:šœıîâ{Üû‘rAŸÄŒøÙøÑü±\ná]—øN)ŞçĞv©3sH-ô³Fœn­hRgĞÇ©Ìöâ†aÓ{$.Qí½&ıD™ézñ¡0ÎÎp7P°‰Y\ZêW+…€|e„ê¼v°u+wnÎN±Ø‘ï ¸\\Êªıâ´³÷Íßxå¹x»®ÃÓ½•î\rŒçÚÛÙÂªsÄÿ\0‰kënÖgşeÆ¸WuôÇ¯ør4çîPÑ÷§{¼uıtr·Üî\nÁtŞ¹F„+>5ğs”IÛÈb‡~t«>…­êrÖuµc[iŠ>åyîï_t[c‚xúµcçg[z <‹Æ/}ÿ\0‚8uN>æ‡öœ×QĞşÚå=ıÄ÷c±‚*¬³¶§xöBf¢„#µÁtUl­ ‰×póàE¬Rî©ä;¶äDÂ¹c_§„ñèÁ<^¼‰àIGH9—ŠYúÃì®ÍäËä¯% Tjg„p”;h§NŠæ1ÓCù#Ë¼`åˆ¡ñr¬’ˆ£cŒùu­æj8Ë¬²\n·9#]©I¶YskÃ\0€†‘¾XıºHÌ¿\"gt\r\rr\ngË”LŠ¥¯ãBCK^¼#Ø1«Â8išA¢«„s4W]ã	Ç-	°ôä/è)º-w®Séÿ\01na;Sİ·×ğM‡x[sèäÜ¨Sı¸şîÌh\\æØuŠõOoçÓÇr$ğ\'.’¨½®\"J88É4w\"EÀ¹:„áÃ_ôÚÅPü9Ã89Yg*¼œÏøâîIO®q%\r51p›âoÌæı73â–=S	¸zIeÉğÇW‡‘2.—Mdß×\r(p‘’YÉİÎ»r…OÊ¦˜.WÍÌ£~$3÷=4@$¥0·Y$ªˆOLíææd2,š>qÈô’NGÏÕ]j‹ËB<v£Õj\r\Z£^\ZAÄ_†ÍÏ˜\0…†Õµ›¶r+ÊÙM8äO,vä1\rnm\rNw\'~Qm	=‹÷Q&´á‚}?L<Âı$~–D/1Ÿ†rnum÷ï¬èÑÚ­æUÛ³8zå?>~)ª©Õ=\"²ˆ(¬ôŠÉ´–|È®¤]»£K¿QK¿M’Ï™&I©$Î«÷J¹s,õÙ?PIr¬åg\n~ ’ğİK<vEgŸ®½ğ[L<j‹©\'.éy—nùË‘lIç<UÂ´ÙÊ¬×s0wòYW¥s2³”‡ˆ–5áÅÉ¥œığ¿Vš8+e×—#‡.¦v³ùB>Y)J?]R¨åË”¢$œHG4eZ&Ìü¢5\ZüX*Œ[Ôt’\rAƒöÌ”XÄ2µõ6J¨äÜªõ±ßY½Yh£{«\Z/ö{Òİ$6W„Ë-ş.;×¸ŒÔ•‚¯µæà}Æ†¦\rhğ±72^ÌĞ÷2ävu†ºUë¤s]ŠèÜtnk¡s]ªè×Dæº7Ñ.Ñ¹®‰À×Fà+£^„-é‡«0>düC»>²ßg½¾åûkpÒ¶–.>~t·¤¾æá³ˆ-[6ÇÁ[†ÀmgÍfGø©è›#ŞÃïÕ€k:pÙ	ĞxI×†@®BW!k”µÊZå\n°ŸMnE´°W)jgiK_O\"~)x*rş{s«å_ŠÉ\n*hBx†yå‰}´\\[ê™ô-Y£RŸo»4Úœû OÊğŞû‡Š\\µnY‚Ù§Á_Úÿ\0`xˆŒ÷í¥_üıñ»ŸRå¡\\ƒ;*-•|é~f‹.º¬²dt²hâŞ§ş	Sê±Dr4uÜ§ áïòZ:Të\"ñgu¿,°ŞODÎoÓÄ ™±×ÒƒÉ4c\r#MXB¾¨æ­”UÔs5c[ÅF¸bV0hÖæU¬kgŠ­ÑVDbÑ	ÿ\0Ë4lP¹aY,h¸¤Ÿ•(fn*Ö6€İO$o\nG\r|^%jŞÇl´A²Eğ\\Å\Zò -5Šj-‹â9Z(¥Ac.‚Ñ FèÄ¢hç	•%uSÛ®;ûİTaùßêKüzKr£Oá?/+?‚âŸÚ\rqá!°¥ƒÿ\0_¾7[Ñ=È\"°FŠ‡:1¾)ğWêcQY\nY«€xí§Í\\çÆç`Ï§;¹luÈàdnºÓç1Vl£ÄU;„ªSşÆ¶¢tƒ	£eâ7+U´á±I2pùRlæ…o%İ±ŸÌkV¢ph’“õbnÆŸ„ÚM_´†Ò¬Î0úF&ŠÏš$dÃ³]´Œ\n*§.ùº ¨öë\Z5²ŞO‰ÍŠ£\ZŠŠE3Hñ¬$P;ö¹›ÃJ·Xñğáâ0a\Zn©$îÅ’¨²ÑÍHebAVçÔÔ=ª;*è)‡¾(Üì?ÁµZ±è,\ZÛ^;v?Å?Ğhkˆ÷ZDy-©m‘íÎŒûaX«Qv¦<PÉ»_Õñõú½€Wë#_¬Wë5úÁ•~°g_¬WêöuúÁ~°g_«ÙWêöUúÁˆWêæén¡Î¹Ó:ç\\Õ¯®hoE1‹_EUM^\"”8UÄu*Ê”<u€\n²áDYbkÆMÙ®±”:nFŒª‡?TàA%•Dz…ùúÇBn­È¸N“rá!PçTúŸs{mDÙG³¹Ã‡ç‰ùÖ¬v[Lw@[ß³ğÓúÆ³Û¿‘°:Fœ{;Ù[Õ¾˜«ú¹ÿ\0>óÕ¦{0w[ƒA²Ü §<GÆµc[v˜î\nÍréšgÊvËØ\rÁŠxÎÔü~­¥MyW›¸H6u°÷´Ù¶™¢€tèí\\µ3¶i:‡pÑËS\"ÁÛŠ;e‘P\"Ÿ˜‰¶YS9`í®s­,],z&][€·-z$#u•AcÁZı3‘SS$Uç˜7&!ÊwıNTU00`«õA(øg«W Ğ”B¹M¯-êÂ5a¿-.ÍvÁV©Y#K³]½+™#u;EÒE£fj5¶–Ó\Z\"’‹¨©‘À·ÓmMïX¿»ÜzWtÙn	?ğ>M¯®{ÿ\0\Z[¶)ºª¤¢v/\0šàº§»›:\r9ú¥×İD²ëßŞßúÔ\Züê?rŒü#—K1†zª®à[&ğñÁ~~¸ìÀ‰2rı€ÆS“!YD¤çß»o\\D>+\náÆÄ]ùf$BWúüHŠÊ\'ÄŠ¬ª<O7.í“ú\'ºnQÛø„oSÇ2Ñ¨x®…r±¥JåYwîæ×fùéSe11$1ïzƒ?x·K\r§9KÆatn\n³ä#)‰\ZIO\rI“¤ˆM½ğ\n£µWLQğ©_¸Aå;ç¾dP¤éœ!›¬‹-¤JÍt$‰È¢„Š\01õ°üŠÀåÛ·(Æ­2Ùûµ9ûÚÛU(w@»+À‡ú>F{í~üV;!‘¬S\nà4¹!>\0áÎ{´=wÇÜèûÜıŞàÉ>Æ©0B5†s5ãÜÚN™ùÙ‰x„¦lãˆzŠ?!ÎÆyÃA}\"ÕÂtÑÈ7YÜâoT0Y\n}4GÌé›Å˜¸<ãP²zóN²ñÕ™bw²²M¤OH˜…VNQ¤ŸK0x‹ÙfÙù¬HªÖoÃ–]ëÖ^BÒÇ•IÔŒÃæ*pÙ2º×’\Z¶aM‰r’>E 4yå@EÅ=f}Äœ‚y7±®™¬ò!ópåçNB%ºîê¢?qö5F¼dh§Œ«ñ‹\'\rd£N¼¤©ÓÁ«§®#<Gb_Ô“â;6§§!euÅf­zS`&èîğ)ÿ\0“ßŸW\ZÛ³¨zµZ¹7ñŒL§YHv^_ğ\r‡Tçß¡°˜Ş²tv3ÔîØ  \"QI.™ù«MÈ¸B”UUÍŠe,íQEÔõs¥ı-©L:û¹ìÆŠûİ¶SÕåèçÒ\r1İjÍZ­\\ºÛKiËzÅoV­ÆŠk×@™Âÿ\0øwN=ãV§GåDŸ×rå7>¹ÔãP«àµ[Lö_Ñ¿ÊÏyğï½MÁ·±ÎÊğzœ²!ëg¶ÕCj¶ Ó~În]3[^¸g…V“U»t›#¦=sÓ±¥½ùÒLlÃØÍ=ÌÜ(Ù¯ÏbAõŸİkjÙ¿P¯é‡%1¸aÉ‘†qM Î²Nádw\'d’ĞJ²|>a+Æk1pÊ!g æd›6áç›+Ãkø;zvíÇø8ĞØuÛm\rM‡ÕÂêr».=löÚúd{-Ûjä\Z¶¼ºX£V-rÚ‡” Ñ\"\"¹õÔö¼Áıô56nXåöb—½Š=èn¡şæ™¦À\"´ğ\rNótoö‰â&Ë§áææñ/$2SxeŞ*ùÑ“:ü7Îİ¬MÂ†0FnUOLi‘·ÂÆ™ĞØsöûµ4÷½\n‚?*‰î^üü «k?ŠµèB¾‚‡%ª×˜µ{R>Ï„¶QóC\\Bk0wÌ\rS¢l{0ıóûõAu[*´Ä‹ŠZbEÁ™’YÓrMSrñËÃ¶zåó#?*r³•YÉ<cN¥_½fe¦ŞUûP,¼;³XÔ?Ä\r»~ßm´Gû/ª$ÃvGñi…mÚ\Z†5ZÕj±k4^jÍnr’‚ö˜’ö|%°ğhÚñ/õß›öRŞ°Û½†îr?>€|zôƒµÈ~Õg¶Ô9~D\r—…?<oÁ(_[im>šÉ¾m§%ô!m9h	Ë§/ {êÖ¿)=¿	|=Å\r\rq1ªO`G`SfÚã\\Ôin¾jŞ–~F{³ÛËz–ô}ºÑ£ìáé~ˆÁ³?4OÄÇm¾Ÿ¤¡Š\n½ZÔ)ˆQ,ô„1k4p¸Z±X¡°Ñ>Š}CCC\\I»©?¼•Â—û=ñwĞêõO¹îÜ|œUûÖöcPÓ5š_î:¢Ãg\\\"~xÏZİßŠµõ\nÈ*Õõ}@)†@\nµ¨B‚‹\\…\nå½xtZ/ÃsO´\'¾©)1»”iÏ²±İ\Zô-¦4@F³ñ­¦{sñUÇ`Phça[úí¾—<{µÏ¥šÇeªÕŠ¶™ÒÕk×&Ö¾¹úh—¡_ó½°m¹~8Óš} ĞíR¦ç–÷Ò§{z¿k°sV45f·ì<;ôš#\ZíÂ=–îL‡XîZ¹f§n{3ÙŸš·ª¦ú™Ğº;öŸväúà“Ğz¬Pw_Kijä½b‚‹¹³X¢’ô^`  æ½ù´\0«|‘§T÷}MN~©g#u’§{›¾?ìkšáe–ê&\\*âA„:hÜ:šéG@y‚IğÛeéœB®İ#Ã‘îNùº\r—mÿ\0åØ°XcXÁ¤ù¬t:24Ú®)ä*i³ˆh“Ç“ÑŒŠ²0Égğ‹5X¼>ÔW„‹f£d£QMô“#*§\r¤İI8£Ç)äh IHt£	¦>~{3¡Ãê ì\r{	ıcì·÷¾+éµg³jØ ™oG\0\n%ë›²Ş†~ íN©æhhø0İâ¿u»ûšc=švp©\rÔ«ñÌ‡GËÃ‰*İ^eø`†ëáÊ°LÒ£ÄåI@áxdÏäü8ï§ RA°9Ç‡Ş?’1ÿ\0\'ÄMŒ¬‚‹tnÊ>p_Uh£g)<ât”~*õså?A\"Ùjag/ßºh»=;zô3éŸsİÛjsöİ+ÀêYÏ«Ë§%´µ«5a\nÚ­ô…¨»ˆÅ¸Ó{Wº‚ÕŸO?ôîûèiMŠÜGuîg;­ÜÛfˆI¿hO<—\ZFIò:—’xT¤Ÿ·\"rOÒ<<M+²îz§m&\0YY$ÃÄ8Ã•İ³Ç-æIûÀŠ²òNo\' Ìª¿x²ËLÊ®F¯38ÊIA’‘=*ıëŠNIÊ‡x²Î™•\"É9ráÑû±XøúïSjSe4\rsKöÙ}·aûÜ¯ï—Õ\n½ëq­€3E_{f¹m ‡-ÖóZÀ\rƒ–ƒmæŸÆœ{èiÙ¹PGd	¹Û{œ\rÖÓ=¨ÿ\0[³†{s¦{sÛC¾~´¿İìÍZ8{ïàõ?x¾ß@;·\Z\rè\0·Øk4>ïÀmE£Ç®]óş\n¸wK{èjPÖe†D÷6÷©¹û¿$ş·n>.k—Ó?\r\\9Ş Ğ(4\Zcï’\'*œ,§)É¹{1¥»¿j\0Ó›é\n-àHVãV¸š‰ğ•ÃÁ½-¹¨jlÜ±Ë},	îkB7ï.md}úÖş¥û³ëgÒÍz»•Ï¿@ím³™/w\rî³fÕKkéËm@*ÖM€¶\' \rútü€­<¥}Ô5Ä#f?¨@±Ğöc¼¾å6øA­½Ö={iŸ|9ì.¹¢lòN g1GçaÙnìê¬×!‚†Â4[ÔY¢~tÏøSÁµq¡®%â¿ÙrM’ïGŞ°}uH„:”ª* }qØÙƒ·´¢fLúãµ8©[V{¼©ÿ\0H\0#O\"1JÔåƒ¦eĞÑ:<h‚p³ØõØµÄs†¨RÀË@Š‘1\n’‡*9+XeœK¨jkšÀÔû<’öB\nó‡Ïİ´·e¨*ô@½ô{dFƒ´\ZãüéàÑô\Zâsí%±QÚ¿ù»Ñû‹}İ@·Y±‰fÚV-ÙÅ¼~.á±£ğô’E}ù\ZpĞò%tvrSRá‰%ŒŞ!Ã—KE:Eòñ®[»{áÓFN­´k„Y»—v¿¸E³¸UÙ³y³$T€Y\'_¦ÏØªÁËt|ue!Ø·gİÁ _Â‹V±FY	(óÆ9n‘TÜ0tÎÊ%Gew\n\rZ0fªœ=#Ğ‘Ó=hm\"ñ‘ÂJy¤j#ŠjÈê@JÆ¢Å\"D·Eq\'lşl§{0Xv‡%#ƒ¦\'”­Ñºr,‘hòm(ÔnÓÄ“`Ùª9¤UPü7ØˆÆGŸ¡áôzV:?¢I‹G,Ñ)ÔşÇ>Ê\n\rô\n\rìê@\0RŠ5p™ï¨w[\\W(…^Ô®j&›…f±W×Ÿğ\\SÚ6hk‰ws+÷ö©³nö¿}`²Ú³°¹âÒ¤ÏR¼ìã‘~óËÙÎÈÒQ–+‡3FÜ6ˆƒÈÇ†’‘„n«‰ˆ¤Nú^œÒH”i‘NÏ‡°rÂ@;>lQá¸tNşÓd$X&±e¸®M1Ä“}@ÈG£Ô=â:$äÑ“M–F*K‘ÉÒX%Ô;âGæpıã\'+ÅL´Q(ÙT^•ƒòç•nòJ\\NW‰LÙcq$Ë7}FjmS¢Úq©’Rj5ëùp:/¸†=3¥Ä‹)Ñ×\\^ T4’‘—–@ã5<Ác8šTÈµâ¦\"5ÃŞ\ZÌã¤:¹Ùµˆh·IÙ·‰»¹EH‘tÅr¹ûT3O6YïÙ`nWœ{²Òş…´\r‡4Z\Zè!A¾€ã9§´4:q\0İü¨ÿ\0%§7ï`t¡¿r± ”Qâ‡\0ƒé·nÊ—.T”táË™GNİ?âÊ~(2\r8…ë&ÉÌ<Ié·q„k4ù£¯ÔÒbåé^?œ\"LSéô	=&D˜Í¿`Gİ¿U¼‹Æ©û¢5jñÃ3|åŠË8YÊ¨ªtTy*ıø8våÙÜÉ>xRMI•ÜQTèêç,‹ò6;ÇJ#ç2”E•ICÉÈ4WU¹üe¼eÜ¸r8£ªª¦YÊî+¬wá&ª©œàu\\.ãB˜J a-\\@LsÆYEê\Z1Ì}\0æ\n\r-Ir	Ìñƒç\\ĞÒßf‚‹Eì~±nŠK\n7Ñ®{íA¨}#š=fƒê®JÎ™\0ÛüGC`z:KØòÒ_S¤iÎÈ÷ÆØÎÇsc°5Ï \ZgáŞÿ\0\'†(ioe‚‚³£ïfZ{Và…{\\zY®[VÖ÷\0±Y¯Íc]ÿ\0Á\Zw‡£©†4Ã£s,•;ö÷ÄîïKj[wZ±­»UEDMé.ÍÓP·s–.Ù–±¢mœ­FAbˆª¡–fé\n·zeæ;øµ¥Øİ²Î•uñ™uÏ ¶å¢ĞPPo«Ï²Oê«²¼§ò¨»ömßkéô×ÒZ½ë5k×¶³E¬Ğ†l;§¹\rJ4šŸu\"ÓßB l¶{	îi	\Zâ6(Wâ4X4Y¼Tƒ¢²é*xiDÒgÃNfáº­T¤,\nÏôl›pñ[_,•¤`%B&9û•ÖNvJv³L$Ûµa+*œtŠébMä;†H#ÃÎ–(T?”s<|İó‰!á—D]äjÌ£Ã~\"ªÔÉ±.ı«ÓI9Šhİ8QeÇ\"+¹#S›‰Ş9s5 ”zË6‹Om0ŒR\rÛÇ Vó	\ZïIlèÑL[É·‰GÎ &­F¦*¿–\"²iGB¨é›8õ¤Ñ…ê‘‰¦à¯˜´#ØÆ°&¹£ê\Zºşº çe¸%[8×€oC¶¡q¬P\\\0(w¯Çv~yö”ós‡Øêrz9yïïˆ\rû£Ô8Ery¯:mœ¼D¯ø‘üƒ³ÊÊ½nÖzq\' IE–ikˆÔS~¡ÿ\0**LC†¸o‘›O—$	\rÊÊ¼ñ–WNmÔKM-ÔÊ´#&Ü6ñw/ˆnš}›ãğä$j¥—\"+ºâ\\[ˆÖ;’qƒ–°¯4áÖŞ<¢ÍeM)0T]ÆéÂæ´¤’ä`¯œ¬ÃüÈHõ™S6ì,İ¹ŸñÔt·X)?*¥sQˆu/ßG¼w1(÷¬9ZPéÃix’pËY¸¨ğ`î)4’‰rnxRõ\rb«Æâg$Hì™ößù Ş‚ƒU·EıBËpr¶X˜¬vb³İ{Qw«oEª×®ZÏøªaå9ÜÚ,6\"{“&GŞïïwÅ{k\ZÃ¿`e¤ã$Û5\\Ó(„šœC\ZEM¤•>™#„ÕâtŒ‰ÎeMÜ²§âvËSù\'2+\ZTã\ZÏˆdÅ¹`İ„ã†N$$ÜÉâ˜M¯\ZWNŒñfÏ\"i™¼y>ıêlæß°A´«Æk’Uònš¾rÍÃªõ™»v\Z6xá‘Ó~ñÜ¾tôÚ$¢ˆÇ2‡YÂË™%•@ıc®tœ¸Bsœê¹p¸Ë‚\'¡N%YC‘ªp¥nıú¯×¤Ä¥9åcÛ§\\ÃYÒõŠ½ûï6Æ«Ú‚ƒm¹Òÿ\0îpªœ´\\k3VĞ*×«Z‰¶C¦Õo«!øÓá©‡”ä~º\ZxnVÄâ‡¹·¹Øşÿ\0|méŸ[\ZçĞÇ¡K>¸wqıê}Í1AA«-&_¯‡‡è@Üéj÷ Ş±[ÕªÛïX®kë1şÔòœ{´•àf÷·ËÖï-™÷g³5jÆ¸×šÆ–Ó”mê·láÙÛE¿yBQ)¨‰J1LAìm	 åØhîË¼+–Ş¢Ù[e¨4ÆßÙ’®=”Œ?;öc\\Vkz½l:Z‚õŠ½ZÚ\0ı_â-O)o~“†å_ş½0¸¶÷)ïïcıÄYu5­LD¡QÒ×¨ŸÎø„’•Z<éJšŠš‡¢\"¢RfåÁE›«‹ÀuÚ¹jvŒ9® Y`†¬Ñâ$’Axy&éº‰~É7q/Ø¤´s¦í4áÅy•o5…fÁÌ‚ªpû”ÛG´|‹^0‘FqË?¤àÌysj4<œŸš¤H\0æmâ¾G†ù–jÀŠ¾âNÆÒ9ÿ\0š„EB-³¶	G\"¤O‘6]¤”kD\Z¥ÕÎã\ZµVt‘ÈÓxæÉ§*É6/(„1Íåñ-•$[T¥	\rGnS*.5^—û¸ĞºŞú#ô¼’\r FÎ`wŠô³A[\rª÷¬PVÔñ–§”¯»N#à:°0Gs¶Èöc±§ô4µ´á¤ÈŠ*,uUl¬»¦ÒÅ	Äğ8…èù»Éˆ¢œ®âpí‚cˆzƒÇ†•PS“çDÙ¨¦]{ş½Ú²ó.—s?5\"t]Ï_M½]ÈÉqRş,tEÏ”ğòÒ\nGÁMœéÄÇÿ\0/‡¦Õìô\\±°Iãòˆ¯\r.ÕÃ.l’ÉpÛ•/Æ8;F´F7ˆ\\Ç¼AÌ;PšE³§|@ÁT]q;…_JÅ3qç²Jxïô@‘³2?çd%á¥-#!f%VñSMÙ–Ÿ,õDLòqƒƒ¹s×DÜÔR„NAX§\'–h¹ÎÃªgRïÑéÜê¶àçß mÙøÃÉ\"Øƒgœ0{ÅwZ±@¯É¶  ØsACµZÔ\0“Õè=På¯‡£GÍ\rq Ù³áş29o°z\röcÙÃÒm›Ò±\\>ÜÑ2QÍäHˆ… Mzêc!	ù‚M¡ŸÅ4s+ÖIé ¢È·oÂN)uOÎ¥B>${âÏE4x3ŞjŒ¡<éÌò’S‰ÌÄ¢OÏ¤„Ÿ^2C w’Ïfb¨ğôzÊuhƒc¯>²í›L9A«N!|Í·Htvÿ\0¡Naò›ñ“fÂºæX8–cÃê\\\nëÎJ;EK·+Û¬Ù#«Öt;…–¥¼Z…ã§§\'GeQcU¥.±HñÑ¥®µ•ÊM|eD¸ 1‹Ú§µÎÃm@¬hí¿ûq;>á-ã´Ç¡šÆ…åĞnZöÕêÖ¯Î(h=-èÅ 5şKå^\'¢KÚ#²>‚e³Â¨Fôj½n4±â #ÙŠÎ¸ôÚ½tÈë.ªçÓÍÙzÏ~5Çf},éõ0âõzĞõÎ#£¼çì05pj—m¦{Ê^a´Í^‚‚¾°¡\r/W¡È\rôÎ¸íåµ\0ßä9ÃÑ¡×‰w^Pnd(»7ï-Íu¨;‡ácLÖ*õnšßÒ·kfÎ(rxg·Á>}½¦jú:÷­»tlW}\0;Ãzê$¶—«èUëcVáYôÄ/ñÆaïgîşTów—\"FÔkÕ©”Sù\nuñ’Š0t‚Ëpô“tB˜´ë\\È4I³µQùs2Å÷£PBVË5M¬lSEX•Á*ÕÊk3¹L23‘E\ZºDœ¦¶¼<›¢›	–M;|w1R\rJh92S>|wÒÑ‹G«¯Œj‰ã¡J\"i#ù[f‘*¹E„74„»6è.Ÿª$<W„üü8¢Gm\ZÈ±hFu?f‹M/D)rÁ6$kbÉÎ§ãcSî>Ö4À§AC»aÙn	1|jH+5ŠŞ·¬ÖkÏm1 ëŠÏ¡ŠÏÄ6û^è:No+$#Ô%°f}åŞììáC¬hSÊÌµ;Ù©—mÜ¾^\nãc¡)ÃØ,îIÔ;·“l#™R°°ıË(âÇ‹¦ÜB¬‰ mK\"Ï‰›œ“¹#;`ÅóæÍÙqÍnåVa	üÒ‡ˆlux˜Äáw\0JñRì‘ØEE¦åù%^•(ÒJ¬œf±\"Ù´™TÖLçeÄUK=4_ğòÊ™Áùô½~c?bX®_1›æóhõ¢0iYXÖ‹) ‹g¸…dV_ˆ8…ïRıVË#?‰ÆmÚ8Ó‡ÈSÊ²`±æ\Z¶[Ï¤Ù¹ê;‚£ûT\Z_W>Ä÷l ~çŸ÷Ãnğ×`\nå5\0(¼Úb‰¶ƒ½}4™ïÇ`ŞŠno†zw‡Úš¤šaé¹—KØãf½ä÷+¦júp°ÿ\0ÉMº#e%\\&Á¤jBåï¼ßE38Ağê+fğı<—¶QY.![™ß²8é?F1áÜ¨ãH2³4azGèÍ4_ˆú6,Ã¨yn!~¿Rú@ğ‹£ñ’­§™× »÷òP`òuüSÕç¤’‘{#åÜF‰dÕ‹9k4N^e¦#\rÍJq\"&JBs®k%%æŠ–Ú\"¤‚šü£ú„ı=õ!Ä†”:rHÈLdÜ±]YwË¹[ˆ$\\(ywÊ;:‡TèÍÈ Ù¤Ôƒ8r³¥4Ie9åŸ¬©Ÿ»3‡/\\»6£Jı¬ê\ZwM°ÿ\0½Á\'úƒ´ºg²Ú\0Ø/EÒåĞFÔ\\ÚŞ­z¸†¡¦ıÂøgÃÊz7ÔiAÿ\0–s~t¶+­Û÷¥ï[ßØ‚Ë71ÕPN³—h‹(€˜æPzÇ\"ŠNœ¡Ep±e•ó7H·AdKÁiwşbû[f™™p¬¬S45¿£}\0mW¿~*ı—¿mõ½õ½_²ı˜Ğû“´4[t˜ıI<-—à³Pb¯èg³óz½´ÅÃş˜yOzÅh¦»åw2TóÙ~ôw;Ÿ½è‡mõÇn>%ôÍc\\é}o¥û/W¬úcFß¸4?±‡Û{÷¸=^Z\rôÏ ]¨Fô\Z{h\0¹oÛù¬UÍ Õ­İš·ÆVS¡ú´8Øè}éSÜ÷¶ûÎ~ÿ\0nk”kpÓ‰¦*ÓGUĞœ*C¦tnÜ×“Ê<vó[ĞÅgLvş	¨vâ¶ôÃ=†ÜøíÆ†Än$6?\r©ÊDÆäĞ5kaìÍmA r…Z­X ¬Ö+ñ€Óa¬ê?U¼¿jyN½ú9?\"lÜ}ÈÓÏ¹Yîe»—¯ÙF\"·\"Í±Ø_ˆ‘`Ñƒvë:Z.\rGÙJÇÓ¸0ZsÍY0sÄí‘jíøuğ::’xÊ\\çqÃÍxxê úËÔ7\n–ñì\nşd‘Ş4S¤Xº}$şBQb8‘ÔjŞ€k/éç»:†»‡qÃ÷‡Ğ®K<84ÀÜÌıNkéŠ\n¸\0æƒ”+–Ôzå·f5½f³W¡­´½´ÍoğV§”ãß¤‰¿ƒ†ŸûGayºõèïí­õ-}B õ3îz‰HÔz‡œT¨I›÷,LC*Ná¶¾;öÎ|bC²;×üHğ®äV0´áSQ(¨¬Ü’q´Ñu¦å×nâ[ˆgˆ»©n)xdª¦JÓ7,†\"y!’ó™£/b™3÷ç]»C×Ï£}CmT÷ŸcçLkšÅ0-%\\<k/nhÎà (ögNzÍ_nË…õÍ§à6¬Ök~ËëÍWøkS±¥½Ô54nXÓìÊö2ç#u‡¾+w†¿¤\\¬lY®İË˜™Øê–~İòéI5B66q6ÍŞÎ˜ÈDÍ:œñíÆÆø íÒ³Oø…ú*sâ°ZN\\ò”ÍÚŒœ/ÄïÜÌÛÇœ¹YâìfÇ¤²ë.ª’MQZrUr6|é™ìÅoò1­ïŞQ×:/—-z¾¥Õ®ËÉû vsÃ‡ç‰ï¾÷¾›hC½m¦k4Qµb¹¯ACµÚgMôÅmW 6¼ÚoCğW§”·¾†¸„Ö[f÷·™Àş÷|G÷¿!Ûš·n*ôuU9oég°{ñ®=\\ú9 îåéÏŞÆ½^Ô]«:#³™Ë³Î=âµÍf±W×}\0ÖÜ+ñE­è·\næ«[\\éj\r«éìcà¯O)_vœL?Ãwıdıí½ËXOß»Íâb³¦;s¨ë}-\\§ Hõà­^õà-]:ã^õÓ8\Zé–\Zé•®jé•\néÏ]1ë§¯Õà–¼¯µà’¼\"xD\ZğÑ\nğÓ®D«‘\Zåm\\­‚¹[WñªÍèü‹ïNşåú–³¡6rÿ\0“À‹<àãŞ;·¸ÒÕa\nÅb¯jÅZô]ëó?Û4Õù¡ĞtÇeşôò8 öMàØ‰nvûPög\\Ô6Îk:@GÁN¼¨QF¼ëÃJ¹\nğĞ¯\r½r!\\ˆW+`®FÕfuf•üZş-]¥s6®fõÎŞ¼Fõâ¡^2!^9¼rW]H€u&\nêNÔ©]RÕÔ¯]RõÕ9\ZêW¯jñÕ¯õÎzŞ¯WÑ Ó?k¯whiÿ\0ĞïtX+¾\n=ÛkëíA¥ê÷\r\0/¦(v«^†³X7%}Umoz-m§7Åq‡›Ğè5Äæı×ô#ìô!şígÕÇf*×øùîÎ¹øŞ·±Î˜Ğ;e–·l6sÁ#él:â¶\roz½‡:«j\ZÍ}U€«ÖÕpì¿e«ê€4çhw×‰\rüùıä¨ŸkQí‰Íûó¦;àcÓüü¯Æ¶¥w#ÉŞ}”Ëbì·\\Ö;ïzÎ™Ò÷×Æ€5{UíX¬UŠ:}!_V›VÕšÍoØmş©ÎdğóI¿Ùtk\rı¯·ß-Ûm3è~}øX«öb±A¦;oGö¯öµÏb»Ğ]]–àsÿ\0:¯¦tÅf¬=˜¬haÓjæ­ôÎ¹¡\ZØKôÖt±«pÒúoXĞwõ/Úzu‡zIÄ—zk¬Ô¯õ½¯ë÷â³Ûø¬vg·=˜ìÎ£¨é~ÂÆ¬ÑQZ\Z:\"MS!Õ;¦Ùvf£âÜHŠè™ºÈ#ã+%´m_Ó?µo³ÙU¤wn¾Ëp:–}Ú\ZçAĞVkm1¥¯C½\0iGmp¬V+jæøG§c³Á¶£µ)cJ¸ÜéíNvmèFÿ\0OŒÙªõiåãUí·cfK½5tƒb—˜Ï …£!´mª9JpŸ‚¸èÁ9”Šgşr5«Q2§’+7Éğ¸ÓÖK0pß‡ˆT%¡–¨È¤\"Û¢x‚*9Vf8¶Ôù›vQnaE‘S8©Ãh¿na\n¼<ÊU“‰M¤ˆATóf•Ìá=MãE˜­L ¬N\'LÄfÒ\rUÑyé“’pÕÅwİ“éÀ´±oyÍâ[C¶+iB\"Ø1¦fâ=Vq­•l›%Ú“š­©Ãè[ì÷©ímıw{ƒ\rg!İm.5}B±_B³¦ka¬ÕôÍ+j\nÍZ¯[†™¬é¸ü)İ;Íš\Zÿ\0-MÅ*wö½ı˜vGß©š‰#×’j2YxF¾W‰\\¼‡CÇ?*”„3\'Ô„ò5$é±š¸ÿ\0©E8[ˆTä¤!Z6Fd¨\'‘€H§¸P/#ĞÀªöI——¼bÍGÎ€¼<ÁÏÿ\0ÙH1Qñ¦•…J¸uÄ~°?+™iw®”â>)9ÆUqñxG‡„|Ú{şâ)¹¢ØË¦åx8¦}sù9!^ZVMãx¨sxl8iûÇ/à(9„t¼»†`òiìY%6&R\r‚U“¦\'4¢ññIÀúoê„–ò²&ñòrgl‹6òÑÅ(q$oˆYé1fœûåaTB_êáî !Ô`Ã™.nQ?\nğùhØÏĞ<2È°e8f¨;_©q¾œÔcl·Xì\r´SØÏt^}îPAPô1Ù¾ƒ®{CnËŞ‚ÕjÅoW×5ùü÷gÓS`yN}Ú*<©¶ÏîGjyìôí¨TmºÎ%Êñôæ¶„á]Ô»¾\'Rç3~êZ®gíœ1’bw²ï\néÿ\0¢Dh‹Ãş+IS¹“!ÉÃ®+Ã—…JbÈ´!¼ÿ\0ˆ[¬´ÔEc¦—ˆ~3<TÙud»;˜„3SIZ2›~±Ã˜§²Q¢°åb.¼Ğ‘¼Æ¯Õqbàåy´Q|şD\"£RQ”_Fâ¼ÒQQzB*)Ë3´‹‘A(&¦`³’7Oã˜w1æZ	Êî‘p	 ç.s3é›i¸ğjæJ4Ë›ˆØ	ÜÎ¶U×ê†Â2Rí$hŠ±!ÏÄ¾\",¸€X‘ìç\\	ñ\"é\"ÚyV„‹yÕ4#Ç-)gÀ*OuéOf¡ØmÊÃtß‡ïp©ùh¸ôóê\\k5ŠÏhl#½c³€­<§>üPÓÓr´CéHşä©àïè4øŞÈ—X¬îmƒÕñGÈ“‰\Z¦ƒi¶ÍÜ¯,ÖPÒOÁÌ\"ñÏêv÷k6‹g(Í¶nq;£I¶\0£Ò<Pt’7)Éúb¤Ú|Í\'9LŞ|±\\Ÿˆ\\œëM,ºÊq<‚…SˆŸš–|¸yãß	iW..B¼âDhÒOM^hü×;\ZëÑœ¬5â¼C×=ëš¹Æ¹Ä+˜kš¯[éz¿mï®*ıC©LbĞ¨sVh;M®h;`ûR!õğé¬š_Q=/Çf+šÕzÎ›öçN^ÌéŸˆµ<\Z[si.nXÒñÿ\0ö–çy÷s®{PÚ;\\h(ĞëÉ¾rJÇmûsCÙÑï½c\\ëĞ«éĞø¹»ƒXÊ’÷À\rê<üì}0¬z?N—ËĞíW¯§Li.?jyKÕ¤ñí†¿ûGÜëïz·A Õ†³X«^±ÙO3Ø:ô®|-1®},PkŸVŞˆPıÏB7ß\'˜YHcsEvgÒÍ™Öúg]»ñYø‹SÁ¥=Úq1¬ÀÜİ7şÑ¥·[Ğÿ\0ä¬Péƒ\'¤[6J^cËEmqY£G8#Õ†Ù®[Rñ«6i£XÄ:ÅICˆíDAeC§\\ÙPA~&Lî\n³eÛ‹hEè^x„Š‘XÄŒ~uœ²tÀçp«î¿§ŸW:g»†ûİ¡¶±£e$êÖsÃ‡ñ!½¡¬ëJŞtÍcà­‡”vœPã+ô¢Pú‘¥~ç m›ã³†ÿ\0íWUŸ›Í¥\'0o%á¤ÌY©\ZYö\0\nùsÄ)Ä€7‡ˆlœ£¶É»vXF„+yç)$äÅ›wÔ9‰qÉ2ò`Ìdx‘²~c\"«ÖGâ‡‹32KÇ¶•W¬áädœFÉ½<¬ä³Æ’\\G\"åµM(g0ÿ\0ò^ôÇ`z˜ìÆ—µfƒLkz½ï)±ôÎ¹«Ó²ÒaPÿ\0Ùá^ÒÇÂÅÕŠ¿f4\r½PÕjx4léÅ\'°º\"•!“îoA]‹ÙÃ\r•3ç®M;ÅH)ÔC™\'ì¼;©Gí¿§a#\Zåy)GDèÕ’ƒ‡\'F+CI”±‘Ë‹¿X<RZ69VnYÆ,„Ô¤rËKÎ²;•Ü·p#)ì¦yŠJñr¸l£DO‘‡o\ZÍ¼œÃfÏdx€­_Ù#TŠ\'”’)ROè˜Òşoß9‡@ôØël¯p\r2ûò{„VÎø(×ŠìÇÌÇÅq‡t:ñ9®íàÚ‰I{{3Ú¾ÇÔ6¤d7\'š¿¡“|j	\'Á^bò‚MøPÈ<\ZëİĞI>·\\è(Ò\r^bîºÇ#@ùÕunkª^º•†˜>;wkº„tyYPpŸŒz:†5sˆW9ëœá\\ÕÌj¹ëS\Zã\\Õı`Öõå¶2ÿ\0{»Øl´–ääğ!ù™üKwb³XìÎ¸Ó>¸íKïO¯šòO6U*.Éz/?µšÇv;oXĞ+=›Uõèu0ögĞÌV~NjÔ:­N>ötÇ`R;.÷ì³8àÿ\0ª8s‡•ÿ\0\\»±º¤Ø/ûûs»İÏa»3ÙÎm/Ù}G\\ú·í¿ÃÅf‹Ü-‡_{³\Z%÷\\n’JÜæÿ\0¨l9ÃÁÔié¹å\\û‰…vo®;Z…Ü¸İzÅf­Wüê\Z^ı—×\Zçágà€ú8¬ö-½:÷÷“î«qG+p!¹$şftÍg·?\0Øs‡zÜïœéS³ÙÈòİñÍsã\\ĞÖ+\Zâ±è^ú‡¥Ÿ—[5Š½+‡>v>Z3KÅyÂJrMÿ\0‹Ÿ\\øs‡c¾Š\ZÅGŞ®ÔZ—Ù?B3ûİ›g³zÆ¸\Z½g»z¿`í®+­ı\\k~ûíÙšÆŠûî\ZçLéùHßÄŠêxxü²ßågÒ=:Ã¬èìü­›ıT¥%N}£èEnó5Š¾µ^¯§6¦41¥ëœ÷«éšÇ«PÖ{o¥ô\réQú\\îJÅ\rf)Ú0ÙÔZÜş5ızÿÄ\0!\0\0\0\0\0\0\0\0\0P` 0@p1ÿÚ\0?ıØÿ\0Ï*eÅÑı¿;RåûPıËÊÆ,‚w•\n²è°ú/Ş‡”bÈ/2BE‹ê±mî>d\"åÉu\\¾÷o4xKråËíñá,eËë/Í‹m~hğ˜üì[kóG„´…ÜÅ~hğ—ÔX´DF¬—BšôTF¬—BšôD\"5ôõÒÅ ¡¬µÒÅbò.—SÓñî\"^EV2]Lz[=É÷¤5çbö¡äW–<%ïLoÎÅíCÈÇËÖ%^Xğ–±,…¼‘«?OƒÜ¿’5géğ…ãB«%‰¶>YãB«\'«¡ä\n²%Ö÷ÕãB¬‰u¿ˆ!VCÖ^„…YYzEV>ô-%èQXüÒ^…óX¶‡-\n<%æ¹}ZjÉy®_C–…\Z²^kĞå ¡p›/¬±è\\$‹k,yô!\nŒ–´ÇŸB¨ÉkLyô!V]oPcÏ¡\n²ëzƒ}U–²èô!VZË£Ğ¸~oQyô.§[Ô^}„ºŞ ÇŸBá.·¨1è«\'ñÈÕ“øÚ!Y,[WC£Ï¢‘\"åõt:<ú!Y\\yôF³¸óèU˜ş6…YãhUş6…YãhB?Å¥¶^‹6„!“ğ1Z[ªÍÆŒdµÔX¶v4c%İrúr._8¸1ümpcøâàş8¸?FŒcÕ–Œ†1ãHB¬¾6„*Ëãh\\%ñ´*²U¹‹¡p—ÆĞ¸KãhUc­‹t>ûßĞªÇ[—è}÷/¿¡UXZ\ZXõ…¡¡VD»Pş\Z…V>Ô?†¡V]*‡€bÌ¡V]*‡€bÌ¡V_B¬¾8…YlV-™B¬¶+—Ìª²^W¦¼Ò«%åzkÍF²ÀØ¶÷\ZËrûÒàø±u¡ü)puBºĞ÷¿ÿÄ\0!\0\0\0\0\0\0\0\0\0\0P 0@`1AÿÚ\0?ëÜll‰›n\\~=’ğŒlt›Ø¼s%áë¢òóƒc¬>‹ç—˜ü¶i‘ã±l=‹qØ¶û,[–^[4ÈçìX±bÅ«bÅ‹rËÁ²[4x×ƒcá—ƒd¶hñ¯ÇÃ,sEºŒ•Q¦*>ãXñ­—êH•Q¦*>ãXü%Tiñ/Çà™*£O‰xæ<kMŒuDx¼#â–5¦Æ:¢<H^ñK\ZÇÔë§–xIcXú’Ù§–xIcXú’¯é§÷È>)cXú’¯é§÷È>)cXúl–Íß^ñ’ª4W-‹tW¨H}IlÑç{¬[}‹g^2Äº’Ù£Ğ¶Ûğ¯.›%Xš~aQ’ÆË¦ÉVŸ˜Td±¯§\"U‰§æPÇ}9¬M?2¨ñ¦ÇXÍËßRC¬æåà%³L^eQ?-šBó*ŒyùlÑóJ²ÏËfšU–~[4|Ôk,ü¶hù¨ÖYæJ¨ÓóJŒyæJ¨Óê\\¿…TcÏH•Qy”*K=\"UDæP©,ô‡X‘âBñèTyéˆ‚#Ä…ãĞ¨óÒª4şùég¥Tiıó¨cÎËf—Ÿ–v[4{·/¶åórÎÊ¨ÑéÜ¿‹–vUFNÅ¸l[m‹-¶Å²rÎËfŸ–vUı4|ü³’%Uô‡ÎËğ:Ü¿\rËí¹z¾ÕËôåœ‘*¯¤~vŸ]ö¬[§,ãaô‡Î­‹mşOä±bÅ·ÿ\0\'ó¶Å¸ì[,ãaô‡Ìm‹deœ‘*Ãè¾uî_Ã±æä:Ãè¾tî^·/Ù¹|km±ºéwWƒcÍÉ\rWG±bÛlX±m¶-¾Å‹Æ±æØë£èe›c®¡–n[4rOeËâ¥›–Í%ˆ¹zÜ¾×–i’Ù§ğ_0¶,X·ªE¹l[¸óL–Í?‚ù‡±nkâeŒ•Q\nX¶>Å±+>ÉU¥Ëãî_³ò?H}ıÍHtı!ôCô5!ÓôÓû±l«%™éúiıòì|L–eìÑôLy—Thú&<ÃÍG,ÃÍG,ÃQ¥èå˜cª4½³u_HtX»lEËÕó\\u¹}÷/Äøå˜cªúCçE÷¶¾kõß³c¾ùÑc\\÷/İ±l]Œb!ô_:Vç±jØ±bÅ‹VÅ‹ç±l]º~‘.Ç]?HÇ—c®—Iù9eØë¥Ò~NYylÒôŒyylÒôŒyf=š~–Yf=š~–Yf1Ö¿¤yf1Ö·FåÏèş¼ƒËÊ±ô¬yyQô¬xÿÄ\0F\0\0!1 Q\"02Aaq3@B‘#PRb¡±r’4‚Á$CSc¢Ñsá²Âğ`ÿÚ\0\0?¹\n?0V{tø[©dç#î˜\nõDİk¶Ü7;5Û®Üökÿ\0üæÀ{ròş§/¾ŠùÇÂİk´“à‹j1ùU†VW=®vëØçÛ”Çò[îë¨¤/…¶ÍT®¾ŒqZè€äĞ‹‰â·]¶_|¬£ü¥Ãâôø;<”næÑğ§ËmAÒñ²É|ã¿Åe÷>¬Œå\'İzmçueàâ&¹ÖßÊ\0ø©-àJqÓ-™¬øp¸Ø×¼x>ŠÛ×}½wÑ_|ï¢ÊG[úW¼?EïÑd÷}¼wÑwÏÑ_¾‹7ÛôY¾ÿ\0¢ï¢ï¼—xın?E©ú/ş•±¢Ôı®ú,‰ú,äwÑd÷}§è½çì½áşÕï?e”Ÿ²÷¿²÷¿²÷¶ıŒÿ\0²÷ß²÷à/|½ò÷­ú¯zÕ”Í^ù§õ^ñ¿UßgÕwÛõY=§õ]æıV£ê¬6d?u“WuwÃVl?Eİı–m*Øe˜ı–‹E¢ÑiÚTGı?wk®È¹…¾Ü>xLHînDğëµæß.Ì†ÜÖJäph²^œvãÉ[eÏŠöáÓf‹NV«[-OÕkû­uY9\\¹w–ªø–¿²µïú/ı…˜EÜoÑg>‰ÀF¹v6R3›>îaòYä½ñ4ø½ú£î³ì$\'—Ãë÷}†›^/«V|vV	€üÀ»£¿%u üÿ\0‰%	W@[^[kı{m>?¸rÔvVTÇ›íñÖø\09+0å‡â\"g&©É›\0ãÕµw¹«¸jT.i™YñAÂáÌ§Ó¿Vå–Ë[ƒ0´Yğ6 {ÆÈÓ<gê°‘§[4Y…®°JÜ$ç˜GrÂmä‹O‡ˆ¾6ŞË=¹¬•Ş,Ë_‚üd=vA!:=¥÷kÚ×5;(?¶b”ù+š;\0y¹^ÛF<ÅÔB`ì.îÜÕC\";x©H\\ÙX/¢t³ü¿*†º8buœÂ£¬v ä£é\n;´8õšVYæ½6<½¿:³ºÍÅª•ñÂæ>pOŠ|òã,ÜT®¦ì|\"÷(×Õ_€\n/c»e&ÎaB–JyIM¨i°QÏVŒ½Ö„Î“¤¸\0õØT5®\0ïİEÒ4aÍ6-)Œ˜¶Y/g—½ˆ¿5+@LĞuT&xåvğ_ÑªFÄnĞl\n†¦«·¾\n,äûLÆ^\n9gœ†HÜ²ÍIRù®Ğü-hb©êvæo%¡sİ½ÏO\r5;Ë¤“; œï@ü9\'Dÿ\0”Ù2XÍˆÍR´»]g;$\0ê†Úån¢­Æá«\0R‹|å{Cga¶¶:&ÁC$»nH:\'ÏM8Fs²Ş:V\\ùvŠj6IŠ<C’E<N‘¹–‹ox­ônkš2¸)®¸ÏÍÁğT²d:·(c\Z¡+†Z\\¯g\rÌ¬%¶ıVåÂÅc1¢ÈØM¼–şAfyğG`Fşm¿İ¯a\Z‹¬Ôíü¿ äy9lşƒ;\0T:–\ZÜ©à5Q<X\\©[-Dm.ÍÉğ‰¢mC¥5†¶!$n¾ª(b©ˆº3{™NÚ¨·Î×XçfìŠö‘^ÂÂî|Ô®–xÜÙ³k¹)©ª:B2\\Ûôî­ˆoEµSÅ5K\ZdsNèºÉÃp»¨ÿ\0L5,šÎÍ­^ÑKîÚìğâ²yŞ™3ïŸrÔ6©òëşûÛ›¼GUŸ	½L¥q	×µÔrK+X\ZoÖ*\Zøê#{…ğë™[¿Ë{”İÍ|F˜·6Hí¯¦Ê2ş­•<.t]ÛÚUL³ÄXz¢Çª.Š¢#¹f`9}†ëÚC¬q¨‹gˆºõœ›[€öS‰¿Ò…tç¨]o@Œ”Õ1nÎwÉUToAİæ|Ğ‰¾*	‡ü¶Øæ‹eu·Â.„Ò›71ª“¶\"J¨‹rfÔèg$an—²©„Sn‰VİTR3ŞoSÄ­µ˜-f«iH¼„Ü4ø©a[¸Î¤(ĞE‚ÍRå¢¥.=Ò¢šv`êª6<ı°Q9#«ÍRÈñ¨ñWivrsğA‘{ßE$n•Æ2t¿	ã²f©Üs¼cîÛkpBËÅKÁğeZÛou9üÖú,¼^‚Ó°Œu—a§G‚ü9qg³$Á[B^ö¶×²e<pˆ¢i¾uÌöYIG¶ğõŸåËf‹%ï—æWq¿©]W¸©c ëpV=ô…Úw‘1Jæ_“–&ÎñÌ‹Û3Á>7[İë±šëµpş¥oi—û•ÖíõŸÌ·&¢BŞW[¸ªÀ…¿|Ä¼gršeœ»c$4äÛ=î™_iÓFş³¼H@ÎA·åá¿1Çt\r¶D?\rÇİ±ùJÅJ\'Á•–ÜÔÇşã”Ô‚<Zl`äÑÁ’·g¦Ë„ÊÂñkpâ\"×ì¬{}>É‡òö\0ìs/İ}¾íi9a(áK—ÉğeiÀ÷TLõØîÀ-™lwŒídØ…åÀgaªÅÚ2×>Jìõ(Á;,æóÙ…¢÷Ff6öùn¾ÌYN:‡,A2BÜœ™$»Öô¶=Ñtöµ™ÆlsBl6ÛUI¾¦Š<=ßÌ¢0±£ì×±º;HsØœÛJtÍ\nI×9şˆ¾œDr™´@^ô¬QÇtÖO´M—u¼öˆğâÑo#Šá¥mœŞ{7MÈsAòÃ0ëf2*IOlQ\\áu3,áÍbe;ÏúQdl$ù‰‘oÊ°Ÿ\r‘²x±‡jŒ?²YI\räVËÉa!\\3_%Í ú+¹¶WUÖÙº¹jÈh®Z´Ø÷DË†•º¨qmô°RDÍ\Zë+{p°ÛÃ±²¨ˆø8»qÔFß*˜ŸÂ>­vÈîM*ê&Ûädã[–Ë,“Ü³¶J.:£B‹Zé\ZÛ®J*dLØğSÙ<˜Èù¶=¤‚ğÜ®¥’ï$‚©ßM¡?ib¦Š£Ç&]2Îp%ÖÕI|ìÿ\0÷QîÍÎ1¢“ï‡;§±ò¼õôº ¸ùTf,\" u]\ZÙÚò`Ñ­TçN«F¾hØ¿ct)—7´œÕ²åmİcâ€©$¼?©r¨ÜÉ^	=b\n§t†îxªzJ§IM+[Ôp99JÚ‡âyÎãcb!®áK²<°Jì œ•+ ™ÌiŠùA.²9œ”ÓY\0–•##6kä±^ÎÙm—)ÃE³¾È<¤F×Â4L’3l›à™9\r­\'«ª§s™Õ~å‰ïh¥UOs\\ m£¸S²ª²Mº–Õ{[¡Œ¹³r[éCFVÈl¨©{1îv´£GU,áqfèª©Ÿgsåª¨§š1f]¸B°ÙQ½FßÕBòÆ·;d½ÓFXçYÄêŸ	XúÖR¶¢™avá+ª-À<»\r”±Ÿw4•Nyáø2QÛ9ü…­Õ™¼Ñá¾Ö>dNÌöo!±õ	“{3kšÜÖêQ¿#víØFN-Í%uÉÏ`–apX#säd2õÊEĞßK“|,½Iï\ZaS²{G¦!a—¨|SŸöÅ™ê„*àdwVêyC­ŸuXº3oÄf™ø|J—·,±aë&6RŞ¯Ì\Z·2`7m±aÍ{1İnínâövà’?Âöİ7zl£@ê¯e‘±`òjöBÈ°[ğ¦1ĞÂüÁÅ¨Í+±9ÆûQ	³›h9Ô:ú&6XbyØßCpB{,[Ñó¯k4Q4+Í;1í¾|-a<Á3¢ÇoS*¤¢ëNÕ2yh¬ær“UÎ¥¶zÚªa¸İ¹§Rëä˜şŠ‘ÙÛÑÄÒß´eÑĞYç™^ÆiZs=oKE®vâcò{S¥£§JÑJfdt¹+Ë$8²ˆºf{$ß4–ÈÛ(æ‰³\0ÜôL«@Är^×^qdğB27}ˆç„}šlÅÈö+ ?İ¦âÖòOiğw%+‰®Ã¶SÌY>{ŸÂÕˆ£éØ5jµÛÕÿ\0¢î¢÷Gè½Ó¯è½Éú,¡wÑ{—}¹v~Kİ;è½É¿¢÷.ú/tï¢÷.ú/tï¢÷Gè½Ùú+ÙëÛİ¦ÖÏU„ÖKıÊäŞÿ\0«f\\\Zì!]Sºú»îÒ]—Š|G0Bw›¾ğ}\\ÔÆ©qZ§øv\0‘¦Û+w€zŞ!{¶ıp}t}wö]Ñô]ÑôZ¢ÓöZ~Ë,ì™	„œ~ -ÿ\0éh>‹AôUüvÚ\'lWiEøn—aÃs)Ñ?VºÛCã’cêlzgÙ\Z­ßÙšßñË>À…u‰Ò@ûNÇ3{¦€u@ówÃ]0szˆ[À¢‰ì	?…e³-‘67€×=Épd„—cH9¬!ø2ïYH×¼oì8ì¤ö‡\0øÜZrRTÎnÑ¥‚öˆª£Å®è¨^âXÉ~r;©äT¶FÔu”²{Cs”ßª£ƒ1ÈXy/e¶;6åÅINù[0\rÄÇ„ıÍCc•®?d[ÉuµòUDŸù§l‡æ¦•Ñ¼³şb&~c¶FË¼7?%%=1”HÁ|VO¤¦|»æ¶áçE «—Œ}SºBxİÙ±^Ú\'sp½Â¦=#œ3½Â«ª¯s¢`•ÄjY¢‘Â–ËˆRUPºO±ïµíQÍÒSá2æÖ€¨ŒÄÏ”ŸM¬€b6RSAWyãoáÉ<\Z‹Hß–ÉğS×Nß–È´øm{ã¬Ås1Ù{Sjã\0w¿*ßSV±ÌçrN«¥ªdë/iQåŞ¿‚54•\r™­ÖÉ•µ¯îİG •¦\'ü÷ÉIUŒù*rfÇLx´Fš	šë—_$éà¨l¡ºÙ	ÄñvˆÔC;$‘XÌ‘ï¯HÆ×^Ş|ÇdkÙÁ5Ã;†Ëá®ÃÕ\"÷Q?À>Ê1o‡ŸÔ£ÑŠë]O`óùvèTÒC<.-–Àñê†h\\Â‚¢$g¹b¥ŠXAv AEĞ²œuü“é¢6»z©±ÏÑıa•Å¬ƒE8–,à”Çê\'hË©`’™ÎBàğrÍE;)Üc`p6<Óªã„M­ÍñD¶Ÿt}ßQU¼ıTml[Ëä÷ª?ù]³4ê]\0‘İlÜª::J†F÷õŠİ2¡’øİ§lÒK<mÆ0æå3¦ pw”’xÀ`-ïsUqÈbtúÅsvªŠ)¥§›)è÷±cÜu“Kˆ£ÖÍ?¢ëœû—@ğUWFI#c™Ù±ÇB¤öšˆ„dgİÍRÕQ9§0¸_ENÈÈw³wìvÅA³SÙìqEp9¹O½e†>©áí¶q)#[­}µ›Èë¶áUÄXnìÚ«Şîªæaï÷Ue8yz«}_WxÜ,iT³Rõğ³	²†|çwU-˜zŒë*¸™<‘eIslÛá¿yTDÊ]Õòh¿yUFXn]ÉU3\rÔĞ0]áş­·‡’Ó°¹VP?œm?ŸÀ	-¯$×ZÖuòP;›/ğğ°x4«…êš;	éÀ|pÈÉnÑàº›è½ÌßEî&ú/òó}ùy¾‹ü¼ß²ÿ\0/7Ñ—›è¿ËËû/òÓıÿ\0/7Ğ/òó}÷}÷ı÷2ÑK8ùŞ]ÜÕ¶æ´ZmÌ,öe³<íæ¬Ókù¬7àÒ¼ÛLÕ÷ÏÍ\\=ÙşewçúíÂÙ-ÉËgz9Y³È?Ô¬É¤…KÕ…²MŸtõQ&WH@¸«C;Û~N[ÇÈâîwX]Q!.òÅÜÓäVøÌòñó·†¢Kÿ\0RÂ*%XcFÿ\0©E3ÚN½eW—Ìğ[°h²Tæ÷ê[îÈünk%I%ïxşŒüŠAÈÛc.ÁÇ™ÛnÃ_‚Ï°Ëî\0ˆã\\<Ó\0ùK‡Ãç³^Ã5§¿ÙeÜcÍusıT”¸|¸Gå	æú›¡dåØgâî74>Åİo$7ğ9—Òá2Zz6¶RáİD.eù…ö0¹ß¢İK˜îD-ìtïs|‚Á.}59—ËMƒvÌVğQ¶ğ9‹j·BšLZ÷VêxË\\<Ù`·‚™å¾Aa…Öäc#q#ÉnÄn.N´êëÕØÇM6ø‹¨›CO`è¯`·oiSŠXdl¶´—XšÂG¢ÜÅ‘×4Xákd±“o-—¶ŠåiÁklÕ”n™¶Ş·sÛ£¨ŞÛ½0ÌÜ8Ûˆz(ëÙ5ñ:Øl®6²yfÉİSK=FÜo=¹pbs²F7äFK,Ö|éÃŒ,ù&©ÊOŠËƒM—+M™x¬¸õRgek\'ƒ~Brëÿ\0Ÿ42BÜ»gn¨S\'»ñX)½´ã-Í¤…N`v9ÖAóœR	¢cê#¥\Zã¾åFà7„7?4*z.»w+3ÎJ¢²¥Û©È{Ão…MFkŸRçfÌM:ìcãykğTÒ1öpf¡Rˆe ½—qñTS¿9¶%’´¹Ø]%³˜wvÊ×A”ç™·xO1¿)ğ›\'˜lOktòRSS´[>®·Y T1R–¶ñ|*‚µ¢Ò¹—Ñt|¯Ì»3’‚N‡ª¸×„ñU0Ëc¾\'á¶Š\ZJ¼!¡ÿ\0+lŸMOM†\'aÁ‡UM=4lµ@Í-æ¤¦¦¦‡¬Û¼–óR:&F%‡),ÑİP@öG¾˜~ÃUö{ìŒï3a-ù•}Ed–E¯WæRô“bƒ|÷Øo;­Lª¨e+ªc~‘œœÕJE,.ŞÅâİ=66L\ruìB¡¬e4C1†ä h§…ÛÈ¾a¢Š	ÙE \n7ÑÑÁ=&ÖN8mˆ<‹ØøªI½’\'ü¤dÕVÇÓÄ|@*ˆ¥£c·MÅ¦†j(ÀˆbB™ÔQ313RÕnšùAÂÀã’3TÃr´ÿ\0Ë:ìlf&œ1:/cl³ímÈREGhbá™QOM”_…ÖìYøQôŸÏ‡{4ÛP~L†_ÿ\0rV·jçæÃYLılçsâPDrÛŸ`pX(İ=.ù·Ñ!€GÏ:¦Ò{°fÓ{	¡¿ü*8*èÛ#¢îºê\'š(÷‘|×F¦kjÍ‰HÙ˜ÙãŸ7µËuOÑ±Ã›ÎÁ+áŞ[å½“%›£ÚŞOQŞˆ0ÅùüiMÃ¼Ócja9µ{Pè¿·9÷²_â$âçü/k‹¢şØ››¹\ná@üc>úß6²S«±lk¥isd¢“Ù¤k£Ë½à¡ˆÒÊ74âğQÒŠy[¹aÄ£¬u<í™Ò,lŸÒ3Gq&E¡GSÑ°JÙZü_hr^ÙQM8”÷šİ\nulxc;g’öˆc²›kk\'—GöaßE$­=AÕg Tx[j—·óØÇS‚^I”A¶|––ksOèîÆ\'‡7ÁZ…Ó—Ä m[¥l3…véæ†ğØxØ(a‰ò™)Û…½Uª’VË0Ø5^×jöºz‰Û|÷!¹)\'µ±¸œ¶EIY$‘ºMºœ:I~×«İğSŞINó«İğS¾I$8†ÕRÊ÷ÉbÜ-³TÔrc4ò‡[4}‘òºCùrÙîÌ4£UM3ÌÅØ­‡$\'¨‘ñ?B0¦G\0\"(›fğŸ>ÇõR3œ¯{l¼>¼m°(G|“cfeÇ’‚Œã:Ş¿x.T²ŸÌvX§zñ…–[q4ÚË«% å›¾àïšÌµ²¾ÍäÒ9çÌì1Ó`³Ì#,ÎÄçfOcŸÁÜx=òWLi®ÇŒ¿« ³YšÓe¸2ğ\\×ø¥K>Î#Ô¿âø3Á#ÏƒIR8Z¯°Ÿ>Á¾@-~N×_¸šo¨à¿ÙJãâmû|M¯·[,Õöx«¶Üöj°‹ìÍdoú,ñB·²Œ0´õŸşÉ”ğ6ÌnCáçwäRyä³áË€+y[€DòÌ«M4M¿ÌJÃ,ñ~;ä˜ç½¯cô{Pj†@Ã¡yQ™daŠNì9!4•Qt±B«Ú¢->i›ê¨¡tÖ¼£O8Ìg—Š2—F3.%\Zºi¢¨‰½ì^ÑÑ|Óæ§¨Šmßy­r¿ŞÙ®Ë-6–óX¯ª¥$é0ø\\ÊÈvyg}™l³¿…‹š¾ªÆù««Ùzù¦Åpµ¹n<Çls×l¶ñW.ØO1Ø4y£~\0wT‘òb¡‹õTb_Æ©]I‹²	°Ì,ç8`BëËNá¯%\rOØÓÜùø«»¡½¢Àa›,°nlÛaºÿ\0…³úà*©¦‹ˆUä:Ÿìª?¡\"îïY«_€ËŠüZü8#°-Y„Ç~´ñgğ¹ÿ\0½¹ì¹*ø­urVBÿ\0¢Ã¯è¬.J½ş¡Xúb—š°\0]\\ü=öÍÍA¶×5tN¹vó)Ş»n„Ğ›8y&‰g¾~è[¹ê1Ÿt#µ7Œ‹X´-Ì5`ğ\"ë{S1yóEÔÓ`ºÄs¾krÊ¾¨æĞQš¢R÷Ÿ±RÍ†ëEEÇ+Yna©³G†§\nzŒ8ÏUª\\5ÿ\0¿—¶k÷g¡ìç°€£â`=¾œY\r/¶ûlÑ{y+,\\öİ¾3oR°Şèxy]dHò!f4òV,¿Â¶Q³›ÔlòØûv¿4~Ü6û³õì=UÑ\nÜãm8úË’¶«0°€³Vmîy\"l@,@h³,Ğ\ZóD{ó\nÖ·è®|U‰!\\}UÁôø˜ê£e­ÕW^½€Õ\\öÚqh³ìóM¹«piñ®€+$. ¿€·Áe¶ë.ŞÊÍ%u–FŞ\nö¹>K«è­â€9Ù_R|•°_Ğ­-ú,¼Yşˆ7?U„ı‰Ğ+;ÄÄ/£Voa°_Ÿ`HğiÙ—\\WÛnÖ»uàÓ±¿Âë¶ü/€Z&+‘ÚeØØ\rVKÓe¶[EpnJÏ/„f­k­,¬r5¢ÊÍjÒËªˆÅu÷VG%ãñ!§Á-€vhß‚ÈmÓµÓîW·˜ìUÓæR³“¯ğy¬‚¸ICê¬¬Q Ù\\•w<W€]_D×]YXl±Í_gÃ_„ƒá„\' ˜<»	Ì[†á¤úc•¼¸5Yš/ntŠÚİ>x!ÄÈóv|YìÍg°E%Î6nj¡İ¼x_‹/¹ˆæ8­°4\nK9LËêWío¶Û/°â¯{lÍb&Öæ¹x«²Ìi’Ìiä±Ö<Öadº»søùO\'ÿ\0”.š.ÂL¹p˜ƒº…JÙ|!¾H¼¼1ÍÏ(¿£zF9ÜÍ[dçŠ¶±íùNŠ–ˆÔ4w4§\"Óg~‰ÑSô®\'³¼Š£~Í…Tuu”õ+…¡—|`\'T¶½­Áßn¡•¾ï›5\nYM[[M³YˆPV\n˜‡«„„Èå•Ïæù”’EYN\r¾à56«¤k[JÇ÷:¸‰PG„Ì¨÷oÑ•hª¹ƒ/ª¨–y¡wRÙÿ\0ËóQEOÒğ›é \Z)kºA®sš>ÕÂÁWÒ±FÂ9f˜7­’9EØñâ£=!ÒQÓÉ/u˜q!zæ¾SòÛ.ŸÁg¶üöTZ|bã°ìtÙem›4½Ğeš¸ıÕÿ\0Erë\rÁ½·ŠÍögñ¶Ûªß™È‘Í\0½`tÍÜ\"ë|ªKÁ ç…VPÒ»xñÈf¤¨™®dmiÅqeS3FN¹ÓÍr°rª hç—“ĞtMnñß½P>ñ*V67¾ú*á€æÂ2HBófÍÔr–™™KTòô\'\nH\"©‘¯ëDà¥İÊxŞ\"75Sò5I8‚C­eK5/GCYfÜVTtÎ§m!k¾ËªZŸGÒ»¨güöÒFqË=U8–	[wZƒƒ]bÀ‚§poü®K£N0Çc—¢§ueTÒ6!Ö½_DÌt‹,°ŒÖæ¦<×?¹Â#†ÛõDZè¨óï3‹.ÃU¢ÍY]fªä^êç ­mVCE`<V&öVÍ\\åeŠöº¹WûŠêWßÀ”P²w`Êî¿Öîš¥Ñ%ŸHËû#QCšó™<Öî¦©Å¼¬·PVJÖë`S¤ª@]Şë)ŒõÂ:ÂÛ1ò•¾¯éø¤c~F»*Z¦7{®…tÂß™ae|ÀNFBâçïtS3@¶ec¥ñ“È¬Ur<rAí6#5¹š¶RÃáu‚š²FWB¢Z‰Lî»‹u%|¥¼®·”Óº7²+~êÙ±épäúévİÈ	«%~qw&2ºªiaÄ1´»Áoº?§éâ§ÊÌÇ†Ê–\ZüN¨·’ßTÊdqçñ\Zvã4GôOÏM”ŞYpiÚçöiÑgãŠÚY¯ŠÄBÀ­–AfuV9®{2ËîI<\ZT²y,ÖIçÏ°Ì•}¹l×fk.V{3YvZün}¶h®ë·>$ëì§<¤ííeª¶«¬l°³Ãeš¬Óæ‡‰&ë3lÖC$+\"¹ıÄQÛ1ü…HA²×a>}„#òßm¶\\+í×àuø\\ş^;£~ÁÍ*ÈXèğP<û];­v_’°k?Ùe••ÇŠÂN«D¸]X¬ÖŸqÁ)Dìº¿j!ùœVÙ®İx4Û®Í{¶__ºæ8n6¸d.hÌNæÆñæx2YíÌ[×eÖjÜ‘V>\nü—ğ³]o`®½~å>e¡0fVvËÍyv0~AÃ¯Ï›sà·Çgğ>]ƒ¿«aP8Ÿ¸yö7Us••š³\Z,-ñVEsã’¹õW\"ÖYê±}Èx#DĞ5Ïc•û\0­È\0µÛ¯a…€•»71ÚÙÍ·‘öZwI‡NŠFZlGö\ZÆR“mñ\\peÁíÛ›Dït\0Ìœ“g©ŠÍq¶NÙê\"Ã½f{}¼àİ~ö{D,°.æë&Ç>ˆ\\YÜQTË„6lÛÃ_¿„´g`ìöãm…¤^öEíÄ7½–ˆ¾š<“â|ÌŠFjÇw•–|L?§aê¬³ñ\nr¿óÅ§k’¸V%fæ¯­–jÄ,+2¬GÜ¤pBÎeD/ Y§öÍ;> j™[ÒoŸ\'»‰HÚÎ¥ŠÍ¸³U©b½¼IÈ&™˜Ü.È8ÇîÆmÕrd“µ˜\\m“”“TK~Îòeú¢úWÓ—Â|_’•ÒI•½\\İo¢{Fí¸M®çkèŸFdŒØârÿ\0v!¶‡šöYÒ‹©¾ªG	 /Œ]Ñ‡u•ÂSÇwú©kbtQ´âlRxù©{Ä½×96éÕqTÓÔFÓgî¢evú)\"q·PŞÊ\n‡É£¨iELêÈù¸šâQ†IâkE†ğœ®|é% –ø„\"2Çşg›B®9ZÂç_½\"¨dòU?tÜô)µb®)˜]‡¨…UDì¦ˆ›8w½³Èğì¯p„o±4üî_k_bÃ}áÔ“>fC]é]¢öÖWE4D€Ì-ï\'ÆÇµ›ù.ç¸äÖ…ÑÔ6xfÑá¶T4ÓÎÚx˜Ë¹îüGÁ\n\nŠÖ»»&hPUô, a{‡?!U8%†07B>÷ë±‘5â6Í.ñï?+B‚xjw±Î2%¶L›¥+}Ÿ{›‰Ê:\"íãf¶yì´Âå¸bj¨•®tÔÌ»ú½OE¢’¦\n’g…¸Ì)%ÜN</i\ngO(mKzÙgú(©¥©˜Å‚ùŒEª*RéZø£ê\0ßå1²K»ï2Èò>P©êi&{›?â$Cör[½àŸJóöÕ:K)ëÁ“ì£ÍULÜŞY„\\óSÏD|¬â:¤©\'¦t»øsxrÃ—xZ|ûa_Å0càóØéÁuWVj$x+šÅmVº¬‚ıÏ9S[É£fcË°Œsr}¹ğ0N@û1š±ˆÜZ5 d©hé‰ş³ì¡¥›)%}ìy*n§ÊYŸ’¤¢\rqÃö6æ¨º:]ÒuÈUW=—|cE¼T•UYnA.¸Rô„—SµÅƒ’3TÆE¯3®İ-\'ºk‰ÀU%U²nñ·o‚M)lú¥áYOW¾•û¼VğSÑöš»03È¯²êºypÈB©}FF¯«OŠª¢h¹Ş‚Õ%#şÎ–`Ç?Ğu”B!öX3úZ˜Ëı+~^*YçŒ·|q3útPAnûÀU-ÍŠ˜âT³æf\'ú*:V3ì fòWeR¶Œ–©ÑÄ_ôÂ×¶:Ş\n?ÀF™‡ì©òıWFRQBK\\1>Ã+ùªZja(\Z^÷ø*.‹¦§‘İ[¿~eÑıÃ‹ua%¿M§l/Gnµº¾e0°ı”?şª3S‘’]æ¿(U=!3pÆeÂÛœİé²¢\"ÊÑµÏT…øE4‘æ~¨n£q‰Íh·T!8™JÍ}†¤·y#^ö‹éu(4ÑPÓŒğâÎOıì’\rwĞ8)ú\Z·1ŒR~kæ©é¡÷ÆzçsFöFŒ7ùB¾g¶8Å„w9½Qôh6´aÎTîŞ42(ÚÆ¶ù»eU4¦Í»\\Q“F<9ŒôQĞB~Î˜[ıJY³¦“\n#~ÖbysÜ|”ÿ\0Ôˆ…FBnØs›¸}ØFyìŒù§°ø;³×=—WWXt\\ø£aª:d®²ÎË/c¶k÷C\Z<ˆÖÛæ{Ç7\'“Ïe¶biµ§¨¤Š ºèDQ’6Ù6	© ›wÜs‚öª‚ïl¬—\0pÒÃ$ğÆ4x4j›na½dêh7yñ©éÁÚ;î:§²œ0ãæ«Cñ½ıüCUí8™¶=TêÍíÜìÆKu3Ãc×†ÇSÓ½¸Ny‹ÙKj=ñ»{ÈÃ1œğ¹·[ê©±‘RAO1ceÉÖO¢R\"{®à’–L.\"Ú/h§—È¶‰ÓÔHdyñ(K³šnAµUÍ.	*e/-ä›MKÖh\nöfVÈ2XœI\'šBò×\n/Ün½‘µR´ÃtÊwÎó}ÆßEon—?4&B>`Q‰õ²¹§À¹o ‘Ìxño÷®2^øïšÇQ;ŞGâvÌrÈç;K’¨™Ï¶Y•¸2ˆôÃ‰cŠG1ÃÄ-î3÷Åuöó9öæí˜šmèQÂmt\rˆXŞnNw%^G9Ş¥\\æ†\"M²Ì­6\\sâ®šÙ‰âëY<tVğÊü·¯ğK=¶Z£äx/²Û#w,#Ä&NS3úVgnAkÅ¦ÍV^*ú­}U€Wµ–¯{Ù¬¾æ#‚ÜƒSÜ<J	ƒÏƒ^Å¼Q6âÏ±ÏáïÁ‡Ëü9mÍgà¯È§´x³f]öä×š°VÊ¿šÙºŞGƒÀú\'Í¦Á§—»tÙ~\rx°M˜uëpÚÿ\0¾ÌøêˆL{Áv_ÅkÅªaÃ¼n{rW†GÛ.«n·OÁçå-Ín¢Œ—Ÿ”ĞtôòG|ºÍÙ‘â¸Êä¨¦tñHÙtÀxw4ìÄóátUşaÚ<y_°\'‘@#ê˜Ían—¢¹$«{¬V²\nË0®>ë*W¸æù `ä;ëè×/u¾u¥-üEc©ey6’Œ4Ûx%c§¤‘ÀxÙ$Œ‰Xl·ÒQH®ŠZ‰c”<6ñ0|ÈÁ;pÈ5KC³Ğ¨!‹£©[,ì»º½ÕU-U26ã»†iõ”ôQFÎM!£$jc¥êóu®…Em;§Ö)ûğÀc8cİ²2ÓàãÍıkí‚š¥©|‡6(©56îÍŞ¸Æ¦} 2ÿ\0Ò\ZÑâS*ÌĞÍ†ñ›¦ÔSBéÛë[Ñ:¢²H`œÿ\0”)Y_HqÜ;/D(+úB\"è›“ÜlÔb’x[·Ú“•Ï‚öCŞm‡×³‘€TwElV[¨êY>]æ‚Ô6^$]}KªdX×!+§‡½nÌŠš›\r1âµüSºRµ÷ÁfµÎ:¼©C\\X#“x÷òê°C‰ÁÎ´L¿‚öt™5-ïÙ½_54Ïh Ä\\ü9á\n7A])k×¼y…ä˜>(®Ë7[óQÕtƒäh˜Ú(ãgy£O˜šZzìËUIHT9¬dmhÌŸ\rdÒ€ì\"\"ß>iıSŒ{Sãöq Œx¼#O¾xBÿ\0\rÒŒ±ƒÕ¸RQ¹²–—Ë;—4ê9]#¥8œ\0wqªZY$sç…Î õZ¤ª¨$SÂ:Şg’ª(ë`s¯4ÆÕSÍ!so½ñYp8sp=eŸŠ9*SÏ%’Ë²±6@4ì²µ¯eÖV_²¶ŠÎW«?º§xæòµW@xØJîL<-™’l‡G°õa‹¾*ˆ§7%ø¦ÿ\0Ò1 /a¢s£Š¬nJ)fm÷l—·Ñ×ÈúYÏY¸´º¥€NıäÇñx\"\\nNÈb>.Oş›\ZÔàr}cì=gHÏ›ZÛ*ş—×»wq´iú*‘”eNÏİIWPÛšç¾ãÄ©+_›+ÜC­–Ø\Z~Sèªd¾Aö¢ÇTé\ZÚ—Ùû±Ö>J\nJ*	\"§ÂËw5)¨fæ¶™¸y*º†·¯PñŠ6ÕEƒtİõ“ñ¸o¥Şæ>U0÷4ïş5)•o‚ûÉmOˆî©å¥l®«›ÅãªËòZìŒ#ûO¢–²­(ÿ\0ˆ9áLéYi5Q~wö´_V8*nŒ‡6Ó<K/õ*‡Æ~ÖºÍôh\nrÎø€àRÔÎ-TèoÖõO«£-{¢v±§¢\"=ÌµLÌK•Q]&áŒ5¬Ä{şŠ’NŒ¡ŠO±hlÇäR6z†Í%úÎ¾È!¶¯{ML{ºX­×qùB’©‡ lÏÑ;¥Üm,°68Ûù¥g±®?òÚ\\¤•ÆÛÌxnœj%iªx8\n™òLÇî¢.uÍÉWtœ®ëˆÉúªç™ZÙ‘.?º¨¤£š\'ÊÙ.ÜcP¢oHt“¯ulğ4ÕIM‡ì³Ï‡^¸ı(ù\"oª¥:Ùíşx³5Û–Ï]™ee„­ıW¢ÄV«?Ub~ê.äï?„ìƒáØJ\'«}Q¯”i„§ÖĞ—³¿Xİ\Zº¸¥–SÉËüBšÂù¸8§ÕÑtaOùŞíÿ\0â4Ó¿ïf™IKO¸§iÅ†÷*<İülÂ×¸ß\n/~d›š3g4­ìı\r“ş2Vö Û³MC£M\rÇ‰Äx¯b†3cpóà¤…‘F÷HìXŞT³½­˜Ï“ñ&ïƒXÆdÈØ:­Ûjjz{ŸÍë#;£‰„ÿ\0Óm‚4ñÜÃÛÙ\nçÏyİä‰æ65İì\r¶/Têzi\0iÏ6èŸW·–Ag‹£Z\'¼§ç!{La“Óš}U,Ñ?¤Ëótº´~U+?ÿ\0E$/uú÷ı6ïieÀâ-’5QÔ<Jí]uªwIngh––¼x‚‹äq$æI+ó>B?[Ø$s<AFoh—xrÆš&	äeõÂå¼{‰qÎ÷_m<·âuÖå•”¶j±1Ö#‘[·Èâ)•5U™F°´-ô†Öî·ğÏn bêQÑtF)&sÜåp±åi¶ãÕö¸y\'zlˆßI{;¬–—Zk³«š¹ËÁz«…ªõWä®>é•ÇÁ¥NîmÎ×vŸ ;KlË‚ã³Ë†á_´Óâ(úìÏˆ·ôWæˆ½¬ä×·Ä_‚ü:­6Ø+4è²\Zù­V^^ëº¬ÕÚ>å<ŸÈT¤\\İ—N>}„¦ú;{™ğgÁ{~Ü7áÍe·uK	‘ü‚>ÍLã„Øæò°<ZÙl´q¹Öü-ºÀğZyÂ&\0æÜFØ½ˆµ¶:½²Ã£³ìoÏ´x\'ÛŸ`áùòNj§xñ¼9qf.¹-6dŠ½ÊçeÕW9ì·Ü¤ğK‘ËW«Dùö<ßÂ\"…·\',gJt	Nx/eÔÕ;ØæÒãeÕÿ\0„Æ¾™“âÊÎ(AO…­Àß4T[¢Á×y¹cdn rìØç[“Q|q¸™ pÁO+Àñk	La§”÷zº¡£˜HtfÖê¢FãŸX-í-+äÂ\n£‚¯Ş¼âvVÓh©’‘â3Í2Yé\\Í›i“TÓá6ïx¦OS»ó(«d`İKëm«•ğD[NÌX‹z×Uu5ĞDrF·\nİS2öÔ“OªÏ‰­¾&¿öRôl-ÂÃŒ_­eUZí!ˆ»>jIß+\"ùd9\\¨h™S¬{q—³Á¨ÒtHlDm“sr¥Œ0ºV¹Ã«“!ªéa¨vbOèúš¦Ã+M»¸±-Ìõ­ˆ’ámÖ}¼W±ÔTìü7Ã|YÙb´‰`hŒC‡l»É›&—¬óøB¥4R:_kî]¶RQšÇ\Z–6î³zI==KD#˜Z¤¯ßøßm2QÕRÕ80»ä\Z4(+(§{Ù)ù‚e_IÔ=›Şã:Êïä4³¶í8zÉ”¯Ş‰!‹©a—ê¢–¸Ëzwzú£/»r×`‚îq¶J:JÇÊù`p«nGÔïsöxOò½š¢Iù	,h=Öù©!a¸kˆÏ‚à#Ø;ú•‡4Z|U9äË}6ç’·\rïÁ®ªÎ«kåªÕ_’ºÍ^Û4û¢Àêö¨Ç7—eŸ‹øg­p¹—Fwºîy¹ÍGDtqùèÕşCKiÃ·}ÜÊ’\nXã\r6ÅÕÓ$i(áa»¾ÕöÌ•S#£‰Îr|‘x÷j>U µâaÏôOšµñÁLÛˆi›Şrª’Gà€g`9ª©cŒGGNÎ£m¯ª$‹_5’Š”èNvQôoEı<Ã„ZİéÜá»\"Ø¨è(üKÃXé<@PP1×Â\ZÏÔ¨ú¢Şè¢…ÍgWŸ‰+pq]vÅ+úÓLo/ÿ\0¼;äyuUEÜÒï?™PR=ÅÒ;íŞ«)œnap{UIÑ»¡n9¨í53@$[	ñ\nÉµš7a£«u§=zÉlÿ\0ı&R†¸ËS&\'°\r~ê2_Y%²(S˜#/’ªL\0à½—¤(Üi+?/Š–•’ß][£Nè$.Å•†ªš\ZÖa$cÂO’{È#u>\'¸\0U5ã8âcÇ–J§¤^	İÆKğqT‹=®2??ÕO6¸¤\'mFÔÆÂ÷Ædf#ÕÄ£I²ÄbË«§‚©e5i!ÌÈòsê·G»+ÕEƒw—o¥ÿ\0Ò£ i¶(ñ½R„GYÜêâ©]G8ŒbÇå\nƒ£#~!O…®*¢ºbØã¹ïªy:2š\'Ş+o¿\n{%˜JàzÎd”Ù¡éõSu`Şc¿‚}XîFÓoáOPìÎœÇLOzÜø}GªüÑ(^áF9b¿Gf¶Y-5Ùe—†k=Îjÿ\0¢Ë-–Y+Ù\\qåñ„ğFÑã\"‰‹TOašg›Ïéê²@·¯ébü\rr‘ÌnêÕj’®:¿k™×,kGòªºR¶L7ÕçÍ>ZJ¯l©uÖÑTšú‚6¹fTó¸am™~²|‘Æèàspâ9ŸêRIå¬šOÆl\ZŸA	&i]×ËÁ>–§xç8Ü°òt`f#İS0%£’ŞQÓH¯Å4ïz\\tlQ;N³Üy¯ñIã%¦LVñQÕÁG…‘¿}ç¯h¡ -tiŞ#’ÿ\0‡¦İ0»}ç;Ïm;[¶Ó3\0ÍDL805¸®½––†İQ¼À18€¥’­ŸñîOŸ4®»nNÀël×±º”D;½^ê}›ĞŸ–A{/e‡v@Í¤êuó\'K­ÖÍd¡±Œ²k/ğøeÃ¦y¯gV–Œ›vŞËÚ_+Œ¤ßóºİûGú°‹¯i38Ë{ãºÜMUÔ:ØZéì‚RİàÂërXij7;î©r¨®¬«‰ò9–‹®\\J¹7Ú²¹Å¢Í¹LÕJìí»´L†ª­å¤üÎÉ\Z†U²®¤‚#k{­ó(Ë)ÄçfIW–G:ÃÄ Ù¦sƒ{·+sò~åuy¦{íÍËr%xaùo—JòrÕbi·¡W¾ÛìiòÛ§>[#ğº $áÉgÁ¢µÖk2³åâ½Uœ¬M×5p6fV~*Úö•ŸõY|Q·™%BßÈ®¤>WÙŸ^eÜàæ½€ĞJAÍİ{#akùíÓ¶¾ÒúY°8‹dŒ³<¹ÇÄ•~ÒÛr<7ø[¦KUb´Z-vÇe~ADIù”­<Áá×†ÊÛ/¥•¬¬Uœ­mí²áX­5VçÁn+°|UÖ{iÚ|ŠcOƒÉ-âŞÆå~Û>ÎûtÙŸBûtã½öXíSG‰ÅÉSlÈíAõ:mc¹ ?*iäå;yµ¼6<7\näk²Ë•ï¦Ì¼UõZ¬MÙnjÊÇ²ºÏáÉácGƒ@\"{6l²Ñj‰¤ƒs²Ïs¶+¡°¼\nuDÌ¬ığ®™	ïi©¦ß[+€·S0µÃÀ„kd­bz‘™ğXl£¤k££l½Ë‹¸¨Ü*[3fÍ„6ËE¢§¨é*oh’«0ÛÛUWHÑ7uI	ùÏ?\r—ä±Xı˜Òï@®öY„1Bñ}.İVêFáàBšFâæÙb\02½¶èª$¨¡k·/sÜUKı…´²Ó·teé 2[[#%E)kC°ê£sé}á³zÁ*¡´MÎB‹‹\0‰Ïp­|¸$\'£Ûñ>G;ÕÇjç`kEï’gDÓHF*‡ƒ™ü«Ú$\Zx‰³]+µ^Ï5D±»0ßôO’¦ŠCöl=ÔÍı\\0Ë\'r\'j…Õ‘3«rÿ\0öR«\"lmî¸ñRÉ5\\h@Zø<”Ì¡›ˆ3tÄee§®eH&ÚÛDl$Ø&ÓOÒ-mS¾L9/b–¯Gİï\'¾*‹J,7xráÿ\0W¶4ò6Yr²¿š,iÖ;«ö-jÇÇe´Ù‹[/E¢²³‡ì®‹¼Wå·_¹-É­	÷ç°ç«‡c¾‘7ğ!UWÔû¸^J§dz9‰”%ÎÔİ^¯5lÒË%· »3ä§6ç›¬,‰Á){MÛÖÉŠyŒ†K=øµôT¦İà»ÁuÍ”U¥†™çWq•=U%;¢tñr‚zÚjš§ºÂlm5?FÄÙdf,wî+í‰ôóîª¡m°•FÕ¹ÛÖõ?¥©½GA|’7œSa¦§ˆ‰0õŞ­Ê}0BZ\ZmÏ5K,PÀ9îàêáôU1Eö¬=ÖYVÃ(½ÉÁqâe;ÅßU7ÙFôvÎZ4¥¸Ï‚¤¥9H¾}‡Ì©*¦ûZ·7©ˆxŸ™UtÙ’¨õb¸ê´ş%ş%q«¨/Ç#ï“|“ú1±°1îë8kÁQQWŒG;÷}NòuEÀb‰şñî=g*N‹¤¸tÍŞIm\\åCA3®àÌoÍRµ‡ş\"qpy_ÅUWÌç?s7%c}úÙçÁ_Sÿ\0Pî•¯¶˜ú­UXÎ£è.—§pÅœ.:‹ª söF<iÉROQšBàOÍlÔ“L	uôî„ÇÉ\r–~®Z€îCÕ\nŠšœçLüYùd¤ÇNçnåÉ1Ô·•˜ğ—l!ş?²}ePÂÖÈì7ùŠd•\rÃÏ‘·*jÙY…†Rø5FÜû\0y9Bˆş(ì­~<—/]–²È¬Íÿ\0Eªæ¿e{¡ç–jÁ[’çuoöZi³Ó‹^.ªóñ{ÙÍRÌ­ÍçØ°rcG@C£a=çïe^ß¶t[¸ÿ\0UCÅËØ˜~Î›ÿ\0ÉLb\0>l±8ècéÈ’Kab§¥v>G½=ÔÇ>Fâ\ZÈ¼póTı†î‹ÿ\0R§\'³n¢îyQ©¢¨ª;H3b{ë1o‰ëb\nÇd~ÜY»üÚ/nu}4tÂMåÃ¼9/lqÃ·mqºJVWÄö—ÇfîqºöÙE€»í}-¢poGM=Ev(àŠÂwŠmDÎİÅÖ—NavîŠ8^ÖåŞ\'ÅC0f\ZzrÑ”/ñF9ÕXGU¾i¯„½î~r‘£À úl[¨Ø\ZË…\'Etõ¬sñbbm?FÒáks2HzÎP³£asp‹=ÇÅh´C(tlt3†³6õşešO`i«˜[)=ßDØOg–É!ÌºÊ+C»l,ÀÑu+\0š9…œÒP{ÚÖ5‚ÌcFMÚ[×²¤—\n½¶jƒÚmctÎ•…ÍdÉÙã‹šı‘ X<·¬Q	»ŸŞÄ/tÊ©%ûF¦]Õ\rÛ®ĞHW:_µow-–Cw8Ü¯dŠ{4i–hÇÙóFj‡—8óZllÑ;›¡2wÔ¸º>êö³1Şšêõ[Ï†A}3Zñú+[DB¥<ú¼ìÍdV¶Y«g\rjá[šä¬®<V¬…¬¯dnFêàê®\nñ%cÎ\\zíÏá,8%wıßá\\z¡’gŸ`¼†İÌp<´ó^ò^uq)¦yœü9•\'á<Á[Ç¸’sÌ­ÁøË|—ØLö_‘[ÆHàãó·†G¬eÙœõO}l‡›…²k…{[ú|Éğµ½g\'Õ6<-97‰ªn(»Ôñô4‰*œ÷èòVsìmn,¸mÁ¢Ïn½û]H.ÁÙ\"/dE•3¯k?ıöÛeöŞ÷¿[-ª½®êø+Z÷Vµ•¯²ÊÚø.WÙ¢¹W²×²Íd~\"I‰zËÁeıVœaË%~Û.×^Ã!³^¶_à2ZqçÃ¢xæŞ,öDáä‰æ£\'å‘\\ñæ/·=™”A¿%ŠÅešÈéà­kz¬z¬³Ù×V*Á+sY{ğê´W&Ë#ñWä§äyØ`òì\Z<Óÿ\0«°Ïn{,„q‹—eª4õ1ápÏn( •Ş+±¹§Ì-{tZ-ó(&Ã®mYåğ¶ìï¶üzp‘¥òì5E¾KDûx9sì¯mvè­Íkk+æ?Usš¸ÉXçà®3YÓeìµW²Ë5ä½EZùí±Ídrà×á¤yğiSQ+ P›ØF?2“×n«%jÖÊûèÆ•5-;#°ÄlöĞó&•O%#ct¦ÿ\0šÈAO{Ï$èªÆíç*4½€›b\"ä¯b¦êÄlóo•{\rF6uKİ›œ¡¡»æŞÀ(ëïi†ÿ\0—eõ²§”:ÒÊë-Ñª	ëGüCÔ¸Í2¢¶¶*FËîÃ…Ë”MYt¾Y4sQ¾*ğbsq>L6°O·2qO?rŒÔufgJâ]Õµ©Ÿ{‡º<Óê*\'q… —çÕUCÜsîÕ’Ï°±YpçÁ®Ì»[+ñ5n<Ñ\néí*ó`<6WÛ–ËX’±>{-k+Úë_¢½ŠÌj¬²WµÕ¯å¢æ´µ•î¬Ô™ı–—ôW\nú-K%™YìÓá§?‘Ê[xØ+l·%cÇõó§[†0F†êcø¢Š!âå¹iÊ­å3Ã\\r½•EA7–cÖ>¨H{õœºK¤¢7ğg \n8Æv7w¢1Å› ´Øİ‘ª“/Dæ›$ÈÛâë((½Š)‹#¿Ú\r´âmû£K)Xáh©İ‡É­Wdgv fJ.‰ˆõ\"h/ÍWÕ0]Ï¶Ø&2¢<%ÍÄ+|ş¥8ï:ßÂöèÉièÛ›²Íşen©Ã=QcÅˆ6à×µÏ‚Üyv\Zö@§z«ñş«Ñ<Ní\r–ÙešÕsX‡ìk5’±6Z®væµ²°?UÊü‚±ğWğÑ]¥i»9¬Bÿ\0ªÍz«åúì¸ş«<¯æ¼U•‚ÿ\0Ò½–‹\\ıUÁY	İÍ¶NÜÈk±İ„^9¢t¹¾Û-&ÑÊéN¯/Fjh7AÙÛÖöJGÉ7âÅk-üÛ¿Çw^êJFQŞY?æM6úàGS2’w°êäö>-änÕ©ğô]txûÏhë/o­;ªFf\\O{È&E0Æ:‘3ğµAÑÔîã®ñ¥Öÿ\0Ùã•ÃL~i¡i3GY6¢-[i„a`k¯„\r}S*åÂwY± uB}Læï~y`¥p\0ój3Ï!{Ï‰B\nŒ,n™b’­Å§[M,˜16ÆÊû4áÓ†ı®}½ø‡’}¿hßÂ|”·ïØ_øW9¬ößEvE ßÇ5}n¬UŸÖKOªÉbİu\r®¬sÙbs.ğV²ÏùYøy¬¶ØÙem—µş\nüÜÅÿ\0í°“âŸëØGotO\rï¶Ë.ÇÈâ€•—]¦œwís‰Ï±(êƒOÊç,Âµ¸n6ä­ªÌ«µ×i\Zz¬Çì¬rıgÉjé³-kUÕÍYÁi²Ë=šü<rYDÁâ\\¯}ÑpÊæüy¦‘áuŸ¶ßƒ3ØgÁm–5áÌ++Ûf‡è¬ãèP¿ûW¹wÑ{—ıq;è½Ù^í{¿İiû­÷k7û‚ïF?Ôz?î^ò/î^ö/î_æ\"ú¯ó/ó¯óı\nÿ\00Ï¡^ı¿Ehÿ\0Åg?ş+ßÿ\0à½ñşÕïœÒ½óÿ\0µ{×ı}ÿ\0Eÿ\01u/úğfæĞx³WY¬WÕ0§ƒá\'ªË=™+%Ïf«\"³=¨`U•ŠÏ5uÿ\0¥˜·¢åú/ı…•ŠÏøY®^‹%™Z«é³šÓê~£ÁNÑââTÚ±]\\”Mûy1ßÇ\r‹¬¿Ìş•HşÕïÿ\0eş`j¸¨·úU·÷ÿ\0JÎ¢ßéYOÿ\0ŠÎcı«9Ïö¯~ÿ\0í^úCş•ß”şŠØ¥_óOê´—û–M“û—»yıWº?Ü½Éşåî?uş\\õÕ¥gêJÊ5î#ú/qÿ\0J¶ê/ì^î/í]Øÿ\0µhßÑ«_Ù{ÅïH^ıßUïŸıËŞ»ê½ã¾«¾~«7ª×f¼Vø]v4ùpê¯°%o%¿Šœœa}–>\në=¹+ãny.jÀ+ÙrğW?Ê°ÎêíÉu‰ú,Í×¢¾+/ş–z.ª±_úW#öY®ğYŸ(çÁOäJŒ_F\r„Ÿ\r¶â“Ê7+™ñe²İ»síl­Á†¿»sÙ–Æv\r*ç’aüÊvó\rì´Z«®EìˆU}—Z]\\”Oò¹z/ır5W°V!b&×Z­oú+ÿ\0%fè²5_¢ÿ\0Ú¹jÉ\\Ÿ¢ºËá˜Ãá\ZËÁ£øWGÓ±˜ÿ\0Ú<ğçØf8³Y†Ëe»ğçÁŸœ\Z&~½ƒ¼—¡OëËö{3ËeˆÓÉ_eŠ¶Û·øWÂ­¢¸7ô\\•ŠÌè®\r•­Óg;¬–«š×gT+û«|à->\rhOmôÉjŸı=C¹Gşû3ìmØçÅÛñeØëğZö¥ş#Å®Áê‚>¨yÄv[‹!¦ÍUœ?u‘W!]¾!eä³Yd¹«[fU­˜Y²ËõZÙZÅX¬–j×²æ³fn½vh­¯ê¯—·\Z8òº$Æ¨ùûíÍe¶Û4ÙnÚİ–ce¶eÅf4›r0ÅG&İap·†{\Zùa{Cû·n»2Z!L.s²\0ÓUzf´Ù}åƒâ*H$ÉÌu“\"k€Äm™Q™Çosêö‡Íz;°¨]ªaø˜üxòÙašº½ï~EgÅ‘VÙ‘Y«İ\\ÿ\0+<Õï{«ìä²Íx¬òWÕkª¶«[z®u)?õOì‰>%Y©iØL|ÀYì×`‚Üy”\"¨-$‹äUû<dá9ìöÂËE{\\”ârÍ6´U²LFÖhOélØ[rÖ·a«İ‘òaÍIÏ‹~›[TÆ8Ï ¢¦3Iºp»‰ÕS>‘Ò;~zÇ`‰‚åÆÁ6‚æi,²ùŠTt„1Ì~Aš4µ¬<|“&é*áM¼î°·4É‚XŸ“^ï™gÏ5-+_‹µL†İÎ6\n)+œ÷;¯¦ÊV9ƒÚª>ĞMTõL{åÌ°7E¹%ç,6Í:¢Ÿ%·îø­ÛGXºÙ7°–ÀìÜªGı×!rì¬;k lmnM±[ØÃZÓİ/6º4õ-³‡#±•FHéÃ»¸İš¡ºîºÔGİÇâ™M ¹—İ‘ó-Ã«â6¾é{bò‚GÑDóÒqºfœãTøÕ×F»ò²e_IÕ„¹±­¦×PTo 9+›\\ı×Í’’·¢æî{íqSWÖ¹Û¨Í°…%{#›rpÅ¢8t&Èƒø¸uÛ~KÑ]Q<øºßQÅ–Û^Öáæ´È,•í®Í4Ù}–y,É+[~ªúİfl½‹ÿ\0¥r¯ªÖŞ…dAW<Ö¶Yx,ÿ\0sğÒËo™åX€}Œ®/nÍ6°«“%š²8†Âú•bpèåî¼ä¢µÇcs5»Éòºh¦ÃpÌ¿uhúJ\"ç¿KwSQÒQˆwÃü!QÛØœl£!\\a–lÚÀßå‚f›gÊJg˜İl•ôš·/ô¦BÍ\\l è˜=İ3zßÔS*z^¯u¼î1º¨YJâè±‹8©ã–]ÛKºÏ>\nSÑõ™#*öù¤¦’i<>€©)op3o¢e4YìFg•¦ÅäüÊ;xDº2!&îû›d\'GR´¿ÆPT%P>Ê¸¿Uş\"@2cÆ½¨ågï$ä‰­ˆ=±ú¢Óò1 &½ùá}…ÿ\0©S‹óşUÿ\0û\'t« /š\\ nÿ\0©P““ß’Šİ&ïşWü§aşJ¢)m$İão%]Ó­8Ğ”øê\'{Æ«jËnêv’Õš¡Ä;Dù*¨4pÙî8œP•ñJëèÕÑò8ÜŸ?%KM<æxYÔ¿ŠÜôÅPoS«\'0¢4Õûâdh-·‚1pÆÇÕ]ï+~Ê™•ĞÊ@©„ÙQRts\\×Dë5Î)‚jÉe¬\'–W²®ZâLuÄ¶*S]|\\òV ¦s%¾¤ªoÙPÕEœA\n«–2p]JĞ/…÷Èy®„ânYy*¸æˆËıÕ³O¤ è™bˆæòB\ZH]‡æ-OŸ[‹;Á¢’ş>6ek*?)GóØØğ\\+İrôV\"Ë0µÕ]e²ëK««ÿ\02¬VeYXlÍ–]eqû+“u’¾«’¸øW¼|¡=÷ù\\v50~½‰ó—ı¸bş¤ÖßHÂ¡J_ÅNIùSñ\\¨Àü\n&H:ïpÂªeJAi†„))é_#œìòlÓ)ŞëuîlyEÙ±MÒ³_wLÛê(M1ï¾îPÊÖ“e´T¬sH±0§Â/w_ ªÏäO¶\">I °¶\'O4[dï0†y¡\rhÂâÌ³EÌ§yi—+edÉ\"ä{xªVM0°Í—u{]\'^•Ùåò¨:9¦ÒÔ}´Ê:f9­2\\”:;¢ŸqŸz÷´ŠY_óÇÕ<“+è%ahÄT\rMy0u@Qô„7gjSë£;ÆÌîëFa2Bë4X^%O,CíŞm%šª*Ã?â%û67Åg¿UMMSQ¸taUttï–^ëËš·‘Vã.¹{rR:\Z†ÉíëİÃ$* ©¹ğë÷Q¨¤®i2:ï»ÖG†ùæS(„şäu5ÕS¶­äI0õ1f„Â¡­kFõN‹üæœ˜™ş#úFbÀ½–ho‡¹f÷S)+˜êÍ.ÅÔ±º\rÑ¸ÂÆ¯hšÓ~<!GYcãålıV6Qaü×@ËFA÷ÏøX÷u¹¹{9¦ha°F ¼„¸•i ybr²&\02[ºhÖë’’JCun\\eé)àÂqº”ç6…Ïı0±ahôm¸dôâ×aFÊê\'	Ge˜Y+‚­ÁÕÛkìÓo¢¹,Ö‹5áú`³+UŸŠÖÇÓfedUÂÌşQ•!?YÁäµì\ZOŒ¤şË%İüĞoî¨åš—¸oê·RXxXè›©¸OªÈqêL”®mªŒº‡zĞİ\n”áî·AûŞ4y)õ®†I%~·r¨¨l2ÔjK´_åå·õ¦ôttîsÖÕbm;òÏŞ!‚öæäc0ƒ~en™@ò[šjvµ§=J{™yÏTjÄ1ï\\-|Ó${#&3vê½¢Hb2,Fô ]‡«ùV	\\ÒÓùBÜ	\0Œ|¸BŞLüDfÕÔ}¿Ò¿Ì¿ê®j$?êVm\\ƒıJæ¢_îYÔ<ÿ\0©g3¾«¬óõ]óõV\'n«U’å³Ÿ|Ùn\rvâi²ë9ñob¦êèù95ÜÇe~|\Zì²É\\.Kš¸;¶õW¾Í6_ıÖ‹%bVŠÄ.Vk-•Ú±H9ì·$&ö1ê÷v[ØIÒëu5D…§À»f[l²ì9ıá}—Oóiá×€‹ SÚÕÿ\0mş;…›vX›-oÁ¢Õh¯¢Ïe†‹?\r¹–[?úZ·Ùa’Õ\\<vºqæíš«rã×e8¶¸¿•–ËßnŸuªÕfx3W[óÄŠÙqgÙæ­e¯kª×f½Jı…‚8]RŸûMíòW<69ìºæ®³Ée³^<Õí¢çğ\'€4|Ò\0ñr°ğY\'“Ï±¥Ÿü¸wup™oİ±²’`„9©è¶Ù u–»9£¤_„F]aÏeì¬¬E¿E\r\\„}¶	Ï¯‡µ€Ãt÷DÜ-.8[ÉYŒ$AX‹Ynw£VğÂğÑãdÉœÀì9á!Pˆa»œÒlÖ¬3Âæøš¥®vğ”l\rï-É§”<ç‡\n1EG!-×$i›M&ñº‹ Ê¨°ß0¤–SrĞü{5ìuøçØ‘ç³ÕS;ËıøórË†ÅiËpÚûrì<W5m5ŸÀZ<_tÀ2ñWTãçØÒ·şÀ<1YLé¡l½|8\\ \"<!€áÃ’ô´ñ¥Ì3TÔ‚–Q8ğouGGts%¿¼‘ÁSº\nl2ÌŞ³\Zšz9073p¢ª±›[ª¦¯©¥¬îÄÕRCÒ1²+e¢©–˜Fê ë3Ê1WQ}³]‹N©Tó¶Éie$o‰—uŞì”‘nÚw’{y§ÓSSÆ,áŒÛ¼¢#-ëu‚§§èØ>ÃÊÕu·Œ¼h©O`d¼G%dÂò	‚’¯¤fC%šæW5ş•¸‚L-\09S²	0o‰ÖTu2fòå\'ÿ\0\'ÿ\0·ÅäµÛ¯hÜÑy¯Õ°óLoá{¿¹xvÚlËf\\:ü{3ÛNÏê)ŸÒ®Bº7ñì`i:BÁÂ*@û8õ%ÜHıæ¿*eX÷xCu[šƒmÃ±f½¨´Ø:ÍËÀ&TôuUm°“d×º£y-µl+w#å-:‹()¡!¯iÏ¨èéßŞğœ÷ô•¢eo)]†£‰·UEM;wµ%×ê+!3v:Ø‚–g¼`îµFg9¸±ıV8Ä¦úw}T5áêa4ÑM[¸k[ln½§íÎ¶ÍA,Äâï¹Å@è&|-¶ó&P>±¡Ã­qÍIÑÕRî±nr2¾ñÅÖ.$kÉ2¢:¶YÙ?¬2Q>¤b@Ä]í¾ç0AñG£[{æH)Ía¸ám³N\r{\r8Áºxóì,Q	 x§²úKşßŸe‘Y¶ø]TMåÓÈl¿dÖòŸÆÍ»7pÌæƒÈ¯óRr³ª_ıÊÂ¦Oª÷ò}U›S/÷,ê$ú¯órÿ\03\'÷,ªõ]j‰«•„ïªëNóş¥‡~ü¿2ÊW~^ıÙù®ùú¨ê$7Àt%\Z™e¤æ@*:J&nà<ÎedvZ÷Y™W]¹ğÜv:l×Šÿ\0½{nI™øª†òxş}µÌø4Ùe—·YmºğÙ–Ë…ÿ\0×ÀçÁ‡“\ZòW(C²på„~ÊëU}ºöW\'.ËOˆÏ±Ó‹^_†Û3BÊüÂgõ*¦_åaş~\"ád85ì2øM6HNv-²!X§zpdx@æT™üÜzvâÍeÅs³]·ã¿ÃeÅ¯i¯ºaÈ©?4?Áø¾ê˜ó•ç°Æ!ÍíRÌVª÷Ù‘í/Øß±¶ËöÚ+|öéÁ’ü#°	‡’°üHF|bwc§i§m{ì·ÃHà5£³è;ç	Ç™âÓà³Û—]…ø2àµ¾ü>‹-¬$|½€!]m\rÕ+GÇş?\rªÏ¶Ñiğ9¬¶|}õk°\\ê{O\']_mÖ]†K5sÇŸ¸tøm;=;Hı¼a[™GÄª9?î´}~öã·aˆËd¯>qN#ğ,6LÏ^\r8XO€qı—U…}¹lËm»;v9¬†ËÊ÷Wì²í3á·gôÙŸˆ‹y§³Õ1å+?Ÿ¸5à²ÏgÿÄ\0)\0\0\0\0\0\0!1AQaq ‘¡±ğ0ÁÑñá@ÿÚ\0\0?!M@9÷ôD	($¨‹	b„Ì˜„ „b•669°TˆH\nŸïCa0èV—Ø—ßLXmˆ6ÄÖÙqäXGC“¼ğÎrŞÂ(ùú>øyyƒ$Êg\'¯fØé1»\"eÀh\r£úC,\"™˜„%¡ƒ\ZĞ„&	¢\r& ÑB	1dL„ƒ¥j¸/°…DˆLÏ¢‚ÄÏMQ¾6+Nğ?<`;o’K÷‹‡a·±~‹Šğ±pë8/ø67õœ/Ñ_E!Ş(<%ì]áG 5pş<[!ë$ü˜LBaX™‡xï™›\ZÇ$!%„!‚zÄ1ïÀ8/A3éŸO9¶=¸lv?ğÂaïß´°ƒ‘Øø;)ÍD>cåc_B™xKr!HB}ƒ „ø4‡‰õ¢è„)Ñ¿¢1ĞAı¦Ü$!0–!	‰‰ŒÄÙL¨BËDÄd&!¶LBz+H~†ùÛ‹ô!1B}3ê˜³£ü†{@û‰¶Ğ+ñ¿Bş&2ké˜,Må!#¾\nB‚àŞõX‚C¼o$4\"a­±À¡\"”„ ñ\"kË“¡DÂÂŸA›¢ë&‘´$, ñO¢¸„!B˜„Ã$&0X„ÇBääB“€oÌ;YöBÓ˜²ÿ\0Á>e«x³ÅÂo°	ğŠ|bÍÑCNŒfÄ!CˆÀšÂ—d|df¸ğYšáèFĞ§(n3§XlãÀeC+òù\rLiÌco0/à1 Û9“9`&ŞÁùÁ<\rn/D×Ç†˜2Q°›\"§£<FiLZpc-\ZEF}Ïtï8YÃ˜V^Ğî¨ÓŠ]Íºx#è4S±ô>JR~£´¶íˆB ‘>¾F„LÂb„\'Ó	õ8 ¡Ù1-ÑlGZœ, ³2ñ6H¾“Ç+sÔ_ùÀsHÕ#ìrÃÂ	|¤Zca´\'±VÂnğ\"èA!­‹È¯›Lë‘	CDĞ_S!\"!¦É™àƒD±(5Â„	„¶{\nùáÓsy„ÆÑV“—rg€|@}b.Ï$P)Î¯¢“c6~§íô½B™˜„&ÈB„2ñ	²A‚I“„ ¨¦ÓŞÑH_Zÿ\0úcCıÃøGæ¿A.Jœ‘ùK/	#öğøÊËÖÑX–Ç“¸z)À£x)+è]<A›Æ´³Z+ÄÑ¹¶u…n¹ìßÒØ¥Ğ‹°[xL\"İô-?ÿ\0Ïœ.WÓ	˜ñ	™„‰ˆB„!¿¢apL%¢	ÈAtzr?càçí\n		ƒ Ñ1ÄwpñÑÿ\0ÈB\'ÜÕøa¼ 2¯ZÃjÃ}‘}i\r«‹£¡µ\nC€ƒÅ:ºÅ\r	,¹LO16Uñ\nš;4QÆTs\Z§DÂ!¬Bu‰ú,xBqâU­1~PûãÈäXÑ³„Ó½\n~Â8/‚„!3>˜%˜BhÙLBn1‰ˆB™D!±]ã‘ĞsóŒ.p–a?ÆÆäv^†;M%Êÿ\0,µå_Ú£b”bäĞ ş‚Úöèe6¼A/F±,R¨&åèA4Ğ¯¡¹iN„›¡ïÆÇ¢œğ)>YÓ‡9r8ìb°ÈÉ¤b°9bFĞù›(AxR…\rÌö‡d\Z\rañ‰¤S‘a3&ÂÆª’\ZL°kyhm„ögDÄ\Z0 GÅâB}\rk0hëè˜˜„Ìú6Ba¬ÌL,Q4CÖä4pÛÿ\0À1!\\‹üsnpë\rìğı¶Åúü‰`Lô	\n‰¡klû!Pk|¢ğx”ïÈø	øiÑãyü³¨”/\\›`¬½¿M•‹‚¨M›÷ô‡ø×\"xNÑiW¾! oKœÛ¹şó\"F*F¼&l­Ûå1Ÿ>S„¹dâZmñ±ì’‹¤îÑ,îÛ®¶\"Â¦íËaÿ\0-\nr=-¥÷<_?4’:óYDêI?}»,×Ÿ3RÅå–Ñ‘ó¸rØçûÒ2z|]¯:ğø—-Ğga&/¤_± ?²>¸WÒNÇœêÃ®Šøª,rY%ÚT\"¢{x_,¶=\\fh¦µ¾#8ÊŞÊ•ó·ø[5qk†.ÂñÊˆş&?É&EBÍ–àh¼6äpÆÅô©ò±¯¦lŒ$¤^ˆ¿$!)b}„\'Ó	‰ôB		30i‰E, >}¡şD!üënGc´ôåı\r<ä†ëò\'¤Á6†´,LWšÑÀÄ}â¨«¬£ƒ=&øØ2K”¥Á]myL¸¼š¥ÍÌ,d§æs¡_Aoğ6±¦–Ïğ-Ğİû-Éød‡ˆ†\\¿g#ØwîìÜ•~¨Õ¦x?²»ãµ’h•¾©P*\\Øùç|ƒÎåÁÏå(M‰Ó‹z‘a[^à,çÿ\0”8B]KÒ=I%­õÀıåzcøû…r×Hn\Z³\\Ä÷¨TÆkå•¢vşŸÑÏc’â_ö7ÙïòCJûRàFü6YÏ!¨WE£~áîƒgÔåšŸÜxš\"<È¿Ş?ŒÊ¼(öÑ°\ZíZ&ß¡¶ Ó„;L•ói¥©Ø€;ò‚§¡gKc×Êè¸£Ğ¢6¸×ÑĞ×èP±À ³?àˆ™˜˜˜˜„Ä\'Ò‘\ZÄ!>˜B	}kOéŒœíá1KŸâkXF\"è>×_dÿ\0a›ÏDJKÑY19?!­!ÊÆÌìLm–#lMƒq‰‰±ZÃ<[AE|H!PwĞ–m¿-ª>\Z;X\'›9àT”?P°±½|mµğ_—óA_á™‘½¡Ò‡k³Àñ‡ÎÊ‰»\'uœœ	^²O‚R‚\Z¸SÌÛyˆ’à=I3ªQÏŠ[‚aGíM1$şÂA\n‘&§£±›Áğw„„ĞĞ>ªÍAFmï…1BÂ_TÌÄÌ!	‰˜B˜…ı!//±Æ‰ùÇäH˜/¥[äk¸cÁ¡ú\rı£cşEÆzp¸¥±%‚N”¦‡ë±òiá=á\r0PJµÈÉ–Î†èSœ!£…ØÔ*Ù‰…È\\ŠŞAâï\rln!©Á5q7šYMœÆ„mgÏ\r€Ÿ`Å:Î‹´_¨ÁåÇùg0„\'Õ	¼Ç11ÑBbba!¢	†RD ‰…¡šà.\Zã‘ıç‘_\\/Ñ1aôpÇ¶Ml/Ë\'2‘¿cè~û.ÃÖAşø)^ÅÑ2\\èpı>z$Ç#{qÍ\rzrX©*F›äğ»bE<-Šœhâª&M$ı‘ödÛ£C.\'1)ÃTòl¬ªºQ®»4•¨•e‘CÒ×”Ä¨N½“4i®wìF7J2 )®M²Ø!^~˜—¨®…ÍNqqˆÔÆY{kG…?câwà´–„ÒI­°[åÁü sBí¤:tö0…g4j³W9èåÓäƒç€²Ì6OA-!\"‚{È %‰ĞÒl›9ˆJ?#D´Ÿc°OĞ4MQèÃ#Lã\Z¿«	¡şÀY™„ú!1„‰„ˆO¦0ŸD!BÍÈ¿Gğ†Ì×ó1_BúgÕÊ1l>EyÍøBµv/˜~æÉ¿#gÛ•Ï”2NØIv¹£î1íû‚\0HI­±—“hÏÃ4ß%Àäj*†¦Wsîß˜_ÈĞóôKY¿¥˜‚v-†“î9\r¼ùÌşlrM`´´O1v–‡ià³o7Ş]@&ƒ›<û·pEgTG§Ù§Ó€É¥zò:‡;ÊlEZK|14\\\\*¦ˆxĞÙ¸Š©\Zì†mUÂg¦O\rG¯ ¿O•(”Â	i-_qŒ¾×û7RgrÓÑ{\r/ntjƒÆæ.³4<¶ÆßÁêª“ÇRM¸Êğ÷ÓgrJæRÑZ ­Kôƒl¢lœšP«ß-ûdğ\\éAoò&ßïÕšüøãÀ¯ä¬ÕÃùÄ8ØÎ(%´Ğ„>òcO\n}…F}Ç›ü„A(YKH„!3>©ôB\"}\r	ˆ$>H5OØ;d<ûˆBBÂÍÃúùÇ˜‘ÑıÃG’¬à]µû ğøÆòGˆ~ÆØ6le8²#	Fxk¸¸ØVT¤ŸOË Ï;é¡§BçiğˆRl¥K	1•ÿ\0œRrj~µŞŒR†zİ‰“0áqäOBhÕ5£*D»hu“/ì\"÷.‚é¨½ŒŒØcc{øK#¥¡éÒ}4e4µ<ljx\"?‘OUO¸Õ7 Ü9©uYpFë\\šp=½,Åû×úûU¿-Œ~C”kÙÙ‡YßÉº!Âî¤Ø¬İxñĞ§\rïl®¥xş8\"Jş)î’`÷1û¥z÷ºåW´DßÁt²Ñ‰‘xB!‡’H‹IªY³‹ªpN‹¿1ÚZ×ba¦ıìnô­‰âMkWHOFXäç¢,á; kCĞ7¡@sê|îÊìõôÂD!2Ğ‰„±LBb˜˜hH™ã„ú~|4Îf‡u…øB±¬Ï©eê7İtN\rœà[x¼±›§†‡\"èl¤F‹ø(öß¶rI¨\'›ƒùBş£a!NøEkÊ+$JÁ60œöä\r/¦æ\Z‡÷a/¥!6¶Y¡¨iB!¶Û¡Éâa,!w…†p‰Q.\Z\Zbş1¡ì!2,Üı…qÈ~QÃ„±˜Kük„úX‚×„&fÎXëìCŠÅÉúhNé!D\'Ó?À©¶ÇØÏìğ%Ly@&vvC¦,zÀÿ\0ƒm1#a-„fl£dĞú3<`‹Ä&×NÁ[ÂõòD\r/8>x&¯	-ò-$3áœãË}Â£Ñƒë¡0«ÄsYŸå1\rV9l‘B—pøZÍcE1¤è¸H‚ìPï\ZI›!«Gûf[§bCà˜$ĞïC6úÌ¯¦0„!LÆL$Mâ\raLÎÃ·°9!¥ò3ÈĞ’t4+…õ<Qö=Œ?Kÿ\0Š)œŸ–\'è9öoè¢{#ø\\„×äA$÷GÍi/¹eŸqÇĞû\"»rl¥\ZTÑû„)“Q\'bØ¾ø¤JÑSÂ5âóKªĞ­v-¯3Üå\rõ0{´\\Ù;”y\"ÿ\0èv¤%‡µzâ8)‡ïiİ­5ß°ÿ\0ob—j?dA@×U¿D8¥­×	Àmñ\"=€¨Lse¹L*#›]ºé\n‚<}ìGäv	yH‡ÃGÒ§¸¹3ÊºEˆº“PçìNybÖwyH¨i\\Ä­ğ2Mæ®ç† M¾M	”ı47æ\r‰@òOƒlü“æ+§/côê\'I|ösHùêÜØñ†¨W©­ßHUû	PÅ‡-¥aûõ&AßEösèvMÛ\0à¯D«Ê©3¾…_Ôï³ƒQ„3”]¡üÑ’øc. \ZÂÄ&a$LÂ‚Z!ØğEmı0„\'¬B˜„ĞœCêgä#Çó„!ébà˜mã\Zo–a|p9h}<§tÛ£\"{5E¸Fı‚P<ìˆz‚il°ı¾cÒœ½I{°jãQô%	ûußàbàŞ×^UïîŒ­/Dm>´Ä8%ñŸnÃf­7¶8Æšˆ\ZKöT})õQ_ÁÕ&MO9\ZHñö%ş¦Æk¡De,|§à™5&†4Ë%èn3PH…ë4èÇİe½eÌ~Œ²ä2ìYœÈ’}ÃÇAøÖ¿átSá­SîF›ÒbºÌo†²`ª\ZøQÍ=Sn\\Qcf¸$ÿ\0ÒûšL‡ß‰>CDÇ®«+GH½65¤r!‹ŸòÓüĞ£5g³„¬‚ÅQïCpÒ†^Í1{3®M*¹£¯Š/d)aªÔk¦TÓÎ=8¹8U]µíÁâhÏbà¼á›¤ —äŞbxšı‡0şÜ‹™HKèŸD ¾©‰ˆ%DÅ¯6|ğ|æh˜†°İàÎüm|†õ\0HB)OğÁ´ÇÓQ¼°~YTèŸ¡^Ã›ÌƒtRõ˜4 §ì^,:Óÿ\0§ÿ\0ÿ\0§ÿ\0ÿ\0£Oü_ôÿ\0ÉÓûÿ\0öç¿éÿ\0–ÿ\0¥¿ù÷ßäş¹şÏë¿ìşùşÆÇ÷#r¤ÿ\0¢“WÚ73A¤š\"AÈÔzCF%ô\"û\n$-òŸE[>€ëêx5„9`w»ƒ»öÎö<tûPïco.(–Ñ‚š\rBx	ÑÃWğnñ¦œİ{7çX¾KH<“‘ìçÙ½{´\n•Æ†|²4ø\0ÍüŒ·À£“ÃD°>$szä<vzÏèJz?àUd&Ä0Jqv<?	é™ë3ê„X„!4A›äd8ƒd ‡|aşPYÉÎÎ˜$‘?Á>†6˜ãl443ñ¿,Oü ĞšzG—²©YÂ\"\rx›‚lvf“\n7w¼4¬Øôt\\#xèë&²ñÀe/Òînò™y.±1¸\'‹™‰¡¬$}ƒ²aC@jô.	tç\"ÌÊÄÄ ˆ$AN‚Tr ¬CDÅ-‰Pa-ƒB¦h\r\' ‘´éM	œƒúé¢B×>¶hxF1OéÂ\ræìrá×İŸZĞœašÖ\ráBcàğ}úş²b|·1	*Ôšô,Ùú3ŞÏÃY9QJ\rá½ÖÍ®ú{G9\ná¸¼qJ‡¾GM‡,>Xµ?-‡>\\üšµ©µ\n70úÔ‹{½Ój.Fw›š^Ï…˜4².µJàgø	ê°»Á¯hW\n,&ğ#º„İ	qüp‚T6ql}1~§|ñ¾öˆÄ–°!Òo¯3ŠhI¾™}\n4úa–_„$Y]hOƒòC°4%˜D$a ÷Å<ö„ˆ%ˆBéH„ÂD –à$ “\r)„RTvâ)ÈPìÅºœ¯àcƒ¯ø&^9ÿ\0Ã81è0øìkÁøÛ_tKçÛB|ÁœbØk™ªˆ‚§º^d×=!Îly+\0À4¼sãL†F©ZôĞó6=ÜØ»£5ócM£ÈÃ(­xÔFîì&ìÔ6Â:¹WÀĞ<nIª}~æï9Q„jôu4¼’Íá·B¾Âr»,gÙ6ú›~×„{ü“·é¸<2Ó“_6›8vêÕ(åx˜ô@®k7A@’mDø×lÛBœšÚß’qmÉÛp!‡D´g<6- 2Ö:ÒE¨~ºZôKÅ›ŞR¶~Ût´>ç·<ÉÏ\'Ãé8çÉ0~k¿ˆ¢+ş½¿,r@º”ßC\'©Ôã=Tªœàà˜íkèj-/wÎòP¿©Á¹ÅÖf½rÖiñèExvæÄ®ŠàíMà˜å±ê0xÙÅò\'İb ¼|‹¼èiîÀBÂ_B!¢acD!Má	\rpˆ$$éÎ	D\Zû¡¦@Ae/>Q´ï·¶HAs¡/ñÏ§˜æ9˜ÊŒ2•üj³lÀ{”ÕÁ\Z8õÙ¯ˆlDÃV\róÊİ5ìsgª‡>YÕ7àÔ\Zwg¾ şB_t85JpŸ	óá¯¹‡äYN´Lğ1³dövÙ¶º¼p%âzvş2>[oøÆÀ5áèw;Èhh\\\'€ŒÇ]òŠ±	µÛ_cS9ÍM/P©ÃšchÔ‹ñì´Îš¿\ZŸà{Í5ó	ƒäQè=ò›çRÒ_Á~´}±ÈòÑº$…t[UW#<}UğmñÖ“í_isš‰®Ä&“;uTÊ}1#¹OµÈ¬öÜ¤‘Ë\'Wx\\ı†MCßC`+½\ZFõ0¥=%½ú.‡{«C¢Ò¼?ê\ZTîá¡ºïJÄ1Cëœ&’Y[Ãküâ@_‰a-Ü§ÛxŠK<yDá~j4\'Ç]ùƒ«]JÍ<¤›;ø7)õË(Ø…Ñğ5¡!ŠOäæÚá†.‰…†²˜‘†°‘–$á(kbQôGÓ\rVH‚I®?±3…¹4{thúšˆd’ò¸÷D°¾‡‰ôÌòœCïò1œ¡ñçåcı¤ì²á‹ùV?±q±p¾Ã5LrØ\"±š—²‹ê»÷)Î\Z¶…„\"ˆÑ÷Ca&_pmÓP?›21¼ÃµÚ~†Ù~¾[\"ÅcúnÂ\ZÂ¾\n9•¥SæÀSÄ¦mÁ\n ¿(%}ôpÁq‰‰‚AáK¼¨ùúšà¸ÆòĞH—!ÈN5\rHœŠ`Çì$ì¨ğ+üs1chrAÕÒ\ráOc—ä|3²ìa,D	‚ÛƒË\"ƒz\Zö2—a±qÀÛ8aqÑJT…‡‚©„Ôç¸šÎ²–iÙ¡q”\\@˜…ÎÇ ‚	á[w¹¡=ÓüÏ!!\"a,(\"		,ÜàÖQø8X7½‚EªPA%<ñ\\\"ô-±\ZA¢Óßª4É\n†¤\"~Ÿj ïÃË…Xá\"}I…õñf–>ÃA‹÷µïT€œ¢ÅÁ3_V¶t˜¹éŞ‘¢\r!ÀŠ×C¼ZtÀ£`<­oÉÁ&ûŸÁmEÉ·×É$²dôê=’ùB¨î”’9à\nÍ#Äsp×’há…ÄÏxÈÇ¾\"­ŸCH‚[;ÃúÕx¢f¾±D‘1	¹sá„„¦‚$&¾Æ’iv¸\'òNK	\"bBØdÄbPM‚C#çcCJr$˜Ì^ÉÇ®Á´¾Ì›Wd»	uèMíBÔ,jbR.{~ÄY]\'	$Aa	…w’béx›sïŠz(ü˜ö\rŸ ¼4³Â¿X/çbØ^›<ç\0œ§ÿ\0ğäÓÍç‚Lnqúv\\±|¢Tz‰÷‘QH—öÒ\ZAÖ¬ÏW¡&ÙÛIˆØòx4+¡PVuØ}¸–t&şƒÎ‹—hë+à¤Ø]âlhÖ\n…1ØÄÖ.¾•ÎŠP¶\"şùÆğ…”HGŞ~CgÜH„TA	°ˆB	\Z¦ÄˆLE±ó‹A÷„EãbZ{Güœøkğœ³‹±×PNˆ®_\näşŠ„€éÓŞ‡‚¤ÆÜÙÖsC‘4ÿ\0øšqœ¿#CˆÏ3·Cû Ü7†\\½øÂ™Ä‡ZËùpÿ\0Í\nL½\nr|!ğlx¿À‡àŸjuÑ×D½$>ƒ¬r:¾ãklm±‰,ËVåbÁ“¶Çrå?³,Eì¢~„–|íş†q^n¯î„vŞIÛâ¨µ•I„°Ãù6tB¼:.\n**ñÙw„<Ì2bEÂäï.‚‚Xƒä%_`¹„…›µäzóOvÿ\0·! Ñô.rô‚X›\"¤@Iìhâ$QÖB>š…Ôh¢È/ıÕÖÄŸ/‚§J4ëî¨qhtÅ_åZb»ÂºÜgâ)!4¡	¦&&\'Ñ>‰ˆLúÄ660ü¥áû11ŞÂeáŸqâÇùGF…pô‹¡j2W‡²š¦Ä•\"è9¼´,–8cŒ?’å1<¡4M\r\"aŞBdÂ™gdO£[6„	alƒ?7ı…æ4A}Kf¿ÁÒ’#pRBWã	ù=$9â	W.BR²Ç<¢[‰	G–+O¸¾AKµäwº@ŞÜì¥=ÂIş@+C.\0]	˜O®}™ßq‹Ïcãˆ•œX˜x2QósğB ²/¡ó‰¬QaäJ5‚‡É»ƒ±d¼,ğ1	 æ4!dK\ZL1wôtCb4\\WĞ—ĞŸx„.RûI\n¿CãÙ—âğ„õ…™3$tQ]\Zğv;¬U‡#P›XVĞ\rV;]$F¨Z Nı¹„ë¶è`–·èeöéh‰_¢$hB	éè4ü¾GHP\'O“âĞÚÜyy\r¦H“€ÖGñBkŸ¡\"}P˜ë<Úg,ì»ã¯¸ï¡ôEêÀºú5Š|‘\n\r¾Ø¢eÙ}Øx—²¹‚¸&õ±a¡.EÃf÷GLT‚bäw›ŠQ­aÇdÃ&±}”£ ˆ&,Aã@·9Á\rGñ“ı‰D”45øÏ·û¡ëa‚ÂYBJòk¡>Š˜Bä[æªÀ&ÂşÂ´Â_1×ä_%\nP×ŞD)b?bb_3Ù~¨s]<³g\r.¹ è„ĞtEÿ\0~‹3ü3˜m1†ñcx ü¼tš_&ğŞWè÷¢-´$&<(4Æfˆ&ÅÖR)}‚fòà¬o—ôÂ¯z\Z¿U4@Å:b¢á ‘Ş;Ïx¥ØÄ5…õ#¦%¡!bºZ\Zbü³\"=óP+Æ?’]‰„A\"‚D\rh$.pŠZ4E5\Z\nX¤	=ÛbÁm‚q1F¦¦áÿ\0P,øpØ’¹¿,ûkb¾¢ßc\\n÷Ğİ@—ß^•’ºy}°±¬Â0˜‰ı<Ó†pa‡_˜Eå‚è‚ÊxGé°“ƒàŒ|}\Zo\nåCn”%€æ(ã=v>àå\nÑ&–z\Z›‚l%¡f\\¿m•!Khôû¨XkDPƒN&Pë\ra2Ä·”\\=|9E4±pÅ„´LnóÀÔc±Q!0B„O€ó€¡	cXÕÂBYKÄôAjƒ!©‰©{ÜÈdˆ‚tùNÅn=(_\"\'–4»1]lÚ!;†–ßìÍ×npˆßç±ûù·J}„ ‘2ó?ÁÁ¦=bi¼ò}ƒıÑ’Ï¡~ó¢! ­µğ‰­xÒTïB™\'ÔÌ¸ ±€.ÅQ&1õ[?òãUˆâ’èßzÂ>\n­`óÃ—I\r[c¶¨jum~K“»š4¼\"”\\şÄaËïÂãé#°j	Ö“óáã™3²Ìå–9Ç]İö£P‰^)½/“€ÏÉ_³\'Ëğ_šÈÔ€Ú&Š‹u¯¦mgLà¢Ì7àß?¡¬}ÄAbı%¡Q8úL›bèDĞQŠß¨˜\'E„Ê–ÅARöí¹¶¨ªÕè%ÇŸ—‘(;?fÿ\0’mğyGO¶Í?ô‚#`-òb KMá3ÆÒ!O¢}êf¦>™ûÃXòëÈm} ÎB&B¤=&(UâàC ’kcÚ¡‡ä£{MÚİÕ¢OØ×Î·ä\"Ö~\rNvHÕèÔ‰q>¯àífoåŒ³*9VÅ÷µ¢@äÉ\0Å®RÂ-’kà@Ó‹ò\'›ÿ\0bÚQGj$?­vyÒGHµû•%V®\\wEm9>uU>M2š™M=y\ZbÌ2Uò¢œí½æ2A«©½‹âÃõ«ìµ2QàÉ³²	á!r}Ê,z4Lòj‹B$%¢lHHKÖ?0$Ğ°¹\rÄ¿\0_´ÚZı!a\"”°—²	\"	ÅÈ´ù	0#¢º:ÿ\0èGÇçÂ6úbÜÑ|ˆvÊÃ¯ş€š]9è	$Øİ¹ÄÃ™ŸDÌ\'ø81´ÆÊô	çŸ°Î«¶ Å~áö\'d9Wàà}¸{ı¡ÿ\0ÈŸèj™á¿¼øò_xmğÇ<-™ÃcüJ§vŸ§›¯´%èÉ±7ÈmSìÛ#Ã—h†$ZRßKçü!ü[‡áŒ¨$zª÷Ïé~Ã+yL\'rWğ:¡Ôù‘ÄÁÂEê\\VSò„İÇt~Q¾%Ûğjt¬âÄAE—ÅLò-„çè¤\Z&{(Êüäû“+éMœBFï`¿,%ôV˜ê8r6†-Ü‡!|}„6Û ‘¡V-â¿Qğ§à[ô`ZğòÀ%¾H}ô5ùDb<HXòÇS8Œ)6O§œ<BŸçå9Na¢Æs†¿o-òÄDMlv7‡‡DÙØ¦9ÁX45¬7D¢kÀØObÑÁÀ«€t­\r‘â„X.#³HßĞŞÂŞÙ42C£S*„´A,oøv	¥…*!…¦+ã7Ú\\qğäàZ$s6%ˆp¾àô¢tôB²¤Jú¢I…Œ\r¥Ä]¼±Ò„#lDxŞÈä\Zÿ\0\nõ=!=½ˆm\nß¢âO¡ı„Ñ13¼Be‹öq?§Ï‹€ßf|×’bãò\'·ìAÑ †ĞVÚÑ´ÑCã‘‚	§DLë	¯bŒ„\rbb F‚çèˆ¹¸I„¶3b&ZÂÅÏGB¢…NPß€¿r;‚ÇAxirBY™V+ÿ\0°¿!)y«f¯ Ò;ü<\nv!ÄW¢û¤%$váö¢\"6x¬ó´n®—	üs‚_Sÿ\0l\r\nÏŠü±Ò£ÿ\0’q\"çí›Æ_\ZQ»ƒĞÇğ;¸X4„‚Aã²¦ìlRc;h°ÙäI“è$\"f\rá!¤oá™¯¡âPáš\"o(\nıCq	Ã	ù1£Ûô!T –`#œ@£.ƒ-¡éIÈŞôWA[¦›|||ŠT*×÷Km¶Ê¯}}\Zì:m¶§\0‰(6qŠÅşşYôq““äeœóş¡]¤õûïÀ¯àxcyhxX\n—ûpÚYFƒ—Ñ£fÁ¦óÀockÃ³½†‘…Ó0B\ZØš‚”ìgXİ\Z+-ãd&B·ŒD,Ì!a\\,)MGb‰0ÅIª/äÿ\0”„£Ä6.b	a#‘+!.é(Ó×Hñ—±ØğöÍpß!®\Zè\'IˆSH%|ĞO‘k£ÿ\0ãŸ\\Ù	‡Ö1ª5Ÿ.¸`ï\nüƒèA+^¿Ö\"@Ã–[‡$~N†	“Â4öÍûÖdÃ‘X4ƒmõ#çùMf+0ğ}šjt½7…‚¡¢	!qÙñGè6!;¹èß²?X„V©úBØ£Ôw©\'İ²üWì¥&:ÇhcŠà¶ó³‘2-5êßOÙ0¥<PFŸ¬©/±øzš>=Şb$ö°Î+’h]…×¡şÂˆBÅQ_dÎoaŒ\'àÜ™%²è“¯’\ràªø	Úæ:\"‡c¦ì¥¶5ÑT‰>ˆÙ\ZèŞÜ¦İ+³hpîü³±‰‰şiõL/­œøÁ¶Æñù0ñ nléäh¸Şï† ïröæ!ol[šæçKØã”ËöØÚ‹jøgK{ E¯³L€b­öÈSí-ßØi¸¢D6\0Úäè1Š§¥P˜‡‰Ôò÷‰Õ4‰©ƒAi*êoBõ%µÛ,EL ÕïJÑAµÜfú¼M®X¶±æOÄ—mcş\'U€yFıÆ1r½¾!@æ[Ìş,±é·ôCî^äÎIX¿Ó&ø(Øüìı!™•7+ïâAHvË>Û‚Ër\Z™·sÆˆNN·x%cÈ*ÍÜğ(‚7Ó¿5¯oñöµwŸà¨}`¸‚¦¸ys,_ö\rTô:©Wø£qÊmrŠ…y³²¡µX‹r¢æH’Ö.„xíÁ¾’4WG{0ƒ‹!“^[‚Ğ3ŠO]ˆ[M^kk_7Ø‡Š‘¸ùy¹°û*H¦AËPã]Èvr+ƒøÅÇ Ÿpr[8“M#â€ùàÔ…ÈÅÀ…Â‚u“‚Š:bI6\ZKì¶h‚åCÁ	04˜’Ÿ¿‚á;Ûè/óÏòÌ6˜úx3ÿ\0¤‚Î¤ìr¾Eô˜ø·Ä?‘bBcgH*¿“”º´oO+“|±¡	nN%§ù4ˆkâº=a§oÚ¾g¶G\rß8ôTfÏ5.jú7@z”g‰\Z¿öÇ9Ù	s´&M³æ(X[9‹|¯²ÇŞÉ´ş\r¡a&–ÊÒÑ±H›”ã8Îi&Ô¿cf¼Y)ù”8Úÿ\0‡¯	Y±û7¨¾oİœˆW	ÿ\0Ñ‰Xı»M5öÚ3â•ÁU¥=^]cÛû½µ÷£ ôa\'$—ÎÆåÁƒöë–m±$G]%\rÌü6nPJóİ—ëEÒu¾ä¬ëóoKòØŞiø1hY[Úr\"šsav\ZtüÅşDi®­š¤Oì‡eRZÒiâ,8¨+Ëá!fwm½ÒøGL33çf°0¼Úâ-nÚOÃ‚(ÚñvÜln<fz¤õç„~e3ÜßŞS-äLJ¿‘Jq:Ip‘‘uJ±4Û|´(\'2WñËşØH×VØD[–3\\7ÌàTGÖ•¤ıú‡d\0º.ı¼C€†ÉÇÅ „˜øàVÓàø*Y‹Oíş±XB”‚àX˜	\Z±ØåL[N¥\0¤€-/05mÜC{^ƒşÙ_‘ÛØ›’	¼¯ó¼OğO¡ãƒLäÇĞÙááûg,¥HI\r¼%ô/Ç#Ÿ˜l{hp49t[HZ….²ûçY²Bº>q•.’D¨$—E/’ZY¹¯İ<|_m=¥lQ	;@IWvĞ¦6ò‘‰ÊWŠŸ¢0/:ñ\r¸îM~ÉäSç~áİ¸§áó¼‹L-^’£×aÃËÃÔÇ€|îŸÉ»€}OäæÁ¤Ã+ºæ‡ñı$¯Âï…¥	ıi®ô+ µRğŸ#·²Û{62Îëå\rRı~M³À‹:>ˆù^„–OÛ‘ÆÖÂfİx=3ÙânUİ<ì5„Æ z¬Ş¾FP4o‹îjC92|\n¹ùGŞY-óH^\rgüŒGeüÃ‘]0v„üX©­4ĞÄËÕcYü¹ÿ\0#m£ù)(ôZ@KtØ‘¥òÎàß+úA¶ÛlxL8…íàÄj HKß1ŠsBèƒì&+x! $ò!o ¬H$æÚä;XO˜²Ø8è·7‹°ÚCv\rGMQ&¿a`ZÅ/_ş)ô/ğ¾¸Æ7‹?àÇ]ğĞ/–(bZ½}4:ó‚[ö^Ç·…]‹”B\nC”¡HpklQ›C&‰¡hØ¤ÂKxMpŸ£¼¦PPşš\'±a`ŞŠ:Â<aÄOÖ.1d©pÔ&ÛjìpeÄ,âK%«Æ<Şr\r“€ÿ\0»ÕòvÇ$‘¯=WaûFŠZA%ì¿Zÿ\0òO§ˆÛœã¥ÿ\0˜ ï8ŒÙiWLx™¬|‹èøÃ+èN›hikZ‰à“Ã…2Cô{O¾vM.D˜Ú–Ğ¿®’ĞXİc€.é,÷\rl4V¦ôı	LâØ[ú6#Ü­}Ğ-\rËsˆ–°FLóW­2W¶[CÛ—{ÅÅ™Qñ.>IH¼[+û<*5ÎãÆGcûDfØ›C˜á[â·gb\"f¬\"°¶$ELzcu ‘¬9Œ“ûĞ—CÈ”Ó„%	?•šOÀ†O©èÈá„Oÿ\02ÿ\0\ZÚ¸Î?ë‹€ô7ˆ\"‚h}=Ÿøñ˜Ş\"8=öÒç‘õQò{ê63tZ!ìÒ§\Z^Ñ¬ŠA7ûŒsÍú¸œ<7ÄĞî×èaïÎ6%¶Zú&i\"D™W„ÇaÔµ¥Vødx3–’´Ğ\"*¬ş˜†„Tì¼\\\"šFQj¾¡¹Ä^=Li_Kø4Øu]û‘”4%´×~(i¨jü»D!2”&“Š.IqS‰ø’òÇV3ôa‡Q™}´3\"Cm$Ÿˆë³Ş¦ô’K³‡Œ§”Ÿèçâ·cI¾p¬ËUâ–•Fõ.0ı>˜‘üY?ÌeBt¾œS;¼$;%IvÇ¹¢]|å!èTµïÛİ´CŒşû¡˜V/ôà„6•ü×¤5ÅÁ‹n4^OŠŸàŒ\ZÇå&\"òr¾uñ¨¶ÍŒó,™U¤B_¥É±_O#ŠüœiúŞ’ÂtË—ğ„Y~B¸o‚¿s})ÅÃĞü€\\ˆsw…	|‘\"·ùOK‡ñhS]‚ĞBÂŒCXÜöc¥èM²¶5À…t>øö%6ä&å’*Ö4tOÿ\0ÿ\0†Aà·##Ü¶öPş‘ú&ùÅ4}˜‹²å¨?!îCë…šyWù®¡±ÆşÈŠ:Ô›í¸EOÜV;¢…Nı>øUV²3¢ÖÛÛoà‰¥¡¥+å_ö:°ÔyÚÅ\r^}bİ	¼$fßÌá2Ø…@yr[|\'–.jßØo5Ÿ‚3-gâ§ÂĞñ*ö-<³±sÔi;BpHéÇûì\nóÈ·N×é“q¥ÓæNñÃE=\Z-\'øÜÆü†ØGU6ÿ\0ÃöÆ¨f(š‹^ÒàØÄ4¾QáùB¯ú\'Iåİı#j>V\'ù/òjÖƒÃå›çUi®Å8îO>ÆPşù“„:HA|:Tèa„l¯Éçà|-±ªšÓÎM|±ºf3ĞzƒÑ±~Ò9áĞ×ÏösY^ÆÍ¸\'ˆ»l©Z“rQŒööÿ\0C\Z¸ò|°Ûâµ«Á,+µ|¥$mo}$w„ôtEz?à|„÷‰e&Q@ït‚û\0WTG‡„$	¦Q¡´ÏäOa!\'áS}‚|ScîĞV¶pkğ8-9£HğÑæsÿ\0Í?ü.[‘è1‰óÀ¿ØlpˆÑÅÖtş¦ÇÈè¢š\rİÓö]Kk5cüeMiWæ›XÛ5g™†´şaÂ$SÊD¢ı³¥³â†©Yş[!…šû!étµöMR_¤r`ê®R»ë}Â‚iº$O4÷¤Øİ9\")û»)¶Ş­E¸%œw—àÚ¤úo¤2.³ææâ\r»í°ëv “M\'ÏÉÜ[«ÚÒF\'Ç=-\r£İfïà\"¯#‹ø3Îdc4TcáÀ¾ëÑZ;&jCî±¶ûhâõDLà¸àS6¾F¬İÊüÁ©§§D´~F>Â5øáXÙã84+1Õ:×àz}ûOJÁÎˆãÆ†MO=j¯Ê\Z”^ÄÚ~Â.óy@´\"›nÌTCĞ±Áì~@BP­“A³î€ße~Ê_¡?ÙÇ‰–áµÏbXı íà==RWÔsÊIĞÕ¯AjGCM~„oÜ6ãû‚šğA=ı+üëüëò&‡›ğˆø‹òWM ¯Ìhk}ßLG‚{Å.ñĞÓèà-lä‡V%ŞÄÄA\\4Æpv‘0ƒ8º\ZËKéHÒÄÇ!Ì©¾‡q÷ÂA1¾(•şH)(w£˜WWä³œÄu¡•òG&æ‚	bM4Çö+K°$İpàßäG`[FÅÅúoøfgÔş¶Ğá«ìşúØ“˜M}†ùaĞÙ6Q¿¢@$Q7ˆ±MÔ\ZòpIÀƒWB¨(†ÆÁsÁÌIZÎŸ\'¼®NDÅÂc±¥Œß­»½Äül;PvËÃDhlÙÓiÍúÑş3ı›6\\\'\r½™W€­´4xìa~«ÚBÌÆücHXX¥EŠ!÷„Lq<VùÇò-@±7ãşQnW¼4E\"Şiùü>I+ğ	úm\Z-×ÈiğDZç‚íGYC‹™şáâ}/éy}¾ê¢ü™+Ä×áß!ôrá”\\‰<ø/Ğ÷/Â\nP-W>l~xÏC­mAkáØ#CÓ}¸,±$ßgN§ÁKäócHNãòni	óõí!·“ ö×?B¶\'gÂàk×À´‡i-\ZõR¿s”Ì®â}Å`•.øÕ¢ÜıPİ¾Dèrèİõ¢°<Z?{… Ú¤oîQ|vO¹_À„­ú‘Å’Î_–ÇaS¶Õ]48‡3iÎq¦àÏï´FÁV‰z\Z•|6Í•©½vè¶Oµ“v’PMVÃoŠÓ	ÕSkuê\rvÇ€†ét‡F}[UhPàóÄ¾E„ş£@ãËm	”é¥Ñä7Íë¦ÍVwU=2N¹Sk÷±4›@K˜àö\n\\O]¡2=KË¦œQüD)%QRÊZÖ¼¨Ù3eÙUÃÃ”Î®Íğû2k\Z¤kRÔ£Z\n\n]°Ğ+—èÊ,+HåèL&6†õ‹ì&1›~@€ÿ\0c?pÊ	ë&•úsäØt\\¶ÿ\0’Û|	¤\0?§É«^õG«cqlÖ˜]¬\"ı¹¿ş\nO§‹Lä·ÀŸ³ßğ’[/·ôl5£GbEş˜BbEÌò[òbÜïz+¤%Òÿ\0‡¦ÄRI¥ÎÎx\"@úé×Ò>&Ô/Ìq´½³BŸ¦‘‰Ší¯b¸ÜêDöı!/pùo,j¡M>NÆØs½€äôŸhÃvŞÏ „¯½%òn‚÷î®‹“¥jÛîAûK¾ßb…ÑÊ^ñ¾Ø‡áM­®ßbbhëk­«æüÚBZ|5±/ØÚ¢<f8W¯ô:Åd\\’{ƒÜPÅË[éğs¤–¬ûB„áîïàCoÒ(±Ê_†¢JÇ‰+k[ò‹!Åö-QPgjO\Z\'ÔÜpÇ·J5JsÀÚP»âãò£j®í$Çp‹5Eª>İçäqÕö¿èüt ßO†PSGÔC ª/Ê/‹ŞÖ«üÈ1Ğ¤P†*‘¥_TåÑÂM¼.ÊÊß‹’v‘Ë#¿¤¶8oÛeĞêÜSò°,O£øÎ¡b…ÍäG)¯hg\ZÊNNèX.P}/äV&›ğĞ_BvŞ„Køz+€\\U¦:t k–fœ,6Ñ¸ßÿ\0Ó3èkøÎqğ8şÿ\0~#ıŠ\\»qÿ\0N±ıá-„ş‘Ğ‘¸Vl`è¶*Å{:Ú^X¶\rè¥|†.‚ñ\nl—	WÛlUŞ¦í“±êe4ÉñÎbßct?«í¸¬6»^•üøª!c±®éÂØY>ÛC;\'æ×§¥N2|£î(V‡gÅuø¡Ó¾SòÇ~†úq±{4¥l]\\M÷¼WúÁrœrİúB(Ñ[™Á!€_?ÛeG<‡ÃôÉá\Z\'ûÖÎ6/	ı47NïÀß¼EV¨’‘»IŸr“#vÔNÍQ9¢™}ÔCù1u½¾åCÃ0Š¸û‚ô~ùân\'/p“|»àmÆ”öîY{ù<XÕH—Vå‡oå\n’TÛšŞÚ jûY~Y–+8¼lTÑÍ/ƒİÊ)í÷(·Aß¡G_ˆòÑp	È„İl9¡üÀ­†Óc˜_„‰ÈÅa\'\Z\ZúĞ›ë­~~@×äw²ü\n¼+‚¢8‚ÂC@(Î½3M\r·nÃ…ĞßğhM¬	Óíïj.±½‰¦¼òZ^Avİ“¹ù¯\"Øéuƒ…›ÿ\0ãcTpäğù\Z ø©¿’kôĞ>\ndÎŠ&ôs^@ÙÖ!¦áèsğöxæg?#‹hŠ9\n_A½3p¸mŒ…Cb‘záëîs‘ë›h!<6š(ŸÈ¢	—EA	£v1Ï\"• ˜™b9B™DÍıÅÃ[‘×€\'xurÚZšâi¶î,!„¨\\e2×ÀBÑìÁ¬Bº5ƒ\\O°õò;²P;i´¼—Am¶ì6×n™`\'Ëÿ\0;Åÿ\0cns‹¬67±ê?ë!´Ÿñà€aåã’{ïäÆÉ¥³dÆ…6!èà\",\\B>„4¨šƒƒ!V;W…Åä.*\'pmb¡Ğ’lbho\ruì£È}²KË}!×‹Ù9á‘ôtkèèäBw²‰ì»?,MA ÄğQ¯¼{…Á÷‚¾ÌÙ¯¶V¼‚äe¬V¿¥Í4¸fêÓär>OBZÿ\0Ğ7ßlŸ(œ.†ÒáË±\\t£—«^„úú\'3´\n%ì4ğ™¿+	ıßøè˜B__Èúc\ZßÒ-œ#şDLø\rÏˆkéáùÆƒÆdj¸^xOØ³Â§ğƒMw&nb¡+aŸ>„IF{GãC¯\'¦jr&ßÈÍ‰XÑ¹&Î\"wØˆ‰÷HˆiÀ£aàhZK¥tWw ĞùĞpéùà7§œYş†É˜·Ø&uº·ğUg~ø§ÑşDÇf“q&ñNC@ôYzI}¼×Q¨Şÿ\0ku$¾[§×o„„ìu©1Ö®ã*¢¤Şâ†µ>6(˜şÙÂ¦lIğnöC03¤^[ B½Ë~^–Ì¤-x3ıãItG[œd†ŞL°=bo„â³¢–»l¾¶!ğ¦¸RdWğ‰ÀovO•J-G!œ®ÛÇêZWâ—fwå­¬%ebò$§l$r™T²è£Ø%\ZƒìÅô1—CA´ÒIšè[BmŞÁj&¼Ï¶ıq·Ê;€ü€á¹öŞào×ŸqÊ—èa1Kÿ\0ãaù#ŒvBØ,pe!^+‘¨‚´Ë²”“Y©ö;3íİ\"ğG_„™âS}ŞÍŞ9ç¾ (â©HEÔ¥äñ¸Ö´0Üëùc\Z\ruü\Zê³Z§:§uŒ2–Á?s–,–Ÿ‚Š;q%GBš·…n¯P¢¸|Æ ‹òÈéÀèÖ+HnŒ>’ˆ§õ³bD ElÆl¶şˆ1æÄ”“\n“İ&Eé´­²^,¥$ÒOo™\n^¦ø1äDù¦op-iqª;êŸ¯B¸_~¯t0Í}Ó¼\rC|®Í>ÌzŸq·ıBÂF÷ZWØ)6_Î)?öVr–à7~GÚ/ğš/ğØwCØw0Û¨w)ûh6\0¹òãŞ6Ïßlcºù¹åÔ&ŸJi|‘a.p_ÊóúóÏI\Záó\"³ÇVëéa\"¡ëè7à\n8ØâÜ¢hŒ÷ƒ×¸|²ı3	‰\rh}‰¾W¦\r”Mh4|Êa´h.Pj Ë³±\r=š$íÿ\0è>8^ÅLô¹Ó—M\\lŞ‚¿IQh#öü=-ÈŞ(~¸_ô|ØşD¾ÀŞsşI¡›(ÙO¶$×gë	£l#yÖ†Ğóü\\9ßTàëğÒ¶SÊª.h	%å»\ZŞ%ÆÛ/¥´›ò†m	¯¶.“f¡§ÙÃ]òâé!VfV—¥än14jG3‡îjœSw{	.¥”áç¤{`\r)×	kõtJ€sìïÁ§\rÜåQT¹=[/,†˜>™ü±šˆš»UÊAöItqêùq!núC”}êâbƒr­tçp·‹s_¹”9ô´—ºCP÷´OÅ5Á~ïH\\¡~ jóï,»Â*šeÁúÑ½äÃ/™NavÄ˜¦’‘øh…™Ã/S<xwBx¦Ö’÷³‚ˆ_8„©k^Pê\Zµ4‹™gûfšñ>“6X´R&ûÙÛÅ…eé“u´’ûTMgC^àP¢¸Í¼\0 Ø+C¸!“}‘½ØF O¤ş%ÁR‡É§J*^AĞ“a\"„¡U°{ãî?ù#·è:—³vˆET?‘(zô°\r\0¢¡\\\\ÙÃ5>ÂóùÎÇŒ‡ßtÍÿ\0ˆÿ\0Ã¶‹˜1½Å¿s¿ªĞ Gìù\'úú^ –,å„ø	E™¡œrÚm‹`xÚ|\n¬õÈĞÂÏS£¥NÈ­ıŠšìªûc¯#ò5r)Ù¿È®fÔù6l1÷e<„ë~–ÄÈrWqvÍB¥Š@Í*P´Ú4‘¸´\"èLo’¶6RŸq´]‰*\\BÙÈk…a«’{r‰‰Ø®â‰7<„Ê#O±E ÛX‰ì¥¢ü\0(ÀÅx#_ˆèO¬®–A¶jĞ†¼=„’*ù s„ÀÜ¾wğ)A_‚7­Rï±ÑÃP‚åè#¢±ok¹£æıoërÜá±àùMÜœÏI‡ÌRáÓb¯–}€¿B*ŞG±7F„šCè¸EÅÙÉPpÔ!Gh‡8w(Bl\\ƒ¢{(¦	´.9øbz+LlO¸7bŠ!V+£A5„ÅGp5y‚ˆBl|¿”9ó¾‚Ç~@˜“\ná1\"©Èò&)è„pxÛò*ßØœ	ÈtGÏòÚ.«Á;.ùh\'¾ùê%o‘VX+›kÈ_Â+/ÚQËÎ©Ap²nqô_ópÑ—ü_$ùCşÂç[+ ÊÍàè;6Ä±Ø’ƒ05Ä+ò0“B\\ÈpŒå4ûLìÜ åõú=x÷\'û(%PƒLÜ\nÀ\\Yz/ì˜ÓmºÇècG(™¡0ĞD6!øÎÇ*ĞÏ¸™GÌO$+¸LE“bgGôAş‡#lLLBE~ƒ2¤mÎåø=p³hœì¿ÌSs\\0¹5Pí°v—ØyC˜wî\'±Ãm»ĞìW65^½mÓH¡·ÜØœöA?bóÀâ‡$-\n—Bz6kà¼b¬=ı	şVÓøcì68+¼oÂ@m\"Ú^ƒ¬àÒBü#ù+•ÌØÈş-\"´•hß+_»|&Î\\­ÌÛ.£÷ÌWmœ5àv\'BüQb~]t^™_$öWŸ+MÑºw´Š¡kœŸ›bq¯°d¨Ôä•á	\rAÑş®Î•ÀİÚ~Ã6vKíWÙVI¯‚¹	!ıªßBXM¶õÕŠów¢Ş90~Åçî?C–îfØáÀÛ™´WpŸ@4Ø¬OÀƒi”_8^Ãù)D}…Ş´ÂğQ6!=‹‘6QÇ\rÉ7Èÿ\0Â#Êmïjà†ùôIÿ\0À™\0Óù¼\rö\Z—ïóÈÿ\0èŠÏ\0¦äw¢\nj€îô†/E£i/¹6 ,Ø_‡ª,FE}}ÿ\0†¯¥´ÆÛ\Z°øê ¾(ïÍ8ZìAvÿ\0ş1¼Óş¶Æ\\b¿’1Ğçü!İT¿İ!ßÜFàwÃ{º,Ÿ?%œ—¶’å\rÒ‚\r‘5Àûx\Z‹Ü9¸Uõ@9L5óÈìŸ!2\'K‚»‰}‡ Jï­şÙ¿š¼\\¥÷d@Ó»7Òc\0Æ(ü²d|IùDhİÙ³ô¥ [c™†uè’^[e3¯hs\rŒ!¡—\noQ³³töQ«Š Û]\rèCbÂ‰\n·ÉJU ¡ÑDR#5	ìoXååviòÂaT8Œ¸Gì3Æı¹ˆBniOä%±Àëú *»\"!PêQÿ\0 ö_`µØ¯1®GWNA>‡N0=Úl=OåNWòçf‡æ5=8\"IÆ qÁÓ€•è½=>¨Àh†ó@ÛĞÄı¿¢—ü§‚h-cŸÒdõŸ¤b³ûì}Œw,Ú#K‡GSû\rlÑpŒKTo·¶=T?âÌÛÚ‡c¶<÷ä´ãûxĞ²’€±|4/húSõ\r&g+¶yÈğæD|‰mß•L{Ë%ÓltàHj“¡_\'å¢,Ó‡f›º~U£vOsÆÓùBLÜT*ŸÂeÜÿ\0İCx\Z.EtèkGBì4R	1åC¢¸&ÆP)J&(™!A!1`»y*ÁkØ-qMc ªO\Z»hf!—¹?¤÷„Q=ap)_a½4‡.¯È‡#X	!†¸¤	\'H\ZPNá5§Àšg¤	›Ê„ä‡®Ó÷cØi¯=€/·À÷zàí	U¨iôÃyÃÙtøì­ô¾\n×‘¦Ø7èö_\"ÕisqKô÷lr|æ¯ÿ\0bt‡·ö(SØ~q0ù!Q¿üA/qœ‡Á¨#N…¨Ú?„Š\"øE ÚÃGMW¬\Z˜O‘óÈÎ&¡qR\r¦<+ÖÇFÒ	ètA2½ã¡1rB3ÁEAääèI\Zó‹¡AÃOxº’•å3¨¡Bš$%Ãc‘­ö×Tú/û9A Ó&†Û,Á>qäWìÈC3@i·Ñ»ş„×#Àh¯9àÇ/Wïİ8ùBƒ_±=4Ïäû^É@ü¦™Äƒ_!Ñm²Ûé¿áeL}m†GÀÿ\0FÊ¹ÈT×´#ôQ¹ğqq>oÑvè‘\rãBá„ˆˆòç#ú& T tQ°Õ\Z\"R¢8¨)X#¡Øû¼eeÊÿ\0âOñÿ\0¢‡õÿ\0%ú‘„şâ!MÀ—ığ_ûßğjÿ\0éÿ\01N‡ô>Çÿ\0V:Å3Æ~XÎ>ïÉ·ú¿‘7Ñâè¿øúOşq¹ïô^ÒØ©vjCú¢†g°A¥èQù0{U6YiäÂŠ…¶¨\r&[C±îBìxÜS	OW?h\Z¦ÏhGĞ\\Bos†™°Oz~ÏïÀm¢øLÉvÁ|o€@ßÒè[khSËÊm„ª%÷è$ş±K‹ôÓ¡ôC”|ÿ\0å†B{ÂçË+ä\r-? C(ßĞ?°a4QH˜ª»_ó‡ÿ\0fkHÿ\0\\\'([æ:?`)‚å·ï“úŸûë?Ûÿ\0â?ô_òƒ‹øgö\'ü5ÿ\0›şü“şúğ:t–¡ÿ\0s›kş¦å_ÑÙÿ\0Ü¿é/û?Û\Z¶úS ş?ù(ÿ\0æ¨{µ\r}ñ¦DÛÿ\0Qÿ\0²Ä¶™‹\'bï8ú†‹‡àw<±:bzÂ˜º>âBLOœ$6àš.Î¹Âéò~\"Q	‰èOAõ¡Dù\r!mÏöH_CŒÌ.~º8°Æã—ôŞÀÏƒäü„×x@¥Š\nÓ})è.¡ğc{Á6	-üUV´ƒj/ö˜;ş¤¶ÿ\0–W»A\ZZëà=†ßÑÇÙş‹ş\'ô¾„í˜Ş*şƒcOıˆM‰8„Á£CÚZ|\\şhıòZ\"•¼¦ h®‡¬|±I†±ªvq…\Z)ÈĞÖ‹1X‡´EC›ÁDI@Şh„ãap\\.KìhRL¸j	«„8›ÁÈ6?°˜Äx¨\'¬} $ÇŸä_ÉBÂÂÂcbrÓˆÄˆ	ÒlG×&á~°Z°iº!¹kÙ‡~h;Qa)Ò©vpiıéŠş-ú|…ÿ\0dUº_<	+Ãà¯q!<áA\\KAYøù*Ï¯¯¢æáÆÜ}Cäe¿÷&&ú\"‹oà+ôÙÖ6pDÖ«û‰âÂÂ*°+¬5³\\1b½ÁıçLv2;Èşã¡räĞXMÌt.D°®G8Mv50šÃî\'£¡•¤)°MçdØ¥Ş?$8a¦?ùà<&ø3M—\rĞ°´(–õ]n‹äöÙ_j—aíIBÂÔœ _0Õpùl|(16HspÕp¥t],¦$û>K¿ôÑÃì_óğsoÀlcG_\Z}Ï0J˜`\"éL_î6&„”âEtØ¦ÑVÏcD ˜lá¡ÙXä{?¡6=6Ù£XàL–)¼®H*i	èÛÁc]\nôh”9DÄIú¹¡BÁ,6nù6&AgE±¢àO¸	P§\'	Ó@M¤Ø½™lvº5½äUà~—±ä^E{›äñp+Ø×Üèjr	¢tŠ{\"ğ%Ø®Ø»AXŞ®tÇ&)æ;M $¦˜..(ŠV)qÀxá¹ùßàâ+ÿ\0€1K ĞÃ/Phº:Âe?¡¶]|ˆş[hœFà6E’xĞÅ†ÅŞU°àõ‡P¼á7¡=‚Ô]\r—Fà›ÓùLaÓG¶œß¡ı–M²äšÂà=g$¾°Ş‚l8ÏíÍ±c…½ÕÙğ6+BÒP&àç¬Ü{È¸<KîÈÒ«GsB×\nœ¸¢z?\0¹\Z!\n&-[E÷F0ŸÊ¢8	¶¶À–‡Œòº¯¹Dôp\\pcó«Ğh+°ûÁÒ*X>_ivNÇYhv\Zı…7¥|\n¿ĞÍE WıÈZkò›n^Æ«oCÙğäIy…/!Á|}»ÿ\0má1Ñá¸0gÊa{\r€Ø˜ƒúi<\0½!/¹-îĞ´&\r8pñJ±ò1ğW¿D’í¶$|)y_„¢APºÕû3SÅ|í%:òU‘u÷P]ŒçÁÌƒ”Ö¶´/ˆå«…</cHy„ËòÙ\09?	\ZâúÜ#SKÃ~\Z ÂÚË±ú7½¢ú#UÓÏBZ++Óz…rü³Æ§[¢+ç©¢µny\\¦43µÔ…Ê·³±á–ê*6é´O¤æhOè{øîlbÑ6Ú]Æ ùï¡WO‘4Än¢M\'ö¡=½Î-œ®Ïâ„ÙŸ¯cÌÀĞ‹tª6ı!À¹Æ×ãGL/ÆPåóâuät«°ì`mÛÒE`´Ù®–Ùp?»q6[µœ:ä	ñàbÅBèuòL§§è‹¬Ävt#	sĞ2ñûG/º»t:`ÛNz×ä„óøÌ•x>	X›×ò¡>èoH{è¶ø¾`Šc&½ƒn)\n¿€5Øë¿àà7ĞÅq~şXşğq_&ŸÔ%‡•ô,ôÅ\nG}a5}È5ìûÒczò?´îÑÅhdvøÙıâùÆ0@»b¿	D˜œ|J/CîÑ?!ËMÒQHo__)¯S\Zê%ØäûœºŞŸÙæóºÅàT,^çÎµ‡\Z©÷b¼úwj¢rİ‘M¾vëcµãÉi¤]]hA¡‰ÄS¥EI¦ü¿Ö\"^Õe± İÏÒÅâ™ÂçŞ*h¥7Ğíìºû@™™\'Ù2¨¦ÓiíLÿ\0rêWŒ„T¥²Îi×Y½ßÙuÒ¶è¶+G¶ßü7èş¡¤ô¹$%Òç^ù4U°yBÉ¢_*ŠÈü^½!ä|ûl‚ƒìàËğ‚$ÿ\0sDlqğwíö?c(Zb=¤×ãİêË9:ç§\n¢\no¥CÀ5[ËbĞÌ,ÔıÔËÓ\ZšEÍÁ‚>Ù³çsÓù6Çz™\\&œ#doêÅ\nœ±\Z¼„ö(?ã\Z´)ëÀx¡gLM¬ºù>â–˜4Ú³Uß‘ò^M¤¸·>ÁIä&Dû\r¤´Zü¸ğŠYa:ıº/\0ùû1ø¬7´ÚgÜ5§û#`ß‹àUíˆà_ğ¯Ôâúc Æyp?Âÿ\0¹Uò%yŸ´Ã:ÏÑö—ôUÃzB¾½ÈúäŸìp#ñÆşÂ¶`u÷\Z–sĞà3¹L4€²^÷†„inÓàn¡{‰.G)\Z!E¾Pnù¦IÌ\rR[†h¸°4^\n…`\\…•ğ(bå7%\"øÏ);rJËiËw’Ù«|1gpx’£×E½·ÿ\0FÔT=>è\rÚÈI•ÛÓì‡	xm(Sƒ‰5\nùº~jïı²üèº|šGonh”~Ø¾Ã\\ë)©;ĞÉ5»J»bî>H¿ØÖŒ×Ê”ò?\\ØŸØÍøvœ¿ch+{t…9¾­en*¿\Z<Ô*cªÃ»ÕTŞ„±“¹%_a~ª´¤ï\'oı)¦şÄæ6ğWU6/î¿öÎ5êıìGfi=ØvP]×ğö9¯ô)ÔyïîTöÛ.¾úö`ş&nàp¥ñG§ÁÕôÅÀ9[ãòoaÒ®_Üm§Úizb{6¼¥›ÿ\0Ñ6´š“õ„õ…ŒwxG2ˆ.^=1Kö\'ìmp}3–)÷0{@á‡r\r½Ñ&Ğ‘96Úíò*#_¡@z®†·Ø+^ÌR¶šòğ	§¦(–ÈJ\r*‚ÂxëêX¥Ï¹6>‡i¢ş(ü‰rÁ‡„Å÷ÄxÄ\"H:)QãÃ:OÎÆªÒUğÜàqb;¢üt/†±KşP>±)ø\'—®ßÙÁ¼~>z4I°]~¤+6¿B´>ëÿ\0…×øĞõ}Ã[ü­nşô=Ù6Ö,SsƒtÖÇÉ9\n¢Bìõ*VÊ 3÷ry9à.í~MÎM\\‘F³^?rf)Yî×ğM=_ˆ+£¼\'…ö­¿H°#vÈä%e×ì£\"\rëDÉÈIKe\\ÇRÛAØ«Ù}…\'2‰ãBCÂmr¹ƒzÅèP£Ëz¢LLb5æĞŠ[ÎïÁûÁ	šÄÆõƒüıGy»\ZÒ\nPÈæ`™|¼!íä-&]/‘´ğØIyh\Z$	8UP¢ôÒ+l1±Â¢`¹(ğŠ]ææ”m<wL3ÉÅ~tt®ö5}HP2ğ“eÃS_ $)§‚i¡ôğŠi…Bò‡®K’t8bÎ‡´ErQAº]g†vQÒ)yÙs¨jr(L›\r¦5¼jE¬6%…*(š˜LB.iELm@ëúŞÍHo‘õàöÓ˜{¨şpXY¹*ÉºìpÅ44Ş½Ò¾@ïä«¡iğUBîŒ{…ê„Øhš¡-rù}‹\n \\\\Ü_¢—,ğ/¶îÇæmÀ¿B±±mÀõühë„¢\n¾Q¿·ÈŒU‚d”LehR›£[9BÂÄÁ­‚A°Ş1$<‡Ö#g[¿$…Nù\r6 ‹Î.Î1À™°ôÁLÑQ}‰ë	”GÜF®1MÌTtjœ¾ã_cU\\.yĞ±¨ö<ö¸’?´\na-·Í_XYW	6UòÙªQ»Øô#dhF \\vaÄÅpáp4Q5\r£4‹Xš{B07¯}Åúµ—4‡\rŒÿ\0Á˜FìÒ°uŒ&±0Şş¨ÄĞ½‡XõF¢öáÈ’é4›;AVåû$4%¼\r±¡	ıı‰6=ƒZ‡\Z\Zv&¢ï˜ÒòÇßp¿ûÁoHgèÕ\Z-ÚG\\ÙÏÀÛr	İ/ØŠ;òIü¡ 6çæxPí)QVrje±Q­a¨«‰ù>Ë“¾ã`:í?ÀÇ+é{46\\hRˆBcX¦Îp@ğ˜³Dø8\n•\"ì\"´ÙÀ¶\'¬PÄ^D#J¿¢ S°¨¡ÄCåJü:±	$QÚaÈ˜x\Zàlª`ºÁ2zbAÖ<aYW¹Ñ[dç	‹ĞO°à‡!=ü¬æaŒ÷#ø!Ÿ+î%·U~C\'î2±q¡ş†ØÓòUÈ?àSz©Ä©},Á>û¥R~ş(Ê+N£ô©WVßÉy9ä—ÁU®%¯\"lŠã‚d_Í­(UJáéAŠ^ıÒÄhçÚE\ZäôZ±ßr¢¯wïM/BÂv†R/¾\0Ê»ºoÜ?[Øúûú~†’-/ÈäÎåòhÙi¿D¢²ùp\\™úí¿%8½Ú¶Í,gÿ\0¾øa‘‹h‚J“±îT$0åØ˜™t/¡p(r(hA–+•V+.03ù\n‹óB(¶ô\'±@—AíÑ\\‡—û\'›€ÏsI¿ ºã\Z.†°xß‡‹`rà“h×û}\nbpDÜ—ZOˆVÀÒœbXOêO1GÓã6áˆôÀ¿$#äsÉûÃ? úQJp §HLİ¼šĞ¯­Z¦9ÄIÛò*p~$iÇÑå÷8e?CX_ÏùX÷Álµq§¿P~ÑT¬¼J/\r£kàtgÌ’:9±‹{Ÿ˜2­¯¡Äh›é7ò‹É§v—±ºŠ”Øœ»W¾P†	uØB«)>-íú%#õKŞ‘‡¤–}Ê]œˆç’Âê¯†Íb]ô×ˆ£-q¦AŠ±›—Ïä×G_[§¢œq\'å\Zóô}±ÑØèªt\'Ş.¼ xäM‘¬r¶.ÊÍaíˆû•ÉEJË£ó‡ÚÃ|@y~ğXDÉãfşŠñÙ~…¬Sœ}ò¸ÂÒäÓ„\r%•Š\\_ª·Âö1ğäÉüêhèwxÇ¡\"ü„p;¸Ài¿’\n\nßÆ•Xºò?Í?ê3öè\n‹î»@:‡J„qˆÁ˜…lO{rEøØÿ\0,›Ú5äk:„Kæ#nMš9á¿6nÎ‹PÍ…ÏxAÑé\r)I¬6pwÆ+o=ğ¸åŒQ1ü‰û¬!=‰¯°ÔÔtş	™¦¹’²X‚ú´j€bäo4.¸X(Ï°i^Ââ†á@½Äîıeš/¡á¨Òèm³d)ôü_„h½€6áq‰„ö3õ€zƒa]…¤1JšÑÌ»\r¨H	•âù\'¡÷7_e6‰\r‰¡µô{Ï,2*(/è-\r,kKBã*Ùp9ÂhUE±p(@–‡Ø¶(2¨DD…\"1s\"·äAö`ÙG~?]eÂßÒ‹,\"áTÂì)º&:ÅXüì.M]ˆòssÑJ9mÇÛğaË>¨òâ5Ä˜×Ğ&Iè„|™H…ÖB,•\nìPOf¦&\'¢*\r®ÂÔª‰€òĞ¸lC)ËÊçv6&²šœâë-¢‰‰ÓRÖ4¡Â;\"c{‹8vM|/à¤HS\rC$À0_İı*ÿ\0\"ä1%sĞ±\rQèI—x‘âaè¥úÑÊ>ã]êL‘°Ÿ¿œRa¿¡~ ~Æğßî*il@Qar	”mø9rQß\'\'±÷¬bâ]•\r†ôÇE\rlF¢	 –ÇÆ6n­±*8(¤Œ¢x¢äbãys&J‡g\"àMR	°àK+	³ƒ÷JÄ/¡aM&òd&úSÈHtª”ªCÆ:éCb­’bU)Kô/¸Ûc\Zì€şÆ¿s4D|è<®J„Ïög‹]´²¶!Ø\ryÃc“õMHì‚¢ˆ8}†:)pã…É\rhØwFÆáÈàA-“…pMšA[Î\'KŒRã~Ar	ãÖ>}CGBTùa\Z¾G@mB{Ç÷ÅôïëX¢8yOc£C_GC\Z.fV˜x(™ssJ,Q‹–Øğ‚º€§Î1ùCWÈn\r±}şĞÑS½¯Ğ®\Z)¢¼4V… Ø‹Â‰•á¨œe+aÇpl6ÙØñ¼:JA”ât+Šno	†ñ±0™P·ÅŞh!—ó8XBQJ\r÷Oä[›>Ùüâ+¢?hoÚ~‡Üÿ\0¹?Ø‹……ş‘flØÔeĞã	ï0šè„(nÜ)qJh}ËÒÃ|ˆ˜ÿ\0P#z-hu_±_0uì1TeÂÁ=aWü\08‰P}Czc¦±E	Ğ¼Ñ[6>ÎŠ5¼É:7kÈÛ¦)¢®Ø=`ÚÄÖğ]ã±ìN,W#ÒÁGyCbàÓ+8Ar,÷Šlrı‡Â¼ÅÄš¡6ÍØQòŸ¶­Š\'£¡Øî‰¿%ö\";ÇÂ)×ÓØ–&³qŞS*Îâå`…T¢ÂáÿÚ\0\0\0\0\0\0”m´’É$˜@ 	mÓm \0$@95\"lÁ	$—Ö½“Il’·ÿ\0ÒHÖÈD´mõ›I&Òmd›I¶’I&É ”oü’Yl‚ @¤Œòï!64A%kl”-·ÿ\0oü“YnŞo¶òXŞóD¼í$Ÿ¶Öm$›I´’Ë&éL‘[/öK*Y\00I$’íêÉ´Ñ\r$M´’I}·ßK½¿Ù¶Û}·ÿ\0ovÚIÒ_}·Ûmô’ı$»Ù¾’ÈÉl6KgÒË\"C4“Ûe–°‰$‘\r4M¤“@ï¶ÛI·ÛK¾Ûmöûm~Û²[í½»K´’m,›I¶ÖHÉ@°6nOöïj¤ m´R%0@\0ÒH–Û$I\0[$R&Ò$€%¼’M¶Ûoÿ\0ßm-›í$²I-¶I¶û@ñ~Öoj\0}ôR¥ˆ$ÒÈ¶ÀI i\"R\0@ 	%4€g´’işÛm÷Ûm$›,’I$–I¶ÛH°}¶Û|Jƒ\0‚RÙd µ.`lN»%¶Á7\"j–ÉÈJlÖÛAø’I¾ÛI¿Ûÿ\0¶ûíşûm$’m$’¶Òh±\0ï¶ÛìŸ\0‚ÒY.d¥*Ğl›o¶Ç¥jRHÉÛìÒAà’K¶ûI¶Ûo÷ÿ\0m¾Ûm,’m,’¶Ò$²doÿ\0ÿ\0ÿ\0ğ€@’I\"	É³I¶Òm¶Ém&Él’Il’I%²I%çû¶ëI&ÛYöÛÿ\0(;m-²Iô²ƒ¾Û$²@ı¿ÿ\0ığ\0À›É ‰l–ÉA²@m¶Ém²Il’@l’Il²[%$»\rÿ\0ëI&ßÉ¿ûmi;}m’I¼–·ÿ\0l–ßı³[¼Ca{I\"›%²[$’[lÛ$Àl’Il–Ól¶Ûl“_şÛI´¶Yd–J\0)m$²Kÿ\0ÒKnßl–ÓíûôKaÉ\"›¥şÉ%¶Ûl\"Ûl@\'²[,–Òl¶Ûl’{ÿ\0ûI´»I-¶JA\rí$–I¶ÒI&û\0”’ï\"Û`h\0RÉ¦»l’Il’I$šI%#K$×Ö@Ğ	4\nI$©\rµ²%–Im¿Ka\0lŸ”²m\"[\0”²ïbË i¥It›H’[l’I%²I%\'Ûl’Ò,’I$I$‰\r&’…%²Ù%¿I(\0|¿\0Ü–ı$Ûl&ÖÉ%›ı¶\0AVI )$¶Û$–É$[m–ÉmËI¶Û%¶Òm²ÉA¶Û$”’É/Ò%²@i‘%¤H\0	H&Ö[´›ï²€	¦rÉğ3%’[$–É$Él“ÀmËI´›%¶Òm²Àaÿ\0ÿ\0$”²I.Ò§²` l JH)I$–[-¿ï²A(”[I\"[$–É–Û	k[’M4Ûy\0‚i§·ÖI.Ò$’R(‘RH@Û`ƒ(\0Ú\0)\0I$’KmŸÿ\0ò(”[Ib[$’I$’I\"[°$’\0‚I%·ÒK$›.R(‘vJ$€š@(\0È@  \0!´Öm.öÿ\0¶Y,–RÉ H¶Ûm¶Û.–V–ÒI²Qm\"[m¶ÉM¤›î;M\0\0\0\0$Òm¤’I¤$dÒí\'òmòƒ —VÉ$	A¶Ûm¶Û,\0–ÒI³Ql’[m¶ÉM¤›lI	\0’\0$¶ši&›I&\02 ¶ÒIm¿ÿ\0´€!¥RÉ [	&Û$’I°Id\0\0‰\0’I$’IM¶ö\0Œ´	’D²\0I$$Ò@\0’@\0\0öÒÛm»ÿ\0´€!¥RK`R@_¤–Ò¼Í$Ñ2€•ŸóM$’i]şò4È´)²\0\04’@\0’@\0\0$¶Ûe»Û&Rd·òş‰$’I%²V´›I¦Ûlò@,”‰%¶Ûm$šl—á` 	€„€\n@$’@$BI{$²ËmŸI&$²rì‰$–É%²R 	\0É$’I$	$’@}¤›LÖÀ@ \rD€@4’@$BI\0e‡öÙôŸÛ&B`“{I²š$–À$\r!¦‰$Ûe¶Ûl’I%$’$‰\0–Ò\0ß4D²JFÀ’@\0	$–Òe†öI½¿[Âd’WK²–$–À$Ûm§	$–Ûe²Ù,ßû\'´›e‰\0¾Û\0\0û¦’ÈÀ\0›@\0\0	$–ÒAşöËm»Z’D•’JÛ|’I$i-¶`¤’inšÍ7»M$—ûl&Ä$úIÈÛn\nRI&àJFé 	m¶Û¶öÙdŸÚ’”²JÛd’I% uş`$\rì’Í7ûi¤Ÿûl.À¤²IHÛìBrXÀHÉ 	m¶Ûmô²¶ØR!¥›ÉÛ‚I$’@$Ÿé´“I$’ml’D%÷ûï²R¤˜\r¦ûm&Ä\0\0J\0I$›m$’ı²\0M¶ÚPE¶ûKÛ Id–Ä$–Í$’i$šMnÓI%—ÛorV$	1¦Ûm&À€Ğ\0H\0I$›m$’5±\0Ùi\0ÉÖH›ï¶Ò0´“ß¦ši%³i%²`$š[}&ä¤)!&ÉüL„`I%’I$’I$’%ğ\0Û`É@òH„ÛıöÒ ô“–Û¦ÒI%²m5ò@6’[}/Ä$‘9&ÉlL¤ I$²I$’I,€}a\0’€(—ÿ\0H†ûm¶Àm¾Àh–ÛnÒIlšI4šI$’r5”¨$²IH–ß$ \0ĞI´’I&À$’I}( ’I€–òH†Ûí¶Àı¶Èhßü’I~ÖÉ4šI¦ÓR%¨¤²Il–Û¤\0\0\0˜\0I´’I&À$›[$H\0\ndµ‚Y%´–Ê¦Òm²I$Ú@$’Iì’I$ÓM€–À¥²[¥”2A0Él&Û€E’’I$’l’aoşû$ `¥‚%¼»Ê®ÛH–Ûl’Àm²I$Úm$›I\0Şé%b¥%e0É$&ß¶’I$’l’I§÷Û\0	 6	€J@´’lÛm¶Él–Û$I$°‰|‚@lšI¥\"i¤\0–è–[Y% É$’I$’$–ÛMöûA¤I$Ê@µ–lÛ$’I$’I\0I$°‰l‚@l›I&m6›“Ì”ÛKe€I$’I$’$Ûí¶ÛH	$’I$\0•’I6ÒHl’IHòyl†ßígÛ}&Û$”‰î‘H‚I$”S\0\0\0$’m&É%·ûm6ßX@\0€@\0\0R\r,’I6ÒHl’Ml²Yl‚_7&ÿ\0}&Ò5õ‰¤II0S\0$’m&É%ôÛm¶ÛX\0\0\0$‘ X\r›IÛlÖ@}²R%\'ûi¶Ûı¶ÿ\0o&û~š{Y&Úì[B\0H$’I&É%¶šÍ¶ÛÊ\0\0‚I\0‘\0Ø›Éûn–Àı²V%\'ßk¶Ûm·Û}.Ûl’_ï¶^|†Û(B€\0$’I&É%¶ßm¶Û! ’I\0 š%?Û}Ûµ k·ÒbM4ÒIm²M$’_4”lÒlÒ(\0¤\0I$’I\"ImöÛm¶Ûi$I$\0Š$ß}Û$\0!¶À\0’I%²Id’I,’K$”‰$^|Ò€$@I$’I\"Moöÿ\0}¶Ûş™-’I$ ‰ M²mÛl„,–Ém¶Ù%´$’I,–Ù$’Il–Ÿl(LÈ¦\0\0I$’I¶É¶ûm¶ÛüÑ-’A$$‰ E’İÛ$”$’I$’I$$’I$’Y%²I$’›ì\0jH¤\0I$’I¶Émöûm¶ÛşÒi0M¶%–Ùo° l	–É.àIöÿ\0°[ü›§°@\0R\"JH@d’I&Éo¾ÛÍ¶Ûü“I$E¶”‹%’IP6m°\0ì”‰–É%\'ÉI¶Ûmô›K,‰í°D\0R	2XX\0\0$’I&ÉoşÛm¶Û¤šI$¶°K–öÈólIe°	!’I$’Rl–I%²A%Il–ÉR„ÒY!\0$’I²Iı¶Ûm¶Û6ÚI$Ô’²ßÖH[mÉe´‰3’[m&Òl–I$’A%·Û$–I[„ÒÉ $’I²IışÛm¶Û6Ûmÿ\0l€²\nl¢²I$’I@\0\0!’I$[$°l’k$›\"l’I$Èï \0’m²Iÿ\0öÛm¶Û´›mıl€¢l†¶Éì¶ÉH\0\0¡¾Iì_l³[&Ó{$©Ib›^’I%0ˆí 6\0’m²I}şÛm¶Û6›m¥ı °% Ğ°9­¾ÉmIm²@nÛì\0	&—Éµõ’\nI²@&Ûmd \0’m²Mm·Ûm¶Û4Óm§ı€¨$H2H°)$’I%É$’@$I$\0	m·É$\0I\n\04Ûm, \0’m²I}¿ûm¶Û·ûm¶v!0mm’²IAÛ$²[l’[l”	m¶Ê%–Ém\"Ao\0	„ûm\"‹Id’\0’I¶É$¥¶Û·óm6r¡0m$²°	H’I$²I$šIl”	,’H$—É$Ó\'d‰\"Òm²™Yd–\0’I¶É$ŸŞ%öß·ÿ\0Íÿ\0kv$h\n\'ÒA·Ò²Ih|²€–Á°%´ÒA¶Û$É÷Í5 IdšÉ´¶\0\0\0I´“$ÿ\0oöÛ·öÉÿ\0kv$ gòA¶Ò²[k4’l–ÓM°%ôÒC¾ÛmoÉ“¶‰% I$˜K´’\0\0\0I´›4–ÿ\0íÿ\0û´ÚMlM¶ ”\0m÷ö-°²I$–ĞlR%²É–Él&òl’[ \0jRL›Kd²\0\0\0I$›Lš[ÿ\0¶ß´“MìM¶ ”%&Ö%¶“!¶É$’À\0@$–m’Ûl&ÒH’[`\0èRL›Yd’\0\0I$›lš[öŸ¤ÚI\0Dº`\n“ ´ÀI¶[$–I\0’I$‰ I}´€$–É–Ëm°–ÙI$€$\0\0$›m²Mm¾Ÿ¦šm\0¿À“i2’@¶I$–Ûe¶Él	 ’Imô’í²Iˆ’[m±\0–ÙIe 4\0\0$›m²IíşÛ¤’Dm¿@„%$‰$“À%’{$–ÒI³_í°\"[’I4–Ài¶ÛÉ´iFÉ	.ÒH\0\0\0’I¶û$Û´Úd“m¿„’fÈ\0“Û%²[$–ÒI²[m´’\"[$’I$–Äi¶ÛI°MÉ	&ÒÈ@\0\0’I¶Û$–û¶	$’I\0&%-¤%&É\0\0e&ÉI\"I\0@Y(m ’}¶Ûm&Û}²\ZH²Yl–$€\0\0\0I$›$’I4I$’6\0$%$„¥\nIl’e¶Ûm²I€\0\rI } ’möÛm¶Ûm°H²Yd’$€\0\0\0I$›$’I¤’\0	H¤\0Hà\0’Û%\"@H’II²KX›I$’É$›m´›M&Ûm$š4–Ñ¶ûI,€\0\0\0I$’I²@\0D€\0-ÈälÄ –Ò\"@HÒ[I°H›I$›I$‰mµ›]&Û$š$–ÑöÛI$ \0\0\0I$’I²@’@ “jIdĞ$Ñ\r&ÖI \0!ùH”I&ÒI&RI$€I$’I¶Ûm ’%´YşÛH‰\0\0\0I$’I \0’I\0ƒkId’[\0-¶ÒI \0!0[l”‘I&ÒI&RI$€K$’I÷Ûm ’%¶ĞöûX‰\0\0\0I$’I \06I$‘÷Û\0\"Û!¡´Í&—1¶›|’SY$–H–¿I$’‰&RI´Ÿm lÙI÷ßI&É\0\0\0’I$’¦I¶Û\0¶ !´í&“!şÉlÓWK$–HÖ»I%’FRY´›m ;lÙYşÛÉ&É\0\0\0’I$’~Ó{íÿ\0û\0’I)?!›m¶ûY´›%6›í´’XßY+[&é%¶Ûm°RK¢[]$›m$€\0\0&Òm¶Òîš[möû\0’PI(\Z»m·ûÉ¾Û}5›í´’H–ÛI*[&É\'¶ßm°RH‚[Md›m$€\0\0&Òm¶Òo¾ßÿ\0÷Ó,–%$¶¸\0 –Ğ\0% 	l–À%’I%²B m²Im RìÛofÛíöÀ\0\0\0¶Òm¶ÛmşÛÿ\0÷ñlÔ‰!,¶ğH–Ğ\0”ˆ% ‰l–À%’I$\0\0l’Io$RH2ÛmnßoöÀ\0\0\0¶Òm¶Ûòo÷ùH€l¶fÀ%°I \0%&%&À%²	HI$\0	$QYòH€’o$¿I´ \0\0$	%¶Ûï»ï·ùH–’,’…&Ğ$I \0$›%&Òl²	\"M$`\rlAI²HÈ›ol›Ù´€€\0$	%¶Ûm¾ÛışÑ	”\0\'\'Ö&Ó%²KI&Äl–àHRì²m%òm¶É&É&†I ,¿I¶Ò$\0\0$’I%¶Ò}¾ûï¶ñ\0%d’\r&Óm²KI.àl–àHrlºi4’m¾É$í$‚É\"RdŸI¿Ò&\0\0$’I%¾Ò÷Û÷ë) €Y,²‰²IH€\0ÉH\"@$_\0·ÖiòrZ’II Éé$_ìMd²m¶û&€\0šI4–Òoÿ\0ÿ\0ÿ\0ÿ\0ÉM$\0[.ò	²I¶ÉHÛH\"@$[¶Ói²RÚ’IHMi$[l\0Ge¶}·ß$€’šI&–Ò}·ÿ\0ı÷È¢\0[gò(’@\0€I&Û$–Û$—m}¶ÒmfÒm·Û\0’@BVí0@+´Ÿm·ÿ\0m%¤Ğ ¤’Rıöû}öÈ @Ygö(’PJ\0\0\0[$’[$–Éo÷Òo&Òm¶ûšRÈVI @e|»¿Ûm-€\0\0¤’R~ßÛmÿ\0Ãd„€fÉ’[M¦Ûm·Ûl‰múiıt›nÛÙ÷Ôo´‰I$\0#nÿ\0m·öí%’ÈI¦’@üÖÿ\0¶Ãd€€ƒ&éM¦ÛY¶Ûmœ‰ıºIo6Öm¿ßK¶Ğí´‰I&R\0\0’fßı¿öı%²XM&’DK¶ßışÃ0’ÈßI\"Rl\0\0l”‰%¶ÍI²Io¶Öm´›é¶Ò \'\"ZÙĞ\ZenßmşÛ}e€H\0\r$’DÉÿ\0Ûm¿Ã\0¤’Zÿ\0iøK$€|”‰$ÉIóIm¶Òm¶ßi²rü@¥²WÉ°\Zegûı¿ßm%€JH	6“@å¿ßí¾À RK$’odÓ%6ÉlÖßI %¶è\0–ÓY´»]$–4	X@I$’$\0;ı·ÿ\0}/ÒIfälÓIg¶Ûo¶Á!&[Il–m$“2Il–ÉH\0\0%öÀ´–É´›O¥š,\rHPI$’$@ÿ\0¶ßï&ÒI\'àl’MÿÄ\0\0\0\0\0\0\0\0\0\0\0 01@P!`AÿÚ\0?Eé˜O\n$$uccb_£dqæ™rŠP_±\Z\\Ò”¼\"ØØ„Ræ—Z]RÄ†)JQ1=ĞˆMXc°³K­)KšR—ÂÇÇİcfÂ‚		bÆÆÉ2‚e1<¶0—„B„Ræ—Z]aF2\r”¥(„÷B!5l¬iu¥)sJRøXøÜk(^g/²c!5!5„\'¢–—ÊÇá„Ì\'½‰Pğ…áq´/²c!3XRë	½/†–—ÊÇá„Ì\'½@Ÿ¥öR”º±”¥(˜™J67ŠRå12—ZR”¥î,\rŒ¥Í)J1áºÒ”¥(ØÙKºSùíAøĞ°Z_e)K«JR‰‰”¢m‰f—)‰”ºÒ”¥)ŠÂ±\"—4¥)ş4ºÒ”¥(ØÙKºPŸÏQ/\ZlxuÖ2<Ò±æ—)‰ê1ğ±îØûáHK–”¥û¬b‰xĞ³cÃ®°™¥óK”ÄõøXóKš%Â—-)K÷Xñ^4.ğc,c)ulo4»Òë	Ç	Ç	ä&RåìãBï1âÆ=öÆóK½.°œpœp8R—(_ÅIğyü¬{ÒøÓõ(–´¿ué>	¼Œ~V=ï‘1?J‹Z_’”`òa±12—-æÒ…Ë	˜Ma7Bòñ„)ua¾kü/˜<›)rØØØŞa=(\\t¤&a5„İcËÆı?ua¾¹KÇBÄ•rÒøĞ¾˜ÇÊ4¼t!†Á{Ê^:\\ÒğÒøĞ¾˜Ç–cñÖ^8N„á¥åøßCÖŒcÊËr~:ÃÁáÇ	Âœ4¼£èzÂqŒyBùŠRˆ^;ëZ)ull¥òÒ”¼-İ³KÊ„!n„1å}A²”Bñß[iull¥/’”¥Ş”N‰]P³KÊ„!n„1å}HuãZİD!v2B)xéF<±ïBYcË:¨D …–1(_-^5­ÔB·cì„Š^:Q,{Â‚XòÇÎ…ª!eŒcÊËgQŒBñè?…ˆhk0™„OXN\ZŠ²˜Ÿ/à™Bùo1Ç¯àÿ\0¼l~!¡¬Âfh|qk	ÃK”ÄÊ^6xBùo?¨Æt;rQF÷LOZ\\Ñ±cöÒˆD&a„³	»C5âÇâõÎ‡nJİ1=irØØ„1ûiD\"0‚BY„İ¡¿à=0Îša5cç„!8iuü?>[+øL3¦˜MXùáN\Z]i~[+ø\'QŒqóK«ÆßË¥çBÕGŠş	ÔclÒêÇ¹±¾:_}/:¨Z<WßBÁicí\r		p°Âa1Û	Î…ª[Á}ô,–1îĞĞ—!fc½°œèZ¡e±à»ûèX®‡‘p±øÆ†„\"ãÒ‰‰óßBÅ\"ácñŒhB!>=(˜Ÿ1ıõªÏĞ<Ò‘“šzPµ¥Í/\Zbe(Æ!kĞí÷Ö«?aş8XóJÈNXOJ´¹¥ãLL¥Ä-z¿ƒ\'‘kK–Æü¿‡ç&¯¡åÃóT-_CÑÛâ¯q<‹Z\\¶7å¥)xa5},|l{Òê…«èz;Yş<RğVa†…z]á3	ªèB[á˜Ä/¼XØãÅ/fÁNØ·¥Ş0š¡n„!e±±pLbŞx<!nÇçcÕÃKËBe…EpyBø+ÚğxBİÇtcÕÃKËBe…D°yBû}±Xÿ\0NƒÂî\'»cz¡j„1”¿-1<¡jØØô!}¾Ø¬§Aáwbİ±ê…ªÆRüµDò…«ccĞ…ôXø{b´±ˆ\\ğP¾ÕV†„(_E‡¶+K…Á_à!h…«CB	”/¿è6P²„1ŒyBôÒëKÊ…šR—…T,Òå±¼¡|î·àÙBÊÆ1åÓK­)KÆ…šR—…T,Òå(_thhéÇüÈ\\06<Âs¡f\"ÅŒBû£C\\€ÇæBá„ñ±÷˜Nt,ÂdX±ˆ_tc:²…çBò…ÃKÃKçcåXÂ_uc:²…ç]ˆcÊ\r/\r/•c.Å÷ş‡l¡yá>jKªiJ\\Ò¯àş‡l¡yá>jÃeÕ4¥.Oßº…¨çnXMi}0œ(\\èY„ã„Õí¡h±†ıå„Ö—Ó	Â…Î…˜N8MXşïs Ø9D/8!zÒêÇØÇš]ØóKñ4wè0Ã‰şˆ\\çnÇ­.¬}Œy¥İ4¿\rD‡ö¨X-Å.iu‚Cbb|ğ‚BY„áBç¥Ş”¥)JQŒBòÆ3¨Ãûd,â—4º ‹˜Ÿ< ‘3	Â…ÃKšR—{ŠR—/¡ˆCXÇ‹í(BÎ³	í¥á¥Õ¥ò¡s±ı÷Š³¬Â{ixiuB)|¨\\ì}¼XØØâe.isK­/µŒBá¥çBİ(Yllcû¨]âÆÆÇ)sKš]i_µŒBá¥çBİ(Ylxu±0Ã`¸Ğµ¥á¥Ö”¥ğÒùix‰Œeş±Fl\Z´¼4ºÒ”¾\Z_-/(ÆRÿ\0X°hh„İ¡­aNxLÂxi|,|hCè_p±`ĞÑ	»CZÂœğ™„ğÒøXøĞ†=Ğ¾öÙ¥İŒ¥Ë…ÆØŞiuc)~Zô¥(…öşƒè­ØÊ\\±ˆ\\méK«KòĞ·¥ÊÙ(ô!nÇ¬dÕc¹XùP½è\\h_dı?G¡v=a5BÄ.V>T/z\Z×í±h‚$,¡×:*]Xûú(YBõBúı¶Ğ‚$,¦?:*]XÊ_…”!T/ª…ªü,±æ†—t/l\'–ziD/¶…ªãî…–<Òæ—Z]Ğ½°ZQé¥¾ïc¡K‚~ˆBì~±ô?+yc#&P³1ˆD\'Ùìt)qQBİÖ!s¾‡åcï,d&P³1ˆD\'×B;4±ˆõcóÂo	Êó®ZR”¥ÊB[Â0…õPÇM/±ˆõcóÂo	Êó®ZR”¥ÊB[Â0…õĞML|,|4¥)KÂ„1æ—V<ÂjÇ¬!	½(„1ê»…Ã\n!}d š˜øXøiJR—…cÍ.¬y„Õ!!XBzQcÕv!…¡±ë,Œc	Œd&«±|°Ÿ4¼0œ(ZÒ‘ˆCìF1„ÇĞû!5]ˆcå„øp™¥á„áBÖ”BBÃúä,ŞD!2—v<Âeb…¬\'\r(…Ê„B…—z^ú¨Y¼ˆhe.ìy„ÊÅXN\ZQ•„E/.ô¢àQ!!/…Ê…’Br´4BfŒŒ„!MXz¡5cñÂeô=a8ér–ì%•(\'+CD&b!B„&¬=Pš±øá2ú°œ¥ÊDİë¼P„Ç¹)JR—4¹ŠQ–”LLcìoZQ1>!¡¬¦\'–=P†>6?®ñBxÑ?2R”¥.iFB)D.ZQ11ŒLOvÆÊ\\Ò‰‰ğ¡\r\r¢bycÕcãcù?ÿÄ\0\0\0\0\0\0\0\0\0\0\0 01@P!`AÿÚ\0?Jy[ƒÉ{â„)s½ä„İÇKå„á¥Ì ´¾M(ÔWÀƒGlPh¥!v?/–\".\Z\\ÂIäÒùXÇ¥ÁÔ¥çcş£·ÌByXúr—%KÎÇü)Ûæ!!ÂÇ‹ï)ú\'àÇºü!B›¤%˜B„!„ˆB„ÏB„!	’„!5A¡®#ù¨C…ŞPOÁt\"—XB„!7H™„!BHH„!ˆŠR„!BÔ!5A¡®#ùì~™ˆX!wŠD&R\Z\Zá„Õ!/\r(˜™K­.¬yBû¡Â³11îñ]ˆ„ÊBCC\\„Õ!/\r(˜™K­.¬yBû‚AÂ³±a×Á{iJQv.††³J~œ´¢[Ô^\Z]iJ]ØõBù;ƒ…ebÃ®ï»ÖÆÊRˆCCY¥)yiD.·¥á¥Ö”¥İT/“±ûå‡Q|–<Âf„!5„³Be¬Âf®,±ÿ\0Ë¢ø,y„Ä!BšBY„!	„.³	˜N4.¸P²ÇüZtÎ…Šá¡®q–”ü*ñ¶7åBü¤\'œéÃC\\â-)KãloÊ„.+ùHMT/a±¿Á+Xcİ¥ËCD\'&a8a2Æ!ÍBÑd!ı…álq±±1E†=ĞÓ÷hh„ã„Ì\'&XÄ!y¨Z=Ğ‡üx±‹\rat-[)JR”ll¥)DÄ÷„&”¹c³	çL}Ğ…üx±‹\rat,Ò”¥)J66R”¢b{Ä~kK–1?‡ç1ŞèBùÆ¢xÛğq±½F=ĞŠ_nÆÊ^,>v?\nÆ?™Iãl[©t/&[±ñ¡xXü(CşdÇéZX÷BĞÑBd„!L‰	o	ËJByéwLO÷ÇÑß+CèZ¡L„!B		o	ËJByéwLLCÅ|µƒğ½Vığc)WJR”¥)K½)JRæ”¥Í)J&&1”¢by¥)sJR”¾‚ùÒÁø^óØ_ÁŒ¥ác+)JR•”¥Ş”¥)sJRæ”¥CÊby¥)sJR”¾‚ùÓÁÂÃGc¦Xö[ÂpÂqÂš±ñÂœ4¼-ì†üæŞ~0ß¢Øé–=¶„á„ã„!5cã„!<mîã_:7…ŒêwÊ~‹ùÂ…½.isJ67–†²…ÎÆ!~=Øò…”.t\'¸oÂÆt;åEüáBŞ—4¹¥ËCYBçc†?ìyBÊ:ç±GŞWôOÎ$-\Z\Z!B„!Acú,b—ğyŞSôéÄ…£CD!B„!!EŒBú1ÄğbŸ§ùÂ…Ê„1êÇôXò˜ŸÑØüO!	úOÎ.T!V?¢Ç”Äÿ\0„Ş„t?Ş.4/l\'<&¬{±ğÇÂ?CÒ‡ûÂ…Æ…í„ç„Õv>øøO:Ì…‡Qp¡oJˆB”¥)FÆóJRæ”¥ã¥ñ¡ef<!¸/ŠÂzVd,:‹…z\\ô¥)J67šR—4¥//,{1á¥Á|VÖb‹¸>-aB0„!B„!B‚ÇÂ…å„ËÇšŠ!\r…‡^\"°„!B„!B„!B‘ˆC\n–,ciD/àÅDğ_Ó ÈOÇªD&¨CÇ˜ˆBfÏ	ÂĞĞÆBY/ïK3 ÈOÇª	ªÆ1æ„Ì\'…¡¡Œ„²,_Üx66vÄ¸¿‡cÕBì¿‚màÙNØ—ğìz¡C	ƒû·‹ø-bÅ.èZÒ”¥(ØÙK˜B”¥!\nR”ll¥)u¥Öå¼Ò”ºÒ”¥.¬z¡]Ÿ}xLLÒî…­)JR”ºô¥.zR”ll¥)J\\ÒêØŞXûÍ)K­)JRêÇª…ÙK÷O®\nÇº°™²ĞÑú~˜d!B		\r\r‚BY„!L´4Behh„!5„İt/¾}pV=Ğµ„È…–†ˆLŒd& ĞÖD„³B™ƒD!0„44BšBv2—T/àXAvuËèBÁ„óÂjÇ«Ç”-PŸw!Ó,{¡_Ï	«¬cPµB}ó§Et-ôÄÊQ[JQcÏJRíĞ„1åŒ¥ÊÇš^Qt-ï:L{¡k&&RˆBÓJRˆCĞÙRŸ§é	¥CXÊ\\¡y¥å÷BĞşç¾àÇ”,¡b„ –xL>3Ú\ZÉBjBC&xˆˆNMRİZ]/¿¹ï¸1å(Y„D ‘JBf—…¡¢¢¢„Ô„†<Ò„\'&©v=h˜³}ıÇmÂ—t,¶6&&R”¹)uü?\nR—4¥.iJR¥)JR”¥Í.iJR—ZR”lo,Ã.ûÅ.èYllLO%.J]iJR—4¥.iJ\\ô¥)JR”¸e.iJR—ZR”lo,ÁŒy¤.…ı\'ç;CY„!Bx±”¤ –a¬cce)B\r\r‚BY„Ö„!3BjÇº‚{éJ_;øbBôŸœí\rf„É<XõÄ„¸F1—ŸB\r\r‚BY„&„!	˜BV=Ğ„ßJRùØöK‰ã1îÇËJRñ±ğ¿´cÚ.$/ŒÇ»-)JøØø_Ú1âÄ!Rî…˜LÒæ”¥)J\\¶6R”¥)JR”¢bzK—,{Òê…–10ƒûF<X„I¥İ0™¥ÏéYJR”LXll¥)J\\”¥&\'¡”¤!K–=ÿ\0OİP²Æ!fcáhõ|l…šQ±²,d&RÌ ĞÑ	¨Bš¶!	…MáL„DBBC	»ìyBŞşÃÔ\\l…šQ±²,d!0–a†ˆB$!M(‘	”&ğ„!B‚BC	»ìyBŞşÉ²Gc¨¸Ä.³	«è|ô¿<cÚòÇĞşÃcdÇQqˆ]fWĞùé~xÇµå¡ıµªâ!f”¥)D2—(ZÒê„R”¥/\n[¡yØøV,iBÁê¸ˆY¥Í(†RåZ]PŠR”¥áBët/;\nÅë¼¨XK‰BëXLÂœº^š_xò/®ò¡a.$!­a3BoKª^š_xò/³cì¢~‹‰ÓK”ÄùXøa<¬|+îv<Õr„ùXøa<¬|+í}Ã?DüÍ.èZ±ğÒëK–2—–•¥ùØõ¥ËÙt;}“ôOÌÒî…«\r.´¹cç„åB)GĞùØõ¥ËÙtÅã±Ó}Ë	álo…4ºÒ”¼lÁºbñØéÆ„>‡åˆ‹ÂØß\niu¥)xØÿ\0‡h:“…0‚A¡JRåll¥)sK–ÆÄÄòÃg¥Lc)JR”LLaŠ\\õ—~²ˆZ¤.ì}¨A	Â…˜AKúR”¹B)J\\Ò‹\r‰‰å°„)GC)JR”LOÊRxB”BÕ»ßgì~E/\nâ([Â<…)K­)JB™„!B$!$$Bf„!„µcÕcûö~ÇäRğ¡kŞ„Âğ™!9øB0„!Bd„!„ˆLÂ„ –¬z¡jyÂë,{¡oKˆ$&!nisKšR—V2¢”«4¹Bá¥äcÙ¬ô;}g™ì.²Çºô¹hlBİ¡¼Òæ—4¥.¬e)Kš\\¡pÒò1ì…Öz¾«²ş~q¡f”q2”¥Í)JRæ—,zÒåËJR”¹¥àcşÇ¬¿£ë4£‰”¥.iJR—4¹cÖ—(^ZR”¥Í(˜Ÿğrç¡¹hh„!B„!L®ÄB™„!>\'…ûÏB+.Z\Z!B„!B+±„&aO‡	áA~L\'\ZÎ°‡ûÃ!b•¡®NXN6=Ğ¶cÂï¯•„ãYÖĞÿ\0xa!ŒBò´5Ã	Ë8Ø÷BÙ[¾¾µkgà/Ö´¼p™¥)J\\Òæ”¥)~\r.µZ^7Ğõ¿¨ú³ğª^|¥)J\\Òæ”¥)~\r.´ºÒñ¾‡­üf>V<eü±uäHK4º®Å˜LÂd\'!<­ñÒ¡¡®1²—á±ò±à†üô]yÍ.«±f0ƒd\'\'•±²—†”hkŒc)~ÿÄ\0(\0\0\0\0\0\0\0q0¡\0 @PÁ1!`AQa±p‘ÿÚ\0\0?K—çşsƒƒƒ¯ç—^Íc/*2\'Åİ¬†Ş;\'w¿ÙíOó{ú,¯ZÌÅ¨|R*â7œY¥æ5ÂĞ,ı9bÒœ?ñh:ëÂ>p-\\ZQkM”;T•DŒ½Qn\ré›¡º[Å7–-UYüÿ\0ãÚ»yÌZ®-8µ_29ÎËÿ\0ÿ\0ø£ÆCÆtÎÒÆËKæ_p4Î·±?üÎfò‹[]¿KóÔfñÌkcÿ\0[Ş§‹@´Hçò£‹J-aóø´…§ç#°ñÒĞçQ£	gêk©âş[\'÷şr‹@µşï/û_Å¥:1j>µ¾tñÊ-SûÖ?äğ´çV4gGµvşPsŸìîûÑ×ÿ\0ÕçÁŸ\Z3ëÛˆ3‚HÆ¥¡˜\"Øœ_?mºsìÚ…­ ¾«c±;k—çoäÙ8¬÷±\0¨8Y·œRİjÊ\rë»7¿šÿ\0íEş™À´k,Y/¯œ\Zşıâ;R¦¿¿ğÜ¸^ßÖ°püşƒ*¾üÎ ş<4³ÿ\0Úkn’I~ûñfÃ®‰ó_„*UX›ŒQğRö-ÒœÅ§9g·ÿ\0OŸÅ©üZ|ó)??»›©”Éÿ\0û7ûÍêy›à«gõıÿ\0Ö´¼U~ÃœŞØßÅ©ç¿ïœ¨´\"Äéáù©ÿ\0ö÷\ry|r?üã¿ÿ\0-7P÷âŸüçıàQøØ´k!hWÿ\0ş;u>}¨r>~§ø´AÌYOûÀ´@´âĞ-G¸µ<Z©Î7F×çÅñkwáMèñ½>ùJ87\Z‰<GsÇ0ÌV}×=åÿ\0Ç5§¢gÇïGæ;™È«7Ÿ¾NŒš¤n„#§ù#y³²ÎïÃ;ßÎ_hg—Í_¹àgÜOÿ\0ÌLJœ}Å‘ï4ÜŞÙ9né(~NğvÉø`æ–OÜğ²İPÊš[‰ñísÚÉ˜ï¹ÜgŸÂÙÖååÿ\0£¤ßØòS\\W”ÜTl?Ç?µÊ‘°ïê™Kõ×\n§Í÷\0üQkW»²Ò¤ñC“’™\nÛæÜ?•ÁáÁ—ºÒ•|¿õ37ßÆ®9ÿ\0¨öÖ&å<l‡ÉIùÕtÁƒÊSš<å;_ÿ\0œÏó€Ô@ßÊşÅ’çşynÅ|~ŞoÏİ1}öòE‘	£à~mÃ®@ïfçL‡pŒ=nÑìÔØï’’Ex>~âş«¬L>ıXyUñ»ëJ0}•-rq^lÌK9ÑçÚê*ëÈ¢ùÚs\rv…<R%<OJï.ûËµıL÷<ÛĞ¯xb°Şêæ‹1{‡¦âÓıÎûâ½@İìœÎşÒRıUî°RyÌä-Dç²ø´@µÇıKüZ“ş·4+}>í©G7½–üÿ\0òİáGî ¼;ıóæ÷­â·\"òp³4eşe÷Wşš¿%nÃê>¬1½10Gx“Ÿ.ˆrìMì1Á\Z·v[é$xäMÍ/9‹HZg<äs9N½y#ép_<KåâÔqXŞş}hfyWÿ\0çâÃºEMï:Jÿ\0ù¼ïõóµ¿·~ã1ß4zqı«ÿ\0ÂÖ÷şîªxµ1iY‡Çÿ\0JîÎûW7ÌgÛÔ¥&”sM4ß²±º•Û=¸h½xõÚ¿Õ!¿ˆÁÿ\0Tö Kz/ÌEî\Zu‰¡—W±-h×Lg~\rdòË£D8eÑócğCAøÿ\0uÓtÖ—xm@`\0ï‹bhêLt~.iÁ2éœQBŸõò8rIÑ:ùÁ£ÿ\05ş-Ğ-Ö‹t6Æ¾vA|[ÏN8½û§îğQa;!b‚R›¬¨ÜßàßªĞcfÔı¢cN‰xKä^¦âìg$,BÜÄÿ\0\\Æw‹©¬ñEe&Ûp?*	»übìŸ{.ñÈùÚ\'51doÁæàœÕü§´4öÈµPù*YĞm<Hx³ØÒ\\nù\rë“¯êI›cn<|Ùª½û0-–ë`ïğ[\0ÔÏn´?Êÿ\0ÿ\0`f¿ÿ\0‹+‹KOß½‰Ÿ0ÇL?øï‘wøÁê¯¥oâvXDïÉu¾|S¿Á7y÷mÂºâ-¾“5ğ7¨»`F¯Ş<ßÒ,Ù\nŞ\06ƒvÀÜç¶Öq·˜ƒøÃëwó¶`š½ÆıÙeÍ%ñ_o r²Û¿Oãpİ™Bvº¡ïÎÌzíÉÒ˜OóÌ.t¯ã›¯3ó!£ììÆäaJßQ¨ta:¼òÏ]úO«ùÊ-O£8œZ¿4¿‹WE‘T3Ä·ÿ\0{Ÿ°´ÛÇş|eïx‡¨’¦ÙW8cÆ	‚ÊàxÜu÷ï†øğXµŸÿ\0ÿ\0»Ùoİ´ºKyM~-Ğ,§aı°ìÎÅ Z‘j½z ¤$SıÁÇÇá=Æ¼a¢´¦R•@½äÔlf|OqnÙ6²ôÿ\0¦é¥ĞŞşóncu¾û‘¾ış,ƒ½æëäÎw~-ÊwâĞ-ú\rìÂù¿cÿ\0ıÃâ*éïûÒ=ØÌOûH®äêô0ıÀ9¯!¦ÛÜz‚ûøA¸É¢~›â^”®nä¯TM=\"Mä§¤ÏpŞ4û‘÷÷ ~çœëÔéĞûçß–¯öğwÃ“Ô;È?7øoıÆ>šê£¾®/xDÅ¾“øQgÔj¹Èwı3ãütğ×eödƒ¹!ª1|QÄ{Ï»÷ß³\"÷ğ¼Zˆ´³˜µ_ûFùÊtØ´J-#Wiuvcåù×Ïğş;…h£Åö?O¤Ö^Y.ö&×†é¢ş¾=\n!WtãL×ıŠÔõ$E>Qr÷Jæéùdÿ\0:VMŞ±“·´,¿óïı¹ÿ\0)æGĞoá‰ş|7Or@İœm²€l]ÔY|‡†À«ÂşäuŞ©Æct-aßœ£üu|Ç°oö\ræm	öŞ%]0fİ7Ş5Âók¿i½&4óƒ®r;/z,…]Øˆ¾7ã)À²\'ùítBırûø?	Ûùµ¹Z»}ÓûÂÎÍ:ÆlË=[İ}³ŸGª™¾2ã[6üƒédnü\nš}ôºsÏêy!qc»ÈK¶\n?Ø´k~Fÿ\0‰¶»§Ú í¨Y°Ö¦1u£«ñiNYÓw‹Iœ8<\'Á—\0oÛïqî>»W×ïÿ\0·úoOÆ÷:wÍÖûùº?œÎ9MY\0ïTwâÓk}¶Ş-•}^-g¼zópˆñoÃHµáp™Y§Ó-Õµ®½Üò\rïuuŠZJºÃİüÌà-˜\ZñÊ¸“Á¤Ò{ğñ5—\Zf»ú/ìùëÂO,ùP²æ§¬³û è[{‰°ĞŒûßƒ= éı}Díú[zëjûıú_\"¿84<èâËÿ\0¥Úº7Zfÿ\0ßÉ§ñ§W4íVÎ2¥õøtï~ø÷–É<‚’ü=]¤ÓlórÅ Ô¤©²šm¹ğ4>¾ág$;Ú0çúóÿ\0rj€Óáp¶÷z_]u×ùè§şO¥ë°1ÜKÁ6ıÀg˜³ªˆ»½l%ïÅbÕ|ûp ºÄQÿ\0·/@+ŒC{İÖ#—\'K¦GŸ8vqoÓ¯Iÿ\0kiMîŸ8š€ûbUáÔ¢ûP—d¶;]éZŠd^QkoÕ¯ÇÓ÷¬§aÿ\0¿õO¾í¿ÊLŠÛÍìÓùÚ½Ÿ (Ùù»åG‡ì	óVsÉâşLÿ\0;7^;ÛW÷´8v6™Mmıó¿~GŸÃëo…Whiúƒ·ØŒ¿ñÀ{æ}0şİõY\"îe`S~Êõˆ\ryV>½Hú<_®áHîğÔC]ëyoİQGùƒ‹ÛÁ-<oùü2®x¸¯¾^ëÃ÷ü’_V\\ñİÑÇI„n¥	¿ªyËØ°»#Ï?Œ8:~ÇËXÃµšÛ~-Wó_÷İşüÿ\0®÷ª;ÂÏ:E¦ÒÍw…½9ıL&Š\0\n÷‰3ÙºŸşÕÿ\0ÿ\0{©\"Û§´>ñe¿\Zıı¼jñdjE½‹#…ˆ|g-`ZË¿ßd;#y©ïlÌGOÊ\"WÅ­îÏ¶ì{ÿ\0›ÔüR®÷?Ïÿ\0~êqVÿ\0¼E”¶>å\Z‹\'ÿ\0Ç†½ó–3ô:û÷Ïúp•-Ãöø?<-eõšaéšSÊ,xºşÉß>v\'·€<¸<åÃİPñm%İ¼G?Îm>7ú>€¼Â½×ûşÅ–ÿ\0Å\rqkÏØıÓöP7¿óœèÙ«Ñ™ÿ\0ÿ\0|ZË¨Wùï—Z9M•ü5¸éÁÈàñ½(¯2âí“ı×§e&\\ù*yÇ¶\nÖÓ,?eC¹o\"ß}ŒíõC2D_ß£Ùë´;¼wkïßóıöãGûè4r¾hûŞ-Gõ–-×ÿ\0X¿‡`‰áõ«¡z2-üÆ‡koOI3Ó÷œn¬¯øâ+±ù°ñÙ4÷,\0—>>êÑïé0„oK<\\wá® bé?®æ÷ÓÍgŞ·Ñ£üÚÿ\0çjßÌ_Ş’C2p-Mó´½ÿ\0Çïp´÷mlìa4Ï¯”ÿ\0Ö¡q±nbØ/ùÛıëéŸUÿ\0şğo/zÿ\0¹½Åÿ\0÷(§Lj<^ñe¦Ã±|/õ·¾œsëàó¥v„ç¯)dÏ+ÁzL08æ,¦uä¾Õs´($-{oAÃşyÜæ|Ñ³…¨²\Z¾w{£œ/_]öÃküï;™ú½bğ¯ñ;]{\\òxWP{âÕ¦ş+Ñ8¿ıÍõıt;æ/ŞCOé½‡õjçïNkTÍ÷(·øSŸø¥ÿ\0‹%—¸²î~ûe‹§iÿ\0·p¹¨ãûÕ0°¯\'RüğU=·Œ]Œê+§jİÿ\0û²4†”ÇpßH{ÿ\0»ÌÏn¿ı›Æµ=F÷K›?şÿ\0dğ™b\Z§O‹Aİ{>½:Ñ÷5e9óoâ}W%Òÿ\0:²ğØy¾¨÷™ÁÑkó¨È\Züukò}u’|­ş3¾÷`ã¿kvÛ¦Vœ#ZíüêãRÂÊãGXØûæ~4/«Y!ákïÓ»kÑKİz\nÕ|¥o·o1„ßÏâûÏélâÔbÈüÿ\0$Ù~êÛ_lú?N{¬ÿ\01õñ­åó&ÉsŞgË‰êú!ù†\njC—ë3·:†•ŸÁ|í9•h6hZø‘¶™ŞfKze]q¢¼¬%Æ#İ•¢w•ıÅ³»÷³çóy¶oçıºşÛÆñô6\n<@ğs×W³ƒƒj\r|šjÂÃóSŸg…ß‡ıjèù~oâïu§òÓw±”x‡»¤ÇìAÍùÇÙzÑ\'¼¼½Ÿ~ÍYt÷ş˜>õ®É³@y¡Í´ô/z¸i6s»\\¢ôâß{ÂÆ¹êùƒKw)×ãƒ—»ıÿ\0ÿ\0·ßÕãGñÿ\0Íwçmæ´¯±.57Ç1›\\CÒA:Oÿ\0,G¾û´ä~İõÉµ€ñZÒq‹ç\nÑı%ï@¼Ælvò\ZÁÚsva¾á\Zw…¾İüç&=tåİBpÀ.Ôq°vı™úóÂ»ÜÉã›µi¿íyÏ¸7§Ï».şj_ÚËï²í^ş-/[ö:A…:v9äÇà1è»JşrÈ—|&¥ëŒ±÷¢î_vŞï)¯÷mŸu“ÚWéÎ®Õ{Ÿ»÷¿}î/»ä¥§Ö”ÿ\0âÕS1R‘r3úãÃwÕõûşQá¿Íåñü	bĞ-_ëqï½ãt/×å:=ùô\Zÿ\0ÿ\0™ÿ\0åÿ\0¾¶û›÷¶õüĞ¦é~\n»ıßáŠNù÷…§¦7^nSÀ»AòX—ÏŸñ¦ş×øbŞİäç¤DÅO¿ÙÔĞ×{åJ»·X_xµ?õNşîgÿ\0ß•åfm—Ó¾çiŸôÌ\\éÚ$Îë·\'h£ÒÚvûZX®ÁO6é}çÿ\07ş}ù·ÿ\0\'ÿ\0şëõ¬µƒNı‹-üïõKëPÀcçÊªıÇVX ü¡¶fIº§.wó«Ê?IƒØü-6ÓÎ½ÿ\0wq‰èT;ûÍ	§§·—f¶ÅúÖüsYŞyv^3ìfö¨¦i¶èpöøäÑDv¢ØâsÌ;Ú|±ÎÜïİÿ\0Š÷ÙÀ2#—çûvö&ÓråñCËŞzÌÑlWê¶Ø±äñ–¹^î\n¢Ø¦ºàUJìşùÿ\0ú¿B ¶ëAwdD÷×˜ôkànü±oC[*OŸËÆt1ÿ\0?Gİ)düöŒû^V)Îµce¦wTkná{ñ“OChöÍ·uÃóvôİã®DnĞôûBŒ3…Ìú9×yØÏıèTsµÀ\nî¤_\nÃ•ÜÄqåóÏ«Yzõ­˜„ÿ\0¬õIëÖ7‚¨†×x7ÃMDkÛb7O¸3u•ôVƒşqØ\0|È-†š¯íh}òabvÿ\0O©ır8\\¼=>ß×æôÔüFö§ø	¢oõ*\n-Òá~iµUO+@«&~å†*¿ºZ*i¤°“lÃÌ±–Ù#‘Éšn‰µlÛ¢-ût=Ö‚s×F®ràƒß<Ó×H¶îõˆ/Z¢šãŸÛC÷IİzÇ®ËÉ„;ß±5×íœúÌŸ¶œoöy÷¤öü³	Ï«æQ wxá+ı-´ëîfŒXmhàí&Ò·¿âÚ„ÖÜsüëëÇÏ7“ìDÓza[Ü¥ÀÃŸÃ¶`ñç)ÃÈñğÌñ¼[¦o°]\rŸÚ.³\\m®Ì3±·±ØµjEF^sBLœ§úÂ«a¾Ì­û¨º5ä6²ƒ}35œşŸãÓë3šÈfÙß¹ò½çgâ§hŞ}µ?×%åC[¿·wl|äŸW`v©¨æıó‚#2‚V‰én;áeÀÂ¿p—ï®“ïàğ-º$Øü¦?ëQÈ^ß7¬$[e±O²;èı|[sï5Á‹ÃüÄoéïk†˜dÇ±œÚıvàWÔş._úíæ}áCÿ\0ıkÿ\0ÏïWøíûÜÏñï,^k¾ÕâÇş¿Ïã¬psÆ¢£˜Q¯¦àèà—ËîiŞúÏ§õ×sùƒ¯·ŸÈßß5¥¿ş=îicÆô©’ŒéUœóµùu¸\nuÔ;1ñûßîŞäıÕü½È_>ÿ\0ÏÀõ{ ªÙNôÿ\0×ı74Ò;øÅ÷EÀ›ãÜ®4îüê~Ø‡-ÏMa»xbuÉó{;ÿ\0HBô@€‘\"7IÏ|†+?SSÎòâ\r«ĞÏ»Ñx.á‘?PG|›–×ïäŞîÿ\0@2¶š%ş®TfHª‰÷ë¤×š\\örS}¯ É±úTÙ¦‡fÄlùr\r—ªÔÁó¹ıƒ¾òGRÆ>¦H8h%è¹}Æ¥î±ëÜ…çC[ğ±ÚXC÷°ı.¹	êc=øÜ\'g„êŸ[İî#KÙ¯ù|ş À:©Âå77v0•ÁÇ 7ó2Ñ)\rWë<~†¿„œóç¯¡İf&¿Ø&£]z{±ğ¾	¥/Tü| 0B\"m°öá»Hw1»Àonb¥Õcın<^ Ïg¬çæ%†ğ{úr—È—n‘J}y–²¥ó½ê†YÁæJk[xÉ‰U-{õ‚_oïæ0şbÓGl@ISIÓÈÔr<|0ß»8õÏÈmÿ\0%ºX÷?qÀp‘pP^tú>ü}@wIÆÜÚ÷‰¥¬ó`·|¹º]ß‡+‹[CıâL?âAUÀ:wq÷ıoÀó,—]öM¶WyKiTÕŠê¸ç“šr&ñ?Ï\r‘ã˜¥%¥a;›pI:¼9ã4S¬Y}¥Á—æ;šQÏ¥L®l\Zoñ×r<»\n”¯±SÇ“ˆ+ĞmÄûĞÎf~ü¢‹ïØÊhô|]{ógÚî“à¾®ı‹/8ëğË­vÙf¬ÑøuãŒı‰ö«á¤×UªŞÍİÍğ^ûåÏİó^-WŞT¿Å¿öù/ìıñ#[8ÚûKEKg:{/Æ³>=Å¦-_»ıôß1ìVùŸZÆÆ¯ÂØZÛş[öô}şõè½Ÿ¤÷87»ƒëk\ZÀ¢ˆ=õ°IyµMty¼ñB¢ş”Ï\\?¹,­üı­MÕş\']Ï/ìÈ|üßî¤Ë^8oú|£Ìë38¢Íó°§£Æp‘Z›Á³â½ñÿ\0V{<!7ÅòiÜè^ìOíÿ\0z?·¨í¸íÊ¡[ˆ7Ø¨Ú‚VŞ)+¬{êÉüùê8xÚ””,KrŸ²…çL[*§õMÀsóËTÑÿ\0t“¶+y…ßjøk{V¾oì][PÏ‘\Z×Ôhõô¸ÜgmYßi‡ä—séíOfQ÷‘®ğşÿ\0€ë¼H]-s\'ÎQF¿ Å\'çÏ[Çóx´ıı\r‘l‡šûÇrñ‹@¶@Œ~\'W!µF ÉûU‹x4ÉChqŞ±ıbT Î<J­÷D¨§­ñ³»·ëÌr‡0,Ú$\0ü5‚øÒMWnpºôİ?¿‹ã•Ôƒö¸ve† #\'ôàqEV;wø=\n&[ÄÙvÖíøÛ1¤ÓLF/#™Kà¿xIcşe³\rNuÉí`á:R×\nh:5\07Pû|^ÔHqtÀÇ½iÃøö;‰µèKv9ùüg?!¥\\”ğéûIº¬7¼=›“2ûaE®2SjåšÏÿ\0h½ä?ˆ_¨ñ†øÃ{¶ñ£vü§ÏT²³\\\"\n°¡ÌÅ®\ra]/Hëåú(Ö¡\\oÚ\ZßïœK…=·!@\'Š4¯šfîpvèÔtÿ\0Ò;ÎêñŒ~²ı\\\\¼N|µï?j6Ôü»¡p˜ÙBiŒ}&=Ö¥°óïp×;ò¾pàîğ‚>jæ+¢ã’`½òåİè}¬scû¸Ô~-yÜË—v÷~‹m\rØ¿ÛŸcNÿ\0ÄÙQ|¨°ã\rú+ñ=’?Æ½­ç×k¯‡ŸŠãcîåû}Äjïº°•ıÁ/z·¾osŞÿ\0ÿ\0ƒ‰ôÜÓ	§p¾.§;ïâºU–Xæ™ë,\\iYÍWôE—Àç8à4}%:‹´?º¤=%›¤íš÷óCÍ¼¦³xÿ\0\nh¿÷G6?şôçŞ±§rö”_‡ò·ÿ\0Íƒâ¸ºâóûì1™GÆµŸÒÇeùÅ¯?òqĞxş©¿›ŸølB\"Ÿ¸SeaGÙ§w|?Ûeƒ‚]¹ì{÷>“Şğc—×†½ëWÔşßó[qÀ5áG¯Ş\Z“°å×{%1?5‹OQ7h…ûÑ,T9_ã-\'QÜZñú&¸ïê¨|bq…µ=Ÿf¡~•wÂ³‡Ûã¯\'çµõøkX.ëÔVßÌä†C|Zßïœg{åu<Î<.ÃoÌŞ3.ÙËnÏ%?AõƒüŞ\rñî}°{ùåıx›ÙÓIKm?NÌŒ\\S85nx˜ğùlŞ6p”³ºğÄ>n—¹H¶–·mCWÕ¼/vz{ÿ\0ØÖ»´Ey&yé\"Ù™4\Zû\r‡ ·œRûÄ&aÑ\'–ƒ7qÇãmü/£ëÿ\0š­Ï¸›Ş|Ÿ\rÌ.R$pœ0ëI®‚0ã¼Ûä)ºp{v‡¢zQÓ*ÁÄÚ>¾†îóMï‹fŠè·¬q¸ùš-›2~+>º¯5¿ö¨L÷é¼Á“Ú®ŞpÍ‡Ã¯ÆòÇ5ùÏk©Áï#µNr÷ß±&?«»ÍÅŒ¶Ñ—S¯§¶Ñ]óTÛØ/š®Ÿv¬=ƒ€EL‹?,2-ÄXO]Ò\rÁÙ”Ò‡Ü’ºü.åÆ»Aït{_NúÍ…öáÌ—ù\ZéÁ|bWéÍ7qôÜsÒ‹mn9õí3öYàÓª_?¹3“Ù U¹šß\\„¬gp¸şá8ã¶îáGì–öN;š=çÍæ7ÅµrbœøYñD|ãŒ/3°?–9OF#ÓEĞ=v¨?ùıØãHzëÛÿ\0m\0ñî=gAŞànöJsğ…~·hÒëEŞ½	ÿ\0fòÿ\0ğV¼r?ĞŞüŞ>×öoíÙÓuõë¾û‰½wÄ7Fö|R:ps€²`ü×Ê5¦\Z»ãSO{=øQÓõ!½¾u#ıkîMï7«ÿ\0ìŞq¬÷Å¬;üŞoW[tİFiïM-\rÿ\0şşí\rõï«Çïøÿ\0´v>MÂÓ^¾Ï‰ª“ú¸æöÚ}š§¾©4>¿»/Ów‚‡MŒ}yƒíP÷//ö8I×[ışvV÷Ëİúü?éşÂ¿ï­Ü¦ıO\"ø\'Š¤xõ˜tÜ›Óxø½@¡÷—áb-ıgO µ Î2£ª<}ïúp²[£]­õèü®OéÅ]DÇé¹uÉÚ<£¯+OÃ<Æ8q8K O†:¦Ùâ[?uç0şB‹íøOî×œõ×òWşçò—ÌçE§á§¸Á¼¿_ƒÅòş&ÿ\0ünX´í÷wŞ‡ñLRğÚ:\'èÄú9şp	ix†Á½æÍÇåólÓÀÇ\\WÛÄ¥CñÎÕƒ@[“ÙbÉêE-Ø.~_ìÄ§gda½šnä[¢ŞV[·ñ–ûó>j çGıö:¾½‰ß®Cı÷Æô¯í&Şÿ\0æŸ\róü\'›yı·ºïj.K÷z{EíÃaºœº|BûŒ’ì¬‹ıĞ$ÏşWïê\\ƒ;ıwºO–ñh’-^áò`é±®ºé*l6Ç^mî\Zµh>Uyƒcã«3C«d7eÜ^|œşqh`tóˆö®óıÎfëÿ\0¸Á¼°Øëÿ\0¯Ùhß%âT¶Ğ±ñÂ~¡‡³Sf|xSGÓu¹Z¦Æÿ\0èı;?ZÍÿ\0ş)ÖDhŒ…*ÁöÆú:ÏÏXÚÿ\0òz_ão^­‡·ÿ\0~İşnŸ}¿xuùç/ãÜÖ|úÍ>ùı|j²­Ö?ôbEmÄ>ì0ñÌaçù²&ú÷›kó™³©üÖéÍì6÷håsÈípØ¥v;õ[?Ny‰»sÍü®7GšØñ*¿Ö¨\\¡øã×çd/Hv³øşÿ\0ïwòQNÉ|ÌHV¿¤4n\'[œAÁÇ¯Ú·áÏ“˜ãÒïW \Z;=ú¹·ƒx7®+_ï(IÃÜtO9¾[_½óÎÑšmÍè|~?-Ş8nÒşÿ\0ı©ƒ4ó­Ä·Ÿ‡© HòÎ©iÏ¼¦÷ÿ\0îÃÿ\0ÿ\0ÿ\0šĞş/şoŞ“É6AI°ys·ê\Z’{”ÃüV>ß·ï¬ğØo~ŞÎùî3yfçêS{¹¼ÿ\0ï»›î››¯şÿ\0gfõ÷#tÿ\0÷÷»—l¯Å)±Ó_ü?± HİÉfµÇéx0}²Âl¼ëìûÅ>ŸtÅE\Zÿ\0tîÿ\0ó‡¿°íìıçûŸ¶_‹û÷ï¹s¸ŞÍà_ÿ\0ƒ“äcx7üMjòõ~1Nq‰rà¯^^Âée¼å~xuü?êB‚§ô¿·¾éêíÖ_‹;ç¾ß>İ&ÆÎÿ\0ë¯s¬ïÏÿ\0ºşÏµï³ûı,Nä‡f€ün!õ®·Gqæğ‘Hıa½l—«âõ{Ué7GÓx7—·Æÿ\0şâTøôÆæôcÚğÚş?¶ü|n7ÁûÏ]¸gp†öêG½×pãb÷Çß7ç0.È%»^;mÿ\0Î/ı}Å^7»©pIßÅGİhÁ½»ÙäçX¥Ş{ãk¨@•ìªã¯şa#L˜?{Şù^ÿ\0œ?^¬C~‘¸¯[Ç†şœÖ¯×O)®ãÍbâ¯k÷‹î<]¨I¶Í ÜP\r\'µõ¾±Úë—j¡s~OGê‚­¯ó´£‹>9·ù]GÓ*ßI&›;ORË\nÏŞ?JG¦XÚÑëMŸ¡¸L˜ö…\Zæ˜]ºoˆÿ\0´/nÛœvWŞVs÷Î\rÌƒÿ\0|.ËÄĞ¹Û0ğY»ú¶ÙØwWnxØò$o=}|ºJı‚Â|E4!ÉË™•pœºò\'—şÅŞDİÆYX£Îé®ãùGy¡[I¿C$QCx—§?…\\û–÷X¿JşÏ~	1åbÏ¾BÂLe®çÒÒBí„Øå¾0—İÙ0‚s8¥S0Tf ÷¹ÃWyÃ¢˜CÚdyæ…ï5³Ğú]–^É‰<@öu/ÈTt’~³Ò»øİÄ}|´ÄÖ‹Ís?\\€´¹#í!ÊçøÃ¯—¯¸c›ÿ\0óêósñ­/ÍW¿QÏ,¨Ô\'ñyÆÂÌ½áº!üJwğ ¯âu“ï}$Ÿçğ\"–yf¹âA01îx\"t’7FZf‘õ£GzF¶P(Ÿ§ã5¨»gæUöwS\'Aİs@ÉW]¤Åíü\n­Ğo•Ñí¸YÖkúO+™ÇÂêïæËíq¯kŞe* Ré1ñ©â%yt{â šÍæMo4¤ú(æ½•ÙÀWÙwä\Z9tzˆYwáînó°öşÏÎİ§ûQ/%ÂÎjj¦ÿ\0ôkofÓ»`vQİİÕù¢İ­!/Ÿğá_‹ú¶ù°”Ù3 ÓéoÏ6(MàŞÍJm\rgqƒºu4ŞÆÿ\0€Ôéİ»F“8›ö ¸| Ûn‚mğı?/nødÂ/á+½Juç¼§ù´MÔ)oo]è½ñ\n÷ä[I<·²QÜÂ¿¸uucµ¶5³|/äÚ,‘£æ¾Uêùz½í›Óù°³Ìÿ\0ğyÂÓe\'ÎßÑöš¼Ñÿ\0û£çó/O=fôf÷¿kÒìP×ÿ\0¥İbÇ¾Ø‹®aÈÏeùßUüŞ\\Şı¿oÏï¿ÿ\0›¥4Ïe|ãBˆŠæéša£V¸¿”¯ÿ\0dQç}æ1 `h~Ö»êfåÉÃ¿uÕŸèèÀ­ÿ\0±²v£ñfşmMmëy‚ÓşuıÕëèŞmµ«Ïşñ«#óÊ¿ôç¼İ+3ÛÜ‹ï»«ú®xïY›û+Ğ¸üÇ\\}ù3Ïµ\0~óÏsÕö*Xa}ñz½|N ¸¡÷h\"ùæìBS¨sŒØ¶„¯ûÍÛxÁ>>d÷ïëWØ´8à´ÿ\0­ç÷Şñº©’ï×.->cKÆøõ[7ã?lÿ\0º©—íı€ÏBî>úıñ=)»I¨şÜoÛP×íLV&;g±ÈÁõìÖò‡ß>v(<ÚÖºüÛlŒëê‡\"£§1Oâ$EUNg»ùæÅ­Z\0PØÆÿ\0>pÿ\0hÏÿ\0oœıæ›éØ?ÿ\0§¼ëæyzS¯ÂŞj´ïú•fO\Zóî¯¿;÷›^Ú?>|æéhËßÌ°ñé.8¶syxRøÄßÿ\0›ù¯z˜ÓhJhë†7«dÙCà}7£ïqˆß¤~÷á?º­·Ç…Ú²Æß†¶®ƒî¹Óÿ\0?â¿Îxb\ræ_¦ïAC&ì?‰ÌÇŒÀm‰òó3¿¿7ïÚüŸ¾ËŞësYş`ã‚=Ş7©4¾ÿ\0Õ…úg|`PŒüõüFîÌœ_zû¡~y€aK?Ä¨ÎÊGƒ¶>E,k¨	cø¸¤oeäÙÇÏç{ü¯oŞÃçoÎş–¼ÏW(²—º‹óxÈÙZrÍÑF¦ÚÁÕÀ6/6UÚå7·ÿ\0Ùèß^—7Éßüïé÷»ÿ\0¿õŸ»ì6[«\',ÍŞ*ÿ\0›ÛyŸÛıù½^e7¶IÛË°¶fædôœß\nİîÿ\0ºûîß±_ï)ÜËÉOÿ\0ø§÷ıo”²(Íñ;ÏöÕ<ç}ÿ\0ŠŞù¾pÖ}ÏÇ™¡å~bB1Ú÷ï§ífîwaÏ»İo¿íñ[óşîıŸSŸş‘àäşE”ÿ\0¿Ííÿ\0¼üëãOêÂçuAöÿ\0õ×?×:øÎVÅ^ş©Ş5®j}÷ğêÿ\07Wıûá¹ª-0/ı-(ÿ\0­—ÿ\0­èæ¯Átÿ\0­Aß—u¡¨’·WÛ¨:7åû.Ó¿¼§ÿ\0½l·ßØúwIÛÔ¼´På7´çİ×è´@£Şo8Æ·}š×˜öuÇ>?Õólüß_§Îõ}^çÇÌÿ\0ò§åÚßÿ\0~d1¬ùzQ1]_š¡Ç?Êù<\'­¾+?æŸòO»›Ó_ÿÙ',1,0,NULL,NULL,NULL,NULL,'b7d2a5e4-5418-4562-8807-764d12ea4e23','jpeg'),(26,'',1,0,NULL,NULL,NULL,NULL,'','');
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventarios`
--

DROP TABLE IF EXISTS `inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deposito` int(11) NOT NULL,
  `cant_operacion` int(11) NOT NULL DEFAULT 0,
  `pre_compra` double NOT NULL,
  `tip_operacion` char(3) NOT NULL,
  `fac_compra` int(11) DEFAULT NULL,
  `motivo` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventarios_depositos1_idx` (`deposito`),
  KEY `fk_inventarios_fac_compras1_idx` (`fac_compra`),
  KEY `fk_inventarios_motivo1_idx` (`motivo`),
  KEY `fk_inventarios_usuarios1_idx` (`usu_alta`),
  KEY `fk_inventarios_usuarios2_idx` (`usu_modificacion`),
  KEY `fk_inventarios_producto` (`producto`),
  CONSTRAINT `fk_inventarios_depositos1` FOREIGN KEY (`deposito`) REFERENCES `depositos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_fac_compras1` FOREIGN KEY (`fac_compra`) REFERENCES `fac_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_motivo1` FOREIGN KEY (`motivo`) REFERENCES `motivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_producto` FOREIGN KEY (`producto`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
INSERT INTO `inventarios` VALUES (1,1,150,150000,'IN',NULL,1,NULL,NULL,NULL,NULL,1),(2,1,10,150000,'OUT',NULL,2,NULL,NULL,NULL,NULL,1),(3,1,10,150000,'OUT',NULL,2,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `borrar` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_marcas_usuarios1_idx` (`usu_alta`),
  KEY `fk_marcas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_marcas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marcas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Cecotec',0,NULL,NULL,NULL,NULL,0),(2,'Tokyo',0,NULL,NULL,NULL,NULL,0),(3,'Consul',0,NULL,NULL,NULL,NULL,0),(4,'Samsung',0,NULL,NULL,NULL,NULL,0),(5,'Whirlpool',0,NULL,NULL,NULL,NULL,0),(6,'LG',0,NULL,NULL,NULL,NULL,0),(7,'Electrolux',0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_pagos`
--

DROP TABLE IF EXISTS `med_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `med_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_pagos`
--

LOCK TABLES `med_pagos` WRITE;
/*!40000 ALTER TABLE `med_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `icons` varchar(45) DEFAULT NULL,
  `mod_menu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mod_menu_idx` (`mod_menu`),
  CONSTRAINT `fk_mod_menu` FOREIGN KEY (`mod_menu`) REFERENCES `mod_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (7,'Productos','/purchase/products',NULL,1),(8,'Proveedores','/prividers',NULL,1),(9,'Cotizaciones','/exchange',NULL,1),(10,'Nota de remisiÃ³n','/remission-note',NULL,1),(11,'Nota de crÃ©dito','/credit-note',NULL,1),(12,'Nota de dÃ©bito','/debit-note',NULL,1),(13,'Libro de compras','/purchase-book',NULL,1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mer_imagenes`
--

DROP TABLE IF EXISTS `mer_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mer_imagenes` (
  `mercaderia` int(11) NOT NULL,
  `imagenes` int(11) NOT NULL,
  `principal` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`mercaderia`,`imagenes`),
  KEY `fk_productos_has_img_productos_img_productos1_idx` (`imagenes`),
  KEY `fk_productos_has_img_productos_productos1_idx` (`mercaderia`),
  CONSTRAINT `fk_productos_has_img_productos_img_productos1` FOREIGN KEY (`imagenes`) REFERENCES `imagenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_img_productos_productos1` FOREIGN KEY (`mercaderia`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mer_imagenes`
--

LOCK TABLES `mer_imagenes` WRITE;
/*!40000 ALTER TABLE `mer_imagenes` DISABLE KEYS */;
INSERT INTO `mer_imagenes` VALUES (1,23,'S'),(1,24,'S'),(1,25,'S'),(1,26,'S');
/*!40000 ALTER TABLE `mer_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mer_rem_productos`
--

DROP TABLE IF EXISTS `mer_rem_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mer_rem_productos` (
  `pro_not_remision` int(11) NOT NULL,
  `mercaderia` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`pro_not_remision`,`mercaderia`),
  KEY `fk_pro_not_remisiones_has_productos_productos1_idx` (`mercaderia`),
  KEY `fk_pro_not_remisiones_has_productos_pro_not_remisiones1_idx` (`pro_not_remision`),
  CONSTRAINT `fk_pro_not_remisiones_has_productos_pro_not_remisiones1` FOREIGN KEY (`pro_not_remision`) REFERENCES `pro_not_remisiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pro_not_remisiones_has_productos_productos1` FOREIGN KEY (`mercaderia`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mer_rem_productos`
--

LOCK TABLES `mer_rem_productos` WRITE;
/*!40000 ALTER TABLE `mer_rem_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mer_rem_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mer_solicitudes`
--

DROP TABLE IF EXISTS `mer_solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mer_solicitudes` (
  `mercaderia` int(11) NOT NULL,
  `solicitud` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `pre_unitario` double NOT NULL,
  PRIMARY KEY (`mercaderia`,`solicitud`),
  KEY `fk_productos_has_solicitudes_solicitudes1_idx` (`solicitud`),
  KEY `fk_productos_has_solicitudes_productos1_idx` (`mercaderia`),
  CONSTRAINT `fk_productos_has_solicitudes_productos1` FOREIGN KEY (`mercaderia`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_solicitudes_solicitudes1` FOREIGN KEY (`solicitud`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mer_solicitudes`
--

LOCK TABLES `mer_solicitudes` WRITE;
/*!40000 ALTER TABLE `mer_solicitudes` DISABLE KEYS */;
INSERT INTO `mer_solicitudes` VALUES (1,2,1,1);
/*!40000 ALTER TABLE `mer_solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercaderias`
--

DROP TABLE IF EXISTS `mercaderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercaderias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_producto` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  `marca` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `codigo_barra` varchar(130) DEFAULT NULL,
  `codigo` varchar(45) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mer_mar_idx` (`marca`),
  KEY `fk_mer_cat_idx` (`categoria`),
  KEY `fk_mercaderias_usuarios1_idx` (`usu_alta`),
  KEY `fk_mercaderias_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_mercaderias_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mercaderias_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marca`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercaderias`
--

LOCK TABLES `mercaderias` WRITE;
/*!40000 ALTER TABLE `mercaderias` DISABLE KEYS */;
INSERT INTO `mercaderias` VALUES (1,'Caloventilador Cecotec rw8700','<p>dsaf</p>',0,1,1,NULL,NULL,NULL,NULL,NULL,'asfd','t800'),(2,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'sfdas',NULL),(3,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(4,'dfa',NULL,0,1,2,NULL,NULL,NULL,NULL,NULL,'sdfsa',NULL),(5,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(6,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(7,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(8,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(9,'dsfa',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'adfas',NULL),(10,'Labarropas',NULL,0,1,2,NULL,NULL,NULL,NULL,NULL,'002',NULL),(12,'1',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'1',NULL),(13,'1',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'1',NULL),(14,'lavarropas',NULL,0,3,5,NULL,NULL,NULL,NULL,NULL,'001',NULL),(15,'',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'',NULL),(16,'',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'',NULL),(17,'',NULL,0,1,1,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `mercaderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_menu`
--

DROP TABLE IF EXISTS `mod_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mod_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `icon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_menu`
--

LOCK TABLES `mod_menu` WRITE;
/*!40000 ALTER TABLE `mod_menu` DISABLE KEYS */;
INSERT INTO `mod_menu` VALUES (1,'Compras','fa fa-shopping-cart'),(2,'Ventas','fa fa-credit-card'),(3,'LÃ³gistica','fa fa-truck'),(4,'Mantenimiento','fa fa-gear'),(5,'Seguridad','fa fa-briefcase');
/*!40000 ALTER TABLE `mod_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo`
--

DROP TABLE IF EXISTS `motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_motivo_usuarios1_idx` (`usu_alta`),
  KEY `fk_motivo_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_motivo_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_motivo_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo`
--

LOCK TABLES `motivo` WRITE;
/*!40000 ALTER TABLE `motivo` DISABLE KEYS */;
INSERT INTO `motivo` VALUES (1,'COMPRA',NULL,NULL,NULL,NULL),(2,'VENTA',NULL,NULL,NULL,NULL),(3,'DEVOLUCIÃ“N',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `motivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_cre_detalles`
--

DROP TABLE IF EXISTS `not_cre_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_cre_detalles` (
  `id` int(11) NOT NULL,
  `not_credito` int(11) NOT NULL,
  `concepto` varchar(45) NOT NULL,
  `cant` int(11) NOT NULL,
  `monto` double NOT NULL,
  `tip_impuesto` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_not_cre_detalles_com_not_credito1` (`not_credito`),
  CONSTRAINT `fk_com_not_cre_detalles_com_not_credito1` FOREIGN KEY (`not_credito`) REFERENCES `not_credito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_cre_detalles`
--

LOCK TABLES `not_cre_detalles` WRITE;
/*!40000 ALTER TABLE `not_cre_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_cre_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_credito`
--

DROP TABLE IF EXISTS `not_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_credito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_doc_relacionado` varchar(45) NOT NULL,
  `fec_emision` datetime NOT NULL,
  `comentario` text DEFAULT NULL,
  `timbrado` int(11) NOT NULL,
  `destinatario` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_not_credito_timbrados1_idx` (`timbrado`),
  KEY `fk_not_credito_usuarios1_idx` (`destinatario`),
  KEY `fk_not_credito_usuarios3_idx` (`usu_modificacion`),
  KEY `fk_not_credito_usuarios2_idx` (`usu_alta`),
  CONSTRAINT `fk_com_not_credito_timbrados1` FOREIGN KEY (`timbrado`) REFERENCES `timbrados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_not_credito_usuarios1` FOREIGN KEY (`destinatario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_not_credito_usuarios2` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_not_credito_usuarios3` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_credito`
--

LOCK TABLES `not_credito` WRITE;
/*!40000 ALTER TABLE `not_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_deb_detalles`
--

DROP TABLE IF EXISTS `not_deb_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_deb_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `not_debito` int(11) NOT NULL,
  `concepto` varchar(100) NOT NULL,
  `cant` int(11) NOT NULL,
  `tip_impuesto` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_not_deb_detalles_not_debito1_idx` (`not_debito`),
  CONSTRAINT `fk_not_deb_detalles_not_debito1` FOREIGN KEY (`not_debito`) REFERENCES `not_debito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_deb_detalles`
--

LOCK TABLES `not_deb_detalles` WRITE;
/*!40000 ALTER TABLE `not_deb_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_deb_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `not_debito`
--

DROP TABLE IF EXISTS `not_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `not_debito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_documento` varchar(100) NOT NULL,
  `num_doc_relacionado` varchar(100) NOT NULL,
  `comentario` text NOT NULL,
  `remitente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_not_debito_usuarios1_idx` (`remitente`),
  CONSTRAINT `fk_not_debito_usuarios1` FOREIGN KEY (`remitente`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `not_debito`
--

LOCK TABLES `not_debito` WRITE;
/*!40000 ALTER TABLE `not_debito` DISABLE KEYS */;
/*!40000 ALTER TABLE `not_debito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord_compras`
--

DROP TABLE IF EXISTS `ord_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ord_compras` (
  `id` int(11) NOT NULL,
  `sol_presupuesto` int(11) NOT NULL,
  `observacion` text NOT NULL,
  `ord_comprascol` varchar(45) DEFAULT NULL,
  `fec_emision` datetime NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  KEY `fk_ord_compras_sol_presupuestos1_idx` (`sol_presupuesto`),
  KEY `fk_ord_compras_usuarios1_idx` (`usu_alta`),
  KEY `fk_ord_compras_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_ord_compras_sol_presupuestos1` FOREIGN KEY (`sol_presupuesto`) REFERENCES `sol_presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ord_compras_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ord_compras_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord_compras`
--

LOCK TABLES `ord_compras` WRITE;
/*!40000 ALTER TABLE `ord_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `ord_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord_tra_estados`
--

DROP TABLE IF EXISTS `ord_tra_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ord_tra_estados` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord_tra_estados`
--

LOCK TABLES `ord_tra_estados` WRITE;
/*!40000 ALTER TABLE `ord_tra_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `ord_tra_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ord_trabajos`
--

DROP TABLE IF EXISTS `ord_trabajos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ord_trabajos` (
  `id` int(11) NOT NULL,
  `solicitud` int(11) NOT NULL,
  `fec_creacion` datetime NOT NULL,
  `fec_asignacion` varchar(45) DEFAULT NULL,
  `per_deposito` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `traslado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_O_trabajos_solicitudes1_idx` (`solicitud`),
  KEY `fk_ord_trabajos_usuarios1_idx` (`per_deposito`),
  KEY `fk_ord_trabajos_ord_tra_estados1_idx` (`estado`),
  KEY `fk_ord_trabajos_traslados1_idx` (`traslado`),
  CONSTRAINT `fk_O_trabajos_solicitudes1` FOREIGN KEY (`solicitud`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ord_trabajos_ord_tra_estados1` FOREIGN KEY (`estado`) REFERENCES `ord_tra_estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ord_trabajos_traslados1` FOREIGN KEY (`traslado`) REFERENCES `traslados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ord_trabajos_usuarios1` FOREIGN KEY (`per_deposito`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ord_trabajos`
--

LOCK TABLES `ord_trabajos` WRITE;
/*!40000 ALTER TABLE `ord_trabajos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ord_trabajos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pag_proveedores`
--

DROP TABLE IF EXISTS `pag_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pag_proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor` int(11) NOT NULL,
  `fac_compra` int(11) NOT NULL,
  `importe` decimal(10,0) NOT NULL,
  `fecha` datetime NOT NULL,
  `usu_alta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pag_proveedores_proveedores1_idx` (`proveedor`),
  KEY `fk_pag_proveedores_fac_compras1_idx` (`fac_compra`),
  KEY `fk_pag_proveedores_usuarios1_idx` (`usu_alta`),
  CONSTRAINT `fk_pag_proveedores_fac_compras1` FOREIGN KEY (`fac_compra`) REFERENCES `fac_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pag_proveedores_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pag_proveedores_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pag_proveedores`
--

LOCK TABLES `pag_proveedores` WRITE;
/*!40000 ALTER TABLE `pag_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `pag_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_pago` datetime NOT NULL,
  `solicitude` int(11) NOT NULL,
  `med_pago` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagos_solicitudes1_idx` (`solicitude`),
  KEY `fk_pagos_med_pagos1_idx` (`med_pago`),
  CONSTRAINT `fk_pagos_med_pagos1` FOREIGN KEY (`med_pago`) REFERENCES `med_pagos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pagos_solicitudes1` FOREIGN KEY (`solicitude`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `raz_social` varchar(100) DEFAULT NULL,
  `documento` varchar(45) NOT NULL,
  `tip_documento` int(11) NOT NULL,
  `fec_nac` date DEFAULT NULL,
  `dir_particular` int(11) DEFAULT NULL,
  `dir_laboral` int(11) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `tip_persona` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personas_tip_documento1_idx` (`tip_documento`),
  KEY `fk_personas_direcciones1_idx` (`dir_particular`),
  KEY `fk_personas_direcciones2_idx` (`dir_laboral`),
  KEY `fk_personas_tip_personas1_idx` (`tip_persona`),
  KEY `fk_personas_usuarios1_idx` (`usu_alta`),
  KEY `fk_personas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_personas_direcciones1` FOREIGN KEY (`dir_particular`) REFERENCES `direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_direcciones2` FOREIGN KEY (`dir_laboral`) REFERENCES `direcciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_tip_documento1` FOREIGN KEY (`tip_documento`) REFERENCES `tip_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_tip_personas1` FOREIGN KEY (`tip_persona`) REFERENCES `tip_personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Enrique','RodrÃ­guez','','3996670',1,'1986-07-17',1,NULL,'enrirquev.rodriguez@gmail.com',NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_meraderias`
--

DROP TABLE IF EXISTS `pre_meraderias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pre_meraderias` (
  `mercaderia` int(11) NOT NULL,
  `presupuesto` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `precio` double NOT NULL,
  `tip_impuesto` int(2) NOT NULL,
  PRIMARY KEY (`mercaderia`,`presupuesto`),
  KEY `fk_mercaderias_has_propuestas_propuestas1_idx` (`presupuesto`),
  KEY `fk_mercaderias_has_propuestas_mercaderias1_idx` (`mercaderia`),
  CONSTRAINT `fk_mercaderias_has_propuestas_mercaderias1` FOREIGN KEY (`mercaderia`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mercaderias_has_propuestas_propuestas1` FOREIGN KEY (`presupuesto`) REFERENCES `presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_meraderias`
--

LOCK TABLES `pre_meraderias` WRITE;
/*!40000 ALTER TABLE `pre_meraderias` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_meraderias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presupuestos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_propuesta` datetime NOT NULL,
  `proveedor` int(11) NOT NULL,
  `sol_presupuestos` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propuestas_proveedores1_idx` (`proveedor`),
  KEY `fk_propuestas_sol_presupuestos1_idx` (`sol_presupuestos`),
  KEY `fk_presupuestos_usuarios1_idx` (`usu_alta`),
  KEY `fk_presupuestos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_presupuestos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_presupuestos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propuestas_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propuestas_sol_presupuestos1` FOREIGN KEY (`sol_presupuestos`) REFERENCES `sol_presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pro_not_remisiones`
--

DROP TABLE IF EXISTS `pro_not_remisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_not_remisiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_documento` varchar(45) NOT NULL,
  `fec_expedicion` date DEFAULT NULL,
  `fec_traslado` date DEFAULT NULL,
  `fec_fin_traslado` date DEFAULT NULL,
  `proveedor` int(11) NOT NULL,
  `fac_compra` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pro_not_remisiones_proveedores1_idx` (`proveedor`),
  KEY `fk_pro_not_remisiones_fac_compras1_idx` (`fac_compra`),
  KEY `fk_pro_not_remisiones_usuarios1_idx` (`usu_alta`),
  KEY `fk_pro_not_remisiones_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_pro_not_remisiones_fac_compras1` FOREIGN KEY (`fac_compra`) REFERENCES `fac_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pro_not_remisiones_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pro_not_remisiones_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pro_not_remisiones_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pro_not_remisiones`
--

LOCK TABLES `pro_not_remisiones` WRITE;
/*!40000 ALTER TABLE `pro_not_remisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `pro_not_remisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
  `borrado` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proveedores_personas1_idx` (`persona`),
  KEY `fk_proveedores_usuarios1_idx` (`usu_alta`),
  KEY `fk_proveedores_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_proveedores_personas1` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rem_no_entregadas`
--

DROP TABLE IF EXISTS `rem_no_entregadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rem_no_entregadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_evento` datetime NOT NULL,
  `comentario` text DEFAULT NULL,
  `evento` int(11) NOT NULL,
  `ord_trabajo` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rem_no_entregadas_eventos1_idx` (`evento`),
  KEY `fk_rem_no_entregadas_ord_trabajos1_idx` (`ord_trabajo`),
  KEY `fk_rem_no_entregadas_usuarios1_idx` (`usu_alta`),
  KEY `fk_rem_no_entregadas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_rem_no_entregadas_eventos1` FOREIGN KEY (`evento`) REFERENCES `eventos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rem_no_entregadas_ord_trabajos1` FOREIGN KEY (`ord_trabajo`) REFERENCES `ord_trabajos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rem_no_entregadas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rem_no_entregadas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rem_no_entregadas`
--

LOCK TABLES `rem_no_entregadas` WRITE;
/*!40000 ALTER TABLE `rem_no_entregadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `rem_no_entregadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_usuarios1_idx` (`usu_alta`),
  KEY `fk_roles_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_roles_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'compras',NULL,NULL,NULL,NULL),(2,'ventas',NULL,NULL,NULL,NULL),(3,'logistica',NULL,NULL,NULL,NULL),(4,'support',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sol_pre_categorias`
--

DROP TABLE IF EXISTS `sol_pre_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sol_pre_categorias` (
  `sol_presupuesto_id` int(11) NOT NULL,
  `cat_productos_id` int(11) NOT NULL,
  PRIMARY KEY (`sol_presupuesto_id`,`cat_productos_id`),
  KEY `fk_sol_presupuesto_has_cat_productos_cat_productos1_idx` (`cat_productos_id`),
  KEY `fk_sol_presupuesto_has_cat_productos_sol_presupuesto1_idx` (`sol_presupuesto_id`),
  CONSTRAINT `fk_sol_presupuesto_has_cat_productos_cat_productos1` FOREIGN KEY (`cat_productos_id`) REFERENCES `cat_mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuesto_has_cat_productos_sol_presupuesto1` FOREIGN KEY (`sol_presupuesto_id`) REFERENCES `sol_presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_pre_categorias`
--

LOCK TABLES `sol_pre_categorias` WRITE;
/*!40000 ALTER TABLE `sol_pre_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `sol_pre_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sol_pre_estados`
--

DROP TABLE IF EXISTS `sol_pre_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sol_pre_estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_sol_pre_estados_usuarios1_idx` (`usu_alta`),
  KEY `fk_sol_pre_estados_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_sol_pre_estados_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_pre_estados_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_pre_estados`
--

LOCK TABLES `sol_pre_estados` WRITE;
/*!40000 ALTER TABLE `sol_pre_estados` DISABLE KEYS */;
INSERT INTO `sol_pre_estados` VALUES (1,'Creado',NULL,NULL,NULL,NULL,0),(2,'Abierto',NULL,NULL,NULL,NULL,0),(3,'Finalizado',NULL,NULL,NULL,NULL,0),(4,'Cerrado',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sol_pre_estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sol_pre_productos`
--

DROP TABLE IF EXISTS `sol_pre_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sol_pre_productos` (
  `producto` int(11) NOT NULL,
  `sol_presupuesto` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `tip_impuesto` int(2) NOT NULL,
  PRIMARY KEY (`producto`,`sol_presupuesto`),
  KEY `fk_productos_has_sol_presupuesto_sol_presupuesto1_idx` (`sol_presupuesto`),
  KEY `fk_productos_has_sol_presupuesto_productos1_idx` (`producto`),
  CONSTRAINT `fk_productos_has_sol_presupuesto_productos1` FOREIGN KEY (`producto`) REFERENCES `mercaderias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_sol_presupuesto_sol_presupuesto1` FOREIGN KEY (`sol_presupuesto`) REFERENCES `sol_presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_pre_productos`
--

LOCK TABLES `sol_pre_productos` WRITE;
/*!40000 ALTER TABLE `sol_pre_productos` DISABLE KEYS */;
INSERT INTO `sol_pre_productos` VALUES (1,113,9,0);
/*!40000 ALTER TABLE `sol_pre_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sol_presupuestos`
--

DROP TABLE IF EXISTS `sol_presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sol_presupuestos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_ini` datetime DEFAULT NULL,
  `fec_fin` varchar(45) DEFAULT NULL,
  `enviado` char(1) NOT NULL DEFAULT 'N',
  `sol_pre_estado` int(11) NOT NULL,
  `pre_seleccionado` int(11) DEFAULT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modifcacion` datetime DEFAULT NULL,
  `descricion` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sol_presupuestos_sol_pre_estados1_idx` (`sol_pre_estado`),
  KEY `fk_sol_presupuestos_propuestas1_idx` (`pre_seleccionado`),
  KEY `fk_sol_presupuestos_usuarios1_idx` (`usu_alta`),
  KEY `fk_sol_presupuestos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_sol_presupuestos_propuestas1` FOREIGN KEY (`pre_seleccionado`) REFERENCES `presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_sol_pre_estados1` FOREIGN KEY (`sol_pre_estado`) REFERENCES `sol_pre_estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_presupuestos`
--

LOCK TABLES `sol_presupuestos` WRITE;
/*!40000 ALTER TABLE `sol_presupuestos` DISABLE KEYS */;
INSERT INTO `sol_presupuestos` VALUES (1,'2019-01-01 00:00:00','2019-01-01 23:59:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'pedidos'),(2,'2019-11-12 07:28:00','2019-11-23 07:28:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,''),(3,'2019-11-29 07:28:00','2019-11-23 07:28:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,''),(4,'2019-11-18 07:34:00','2019-11-23 07:34:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'peidos ya'),(5,'2019-11-18 07:34:00','2019-11-23 07:34:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'peidos ya'),(6,'2019-11-17 08:23:00','2019-11-24 23:59:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'pedidos'),(7,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(8,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(9,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(10,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(11,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(12,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(13,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(14,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(15,'2019-11-14 09:54:00','2019-12-04 09:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(16,'2019-11-15 16:05:00','2019-11-09 16:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'otro pedido'),(17,'2019-11-17 18:45:00','2019-11-22 18:45:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'123456'),(18,NULL,NULL,'N',1,NULL,NULL,NULL,NULL,NULL,NULL,''),(19,'2019-11-17 20:51:00','2019-11-29 20:51:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'test'),(20,'2019-11-10 21:06:00','2019-11-22 21:06:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdafas'),(21,'2019-11-17 21:15:00','2019-11-17 21:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'pedido'),(22,'2019-11-09 21:16:00','2019-12-08 21:16:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'xxxx'),(23,'2019-11-17 21:18:00','2019-11-29 21:18:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfasfds'),(24,'2019-11-17 21:42:00','2019-12-01 21:42:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(25,'2019-11-17 21:43:00','2019-11-30 21:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdasfas'),(26,'2019-11-17 21:45:00','2019-11-30 21:45:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfadss'),(27,'2019-11-17 21:54:00','2019-11-24 21:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(28,'2019-11-10 21:57:00','2019-11-24 21:57:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(29,'2019-11-17 21:59:00','2019-11-23 21:59:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdafads'),(30,'2019-11-10 22:01:00','2019-11-30 22:01:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fadsdfas'),(31,'2019-11-17 22:08:00','2019-12-06 22:08:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'ddfafdsafads'),(32,'2019-11-10 22:09:00','2019-11-22 22:09:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(33,'2019-11-10 22:13:00','2019-11-30 22:13:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfdasfdas'),(34,'2019-10-31 22:26:00','2019-11-21 22:26:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfadsfdas'),(35,'2019-11-14 22:28:00','2019-12-01 22:28:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dafas'),(36,'2019-11-03 22:29:00','2019-11-24 22:29:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfasfdsa'),(37,'2019-11-23 22:57:00','2019-12-04 22:57:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(38,'2019-11-10 23:09:00','2019-11-26 23:09:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dasfdas'),(39,'2019-11-10 23:21:00','2019-11-29 23:21:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfasfs'),(40,'2019-11-17 23:22:00','2019-12-05 23:22:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsa'),(41,'2019-11-16 02:47:00','2019-12-06 02:47:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(42,'2019-11-07 02:53:00','2019-12-07 02:53:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(43,NULL,NULL,'N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(44,'2019-11-07 03:11:00','2019-12-06 03:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(45,'2019-11-22 03:11:00','2019-11-08 03:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(46,'2019-11-22 03:11:00','2019-11-08 03:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(47,'2019-11-22 03:11:00','2019-11-08 03:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(48,'2019-11-22 03:11:00','2019-11-08 03:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(49,'2019-11-07 03:14:00','2019-11-21 03:14:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'djfl;asdj;'),(50,'2019-11-07 03:14:00','2019-11-21 03:14:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'djfl;asdj;'),(51,'2019-11-03 03:23:00','2019-11-30 03:23:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(52,'2019-11-03 03:23:00','2019-11-30 03:23:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(53,'2019-11-02 03:45:00','2019-11-10 03:45:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdasf'),(54,'2019-11-15 03:47:00','2019-11-23 03:47:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dasfdas'),(55,'2019-11-01 04:05:00','2019-11-02 04:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sfdsdafsa'),(56,'2019-11-07 04:06:00','2019-11-29 04:06:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfa'),(57,'2019-11-17 04:06:00','2019-12-01 04:06:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfasfsd'),(58,'2019-11-16 04:08:00','2019-11-23 04:08:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(59,'2019-11-02 04:09:00','2019-11-24 04:09:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(60,'2019-11-01 04:09:00','2019-11-17 04:09:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'gfdfd'),(61,'2019-11-01 04:09:00','2019-11-17 04:09:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'gfdfd'),(62,'2019-11-03 04:14:00','2019-11-30 04:14:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfa'),(63,'2019-11-02 04:20:00','2019-11-24 04:20:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(64,'2019-11-02 04:20:00','2019-11-24 04:20:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(65,'2019-11-02 04:20:00','2019-11-24 04:20:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(66,'2019-11-02 04:20:00','2019-11-24 04:20:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(67,'2019-11-01 04:38:00','2019-11-30 04:38:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(68,'2019-11-01 04:38:00','2019-11-30 04:38:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(69,'2019-11-01 04:38:00','2019-11-30 04:38:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(70,'2019-11-01 04:38:00','2019-11-30 04:38:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(71,'2019-11-01 04:38:00','2019-11-30 04:38:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfas'),(72,'2019-11-02 04:54:00','2019-11-30 04:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(73,'2019-11-02 04:54:00','2019-11-30 04:54:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfas'),(74,'2019-11-03 04:56:00','2019-12-08 04:56:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfa'),(75,'2019-11-03 04:56:00','2019-12-08 04:56:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfa'),(76,'2019-11-01 05:03:00','2019-11-16 05:03:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdas'),(77,'2019-11-01 05:05:00','2019-11-29 05:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdsfas'),(78,'2019-11-01 05:05:00','2019-11-29 05:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdsfas'),(79,'2019-11-01 05:05:00','2019-11-29 05:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdsfas'),(80,'2019-11-01 05:05:00','2019-11-29 05:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdsfas'),(81,'2019-11-01 05:05:00','2019-11-29 05:05:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fdsfas'),(82,'2019-11-17 05:25:00','2019-11-27 05:25:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'fasddsafas'),(83,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(84,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(85,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(86,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(87,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(88,'2019-11-03 05:33:00','2019-11-24 05:33:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'afdads'),(89,'2019-11-02 05:42:00','2019-11-17 05:42:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfa'),(90,'2019-11-02 05:43:00','2019-11-17 05:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(91,'2019-11-02 05:43:00','2019-11-17 05:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(92,'2019-11-02 05:43:00','2019-11-17 05:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(93,'2019-11-02 05:43:00','2019-11-17 05:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfas'),(94,'2019-11-02 05:55:00','2019-12-01 05:55:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'xxxx'),(95,'2019-11-01 06:04:00','2019-11-30 06:04:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfa'),(96,'2019-11-02 06:07:00','2019-11-30 06:07:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsa'),(97,'2019-11-02 06:07:00','2019-11-30 06:07:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsa'),(98,'2019-11-01 06:10:00','2019-11-03 06:10:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dsfasfsa'),(99,'2019-11-01 06:12:00','2019-11-30 06:12:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfsafas'),(100,'2019-11-01 06:12:00','2019-11-10 06:12:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'pedidos'),(101,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(102,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(103,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(104,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(105,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(106,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(107,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(108,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(109,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(110,'2019-11-02 06:15:00','2019-11-24 06:15:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'dfsafsdfds'),(111,'2019-11-01 06:43:00','2019-11-23 06:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'xxxx'),(112,'2019-11-01 06:43:00','2019-11-23 06:43:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'xxxx'),(113,'2019-11-03 07:11:00','2019-11-24 07:11:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'sdfdsaf'),(114,'2019-11-09 08:30:00','2019-11-23 08:30:00','N',1,NULL,NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `sol_presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fec_creacion` datetime NOT NULL,
  `fec_confirmacion` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_solicitudes_estados1_idx` (`estado`),
  CONSTRAINT `fk_solicitudes_estados1` FOREIGN KEY (`estado`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,'2019-11-19 06:19:04',NULL,1),(2,'2019-11-19 06:24:27',NULL,1);
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timbrados`
--

DROP TABLE IF EXISTS `timbrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timbrados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timbrado` varchar(45) NOT NULL,
  `fec_validez` date NOT NULL,
  `tic_documento` varchar(10) NOT NULL,
  `borrado` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timbrados`
--

LOCK TABLES `timbrados` WRITE;
/*!40000 ALTER TABLE `timbrados` DISABLE KEYS */;
INSERT INTO `timbrados` VALUES (2,'12345678','2019-11-29','factura',0);
/*!40000 ALTER TABLE `timbrados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_documento`
--

DROP TABLE IF EXISTS `tip_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tip_documento_usuarios1_idx` (`usu_alta`),
  KEY `fk_tip_documento_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_tip_documento_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tip_documento_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_documento`
--

LOCK TABLES `tip_documento` WRITE;
/*!40000 ALTER TABLE `tip_documento` DISABLE KEYS */;
INSERT INTO `tip_documento` VALUES (1,'CÃ©dula',NULL,NULL,NULL,NULL),(2,'RUC',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tip_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_personas`
--

DROP TABLE IF EXISTS `tip_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip_personas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `abreviacion` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tip_personas_usuarios1_idx` (`usu_alta`),
  KEY `fk_tip_personas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_tip_personas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tip_personas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_personas`
--

LOCK TABLES `tip_personas` WRITE;
/*!40000 ALTER TABLE `tip_personas` DISABLE KEYS */;
INSERT INTO `tip_personas` VALUES (1,'Persona FÃ­sica',NULL,NULL,NULL,NULL,'PF'),(2,'Persona JurÃ­dica',NULL,NULL,NULL,NULL,'PJ');
/*!40000 ALTER TABLE `tip_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `men_portadora` text DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `solicitude` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transacciones_solicitudes1_idx` (`solicitude`),
  CONSTRAINT `fk_transacciones_solicitudes1` FOREIGN KEY (`solicitude`) REFERENCES `solicitudes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslados`
--

DROP TABLE IF EXISTS `traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traslados` (
  `id` int(11) NOT NULL,
  `dep_origen` int(11) NOT NULL,
  `dep_destino` int(11) DEFAULT NULL,
  `fec_solicitud` datetime DEFAULT NULL,
  `fec_pre_traslado` datetime DEFAULT NULL,
  `fec_traslado` datetime DEFAULT NULL,
  `vehiculo` int(11) NOT NULL,
  `chofer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_translados_depositos1_idx` (`dep_origen`),
  KEY `fk_translados_depositos2_idx` (`dep_destino`),
  KEY `fk_traslados_vehiculos1_idx` (`vehiculo`),
  KEY `fk_traslados_usuarios1_idx` (`chofer`),
  CONSTRAINT `fk_translados_depositos1` FOREIGN KEY (`dep_origen`) REFERENCES `depositos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_translados_depositos2` FOREIGN KEY (`dep_destino`) REFERENCES `depositos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traslados_usuarios1` FOREIGN KEY (`chofer`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_traslados_vehiculos1` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslados`
--

LOCK TABLES `traslados` WRITE;
/*!40000 ALTER TABLE `traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `persona` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `int_fallidos` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_personas1_idx` (`persona`),
  KEY `fk_usuarios_roles1_idx` (`role`),
  KEY `fk_usuarios_usuarios1_idx` (`usu_alta`),
  KEY `fk_usuarios_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_usuarios_personas1` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'bala','$2a$10$/VHTGQqz1KCjS.EnB8YuKeY8mnQ4hU4ljIwMas9K6ScEgauQb.dPm',1,1,1,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `capacidad` varchar(45) NOT NULL,
  `num_documento` varchar(45) NOT NULL,
  `matricula` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `chassis` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `borrado` smallint(6) NOT NULL,
  `anho` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vehiculos_usuarios1_idx` (`usu_alta`),
  KEY `fk_vehiculos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_vehiculos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculos`
--

LOCK TABLES `vehiculos` WRITE;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19 10:19:53

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
INSERT INTO `categorias` VALUES (1,'Electrodméstico',0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Refrigeración',0,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Tecnología',0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Climatización',0,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Lavado',0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Muebles',0,NULL,NULL,NULL,NULL,NULL,NULL),(7,'Deportes',0,NULL,NULL,NULL,NULL,NULL,NULL),(8,'Maquinas, herramientas y equipos',0,NULL,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `ciudades` VALUES (1,'	Asunción',1,NULL,NULL,NULL,NULL),(2,'Ciudad del Este',17,NULL,NULL,NULL,NULL),(3,'Luque',12,NULL,NULL,NULL,NULL),(4,'San Lorenzo',12,NULL,NULL,NULL,NULL),(5,'Capiatá',12,NULL,NULL,NULL,NULL),(6,'Lambaré',12,NULL,NULL,NULL,NULL),(7,'Fernando de la Mora',12,NULL,NULL,NULL,NULL),(8,'Limpio',12,NULL,NULL,NULL,NULL),(9,'Ñemby',12,NULL,NULL,NULL,NULL),(10,'Encarnación',8,NULL,NULL,NULL,NULL),(11,'Caaguazú',6,NULL,NULL,NULL,NULL),(12,'Coronel Oviedo',6,NULL,NULL,NULL,NULL),(13,'Pedro Juan Caballero',14,NULL,NULL,NULL,NULL),(14,'Itauguá',12,NULL,NULL,NULL,NULL);
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
INSERT INTO `departamentos` VALUES (1,'Capital',NULL,NULL,NULL,NULL),(2,'Concepción',NULL,NULL,NULL,NULL),(3,'San Pedro',NULL,NULL,NULL,NULL),(4,'Cordillera',NULL,NULL,NULL,NULL),(5,'Guairá',NULL,NULL,NULL,NULL),(6,'Caaguazú',NULL,NULL,NULL,NULL),(7,'Caazapá',NULL,NULL,NULL,NULL),(8,'Itaupúa',NULL,NULL,NULL,NULL),(9,'Misiones',NULL,NULL,NULL,NULL),(10,'Paraguarí',NULL,NULL,NULL,NULL),(11,'Alto Paraná',NULL,NULL,NULL,NULL),(12,'Central',NULL,NULL,NULL,NULL),(13,'Ñeembucú',NULL,NULL,NULL,NULL),(14,'Amamabay',NULL,NULL,NULL,NULL),(15,'Canindeyú',NULL,NULL,NULL,NULL),(16,'Presidente Ayes',NULL,NULL,NULL,NULL),(17,'Alto Paraguay',NULL,NULL,NULL,NULL),(18,'Boquerón',NULL,NULL,NULL,NULL),(19,'otroDepartamento',NULL,NULL,NULL,NULL),(20,'string',NULL,NULL,NULL,NULL),(21,'anotheroneasdfadfsa',NULL,NULL,NULL,NULL),(22,'asdfas',NULL,NULL,NULL,NULL),(23,'afdas',NULL,NULL,NULL,NULL),(24,'dsfasfdsfasdfsa',NULL,NULL,NULL,NULL),(25,'Captial',NULL,NULL,NULL,NULL),(26,'testxx',NULL,NULL,NULL,NULL);
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
INSERT INTO `imagenes` VALUES (23,'����\0JFIF\0,,\0\0���Exif\0\0II*\0\0\0\0\0\Z\0\0\0\0J\0\0\0\0\0\0\0R\0\0\0(\0\0\0\0\0\0\01\0\0\0\0Z\0\0\02\0\0\0\0f\0\0\0z\0\0\0,\0\0\0\0\0,\0\0\0\0\0GIMP 2.10.8\02019:10:28 11:04:27\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���ѤC�&#���^+��y&�k��q���ݨ⡀ʹm�v�m��nZU�uxߍ���H���kּR߾�}�x�_:�z*��	���[�\'0zӒ)%$\"3c�2����Jޤ�ZR�%���ʏ���\0<��\r>��3$1^FGr;ΐ���0����s�^��S�\\�~�?��ʏ���\0<�򮡴�����5ӯ�6�8�9����\0<���,�\0���\0*鿳/�KgqM:}ؐ���`�{�X.se��_����i�\0��\0�&�s�^)��@y�o�Zb�\\3��x�YOS�\\捴�\0���\0�M�<����\0�]Ci�J�~�!+��s���>�wR��s���;�`�\'x������uS�WNl.���$��~��ɦ���d韺h�\\�pGcHtR+.U�:�\\�$Rj�6�\'(���t��\0�`��ֽ�R�w�%������e���ȹP}k9�͔�,Ҧ	N	R)vT�)vP\"��Hc�[(�@|�vʱ�҈�8φ9k����庽��.A��r��M��?ֽ	W�ьn(�I���|RپU�Z�ɻY�z? ?ƽ��͝M��x��)�Y��R�?�gO�eK�FA�m(�1�\0k�+&������Ԛ�·O�Ԛ�^�UT.p23�=ʒ\'�o����!NH?�J�4Z��0�Ku{�r#��+A<��7%�����g��2NW���\0y�F��8��9,�V�$\n�e�L�Ӟ\ru���i�.������\\ω�H��-.�YdR�̓�s���%��Z`YI�0��*9��f�K1V1���\'\'���n���\\����R�E00\r��=A#�P��G$��@R23����UiΡ\r�m3�\\|����=*��55�wM� �!�R�������y$ 0�\'�ߗZ\0�-�����ź�^�c����j��o��R\0����5$�j�h�s���[�,/��I<���8f��~�\r�I�W�o���9�j�7�f�K����Jxӵ#S/�W��0�\0^����`E&����(�)Ry�D��\n�&\\L���]m�2Gp�+~����\\�.�CcH�>����:[��K����~`W�\0`?�q_CxF_��SL�������O	OU����-��*m���6U���(��F�:U�.�����p_w�\rF\'\"d���W���a�OñxoE��_̕�����c�+��S���x0\0�|������}�����9�h�W2w&�F��?��*in˟B�n�.,��f��������[#6uV_m�O�\Z�[�G�(�͸��T��0�����L��bi��[��(b��@�zq���i�k���1Uf��8�Z\\��Ԯ,���cq��y�8�?<����j�$�Z�3�&|�)��[Y�Q��\0B�\0O=����M4�w�o%�l\n.��px�*�haU��m�\\������Y\n\0�m����zg��Cm�Ir�\"h�+	1���TՙA�`���}�w���M\0]���v�շ!m�8���-͋Z���$��29��T)E7L��?�N@�$g���U��*ΰ��Ǽa�:t��N��7v�o9��\\��Nk��L]=o(����\0Kj�h�J�0��$�`�\n~F�L&\0>�W�|(���G�+�O��b%��*ԁiʴ� 4-8%H�R�|�pNjq=b��\n�]8G�V�5 ���3�0ҤN�N�\00-6Q���\n���k!�\0f�<��2b���]����g9�+\Z��ɷM�oP�x���E�J�̹�Dk��b�������\r��b���\ZI�]��QK1�\0ɭ��Ĥ3XE#\0����N���[x,��#�b@l:�5B1�*p���E6��W��[��*	�����RŮ�qF�a�\0��� 2�8�����֠���+�D~R���G߭C�]�^]y���I�?A@�-� R�1J�\0(��M���AY�닿µsT5�ʟQQ\"�T�aoa��/�gO� �p��j�d�tdz��I��Z���b�����\n�*�\n�*�H�T�V<���J�P@�ga!$��8ȫ*�����Ԃ��Q�v����Q����R���>S��^��u�iSjOa���d�4;�MyT�G�\0b�/��lМy��\Z�I�\nE�|#��j2�=Mt�	rRq\\��w�p?Z�p��I<V��h�\n靖6����cu�ZQ����s�@ۻ�\'�\rY�ҵ��V�y3�G�{�?_Ҩݦ�kqS�K��Q)$���5B#�F��ݮ$U�\r�޽?��S�\0�=zc��.�\\�\'s���\0�L�N� 1�*��q������x��ڵ�1}�N�#��?�Z\0[���2�0\\��8���n�о�eP��8��\0\\~t�D�iDip�����3����t�\0�}I�82���&:�s�@	m��Ψ�E��%�����S?��QI.�)\'؎�R����e�%#��p��\0�R��3�)!I��x1=?�:@:=�ha�<2ȥ�����m�^��\n��,��#5\"跤nG^���##���M��\"�FĻI����\0X�F�]xV89�?Ɩ�G���cp��@�2H��UY,f��Y��H۰��]]�Hʜl,q�q���{	l\n��u ���m������$��@�L��6���K)\r��]w�y<�^E��Q�\Z�mہ]\'�y<���d/ך�#ݐT蹦 ��T��j�k��*(�XQL	TqRMQOHB�E����b�(J��3�ҟ޷+��k�N�Җ��<_�o�.4�rLZ�����\0~��x�ϗj���k��?�o��US�G=Ų���]%���1��\0���s�7��?ʺ[Q+]� ;f.q��+TC4��Ya��q$�����}}i��\Z��1y��|��02}�[Tע�@�~\0\0p9����Z=s���e +���?:b(�U7�>ss�\'�>��s���u?9d��R�S&v�����=����G�+��{w͎�ү5��%h��@�����c\'4^�J�٦�y<���e#���jH?�m�(��䤲���z�14�Z�ϔ�%d}���<�*9�T��eH��6��1@b�/S�l,���F�=��y�Q�Gקz�b������\"�%� \0*�Y�q��,���Nr?�8��i�6�<��B��[9\'�?�I�u,�#�%\\���\0Vt/5�E���5�H=�����帙ϓ.Ҙ�O\'��P3@iZ��g�xS�+r���j�6{)R9\n�rB����?�&�ab��_�����{2�s��9�c?ΐ�W\Z\\���$(@ #9�\0\n���!��6��#��K�!�O\'5���l�\ZBջ��|�ioٝ��\"����kxn\'źD����\"���\n�G�B�:����?z��]8���@N��y��Ӂ� 9��8�NȪ\Z3M���;5����l��]>k��1�L�w<_�Rf��?@?R¸�����F��8mj���k���5�>rΘ3�G�	�+���I�h��~��4���Ϣ�޷����UP̌2	�%��u�y�#2��YNq�bjt�\\B�cT}�08�8�&�y�ȱ�����<� ��B�u�ҡLI�]���a�f�����Rf�c�,��r1�u=E>I��m �)m�ɒ=�s�Oz�=N�,J�������G~��ꗒ��ylK��(##8�f�s�Z���t᳿�a��׏�S�Q�p��dm������M-���Je�n��#5Q���1@I�E`��a�=EL��܍�K�������z�M��~b��/�@#��0Ge0�d{԰]K&)	%N\rT����E�/�@>�pɱ���M��)�<�c̑�76qU\0�\0h~u*�G�?:\0�\'��Ƒ���A~shM8��ͣ�j@gD�+GN��5;Y�\0��M��X�75r7�n�FF����>������T�T��<�y?���]S��d�S)�@*@i�:�p54��w\\��\rN�LF8j]�j\\Ԁ���x��v��+��\\��v��AS=������x�s�G��]�w��[?t�W:Mk����+�>���[H��R��Ջ��ć�?�t\Z}���y̅�V\\;�w�lK!�if\0I<޺D׬�fY��<�6�cv?���ҫϬ�HC�b\"u��V�~�\0b�o4��#�g\n��Mtt�Y���*H��+z�^��p,��6� `���5ƻ��o`T��q�������5�Ѣ<�:��p���t��#Xݎ\r���=S[w% Qg�6�L� ��Ê���AF�������\0d5��t2\r�3eO\0�&��+�Φ�1�;����U(��l`�������C�K��*7`\0�ĒpN;�Ҹ͍�Hј[z��G\'��~4�,�fI8]�d��Z�� �f2,0�T.0zw�ҟ�n�ݶ8rX���8��8�.�?�<���G�M:�\n@�P���֤>$�d(V�s�דK�/T(Y+Е����?*w`2K;�#�4.��nXc��sͳ�*����͒[2���r�:b��9��h@b�sVՏ�/��O�+=O5v�d���3�I��{O[t�B������x3I~��k�Z�d�Ӂ���<Z`J\Z�<Ty��4��4n���S�\r.j���?5��#}ڛ�\n�Y�\ryֺ��f9�Q=�����y����\0������s/�5Ąr��uG5��\r+�d��Q[�]�6�L��^<���������+@\Z:i5\rF����0r	S���O��G}��Io�\0��^z�r3�9�o}&�\0zb�ԝOHêB�N6��1���<���D-�ۇe.~a�	�Nk��=�L��07e�t���C�HPa^I�_q�VN�{oy<f�#U +\01�<`��\'54�C����3I�~i��i������j�\Z�\ZXV�<����U��yo��)��N�CWl��6�����z�\0�\Z�`��Q�����Q���I��\0\0�m����+��|%|��3�-�����VOpC�8\Zh��c����4x�\n`4�Lg����\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0�\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0��7��^�2���Cɀ@\0�1�-<���S�y5>���3�f2@�4쒔Yd%-� ��Y`��\Z�y!�I[\"\r\n2SA:�I%,\r\0X:���@@���� (m��C��[\n��7�ϭ�5koBa���XK�=C\0V�R14��\0P\r�P��N�/�ɔ���\nɌ@���\05x�9Ǧ������g�^���g��RL�)�E*\Z\r�T��� \nWQ�@�bFЉ�[I�J�1Y ��B\0��3*� F$\Zt���\\�E�V����}t�ƭh�`0% \Z�DR��\0Z�4��f�2�Lزg��Sb�~��[V�fP��H�%j�E�|�.�	�\rN�y�y�ɍ��$��R��\r$,2m!�j	\0�bV �b�*�\0�II\"V%�\Z�b�Hr����A*f�Q��?Ay�o�-��(4XX\n(4\0d�!�$\nD!�\\���=S������djڬ���	X�Hbq��r�����F��?��|���h��\0�(\0� bH\rP\0�`�\0\0\0�\n�` ��5d�;P�	hP�TL�	+&��*d��ftG�8_�`��LI@Ph�X�@5\0($@��+�ϽƵ��v�[y��Y:�f��(`ι~=9>q&3����~�5��k�A���gmcH�Z�&�A@ؑ��H`�\"�P���#oG�5D\\\\aTD��;�N�RHD��&�5#�J�`J�@\n�%��I+�.w�܎�c����c$h�(*c�\0$�\0�\0������\rg���9en�ɖ�\Z�Y�$BZ ��%ǧ+ê1\')���o\ry��Ú	@���;mb�����Yd�4$�Pf2Fԣ\nY1P:B�2�T�m\"G��:��K�M+�Ye4Ĳ���旝�ʂ�G�c_T篷�d�(0�8L\0�a+#B\0�C\0���\r�ϣm��W[�F�e��\0\0\0IZ��Ƹ�=��=b1�<_��	��gח�\ZBF%5��kp���	��kG)�&PnH�0�H�	cY�@΁j5��Ĵ���Pj�4[:���I��t�H����=��\"���&蘿�yec\n`1��\0a\n`*���0Q�Ξ����7=�V�2<�` Qxq�7�nw�Y�z����z����e�Ɛ�IQ��ka��< z*$&�L��y�Bj�ir*�j�f�,�H�QZ�<�-�3\"�J0��	Ev�q$G9��\0�3Ɉ�I�d(��C�b0�\0!�L@)h�aL s@1+g�?�{ϧY���6�5�\0\0C\0�~u�p���*5��z��>�:�ϙ��@�����\\���7&�iG�,��>3�T@#\"����<\0�)Z<:\0�g�OF5�\'D�J���a(g����n�r��º�x�$\n����:�Լ��YCc�\01�#�Y�\0�\0C�J��0\n2�FP��Z�3>�g�2�YMXf� \0\01��\\7�~=1�k?1����8�љ����i�k>���>���L\ZjOTl4�Ƣ;Ӟ�	Mx��ϟ(�q��ԝ>g�����je3V�J��t�q)Gu.��#�gI��f5�D�����r\'�<Ƕ4��Z�f��f5�f���2��o�M�k(`��!�\0��JD�\0�\n�J�$�(3�w��@�����\0ы 5sh�S�p�n��{�Lz�ʽ�4���&^\\�,��g����J���c �f<DV��bOz��f����ƻV|������&3yu���3<����g�:���Pv����8����nf�������l�&��fi���s�*��e��`\"�;���k��\'C�P�e���\r���ɂ\01\0L�\041\0�b�?$w�������!M�C�dP�I�Ƹ_7}o=Ʀ-c�^�\Z���Pf��Be��g���eG�� 腕�d�c\'ZS.)X��^Z�J١��K65���D^��sci&R�z�(�^s(�V�F�GA��>^P\0\n=,��|��5C(���\0����5*\0$�,6���,V�S�\\�ާ�ά�ƶB0�$\0Z.=8_?���cL=1�o���>sndl�J��]�w!	b�I�	l��S�@QE�\"D*��@2��\n\ni���$c�jƌ	K,��1&�\Z�′	B�}���ܟG�lt�P\0��ZIbh\Z�d k@�b΁�P4,��Z�g<�~�Vue5�QU��0+��Ӆ��<��4���yq��#�\0�kz��ԍv�G��<����z���z��4e�4�i�� �LbOi�CZ��n̦�8��c=k�6��k���Y󞆱���\nk1)�ā�=ǉ|\nVR�0��\Z�cr&���Lr}��뼶�T0(c(R\0��5PA,�kHl�΀\0d�X!\"?��й>���D����c(\Z�)B@�1��.�/�\\�$����_�\\��\"h\rC.�W�n�yn����Ӂ4��\Z��\0ͣϩ̝TI�י���PǙ6�j鎻7�t�a7V��ӗ�&��.��z.|�A.�� �t�^[34I�]#�����;~iX�j9�c����<���/�r��\Z� =Z����,��9����c�\rFe��Ӯ��ws4[TX#\0Pb�1����p�:�Ƨ�?�����3A�ש�뛔�=�錚s�(�o��c3��S�g�Y����A*�4zGfsC���r0��dG�|��������s�6�<5��4�q������n�} ���o+Sl��5����=�Ǒ>����[��1���)j�Y\"�@�b@h�9�1�\0Š<����@�k�}W\'�N��[,��\0j\0�F�8���wÖ+�n_4����m/�Y�	@`l5��B��.Z��C�d�ɇ\0��J�Qش��sL�f�4&��SD1梩��5�0ZTP�2KB$�El�Ѭ�MΡVЯ?e��O��~��mk5��сC\0��y�\0�ic$d�0���q�oyt�\n�F�\\�B�\0\0@\0���w�2�s����_�Pm���3LH\0͞��Ҭaj:�^M�@�r��J�M-3&���%Ma\nV	�5�vd�h�m����3�yD�<�\n-��-H5&;\Zk���T�k&��Y���y�Xr��X�=\0c���#�@��d�\0\0�����~�}�Mg\"�P����\n\0��o��أ�����ga��W�\r���^A�ߧ��g�=�2\"O%z�Djy�g����i�}7�_:����^�f\rmL�Z�3�Y6|�J_R����W\ZF�;,���C1\"66�r�����,��$��h�C%�,�y�������\rYm0(c(C`\Z�\0\n�cE�?�ϑY�m\"��j�T�D%I������]p�y�=�8G��[\njKT7���Y�e��b��)����^�a\r��7��v��x�v����ʙ�z+rkdН5`kΙEg�4j�P�4��Y�}�}*!PRA��`:E�.6�<q�yNw6U4�vP�W�Ԭ�^p���L�0���P�0�@1\rt��]B~�睜Q���1H\0\0\Z�k��ۚ�F-g���?ߏ��~Z�T�b#��v:ʆd��<���&Af�lC$r�*|�Y�S%S*VP�hH\n��4١]cf�3gR�H�g��J:��D�eT^VZ�3�bKS�sذ���#�ZϣY�8:��Ռ\n�c*\0�\0�c\0ьQC\Z!�b(T~:�gO�_�yg~d,�4\0\0\0�H��\Z�xv���Z��=�~7�-{r��2�(:=�۬���͒0�\0�@�u�,��c���Y\nb�\Zat������p�\"�R�F�XR�\"IMI�9��ѐ=e#LzϷ�u��>�:�(m2�t�c���\n�0(HX4@1P�L�i�Ϗ7��\'s3e�R�@��(���Nt��A��>c�����,��4��j3���%Ud��#�8*�i}ǌ�k��o%՞*��ϓ((�ͧ����\r�k�\'�V!�:uY\0Q�\Z�<���\n���j\0�b�3M\rbP���9��<��iìlz����c��_=RPڠT�(\n��@j�� %��\Z�\0\rX�?\Zzq����\'�frӕ�\n��R� &���>��&\rϕ�\'�ܲf��5A�γS:d�>�\"UdK�<��Φ��%�\Z����^��&y�;^��;�C�8ׄ��ٟ2sǱ=����h��r���)2i�{2��u�8i��1�O�f�{G���ǩ�R�NUX7��ǌy�����y�?F�[�F6�U1��V$��2�H)A���2��%�P~S�oH��@���*h`�hy���Y�qs�y�\'�����&_.Ca(\rl��f�wM2f}L�(��D�Z��S�o��U���k�Ms�k듞��tXf\Z��f`x��th���{��3tqzY���5;Ê��v��	-$�x.�\'�3vz�R֎���Mx�:��p���ϟ�~��_o*MX�@P@d�	�\n��DP\0���$`U0@�7�<_�9��0i�rh\Z��sܷ�y��s�W8w���|ܯ\\mL���ο�S5l3Y�cUR\"�%5#Ab��2�\Zj�)�B�\n���I�æ�5f:C��	@J*��-4%CVR�S3Co	��œю��g>���:���k�\'5-�XڡS(`0�B�\n��\0����B@#?�}��X�.5`!�\0��˜�ׅ��ś��/�{���L�u�%\0oY�u�,��(\n�bC!P�:=t(�Jh1fQ:1h�4CȆ-�P�c�@1��y;�9�R�4�k��W��a��ƓY�n/�JZ(��e2t;X��m��ƁT��\rXS!#��\'�NoU͎(m\0��\0a˘�׈��˛��v��_o���w��= R�Mg��`{�Yj�Ub2@f�tص�\Zeˏ�B���:<� �\0fPi%hdC��@A�@4d�����6Z��aU��2��5\Z�k����\"��T�)�WTPT9hR���U��SX-\n�b2\"�J���-��(\0�.[�N\'�|X��{��o��=q�]\\�H�����`P�lwy�fD��	���d�u���^D\"�@)P�I@0�b*\Z�P\n$�ͱ�C��p�4k2��Z�+L����&����\0&Yl���4)��Xє�(e\0U\"���k�R1�R	9�3�(6�e\00� ͗\'˧þ)�w<�~?5���I�53R\n	l����!@z+e�jf�Zd<F�-=z��<�(�h�2 BV4XH$\Z�d��*��A�\0sl�hv�UjcS�ez�K+L�\'�||�ϫ؜�	h�)��S@����Se:2�(E[`PIEՁ\')q�*V9��\0����yZ�����&8���{��6��PM&�Y��SHd�\0\n��Dz�\"��S\"��2@\0P���1 z!\Z�,�mMPKm1���eQmU�M2Y)��5�jk��&����T�P�ATT�  P#�c*�d��\0e1��,G)q�!h&��t�(d\'��3�^[�\\rb��ގ\\/���-�:��S@�\rަ�Rբ&�b�42�֔��t�bdZΡ�\0BP��\0b+$=M!2�hP�mP�r�X\Z��eq��g.�w�g_���?��nN��e�T�C�PʫX�`�\n,t�2Y�C3YE霖s�\ZeC�\0P� Z������9�gͽ�8�G=}����CH{���b�@!���P��&USJe�\n���!�<�\Z�`0����\0�k �qSTӒ��f�-&Vdf]��?WNZE�]����[L`2�(-�������,���+Z���q������i�(`\00�P�S\\G��;ϴg8l��������\Z���P}��Ԡ�b((@-&��%H�[J���\08c����`\0P0(j\0�1�z�妪[V՞����YFm(�o���.uSr}3*�`P�d\0VRX:�#(mQt�3\0�K,5�C%\"�B���P�P`\0\nĀ2�yӇ��C�sX4�O������]4�P�GgEf�Q����\'UB�f��\Z���P�����g�3hV1\0K`�t�\0�hF�\ZgH5�Tވ�gU5mSL�a�3x�IrYzdԳ[��7Ǚ��\\�[Š����e8\0���QUE�S6zt�=F5ȐYt1C8�F6��`\0P���.�t�t����:|����{c�x&�PH�gMg�S!#�\\��<��>t$v��<f���t��F��.��\'��˲<���b\rA%\n�hF����6CR�&�)X�j*)�h<��6�Lk$�,�2�G�yɾ<�~���f-4��:���P��2�\0�%Q��6�� (z1C\n�yh�\0�V\0dI��Ӆ��W���Ϭ|�ǌ��e!��\n���Y�#&����bj�a�6�/>�8қ��\ZC�:	���ΐӳʝe�8��W�g��Ѝ�e� \Z�%�Γ5�B,m������pg\\�K�oY�%�׊�zr���~�lm�2�,t�,���!C��QE����2��D!�@r|t�\"�,@@\0\0\0���Ӄ��[Ϭ�yu��{��]y�d�6�22la]n��YF���\"�$��^���fk̵��x\r���I�<G�@{r�Mr��ޖC4jR��Ѭ�CP�\n�(eka(\\��o7͝s�,�FK���y���`�˝��~��r��\02��TYb,�# T2����c*����J�KϦ-�\0 �\0k�s��y�x3�z��r�����6ns|��X�C�뷜��d%AjȬ��A�:z,��b�d#��d̑B��#0���6h\0` \"�@�iH�\0@��U��R����fa\\�Y�ϦM0��:r�C��U�YU�2�QEUP��d2\\���)��\0�d�EQ%	Z\0\"N[Ϧ=�`!���@HW��ӈ��Ǜ�t�x�����,�ư�4�\0�{=�\0�Z���\"P	\Z1Ι�4���c����S��C�d\ZФaABi�ǥ1���e����<h�|��\\�i��d�\\��r��Y����BԠ\0eP��`YEs&f�;(˥��\nQ\0\0\0\0)��V�	( D1%�9t�yu���w�/��xsɾM;Q��rAZ���(D\0�AR �@Q\Z0ΐ��y�f�1�B\"�qd�1�\0\Z`�!�\"���qC(x�F�����gYL�C=�rj���[��p����β(PPU�,�Y,�c3L�6r�t� PƮ�V4\0\0\0�<��i@\0�0\0�^K�N/�_>n=�.��i��M�iZX�;�KTd��5�BJ$�\0�)$y���y!��:X��JE��\0\00�\00��]��jڨ����gYL�c5;/SM�~k���>-�t-�1�Aqb��B�fB��de��(����I@\0\0\0r�t$\ZP�\0\0\0C\'�7��ۍ��c��;��Ƿ˧7��d@$�j�z�!IU\0���biH��[^���(4��r���ƴ,�79��qZ�ޚ���M�ٖ�P�6��ݚMd6��=z���g(��j��K�xr�e�)�rYZƗ\\�na?^qu��-�(��(e�Xd�T3.�CT�T\0\0\0\0\0r�t�&\Z\0� \0\Z��7�nG�\\�������.����\"#��최MH�w���++>�p��*\Z�$��nrq�k��³��D���hO5wyZ��;0U��2z��/<uzs&d��E}-f0[��58������C���q����e&g�a]W-�\\������e3\\޳��+sN~������)�E�c(����P���r�AV\0U2@�J\0\0����h��\0\0�\rl�Gܷ.��������Ojm���NTr�:�g\n��ˍ;��z���b�g��ܕZ3���9{��(��9��r\Zx����oO��R�!��\n0�OxNR�̳��O�	�]��eϞ�%b2�\nw�#Y^��\Z������֟:�Ig�7�d�#7��\\�S@~��>��@�j�2�]f$�!@J�C93&��ePI@\0\0\03��= \n\02(1\0F�^#�nk�\\f+��{9q^�>D�Y�ΉPB&ěM:]g\Z�ghjM�j	�ݦs�xm͔���X�~�L���$����V�/=f=Yi��Fb=�����yyv͕L9��g�KS\'zH� �͗I/6܍2Z��U��̾�5dK�S�f�˟�9O���,��Qc�e(��YD�B�ɣ\nc�$�\0\0\0���\r�����B�\0�4��˯=Ǯ#�.�y���q�t�`�\0��sy��ZL��	�#�F�vIR�@�A�\rJ���-�����D�0���SH`a2¬i`���d֯7O�d�9��fZ˩�e�\Z~��>��U5Eh�(�Yt��U3(Y�@)�Y%\0	Z\0\0\0s>}�h\0�\0\0�:@h���].��?\'�y�����]\\�T4�g}���T-&F�CZ��\Z �\\��Ph	,�e�)hVd	}�\n=D@Y��i2M��ZVz�}F�,��3KYEַ7I�^^�r��n�X�3�\"~��>�eƙZQ�E\0�d�(�d�(E[(�(t0(\0\0\0\0\0�x� \0\0l\0 �c\\\'�l�8k�^�\07�>�<��B%�@t���������s�xe؛����y\r6��셩��O3���.L\'��\Z�ЙM:�e<F�7k�3�;�y#M[l�ŝhO4�]d_�e��s;b6�o�d�mn3E#קKL�u�Z̆l������S;|�?p�H��f��+@��J�I��#51����P0\0\0\0\0��\0\0 \0��\0Q��1��}NzbL?�nCyٕ&�	�&�����F���\Z�V�Ot�aWʹ�o����Ʊd�Mn�y�$b:����D�s��\Z�����ѧ	�v��rh+s��=�>e.�Y�/s�5۟/�gS���ٯ1.s�\Z����DՄ�9�e�r��s��<{��3�nw�\'-d͢�+K�X��e(��e����\0u@\0\0\0\09�`\0\0\0PP@I�����[5�<���>����v�_tfI4�h:=ccK@yu�=E��Mta6�����;ns�k5׽���������Xc�b�:�w�{�����x*�r�I���X̢<�2�f��q���Y3�u X�z�&�q�9�Z�5e2��&u{�;�?]p�X��Eh�ɗ��1ՕY�X���t\0L\0\0\0\0\0�8�B\0\0�H�A\0s���}t�$�o?�ngSn`_&t�$*iPt�Ƕ��b+&!T��$@�NjYi [J�EP<��B������2�B�\neA-LU�.B���]�����y�*�-e2�)�O\\뎇���^����4���,\n��VB��\n�eP\0:��\0\0\0�x�\0�\0\0@ ���-�:��1\Zn��M��sZ��_5��@2�����50R��� �PQ�Hœ(�j��^j��=G�5b2�CМ��юPp\r����f��cZ󧗔��c�5d-��Q��c�l���ɷŢ�E�J�(�� ���I�4��.��`U!�\0\0����$\0`*\0���o�����#�����7?��5��&�\0*��3T�_N]��ӗ��tmr�\Z\r,���:�=�!���>i��y(r����ߡ�㍱��ɢ=���F��9�hB�Nlm�|����pj5|Mi\\򝄐l,��gN��7Y,�e,�h�jc	?crtX�����@�2V@,.r��ҀaT\0\n`0�\0�x�\n\0\0#A`#ŝq��q|:����n?8�p��\Zv�DB�;c j!��.���cYOf�����禾?X�����:#BY�Ӊҏ��d4�6�P���1��\\DY�7�oS>u��9������5��Am{��1����\Z띹�b�<�<������l_6Y,�e[F��-�)?_�v�1�QCљI.��EM�q\Z1�\0�)cP@\0\0s�v�D1�H�AX�x3�\'�N?�\\�N+��{|�\\]�h$	tgc�YZ���,��Q�Ւ�g�������]Tk\rq�=ƇNh�w�n��|�\0lEMu���f#S�h���q�kk�vQ��Tz�t$�ef�1�Z޼��fb2k(StU�M>/�+�!�2I���٤O�\\��=�c`2����Y\0,W,��ACF5�fBh(C$��\0D�\0�J�`%�e�r��q퉬G��p��\Ze�.�5	���]�\0��]��h�� �1�� �I�	S>����Մ��d�\0�YE]��)(��i���@-IsU�Jyrɛ�̔U#Zl�Z����jʶ�L���2�0X�2ܲZ����(aL@c,�0��:\n\0��\0���S�˧+Ƕ����?������sP��4����c\0�&-�M\"Y�CЩ��F���PL�J��A��CTT��.4��^@�U�0�X�\Zc_�L܆D�]��s<�~�寫��܃J��2�1%)r�h)�d�J�\0���\n9�;\n$\nGL$��@#M�p�zs\\z�����ǐ�s����ʄ�\r�b���5mK;fKq5����y������!D):���\'x֍4�U!�2*a�;�zɩ�d��\r<G<P5�yr�՝��6i�=1�6X{�wW���d���8����W3�(�ճ{�/�7��#g��O��݁�eeh�1�AE��l�j��C�\0\0cM-�\0C\"�$��@I�θ^=9�=qۇ\\�Y���w�-��$J��&�Ʀ��G|��KkW[Sɖ#�Tn�A&S�Vg�r�n�3���3�25�2�4n2�\Z��4ь��/=h�l4��\Z��ZX�\\-6�z�՛��p�O6���:9��/9�Ӟi��+���9�H�#T�M�\"��}��~����=��`Qz# � �!BdlB+@:\0��f���\0\0��%�q���\\7.�zİ�(�y����ٚL�\rPY �ӹ����-�[�庻㠬1���Q�7G����C�P���r\'У�:X厧MI���i�Q��e����w��3]����jj��VrH�,�MY��e�5U� ��^V^Y�hb�+,d��oQ��dj���>^ӕ>�\0��>;�QaV=Ֆ�̂(ë1\n�\n ��J%S�J#4�C�0\0��1�s��˶���q�Ƚ�~?�sW��f��\0�Y��<��z�2��� �r�\r��f����\n�\\u��\n���ԑd��G%4�\nPb2��AK@2����TɕS.Z��Mn7�ʋ25z�k�1��9���~�㼃t�L�VR2� ���\\�eh������݀\0I@M\0d17��\\/��{�a�~A���o;=�A�N�&}s��tY8J�Q*��Ȅ-\0\0���J�$�D\0H�l��r �)X�e�%2���&\Z�y[BP�dM6X\Z�kE4�%4ϦMg7����r�c�y!��RP�2h�e�@XUd�L�R@Eh�P�f���\0J\0� C�-�\\7>��{�ϛY�׿�-��!�Ơ\0Z������G��e\n�!lep��z��cD01�n2ӑ� b�\r�@t��@�2��YB�^Hz�ySM,\n(��\Z��A�92e��Zͬ���WQ��;�;YH�%�EYS%\"�(��\0+@�if���J$`!�\0\0T�4��=p�z���σx����su��Τ\r\0��i�م�r�o\r��׳�\Z���9oO��C���4f#j�Ó<�i\'\r��II&��d�1�:<�)�J(�\0(YCZ\Z0,���ƃ=r�%�d��928���;��Ce^�<�\0ǣ(P�M1aLc�\02@�s�\Z�\0\0C\n��=q{���&��?���n�9�ΐZ ��i��Je�t�I�7zs�{���+���_f�B3�k���g�RN(ۛ�x�5���d�%A�2J��ƙ@	c\npơb(\n �KeeQ��򜄫3wr�#\"=����Yd`2��H�2����4�@] f��(	��s�0\n\0\0\02�?�N+�O&w��~,����[�<�P,����g{�:<�2\'ls��<5��L�15�<t�]�5�G��ӛSNl�f�M~i�� 2�-�\"�Ci�͌`QV���F5fE�h�ՁER3�.�\Z�	z�z��=�/�>7���CVA�B(�(E�02SD�SCe��ړI�\0�LP\0\0�H2	�7�N/�O>w��[�?��ys���Y�9ZA.�Ss�-J��QW 5h�N�\0�g[\Z,I%$�r��1���\"�c��0F5e(�R��P�J<R�q�)iz�e2�X\r�n�_��om���PZ# �:d̦!#t��*�F�����I�\0d�H2\0�no���|�Y�z9����L��)��&�����Y��@����h��e^t�2�e�+1� CS����Y	j�E��(��AT\"�\n�ȹ\0����\"�u׋7!z�l�\"��Լ�~�����1���Y�Ĕ\n� P�@��@hy�\0\0\0T�\Z��3y=qe�8?g��No������t:��Ⴒ�K,m$\n�$�-gL�&u@�2�,�c�e\0TC2K@�H�i	\0�P�T8�@1�P��QC�I<˨μY�z�C%�F�\r��~�㯦sՌc(�YE臕�V��\02�(��:`P\0h���@i�` \\�B5�ǧ+�����ν���O-a�4M,Vc�@Y��l,bF+\rP�(MH�[6��L \n����Yg%$�B�C�ڙ\0FU\"�`QTZ� Q`�RX�CD`�M�x1FC&�b�A����W�Xӊ@�E�-�h�P�A�$EH���!\Z<��\0\0 �\04��ǧ5���,����ߖ���jeD�Hvtz�����\0�ԃ1M�\"\0(C�r�I�YB$\0��*�SJF$���# �E-P#,cVRQJ\0�J<��s�%�-�CLGE��G�W��H\0��,� �Y+@ĥ�T$����2�*`�e\nD�Q% \0I���~=��[��ʽܹ^ܼf�D�\"5F@Y��z���AV$�JSR�JĈ���jU3$��$�z�\"\0 U������c�2���1�c1[���b�Im[6����y�w7�y\\��Z*�h��@\n��UCTR V���̃�:@�D\Z���E�pb��/��-�M�&���6��\\��ϫQ5eԌ`@�!�!#\Z�R	p��1�H\"1��5y��dLA^��B3	5�,�w&�niT1�PP�6�u���+Us�2Y���y#�ߢ�ZVP�P�RZP�V�e����)��̈�VH�!YF�d\0�\0\0��q�=�|7�|n7 �r�:�`�ag@�4���F�ꠙh���5z�+��:-On^}ǒN���V�k9��du�^GJ�ɼ9c��Q��)�^�.4�#������S�<Zk$���Ӯ��W>y\r��@8�t�~k¶��o�i5E+0٨ε8�ȖV�e�1e�fr�ڹ��\\��)B��@0+S!��L��k%%��B�D���\0IƼ�-����q�f-��Ƿ�5��ٛ�S4%IY��>��mf�9�fn�^y�Nzt���������J�x���C����^�K�i5�7yzL&���o�ӗ!��;L�\Zz��b<&*ޞ��6�Y��ۚ:�rG��!�3(ᦓMx�Z#SM5��A�FM�.K0��fs��9�ռ��ePX�\"��F \"�b��,�\0\n$�9���`P�D���9o���[������^�\0>�o{Y�ԴfH\0w=V���\"��u�Y�8㰳٦���=�<u�z��f����#��Q���6ܡ�i8C�]a�LKҚ�>�5�Orx�D��Ӵ1��%wd�x,�i�a��Ht�y�v�guכ->]��,�SL�5Y֓Rђ�R�Y��3Dw�~���5C�4����ZX �H%��\Z��\0A���+`\0\n\0�-�\\�k�`�t�ƽ����4� \0;��Y�X�I����O.Yα87�G<m�A��<����O��^4G��gO1K�\"Lf%�&�D�R1S�����&�T��/Te�YK��r�(,��Z,ۣ%���bηyjN��O\'�i�E(	ak�\"�\0\0��P�id�1�H:F�sE�\0� \0@ȼ�-q|{x3\'M/Y�_.�qֿ%6	�m N�\\ޫcQ�[2�Ֆ�@)H��Z�ɨ& ��H��,��ȚC�*�!�\0�[O\"�B�1�\0S2�������4ֵ���,��sZmq|&�?gy��V��JlCa�\r�P�$�P�\n�c�4\"�$��1/�y.Z�x��fN��i�W.�&|���M�@�/9�`���܁���*d����yJ�& �DM\"n<yD�@�Q��$aH2c�m<��j�(E�U\0QVXU�����E�e�l�6X�ܿ�<�u+�TR0��ƌ5hH�0Z$�@�ALc>�\n�\"�	\nC�xr���������9����Qnџo�b@�ױ�Ǽ�S:�d�4#ޙQ&�Յ̕[Sۛ�&��a4���~|o�^��#���cju��Eq0�J�H#�ʋ\0��1�X�56]�KC�6m�|K�s���2�=�̙c�G+�b��5`PP/@H� z�$��L�(��\0�\n��,���������8_O>��S.͝vo�C@�׵��� �:�g��L��45�H˞:j��U�5k�6��7u�k���L�Z{�<���`��Cik3(L�r�\"�2#jP�1��,`1̅4�hk4�U13��_\Z�����2�O^^�?,��W��\n�Z�e\n�B/D4bɕ�	l���F2�naAR�\0��R�W��Ӕ��cO����z1�]�:����*!�i��Va�B�;y=�f���Wxp��;I$�[���ʸO%m��\\&����<檨͖a�+\"\n�B�J�*6��!�;����Y���QY�-�rSL�<o�]�E3�W*�dΫ/�<oб�4cTX�0�`P\0єIK#FAcV1�E؎i�:EJ1S���/˧-ϤF$�������ojΛ:�@R�3m;���2H�&x=,�Pe���%@�y�e���i���c@�\0Z\"2\0P)��(6P�PC(FP�1�J*Ji�3K���r�[j����]�<�~����-�Ke:P\0#\0�BD \Z����s7�A@\n� ���9t��r�|��ǖ�m��*\'1�T1綹�h�Ѩdi�U�2!P�P�e@a�rƒ�9�M!Q4(	E,�Z\01�3E\0��.V*��t�iC��z�z:���gg���4�U�__�C�@�+\Z0��\r-\0EcX��\0�2Q��\\�+�Mw�O����}3��3�T��A苙�|�<�^��uMD�R)@D�$�Lq��s!��\0�����Jd\",��<��42�\0*�\nVU13F[��K�yM_>�1���2E�S�g����_o�e(P�P1�\0�H�0\0��P�1��9}b�L�+\0\0�+���y��������g=���i��3@Vz�:vpJ��Y#���$C�-@�C�((	Dc�DD\n�C�B��A\0�C�b�\01�H�*��(E�QV�Kc��js�#B������ꓐ?E����-2�\"�J� 4b(K@4SX���5\n�`	��7���OϤ�&>!��ڣ�j�@CP67;��6eB�j�@ \rFBP]K.�M�RI� WI�\0�A�J�\04����)�������R0҇kLz�R�5y��T�\r�/zɑ\'^���<?Gq�R�(@P�����@2@\n\0��Cg\'�8\n\0)P\0�^:�yt���n���o�ϫ��ש�Z!�\0f6�����f�a�+�\n��b�4Tǐ�+jl��,؉� 	a)Q���\0�ꈙ��X�mP3m\Zɑ�L��V<�OA�X�^w�ȦP̆A/ZΚϫs~�㧕h\rh@P1�\0э@@\Z�u�h4e`r;��!�P�$#�ټ_.��z�g�y������z]u���\0�n��;M!�)c�d�I�t�1h�2�`v��s:���*�Ȩ��	IhL�]1LЋQi4&m�VOTe�Ĭ���A��e߂P�Y�KԳ���<߫���@V��AA@1�4\0C�\rJ�\r�(���\05\0\0\0\0\01! 02@\"3A#$4P%5BD6&C��\0\0�p��!A��kR�Ҫގ���zrng+�T����Y��f*�zǥ�?6����Rnc�b�i�F>������z8��A�C��\0�\ZX������(`^����\0�ϩ�K?2�����\"?͵3?\"��c�#��ކ���:���Z�з�G�3�PR�b�j�#����Vަ~i��n��>��iMͤ���u���(5ϩ��U�=\\w�\\o�韓����ޡ��f0��>�x;A��Z4��w!���%⟣k]Z蚅tM+�m@Ͱвm]j��WF�k�m]#j��F޺6��7���t���B�f�Ҷ���t�WF޺F�]#z�WH޺6��7��\n�Ю�\Z葡b�t	WBA���Ж�WAz�+��^]]\0ח�k�ԯ/R�/��W@�tW@�tkWF�tkWH�t��N�x\nxG���+�5r\Z�F���hW��|��j�74eg૰?F���`��>�٬�����3[[LVj�j��j�}��~}U���kU��V�Z�k�U\\B��s�s��\\�s׈p���z�5s��4�)��.页pI�_���\\I\\67��Ka���q �\0���?g�;n�V���\ro�k��\\z��6��OpO���\0&ڍ3v�¦�?��Hj5�Ƥh�Wd��잶�G�{1��X���\0�΁؎p��9R�\0�\Z{��7��\'�\0:� ��=��������u�)��6�aם�c�_\ZڭV�ڶG�U�%�9�kk�-��&l�idTnf�VsF/)��\"�U�������j�c\\w���ڏ��*����/�6�\'t�m\\\'��S������0�$ڜ��V��J�#��=$jQ��	Q�#d\Zƶl�rq�QEfqh6�`Ӥ�g�,��J�T�^aH�nY1f��I ų6���1���Y��t�:Vl\Z�d�F.\Z�7k,ɟGTL��l����<��tܐ�pF-2~�5�\\��5���rL54�{V��%�ΪɊ* ��V}A��\0���A�l�08k�D3����E�<T��a|Zg��W�9R/� �!h��c�2{\Z�*Fu<Zැ���*�_$yȜ{���j�%�GaX,�r[m�J��������0����o������s6O.}���m�(����J5�J��[$݂�J���1�U���Uh�4#�0x�#\Z=E�zR�����f)0�r�&��1p���n\\��ɖ=�3�2��j�>Ef��.v������̺-�Y��n/��R�>I��\r6�o��lȦ�[�3o&Q�q��\"���U8�2|<�h=��U��4N����!�F|��ڠua��,��!��o�����09�0¹ �m<��ϙB�rRy��aey����8:�����{���rA�Č������\n�]��N)���v�3sH-��F�n�hRg�ǩ����a�{$.Q�&�D��z��0���p7P��Y\Z�W+��|e��v�u�+wn�N�ؑ� �\\ʪ�ⴳ���߁x��x���ӽ��\r�����ªs��\0�k�n�g�eƸWu�ǯ�r4��P���{�u�tr���\n�t޹F�+>�5��s�I��b�~t�>���r�u�c[i�>�y��_t[c��x��c�g[z <��/}�\0�8uN>����Q����=���c��*����x�Bf��#��tUl� ��p��E�R��;��D¹c_�����<^���IGH9��Y�������% Tjg�p�;h�N��1�C�#˼`刡�r�����c��u��j8ˬ�\n�9#]�I�Ysk�\0����X��H̿\"gt\r\rr\ng��L����BCK^�#�1��8i�A���s4W]�	�-	���/�)�-w�S��\01na;Sݷ��M�x[s��ܨS�������h�\\��u��Oo���r$�\'.����\"J88�4w\"E��:���_���P�9�89Yg*������IO�q%\r51p��o���73�=S	�zIe���W��2.�Md��\r(p��Y��λr�Oʦ�.W�̣~$3��=4@$�0�Y$��OL���d�2,�>q���NG��]j��B<v��j\r\Z�^\ZA�_��Ϙ\0������r+ʝ�M8�O,v�1\rnm\rNw\'~Qm�	=����Q&��}?L<�$~�D/1��r�num�����ڭ�U۳8�z�?>~)���=\"��(��ɴ�|Ȯ�]��K�QK�M�ϙ&I�$Ϋ�J�s,��?PIr��g\n~����K<vEg������[L<j��\'.�y�n�ˑlI�<�U´�ʬ�s0w�YW�s2�����5��ɥ���V�8+eח#�.�v��B>Y)J?]R��˔�$�HG�4eZ&���5\Z�X*�[�t�\rA��̔X�2��6J��ܪ��ߞY�Yh��{�\Z/�{��$6W���-�.;׸�ԏ������}Ɔ�\rh��72^���2�vu��U�s]���tnk�s]���D�7�.ѹ����F�+�^�-釫�0>d�C�>��g����kpҶ�.>~t����᳈-[6��[��mg�fG���#���Հk:p�	�xI׆@�BW!k���Z�\n��MnE��W)jgiK_O\"~)x*r�{s��_��\n*hBx�y�}�\\[���-Y�R�o�4ڜ��O������\\�nY�٧�_��\0`x����_���R�\\�;*-�|�~f�.���dt�h����	S��Dr4uܧ ���Z:T�\"�gu�,��OD�o�� �������4c\r#MXB��歔U�s5c[�F��bV0h��U�kg���VD�b�	�\0�4l�P�aY,h����(fn*�6��O$o\nG\r|�^%j��l�A�E�\\�\Z� -5�j-��9Z(�Ac.�� F�Ģh�	�%uSۮ;��Ta���K�zKr�O�?�/+?�⟎�\rq�!����\0_�7[�=�\"�F��:1�)�W�cQY\nY��x��\\���`ϧ;�lu��dn���1Vl��U;��S�ƶ�t�	�e�7+U��I2p�Rl��o%ݱ���kV�ph����bnƟ��M_��Ҭ�0�F&�Ϛ$dó]��\n*�.������\Z5��O����\Z��E3H�$P;�����J�X����0a\Zn�$�Œ����HebAV���=��;*�)��(��?��Z��,\Z�^;v?�?�hk��ZDy-�m��Ό�aX�Qv�<Pɻ_������W�#_�W�5���~�g_�W��u���~�g_��W��U���W���n�ι�:�\\կ�hoE1�_�EUM^\"�8U�u*ʔ<u�\n��DYbk�Mٮ��:nF���?T�A%�Dz����Bn���N�r�!P�T��s{mD�G���Ç��֬v[Lw@[�����Ƴۿ��:F�{;�[վ�����\0>�զ{0w[�A�� �<GƵc[v��\n�r�g�v��\r��x����~��MyW��H6u���ٶ����t��\\�3�i:�p��S\"�ۊ;e�P\"����YS9`�s�,],z&][���-z$#u�Ac�Z�3�SS$U�7&!�w�NTU00`���A(�g�W ДB�M�-��5a�-.�v�V�Y#K�]�+�#u;E�E�fj5���\Z\"��������mM�X���zWt��n	?�>M��{�\0\Z[�)����v/\0�ວ��:\r9����D�������\Z��?r��#�K1�z���[&���~~����2r���S��!YD��߻o\\D>+\n���]�f$BW��H��\'Ċ��<O7.��\'�nQ���oS�2Ѩx��r��J�Yw���f��Se11$1�z�?�x�K\r�9K�at�n\n���#)�\ZIO\rI���M��\n��WLQ�_�A�;�dP��!���-�J�t$�Ȣ��\01������۷(ƭ2���9���U(w@�+���>F{�~�V;!��S�\n�4�!>\0��{�=w���������>Ʃ0�B5�s5���N����x��l�z�?!��y�A}\"��t��7Y��oT0Y\n}4G��Ř�<�P��z�N��ՙbw��M�OH��VNQ���K0x��f���H��oÖ]��^B�ǕIԌ��*p�2��ג�\Z�aM��r�>E�4y�@E��=f}Ĝ�y7�����!�p��NB%����?�q�5�F��dh����\'\rd�N��������#<Gb_ԓ�;6��!eu�f�zS`&���)�\0�ߟW\Z۳��z�Z�7�L�YHv^_�\r�T�ߡ��޲tv3���ؠ��\"QI.���MȸB�UU͊e,�QE��s��-�L:���Ɗ���S������\r1�j�Z�\\��Ki�z�oV�Ɗk�@���\0�wN=�V�G�D��r�7>�Ԟ�P���[L�_ѿ��y��M������z��!�g�ՏCj���~�n]3[^�g�V�U�t�#�=sӱ����Ll���=��(ٯ�bA���kjٿP��%1�a���qM�βN�dw�\'d��J�|>a+�k1p�!g��d�6���+�k�;zv���8��u�m\rM�����r�.=l���d{-�j�\Z���X�V-rڇ���\"\"���������56nX��b���=�n��晦�\"��\rN�to���&������/$2Sxe�*�ѓ:�7�ݬM��0FnUOLi����ƙ��s����4��\n�?*��^�� �k�?���B���%����{R>τ�Q�C\\Bk0w�\rS�l�{0����Au[*�ċ�ZbE���Y�rMSr��öz��#?*�r��Y�<cN�_�fe��U�P,��;�X�?�\r�~�m�G�/�$�vG�i���m�\Z�5Z�j�k4^j�nr������|%��h��/�ߛ�Rް۽��r?>�|z��~�g��9~D\r��?<o�(_[im>�ɾ�m�%�!m9h	˧/ {���)=�	|=�\r\rq1�O`G`Sf��\\�in�jޖ~F{�ێ�z��}�ѣ���~����?4O��m�����\n�Z�)�Q,�1k4p�Z�X���>�}CCC\\I��?���=�w���O���|�U���cP�5�_�:��g\\\"~x�Z�ߊ��\n�*��}@)��@\n��B��\\�\n�xtZ/�sO�\'��)1��iϲ��\Z�-�4@F��{s�U�`Ph�a[��<{�ϥ��e�Պ����k�&־��h��_�m�~8Ӛ}���R���ҧ{z�k�sV45f��<;��#\Z��=��L�X�Z�f�n{3ٟ�������к;��v�����z�Pw_Kij�b����X���^`�����\0�|��T�}MN~�g#u��{��?�k��e��&\\*�A�:�h�:��G@y�I��e�B��#Ñ�N��\r�m�\0�ذXcX����t:24��)�*i��h�Ǔь��0�g��5X�>�W��f�d�QM��#*�\r��I8��)�h�IHt�	�>~{3����\r{	�c���+�g�jؠ�oG\0\n%뛲ކ~ �N��hh�0��u����c=�vp�\rԫ�̇G�É*�^e�`���ʰLҎ���I@�xd���8� RA��9Ǉ�?�1�\0\'�M����tn�>p_Uh�g)<�t�~*�s�?A\"�jag/ߺh�=;z�3�s��js���+��Yϫ˧%���5a\nڭ􅨻�Ÿ�{W��՟O?����iM���Gu�g;���f��I�hO<�\ZFI�:��xT���\"rO�<<�M+��z��m&\0YY$��8�Õ���-�I�����No\' ̪�x��LʮF�38�IA��=*��NIʇx����\"�9r����X���SjSe4\rsK��}�a�����\n��q��3E_{f�m��-��Z�\r���m�Ɯ{�iٹPGd	��{�\r��=��\0[��{s�{s�C�~�����Z�8{���?x��@;�\Z\r�\0��k4>��mE�Ǯ]��\n�wK{�jP�e�D�6�����$��n>.k��?\r\\9ޠ�(4\Zc�\'*�,�)ɹ{1���j\0ӛ�\n-�HV�V�������-��jlܱ�},	�kB7�.md}�������g��z��Ͽ@�m��/w\r��fՏKk��m@*�M��\' \r�t���<�}�5�#f?�@���c���6�A���={i��|9�.��l�N�g1G�a�n����!���4[�Y��~t��S��q��%��rM��Gް}u�H�:��*�}q�ك���fL��8�[V{���\0H\0#O\"�1J�僦e��:<h�p������s��R��@��1\n��*9+Xe�K�jk����<��B\n���ݴ�e�*�@��{�dF��\Z������\Z�s�%�Qڿ�����}�@�Y��f�V-�ż~.������E}��\Zp��%tvrS�R�%��!×KE:E��[�{��FN��k�Y��v��E��Uٳy�$T�Y\'_��ت��t|ue!طg���_��V�FY	(��9n�T�0t��%Gew\n\rZ0f��=#Б�=h�m\"��Jy�j#�j��@JƢ�\"D�Eq\'l�l�{0Xv�%#���\'��Ѻr,�h�m(�n�ā�`٪9�UP�7؈�G�����zV:?�I�G,�)���>�\n\r�\n\r��@\0R�5�p���w[\\W(�^��j&��f�W���\\S�6hk�ws+����n��}`�ڳ�������R������~���΁��Q�+��3F�6���ǆ���n����N�^��H��i�Nχ�r�@;>lQ��tN��d$X&�e���M1ē}@�G��=�:$�ѐ�M�F*K��ҏX%�;�G�p��\'+�L�Q(�T^����n�J\\NW�L�cq$�7}FjmS��q��Rj5��p:/��=3���)��\\^ T4����@�5<�c8�Tȵ��\"5��\Z��:�ٵ�h�Iٷ���EH�t�r��T�3O6Y��`nW�{�����\r�4Z\Z�!A���9��4:q\0����\0%�7�`t��r���Q�\0��nʗ.T�t�˙GN�?���~(�2\r8��&��<I�q�k4�����b��^?�\"LS��	=&D�Ϳ`G�ݿU��Ʃ��5j��3|��8Yʨ�tTy*��8v����>xRMI��QT���,��6;�J#�2�E�IC��4WU��e�eܸr8����Y��+�w�&����u\\.�B�J a-\\@Ls�YE�\Z1�}\0�\n\r-Ir	���\\���f��E�~�n�K�\n7Ѯ{�A�}#�=f��JΙ\0��GC`z:�K���_S�i�������sc�5Ϡ\Zg���\0\'�(ioe�����fZ{V��{\\zY�[V��\0�Y��c]�\0�\Zw������4ãs,�;�����Kj[wZ���UEDM�.��P�s�.ٖ��m��FAb����f�\n�ze�;����ݲΕu�uϠ���PPo�ϲOꫲ����m�k����Z��5k׶�E���l;��\rJ4��u\"��B l�{	�i	\Z�6(�W�4X4Y�T�����*xiD�g�NfậT�,\n��l�p�[_,���`%B&9����NvJv�L$۵a+*�t��bM�;�H#�Ζ(T?�s<|��!�D]�j̞��~\"���ɱ.���I9�h�8Qe�\"+�#S���9s5 �z�6�Om0�R\r�� V�	\Z�Il��L[ɷ�G� &�F�*��\"�iGB��8��х�ꑉ��௘�#�ư&���\Z�����e�%[8��oC��q�P\\\0(w��v~y���s���rz9y��\r���8Ery�:m��D�������ʽn�zq\' IE�ik��S~��\0**LC��o��O��$	\r��ʼ�WNm�KM-�ʴ#&�6�w/�n�}����$j��\"+��\\�[��;�q����4���<��eM)0T]���洤��`������H��S6�,ݹ���t�X)?*�sQ�u/�G�w1(����9ZP��ix�p�Y���`�)4��rnxR�\rb���g$H�����ނ�U�E��B�pr�X��vb��{Qw�oE�׮Z���a�9��,6\"{�&G���w�{k\Zÿ�`e���$�5\\�(���C\ZEM��>�#���t���eM����v�S�\'2+\ZT�\Zψdŏ�`݄�N$$���M�\ZWN��f�\"i��y>��l�߰A���k�U�n��r�������v\Z6x��~�ܾt��$���2�Y�˙%�@�c�t��B�s��p�˂\'�N%YC��p�n���פĥ9�cۧ\\�Y�������6ƫڂ�m�����\0�p���\\k�3V�*׫Z���C��o�!��ᩇ��~�\ZxnV�⇹�����\0|m��[\Z��ǡ�K>�wq��}�1AA�-�&_����@��j��ޱ[ժ��X�k�1���{���f��˝��-��g�5jƸ��ƖӔm�l���E�yBQ)���J1LA�m	 ��h��˼+�ޢ�[e�4��ْ�=��?;�c\\Vkz�l:Z����Z�\0�_�-O)o~���_��0���)��c��Yu5�LD�Q�ר�������Z<�J�����\"���Rf��E����uڹjv�9� Y`����$�Axy&麉~�7q/ؤ�s��4��y�o5�f�̂�p���G�|�^0�Fq�?���ysj4<����H\0�m�G���j����N���9�\0���EB-��	G\"�O�6]��kD\Z����\Z�Vt���x�ɧ*�6/(�1���-�$[T�	\rGnS*.5^���к��#���\r�F�`w���A[\r���PV�񖧔��N#�:�0Gs���c���4���Ȋ*,uU�l�����	��8����������p�c�z����PS���D٨�]{��ڲ�.�s?5\"t]�_M�]��qR�,�tEϔ���\nG�M�����\0/�����\\��I���\r.��.l��p��/�8;F�F7�\\ǼA�;P�E��|@�T]q;�_J�3q�Jx��@��2?�d%�-#!f%V�SMٖ�,�DL�q���s�D��R�NAX�\'�h��êgR�������ߠm����\"ؐ�g�0{�wZ�@�ɶ���sAC�Z�\0���=P寇�G�\rq ٳ��29o�z\r�c���m�ұ\\>��2Q��H�� Mz�c!	��M���4s+�I��ȷo�N)uOΥB>${��E4x3�j��<����S��ĢOϤ��^2C w��fb���zʝuh�c�>��L9A�N!|ͷ�Ht�v�\0�Na����fº�X8�c��\\\n��J;EK�+�۬�#��t;����Z�㧧\'GeQc�U�.�H�������M|eD��1�ڧ���m@�h��q;>�-�ǡ�ƅ��nZ���֯�(h=-�Š5�K���^\'�Kڍ#�>�e��F�j�n4�� #يθ�ڽt��.�����z�~5�f},��0��z���#�����05�pj�m�{�^a��^�����\r/W��\r�θ��\0��9�ѡ׉w^Pnd(�7�-�u�;��cL�*��n��ҷkf�(rxg��>}��j�:���tlW}\0;�z�$����U�cV�Y��/�Ɲa�g��T���w�\"F�kթ�S�\nu�0t��p��tB���\\�4I��Q�s2���PBV�5M�lSEX��*��k3��L23�E\Z�D����<���	�M;|w1R\rJh92S>|w�ыG���j��J\"i#�[f�*�E�74��6�.��$<W���8�Gm\ZȱhFu?f�M/D)�r�6$kb�Χ�cS�>�4��AC�a�n	1|jH+5�޷��k�m1��ϡ���6�^�:No+$#�%�f}�ޏ���C��hS�̵;٩�mܾ^\n�c�)Í�,�I�;��l#�R����(�����B���mK\"ω����#;`�����q͝n�Va	�҇�lux���w�\0J�R���EE���%^�(�J��f�\"ٴ�T�L�e�UK=4_��ʙ����~c?bX�_1���h��0iYX֋) �g��dV_�8��R�V�#?��m�8Ӈ�Sʲ`��\Z�[Ϥٹ�;���T\Z_W>��l�~����n��`\n�5\0(��b����}4���`ފno�zw�ښ��a鹗K��f���+�j�p��\0�M�#e%\\&��jB����E38A��+f��<��QY.![���8��?F1�ܨ�H2�4�azG��4_��6,èyn!~�R�@�������������P`�u�S�礒�{#��F�dՋ9k4N^e�#\r�Jq\"&JBs�k%%����\"��������=�!Ć�:rH�Ldܱ]Yw˹[�$\\(yw�;:�T��� ٤ԃ8r��4Ie9埬���3�/\\�6�J���\Z�wM��\0��\'����g��\0�/E���F�\\�ޭz�������g��z7�iA�\0�s~t�+�����[�؂�71�PN��h�(���Pz�\"�N��Ep�e��7H�AdK�iw�b�[�f��p��S45��}\0mW�~*���m����_�������4[t��I<-��Pb��g��z���Ý��yOz�h���w2T��~�w;���m��n>%��c\\�}o��/W��cF߸4?���{��=^Z\r�Ϡ]�F�\Z{h\0�o���U͠խݚ��V�S���8���}�S�����~�\0nk�kp���*��GUЍ�*C�t�n�ד�<v�[��gLv�	�v���=����Ɔ�n$6?\r��D���5ka��mA�r�Z�X���+��a��?U��jyN��9?\"l�}��ϹY�e����F\"�\"ͱ�_��`уv�:Z.\rG�JǝӸ0Zs�Y0s��j��u�::�x�\\�q��xx� ���7\n���\n�d��4S�X��}$�BQb8��jހk�/��:���q���Џ�K<84����Nk�\n�\0惔+��z�f5�f�W������o�V���ߤ������Gay�������-}B��3�z�H�z��T�I��,LC*Nᶾ;��|bC�;��H��V0��SQ(��ܒq��u���n�[�g���n)xd��J�7,�\"y!����/�b�3��]�C�ϣ}CmT��c�Lk��0-%\\<k/nh��(�gNz�_n˅�ͧ�6��k~���W�kS����54nX����2�#u��+w����\\�lY��˘���~���I5B66q6��Θ�D͞:��������ҳO���*s�ZN\\��ڌ�/��������Y��f�Ǥ��.��MQZrUr6|鐎���o�1���Q�:/�-z��ծ��� vsÇ�����hC�m�k4Q�b��AC��gM��mW�6��oC�W�������֍[f������|G��!ۚ�n*�uU9o�g�{�=\\�9������Ɓ�^�]�:#�����=��f�W�}\0��+�E���\n�[\\�j\r���c�O)_v�L?�w�d���XO����b��;s��}-\\��H��^��-]:�^��8\Z�\Z镮�j�\n��]1�����������\"xD\Z��\n�ӮD��\Z�m\\���[W�������N������6r�\0���<���;����a\n�b�j�Z�]��?�4����t�e���8��M�؉nv�P�g\\�6�k:�@G�N��QF���J�\n�Я\r�r!\\�W+`�F�fuf��Z�-]�s6�f��޼F��^2!^9�rW�]H�u&\n�Nԩ]R�ԯ]R��9\Z�W�j�կ��zޯWѠ�?k�whi�\0��tX+�\n=�k���A���\r\0/�(v�^��X7%}Umoz-m�7�q����5�����#��!��g��f*����ι�޷�Θ�;e��l6s�#�l:�\roz��:�j\Z�}U����p�e���4�hw׉\r���䨟kQ����;��c����ƶ�w#���}��b�\\�;�zΙ����ƀ5{U�X�U�:}!_V�V՚�o�m���d��I��tk\r���ߝ-�m3�~}�X��b�A�;oG�����b��]]��s�\0:��t�f�=��ha�j��ι�\Z�K��t��p��oX�w�/�zu�z�Iėzk��ԯ���������vg�=��Σ��~�Ƭ�QZ\Z:\"MS!�;��vf���H�虺�#�+%�m_�?�o�ٝU�wn��p:�}�\Z�A�Vkm1��C�\0i�Gmp�V+j��G�c�����)cJ����Nvm�F�\0O�٪�i��U�cfK�5t�b��� ��!�m�9Jp�����9��g�r5�Q2���+7����K0p߇�T%������\"ۢx�*9Vf8����vQnaE�S8��h�na\n�<�U��M��AT�f���=M�E��L���N\'L�f�\rU�y铒p��wݓ����oy��[C�+iB\"ؐ1�f�=Vq��l�%�������[����m�w{�\rg!�m.5}B�_�B��ka����+j\n�Z�[�����)�;͚\Z�\0-M�*w����vGߩ��#גj2YxF�W�\\��C�?*��3\'Ԅ�5�$鱚��\0��E8[�T�!Z6Fd�\'��H���P/#����I���b�G΀�<���\0�H1Q񦕅J�u�~�?�+�iw���>)9�Uq�xG��|�{��)���˦�x8�}s�9!^ZVM�x�sxl8i��/�(9��t���`�i�Y%6&R\r�U��\'4���I��oꄖ�&��rgl�6���(q$o�Y�1f���aTB_��� !�`Ù.nQ?\n��h���<2Ȱe8f�;_�q���cl�X�\r�S��t^}�PAP�1پ��{Cn�ނ�j�oW�5���g�S`yN}�*<����Gjy����Tm��%���涄�]���\'R�3~�Z�g�1��bw��\n��\0�Dh���+IS��!�Í�+���Jbȴ!��\0�[���Ec���~3<T�ud�;��3SIZ2�~�Ø��Q����b.�Б�Ư�qb��y�Q|�D\"�RQ�_F��QQ�z�B*)�3���A(&�`��7O��w1�Z	���p	��.s3�i��j�J4˛��	�ζU���2R�$h��!�ľ\",��X���\\	�\"�\"�yV��y�4#�-)g�*Ou�Of��m��t߇�p��h����\\k5��hl#�c���<�>�P��r�C�H�����4��ȗ�X��m�՞�Gȓ�\Z��i��ܯ,�P�O���\"���v�k6�g(Ͷnq;�I�\0��<Pt�7)���b��|�\'9L�|�\\��\\��M,��q<��S�����|�y��	iW..B��Dh�OM^h��;\Z�ќ�5➼C�=뚹ƹ�+�k��[�z�m�*��C�LbШsVh;M�h;`��R!��鬚_Q=/�f+��zΛ��N^�韈�<\Z[si.nX���\0���y�s�{P�;\\h��(��ɾrJ�m�sCٞ��c\\�Ы������Xʒ��\r�<��}0�z?N����W��Li�.?jyKդ�����G���z�A�Ն�X�^�ُO�3�:��|-1�},Pk�VވP��B7�\'�YHcsEvg�����g]��Y��S��=�q1����7�ѥ�[��\0�P��\'�[6J^c�EmqY�G8#Նٮ[R�6i�X�:�IC��DAeC�\\�PA~&L�\n�eۋhE��^x���XČ~u��t��p���W:g���ݡ���e$��sÇ�!����Jގt�cେ�v�P�+��P���~�m�㳆�\0�WU��ͥ\'�0o%��Y�\ZY�\0\n�s�)Ā7��l���ɻvXF�+y�)$�św�9�q�2�`�dx��~c\"��G⇋32KǶ�W���d��Fɽ<��ƒ\\G\"�M(g0�\0�^���`z��Ɨ�f�Lkz��)��ι����aP�\0��^����Պ�f4\r�P�jx4l��\'��\"�!��oA]���\r�3��M;�H)�C�\'��;�Gힿ�a#\Z�y)GD�Ւ��\'F+CI���ˋ�X<�RZ69VnY�,�Ԥr�Kβ;�ܷp#)�y�J�r�l�DO��o\Zͼ��f�dx��_�#T�\'��)R�O�����oߍ9�@���l�p\r2��{�V��(׊�����q�t:�9���ډI{{3ھ��6�d7\'����|j	\'�^b�M�P�<\Z���I>�\\�(�\r^b��#@��unk�^����>;wk��tyYPp��z:�5s�W9��\\��j��S\Z�\\��`����2�\0{��l�����!���Kwb�X�θ�>��K�O����O6U*.�z/?���v;oX�+=�U��u0�g��V~Nj�:�N>�t�`R;.��8��\0�8s����\0\\�����/��s���a�3َ�m/�}G\\�����f���-�_{�\Z%�\\n�J���\0�l9���i��\\���vo�;Z�ܸ�z�f�W��\Z^���\Z��g���8��-�:����qG+p!�$�ft�g�?\0�s�z����S��ٞ�����s�\\��+\Z��^������[5��+�>�v>Z3K�y�JrM�\0��\\�s�c��\Z�GޮԐZ��?B3�ݛ�g�zƸ\Z�g�z�`�+��\\k~��ٚƊ��\Z�L��H�Ċ�xx����g�=:ì������T�%N}��En�5����^��6��41������ǫ�P�{o��\r�Q�\\�J�\rf)�0��Z܏�5�z��\0!\0\0\0\0\0\0\0\0\0P` 0@p1��\0?���\0�*e����;R��P����,�w�\n���/އ�b�/2BE��m�>d\"��u\\��o4xKr�����,e��/���m~h���[k�G����ŏ~h��X�DF��B��TF��B��D\"5����Š����ōb�.�S���\"^EV2]Lz[=���5�b���W�<%�Lo���C����%�^X�,����?O�ܿ�5g����B�%��>Y�B�\'����\n�%����B��u��!VC�^��YYzEV>�-%�QX��^��X��-\n<%�}Zj�y�_C��\Z�^k�堡p�/���\\$�k,y�!\n���ǟB��kLy�!V]oPcϡ\n��z�}U����!VZˣ��~�oQy�.�[�^}��ޠǟB�.��1��\'��Փ��!Y,[WC�Ϣ�\"��t:<�!Y�\\y�F����U��6�Y��hU��6�Y��hB?ť�^�6�!��1Z[��ƌd��X�v4c%�r�r._8�1�mpc����8�?�F�cՖ��1��HB��6�*��h\\%�*�U���p��иK�hUc��t>��Ъ�[��}�/��U�XZ\ZX����VD�P�\Z�V>�?��V]�*��b̡V]�*��b̡V_B��8�YlV-�B��+�̪�^W��ҫ%�zk�F��ض�\Z�r�����u��)puB������\0!\0\0\0\0\0\0\0\0\0\0P 0@`1A��\0?��ll��n\\~=���lt��ؼs%������c�>�痘��i��l=�qض�,[�^[4���X�būbŋr���[4x׃cᗃd�h���,sE���Q�*>�X��H�Q�*>�X�%Ti�/���*�O�x�<kM�uDx��#�5���:�<H^�K\Z�Ԑ맖xIcX��٧�xIcX������>)cX������>)cX�l���^�4W-�tW�H}Il��{�[}�g^2ĺ�٣ж��.�%X�~aQ��˦�V��Td���\"U���PǍ}9�M?2�񍏦�X���RC����%�L^eQ�?-�B�*�y�l��J���f��U�~[4|�k,��h���Y�J���J�y�J���\\��Tc�H�Qy�*K=\"UD�P�,�X��B��Ty���#ą�Ш�Ҫ4���g�Ti��c��f���v[4{�/���r�ʨ��ܿ��vUF�NŸl[m�-�Ųr��f���vU�4|���%U�΍��:ܿ\r��z����圑*��~v�]��[�,�a�έ�m�O�bŷ�\0\'�Ÿ�[,�a��m�de��*��u�_ñ��:��t�^�/ٹ|km���wW�c��\rWG�b�lX�m�-�ŋƱ����e�c����n[4rOe�⥛��%��zܾ׏�i�٧�_0�,X��E�l[��L��?����nk�e��Q\nX�>ű+>�U����_��?H}��Ht�!�C�5!������l�%����i���|L�e���Ly�Th�&<��G,��G,�Q���c�4��u_HtX�lE���\\u�}�/���c��C�E���k���c����c\\�/ݱl]�b!�_:V�jرbŋVŋ�l]��~��.�]?HǗc��I�9e���~NYyl��yyl��yf=�~�Yf=�~�Yf1���yf1��F�������ʱ��yyQ��x��\0F\0\0!1 Q\"02Aaq3@B�#PRb���r�4��$CSc��s���`��\0\0?�\n?0V{t�[�d�#��\n�D�k��7;5ۮ��k�\0���{r���/����Ǐ��k������j1�U�VW=�v���ۍ���[�먤/���T���qZ��Ћ��]�_|��������;<�n����mA���|��e�>����\'�zm�ue���&����\0��-�Jq�-���p��׼x>���}�w�_|��G[�W�?E��d�}�w�w��_��7��Y��\0������x�n?E��/��������,��,�w�d�}��������?e��������������\0��߲��/|������zՔ�^���^�U�g�w��Y=��]��V��6d?u�Wuw�Vl?E���m*�e����E��i�TG�?wk�ȹ����>xLH�nD����.̆��J�ph�^�v��[e�����f�NV�[-O�k��uY9\\�w���������/���E�o�g>��F�v6R3�>�a�Y��4�������$\'����}��^/�V|vV	�������%u ��\0�%	W@[^[k�{m>?�r�vVTǛ����\09+0��\"g&�ɛ\0���w���j�T.i�Y�A��̧ӿV��[�0�Y�6 {���<g갑�[4Y����J�$�Gr�m�O���6��=����,�_��d=vA!:=��k���5;(?�b��+�;\0y�^�F<��B`�.���C�\";x�H\\�X/�t���*��8bu�£�v ��\n;�8��VY潞6<��:����Ū����>pO�|��,�T����|\"�(��_�\n/c�e&�aB�Jy�IM�i�Q�V��քΓ��\0��T5�\0��E�4a�6-)���Y/g����5+@�L�uT&x�v�_ѪF�n�l\n�����\n,��L�^\n9g��Hܲ�IR����-hb��v�o%�sݽ�O\r5;ˤ�;� ��@�9\'D�\0��2X͈�R��]g;$\0���n����\0R�|�{Cga��:&�C$�nH:\'�M8�Fs��:V\\��v�j6I�<C��E<N�����ox��nk�2�)������T�d:�(c\Z�+�Z\\�g\r̬%��V���c1���M���Afy�G`F�m�ݯa\Z������ �y9l��;�\0T:�\Zܩ�5Q<X\\�[-Dm.�����mC�5��!$n��(b���3{�Nڨ����X�f���^���|Ԯ�x�ٳk�)��:B2\\��oE�S�5K\ZdsN���p���\0L5,��ͭ^�K�����yޙ3�r�6�����ۛ��GU�	��L�q	׵�rK+X\Zo�*\Z��#{���[��{���|F��6H����2���<.t]��UL��Xz�Ǫ.��#�f`9}���C�q��g�����[��S��҅t�]o@���1n�w�UToA��|Љ�*	�����eu���.�қ71���\"J��rf��g$an����Sn�V�TR3�oSĭ���-f��iH���4��a[�Τ(�E���R墥.=Ң�v`�6<��Q9�#��R���Wivrs�A�{�E$n��2t�	�f��s�c��kpB��K��eZ�ou9���,�^�Ӱ�u�a�G��9qg�$�[B^����e<p��i�u���YIG������f�%���Wq��]W��c �pV=��w�1J�_��&��̋�3�>7[�뱏���p��oi�������̷&�B�W[�����|ļgr�e��c$4��=�_i�F���H@�A���1�t\r�D?\r�ݱ��J�J\'��������Ԃ<Zl`�����g������kp�\"��{}>ɇ��\0�s/�}��i9a(�K���ei��TL����-�l�w��d؅��ga���2�>J��(�;,��م��Ff6��n��YN:�,A2Bܜ�$������=�t����lsBl6�UI���<=�̢0���ױ�;Hs؜�Jt�\nI�9����Dr��@^��Q�t�O�M�u�������o#���m��{7M�sA�Î0�f2*IOlQ\\�u3,��be;��Qdl$���oʰ�\r��x��j�?�YI\r�V��a!\\3_%�� �+��WU�ِ��j�h�Z���Dˆ���qm��RD�\Z�+{p��ñ����8�q�F�*���>�v��M*�&��d�[��,�ܳ�J.:�B�Z�\Z��J*�d�L��S�<����=���ܮ���$���M�?ib����&]2�p%��I|��\0�Q���1���;���������Tf,\" u]\Z�ڎ�`ѭT�N�F�hؿct)�7�����m�c $�?�r���^	=b\n�t��x�zJ�IM+[�p99Jڇ�y��cb!��K�<�J� ��+ ��i��A.�9���Y\0��##6k�^��m�)�E���<�F��4L�3l���9\r�\'���s��~��h�UOs\\ m��S���M���{[�����r[�CFV�l��{1�v��GU,�qf誩�gs媨���1f]�B��Q��F��B�Ʒ;d���FX�Y��	X��R���av�+�-�<�\r���w4�Ny��2Q�9���ՙ�����>dN��o!��	��{3k����Q��#v��FN-�%u��`�apX#s�d2��E��K�|,��I�\ZaS�{G�!a��|S��ř�*��dwV�yC��uX�3o�f���|J��,�a�&6Rޯ�\Z�2`7m�a�{1�n�n��v��?���7zl�@�e��`�j�BȰ[�1����Ũ�+�9��Q	���h9Ԑ:�&6Xby��Cp�B{,[��k4Q�4+�;1��|-a<��3��oS*���N�2yh��r�UΥ�zڪa�ݹ�R������������ߴe��Y�^�iZs=oKE�v�c�{S����J�Jfd�t�+�$8���f�{$�4���(扳\0��L�@�r^�^qd�B27}��}�l���+ ?ݦ���Oi�w%+���öS�Y>{��Ո���5j��Վ�\0����G�ӯ���,�w�{�}�v~K�;�ɿ��.�/t��.�/t��G���+���ݦ��U��K�����\0�f\\\Z�!]S�����]��|G0Bw���}\\���qZ��v\0���+w�z�!{��p}t}w�]��]��Z���Z~�,�	��~ -�\0�h>�A�U�v�\'lWiE�n�a��s)�?V��C�c�lzg�\Z�������>��u��@���N�3{��u@�w�]0sz�[����	?�e�-�67��=�pd��cH9�!�2�YH׼o�8���\0��ZrRT�nѥ�����Ů�^�X�~r;��T�F�u��{Cs�ߪ��1�Xy/e�;6��IN�[0\r�Ǆ��Cc��?d[�u��UD���l��榕Ѽ��b&��~c�F˼7?%%=1�H�|VO��|����E ���}S�B�x�ٱ^�\'sp��¦=#�3�«��s�`��jY��ˈRUP�O���Q��S�2�ր���ϔ�M��b6RSAWy�o��<\Z�Hߖ��S�Nߖȴ�m{��s1�{Sj�\0w�*�SV���rN���d�/iQ�޿�54�\r���ɕ�����G ��\'���IU���*rf��Lx�F�	���_$��l���	��v��C;$�X̑���H��^�|�dk��5�;������\"�Q?�>�1o���ԣъ�]O`��v�T�C<.-�����h\\���$g�b��XAv AE���u���6�z�����a�Ŭ�E8�,����\'h˩`���B��r�E;)�c`p6<Ӫ�M���D��t}�QU���Tml[����?�]�4�]\0��lܪ::J�F����2���ݧl�K<m�0��3�� pw���x�`-�sUq�bt��sv��)���)���c��u�K����?����@�UWFI#c�ٱ�B�����dg��R�Q9�0�_EN��w�w�v�A�S��qE�p9�O�e�>���q)#�[�}�����U�Xn�ګ���a��Ue8yz�}_Wx�,iT�R��	���|�wU-�z��*��<�eIsl��yTD�]��h�yUFXn]�U3\r��0]������Ӱ�VP?�m?��	-�$�Z�u�P;�/��x4���;	��|p��n�������E�&�/��}�y����߲�\0/7�������/����\0/7�/��}�}���2��K8��]��ն�Zm�,�e�<���k��7�Ҽ�L�����\\=��ew����ٞ-��g�z9Y��?Ԭɤ�KՅ�M�t�Q&WH@��C;�~N[����wX]Q!.�����V��������K�\0R�*%�Xc�F�\0�E3�N�e�W���[�h�T���[���nk%I%�x����A��c.�Ǚ�n�_�ϰ��\0��\\<�\0�K���^�5���e�܎c�us�T��|�G�	����d��g��74>��o$7�9���2Zz6�R��D.e���0�ߢ�K��D-�t�s|��.}59��M�v�V�Q����9�j�B�LZ�V�x�\\<�`����Aa����c#q#�n�n.N������M6����CO`�`�oiS�Xdl���X��G��ő�4X�kd��o-����i�klՔn��޷s����۽0��8ۈz(��5�:�l�6�yf��SK=F�o=�pbs�F7�FK,�|�Ì,�&��O�˃M�+M�x���Rgek\'��~Br��\0�42Bܻ�gn�S\'��X)���-ͤ�N`v9�A�R	�c�#�\Z��F�7�7?4*z.�w+�3�J���۩�{�o�MFk�R�f�M:�c�yk��T�1�pf�R�e ��q�TS�9�%����]%��wv��A����xO1�)�\'��lOkt�RSS�[>��Y�T1R���|*���ҹ��t|�̻3��N����ׄ��U0�c�\'ᶊ\ZJ�!��\0+l�MOM�\'a��UM=4l�@�-椦����ۼ��R:&F%�),��P@�G��~�U�{��3a-��}Ed�E�W�R��b�|��o;�L��e+�c~����JE,.����=66L\ru��B��e4C1��h���Ⱦa��	�E�\n7���=&�N8m��<����I��\'��d�V���|@*���c�M���j(��bB���Q313R�n��A���3T�r��\0�:�lf&�1:/cl��m��REGhb�QOM�_���Y�Q���χ{4�P~L�_�\0rV��j���YL�l�s�PDr۟`pX(�=.���!�G�:��{�fӍ{	����*8*��#���\'�(��|�F��kj͉H٘��7��uOѱ����+��[当%����OQވ0���iMü�cja9�{P迷9��_�$���/k���؛��\n�@�c>��6��S��lk�isd��٤k�˽ࡈ��74��QҊy[�aģ�u<홍�,l��3Gq&E�GSѰJ�Z�_hr^�QM8����\nulxc;�g���c���kk\'�G�a�E$�=A�g�Tx[j�����S�^I�A�|��ksO��\'�7�Z�ӗĠm[�l�3�v����x�(a��)ۅ�U��V�0�5^�j��z��|�!�)\'�����EIY$��M��:I~׫��S�IN���S�I$8��R���b�-�T�rc4��[4}��C�r���4�UM3��ح�$\'���?B0�G\0\"(�f�>��R3��{l�>�m�(G|�cfeǒ���:޿x.T���vX�z��[q4���% 图��̵�����9���1�`��#,���fOc���x�=�WLi����� �Y��e�2�\\���K>�#Կ��3�#σIR8�Z���>��@-~N�_��o���J��m�|M��[,��x����j����do�,�B���0����ɔ�6�nC��w�Ry��ˀ+y[�D�̫M4M��J�,�~;�罯c�{P�j�@áyQ�da�N�9!4�Qt�B�ڢ->i�ꨡt�ּ�O8�g��2�F3.%\Z�i�����^��|�槨�m�y�r�ލٮ�-6��X���$�0�\\��vyg}�l������������z���p��n<�ls�l��W.�O1�4y�~\0wT��b���Tb_Ʃ]I��	��,�8`B��N�%\rO�Ӑ���������a��,�nl�a��\0����*����U�:��?�\"���Y�_�ˊ�Z�8#�-Y��~��g��\0���*��urVB�\0�ï�.J���X�b���\0]\\�=���A��5tN�v�)޻n�Л8y&�g�~�[��1�t#�7��X�-�5`�\"�{S1y�E��`��s�krʾ���Q��R���R͆�EE�+Yna��G��\nz�8��U�\\5�\0���k�g��簀��`=��Y\r/��l�{y+,\\�ݾ3oR���xy]dH�!f4�V,��Q���l���v�4~�6����=U�\n���m8�˒��0���Vm�y\"l@,@h�,�\Z�D�{�\nַ�|U�!\\}U�����e��W^���\\��qh���M��pi��+$.�����e��.���%u�F�\n��>K���9�_R|��_Э-�,�Y��7?U����+;��/�Voa�_�`H�iٗ\\W�nֻu�ӱ����/�Z&+��e��\rVK�e�[EpnJ�/�f�k�,�r5���j�˪��u�VG%��!���-�vh߂�mӵ��W���U��R����y���ICꬬQ �\\�w<W�]_D�]YXl��_g��_���\' �<�	�[���c���5Y��/nt���>x!���v|Y��g�E%�6nj�ݼx_�/���8��4\nK9L��W�o��/��{l�b&��x���i��i��<�ad��s��O\'�\0�.�.�L�p����J�|!�H��1���(��zF9��[d状���N����4w4�\"�g~��S��\'�����~ͅTuu���+���|`\'T�����n����5\nYM[[M�Y�PV\n������啍�����EYN\r��56��k[J��:��PG�̨�o��h���/���y�wR��\0��QEO��� \Z)k�A�s�>���WұF�9f�7��9E���=!�Q��/u�q!z�S��.��g����TZ|b��t�em��4��e�����\0Er�\r�������g�۪�ߙȑ�\0�`t��\"�|�K� ��VPһx��f����dmi�qeS3FN���r�r� h���tMn�ߍ�P�>�*V67��*���2HB�f��r���KT��\'\nH\"����Dु��x��\"75S�5I8�C�eK5/GCYf�VTtΧm!k�˪Z�Gҝ��g��ҐFq��=U8�	[w�Z��]b���po��K�N0�c���ueT�6!ց�_D�t��,����<�?��#���DZ���3�.�U��Y]f��^�� �mVCE`<�V&�V�\\�e����W���W���P�w`���я%�H��#QC��<�ż��PVJ��`S���@]��)���:��1򕾯���c~F�*Z�7{��t�ߙae|�NFB���tS3�@�ec���ȬUr<rA�6#5���R��u���FWB�Z�L���u%|�����Ӻ7�+~�ٱ�p���v��	�%~qw&2��ia�1���o�?�����ǆʞ�\Z���N�����T�dq��\Zv�4G�O�M��Ypi���i�g㞊�Y���B���AfuV9�{2��I<\ZT�y,�I�ϰ�̕}�l�fk.V{3YvZ�n}��h���>$��<���e����l���e���應&�3l�C$+\"���Q�1��HA��a>}�#��m�\\+���u�\\�^;�~��*�X��P<�];�v_��k?�e��Ǌ�N�D�]X�֟q�)D캿j!��Vٮ�x4ۮ�{�__��8n6�d.h��N����x2Y��[�e�jܑV>\n���]o`��~�>e�0fVv��yv0~Aï��s��g��>]���aP8���y�7Us����\Z,-�VEs㒹�W\"�Y�}�x#�D�5�c���\0��\0�ۯa�����71��ͷ��ZwI��N�F�ZlG�\Z�R�m�\\pe��ۛD�t\0̜�g���q�N��\"ýf{}���~�{D,�.��&�>�\\Y�QT˄6l۞�_���g`���m��^�E��7�����<��|̊Fj�w��|L?�aꬳ�\nr��ŧk��V%f毭�j�,+2�GܤpB�eD/�Y���;> j�[�o�\'��H�Ώ��͸�U�b��I�&���.�8���m�rd���\\m���TK~��e���Wӗ�|_���I��\\�o�{F�M��k�Fd���r�\0v!����Yҋ���G	�/�]чu��S�w��kbtQ��lRx��{Ľ�96��qT��F�gev�)\"q�P��\n����iEL������Q�I�kE��|�% ���\"2��g�B��9Z��_�\"�d�U?t��)�b�)�]���UD즈�8w�����p�o��4��_k_b�}�ԓ>fC]�]���WE4D��-�\'�ǵ��.��օ��6xf��T4���x�˹��G�\n\n��ֻ�&hPU��, a{�?!U8%�07B>�뱑5�6�.��?+B�xjw��2%�L��+}�{���:\"��f�y���bj����t�̻��OE���\n�g����)�%�N</i\n�gO(mKz�g�(����ł��E�*R�Z���\0��1�K���2��>P��i&{�?�$C�r[���J���:K)�����UL��Y�\\�S�D�|��:��\'�t��sxr��xZ|��a_�0c�����u�WVj$x+��mV�����9S[ɣfc˰�sr}��0N@�1����Z5 d�h���졥�)%}�y*n���Y����\rq���6樺:]�u�UW=�|cE�T�UYnA.�R�S�Ń�3T�E�3��-\'�k��U�%U�n�o���M)l����YOW����V�S�����03ȯ��yp�B�}FF��O���h�ނ�%#�Ζ`�?�u�B!�X3�Z����+�~^*Y猷|q3�tPAn��U-�͊��T���f\'�*:V3�f�WeR������_���:�\n?�F�����WFRQBK\\1>�+��Zja�(\Z^��*.�����[�~e��Ëua%�M�l/Gn���e0���?��3S��]�(U=!3p�e�ۜ�鲏�\"�ѵ�T��E4��~�n�q��h�T!8�J�}���y#^���u(4�Pӌ���O��\rw�8)�\Z�1�R~k�����z�sF�F�7�B��g�8ńw9�Q�h6�a�T��42(�ƶ��eU4�ͻ\\Q�F<9��Q�B~Θ[�JY���\n#~�bys�|���\0Ԉ�FBn�s��}�Fy�����;��=�WWXt\\��a�:d����/c��k�C\Z<����{�7\'��e�bi���������DQ�6�6	� �w�s�����l���\0p��$��4x4j�na�d�h7y������;�:���0���C���CU�8���=T������Ku3�c���Sӽ�Ny��Kj=�{���1��[ꩱ��RAO1ce��O��R\"{����L.\"�/h��ȶ���Hdy�(K��nA�U�.�	*e/-�MK��h\n�fV�2X�I\'�B�׍\n/�ܝn���R��t�w��}��Eon�?4&�B>`Q�������o ��x�o��2^���Q;�G�v�r��;K����϶Y��2��Éc�G1��-�3���u��9��혚m�Q�mt\r�X�nNw%^G9ޥ\\�\"M�̭6\\s⮚ى��Y<tV������K=�Z��x/��#w,�#�&NS3�VgnAkŦ�V^*��}U�W���{����#�܃S�<J	�σ^żQ6�ϱ�����ˍ�9m�g�ȧ�x�f]���ך�Vʿ����G���\'������t�~\rx�M�u�p��\0����L{�v_�k��aün{rW��G�.�n�O����-�n������t��G|��ّ���䨦t�H�t�xw4����tU�a�<y_�\'�@#��an���$��{�V�\n�0�>�*W�����`�;���/u�u�-�Ec�ey6���4�x%c����x�$��Xl��QH��Z�c�<6�0|��;p�5KC�Ш!���[,컺��U-U26㻆i���QF�M!�$jc���u��Em;��)���c8cݲ2�����k킞���|�6(�56��޸Ʀ} 2�\0�\Z��S*�������SB����[�:��H`��\0�)Y_Hq�;/D(+�B\"蛓�l�b�x[�ړ�ς�C�m��׳��TwElV[��Y>]捂�6^$]�}K�dX�!+���n̊��\r1��S�R���f��:��C\\X#�x���C��δL���t�5-�ٽ_54�h��\\�9�\n7A])k�׼y��>(��7[�Q�t��h��(�gy�O��Zz��UIHT9�dm��h̟�\rdҀ�\"\"�>i�S�{S��q �x�#O�xB�\0\r�Ҍ��ոRQ�����;�4�9]#�8�\0wq�ZY$s獅� �Z���$S�:�g���(��`s�4��S�!so��Yp8sp=e��9*S�%�˲�6@4첵�e�V_����W�?��x��W@x��J�L<-���l�G��a��*��7%���\0�1� /a�s����nJ)fm�l������Y�Y�����N����x\"\\nN�b>.O���\Z��r}c�=gHϛZ�*���׻wq�i�*���eN��IWP����ĩ+_�+�C���\Z~S��d�A���T�\Zڗ����>J\nJ*	\"���w�5)�f涍��y*����P��6�E�t����o���>U0�4��5)�o���mO���l�������Z쌝#�O����(�\0�9�L�Yi�5Q~w��_V8*n��6�<K/�*��~ֺ��h\nr����R��-T�o��O��-{�v���\"=̵L�K�Q]&�5��{���N���O�hl��R6z��%����!��{ML{�X��q�B��� l��;��m,�68����g��?��\\�����xn�j%i�x8\n��L��.u���Wt�������Z��.?�����\'��.�cP�oHt��u�l�4�IM��χ^��(�\"o��:���x�5�ۖ�]�ee���W��V�?Ub~�.��?�����J\'�}Q��i���З��X�\Z����S���B�����8���taO����\0�4�ӿ�f�IKO��iņ�*<��l�׸�\n/~d����3g4���\r��2V����MC�M\rǉ�x�b��3cp�अ�F�H�X�T����ϓ�&�X�d��:��jjz{����#;����\0�m�4��Ý���\n��y����65��\r�/T�zi\0i�6�W��Ag��Z\'���!{La�Ӛ}U,�?���t��~U+?�\0E$/u���6�ie��-�5Q�<J�]u��wIngh���x���q$�I+�>B?[�$s<AFoh�xr��&	�e���{�q��_m<���u����j�1�#�[����)�5U�F��-�������n b�Q�tF)&s��p��i�����y\'zl��I{;���Zk������z����W�>����N�m��v� ;Kl˂�ˆ�_���(��ψ��W戽��׷�_��:�6�+4�\Z��V^^뺬��>�<��T��\\ݗN>}����;{���g�{~�7��e�uK	���>�L����<Z�l�q���-���Zy�&��\0��Fؽ���:��Á���oϴx\'۟`����Nj�x�9qf.�-6d����e�W9�ܤ�K��W��D��<��\"��\',�gJt�	Nx/e��;����e��\0�ƾ�����(AO����4T[���y�cdn r���[�Q|q��� p�O+��k	La���z����Htf��F�X-�-+��\n���޼�vV�h����3�2Y�\\͛�i�T��6�x�OS��(�d`�K��m���D[N�X�z�Uu5�DrF�\n�S2�ԓ�O�ω��&��R�l-�Ì_�eUZ�!��>jI�+\"���d9\\�h�S�{q�����tHlDm�sr��0�V��ë�!��a�vbO�����+M���-������m�}�W��T��7�|Y�b���`h�C�l�ɛ&����B�4R:_k�]�RQ��\Z�6�z�I==K�D#�Z�����m2Q�R�80���\Z4(+(�{�)��e_I�=���:���4���8zɔ�މ!��a�ꢖ��z�wz��/�r�`���q�J:J����`p�n�G��s�xO򽚢I�	,h=���!a�k�ς�#�;���4Z|U9��}6璷\r�������k��_���^�4�������7�e���g�p���Fw��y��GD�tq����CKi÷}�ʒ\nX�\r6���$i(�a����̕S#���r|�x�j>U ��a��O����Lۈi��r��G��g`9��c�GGNΣm��$�_5����NvQ�oE��<ÄZ����\"ب�(�K�X�<@PP1��\Z�Ԩ���袅�gW��+pq]v�+��Lo/�\0�;�yuUE���?�PR=��;�ޫ)�nap{UI���n9��53@$[	�\nɵ�7a��u�=z�l�\0�&R���S&\'�\r~�2_Y%�(S�#/��L\0བྷ�(�i+?/�����][�N�$.ŕ���\Z�a$c�O�{�#u>\'��\0U5�8�c�ǖJ��^	��K�qT�=�2??�O6��\'mF�����df#�ģI��b˫���e5i!���s�G�+�E�w�o��\0ң�i�(�R��GY���]G8�b��\n��#~!O��*��b����y:2�\'�+o�\n{%�J�z�d�١��Su`�c��}X�F�o�OP����LOz��}G���(^�F9b�Gf�Y-5�e��k=�j�\0��-�Y+�\\q���F��\"��TOa�g���겎@���b�\rr��n��j��:�k��,kG�R�L7���>ZJ�l�u��T���6�fT��am�~�|����sp�9��RI嬚O�l\Z�A	&i]���>��x�8ܰ�t�`f#�S0%���Q�H��4��z\\t�lQ;N��y��I�%�LV�Q��G���}�h��-t�i�#��\0���0�}�;�m;[��3\0�DL805�������Q��18�������O�4���nN��lױ���D;�^�}�П�A{/e�v@ͤ��u�\'K����d����k/��e��y�g�V���v���_+������G����i38�{��MU�:�Z��R����rXij7;�r������9���\\J�7���Ţ͹L�J��L�������\Z�U����#k{��(�)��fIW�G:�Ġ٦s�{�+s�~�uy�{���r%xa�o�J��r�bi��W���i�ۧ>[#� �$��g����k2���U��M�5p6fV~*�����Y|Q��%B�Ȯ�>Wٟ^e��潀�JA��{#ak��Ӷ���Y�8�d��<��ĕ~��r<7�[��KUb�Z-v�e~ADI���<��׆��/����U��m��X�5V��n+�|U�{i�|�cO��-����~�>��tٟB�t��X�SG���Sl���A�:mc� ?*i��;y��6<7\n�k����̼U�Z�M�nj�ǲ�����cG�@\"�{6l��j���s���s�+����\nuD̍����	�i���[+��S0����kd�bz����Xl���k��l�ˋ���*[3f̈́6�E����*oh��0��UWH�7uI	��?\r��X����@���Y�1B�}.�V�F��B��F���b\0�2���$��k�/s�UK����ӷte� 2[[#%E)kC��s�}�z�*��M�B��\0��p��|�$\'�ێ�>G;�ǎj�`kE�gD�HF*������$�\Zx��]+�^�5D��0��O����C�l=���\\0�\'r\'j�Ց3�r�\0�R�\"lm�R�5\\h@Z�<�̎���3t�ee��eH&��Dl$�&�O�-mS�L9/b��G��\'�*�J,7xr��\0W�4�6Yr���,i�;��-j��e�ً[/E��������W�_�-ɭ	��竇c���7�!UW���^J�dz9��%���^�5l��%� �3�6盬,��){M����y��K=���T����u͔U�����Wq�=U%;�t��r�z�j����lm5?F��df,w�+���m��Fչ���?���GA�|�7�Sa����0�ޭ�}0BZ\Zm�5K,P�9�����U1E��=�YV�(���q�e;��U7�F�v�Z4���ς��9H�}�̩*��Z�7��x��Ut����b���%�%q��/�#�|��1��1��8k�QQW�G;�}N�uE�b����=g*N���t��Im\\�CA3���o�R���\"qpy_�UW��?s7%c}����_S�\0P����UX�Σ�.��pŜ.:���s�F<i�ROQ�B�O�lԓL�	u����\r�~�Z���C�\n����L�Y�d��N�n��1Է����l!�?�}eP����7��d�\rÍϑ�*j�Y��R�5F��\0y9B��(�~<�/]��Ȭ��\0E��e{��j�[��uo�Zi�Ӌ^.���{��R̭��ذrcG@C�a=��e^��t[��\0UC��ؘ~Λ�\0�Lb\0>l�8�c�ȒKab���v>G��=��>F�\Zȼp�T�����\0R��\'�n��yQ�����;H3b{�1o��b\n�d~�Y���/nu}4t�M�ü9/lq��mq�JVW����f�q���E���}-��po�GM=Ev(���w�mD�����Nav�8^���\'�C0f\Zzr��/�F9��XGU�i����~r��� �l[��\Z˅\'Et���s�bbm?F��ks2Hz�P��asp�=��h�C�(tlt3��6��e��O`i���[)=�D�Og��!̺�+C�l,��u+\0�9���P{��5��cFM�[ײ����\n��j��mctΕ��d��㋚�� X<���Q	����/tʩ%�F�]���\rۮ�HW:_�ow-�Cw8ܯd�{4i�h���Fj��8�Zll�;��2wԸ�>���1ޏ���[φA}3Z��+[DB�<����dV�Y�g\rj�[�䬮<V����dnF���\n�%c��\\z���,8%w���\\��z��g�`����p<��^�^uq)�y��9��\'�<�[Ǹ�s̭����|��L�_�[�H�����G�eٜ�O}l����k�{[�|ɝ�g\'�6<-97���n(�����4�*�����Vs�mn,�m���n���]H.��\"/dE�3�k?���e����[-�����+Z�V�������.W٢�W�ײ�d~\"I�z��e�V�a�%~�.�^�!�^�_�2Zq�âx��,�D���\'�\\��/�=��A�%��e����kz�z����V*�+sY{��W&�#�W��y�`��\Z<��\0���n{,�q��e�4�1�p�n(��ލ+����-{tZ-�(&îmY�����zp����5E�KD�x9s�mv��kk+�?Us���X��3Y�e�W��5�EZ���dr���y�iS�Q+�P��F?2��n�%j����ƕ5-;#��l���&�O%#ct��\0��AO{�$����*4���b\"�b���l�o�{\rF6uKݛ���������(��i���\0�e����:���-Ѫ	�G�C�Ը�2���*F��Å˔MYt�Y4sQ�*�bsq>L6�O�2qO�?r��ufgJ�]յ����{��<��*\'q�����UC�s�Ւϰ�Yp���̻[+�5n<�\n��*�`<6Wۖ�X��>{-k+��_����j��W�կ�洵��������W\n�-K%�Y���?��[x�+l�%c���[�0F��c���!��i���3�\\r��EA7�c�>�H{����K��7�g�\n8�v7w�1ś ��ݑ��/D�$����((��)�#��\r��m��K)X�h�݇ɭWdgv fJ.���\"h/�W�0]���&2�<%��+|��8�:������i�ۛ���en���=Qcň6�׵ς�yv\Z�@�z�����<N�\r��e��sX��k5��6Z�v����?U�����W��]�i��9�B�\0��z������<��U����\0ҽ��\\�U��Y	�ͶN��k�݄^9�t���-&���N�/Fjh7A����JG�7��k-�ۿ�w^�JFQ�Y?��M6���GS2�w����>-�nթ��]tx��h�/o�;�Ff\\O{�&E0�:�3�A�������\0���L~i�i3GY6�-[�i�a`k��\r}S*��wY��uB}L��~y`�p\0�j3�!{ωB�\n�,n�b��ŧ[M,�16���4�ӆ��}����}�hߞ�|�����_�W9���E�vE���5}n�U����KO��b�u\r��s�bs.�V���Y�y����em���\n����\0����GotO\r��.������]��w�s�ϱ(�O��,µ�n6���̫��i\Zz���r�g�j�-��kU��Y�i��=��<�rYD��\\�}�p���y���u��߃3�g�m�5��++�f����P��W�w�{��q;��^�{��i���k7���F?�z?�^�/�^�/�_�\"���/����\n�\00ϡ^��Eh�\0�g?�+��\0�����ҽ��\0�{��}�\0E�\01u/��f���x�WY�W�0���\'��=�+%�f�\"�=��`U����5u�\0������/������Y�^�%�Z�鳚��~��N���Tڱ]\\�M�y1��\r�������H����\0e�`j����U���\0J΢��YO�\0��c��9���~�\0�^�C��ߔ��إ_�O괗��M����y�W�?ܽ����?u�\\�եg�Jʞ5�#�/q�\0J��/�^�/�]��\0�h�ѫ_�{��H^��U���޻�㾫�~�7��f�V�]v4�p꯰%o%�����a}�>\n�=�+��ny.j�+�r�W?ʰ����u��,�ע�+/��z.��_�W#�Y��Y��(��O�J�_F\r��\r���7+���e�ݎ�s�l�����sٖ�v\r*�a��v�\r�Z��E�U}�Z]\\�O�z/�r5W�V!b&�Z�o�+�\0%f�5�_��\0ڹj�\\�������\Z����WGӱ��\0�<���f8�Y���e������\Z&~�����O���{3�e���_e��۷�W­��7�\\�����\r���g;�����gT+��|�->\rhOm��j��=�C�G��3�m��Ş��e���Z���#Ů��>�y�v[�!��U�?u�W!]�!e�Yd��[fU��Y���Z�Z�X��jײ�fn�vh��ꯞ��\Z8��$ƨ����e��4�n�ݖce�e�f4�r0��G&�ap��{\Z�a{C��n�2Z!L.s�\0�Uzf��}���*H$��u��\"k��m�Q���os����z;��]�a���x��a����~EgőVّY��\\�\0+<��{����x��W�k���[z�u)?�O�>%Y�i�L|�Y��`��y�\"�-$��U�<d�9����E{\\��r�6�U�LF�hO�l��[rַa�ݑ�a�I��~�[T�8� ��3I�p���S>��;~z�`�����6���i,���Tt�1�~A�4��<|�&�*�M�4��X��^�g�5-+_��L���6\n)+��;���V9�ڪ>ОMT�L{�̰7E�%�,6�:���%�����GX��7����ܪG��!r�;k�lmnM�[��Z��/6�4�-��#��FH�û�ݚ�����G���M ��ݑ�-ë�6��{b�G�D��q�f��T����F���e_I�������PTo�9�+�\\��͒�����{�qSWֹۨͰ�%{#�rpŢ8t&ȃ��u�~K�]Q<���QŖ�^����,���4�}�y,�+[~���fl���\0�r���ޅdAW<ֶYx,�\0s���o��X��}��/n�6���%��8����bp���䢁��cs5���h��p̿uh�J\"�KwSQ�Q��w��!Q�؜l�!\\a�l������f�g��Jg��l����/��B�\\l��=�3z��S*z^�u��1��YJ�豋8��]�K��>\nS���#*�����i<�>��)op3o�e4Y�Fg������;xD�2!&���d�\'GR���PT�%P>ʍ��U�\"@2cƽ��g�$����=�����1�&���}��\0�S���U�\0�\'t��/�\\�n�\0�P���ߒ��&����W��a��J��)m$��o%]��8Д��\'{��j�n�v�����;D�*�4p��8�P���J�����8ܟ?%KM<�xYԿ����PoS�\'0�4���dh-���1p���]�+~ʙ���@����QRts\\�D�5�)�j�e�\'�W��Z�L�uĶ*S]|\\��V��s%����o�P�E�A�\n��2p]J�/���y����nYy*����ճO���b���B\ZH]��-O�[�;����>6ek*?)G����\\+�r�V\"�0��]e��K���\02�VeYXl͖]eq�+�u������W�|�=��\\v50~�����b����H¡J�_�NI�S�\\���\n&H:�p��eJAi��))�_#���l�)��u�lyEٱMҳ_wLۏ�(M1��P�֓e�T�sH�0��/w_ ���O�\">I����\'O4[d�0�y�\rh��̳Ȩyi�+ed�\"��{x�VM0�͗u{]\'^����:9���}��:f9�2\\�:;��q�z����Y_���<�+�%ah�T\rMy0u�@Q��7gjS�;����Fa2B�4X^%O,C��m%��*�?�%�67�g�UMMSQ�taUtt��^�˚��V�.�{rR:\Z������$*������Q���i2:ﻐ�G���S(���u5�S���I0�1f�¡�kF�N��朘��#�Fb���ho��f�S)+���.�Ա�\rѸ�Ưh���~<!GYc��l�V6Qa���@�FA���X�u��{9�ha�F ����i�ybr�&\02[�h�뒒JCun\\e�)��q���6���0�ah�m�d���aF��\'	Ge�Y+�����k��o��,֋5��`�+U�����fedU����Q�!?�Y���\ZO����%����o�嚗�o�RXxX���O��q�L���m����z��\n���A��4y)���I%~�r��l2�jK�_�����tt�s��bm;���!����c0�~en�@�[�jv��=J{�y�Tj�1�\\-|�${#&3v꽢Hb2,F��]���V	\\���B�	\0�|�B�L�Df��}�ҿ̿�j$?�Vm\\��J�_�Y�<�\0�g3�����]��V\'n�U�峟|�n\rv�i��9�ob����95��e~|\Z��\\.K��;��W��6_�֋%bV��.Vk-�ڱH9�$&�1��v[�I��u5D����f[l��9��}�O�i�׀��S���\0m�;��vX�-o���h���e��?\r��[?�Z��a��\\��<�v�q�횫r��e8�������n�u��fx3W[����qg��e�k��f��J���8]R��M��W<69�殳�e�^<����\'�4|�\0�r��Y\'�ϱ�����wup�oݱ��`�9���٠u��9���_�F]a�e쬬E�E\r\\�}��	ϯ����t�D�-.8[�Y�$�AX�Ynw�V�����dɜ��9�!P�a���l֬3������v��l\r�-ɧ�<�\n1EG!-�$i�M&� ʨ��0��Sr��{5�u��ؑ��S;����rˆ�i��p��r�<W5m5���Z<_t�2�WT���ҷ��<1YL�l�|8\\�\"�<!��Ò�����̐3TԂ�Q8�ouGGts%����S�\nl2�޳\Z�z9073p����[����������RC�1�+e����F��3�1WQ}�]�N�T�ɐie$o��u�씑n�w�{y��SS�,�ۼ�#-�u�����>���u����h�O`d��G%d��	����fC%���W5�����L-\09S�	0o��Tu2f��\'�\0\'�\0���ۯh��y����Lo�{���xv�l�f��\\:�{3�N��)�ҮB�7��`i:B��*@�8�%�H��*eX�xCu[��mñf����:���&T�uU�m��d׺�y-�l+w#�-:�()�!�i�����������eo)]����UEM;w�%��+!�3v:؂�g�`��Fg9���V8�Ħ�w}T5��a4�M[�k[ln���ζ�A,����@�&|-��&P>��íq�I��R�nr2����.$k�2�:�Y�?�2Q>��b@�]��0A�G�[{�H)�a��m�N\r{\r8��x��,Q	�x���K���e�Y���]TM���l�d�����7p��ȯ�Rr��_��¦O���}U�S/�,�$���r�\03\'�,��]j�������N����~��2�W~�^��������$7�t%\Z�e���@*:J&n��<�edvZ�Y�W]���v:l׊�\0�{nI�����x�}����4�e��Ym��ٖ˅�\0������\Z�W(�C�p�~��U}��W\'�.�O�ϱӋ^_��3B���g�*�_�a�~\"�d85�2�M6HNv-�!X�zpdx@�T���zv��e�s�]���eůi��aȩ?4?�����簎�!��R�V��ّ�/�߱����+|�����#�	����HF|bwc�i�m{��H�5����;�	Ǚ���ۗ]��2ൾ�>�-�$|��!]m\r�+G���?\r�϶�i�9��|}�k�\\�{O\']_m�]�K5sǟ�t�m;=;H��a[�GĪ9?�}~��a��d�>qN#�,�6L�^\r8XO�q��U�}�l�m�;v9�����W��3�g�ٟ��y����1�+?��5��g��\0)\0\0\0\0\0\0!1AQaq �����0����@��\0\0?!M@9��D	($��	b�̘� �b�669��T�H\n��Ca0�V�����LXm�6���q�XGC����r��(��>�yy��$�g\'�f���1�\"e�h\r��C,\"���%���\ZЄ&	�\r& �B	1dL���j�/��D�LϢ���M�Q�6+N�?<`;o��K�����a��~���p�8/�67��/�_E!�(<%�]�G �5p��<[!�$��LBaX��x���\Z�$!%��!�z�1��8/A3�O9�=�lv?��a�ߴ�����;)�D>c�c_B�xKr!HB}� ��4�����)ѿ�1АA���$!0�!	�����L�B�D�d&!�LBz+H~��ۋ�!1B}3꘳���{@����+��B�&2k�,M�!#�\nB�����X�C�o$4\"a�����\"�� �\"k˓�D���A���&���$, �O���!B���$&0X��B��B��o�;�Y�B�����\0�>�e�x���o�	��|b��CN��f�!C���d|df��Y���FЧ(n3�Xl��eC+��\rLi�co0/�1��9��9`&����<\rn/D�ǆ�2Q��\"��<FiLZpc-\ZEF}�t�8YØV^��ӊ]�ͺx#�4S��>JR~�����B �>�F�L�b�\'�	�8 ��1-��l�GZ�,��2�6H���+s�_���sH�#�r��	|�Zca�\'�V�n�\"�A!��ȯ�L��	CDЏ_S!\"!�Ɂ���D�(5��	���{\n���sy���V��rg�|@}b.�$P)΁���c6~����B���&�B�2�	�A��I���� ������H_Z�\0�c�C���G�A.J���K/	�#�������X�Ǔ�z)��x)+�]<A�ƴ�Z+�ѹ��u�n����إЋ�[xL\"���-?��\0Ϝ.W�	��	����B�!��apL%�	�Atzr?c���\n		� �1�wp���\0�B\'���a��2�Z�j�}�}i\r�����\nC���:��\r	,�LO16U�\n�;4Q�Ts\Z�D�!�Bu��,xBq��U�1~P����Xѳ�ӽ�\n~�8/��!3>�%�Bh�LBn1��B�D!�]��s�.p�a?���v^�;M%��\0,��_ڣb��b��������蝎e6�A/F�,R�&��A4Я��iN�����Ǣ��)>YӇ9r8�b��ɤb�9bF���(�AxR�\r���d\Z\ra�S�a3&����\ZL�kyhm��gD�\Z0 G��B}\rk0h�蘘���6Ba��L,Q4C��4p��\0�1!\\��snp�\r��������`L�	\n��kl�!Pk|��x����	�iэ�y����/\\�`�����M����M�����\"xN�iW�! oK�����\"F*F�&l���1�>S��d�Zm�쒋���,�ۮ�\"¦��a�\0-\nr=-��<_?4�:�YD�I?}��,��3R��ё�r����2z|]�:���-��ga&/�_��?�>�W�Nǜ�î���,rY%�T\"�{x_,�=\\fh���#8��ʕ��[5qk�.��ʈ�&?�&EB͖�h�6�p����򱯦l�$�^��$!)b}�\'�	��B		30i�E, >}��D!��nGc����\r<���\'��6��,LW����}⨫���=&��2K���]myL������,d��s�_Ao�6�����-���-��d����\\�g#�w��ܕ~���x?��㵒h���P*\\���|������(M�Ӌz�a[^��,��\0�8B]K�=I%�����zc���r�Hn\Z�\\����TƝk啢v����c��_�7���CJ�R�F�6Y�!�WE�~��g�嚟�x�\"<ȿ�?�ʼ(�Ѱ\Z�Z&ߡ� ӄ;L��i��؀;򂧡gKc��踣Т6������P�� �?���������\'ґ\Z�!>�B	}kO錜���1K��kXF\"�>�_d�\0a��DJ�K��Y19?!�!�ƍ��Lm�#lM�q���Z�<[AE|H!P�wЖm�-��>\Z;X\'�9�T�?P���|m��_��A_����҇k����ʉ�\'u��	^�O�R��\Z�S��y���=I3�Qϊ[�aG�M1$���A\n�&��������w��Џ�>��AFm�1B�_T���!	��B���!//�ƍ����H�/�[�k�c���\r��c�E�zp���%�N������i��=�\r0PJ��ɖ�Ά�S�!����*����\\��A��\rln!��5q7�YM�Ƅmg�\r���`�:΋�_�����g0�\'�	��11�Bbba!�	�RD �����.\Z���_\\/�1a�pǶMl/�\'2��c�~�.��A��)^��2\\��p��>z$�#{q�\rz�rX�*F���bE<-��h�&M$���dۣC.\'1)�T�l���Q��4���e�C�הĨN��4i�w�F7J2 )�M��!^~������Nqq���Y{kG�?c�wഖ��I���[����sB���:t��0�g4j�W9����瀲�6OA-!\"�{� ��%���l�9�J?#D��c�O�4MQ��#L�\Z��	���Y���!1����O�0�D!B�ȿG�����1_B�g��1l>Ey��B�v/�~�Ɏ�#g��ϔ2N�Iv���1���\0HI����h��4�%��j*��Ws�ߘ_����KY����v-���9\r����lr�M`��O1v��i�o7�]@&��<��pEgTG�٧��ɥz�:�;�lEZK|14\\\\*��x�ٸ��\Z�mU��g�O\rG� �O�(��	i-_q����7Rgr��{\r/ntj���.�4<�������RM�����grJ�R��Z �K�l�l��P��-�d�\\�Ao�&���՚�����䎬����8��(%�Є>�cO\n}�F}ǁ���A(YKH�!3>��B\"}\r	�$>H5O��;d<��BB�����ǘ�э��G���]�� ����G�~��6le8�#�	Fxk���VT��O� �;顧B�i��R�l�K	1��\0�Rrj~��ތR�z݉�0�q�OBh�5�*D�hu�/��\"�.������cc{�K#����}�4e4�<ljx\"?��OUO��7� �9�uYpF�\\�p=�,�����U�-�~C�k�هY�ɺ!��ج�x�Ч\r�l��x�8\"J�)�`�1��z���W�D��t��щ�xB!��H�I�Y���pN���1�Z�ba���n����MkWHOFX��,�; kC�7�@s�|������D!2Љ��LBb��hH����~|4�f�u��B���ϩe��7�tN\r��[x��������\"�l�F��(�߶�rI�\'���B��a!N�Ek�+$J�60���\r/���\Z���a/�!6�Y��i�B!�ۡ��a,!w��p�Q.\Z\Zb�1��!2,���q�~QÄ���K�k��X���&f�X��C����hN�!D\'�?��������%Ly@&vvC�,z��\0�m1#a-�fl�d��3<`��&�N�[���D\r/8>x&�	-�-$3���}£���0��sY��1\rV9l�B�p�Z�cE1��H��P�\ZI��!�G�f[�bC��$��C6����0�!L�L$M�\raL�÷�9!��3�Вt4+��<Q�=�?K�\0�)���\'�9�o�{#�\\���A$�G�i/�e�q���\"�rl�\ZT���)�Q\'bؾ���J�S�5��K�Эv-�3��\r�0{�\\�;�y\"�\0�v�%��z�8)��i��5߰�\0ob�j?dA@�U�D8���	��m�\"=��Lse�L*#�]��\n�<}�G�v	yH��Gҧ��3ʞ�E����P��Nyb�wyH�i�\\ĭ�2M�� M�M	���47�\r��@�O�l���+�/c��\'I|�sH�����W���HU�	PŇ-�a��&A�E�s�vM�\0�D�ʩ3��_����Q�3�]��ђ�c. \Z��&a$L�Z!��Em�0�\'�B��МC��g�#��!�b��m�\Zo�a|p9h}<�t��\"{5E�F��P<�z�il���cҜ�I{�j�Q�%	�u��b���^U�/Dm>��8%�n�f�7�8ƚ�\ZK�T})�Q_��&MO9\ZH��%��Ǝk�De,|����5&�4�%�n3PH��4���e�e�~���2�Y��Ȓ}��A�ֿ�tS�S�F��b��o��`�\Z�Q�=Sn�\\Qcf�$�\0���L�߉>CDǮ�+GH�65��r!�����У5g������Q�Cp҆^�1{3�M*����/d)a���k�Tӎ�=8�8U]����h�b�ᛤ ���b�x���0�܋�HK�D ����%Dů6|�|�h�������m|��\0HB)O�����Q��~YT蟡^��̃tR��4 ��^,:��\0��\0�\0��\0�\0�O�_��\0����\0����\0��\0������������������#r��\0��W�7�3A��\"A��zCF�%�\"�\n$-�E[>���x5�9`w������<t�P�co.�(��т�\rBx	��W�n��{7�X�KH<����ٽ{�\n�Ɔ|�4�\0���������D�>$s�z�<vz��Jz?�Ud&�0Jqv<?	��3�X�!4A���d8��d �|a�PY��Θ$�?�>�6��l443��,O��КzG����Y�\"\rx��lvf�\n7w��4���t\\#x��&���e/��n�y.�1�\'�����$}��aC@j�.	t�\"���� �$AN�Tr �CD�-�Pa-��B�h\r\' ���M	����B�>�hxF1O��\r��r��ݟZМa��\r�Bc��}����b|�1	�*Ԛ�,��3���Y9QJ\r��ͮ�{G9\nḼqJ��GM�,>X��?-�>\\�������\n70�ԋ�{��j.Fw��^υ�4�.�J�g�	�����hW\n,&�#���	q�p�T6ql}1~�|���Ė�!�o�3�hI��}\n4�a�_�$Y]hO��C�4%�D$a ��<����%�B�H��D ���$ �\r)�RTv�)�P��ź���c���&^9�\0�81�0��k���_tK��B|��b�k������^d�=!�l�y+\0�4�s�L�F�Z���6=ܞػ�5�cM���(�x�F��&��6�:�W��<nI�}~��9Q�j�u4����B��r�,g�6��~ׄ{����<2ӓ_6�8v��(�x��@�k7A@�mD��l�B���ߒqm��p!�D�g<6-�2�:�E�~�Z�Kś�R�~�t�>�<��\'��8��0~k���+���,r@���C\'���=T�������k�j-/w��P������f�r�i��Exv�Į���M�����0x���\'�b� �|���i��B�_B!�acD!M�	\rp�$$��	D\Z���@Ae/>Q����HA�s�/�ϧ��9�ʌ2��j�l�{���\Z8�ٯ�lD�V\r���5�sg��>Y�7��\Zwg� �B_t�85Jp�	�᯹��YN�L�1�d�vٶ��p%�zv�2�>[o���5��w;�hh\\\'����]�	��_cS9�M/P��Úchԋ��Κ�\Z��{�5�	��Q�=��R�_�~�}���Ѻ$�t[UW#<}U�m�֓�_is����&�;uT�}1#�O�Ȭ�ܤ��\'Wx\\��MC�C`+�\ZF�0�=%��.�{�C�Ҽ?�\ZT�᡺�J�1C�&�Y[�k��@�_�a-ܧ�x�K<yD�~j4\'�]���]J�<��;�7)��(؅���5�!�O�����.����������$�(kbQ�G�\rVH�I�?�3��4{th���d����D�������C��1�����c�������V?�q�p��5Lr�\"�������)�\Z���\"���Ca&_pm�P?�21�õ�~��~�[\"�c�n�\Z¾\n9��S��SĎ�m�\n��(%}��p�q����A�K���������H�!�N5\rH��`��$��+�s1chr�AՏ�\r�Oc��|3��a,D	�ۃ�\"�z\Z�2�a�q��8aq�JT���������β�i١q�\\@����� �	�[w���=���!!\"a,(\"		,���Q�8X7��E�PA%<��\\\"�-�\ZA��ߪ4�\n��\"~�j ����X�\"}I���f�>�A����T������3_�V�t������\r!���C�Zt��`<�o��&���mEɷ��$�d��=��B�9�\n�#āspגh���x��Ǿ\"���CH�[;���x�f���D�1�	�sᄄ��$&�ƒiv�\'�NK	\"bB�d�bPM�C#�cCJr$��^�Ǯ���̛Wd�	u�M�B�,jbR.{~��Y]\'	$Aa	�w�b�x�s��z(���\r� �4�¿X/�b�^�<�\0���\0�����Ln�q�v�\\�|�Tz���QH���\ZA֬�W��&���I���x4+�PVu�}��t&��Ύ��h�+��]�lh�\n�1���.����P��\"��Ǝ���HG�~Cg�H�TA	��B	\Z�ĈLE��A��E�bZ{G���k𜳋��PN��_\n������Ӑއ����ٝ�sC�4�\0��q��#C����3�C���7�\\��ćZ��p�\0�\nL�\nr|!�lx�����ju��D�$>��r:��klm��,�V�b����r�?�,E�~��|���q^n��v�I�⨵�I��Ð�6tB�:.\n**��w�<�2bE���.��X��%_`������z�Ov�\0�! ���.r�X�\"�@I�h�$Q�B>���h��/���ğ/��J4��qht�_�Zb�º�g�)!4�	�&&\'�>��L��660����11��e�q���GF��p�j2W�����ĕ\"�9��,�8c�?��1<�4M\r\"a�Bd��gdO�[6�	al�?�7����4A}Kf����#pRBW�	�=$9�	W.BR���<�[��	G�+O��AK��w�@���=��I�@+C.\0]	�O�}��q���c㈕�X�x2Q�s�B��/��Qa�J5��ɻ��d�,�1	��4!dK\ZL1w�tCb4\\WЗПx�.R�I\n�C�ٗ������3$tQ]\Z�v;�U�#P�XV�\rV;]$F�Z�N�����`���e��h�_�$hB	��4��GHP\'O�����yy\r�H���G�Bk��\"}P��<�g,�㯸��E����5�|�\n\r�آe�}��x�����&��a�.E�f�GLT�b�w���Q�a��d�&�}�� �&,A�@�9�\rG���D�45�Ϸ���a��YBJ�k�>��B�[����&�����_1��_%\nP��D)�b?bb_3�~�s]<�g\r.� �О�tE�\0~�3�3�m1��cx���t�_&���W���-�$&<(4�f�&��R)}��f��o��¯z\Z�U4@�:b�᠑�;�x���5��#�%�!b�Z\Zb��\"=�P+�?�]��A\"�D\rh$.p�Z4E5\Z�\nX�	=�b�m�q1F����\0P,�pؒ��,�kb���c\\n���@��^����y}����0���<��pa�_�E���xG������|}\Zo\n�Cn�%��(�=v>��\n�&�z\Z��l%�f\\�m�!Kh���XkDP�N&P�\ra2�ķ�\\=|9E4�p�ń�Ln���c�Q!0B�O��	cX��BYK��Aj�!���{��d��t�N�n=(_\"\'�4�1]l�!;����͞�np������J}� �2�?����=bi���}�����ϡ~���!������x�T�B��\'������.�Q&1�[?��U���߁z�>\n�`�×I\r[c��j�um�~K���4�\"�\\��a�����#�j	֓���3�̝�9�]���P�^)�/����_�\'���_��Ԁ�&��u��mgL��7�߁?��}�Ab�%�Q8�L�b�D�Q�ߨ�\'�E�����AR�퍹�����%ǟ��(;?f�\0�m�yGO��?�#`-�b�KM�3��!O�}�f�>���X���m}��B&B�=&(U��C �kc����{M��Ր��O��η�\"�~\rNvH��ԉq>���fo匳*9V�����@��\0ŮR��-�k�@Ӌ�\'��\0b�QGj$?�vy�GH���%V�\\wEm9>uU>M2���M=y\Zb�2U���2A���������2Q�ɳ�	�!r}�,z4L�j�B$%�lHHK�?0$а��\rĿ\0_��Z��!a\"����	\"	�ȴ�	0#��:�\0�G����6�bܞ�|�v������]9�	$�������D�\'�81����	矰Ϋ� �~���\'d9W��}�{���\0ȟ�j�ῼ���_xm���<-��c�J�v������%���7��m�S��#×h�$ZR�K��!�[�ጨ$z����~�+yL\'rW�:�������E�\\VS���t~Q��%��jt���AE���L�-����\Z&{(�����+�M�BF�`�,%�V��8r6�-܇!|}�6� ��V-⿐Q��[�`Z���%�H}�5�Db<HX��S8�)6O��<B���9Na��s��o-��DMlv7��D�ئ9��X45�7D�k��Ob�����t�\r��℞X.#�H������42C�S*��A,o�v	��*!��+�7�\\q���Z$s6%�p������t�B��J��I��\r��]��҄#lDx���\Z�\0\n�=!=��m\nߢ�O����13�Be��q?�����f|ג�b��\'��AѠ��V�Ѵ�C��	�DL�	�b��\rbb F��船�I��3b&Z���GB��NP߀��r;�ǎAxirBY�V�+�\0��!)y�f� �;�<\nv!�W����%$v���\"6x��n���	�s�_S�\0l\r\nϊ��ң�\0�q\"���_\ZQ�����;�X4��A㲦�lRc;h���I���$\"f\r�!�oᙯ��P�\"o(\n�Cq	�	�1���!T �`#�@�.�-��I���WA[��|||�T*��Km�ʯ}}\Z�:m��\0�(6q����Y�q���e����]�������xcyhxX\n��p�YF��ѣf����ockó������0B\Zؚ���gX�\Z+-�d&B��D,�!a\\,)M�Gb�0�I�/��\0����6.b	a#�+!�.�(��H�����p�!�\Z�\'I�SH%|ЍO�k���\0�\\�	��1�5�.�`�\n���A�+^��\"@��[�$~N��	��4����dÑX4�m�#��Mf+0�}�jt�7����	!q��G�6!�;��߲?X��V��Bأ�w�\'ݲ�W�&:�hc���2-5��O�0�<PF���/��z�>=�b$����+�h]�ס�B�Q_d�oa�\'����%����\r��	��:\"�c�쥶5�T�>��\Z��ܦ�+�hp�������i�L/��������0���nl��h��� �r��!ol[����K������ڏ�j�g�K{ E���L�b���S�-��i���D6\0���1���P����������4���Ai*�oB�%��,EL ��J�A��f��M�X���Oėm�c�\'U�yF��1r��!@��[��,���C�^��IX���&�(����!��7+��AHv�>���r\Z��sƈNN�x%c�*���(�7ӿ5�o���w��}`����ys�,_�\rT�:�W��q�mr���y����X�r��H��.�x����4WG{0��!�^[��3�O]�[M^kk_7؇����y���*H�A�P�]�vr+���� �pr[8�M#���������u���:bI6\ZK��h��C�	04������;��/����6��x3�\0��Τ�r�E�����?�bBcgH*�����oO+�|��	nN%��4�k�=a�oھg�G\r�8�Tf�5.j�7@z�g�\Z���9�	s�&M��(�X[9�|����ɴ�\r�a&���ѱH���8�i&Կcf�Y)��8��\0��	Y��7��oݜ�W	�\0щX��M5��3��U�=^]c������ �a\'$��������m�$G]%\r��6nPJ�ݗ��E�u����oK�؏�i�1hY[�r\"�sav\Zt���Di����O�eRZ�i�,8�+��!fwm���GL33�f�0���-n�OÂ(��v�ln<fz����~e3���S-�LJ��Jq:Ip��uJ�4�|�(\'2W����H�V��D[�3\\7��TG֕����d\0�.��C���Ɂ�� ����V���*Y�O���XB���X�	\Z���L[N�\0��-/05m�C{^���_��؛�	���O�O��L�������g,�HI�\r�%�/�#��l{hp49t[HZ�.���Y�B�>q�.�D�$�E/�ZY���<|_�m=�lQ	;@IWvЦ6��W���0/:�\r��M~��S���~�ݸ����L-^���a����ǀ|��ɻ�}O�����+����$����	�i��+���R�#���{62���\rR�~M���:>��^��O�����f��x=3��nU�<�5�Ơz�޾FP4o��jC92|\n��G�Y-�H^\rg��Ge�Ñ]0�v��X��4����cY���\0#m��)�(�Z@Ktؑ������+�A��lxL8����j HK�1�sB��&+x!�$�!o��H$���;XO���8��7���Cv\rGMQ&�a`Z�/_�)�/���7�?��]�Ѝ/�(bZ�}4:��[�^Ƿ�]��B\n�C��HpklQ�C&��hؤ�KxMp����P�P��\'�a`ފ:�<a�O�.1d�p�&�j�pe�,�K%��<�r\r���\0����v�$��=�Wa�F�ZA%�Z�\0�O��ۜ����\0� �8��iWLx��|����+�N�hik�Z�����2C�{O�vM�.D���п���X�c�.�,�\rl4V���	L��[�6#ܭ}�-\r�s���FL�W�2W�[C۞�{���Q�.>IH�[+�<*5���Gc�Df؛C��[��gb\"f�\"��$ELzcu ��9������CȔӄ%	?��O��O����O�\02�\0\Z���?닀�7�\"�h�}=�����\"8=�����Q�{�63tZ!���\Z^Ѭ�A7��s����<7�����a��6%�Z�&i\"D�W��aԵ�V�dx3���Ѝ\"*�����T�\\\"�FQj����^=Li_K�4�u]���4%��~(i�j��D!2�&��.IqS�����V3�a��Q�}�3\"Cm$����ަ��K���������cI�p��U▕F�.0�>����Y?�eBt��S;�$;%Ivǹ�]|�!�T���ݴC�����V/�����6��פ5���n4^O����\Z��&\"�r�u�͌�,�U�B�_�ɱ_O#���i�ޒ�t˗��Y~B�o��s})�����\\�sw�	|�\"��O�K��hS]��BCXܐ�c��M��5��t>��%6�&坒*�4tO�\0�\0�A�#�#���P���&��4}���娐?!�C녚yW������Ȋ:ԛ�EO�V;��N�>�UV�3����o�����+�_�:��yڍ�\r^}b�	�$f���2؅@yr[|\'�.j��o5��3-g����*�-<��s�i;BpH������\n�ȷN���q���N��E=\Z-\'������GU6�\0��ƨf(��^����4�Q��B��\'I���#j�>V\'�/�jփ���Ui��8�O>�P����:HA|:T�a�l����|-�����M|��f3�z�ѱ~�9�Џ���sY^�͸\'��l�Z�rQ����\0C\Z��|��⵫�,+�|�$mo}$w��tEz?�|���e&Q@�t��\0WTG��$	�Q����Oa!\'�S}�|Sc��V�pk�8-9�H���s��\0�?�.[��1�����lp����t����袚\r���]Kk5c�eMiW�X�5g����a�$S�D������↩Y�[!���!�t���MR_�r`�R��}i�$O4����9\")��)�ޭE�%�w��ڤ�o��2.����\r����v �M\'���[���F\'�=-\r��f��\"�#��3�dc4Tc�����Z;&j�C��h���DL��S6�F���������D�~F>�5��X��84+1�:��z}�OJ����ƆMO=j��\Z�^��~�.��y@�\"�n�TCб��~@BP��A���e~��_�?�ǉ����bX����==RW�s��I�կAjGCM~�o�6�����A=�+�����&��������WM���hk}�LG�{�.�����-l�V%���A\\4�pv�0�8�\Z�K�H���!̩���q��A1�(��H)(w��WW��Ğu���G&�	b�M4��+K�$�p���G`[F���o�fgԎ��������ؓ�M}��a��6Q��@$Q7��M�\Z�pI��WB�(���s��IZΟ\'��ND��c����߭����l;Pv��Dhl��i����3��6\\\'\r��W���4x�a~��B���c�H�XX�E�!��Lq<V���-@�7��QnW�4E\"�i��>I+�	�m\Z-��i�DZ��GYC�����}/�y}����+����!�r�\\�<�/��/�\nP-W>l~x�C�mAk�؝#C�}�,�$�gN���K��cHN��ni	���!�� ��?B�\'g��k�����i-\Z�R�s�̮�}�`���.�բ��PݾD�r�����<Z?{��ڤo�Q|vO�_�����Œ�_��aS��]48�3i�q����F�V�z�\Z�|6͕��v�O��v�PMV�o��	�Sku�\rvǀ��t�F}[UhP��ľE���@��m	�饝��7���VwU=2N�Sk��4�@K���\n\\O]�2=K˦�Q�D)%QR�Zּ��3e�U�Ôή͍��2k\Z�kRԣZ\n\n]��+���,+H��L&6����&1�~@���\0c?p�	�&��s��t�\\��\0��|	�\0?�ɫ^�G�cql֘]�\"����\nO��L��������[/��l5�GbE��BbE��[�b��z+�%��\0���RI���x\"@����>&�/�q����B������b���D��!/p�o,j�M>N��s�����h�v�� ���%�n����j��A�K��b���^�؇�M���bbh�k������BZ|5�/�ڢ<f8W��:�d\\�{��P��[��s�����B�����Co�(��_���J��+k[�!��-QPgjO\Z\'��pǷJ5Js��P����j��$�p�5E�>���q�����t��O�PSG�C��/�/��֫��1ФP�*��_T���M�.������v��#���8�o�e���S򰐞,O��Ρb���G�)�hg�\Z�NN�X.P�}�/�V&���_BvބK�z+�\\�U�:t k�f�,6Ѹ��\0��3�k��q�8���\0~#��\\�q�\0N���-���Б�V�l`菶*�{:�^X�\r�|�.��\nl�	W�lUަ퓱�e4���b�ct?��6��^����!c�����Y>�C;\'�ק�N2|��(V�g�u��ӾS��~��q�{4�l]\\M��W��r�rݍ�B(�[��!�_?�eG<�����\Z\'���6/	�47N����EV����I�r�#v�N�Q9��}�C�1u����C�0�����~��n\'/p�|��mƔ��Y{�<X�H��V�o�\n�Tۚ��� j�Y~Y���+8�lT���/���)��(�AߡG_���p	Ȅ�l9������c�_����a\'\Z�\Z�Л�~~@��w��\n�+��8��C�@(��3M\r�nÅ���hM�	���j.������Z^Av������\"��u����\0�cTp���\Z ����k��>\ndΊ&�s^@��!���s��x�g?#�h�9\n_A�3p�m��Cb��z���s��h!<6�(�Ȣ	�EA	��v1�\"����b9B�D����[�׀\'xur�Z���i��,!��\\e2��B����B��5�\\O���;�P;i���Am���6�n��`\'��\0;��\0cns��67��?�!�����a��{���ɥ�d��6!��\",\\B>�4����!V;W���.*\'pmb�Вlbho\ru���}�K�}!׋�9��tk���Bw����?,MA����Q��{������ٯ�V���e�V���4�f���r>OBZ�\0�7�l�(�.���˱\\t���^���\'3��\n%�4�+	����B__��c\Z��-�#�DL�\rψk���ƃ�dj�^xOس§��Mw&nb�+a�>�IF{G�C�\'�j�r&��͉Xѹ�&�\"w؈��H�i��a�hZK�tWw����p���7��Y��ɘ��&�u���U��g~����D�f�q&�NC@�YzI}���Q���\0ku$�[��o���u�1֮�*���↵>6�(���¦lI�n�C03�^[ B��~^�̤-x3��ItG[�d��L�=bo�Ⳣ��l���!�RdW���ovO�J-G!�����ZW�fw��%eb�$�l$r�T����%�\Z����1�CA��I��[Bm��j&�϶�q��;������ޏ�oם�qʗ�a1K�\0�a�#�vB�,pe!^+����˲��Y��;3��\"�G_���S}���9� (�HEԥ��ִ0���c\Z\ru�\Z�Z�:�u�2��?s�,�����;q%GB���n�P��|� �������+Hn�>�����bD�El�l���1�Ĕ�\n��&E鴭�^,�$�Oo�\n^��1�D��op-iq�;�꟯B�_~�t0�}Ӽ\rC|��>�z�q��B�F�ZW؞)6_�)?��Vr��7~G�/�/��wC�w0ۨw)�h6\0����6��lc������&�Ji|�a.p_�����I\Z��\"��V��a\"���7�\n8���ܢh���׸|��3	�\rh}��W�\r�Mh4|�a�h.Pj ˳�\r=���$��\0�>8�^�L����M\\lނ�IQh#��=-��(~�_�|��D���s�I��(�O�$�g�	�l#yֆ���\\9��T���ҶSʪ.h	%吻\Z�%��/����m	��.����f����]����!VfV���n�14jG3��j�Sw{	�.����{`\r)�	k�tJ�s����\r��QT�=[/,��>�������U�A�It�q��q!n�C�}��b�r�t�p��s_��9����CP��O�5�~�H\\�~ j��,��*�e��ѽ��/�NavĘ����h���/�S<xwBx�֒�����_8��k^P��\Z�4��g�f��>�6X�R&���Ņe鏓u���TMgC^�P��ͼ\0 ؞+C�!�}���F�O��%�R���J�*^AГa\"��U�{��?�#��:���v�ET?�(z��\r\0��\\\\��5>����ǌ��t��\0��\0ö��1��ſs�����G��\'��^ �,厄�	E�����r�m�`x�|\n������S��Nȭ�����c�#�5r)ٿȮf��6l1�e<��~���rWqv�B���@�*P��4����\"�Lo��6R�q�]��*\\B��k�a��{r��خ�7<��#O�E�ہX����\0�(��x#_��O���A�jІ�=��*��s����w�)A_�7�R���P���#��ok������o�r����M�܁��I��R��b��}��B*�G�7F��C�E���Pp�!Gh�8w(Bl\\��{(��	�.9�bz+LlO�7b�!V+�A5��Gp5y���Bl|��9����~@��\n�1\"���&)�px��*���	ȎtG���.��;.�h\'���%o�V�X+�k�_�+/�Qˏ��Ap�nq�_�pї�_$�C���[+ ����;6ıؒ��05�+�0�B\\�p��4�L�� ���=x�\'�(%P�L�\n�\\Yz/��m���cG(��0��D6!����*�ϸ�G�O$+�LE�bgG�A��#lLLBE~�2�m���=p�h���Ss\\0�5P�v��yC�w�\'��m���W6�5^�m�H���؜�A?b���$-�\n�Bz6k�b�=�	�V��c�68+�o�@m\"�^����B�#�+�����-\"��h�+_�|&�\\���.���Wm�5�v�\'B�Qb~]t^�_$�W�+MѺw���k���bq��d����	\rA���Ε���~�6vK�W�VI���	!���BXM��Պ�w��90~���?C��f���ۙ�Wp�@�4جO��i�_8^��)D}������Q6!=��6Q�\r�7��\0��#�m�j����I�\0��\0���\r�\Z�����\0��\0��w�\nj���/E�i/�6�,�_��,FE}�}�\0������\Z��꠾(��8Z�Av�\0��1�����\\b��1���!�T��!��F�w�{�,�?%�����\r҂�\r�5��x\Z��9�U�@9�L5��쟍!2\'K���}� J��ٿ��\\��d@ӻ7�c\0�(��d|I�Dh�ٳ�� [c��u�^[e3�hs\r�!��\noQ��t�Q�� �]\r�Cb�\n��JU���DR#5	�oX��vi��aT8��G�3����Bni�O�%�����*�\"!P�Q�\0��_`���1�GWNA>����N0=�l=O�NW��f��5=8\"I� q�Ӏ��=>��h��@�����������h-c��d���b���}�w,�#K�GS�\rl�p��KTo����=T?���ڇc����<����xв���|4/h�S�\r&g+�y���D|�mߕL{�%�lt�H�j��_\'��,Ӈf��~U�vOs���BL�T*��e��\0�Cx\Z.Et�kGB�4R	1�C��&�P�)J&(�!A!1�`�y*�k�-qMc��O\Z�hf!��?���Q=ap)_a��4�.�ȇ#X	!���	\'H\ZP�N�5���g�	�ʏ�䇮Ӂ�c�i��=�/���z��	U�i��y��t����\nב��7��_\"�isqK��lr|��\0bt���(S�~q0�!Q��A/q����#N�����?��\"�E���GMW�\Z�O����&�qR\r�<+��F�	�tA2��1rB3�EA���I\Z�A�Ox����3���B�$%�c����T�/�9A �&��,��>q�W��C3@i�ѻ���#�h�9��/�W���8�B�_�=4����^�@���ă_!�m����eL}m�G��\0Fʹ�T״#�Q���qq>�o�v萑\r�Bᄈ���#�& T tQ��\Z\"R�8�)X#�����ee��\0�O��\0����\0%�����!M����_���j�\0��\01N��>��\0V:��3�~X�>�ɷ���7�����O�q���^�ةvjC����g�A��Q�0{U6Yi����\r&[C��B�x�S�	OW�?h\Z��hG�\\Bos���Oz~���m��L�v�|o�@�ҍ�[khS��m��%��$��K��ӡ�C�|�\0�B{���+�\r-? C(��?�a4QH����_��\0fkH�\0\\\'([�:?`)�巏�����?��\0�?�_��g�\'�5�\0��������:t���\0s�k���_���\0ܿ�/�?�\Z��S �?�(�\0�{�\r}�D��\0Q�\0�Ķ��\'b�8�����w<�:bz�>�BLO�$6��.ι���~\"Q	��OA��D�\r!m��H_C��.~�8�������������x@��\n�})�.���c{�6	-�UV��j/���;����\0�W�A\ZZ��=�߁������\'������*��cO��M�8���C�Z|\\�h��Z\"����h���|�I���vq�\Z)��֋1X��EC��DI@�h��ap\\.K�hRL�j	��8���6?���x�\'�}�$ǟ�_�B���cbrӈĐ�	�lG�&�~�Z�i�!�kه~h;Qa)��vpi���-��|��\0dU�_<	+��q!<�A\\KAY���*ϯ������}C�e��&&�\"�o�+���6pD��������*�+�5��\\�1b����Lv2;����r��XM�t.D��G8Mv50���\'����)�M�dإ�?$8�a�?��<&�3M�\rа�(��]n�����_j�a�IB��� �_0�p�l|(16Hsp�p�t],�$�>K�����_��so�lcG_\Z}�0J�`\"�L_�6&����Etئ�V�cD �l��X�{?�6=6٣X�L�)��H*i	���c]\n�h�9D�I���B�,6n�6&AgE���O�	P�\'	�@M�ؽ�lv�5��U�~���^E{���p+����jr	�t�{\"�%خ��AXސ�t�&)�;M�$��..(�V)q�x�����+�\0�1K����/Ph�:�e?��]|��[h��F�6E�x�ņ��U����P��7�=��]\r�F�����La�G��ߡ��M����=g$��ނl8��ͱc�����6+B�P&���{ȸ<�K��ҫGsB�\n���z?\0�\Z!\n&-�[E�F0�ʢ8	�����������D�p\\pc���h+����*X>_�ivN�Yhv\Z��7�|\n���E�W��Zk�n^ƫoC���Iy�/!�|}��\0m�1�Ꮈ0g�a{\r�ؘ��i<\0�!/�-�д&�\r8p�J��1�W�D��$|)y_���AP���3S��|��%:�U�u�P]����̃�ֶ�/�嫅</cHy����\09?	\Z���#SK�~\Z ��˱�7���#U��BZ++�z�r���Ƨ[�+���ny\\�43���ʷ����*6�O��hO�{��lb��6�]� ��WO�4�n�M\'��=��-����ٟ�c��Ћt�6�!�����GL/�P���u�t���`m��E`�ٮ��p?�q6[��:�	��b�B�u�L��苬�vt#	s�2��G/���t:`�Nz�����̕x>�	X����>�oH{���`�c&��n)\n��5����7��q�~�X��q_&��%���,��\nG}a5}Ȑ5���cz�?����hdv������0@�b�	D��|J/C��?!ˏM�QHo__)��S\Z�%�����ޟ�����T,^����\Z��b��wj�r��M�v�c���i�]]hA���S�EI����\"^�e����������*�h�7����@��\'�2���i�L�\0r�W��T���i�Y���uҶ�+G���7������$%��^�4�U�yBɢ_*���^�!�|�l�������$�\0sDlq�w��?c(Zb=������9:�\n�\no�C�5[�b��,�����\Z�E���>ٳ�s��6�z�\\&�#do��\n��\Z���(?�\Z�)��x�gLM���>▘4��Uߑ�^M���>�I�&D�\r��Z�����Ya:��/\0���1��7��g�5��#`ߋ�U��_����c��yp?��\0�U�%y���:�����U�zB������p#���¶�`u�\Z�s��3�L4��^����in��n�{�.G)\Z!E�Pn��I�\rR[�h��4^\n�`\\���(�b�7%\"��);rJ�i�w�٫|1gpx���E���\0F�T=>�\r��I����	xm(S��5\n��~j�����|�Go�nh��~ؾ�\\�)�;��5�J�b�>H��֌�ʔ�?\\؟���v��ch+{t�9��e�n*�\Z<�*c��û�Tބ���%_a~����\'o�)����6�WU6/����5���Gfi=�vP]���9���)�y��T��.���`�&n�p��G������9[��oaҮ_�m��izb{6����\0�6��������wxG2�.^=1K�\'�mp�}3�)�0{@�r\r��&Б96���*#_�@z����+^�R����	��(��J\r*��x��X���6>�i��(��r������x�\"H:)Q��:O����U���qb;��t/��K�P>�)�\'������~>z4I�]~�+6�B�>��\0�ם���}�[��n��=�6�,Ss�t���9\n�B��*V� 3�ry9�.�~M�M\\�F��^?rf)Y���M=_�+��\'����H�#v��%e���\"�\r�D��IKe\\�R�Aث�}�\'2��BC�mr��z��P��z��LLb5�Њ[������	�������Gy�\Z�\nP��`�|�!��-&]��/����Iyh\Z$	8UP���+l1�¢`�(��]��m<wL3��~tt��5}HP2��e�S_ $)��i����i�B�K�t8b·�ErQA�]�g�vQ�)y�s�jr(L�\r�5��jE�6%�*(��LB.iELm@����Ho����Ә{��pXY�*ɺ�p�44��Ҿ@����i�UB�{���h��-r�}�\n�\\\\�_��,�/����m��B��m���h���\n�Q���ȌU��d�LehR��[9B�����A���1$<��#g[�$�N�\r6 ��.�1�����L�Q}��	�G�F��1M�Ttj���_cU�\\.yб��<���?�\na-���_XYW	6U�٪Q���#dhF�\\va��p�p4Q5\r�4�X�{B07�}����4�\r��\0��F���u�&�0����н�X�F������4�;AV���$4%�\r��	���6=�Z�\Z\Zv&����ǐ�p���oHg��\Z-��G\\����r	�/؊;�I���6��xP�)QVrje�Q��a����>˓��`:�?��+�{46\\hR�BcX��p@𘞳D�8\n�\"�\"����\'�P��^D#J�����S����C�J�:�	$Q�aȘx\Z�l�`��2zbA�<aYW��[d�	��O���!=���a��#�!��+�%��U~C\'�2�q������U��?�S�z�ĩ},�>��R~�(ʎ+N���WV��y9��U�%�\"l��d_ͭ(UJ��A�^���h��E\Z��Z��r��w�M/B�v�R/�\0���o�?[����~��-/�����h�i�D����p\\���%8�ڶ�,g�\0��a���h�J����T$0�ؘ�t/�p(r(hA�+�V+.03�\n��B(��\'�@�A��\\���\'���sI����\Z.��x߇�`r��h��}\nbpDܗZO�V�ҜbXO�O1G��6ፈ���$#�s���? �QJp��HL���Я�Z�9�I���*p~$i����8e?CX_��X��l�q��P~�T��J/\r�k�tg̒:9��{��2����h��7�ɧv�����؏��W�P�	u�B�)>-��%#�Kޏ�����}�]�����ꯆ�b]�׍��-q�A�������G_[���q\'�\Z��}����t\'�.� �x�M���r�.��a������EJˣ���|@y~�XD��f����~��S�}�������\r%��\\_������1��ɍ��h�wx��\"���p;��i��\n\n�ƕX��?�?�3��\n���@:��J�q����lO{�rE���\0,��5�k:�K�#nM�9��6n΋Pͅ�xA��\r)I�6pw�+o=��Q1����!=�����t�	�����X���j�b�o4.�X(ϰi�^����@�����e�/�Ꭸ��m�d)��_�h���6��q���3��z�a]��1J��̻\r�H	���\'��7_e6�\r����{�,2*(/�-\r,kKB�*�p�9�hUE�p(@��ض(2�DD�\"1s\"��A�`�G~?]e��ҋ,\"�T��)�&:�X��.M]��ss�J9m���a�>����5Ę��&I�|��H�֎B,�\n��POf�&\'�*\r��Ԫ�����иlC)�ʍ�v6&�����-�����R�4��;\"c{�8vM|/�HS\rC$�0_��*�\0\"�1%sб\rQ�I�x���a����>�]�L�����Ra��~ ~����*il@Qar�	��m�9rQ�\'\'���b�]�\r���E\r�lF�	 ���6n��*8(���x��b�ys&J�g\"�MR	��K+	���J�/�aM&�d&�S�Ht���C��:�Cb��bU)K�/��c\Z��ƿs4D|�<�J����g�]���!�\r�y�c���MH삢�8}�:)p���\r�h�wF����A-��pM�A[�\'K�R�~Ar	��>}CGBT�a\Z�G@mB{������X�8yOc�C_GC\Z.fV�x(�ssJ,Q���������1�CW�n\r�}���S��Ю\Z)��4V� ؋�᨜e+a�pl6���:JA��t+�no	��0�P���h!��8XBQJ\r�O�[�>���+�?ho�~���\0�?؋����fl��e��	�0��(�n�)qJh}���|���\0P#z-hu_�_0u�1Te��=aW�\08�P}Czc��E	м�[6>Ί5��:7k�ۦ)���=�`����]��N,W#��GyCb��+8Ar,��lr��¼�č��6��Q���\'���%��\";��)��ؖ&�q�S*���`��T�����\0\0\0\0\0\0��m���$�@ 	m�m \0$@95\"l�	$����Il���\0�H��D�m��I&�md�I��I&� ��o��Yl� @����!64A%kl��-��\0o��Yn�o��X��D��$���m$�I���&�L�[/�K*Y\00I$���ɴ�\r$M��I}��K��ٶ�}��\0ov�I�_}��m���$�پ���l�6Kg��\"C�4��e���$�\r4M��@��I��K��m��m~��[�K��m,�I��H�@�6nO��j��m�R%0@\0�H��$�I\0[$R&�$�%��M��o�\0�m-��$�I-�I��@�~�oj\0}�R��$�ȶ�I i\"R\0@ 	%4�g��i��m��m$�,�I$�I��H�}��|J�\0�R�d �.`lN�%��7\"j���Jl��A��I��I���\0�����m$�m$���h�\0����\0��Y.d�*�l�o�ǥjRH�����A��K��I��o��\0m��m,�m,���$�do�\0�\0�\0��@�I\"	ɳI��m��m&�l�Il�I%�I%����I&�Y���\0(;m-�I�����$�@���\0��\0��� �l��A�@m��m�Il�@l�Il�[%$�\r�\0�I&�ɿ�mi;}m�I����\0l����[�Ca{I\"�%�[$�[l�$�l�Il��l��l�_��I��Yd�J\0)m$�K�\0�Kn�l�����Ka�\"����%��l\"�l@\'�[,��l��l�{�\0�I��I-�JA\r�$�I��I&�\0���\"�`h\0Rɦ�l�Il�I$�I%#K$��@�	4\nI$�\r��%�Im�Ka\0l���m\"[\0���b� i�It�H�[l�I%�I%\'�l��,�I$I$�\r&��%��%�I(\0|�\0ܖ�$�l&��%���\0AVI�)$��$��$[m��m�I��%��m��A��$���/�%�@i�%�H\0	H&�[��ﲀ	�r��3%�[$��$�l��m�I��%��m��a�\0�\0$��I.ҧ�` l�JH)I$�[-��A(�[I\"[$����	k[�M4�y\0�i���I.�$�R(�RH@�`�(\0�\0)\0I$�Km��\0�(�[Ib[$�I$�I\"[�$�\0�I%��K$�.�R(�vJ$��@(\0�@ � \0!��m.��\0�Y,�R� H��m��.�V��I�Qm\"[m��M���;M\0\0\0\0$�m��I�$d��\'�m� �V�$	A��m��,�\0��I�Ql�[m��M��lI�	\0�\0$��i&�I&\02 ��Im��\0��!�R� [	&�$�I�Id�\0\0��\0�I$�IM��\0��	�D�\0I$$�@\0�@\0\0���m��\0��!�RK`R@_�����$�2�����M$�i]��4��)�\0\04�@\0�@\0\0$��e��&Rd����$�I%�V��I��l�@,��%��m$�l��` 	���\n@$�@$BI{$��m�I&$�r��$��%�R �	\0�$�I$�	$�@}��L��@ \rD�@4�@$BI\0e������&B`�{I��$��$�\r!��$�e��l�I%$�$�\0��\0�4D�JF��@\0	$��e��I��[�d�WK��$��$�m�	$��e��,��\'��e�\0��\0\0�����\0�@\0\0	$��A���m�Z�D��J�|�I$i-�`��in��7�M$��l&�$�I��n\nRI&�JF� 	m�����d�����J�d�I% �u�`$�\r��7�i���l.���IH��BrX�H� 	m��m�����R!�����I$�@$�鴓I$�ml�D%���R��\r���m&�\0�\0J\0I$�m$���\0M��PE��K� Id��$��$�i$�Mn�I%��orV$�	1��m&���\0H\0I$�m$�5�\0�i\0��H���0���ߦ�i%�i%�`$�[}&䤐)!&��L��`I%�I$�I$�%�\0�`�@�H����� ���ۦ�I%�m5�@6�[}/�$�9&�lL� I$�I$�I,�}a\0��(��\0H��m��m��h��n�Il�I4�I$�r5��$�IH��$ \0�I��I&�$�I}( �I���H�������h���I~��4�I��R%���Il�ۤ\0\0\0�\0I��I&�$�[$H\0�\nd��Y%��ʦ�m�I$�@$�I�I$�M�����[��2A0�l&ۀE��I$�l�ao��$ �`��%��ʮ�H��l��m�I$�m$�I\0��%b�%e0�$&���I$�l�I���\0	 6	�J@��l�m��l��$I$��|�@l�I�\"i�\0���[Y%��$�I$�$��M���A�I$��@��l�$�I$�I\0I$��l�@l�I&m6�����Ke�I$�I$�$����H	$�I$�\0��I6�H�l�IH�yl���g�}&�$���H�I$�S\0\0\0$�m&�%��m6�X@\0�@\0�\0R\r,�I6�H�l�Ml�Yl�_7&�\0}&�5����II0�S\0$�m&�%��m��X\0\0\0$� X\r�I�l�@}�R%\'�i�����\0o&�~�{Y&��[B\0H�$�I&�%��Ͷ��\0\0�I\0�\0����n����V%\'�k��m��}.�l�_�^|��(B�\0$�I&�%��m��! �I\0 �%?�}۵ k��bM4�Im�M$�_4��l�l�(\0�\0I$�I\"Im��m��i$I$�\0�$�}�$\0!��\0�I%�Id�I,�K$��$^|��$@I$�I\"Mo��\0}����-�I$ � M�m�l�,��m��%�$�I,��$�Il��l(LȦ\0\0I$�I����m����-�A$$� E���$�$�I$�I$�$�I$�Y%�I$���\0jH�\0I$�I��m��m����i0M���%��o� l�	��.�I��\0�[����@\0R\"JH@d�I&�o��Ͷ���I$E����%�IP6m�\0씉���%\'�I��m��K,��D\0R	2XX\0\0$�I&�o��m�ۤ�I$����K����lIe�	!�I$�Rl�I%�A%Il��R��Y!\0$�I�I���m��6�I$Ԓ���H[m�e��3�[m&�l�I$�A%��$�I�[��� $�I�I���m��6�m�\0l���\nl���I$�I@\0\0!�I$[$�l�k$�\"l�I$�� \0�m�I�\0��m�۴�m�l��l������H\0\0��I�_l�[&�{$�Ib�^�I%0�� 6\0�m�I}��m��6�m����% а9���mIm�@n��\0	&�ɵ��\nI�@&�md�\0�m�Mm��m��4�m����$H2H�)$�I%�$�@$I$\0	m��$�\0I\n�\04�m,�\0�m�I}��m�۷�m�v!0mm��IA�$�[l�[l�	m��%��m\"Ao\0	��m\"�Id�\0�I��$����۷�m6r�0m$��	H�I$�I$�Il�	,�H$��$�\'d�\"�m��Yd�\0�I��$��%�߷�\0��\0kv$h\n\'�A���Ih|�����%��A��$���5 Id�ɴ�\0\0\0I��$��\0o�۷���\0kv$ g�A���[k4�l��M�%��C��moɓ��% I$�K��\0\0\0I��4��\0��\0���MlM� �\0m��-��I$��lR%����l&�l�[ \0jRL�Kd�\0\0\0I$�L�[�\0�ߴ�M�M� �%&�%��!��$��\0@$�m��l&�H�[`\0�RL�Yd�\0\0I$�l�[����I\0D�`\n� ��I�[$�I\0�I$� I}��$����m���I$�$\0\0$�m�Mm����m\0���i2��@�I$��e��l�	 �Im���I��[m�\0��Ie�4\0\0$�m�I��ۤ�Dm�@�%$�$��%�{$��I�_�\"[�I4��i��ɴiF�	.�H\0\0\0�I��$�۴�d�m���f�\0��%�[$��I�[m��\"[$�I$��i��I�M�	&��@\0\0�I��$���	$�I\0&�%-�%&�\0\0e&�I\"I\0@Y(m �}��m&�}�\ZH�Yl�$�\0\0\0I$�$�I4I$�6\0$%$��\nIl�e��m�I�\0\rI } �m��m��m�H�Yd�$�\0\0\0I$�$�I��\0	H�\0H�\0��%\"@H�II�KX�I$��$�m��M&�m$�4����I,�\0\0\0I$�I�@\0D�\0-��lĠ��\"@H�[I�H�I$�I$�m��]&�$�$����I$�\0\0\0I$�I�@�@ �jId�$�\r&�I \0!�H��I&�I&RI$�I$�I��m �%��Y��H�\0\0\0I$�I \0�I\0�kId�[\0�-��I \0!0[l��I&�I&RI$�K$�I��m �%����X�\0\0\0I$�I \06I$���\0\"�!����&�1��|�SY$�H��I$��&RI��m l��I��I&�\0\0\0�I$��I��\0� !���&�!��l�WK$�HֻI%�FRY��m ;l��Y���&�\0\0\0�I$�~�{��\0�\0�I)?!�m��Y��%6��X��Y+[&�%��m�RK�[]$�m$�\0\0&�m���[m��\0�PI(\Z��m��ɾ�}5��H��I*[&�\'��m�RH�[Md�m$�\0\0&�m��o���\0��,�%$���\0 ��\0�% 	l��%�I%�B m�Im R��of����\0\0\0��m��m���\0��lԉ!,���H��\0��% �l��%�I$�\0\0l�Io$RH2�mn�o��\0\0\0��m���o��H�l�f�%�I \0%&%&�%�	HI$\0	$QY�H��o$�I��\0\0$�	%�����H��,��&�$�I \0$�%&�l�	\"M$`\rlAI�Hțol�ٴ��\0$�	%��m�����	�\0\'\'�&�%�KI&�l��HR�m%�m��&��&�I ,�I��$\0\0$�I%��}�����\0%d�\r&�m�KI.�l��Hrl�i4�m��$��$��\"Rd�I��&\0\0$�I%������) �Y,���IH�\0�H\"@$_\0��i�rZ�II ��$_�Md�m��&�\0�I4��o�\0�\0�\0�\0�M$\0[.�	�I��H�H\"@$[��i�RڒIHMi$[l\0Ge�}��$���I&��}��\0����\0[g�(�@\0�I&�$��$�m}��mf�m��\0�@BV�0@+��m��\0m%�� ��R���}���@Yg�(�PJ\0\0\0[$�[$��o��o&�m���R�VI @e|���m-�\0�\0��R~��m�\0�d��f��[M��m��l�m�i�t�n�����o��I$\0�#n�\0m���%��I��@���\0��d���&��M��Y��m����Io6�m��K���I&R\0\0�f�����%�XM&�DK�����0���I\"Rl\0\0l��%��I�Io��m���� \'\"Z��\Zen�m��}e�H\0\r$�D��\0�m��\0��Z�\0i�K$�|��$�I�Im��m��i�r�@��Wɰ\Zeg����m%�JH	6�@���� RK$�od�%6�l��I %��\0��Y��]$�4	X@I$�$\0;���\0}/�If�l�Ig��o��!&[Il�m$�2Il��H\0\0%����ɴ�O��,\rHPI$�$@�\0���&�I\'�l�M��\0\0\0\0\0\0\0\0\0\0\0 01@P!`A��\0?E�O\n$$uccb_�dq�r�P_�\Z\\Ҕ�\"�؄R�Z]RĆ)JQ1=ЈMXc��K�)K�R�����cf		b���2�e1<�0���B�R�Z]aF2\r��(��B!5l�iu�)sJR�X��k(^g/�c!5!5�\'�������\'��P���q�/�c!3XR�	�/�������\'�@����R�����(��J67�R�12�ZR���,\r���)J1��Ҕ�(��K�S��A�аZ_e)K�JR����m�f�)���Ҕ�)�±\"�4�)�4�Ҕ�(��K�P��Q/\Zlxu�2<ҏ��)��1�����HK�����b�xгcî����K����X�K�%�-)K�X�^4.�c,c)ulo4���	�	�	�&R���B�1��=���K�.��p�p�8R�(_ŏI�y��{����(���u�>	���~V=�1?J�Z_���`�a�12�-����҅�	�Ma7B��)ua�k�/�<�)r����a=(\\t�&a5��c���?ua��K�B��r��о���4�t!��{�^:\\����о�ǖc��^8N�����C��c��r~:����	��4���z�q�yB��R�^;�Z)ull��Ҕ�-ݐ�Kʄ!n�1�}A��B��[iull�/���ޔN�]P�Kʄ!n�1�}Hu�Z�D!v2B)x�F<��BYc�:�D ��1�(_-^5��B�c��^:Q�,{��X��΅�!e�c��gQ�B��?��hk0��O�XN\Z����/��B�o1ǯ��\0�l~!���fh|qk	�K���^6xB�o?��t;rQF�LOZ\\ѱc�҈D&a��	�C5����·nJ�1=ir�؄1�iD\"0�BY�ݏ����=0Κa5c�!8iu�?>[+��L3��MX��N\Z]i~[+�\'Q�q�K���˥�B�G��	�cl��ǹ��:_}/:�Z<W�B�ic�\r		p��a1�	΅�[�}�,�1��А�!fc����Z�e����X���p��Ɔ�\"�҉���B�\"�c�hB!>=(��1������<ґ��zP���/\Zbe(�!k���֫?a�8X�J�NXOJ����LL��-z��\'�kK������&��反���T-_C���q<�Z\\�7�)xa5},|l{�ꅫ�z;Y�<R�Va��z]�3	��B[��/�X���/f�Nط��0��n�!e��pLb�x<!n��c��K�Be�EpyB�+��xBݏ�tc��K�Be�D�yB�}�X�\0N���\'�cz�j�1��-1<�j���!}�ج�A�wbݱꅪ�R��D�ccЅ�X�{b���\\�P��V��(_E���+K��_�!h��CB	�/��6P��1�yB���Kʅ�R��T,�屼�|���B��1��K�)Kƅ�R��T,��(_thh����\\0�6<�s�f\"ŌB��C\\���B����Nt,�dX��_tc:���B��K�K�c�X�_uc:���]�c�\r/\r/���c.����l�y�>jK�iJ\\ү���l�y�>j�e�4�.Oߺ���nXMi}0�(\\�Y��Տ�h����֗�	΅�N8MX��s��9D/8!z����ǚ]��K�4w�0É��\\�nǭ.�}�y�ݏ4�\rD���X-�.iu�Cbb|��BY��B�ޔ�)JQ�B��3���d,�4�����< �3	�K�R�{�R�/��CXǋ�(Bγ	�����s�������{ixiuB)|�\\�}�X���e.isK�/��B��Bݏ(Yllc��]����)sK�]i_��B��Bݏ(Ylxu�0�`�е��֔����ix��e��Fl\Z��4�Ҕ�\Z_-/(�R�\0X�hh�ݡ�aNxL�xi|,|hC�_p�`��	�CZ������X�І=о�٥݌������iuc)~Z��(�������\\��\\m�K�K�з���(�!nǬd�c�X�P��\\h_d�?G�v=a5B�.V>T/z\Z��h�$,��:*]X��(YB�B���Ђ$,�?:*]X�_���!�T/����,����t/l\'�ziD/����<��Z]н��ZQ���c�K�~�B�~���?+yc#&P�1�D\'��t)qQBݏ�!s���c�,d&P�1�D\'�B;4����c��o	��ZR���B[�0��P��M/����c��o	��ZR���B[�0���ML|,|4�)K1�V<�j��Ǭ!	�(�1���\n!}d ���X�iJR��c�.�y��!!�XBzQc�v!����,�c	�d&��|��4�0�(Zҍ��C�F1����!5]�c��p����B֔BB���,�D!2�v<�eb��\'\r(�ʄB����z^��Y��he.�y���XN\ZQ��E/.���Q!!/��ʅ�Br�4Bf���!MXz�5c��e�=a8�r���%�(\'+CD&b!B�&�=P����2�����Dݏ�P���)JR�4��Q��LLc�oZQ1>!���\'�=P�>6?��Bx�?2R��.iFB)D.ZQ11�LOv��\\҉��\r\r�byc�c�c�?��\0\0\0\0\0\0\0\0\0\0\0 01@P!`A��\0?Jy[��{�)s��ݏ�K��� ���M(��W��GlPh�!�v?/�\".\Z\\�I���X���ԥ�c�����ByX�r�%K���)��!!��ǋ�)�\'�Ǻ�!B��%�B�!��B��B�!	��!5A��#��C���PO��t\"�XB�!7H��!BHH�!��R�!B�!5A��#��~��X!�w�D&R\Z\Z��!/\r(��K�.�yB���³11��]���BCC\\��!/\r(��K�.�yB��A�³�a��{iJQv.���J~���[�^\Z]iJ]��B�;��ebî����R�CCY�)yiD.���֔�ݏT/����Q|�<�f�!5��Be��f��,��\0���,y��!B�BY�!	�.�	�N4.�P���Zt΅�ᡮq���*�7�B��\'���C\\�-)K�loʄ.+�HMT/a���+Xc���CD\'&a8a2�!�Bяd!���lq��1E�=Џ��hh���\'&X�!y�Z=Ї�x��\ra�t-[)JR�ll�)D���&��c�	�L}Ѕ�x��\ra�t,ҍ���)J66R��b{�~kK�1?��1��B�Ƣx��q��F=Њ_n��^,>v?\n�?�I�l[��t/&[��xX�(C�dǍ�ZX�B��Bd�!L�	o	�JBy�wLO����+C�Z�L��!B		o	�JBy�wLLC�|���V��c)WJR��)K�)JR攥�)J&&1��by�)sJR�������^��_����c+)JR���ޔ�)sJR攥C�by�)sJR���������Gc�X�[�p�q������4�-�����~0ߢ��=�����!5c�!<m���_:7���w�~���.isJ67������!~=��.t\'�o��t;�E��Bޗ4���CYB�c�?�yB�:籝G�W�O�$-\Z\Z!B�!Ac�,b���y��S��ą�CD!B�!!E�B�1���b���ʄ1���X����O!	�O�.T!�V?�ǔ��\0�ބt?�.4/l\'<&�{����?CҎ��ƅ��Տv>��O:̅�Qp�oJ�B��)F��JR攥��e�f<!�/��zVd,:��z\\��)J67�R�4�//�,{1���|V�b��>-aB0�!B�!B����ǚ�!\r��^\"��!B�!B�!B��C\n�,ciD/��D��_Ӡ�OǪD&�Cǘ�Bf�	����BY/�K3��OǪ	��1���\'�������,_�x66vĸ���c�B쿂m��Nؗ��z�C	�����-b�.�ZҔ�(��K�B��!\nR�ll�)u�֍叼Ҕ�Ҕ�.�z�]��}xLL�)JR������.zR�ll�)J\\����X��)K�)JR�Ǫ��K�O�\nǺ������~��d!B		\r\r�BY�!L�4Behh�!5�ݏt/�}pV=е�ȅ���L�d&�����D��B��D!0�44B�Bv2�T/�XAvu��B����jǫǔ-P�w!�,{�_�	��cP�B}�E�t-���Q[JQc�JR�Є1匥�ǚ^Q�t-�:L{�k&&R�B�JR�C��R���	�CX�\\�y���B����ǔ,�b� ��xL>3�\Z�BjBC&x��NMRݏZ]/���1�(Y�D ��JBf�������Ԅ�<Ґ�\'&�v=h��}��mt,�6&&R��)u�?\nR�4�.iJR�)JR���.iJR�ZR�lo,�.��.�YllLO%.J]iJR�4�.iJ\\��)JR��e.iJR�ZR�lo,��y�.��\'�;CY�!Bx��� ��a�cce)B\r\r�BY���!3BjǺ�{�J_;�bB����\rf��<X�Ą�F1��B\r\r�BY�&��!	�BV=Є�JR���K��1���JR��c�.$/�ǻ-)J���_�1��!RL�攥)J\\�6R��)JR��bzK��,{�ꅖ10��F<X�I��0����YJR�LXll�)J\\��&\'���!K�=�\0O�P��!fc�h�|l��Q��,d&R� ��	�B��!	�M�L��DBBC	��yB����\\l��Q��,d!0��a��B$!M(�	�&��!B�BC	��yB��ɲGc���.�	��|��<c������cd��Qq�]fW���~xǵ叡����!f��)D2�(Z��R��/\n[�y��V,iB�금Y��(�R�Z]P�R���B�t/;\nŏ뼨XK�B�XL���^�_x�/��a.$!�a3BoK�^�_x�/�c�~���K���X�a<�|+�v<��r��X�a<�|+�}�?D��.�Z����K�2����������t;}��O��\r.��c��B)G�������t��Ӎ}�	�lo�4�Ҕ�l��b���Ƅ>�刋���\niu�)x��\0�h:��0�A�JR�ll�)sK������g�Lc)JR�LLa�\\��~��Z�.�}�A	�AK�R��B)J\\ҋ\r���射)GC)JR�LO�RxB�B���g�~E/\n�([�<��)K�)JB��!B$!$$Bf�!��c�c��~��R�k����!9�B0�!Bd�!��L�� ���z�jy����,{�oK�$&!n��isK�R�V2���4�B��c���;}g��.�Ǻ��hlBݡ���4�.�e)K�\\�p��1��z�����~q�f�q2���)JR�,z���JR����c�Ǭ���4����.iJR�4�c֗(^ZR���(���r��hh�!B�!L��B��!>\'���B+.Z\Z!B�!B+��&aO�	�A~L\'\Zΰ����!b���NXN6=жc�ﯕ��Y���\0xa!�B�5�	�8��Bُ[���kg�/ִ�p��)J\\�攥)~\r.�Z^7���������^|�)J\\�攥)~\r.���񾇭�f>V<e��u�HK4��ŘL�d\'!<���ҡ��1���������]y�.��f0�d\'\'������hk�c)~��\0(\0\0\0\0\0\0\0q0�\0 @P��1!`AQa�p���\0\0?K����s������^�c/*2\'�ݬ��;\'w���O�{�,�Z�Ũ|R*�7�Y��5��,��9bҜ?�h:��>p-\\ZQkM�;T�D��Qn\r����[�7�-UY��\0�ڻy�Z�-8�_29���\0�\0���C�t����K�_p4η�?��f�[]�K��f��kc�\0[���@�H��J-a������#�����Q�	g�k���[\'��r�@���/�_ť:1j>��t��-S��?���V4gG��v�Ps�������\0����\Z�3�ۈ3�Hƥ��\"���_?m�s�څ� ��c�;k��o��8���\0�8Y��R�j�\r�7���\0�E����k,Y/��\Z���;R����ܸ^���p���*��� �<4��\0�kn�I~���fî��_�*U�X��Q�R�-Ҝŧ9g��\0O�ũ�Z|�)??�������\0�7����y��g���\0ִ�U~�Ü���ũ���\"������\0���\ry|r?���\0�-7P�⟍����Q�شk!hW�\0�;u>}�r>~���A�YO���@���-G��<Z��7F����kw�M��>�J87\Z�<Gs�0�V}�=��\0�5��g��G�;�ȫ7��N���n�#��#y������;��_hg��_��g�O�\0�LJ�}ő�4���9n�(~N�v��`�O����Pʚ[���s�ɘ��g���֞���\0�����S\\W��Tl?�?������K���\n�͍�\0�QkW������C���\n���?������ҕ|��37�Ʈ9�\0���&�<l��I��t���S�<�;_�\0����@���Œ��yn�|~ސo��1}��E�	��~mî@�f�L�p�=n������Ex>~����L>�XyU��J0}�-rq^l�K9����*�Ȣ��s\rv�<R%<OJ�.�˵�L�<�Яxb����1�{��������@������R�U��Ry��-D������@����K�Z���4+�}>�G7����\0���G� �;�������\"�p�4e�e��W���%n��>�1�10Gx��.�r�M�1�\Z�v[�$x�M�/9�HZg<�s9N�y#�p_<K���qX��}hfyW�\0��úEM�:J�\0����󵿷~�1�4zq���\0�����x�1iY���\0J���W7�g�ԥ&�sM4������=�h�x����!����\0T� Kz/�E�\Zu���W�-h�Lg~\rd�ˣD8e��c�CA���\0u�t��xm�@`\0�bh�Lt~.i�2�QB���8rI�:����\05�-�-��t6ƾvA|[�N8�����Qa;!b�R������ߪ�cf���cN�xK�^���g$,B���\0\\�w����Ee&�p?*	��b�{.����\'51do��������4�ȵP�*Y�m<Hx���\\n�\r듯�I�cn<|����0-��`��[\0��n�?��\0�\0`f��\0�+�KOߝ���0�L?���w��ꯥo�vXD��u��|S��7y�m�º�-��5�7��`F��<��,�\n�\06�v����q������w�`�����e�%��_o r�ۿO�pݙBv�����z��ҘO��.t�㛯3�!�����aJ�Q�ta:���]�O���-O�8�Z�4��WE�T3ķ��\0{��������|e�x�����W8�c�	���x�u���X���\0�\0��oݴ�KyM~-�,��a����ŠZ�j��z��$S�����=Ƽa���R�@���lf|Oqn�6���\0������ncu������,������w~-�w��-�\r����c�\0���*����=��O�H����0��9�!���z���A�ɢ~��^��n�TM=\"M䧤�p�4����� ~��������ߖ���wÓԎ;�?7�o��>��ꣾ�/xDž��Qg�j��w�3��t��e�d��!�1|Q�{ϻ�߳\"��Z�����_�F��tشJ-#Wiuvc������;�h���?O���^Y.�&�׆���=\n!Wt���L���Ԑ�$E>Qr�J���d�\0:VMޱ���,������\0)枞G�o��|7Or@ݜ�m��l]�Y|�������uީ�c�t�-aߜ��u|��o�\r�m	��%]0f�7�5��k�i�&4�r;/z�,�]؈�7�)��\'���tB�r���?	����Z�}�����:�l�=[�}��G���2�[6���dn�\n�}���s��y!qc��K�\n?��k~F�\0�����ڠ�Y�֦1�u���iNY�w�I�8<\'���\0o��q�>�W���\0��oO��:w�����?��9MY\0�Tw�ӝk}��-�}^-g�z�p��o�H��p�Y��-յ����\r�uu�ZJ�������-�\Z�ʸ����{��5�\Zf��/����O,�P�槬����[{��Ќ�ߎ�= ��}D��[z�j���_\"�84<����\0���7Zf�\0�ɧ�W4�V�2���t�~����<���=]��l�r� Ԥ���m��4>��g$;�0����\0rj�Ӎ��p��z_]u����O��1�K�6��g������l%��b�|�p���Q�\0�/�@+�C{��#�\'K�G�8vqoӯI�\0kiM�8���bU�Ԣ�P�d�;]�Z�d^Q�koկ�����a�\0��O���L��������� (����G��	�Vs���L�\0;7^;�W��8v�6�Mm����~G���o�Whi���،���{�}0���Y\"�e`S~���\ryV>�H�<_��H���C]�yo�QG�����-<o��2�x����^�����_V\\����I�n�	��y�ذ�#ύ?�8:~��Xõ��~-W�_�����\0���;��:E���w���9�L&�\0\n��3ٺ����\0�\0{�\"ۧ�>�e��\Z���j�djE��#��|g-`Z˿�d;#y��l��GO�\"Wŭ�϶�{�\0���R��?��\0~�qV�\0�E��>�\Z�\'�\0ǆ��3�:����p�-���?<-e��a�S�,x����>v\'��<�<���P�m�%ݼG?�m�>7�>��½���Ŗ�\0�\rqk�����P7���٫љ�\0�\0|Z˨W��Z9�M��5������(�2���קe&\\�*yǶ\n��,?eC�o\"�}���C2D_ߣ��;�wk�ߏ����G��4r�h��-G��-��\0X��`�����z2-���ko�OI3���n����+�����4�,\0�>>����0�oK<\\w�� b�?�����g޷ѣ���\0�j��_ޞ�C2p-M��\0��p��ml�a4ϯ���\0֡q�nb�/�����U�\0��o/z�\0����\0�(�Lj<^�e���|/����s���v��)d�+�zL08�,�u��s�($-{oA��y��|ѳ���\Z�w{��/_]�Ð�k��;���b��;]�{\\�xWP{�զ�+�8�����t;�/�CO齇�j��N�kT��(��S����\0�%����~�e��i�\0�p�����0��\'R��U=���]��+�j��\0��4���p�H{�\0���n���Ƶ=F��K�?��\0d�b\Z�O�A�{>�:��5e9�o�}W%��\0:���y�������k��\Z�u�k��}u�|��3��`�kvۦV�#Z����R���GX���~4/�Y!�k�ӻk�K�z\n�|�o�o1�������l��b���\0$�~��_l�?N{���\01����&��s�gˉ��!��\njC��3�:����|�9�h6�hZ������fKze]q���%�#ݕ�w��ų�����y�o��������6�\n<@�s�W����j\r|�j���S��g�߇�j��~o��u���w��x�����A����z�\'����~�Yt���>��ɳ@y�ʹ�/z�i6s�\\����{�ƹ���Kw)�プ���\0�\0����G��\0�w�m洯�.57�1�\\C�A:O�\0,G����~��ɵ��Z�q��\n���%�@��lv�\Z��sva��\Zw�����&=t��Bp�.�q�v����»��㛵i���yϸ7�ϻ.�j_����^�-/[�:A�:v9���1�J�r�ȗ|&�댱���_v��)��m�u��W�ή�{����}�/�䥧֔�\0��S1R�r3���w����Q�����	b�-_�q��t/��:=��\Z�\0�\0��\0��\0��������Ц�~\n����N������7^nS��A�X�ϟ����b����D�O�����{�J��X_x�?�N��g�\0ߕ�fm��Ӿ�i���\\��$��\'h���v�ZX��O6�}��\07�}���\0\'�\0������N��-���K�P�c�����VX ���fI��.w��?I���-6��ν�\0wq��T;��	�����f�Ő���sY�y�v^3�f���i��p����D�v���s�;�|������\0����2#���v�&�r��C��z̞�lW�ر��^�\n��ئ��UJ����\0���B ��AwdD�ט�k�n��oC[*O���t1�\0?G�)d����^V�)εce�w��Tkn�{�OCh���u��v���Dn���B�3���9�y����Ts���\n�_\nÕ��q��ϫYz�����\0��I��7����x7�MDk�b7O�3u��V���q�\0|�-����h}�abv�\0O��r8\\�=>������F���	�o�*\n-��~i�UO+@�&~�*��Z*i���l�̱��#�ɚn��l�ۢ-�t=ւs�F�r���<��H����/Z����C�I�zǮ�Ʉ;߱5�������o�y�����	ϫ�Q�wx�+��-���f��Xmh���&ҷ����ڄ���s�����7��D�za[���ßö`��)�������[�o�]\r��.�\\��m��3���صjEF^s�BL�����a�̏����5�6��}35������3��f�߹��g�hޝ}�?�%�C[��wl|�W`v�����#2�V��n;�e�¿p�������-�$���?�Q�^�7�$[�e�O�;��|[s��5�����o��k��dǱ���v�W��._���}�C�\0�k�\0��W�������,^k��������ps�Ƣ��Q��������i��ϧ��s�������ߐ5���=�ic������U���u�\nu�;1�����������_>�\0���{���N��\0��74�;���E���ܮ4���~؇-�M�a�xbu��{;�\0HB�@��\"7I��|�+?SS���\r��ϻ�x.�?PG|��������\0@2��%��TfH����ך�\\�rS}� ɱ��T�٦�f�l�r\r���������GR�>�H8h%�}ƥ��܅�C[��XC���.�	�c=�܍\'g���[��#Kٯ�|� �:���77�v0��Ǡ�7��2�)\rW�<~����������f&��&�]z{��	�/T�|�0B\"m���Hw1��onb��c�n<^ �g���%��{�r�ȗn�J}y�����Y��Jk[xɉU-{��_o��0�b�Gl@ISI���r<|0߻8���m�\0%��X�?q��p�pP^t�>�}@wI��������`�|��]߇+�[C��L?�AU�:wq��o��,�]�M�WyKiTՊ긎瓚r&�?�\r�㘥%�a;�pI:�9�4S�Y}����;�QϥL�l\Zo��r<�\n���SǓ�+�m����f~������h�|]{�g��ྜྷ���/8��˭v�f���u�������U������^�����^-W�T�ſ��/����#[8��KEKg:{/Ƴ>=Ŧ-_����1�V���Z�Ư��Z��[���}��轟���87���k\Z���=��Iy�Mty��B����\\?�,����M���\']�/��|����^�8o�|���38������p�Z�������\0V{<!7��i��^�O��\0z?����ʡ[�7��ڂV�)+�{�����8xڔ�,Kr����L[*��M�s��T��\0t���+y��j�k{V�o�][Pϑ\Z��h����gmY�i��s��Of�Q������\0���H]-s\'�QF���\'��[��x���\r�l����r�@�@�~�\'W!�F ��U�x4�Chqޱ�bT��<J��D�������r�0,�$\0�5���MWnp���?���ԃ���ve��#\'��qEV;w�=\n&[��v����1��LF/#��K��xIc�e�\rNu��`�:R�\nh:5\07�P�|�^�Hqt�ǽi���;���Kv9��g?!�\\����I��7�=���2�aE�2Sj���\0h��?�_����{��v���T���\\\"\n���Ů\ra]/H���(֡\\o�\Z��K�=�!@\'�4��f�pv��t�\0�;���~��\\\\�N|��?j6����p��Bi�}&=֥���p�;�p����>j�+��`�����}�sc���~-y���v�~�m\rؿ۟cN�\0���Q|���\r�+�=�?�����k������c���}�jﺰ���/z��osޝ��\0�\0�����	�p�.�;��U�X��,\\iY�W�E���8�4}%:��?���=%�����Cͼ��x�\0\nh��G6?����ޱ�r��_����\0̓������1�GƵ���e�ů?�q�x������lB\"��SeaG٧w|?�e��]��{��>������c�׆��W����[q�5�G��\Z����{%1?5�OQ�7h���,T9_�-\'Q�Z��&����|bq��=�f�~�w������\'���kX.��V���C|Z��g{�u<�<.�o��3.��n�%?A����\r��}�{���x���IKm?Ň\\S85nx���l�6p�����>n��H���mCWռ/vz{�\0����Ey&y�\"ٙ4\Z�\r�����R��&a�\'��7q��m�/���\0��ϸ��|�\r�.R$p�0�I��0���)�p{�v��zQ�*���>����M��f����q���-�2~+>��5���L�����ڮ�p͇ï���5��k���#�Nr��߱�&?���Ō�їS����]�T��/���v�=��EL�?,2-�XO]�\r�ٔҍ�ܒ��.�Ɓ�A�t{_N�ͅ��̗�\Z��|bW��7q���s��mn9��3�Y�Ӫ_?�3�� U���\\��gp���8���G��N;�=���7ŵrb��Y�D|�/3�?�9OF#�E�=v�?����Hz���\0m\0��=gA��n�Js��~��h��E޽	�\0f��\0�V�r?�����>��o���u�����w�7F�|R:ps��`���5�\Z��SO{=�QӍ�!����u#�k�M�7��\0��q���Ŭ;��oW[t�Fi�M-\r�\0���\r�鬒����\0�v>M��^�����������}����4>��/�w��M�}y��P�//�8I�[��vV������?��¿��ܦ�O\"�\'��x��tܛ�x��@����b-�gO����2��<}��p�[�]�����O��]D���u��<��+O�<�8q8K O�:���[?u�0�B���O�ל���W�����E�᧸���_����&�\0�nX���wއ�LR��:\'���9�p	ix��������l���\\W�ĥC��Ճ@[��b��E-�.~_�ħgd�a��n�[��V[����>j��G��:���߮C������&��\0�\r��\'�y����j.K�z{E��a���|B������Џ$��W��\\�;�w�O��h�-^��`鱞���*l6�^m�\Z�h>Uy�c㝫3�C���d7e�^|��qh`t������f��\0�������\0��h�%�T�б��~���Sf|xSG�u�Z���\0��;?Z��\0�)�Dh��*����:��X��\0�z_�o^����\0~��n�}�xu��/���|��>��|j���?�bEm�>�0��a���&���k󙳩�����6�h��s��pإv;�[?Ny��s���7G���*�֨\\�����d/Hv����\0�w�QN�|�HV��4n\'[�A�ǯڷ�ϓ����W \Z;=����x7�+_�(I��tO9�[_���њm��|~?-�8n���\0����4��������H�Ωiϼ����\0���\0�\0�\0���/�oޓ��6AI�ys��\Z�{���V>�����o~����3yf��S{����\0ﻛ���\0g��f��#t�\0����l��)��_�?��H�ɏf���x0}��l�����>�t�E\Z�\0t��\0󇿰�������_����s����_�\0���cx7�Mj��~1Nq�r�^^��e��~xu�?�B����������_�;��>�&���\0�s����\0��ϵ���,N�f��n!���Gq��H�a�l����{U�7G�x7����\0��T�����c����?��|n7���]�gp���G��p�b���7�0.�%�^;m�\0�/�}�^7��pI��G݁h������X��{�k�@����a#L�?{��^�\0�?^�C�~���[ǆ��֯�O)���b�k���<]�I��� �P\r�\'������j�s~OGꂭ�󏴣�>9��]G�*�I�&�;OR�\n��?JG�X�я�M���L���\Z�]�o��\0�/nۜv�W�Vs��\r̃�\0|.��й۝0�Y�����wWnx��$o�=}�|�J���|E4!�˙�p���\'����D��YX�����Gy�[I�C$QCx��?�\\���X�J���~�	1�bϾB�Le����B���0���0�s8�S0Tf����Wyâ�C�dy��5���]�^ɉ<�@��u/�Tt�~�һ���}|��֋�s?\\���#�!���ï���c��\0���s�/�W�Q�,��\'�y��̽�!�Jw� ��u��}$����\"��yf��A01�x\"t�7FZf���GzF�P(���5��g�U�wS\'A�s@�W]����\n��o���Y�k�O+��������q�k�e*�R�1��%yt{⠚��Mo4��(潕��W�w�\Z9tz�Yw��n�����ݧ�Q/%��jj��\0�kofӻ`vQ������ݭ!/���_�������3 ��o�6(M���Jm\rgq��u4���\0���ݻF�8�� �| �n�m��?/�n�d�/�+�Ju�����M�)oo]��\n��[I<��Q�¿�uuc��5�|/��,��揾U��z��������\0�y��e\'��������\0����/O=�f�f��k��P��\0��b��؋�a��e��U��\\���o���\0��4�e|�B����a��V�����\0dQ�}��1�`h~ֻ�f��ÿu՟�����\0��v��f�mMm�y���u�����m�����#�ʿ���+3�܋ﻫ��x�Y��+и���\\}�3ϵ\0~��s����*Xa}�z�|N����h\"���BS�s�ض�����x�>>d���Wش8��\0����񺩒��.->cK���[7�?�l�\0�������B�>���=)�I���o�P��LV&;g��������>v(<�ֺ��l���\"���1O�$EUNg���ŭZ\0P���\0>p�\0h��\0o�����?�\0����yzS���j����fO\Z�;��^�?>|��h��̰��.8�syxR����\0���z��hJh��7�d�C�}7��q�ߤ~��?���ǅڲ�߆����Ӎ�\0?��xb\r�_��AC&�?�����m���3��7��������sY�`�=�7�4��\0Յ�g|`P����F�̜_z��~y�aK?Ĩ��G��>E,k�	c���oe�����{��o���o�����W(�����x��Zr��F�����6/6U��7���\0���^�7��������\0�����6[�\',��*�\0��y�����^e7�I�˰�f�d���\n���\0���߱_�)���O�\0����o��(��;���<�}�\0����pց}�Ǚ��~bB1����f�waϻ�o���[�����S������E��\0����\0����O���uA��\0��?�:��V�^���5�j}����\07W��Ṫ-0/��-(�\0���\0����t�\0�A��u����Wۨ:7��.ӿ���\0�l�����wI�Լ�P�7�����@��o8Ʒ}�ט�u�>?���l��_���}^����\0�����\0~d1��zQ1]_���?��<\'��+?��O���_��',1,0,NULL,NULL,NULL,NULL,'b7d2a5e4-5418-4562-8807-764d12ea4e23','jpeg'),(24,'',1,0,NULL,NULL,NULL,NULL,'',''),(25,'����\0JFIF\0,,\0\0���Exif\0\0II*\0\0\0\0\0\Z\0\0\0\0J\0\0\0\0\0\0\0R\0\0\0(\0\0\0\0\0\0\01\0\0\0\0Z\0\0\02\0\0\0\0f\0\0\0z\0\0\0,\0\0\0\0\0,\0\0\0\0\0GIMP 2.10.8\02019:10:28 11:04:27\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�\0\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���ѤC�&#���^+��y&�k��q���ݨ⡀ʹm�v�m��nZU�uxߍ���H���kּR߾�}�x�_:�z*��	���[�\'0zӒ)%$\"3c�2����Jޤ�ZR�%���ʏ���\0<��\r>��3$1^FGr;ΐ���0����s�^��S�\\�~�?��ʏ���\0<�򮡴�����5ӯ�6�8�9����\0<���,�\0���\0*鿳/�KgqM:}ؐ���`�{�X.se��_����i�\0��\0�&�s�^)��@y�o�Zb�\\3��x�YOS�\\捴�\0���\0�M�<����\0�]Ci�J�~�!+��s���>�wR��s���;�`�\'x������uS�WNl.���$��~��ɦ���d韺h�\\�pGcHtR+.U�:�\\�$Rj�6�\'(���t��\0�`��ֽ�R�w�%������e���ȹP}k9�͔�,Ҧ	N	R)vT�)vP\"��Hc�[(�@|�vʱ�҈�8φ9k����庽��.A��r��M��?ֽ	W�ьn(�I���|RپU�Z�ɻY�z? ?ƽ��͝M��x��)�Y��R�?�gO�eK�FA�m(�1�\0k�+&������Ԛ�·O�Ԛ�^�UT.p23�=ʒ\'�o����!NH?�J�4Z��0�Ku{�r#��+A<��7%�����g��2NW���\0y�F��8��9,�V�$\n�e�L�Ӟ\ru���i�.������\\ω�H��-.�YdR�̓�s���%��Z`YI�0��*9��f�K1V1���\'\'���n���\\����R�E00\r��=A#�P��G$��@R23����UiΡ\r�m3�\\|����=*��55�wM� �!�R�������y$ 0�\'�ߗZ\0�-�����ź�^�c����j��o��R\0����5$�j�h�s���[�,/��I<���8f��~�\r�I�W�o���9�j�7�f�K����Jxӵ#S/�W��0�\0^����`E&����(�)Ry�D��\n�&\\L���]m�2Gp�+~����\\�.�CcH�>����:[��K����~`W�\0`?�q_CxF_��SL�������O	OU����-��*m���6U���(��F�:U�.�����p_w�\rF\'\"d���W���a�OñxoE��_̕�����c�+��S���x0\0�|������}�����9�h�W2w&�F��?��*in˟B�n�.,��f��������[#6uV_m�O�\Z�[�G�(�͸��T��0�����L��bi��[��(b��@�zq���i�k���1Uf��8�Z\\��Ԯ,���cq��y�8�?<����j�$�Z�3�&|�)��[Y�Q��\0B�\0O=����M4�w�o%�l\n.��px�*�haU��m�\\������Y\n\0�m����zg��Cm�Ir�\"h�+	1���TՙA�`���}�w���M\0]���v�շ!m�8���-͋Z���$��29��T)E7L��?�N@�$g���U��*ΰ��Ǽa�:t��N��7v�o9��\\��Nk��L]=o(����\0Kj�h�J�0��$�`�\n~F�L&\0>�W�|(���G�+�O��b%��*ԁiʴ� 4-8%H�R�|�pNjq=b��\n�]8G�V�5 ���3�0ҤN�N�\00-6Q���\n���k!�\0f�<��2b���]����g9�+\Z��ɷM�oP�x���E�J�̹�Dk��b�������\r��b���\ZI�]��QK1�\0ɭ��Ĥ3XE#\0����N���[x,��#�b@l:�5B1�*p���E6��W��[��*	�����RŮ�qF�a�\0��� 2�8�����֠���+�D~R���G߭C�]�^]y���I�?A@�-� R�1J�\0(��M���AY�닿µsT5�ʟQQ\"�T�aoa��/�gO� �p��j�d�tdz��I��Z���b�����\n�*�\n�*�H�T�V<���J�P@�ga!$��8ȫ*�����Ԃ��Q�v����Q����R���>S��^��u�iSjOa���d�4;�MyT�G�\0b�/��lМy��\Z�I�\nE�|#��j2�=Mt�	rRq\\��w�p?Z�p��I<V��h�\n靖6����cu�ZQ����s�@ۻ�\'�\rY�ҵ��V�y3�G�{�?_Ҩݦ�kqS�K��Q)$���5B#�F��ݮ$U�\r�޽?��S�\0�=zc��.�\\�\'s���\0�L�N� 1�*��q������x��ڵ�1}�N�#��?�Z\0[���2�0\\��8���n�о�eP��8��\0\\~t�D�iDip�����3����t�\0�}I�82���&:�s�@	m��Ψ�E��%�����S?��QI.�)\'؎�R����e�%#��p��\0�R��3�)!I��x1=?�:@:=�ha�<2ȥ�����m�^��\n��,��#5\"跤nG^���##���M��\"�FĻI����\0X�F�]xV89�?Ɩ�G���cp��@�2H��UY,f��Y��H۰��]]�Hʜl,q�q���{	l\n��u ���m������$��@�L��6���K)\r��]w�y<�^E��Q�\Z�mہ]\'�y<���d/ך�#ݐT蹦 ��T��j�k��*(�XQL	TqRMQOHB�E����b�(J��3�ҟ޷+��k�N�Җ��<_�o�.4�rLZ�����\0~��x�ϗj���k��?�o��US�G=Ų���]%���1��\0���s�7��?ʺ[Q+]� ;f.q��+TC4��Ya��q$�����}}i��\Z��1y��|��02}�[Tע�@�~\0\0p9����Z=s���e +���?:b(�U7�>ss�\'�>��s���u?9d��R�S&v�����=����G�+��{w͎�ү5��%h��@�����c\'4^�J�٦�y<���e#���jH?�m�(��䤲���z�14�Z�ϔ�%d}���<�*9�T��eH��6��1@b�/S�l,���F�=��y�Q�Gקz�b������\"�%� \0*�Y�q��,���Nr?�8��i�6�<��B��[9\'�?�I�u,�#�%\\���\0Vt/5�E���5�H=�����帙ϓ.Ҙ�O\'��P3@iZ��g�xS�+r���j�6{)R9\n�rB����?�&�ab��_�����{2�s��9�c?ΐ�W\Z\\���$(@ #9�\0\n���!��6��#��K�!�O\'5���l�\ZBջ��|�ioٝ��\"����kxn\'źD����\"���\n�G�B�:����?z��]8���@N��y��Ӂ� 9��8�NȪ\Z3M���;5����l��]>k��1�L�w<_�Rf��?@?R¸�����F��8mj���k���5�>rΘ3�G�	�+���I�h��~��4���Ϣ�޷����UP̌2	�%��u�y�#2��YNq�bjt�\\B�cT}�08�8�&�y�ȱ�����<� ��B�u�ҡLI�]���a�f�����Rf�c�,��r1�u=E>I��m �)m�ɒ=�s�Oz�=N�,J�������G~��ꗒ��ylK��(##8�f�s�Z���t᳿�a��׏�S�Q�p��dm������M-���Je�n��#5Q���1@I�E`��a�=EL��܍�K�������z�M��~b��/�@#��0Ge0�d{԰]K&)	%N\rT����E�/�@>�pɱ���M��)�<�c̑�76qU\0�\0h~u*�G�?:\0�\'��Ƒ���A~shM8��ͣ�j@gD�+GN��5;Y�\0��M��X�75r7�n�FF����>������T�T��<�y?���]S��d�S)�@*@i�:�p54��w\\��\rN�LF8j]�j\\Ԁ���x��v��+��\\��v��AS=������x�s�G��]�w��[?t�W:Mk����+�>���[H��R��Ջ��ć�?�t\Z}���y̅�V\\;�w�lK!�if\0I<޺D׬�fY��<�6�cv?���ҫϬ�HC�b\"u��V�~�\0b�o4��#�g\n��Mtt�Y���*H��+z�^��p,��6� `���5ƻ��o`T��q�������5�Ѣ<�:��p���t��#Xݎ\r���=S[w% Qg�6�L� ��Ê���AF�������\0d5��t2\r�3eO\0�&��+�Φ�1�;����U(��l`�������C�K��*7`\0�ĒpN;�Ҹ͍�Hј[z��G\'��~4�,�fI8]�d��Z�� �f2,0�T.0zw�ҟ�n�ݶ8rX���8��8�.�?�<���G�M:�\n@�P���֤>$�d(V�s�דK�/T(Y+Е����?*w`2K;�#�4.��nXc��sͳ�*����͒[2���r�:b��9��h@b�sVՏ�/��O�+=O5v�d���3�I��{O[t�B������x3I~��k�Z�d�Ӂ���<Z`J\Z�<Ty��4��4n���S�\r.j���?5��#}ڛ�\n�Y�\ryֺ��f9�Q=�����y����\0������s/�5Ąr��uG5��\r+�d��Q[�]�6�L��^<���������+@\Z:i5\rF����0r	S���O��G}��Io�\0��^z�r3�9�o}&�\0zb�ԝOHêB�N6��1���<���D-�ۇe.~a�	�Nk��=�L��07e�t���C�HPa^I�_q�VN�{oy<f�#U +\01�<`��\'54�C����3I�~i��i������j�\Z�\ZXV�<����U��yo��)��N�CWl��6�����z�\0�\Z�`��Q�����Q���I��\0\0�m����+��|%|��3�-�����VOpC�8\Zh��c����4x�\n`4�Lg����\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0�\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0��7��^�2���Cɀ@\0�1�-<���S�y5>���3�f2@�4쒔Yd%-� ��Y`��\Z�y!�I[\"\r\n2SA:�I%,\r\0X:���@@���� (m��C��[\n��7�ϭ�5koBa���XK�=C\0V�R14��\0P\r�P��N�/�ɔ���\nɌ@���\05x�9Ǧ������g�^���g��RL�)�E*\Z\r�T��� \nWQ�@�bFЉ�[I�J�1Y ��B\0��3*� F$\Zt���\\�E�V����}t�ƭh�`0% \Z�DR��\0Z�4��f�2�Lزg��Sb�~��[V�fP��H�%j�E�|�.�	�\rN�y�y�ɍ��$��R��\r$,2m!�j	\0�bV �b�*�\0�II\"V%�\Z�b�Hr����A*f�Q��?Ay�o�-��(4XX\n(4\0d�!�$\nD!�\\���=S������djڬ���	X�Hbq��r�����F��?��|���h��\0�(\0� bH\rP\0�`�\0\0\0�\n�` ��5d�;P�	hP�TL�	+&��*d��ftG�8_�`��LI@Ph�X�@5\0($@��+�ϽƵ��v�[y��Y:�f��(`ι~=9>q&3����~�5��k�A���gmcH�Z�&�A@ؑ��H`�\"�P���#oG�5D\\\\aTD��;�N�RHD��&�5#�J�`J�@\n�%��I+�.w�܎�c����c$h�(*c�\0$�\0�\0������\rg���9en�ɖ�\Z�Y�$BZ ��%ǧ+ê1\')���o\ry��Ú	@���;mb�����Yd�4$�Pf2Fԣ\nY1P:B�2�T�m\"G��:��K�M+�Ye4Ĳ���旝�ʂ�G�c_T篷�d�(0�8L\0�a+#B\0�C\0���\r�ϣm��W[�F�e��\0\0\0IZ��Ƹ�=��=b1�<_��	��gח�\ZBF%5��kp���	��kG)�&PnH�0�H�	cY�@΁j5��Ĵ���Pj�4[:���I��t�H����=��\"���&蘿�yec\n`1��\0a\n`*���0Q�Ξ����7=�V�2<�` Qxq�7�nw�Y�z����z����e�Ɛ�IQ��ka��< z*$&�L��y�Bj�ir*�j�f�,�H�QZ�<�-�3\"�J0��	Ev�q$G9��\0�3Ɉ�I�d(��C�b0�\0!�L@)h�aL s@1+g�?�{ϧY���6�5�\0\0C\0�~u�p���*5��z��>�:�ϙ��@�����\\���7&�iG�,��>3�T@#\"����<\0�)Z<:\0�g�OF5�\'D�J���a(g����n�r��º�x�$\n����:�Լ��YCc�\01�#�Y�\0�\0C�J��0\n2�FP��Z�3>�g�2�YMXf� \0\01��\\7�~=1�k?1����8�љ����i�k>���>���L\ZjOTl4�Ƣ;Ӟ�	Mx��ϟ(�q��ԝ>g�����je3V�J��t�q)Gu.��#�gI��f5�D�����r\'�<Ƕ4��Z�f��f5�f���2��o�M�k(`��!�\0��JD�\0�\n�J�$�(3�w��@�����\0ы 5sh�S�p�n��{�Lz�ʽ�4���&^\\�,��g����J���c �f<DV��bOz��f����ƻV|������&3yu���3<����g�:���Pv����8����nf�������l�&��fi���s�*��e��`\"�;���k��\'C�P�e���\r���ɂ\01\0L�\041\0�b�?$w�������!M�C�dP�I�Ƹ_7}o=Ʀ-c�^�\Z���Pf��Be��g���eG�� 腕�d�c\'ZS.)X��^Z�J١��K65���D^��sci&R�z�(�^s(�V�F�GA��>^P\0\n=,��|��5C(���\0����5*\0$�,6���,V�S�\\�ާ�ά�ƶB0�$\0Z.=8_?���cL=1�o���>sndl�J��]�w!	b�I�	l��S�@QE�\"D*��@2��\n\ni���$c�jƌ	K,��1&�\Z�′	B�}���ܟG�lt�P\0��ZIbh\Z�d k@�b΁�P4,��Z�g<�~�Vue5�QU��0+��Ӆ��<��4���yq��#�\0�kz��ԍv�G��<����z���z��4e�4�i�� �LbOi�CZ��n̦�8��c=k�6��k���Y󞆱���\nk1)�ā�=ǉ|\nVR�0��\Z�cr&���Lr}��뼶�T0(c(R\0��5PA,�kHl�΀\0d�X!\"?��й>���D����c(\Z�)B@�1��.�/�\\�$����_�\\��\"h\rC.�W�n�yn����Ӂ4��\Z��\0ͣϩ̝TI�י���PǙ6�j鎻7�t�a7V��ӗ�&��.��z.|�A.�� �t�^[34I�]#�����;~iX�j9�c����<���/�r��\Z� =Z����,��9����c�\rFe��Ӯ��ws4[TX#\0Pb�1����p�:�Ƨ�?�����3A�ש�뛔�=�錚s�(�o��c3��S�g�Y����A*�4zGfsC���r0��dG�|��������s�6�<5��4�q������n�} ���o+Sl��5����=�Ǒ>����[��1���)j�Y\"�@�b@h�9�1�\0Š<����@�k�}W\'�N��[,��\0j\0�F�8���wÖ+�n_4����m/�Y�	@`l5��B��.Z��C�d�ɇ\0��J�Qش��sL�f�4&��SD1梩��5�0ZTP�2KB$�El�Ѭ�MΡVЯ?e��O��~��mk5��сC\0��y�\0�ic$d�0���q�oyt�\n�F�\\�B�\0\0@\0���w�2�s����_�Pm���3LH\0͞��Ҭaj:�^M�@�r��J�M-3&���%Ma\nV	�5�vd�h�m����3�yD�<�\n-��-H5&;\Zk���T�k&��Y���y�Xr��X�=\0c���#�@��d�\0\0�����~�}�Mg\"�P����\n\0��o��أ�����ga��W�\r���^A�ߧ��g�=�2\"O%z�Djy�g����i�}7�_:����^�f\rmL�Z�3�Y6|�J_R����W\ZF�;,���C1\"66�r�����,��$��h�C%�,�y�������\rYm0(c(C`\Z�\0\n�cE�?�ϑY�m\"��j�T�D%I������]p�y�=�8G��[\njKT7���Y�e��b��)����^�a\r��7��v��x�v����ʙ�z+rkdН5`kΙEg�4j�P�4��Y�}�}*!PRA��`:E�.6�<q�yNw6U4�vP�W�Ԭ�^p���L�0���P�0�@1\rt��]B~�睜Q���1H\0\0\Z�k��ۚ�F-g���?ߏ��~Z�T�b#��v:ʆd��<���&Af�lC$r�*|�Y�S%S*VP�hH\n��4١]cf�3gR�H�g��J:��D�eT^VZ�3�bKS�sذ���#�ZϣY�8:��Ռ\n�c*\0�\0�c\0ьQC\Z!�b(T~:�gO�_�yg~d,�4\0\0\0�H��\Z�xv���Z��=�~7�-{r��2�(:=�۬���͒0�\0�@�u�,��c���Y\nb�\Zat������p�\"�R�F�XR�\"IMI�9��ѐ=e#LzϷ�u��>�:�(m2�t�c���\n�0(HX4@1P�L�i�Ϗ7��\'s3e�R�@��(���Nt��A��>c�����,��4��j3���%Ud��#�8*�i}ǌ�k��o%՞*��ϓ((�ͧ����\r�k�\'�V!�:uY\0Q�\Z�<���\n���j\0�b�3M\rbP���9��<��iìlz����c��_=RPڠT�(\n��@j�� %��\Z�\0\rX�?\Zzq����\'�frӕ�\n��R� &���>��&\rϕ�\'�ܲf��5A�γS:d�>�\"UdK�<��Φ��%�\Z����^��&y�;^��;�C�8ׄ��ٟ2sǱ=����h��r���)2i�{2��u�8i��1�O�f�{G���ǩ�R�NUX7��ǌy�����y�?F�[�F6�U1��V$��2�H)A���2��%�P~S�oH��@���*h`�hy���Y�qs�y�\'�����&_.Ca(\rl��f�wM2f}L�(��D�Z��S�o��U���k�Ms�k듞��tXf\Z��f`x��th���{��3tqzY���5;Ê��v��	-$�x.�\'�3vz�R֎���Mx�:��p���ϟ�~��_o*MX�@P@d�	�\n��DP\0���$`U0@�7�<_�9��0i�rh\Z��sܷ�y��s�W8w���|ܯ\\mL���ο�S5l3Y�cUR\"�%5#Ab��2�\Zj�)�B�\n���I�æ�5f:C��	@J*��-4%CVR�S3Co	��œю��g>���:���k�\'5-�XڡS(`0�B�\n��\0����B@#?�}��X�.5`!�\0��˜�ׅ��ś��/�{���L�u�%\0oY�u�,��(\n�bC!P�:=t(�Jh1fQ:1h�4CȆ-�P�c�@1��y;�9�R�4�k��W��a��ƓY�n/�JZ(��e2t;X��m��ƁT��\rXS!#��\'�NoU͎(m\0��\0a˘�׈��˛��v��_o���w��= R�Mg��`{�Yj�Ub2@f�tص�\Zeˏ�B���:<� �\0fPi%hdC��@A�@4d�����6Z��aU��2��5\Z�k����\"��T�)�WTPT9hR���U��SX-\n�b2\"�J���-��(\0�.[�N\'�|X��{��o��=q�]\\�H�����`P�lwy�fD��	���d�u���^D\"�@)P�I@0�b*\Z�P\n$�ͱ�C��p�4k2��Z�+L����&����\0&Yl���4)��Xє�(e\0U\"���k�R1�R	9�3�(6�e\00� ͗\'˧þ)�w<�~?5���I�53R\n	l����!@z+e�jf�Zd<F�-=z��<�(�h�2 BV4XH$\Z�d��*��A�\0sl�hv�UjcS�ez�K+L�\'�||�ϫ؜�	h�)��S@����Se:2�(E[`PIEՁ\')q�*V9��\0����yZ�����&8���{��6��PM&�Y��SHd�\0\n��Dz�\"��S\"��2@\0P���1 z!\Z�,�mMPKm1���eQmU�M2Y)��5�jk��&����T�P�ATT�  P#�c*�d��\0e1��,G)q�!h&��t�(d\'��3�^[�\\rb��ގ\\/���-�:��S@�\rަ�Rբ&�b�42�֔��t�bdZΡ�\0BP��\0b+$=M!2�hP�mP�r�X\Z��eq��g.�w�g_���?��nN��e�T�C�PʫX�`�\n,t�2Y�C3YE霖s�\ZeC�\0P� Z������9�gͽ�8�G=}����CH{���b�@!���P��&USJe�\n���!�<�\Z�`0����\0�k �qSTӒ��f�-&Vdf]��?WNZE�]����[L`2�(-�������,���+Z���q������i�(`\00�P�S\\G��;ϴg8l��������\Z���P}��Ԡ�b((@-&��%H�[J���\08c����`\0P0(j\0�1�z�妪[V՞����YFm(�o���.uSr}3*�`P�d\0VRX:�#(mQt�3\0�K,5�C%\"�B���P�P`\0\nĀ2�yӇ��C�sX4�O������]4�P�GgEf�Q����\'UB�f��\Z���P�����g�3hV1\0K`�t�\0�hF�\ZgH5�Tވ�gU5mSL�a�3x�IrYzdԳ[��7Ǚ��\\�[Š����e8\0���QUE�S6zt�=F5ȐYt1C8�F6��`\0P���.�t�t����:|����{c�x&�PH�gMg�S!#�\\��<��>t$v��<f���t��F��.��\'��˲<���b\rA%\n�hF����6CR�&�)X�j*)�h<��6�Lk$�,�2�G�yɾ<�~���f-4��:���P��2�\0�%Q��6�� (z1C\n�yh�\0�V\0dI��Ӆ��W���Ϭ|�ǌ��e!��\n���Y�#&����bj�a�6�/>�8қ��\ZC�:	���ΐӳʝe�8��W�g��Ѝ�e� \Z�%�Γ5�B,m������pg\\�K�oY�%�׊�zr���~�lm�2�,t�,���!C��QE����2��D!�@r|t�\"�,@@\0\0\0���Ӄ��[Ϭ�yu��{��]y�d�6�22la]n��YF���\"�$��^���fk̵��x\r���I�<G�@{r�Mr��ޖC4jR��Ѭ�CP�\n�(eka(\\��o7͝s�,�FK���y���`�˝��~��r��\02��TYb,�# T2����c*����J�KϦ-�\0 �\0k�s��y�x3�z��r�����6ns|��X�C�뷜��d%AjȬ��A�:z,��b�d#��d̑B��#0���6h\0` \"�@�iH�\0@��U��R����fa\\�Y�ϦM0��:r�C��U�YU�2�QEUP��d2\\���)��\0�d�EQ%	Z\0\"N[Ϧ=�`!���@HW��ӈ��Ǜ�t�x�����,�ư�4�\0�{=�\0�Z���\"P	\Z1Ι�4���c����S��C�d\ZФaABi�ǥ1���e����<h�|��\\�i��d�\\��r��Y����BԠ\0eP��`YEs&f�;(˥��\nQ\0\0\0\0)��V�	( D1%�9t�yu���w�/��xsɾM;Q��rAZ���(D\0�AR �@Q\Z0ΐ��y�f�1�B\"�qd�1�\0\Z`�!�\"���qC(x�F�����gYL�C=�rj���[��p����β(PPU�,�Y,�c3L�6r�t� PƮ�V4\0\0\0�<��i@\0�0\0�^K�N/�_>n=�.��i��M�iZX�;�KTd��5�BJ$�\0�)$y���y!��:X��JE��\0\00�\00��]��jڨ����gYL�c5;/SM�~k���>-�t-�1�Aqb��B�fB��de��(����I@\0\0\0r�t$\ZP�\0\0\0C\'�7��ۍ��c��;��Ƿ˧7��d@$�j�z�!IU\0���biH��[^���(4��r���ƴ,�79��qZ�ޚ���M�ٖ�P�6��ݚMd6��=z���g(��j��K�xr�e�)�rYZƗ\\�na?^qu��-�(��(e�Xd�T3.�CT�T\0\0\0\0\0r�t�&\Z\0� \0\Z��7�nG�\\�������.����\"#��최MH�w���++>�p��*\Z�$��nrq�k��³��D���hO5wyZ��;0U��2z��/<uzs&d��E}-f0[��58������C���q����e&g�a]W-�\\������e3\\޳��+sN~������)�E�c(����P���r�AV\0U2@�J\0\0����h��\0\0�\rl�Gܷ.��������Ojm���NTr�:�g\n��ˍ;��z���b�g��ܕZ3���9{��(��9��r\Zx����oO��R�!��\n0�OxNR�̳��O�	�]��eϞ�%b2�\nw�#Y^��\Z������֟:�Ig�7�d�#7��\\�S@~��>��@�j�2�]f$�!@J�C93&��ePI@\0\0\03��= \n\02(1\0F�^#�nk�\\f+��{9q^�>D�Y�ΉPB&ěM:]g\Z�ghjM�j	�ݦs�xm͔���X�~�L���$����V�/=f=Yi��Fb=�����yyv͕L9��g�KS\'zH� �͗I/6܍2Z��U��̾�5dK�S�f�˟�9O���,��Qc�e(��YD�B�ɣ\nc�$�\0\0\0���\r�����B�\0�4��˯=Ǯ#�.�y���q�t�`�\0��sy��ZL��	�#�F�vIR�@�A�\rJ���-�����D�0���SH`a2¬i`���d֯7O�d�9��fZ˩�e�\Z~��>��U5Eh�(�Yt��U3(Y�@)�Y%\0	Z\0\0\0s>}�h\0�\0\0�:@h���].��?\'�y�����]\\�T4�g}���T-&F�CZ��\Z �\\��Ph	,�e�)hVd	}�\n=D@Y��i2M��ZVz�}F�,��3KYEַ7I�^^�r��n�X�3�\"~��>�eƙZQ�E\0�d�(�d�(E[(�(t0(\0\0\0\0\0�x� \0\0l\0 �c\\\'�l�8k�^�\07�>�<��B%�@t���������s�xe؛����y\r6��셩��O3���.L\'��\Z�ЙM:�e<F�7k�3�;�y#M[l�ŝhO4�]d_�e��s;b6�o�d�mn3E#קKL�u�Z̆l������S;|�?p�H��f��+@��J�I��#51����P0\0\0\0\0��\0\0 \0��\0Q��1��}NzbL?�nCyٕ&�	�&�����F���\Z�V�Ot�aWʹ�o����Ʊd�Mn�y�$b:����D�s��\Z�����ѧ	�v��rh+s��=�>e.�Y�/s�5۟/�gS���ٯ1.s�\Z����DՄ�9�e�r��s��<{��3�nw�\'-d͢�+K�X��e(��e����\0u@\0\0\0\09�`\0\0\0PP@I�����[5�<���>����v�_tfI4�h:=ccK@yu�=E��Mta6�����;ns�k5׽���������Xc�b�:�w�{�����x*�r�I���X̢<�2�f��q���Y3�u X�z�&�q�9�Z�5e2��&u{�;�?]p�X��Eh�ɗ��1ՕY�X���t\0L\0\0\0\0\0�8�B\0\0�H�A\0s���}t�$�o?�ngSn`_&t�$*iPt�Ƕ��b+&!T��$@�NjYi [J�EP<��B������2�B�\neA-LU�.B���]�����y�*�-e2�)�O\\뎇���^����4���,\n��VB��\n�eP\0:��\0\0\0�x�\0�\0\0@ ���-�:��1\Zn��M��sZ��_5��@2�����50R��� �PQ�Hœ(�j��^j��=G�5b2�CМ��юPp\r����f��cZ󧗔��c�5d-��Q��c�l���ɷŢ�E�J�(�� ���I�4��.��`U!�\0\0����$\0`*\0���o�����#�����7?��5��&�\0*��3T�_N]��ӗ��tmr�\Z\r,���:�=�!���>i��y(r����ߡ�㍱��ɢ=���F��9�hB�Nlm�|����pj5|Mi\\򝄐l,��gN��7Y,�e,�h�jc	?crtX�����@�2V@,.r��ҀaT\0\n`0�\0�x�\n\0\0#A`#ŝq��q|:����n?8�p��\Zv�DB�;c j!��.���cYOf�����禾?X�����:#BY�Ӊҏ��d4�6�P���1��\\DY�7�oS>u��9������5��Am{��1����\Z띹�b�<�<������l_6Y,�e[F��-�)?_�v�1�QCљI.��EM�q\Z1�\0�)cP@\0\0s�v�D1�H�AX�x3�\'�N?�\\�N+��{|�\\]�h$	tgc�YZ���,��Q�Ւ�g�������]Tk\rq�=ƇNh�w�n��|�\0lEMu���f#S�h���q�kk�vQ��Tz�t$�ef�1�Z޼��fb2k(StU�M>/�+�!�2I���٤O�\\��=�c`2����Y\0,W,��ACF5�fBh(C$��\0D�\0�J�`%�e�r��q퉬G��p��\Ze�.�5	���]�\0��]��h�� �1�� �I�	S>����Մ��d�\0�YE]��)(��i���@-IsU�Jyrɛ�̔U#Zl�Z����jʶ�L���2�0X�2ܲZ����(aL@c,�0��:\n\0��\0���S�˧+Ƕ����?������sP��4����c\0�&-�M\"Y�CЩ��F���PL�J��A��CTT��.4��^@�U�0�X�\Zc_�L܆D�]��s<�~�寫��܃J��2�1%)r�h)�d�J�\0���\n9�;\n$\nGL$��@#M�p�zs\\z�����ǐ�s����ʄ�\r�b���5mK;fKq5����y������!D):���\'x֍4�U!�2*a�;�zɩ�d��\r<G<P5�yr�՝��6i�=1�6X{�wW���d���8����W3�(�ճ{�/�7��#g��O��݁�eeh�1�AE��l�j��C�\0\0cM-�\0C\"�$��@I�θ^=9�=qۇ\\�Y���w�-��$J��&�Ʀ��G|��KkW[Sɖ#�Tn�A&S�Vg�r�n�3���3�25�2�4n2�\Z��4ь��/=h�l4��\Z��ZX�\\-6�z�՛��p�O6���:9��/9�Ӟi��+���9�H�#T�M�\"��}��~����=��`Qz# � �!BdlB+@:\0��f���\0\0��%�q���\\7.�zİ�(�y����ٚL�\rPY �ӹ����-�[�庻㠬1���Q�7G����C�P���r\'У�:X厧MI���i�Q��e����w��3]����jj��VrH�,�MY��e�5U� ��^V^Y�hb�+,d��oQ��dj���>^ӕ>�\0��>;�QaV=Ֆ�̂(ë1\n�\n ��J%S�J#4�C�0\0��1�s��˶���q�Ƚ�~?�sW��f��\0�Y��<��z�2��� �r�\r��f����\n�\\u��\n���ԑd��G%4�\nPb2��AK@2����TɕS.Z��Mn7�ʋ25z�k�1��9���~�㼃t�L�VR2� ���\\�eh������݀\0I@M\0d17��\\/��{�a�~A���o;=�A�N�&}s��tY8J�Q*��Ȅ-\0\0���J�$�D\0H�l��r �)X�e�%2���&\Z�y[BP�dM6X\Z�kE4�%4ϦMg7����r�c�y!��RP�2h�e�@XUd�L�R@Eh�P�f���\0J\0� C�-�\\7>��{�ϛY�׿�-��!�Ơ\0Z������G��e\n�!lep��z��cD01�n2ӑ� b�\r�@t��@�2��YB�^Hz�ySM,\n(��\Z��A�92e��Zͬ���WQ��;�;YH�%�EYS%\"�(��\0+@�if���J$`!�\0\0T�4��=p�z���σx����su��Τ\r\0��i�م�r�o\r��׳�\Z���9oO��C���4f#j�Ó<�i\'\r��II&��d�1�:<�)�J(�\0(YCZ\Z0,���ƃ=r�%�d��928���;��Ce^�<�\0ǣ(P�M1aLc�\02@�s�\Z�\0\0C\n��=q{���&��?���n�9�ΐZ ��i��Je�t�I�7zs�{���+���_f�B3�k���g�RN(ۛ�x�5���d�%A�2J��ƙ@	c\npơb(\n �KeeQ��򜄫3wr�#\"=����Yd`2��H�2����4�@] f��(	��s�0\n\0\0\02�?�N+�O&w��~,����[�<�P,����g{�:<�2\'ls��<5��L�15�<t�]�5�G��ӛSNl�f�M~i�� 2�-�\"�Ci�͌`QV���F5fE�h�ՁER3�.�\Z�	z�z��=�/�>7���CVA�B(�(E�02SD�SCe��ړI�\0�LP\0\0�H2	�7�N/�O>w��[�?��ys���Y�9ZA.�Ss�-J��QW 5h�N�\0�g[\Z,I%$�r��1���\"�c��0F5e(�R��P�J<R�q�)iz�e2�X\r�n�_��om���PZ# �:d̦!#t��*�F�����I�\0d�H2\0�no���|�Y�z9����L��)��&�����Y��@����h��e^t�2�e�+1� CS����Y	j�E��(��AT\"�\n�ȹ\0����\"�u׋7!z�l�\"��Լ�~�����1���Y�Ĕ\n� P�@��@hy�\0\0\0T�\Z��3y=qe�8?g��No������t:��Ⴒ�K,m$\n�$�-gL�&u@�2�,�c�e\0TC2K@�H�i	\0�P�T8�@1�P��QC�I<˨μY�z�C%�F�\r��~�㯦sՌc(�YE臕�V��\02�(��:`P\0h���@i�` \\�B5�ǧ+�����ν���O-a�4M,Vc�@Y��l,bF+\rP�(MH�[6��L \n����Yg%$�B�C�ڙ\0FU\"�`QTZ� Q`�RX�CD`�M�x1FC&�b�A����W�Xӊ@�E�-�h�P�A�$EH���!\Z<��\0\0 �\04��ǧ5���,����ߖ���jeD�Hvtz�����\0�ԃ1M�\"\0(C�r�I�YB$\0��*�SJF$���# �E-P#,cVRQJ\0�J<��s�%�-�CLGE��G�W��H\0��,� �Y+@ĥ�T$����2�*`�e\nD�Q% \0I���~=��[��ʽܹ^ܼf�D�\"5F@Y��z���AV$�JSR�JĈ���jU3$��$�z�\"\0 U������c�2���1�c1[���b�Im[6����y�w7�y\\��Z*�h��@\n��UCTR V���̃�:@�D\Z���E�pb��/��-�M�&���6��\\��ϫQ5eԌ`@�!�!#\Z�R	p��1�H\"1��5y��dLA^��B3	5�,�w&�niT1�PP�6�u���+Us�2Y���y#�ߢ�ZVP�P�RZP�V�e����)��̈�VH�!YF�d\0�\0\0��q�=�|7�|n7 �r�:�`�ag@�4���F�ꠙh���5z�+��:-On^}ǒN���V�k9��du�^GJ�ɼ9c��Q��)�^�.4�#������S�<Zk$���Ӯ��W>y\r��@8�t�~k¶��o�i5E+0٨ε8�ȖV�e�1e�fr�ڹ��\\��)B��@0+S!��L��k%%��B�D���\0IƼ�-����q�f-��Ƿ�5��ٛ�S4%IY��>��mf�9�fn�^y�Nzt���������J�x���C����^�K�i5�7yzL&���o�ӗ!��;L�\Zz��b<&*ޞ��6�Y��ۚ:�rG��!�3(ᦓMx�Z#SM5��A�FM�.K0��fs��9�ռ��ePX�\"��F \"�b��,�\0\n$�9���`P�D���9o���[������^�\0>�o{Y�ԴfH\0w=V���\"��u�Y�8㰳٦���=�<u�z��f����#��Q���6ܡ�i8C�]a�LKҚ�>�5�Orx�D��Ӵ1��%wd�x,�i�a��Ht�y�v�guכ->]��,�SL�5Y֓Rђ�R�Y��3Dw�~���5C�4����ZX �H%��\Z��\0A���+`\0\n\0�-�\\�k�`�t�ƽ����4� \0;��Y�X�I����O.Yα87�G<m�A��<����O��^4G��gO1K�\"Lf%�&�D�R1S�����&�T��/Te�YK��r�(,��Z,ۣ%���bηyjN��O\'�i�E(	ak�\"�\0\0��P�id�1�H:F�sE�\0� \0@ȼ�-q|{x3\'M/Y�_.�qֿ%6	�m N�\\ޫcQ�[2�Ֆ�@)H��Z�ɨ& ��H��,��ȚC�*�!�\0�[O\"�B�1�\0S2�������4ֵ���,��sZmq|&�?gy��V��JlCa�\r�P�$�P�\n�c�4\"�$��1/�y.Z�x��fN��i�W.�&|���M�@�/9�`���܁���*d����yJ�& �DM\"n<yD�@�Q��$aH2c�m<��j�(E�U\0QVXU�����E�e�l�6X�ܿ�<�u+�TR0��ƌ5hH�0Z$�@�ALc>�\n�\"�	\nC�xr���������9����Qnџo�b@�ױ�Ǽ�S:�d�4#ޙQ&�Յ̕[Sۛ�&��a4���~|o�^��#���cju��Eq0�J�H#�ʋ\0��1�X�56]�KC�6m�|K�s���2�=�̙c�G+�b��5`PP/@H� z�$��L�(��\0�\n��,���������8_O>��S.͝vo�C@�׵��� �:�g��L��45�H˞:j��U�5k�6��7u�k���L�Z{�<���`��Cik3(L�r�\"�2#jP�1��,`1̅4�hk4�U13��_\Z�����2�O^^�?,��W��\n�Z�e\n�B/D4bɕ�	l���F2�naAR�\0��R�W��Ӕ��cO����z1�]�:����*!�i��Va�B�;y=�f���Wxp��;I$�[���ʸO%m��\\&����<檨͖a�+\"\n�B�J�*6��!�;����Y���QY�-�rSL�<o�]�E3�W*�dΫ/�<oб�4cTX�0�`P\0єIK#FAcV1�E؎i�:EJ1S���/˧-ϤF$�������ojΛ:�@R�3m;���2H�&x=,�Pe���%@�y�e���i���c@�\0Z\"2\0P)��(6P�PC(FP�1�J*Ji�3K���r�[j����]�<�~����-�Ke:P\0#\0�BD \Z����s7�A@\n� ���9t��r�|��ǖ�m��*\'1�T1綹�h�Ѩdi�U�2!P�P�e@a�rƒ�9�M!Q4(	E,�Z\01�3E\0��.V*��t�iC��z�z:���gg���4�U�__�C�@�+\Z0��\r-\0EcX��\0�2Q��\\�+�Mw�O����}3��3�T��A苙�|�<�^��uMD�R)@D�$�Lq��s!��\0�����Jd\",��<��42�\0*�\nVU13F[��K�yM_>�1���2E�S�g����_o�e(P�P1�\0�H�0\0��P�1��9}b�L�+\0\0�+���y��������g=���i��3@Vz�:vpJ��Y#���$C�-@�C�((	Dc�DD\n�C�B��A\0�C�b�\01�H�*��(E�QV�Kc��js�#B������ꓐ?E����-2�\"�J� 4b(K@4SX���5\n�`	��7���OϤ�&>!��ڣ�j�@CP67;��6eB�j�@ \rFBP]K.�M�RI� WI�\0�A�J�\04����)�������R0҇kLz�R�5y��T�\r�/zɑ\'^���<?Gq�R�(@P�����@2@\n\0��Cg\'�8\n\0)P\0�^:�yt���n���o�ϫ��ש�Z!�\0f6�����f�a�+�\n��b�4Tǐ�+jl��,؉� 	a)Q���\0�ꈙ��X�mP3m\Zɑ�L��V<�OA�X�^w�ȦP̆A/ZΚϫs~�㧕h\rh@P1�\0э@@\Z�u�h4e`r;��!�P�$#�ټ_.��z�g�y������z]u���\0�n��;M!�)c�d�I�t�1h�2�`v��s:���*�Ȩ��	IhL�]1LЋQi4&m�VOTe�Ĭ���A��e߂P�Y�KԳ���<߫���@V��AA@1�4\0C�\rJ�\r�(���\05\0\0\0\0\01! 02@\"3A#$4P%5BD6&C��\0\0�p��!A��kR�Ҫގ���zrng+�T����Y��f*�zǥ�?6����Rnc�b�i�F>������z8��A�C��\0�\ZX������(`^����\0�ϩ�K?2�����\"?͵3?\"��c�#��ކ���:���Z�з�G�3�PR�b�j�#����Vަ~i��n��>��iMͤ���u���(5ϩ��U�=\\w�\\o�韓����ޡ��f0��>�x;A��Z4��w!���%⟣k]Z蚅tM+�m@Ͱвm]j��WF�k�m]#j��F޺6��7���t���B�f�Ҷ���t�WF޺F�]#z�WH޺6��7��\n�Ю�\Z葡b�t	WBA���Ж�WAz�+��^]]\0ח�k�ԯ/R�/��W@�tW@�tkWF�tkWH�t��N�x\nxG���+�5r\Z�F���hW��|��j�74eg૰?F���`��>�٬�����3[[LVj�j��j�}��~}U���kU��V�Z�k�U\\B��s�s��\\�s׈p���z�5s��4�)��.页pI�_���\\I\\67��Ka���q �\0���?g�;n�V���\ro�k��\\z��6��OpO���\0&ڍ3v�¦�?��Hj5�Ƥh�Wd��잶�G�{1��X���\0�΁؎p��9R�\0�\Z{��7��\'�\0:� ��=��������u�)��6�aם�c�_\ZڭV�ڶG�U�%�9�kk�-��&l�idTnf�VsF/)��\"�U�������j�c\\w���ڏ��*����/�6�\'t�m\\\'��S������0�$ڜ��V��J�#��=$jQ��	Q�#d\Zƶl�rq�QEfqh6�`Ӥ�g�,��J�T�^aH�nY1f��I ų6���1���Y��t�:Vl\Z�d�F.\Z�7k,ɟGTL��l����<��tܐ�pF-2~�5�\\��5���rL54�{V��%�ΪɊ* ��V}A��\0���A�l�08k�D3����E�<T��a|Zg��W�9R/� �!h��c�2{\Z�*Fu<Zැ���*�_$yȜ{���j�%�GaX,�r[m�J��������0����o������s6O.}���m�(����J5�J��[$݂�J���1�U���Uh�4#�0x�#\Z=E�zR�����f)0�r�&��1p���n\\��ɖ=�3�2��j�>Ef��.v������̺-�Y��n/��R�>I��\r6�o��lȦ�[�3o&Q�q��\"���U8�2|<�h=��U��4N����!�F|��ڠua��,��!��o�����09�0¹ �m<��ϙB�rRy��aey����8:�����{���rA�Č������\n�]��N)���v�3sH-��F�n�hRg�ǩ����a�{$.Q�&�D��z��0���p7P��Y\Z�W+��|e��v�u�+wn�N�ؑ� �\\ʪ�ⴳ���߁x��x���ӽ��\r�����ªs��\0�k�n�g�eƸWu�ǯ�r4��P���{�u�tr���\n�t޹F�+>�5��s�I��b�~t�>���r�u�c[i�>�y��_t[c��x��c�g[z <��/}�\0�8uN>����Q����=���c��*����x�Bf��#��tUl� ��p��E�R��;��D¹c_�����<^���IGH9��Y�������% Tjg�p�;h�N��1�C�#˼`刡�r�����c��u��j8ˬ�\n�9#]�I�Ysk�\0����X��H̿\"gt\r\rr\ng��L����BCK^�#�1��8i�A���s4W]�	�-	���/�)�-w�S��\01na;Sݷ��M�x[s��ܨS�������h�\\��u��Oo���r$�\'.����\"J88�4w\"E��:���_���P�9�89Yg*������IO�q%\r51p��o���73�=S	�zIe���W��2.�Md��\r(p��Y��λr�Oʦ�.W�̣~$3��=4@$�0�Y$��OL���d�2,�>q���NG��]j��B<v��j\r\Z�^\ZA�_��Ϙ\0������r+ʝ�M8�O,v�1\rnm\rNw\'~Qm�	=����Q&��}?L<�$~�D/1��r�num�����ڭ�U۳8�z�?>~)���=\"��(��ɴ�|Ȯ�]��K�QK�M�ϙ&I�$Ϋ�J�s,��?PIr��g\n~����K<vEg������[L<j��\'.�y�n�ˑlI�<�U´�ʬ�s0w�YW�s2�����5��ɥ���V�8+eח#�.�v��B>Y)J?]R��˔�$�HG�4eZ&���5\Z�X*�[�t�\rA��̔X�2��6J��ܪ��ߞY�Yh��{�\Z/�{��$6W���-�.;׸�ԏ������}Ɔ�\rh��72^���2�vu��U�s]���tnk�s]���D�7�.ѹ����F�+�^�-釫�0>d�C�>��g����kpҶ�.>~t����᳈-[6��[��mg�fG���#���Հk:p�	�xI׆@�BW!k���Z�\n��MnE��W)jgiK_O\"~)x*r�{s��_��\n*hBx�y�}�\\[���-Y�R�o�4ڜ��O������\\�nY�٧�_��\0`x����_���R�\\�;*-�|�~f�.���dt�h����	S��Dr4uܧ ���Z:T�\"�gu�,��OD�o�� �������4c\r#MXB��歔U�s5c[�F��bV0h��U�kg���VD�b�	�\0�4l�P�aY,h����(fn*�6��O$o\nG\r|�^%j��l�A�E�\\�\Z� -5�j-��9Z(�Ac.�� F�Ģh�	�%uSۮ;��Ta���K�zKr�O�?�/+?�⟎�\rq�!����\0_�7[�=�\"�F��:1�)�W�cQY\nY��x��\\���`ϧ;�lu��dn���1Vl��U;��S�ƶ�t�	�e�7+U��I2p�Rl��o%ݱ���kV�ph����bnƟ��M_��Ҭ�0�F&�Ϛ$dó]��\n*�.������\Z5��O����\Z��E3H�$P;�����J�X����0a\Zn�$�Œ����HebAV���=��;*�)��(��?��Z��,\Z�^;v?�?�hk��ZDy-�m��Ό�aX�Qv�<Pɻ_������W�#_�W�5���~�g_�W��u���~�g_��W��U���W���n�ι�:�\\կ�hoE1�_�EUM^\"�8U�u*ʔ<u�\n��DYbk�Mٮ��:nF���?T�A%�Dz����Bn���N�r�!P�T��s{mD�G���Ç��֬v[Lw@[�����Ƴۿ��:F�{;�[վ�����\0>�զ{0w[�A�� �<GƵc[v��\n�r�g�v��\r��x����~��MyW��H6u���ٶ����t��\\�3�i:�p��S\"�ۊ;e�P\"����YS9`�s�,],z&][���-z$#u�Ac�Z�3�SS$U�7&!�w�NTU00`���A(�g�W ДB�M�-��5a�-.�v�V�Y#K�]�+�#u;E�E�fj5���\Z\"��������mM�X���zWt��n	?�>M��{�\0\Z[�)����v/\0�ວ��:\r9����D�������\Z��?r��#�K1�z���[&���~~����2r���S��!YD��߻o\\D>+\n���]�f$BW��H��\'Ċ��<O7.��\'�nQ���oS�2Ѩx��r��J�Yw���f��Se11$1�z�?�x�K\r�9K�at�n\n���#)�\ZIO\rI���M��\n��WLQ�_�A�;�dP��!���-�J�t$�Ȣ��\01������۷(ƭ2���9���U(w@�+���>F{�~�V;!��S�\n�4�!>\0��{�=w���������>Ʃ0�B5�s5���N����x��l�z�?!��y�A}\"��t��7Y��oT0Y\n}4G��Ř�<�P��z�N��ՙbw��M�OH��VNQ���K0x��f���H��oÖ]��^B�ǕIԌ��*p�2��ג�\Z�aM��r�>E�4y�@E��=f}Ĝ�y7�����!�p��NB%����?�q�5�F��dh����\'\rd�N��������#<Gb_ԓ�;6��!eu�f�zS`&���)�\0�ߟW\Z۳��z�Z�7�L�YHv^_�\r�T�ߡ��޲tv3���ؠ��\"QI.���MȸB�UU͊e,�QE��s��-�L:���Ɗ���S������\r1�j�Z�\\��Ki�z�oV�Ɗk�@���\0�wN=�V�G�D��r�7>�Ԟ�P���[L�_ѿ��y��M������z��!�g�ՏCj���~�n]3[^�g�V�U�t�#�=sӱ����Ll���=��(ٯ�bA���kjٿP��%1�a���qM�βN�dw�\'d��J�|>a+�k1p�!g��d�6���+�k�;zv���8��u�m\rM�����r�.=l���d{-�j�\Z���X�V-rڇ���\"\"���������56nX��b���=�n��晦�\"��\rN�to���&������/$2Sxe�*�ѓ:�7�ݬM��0FnUOLi����ƙ��s����4��\n�?*��^�� �k�?���B���%����{R>τ�Q�C\\Bk0w�\rS�l�{0����Au[*�ċ�ZbE���Y�rMSr��öz��#?*�r��Y�<cN�_�fe��U�P,��;�X�?�\r�~�m�G�/�$�vG�i���m�\Z�5Z�j�k4^j�nr������|%��h��/�ߛ�Rް۽��r?>�|z��~�g��9~D\r��?<o�(_[im>�ɾ�m�%�!m9h	˧/ {���)=�	|=�\r\rq1�O`G`Sf��\\�in�jޖ~F{�ێ�z��}�ѣ���~����?4O��m�����\n�Z�)�Q,�1k4p�Z�X���>�}CCC\\I��?���=�w���O���|�U���cP�5�_�:��g\\\"~x�Z�ߊ��\n�*��}@)��@\n��B��\\�\n�xtZ/�sO�\'��)1��iϲ��\Z�-�4@F��{s�U�`Ph�a[��<{�ϥ��e�Պ����k�&־��h��_�m�~8Ӛ}���R���ҧ{z�k�sV45f��<;��#\Z��=��L�X�Z�f�n{3ٟ�������к;��v�����z�Pw_Kij�b����X���^`�����\0�|��T�}MN~�g#u��{��?�k��e��&\\*�A�:�h�:��G@y�I��e�B��#Ñ�N��\r�m�\0�ذXcX����t:24��)�*i��h�Ǔь��0�g��5X�>�W��f�d�QM��#*�\r��I8��)�h�IHt�	�>~{3����\r{	�c���+�g�jؠ�oG\0\n%뛲ކ~ �N��hh�0��u����c=�vp�\rԫ�̇G�É*�^e�`���ʰLҎ���I@�xd���8� RA��9Ǉ�?�1�\0\'�M����tn�>p_Uh�g)<�t�~*�s�?A\"�jag/ߺh�=;z�3�s��js���+��Yϫ˧%���5a\nڭ􅨻�Ÿ�{W��՟O?����iM���Gu�g;���f��I�hO<�\ZFI�:��xT���\"rO�<<�M+��z��m&\0YY$��8�Õ���-�I�����No\' ̪�x��LʮF�38�IA��=*��NIʇx����\"�9r����X���SjSe4\rsK��}�a�����\n��q��3E_{f�m��-��Z�\r���m�Ɯ{�iٹPGd	��{�\r��=��\0[��{s�{s�C�~�����Z�8{���?x��@;�\Z\r�\0��k4>��mE�Ǯ]��\n�wK{�jP�e�D�6�����$��n>.k��?\r\\9ޠ�(4\Zc�\'*�,�)ɹ{1���j\0ӛ�\n-�HV�V�������-��jlܱ�},	�kB7�.md}�������g��z��Ͽ@�m��/w\r��fՏKk��m@*�M��\' \r�t���<�}�5�#f?�@���c���6�A���={i��|9�.��l�N�g1G�a�n����!���4[�Y��~t��S��q��%��rM��Gް}u�H�:��*�}q�ك���fL��8�[V{���\0H\0#O\"�1J�僦e��:<h�p������s��R��@��1\n��*9+Xe�K�jk����<��B\n���ݴ�e�*�@��{�dF��\Z������\Z�s�%�Qڿ�����}�@�Y��f�V-�ż~.������E}��\Zp��%tvrS�R�%��!×KE:E��[�{��FN��k�Y��v��E��Uٳy�$T�Y\'_��ت��t|ue!طg���_��V�FY	(��9n�T�0t��%Gew\n\rZ0f��=#Б�=h�m\"��Jy�j#�j��@JƢ�\"D�Eq\'l�l�{0Xv�%#���\'��Ѻr,�h�m(�n�ā�`٪9�UP�7؈�G�����zV:?�I�G,�)���>�\n\r�\n\r��@\0R�5�p���w[\\W(�^��j&��f�W���\\S�6hk�ws+����n��}`�ڳ�������R������~���΁��Q�+��3F�6���ǆ���n����N�^��H��i�Nχ�r�@;>lQ��tN��d$X&�e���M1ē}@�G��=�:$�ѐ�M�F*K��ҏX%�;�G�p��\'+�L�Q(�T^����n�J\\NW�L�cq$�7}FjmS��q��Rj5��p:/��=3���)��\\^ T4����@�5<�c8�Tȵ��\"5��\Z��:�ٵ�h�Iٷ���EH�t�r��T�3O6Y��`nW�{�����\r�4Z\Z�!A���9��4:q\0����\0%�7�`t��r���Q�\0��nʗ.T�t�˙GN�?���~(�2\r8��&��<I�q�k4�����b��^?�\"LS��	=&D�Ϳ`G�ݿU��Ʃ��5j��3|��8Yʨ�tTy*��8v����>xRMI��QT���,��6;�J#�2�E�IC��4WU��e�eܸr8����Y��+�w�&����u\\.�B�J a-\\@Ls�YE�\Z1�}\0�\n\r-Ir	���\\���f��E�~�n�K�\n7Ѯ{�A�}#�=f��JΙ\0��GC`z:�K���_S�i�������sc�5Ϡ\Zg���\0\'�(ioe�����fZ{V��{\\zY�[V��\0�Y��c]�\0�\Zw������4ãs,�;�����Kj[wZ���UEDM�.��P�s�.ٖ��m��FAb����f�\n�ze�;����ݲΕu�uϠ���PPo�ϲOꫲ����m�k����Z��5k׶�E���l;��\rJ4��u\"��B l�{	�i	\Z�6(�W�4X4Y�T�����*xiD�g�NfậT�,\n��l�p�[_,���`%B&9����NvJv�L$۵a+*�t��bM�;�H#�Ζ(T?�s<|��!�D]�j̞��~\"���ɱ.���I9�h�8Qe�\"+�#S���9s5 �z�6�Om0�R\r�� V�	\Z�Il��L[ɷ�G� &�F�*��\"�iGB��8��х�ꑉ��௘�#�ư&���\Z�����e�%[8��oC��q�P\\\0(w��v~y���s���rz9y��\r���8Ery�:m��D�������ʽn�zq\' IE�ik��S~��\0**LC��o��O��$	\r��ʼ�WNm�KM-�ʴ#&�6�w/�n�}����$j��\"+��\\�[��;�q����4���<��eM)0T]���洤��`������H��S6�,ݹ���t�X)?*�sQ�u/�G�w1(����9ZP��ix�p�Y���`�)4��rnxR�\rb���g$H�����ނ�U�E��B�pr�X��vb��{Qw�oE�׮Z���a�9��,6\"{�&G���w�{k\Zÿ�`e���$�5\\�(���C\ZEM��>�#���t���eM����v�S�\'2+\ZT�\Zψdŏ�`݄�N$$���M�\ZWN��f�\"i��y>��l�߰A���k�U�n��r�������v\Z6x��~�ܾt��$���2�Y�˙%�@�c�t��B�s��p�˂\'�N%YC��p�n���פĥ9�cۧ\\�Y�������6ƫڂ�m�����\0�p���\\k�3V�*׫Z���C��o�!��ᩇ��~�\ZxnV�⇹�����\0|m��[\Z��ǡ�K>�wq��}�1AA�-�&_����@��j��ޱ[ժ��X�k�1���{���f��˝��-��g�5jƸ��ƖӔm�l���E�yBQ)���J1LA�m	 ��h��˼+�ޢ�[e�4��ْ�=��?;�c\\Vkz�l:Z����Z�\0�_�-O)o~���_��0���)��c��Yu5�LD�Q�ר�������Z<�J�����\"���Rf��E����uڹjv�9� Y`����$�Axy&麉~�7q/ؤ�s��4��y�o5�f�̂�p���G�|�^0�Fq�?���ysj4<����H\0�m�G���j����N���9�\0���EB-��	G\"�O�6]��kD\Z����\Z�Vt���x�ɧ*�6/(�1���-�$[T�	\rGnS*.5^���к��#���\r�F�`w���A[\r���PV�񖧔��N#�:�0Gs���c���4���Ȋ*,uU�l�����	��8����������p�c�z����PS���D٨�]{��ڲ�.�s?5\"t]�_M�]��qR�,�tEϔ���\nG�M�����\0/�����\\��I���\r.��.l��p��/�8;F�F7�\\ǼA�;P�E��|@�T]q;�_J�3q�Jx��@��2?�d%�-#!f%V�SMٖ�,�DL�q���s�D��R�NAX�\'�h��êgR�������ߠm����\"ؐ�g�0{�wZ�@�ɶ���sAC�Z�\0���=P寇�G�\rq ٳ��29o�z\r�c���m�ұ\\>��2Q��H�� Mz�c!	��M���4s+�I��ȷo�N)uOΥB>${��E4x3�j��<����S��ĢOϤ��^2C w��fb���zʝuh�c�>��L9A�N!|ͷ�Ht�v�\0�Na����fº�X8�c��\\\n��J;EK�+�۬�#��t;����Z�㧧\'GeQc�U�.�H�������M|eD��1�ڧ���m@�h��q;>�-�ǡ�ƅ��nZ���֯�(h=-�Š5�K���^\'�Kڍ#�>�e��F�j�n4�� #يθ�ڽt��.�����z�~5�f},��0��z���#�����05�pj�m�{�^a��^�����\r/W��\r�θ��\0��9�ѡ׉w^Pnd(�7�-�u�;��cL�*��n��ҷkf�(rxg��>}��j�:���tlW}\0;�z�$����U�cV�Y��/�Ɲa�g��T���w�\"F�kթ�S�\nu�0t��p��tB���\\�4I��Q�s2���PBV�5M�lSEX��*��k3��L23�E\Z�D����<���	�M;|w1R\rJh92S>|w�ыG���j��J\"i#�[f�*�E�74��6�.��$<W���8�Gm\ZȱhFu?f�M/D)�r�6$kb�Χ�cS�>�4��AC�a�n	1|jH+5�޷��k�m1��ϡ���6�^�:No+$#�%�f}�ޏ���C��hS�̵;٩�mܾ^\n�c�)Í�,�I�;��l#�R����(�����B���mK\"ω����#;`�����q͝n�Va	�҇�lux���w�\0J�R���EE���%^�(�J��f�\"ٴ�T�L�e�UK=4_��ʙ����~c?bX�_1���h��0iYX֋) �g��dV_�8��R�V�#?��m�8Ӈ�Sʲ`��\Z�[Ϥٹ�;���T\Z_W>��l�~����n��`\n�5\0(��b����}4���`ފno�zw�ښ��a鹗K��f���+�j�p��\0�M�#e%\\&��jB����E38A��+f��<��QY.![���8��?F1�ܨ�H2�4�azG��4_��6,èyn!~�R�@�������������P`�u�S�礒�{#��F�dՋ9k4N^e�#\r�Jq\"&JBs�k%%����\"��������=�!Ć�:rH�Ldܱ]Yw˹[�$\\(yw�;:�T��� ٤ԃ8r��4Ie9埬���3�/\\�6�J���\Z�wM��\0��\'����g��\0�/E���F�\\�ޭz�������g��z7�iA�\0�s~t�+�����[�؂�71�PN��h�(���Pz�\"�N��Ep�e��7H�AdK�iw�b�[�f��p��S45��}\0mW�~*���m����_�������4[t��I<-��Pb��g��z���Ý��yOz�h���w2T��~�w;���m��n>%��c\\�}o��/W��cF߸4?���{��=^Z\r�Ϡ]�F�\Z{h\0�o���U͠խݚ��V�S���8���}�S�����~�\0nk�kp���*��GUЍ�*C�t�n�ד�<v�[��gLv�	�v���=����Ɔ�n$6?\r��D���5ka��mA�r�Z�X���+��a��?U��jyN��9?\"l�}��ϹY�e����F\"�\"ͱ�_��`уv�:Z.\rG�JǝӸ0Zs�Y0s��j��u�::�x�\\�q��xx� ���7\n���\n�d��4S�X��}$�BQb8��jހk�/��:���q���Џ�K<84����Nk�\n�\0惔+��z�f5�f�W������o�V���ߤ������Gay�������-}B��3�z�H�z��T�I��,LC*Nᶾ;��|bC�;��H��V0��SQ(��ܒq��u���n�[�g���n)xd��J�7,�\"y!����/�b�3��]�C�ϣ}CmT��c�Lk��0-%\\<k/nh��(�gNz�_n˅�ͧ�6��k~���W�kS����54nX����2�#u��+w����\\�lY��˘���~���I5B66q6��Θ�D͞:��������ҳO���*s�ZN\\��ڌ�/��������Y��f�Ǥ��.��MQZrUr6|鐎���o�1���Q�:/�-z��ծ��� vsÇ�����hC�m�k4Q�b��AC��gM��mW�6��oC�W�������֍[f������|G��!ۚ�n*�uU9o�g�{�=\\�9������Ɓ�^�]�:#�����=��f�W�}\0��+�E���\n�[\\�j\r���c�O)_v�L?�w�d���XO����b��;s��}-\\��H��^��-]:�^��8\Z�\Z镮�j�\n��]1�����������\"xD\Z��\n�ӮD��\Z�m\\���[W�������N������6r�\0���<���;����a\n�b�j�Z�]��?�4����t�e���8��M�؉nv�P�g\\�6�k:�@G�N��QF���J�\n�Я\r�r!\\�W+`�F�fuf��Z�-]�s6�f��޼F��^2!^9�rW�]H�u&\n�Nԩ]R�ԯ]R��9\Z�W�j�կ��zޯWѠ�?k�whi�\0��tX+�\n=�k���A���\r\0/�(v�^��X7%}Umoz-m�7�q����5�����#��!��g��f*����ι�޷�Θ�;e��l6s�#�l:�\roz��:�j\Z�}U����p�e���4�hw׉\r���䨟kQ����;��c����ƶ�w#���}��b�\\�;�zΙ����ƀ5{U�X�U�:}!_V�V՚�o�m���d��I��tk\r���ߝ-�m3�~}�X��b�A�;oG�����b��]]��s�\0:��t�f�=��ha�j��ι�\Z�K��t��p��oX�w�/�zu�z�Iėzk��ԯ���������vg�=��Σ��~�Ƭ�QZ\Z:\"MS!�;��vf���H�虺�#�+%�m_�?�o�ٝU�wn��p:�}�\Z�A�Vkm1��C�\0i�Gmp�V+j��G�c�����)cJ����Nvm�F�\0O�٪�i��U�cfK�5t�b��� ��!�m�9Jp�����9��g�r5�Q2���+7����K0p߇�T%������\"ۢx�*9Vf8����vQnaE�S8��h�na\n�<�U��M��AT�f���=M�E��L���N\'L�f�\rU�y铒p��wݓ����oy��[C�+iB\"ؐ1�f�=Vq��l�%�������[����m�w{�\rg!�m.5}B�_�B��ka����+j\n�Z�[�����)�;͚\Z�\0-M�*w����vGߩ��#גj2YxF�W�\\��C�?*��3\'Ԅ�5�$鱚��\0��E8[�T�!Z6Fd�\'��H���P/#����I���b�G΀�<���\0�H1Q񦕅J�u�~�?�+�iw���>)9�Uq�xG��|�{��)���˦�x8�}s�9!^ZVM�x�sxl8i��/�(9��t���`�i�Y%6&R\r�U��\'4���I��oꄖ�&��rgl�6���(q$o�Y�1f���aTB_��� !�`Ù.nQ?\n��h���<2Ȱe8f�;_�q���cl�X�\r�S��t^}�PAP�1پ��{Cn�ނ�j�oW�5���g�S`yN}�*<����Gjy����Tm��%���涄�]���\'R�3~�Z�g�1��bw��\n��\0�Dh���+IS��!�Í�+���Jbȴ!��\0�[���Ec���~3<T�ud�;��3SIZ2�~�Ø��Q����b.�Б�Ư�qb��y�Q|�D\"�RQ�_F��QQ�z�B*)�3���A(&�`��7O��w1�Z	���p	��.s3�i��j�J4˛��	�ζU���2R�$h��!�ľ\",��X���\\	�\"�\"�yV��y�4#�-)g�*Ou�Of��m��t߇�p��h����\\k5��hl#�c���<�>�P��r�C�H�����4��ȗ�X��m�՞�Gȓ�\Z��i��ܯ,�P�O���\"���v�k6�g(Ͷnq;�I�\0��<Pt�7)���b��|�\'9L�|�\\��\\��M,��q<��S�����|�y��	iW..B��Dh�OM^h��;\Z�ќ�5➼C�=뚹ƹ�+�k��[�z�m�*��C�LbШsVh;M�h;`��R!��鬚_Q=/�f+��zΛ��N^�韈�<\Z[si.nX���\0���y�s�{P�;\\h��(��ɾrJ�m�sCٞ��c\\�Ы������Xʒ��\r�<��}0�z?N����W��Li�.?jyKդ�����G���z�A�Ն�X�^�ُO�3�:��|-1�},Pk�VވP��B7�\'�YHcsEvg�����g]��Y��S��=�q1����7�ѥ�[��\0�P��\'�[6J^c�EmqY�G8#Նٮ[R�6i�X�:�IC��DAeC�\\�PA~&L�\n�eۋhE��^x���XČ~u��t��p���W:g���ݡ���e$��sÇ�!����Jގt�cେ�v�P�+��P���~�m�㳆�\0�WU��ͥ\'�0o%��Y�\ZY�\0\n�s�)Ā7��l���ɻvXF�+y�)$�św�9�q�2�`�dx��~c\"��G⇋32KǶ�W���d��Fɽ<��ƒ\\G\"�M(g0�\0�^���`z��Ɨ�f�Lkz��)��ι����aP�\0��^����Պ�f4\r�P�jx4l��\'��\"�!��oA]���\r�3��M;�H)�C�\'��;�Gힿ�a#\Z�y)GD�Ւ��\'F+CI���ˋ�X<�RZ69VnY�,�Ԥr�Kβ;�ܷp#)�y�J�r�l�DO��o\Zͼ��f�dx��_�#T�\'��)R�O�����oߍ9�@���l�p\r2��{�V��(׊�����q�t:�9���ډI{{3ھ��6�d7\'����|j	\'�^b�M�P�<\Z���I>�\\�(�\r^b��#@��unk�^����>;wk��tyYPp��z:�5s�W9��\\��j��S\Z�\\��`����2�\0{��l�����!���Kwb�X�θ�>��K�O����O6U*.�z/?���v;oX�+=�U��u0�g��V~Nj�:�N>�t�`R;.��8��\0�8s����\0\\�����/��s���a�3َ�m/�}G\\�����f���-�_{�\Z%�\\n�J���\0�l9���i��\\���vo�;Z�ܸ�z�f�W��\Z^���\Z��g���8��-�:����qG+p!�$�ft�g�?\0�s�z����S��ٞ�����s�\\��+\Z��^������[5��+�>�v>Z3K�y�JrM�\0��\\�s�c��\Z�GޮԐZ��?B3�ݛ�g�zƸ\Z�g�z�`�+��\\k~��ٚƊ��\Z�L��H�Ċ�xx����g�=:ì������T�%N}��En�5����^��6��41������ǫ�P�{o��\r�Q�\\�J�\rf)�0��Z܏�5�z��\0!\0\0\0\0\0\0\0\0\0P` 0@p1��\0?���\0�*e����;R��P����,�w�\n���/އ�b�/2BE��m�>d\"��u\\��o4xKr�����,e��/���m~h���[k�G����ŏ~h��X�DF��B��TF��B��D\"5����Š����ōb�.�S���\"^EV2]Lz[=���5�b���W�<%�Lo���C����%�^X�,����?O�ܿ�5g����B�%��>Y�B�\'����\n�%����B��u��!VC�^��YYzEV>�-%�QX��^��X��-\n<%�}Zj�y�_C��\Z�^k�堡p�/���\\$�k,y�!\n���ǟB��kLy�!V]oPcϡ\n��z�}U����!VZˣ��~�oQy�.�[�^}��ޠǟB�.��1��\'��Փ��!Y,[WC�Ϣ�\"��t:<�!Y�\\y�F����U��6�Y��hU��6�Y��hB?ť�^�6�!��1Z[��ƌd��X�v4c%�r�r._8�1�mpc����8�?�F�cՖ��1��HB��6�*��h\\%�*�U���p��иK�hUc��t>��Ъ�[��}�/��U�XZ\ZX����VD�P�\Z�V>�?��V]�*��b̡V]�*��b̡V_B��8�YlV-�B��+�̪�^W��ҫ%�zk�F��ض�\Z�r�����u��)puB������\0!\0\0\0\0\0\0\0\0\0\0P 0@`1A��\0?��ll��n\\~=���lt��ؼs%������c�>�痘��i��l=�qض�,[�^[4���X�būbŋr���[4x׃cᗃd�h���,sE���Q�*>�X��H�Q�*>�X�%Ti�/���*�O�x�<kM�uDx��#�5���:�<H^�K\Z�Ԑ맖xIcX��٧�xIcX������>)cX������>)cX�l���^�4W-�tW�H}Il��{�[}�g^2ĺ�٣ж��.�%X�~aQ��˦�V��Td���\"U���PǍ}9�M?2�񍏦�X���RC����%�L^eQ�?-�B�*�y�l��J���f��U�~[4|�k,��h���Y�J���J�y�J���\\��Tc�H�Qy�*K=\"UD�P�,�X��B��Ty���#ą�Ш�Ҫ4���g�Ti��c��f���v[4{�/���r�ʨ��ܿ��vUF�NŸl[m�-�Ųr��f���vU�4|���%U�΍��:ܿ\r��z����圑*��~v�]��[�,�a�έ�m�O�bŷ�\0\'�Ÿ�[,�a��m�de��*��u�_ñ��:��t�^�/ٹ|km���wW�c��\rWG�b�lX�m�-�ŋƱ����e�c����n[4rOe�⥛��%��zܾ׏�i�٧�_0�,X��E�l[��L��?����nk�e��Q\nX�>ű+>�U����_��?H}��Ht�!�C�5!������l�%����i���|L�e���Ly�Th�&<��G,��G,�Q���c�4��u_HtX�lE���\\u�}�/���c��C�E���k���c����c\\�/ݱl]�b!�_:V�jرbŋVŋ�l]��~��.�]?HǗc��I�9e���~NYyl��yyl��yf=�~�Yf=�~�Yf1���yf1��F�������ʱ��yyQ��x��\0F\0\0!1 Q\"02Aaq3@B�#PRb���r�4��$CSc��s���`��\0\0?�\n?0V{t�[�d�#��\n�D�k��7;5ۮ��k�\0���{r���/����Ǐ��k������j1�U�VW=�v���ۍ���[�먤/���T���qZ��Ћ��]�_|��������;<�n����mA���|��e�>����\'�zm�ue���&����\0��-�Jq�-���p��׼x>���}�w�_|��G[�W�?E��d�}�w�w��_��7��Y��\0������x�n?E��/��������,��,�w�d�}��������?e��������������\0��߲��/|������zՔ�^���^�U�g�w��Y=��]��V��6d?u�Wuw�Vl?E���m*�e����E��i�TG�?wk�ȹ����>xLH�nD����.̆��J�ph�^�v��[e�����f�NV�[-O�k��uY9\\�w���������/���E�o�g>��F�v6R3�>�a�Y��4�������$\'����}��^/�V|vV	�������%u ��\0�%	W@[^[k�{m>?�r�vVTǛ����\09+0��\"g&�ɛ\0���w���j�T.i�Y�A��̧ӿV��[�0�Y�6 {���<g갑�[4Y����J�$�Gr�m�O���6��=����,�_��d=vA!:=��k���5;(?�b��+�;\0y�^�F<��B`�.���C�\";x�H\\�X/�t���*��8bu�£�v ��\n;�8��VY潞6<��:����Ū����>pO�|��,�T����|\"�(��_�\n/c�e&�aB�Jy�IM�i�Q�V��քΓ��\0��T5�\0��E�4a�6-)���Y/g����5+@�L�uT&x�v�_ѪF�n�l\n�����\n,��L�^\n9g��Hܲ�IR����-hb��v�o%�sݽ�O\r5;ˤ�;� ��@�9\'D�\0��2X͈�R��]g;$\0���n����\0R�|�{Cga��:&�C$�nH:\'�M8�Fs��:V\\��v�j6I�<C��E<N�����ox��nk�2�)������T�d:�(c\Z�+�Z\\�g\r̬%��V���c1���M���Afy�G`F�m�ݯa\Z������ �y9l��;�\0T:�\Zܩ�5Q<X\\�[-Dm.�����mC�5��!$n��(b���3{�Nڨ����X�f���^���|Ԯ�x�ٳk�)��:B2\\��oE�S�5K\ZdsN���p���\0L5,��ͭ^�K�����yޙ3�r�6�����ۛ��GU�	��L�q	׵�rK+X\Zo�*\Z��#{���[��{���|F��6H����2���<.t]��UL��Xz�Ǫ.��#�f`9}���C�q��g�����[��S��҅t�]o@���1n�w�UToA��|Љ�*	�����eu���.�қ71���\"J��rf��g$an����Sn�V�TR3�oSĭ���-f��iH���4��a[�Τ(�E���R墥.=Ң�v`�6<��Q9�#��R���Wivrs�A�{�E$n��2t�	�f��s�c��kpB��K��eZ�ou9���,�^�Ӱ�u�a�G��9qg�$�[B^����e<p��i�u���YIG������f�%���Wq��]W��c �pV=��w�1J�_��&��̋�3�>7[�뱏���p��oi�������̷&�B�W[�����|ļgr�e��c$4��=�_i�F���H@�A���1�t\r�D?\r�ݱ��J�J\'��������Ԃ<Zl`�����g������kp�\"��{}>ɇ��\0�s/�}��i9a(�K���ei��TL����-�l�w��d؅��ga���2�>J��(�;,��م��Ff6��n��YN:�,A2Bܜ�$������=�t����lsBl6�UI���<=�̢0���ױ�;Hs؜�Jt�\nI�9����Dr��@^��Q�t�O�M�u�������o#���m��{7M�sA�Î0�f2*IOlQ\\�u3,��be;��Qdl$���oʰ�\r��x��j�?�YI\r�V��a!\\3_%�� �+��WU�ِ��j�h�Z���Dˆ���qm��RD�\Z�+{p��ñ����8�q�F�*���>�v��M*�&��d�[��,�ܳ�J.:�B�Z�\Z��J*�d�L��S�<����=���ܮ���$���M�?ib����&]2�p%��I|��\0�Q���1���;���������Tf,\" u]\Z�ڎ�`ѭT�N�F�hؿct)�7�����m�c $�?�r���^	=b\n�t��x�zJ�IM+[�p99Jڇ�y��cb!��K�<�J� ��+ ��i��A.�9���Y\0��##6k�^��m�)�E���<�F��4L�3l���9\r�\'���s��~��h�UOs\\ m��S���M���{[�����r[�CFV�l��{1�v��GU,�qf誩�gs媨���1f]�B��Q��F��B�Ʒ;d���FX�Y��	X��R���av�+�-�<�\r���w4�Ny��2Q�9���ՙ�����>dN��o!��	��{3k����Q��#v��FN-�%u��`�apX#s�d2��E��K�|,��I�\ZaS�{G�!a��|S��ř�*��dwV�yC��uX�3o�f���|J��,�a�&6Rޯ�\Z�2`7m�a�{1�n�n��v��?���7zl�@�e��`�j�BȰ[�1����Ũ�+�9��Q	���h9Ԑ:�&6Xby��Cp�B{,[��k4Q�4+�;1��|-a<��3��oS*���N�2yh��r�UΥ�zڪa�ݹ�R������������ߴe��Y�^�iZs=oKE�v�c�{S����J�Jfd�t�+�$8���f�{$�4���(扳\0��L�@�r^�^qd�B27}��}�l���+ ?ݦ���Oi�w%+���öS�Y>{��Ո���5j��Վ�\0����G�ӯ���,�w�{�}�v~K�;�ɿ��.�/t��.�/t��G���+���ݦ��U��K�����\0�f\\\Z�!]S�����]��|G0Bw���}\\���qZ��v\0���+w�z�!{��p}t}w�]��]��Z���Z~�,�	��~ -�\0�h>�A�U�v�\'lWiE�n�a��s)�?V��C�c�lzg�\Z�������>��u��@���N�3{��u@�w�]0sz�[����	?�e�-�67��=�pd��cH9�!�2�YH׼o�8���\0��ZrRT�nѥ�����Ů�^�X�~r;��T�F�u��{Cs�ߪ��1�Xy/e�;6��IN�[0\r�Ǆ��Cc��?d[�u��UD���l��榕Ѽ��b&��~c�F˼7?%%=1�H�|VO��|����E ���}S�B�x�ٱ^�\'sp��¦=#�3�«��s�`��jY��ˈRUP�O���Q��S�2�ր���ϔ�M��b6RSAWy�o��<\Z�Hߖ��S�Nߖȴ�m{��s1�{Sj�\0w�*�SV���rN���d�/iQ�޿�54�\r���ɕ�����G ��\'���IU���*rf��Lx�F�	���_$��l���	��v��C;$�X̑���H��^�|�dk��5�;������\"�Q?�>�1o���ԣъ�]O`��v�T�C<.-�����h\\���$g�b��XAv AE���u���6�z�����a�Ŭ�E8�,����\'h˩`���B��r�E;)�c`p6<Ӫ�M���D��t}�QU���Tml[����?�]�4�]\0��lܪ::J�F����2���ݧl�K<m�0��3�� pw���x�`-�sUq�bt��sv��)���)���c��u�K����?����@�UWFI#c�ٱ�B�����dg��R�Q9�0�_EN��w�w�v�A�S��qE�p9�O�e�>���q)#�[�}�����U�Xn�ګ���a��Ue8yz�}_Wx�,iT�R��	���|�wU-�z��*��<�eIsl��yTD�]��h�yUFXn]�U3\r��0]������Ӱ�VP?�m?��	-�$�Z�u�P;�/��x4���;	��|p��n�������E�&�/��}�y����߲�\0/7�������/����\0/7�/��}�}���2��K8��]��ն�Zm�,�e�<���k��7�Ҽ�L�����\\=��ew����ٞ-��g�z9Y��?Ԭɤ�KՅ�M�t�Q&WH@��C;�~N[����wX]Q!.�����V��������K�\0R�*%�Xc�F�\0�E3�N�e�W���[�h�T���[���nk%I%�x����A��c.�Ǚ�n�_�ϰ��\0��\\<�\0�K���^�5���e�܎c�us�T��|�G�	����d��g��74>��o$7�9���2Zz6�R��D.e���0�ߢ�K��D-�t�s|��.}59��M�v�V�Q����9�j�B�LZ�V�x�\\<�`����Aa����c#q#�n�n.N������M6����CO`�`�oiS�Xdl���X��G��ő�4X�kd��o-����i�klՔn��޷s����۽0��8ۈz(��5�:�l�6�yf��SK=F�o=�pbs�F7�FK,�|�Ì,�&��O�˃M�+M�x���Rgek\'��~Br��\0�42Bܻ�gn�S\'��X)���-ͤ�N`v9�A�R	�c�#�\Z��F�7�7?4*z.�w+�3�J���۩�{�o�MFk�R�f�M:�c�yk��T�1�pf�R�e ��q�TS�9�%����]%��wv��A����xO1�)�\'��lOkt�RSS�[>��Y�T1R���|*���ҹ��t|�̻3��N����ׄ��U0�c�\'ᶊ\ZJ�!��\0+l�MOM�\'a��UM=4l�@�-椦����ۼ��R:&F%�),��P@�G��~�U�{��3a-��}Ed�E�W�R��b�|��o;�L��e+�c~����JE,.����=66L\ru��B��e4C1��h���Ⱦa��	�E�\n7���=&�N8m��<����I��\'��d�V���|@*���c�M���j(��bB���Q313R�n��A���3T�r��\0�:�lf&�1:/cl��m��REGhb�QOM�_���Y�Q���χ{4�P~L�_�\0rV��j���YL�l�s�PDr۟`pX(�=.���!�G�:��{�fӍ{	����*8*��#���\'�(��|�F��kj͉H٘��7��uOѱ����+��[当%����OQވ0���iMü�cja9�{P迷9��_�$���/k���؛��\n�@�c>��6��S��lk�isd��٤k�˽ࡈ��74��QҊy[�aģ�u<홍�,l��3Gq&E�GSѰJ�Z�_hr^�QM8����\nulxc;�g���c���kk\'�G�a�E$�=A�g�Tx[j�����S�^I�A�|��ksO��\'�7�Z�ӗĠm[�l�3�v����x�(a��)ۅ�U��V�0�5^�j��z��|�!�)\'�����EIY$��M��:I~׫��S�IN���S�I$8��R���b�-�T�rc4��[4}��C�r���4�UM3��ح�$\'���?B0�G\0\"(�f�>��R3��{l�>�m�(G|�cfeǒ���:޿x.T���vX�z��[q4���% 图��̵�����9���1�`��#,���fOc���x�=�WLi����� �Y��e�2�\\���K>�#Կ��3�#σIR8�Z���>��@-~N�_��o���J��m�|M��[,��x����j����do�,�B���0����ɔ�6�nC��w�Ry��ˀ+y[�D�̫M4M��J�,�~;�罯c�{P�j�@áyQ�da�N�9!4�Qt�B�ڢ->i�ꨡt�ּ�O8�g��2�F3.%\Z�i�����^��|�槨�m�y�r�ލٮ�-6��X���$�0�\\��vyg}�l������������z���p��n<�ls�l��W.�O1�4y�~\0wT��b���Tb_Ʃ]I��	��,�8`B��N�%\rO�Ӑ���������a��,�nl�a��\0����*����U�:��?�\"���Y�_�ˊ�Z�8#�-Y��~��g��\0���*��urVB�\0�ï�.J���X�b���\0]\\�=���A��5tN�v�)޻n�Л8y&�g�~�[��1�t#�7��X�-�5`�\"�{S1y�E��`��s�krʾ���Q��R���R͆�EE�+Yna��G��\nz�8��U�\\5�\0���k�g��簀��`=��Y\r/��l�{y+,\\�ݾ3oR���xy]dH�!f4�V,��Q���l���v�4~�6����=U�\n���m8�˒��0���Vm�y\"l@,@h�,�\Z�D�{�\nַ�|U�!\\}U�����e��W^���\\��qh���M��pi��+$.�����e��.���%u�F�\n��>K���9�_R|��_Э-�,�Y��7?U����+;��/�Voa�_�`H�iٗ\\W�nֻu�ӱ����/�Z&+��e��\rVK�e�[EpnJ�/�f�k�,�r5���j�˪��u�VG%��!���-�vh߂�mӵ��W���U��R����y���ICꬬQ �\\�w<W�]_D�]YXl��_g��_���\' �<�	�[���c���5Y��/nt���>x!���v|Y��g�E%�6nj�ݼx_�/���8��4\nK9L��W�o��/��{l�b&��x���i��i��<�ad��s��O\'�\0�.�.�L�p����J�|!�H��1���(��zF9��[d状���N����4w4�\"�g~��S��\'�����~ͅTuu���+���|`\'T�����n����5\nYM[[M�Y�PV\n������啍�����EYN\r��56��k[J��:��PG�̨�o��h���/���y�wR��\0��QEO��� \Z)k�A�s�>���WұF�9f�7��9E���=!�Q��/u�q!z�S��.��g����TZ|b��t�em��4��e�����\0Er�\r�������g�۪�ߙȑ�\0�`t��\"�|�K� ��VPһx��f����dmi�qeS3FN���r�r� h���tMn�ߍ�P�>�*V67��*���2HB�f��r���KT��\'\nH\"����Dु��x��\"75S�5I8�C�eK5/GCYf�VTtΧm!k�˪Z�Gҝ��g��ҐFq��=U8�	[w�Z��]b���po��K�N0�c���ueT�6!ց�_D�t��,����<�?��#���DZ���3�.�U��Y]f��^�� �mVCE`<�V&�V�\\�e����W���W���P�w`���я%�H��#QC��<�ż��PVJ��`S���@]��)���:��1򕾯���c~F�*Z�7{��t�ߙae|�NFB���tS3�@�ec���ȬUr<rA�6#5���R��u���FWB�Z�L���u%|�����Ӻ7�+~�ٱ�p���v��	�%~qw&2��ia�1���o�?�����ǆʞ�\Z���N�����T�dq��\Zv�4G�O�M��Ypi���i�g㞊�Y���B���AfuV9�{2��I<\ZT�y,�I�ϰ�̕}�l�fk.V{3YvZ�n}��h���>$��<���e����l���e���應&�3l�C$+\"���Q�1��HA��a>}�#��m�\\+���u�\\�^;�~��*�X��P<�];�v_��k?�e��Ǌ�N�D�]X�֟q�)D캿j!��Vٮ�x4ۮ�{�__��8n6�d.h��N����x2Y��[�e�jܑV>\n���]o`��~�>e�0fVv��yv0~Aï��s��g��>]���aP8���y�7Us����\Z,-�VEs㒹�W\"�Y�}�x#�D�5�c���\0��\0�ۯa�����71��ͷ��ZwI��N�F�ZlG�\Z�R�m�\\pe��ۛD�t\0̜�g���q�N��\"ýf{}���~�{D,�.��&�>�\\Y�QT˄6l۞�_���g`���m��^�E��7�����<��|̊Fj�w��|L?�aꬳ�\nr��ŧk��V%f毭�j�,+2�GܤpB�eD/�Y���;> j�[�o�\'��H�Ώ��͸�U�b��I�&���.�8���m�rd���\\m���TK~��e���Wӗ�|_���I��\\�o�{F�M��k�Fd���r�\0v!����Yҋ���G	�/�]чu��S�w��kbtQ��lRx��{Ľ�96��qT��F�gev�)\"q�P��\n����iEL������Q�I�kE��|�% ���\"2��g�B��9Z��_�\"�d�U?t��)�b�)�]���UD즈�8w�����p�o��4��_k_b�}�ԓ>fC]�]���WE4D��-�\'�ǵ��.��օ��6xf��T4���x�˹��G�\n\n��ֻ�&hPU��, a{�?!U8%�07B>�뱑5�6�.��?+B�xjw��2%�L��+}�{���:\"��f�y���bj����t�̻��OE���\n�g����)�%�N</i\n�gO(mKz�g�(����ł��E�*R�Z���\0��1�K���2��>P��i&{�?�$C�r[���J���:K)�����UL��Y�\\�S�D�|��:��\'�t��sxr��xZ|��a_�0c�����u�WVj$x+��mV�����9S[ɣfc˰�sr}��0N@�1����Z5 d�h���졥�)%}�y*n���Y����\rq���6樺:]�u�UW=�|cE�T�UYnA.�R�S�Ń�3T�E�3��-\'�k��U�%U�n�o���M)l����YOW����V�S�����03ȯ��yp�B�}FF��O���h�ނ�%#�Ζ`�?�u�B!�X3�Z����+�~^*Y猷|q3�tPAn��U-�͊��T���f\'�*:V3�f�WeR������_���:�\n?�F�����WFRQBK\\1>�+��Zja�(\Z^��*.�����[�~e��Ëua%�M�l/Gn���e0���?��3S��]�(U=!3p�e�ۜ�鲏�\"�ѵ�T��E4��~�n�q��h�T!8�J�}���y#^���u(4�Pӌ���O��\rw�8)�\Z�1�R~k�����z�sF�F�7�B��g�8ńw9�Q�h6�a�T��42(�ƶ��eU4�ͻ\\Q�F<9��Q�B~Θ[�JY���\n#~�bys�|���\0Ԉ�FBn�s��}�Fy�����;��=�WWXt\\��a�:d����/c��k�C\Z<����{�7\'��e�bi���������DQ�6�6	� �w�s�����l���\0p��$��4x4j�na�d�h7y������;�:���0���C���CU�8���=T������Ku3�c���Sӽ�Ny��Kj=�{���1��[ꩱ��RAO1ce��O��R\"{����L.\"�/h��ȶ���Hdy�(K��nA�U�.�	*e/-�MK��h\n�fV�2X�I\'�B�׍\n/�ܝn���R��t�w��}��Eon�?4&�B>`Q�������o ��x�o��2^���Q;�G�v�r��;K����϶Y��2��Éc�G1��-�3���u��9��혚m�Q�mt\r�X�nNw%^G9ޥ\\�\"M�̭6\\s⮚ى��Y<tV������K=�Z��x/��#w,�#�&NS3�VgnAkŦ�V^*��}U�W���{����#�܃S�<J	�σ^żQ6�ϱ�����ˍ�9m�g�ȧ�x�f]���ך�Vʿ����G���\'������t�~\rx�M�u�p��\0����L{�v_�k��aün{rW��G�.�n�O����-�n������t��G|��ّ���䨦t�H�t�xw4����tU�a�<y_�\'�@#��an���$��{�V�\n�0�>�*W�����`�;���/u�u�-�Ec�ey6���4�x%c����x�$��Xl��QH��Z�c�<6�0|��;p�5KC�Ш!���[,컺��U-U26㻆i���QF�M!�$jc���u��Em;��)���c8cݲ2�����k킞���|�6(�56��޸Ʀ} 2�\0�\Z��S*�������SB����[�:��H`��\0�)Y_Hq�;/D(+�B\"蛓�l�b�x[�ړ�ς�C�m��׳��TwElV[��Y>]捂�6^$]�}K�dX�!+���n̊��\r1��S�R���f��:��C\\X#�x���C��δL���t�5-�ٽ_54�h��\\�9�\n7A])k�׼y��>(��7[�Q�t��h��(�gy�O��Zz��UIHT9�dm��h̟�\rdҀ�\"\"�>i�S�{S��q �x�#O�xB�\0\r�Ҍ��ոRQ�����;�4�9]#�8�\0wq�ZY$s獅� �Z���$S�:�g���(��`s�4��S�!so��Yp8sp=e��9*S�%�˲�6@4첵�e�V_����W�?��x��W@x��J�L<-���l�G��a��*��7%���\0�1� /a�s����nJ)fm�l������Y�Y�����N����x\"\\nN�b>.O���\Z��r}c�=gHϛZ�*���׻wq�i�*���eN��IWP����ĩ+_�+�C���\Z~S��d�A���T�\Zڗ����>J\nJ*	\"���w�5)�f涍��y*����P��6�E�t����o���>U0�4��5)�o���mO���l�������Z쌝#�O����(�\0�9�L�Yi�5Q~w��_V8*n��6�<K/�*��~ֺ��h\nr����R��-T�o��O��-{�v���\"=̵L�K�Q]&�5��{���N���O�hl��R6z��%����!��{ML{�X��q�B��� l��;��m,�68����g��?��\\�����xn�j%i�x8\n��L��.u���Wt�������Z��.?�����\'��.�cP�oHt��u�l�4�IM��χ^��(�\"o��:���x�5�ۖ�]�ee���W��V�?Ub~�.��?�����J\'�}Q��i���З��X�\Z����S���B�����8���taO����\0�4�ӿ�f�IKO��iņ�*<��l�׸�\n/~d����3g4���\r��2V����MC�M\rǉ�x�b��3cp�अ�F�H�X�T����ϓ�&�X�d��:��jjz{����#;����\0�m�4��Ý���\n��y����65��\r�/T�zi\0i�6�W��Ag��Z\'���!{La�Ӛ}U,�?���t��~U+?�\0E$/u���6�ie��-�5Q�<J�]u��wIngh���x���q$�I+�>B?[�$s<AFoh�xr��&	�e���{�q��_m<���u����j�1�#�[����)�5U�F��-�������n b�Q�tF)&s��p��i�����y\'zl��I{;���Zk������z����W�>����N�m��v� ;Kl˂�ˆ�_���(��ψ��W戽��׷�_��:�6�+4�\Z��V^^뺬��>�<��T��\\ݗN>}����;{���g�{~�7��e�uK	���>�L����<Z�l�q���-���Zy�&��\0��Fؽ���:��Á���oϴx\'۟`����Nj�x�9qf.�-6d����e�W9�ܤ�K��W��D��<��\"��\',�gJt�	Nx/e��;����e��\0�ƾ�����(AO����4T[���y�cdn r���[�Q|q��� p�O+��k	La���z����Htf��F�X-�-+��\n���޼�vV�h����3�2Y�\\͛�i�T��6�x�OS��(�d`�K��m���D[N�X�z�Uu5�DrF�\n�S2�ԓ�O�ω��&��R�l-�Ì_�eUZ�!��>jI�+\"���d9\\�h�S�{q�����tHlDm�sr��0�V��ë�!��a�vbO�����+M���-������m�}�W��T��7�|Y�b���`h�C�l�ɛ&����B�4R:_k�]�RQ��\Z�6�z�I==K�D#�Z�����m2Q�R�80���\Z4(+(�{�)��e_I�=���:���4���8zɔ�މ!��a�ꢖ��z�wz��/�r�`���q�J:J����`p�n�G��s�xO򽚢I�	,h=���!a�k�ς�#�;���4Z|U9��}6璷\r�������k��_���^�4�������7�e���g�p���Fw��y��GD�tq����CKi÷}�ʒ\nX�\r6���$i(�a����̕S#���r|�x�j>U ��a��O����Lۈi��r��G��g`9��c�GGNΣm��$�_5����NvQ�oE��<ÄZ����\"ب�(�K�X�<@PP1��\Z�Ԩ���袅�gW��+pq]v�+��Lo/�\0�;�yuUE���?�PR=��;�ޫ)�nap{UI���n9��53@$[	�\nɵ�7a��u�=z�l�\0�&R���S&\'�\r~�2_Y%�(S�#/��L\0བྷ�(�i+?/�����][�N�$.ŕ���\Z�a$c�O�{�#u>\'��\0U5�8�c�ǖJ��^	��K�qT�=�2??�O6��\'mF�����df#�ģI��b˫���e5i!���s�G�+�E�w�o��\0ң�i�(�R��GY���]G8�b��\n��#~!O��*��b����y:2�\'�+o�\n{%�J�z�d�١��Su`�c��}X�F�o�OP����LOz��}G���(^�F9b�Gf�Y-5�e��k=�j�\0��-�Y+�\\q���F��\"��TOa�g���겎@���b�\rr��n��j��:�k��,kG�R�L7���>ZJ�l�u��T���6�fT��am�~�|����sp�9��RI嬚O�l\Z�A	&i]���>��x�8ܰ�t�`f#�S0%���Q�H��4��z\\t�lQ;N��y��I�%�LV�Q��G���}�h��-t�i�#��\0���0�}�;�m;[��3\0�DL805�������Q��18�������O�4���nN��lױ���D;�^�}�П�A{/e�v@ͤ��u�\'K����d����k/��e��y�g�V���v���_+������G����i38�{��MU�:�Z��R����rXij7;�r������9���\\J�7���Ţ͹L�J��L�������\Z�U����#k{��(�)��fIW�G:�Ġ٦s�{�+s�~�uy�{���r%xa�o�J��r�bi��W���i�ۧ>[#� �$��g����k2���U��M�5p6fV~*�����Y|Q��%B�Ȯ�>Wٟ^e��潀�JA��{#ak��Ӷ���Y�8�d��<��ĕ~��r<7�[��KUb�Z-v�e~ADI���<��׆��/����U��m��X�5V��n+�|U�{i�|�cO��-����~�>��tٟB�t��X�SG���Sl���A�:mc� ?*i��;y��6<7\n�k����̼U�Z�M�nj�ǲ�����cG�@\"�{6l��j���s���s�+����\nuD̍����	�i���[+��S0����kd�bz����Xl���k��l�ˋ���*[3f̈́6�E����*oh��0��UWH�7uI	��?\r��X����@���Y�1B�}.�V�F��B��F���b\0�2���$��k�/s�UK����ӷte� 2[[#%E)kC��s�}�z�*��M�B��\0��p��|�$\'�ێ�>G;�ǎj�`kE�gD�HF*������$�\Zx��]+�^�5D��0��O����C�l=���\\0�\'r\'j�Ց3�r�\0�R�\"lm�R�5\\h@Z�<�̎���3t�ee��eH&��Dl$�&�O�-mS�L9/b��G��\'�*�J,7xr��\0W�4�6Yr���,i�;��-j��e�ً[/E��������W�_�-ɭ	��竇c���7�!UW���^J�dz9��%���^�5l��%� �3�6盬,��){M����y��K=���T����u͔U�����Wq�=U%;�t��r�z�j����lm5?F��df,w�+���m��Fչ���?���GA�|�7�Sa����0�ޭ�}0BZ\Zm�5K,P�9�����U1E��=�YV�(���q�e;��U7�F�v�Z4���ς��9H�}�̩*��Z�7��x��Ut����b���%�%q��/�#�|��1��1��8k�QQW�G;�}N�uE�b����=g*N���t��Im\\�CA3���o�R���\"qpy_�UW��?s7%c}����_S�\0P����UX�Σ�.��pŜ.:���s�F<i�ROQ�B�O�lԓL�	u����\r�~�Z���C�\n����L�Y�d��N�n��1Է����l!�?�}eP����7��d�\rÍϑ�*j�Y��R�5F��\0y9B��(�~<�/]��Ȭ��\0E��e{��j�[��uo�Zi�Ӌ^.���{��R̭��ذrcG@C�a=��e^��t[��\0UC��ؘ~Λ�\0�Lb\0>l�8�c�ȒKab���v>G��=��>F�\Zȼp�T�����\0R��\'�n��yQ�����;H3b{�1o��b\n�d~�Y���/nu}4t�M�ü9/lq��mq�JVW����f�q���E���}-��po�GM=Ev(���w�mD�����Nav�8^���\'�C0f\Zzr��/�F9��XGU�i����~r��� �l[��\Z˅\'Et���s�bbm?F��ks2Hz�P��asp�=��h�C�(tlt3��6��e��O`i���[)=�D�Og��!̺�+C�l,��u+\0�9���P{��5��cFM�[ײ����\n��j��mctΕ��d��㋚�� X<���Q	����/tʩ%�F�]���\rۮ�HW:_�ow-�Cw8ܯd�{4i�h���Fj��8�Zll�;��2wԸ�>���1ޏ���[φA}3Z��+[DB�<����dV�Y�g\rj�[�䬮<V����dnF���\n�%c��\\z���,8%w���\\��z��g�`����p<��^�^uq)�y��9��\'�<�[Ǹ�s̭����|��L�_�[�H�����G�eٜ�O}l����k�{[�|ɝ�g\'�6<-97���n(�����4�*�����Vs�mn,�m���n���]H.��\"/dE�3�k?���e����[-�����+Z�V�������.W٢�W�ײ�d~\"I�z��e�V�a�%~�.�^�!�^�_�2Zq�âx��,�D���\'�\\��/�=��A�%��e����kz�z����V*�+sY{��W&�#�W��y�`��\Z<��\0���n{,�q��e�4�1�p�n(��ލ+����-{tZ-�(&îmY�����zp����5E�KD�x9s�mv��kk+�?Us���X��3Y�e�W��5�EZ���dr���y�iS�Q+�P��F?2��n�%j����ƕ5-;#��l���&�O%#ct��\0��AO{�$����*4���b\"�b���l�o�{\rF6uKݛ���������(��i���\0�e����:���-Ѫ	�G�C�Ը�2���*F��Å˔MYt�Y4sQ�*�bsq>L6�O�2qO�?r��ufgJ�]յ����{��<��*\'q�����UC�s�Ւϰ�Yp���̻[+�5n<�\n��*�`<6Wۖ�X��>{-k+��_����j��W�կ�洵��������W\n�-K%�Y���?��[x�+l�%c���[�0F��c���!��i���3�\\r��EA7�c�>�H{����K��7�g�\n8�v7w�1ś ��ݑ��/D�$����((��)�#��\r��m��K)X�h�݇ɭWdgv fJ.���\"h/�W�0]���&2�<%��+|��8�:������i�ۛ���en���=Qcň6�׵ς�yv\Z�@�z�����<N�\r��e��sX��k5��6Z�v����?U�����W��]�i��9�B�\0��z������<��U����\0ҽ��\\�U��Y	�ͶN��k�݄^9�t���-&���N�/Fjh7A����JG�7��k-�ۿ�w^�JFQ�Y?��M6���GS2�w����>-�nթ��]tx��h�/o�;�Ff\\O{�&E0�:�3�A�������\0���L~i�i3GY6�-[�i�a`k��\r}S*��wY��uB}L��~y`�p\0�j3�!{ωB�\n�,n�b��ŧ[M,�16���4�ӆ��}����}�hߞ�|�����_�W9���E�vE���5}n�U����KO��b�u\r��s�bs.�V���Y�y����em���\n����\0����GotO\r��.������]��w�s�ϱ(�O��,µ�n6���̫��i\Zz���r�g�j�-��kU��Y�i��=��<�rYD��\\�}�p���y���u��߃3�g�m�5��++�f����P��W�w�{��q;��^�{��i���k7���F?�z?�^�/�^�/�_�\"���/����\n�\00ϡ^��Eh�\0�g?�+��\0�����ҽ��\0�{��}�\0E�\01u/��f���x�WY�W�0���\'��=�+%�f�\"�=��`U����5u�\0������/������Y�^�%�Z�鳚��~��N���Tڱ]\\�M�y1��\r�������H����\0e�`j����U���\0J΢��YO�\0��c��9���~�\0�^�C��ߔ��إ_�O괗��M����y�W�?ܽ����?u�\\�եg�Jʞ5�#�/q�\0J��/�^�/�]��\0�h�ѫ_�{��H^��U���޻�㾫�~�7��f�V�]v4�p꯰%o%�����a}�>\n�=�+��ny.j�+�r�W?ʰ����u��,�ע�+/��z.��_�W#�Y��Y��(��O�J�_F\r��\r���7+���e�ݎ�s�l�����sٖ�v\r*�a��v�\r�Z��E�U}�Z]\\�O�z/�r5W�V!b&�Z�o�+�\0%f�5�_��\0ڹj�\\�������\Z����WGӱ��\0�<���f8�Y���e������\Z&~�����O���{3�e���_e��۷�W­��7�\\�����\r���g;�����gT+��|�->\rhOm��j��=�C�G��3�m��Ş��e���Z���#Ů��>�y�v[�!��U�?u�W!]�!e�Yd��[fU��Y���Z�Z�X��jײ�fn�vh��ꯞ��\Z8��$ƨ����e��4�n�ݖce�e�f4�r0��G&�ap��{\Z�a{C��n�2Z!L.s�\0�Uzf��}���*H$��u��\"k��m�Q���os����z;��]�a���x��a����~EgőVّY��\\�\0+<��{����x��W�k���[z�u)?�O�>%Y�i�L|�Y��`��y�\"�-$��U�<d�9����E{\\��r�6�U�LF�hO�l��[rַa�ݑ�a�I��~�[T�8� ��3I�p���S>��;~z�`�����6���i,���Tt�1�~A�4��<|�&�*�M�4��X��^�g�5-+_��L���6\n)+��;���V9�ڪ>ОMT�L{�̰7E�%�,6�:���%�����GX��7����ܪG��!r�;k�lmnM�[��Z��/6�4�-��#��FH�û�ݚ�����G���M ��ݑ�-ë�6��{b�G�D��q�f��T����F���e_I�������PTo�9�+�\\��͒�����{�qSWֹۨͰ�%{#�rpŢ8t&ȃ��u�~K�]Q<���QŖ�^����,���4�}�y,�+[~���fl���\0�r���ޅdAW<ֶYx,�\0s���o��X��}��/n�6���%��8����bp���䢁��cs5���h��p̿uh�J\"�KwSQ�Q��w��!Q�؜l�!\\a�l������f�g��Jg��l����/��B�\\l��=�3z��S*z^�u��1��YJ�豋8��]�K��>\nS���#*�����i<�>��)op3o�e4Y�Fg������;xD�2!&���d�\'GR���PT�%P>ʍ��U�\"@2cƽ��g�$����=�����1�&���}��\0�S���U�\0�\'t��/�\\�n�\0�P���ߒ��&����W��a��J��)m$��o%]��8Д��\'{��j�n�v�����;D�*�4p��8�P���J�����8ܟ?%KM<�xYԿ����PoS�\'0�4���dh-���1p���]�+~ʙ���@����QRts\\�D�5�)�j�e�\'�W��Z�L�uĶ*S]|\\��V��s%����o�P�E�A�\n��2p]J�/���y����nYy*����ճO���b���B\ZH]��-O�[�;����>6ek*?)G����\\+�r�V\"�0��]e��K���\02�VeYXl͖]eq�+�u������W�|�=��\\v50~�����b����H¡J�_�NI�S�\\���\n&H:�p��eJAi��))�_#���l�)��u�lyEٱMҳ_wLۏ�(M1��P�֓e�T�sH�0��/w_ ���O�\">I����\'O4[d�0�y�\rh��̳Ȩyi�+ed�\"��{x�VM0�͗u{]\'^����:9���}��:f9�2\\�:;��q�z����Y_���<�+�%ah�T\rMy0u�@Q��7gjS�;����Fa2B�4X^%O,C��m%��*�?�%�67�g�UMMSQ�taUtt��^�˚��V�.�{rR:\Z������$*������Q���i2:ﻐ�G���S(���u5�S���I0�1f�¡�kF�N��朘��#�Fb���ho��f�S)+���.�Ա�\rѸ�Ưh���~<!GYc��l�V6Qa���@�FA���X�u��{9�ha�F ����i�ybr�&\02[�h�뒒JCun\\e�)��q���6���0�ah�m�d���aF��\'	Ge�Y+�����k��o��,֋5��`�+U�����fedU����Q�!?�Y���\ZO����%����o�嚗�o�RXxX���O��q�L���m����z��\n���A��4y)���I%~�r��l2�jK�_�����tt�s��bm;���!����c0�~en�@�[�jv��=J{�y�Tj�1�\\-|�${#&3v꽢Hb2,F��]���V	\\���B�	\0�|�B�L�Df��}�ҿ̿�j$?�Vm\\��J�_�Y�<�\0�g3�����]��V\'n�U�峟|�n\rv�i��9�ob����95��e~|\Z��\\.K��;��W��6_�֋%bV��.Vk-�ڱH9�$&�1��v[�I��u5D����f[l��9��}�O�i�׀��S���\0m�;��vX�-o���h���e��?\r��[?�Z��a��\\��<�v�q�횫r��e8�������n�u��fx3W[����qg��e�k��f��J���8]R��M��W<69�殳�e�^<����\'�4|�\0�r��Y\'�ϱ�����wup�oݱ��`�9���٠u��9���_�F]a�e쬬E�E\r\\�}��	ϯ����t�D�-.8[�Y�$�AX�Ynw�V�����dɜ��9�!P�a���l֬3������v��l\r�-ɧ�<�\n1EG!-�$i�M&� ʨ��0��Sr��{5�u��ؑ��S;����rˆ�i��p��r�<W5m5���Z<_t�2�WT���ҷ��<1YL�l�|8\\�\"�<!��Ò�����̐3TԂ�Q8�ouGGts%����S�\nl2�޳\Z�z9073p����[����������RC�1�+e����F��3�1WQ}�]�N�T�ɐie$o��u�씑n�w�{y��SS�,�ۼ�#-�u�����>���u����h�O`d��G%d��	����fC%���W5�����L-\09S�	0o��Tu2f��\'�\0\'�\0���ۯh��y����Lo�{���xv�l�f��\\:�{3�N��)�ҮB�7��`i:B��*@�8�%�H��*eX�xCu[��mñf����:���&T�uU�m��d׺�y-�l+w#�-:�()�!�i�����������eo)]����UEM;w�%��+!�3v:؂�g�`��Fg9���V8�Ħ�w}T5��a4�M[�k[ln���ζ�A,����@�&|-��&P>��íq�I��R�nr2����.$k�2�:�Y�?�2Q>��b@�]��0A�G�[{�H)�a��m�N\r{\r8��x��,Q	�x���K���e�Y���]TM���l�d�����7p��ȯ�Rr��_��¦O���}U�S/�,�$���r�\03\'�,��]j�������N����~��2�W~�^��������$7�t%\Z�e���@*:J&n��<�edvZ�Y�W]���v:l׊�\0�{nI�����x�}����4�e��Ym��ٖ˅�\0������\Z�W(�C�p�~��U}��W\'�.�O�ϱӋ^_��3B���g�*�_�a�~\"�d85�2�M6HNv-�!X�zpdx@�T���zv��e�s�]���eůi��aȩ?4?�����簎�!��R�V��ّ�/�߱����+|�����#�	����HF|bwc�i�m{��H�5����;�	Ǚ���ۗ]��2ൾ�>�-�$|��!]m\r�+G���?\r�϶�i�9��|}�k�\\�{O\']_m�]�K5sǟ�t�m;=;H��a[�GĪ9?�}~��a��d�>qN#�,�6L�^\r8XO�q��U�}�l�m�;v9�����W��3�g�ٟ��y����1�+?��5��g��\0)\0\0\0\0\0\0!1AQaq �����0����@��\0\0?!M@9��D	($��	b�̘� �b�669��T�H\n��Ca0�V�����LXm�6���q�XGC����r��(��>�yy��$�g\'�f���1�\"e�h\r��C,\"���%���\ZЄ&	�\r& �B	1dL���j�/��D�LϢ���M�Q�6+N�?<`;o��K�����a��~���p�8/�67��/�_E!�(<%�]�G �5p��<[!�$��LBaX��x���\Z�$!%��!�z�1��8/A3�O9�=�lv?��a�ߴ�����;)�D>c�c_B�xKr!HB}� ��4�����)ѿ�1АA���$!0�!	�����L�B�D�d&!�LBz+H~��ۋ�!1B}3꘳���{@����+��B�&2k�,M�!#�\nB�����X�C�o$4\"a�����\"�� �\"k˓�D���A���&���$, �O���!B���$&0X��B��B��o�;�Y�B�����\0�>�e�x���o�	��|b��CN��f�!C���d|df��Y���FЧ(n3�Xl��eC+��\rLi�co0/�1��9��9`&����<\rn/D�ǆ�2Q��\"��<FiLZpc-\ZEF}�t�8YØV^��ӊ]�ͺx#�4S��>JR~�����B �>�F�L�b�\'�	�8 ��1-��l�GZ�,��2�6H���+s�_���sH�#�r��	|�Zca�\'�V�n�\"�A!��ȯ�L��	CDЏ_S!\"!�Ɂ���D�(5��	���{\n���sy���V��rg�|@}b.�$P)΁���c6~����B���&�B�2�	�A��I���� ������H_Z�\0�c�C���G�A.J���K/	�#�������X�Ǔ�z)��x)+�]<A�ƴ�Z+�ѹ��u�n����إЋ�[xL\"���-?��\0Ϝ.W�	��	����B�!��apL%�	�Atzr?c���\n		� �1�wp���\0�B\'���a��2�Z�j�}�}i\r�����\nC���:��\r	,�LO16U�\n�;4Q�Ts\Z�D�!�Bu��,xBq��U�1~P����Xѳ�ӽ�\n~�8/��!3>�%�Bh�LBn1��B�D!�]��s�.p�a?���v^�;M%��\0,��_ڣb��b��������蝎e6�A/F�,R�&��A4Я��iN�����Ǣ��)>YӇ9r8�b��ɤb�9bF���(�AxR�\r���d\Z\ra�S�a3&����\ZL�kyhm��gD�\Z0 G��B}\rk0h�蘘���6Ba��L,Q4C��4p��\0�1!\\��snp�\r��������`L�	\n��kl�!Pk|��x����	�iэ�y����/\\�`�����M����M�����\"xN�iW�! oK�����\"F*F�&l���1�>S��d�Zm�쒋���,�ۮ�\"¦��a�\0-\nr=-��<_?4�:�YD�I?}��,��3R��ё�r����2z|]�:���-��ga&/�_��?�>�W�Nǜ�î���,rY%�T\"�{x_,�=\\fh���#8��ʕ��[5qk�.��ʈ�&?�&EB͖�h�6�p����򱯦l�$�^��$!)b}�\'�	��B		30i�E, >}��D!��nGc����\r<���\'��6��,LW����}⨫���=&��2K���]myL������,d��s�_Ao�6�����-���-��d����\\�g#�w��ܕ~���x?��㵒h���P*\\���|������(M�Ӌz�a[^��,��\0�8B]K�=I%�����zc���r�Hn\Z�\\����TƝk啢v����c��_�7���CJ�R�F�6Y�!�WE�~��g�嚟�x�\"<ȿ�?�ʼ(�Ѱ\Z�Z&ߡ� ӄ;L��i��؀;򂧡gKc��踣Т6������P�� �?���������\'ґ\Z�!>�B	}kO錜���1K��kXF\"�>�_d�\0a��DJ�K��Y19?!�!�ƍ��Lm�#lM�q���Z�<[AE|H!P�wЖm�-��>\Z;X\'�9�T�?P���|m��_��A_����҇k����ʉ�\'u��	^�O�R��\Z�S��y���=I3�Qϊ[�aG�M1$���A\n�&��������w��Џ�>��AFm�1B�_T���!	��B���!//�ƍ����H�/�[�k�c���\r��c�E�zp���%�N������i��=�\r0PJ��ɖ�Ά�S�!����*����\\��A��\rln!��5q7�YM�Ƅmg�\r���`�:΋�_�����g0�\'�	��11�Bbba!�	�RD �����.\Z���_\\/�1a�pǶMl/�\'2��c�~�.��A��)^��2\\��p��>z$�#{q�\rz�rX�*F���bE<-��h�&M$���dۣC.\'1)�T�l���Q��4���e�C�הĨN��4i�w�F7J2 )�M��!^~������Nqq���Y{kG�?c�wഖ��I���[����sB���:t��0�g4j�W9����瀲�6OA-!\"�{� ��%���l�9�J?#D��c�O�4MQ��#L�\Z��	���Y���!1����O�0�D!B�ȿG�����1_B�g��1l>Ey��B�v/�~�Ɏ�#g��ϔ2N�Iv���1���\0HI����h��4�%��j*��Ws�ߘ_����KY����v-���9\r����lr�M`��O1v��i�o7�]@&��<��pEgTG�٧��ɥz�:�;�lEZK|14\\\\*��x�ٸ��\Z�mU��g�O\rG� �O�(��	i-_q����7Rgr��{\r/ntj���.�4<�������RM�����grJ�R��Z �K�l�l��P��-�d�\\�Ao�&���՚�����䎬����8��(%�Є>�cO\n}�F}ǁ���A(YKH�!3>��B\"}\r	�$>H5O��;d<��BB�����ǘ�э��G���]�� ����G�~��6le8�#�	Fxk���VT��O� �;顧B�i��R�l�K	1��\0�Rrj~��ތR�z݉�0�q�OBh�5�*D�hu�/��\"�.������cc{�K#����}�4e4�<ljx\"?��OUO��7� �9�uYpF�\\�p=�,�����U�-�~C�k�هY�ɺ!��ج�x�Ч\r�l��x�8\"J�)�`�1��z���W�D��t��щ�xB!��H�I�Y���pN���1�Z�ba���n����MkWHOFX��,�; kC�7�@s�|������D!2Љ��LBb��hH����~|4�f�u��B���ϩe��7�tN\r��[x��������\"�l�F��(�߶�rI�\'���B��a!N�Ek�+$J�60���\r/���\Z���a/�!6�Y��i�B!�ۡ��a,!w��p�Q.\Z\Zb�1��!2,���q�~QÄ���K�k��X���&f�X��C����hN�!D\'�?��������%Ly@&vvC�,z��\0�m1#a-�fl�d��3<`��&�N�[���D\r/8>x&�	-�-$3���}£���0��sY��1\rV9l�B�p�Z�cE1��H��P�\ZI��!�G�f[�bC��$��C6����0�!L�L$M�\raL�÷�9!��3�Вt4+��<Q�=�?K�\0�)���\'�9�o�{#�\\���A$�G�i/�e�q���\"�rl�\ZT���)�Q\'bؾ���J�S�5��K�Эv-�3��\r�0{�\\�;�y\"�\0�v�%��z�8)��i��5߰�\0ob�j?dA@�U�D8���	��m�\"=��Lse�L*#�]��\n�<}�G�v	yH��Gҧ��3ʞ�E����P��Nyb�wyH�i�\\ĭ�2M�� M�M	���47�\r��@�O�l���+�/c��\'I|�sH�����W���HU�	PŇ-�a��&A�E�s�vM�\0�D�ʩ3��_����Q�3�]��ђ�c. \Z��&a$L�Z!��Em�0�\'�B��МC��g�#��!�b��m�\Zo�a|p9h}<�t��\"{5E�F��P<�z�il���cҜ�I{�j�Q�%	�u��b���^U�/Dm>��8%�n�f�7�8ƚ�\ZK�T})�Q_��&MO9\ZH��%��Ǝk�De,|����5&�4�%�n3PH��4���e�e�~���2�Y��Ȓ}��A�ֿ�tS�S�F��b��o��`�\Z�Q�=Sn�\\Qcf�$�\0���L�߉>CDǮ�+GH�65��r!�����У5g������Q�Cp҆^�1{3�M*����/d)a���k�Tӎ�=8�8U]����h�b�ᛤ ���b�x���0�܋�HK�D ����%Dů6|�|�h�������m|��\0HB)O�����Q��~YT蟡^��̃tR��4 ��^,:��\0��\0�\0��\0�\0�O�_��\0����\0����\0��\0������������������#r��\0��W�7�3A��\"A��zCF�%�\"�\n$-�E[>���x5�9`w������<t�P�co.�(��т�\rBx	��W�n��{7�X�KH<����ٽ{�\n�Ɔ|�4�\0���������D�>$s�z�<vz��Jz?�Ud&�0Jqv<?	��3�X�!4A���d8��d �|a�PY��Θ$�?�>�6��l443��,O��КzG����Y�\"\rx��lvf�\n7w��4���t\\#x��&���e/��n�y.�1�\'�����$}��aC@j�.	t�\"���� �$AN�Tr �CD�-�Pa-��B�h\r\' ���M	����B�>�hxF1O��\r��r��ݟZМa��\r�Bc��}����b|�1	�*Ԛ�,��3���Y9QJ\r��ͮ�{G9\nḼqJ��GM�,>X��?-�>\\�������\n70�ԋ�{��j.Fw��^υ�4�.�J�g�	�����hW\n,&�#���	q�p�T6ql}1~�|���Ė�!�o�3�hI��}\n4�a�_�$Y]hO��C�4%�D$a ��<����%�B�H��D ���$ �\r)�RTv�)�P��ź���c���&^9�\0�81�0��k���_tK��B|��b�k������^d�=!�l�y+\0�4�s�L�F�Z���6=ܞػ�5�cM���(�x�F��&��6�:�W��<nI�}~��9Q�j�u4����B��r�,g�6��~ׄ{����<2ӓ_6�8v��(�x��@�k7A@�mD��l�B���ߒqm��p!�D�g<6-�2�:�E�~�Z�Kś�R�~�t�>�<��\'��8��0~k���+���,r@���C\'���=T�������k�j-/w��P������f�r�i��Exv�Į���M�����0x���\'�b� �|���i��B�_B!�acD!M�	\rp�$$��	D\Z���@Ae/>Q����HA�s�/�ϧ��9�ʌ2��j�l�{���\Z8�ٯ�lD�V\r���5�sg��>Y�7��\Zwg� �B_t�85Jp�	�᯹��YN�L�1�d�vٶ��p%�zv�2�>[o���5��w;�hh\\\'����]�	��_cS9�M/P��Úchԋ��Κ�\Z��{�5�	��Q�=��R�_�~�}���Ѻ$�t[UW#<}U�m�֓�_is����&�;uT�}1#�O�Ȭ�ܤ��\'Wx\\��MC�C`+�\ZF�0�=%��.�{�C�Ҽ?�\ZT�᡺�J�1C�&�Y[�k��@�_�a-ܧ�x�K<yD�~j4\'�]���]J�<��;�7)��(؅���5�!�O�����.����������$�(kbQ�G�\rVH�I�?�3��4{th���d����D�������C��1�����c�������V?�q�p��5Lr�\"�������)�\Z���\"���Ca&_pm�P?�21�õ�~��~�[\"�c�n�\Z¾\n9��S��SĎ�m�\n��(%}��p�q����A�K���������H�!�N5\rH��`��$��+�s1chr�AՏ�\r�Oc��|3��a,D	�ۃ�\"�z\Z�2�a�q��8aq�JT���������β�i١q�\\@����� �	�[w���=���!!\"a,(\"		,���Q�8X7��E�PA%<��\\\"�-�\ZA��ߪ4�\n��\"~�j ����X�\"}I���f�>�A����T������3_�V�t������\r!���C�Zt��`<�o��&���mEɷ��$�d��=��B�9�\n�#āspגh���x��Ǿ\"���CH�[;���x�f���D�1�	�sᄄ��$&�ƒiv�\'�NK	\"bB�d�bPM�C#�cCJr$��^�Ǯ���̛Wd�	u�M�B�,jbR.{~��Y]\'	$Aa	�w�b�x�s��z(���\r� �4�¿X/�b�^�<�\0���\0�����Ln�q�v�\\�|�Tz���QH���\ZA֬�W��&���I���x4+�PVu�}��t&��Ύ��h�+��]�lh�\n�1���.����P��\"��Ǝ���HG�~Cg�H�TA	��B	\Z�ĈLE��A��E�bZ{G���k𜳋��PN��_\n������Ӑއ����ٝ�sC�4�\0��q��#C����3�C���7�\\��ćZ��p�\0�\nL�\nr|!�lx�����ju��D�$>��r:��klm��,�V�b����r�?�,E�~��|���q^n��v�I�⨵�I��Ð�6tB�:.\n**��w�<�2bE���.��X��%_`������z�Ov�\0�! ���.r�X�\"�@I�h�$Q�B>���h��/���ğ/��J4��qht�_�Zb�º�g�)!4�	�&&\'�>��L��660����11��e�q���GF��p�j2W�����ĕ\"�9��,�8c�?��1<�4M\r\"a�Bd��gdO�[6�	al�?�7����4A}Kf����#pRBW�	�=$9�	W.BR���<�[��	G�+O��AK��w�@���=��I�@+C.\0]	�O�}��q���c㈕�X�x2Q�s�B��/��Qa�J5��ɻ��d�,�1	��4!dK\ZL1w�tCb4\\WЗПx�.R�I\n�C�ٗ������3$tQ]\Z�v;�U�#P�XV�\rV;]$F�Z�N�����`���e��h�_�$hB	��4��GHP\'O�����yy\r�H���G�Bk��\"}P��<�g,�㯸��E����5�|�\n\r�آe�}��x�����&��a�.E�f�GLT�b�w���Q�a��d�&�}�� �&,A�@�9�\rG���D�45�Ϸ���a��YBJ�k�>��B�[����&�����_1��_%\nP��D)�b?bb_3�~�s]<�g\r.� �О�tE�\0~�3�3�m1��cx���t�_&���W���-�$&<(4�f�&��R)}��f��o��¯z\Z�U4@�:b�᠑�;�x���5��#�%�!b�Z\Zb��\"=�P+�?�]��A\"�D\rh$.p�Z4E5\Z�\nX�	=�b�m�q1F����\0P,�pؒ��,�kb���c\\n���@��^����y}����0���<��pa�_�E���xG������|}\Zo\n�Cn�%��(�=v>��\n�&�z\Z��l%�f\\�m�!Kh���XkDP�N&P�\ra2�ķ�\\=|9E4�p�ń�Ln���c�Q!0B�O��	cX��BYK��Aj�!���{��d��t�N�n=(_\"\'�4�1]l�!;����͞�np������J}� �2�?����=bi���}�����ϡ~���!������x�T�B��\'������.�Q&1�[?��U���߁z�>\n�`�×I\r[c��j�um�~K���4�\"�\\��a�����#�j	֓���3�̝�9�]���P�^)�/����_�\'���_��Ԁ�&��u��mgL��7�߁?��}�Ab�%�Q8�L�b�D�Q�ߨ�\'�E�����AR�퍹�����%ǟ��(;?f�\0�m�yGO��?�#`-�b�KM�3��!O�}�f�>���X���m}��B&B�=&(U��C �kc����{M��Ր��O��η�\"�~\rNvH��ԉq>���fo匳*9V�����@��\0ŮR��-�k�@Ӌ�\'��\0b�QGj$?�vy�GH���%V�\\wEm9>uU>M2���M=y\Zb�2U���2A���������2Q�ɳ�	�!r}�,z4L�j�B$%�lHHK�?0$а��\rĿ\0_��Z��!a\"����	\"	�ȴ�	0#��:�\0�G����6�bܞ�|�v������]9�	$�������D�\'�81����	矰Ϋ� �~���\'d9W��}�{���\0ȟ�j�ῼ���_xm���<-��c�J�v������%���7��m�S��#×h�$ZR�K��!�[�ጨ$z����~�+yL\'rW�:�������E�\\VS���t~Q��%��jt���AE���L�-����\Z&{(�����+�M�BF�`�,%�V��8r6�-܇!|}�6� ��V-⿐Q��[�`Z���%�H}�5�Db<HX��S8�)6O��<B���9Na��s��o-��DMlv7��D�ئ9��X45�7D�k��Ob�����t�\r��℞X.#�H������42C�S*��A,o�v	��*!��+�7�\\q���Z$s6%�p������t�B��J��I��\r��]��҄#lDx���\Z�\0\n�=!=��m\nߢ�O����13�Be��q?�����f|ג�b��\'��AѠ��V�Ѵ�C��	�DL�	�b��\rbb F��船�I��3b&Z���GB��NP߀��r;�ǎAxirBY�V�+�\0��!)y�f� �;�<\nv!�W����%$v���\"6x��n���	�s�_S�\0l\r\nϊ��ң�\0�q\"���_\ZQ�����;�X4��A㲦�lRc;h���I���$\"f\r�!�oᙯ��P�\"o(\n�Cq	�	�1���!T �`#�@�.�-��I���WA[��|||�T*��Km�ʯ}}\Z�:m��\0�(6q����Y�q���e����]�������xcyhxX\n��p�YF��ѣf����ockó������0B\Zؚ���gX�\Z+-�d&B��D,�!a\\,)M�Gb�0�I�/��\0����6.b	a#�+!�.�(��H�����p�!�\Z�\'I�SH%|ЍO�k���\0�\\�	��1�5�.�`�\n���A�+^��\"@��[�$~N��	��4����dÑX4�m�#��Mf+0�}�jt�7����	!q��G�6!�;��߲?X��V��Bأ�w�\'ݲ�W�&:�hc���2-5��O�0�<PF���/��z�>=�b$����+�h]�ס�B�Q_d�oa�\'����%����\r��	��:\"�c�쥶5�T�>��\Z��ܦ�+�hp�������i�L/��������0���nl��h��� �r��!ol[����K������ڏ�j�g�K{ E���L�b���S�-��i���D6\0���1���P����������4���Ai*�oB�%��,EL ��J�A��f��M�X���Oėm�c�\'U�yF��1r��!@��[��,���C�^��IX���&�(����!��7+��AHv�>���r\Z��sƈNN�x%c�*���(�7ӿ5�o���w��}`����ys�,_�\rT�:�W��q�mr���y����X�r��H��.�x����4WG{0��!�^[��3�O]�[M^kk_7؇����y���*H�A�P�]�vr+���� �pr[8�M#���������u���:bI6\ZK��h��C�	04������;��/����6��x3�\0��Τ�r�E�����?�bBcgH*�����oO+�|��	nN%��4�k�=a�oھg�G\r�8�Tf�5.j�7@z�g�\Z���9�	s�&M��(�X[9�|����ɴ�\r�a&���ѱH���8�i&Կcf�Y)��8��\0��	Y��7��oݜ�W	�\0щX��M5��3��U�=^]c������ �a\'$��������m�$G]%\r��6nPJ�ݗ��E�u����oK�؏�i�1hY[�r\"�sav\Zt���Di����O�eRZ�i�,8�+��!fwm���GL33�f�0���-n�OÂ(��v�ln<fz����~e3���S-�LJ��Jq:Ip��uJ�4�|�(\'2W����H�V��D[�3\\7��TG֕����d\0�.��C���Ɂ�� ����V���*Y�O���XB���X�	\Z���L[N�\0��-/05m�C{^���_��؛�	���O�O��L�������g,�HI�\r�%�/�#��l{hp49t[HZ�.���Y�B�>q�.�D�$�E/�ZY���<|_�m=�lQ	;@IWvЦ6��W���0/:�\r��M~��S���~�ݸ����L-^���a����ǀ|��ɻ�}O�����+����$����	�i��+���R�#���{62���\rR�~M���:>��^��O�����f��x=3��nU�<�5�Ơz�޾FP4o��jC92|\n��G�Y-�H^\rg��Ge�Ñ]0�v��X��4����cY���\0#m��)�(�Z@Ktؑ������+�A��lxL8����j HK�1�sB��&+x!�$�!o��H$���;XO���8��7���Cv\rGMQ&�a`Z�/_�)�/���7�?��]�Ѝ/�(bZ�}4:��[�^Ƿ�]��B\n�C��HpklQ�C&��hؤ�KxMp����P�P��\'�a`ފ:�<a�O�.1d�p�&�j�pe�,�K%��<�r\r���\0����v�$��=�Wa�F�ZA%�Z�\0�O��ۜ����\0� �8��iWLx��|����+�N�hik�Z�����2C�{O�vM�.D���п���X�c�.�,�\rl4V���	L��[�6#ܭ}�-\r�s���FL�W�2W�[C۞�{���Q�.>IH�[+�<*5���Gc�Df؛C��[��gb\"f�\"��$ELzcu ��9������CȔӄ%	?��O��O����O�\02�\0\Z���?닀�7�\"�h�}=�����\"8=�����Q�{�63tZ!���\Z^Ѭ�A7��s����<7�����a��6%�Z�&i\"D�W��aԵ�V�dx3���Ѝ\"*�����T�\\\"�FQj����^=Li_K�4�u]���4%��~(i�j��D!2�&��.IqS�����V3�a��Q�}�3\"Cm$����ަ��K���������cI�p��U▕F�.0�>����Y?�eBt��S;�$;%Ivǹ�]|�!�T���ݴC�����V/�����6��פ5���n4^O����\Z��&\"�r�u�͌�,�U�B�_�ɱ_O#���i�ޒ�t˗��Y~B�o��s})�����\\�sw�	|�\"��O�K��hS]��BCXܐ�c��M��5��t>��%6�&坒*�4tO�\0�\0�A�#�#���P���&��4}���娐?!�C녚yW������Ȋ:ԛ�EO�V;��N�>�UV�3����o�����+�_�:��yڍ�\r^}b�	�$f���2؅@yr[|\'�.j��o5��3-g����*�-<��s�i;BpH������\n�ȷN���q���N��E=\Z-\'������GU6�\0��ƨf(��^����4�Q��B��\'I���#j�>V\'�/�jփ���Ui��8�O>�P����:HA|:T�a�l����|-�����M|��f3�z�ѱ~�9�Џ���sY^�͸\'��l�Z�rQ����\0C\Z��|��⵫�,+�|�$mo}$w��tEz?�|���e&Q@�t��\0WTG��$	�Q����Oa!\'�S}�|Sc��V�pk�8-9�H���s��\0�?�.[��1�����lp����t����袚\r���]Kk5c�eMiW�X�5g����a�$S�D������↩Y�[!���!�t���MR_�r`�R��}i�$O4����9\")��)�ޭE�%�w��ڤ�o��2.����\r����v �M\'���[���F\'�=-\r��f��\"�#��3�dc4Tc�����Z;&j�C��h���DL��S6�F���������D�~F>�5��X��84+1�:��z}�OJ����ƆMO=j��\Z�^��~�.��y@�\"�n�TCб��~@BP��A���e~��_�?�ǉ����bX����==RW�s��I�կAjGCM~�o�6�����A=�+�����&��������WM���hk}�LG�{�.�����-l�V%���A\\4�pv�0�8�\Z�K�H���!̩���q��A1�(��H)(w��WW��Ğu���G&�	b�M4��+K�$�p���G`[F���o�fgԎ��������ؓ�M}��a��6Q��@$Q7��M�\Z�pI��WB�(���s��IZΟ\'��ND��c����߭����l;Pv��Dhl��i����3��6\\\'\r��W���4x�a~��B���c�H�XX�E�!��Lq<V���-@�7��QnW�4E\"�i��>I+�	�m\Z-��i�DZ��GYC�����}/�y}����+����!�r�\\�<�/��/�\nP-W>l~x�C�mAk�؝#C�}�,�$�gN���K��cHN��ni	���!�� ��?B�\'g��k�����i-\Z�R�s�̮�}�`���.�բ��PݾD�r�����<Z?{��ڤo�Q|vO�_�����Œ�_��aS��]48�3i�q����F�V�z�\Z�|6͕��v�O��v�PMV�o��	�Sku�\rvǀ��t�F}[UhP��ľE���@��m	�饝��7���VwU=2N�Sk��4�@K���\n\\O]�2=K˦�Q�D)%QR�Zּ��3e�U�Ôή͍��2k\Z�kRԣZ\n\n]��+���,+H��L&6����&1�~@���\0c?p�	�&��s��t�\\��\0��|	�\0?�ɫ^�G�cql֘]�\"����\nO��L��������[/��l5�GbE��BbE��[�b��z+�%��\0���RI���x\"@����>&�/�q����B������b���D��!/p�o,j�M>N��s�����h�v�� ���%�n����j��A�K��b���^�؇�M���bbh�k������BZ|5�/�ڢ<f8W��:�d\\�{��P��[��s�����B�����Co�(��_���J��+k[�!��-QPgjO\Z\'��pǷJ5Js��P����j��$�p�5E�>���q�����t��O�PSG�C��/�/��֫��1ФP�*��_T���M�.������v��#���8�o�e���S򰐞,O��Ρb���G�)�hg�\Z�NN�X.P�}�/�V&���_BvބK�z+�\\�U�:t k�f�,6Ѹ��\0��3�k��q�8���\0~#��\\�q�\0N���-���Б�V�l`菶*�{:�^X�\r�|�.��\nl�	W�lUަ퓱�e4���b�ct?��6��^����!c�����Y>�C;\'�ק�N2|��(V�g�u��ӾS��~��q�{4�l]\\M��W��r�rݍ�B(�[��!�_?�eG<�����\Z\'���6/	�47N����EV����I�r�#v�N�Q9��}�C�1u����C�0�����~��n\'/p�|��mƔ��Y{�<X�H��V�o�\n�Tۚ��� j�Y~Y���+8�lT���/���)��(�AߡG_���p	Ȅ�l9������c�_����a\'\Z�\Z�Л�~~@��w��\n�+��8��C�@(��3M\r�nÅ���hM�	���j.������Z^Av������\"��u����\0�cTp���\Z ����k��>\ndΊ&�s^@��!���s��x�g?#�h�9\n_A�3p�m��Cb��z���s��h!<6�(�Ȣ	�EA	��v1�\"����b9B�D����[�׀\'xur�Z���i��,!��\\e2��B����B��5�\\O���;�P;i���Am���6�n��`\'��\0;��\0cns��67��?�!�����a��{���ɥ�d��6!��\",\\B>�4����!V;W���.*\'pmb�Вlbho\ru���}�K�}!׋�9��tk���Bw����?,MA����Q��{������ٯ�V���e�V���4�f���r>OBZ�\0�7�l�(�.���˱\\t���^���\'3��\n%�4�+	����B__��c\Z��-�#�DL�\rψk���ƃ�dj�^xOس§��Mw&nb�+a�>�IF{G�C�\'�j�r&��͉Xѹ�&�\"w؈��H�i��a�hZK�tWw����p���7��Y��ɘ��&�u���U��g~����D�f�q&�NC@�YzI}���Q���\0ku$�[��o���u�1֮�*���↵>6�(���¦lI�n�C03�^[ B��~^�̤-x3��ItG[�d��L�=bo�Ⳣ��l���!�RdW���ovO�J-G!�����ZW�fw��%eb�$�l$r�T����%�\Z����1�CA��I��[Bm��j&�϶�q��;������ޏ�oם�qʗ�a1K�\0�a�#�vB�,pe!^+����˲��Y��;3��\"�G_���S}���9� (�HEԥ��ִ0���c\Z\ru�\Z�Z�:�u�2��?s�,�����;q%GB���n�P��|� �������+Hn�>�����bD�El�l���1�Ĕ�\n��&E鴭�^,�$�Oo�\n^��1�D��op-iq�;�꟯B�_~�t0�}Ӽ\rC|��>�z�q��B�F�ZW؞)6_�)?��Vr��7~G�/�/��wC�w0ۨw)�h6\0����6��lc������&�Ji|�a.p_�����I\Z��\"��V��a\"���7�\n8���ܢh���׸|��3	�\rh}��W�\r�Mh4|�a�h.Pj ˳�\r=���$��\0�>8�^�L����M\\lނ�IQh#��=-��(~�_�|��D���s�I��(�O�$�g�	�l#yֆ���\\9��T���ҶSʪ.h	%吻\Z�%��/����m	��.����f����]����!VfV���n�14jG3��j�Sw{	�.����{`\r)�	k�tJ�s����\r��QT�=[/,��>�������U�A�It�q��q!n�C�}��b�r�t�p��s_��9����CP��O�5�~�H\\�~ j��,��*�e��ѽ��/�NavĘ����h���/�S<xwBx�֒�����_8��k^P��\Z�4��g�f��>�6X�R&���Ņe鏓u���TMgC^�P��ͼ\0 ؞+C�!�}���F�O��%�R���J�*^AГa\"��U�{��?�#��:���v�ET?�(z��\r\0��\\\\��5>����ǌ��t��\0��\0ö��1��ſs�����G��\'��^ �,厄�	E�����r�m�`x�|\n������S��Nȭ�����c�#�5r)ٿȮf��6l1�e<��~���rWqv�B���@�*P��4����\"�Lo��6R�q�]��*\\B��k�a��{r��خ�7<��#O�E�ہX����\0�(��x#_��O���A�jІ�=��*��s����w�)A_�7�R���P���#��ok������o�r����M�܁��I��R��b��}��B*�G�7F��C�E���Pp�!Gh�8w(Bl\\��{(��	�.9�bz+LlO�7b�!V+�A5��Gp5y���Bl|��9����~@��\n�1\"���&)�px��*���	ȎtG���.��;.�h\'���%o�V�X+�k�_�+/�Qˏ��Ap�nq�_�pї�_$�C���[+ ����;6ıؒ��05�+�0�B\\�p��4�L�� ���=x�\'�(%P�L�\n�\\Yz/��m���cG(��0��D6!����*�ϸ�G�O$+�LE�bgG�A��#lLLBE~�2�m���=p�h���Ss\\0�5P�v��yC�w�\'��m���W6�5^�m�H���؜�A?b���$-�\n�Bz6k�b�=�	�V��c�68+�o�@m\"�^����B�#�+�����-\"��h�+_�|&�\\���.���Wm�5�v�\'B�Qb~]t^�_$�W�+MѺw���k���bq��d����	\rA���Ε���~�6vK�W�VI���	!���BXM��Պ�w��90~���?C��f���ۙ�Wp�@�4جO��i�_8^��)D}������Q6!=��6Q�\r�7��\0��#�m�j����I�\0��\0���\r�\Z�����\0��\0��w�\nj���/E�i/�6�,�_��,FE}�}�\0������\Z��꠾(��8Z�Av�\0��1�����\\b��1���!�T��!��F�w�{�,�?%�����\r҂�\r�5��x\Z��9�U�@9�L5��쟍!2\'K���}� J��ٿ��\\��d@ӻ7�c\0�(��d|I�Dh�ٳ�� [c��u�^[e3�hs\r�!��\noQ��t�Q�� �]\r�Cb�\n��JU���DR#5	�oX��vi��aT8��G�3����Bni�O�%�����*�\"!P�Q�\0��_`���1�GWNA>����N0=�l=O�NW��f��5=8\"I� q�Ӏ��=>��h��@�����������h-c��d���b���}�w,�#K�GS�\rl�p��KTo����=T?���ڇc����<����xв���|4/h�S�\r&g+�y���D|�mߕL{�%�lt�H�j��_\'��,Ӈf��~U�vOs���BL�T*��e��\0�Cx\Z.Et�kGB�4R	1�C��&�P�)J&(�!A!1�`�y*�k�-qMc��O\Z�hf!��?���Q=ap)_a��4�.�ȇ#X	!���	\'H\ZP�N�5���g�	�ʏ�䇮Ӂ�c�i��=�/���z��	U�i��y��t����\nב��7��_\"�isqK��lr|��\0bt���(S�~q0�!Q��A/q����#N�����?��\"�E���GMW�\Z�O����&�qR\r�<+��F�	�tA2��1rB3�EA���I\Z�A�Ox����3���B�$%�c����T�/�9A �&��,��>q�W��C3@i�ѻ���#�h�9��/�W���8�B�_�=4����^�@���ă_!�m����eL}m�G��\0Fʹ�T״#�Q���qq>�o�v萑\r�Bᄈ���#�& T tQ��\Z\"R�8�)X#�����ee��\0�O��\0����\0%�����!M����_���j�\0��\01N��>��\0V:��3�~X�>�ɷ���7�����O�q���^�ةvjC����g�A��Q�0{U6Yi����\r&[C��B�x�S�	OW�?h\Z��hG�\\Bos���Oz~���m��L�v�|o�@�ҍ�[khS��m��%��$��K��ӡ�C�|�\0�B{���+�\r-? C(��?�a4QH����_��\0fkH�\0\\\'([�:?`)�巏�����?��\0�?�_��g�\'�5�\0��������:t���\0s�k���_���\0ܿ�/�?�\Z��S �?�(�\0�{�\r}�D��\0Q�\0�Ķ��\'b�8�����w<�:bz�>�BLO�$6��.ι���~\"Q	��OA��D�\r!m��H_C��.~�8�������������x@��\n�})�.���c{�6	-�UV��j/���;����\0�W�A\ZZ��=�߁������\'������*��cO��M�8���C�Z|\\�h��Z\"����h���|�I���vq�\Z)��֋1X��EC��DI@�h��ap\\.K�hRL�j	��8���6?���x�\'�}�$ǟ�_�B���cbrӈĐ�	�lG�&�~�Z�i�!�kه~h;Qa)��vpi���-��|��\0dU�_<	+��q!<�A\\KAY���*ϯ������}C�e��&&�\"�o�+���6pD��������*�+�5��\\�1b����Lv2;����r��XM�t.D��G8Mv50���\'����)�M�dإ�?$8�a�?��<&�3M�\rа�(��]n�����_j�a�IB��� �_0�p�l|(16Hsp�p�t],�$�>K�����_��so�lcG_\Z}�0J�`\"�L_�6&����Etئ�V�cD �l��X�{?�6=6٣X�L�)��H*i	���c]\n�h�9D�I���B�,6n�6&AgE���O�	P�\'	�@M�ؽ�lv�5��U�~���^E{���p+����jr	�t�{\"�%خ��AXސ�t�&)�;M�$��..(�V)q�x�����+�\0�1K����/Ph�:�e?��]|��[h��F�6E�x�ņ��U����P��7�=��]\r�F�����La�G��ߡ��M����=g$��ނl8��ͱc�����6+B�P&���{ȸ<�K��ҫGsB�\n���z?\0�\Z!\n&-�[E�F0�ʢ8	�����������D�p\\pc���h+����*X>_�ivN�Yhv\Z��7�|\n���E�W��Zk�n^ƫoC���Iy�/!�|}��\0m�1�Ꮈ0g�a{\r�ؘ��i<\0�!/�-�д&�\r8p�J��1�W�D��$|)y_���AP���3S��|��%:�U�u�P]����̃�ֶ�/�嫅</cHy����\09?	\Z���#SK�~\Z ��˱�7���#U��BZ++�z�r���Ƨ[�+���ny\\�43���ʷ����*6�O��hO�{��lb��6�]� ��WO�4�n�M\'��=��-����ٟ�c��Ћt�6�!�����GL/�P���u�t���`m��E`�ٮ��p?�q6[��:�	��b�B�u�L��苬�vt#	s�2��G/���t:`�Nz�����̕x>�	X����>�oH{���`�c&��n)\n��5����7��q�~�X��q_&��%���,��\nG}a5}Ȑ5���cz�?����hdv������0@�b�	D��|J/C��?!ˏM�QHo__)��S\Z�%�����ޟ�����T,^����\Z��b��wj�r��M�v�c���i�]]hA���S�EI����\"^�e����������*�h�7����@��\'�2���i�L�\0r�W��T���i�Y���uҶ�+G���7������$%��^�4�U�yBɢ_*���^�!�|�l�������$�\0sDlq�w��?c(Zb=������9:�\n�\no�C�5[�b��,�����\Z�E���>ٳ�s��6�z�\\&�#do��\n��\Z���(?�\Z�)��x�gLM���>▘4��Uߑ�^M���>�I�&D�\r��Z�����Ya:��/\0���1��7��g�5��#`ߋ�U��_����c��yp?��\0�U�%y���:�����U�zB������p#���¶�`u�\Z�s��3�L4��^����in��n�{�.G)\Z!E�Pn��I�\rR[�h��4^\n�`\\���(�b�7%\"��);rJ�i�w�٫|1gpx���E���\0F�T=>�\r��I����	xm(S��5\n��~j�����|�Go�nh��~ؾ�\\�)�;��5�J�b�>H��֌�ʔ�?\\؟���v��ch+{t�9��e�n*�\Z<�*c��û�Tބ���%_a~����\'o�)����6�WU6/����5���Gfi=�vP]���9���)�y��T��.���`�&n�p��G������9[��oaҮ_�m��izb{6����\0�6��������wxG2�.^=1K�\'�mp�}3�)�0{@�r\r��&Б96���*#_�@z����+^�R����	��(��J\r*��x��X���6>�i��(��r������x�\"H:)Q��:O����U���qb;��t/��K�P>�)�\'������~>z4I�]~�+6�B�>��\0�ם���}�[��n��=�6�,Ss�t���9\n�B��*V� 3�ry9�.�~M�M\\�F��^?rf)Y���M=_�+��\'����H�#v��%e���\"�\r�D��IKe\\�R�Aث�}�\'2��BC�mr��z��P��z��LLb5�Њ[������	�������Gy�\Z�\nP��`�|�!��-&]��/����Iyh\Z$	8UP���+l1�¢`�(��]��m<wL3��~tt��5}HP2��e�S_ $)��i����i�B�K�t8b·�ErQA�]�g�vQ�)y�s�jr(L�\r�5��jE�6%�*(��LB.iELm@����Ho����Ә{��pXY�*ɺ�p�44��Ҿ@����i�UB�{���h��-r�}�\n�\\\\�_��,�/����m��B��m���h���\n�Q���ȌU��d�LehR��[9B�����A���1$<��#g[�$�N�\r6 ��.�1�����L�Q}��	�G�F��1M�Ttj���_cU�\\.yб��<���?�\na-���_XYW	6U�٪Q���#dhF�\\va��p�p4Q5\r�4�X�{B07�}����4�\r��\0��F���u�&�0����н�X�F������4�;AV���$4%�\r��	���6=�Z�\Z\Zv&����ǐ�p���oHg��\Z-��G\\����r	�/؊;�I���6��xP�)QVrje�Q��a����>˓��`:�?��+�{46\\hR�BcX��p@𘞳D�8\n�\"�\"����\'�P��^D#J�����S����C�J�:�	$Q�aȘx\Z�l�`��2zbA�<aYW��[d�	��O���!=���a��#�!��+�%��U~C\'�2�q������U��?�S�z�ĩ},�>��R~�(ʎ+N���WV��y9��U�%�\"l��d_ͭ(UJ��A�^���h��E\Z��Z��r��w�M/B�v�R/�\0���o�?[����~��-/�����h�i�D����p\\���%8�ڶ�,g�\0��a���h�J����T$0�ؘ�t/�p(r(hA�+�V+.03�\n��B(��\'�@�A��\\���\'���sI����\Z.��x߇�`r��h��}\nbpDܗZO�V�ҜbXO�O1G��6ፈ���$#�s���? �QJp��HL���Я�Z�9�I���*p~$i����8e?CX_��X��l�q��P~�T��J/\r�k�tg̒:9��{��2����h��7�ɧv�����؏��W�P�	u�B�)>-��%#�Kޏ�����}�]�����ꯆ�b]�׍��-q�A�������G_[���q\'�\Z��}����t\'�.� �x�M���r�.��a������EJˣ���|@y~�XD��f����~��S�}�������\r%��\\_������1��ɍ��h�wx��\"���p;��i��\n\n�ƕX��?�?�3��\n���@:��J�q����lO{�rE���\0,��5�k:�K�#nM�9��6n΋Pͅ�xA��\r)I�6pw�+o=��Q1����!=�����t�	�����X���j�b�o4.�X(ϰi�^����@�����e�/�Ꭸ��m�d)��_�h���6��q���3��z�a]��1J��̻\r�H	���\'��7_e6�\r����{�,2*(/�-\r,kKB�*�p�9�hUE�p(@��ض(2�DD�\"1s\"��A�`�G~?]e��ҋ,\"�T��)�&:�X��.M]��ss�J9m���a�>����5Ę��&I�|��H�֎B,�\n��POf�&\'�*\r��Ԫ�����иlC)�ʍ�v6&�����-�����R�4��;\"c{�8vM|/�HS\rC$�0_��*�\0\"�1%sб\rQ�I�x���a����>�]�L�����Ra��~ ~����*il@Qar�	��m�9rQ�\'\'���b�]�\r���E\r�lF�	 ���6n��*8(���x��b�ys&J�g\"�MR	��K+	���J�/�aM&�d&�S�Ht���C��:�Cb��bU)K�/��c\Z��ƿs4D|�<�J����g�]���!�\r�y�c���MH삢�8}�:)p���\r�h�wF����A-��pM�A[�\'K�R�~Ar	��>}CGBT�a\Z�G@mB{������X�8yOc�C_GC\Z.fV�x(�ssJ,Q���������1�CW�n\r�}���S��Ю\Z)��4V� ؋�᨜e+a�pl6���:JA��t+�no	��0�P���h!��8XBQJ\r�O�[�>���+�?ho�~���\0�?؋����fl��e��	�0��(�n�)qJh}���|���\0P#z-hu_�_0u�1Te��=aW�\08�P}Czc��E	м�[6>Ί5��:7k�ۦ)���=�`����]��N,W#��GyCb��+8Ar,��lr��¼�č��6��Q���\'���%��\";��)��ؖ&�q�S*���`��T�����\0\0\0\0\0\0��m���$�@ 	m�m \0$@95\"l�	$����Il���\0�H��D�m��I&�md�I��I&� ��o��Yl� @����!64A%kl��-��\0o��Yn�o��X��D��$���m$�I���&�L�[/�K*Y\00I$���ɴ�\r$M��I}��K��ٶ�}��\0ov�I�_}��m���$�پ���l�6Kg��\"C�4��e���$�\r4M��@��I��K��m��m~��[�K��m,�I��H�@�6nO��j��m�R%0@\0�H��$�I\0[$R&�$�%��M��o�\0�m-��$�I-�I��@�~�oj\0}�R��$�ȶ�I i\"R\0@ 	%4�g��i��m��m$�,�I$�I��H�}��|J�\0�R�d �.`lN�%��7\"j���Jl��A��I��I���\0�����m$�m$���h�\0����\0��Y.d�*�l�o�ǥjRH�����A��K��I��o��\0m��m,�m,���$�do�\0�\0�\0��@�I\"	ɳI��m��m&�l�Il�I%�I%����I&�Y���\0(;m-�I�����$�@���\0��\0��� �l��A�@m��m�Il�@l�Il�[%$�\r�\0�I&�ɿ�mi;}m�I����\0l����[�Ca{I\"�%�[$�[l�$�l�Il��l��l�_��I��Yd�J\0)m$�K�\0�Kn�l�����Ka�\"����%��l\"�l@\'�[,��l��l�{�\0�I��I-�JA\r�$�I��I&�\0���\"�`h\0Rɦ�l�Il�I$�I%#K$��@�	4\nI$�\r��%�Im�Ka\0l���m\"[\0���b� i�It�H�[l�I%�I%\'�l��,�I$I$�\r&��%��%�I(\0|�\0ܖ�$�l&��%���\0AVI�)$��$��$[m��m�I��%��m��A��$���/�%�@i�%�H\0	H&�[��ﲀ	�r��3%�[$��$�l��m�I��%��m��a�\0�\0$��I.ҧ�` l�JH)I$�[-��A(�[I\"[$����	k[�M4�y\0�i���I.�$�R(�RH@�`�(\0�\0)\0I$�Km��\0�(�[Ib[$�I$�I\"[�$�\0�I%��K$�.�R(�vJ$��@(\0�@ � \0!��m.��\0�Y,�R� H��m��.�V��I�Qm\"[m��M���;M\0\0\0\0$�m��I�$d��\'�m� �V�$	A��m��,�\0��I�Ql�[m��M��lI�	\0�\0$��i&�I&\02 ��Im��\0��!�R� [	&�$�I�Id�\0\0��\0�I$�IM��\0��	�D�\0I$$�@\0�@\0\0���m��\0��!�RK`R@_�����$�2�����M$�i]��4��)�\0\04�@\0�@\0\0$��e��&Rd����$�I%�V��I��l�@,��%��m$�l��` 	���\n@$�@$BI{$��m�I&$�r��$��%�R �	\0�$�I$�	$�@}��L��@ \rD�@4�@$BI\0e������&B`�{I��$��$�\r!��$�e��l�I%$�$�\0��\0�4D�JF��@\0	$��e��I��[�d�WK��$��$�m�	$��e��,��\'��e�\0��\0\0�����\0�@\0\0	$��A���m�Z�D��J�|�I$i-�`��in��7�M$��l&�$�I��n\nRI&�JF� 	m�����d�����J�d�I% �u�`$�\r��7�i���l.���IH��BrX�H� 	m��m�����R!�����I$�@$�鴓I$�ml�D%���R��\r���m&�\0�\0J\0I$�m$���\0M��PE��K� Id��$��$�i$�Mn�I%��orV$�	1��m&���\0H\0I$�m$�5�\0�i\0��H���0���ߦ�i%�i%�`$�[}&䤐)!&��L��`I%�I$�I$�%�\0�`�@�H����� ���ۦ�I%�m5�@6�[}/�$�9&�lL� I$�I$�I,�}a\0��(��\0H��m��m��h��n�Il�I4�I$�r5��$�IH��$ \0�I��I&�$�I}( �I���H�������h���I~��4�I��R%���Il�ۤ\0\0\0�\0I��I&�$�[$H\0�\nd��Y%��ʦ�m�I$�@$�I�I$�M�����[��2A0�l&ۀE��I$�l�ao��$ �`��%��ʮ�H��l��m�I$�m$�I\0��%b�%e0�$&���I$�l�I���\0	 6	�J@��l�m��l��$I$��|�@l�I�\"i�\0���[Y%��$�I$�$��M���A�I$��@��l�$�I$�I\0I$��l�@l�I&m6�����Ke�I$�I$�$����H	$�I$�\0��I6�H�l�IH�yl���g�}&�$���H�I$�S\0\0\0$�m&�%��m6�X@\0�@\0�\0R\r,�I6�H�l�Ml�Yl�_7&�\0}&�5����II0�S\0$�m&�%��m��X\0\0\0$� X\r�I�l�@}�R%\'�i�����\0o&�~�{Y&��[B\0H�$�I&�%��Ͷ��\0\0�I\0�\0����n����V%\'�k��m��}.�l�_�^|��(B�\0$�I&�%��m��! �I\0 �%?�}۵ k��bM4�Im�M$�_4��l�l�(\0�\0I$�I\"Im��m��i$I$�\0�$�}�$\0!��\0�I%�Id�I,�K$��$^|��$@I$�I\"Mo��\0}����-�I$ � M�m�l�,��m��%�$�I,��$�Il��l(LȦ\0\0I$�I����m����-�A$$� E���$�$�I$�I$�$�I$�Y%�I$���\0jH�\0I$�I��m��m����i0M���%��o� l�	��.�I��\0�[����@\0R\"JH@d�I&�o��Ͷ���I$E����%�IP6m�\0씉���%\'�I��m��K,��D\0R	2XX\0\0$�I&�o��m�ۤ�I$����K����lIe�	!�I$�Rl�I%�A%Il��R��Y!\0$�I�I���m��6�I$Ԓ���H[m�e��3�[m&�l�I$�A%��$�I�[��� $�I�I���m��6�m�\0l���\nl���I$�I@\0\0!�I$[$�l�k$�\"l�I$�� \0�m�I�\0��m�۴�m�l��l������H\0\0��I�_l�[&�{$�Ib�^�I%0�� 6\0�m�I}��m��6�m����% а9���mIm�@n��\0	&�ɵ��\nI�@&�md�\0�m�Mm��m��4�m����$H2H�)$�I%�$�@$I$\0	m��$�\0I\n�\04�m,�\0�m�I}��m�۷�m�v!0mm��IA�$�[l�[l�	m��%��m\"Ao\0	��m\"�Id�\0�I��$����۷�m6r�0m$��	H�I$�I$�Il�	,�H$��$�\'d�\"�m��Yd�\0�I��$��%�߷�\0��\0kv$h\n\'�A���Ih|�����%��A��$���5 Id�ɴ�\0\0\0I��$��\0o�۷���\0kv$ g�A���[k4�l��M�%��C��moɓ��% I$�K��\0\0\0I��4��\0��\0���MlM� �\0m��-��I$��lR%����l&�l�[ \0jRL�Kd�\0\0\0I$�L�[�\0�ߴ�M�M� �%&�%��!��$��\0@$�m��l&�H�[`\0�RL�Yd�\0\0I$�l�[����I\0D�`\n� ��I�[$�I\0�I$� I}��$����m���I$�$\0\0$�m�Mm����m\0���i2��@�I$��e��l�	 �Im���I��[m�\0��Ie�4\0\0$�m�I��ۤ�Dm�@�%$�$��%�{$��I�_�\"[�I4��i��ɴiF�	.�H\0\0\0�I��$�۴�d�m���f�\0��%�[$��I�[m��\"[$�I$��i��I�M�	&��@\0\0�I��$���	$�I\0&�%-�%&�\0\0e&�I\"I\0@Y(m �}��m&�}�\ZH�Yl�$�\0\0\0I$�$�I4I$�6\0$%$��\nIl�e��m�I�\0\rI } �m��m��m�H�Yd�$�\0\0\0I$�$�I��\0	H�\0H�\0��%\"@H�II�KX�I$��$�m��M&�m$�4����I,�\0\0\0I$�I�@\0D�\0-��lĠ��\"@H�[I�H�I$�I$�m��]&�$�$����I$�\0\0\0I$�I�@�@ �jId�$�\r&�I \0!�H��I&�I&RI$�I$�I��m �%��Y��H�\0\0\0I$�I \0�I\0�kId�[\0�-��I \0!0[l��I&�I&RI$�K$�I��m �%����X�\0\0\0I$�I \06I$���\0\"�!����&�1��|�SY$�H��I$��&RI��m l��I��I&�\0\0\0�I$��I��\0� !���&�!��l�WK$�HֻI%�FRY��m ;l��Y���&�\0\0\0�I$�~�{��\0�\0�I)?!�m��Y��%6��X��Y+[&�%��m�RK�[]$�m$�\0\0&�m���[m��\0�PI(\Z��m��ɾ�}5��H��I*[&�\'��m�RH�[Md�m$�\0\0&�m��o���\0��,�%$���\0 ��\0�% 	l��%�I%�B m�Im R��of����\0\0\0��m��m���\0��lԉ!,���H��\0��% �l��%�I$�\0\0l�Io$RH2�mn�o��\0\0\0��m���o��H�l�f�%�I \0%&%&�%�	HI$\0	$QY�H��o$�I��\0\0$�	%�����H��,��&�$�I \0$�%&�l�	\"M$`\rlAI�Hțol�ٴ��\0$�	%��m�����	�\0\'\'�&�%�KI&�l��HR�m%�m��&��&�I ,�I��$\0\0$�I%��}�����\0%d�\r&�m�KI.�l��Hrl�i4�m��$��$��\"Rd�I��&\0\0$�I%������) �Y,���IH�\0�H\"@$_\0��i�rZ�II ��$_�Md�m��&�\0�I4��o�\0�\0�\0�\0�M$\0[.�	�I��H�H\"@$[��i�RڒIHMi$[l\0Ge�}��$���I&��}��\0����\0[g�(�@\0�I&�$��$�m}��mf�m��\0�@BV�0@+��m��\0m%�� ��R���}���@Yg�(�PJ\0\0\0[$�[$��o��o&�m���R�VI @e|���m-�\0�\0��R~��m�\0�d��f��[M��m��l�m�i�t�n�����o��I$\0�#n�\0m���%��I��@���\0��d���&��M��Y��m����Io6�m��K���I&R\0\0�f�����%�XM&�DK�����0���I\"Rl\0\0l��%��I�Io��m���� \'\"Z��\Zen�m��}e�H\0\r$�D��\0�m��\0��Z�\0i�K$�|��$�I�Im��m��i�r�@��Wɰ\Zeg����m%�JH	6�@���� RK$�od�%6�l��I %��\0��Y��]$�4	X@I$�$\0;���\0}/�If�l�Ig��o��!&[Il�m$�2Il��H\0\0%����ɴ�O��,\rHPI$�$@�\0���&�I\'�l�M��\0\0\0\0\0\0\0\0\0\0\0 01@P!`A��\0?E�O\n$$uccb_�dq�r�P_�\Z\\Ҕ�\"�؄R�Z]RĆ)JQ1=ЈMXc��K�)K�R�����cf		b���2�e1<�0���B�R�Z]aF2\r��(��B!5l�iu�)sJR�X��k(^g/�c!5!5�\'�������\'��P���q�/�c!3XR�	�/�������\'�@����R�����(��J67�R�12�ZR���,\r���)J1��Ҕ�(��K�S��A�аZ_e)K�JR����m�f�)���Ҕ�)�±\"�4�)�4�Ҕ�(��K�P��Q/\Zlxu�2<ҏ��)��1�����HK�����b�xгcî����K����X�K�%�-)K�X�^4.�c,c)ulo4���	�	�	�&R���B�1��=���K�.��p�p�8R�(_ŏI�y��{����(���u�>	���~V=�1?J�Z_���`�a�12�-����҅�	�Ma7B��)ua�k�/�<�)r����a=(\\t�&a5��c���?ua��K�B��r��о���4�t!��{�^:\\����о�ǖc��^8N�����C��c��r~:����	��4���z�q�yB��R�^;�Z)ull��Ҕ�-ݐ�Kʄ!n�1�}A��B��[iull�/���ޔN�]P�Kʄ!n�1�}Hu�Z�D!v2B)x�F<��BYc�:�D ��1�(_-^5��B�c��^:Q�,{��X��΅�!e�c��gQ�B��?��hk0��O�XN\Z����/��B�o1ǯ��\0�l~!���fh|qk	�K���^6xB�o?��t;rQF�LOZ\\ѱc�҈D&a��	�C5����·nJ�1=ir�؄1�iD\"0�BY�ݏ����=0Κa5c�!8iu�?>[+��L3��MX��N\Z]i~[+�\'Q�q�K���˥�B�G��	�cl��ǹ��:_}/:�Z<W�B�ic�\r		p��a1�	΅�[�}�,�1��А�!fc����Z�e����X���p��Ɔ�\"�҉���B�\"�c�hB!>=(��1������<ґ��zP���/\Zbe(�!k���֫?a�8X�J�NXOJ����LL��-z��\'�kK������&��反���T-_C���q<�Z\\�7�)xa5},|l{�ꅫ�z;Y�<R�Va��z]�3	��B[��/�X���/f�Nط��0��n�!e��pLb�x<!n��c��K�Be�EpyB�+��xBݏ�tc��K�Be�D�yB�}�X�\0N���\'�cz�j�1��-1<�j���!}�ج�A�wbݱꅪ�R��D�ccЅ�X�{b���\\�P��V��(_E���+K��_�!h��CB	�/��6P��1�yB���Kʅ�R��T,�屼�|���B��1��K�)Kƅ�R��T,��(_thh����\\0�6<�s�f\"ŌB��C\\���B����Nt,�dX��_tc:���B��K�K�c�X�_uc:���]�c�\r/\r/���c.����l�y�>jK�iJ\\ү���l�y�>j�e�4�.Oߺ���nXMi}0�(\\�Y��Տ�h����֗�	΅�N8MX��s��9D/8!z����ǚ]��K�4w�0É��\\�nǭ.�}�y�ݏ4�\rD���X-�.iu�Cbb|��BY��B�ޔ�)JQ�B��3���d,�4�����< �3	�K�R�{�R�/��CXǋ�(Bγ	�����s�������{ixiuB)|�\\�}�X���e.isK�/��B��Bݏ(Yllc��]����)sK�]i_��B��Bݏ(Ylxu�0�`�е��֔����ix��e��Fl\Z��4�Ҕ�\Z_-/(�R�\0X�hh�ݡ�aNxL�xi|,|hC�_p�`��	�CZ������X�І=о�٥݌������iuc)~Z��(�������\\��\\m�K�K�з���(�!nǬd�c�X�P��\\h_d�?G�v=a5B�.V>T/z\Z��h�$,��:*]X��(YB�B���Ђ$,�?:*]X�_���!�T/����,����t/l\'�ziD/����<��Z]н��ZQ���c�K�~�B�~���?+yc#&P�1�D\'��t)qQBݏ�!s���c�,d&P�1�D\'�B;4����c��o	��ZR���B[�0��P��M/����c��o	��ZR���B[�0���ML|,|4�)K1�V<�j��Ǭ!	�(�1���\n!}d ���X�iJR��c�.�y��!!�XBzQc�v!����,�c	�d&��|��4�0�(Zҍ��C�F1����!5]�c��p����B֔BB���,�D!2�v<�eb��\'\r(�ʄB����z^��Y��he.�y���XN\ZQ��E/.���Q!!/��ʅ�Br�4Bf���!MXz�5c��e�=a8�r���%�(\'+CD&b!B�&�=P����2�����Dݏ�P���)JR�4��Q��LLc�oZQ1>!���\'�=P�>6?��Bx�?2R��.iFB)D.ZQ11�LOv��\\҉��\r\r�byc�c�c�?��\0\0\0\0\0\0\0\0\0\0\0 01@P!`A��\0?Jy[��{�)s��ݏ�K��� ���M(��W��GlPh�!�v?/�\".\Z\\�I���X���ԥ�c�����ByX�r�%K���)��!!��ǋ�)�\'�Ǻ�!B��%�B�!��B��B�!	��!5A��#��C���PO��t\"�XB�!7H��!BHH�!��R�!B�!5A��#��~��X!�w�D&R\Z\Z��!/\r(��K�.�yB���³11��]���BCC\\��!/\r(��K�.�yB��A�³�a��{iJQv.���J~���[�^\Z]iJ]��B�;��ebî����R�CCY�)yiD.���֔�ݏT/����Q|�<�f�!5��Be��f��,��\0���,y��!B�BY�!	�.�	�N4.�P���Zt΅�ᡮq���*�7�B��\'���C\\�-)K�loʄ.+�HMT/a���+Xc���CD\'&a8a2�!�Bяd!���lq��1E�=Џ��hh���\'&X�!y�Z=Ї�x��\ra�t-[)JR�ll�)D���&��c�	�L}Ѕ�x��\ra�t,ҍ���)J66R��b{�~kK�1?��1��B�Ƣx��q��F=Њ_n��^,>v?\n�?�I�l[��t/&[��xX�(C�dǍ�ZX�B��Bd�!L�	o	�JBy�wLO����+C�Z�L��!B		o	�JBy�wLLC�|���V��c)WJR��)K�)JR攥�)J&&1��by�)sJR�������^��_����c+)JR���ޔ�)sJR攥C�by�)sJR���������Gc�X�[�p�q������4�-�����~0ߢ��=�����!5c�!<m���_:7���w�~���.isJ67������!~=��.t\'�o��t;�E��Bޗ4���CYB�c�?�yB�:籝G�W�O�$-\Z\Z!B�!Ac�,b���y��S��ą�CD!B�!!E�B�1���b���ʄ1���X����O!	�O�.T!�V?�ǔ��\0�ބt?�.4/l\'<&�{����?CҎ��ƅ��Տv>��O:̅�Qp�oJ�B��)F��JR攥��e�f<!�/��zVd,:��z\\��)J67�R�4�//�,{1���|V�b��>-aB0�!B�!B����ǚ�!\r��^\"��!B�!B�!B��C\n�,ciD/��D��_Ӡ�OǪD&�Cǘ�Bf�	����BY/�K3��OǪ	��1���\'�������,_�x66vĸ���c�B쿂m��Nؗ��z�C	�����-b�.�ZҔ�(��K�B��!\nR�ll�)u�֍叼Ҕ�Ҕ�.�z�]��}xLL�)JR������.zR�ll�)J\\����X��)K�)JR�Ǫ��K�O�\nǺ������~��d!B		\r\r�BY�!L�4Behh�!5�ݏt/�}pV=е�ȅ���L�d&�����D��B��D!0�44B�Bv2�T/�XAvu��B����jǫǔ-P�w!�,{�_�	��cP�B}�E�t-���Q[JQc�JR�Є1匥�ǚ^Q�t-�:L{�k&&R�B�JR�C��R���	�CX�\\�y���B����ǔ,�b� ��xL>3�\Z�BjBC&x��NMRݏZ]/���1�(Y�D ��JBf�������Ԅ�<Ґ�\'&�v=h��}��mt,�6&&R��)u�?\nR�4�.iJR�)JR���.iJR�ZR�lo,�.��.�YllLO%.J]iJR�4�.iJ\\��)JR��e.iJR�ZR�lo,��y�.��\'�;CY�!Bx��� ��a�cce)B\r\r�BY���!3BjǺ�{�J_;�bB����\rf��<X�Ą�F1��B\r\r�BY�&��!	�BV=Є�JR���K��1���JR��c�.$/�ǻ-)J���_�1��!RL�攥)J\\�6R��)JR��bzK��,{�ꅖ10��F<X�I��0����YJR�LXll�)J\\��&\'���!K�=�\0O�P��!fc�h�|l��Q��,d&R� ��	�B��!	�M�L��DBBC	��yB����\\l��Q��,d!0��a��B$!M(�	�&��!B�BC	��yB��ɲGc���.�	��|��<c������cd��Qq�]fW���~xǵ叡����!f��)D2�(Z��R��/\n[�y��V,iB�금Y��(�R�Z]P�R���B�t/;\nŏ뼨XK�B�XL���^�_x�/��a.$!�a3BoK�^�_x�/�c�~���K���X�a<�|+�v<��r��X�a<�|+�}�?D��.�Z����K�2����������t;}��O��\r.��c��B)G�������t��Ӎ}�	�lo�4�Ҕ�l��b���Ƅ>�刋���\niu�)x��\0�h:��0�A�JR�ll�)sK������g�Lc)JR�LLa�\\��~��Z�.�}�A	�AK�R��B)J\\ҋ\r���射)GC)JR�LO�RxB�B���g�~E/\n�([�<��)K�)JB��!B$!$$Bf�!��c�c��~��R�k����!9�B0�!Bd�!��L�� ���z�jy����,{�oK�$&!n��isK�R�V2���4�B��c���;}g��.�Ǻ��hlBݡ���4�.�e)K�\\�p��1��z�����~q�f�q2���)JR�,z���JR����c�Ǭ���4����.iJR�4�c֗(^ZR���(���r��hh�!B�!L��B��!>\'���B+.Z\Z!B�!B+��&aO�	�A~L\'\Zΰ����!b���NXN6=жc�ﯕ��Y���\0xa!�B�5�	�8��Bُ[���kg�/ִ�p��)J\\�攥)~\r.�Z^7���������^|�)J\\�攥)~\r.���񾇭�f>V<e��u�HK4��ŘL�d\'!<���ҡ��1���������]y�.��f0�d\'\'������hk�c)~��\0(\0\0\0\0\0\0\0q0�\0 @P��1!`AQa�p���\0\0?K����s������^�c/*2\'�ݬ��;\'w���O�{�,�Z�Ũ|R*�7�Y��5��,��9bҜ?�h:��>p-\\ZQkM�;T�D��Qn\r����[�7�-UY��\0�ڻy�Z�-8�_29���\0�\0���C�t����K�_p4η�?��f�[]�K��f��kc�\0[���@�H��J-a������#�����Q�	g�k���[\'��r�@���/�_ť:1j>��t��-S��?���V4gG��v�Ps�������\0����\Z�3�ۈ3�Hƥ��\"���_?m�s�څ� ��c�;k��o��8���\0�8Y��R�j�\r�7���\0�E����k,Y/��\Z���;R����ܸ^���p���*��� �<4��\0�kn�I~���fî��_�*U�X��Q�R�-Ҝŧ9g��\0O�ũ�Z|�)??�������\0�7����y��g���\0ִ�U~�Ü���ũ���\"������\0���\ry|r?���\0�-7P�⟍����Q�شk!hW�\0�;u>}�r>~���A�YO���@���-G��<Z��7F����kw�M��>�J87\Z�<Gs�0�V}�=��\0�5��g��G�;�ȫ7��N���n�#��#y������;��_hg��_��g�O�\0�LJ�}ő�4���9n�(~N�v��`�O����Pʚ[���s�ɘ��g���֞���\0�����S\\W��Tl?�?������K���\n�͍�\0�QkW������C���\n���?������ҕ|��37�Ʈ9�\0���&�<l��I��t���S�<�;_�\0����@���Œ��yn�|~ސo��1}��E�	��~mî@�f�L�p�=n������Ex>~����L>�XyU��J0}�-rq^l�K9����*�Ȣ��s\rv�<R%<OJ�.�˵�L�<�Яxb����1�{��������@������R�U��Ry��-D������@����K�Z���4+�}>�G7����\0���G� �;�������\"�p�4e�e��W���%n��>�1�10Gx��.�r�M�1�\Z�v[�$x�M�/9�HZg<�s9N�y#�p_<K���qX��}hfyW�\0��úEM�:J�\0����󵿷~�1�4zq���\0�����x�1iY���\0J���W7�g�ԥ&�sM4������=�h�x����!����\0T� Kz/�E�\Zu���W�-h�Lg~\rd�ˣD8e��c�CA���\0u�t��xm�@`\0�bh�Lt~.i�2�QB���8rI�:����\05�-�-��t6ƾvA|[�N8�����Qa;!b�R������ߪ�cf���cN�xK�^���g$,B���\0\\�w����Ee&�p?*	��b�{.����\'51do��������4�ȵP�*Y�m<Hx���\\n�\r듯�I�cn<|����0-��`��[\0��n�?��\0�\0`f��\0�+�KOߝ���0�L?���w��ꯥo�vXD��u��|S��7y�m�º�-��5�7��`F��<��,�\n�\06�v����q������w�`�����e�%��_o r�ۿO�pݙBv�����z��ҘO��.t�㛯3�!�����aJ�Q�ta:���]�O���-O�8�Z�4��WE�T3ķ��\0{��������|e�x�����W8�c�	���x�u���X���\0�\0��oݴ�KyM~-�,��a����ŠZ�j��z��$S�����=Ƽa���R�@���lf|Oqn�6���\0������ncu������,������w~-�w��-�\r����c�\0���*����=��O�H����0��9�!���z���A�ɢ~��^��n�TM=\"M䧤�p�4����� ~��������ߖ���wÓԎ;�?7�o��>��ꣾ�/xDž��Qg�j��w�3��t��e�d��!�1|Q�{ϻ�߳\"��Z�����_�F��tشJ-#Wiuvc������;�h���?O���^Y.�&�׆���=\n!Wt���L���Ԑ�$E>Qr�J���d�\0:VMޱ���,������\0)枞G�o��|7Or@ݜ�m��l]�Y|�������uީ�c�t�-aߜ��u|��o�\r�m	��%]0f�7�5��k�i�&4�r;/z�,�]؈�7�)��\'���tB�r���?	����Z�}�����:�l�=[�}��G���2�[6���dn�\n�}���s��y!qc��K�\n?��k~F�\0�����ڠ�Y�֦1�u���iNY�w�I�8<\'���\0o��q�>�W���\0��oO��:w�����?��9MY\0�Tw�ӝk}��-�}^-g�z�p��o�H��p�Y��-յ����\r�uu�ZJ�������-�\Z�ʸ����{��5�\Zf��/����O,�P�槬����[{��Ќ�ߎ�= ��}D��[z�j���_\"�84<����\0���7Zf�\0�ɧ�W4�V�2���t�~����<���=]��l�r� Ԥ���m��4>��g$;�0����\0rj�Ӎ��p��z_]u����O��1�K�6��g������l%��b�|�p���Q�\0�/�@+�C{��#�\'K�G�8vqoӯI�\0kiM�8���bU�Ԣ�P�d�;]�Z�d^Q�koկ�����a�\0��O���L��������� (����G��	�Vs���L�\0;7^;�W��8v�6�Mm����~G���o�Whi���،���{�}0���Y\"�e`S~���\ryV>�H�<_��H���C]�yo�QG�����-<o��2�x����^�����_V\\����I�n�	��y�ذ�#ύ?�8:~��Xõ��~-W�_�����\0���;��:E���w���9�L&�\0\n��3ٺ����\0�\0{�\"ۧ�>�e��\Z���j�djE��#��|g-`Z˿�d;#y��l��GO�\"Wŭ�϶�{�\0���R��?��\0~�qV�\0�E��>�\Z�\'�\0ǆ��3�:����p�-���?<-e��a�S�,x����>v\'��<�<���P�m�%ݼG?�m�>7�>��½���Ŗ�\0�\rqk�����P7���٫љ�\0�\0|Z˨W��Z9�M��5������(�2���קe&\\�*yǶ\n��,?eC�o\"�}���C2D_ߣ��;�wk�ߏ����G��4r�h��-G��-��\0X��`�����z2-���ko�OI3���n����+�����4�,\0�>>����0�oK<\\w�� b�?�����g޷ѣ���\0�j��_ޞ�C2p-M��\0��p��ml�a4ϯ���\0֡q�nb�/�����U�\0��o/z�\0����\0�(�Lj<^�e���|/����s���v��)d�+�zL08�,�u��s�($-{oA��y��|ѳ���\Z�w{��/_]�Ð�k��;���b��;]�{\\�xWP{�զ�+�8�����t;�/�CO齇�j��N�kT��(��S����\0�%����~�e��i�\0�p�����0��\'R��U=���]��+�j��\0��4���p�H{�\0���n���Ƶ=F��K�?��\0d�b\Z�O�A�{>�:��5e9�o�}W%��\0:���y�������k��\Z�u�k��}u�|��3��`�kvۦV�#Z����R���GX���~4/�Y!�k�ӻk�K�z\n�|�o�o1�������l��b���\0$�~��_l�?N{���\01����&��s�gˉ��!��\njC��3�:����|�9�h6�hZ������fKze]q���%�#ݕ�w��ų�����y�o��������6�\n<@�s�W����j\r|�j���S��g�߇�j��~o��u���w��x�����A����z�\'����~�Yt���>��ɳ@y�ʹ�/z�i6s�\\����{�ƹ���Kw)�プ���\0�\0����G��\0�w�m洯�.57�1�\\C�A:O�\0,G����~��ɵ��Z�q��\n���%�@��lv�\Z��sva��\Zw�����&=t��Bp�.�q�v����»��㛵i���yϸ7�ϻ.�j_����^�-/[�:A�:v9���1�J�r�ȗ|&�댱���_v��)��m�u��W�ή�{����}�/�䥧֔�\0��S1R�r3���w����Q�����	b�-_�q��t/��:=��\Z�\0�\0��\0��\0��������Ц�~\n����N������7^nS��A�X�ϟ����b����D�O�����{�J��X_x�?�N��g�\0ߕ�fm��Ӿ�i���\\��$��\'h���v�ZX��O6�}��\07�}���\0\'�\0������N��-���K�P�c�����VX ���fI��.w��?I���-6��ν�\0wq��T;��	�����f�Ő���sY�y�v^3�f���i��p����D�v���s�;�|������\0����2#���v�&�r��C��z̞�lW�ر��^�\n��ئ��UJ����\0���B ��AwdD�ט�k�n��oC[*O���t1�\0?G�)d����^V�)εce�w��Tkn�{�OCh���u��v���Dn���B�3���9�y����Ts���\n�_\nÕ��q��ϫYz�����\0��I��7����x7�MDk�b7O�3u��V���q�\0|�-����h}�abv�\0O��r8\\�=>������F���	�o�*\n-��~i�UO+@�&~�*��Z*i���l�̱��#�ɚn��l�ۢ-�t=ւs�F�r���<��H����/Z����C�I�zǮ�Ʉ;߱5�������o�y�����	ϫ�Q�wx�+��-���f��Xmh���&ҷ����ڄ���s�����7��D�za[���ßö`��)�������[�o�]\r��.�\\��m��3���صjEF^s�BL�����a�̏����5�6��}35������3��f�߹��g�hޝ}�?�%�C[��wl|�W`v�����#2�V��n;�e�¿p�������-�$���?�Q�^�7�$[�e�O�;��|[s��5�����o��k��dǱ���v�W��._���}�C�\0�k�\0��W�������,^k��������ps�Ƣ��Q��������i��ϧ��s�������ߐ5���=�ic������U���u�\nu�;1�����������_>�\0���{���N��\0��74�;���E���ܮ4���~؇-�M�a�xbu��{;�\0HB�@��\"7I��|�+?SS���\r��ϻ�x.�?PG|��������\0@2��%��TfH����ך�\\�rS}� ɱ��T�٦�f�l�r\r���������GR�>�H8h%�}ƥ��܅�C[��XC���.�	�c=�܍\'g���[��#Kٯ�|� �:���77�v0��Ǡ�7��2�)\rW�<~����������f&��&�]z{��	�/T�|�0B\"m���Hw1��onb��c�n<^ �g���%��{�r�ȗn�J}y�����Y��Jk[xɉU-{��_o��0�b�Gl@ISI���r<|0߻8���m�\0%��X�?q��p�pP^t�>�}@wI��������`�|��]߇+�[C��L?�AU�:wq��o��,�]�M�WyKiTՊ긎瓚r&�?�\r�㘥%�a;�pI:�9�4S�Y}����;�QϥL�l\Zo��r<�\n���SǓ�+�m����f~������h�|]{�g��ྜྷ���/8��˭v�f���u�������U������^�����^-W�T�ſ��/����#[8��KEKg:{/Ƴ>=Ŧ-_����1�V���Z�Ư��Z��[���}��轟���87���k\Z���=��Iy�Mty��B����\\?�,����M���\']�/��|����^�8o�|���38������p�Z�������\0V{<!7��i��^�O��\0z?����ʡ[�7��ڂV�)+�{�����8xڔ�,Kr����L[*��M�s��T��\0t���+y��j�k{V�o�][Pϑ\Z��h����gmY�i��s��Of�Q������\0���H]-s\'�QF���\'��[��x���\r�l����r�@�@�~�\'W!�F ��U�x4�Chqޱ�bT��<J��D�������r�0,�$\0�5���MWnp���?���ԃ���ve��#\'��qEV;w�=\n&[��v����1��LF/#��K��xIc�e�\rNu��`�:R�\nh:5\07�P�|�^�Hqt�ǽi���;���Kv9��g?!�\\����I��7�=���2�aE�2Sj���\0h��?�_����{��v���T���\\\"\n���Ů\ra]/H���(֡\\o�\Z��K�=�!@\'�4��f�pv��t�\0�;���~��\\\\�N|��?j6����p��Bi�}&=֥���p�;�p����>j�+��`�����}�sc���~-y���v�~�m\rؿ۟cN�\0���Q|���\r�+�=�?�����k������c���}�jﺰ���/z��osޝ��\0�\0�����	�p�.�;��U�X��,\\iY�W�E���8�4}%:��?���=%�����Cͼ��x�\0\nh��G6?����ޱ�r��_����\0̓������1�GƵ���e�ů?�q�x������lB\"��SeaG٧w|?�e��]��{��>������c�׆��W����[q�5�G��\Z����{%1?5�OQ�7h���,T9_�-\'Q�Z��&����|bq��=�f�~�w������\'���kX.��V���C|Z��g{�u<�<.�o��3.��n�%?A����\r��}�{���x���IKm?Ň\\S85nx���l�6p�����>n��H���mCWռ/vz{�\0����Ey&y�\"ٙ4\Z�\r�����R��&a�\'��7q��m�/���\0��ϸ��|�\r�.R$p�0�I��0���)�p{�v��zQ�*���>����M��f����q���-�2~+>��5���L�����ڮ�p͇ï���5��k���#�Nr��߱�&?���Ō�їS����]�T��/���v�=��EL�?,2-�XO]�\r�ٔҍ�ܒ��.�Ɓ�A�t{_N�ͅ��̗�\Z��|bW��7q���s��mn9��3�Y�Ӫ_?�3�� U���\\��gp���8���G��N;�=���7ŵrb��Y�D|�/3�?�9OF#�E�=v�?����Hz���\0m\0��=gA��n�Js��~��h��E޽	�\0f��\0�V�r?�����>��o���u�����w�7F�|R:ps��`���5�\Z��SO{=�QӍ�!����u#�k�M�7��\0��q���Ŭ;��oW[t�Fi�M-\r�\0���\r�鬒����\0�v>M��^�����������}����4>��/�w��M�}y��P�//�8I�[��vV������?��¿��ܦ�O\"�\'��x��tܛ�x��@����b-�gO����2��<}��p�[�]�����O��]D���u��<��+O�<�8q8K O�:���[?u�0�B���O�ל���W�����E�᧸���_����&�\0�nX���wއ�LR��:\'���9�p	ix��������l���\\W�ĥC��Ճ@[��b��E-�.~_�ħgd�a��n�[��V[����>j��G��:���߮C������&��\0�\r��\'�y����j.K�z{E��a���|B������Џ$��W��\\�;�w�O��h�-^��`鱞���*l6�^m�\Z�h>Uy�c㝫3�C���d7e�^|��qh`t������f��\0�������\0��h�%�T�б��~���Sf|xSG�u�Z���\0��;?Z��\0�)�Dh��*����:��X��\0�z_�o^����\0~��n�}�xu��/���|��>��|j���?�bEm�>�0��a���&���k󙳩�����6�h��s��pإv;�[?Ny��s���7G���*�֨\\�����d/Hv����\0�w�QN�|�HV��4n\'[�A�ǯڷ�ϓ����W \Z;=����x7�+_�(I��tO9�[_���њm��|~?-�8n���\0����4��������H�Ωiϼ����\0���\0�\0�\0���/�oޓ��6AI�ys��\Z�{���V>�����o~����3yf��S{����\0ﻛ���\0g��f��#t�\0����l��)��_�?��H�ɏf���x0}��l�����>�t�E\Z�\0t��\0󇿰�������_����s����_�\0���cx7�Mj��~1Nq�r�^^��e��~xu�?�B����������_�;��>�&���\0�s����\0��ϵ���,N�f��n!���Gq��H�a�l����{U�7G�x7����\0��T�����c����?��|n7���]�gp���G��p�b���7�0.�%�^;m�\0�/�}�^7��pI��G݁h������X��{�k�@����a#L�?{��^�\0�?^�C�~���[ǆ��֯�O)���b�k���<]�I��� �P\r�\'������j�s~OGꂭ�󏴣�>9��]G�*�I�&�;OR�\n��?JG�X�я�M���L���\Z�]�o��\0�/nۜv�W�Vs��\r̃�\0|.��й۝0�Y�����wWnx��$o�=}�|�J���|E4!�˙�p���\'����D��YX�����Gy�[I�C$QCx��?�\\���X�J���~�	1�bϾB�Le����B���0���0�s8�S0Tf����Wyâ�C�dy��5���]�^ɉ<�@��u/�Tt�~�һ���}|��֋�s?\\���#�!���ï���c��\0���s�/�W�Q�,��\'�y��̽�!�Jw� ��u��}$����\"��yf��A01�x\"t�7FZf���GzF�P(���5��g�U�wS\'A�s@�W]����\n��o���Y�k�O+��������q�k�e*�R�1��%yt{⠚��Mo4��(潕��W�w�\Z9tz�Yw��n�����ݧ�Q/%��jj��\0�kofӻ`vQ������ݭ!/���_�������3 ��o�6(M���Jm\rgq��u4���\0���ݻF�8�� �| �n�m��?/�n�d�/�+�Ju�����M�)oo]��\n��[I<��Q�¿�uuc��5�|/��,��揾U��z��������\0�y��e\'��������\0����/O=�f�f��k��P��\0��b��؋�a��e��U��\\���o���\0��4�e|�B����a��V�����\0dQ�}��1�`h~ֻ�f��ÿu՟�����\0��v��f�mMm�y���u�����m�����#�ʿ���+3�܋ﻫ��x�Y��+и���\\}�3ϵ\0~��s����*Xa}�z�|N����h\"���BS�s�ض�����x�>>d���Wش8��\0����񺩒��.->cK���[7�?�l�\0�������B�>���=)�I���o�P��LV&;g��������>v(<�ֺ��l���\"���1O�$EUNg���ŭZ\0P���\0>p�\0h��\0o�����?�\0����yzS���j����fO\Z�;��^�?>|��h��̰��.8�syxR����\0���z��hJh��7�d�C�}7��q�ߤ~��?���ǅڲ�߆����Ӎ�\0?��xb\r�_��AC&�?�����m���3��7��������sY�`�=�7�4��\0Յ�g|`P����F�̜_z��~y�aK?Ĩ��G��>E,k�	c���oe�����{��o���o�����W(�����x��Zr��F�����6/6U��7���\0���^�7��������\0�����6[�\',��*�\0��y�����^e7�I�˰�f�d���\n���\0���߱_�)���O�\0����o��(��;���<�}�\0����pց}�Ǚ��~bB1����f�waϻ�o���[�����S������E��\0����\0����O���uA��\0��?�:��V�^���5�j}����\07W��Ṫ-0/��-(�\0���\0����t�\0�A��u����Wۨ:7��.ӿ���\0�l�����wI�Լ�P�7�����@��o8Ʒ}�ט�u�>?���l��_���}^����\0�����\0~d1��zQ1]_���?��<\'��+?��O���_��',1,0,NULL,NULL,NULL,NULL,'b7d2a5e4-5418-4562-8807-764d12ea4e23','jpeg'),(26,'',1,0,NULL,NULL,NULL,NULL,'','');
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
INSERT INTO `menus` VALUES (7,'Productos','/purchase/products',NULL,1),(8,'Proveedores','/prividers',NULL,1),(9,'Cotizaciones','/exchange',NULL,1),(10,'Nota de remisión','/remission-note',NULL,1),(11,'Nota de crédito','/credit-note',NULL,1),(12,'Nota de débito','/debit-note',NULL,1),(13,'Libro de compras','/purchase-book',NULL,1);
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
INSERT INTO `mod_menu` VALUES (1,'Compras','fa fa-shopping-cart'),(2,'Ventas','fa fa-credit-card'),(3,'Lógistica','fa fa-truck'),(4,'Mantenimiento','fa fa-gear'),(5,'Seguridad','fa fa-briefcase');
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
INSERT INTO `motivo` VALUES (1,'COMPRA',NULL,NULL,NULL,NULL),(2,'VENTA',NULL,NULL,NULL,NULL),(3,'DEVOLUCIÓN',NULL,NULL,NULL,NULL);
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
INSERT INTO `personas` VALUES (1,'Enrique','Rodríguez','','3996670',1,'1986-07-17',1,NULL,'enrirquev.rodriguez@gmail.com',NULL,1,NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `tip_documento` VALUES (1,'Cédula',NULL,NULL,NULL,NULL),(2,'RUC',NULL,NULL,NULL,NULL);
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
INSERT INTO `tip_personas` VALUES (1,'Persona Física',NULL,NULL,NULL,NULL,'PF'),(2,'Persona Jurídica',NULL,NULL,NULL,NULL,'PJ');
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

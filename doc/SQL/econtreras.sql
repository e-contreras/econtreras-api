-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: econtreras
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `label` varchar(45) NOT NULL,
  `tip_dato` varchar(45) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_barrios_ciudades1_idx` (`ciudad`),
  KEY `fk_barrios_usuarios1_idx` (`usu_alta`),
  KEY `fk_barrios_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_barrios_ciudades1` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrios_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_barrios_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barrios`
--

LOCK TABLES `barrios` WRITE;
/*!40000 ALTER TABLE `barrios` DISABLE KEYS */;
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
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
  `categoria_padre` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categorias_usuarios1_idx` (`usu_alta`),
  KEY `fk_categorias_usuarios2_idx` (`usu_modificacion`),
  KEY `fk_categorias_categoria_idx` (`categoria_padre`),
  CONSTRAINT `fk_categorias_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_categoria` FOREIGN KEY (`categoria_padre`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `cuotas`
--

DROP TABLE IF EXISTS `cuotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `cuotas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria_id` INT NULL,
  `productos_id` varchar(1000) NULL,
  `cuota` INT NULL,
  `ponderador` DECIMAL(5,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cuotas_categoria1_idx` (`categoria_id` ASC) INVISIBLE,
  CONSTRAINT `fk_cuotas_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas`
--

LOCK TABLES `cuotas` WRITE;
/*!40000 ALTER TABLE `cuotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
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
  `comentario` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
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
  `direccion` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
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
  `apartamento` varchar(45) DEFAULT NULL,
  `tipo_dir` varchar(45) DEFAULT NULL,
  `persona` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_direcciones_barrio1_idx` (`barrio`),
  KEY `fk_direcciones_persona1_idx` (`persona`),
  KEY `fk_direcciones_usuarios2_idx` (`usu_modificacion`),
  KEY `fk_direcciones_usuarios1_idx` (`usu_alta`),
  CONSTRAINT `fk_direcciones_barrio1` FOREIGN KEY (`barrio`) REFERENCES `barrios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_persona1` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_direcciones_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
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
  `motivo` text,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
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
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(45) NOT NULL,
  `order` int(11) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imagenes_usuarios1_idx` (`usu_alta`),
  KEY `fk_imagenes_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_imagenes_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imagenes_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
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
  `cant_operacion` int(11) NOT NULL DEFAULT '0',
  `pre_compra` double NOT NULL,
  `tip_operacion` char(3) NOT NULL,
  `fac_compra` int(11) DEFAULT NULL,
  `motivo` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_inventarios_depositos1_idx` (`deposito`),
  KEY `fk_inventarios_fac_compras1_idx` (`fac_compra`),
  KEY `fk_inventarios_motivo1_idx` (`motivo`),
  KEY `fk_inventarios_usuarios1_idx` (`usu_alta`),
  KEY `fk_inventarios_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_inventarios_depositos1` FOREIGN KEY (`deposito`) REFERENCES `depositos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_fac_compras1` FOREIGN KEY (`fac_compra`) REFERENCES `fac_compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_motivo1` FOREIGN KEY (`motivo`) REFERENCES `motivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventarios_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventarios`
--

LOCK TABLES `inventarios` WRITE;
/*!40000 ALTER TABLE `inventarios` DISABLE KEYS */;
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
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_marcas_usuarios1_idx` (`usu_alta`),
  KEY `fk_marcas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_marcas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_marcas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
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
  `codigo` VARCHAR(45) NOT NULL,
  `codigo_barra` VARCHAR(13) NULL,
  `nom_producto` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `marca` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mer_mar_idx` (`marca`),
  KEY `fk_mer_cat_idx` (`categoria`),
  KEY `fk_mercaderias_usuarios1_idx` (`usu_alta`),
  KEY `fk_mercaderias_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_mercaderias_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mercaderias_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_marca` FOREIGN KEY (`marca`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercaderias`
--

LOCK TABLES `mercaderias` WRITE;
/*!40000 ALTER TABLE `mercaderias` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercaderias` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo`
--

LOCK TABLES `motivo` WRITE;
/*!40000 ALTER TABLE `motivo` DISABLE KEYS */;
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
  `comentario` text,
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
  `email` varchar(200) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `tip_persona` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personas_tip_documento1_idx` (`tip_documento`),
  KEY `fk_personas_tip_personas1_idx` (`tip_persona`),
  KEY `fk_personas_usuarios1_idx` (`usu_alta`),
  KEY `fk_personas_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_personas_tip_documento1` FOREIGN KEY (`tip_documento`) REFERENCES `tip_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_tip_personas1` FOREIGN KEY (`tip_persona`) REFERENCES `tip_personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personas_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
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
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `usu_eliminacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  `fec_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientes_personas1_idx` (`persona`),
  KEY `fk_clientes_usuarios1_idx` (`usu_alta`),
  KEY `fk_clientes_usuarios2_idx` (`usu_modificacion`),
  KEY `fk_clientes_usuarios3_idx` (`usu_eliminacion`),
  CONSTRAINT `fk_clientes_personas1` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes_usuarios3` FOREIGN KEY (`usu_eliminacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
  `comentario` text,
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
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_roles_usuarios1_idx` (`usu_alta`),
  KEY `fk_roles_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_roles_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
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
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sol_pre_estados_usuarios1_idx` (`usu_alta`),
  KEY `fk_sol_pre_estados_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_sol_pre_estados_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_pre_estados_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_pre_estados`
--

LOCK TABLES `sol_pre_estados` WRITE;
/*!40000 ALTER TABLE `sol_pre_estados` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `fk_sol_presupuestos_sol_pre_estados1_idx` (`sol_pre_estado`),
  KEY `fk_sol_presupuestos_propuestas1_idx` (`pre_seleccionado`),
  KEY `fk_sol_presupuestos_usuarios1_idx` (`usu_alta`),
  KEY `fk_sol_presupuestos_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_sol_presupuestos_propuestas1` FOREIGN KEY (`pre_seleccionado`) REFERENCES `presupuestos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_sol_pre_estados1` FOREIGN KEY (`sol_pre_estado`) REFERENCES `sol_pre_estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sol_presupuestos_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sol_presupuestos`
--

LOCK TABLES `sol_presupuestos` WRITE;
/*!40000 ALTER TABLE `sol_presupuestos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timbrados`
--

LOCK TABLES `timbrados` WRITE;
/*!40000 ALTER TABLE `timbrados` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_documento`
--

LOCK TABLES `tip_documento` WRITE;
/*!40000 ALTER TABLE `tip_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tip_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_personas`
--

DROP TABLE IF EXISTS `tip_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `abreviacion` varchar(2) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
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
  `men_portadora` text,
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
  `activo` tinyint(4) DEFAULT '1',
  `persona` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_personas1_idx` (`persona`),
  KEY `fk_usuarios_roles1_idx` (`role`),
  KEY `fk_usuarios_usuarios1_idx` (`usu_alta`),
  KEY `fk_usuarios_usuarios2_idx` (`usu_modificacion`),
  CONSTRAINT `fk_usuarios_personas1` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_usuarios1` FOREIGN KEY (`usu_alta`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_usuarios2` FOREIGN KEY (`usu_modificacion`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculos`
--

DROP TABLE IF EXISTS `vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `anho` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `capacidad` varchar(45) NOT NULL,
  `num_documento` varchar(45) NOT NULL,
  `matricula` varchar(45) NOT NULL,
  `chassis` varchar(45) NOT NULL,
  `borrado` tinyint(4) NOT NULL DEFAULT '0',
  `usu_alta` int(11) DEFAULT NULL,
  `usu_modificacion` int(11) DEFAULT NULL,
  `fec_alta` datetime DEFAULT NULL,
  `fec_modificacion` datetime DEFAULT NULL,
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

-- Dump completed on 2019-08-19 10:17:31

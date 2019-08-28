-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: mbstoredb
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
-- Table structure for table `MB_BINDING`
--

DROP TABLE IF EXISTS `MB_BINDING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_BINDING` (
  `EXCHANGE_NAME` varchar(512) NOT NULL,
  `QUEUE_NAME` varchar(512) NOT NULL,
  `BINDING_DETAILS` varchar(2048) NOT NULL,
  KEY `EXCHANGE_NAME` (`EXCHANGE_NAME`),
  KEY `QUEUE_NAME` (`QUEUE_NAME`),
  CONSTRAINT `MB_BINDING_ibfk_1` FOREIGN KEY (`EXCHANGE_NAME`) REFERENCES `MB_EXCHANGE` (`EXCHANGE_NAME`),
  CONSTRAINT `MB_BINDING_ibfk_2` FOREIGN KEY (`QUEUE_NAME`) REFERENCES `MB_QUEUE` (`QUEUE_NAME`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_BINDING`
--

LOCK TABLES `MB_BINDING` WRITE;
/*!40000 ALTER TABLE `MB_BINDING` DISABLE KEYS */;
INSERT INTO `MB_BINDING` VALUES ('amq.dlc','deadletterchannel','boundMessageRouter=amq.dlc,boundQueueName=deadletterchannel,bindingKey=deadletterchannel'),('amq.topic','AMQP_Topic_throttledata_NODE:HOME/192.168.0.4','boundMessageRouter=amq.topic,boundQueueName=AMQP_Topic_throttledata_NODE:HOME/192.168.0.4,bindingKey=throttledata');
/*!40000 ALTER TABLE `MB_BINDING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_CLUSTER_EVENT`
--

DROP TABLE IF EXISTS `MB_CLUSTER_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_CLUSTER_EVENT` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORIGINATED_NODE_ID` varchar(512) NOT NULL,
  `DESTINED_NODE_ID` varchar(512) NOT NULL,
  `EVENT_ARTIFACT` varchar(25) NOT NULL,
  `EVENT_TYPE` varchar(25) NOT NULL,
  `EVENT_DETAILS` varchar(1024) NOT NULL,
  `EVENT_DESCRIPTION` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_CLUSTER_EVENT`
--

LOCK TABLES `MB_CLUSTER_EVENT` WRITE;
/*!40000 ALTER TABLE `MB_CLUSTER_EVENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_CLUSTER_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_CONTENT`
--

DROP TABLE IF EXISTS `MB_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_CONTENT` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `CONTENT_OFFSET` int(11) NOT NULL,
  `MESSAGE_CONTENT` varbinary(65500) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`CONTENT_OFFSET`),
  CONSTRAINT `MB_CONTENT_ibfk_1` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MB_METADATA` (`MESSAGE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_CONTENT`
--

LOCK TABLES `MB_CONTENT` WRITE;
/*!40000 ALTER TABLE `MB_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_COORDINATOR_HEARTBEAT`
--

DROP TABLE IF EXISTS `MB_COORDINATOR_HEARTBEAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_COORDINATOR_HEARTBEAT` (
  `ANCHOR` int(11) NOT NULL,
  `NODE_ID` varchar(512) NOT NULL,
  `LAST_HEARTBEAT` bigint(20) NOT NULL,
  `THRIFT_HOST` varchar(512) NOT NULL,
  `THRIFT_PORT` int(11) NOT NULL,
  PRIMARY KEY (`ANCHOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_COORDINATOR_HEARTBEAT`
--

LOCK TABLES `MB_COORDINATOR_HEARTBEAT` WRITE;
/*!40000 ALTER TABLE `MB_COORDINATOR_HEARTBEAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_COORDINATOR_HEARTBEAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DTX_DEQUEUE_CONTENT`
--

DROP TABLE IF EXISTS `MB_DTX_DEQUEUE_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DTX_DEQUEUE_CONTENT` (
  `INTERNAL_XID` bigint(20) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `CONTENT_OFFSET` int(11) NOT NULL,
  `MESSAGE_CONTENT` varbinary(65500) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`CONTENT_OFFSET`),
  CONSTRAINT `MB_DTX_DEQUEUE_CONTENT_ibfk_1` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MB_DTX_DEQUEUE_RECORD` (`MESSAGE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DTX_DEQUEUE_CONTENT`
--

LOCK TABLES `MB_DTX_DEQUEUE_CONTENT` WRITE;
/*!40000 ALTER TABLE `MB_DTX_DEQUEUE_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_DTX_DEQUEUE_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DTX_DEQUEUE_RECORD`
--

DROP TABLE IF EXISTS `MB_DTX_DEQUEUE_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DTX_DEQUEUE_RECORD` (
  `INTERNAL_XID` bigint(20) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `QUEUE_NAME` varchar(512) NOT NULL,
  `MESSAGE_METADATA` varbinary(65000) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `INTERNAL_XID` (`INTERNAL_XID`),
  CONSTRAINT `MB_DTX_DEQUEUE_RECORD_ibfk_1` FOREIGN KEY (`INTERNAL_XID`) REFERENCES `MB_DTX_XID` (`INTERNAL_XID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DTX_DEQUEUE_RECORD`
--

LOCK TABLES `MB_DTX_DEQUEUE_RECORD` WRITE;
/*!40000 ALTER TABLE `MB_DTX_DEQUEUE_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_DTX_DEQUEUE_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DTX_ENQUEUE_CONTENT`
--

DROP TABLE IF EXISTS `MB_DTX_ENQUEUE_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DTX_ENQUEUE_CONTENT` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `INTERNAL_XID` bigint(20) NOT NULL,
  `CONTENT_OFFSET` int(11) NOT NULL,
  `MESSAGE_CONTENT` varbinary(65500) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`CONTENT_OFFSET`),
  CONSTRAINT `MB_DTX_ENQUEUE_CONTENT_ibfk_1` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MB_DTX_ENQUEUE_RECORD` (`MESSAGE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DTX_ENQUEUE_CONTENT`
--

LOCK TABLES `MB_DTX_ENQUEUE_CONTENT` WRITE;
/*!40000 ALTER TABLE `MB_DTX_ENQUEUE_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_DTX_ENQUEUE_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DTX_ENQUEUE_RECORD`
--

DROP TABLE IF EXISTS `MB_DTX_ENQUEUE_RECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DTX_ENQUEUE_RECORD` (
  `INTERNAL_XID` bigint(20) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE_METADATA` varbinary(65000) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `INTERNAL_XID` (`INTERNAL_XID`),
  CONSTRAINT `MB_DTX_ENQUEUE_RECORD_ibfk_1` FOREIGN KEY (`INTERNAL_XID`) REFERENCES `MB_DTX_XID` (`INTERNAL_XID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DTX_ENQUEUE_RECORD`
--

LOCK TABLES `MB_DTX_ENQUEUE_RECORD` WRITE;
/*!40000 ALTER TABLE `MB_DTX_ENQUEUE_RECORD` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_DTX_ENQUEUE_RECORD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DTX_XID`
--

DROP TABLE IF EXISTS `MB_DTX_XID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DTX_XID` (
  `INTERNAL_XID` bigint(20) NOT NULL,
  `NODE_ID` varchar(512) NOT NULL,
  `FORMAT_CODE` bigint(20) NOT NULL,
  `GLOBAL_ID` varbinary(260) DEFAULT NULL,
  `BRANCH_ID` varbinary(260) DEFAULT NULL,
  PRIMARY KEY (`INTERNAL_XID`,`NODE_ID`),
  UNIQUE KEY `INTERNAL_XID` (`INTERNAL_XID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DTX_XID`
--

LOCK TABLES `MB_DTX_XID` WRITE;
/*!40000 ALTER TABLE `MB_DTX_XID` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_DTX_XID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_DURABLE_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `MB_DURABLE_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_DURABLE_SUBSCRIPTION` (
  `SUBSCRIPTION_ID` varchar(512) NOT NULL,
  `DESTINATION_IDENTIFIER` varchar(512) NOT NULL,
  `SUBSCRIPTION_DATA` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_DURABLE_SUBSCRIPTION`
--

LOCK TABLES `MB_DURABLE_SUBSCRIPTION` WRITE;
/*!40000 ALTER TABLE `MB_DURABLE_SUBSCRIPTION` DISABLE KEYS */;
INSERT INTO `MB_DURABLE_SUBSCRIPTION` VALUES ('NODE:HOME/192.168.0.4_throttledata_b687ed45-41fb-43bd-bfd5-fa2cf2f0fc3f','throttledata','subscriptionId=b687ed45-41fb-43bd-bfd5-fa2cf2f0fc3f,storageQueue=AMQP_Topic_throttledata_NODE:HOME/192.168.0.4,protocolType=AMQP,isActive=true,subscriberConnection=Y29ubmVjdGVkSVA9LzE5Mi4xNjguMC40OjY0MTcyLzEsY29ubmVjdGVkTm9kZT1OT0RFOkhPTUUvMTkyLjE2OC4wLjQscHJvdG9jb2xDaGFubmVsSUQ9MjZjYTRhMDUtZGFiNi00NWYyLTgwMWUtYjVmODI5MWI3OTQ1');
/*!40000 ALTER TABLE `MB_DURABLE_SUBSCRIPTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_EXCHANGE`
--

DROP TABLE IF EXISTS `MB_EXCHANGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_EXCHANGE` (
  `EXCHANGE_NAME` varchar(512) NOT NULL,
  `EXCHANGE_DATA` varchar(2048) NOT NULL,
  PRIMARY KEY (`EXCHANGE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_EXCHANGE`
--

LOCK TABLES `MB_EXCHANGE` WRITE;
/*!40000 ALTER TABLE `MB_EXCHANGE` DISABLE KEYS */;
INSERT INTO `MB_EXCHANGE` VALUES ('<<default>>','messageRouterName=<<default>>,type=direct,autoDelete=false'),('amq.direct','messageRouterName=amq.direct,type=direct,autoDelete=false'),('amq.dlc','messageRouterName=amq.dlc,type=DLC,autoDelete=false'),('amq.fanout','messageRouterName=amq.fanout,type=fanout,autoDelete=false'),('amq.match','messageRouterName=amq.match,type=headers,autoDelete=false'),('amq.topic','messageRouterName=amq.topic,type=topic,autoDelete=false'),('mqtt.topic','messageRouterName=mqtt.topic,type=topic,autoDelete=false'),('qpid.management','messageRouterName=qpid.management,type=management,autoDelete=false');
/*!40000 ALTER TABLE `MB_EXCHANGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_EXPIRATION_DATA`
--

DROP TABLE IF EXISTS `MB_EXPIRATION_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_EXPIRATION_DATA` (
  `MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EXPIRATION_TIME` bigint(20) DEFAULT NULL,
  `DLC_QUEUE_ID` int(11) NOT NULL,
  `MESSAGE_DESTINATION` varchar(512) NOT NULL,
  UNIQUE KEY `MESSAGE_ID` (`MESSAGE_ID`),
  CONSTRAINT `MB_EXPIRATION_DATA_ibfk_1` FOREIGN KEY (`MESSAGE_ID`) REFERENCES `MB_METADATA` (`MESSAGE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_EXPIRATION_DATA`
--

LOCK TABLES `MB_EXPIRATION_DATA` WRITE;
/*!40000 ALTER TABLE `MB_EXPIRATION_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_EXPIRATION_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_MEMBERSHIP`
--

DROP TABLE IF EXISTS `MB_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_MEMBERSHIP` (
  `EVENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NODE_ID` varchar(512) NOT NULL,
  `CHANGE_TYPE` tinyint(4) NOT NULL,
  `CHANGED_MEMBER_ID` varchar(512) NOT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_MEMBERSHIP`
--

LOCK TABLES `MB_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `MB_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_METADATA`
--

DROP TABLE IF EXISTS `MB_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_METADATA` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `QUEUE_ID` int(11) NOT NULL,
  `DLC_QUEUE_ID` int(11) NOT NULL,
  `MESSAGE_METADATA` varbinary(65500) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`QUEUE_ID`),
  KEY `MB_METADATA_QUEUE_ID_INDEX` (`QUEUE_ID`) USING HASH,
  CONSTRAINT `MB_METADATA_ibfk_1` FOREIGN KEY (`QUEUE_ID`) REFERENCES `MB_QUEUE_MAPPING` (`QUEUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_METADATA`
--

LOCK TABLES `MB_METADATA` WRITE;
/*!40000 ALTER TABLE `MB_METADATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_MSG_STORE_STATUS`
--

DROP TABLE IF EXISTS `MB_MSG_STORE_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_MSG_STORE_STATUS` (
  `NODE_ID` varchar(512) NOT NULL,
  `TIME_STAMP` bigint(20) NOT NULL,
  PRIMARY KEY (`NODE_ID`,`TIME_STAMP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_MSG_STORE_STATUS`
--

LOCK TABLES `MB_MSG_STORE_STATUS` WRITE;
/*!40000 ALTER TABLE `MB_MSG_STORE_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_MSG_STORE_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_NODE`
--

DROP TABLE IF EXISTS `MB_NODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_NODE` (
  `NODE_ID` varchar(512) NOT NULL,
  `NODE_DATA` varchar(2048) NOT NULL,
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_NODE`
--

LOCK TABLES `MB_NODE` WRITE;
/*!40000 ALTER TABLE `MB_NODE` DISABLE KEYS */;
INSERT INTO `MB_NODE` VALUES ('NODE:HOME/192.168.0.4','192.168.0.4');
/*!40000 ALTER TABLE `MB_NODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_NODE_HEARTBEAT`
--

DROP TABLE IF EXISTS `MB_NODE_HEARTBEAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_NODE_HEARTBEAT` (
  `NODE_ID` varchar(512) NOT NULL,
  `LAST_HEARTBEAT` bigint(20) NOT NULL,
  `IS_NEW_NODE` tinyint(4) NOT NULL,
  `CLUSTER_AGENT_HOST` varchar(512) NOT NULL,
  `CLUSTER_AGENT_PORT` int(11) NOT NULL,
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_NODE_HEARTBEAT`
--

LOCK TABLES `MB_NODE_HEARTBEAT` WRITE;
/*!40000 ALTER TABLE `MB_NODE_HEARTBEAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_NODE_HEARTBEAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_NODE_TO_LAST_PUBLISHED_ID`
--

DROP TABLE IF EXISTS `MB_NODE_TO_LAST_PUBLISHED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_NODE_TO_LAST_PUBLISHED_ID` (
  `NODE_ID` varchar(512) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`NODE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_NODE_TO_LAST_PUBLISHED_ID`
--

LOCK TABLES `MB_NODE_TO_LAST_PUBLISHED_ID` WRITE;
/*!40000 ALTER TABLE `MB_NODE_TO_LAST_PUBLISHED_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_NODE_TO_LAST_PUBLISHED_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_QUEUE`
--

DROP TABLE IF EXISTS `MB_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_QUEUE` (
  `QUEUE_NAME` varchar(512) NOT NULL,
  `QUEUE_DATA` varchar(2048) NOT NULL,
  PRIMARY KEY (`QUEUE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_QUEUE`
--

LOCK TABLES `MB_QUEUE` WRITE;
/*!40000 ALTER TABLE `MB_QUEUE` DISABLE KEYS */;
INSERT INTO `MB_QUEUE` VALUES ('AMQP_Topic_throttledata_NODE:HOME/192.168.0.4','queueName=AMQP_Topic_throttledata_NODE:HOME/192.168.0.4,queueOwner=clientid,isExclusive=true,isDurable=false,isShared=false,lastPurgedTimestamp=0'),('deadletterchannel','queueName=deadletterchannel,queueOwner=admin,isExclusive=false,isDurable=true,isShared=false,lastPurgedTimestamp=0');
/*!40000 ALTER TABLE `MB_QUEUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_QUEUE_COUNTER`
--

DROP TABLE IF EXISTS `MB_QUEUE_COUNTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_QUEUE_COUNTER` (
  `QUEUE_NAME` varchar(512) NOT NULL,
  `MESSAGE_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`QUEUE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_QUEUE_COUNTER`
--

LOCK TABLES `MB_QUEUE_COUNTER` WRITE;
/*!40000 ALTER TABLE `MB_QUEUE_COUNTER` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_QUEUE_COUNTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_QUEUE_MAPPING`
--

DROP TABLE IF EXISTS `MB_QUEUE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_QUEUE_MAPPING` (
  `QUEUE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `QUEUE_NAME` varchar(512) NOT NULL,
  PRIMARY KEY (`QUEUE_ID`,`QUEUE_NAME`),
  UNIQUE KEY `QUEUE_NAME` (`QUEUE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_QUEUE_MAPPING`
--

LOCK TABLES `MB_QUEUE_MAPPING` WRITE;
/*!40000 ALTER TABLE `MB_QUEUE_MAPPING` DISABLE KEYS */;
INSERT INTO `MB_QUEUE_MAPPING` VALUES (2,'AMQP_Topic_throttledata_NODE:HOME/192.168.0.4'),(1,'deadletterchannel');
/*!40000 ALTER TABLE `MB_QUEUE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_QUEUE_TO_LAST_ASSIGNED_ID`
--

DROP TABLE IF EXISTS `MB_QUEUE_TO_LAST_ASSIGNED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_QUEUE_TO_LAST_ASSIGNED_ID` (
  `QUEUE_NAME` varchar(512) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`QUEUE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_QUEUE_TO_LAST_ASSIGNED_ID`
--

LOCK TABLES `MB_QUEUE_TO_LAST_ASSIGNED_ID` WRITE;
/*!40000 ALTER TABLE `MB_QUEUE_TO_LAST_ASSIGNED_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_QUEUE_TO_LAST_ASSIGNED_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_RETAINED_CONTENT`
--

DROP TABLE IF EXISTS `MB_RETAINED_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_RETAINED_CONTENT` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `CONTENT_OFFSET` int(11) NOT NULL,
  `MESSAGE_CONTENT` varbinary(65500) NOT NULL,
  PRIMARY KEY (`MESSAGE_ID`,`CONTENT_OFFSET`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_RETAINED_CONTENT`
--

LOCK TABLES `MB_RETAINED_CONTENT` WRITE;
/*!40000 ALTER TABLE `MB_RETAINED_CONTENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_RETAINED_CONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_RETAINED_METADATA`
--

DROP TABLE IF EXISTS `MB_RETAINED_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_RETAINED_METADATA` (
  `TOPIC_ID` int(11) NOT NULL,
  `TOPIC_NAME` varchar(512) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE_METADATA` varbinary(65000) NOT NULL,
  PRIMARY KEY (`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_RETAINED_METADATA`
--

LOCK TABLES `MB_RETAINED_METADATA` WRITE;
/*!40000 ALTER TABLE `MB_RETAINED_METADATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_RETAINED_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_SLOT`
--

DROP TABLE IF EXISTS `MB_SLOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_SLOT` (
  `SLOT_ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `START_MESSAGE_ID` bigint(20) NOT NULL,
  `END_MESSAGE_ID` bigint(20) NOT NULL,
  `STORAGE_QUEUE_NAME` varchar(512) NOT NULL,
  `SLOT_STATE` tinyint(4) NOT NULL DEFAULT '1',
  `ASSIGNED_NODE_ID` varchar(512) DEFAULT NULL,
  `ASSIGNED_QUEUE_NAME` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SLOT_ID`),
  KEY `MB_SLOT_MESSAGE_ID_INDEX` (`START_MESSAGE_ID`,`END_MESSAGE_ID`) USING HASH,
  KEY `MB_SLOT_QUEUE_INDEX` (`STORAGE_QUEUE_NAME`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_SLOT`
--

LOCK TABLES `MB_SLOT` WRITE;
/*!40000 ALTER TABLE `MB_SLOT` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_SLOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MB_SLOT_MESSAGE_ID`
--

DROP TABLE IF EXISTS `MB_SLOT_MESSAGE_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MB_SLOT_MESSAGE_ID` (
  `QUEUE_NAME` varchar(512) NOT NULL,
  `MESSAGE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`QUEUE_NAME`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MB_SLOT_MESSAGE_ID`
--

LOCK TABLES `MB_SLOT_MESSAGE_ID` WRITE;
/*!40000 ALTER TABLE `MB_SLOT_MESSAGE_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `MB_SLOT_MESSAGE_ID` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 22:12:38

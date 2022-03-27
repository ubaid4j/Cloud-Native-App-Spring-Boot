-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('004e64bd-476f-4d1b-8a07-31c73c5b7a61',NULL,NULL,'3cn','b10d63d1-d31a-4e98-9a3d-04aced20449b',1,20,_binary '','03be32ef-1892-45d4-a946-a4f4555a1cf6',NULL),('00aa60e6-fcdb-40f4-b5f4-9c58cfdcefd1',NULL,'conditional-user-configured','3cn','84cc39e9-faef-4dc3-8935-2b9f6e255d18',0,10,_binary '\0',NULL,NULL),('06f35f6a-7604-4a84-8826-b1f00f85ebe2',NULL,'auth-spnego','master','6a82e595-ffe6-4ef7-9343-2aaa2a2939a8',3,30,_binary '\0',NULL,NULL),('08347ea5-3d05-4773-8260-f3815a6e6ceb',NULL,'conditional-user-configured','3cn','6cee5bdf-d2a3-426f-9e38-a1328edf9b92',0,10,_binary '\0',NULL,NULL),('098e4cdd-d6d7-4ee5-859b-103b4d3bb8f7',NULL,'reset-credentials-choose-user','3cn','76e11101-ed82-458e-9b3d-e6e972f00233',0,10,_binary '\0',NULL,NULL),('0dc35edd-9058-4848-95f4-21ce4bef4a7c',NULL,'registration-password-action','3cn','75b8f21f-f338-469a-a2ba-e433a7fb5c76',0,50,_binary '\0',NULL,NULL),('0ebeb6a7-2f53-4598-b93f-5d532360b9fd',NULL,'no-cookie-redirect','master','ec04e31c-b3a6-4ed7-a210-1c615f7a5a4e',0,10,_binary '\0',NULL,NULL),('1052509d-f837-4102-b35e-c53a8ac78b0f',NULL,'client-jwt','3cn','3b390c68-fbf8-49a1-ba51-7ae3925a0c8a',2,20,_binary '\0',NULL,NULL),('120a0fcc-0339-41c0-b914-a159224585f4',NULL,'direct-grant-validate-password','master','3d040609-3df9-477c-92e1-e9a801e1e4df',0,20,_binary '\0',NULL,NULL),('1d557303-398a-4882-8214-06055eb51043',NULL,'idp-username-password-form','3cn','d8fbe49d-6c28-4b2c-a221-d97a3fe5b75e',0,10,_binary '\0',NULL,NULL),('20da3611-cf58-4dcc-a2ab-44a2d9f77d95',NULL,'reset-otp','master','14f64110-b429-49eb-b1a9-bb41f413eed2',0,20,_binary '\0',NULL,NULL),('222841ef-ab27-47c4-b42a-1f7b2cf8af31',NULL,'docker-http-basic-authenticator','3cn','bead1f76-c9b9-4f2a-b064-1eb04839af81',0,10,_binary '\0',NULL,NULL),('24f46c0b-7170-495f-a104-5c8aed5d4fad',NULL,'auth-otp-form','3cn','84cc39e9-faef-4dc3-8935-2b9f6e255d18',0,20,_binary '\0',NULL,NULL),('294d53ab-ac8c-4d9d-aa62-d3ab4fd2873c',NULL,'http-basic-authenticator','3cn','8996ba25-93ad-4281-8b5a-97e9159a7c9a',0,10,_binary '\0',NULL,NULL),('2a96bf31-7a3b-48c3-bda2-4e7bb37a1903',NULL,'registration-user-creation','master','4ad1b3cd-3efb-4d8d-9008-0d21980f80f5',0,20,_binary '\0',NULL,NULL),('33ac98ea-9a3a-4686-92d4-42d5ebbdb4b4',NULL,NULL,'3cn','da47ec3a-3f39-4469-aacb-4e60dd56b241',0,20,_binary '','f5ad5f6c-f710-4421-9326-f7e863a91383',NULL),('361715db-a7a7-44a8-8650-7c07fb3e420b',NULL,'client-jwt','master','f29906e9-a9e6-4304-aa84-3a6c3551ca92',2,20,_binary '\0',NULL,NULL),('37ae069c-6df5-482f-a600-e4f388fa91bc',NULL,'auth-spnego','3cn','a298dd3e-80bf-457c-9bb3-8d07cfe091e4',3,30,_binary '\0',NULL,NULL),('424de518-3d8a-4b85-b8b1-59cc721498ee',NULL,NULL,'master','60345a1d-aea8-4f75-a5ed-e084aec84a80',1,20,_binary '','6d202a33-119b-4b98-8ef1-231e4456b98e',NULL),('456fb706-0d7b-4447-8266-4ee0c43203f3',NULL,NULL,'3cn','56c79313-9f92-4764-8d14-74d872ef165c',1,30,_binary '','6cee5bdf-d2a3-426f-9e38-a1328edf9b92',NULL),('49d8e589-94f1-44a2-a438-e0a76d7f9a3e',NULL,'basic-auth','master','6a82e595-ffe6-4ef7-9343-2aaa2a2939a8',0,10,_binary '\0',NULL,NULL),('4a3a0b87-8f1e-4f37-807b-41755d10d089',NULL,'client-secret','3cn','3b390c68-fbf8-49a1-ba51-7ae3925a0c8a',2,10,_binary '\0',NULL,NULL),('4ce1d8e7-f729-4992-864c-142fc828f95a',NULL,'direct-grant-validate-otp','master','7056c5a1-02cc-4f02-bd43-2fed5d2fa470',0,20,_binary '\0',NULL,NULL),('51233088-2f0c-4693-8c66-58bf8efb3d3a',NULL,'registration-page-form','master','8df84880-4b5f-4d31-b924-6eb017ce592b',0,10,_binary '','4ad1b3cd-3efb-4d8d-9008-0d21980f80f5',NULL),('5ce4ef5a-70d3-4fa4-bbfc-c14df58ced79',NULL,NULL,'3cn','b507cf59-e4a8-4bb5-b461-c466198f9f6b',0,20,_binary '','a298dd3e-80bf-457c-9bb3-8d07cfe091e4',NULL),('5d081b43-911f-42c3-b46c-d42b35f3b412',NULL,'auth-cookie','master','38ddfa78-709d-4374-96d2-aa355b0288f3',2,10,_binary '\0',NULL,NULL),('5ddc614e-c720-4a52-a9df-7b7707252393',NULL,NULL,'master','3d040609-3df9-477c-92e1-e9a801e1e4df',1,30,_binary '','7056c5a1-02cc-4f02-bd43-2fed5d2fa470',NULL),('5e82a52c-d1ef-4027-a135-d862fa5ddf2d',NULL,'registration-recaptcha-action','master','4ad1b3cd-3efb-4d8d-9008-0d21980f80f5',3,60,_binary '\0',NULL,NULL),('602fd66b-02d3-4a6e-87a7-32d74e817e9f',NULL,'auth-username-password-form','3cn','b10d63d1-d31a-4e98-9a3d-04aced20449b',0,10,_binary '\0',NULL,NULL),('66a79ec7-9ee4-4c74-bc3b-fef342b9c739',NULL,'basic-auth','3cn','a298dd3e-80bf-457c-9bb3-8d07cfe091e4',0,10,_binary '\0',NULL,NULL),('6aa9904a-fcc3-49b3-a922-e64a08dc7fbc',NULL,NULL,'3cn','51d97ceb-f3ef-4372-8430-3c3ae1800163',0,20,_binary '','0aa56ea6-54fa-4df5-8466-a6dcffff10d7',NULL),('6ec38181-9845-4281-b9df-3d1159e1e2ea',NULL,'no-cookie-redirect','3cn','b507cf59-e4a8-4bb5-b461-c466198f9f6b',0,10,_binary '\0',NULL,NULL),('6f10c263-ef94-4015-87e1-3ab2307796ce',NULL,'conditional-user-configured','3cn','03be32ef-1892-45d4-a946-a4f4555a1cf6',0,10,_binary '\0',NULL,NULL),('71ca8e74-f023-4681-bb7a-fa2932bbb692',NULL,'reset-password','master','017dd622-d9b9-4a39-8082-52711aab9659',0,30,_binary '\0',NULL,NULL),('72a15c5a-ec67-45ff-b487-282ccf83ea50',NULL,'idp-username-password-form','master','60345a1d-aea8-4f75-a5ed-e084aec84a80',0,10,_binary '\0',NULL,NULL),('72de22a5-1a22-4e2f-98d8-ff740c6b1d22',NULL,'conditional-user-configured','master','14f64110-b429-49eb-b1a9-bb41f413eed2',0,10,_binary '\0',NULL,NULL),('75bab74d-12ea-43ee-a658-6f6a371e045e',NULL,'idp-email-verification','3cn','f5ad5f6c-f710-4421-9326-f7e863a91383',2,10,_binary '\0',NULL,NULL),('76e70393-ab02-4ae7-8225-d3d19690d83c',NULL,NULL,'master','017dd622-d9b9-4a39-8082-52711aab9659',1,40,_binary '','14f64110-b429-49eb-b1a9-bb41f413eed2',NULL),('784da2ea-2d0a-4476-8d14-0fb57650e9fe',NULL,NULL,'3cn','0aa56ea6-54fa-4df5-8466-a6dcffff10d7',2,20,_binary '','da47ec3a-3f39-4469-aacb-4e60dd56b241',NULL),('79d3c6e0-a3cf-4d80-bd2c-6fe9ff91a3d3',NULL,'idp-review-profile','master','404c9b24-7dd3-4ffa-aaea-02579b897f5e',0,10,_binary '\0',NULL,'e4e2564c-9631-441a-b8cf-3825a1b5f0d3'),('7e69a48f-b850-4e9b-97c5-bcba8d1c0748',NULL,'conditional-user-configured','master','bc391229-7137-4b49-862e-8f68ecb779b1',0,10,_binary '\0',NULL,NULL),('814358bf-fd72-4527-a485-520e82a0f007',NULL,'identity-provider-redirector','3cn','a10c6893-003e-41f8-81ac-c83af3f2e62c',2,25,_binary '\0',NULL,NULL),('816f5e7f-b055-4869-84cd-3d271d21cbef',NULL,'client-x509','3cn','3b390c68-fbf8-49a1-ba51-7ae3925a0c8a',2,40,_binary '\0',NULL,NULL),('85a99908-248b-4e75-b227-c9b5fb475564',NULL,'idp-create-user-if-unique','3cn','0aa56ea6-54fa-4df5-8466-a6dcffff10d7',2,10,_binary '\0',NULL,'e5b828c8-69a5-46db-b1bc-f9f8574c7ac6'),('888a7e01-50fc-4ccd-822f-ce9bc7657264',NULL,'client-x509','master','f29906e9-a9e6-4304-aa84-3a6c3551ca92',2,40,_binary '\0',NULL,NULL),('8bfb7227-d45f-4035-8e02-d9045aaeab9e',NULL,NULL,'master','404c9b24-7dd3-4ffa-aaea-02579b897f5e',0,20,_binary '','ea425f58-0bbe-4f5f-a354-61dcf12adc92',NULL),('8ca88150-734b-4d3a-b732-58d3ed9477d5',NULL,'auth-cookie','3cn','a10c6893-003e-41f8-81ac-c83af3f2e62c',2,10,_binary '\0',NULL,NULL),('90fcbc38-4e75-47a1-8345-72d5a7da428e',NULL,'direct-grant-validate-username','3cn','56c79313-9f92-4764-8d14-74d872ef165c',0,10,_binary '\0',NULL,NULL),('9136c8ef-17b2-4d0b-abd3-08618c0f67e5',NULL,'reset-password','3cn','76e11101-ed82-458e-9b3d-e6e972f00233',0,30,_binary '\0',NULL,NULL),('9696d828-43f6-48c1-9aa6-84985509fee3',NULL,NULL,'3cn','f5ad5f6c-f710-4421-9326-f7e863a91383',2,20,_binary '','d8fbe49d-6c28-4b2c-a221-d97a3fe5b75e',NULL),('990dd17b-a545-413e-813b-c17768b80355',NULL,'reset-credential-email','master','017dd622-d9b9-4a39-8082-52711aab9659',0,20,_binary '\0',NULL,NULL),('9ba0e7a5-270a-4e2c-bb78-3953802bcc47',NULL,'http-basic-authenticator','master','74a3dd40-c4a5-49e8-b242-45612364a98e',0,10,_binary '\0',NULL,NULL),('9ccd1d04-a249-4b33-b93c-79358f693131',NULL,'direct-grant-validate-password','3cn','56c79313-9f92-4764-8d14-74d872ef165c',0,20,_binary '\0',NULL,NULL),('9ccd769a-d3aa-4b9c-b301-475d451b894e',NULL,NULL,'master','89296b7d-6017-42e1-8e0c-dcb42db8cbb1',2,20,_binary '','60345a1d-aea8-4f75-a5ed-e084aec84a80',NULL),('9d072b9a-f0bb-492a-8378-d82940508dac',NULL,'registration-user-creation','3cn','75b8f21f-f338-469a-a2ba-e433a7fb5c76',0,20,_binary '\0',NULL,NULL),('9d2a19ca-2237-408f-b541-6b17945f699a',NULL,'auth-otp-form','master','6d202a33-119b-4b98-8ef1-231e4456b98e',0,20,_binary '\0',NULL,NULL),('9f21c9e9-3dc7-4d23-ac12-a06af115b801',NULL,'idp-create-user-if-unique','master','ea425f58-0bbe-4f5f-a354-61dcf12adc92',2,10,_binary '\0',NULL,'715443ca-aef8-4d5b-afd9-7bb84242ad8a'),('9f7ff52e-e2d0-4cf1-94f4-a22b01dfa990',NULL,'idp-confirm-link','3cn','da47ec3a-3f39-4469-aacb-4e60dd56b241',0,10,_binary '\0',NULL,NULL),('a03269ce-8788-44fa-83f1-0e491b7a196d',NULL,'client-secret-jwt','master','f29906e9-a9e6-4304-aa84-3a6c3551ca92',2,30,_binary '\0',NULL,NULL),('a041b8a5-3ddd-49e8-9804-ce08173c9fdc',NULL,NULL,'master','38ddfa78-709d-4374-96d2-aa355b0288f3',2,30,_binary '','9fb0f4c3-61d7-4337-8255-714ec272d989',NULL),('a101e6a1-88ce-4951-af7e-e26e91679377',NULL,'registration-profile-action','master','4ad1b3cd-3efb-4d8d-9008-0d21980f80f5',0,40,_binary '\0',NULL,NULL),('a11a4a43-7a84-46c0-915d-da4439cefaf8',NULL,'conditional-user-configured','3cn','6fd0592f-6181-4b02-b0ee-89fc3ce262fb',0,10,_binary '\0',NULL,NULL),('a23ab730-6bc1-4366-882f-654e4e0ef386',NULL,'basic-auth-otp','master','6a82e595-ffe6-4ef7-9343-2aaa2a2939a8',3,20,_binary '\0',NULL,NULL),('a339344d-e339-4acd-914a-15b4c7f9e9b4',NULL,NULL,'master','ea425f58-0bbe-4f5f-a354-61dcf12adc92',2,20,_binary '','35e4a0a6-c6c1-4864-8b62-4e40b27f5693',NULL),('a49775b5-f365-4e2f-8425-781196072ecd',NULL,'registration-password-action','master','4ad1b3cd-3efb-4d8d-9008-0d21980f80f5',0,50,_binary '\0',NULL,NULL),('a657e81d-7e0f-4f9f-afba-ec4da92bbf91',NULL,'direct-grant-validate-otp','3cn','6cee5bdf-d2a3-426f-9e38-a1328edf9b92',0,20,_binary '\0',NULL,NULL),('a985e68c-a92e-406f-b0fa-0a212137ef01',NULL,NULL,'3cn','76e11101-ed82-458e-9b3d-e6e972f00233',1,40,_binary '','6fd0592f-6181-4b02-b0ee-89fc3ce262fb',NULL),('ac36c404-25eb-46ca-9e5d-319af3891765',NULL,'auth-otp-form','master','bc391229-7137-4b49-862e-8f68ecb779b1',0,20,_binary '\0',NULL,NULL),('ac71c334-4863-4c58-a0dc-2754fc9f60ba',NULL,'idp-email-verification','master','89296b7d-6017-42e1-8e0c-dcb42db8cbb1',2,10,_binary '\0',NULL,NULL),('ac71eb5b-dd9c-4b55-9079-772fd5ac2353',NULL,'conditional-user-configured','master','7056c5a1-02cc-4f02-bd43-2fed5d2fa470',0,10,_binary '\0',NULL,NULL),('b1a41e5a-d943-4d9a-99b3-a456e8fea4a3',NULL,'auth-otp-form','3cn','03be32ef-1892-45d4-a946-a4f4555a1cf6',0,20,_binary '\0',NULL,NULL),('ba769eb3-ff47-4adb-87df-290a986ba1b7',NULL,'reset-credential-email','3cn','76e11101-ed82-458e-9b3d-e6e972f00233',0,20,_binary '\0',NULL,NULL),('c155266a-a0df-4b6a-81b2-1e8f8361710c',NULL,'identity-provider-redirector','master','38ddfa78-709d-4374-96d2-aa355b0288f3',2,25,_binary '\0',NULL,NULL),('c2354995-8ebf-4741-b1f8-c4fc188a935d',NULL,'direct-grant-validate-username','master','3d040609-3df9-477c-92e1-e9a801e1e4df',0,10,_binary '\0',NULL,NULL),('c7568e03-f5a8-46d7-8696-ac77e21d82aa',NULL,'idp-review-profile','3cn','51d97ceb-f3ef-4372-8430-3c3ae1800163',0,10,_binary '\0',NULL,'c8777b61-ef95-4d84-b7ce-e57b0907edbb'),('c9c22e7b-d3cc-417f-81ec-3a3aae25de61',NULL,'auth-username-password-form','master','9fb0f4c3-61d7-4337-8255-714ec272d989',0,10,_binary '\0',NULL,NULL),('cbea7b06-3ec0-4aea-95c6-9cb8c29e8803',NULL,'client-secret-jwt','3cn','3b390c68-fbf8-49a1-ba51-7ae3925a0c8a',2,30,_binary '\0',NULL,NULL),('d3240be7-b1e7-4e39-b1c8-e1fccba01017',NULL,'registration-page-form','3cn','2bcd1185-aac0-4b8e-83c3-a03468e4b8ce',0,10,_binary '','75b8f21f-f338-469a-a2ba-e433a7fb5c76',NULL),('d37dd2dd-1f2a-47cd-b008-5e080c58aa9b',NULL,'basic-auth-otp','3cn','a298dd3e-80bf-457c-9bb3-8d07cfe091e4',3,20,_binary '\0',NULL,NULL),('d44f9504-8f4b-44a3-a5ab-8ed4233ff6b8',NULL,NULL,'master','9fb0f4c3-61d7-4337-8255-714ec272d989',1,20,_binary '','bc391229-7137-4b49-862e-8f68ecb779b1',NULL),('d61bca8e-c357-4811-ae0a-5947da82fa63',NULL,NULL,'master','35e4a0a6-c6c1-4864-8b62-4e40b27f5693',0,20,_binary '','89296b7d-6017-42e1-8e0c-dcb42db8cbb1',NULL),('dbdafb0f-0b21-4858-886d-69ec69dc4ac8',NULL,NULL,'master','ec04e31c-b3a6-4ed7-a210-1c615f7a5a4e',0,20,_binary '','6a82e595-ffe6-4ef7-9343-2aaa2a2939a8',NULL),('e7724177-34a3-4575-84d6-ebdb349af768',NULL,'auth-spnego','master','38ddfa78-709d-4374-96d2-aa355b0288f3',3,20,_binary '\0',NULL,NULL),('e7fbc975-a4a9-46ed-801b-4c9f7e062ea2',NULL,'reset-otp','3cn','6fd0592f-6181-4b02-b0ee-89fc3ce262fb',0,20,_binary '\0',NULL,NULL),('e9f61cab-1cad-40e2-8f58-2460bd024481',NULL,'registration-profile-action','3cn','75b8f21f-f338-469a-a2ba-e433a7fb5c76',0,40,_binary '\0',NULL,NULL),('ea90f2d5-ed16-4a6d-a828-c9fb92820abe',NULL,'registration-recaptcha-action','3cn','75b8f21f-f338-469a-a2ba-e433a7fb5c76',3,60,_binary '\0',NULL,NULL),('ec973600-5d1d-4e48-ab04-fe24270e1a05',NULL,'client-secret','master','f29906e9-a9e6-4304-aa84-3a6c3551ca92',2,10,_binary '\0',NULL,NULL),('efd0d514-bacf-4091-8533-29e030868924',NULL,'reset-credentials-choose-user','master','017dd622-d9b9-4a39-8082-52711aab9659',0,10,_binary '\0',NULL,NULL),('f0a7886c-7fc6-455e-ad2a-f1cf0e1ace57',NULL,'docker-http-basic-authenticator','master','b97ebf53-4bb2-496d-a573-b5f10f217a06',0,10,_binary '\0',NULL,NULL),('f4a16bb2-6d25-412d-bd8f-5d1e58ec238e',NULL,'auth-spnego','3cn','a10c6893-003e-41f8-81ac-c83af3f2e62c',3,20,_binary '\0',NULL,NULL),('f642694c-5a83-4257-a466-9c50d30e602b',NULL,NULL,'3cn','d8fbe49d-6c28-4b2c-a221-d97a3fe5b75e',1,20,_binary '','84cc39e9-faef-4dc3-8935-2b9f6e255d18',NULL),('f79c21c8-822c-45bd-8deb-cfd209949627',NULL,'conditional-user-configured','master','6d202a33-119b-4b98-8ef1-231e4456b98e',0,10,_binary '\0',NULL,NULL),('fbb6f6de-42ff-4883-8046-f80f4eed43cf',NULL,NULL,'3cn','a10c6893-003e-41f8-81ac-c83af3f2e62c',2,30,_binary '','b10d63d1-d31a-4e98-9a3d-04aced20449b',NULL),('fd8d6d9f-ece0-4f08-84cd-63fdc012afd0',NULL,'idp-confirm-link','master','35e4a0a6-c6c1-4864-8b62-4e40b27f5693',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('017dd622-d9b9-4a39-8082-52711aab9659','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('03be32ef-1892-45d4-a946-a4f4555a1cf6','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','3cn','basic-flow',_binary '\0',_binary ''),('0aa56ea6-54fa-4df5-8466-a6dcffff10d7','User creation or linking','Flow for the existing/non-existing user alternatives','3cn','basic-flow',_binary '\0',_binary ''),('14f64110-b429-49eb-b1a9-bb41f413eed2','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('2bcd1185-aac0-4b8e-83c3-a03468e4b8ce','registration','registration flow','3cn','basic-flow',_binary '',_binary ''),('35e4a0a6-c6c1-4864-8b62-4e40b27f5693','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('38ddfa78-709d-4374-96d2-aa355b0288f3','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('3b390c68-fbf8-49a1-ba51-7ae3925a0c8a','clients','Base authentication for clients','3cn','client-flow',_binary '',_binary ''),('3d040609-3df9-477c-92e1-e9a801e1e4df','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('404c9b24-7dd3-4ffa-aaea-02579b897f5e','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('4ad1b3cd-3efb-4d8d-9008-0d21980f80f5','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('51d97ceb-f3ef-4372-8430-3c3ae1800163','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','3cn','basic-flow',_binary '',_binary ''),('56c79313-9f92-4764-8d14-74d872ef165c','direct grant','OpenID Connect Resource Owner Grant','3cn','basic-flow',_binary '',_binary ''),('60345a1d-aea8-4f75-a5ed-e084aec84a80','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('6a82e595-ffe6-4ef7-9343-2aaa2a2939a8','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('6cee5bdf-d2a3-426f-9e38-a1328edf9b92','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','3cn','basic-flow',_binary '\0',_binary ''),('6d202a33-119b-4b98-8ef1-231e4456b98e','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('6fd0592f-6181-4b02-b0ee-89fc3ce262fb','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','3cn','basic-flow',_binary '\0',_binary ''),('7056c5a1-02cc-4f02-bd43-2fed5d2fa470','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('74a3dd40-c4a5-49e8-b242-45612364a98e','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('75b8f21f-f338-469a-a2ba-e433a7fb5c76','registration form','registration form','3cn','form-flow',_binary '\0',_binary ''),('76e11101-ed82-458e-9b3d-e6e972f00233','reset credentials','Reset credentials for a user if they forgot their password or something','3cn','basic-flow',_binary '',_binary ''),('84cc39e9-faef-4dc3-8935-2b9f6e255d18','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','3cn','basic-flow',_binary '\0',_binary ''),('89296b7d-6017-42e1-8e0c-dcb42db8cbb1','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('8996ba25-93ad-4281-8b5a-97e9159a7c9a','saml ecp','SAML ECP Profile Authentication Flow','3cn','basic-flow',_binary '',_binary ''),('8df84880-4b5f-4d31-b924-6eb017ce592b','registration','registration flow','master','basic-flow',_binary '',_binary ''),('9fb0f4c3-61d7-4337-8255-714ec272d989','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('a10c6893-003e-41f8-81ac-c83af3f2e62c','browser','browser based authentication','3cn','basic-flow',_binary '',_binary ''),('a298dd3e-80bf-457c-9bb3-8d07cfe091e4','Authentication Options','Authentication options.','3cn','basic-flow',_binary '\0',_binary ''),('b10d63d1-d31a-4e98-9a3d-04aced20449b','forms','Username, password, otp and other auth forms.','3cn','basic-flow',_binary '\0',_binary ''),('b507cf59-e4a8-4bb5-b461-c466198f9f6b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','3cn','basic-flow',_binary '',_binary ''),('b97ebf53-4bb2-496d-a573-b5f10f217a06','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('bc391229-7137-4b49-862e-8f68ecb779b1','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('bead1f76-c9b9-4f2a-b064-1eb04839af81','docker auth','Used by Docker clients to authenticate against the IDP','3cn','basic-flow',_binary '',_binary ''),('d8fbe49d-6c28-4b2c-a221-d97a3fe5b75e','Verify Existing Account by Re-authentication','Reauthentication of existing account','3cn','basic-flow',_binary '\0',_binary ''),('da47ec3a-3f39-4469-aacb-4e60dd56b241','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','3cn','basic-flow',_binary '\0',_binary ''),('ea425f58-0bbe-4f5f-a354-61dcf12adc92','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('ec04e31c-b3a6-4ed7-a210-1c615f7a5a4e','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('f29906e9-a9e6-4304-aa84-3a6c3551ca92','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('f5ad5f6c-f710-4421-9326-f7e863a91383','Account verification options','Method with which to verity the existing account','3cn','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('715443ca-aef8-4d5b-afd9-7bb84242ad8a','create unique user config','master'),('c8777b61-ef95-4d84-b7ce-e57b0907edbb','review profile config','3cn'),('e4e2564c-9631-441a-b8cf-3825a1b5f0d3','review profile config','master'),('e5b828c8-69a5-46db-b1bc-f9f8574c7ac6','create unique user config','3cn');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('715443ca-aef8-4d5b-afd9-7bb84242ad8a','false','require.password.update.after.registration'),('c8777b61-ef95-4d84-b7ce-e57b0907edbb','missing','update.profile.on.first.login'),('e4e2564c-9631-441a-b8cf-3825a1b5f0d3','missing','update.profile.on.first.login'),('e5b828c8-69a5-46db-b1bc-f9f8574c7ac6','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0412850b-a82b-41d4-9d16-cde8dca986cb',_binary '',_binary '','currency-conversion-service',0,_binary '\0','2dd68144-cb84-40d4-81d0-abc7a16773e4',NULL,_binary '',NULL,_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('32d6ecc1-dce1-4f93-8468-116b1036eb18',_binary '',_binary '','3cn-react-client',0,_binary '',NULL,NULL,_binary '\0','http://localhost:3000/Cloud-Native-App-Spring-Boot',_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('6b5baf7a-62fe-437f-aeac-7667067c19bd',_binary '',_binary '\0','broker',0,_binary '\0','e330ef16-7225-4879-b507-cbcd9f390d1a',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '',_binary '\0','realm-management',0,_binary '\0','858d16eb-db10-4d44-b0cb-e57145ed53a1',NULL,_binary '',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8d353a43-3d10-4f50-88ca-bee88761dfad',_binary '',_binary '','math-service',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '',_binary '\0','account',0,_binary '\0','231eb6f7-88bf-41fd-b020-a882b64aceda','/realms/3cn/account/',_binary '\0',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '',_binary '\0','account',0,_binary '\0','770281e4-444d-4a99-81c9-c9515655abc4','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c',_binary '',_binary '\0','security-admin-console',0,_binary '','30d4d707-65ef-46d6-87cd-0423a77a3c8d','/admin/3cn/console/',_binary '\0',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('af826a63-d50c-4b7a-a874-5a7802540a5f',_binary '',_binary '','3cn-gateway',0,_binary '\0','2c083f51-9651-408e-b617-f9bfd1f6f154',NULL,_binary '','http://localhost:8755',_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0','3CN Gateway',_binary '\0','client-secret','http://localhost:8755','API gateway for 3CN App',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('b24692d0-670c-46eb-a750-0bfd1a8347df',_binary '',_binary '','currency-exchange-service',0,_binary '\0','43f38b35-0057-4236-b64e-40995ce7c56d',NULL,_binary '',NULL,_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('be914ae1-ef0a-4431-a14b-3bc079eafa9c',_binary '',_binary '\0','broker',0,_binary '\0','385f8365-2db3-4720-b00f-1c3d758f278e',NULL,_binary '\0',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('beefee6a-c0aa-483f-adb0-4ff539316123',_binary '',_binary '','admin-cli',0,_binary '\0','934a5224-0aa0-4c5c-82be-bc5c254353f7',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e',_binary '',_binary '\0','account-console',0,_binary '','56e22934-5c49-4387-aa31-6a44bd0c9709','/realms/3cn/account/',_binary '\0',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6',_binary '',_binary '\0','security-admin-console',0,_binary '','1865989a-8ef8-4d8f-8571-f7d39c629074','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe',_binary '',_binary '','country-service',0,_binary '\0','651251c8-733e-4362-b969-ebd1702dd12b',NULL,_binary '','http://localhost:8300',_binary '\0','3cn','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','http://localhost:8300',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('c873005c-073d-4001-a974-9c4239394e4f',_binary '',_binary '\0','account-console',0,_binary '','78677d92-9275-4b8a-9813-0f9fbe63c5f0','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '',_binary '','3cn-realm',0,_binary '\0','973d0af8-c02e-44de-8813-6082407651f7',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','3cn Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '',_binary '','master-realm',0,_binary '\0','192ed207-bcb9-476b-9a09-e4a32f00eac7',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66',_binary '',_binary '\0','admin-cli',0,_binary '','c51c4668-b912-4f11-b321-317bd05df6da',NULL,_binary '\0',NULL,_binary '\0','3cn','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0412850b-a82b-41d4-9d16-cde8dca986cb','false','display.on.consent.screen'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','exclude.session.state.from.auth.response'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml_force_name_id_format'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.assertion.signature'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.authnstatement'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.client.signature'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.encrypt'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.force.post.binding'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.multivalued.roles'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.onetimeuse.condition'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.server.signature'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','saml.server.signature.keyinfo.ext'),('0412850b-a82b-41d4-9d16-cde8dca986cb','false','tls.client.certificate.bound.access.tokens'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','backchannel.logout.revoke.offline.tokens'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','backchannel.logout.session.required'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','client_credentials.use_refresh_token'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','display.on.consent.screen'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','exclude.session.state.from.auth.response'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','id.token.as.detached.signature'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','oauth2.device.authorization.grant.enabled'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','oidc.ciba.grant.enabled'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml_force_name_id_format'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.artifact.binding'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.assertion.signature'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.authnstatement'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.client.signature'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.encrypt'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.force.post.binding'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.multivalued.roles'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.onetimeuse.condition'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.server.signature'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','saml.server.signature.keyinfo.ext'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','false','tls.client.certificate.bound.access.tokens'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','true','use.refresh.tokens'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','backchannel.logout.revoke.offline.tokens'),('8d353a43-3d10-4f50-88ca-bee88761dfad','true','backchannel.logout.session.required'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','client_credentials.use_refresh_token'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','display.on.consent.screen'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','exclude.session.state.from.auth.response'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','id.token.as.detached.signature'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','oauth2.device.authorization.grant.enabled'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','oidc.ciba.grant.enabled'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','require.pushed.authorization.requests'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml_force_name_id_format'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.artifact.binding'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.assertion.signature'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.authnstatement'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.client.signature'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.encrypt'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.force.post.binding'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.multivalued.roles'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.onetimeuse.condition'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.server.signature'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','saml.server.signature.keyinfo.ext'),('8d353a43-3d10-4f50-88ca-bee88761dfad','false','tls.client.certificate.bound.access.tokens'),('8d353a43-3d10-4f50-88ca-bee88761dfad','true','use.refresh.tokens'),('9f88fbec-48a5-4727-b982-9f89a767695c','S256','pkce.code.challenge.method'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','display.on.consent.screen'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','exclude.session.state.from.auth.response'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml_force_name_id_format'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.assertion.signature'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.authnstatement'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.client.signature'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.encrypt'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.force.post.binding'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.multivalued.roles'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.onetimeuse.condition'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.server.signature'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','saml.server.signature.keyinfo.ext'),('af826a63-d50c-4b7a-a874-5a7802540a5f','false','tls.client.certificate.bound.access.tokens'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','display.on.consent.screen'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','exclude.session.state.from.auth.response'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml_force_name_id_format'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.assertion.signature'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.authnstatement'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.client.signature'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.encrypt'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.force.post.binding'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.multivalued.roles'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.onetimeuse.condition'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.server.signature'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','saml.server.signature.keyinfo.ext'),('b24692d0-670c-46eb-a750-0bfd1a8347df','false','tls.client.certificate.bound.access.tokens'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','display.on.consent.screen'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','exclude.session.state.from.auth.response'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml_force_name_id_format'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.assertion.signature'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.authnstatement'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.client.signature'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.encrypt'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.force.post.binding'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.multivalued.roles'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.onetimeuse.condition'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.server.signature'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','saml.server.signature.keyinfo.ext'),('beefee6a-c0aa-483f-adb0-4ff539316123','false','tls.client.certificate.bound.access.tokens'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','S256','pkce.code.challenge.method'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','S256','pkce.code.challenge.method'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','display.on.consent.screen'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','exclude.session.state.from.auth.response'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml_force_name_id_format'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.assertion.signature'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.authnstatement'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.client.signature'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.encrypt'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.force.post.binding'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.multivalued.roles'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.onetimeuse.condition'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.server.signature'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','saml.server.signature.keyinfo.ext'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','false','tls.client.certificate.bound.access.tokens'),('c873005c-073d-4001-a974-9c4239394e4f','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('1e881d87-458c-4e94-93c1-9505f67dac5d','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('2baeaeae-e659-40d0-99e3-6d56c2de998e','countries','3cn','get all countries','openid-connect'),('4b964dfb-ce0c-444d-9cb9-1eb0defb9609','exchange-rate','3cn',NULL,'openid-connect'),('4e5ff3d0-0849-46a4-a802-b77223cd5c9d','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('59528658-a4c0-4f18-979e-a9ee62b0cfc0','offline_access','3cn','OpenID Connect built-in scope: offline_access','openid-connect'),('6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7','address','3cn','OpenID Connect built-in scope: address','openid-connect'),('6ffaa2c9-278f-415b-a749-551e2eebe59c','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('7e5f67df-bef2-4cf6-8899-80839b49a5b3','email','master','OpenID Connect built-in scope: email','openid-connect'),('7f9142b7-477f-4e99-84f6-d1944b1fe744','math','3cn',NULL,'openid-connect'),('87bd3632-b9fb-44d8-b302-b36e2666255d','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('8a4ff979-2657-44a0-aa62-b64cd22e2b0d','role_list','master','SAML role list','saml'),('8c1a121b-80da-4c78-809e-36b9b1638dc6','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('91bbca3d-fa45-481b-bfbf-9ee283a20a9d','currency-conversion','3cn',NULL,'openid-connect'),('a4b97441-2b8c-4799-8fdf-fe7939937759','role_list','3cn','SAML role list','saml'),('ac5a320d-4eec-4c5b-ae3b-05d9d97736b2','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('b790ff1d-4469-439b-831d-9577e34f1243','phone','3cn','OpenID Connect built-in scope: phone','openid-connect'),('c693558b-ee57-4409-b7de-74d83a04f1ac','profile','3cn','OpenID Connect built-in scope: profile','openid-connect'),('d4ff9d6a-7c44-4ec7-a200-d131798908ac','roles','3cn','OpenID Connect scope for add user roles to the access token','openid-connect'),('dec02384-d720-4c3d-b863-ff014b6bb477','web-origins','3cn','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('e18fcfb8-a559-41f9-b2a6-ec258d81058b','address','master','OpenID Connect built-in scope: address','openid-connect'),('eafa98ba-e395-4481-8765-1ac0753498f0','microprofile-jwt','3cn','Microprofile - JWT built-in scope','openid-connect'),('f0b2abcb-ef69-41cc-b3b8-0f0e96744954','email','3cn','OpenID Connect built-in scope: email','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('1e881d87-458c-4e94-93c1-9505f67dac5d','${rolesScopeConsentText}','consent.screen.text'),('1e881d87-458c-4e94-93c1-9505f67dac5d','true','display.on.consent.screen'),('1e881d87-458c-4e94-93c1-9505f67dac5d','false','include.in.token.scope'),('2baeaeae-e659-40d0-99e3-6d56c2de998e','true','display.on.consent.screen'),('2baeaeae-e659-40d0-99e3-6d56c2de998e','true','include.in.token.scope'),('4b964dfb-ce0c-444d-9cb9-1eb0defb9609','true','display.on.consent.screen'),('4b964dfb-ce0c-444d-9cb9-1eb0defb9609','true','include.in.token.scope'),('4e5ff3d0-0849-46a4-a802-b77223cd5c9d','${offlineAccessScopeConsentText}','consent.screen.text'),('4e5ff3d0-0849-46a4-a802-b77223cd5c9d','true','display.on.consent.screen'),('59528658-a4c0-4f18-979e-a9ee62b0cfc0','${offlineAccessScopeConsentText}','consent.screen.text'),('59528658-a4c0-4f18-979e-a9ee62b0cfc0','true','display.on.consent.screen'),('6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7','${addressScopeConsentText}','consent.screen.text'),('6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7','true','display.on.consent.screen'),('6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7','true','include.in.token.scope'),('6ffaa2c9-278f-415b-a749-551e2eebe59c','','consent.screen.text'),('6ffaa2c9-278f-415b-a749-551e2eebe59c','false','display.on.consent.screen'),('6ffaa2c9-278f-415b-a749-551e2eebe59c','false','include.in.token.scope'),('7e5f67df-bef2-4cf6-8899-80839b49a5b3','${emailScopeConsentText}','consent.screen.text'),('7e5f67df-bef2-4cf6-8899-80839b49a5b3','true','display.on.consent.screen'),('7e5f67df-bef2-4cf6-8899-80839b49a5b3','true','include.in.token.scope'),('7f9142b7-477f-4e99-84f6-d1944b1fe744','true','display.on.consent.screen'),('7f9142b7-477f-4e99-84f6-d1944b1fe744','true','include.in.token.scope'),('87bd3632-b9fb-44d8-b302-b36e2666255d','${phoneScopeConsentText}','consent.screen.text'),('87bd3632-b9fb-44d8-b302-b36e2666255d','true','display.on.consent.screen'),('87bd3632-b9fb-44d8-b302-b36e2666255d','true','include.in.token.scope'),('8a4ff979-2657-44a0-aa62-b64cd22e2b0d','${samlRoleListScopeConsentText}','consent.screen.text'),('8a4ff979-2657-44a0-aa62-b64cd22e2b0d','true','display.on.consent.screen'),('8c1a121b-80da-4c78-809e-36b9b1638dc6','${profileScopeConsentText}','consent.screen.text'),('8c1a121b-80da-4c78-809e-36b9b1638dc6','true','display.on.consent.screen'),('8c1a121b-80da-4c78-809e-36b9b1638dc6','true','include.in.token.scope'),('91bbca3d-fa45-481b-bfbf-9ee283a20a9d','true','display.on.consent.screen'),('91bbca3d-fa45-481b-bfbf-9ee283a20a9d','true','include.in.token.scope'),('a4b97441-2b8c-4799-8fdf-fe7939937759','${samlRoleListScopeConsentText}','consent.screen.text'),('a4b97441-2b8c-4799-8fdf-fe7939937759','true','display.on.consent.screen'),('ac5a320d-4eec-4c5b-ae3b-05d9d97736b2','false','display.on.consent.screen'),('ac5a320d-4eec-4c5b-ae3b-05d9d97736b2','true','include.in.token.scope'),('b790ff1d-4469-439b-831d-9577e34f1243','${phoneScopeConsentText}','consent.screen.text'),('b790ff1d-4469-439b-831d-9577e34f1243','true','display.on.consent.screen'),('b790ff1d-4469-439b-831d-9577e34f1243','true','include.in.token.scope'),('c693558b-ee57-4409-b7de-74d83a04f1ac','${profileScopeConsentText}','consent.screen.text'),('c693558b-ee57-4409-b7de-74d83a04f1ac','true','display.on.consent.screen'),('c693558b-ee57-4409-b7de-74d83a04f1ac','true','include.in.token.scope'),('d4ff9d6a-7c44-4ec7-a200-d131798908ac','${rolesScopeConsentText}','consent.screen.text'),('d4ff9d6a-7c44-4ec7-a200-d131798908ac','true','display.on.consent.screen'),('d4ff9d6a-7c44-4ec7-a200-d131798908ac','false','include.in.token.scope'),('dec02384-d720-4c3d-b863-ff014b6bb477','','consent.screen.text'),('dec02384-d720-4c3d-b863-ff014b6bb477','false','display.on.consent.screen'),('dec02384-d720-4c3d-b863-ff014b6bb477','false','include.in.token.scope'),('e18fcfb8-a559-41f9-b2a6-ec258d81058b','${addressScopeConsentText}','consent.screen.text'),('e18fcfb8-a559-41f9-b2a6-ec258d81058b','true','display.on.consent.screen'),('e18fcfb8-a559-41f9-b2a6-ec258d81058b','true','include.in.token.scope'),('eafa98ba-e395-4481-8765-1ac0753498f0','false','display.on.consent.screen'),('eafa98ba-e395-4481-8765-1ac0753498f0','true','include.in.token.scope'),('f0b2abcb-ef69-41cc-b3b8-0f0e96744954','${emailScopeConsentText}','consent.screen.text'),('f0b2abcb-ef69-41cc-b3b8-0f0e96744954','true','display.on.consent.screen'),('f0b2abcb-ef69-41cc-b3b8-0f0e96744954','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0412850b-a82b-41d4-9d16-cde8dca986cb','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('0412850b-a82b-41d4-9d16-cde8dca986cb','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('0412850b-a82b-41d4-9d16-cde8dca986cb','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('0412850b-a82b-41d4-9d16-cde8dca986cb','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('0412850b-a82b-41d4-9d16-cde8dca986cb','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('0412850b-a82b-41d4-9d16-cde8dca986cb','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('0412850b-a82b-41d4-9d16-cde8dca986cb','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('0412850b-a82b-41d4-9d16-cde8dca986cb','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('0412850b-a82b-41d4-9d16-cde8dca986cb','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','2baeaeae-e659-40d0-99e3-6d56c2de998e',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','4b964dfb-ce0c-444d-9cb9-1eb0defb9609',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','7f9142b7-477f-4e99-84f6-d1944b1fe744',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','91bbca3d-fa45-481b-bfbf-9ee283a20a9d',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('32d6ecc1-dce1-4f93-8468-116b1036eb18','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('6b5baf7a-62fe-437f-aeac-7667067c19bd','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('6b5baf7a-62fe-437f-aeac-7667067c19bd','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('6b5baf7a-62fe-437f-aeac-7667067c19bd','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('6b5baf7a-62fe-437f-aeac-7667067c19bd','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('8d353a43-3d10-4f50-88ca-bee88761dfad','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('8d353a43-3d10-4f50-88ca-bee88761dfad','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('8d353a43-3d10-4f50-88ca-bee88761dfad','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('8d353a43-3d10-4f50-88ca-bee88761dfad','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('8d353a43-3d10-4f50-88ca-bee88761dfad','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('8d353a43-3d10-4f50-88ca-bee88761dfad','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('8d353a43-3d10-4f50-88ca-bee88761dfad','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('8d353a43-3d10-4f50-88ca-bee88761dfad','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('953140cf-31fd-4749-a3bb-dfffb6f42f00','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('953140cf-31fd-4749-a3bb-dfffb6f42f00','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('953140cf-31fd-4749-a3bb-dfffb6f42f00','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('953140cf-31fd-4749-a3bb-dfffb6f42f00','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('953140cf-31fd-4749-a3bb-dfffb6f42f00','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('953140cf-31fd-4749-a3bb-dfffb6f42f00','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('953140cf-31fd-4749-a3bb-dfffb6f42f00','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('953140cf-31fd-4749-a3bb-dfffb6f42f00','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('953140cf-31fd-4749-a3bb-dfffb6f42f00','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('9f88fbec-48a5-4727-b982-9f89a767695c','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('9f88fbec-48a5-4727-b982-9f89a767695c','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('9f88fbec-48a5-4727-b982-9f89a767695c','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('9f88fbec-48a5-4727-b982-9f89a767695c','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('9f88fbec-48a5-4727-b982-9f89a767695c','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('af826a63-d50c-4b7a-a874-5a7802540a5f','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('af826a63-d50c-4b7a-a874-5a7802540a5f','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('af826a63-d50c-4b7a-a874-5a7802540a5f','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('af826a63-d50c-4b7a-a874-5a7802540a5f','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('af826a63-d50c-4b7a-a874-5a7802540a5f','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('af826a63-d50c-4b7a-a874-5a7802540a5f','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('af826a63-d50c-4b7a-a874-5a7802540a5f','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('af826a63-d50c-4b7a-a874-5a7802540a5f','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('af826a63-d50c-4b7a-a874-5a7802540a5f','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('b24692d0-670c-46eb-a750-0bfd1a8347df','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('b24692d0-670c-46eb-a750-0bfd1a8347df','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('b24692d0-670c-46eb-a750-0bfd1a8347df','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('b24692d0-670c-46eb-a750-0bfd1a8347df','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('b24692d0-670c-46eb-a750-0bfd1a8347df','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('b24692d0-670c-46eb-a750-0bfd1a8347df','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('b24692d0-670c-46eb-a750-0bfd1a8347df','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('b24692d0-670c-46eb-a750-0bfd1a8347df','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('b24692d0-670c-46eb-a750-0bfd1a8347df','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('be914ae1-ef0a-4431-a14b-3bc079eafa9c','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('beefee6a-c0aa-483f-adb0-4ff539316123','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('beefee6a-c0aa-483f-adb0-4ff539316123','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('beefee6a-c0aa-483f-adb0-4ff539316123','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('beefee6a-c0aa-483f-adb0-4ff539316123','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('c873005c-073d-4001-a974-9c4239394e4f','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('c873005c-073d-4001-a974-9c4239394e4f','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('c873005c-073d-4001-a974-9c4239394e4f','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('c873005c-073d-4001-a974-9c4239394e4f','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('dd19d4a0-b325-4e2f-8f10-278f3950b8b2','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('f2bee768-a4b6-4bbc-8633-169247e8df68','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('f2bee768-a4b6-4bbc-8633-169247e8df68','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('f2bee768-a4b6-4bbc-8633-169247e8df68','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('f2bee768-a4b6-4bbc-8633-169247e8df68','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('f2bee768-a4b6-4bbc-8633-169247e8df68','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('f2bee768-a4b6-4bbc-8633-169247e8df68','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('f2bee768-a4b6-4bbc-8633-169247e8df68','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('f2bee768-a4b6-4bbc-8633-169247e8df68','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('f2bee768-a4b6-4bbc-8633-169247e8df68','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('fe084d25-43f2-44e4-a861-627a0373fc66','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('fe084d25-43f2-44e4-a861-627a0373fc66','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('fe084d25-43f2-44e4-a861-627a0373fc66','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('fe084d25-43f2-44e4-a861-627a0373fc66','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('fe084d25-43f2-44e4-a861-627a0373fc66','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('4e5ff3d0-0849-46a4-a802-b77223cd5c9d','3a547b08-093f-49de-bde4-ba8699162a33'),('59528658-a4c0-4f18-979e-a9ee62b0cfc0','20911cc2-e61b-4f02-b0a5-17c0fbd561b7');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('044141be-1733-471b-86ed-2489f5faca8a','fallback-RS256','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','Allowed Protocol Mapper Types','3cn','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous'),('38a65834-7049-496d-aa0c-a5918ee0c0bd','Trusted Hosts','3cn','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous'),('54a3810c-e13b-4902-a9dc-a4f80237cf6f','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5bc5cabb-6919-468b-8fad-235089a5984f','Max Clients Limit','3cn','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous'),('627fdeb9-eff0-459b-a07c-c36611a5170a','hmac-generated','3cn','hmac-generated','org.keycloak.keys.KeyProvider','3cn',NULL),('698f1835-e400-4a23-8f2d-783ac9c1632d','rsa-generated','3cn','rsa-generated','org.keycloak.keys.KeyProvider','3cn',NULL),('6e0b3b42-f777-4608-91e7-834dcd6de123','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6e3c3ebf-67fb-440e-aa8e-e3060dd8c2af','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('84a8672d-a38b-416a-bcbf-8c125a64314d','Allowed Protocol Mapper Types','3cn','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','authenticated'),('8775fdbe-b613-4485-8fe4-2e580023b664','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('a73a03b8-7e67-47f6-afc9-610d59bd1c51','fallback-HS256','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('b4172d19-d3ce-44cb-8227-a021d612ee5f','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c856e805-bf14-48dd-8dac-6a98e1374039','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d266c56f-c37b-404d-ab3f-2ecfba6103ab','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('dfd2a532-4e89-43a8-8436-21c72491e632','Allowed Client Scopes','3cn','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','authenticated'),('e6a35453-6232-4f12-a7c5-cda6c774bd1d','Full Scope Disabled','3cn','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous'),('e8379983-e706-44e8-84ed-686ed5a5642f','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ecfd0a11-d459-47ff-83ff-1fb2d3b574ed','Allowed Client Scopes','3cn','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous'),('f12b73fd-ff85-45b9-b7cb-a0839b25e2da','aes-generated','3cn','aes-generated','org.keycloak.keys.KeyProvider','3cn',NULL),('f23dc2de-6cb9-43fb-83f2-2102ca350499','Consent Required','3cn','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','3cn','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('02d5eefe-e362-4994-84d5-639adc1dd17c','044141be-1733-471b-86ed-2489f5faca8a','priority','-100'),('0408ead2-bfb2-46a1-953c-42c4b1787749','044141be-1733-471b-86ed-2489f5faca8a','privateKey','MIIEpQIBAAKCAQEAsNwalAiuRGaWWdVUtrGlqlmKtYxreCXBui+9wxGpNtKO+VKSH9uwvjPRkE2TUwU34RsewLNo3tIDEMhGMBaRu1ewufaFxEO42Mv1V2QuwrQYbZm6tqPJQkLfjT2MzWhOzbAv28XAwByf5bln0m6uzjNgJwrcsmKu9kxULovnDvZEPTmcDB4dXpfO4RTK09NU7DXufAVD/7sk4Ff8euorneGEHcml6eHupdTU9VYk74zZlG7kPrTJrjexKEaukz/bQA8jUiyZGRq8S5TFexb6yLJLkiSMfkosq4IQxvC4r4o9UgTZe+/8MORiU9Lpwuvg1w8me6ueOjuT2hKFXeYSnQIDAQABAoIBAQCrUcr9Mxt8btOd2aTiBFuyFGLlUkyYahqrPKvZVjZQQM72fSHHcoxW8uNBoaPge+GRUTANAr3HejA2BYrX8kTg8STkPwV9BQz+FTRnn0gcm1A+evf/C9FdOmJK8yB9qVkMrmrtvTXl4tSRN3R2x3jVjbbKmx8GPcm2FGJHZIZCWnJueDMp0BV+/zZl1sspcHe+81YGutLqmjrPkhSq6UJEhPc0MQleN9tdeSw3m+gGOhYh8J7u5JmuS6icOr75a+SF55uT0OqlFYiBwMu/yNrBFnRdWxBQxS75uHW2t0PrA5VDJC/hBOJ0YF1fFI//SVHiDrS3Mc/4tXR9bQ82DhgBAoGBAPmAmx9TsMTqhbPPsoW3HaFxqalwxiLH4RxEySr79cjwwxpT1UtkNCoINIyxiPmIs33VJPm9Jl1m1IpfqWDU1+RXYNFee2a9yGim1OO+UybDlBGtsQBYUhzenXR4xzAqmux8iKSX27i20fQ2tTkrqhhGHFGkXe6izeH35FrIfP2BAoGBALV3M2zrxakK9uekHTaT+hJTY0uh/p56dtQAE6X5GYc4QnssIxu7HNlrCkQZoxJTuffF6DZ7BoqG809mSc04B/+9rX3T9l5Z90hGVcnUjelNx3DMwjT7cbMOl80y5gS2Iiw1Lc1pbFX08HgmG9asrB/IrO3BGSt5678Q96Tq4NsdAoGAHK2wpugqwGeomKN+BKqoqD71XnmM/MB22pX5fYxakw9BjcwnDzRkXpR03dsmQHB7GTKfvmkEeOXx9jnKsUulySRWB5rRmlykJYtPmyHsUt9WLLYHS1/biF/6P0IGuz2acyZZWnnuEoxJE8YaDIk9Uu70IFpBRcXG3nts7xZub4ECgYEAg6AX9Cy8rhYe6/zVl84UORC1WJoDZ46q/LGljuE1zChZyKBGQwohLe9/fdAewd9raDbsbgAkyXyDphcq9ylqW+2Il1mVPfEB9jHWblS4Lv9U6BQN1oKAgYHXSGdgAxDdjrVwKKwMgfjuKCh0Tu3m2BMmpDpJeIiyIGA9USlxul0CgYEApZ66BtUU8JEttVY7oIiSRQ9XJiq25LZgroGU98LE16xwD5L61WQxuch5X1brgBJFpeW9GnOj+xTrSbFAYJmMCOgoNRXhcw1oY3clffcE1FGdVr7RXLzSVbCEkBO5277ZVE4Lv1KdVckZVGGheiTRSPbePDSb6xR5CMs6VzDI5ik='),('05f5370c-b95c-4333-bd6e-23a6ad4caf52','044141be-1733-471b-86ed-2489f5faca8a','certificate','MIICmzCCAYMCBgF2RxvAMTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAxMjA5MTA0NDI5WhcNMzAxMjA5MTA0NjA5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCw3BqUCK5EZpZZ1VS2saWqWYq1jGt4JcG6L73DEak20o75UpIf27C+M9GQTZNTBTfhGx7As2je0gMQyEYwFpG7V7C59oXEQ7jYy/VXZC7CtBhtmbq2o8lCQt+NPYzNaE7NsC/bxcDAHJ/luWfSbq7OM2AnCtyyYq72TFQui+cO9kQ9OZwMHh1el87hFMrT01TsNe58BUP/uyTgV/x66iud4YQdyaXp4e6l1NT1ViTvjNmUbuQ+tMmuN7EoRq6TP9tADyNSLJkZGrxLlMV7FvrIskuSJIx+SiyrghDG8Livij1SBNl77/ww5GJT0unC6+DXDyZ7q546O5PaEoVd5hKdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHR7zr47iz9FlJfuH/S0ZseWIaQ8sCH0IB0oc5jrj1b2wsSXIp4lOGbCgvFPA2TM80m2hQlCYdXtsba5aolJBbyVvaAY0/anxIDK7AYRb/0SH5bqWzbmKkCGfy8W86zdQfiZ8SAruiRd5AK2qajTFBkuet9PN6Bt/kdgpfZbnzAUSbhnKdbw8a71lU8XAgFBwlP1H0PaI2GN/3nxv1eEH6C/BY2Ho0vnG+qjMJZ3Z34qrH2BAypgLrV9nBZqnFVsqS4U8Qvcb4DRZwAP2MxalaNKgz7tMtNq5SYm+VR8Kl9hiAxy7F2BRf/qjKPDwlbG1d+kYzCcM/5g+fAyYD3ZrZM='),('06d8e263-770a-4c59-b7b1-1a926f3469f6','a73a03b8-7e67-47f6-afc9-610d59bd1c51','priority','-100'),('07961328-5707-47dd-88fa-f1a93795a966','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('08d98dc8-0c36-4006-84f2-a67b041ac2dc','a73a03b8-7e67-47f6-afc9-610d59bd1c51','kid','3896d863-ce95-42ca-9089-9db979074e3c'),('0c3a1c87-822e-44bf-afe0-af2f7467a9e6','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('128111b1-5579-40c0-b161-a3b650315b95','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('2abf91b0-cb06-4e0f-a1b0-36485575fb6d','e8379983-e706-44e8-84ed-686ed5a5642f','client-uris-must-match','true'),('2bd8f231-6f2e-4f0d-8670-796109a22fa9','698f1835-e400-4a23-8f2d-783ac9c1632d','privateKey','MIIEpAIBAAKCAQEAq28nLAqOljThXhovq/4fIbx4O4blZhAJvNenSwb61Z+XB8L334wLkXhocvNiJZ/tGRR2MXFVBGziOCdDWC6K4SlnzNUMQAm5Dkt4RlsDOQjn2Fzb9DUVsuSdDqsbaX2QEMLv7/JgA3q76rSvGL0zTsRIjQ6IZeiZeXaGnMajH96NVaHTKcYWPIL13R7Ep9qbfU22kzaDlf+kSiqkCu/3wRSwf81A7aW+L69WRUuIB/a5+DsyqAtWprQA2Ld39pMZiKqEYwFEYNdpqFc/07j9jaXmsn/2U2WVqrJ8n8Hcwo+SNr9VajfOmP3goy4h4BcxyUbuyTh/IMZrkQsBmGTO3wIDAQABAoIBAQCcRoEw9pawepgOzlQytz7t4/6+VOP9PBWEXhoUnNI/tnFZE/Qdhm5tN5QPZapMnhLmz+5GeAeGNzOo+LG9SwAy7SnAYV3/al2VmFqV2BWCAopGg6/GWDXlk91QJ86fRWT0wp8y3oGD6ngvJnKPXLnOzcNNQrg4Heb6AIAJnlHJk/qxqnaF/OuSgE2zwOCxwfrSKdPAjrBAa7GqNg/CEoQnW47i239cYhv1XJycqQdeAcm7fXMPx1edfeeHm+Dnrwr0wi5qRkGX4s9DZrkHBu2Do1UXhvNox01tgI8J/3w8d+e8hh7yt1Gpf1x/GkB+2VbtNg2WffSO2l+yuxya4L7RAoGBANc849EcwIvXPvVvw2wWV/VIK5tDSGhwK3mOFwcglCNeO242kbTg84fcBlCd/mgsm0v+GcdIgg7Xd0qR2/p8Mwwv/FbtzuduxL3NK7B8euPI/C5FFF5pD5lBk5xgbmELeCkD+Nqd9FA6rv7/7CmOqkgSVTWrO4wNTH5SDBpYMIzdAoGBAMvmlaRBv3A5hiDbRFd3/EZbpRXO+zBy0KK56wiDePM9RQcomH+Umrp7N8AD67ljJZNfM8Y/BOzXjWMqS6VdlGECaHQ+3hE6Nwv8q8s0YRcksDJEHJ+sLFwVsJ5DXERGXgCu30i3/ne9ecRB1CCtzd5QXQ18/8Xu9pp6pAcmKYDrAoGAUGJxQvvV/WQaI1fmSEvf9b9KaeYq+LZLxk4G06abLMpYr8S5jjAlQ6wsv5cCGK3wIeV4gzDVQe2+o57t5RLVjcuuFlkiWNTJrYkes/8JdmDtreomvUvHg5k2I8Tv9FZwPgE5w4wSXpRMHvg9nxelCN2v7SdSSe/9jX/e/UfKehECgYEAlSCkOWpM1Yt86fL0XPTIcbz9VKH5XUncBefsWmGtyFj7b2zlfAn30IPmFm3HreMxzENI3qmgtIhCRFDe2qdCqmDUfJCuYfMt53p5Ozmn+QFATMM8HBwUpZTHhDjH9rdwcRd0/v5zAqh1snBi8TOs6ffk1sShXOaVPg6MgR4MJNkCgYBVcv+Iwu5toD5i9JEylCVFUNg4EqgXyzyuB4Xueg7jS6cQ9Ovd5KVfPClyJ2myFikNPmjfFcvEUpIH4OYWIApOl/R0Jc58ofREm6TAEYmXPyt46WsV25D83dEL4qQR88rP1s0aQJbrFwrfsoRXpkguIl43soCR2wBAASmPXvUpgw=='),('2c28f31f-1625-40ec-a7f5-224af4bf2e86','f12b73fd-ff85-45b9-b7cb-a0839b25e2da','secret','_R63V4-Jyn25IulIPb06WQ'),('2d7b3009-f860-4956-a3e8-50ba4c57fce2','a73a03b8-7e67-47f6-afc9-610d59bd1c51','algorithm','HS256'),('2f6f2170-5f5d-4de3-b17e-0428c96f8115','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('300dbfd3-9190-4bd9-a67a-ca60f1d54c1f','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','saml-user-property-mapper'),('326fefde-665e-404f-9cae-7dd80407e914','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('35c1ae3a-16fb-4824-b69d-97dba5418ac3','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3b78a4ee-27a2-4419-b3af-691c04b986c1','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','saml-user-property-mapper'),('4baef053-c3ca-46e2-aebf-d2625380336b','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4d0a7edd-c95b-4aea-9533-9ff1b4265b1d','627fdeb9-eff0-459b-a07c-c36611a5170a','priority','100'),('4d73b24b-01ec-4963-8b15-4c5f478a4138','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4d832b9c-1806-49d2-99c2-f84420e5f640','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5a27e85d-1e7f-47a2-b90a-938fdf1f4d9f','698f1835-e400-4a23-8f2d-783ac9c1632d','priority','100'),('5ac5c8e9-a6b4-4f11-ad3b-e80575275b3f','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','saml-user-property-mapper'),('5ce63d78-acad-43e2-8307-053246752f4d','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','saml-role-list-mapper'),('6644bddc-baa6-4f16-a13e-72f7600ede82','f12b73fd-ff85-45b9-b7cb-a0839b25e2da','priority','100'),('6c903fbb-c99b-4402-ab3c-aabbe536c138','a73a03b8-7e67-47f6-afc9-610d59bd1c51','secret','_R7cuDGMcvMX4f45VeS1F5zsLfZ-9j5okmqe_6TQn3R0NbKXhDuc1SBV23dEwZe72_mPD0fyA3SxHEt5i45rDQ'),('6f0297ca-196d-42d2-9809-41f056b519f7','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','oidc-address-mapper'),('71105300-44c4-4bb0-8d26-133e984ef233','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','oidc-address-mapper'),('71a145b5-739a-4912-b8fb-2f5890812345','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('72377964-0ef5-4898-9c84-9a42129cb61f','044141be-1733-471b-86ed-2489f5faca8a','algorithm','RS256'),('73433d34-4837-4160-a75f-f4045f336a06','38a65834-7049-496d-aa0c-a5918ee0c0bd','host-sending-registration-request-must-match','true'),('7e95d073-a480-4117-a309-ebd68b4feb7f','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','saml-role-list-mapper'),('833d99e8-c2f0-4095-aea8-15a70dee0fa3','f12b73fd-ff85-45b9-b7cb-a0839b25e2da','kid','989e15ed-1d7a-460f-8fec-3cb9bc81c422'),('8a580840-706d-4138-927b-3d8ad03db513','627fdeb9-eff0-459b-a07c-c36611a5170a','secret','f0rwiKu3XWc90squBjLG1K8-OO7TFDoXFlx-IehaFzu0A9opbKotnxPAqIOi2yGX-KPM6tw40j_X7LAlkwFAsQ'),('937fcb7c-116e-4091-847d-71581ac24d24','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9c6d6875-7de3-4d66-b422-da6a580d6be8','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9d7af407-e208-45a3-ab0d-c39fa4e397b9','8775fdbe-b613-4485-8fe4-2e580023b664','allow-default-scopes','true'),('9e800bf1-4327-40c6-8287-90876f75dc08','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','saml-role-list-mapper'),('a0db327e-4538-4ef4-985f-380141c3692e','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('a1e8e856-d807-4d49-b49c-87c0dbad9486','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','oidc-full-name-mapper'),('aacd2b3e-4bf5-4fac-8ab9-eeabdeb1ddac','b4172d19-d3ce-44cb-8227-a021d612ee5f','allow-default-scopes','true'),('abff2957-ec94-4d95-8d74-46d7a68fc327','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b0c25c5c-58bc-4e0b-a718-d646f8d256df','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b6f8e260-6a36-4c90-9fb0-c9bb44bb85b4','627fdeb9-eff0-459b-a07c-c36611a5170a','kid','16227fa3-6822-460b-a101-983347ad44e2'),('ba0aae0b-c056-4b6a-a78b-6b885aea3132','84a8672d-a38b-416a-bcbf-8c125a64314d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('bcde8862-bb49-4f2d-bd9d-9e9165e05af1','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','oidc-address-mapper'),('c354c4f3-ef95-4195-9f67-a2cd524e2fa7','54a3810c-e13b-4902-a9dc-a4f80237cf6f','max-clients','200'),('c9a3ad67-9cfd-4bb2-b200-50c675534578','ecfd0a11-d459-47ff-83ff-1fb2d3b574ed','allow-default-scopes','true'),('ca5c95eb-7b51-4330-b261-72d49369f94e','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d4af8ab8-5721-4991-adec-86b260cfc59a','5bc5cabb-6919-468b-8fad-235089a5984f','max-clients','200'),('d90586fb-9596-416e-90e1-cc5832202d94','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','saml-user-property-mapper'),('dfbd5f65-ee55-4778-bb44-bfb794038afc','38a65834-7049-496d-aa0c-a5918ee0c0bd','client-uris-must-match','true'),('e3be5f0b-177e-4b29-ab49-12d7788db066','627fdeb9-eff0-459b-a07c-c36611a5170a','algorithm','HS256'),('e90085f2-3d48-4c41-aa06-24e55bcf4a00','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ece16bcd-69b4-4b19-a016-0724aebb2d77','d266c56f-c37b-404d-ab3f-2ecfba6103ab','allowed-protocol-mapper-types','oidc-address-mapper'),('ee9dc8a0-671e-44c9-b06f-2dd6356e6575','c856e805-bf14-48dd-8dac-6a98e1374039','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f144bb23-6e39-46d7-bfd9-cce7f4f4d7ad','698f1835-e400-4a23-8f2d-783ac9c1632d','certificate','MIIClTCCAX0CBgF2Rx7sIDANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDAMzY24wHhcNMjAxMjA5MTA0NzU3WhcNMzAxMjA5MTA0OTM3WjAOMQwwCgYDVQQDDAMzY24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrbycsCo6WNOFeGi+r/h8hvHg7huVmEAm816dLBvrVn5cHwvffjAuReGhy82Iln+0ZFHYxcVUEbOI4J0NYLorhKWfM1QxACbkOS3hGWwM5COfYXNv0NRWy5J0OqxtpfZAQwu/v8mADervqtK8YvTNOxEiNDohl6Jl5doacxqMf3o1VodMpxhY8gvXdHsSn2pt9TbaTNoOV/6RKKqQK7/fBFLB/zUDtpb4vr1ZFS4gH9rn4OzKoC1amtADYt3f2kxmIqoRjAURg12moVz/TuP2Npeayf/ZTZZWqsnyfwdzCj5I2v1VqN86Y/eCjLiHgFzHJRu7JOH8gxmuRCwGYZM7fAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHczeSp2kWMlwHh8V8RBleUnOKXcxTEZhH5WljkdqdVkXFVZyawFjDJJn3xipkL9xFyJ+ZlFvzvz2vyuU+KYA2GEUaUzRdBu4s/343nAkX6S6fQ1rS030ti6LUx1P9T5fcDC90oiH85AbxTUE0UB7PTw69EW3uiWYtnW0VmfS3r6YegTExjDJESyN51sioPta6yN4LUVaOLKdOqZ6ehYpjN+Fi+9zB1lb544GymxEzjL7RcSmxvdbniWvNcglCOqc3c1Zn4lbIPdufzh5rpghsTbCTnnm/gk+U8d7YDoUBXm4NBb4CUKHytbUHQmuBh0gArhJqXdT8hc6tKWHgiBYpQ='),('ff577c18-6eaf-4863-b0dd-1d3e761173a9','e8379983-e706-44e8-84ed-686ed5a5642f','host-sending-registration-request-must-match','true'),('ffdb4eb7-6f31-4eaa-921d-a6d9a02b670f','0819ef1c-6e5c-41b3-84cb-bb9dc7e575b0','allowed-protocol-mapper-types','saml-role-list-mapper'),('ffeefc41-1568-4044-bc79-0e0e50926558','dfd2a532-4e89-43a8-8436-21c72491e632','allow-default-scopes','true');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0bc820ee-859e-418c-bf91-e0950763d37f','0a8cd937-2449-4a08-a578-9c645aadae07'),('0bc820ee-859e-418c-bf91-e0950763d37f','a497757b-60ce-4d65-9733-decb0a252132'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','52c50c97-f91e-40fb-9512-a96bd4368635'),('20a8e9e4-0134-4e8b-b227-348727ea6738','3a547b08-093f-49de-bde4-ba8699162a33'),('20a8e9e4-0134-4e8b-b227-348727ea6738','85680537-7e9d-4a28-bce6-13353985beb9'),('20a8e9e4-0134-4e8b-b227-348727ea6738','d40fb799-8aa9-45f0-8e2e-386e750bf29b'),('20a8e9e4-0134-4e8b-b227-348727ea6738','e6c6c85e-e09d-4874-a131-6a6357510569'),('3d93463d-fe3c-4dcc-940f-df56e93ca986','23505d9c-4c7b-4f8c-a710-c6aa24e38136'),('4364ea1a-d852-4d85-bece-95194ac7db2e','106e1ad6-7d52-4476-aba5-6de72a6f6925'),('4364ea1a-d852-4d85-bece-95194ac7db2e','1e0d5f1a-7174-4cba-b1f6-ee9de056be6d'),('4364ea1a-d852-4d85-bece-95194ac7db2e','20911cc2-e61b-4f02-b0a5-17c0fbd561b7'),('4364ea1a-d852-4d85-bece-95194ac7db2e','bfdf57c3-2f54-4640-b819-ac8118d0f56d'),('663533fb-3b5d-4509-b7c0-352e7c9b88eb','007c90cf-0aea-4933-9ab0-05df09f48717'),('663533fb-3b5d-4509-b7c0-352e7c9b88eb','cea8e63d-4ab3-49f1-9ec6-f3e1c741211e'),('6f549cb7-e332-41dd-a78a-8c05d518f221','007c90cf-0aea-4933-9ab0-05df09f48717'),('6f549cb7-e332-41dd-a78a-8c05d518f221','008bde31-93f3-4d65-b894-fb0d6e270022'),('6f549cb7-e332-41dd-a78a-8c05d518f221','04ddeb14-57db-4b70-8835-64ac1cab546b'),('6f549cb7-e332-41dd-a78a-8c05d518f221','0d28db2f-9bc2-495b-81b8-a3a105ec7782'),('6f549cb7-e332-41dd-a78a-8c05d518f221','26a48432-46ca-4efd-b4b8-0e25d1dda8cc'),('6f549cb7-e332-41dd-a78a-8c05d518f221','27ec2e42-9025-4ae9-a888-eeed97bcd30d'),('6f549cb7-e332-41dd-a78a-8c05d518f221','2a0aff9d-8a32-40ae-aa5d-b3bd6b725188'),('6f549cb7-e332-41dd-a78a-8c05d518f221','342c0c19-c58e-4ff8-83ba-a985f2a0fe6d'),('6f549cb7-e332-41dd-a78a-8c05d518f221','34717690-81ce-4850-b51e-72124359bd68'),('6f549cb7-e332-41dd-a78a-8c05d518f221','39d64150-8628-457e-b0e2-ad437bd920ca'),('6f549cb7-e332-41dd-a78a-8c05d518f221','3cd7c419-4770-42f6-9490-a69a46dba70d'),('6f549cb7-e332-41dd-a78a-8c05d518f221','3de10ceb-b474-4872-8273-846965b2e667'),('6f549cb7-e332-41dd-a78a-8c05d518f221','424d816d-a3c2-4c57-8315-8bf0160babcc'),('6f549cb7-e332-41dd-a78a-8c05d518f221','453a97ad-4654-44b3-a06b-39222fc4ffb0'),('6f549cb7-e332-41dd-a78a-8c05d518f221','4e201caa-96ee-458a-baaf-661814f3ff2e'),('6f549cb7-e332-41dd-a78a-8c05d518f221','4eb91dd3-962b-400c-a7e1-b3c94ea93eca'),('6f549cb7-e332-41dd-a78a-8c05d518f221','663533fb-3b5d-4509-b7c0-352e7c9b88eb'),('6f549cb7-e332-41dd-a78a-8c05d518f221','67c53a6a-f81c-4e79-9956-637a8fcc2dbd'),('6f549cb7-e332-41dd-a78a-8c05d518f221','6f006f13-2477-4bda-866a-f49e93b4d1f7'),('6f549cb7-e332-41dd-a78a-8c05d518f221','704176e6-c3f8-49c0-9c88-91bcdb90ca6c'),('6f549cb7-e332-41dd-a78a-8c05d518f221','76ce4704-d9eb-4bed-85be-e08e14f21bec'),('6f549cb7-e332-41dd-a78a-8c05d518f221','7815c523-2dc4-4ec5-be95-b21d563a17e9'),('6f549cb7-e332-41dd-a78a-8c05d518f221','889d7363-9131-46d2-bd81-7371b729377f'),('6f549cb7-e332-41dd-a78a-8c05d518f221','8ca08450-dd1f-4092-9e6e-3f7a62fd0834'),('6f549cb7-e332-41dd-a78a-8c05d518f221','8d8c22ba-36f9-4cce-a0fd-2eba692f934c'),('6f549cb7-e332-41dd-a78a-8c05d518f221','99d7ef67-ff2f-45f4-92ba-21e0cee6eca9'),('6f549cb7-e332-41dd-a78a-8c05d518f221','9c1573ba-4c22-41a3-b9d5-7b753b818050'),('6f549cb7-e332-41dd-a78a-8c05d518f221','a87fc490-dd11-498c-bb57-d7623c730ba3'),('6f549cb7-e332-41dd-a78a-8c05d518f221','b779abd0-8f96-44d3-8746-0043ddc7c54c'),('6f549cb7-e332-41dd-a78a-8c05d518f221','bd0976c8-cd00-457f-a539-590725a47170'),('6f549cb7-e332-41dd-a78a-8c05d518f221','be36ba47-63e6-499d-8405-9c80e5f2948c'),('6f549cb7-e332-41dd-a78a-8c05d518f221','bef116d7-7f75-4f29-9bdb-5b2e34eb76cd'),('6f549cb7-e332-41dd-a78a-8c05d518f221','cea8e63d-4ab3-49f1-9ec6-f3e1c741211e'),('6f549cb7-e332-41dd-a78a-8c05d518f221','d7006b3a-8335-4403-b6f9-e2db6d838f12'),('6f549cb7-e332-41dd-a78a-8c05d518f221','e00d7156-264a-4c8b-8dad-864ae60fce65'),('6f549cb7-e332-41dd-a78a-8c05d518f221','e1396957-a0bc-4b13-b134-c664540e1846'),('6f549cb7-e332-41dd-a78a-8c05d518f221','e71e0b73-a1f5-4f48-b2b3-a3c9aef85892'),('7b217be8-8eb3-46cd-bb75-b216759d0e29','ee092ded-28df-4ea0-acf6-cdfa8f5922f2'),('85680537-7e9d-4a28-bce6-13353985beb9','672c40af-0663-4ff1-a066-a2b21ddf71d8'),('8c78e026-64da-4148-83ff-e16e866017d7','763d682d-a2a8-459a-bc67-1e21c9b1f83d'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','03945b6f-1041-4069-9e94-98973635d24a'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','0a8cd937-2449-4a08-a578-9c645aadae07'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','0bc820ee-859e-418c-bf91-e0950763d37f'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','12fe3206-cff6-4bb5-b92a-177265b96d3c'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','1ffa5b13-ad61-490a-b550-06693dc7fad8'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','23533e99-cbb3-4c38-8460-e6c9fa62b6e7'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','25ca9b16-54b4-42c2-a03c-16e9128fb6ee'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','2ad2b12e-bba2-48b9-810a-28723aee030e'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','4902fe13-4b17-4d4f-b360-f8f70e33f7da'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','6bbd0948-6a06-428f-909a-4451561c8641'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','74059157-3900-41f6-9421-f2680f79792a'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','7b217be8-8eb3-46cd-bb75-b216759d0e29'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','9679b04b-5bd9-4a75-b2ec-3282c4943b64'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','a497757b-60ce-4d65-9733-decb0a252132'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','a506b1f1-c5fe-4959-b549-54109ec5877f'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','ee092ded-28df-4ea0-acf6-cdfa8f5922f2'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','f447ea00-5cc4-4f46-b164-a576764e33e9'),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','fccd3a36-7080-499b-83be-4c20d04fd33f'),('99d7ef67-ff2f-45f4-92ba-21e0cee6eca9','04ddeb14-57db-4b70-8835-64ac1cab546b'),('99d7ef67-ff2f-45f4-92ba-21e0cee6eca9','424d816d-a3c2-4c57-8315-8bf0160babcc'),('bef116d7-7f75-4f29-9bdb-5b2e34eb76cd','4e201caa-96ee-458a-baaf-661814f3ff2e'),('d7006b3a-8335-4403-b6f9-e2db6d838f12','26a48432-46ca-4efd-b4b8-0e25d1dda8cc');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('27e9d197-f2b1-4739-94b5-dc33354d3b3e',NULL,'password','4c2f9225-77f6-422c-8365-58f5593619f1',1612815265107,NULL,'{\"value\":\"uKQ10g5c3luGhD+a4tz5lKG5sIN6IBq0215oJjYvUP+SIp0j0UBp49XQsaqAA8Z9B47SuJaEUbp/QzbptB4vqw==\",\"salt\":\"v6DfQYCGvCpONKVVmgDxKg==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('7c86f25a-45b7-4317-a617-3c27bd388b91',NULL,'password','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab',1607511256333,NULL,'{\"value\":\"cwcOW4ExjORavMxxbaxzO41T7xpvCMg+N2oKQ/kuR2/oA5lXDicJUNz1IKn9hG93EPzqBKnLz2/PJp5Ki9us3g==\",\"salt\":\"OMEjt1T1BJy8rhbeN7Ovyw==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('7f9f776d-db65-4ddc-8693-b97aed8ddb33',NULL,'password','9427dd4f-c805-4d33-a9fb-5fd6c49a388a',1618211699239,NULL,'{\"value\":\"69w9Qq4I+Y6x7NVTZXBYwaqVLIBrkQPhN7J18Nh2Owtm+smJwVYP5iMl6WPN9JcKCnx+7ZBVL8Gez41Ea5xrbg==\",\"salt\":\"7MQMPJ8vEucvJUSOHLln5w==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('9d1f3bea-1bae-4a1b-9dc2-ec35e9501416',NULL,'password','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550',1607510724496,NULL,'{\"value\":\"Ccbb/fIWAM1aADisUzrczEfBYiKP496JWxmo0OOSgeJ4SgM0Vxjbe8SZn+CjBfbVJEIHWiIjCwuWSIuZ8TbMlQ==\",\"salt\":\"qQm6SOGwpuTNsLgN8irnsg==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2020-12-09 10:38:28',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2020-12-09 10:38:28',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2020-12-09 10:38:29',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2020-12-09 10:38:29',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2020-12-09 10:38:30',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2020-12-09 10:38:30',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2020-12-09 10:38:31',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2020-12-09 10:38:31',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2020-12-09 10:38:31',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2020-12-09 10:38:32',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2020-12-09 10:38:32',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2020-12-09 10:38:32',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2020-12-09 10:38:33',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-12-09 10:38:33',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-12-09 10:38:33',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-12-09 10:38:33',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-12-09 10:38:33',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2020-12-09 10:38:34',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2020-12-09 10:38:34',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2020-12-09 10:38:34',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2020-12-09 10:38:34',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2020-12-09 10:38:34',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2020-12-09 10:38:34',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2020-12-09 10:38:34',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2020-12-09 10:38:35',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2020-12-09 10:38:35',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2020-12-09 10:38:35',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2020-12-09 10:38:35',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2020-12-09 10:38:36',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2020-12-09 10:38:36',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2020-12-09 10:38:37',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2020-12-09 10:38:37',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-12-09 10:38:37',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-12-09 10:38:37',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-12-09 10:38:38',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2020-12-09 10:38:38',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-12-09 10:38:38',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7510306470'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2020-12-09 10:38:38',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2020-12-09 10:38:38',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-12-09 10:38:38',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-12-09 10:38:38',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2020-12-09 10:38:38',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-12-09 10:38:39',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2020-12-09 10:38:39',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-12-09 10:38:39',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-12-09 10:38:39',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-12-09 10:38:39',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-12-09 10:38:40',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-12-09 10:38:40',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2020-12-09 10:38:41',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2020-12-09 10:38:41',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2020-12-09 10:38:41',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2020-12-09 10:38:41',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2020-12-09 10:38:41',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-12-09 10:38:41',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-12-09 10:38:41',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-12-09 10:38:41',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-12-09 10:38:43',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2020-12-09 10:38:43',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2020-12-09 10:38:44',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-12-09 10:38:44',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-12-09 10:38:44',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2020-12-09 10:38:44',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2020-12-09 10:38:44',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2020-12-09 10:38:44',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2020-12-09 10:38:44',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2020-12-09 10:38:44',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2020-12-09 10:38:44',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2020-12-09 10:38:44',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2020-12-09 10:38:44',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7510306470'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2020-12-09 10:38:44',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-12-09 10:38:44',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-12-09 10:38:44',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-12-09 10:38:44',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-12-09 10:38:45',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-12-09 10:38:45',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-12-09 10:38:45',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-12-09 10:38:45',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-12-09 10:38:45',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-12-09 10:38:45',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-12-09 10:38:45',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-12-09 10:38:45',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-12-09 10:38:46',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-12-09 10:38:46',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7510306470'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2020-12-09 10:38:46',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7510306470'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2020-12-09 10:38:46',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'7510306470'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-04 12:08:48',87,'MARK_RAN','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'5400528727'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-04 12:08:48',88,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'5400528727'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-04 12:08:48',89,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'5400528727'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-04 12:08:49',90,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'5400528727'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',91,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'5400528727'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',92,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'5400528727'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',93,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'5400528727'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',94,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'5400528727'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',95,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'5400528727'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',96,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'5400528727'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',97,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'5400528727'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-04 12:08:49',98,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'5400528727'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-04 12:08:49',99,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'5400528727'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-04 12:08:49',100,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'5400528727'),('14.0.0-KEYCLOAK-18286-mysql','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-04 12:08:49',101,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'5400528727'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-04 12:08:50',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'5400528727'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-04 12:08:50',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'5400528727'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-03-27 12:49:00',104,'EXECUTED','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'8385340243'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-03-27 12:49:00',105,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'8385340243'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-03-27 12:49:00',106,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'8385340243'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-03-27 12:49:01',107,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'8385340243');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('3cn','59528658-a4c0-4f18-979e-a9ee62b0cfc0',_binary '\0'),('3cn','6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7',_binary '\0'),('3cn','a4b97441-2b8c-4799-8fdf-fe7939937759',_binary ''),('3cn','b790ff1d-4469-439b-831d-9577e34f1243',_binary '\0'),('3cn','c693558b-ee57-4409-b7de-74d83a04f1ac',_binary ''),('3cn','d4ff9d6a-7c44-4ec7-a200-d131798908ac',_binary ''),('3cn','dec02384-d720-4c3d-b863-ff014b6bb477',_binary ''),('3cn','eafa98ba-e395-4481-8765-1ac0753498f0',_binary '\0'),('3cn','f0b2abcb-ef69-41cc-b3b8-0f0e96744954',_binary ''),('master','1e881d87-458c-4e94-93c1-9505f67dac5d',_binary ''),('master','4e5ff3d0-0849-46a4-a802-b77223cd5c9d',_binary '\0'),('master','6ffaa2c9-278f-415b-a749-551e2eebe59c',_binary ''),('master','7e5f67df-bef2-4cf6-8899-80839b49a5b3',_binary ''),('master','87bd3632-b9fb-44d8-b302-b36e2666255d',_binary '\0'),('master','8a4ff979-2657-44a0-aa62-b64cd22e2b0d',_binary ''),('master','8c1a121b-80da-4c78-809e-36b9b1638dc6',_binary ''),('master','ac5a320d-4eec-4c5b-ae3b-05d9d97736b2',_binary '\0'),('master','e18fcfb8-a559-41f9-b2a6-ec258d81058b',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('5054b62e-8741-426a-9242-dbb1daabc461','bb01c192-1cb7-44b2-898b-4493be1d8f3a'),('7b2a6b19-a691-4bb0-85bd-c4eb9a2764f9','bb01c192-1cb7-44b2-898b-4493be1d8f3a'),('a1f32ef3-1f3c-404e-8ee2-eec48816facd','bb01c192-1cb7-44b2-898b-4493be1d8f3a'),('c45df40b-3725-4973-b770-bb11a4a2b86c','bb01c192-1cb7-44b2-898b-4493be1d8f3a'),('c90f8b96-1188-47ef-9751-5df637ef400a','bb01c192-1cb7-44b2-898b-4493be1d8f3a');
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('bb01c192-1cb7-44b2-898b-4493be1d8f3a','user-default-role',' ','3cn');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('007c90cf-0aea-4933-9ab0-05df09f48717','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_query-users}','query-users','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('008bde31-93f3-4d65-b894-fb0d6e270022','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-events}','manage-events','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('03945b6f-1041-4069-9e94-98973635d24a','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-authorization}','manage-authorization','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('04ddeb14-57db-4b70-8835-64ac1cab546b','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_query-users}','query-users','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('09624d16-7338-4b56-8003-34af2f706539','beefee6a-c0aa-483f-adb0-4ff539316123',_binary '',NULL,'admin','master','beefee6a-c0aa-483f-adb0-4ff539316123',NULL),('0a8cd937-2449-4a08-a578-9c645aadae07','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_query-groups}','query-groups','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('0bc820ee-859e-418c-bf91-e0950763d37f','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-users}','view-users','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('0d28db2f-9bc2-495b-81b8-a3a105ec7782','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-authorization}','manage-authorization','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('106e1ad6-7d52-4476-aba5-6de72a6f6925','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_view-profile}','view-profile','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('12fe3206-cff6-4bb5-b92a-177265b96d3c','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-users}','manage-users','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_manage-account}','manage-account','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('1ffa5b13-ad61-490a-b550-06693dc7fad8','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-events}','view-events','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','3cn',_binary '\0','${role_offline-access}','offline_access','3cn',NULL,'3cn'),('20a8e9e4-0134-4e8b-b227-348727ea6738','master',_binary '\0','${role_default-roles-master}','default-roles-master','master',NULL,'master'),('23505d9c-4c7b-4f8c-a710-c6aa24e38136','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_view-consent}','view-consent','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('23533e99-cbb3-4c38-8460-e6c9fa62b6e7','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-identity-providers}','manage-identity-providers','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('25ca9b16-54b4-42c2-a03c-16e9128fb6ee','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-clients}','manage-clients','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('26a48432-46ca-4efd-b4b8-0e25d1dda8cc','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_query-clients}','query-clients','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('27ec2e42-9025-4ae9-a888-eeed97bcd30d','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('2a0aff9d-8a32-40ae-aa5d-b3bd6b725188','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-authorization}','manage-authorization','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('2ad2b12e-bba2-48b9-810a-28723aee030e','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-identity-providers}','view-identity-providers','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('342c0c19-c58e-4ff8-83ba-a985f2a0fe6d','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-users}','manage-users','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('34717690-81ce-4850-b51e-72124359bd68','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-realm}','manage-realm','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('39d64150-8628-457e-b0e2-ad437bd920ca','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_impersonation}','impersonation','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('3a547b08-093f-49de-bde4-ba8699162a33','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('3cd7c419-4770-42f6-9490-a69a46dba70d','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-events}','view-events','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('3d93463d-fe3c-4dcc-940f-df56e93ca986','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_manage-consent}','manage-consent','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('3de10ceb-b474-4872-8273-846965b2e667','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-identity-providers}','view-identity-providers','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('424d816d-a3c2-4c57-8315-8bf0160babcc','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_query-groups}','query-groups','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('4364ea1a-d852-4d85-bece-95194ac7db2e','3cn',_binary '\0','${role_default-roles-3cn}','default-roles-3cn','3cn',NULL,'3cn'),('453a97ad-4654-44b3-a06b-39222fc4ffb0','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-identity-providers}','view-identity-providers','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('4902fe13-4b17-4d4f-b360-f8f70e33f7da','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_create-client}','create-client','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('4e201caa-96ee-458a-baaf-661814f3ff2e','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_query-clients}','query-clients','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('4eb91dd3-962b-400c-a7e1-b3c94ea93eca','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-authorization}','view-authorization','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('5054b62e-8741-426a-9242-dbb1daabc461','c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe',_binary '',NULL,'user','3cn','c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe',NULL),('52c50c97-f91e-40fb-9512-a96bd4368635','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_manage-account-links}','manage-account-links','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('5c501bcf-c520-409d-9e27-75b005796f33','be914ae1-ef0a-4431-a14b-3bc079eafa9c',_binary '','${role_read-token}','read-token','3cn','be914ae1-ef0a-4431-a14b-3bc079eafa9c',NULL),('61ec6217-242c-4bbd-89af-f063b2fb40f3','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_view-applications}','view-applications','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('663533fb-3b5d-4509-b7c0-352e7c9b88eb','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-users}','view-users','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('672c40af-0663-4ff1-a066-a2b21ddf71d8','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_manage-account-links}','manage-account-links','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('67c53a6a-f81c-4e79-9956-637a8fcc2dbd','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-authorization}','view-authorization','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('6bbd0948-6a06-428f-909a-4451561c8641','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_impersonation}','impersonation','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('6f006f13-2477-4bda-866a-f49e93b4d1f7','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_create-client}','create-client','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('6f549cb7-e332-41dd-a78a-8c05d518f221','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('704176e6-c3f8-49c0-9c88-91bcdb90ca6c','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-events}','manage-events','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('74059157-3900-41f6-9421-f2680f79792a','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-realm}','view-realm','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('763d682d-a2a8-459a-bc67-1e21c9b1f83d','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_view-consent}','view-consent','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('76ce4704-d9eb-4bed-85be-e08e14f21bec','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-clients}','manage-clients','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('7815c523-2dc4-4ec5-be95-b21d563a17e9','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-events}','view-events','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('79b5cd92-7f8e-4074-ba45-c67c031b28af','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_view-applications}','view-applications','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('7b217be8-8eb3-46cd-bb75-b216759d0e29','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-clients}','view-clients','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('7b2a6b19-a691-4bb0-85bd-c4eb9a2764f9','b24692d0-670c-46eb-a750-0bfd1a8347df',_binary '',NULL,'user','3cn','b24692d0-670c-46eb-a750-0bfd1a8347df',NULL),('85680537-7e9d-4a28-bce6-13353985beb9','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_manage-account}','manage-account','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('889d7363-9131-46d2-bd81-7371b729377f','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_query-realms}','query-realms','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('8c78e026-64da-4148-83ff-e16e866017d7','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_manage-consent}','manage-consent','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('8ca08450-dd1f-4092-9e6e-3f7a62fd0834','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-realm}','manage-realm','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('8d7b1ef5-4fb3-4bfc-ad57-260060b108af','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_realm-admin}','realm-admin','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('8d8c22ba-36f9-4cce-a0fd-2eba692f934c','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('93d1a9b9-8b34-49a4-9936-f7685243d3c7','3cn',_binary '\0',NULL,'app-admin','3cn',NULL,'3cn'),('9679b04b-5bd9-4a75-b2ec-3282c4943b64','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_view-authorization}','view-authorization','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('99d7ef67-ff2f-45f4-92ba-21e0cee6eca9','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-users}','view-users','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('9c1573ba-4c22-41a3-b9d5-7b753b818050','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-users}','manage-users','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('9e203422-a8a7-465c-a7d6-328e1aa0c941','6b5baf7a-62fe-437f-aeac-7667067c19bd',_binary '','${role_read-token}','read-token','master','6b5baf7a-62fe-437f-aeac-7667067c19bd',NULL),('a0ad3610-b85c-442e-b43a-7348623215be','3cn',_binary '\0',NULL,'user','3cn',NULL,'3cn'),('a1f32ef3-1f3c-404e-8ee2-eec48816facd','8d353a43-3d10-4f50-88ca-bee88761dfad',_binary '',NULL,'user','3cn','8d353a43-3d10-4f50-88ca-bee88761dfad',NULL),('a497757b-60ce-4d65-9733-decb0a252132','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_query-users}','query-users','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('a506b1f1-c5fe-4959-b549-54109ec5877f','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_query-realms}','query-realms','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('a87fc490-dd11-498c-bb57-d7623c730ba3','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('b779abd0-8f96-44d3-8746-0043ddc7c54c','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_query-realms}','query-realms','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('bd0976c8-cd00-457f-a539-590725a47170','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_impersonation}','impersonation','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('bd7486a5-3bce-4dcd-964b-f54b0893feaf','953140cf-31fd-4749-a3bb-dfffb6f42f00',_binary '','${role_delete-account}','delete-account','3cn','953140cf-31fd-4749-a3bb-dfffb6f42f00',NULL),('be36ba47-63e6-499d-8405-9c80e5f2948c','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_manage-clients}','manage-clients','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('bef116d7-7f75-4f29-9bdb-5b2e34eb76cd','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-clients}','view-clients','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','3cn',_binary '\0','${role_uma_authorization}','uma_authorization','3cn',NULL,'3cn'),('c45df40b-3725-4973-b770-bb11a4a2b86c','0412850b-a82b-41d4-9d16-cde8dca986cb',_binary '',NULL,'user','3cn','0412850b-a82b-41d4-9d16-cde8dca986cb',NULL),('c90f8b96-1188-47ef-9751-5df637ef400a','32d6ecc1-dce1-4f93-8468-116b1036eb18',_binary '',NULL,'user','3cn','32d6ecc1-dce1-4f93-8468-116b1036eb18',NULL),('cea8e63d-4ab3-49f1-9ec6-f3e1c741211e','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_query-groups}','query-groups','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('d40fb799-8aa9-45f0-8e2e-386e750bf29b','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_view-profile}','view-profile','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('d7006b3a-8335-4403-b6f9-e2db6d838f12','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-clients}','view-clients','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('e00d7156-264a-4c8b-8dad-864ae60fce65','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_view-realm}','view-realm','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('e1396957-a0bc-4b13-b134-c664540e1846','f2bee768-a4b6-4bbc-8633-169247e8df68',_binary '','${role_view-realm}','view-realm','master','f2bee768-a4b6-4bbc-8633-169247e8df68',NULL),('e6c6c85e-e09d-4874-a131-6a6357510569','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('e71e0b73-a1f5-4f48-b2b3-a3c9aef85892','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',_binary '','${role_create-client}','create-client','master','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',NULL),('ed236e2d-75d2-4dc4-b0fa-5e7889a3d4f6','9591a610-6d71-4e8d-a0c2-5faed4d1458f',_binary '','${role_delete-account}','delete-account','master','9591a610-6d71-4e8d-a0c2-5faed4d1458f',NULL),('ee092ded-28df-4ea0-acf6-cdfa8f5922f2','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_query-clients}','query-clients','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('f447ea00-5cc4-4f46-b164-a576764e33e9','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-realm}','manage-realm','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL),('fccd3a36-7080-499b-83be-4c20d04fd33f','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',_binary '','${role_manage-events}','manage-events','3cn','7da1d62d-ad0e-4baa-8332-17b7ad6fe9ba',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('981m5','16.1.1',1648385363),('j2uu9','11.0.3',1607510329),('uuy0n','14.0.0',1625400535);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('007b3c61-81c2-4030-aa63-e885877facfa','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'6ffaa2c9-278f-415b-a749-551e2eebe59c'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('05436727-d19f-4e40-8f39-27755758d03f','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'87bd3632-b9fb-44d8-b302-b36e2666255d'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','locale','openid-connect','oidc-usermodel-attribute-mapper','9f88fbec-48a5-4727-b982-9f89a767695c',NULL),('1e8315f4-b2df-44b2-a20a-ad71b8272554','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','address','openid-connect','oidc-address-mapper',NULL,'6c31ad4f-0ea2-4a6d-ab13-5505ccafa3e7'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('26540f3d-002b-4393-a52e-1998e7e504f8','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'d4ff9d6a-7c44-4ec7-a200-d131798908ac'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b790ff1d-4469-439b-831d-9577e34f1243'),('364a2b6c-f29d-4c67-9b96-a7476238da40','role list','saml','saml-role-list-mapper',NULL,'a4b97441-2b8c-4799-8fdf-fe7939937759'),('41322ad4-720e-4dd6-be49-e172eed84015','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'1e881d87-458c-4e94-93c1-9505f67dac5d'),('4328fabb-cdd6-4cd1-8c2d-ee5890b695c7','full name','openid-connect','oidc-full-name-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b790ff1d-4469-439b-831d-9577e34f1243'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'eafa98ba-e395-4481-8765-1ac0753498f0'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','username','openid-connect','oidc-usermodel-property-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1e881d87-458c-4e94-93c1-9505f67dac5d'),('54e17b65-3621-4f79-ba42-798e07773e80','audience resolve','openid-connect','oidc-audience-resolve-mapper','c873005c-073d-4001-a974-9c4239394e4f',NULL),('5623955f-b7df-4e17-bc34-9eed930988db','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','beefee6a-c0aa-483f-adb0-4ff539316123',NULL),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('60e6f3e8-bcac-4824-bc69-94076b9069e9','audience resolve','openid-connect','oidc-audience-resolve-mapper','c00214e4-a0cd-49a6-81a4-dca5d9f8981e',NULL),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'1e881d87-458c-4e94-93c1-9505f67dac5d'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','email','openid-connect','oidc-usermodel-property-mapper',NULL,'7e5f67df-bef2-4cf6-8899-80839b49a5b3'),('6930bb07-01e9-48b3-a607-039e6805f861','role list','saml','saml-role-list-mapper',NULL,'8a4ff979-2657-44a0-aa62-b64cd22e2b0d'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','beefee6a-c0aa-483f-adb0-4ff539316123',NULL),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','email','openid-connect','oidc-usermodel-property-mapper',NULL,'f0b2abcb-ef69-41cc-b3b8-0f0e96744954'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('7581919f-328e-483f-af23-c42bc09c8ed9','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('75c15096-fea9-4300-be3c-a30d5db33343','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','beefee6a-c0aa-483f-adb0-4ff539316123',NULL),('76d2062b-5c35-4686-b419-bf781e7b5ae2','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ac5a320d-4eec-4c5b-ae3b-05d9d97736b2'),('7c236d72-29c8-473f-9bad-9d7124ed677d','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'87bd3632-b9fb-44d8-b302-b36e2666255d'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('85ca745e-027a-4118-a9a5-9195ca289db1','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('8d51fca5-221f-4441-8d28-ae4745e8dc32','full name','openid-connect','oidc-full-name-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','username','openid-connect','oidc-usermodel-property-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('a7e59548-c802-4075-bc70-36f61a538fc6','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('a8535e40-3567-402d-9765-73283abd5301','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'f0b2abcb-ef69-41cc-b3b8-0f0e96744954'),('acb3c515-bed2-457b-a254-a5d726a224cf','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'dec02384-d720-4c3d-b863-ff014b6bb477'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'eafa98ba-e395-4481-8765-1ac0753498f0'),('b273849f-4407-4a30-8e85-d0e299d7a213','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('b459f2eb-14e6-4beb-ac52-c186eded7764','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c1a121b-80da-4c78-809e-36b9b1638dc6'),('b843da0d-5789-4c56-b034-2ae4310afccb','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'7e5f67df-bef2-4cf6-8899-80839b49a5b3'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','address','openid-connect','oidc-address-mapper',NULL,'e18fcfb8-a559-41f9-b2a6-ec258d81058b'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ac5a320d-4eec-4c5b-ae3b-05d9d97736b2'),('cb1f9bac-8e88-497c-8265-884950767fc5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'d4ff9d6a-7c44-4ec7-a200-d131798908ac'),('cd950d84-098d-42c4-8246-7b82d6c15ac1','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'d4ff9d6a-7c44-4ec7-a200-d131798908ac'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','locale','openid-connect','oidc-usermodel-attribute-mapper','c51fcb44-0ab2-4c65-90e1-950d0a7e69a6',NULL),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac'),('ff620947-ef82-4536-9e76-5a9724456061','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c693558b-ee57-4409-b7de-74d83a04f1ac');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('04e57b14-45b6-4cf1-98a1-a3810ce07379','true','access.token.claim'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','birthdate','claim.name'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','true','id.token.claim'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','String','jsonType.label'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','birthdate','user.attribute'),('04e57b14-45b6-4cf1-98a1-a3810ce07379','true','userinfo.token.claim'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','true','access.token.claim'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','profile','claim.name'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','true','id.token.claim'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','String','jsonType.label'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','profile','user.attribute'),('051a3c68-2143-492b-b3f1-a16fbe31fa74','true','userinfo.token.claim'),('05436727-d19f-4e40-8f39-27755758d03f','true','access.token.claim'),('05436727-d19f-4e40-8f39-27755758d03f','phone_number','claim.name'),('05436727-d19f-4e40-8f39-27755758d03f','true','id.token.claim'),('05436727-d19f-4e40-8f39-27755758d03f','String','jsonType.label'),('05436727-d19f-4e40-8f39-27755758d03f','phoneNumber','user.attribute'),('05436727-d19f-4e40-8f39-27755758d03f','true','userinfo.token.claim'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','true','access.token.claim'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','locale','claim.name'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','true','id.token.claim'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','String','jsonType.label'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','locale','user.attribute'),('07b74a2b-8347-4fb7-bd40-f602d84ef660','true','userinfo.token.claim'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','true','access.token.claim'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','family_name','claim.name'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','true','id.token.claim'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','String','jsonType.label'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','lastName','user.attribute'),('1e8315f4-b2df-44b2-a20a-ad71b8272554','true','userinfo.token.claim'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','true','access.token.claim'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','true','id.token.claim'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','country','user.attribute.country'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','formatted','user.attribute.formatted'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','locality','user.attribute.locality'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','postal_code','user.attribute.postal_code'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','region','user.attribute.region'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','street','user.attribute.street'),('22dfc798-1fc3-4e3e-9a33-c088c1f30574','true','userinfo.token.claim'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','true','access.token.claim'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','gender','claim.name'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','true','id.token.claim'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','String','jsonType.label'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','gender','user.attribute'),('242d1901-9103-4c7f-9fbc-88b26679d6c5','true','userinfo.token.claim'),('26540f3d-002b-4393-a52e-1998e7e504f8','true','access.token.claim'),('26540f3d-002b-4393-a52e-1998e7e504f8','locale','claim.name'),('26540f3d-002b-4393-a52e-1998e7e504f8','true','id.token.claim'),('26540f3d-002b-4393-a52e-1998e7e504f8','String','jsonType.label'),('26540f3d-002b-4393-a52e-1998e7e504f8','locale','user.attribute'),('26540f3d-002b-4393-a52e-1998e7e504f8','true','userinfo.token.claim'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','true','access.token.claim'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','realm_access.roles','claim.name'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','String','jsonType.label'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','true','multivalued'),('2ad0ee59-5183-45c0-8471-030fefae6e0e','foo','user.attribute'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','true','access.token.claim'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','phone_number','claim.name'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','true','id.token.claim'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','String','jsonType.label'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','phoneNumber','user.attribute'),('2e61de03-7045-4b3c-86f5-99d20fbd3e54','true','userinfo.token.claim'),('364a2b6c-f29d-4c67-9b96-a7476238da40','Role','attribute.name'),('364a2b6c-f29d-4c67-9b96-a7476238da40','Basic','attribute.nameformat'),('364a2b6c-f29d-4c67-9b96-a7476238da40','false','single'),('4328fabb-cdd6-4cd1-8c2d-ee5890b695c7','true','access.token.claim'),('4328fabb-cdd6-4cd1-8c2d-ee5890b695c7','true','id.token.claim'),('4328fabb-cdd6-4cd1-8c2d-ee5890b695c7','true','userinfo.token.claim'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','true','access.token.claim'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','phone_number_verified','claim.name'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','true','id.token.claim'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','boolean','jsonType.label'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','phoneNumberVerified','user.attribute'),('4a85d0e7-cfd1-446c-a7b2-fb67308d8e9c','true','userinfo.token.claim'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','true','access.token.claim'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','upn','claim.name'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','true','id.token.claim'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','String','jsonType.label'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','username','user.attribute'),('4bc6ead9-65f0-4a51-9f84-91c5ffecd2d9','true','userinfo.token.claim'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','true','access.token.claim'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','preferred_username','claim.name'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','true','id.token.claim'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','String','jsonType.label'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','username','user.attribute'),('52a3c94e-1452-4679-ae1d-0e9b9ad9af7b','true','userinfo.token.claim'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','true','access.token.claim'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','realm_access.roles','claim.name'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','String','jsonType.label'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','true','multivalued'),('542d3e0e-74e1-40b3-a583-746d83b10b2e','foo','user.attribute'),('5623955f-b7df-4e17-bc34-9eed930988db','true','access.token.claim'),('5623955f-b7df-4e17-bc34-9eed930988db','clientAddress','claim.name'),('5623955f-b7df-4e17-bc34-9eed930988db','true','id.token.claim'),('5623955f-b7df-4e17-bc34-9eed930988db','String','jsonType.label'),('5623955f-b7df-4e17-bc34-9eed930988db','clientAddress','user.session.note'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','true','access.token.claim'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','nickname','claim.name'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','true','id.token.claim'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','String','jsonType.label'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','nickname','user.attribute'),('5a943bf8-d3fb-4ea5-bda5-670da90195aa','true','userinfo.token.claim'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','true','access.token.claim'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','zoneinfo','claim.name'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','true','id.token.claim'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','String','jsonType.label'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','zoneinfo','user.attribute'),('5c1c4c37-3d5f-45b8-9564-c20ec53f9d0a','true','userinfo.token.claim'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','true','access.token.claim'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','given_name','claim.name'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','true','id.token.claim'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','String','jsonType.label'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','firstName','user.attribute'),('5d432dcb-f225-4dc6-8ecd-6c5ece10c40d','true','userinfo.token.claim'),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','true','access.token.claim'),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','resource_access.${client_id}.roles','claim.name'),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','String','jsonType.label'),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','true','multivalued'),('60e741b8-4c1d-4224-99e4-2465d8fe51d9','foo','user.attribute'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','true','access.token.claim'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','email','claim.name'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','true','id.token.claim'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','String','jsonType.label'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','email','user.attribute'),('678d44e0-9d8d-4af7-a87d-ddddd0140ce1','true','userinfo.token.claim'),('6930bb07-01e9-48b3-a607-039e6805f861','Role','attribute.name'),('6930bb07-01e9-48b3-a607-039e6805f861','Basic','attribute.nameformat'),('6930bb07-01e9-48b3-a607-039e6805f861','false','single'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','true','access.token.claim'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','updated_at','claim.name'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','true','id.token.claim'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','String','jsonType.label'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','updatedAt','user.attribute'),('696fda4f-064d-402e-bb44-9e070ed8ad5a','true','userinfo.token.claim'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','true','access.token.claim'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','clientHost','claim.name'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','true','id.token.claim'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','String','jsonType.label'),('6b04f13d-26e4-4c2b-a07b-b8a1893a293f','clientHost','user.session.note'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','true','access.token.claim'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','email','claim.name'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','true','id.token.claim'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','String','jsonType.label'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','email','user.attribute'),('6eff5153-cb86-4d3f-a0a6-d2750cf89bf6','true','userinfo.token.claim'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','true','access.token.claim'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','website','claim.name'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','true','id.token.claim'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','String','jsonType.label'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','website','user.attribute'),('74625aa1-9bc1-4ffb-b8f1-ad1a63b4fb6e','true','userinfo.token.claim'),('7581919f-328e-483f-af23-c42bc09c8ed9','true','access.token.claim'),('7581919f-328e-483f-af23-c42bc09c8ed9','profile','claim.name'),('7581919f-328e-483f-af23-c42bc09c8ed9','true','id.token.claim'),('7581919f-328e-483f-af23-c42bc09c8ed9','String','jsonType.label'),('7581919f-328e-483f-af23-c42bc09c8ed9','profile','user.attribute'),('7581919f-328e-483f-af23-c42bc09c8ed9','true','userinfo.token.claim'),('75c15096-fea9-4300-be3c-a30d5db33343','true','access.token.claim'),('75c15096-fea9-4300-be3c-a30d5db33343','clientId','claim.name'),('75c15096-fea9-4300-be3c-a30d5db33343','true','id.token.claim'),('75c15096-fea9-4300-be3c-a30d5db33343','String','jsonType.label'),('75c15096-fea9-4300-be3c-a30d5db33343','clientId','user.session.note'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','true','access.token.claim'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','middle_name','claim.name'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','true','id.token.claim'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','String','jsonType.label'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','middleName','user.attribute'),('76d2062b-5c35-4686-b419-bf781e7b5ae2','true','userinfo.token.claim'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','true','access.token.claim'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','given_name','claim.name'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','true','id.token.claim'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','String','jsonType.label'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','firstName','user.attribute'),('790c2677-8f67-488a-8155-a2ed2c94a3ea','true','userinfo.token.claim'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','true','access.token.claim'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','upn','claim.name'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','true','id.token.claim'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','String','jsonType.label'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','username','user.attribute'),('7b1b1d12-c33a-4571-9e8a-2580109948b6','true','userinfo.token.claim'),('7c236d72-29c8-473f-9bad-9d7124ed677d','true','access.token.claim'),('7c236d72-29c8-473f-9bad-9d7124ed677d','phone_number_verified','claim.name'),('7c236d72-29c8-473f-9bad-9d7124ed677d','true','id.token.claim'),('7c236d72-29c8-473f-9bad-9d7124ed677d','boolean','jsonType.label'),('7c236d72-29c8-473f-9bad-9d7124ed677d','phoneNumberVerified','user.attribute'),('7c236d72-29c8-473f-9bad-9d7124ed677d','true','userinfo.token.claim'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','true','access.token.claim'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','birthdate','claim.name'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','true','id.token.claim'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','String','jsonType.label'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','birthdate','user.attribute'),('80c86cb8-7ba5-4bfc-88fd-3f8d5c934a6c','true','userinfo.token.claim'),('85ca745e-027a-4118-a9a5-9195ca289db1','true','access.token.claim'),('85ca745e-027a-4118-a9a5-9195ca289db1','picture','claim.name'),('85ca745e-027a-4118-a9a5-9195ca289db1','true','id.token.claim'),('85ca745e-027a-4118-a9a5-9195ca289db1','String','jsonType.label'),('85ca745e-027a-4118-a9a5-9195ca289db1','picture','user.attribute'),('85ca745e-027a-4118-a9a5-9195ca289db1','true','userinfo.token.claim'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','true','access.token.claim'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','updated_at','claim.name'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','true','id.token.claim'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','String','jsonType.label'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','updatedAt','user.attribute'),('8d061398-6c5d-42aa-918e-4f1e2210c08d','true','userinfo.token.claim'),('8d51fca5-221f-4441-8d28-ae4745e8dc32','true','access.token.claim'),('8d51fca5-221f-4441-8d28-ae4745e8dc32','true','id.token.claim'),('8d51fca5-221f-4441-8d28-ae4745e8dc32','true','userinfo.token.claim'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','true','access.token.claim'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','preferred_username','claim.name'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','true','id.token.claim'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','String','jsonType.label'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','username','user.attribute'),('95c05f15-e8d1-40f5-90f4-7079eaa93010','true','userinfo.token.claim'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','true','access.token.claim'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','picture','claim.name'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','true','id.token.claim'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','String','jsonType.label'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','picture','user.attribute'),('9c8f6eca-1627-492e-bad7-edc34df98b4e','true','userinfo.token.claim'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','true','access.token.claim'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','locale','claim.name'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','true','id.token.claim'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','String','jsonType.label'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','locale','user.attribute'),('9f8b01d6-67d9-4f19-a546-f5b1fe493b7f','true','userinfo.token.claim'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','true','access.token.claim'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','gender','claim.name'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','true','id.token.claim'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','String','jsonType.label'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','gender','user.attribute'),('a34a9ab0-cfdb-4eac-88c3-475bdd37d3c5','true','userinfo.token.claim'),('a7e59548-c802-4075-bc70-36f61a538fc6','true','access.token.claim'),('a7e59548-c802-4075-bc70-36f61a538fc6','middle_name','claim.name'),('a7e59548-c802-4075-bc70-36f61a538fc6','true','id.token.claim'),('a7e59548-c802-4075-bc70-36f61a538fc6','String','jsonType.label'),('a7e59548-c802-4075-bc70-36f61a538fc6','middleName','user.attribute'),('a7e59548-c802-4075-bc70-36f61a538fc6','true','userinfo.token.claim'),('a8535e40-3567-402d-9765-73283abd5301','true','access.token.claim'),('a8535e40-3567-402d-9765-73283abd5301','email_verified','claim.name'),('a8535e40-3567-402d-9765-73283abd5301','true','id.token.claim'),('a8535e40-3567-402d-9765-73283abd5301','boolean','jsonType.label'),('a8535e40-3567-402d-9765-73283abd5301','emailVerified','user.attribute'),('a8535e40-3567-402d-9765-73283abd5301','true','userinfo.token.claim'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','true','access.token.claim'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','groups','claim.name'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','true','id.token.claim'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','String','jsonType.label'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','true','multivalued'),('b15b1336-73d2-4e19-98c2-8adfc005b3eb','foo','user.attribute'),('b273849f-4407-4a30-8e85-d0e299d7a213','true','access.token.claim'),('b273849f-4407-4a30-8e85-d0e299d7a213','nickname','claim.name'),('b273849f-4407-4a30-8e85-d0e299d7a213','true','id.token.claim'),('b273849f-4407-4a30-8e85-d0e299d7a213','String','jsonType.label'),('b273849f-4407-4a30-8e85-d0e299d7a213','nickname','user.attribute'),('b273849f-4407-4a30-8e85-d0e299d7a213','true','userinfo.token.claim'),('b459f2eb-14e6-4beb-ac52-c186eded7764','true','access.token.claim'),('b459f2eb-14e6-4beb-ac52-c186eded7764','zoneinfo','claim.name'),('b459f2eb-14e6-4beb-ac52-c186eded7764','true','id.token.claim'),('b459f2eb-14e6-4beb-ac52-c186eded7764','String','jsonType.label'),('b459f2eb-14e6-4beb-ac52-c186eded7764','zoneinfo','user.attribute'),('b459f2eb-14e6-4beb-ac52-c186eded7764','true','userinfo.token.claim'),('b843da0d-5789-4c56-b034-2ae4310afccb','true','access.token.claim'),('b843da0d-5789-4c56-b034-2ae4310afccb','email_verified','claim.name'),('b843da0d-5789-4c56-b034-2ae4310afccb','true','id.token.claim'),('b843da0d-5789-4c56-b034-2ae4310afccb','boolean','jsonType.label'),('b843da0d-5789-4c56-b034-2ae4310afccb','emailVerified','user.attribute'),('b843da0d-5789-4c56-b034-2ae4310afccb','true','userinfo.token.claim'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','true','access.token.claim'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','true','id.token.claim'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','country','user.attribute.country'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','formatted','user.attribute.formatted'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','locality','user.attribute.locality'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','postal_code','user.attribute.postal_code'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','region','user.attribute.region'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','street','user.attribute.street'),('bcc44f32-3a5d-4ac2-aa9c-78e6ed17a5fd','true','userinfo.token.claim'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','true','access.token.claim'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','groups','claim.name'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','true','id.token.claim'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','String','jsonType.label'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','true','multivalued'),('c5889e15-bf5d-472e-866d-ec5dcefe536f','foo','user.attribute'),('cb1f9bac-8e88-497c-8265-884950767fc5','true','access.token.claim'),('cb1f9bac-8e88-497c-8265-884950767fc5','resource_access.${client_id}.roles','claim.name'),('cb1f9bac-8e88-497c-8265-884950767fc5','String','jsonType.label'),('cb1f9bac-8e88-497c-8265-884950767fc5','true','multivalued'),('cb1f9bac-8e88-497c-8265-884950767fc5','foo','user.attribute'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','true','access.token.claim'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','locale','claim.name'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','true','id.token.claim'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','String','jsonType.label'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','locale','user.attribute'),('d9aeacb0-2a8d-48e5-82f4-85a4cfb241a9','true','userinfo.token.claim'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','true','access.token.claim'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','family_name','claim.name'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','true','id.token.claim'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','String','jsonType.label'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','lastName','user.attribute'),('ebe7eaf2-bed7-4420-b3dd-3ef9110ad572','true','userinfo.token.claim'),('ff620947-ef82-4536-9e76-5a9724456061','true','access.token.claim'),('ff620947-ef82-4536-9e76-5a9724456061','website','claim.name'),('ff620947-ef82-4536-9e76-5a9724456061','true','id.token.claim'),('ff620947-ef82-4536-9e76-5a9724456061','String','jsonType.label'),('ff620947-ef82-4536-9e76-5a9724456061','website','user.attribute'),('ff620947-ef82-4536-9e76-5a9724456061','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('3cn',60,300,3600,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'3cn',0,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','dd19d4a0-b325-4e2f-8f10-278f3950b8b2',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','a10c6893-003e-41f8-81ac-c83af3f2e62c','2bcd1185-aac0-4b8e-83c3-a03468e4b8ce','56c79313-9f92-4764-8d14-74d872ef165c','76e11101-ed82-458e-9b3d-e6e972f00233','3b390c68-fbf8-49a1-ba51-7ae3925a0c8a',2592000,_binary '\0',900,_binary '',_binary '\0','bead1f76-c9b9-4f2a-b064-1eb04839af81',0,_binary '\0',0,0,'4364ea1a-d852-4d85-bece-95194ac7db2e'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','f2bee768-a4b6-4bbc-8633-169247e8df68',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','38ddfa78-709d-4374-96d2-aa355b0288f3','8df84880-4b5f-4d31-b924-6eb017ce592b','3d040609-3df9-477c-92e1-e9a801e1e4df','017dd622-d9b9-4a39-8082-52711aab9659','f29906e9-a9e6-4304-aa84-3a6c3551ca92',2592000,_binary '\0',900,_binary '',_binary '\0','b97ebf53-4bb2-496d-a573-b5f10f217a06',0,_binary '\0',0,0,'20a8e9e4-0134-4e8b-b227-348727ea6738');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','3cn','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','3cn',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','3cn','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','3cn','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','3cn','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','3cn','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','3cn','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','3cn','43200'),('actionTokenGeneratedByUserLifespan','3cn','300'),('bruteForceProtected','3cn','false'),('bruteForceProtected','master','false'),('client-policies.policies','3cn','{\"policies\":[]}'),('client-policies.policies','master','{\"policies\":[]}'),('client-policies.profiles','3cn','{\"profiles\":[]}'),('client-policies.profiles','master','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','3cn','0'),('clientOfflineSessionMaxLifespan','3cn','0'),('clientSessionIdleTimeout','3cn','0'),('clientSessionMaxLifespan','3cn','0'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','3cn','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','3cn','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','3cn','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','3cn','60'),('minimumQuickLoginWaitSeconds','master','60'),('offlineSessionMaxLifespan','3cn','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','3cn','false'),('offlineSessionMaxLifespanEnabled','master','false'),('permanentLockout','3cn','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','3cn','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','3cn','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','3cn','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','3cn','not specified'),('webAuthnPolicyAuthenticatorAttachment','3cn','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','3cn','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','3cn','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','3cn','false'),('webAuthnPolicyCreateTimeout','3cn','0'),('webAuthnPolicyCreateTimeoutPasswordless','3cn','0'),('webAuthnPolicyRequireResidentKey','3cn','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','3cn','not specified'),('webAuthnPolicyRpEntityName','3cn','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','3cn','keycloak'),('webAuthnPolicyRpId','3cn',''),('webAuthnPolicyRpIdPasswordless','3cn',''),('webAuthnPolicySignatureAlgorithms','3cn','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','3cn','ES256'),('webAuthnPolicyUserVerificationRequirement','3cn','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','3cn','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_GROUPS` VALUES ('3cn','bb01c192-1cb7-44b2-898b-4493be1d8f3a');
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('3cn','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','3cn'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('0412850b-a82b-41d4-9d16-cde8dca986cb','*'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','http://currency-converter.io/*'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','http://localhost:3000/*'),('953140cf-31fd-4749-a3bb-dfffb6f42f00','/realms/3cn/account/*'),('9591a610-6d71-4e8d-a0c2-5faed4d1458f','/realms/master/account/*'),('9f88fbec-48a5-4727-b982-9f89a767695c','/admin/3cn/console/*'),('af826a63-d50c-4b7a-a874-5a7802540a5f','http://localhost:8755/*'),('b24692d0-670c-46eb-a750-0bfd1a8347df','*'),('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','/realms/3cn/account/*'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','/admin/master/console/*'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','*'),('c873005c-073d-4001-a974-9c4239394e4f','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('32576524-6b77-4afe-a2e9-09e84d5729db','VERIFY_EMAIL','Verify Email','3cn',_binary '',_binary '\0','VERIFY_EMAIL',50),('3b6d0881-c027-4168-a402-e9e97b4c017f','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('4c06fb4c-e392-4746-8a2a-21f83b62324f','UPDATE_PASSWORD','Update Password','3cn',_binary '',_binary '\0','UPDATE_PASSWORD',30),('4c21ad0d-e793-4f88-a08a-3b7cbefef227','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('58b93b68-be59-4e5b-b60d-a71720c4bd11','update_user_locale','Update User Locale','3cn',_binary '',_binary '\0','update_user_locale',1000),('98f10188-ee9c-46f2-bee1-15d8c3e8cbad','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a8ddf95a-1b38-4ab6-b842-06b15c5a4f1c','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('bbd509f5-7cd4-4251-9b5d-6b7513238204','terms_and_conditions','Terms and Conditions','3cn',_binary '\0',_binary '\0','terms_and_conditions',20),('bf326c4a-5f6d-4078-b018-ef4ab0b556d2','delete_account','Delete Account','3cn',_binary '\0',_binary '\0','delete_account',60),('ddf19164-65af-4380-98d7-798f13529475','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('e0342159-a68c-4b65-854f-c6c4a535e44a','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('f03cfd24-a8b3-40a6-86c9-b46f64692994','CONFIGURE_TOTP','Configure OTP','3cn',_binary '',_binary '\0','CONFIGURE_TOTP',10),('f45af509-4258-4282-a057-398e81e8bab0','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('fd2fe872-fcc0-4312-8779-1acd04316e7d','UPDATE_PROFILE','Update Profile','3cn',_binary '',_binary '\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('c00214e4-a0cd-49a6-81a4-dca5d9f8981e','1e0d5f1a-7174-4cba-b1f6-ee9de056be6d'),('beefee6a-c0aa-483f-adb0-4ff539316123','6f549cb7-e332-41dd-a78a-8c05d518f221'),('c873005c-073d-4001-a974-9c4239394e4f','85680537-7e9d-4a28-bce6-13353985beb9');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('197c32d8-d57b-4d1b-b41a-0b67cdf3b551',NULL,'23d8ec3c-9de6-4cff-8d44-dac6973f7f28',_binary '\0',_binary '\0',NULL,NULL,NULL,'3cn','test4',1612815592166,NULL,0),('1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab',NULL,'e3ca548d-c130-454e-b8c7-7ab2c930f1d4',_binary '',_binary '',NULL,NULL,NULL,'3cn','ubaid',1607511231324,NULL,0),('3ac6c152-7b1f-4a2c-9a8f-0d790a6f841c',NULL,'d6e89a12-b50f-4230-9c03-015f6ded368d',_binary '\0',_binary '\0',NULL,NULL,NULL,'3cn','test2',1612815583776,NULL,0),('4c2f9225-77f6-422c-8365-58f5593619f1',NULL,'82812f10-caa3-4971-95d7-90bb642dbdd6',_binary '',_binary '',NULL,NULL,NULL,'3cn','admin',1612815246156,NULL,0),('6e98f16a-fe51-4025-8d89-23bd65fc5c72',NULL,'ea665461-66e7-4817-8b0e-1d014b0524b5',_binary '\0',_binary '\0',NULL,NULL,NULL,'3cn','test3',1612815587715,NULL,0),('9427dd4f-c805-4d33-a9fb-5fd6c49a388a','kashif@nazir.com','kashif@nazir.com',_binary '\0',_binary '',NULL,'Kashif','Nazir','3cn','knazir',1618211699163,NULL,0),('bf837bd8-8b45-4cb1-a5ef-faa88fd7b550',NULL,'b37f6505-70e0-4e63-abf6-fe9a6f728c41',_binary '\0',_binary '',NULL,NULL,NULL,'master','ubaid',1607510724233,NULL,0),('dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8',NULL,'4522c2b9-7d1a-424e-b668-ea823b271d5d',_binary '\0',_binary '',NULL,NULL,NULL,'master','service-account-admin-cli',1612810977635,'beefee6a-c0aa-483f-adb0-4ff539316123',0),('f9d96de1-1310-4413-9758-1e8670d4130e',NULL,'1a07df96-7f4e-47e8-a144-ca48a6b47417',_binary '\0',_binary '\0',NULL,NULL,NULL,'3cn','test1',1612815571404,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES ('bb01c192-1cb7-44b2-898b-4493be1d8f3a','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('bb01c192-1cb7-44b2-898b-4493be1d8f3a','9427dd4f-c805-4d33-a9fb-5fd6c49a388a');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('106e1ad6-7d52-4476-aba5-6de72a6f6925','197c32d8-d57b-4d1b-b41a-0b67cdf3b551'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','197c32d8-d57b-4d1b-b41a-0b67cdf3b551'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','197c32d8-d57b-4d1b-b41a-0b67cdf3b551'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','197c32d8-d57b-4d1b-b41a-0b67cdf3b551'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('5054b62e-8741-426a-9242-dbb1daabc461','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('7b2a6b19-a691-4bb0-85bd-c4eb9a2764f9','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('c45df40b-3725-4973-b770-bb11a4a2b86c','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('c90f8b96-1188-47ef-9751-5df637ef400a','1f6cfe9f-4dbb-4cea-b9ad-709721f0c1ab'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','3ac6c152-7b1f-4a2c-9a8f-0d790a6f841c'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','3ac6c152-7b1f-4a2c-9a8f-0d790a6f841c'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','3ac6c152-7b1f-4a2c-9a8f-0d790a6f841c'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','3ac6c152-7b1f-4a2c-9a8f-0d790a6f841c'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','4c2f9225-77f6-422c-8365-58f5593619f1'),('12fe3206-cff6-4bb5-b92a-177265b96d3c','4c2f9225-77f6-422c-8365-58f5593619f1'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','4c2f9225-77f6-422c-8365-58f5593619f1'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','4c2f9225-77f6-422c-8365-58f5593619f1'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','4c2f9225-77f6-422c-8365-58f5593619f1'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','6e98f16a-fe51-4025-8d89-23bd65fc5c72'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','6e98f16a-fe51-4025-8d89-23bd65fc5c72'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','6e98f16a-fe51-4025-8d89-23bd65fc5c72'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','6e98f16a-fe51-4025-8d89-23bd65fc5c72'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','9427dd4f-c805-4d33-a9fb-5fd6c49a388a'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','9427dd4f-c805-4d33-a9fb-5fd6c49a388a'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','9427dd4f-c805-4d33-a9fb-5fd6c49a388a'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','9427dd4f-c805-4d33-a9fb-5fd6c49a388a'),('3a547b08-093f-49de-bde4-ba8699162a33','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550'),('6f549cb7-e332-41dd-a78a-8c05d518f221','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550'),('85680537-7e9d-4a28-bce6-13353985beb9','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550'),('d40fb799-8aa9-45f0-8e2e-386e750bf29b','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550'),('e6c6c85e-e09d-4874-a131-6a6357510569','bf837bd8-8b45-4cb1-a5ef-faa88fd7b550'),('09624d16-7338-4b56-8003-34af2f706539','dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8'),('3a547b08-093f-49de-bde4-ba8699162a33','dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8'),('85680537-7e9d-4a28-bce6-13353985beb9','dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8'),('d40fb799-8aa9-45f0-8e2e-386e750bf29b','dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8'),('e6c6c85e-e09d-4874-a131-6a6357510569','dc0413b3-8fe8-4d1e-99f2-d1a6a1a1e0f8'),('106e1ad6-7d52-4476-aba5-6de72a6f6925','f9d96de1-1310-4413-9758-1e8670d4130e'),('1e0d5f1a-7174-4cba-b1f6-ee9de056be6d','f9d96de1-1310-4413-9758-1e8670d4130e'),('20911cc2-e61b-4f02-b0a5-17c0fbd561b7','f9d96de1-1310-4413-9758-1e8670d4130e'),('bfdf57c3-2f54-4640-b819-ac8118d0f56d','f9d96de1-1310-4413-9758-1e8670d4130e');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('32d6ecc1-dce1-4f93-8468-116b1036eb18','http://currency-converter.io'),('32d6ecc1-dce1-4f93-8468-116b1036eb18','http://localhost:3000'),('9f88fbec-48a5-4727-b982-9f89a767695c','+'),('af826a63-d50c-4b7a-a874-5a7802540a5f','http://localhost:8755'),('c51fcb44-0ab2-4c65-90e1-950d0a7e69a6','+'),('c5cba342-8f7c-4ba7-aa2a-bd66ee8bb4fe','http://localhost:8300');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27 18:02:09

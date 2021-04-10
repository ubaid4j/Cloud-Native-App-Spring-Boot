Abstract
========
- This repo represents a basic currency conversion cloud native-app which convert currency from given country code to targeted country code.
- I am using the following stack for this cloud native app.   
    - [Micro-Service Architecture with Gateway-Server along with Discovery Server]()
    - [Spring Cloud Security OAuth2 With KeyCloak Server]()
    - [ELK Stack]()
    - [Distributed Tracing]()
- Following are the Tools and technologies which I am using:
  - Java 15
  - Spring Boot 2.4.3
  - Spring Cloud 2020.0.1 (Security, Config Server, Service Discovery and Distributed Tracing)
  - ELK Stack Version 7.10.0
  - KeyCloak Server (Authorization Server) 11.0
    
Auth Flow
=========
- [Please visit here](./resource/auth/auth-flow.md)

Requirements
-----------
- [Maven 3.6.3 or later](./resource/install-require-softwares.md)
- [Docker 19.03.13 or later](./resource/install-require-softwares.md)
- [JDK 15 or later](./resource/install-require-softwares.md)
- [Set JAVA_HOME](./resource/install-require-softwares.md)

How to Run
----------
-   ``` git clone https://github.com/UbaidurRehman1/Cloud-Native-App-Spring-Boot```
-   ``` cd Cloud-Native-App-Spring-Boot```
-   ```mvn clean install -DskipTests```
-   ```cd envcn```
-   ```./run.sh``` (it will run all tools which our services needs such as keycloak server, naming server, databases, zipkin, rabbitmq and elk-stack)
-   ``` cd ..```
-   ``` ./run.sh ``` (it will up the micro-services)


About
----
- Cloud Native App which convert currency from given country code to targeted country code. 
- Currency Conversion Rest API  is actual responsible to interact with micro-services using ```api-gateway-server```. 
- An Actor (React Client, React Native Client) can  send a request to rest-api, it interacts with *CURRENCY-EXCHANGE-SERVICE*  micro-service to get exchange rate and then *CURRENCY-CONVERSION-SERVICE* micro-service to convert this currency
- ![Micro Service Architecture](resource/3cnAuthFlow.png)
- In above diagram, We have 
    - Two micro-services ```currency-exchange-service```  and ```currency-conversion-service``` helps us to convert currency from one country code to another country code.
    - An api-gateway-server (which is responsible to redirect requests to micro-services)
    - A ```country-micro-service``` which returns all countries with their respect Code
    - A rest-api which expose their URLs to Clients (and is interacts with API gateway server)
    - ELK Stack, for Centralized Logging
    - Auth Server (For OAuth2 Authentication and Authorization)
    - Naming Server (For services discovery)
    - Distributed Tracing Stack, for micro-services tracing

    
How it works
------------
- [Go to Swagger](resource/how-to-use-swagger.md) 
- ~~Simply go to [Postman collection](https://www.getpostman.com/collections/567dafcda4e68e8ab855) and play with end points~~.

Swagger UI
----------
- [Go here to check API docs about Currency Conversion API](http://localhost:5200/swagger-ui/index.html#/exchange-controller)

Kibana Dashboard (For Centralized Logging)
------------------------------------------
- [Create Index for logging](resource/create-index-for-logging.md)
- [Go here to view centralized logs](http://localhost:5601/app/discover#)

Distributed Tracing
-------------------
- [Go Here to trace the micro-services](http://localhost:9411/zipkin/)


REST API
--------
-   [REST API](http://localhost:5200/actuator/health)

Micro-Services
--------------
-   [CURRENCY EXCHANGE SERVICE](http://localhost:8000/actuator/health)
-   [CURRENCY CONVERSION SERVICE](http://localhost:8100/actuator/health)

Servers
-------
-   [SPRING API GATEWAY SERVER](http://localhost:8755/actuator/health)
-   [NETFLIX EUREKA NAMING SERVER](http://localhost:8761/)
-   [CONFIG SERVER](http://localhost:8888/actuator/health)
-   [ZIPKIN SERVER](http://localhost:9411/zipkin/)
-   [RABBIT MQ SERVER *Username & Password: guest*](http://localhost:15672/)

Config Repo
-----------
- [Public Config Repo](https://github.com/UbaidurRehman1/public-repo)

Note
----
- You can read about each micro-service by going inside each folder
- [To get More info about this repo](./moreinfo.md)

Implementation Note:
--------------------
- I have added local dependencies of `KeyCloak Adapter for Spring Boot` in `rest-api` module
- See the [reason](https://github.com/keycloak/keycloak/pull/7533#issuecomment-749705232)
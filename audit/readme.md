About
=====
- [Audit Service](http://localhost:8755/swagger-ui/index.html?urls.primaryName=audit)

Dependencies
============
- #### Web (Reactor Netty as the embedded reactive HTTP server + web flux)
    - spring-boot-starter-webflux
- #### Data
    - spring-boot-starter-data-r2dbc
    - r2dbc-mysql
    - mysql-connector-java
- #### Cloud
    - ##### Config Client
        - spring-cloud-starter-config
    - ##### Naming Server Client
        - spring-cloud-starter-netflix-eureka-client
    - ##### Distributed Tracing
        - spring-cloud-sleuth-zipkin
        - spring-cloud-starter-sleuth
- #### Messaging
  - #### AMQP (Spring AMQP and Rabbit MQ)
- #### Security
    - ##### Spring Security
        - spring-cloud-starter-security
    - ##### [OAuth2 Resource Server](./../moreinfo.md#Resource-server)
        - spring-boot-starter-oauth2-resource-server
- #### AOP
    - spring-boot-starter-aop
- #### Logstash (Sending logs to Logstash)
    - reactive-logstash-logging-spring-boot-starter
- ### Database Migration (Custom Implementation)
    - r2dbc-migrate-spring-boot-starter
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
[Audience Validation](./../moreinfo.md#audience-validation)
------------------------
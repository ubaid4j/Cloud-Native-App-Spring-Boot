About
=====
- Implement [End Point](http://localhost:5200/swagger-ui/index.html#/country-controller) which return all countries 

Dependencies
============
- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Data
    - spring-boot-starter-data-jpa
    - mysql-connector-java
- #### Cloud
    - ##### Config Client
      - spring-cloud-starter-config
    - ##### Naming Server Client
      - spring-cloud-starter-netflix-eureka-client
    - ##### Distributed Tracing
      - spring-cloud-sleuth-zipkin
      - spring-cloud-starter-sleuth
- #### Security
  - ##### [Cloud Security](./../moreinfo.md#Spring-cloud-security-starter)
    - spring-cloud-starter-security
  - ##### [OAuth2 Resource Server](./../moreinfo.md#Resource-server)
    - spring-boot-starter-oauth2-resource-server
- #### AOP
    - spring-boot-starter-aop
- #### Logstash (Sending logs to Logstash)
    - logstash-logging-spring-boot-starter
- ### Database Migration (Liquibase)
    - liquibase-core
    - jackson-module-jaxb-annotations    
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
[Audience Validation](./../moreinfo.md#audience-validation)
------------------------
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
    - ##### spring-cloud-starter-netflix-eureka-client
    - ##### spring-cloud-starter-zipkin
- #### AOP
    - spring-boot-starter-aop
- #### Logstash (Sending logs to Logstash)
    - logstash-logging-spring-boot-starter
- ### Migration (Liquibase)
    - liquibase-core
    - jackson-module-jaxb-annotations    
- #### Dev Tools
    - spring-boot-devtools
    - lombok
    - spring-boot-configuration-processor
- #### Dev Ops
    - spring-boot-starter-actuator
- #### Cache
    - caffeine
- #### Test
    - spring-boot-starter-test

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
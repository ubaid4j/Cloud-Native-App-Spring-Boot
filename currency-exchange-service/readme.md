Dependencies
============

- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Dev Tools
    - spring-boot-devtools
    - lombok
    - spring-boot-configuration-processor
- #### Dev Ops
    - spring-boot-starter-actuator
- #### Data
    - spring-boot-starter-data-jpa
    - mysql-connector-java
- #### Cloud
    - ##### spring-cloud-starter-config
    - ##### spring-cloud-starter-netflix-eureka-client
    - ##### spring-cloud-starter-zipkin
- ### ELK
    - logstash-logging-spring-boot-starter
- ### Database Migration (Liquibase)
    - liquibase-core
    - jackson-module-jaxb-annotations
- #### Test
    - spring-boot-starter-test

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------

Run on different port
---------------------
- Right Click -> run configuration -> arguments -> vm arguments -> add ```-Dserver.port=port-number```



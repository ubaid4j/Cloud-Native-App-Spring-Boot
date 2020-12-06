About
=====
- Implement `/from/{from}/to/{to}` end point which get two countries name and return exchange rate between them

Dependencies
============
- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Cloud
  - ##### spring-cloud-starter-config
  - ##### Naming Server Client
    - spring-cloud-starter-netflix-eureka-client
  - ##### Distributed Tracing
    - spring-cloud-sleuth-zipkin
    - spring-cloud-starter-sleuth
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

Run on different port
---------------------
- Right Click -> run configuration -> arguments -> vm arguments -> add ```-Dserver.port=port-number```



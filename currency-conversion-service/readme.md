About
=====
- Implement `/currency/{currency}/rate/{conversion-rate}` end point which get currency (amount) and conversion rate and return the resultant currency

Dependencies
============
- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Cloud
  - ##### Naming Server Client
    - spring-cloud-starter-netflix-eureka-client
  - ##### Distributed Tracing
    - spring-cloud-sleuth-zipkin
    - spring-cloud-starter-sleuth
- #### AOP
  - spring-boot-starter-aop
- #### Logstash (Sending logs to Logstash)
  - logstash-logging-spring-boot-starter
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------

Notes
-----
- For deserialization of POJO, we can use @JsonAlias for different names of a field

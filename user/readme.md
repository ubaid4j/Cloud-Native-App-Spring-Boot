About
=====
- [User Service](http://localhost:8755/swagger-ui/index.html?urls.primaryName=user)

Dependencies
============
- #### Web Flux
    - spring-boot-starter-webflux
- #### Cloud
    - ##### Config Server Client
        - spring-cloud-starter-config
    - ##### Rest Client
        - spring-cloud-starter-openfeign
    - ##### Naming Server Client
        - spring-cloud-starter-netflix-eureka-client
    - ##### Distributed Tracing
        - spring-cloud-sleuth-zipkin
        - spring-cloud-starter-sleuth
- #### Security
    - ##### Spring Security
        - spring-cloud-starter-security
    - ##### [OAuth2 Resource Server](./../moreinfo.md#Resource-server)
        - spring-boot-starter-oauth2-resource-server
    - ##### Test
        - spring-security-test
- #### AOP
    - spring-boot-starter-aop
- #### Logstash (Sending logs to Logstash)
    - logstash-logging-spring-boot-starter
- #### Test
    - reactor-test
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
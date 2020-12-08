### About
- A server which is responsible to reroute request to the required micro-service

Dependencies
------------
- #### Cloud
  - ##### Config Client
    - spring-cloud-starter-config
  - ##### Naming Server Client
    - spring-cloud-starter-netflix-eureka-client
  - ##### API Gateway
    - spring-cloud-starter-gateway
  - ##### Distributed Tracing
    - spring-cloud-sleuth-zipkin
    - spring-cloud-starter-sleuth
- #### Logstash (Sending logs to Logstash)
  - reactive-logstash-logging-spring-boot-starter
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
### About
- A server which is responsible for request routing and other cutting-edge concerns like security, rate-limiting etc.

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
- #### Security
  - ##### Spring Security
    - spring-cloud-starter-security
  - ##### [OAuth2 Resource Server](./../moreinfo.md#Resource-server)
    - spring-boot-starter-oauth2-resource-server
  - ##### [OAuth2 Client](./../moreinfo.md#OAuth2-client)
    - spring-boot-starter-oauth2-client
- #### Logstash (Sending logs to Logstash)
  - reactive-logstash-logging-spring-boot-starter
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
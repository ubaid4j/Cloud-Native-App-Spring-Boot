### API Gateway Server
- A server which is responsible to reroute request to the required micro-service
- Port Number: 8755
Logging
=======
- To get Logs into the file: run ```docker logs -f  springservices_rest_micro_netflix-zuul-api-gateway-server_1 &> gateway-server.log &```

Dependencies
------------
- #### Dev Tools
    - spring-boot-devtools
    - lombok
    - spring-boot-configuration-processor
- #### Dev Ops
    - spring-boot-starter-actuator
- #### Cloud
    - ##### spring-cloud-starter-netflix-eureka-client
    - ##### spring-cloud-starter-zipkin
    - ##### spring-cloud-starter-netflix-zuul
- #### Logstash (Sending logs to Logstash)
  - reactive-logstash-logging-spring-boot-starter


Configuration
-------------
- add ```@EnableZuulProxy``` to enable gateway server

[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------
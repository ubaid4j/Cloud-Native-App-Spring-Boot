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
- #### Test
    - spring-boot-starter-test

Distributed Tracing
-------------------
1.  Add dependency ```spring-cloud-starter-zipkin```
2. It compiles two dependencies
    1. ```spring-cloud-starter-sleuth```
    2. ```spring-cloud-sleuth-zipkin```
3.  Sleuth will assign a unique id to each request
4.  Sleuth-Zipkin create Zipkin-compatible traces via HTTP
5.  Create a bean which return ```Sampler.ALWAYS_SAMPLE```
6.  Zipkin needs a message broker and by default it is ```rabbit-mq```
7.  We have to run rabbit-mq and zipkin-server and  over-ride two properties
    1. ```spring.rabbitmq.addresses=amqp://localhost:5672/```
    2. ```spring.zipkin.base-url=http://localhost:9411/```


Run on different port
---------------------
- Right Click -> run configuration -> arguments -> vm arguments -> add ```-Dserver.port=port-number```



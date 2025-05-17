About
=====
- [Currency Conversion Service](http://localhost:8755/swagger-ui/index.html?urls.primaryName=currency-conversion)
  
Dependencies
============
- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Cloud
  - ##### Naming Server Client
    - spring-cloud-starter-netflix-eureka-client
  - ##### Rest Client
    - spring-cloud-starter-openfeign
  - ##### Cloud Config
    - spring-cloud-starter-config
  - ##### Distributed Tracing
    - spring-cloud-sleuth-zipkin
    - spring-cloud-starter-sleuth
  - #### Messaging
    - spring-boot-starter-amqp
- #### Security
  - ##### Spring Security
    - spring-boot-starter-security
  - ##### [OAUTH2 Resource Server](./../moreinfo.md#Resource-Server) 
    - spring-boot-starter-oauth2-resource-server
  - ##### Spring Security Tests
    - spring-security-test
- #### AOP
  - spring-boot-starter-aop
- #### Swagger (API Docx)
  - springfox-boot-starter
- #### Logstash (Sending logs to Logstash)
  - logstash-logging-spring-boot-starter
- #### [Dependencies From Parent](./../moreinfo.md#Dependencies-from-parent)

Feign Rest Client
----------------
- ### About
    - Declarative Web Service Client
- ### Config
    - Add @EnableFeignClients at Application Level
    - Create an interface and annotate it with ```@FeignClient```
    - ##### Config (In case of no gateway-server)
        - ```@FeignClient``` gets two arguments 
            -   ```name``` the name of the service to which we want to talk
            -   ```url``` the url of the service
    - ##### Config (With gateway-server and registered with naming server)
        - ```@FeignClient``` gets one argument
            - ```name``` the name of api-gateway-server
  
Rest Template
-------------
- RestTemplate is a wrapper which provide Http methods


[Distributed Tracing](./../moreinfo.md#distributed-tracing)
-----------------------------------------------------------
[ELK Stack](./../moreinfo.md#elk-stack)
---------------------------------------

AOP
---
- Add ```@EnableAspectJAutoProxy``` in Config File
- Add ```@Aspect``` to make aspect file

AMQP BUS
----------
- Message Buses responsible to broadcast config changes to all instances
- Add in prop file ```management.endpoints.web.exposure.include=*``` to disable security for actuator
- POST to ```http://localhost:5200/actuator/bus-refresh``` to refresh all instances

Messaging
----------
For messaging, we are using `spring-boot-starter-amqp` which by default using `rabbit-mq` as message broker 

Test
----------
- Up all services to run api-composer tests

Notes
-------------

1.  We can create our custom pairs in the application.properties
2.  We get them using @ConfigurationProperties and defining its prefix
3.  Then create the same name fields to retrieve the same entities
    defined in the application.properties

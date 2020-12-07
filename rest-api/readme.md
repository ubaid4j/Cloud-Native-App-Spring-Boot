About
=====
- [Rest API](http://localhost:5200/swagger-ui.html#/exchange-controller)
    - Exposes URLs to Clients
    - Interact with micro-services to return desired result
  
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
  - ##### ~Cloud Bus~
    - ~spring-cloud-starter-bus-amqp~
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
    - Add request mapping inside this interface (prefixed with the name of service in case of gateway-server)   

How Feign Client its work
------------
- We have
    - Eureka Naming Server
    - Zuul Api gateway Server
    - Feign Client 
- When we call a service from feign clients, then our request goes to API gateway server, it talks with eureka naming server and get the service which is being called.
- We can simply directly call a service from our API gateway just prepending the name of being called service and change port to API gateway.
    
Netflix-Ribbon
--------------
- Netflix-Ribbon is a loadbalancer, and it can work along with feign Client
- ##### Config
    - Add ```@RibbonClient``` on the ```@FiegnClient``` annotated interface
    - In the arguments of ```@RibbonClient``` put the name of service to which you want to talk

Rest Template
-------------
- RestTemplate is a wrapper which provide Http methods

Connecting rest api to Spring Cloud Config Server
-------------------------------------------------------
1.  Change name of ```application.properties``` to ```bootstrap.properties```
2.  Add ```spring.cloud.uri.config=http://localhost:8888```
3.  It will fetch default profile (or application.properties)
4.  To change profile add ```spring.profiles.active=profile_name``` in the bootstrap.properties file


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

Test
----------
- Up all services to run rest-api tests

Notes
-------------

1.  We can create our custom pairs in the application.properties
2.  We get them using @ConfigurationProperties and defining its prefix
3.  Then create the same name fields to retrieve the same entities
    defined in the application.properties

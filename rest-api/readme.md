About
=====
- [Rest API](http://localhost:5200/swagger-ui.html#/exchange-controller)
    - Exposes URLs to Clients
    - Interact with micro-services to return desired result
    
Logging
=======
- To get Logs into the file: run ```docker logs -f springservices_rest_micro_rest-api_1 &> rest-api.log &```

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
- #### Cloud
    - ####  spring-cloud-starter-config
    - ##### spring-cloud-starter-netflix-eureka-client
    - ##### spring-cloud-starter-openfeign
    - ##### spring-cloud-starter-zipkin
- #### Cache
    - ##### caffeine 
- #### AOP
    - spring-boot-starter-aop
- #### Swagger
    - springfox-swagger2
    - springfox-swagger-ui
- #### Test
    - spring-boot-starter-test


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

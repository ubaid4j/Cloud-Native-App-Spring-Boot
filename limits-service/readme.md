Dependencies
-----------

- #### Web (embedded tomcat + MVC)
    - spring-boot-starter-web
- #### Dev Tools
    - spring-boot-devtools
    - lombok
    - spring-boot-configuration-processor
- #### Dev Ops
    - spring-boot-starter-actuator
- #### Cloud
    - ##### Config Server
        - spring-cloud-starter-config
    - ##### Naming Server Client
        - spring-cloud-starter-netflix-eureka-client
    - ##### Intelligent Routing
        - spring-cloud-starter-netflix-zuul
    - ##### Request Identification Id
        - spring-cloud-starter-sleuth
    - ##### Integration with Zipkin
        - spring-cloud-sleuth-zipkin
    - ##### Message Bus
        - spring-cloud-starter-bus-amqp
- #### Test
    - spring-boot-starter-test



Connecting limits service to Spring Cloud Config Server
-------------------------------------------------------
1.  Change name of ```application.properties``` to ```bootstrap.properties```
2.  Add ```spring.cloud.uri.config=http://localhost:8888```
3.  It will fetch default profile (or application.properties)
4.  To change profile add ```spring.profiles.active=profile_name``` in the bootstrap.properties file

Registering Eureka Client
-------------------------
1.  Add dependency ```spring-cloud-starter-netflix-eureka-client```
2.  Annotate application with ````@EnableDiscoveryClient````
3.  Add in bootstrap.properties ```eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka/```

Spring Cloud Sleuth
-------------------
1.  Sleuth will assign a unique id to each request for tracing
2.  Add dependency ```spring-cloud-starter-sleuth```
3.  Add dependency ```spring-cloud-starter-netflix-zuul```
4.  Create a bean which return ```Sampler.ALWAYS_SAMPLE```
5.  Get Response using ZUUL API as ```HttpServletRequest request = RequestContext.getCurrentContext().getResponse();``` in the controller
6.  Logged the response using slf4j logger

Notes
-------------

1.  We can create our custom pairs in the application.properties
2.  We get them using @ConfigurationProperties and defining its prefix
3.  Then create the same name fields to retrieve the same entities
    defined in the application.properties

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
    - ##### spring-cloud-starter-config
    - ##### spring-cloud-starter-netflix-eureka-client
    - ##### spring-cloud-starter-zipkin
    - ##### spring-cloud-starter-bus-amqp
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

AMQP BUS
----------
- Message Buses responsible to broadcast config changes to all instances
- POST to ```http://localhost:8666/actuator/bus-refresh``` to refresh all instances

Notes
-------------

1.  We can create our custom pairs in the application.properties
2.  We get them using @ConfigurationProperties and defining its prefix
3.  Then create the same name fields to retrieve the same entities
    defined in the application.properties

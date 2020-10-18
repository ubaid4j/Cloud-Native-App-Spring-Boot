# Microservices with Spring Cloud

Micro Service
-------------
- RestFul
- Small Deployable Units
- Cloud Enabled

Challenges
----------
- Bounded Context
- Configuration Management
- Dynamic Scaling
- Visibility
- Pack of cards

Spring Cloud
------------
- Spring Cloud Config ~Management
- Eureka ~Dynamic Scaling
- Zipkin and Netflix API ~Visibility and Monitoring
- Hystrix ~Fault Tolerance

Advantages of Microservices Architecture
----------------------------------------
- Different Languages
- Dynamic Scaling
- Faster Release Cycle

Distributed Tracing
-------------------
1. Pre-Req
    1. Run [Rabbit MQ Service](./envcn/docker-compose.yml)
    2. Run [Zipkin Service](./envcn/docker-compose.yml)
2.  Add dependency ```spring-cloud-starter-zipkin```
    1. It compiles two dependencies
        1. ```spring-cloud-starter-sleuth```
        2. ```spring-cloud-sleuth-zipkin```
    2.  Sleuth will assign a unique id to each request
    3.  Sleuth-Zipkin create Zipkin-compatible traces via HTTP
3.  Create a bean which return ```Sampler.ALWAYS_SAMPLE```
4.  Zipkin needs a message broker and by default it is ```rabbit-mq```
5.  We have to run rabbit-mq and zipkin-server and  over-ride two properties
    1. ```spring.rabbitmq.addresses=amqp://localhost:5672/```
    2. ```spring.zipkin.base-url=http://localhost:9411/```
6. Access [Zipkin Dashboard](http://localhost:9411/zipkin/) to see traces of micro-services

    
Spring Cloud Config
-------------------
- We need `spring-cloud-starter-config` dependency and ` management.endpoints.web.exposure.include=\*` to expose some end points
-  When our micro service is running, and we don't want to stop them
    to change the config
-  Use Post method http://${host}:${port}/actuator/refresh to refresh the configuration
-  It will update the config for specific port number

To Update All Instances in on Post Request
-----------------------------------------

-  Add dependency: spring-cloud-starter-bus-amqp in your service
-  Post `http://${host}:${port}/actuator/bus-refresh` to refresh all the
    instances.

Request Identification
----------------------
To Identify a request in the service we need:

-  spring-cloud-starter-sleuth
-  spring-cloud-starter-netflix-zuul
-  Sample Bean -\> Sampler.ALWAYS\_SAMPLER
- code
    ```
      import com.netflix.zuul.context.RequestContext;
      import javax.servlet.http.HttpServletResponse;
      HttpServletResponse response = RequestContext.getCurrentContext().getResponse();
      This response will have unique identity
    ```


Numeric IPs
-----------
-  eureka.instance.prefer-ip-address=true
-  eureka.instance.instance-id=\${spring.cloud.client.ip-address}:\${server.port}
-  eureka.instance.hostname=\${spring.cloud.client.ip-address}


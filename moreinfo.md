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
- ### Updated
    - Add `spring-cloud-starter-zipkin` dependency
    - Add following in application.properties
        - `spring.rabbitmq.addresses=amqp://localhost:5672/`
        - `spring.zipkin.base-url=http://localhost:9411/`
    - Run Zipkin and Rabbit MQ Services
    - Access [Zipkin Dashboard](http://localhost:9411/zipkin/) to see traces of micro-services
    
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


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

Zipkin Centralized Dashboard
----------------------------

-  Install rabbit
-  Go to Zipkin quick start and download zipkin using Java
-  run SET RABBIT\_URI=amqp://localhost in environments
-  now run the Zipkin jar, now this jar will be connected to rabbit mq

Getting trace to rabbit mq
--------------------------

Here, we set our services to set their traces to rabbit mq and this
queue is taking by Zipkin server

Add two dependencies to each service

-  spring-cloud-sleuth-zipkin (to interact with zipkin)
-  spring-cloud-starter-bus-amqp (to broadcast message)

Spring Cloud Config
-------------------

-  When our config service is running, and we don't want to stop them
    to change the config
-  Use Post method http://localhost:8080/actuator/refresh while you
    have added management.endpoints.web.exposure.include=\*
-  To refresh the configuration. (commit must be done)
-  It will update the config for specific port number

here comes spring cloud bus
---------------------------

-  add dependency: spring-cloud-starter-bus-amqp in limits service
-  management.endpoints.web.exposure.include=\* add in prop
-  post http://localhost:8080/actuator/bus-refresh to refresh all the
    instances (without any commit)

Most Important Note About Networking
------------------------------------

-  eureka.instance.prefer-ip-address=true
-  eureka.instance.instance-id=\${spring.cloud.client.ip-address}:\${server.port}
-  eureka.instance.hostname=\${spring.cloud.client.ip-address}


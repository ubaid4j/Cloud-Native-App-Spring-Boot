# Microservices with Spring Cloud

Why micro-services architecture
-------------
- RestFul
- Small Deployable Units
- Cloud Enabled

Challenges in monolith App
----------
- Bounded Context
- Configuration Management
- Dynamic Scaling
- Visibility
- Pack of cards

Here, comes Spring Cloud
------------
- Spring Cloud Config ~Management
- Eureka ~Dynamic Scaling
- Zipkin && Sleuth ~Visibility and Monitoring

Advantages of Microservices Architecture
----------------------------------------
- Different Languages
- Dynamic Scaling
- Faster Release Cycle

Distributed Tracing
-------------------
1. Pre-Req
    1. **Rabbit MQ Service**
    2. **Zipkin Service**
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

ELK Stack
-------------------
### Pre-Requisite
1. Pre-Req
    1. **Elastic Search**
    2. **Logstash**
    3. **Kibana**
2. Add dependency `logstash-logging-spring-boot-starter`
3. Add following Properties in props file:
    1. `logging.logstash.enabled=true`
    2. `logging.logstash.url=logstash:5000`
4. Access [Kibana Dashboard](http://localhost:5601) to see the logs    


Spring Cloud Config
-------------------
-  There is need to centralize the configurations for difference environments (dev, local, prod, qa) 
-  Here comes Spring Cloud Config, it provides a config client and a config server
-  We have to setup the config server to point to cloud repo (in our case github) and then make our config client to point to our config server to get the configurations from the config server  

Resource Server
---------------
- According to aws docs
`A resource server is a server for access-protected resources. It handles authenticated requests from an app that has an access token. Typically the resource server provides a CRUD API for making these access requests.`
- Security Config Class (to create a Resource Server)
```java
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(jsr250Enabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) {
        http.authorizeRequests(authorize -> authorize.anyRequest().authenticated())
                .oauth2ResourceServer(OAuth2ResourceServerConfigurer::jwt);
    }
}
```
- Explanation
    1. `@Configuration` Indicates that a class declares one or more `@Bean` methods and may be processed by the Spring container to generate bean definitions and service requests for those beans at runtime.
    2. `@EnableWebSecurity` Add this annotation to an `@Configuration` class to have the Spring Security configuration defined in any WebSecurityConfigurer or more likely by extending the WebSecurityConfigurerAdapter base class and overriding individual methods:
    3. `EnableGlobalMethodSecurity` Enables Spring Security global method security
    4. `The jsr250Enabled` property allows us to use the `@RoleAllowed` annotation on methods
    5. We are overriding `configure` method of `WebSecurityConfigurerAdapter` to authenticating all requests and adding `OAuth 2.0` Resource Server support. 
    6. Add `spring.security.oauth2.resourceserver.jwt.issuer-uri` issuer (Auth Server) URI

OAuth2 Client
-------------
- According to Stackoverflow:
`A client is an application that will interact with the authorization server or the resource server`

Audience Validation
-------------------
- According to [Key Cloak Docx](https://github.com/keycloak/keycloak-documentation/blob/master/server_admin/topics/clients/oidc/audience.adoc), Audience validation should be done in service side.
- We can add audience by adding at least one role of respective service in the user roles.
- For more inf please see [Key Cloak Docx](https://github.com/keycloak/keycloak-documentation/blob/master/server_admin/topics/clients/oidc/audience.adoc)


Numeric IPs
-----------
-  eureka.instance.prefer-ip-address=true
-  eureka.instance.instance-id=\${spring.cloud.client.ip-address}:\${server.port}
-  eureka.instance.hostname=\${spring.cloud.client.ip-address}

Dependencies From Parent
------------------------
- #### Dev Ops
    - spring-boot-starter-actuator
- #### Cache
    - caffeine
- #### Dev Tools
    - spring-boot-devtools
    - lombok
    - spring-boot-configuration-processor
- #### Test
    - spring-boot-starter-test
- ### App Modules
    - cc-exception
    - cc-dto

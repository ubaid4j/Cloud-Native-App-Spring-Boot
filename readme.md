<h2 align="center">Microservices with Spring Cloud</h2>

<ol>
    <h3>Micro Service</h3>
    <li>RestFul</li>
    <li>Small Deployable Units</li>
    <li>Cloud Enabled</li>
</ol>

<ol>
    <h3>Challanges</h3>
    <li>Bounded Context</li>
    <li>Configuration Management</li>
    <li>Dynamic Scalling</li>
    <li>Visibility</li>
    <li>Pack of cards</li>
</ol>

<ol>
    <h3>Spring Cloud</h3>
    <li>Spring Cloud Config ~Management</li>
    <li>Eureka ~Dynamic Scalling</li>
    <li>Zipkin and Netflix API ~Visiblity and Monitoring</li>
    <li>Hystrix ~Fault Tolerance</li>
</ol>

<ol>
    <h3>Advantages of Microservices Architecture</h3>
    <li>Different Languages</li>
    <li>Dynamic Scalling</li>
    <li>Faster Release Cycle</li>
</ol>

<ol>
    <h3>Project metadata</h3>
    <li>com.ubaid.ms</li>
    <li>limits-service</li>
    <li></li>
</ol>


<h2>Distributed Tracing</h2>
<ol>
    <li>To Identify a request in the service we need: </li>
    <ol>
        <li>spring-cloud-starter-sleuth</li>
        <li>spring-cloud-starter-netflix-zuul</li>
    </ol>
    <li>Sample Bean -> Sampler.ALWAYS_SAMPLER</li>
    <ol>
        <h3>For Logging Purpose</h3>
        <li>import com.netflix.zuul.context.RequestContext;</li>
        <li>import javax.servlet.http.HttpServletResponse;</li>
        <li>HttpServletResponse response = RequestContext.getCurrentContext().getResponse();</li>
        <li>This respose will have unique identity</li>
    </ol>
</ol>

<h2>Zipkin Centralized Dashboard</h2>
<ol>
    <li>Install rabbit mq using choco</li>
    <li>Go to Zipkin quick start and download zipkin using Java</li>
    <li>run SET RABBIT_URI=amqp://localhost in environments</li>
    <li>now run the jar, now this jar is connected to rabbit mq</li>
</ol>

<h2>Getting trace to rabbit mq</h2>
<ol>
    <li>Here, we set our services to set their traces to rabbit mq and this queue is taking by Zipkin server</li>
    <li>Add two dependencies to each service</li>
    <ol>
        <li>spring-cloud-sleuth-zipkin</li>
        <li>spring-cloud-starter-bus-amqp</li>
    </ol>
</ol>


<h2>Spring Cloud Config</h2>
<ol>
    <li>When our config service is running, and we don't want to stop them to change the config</li>
    <li>Use Post method <strong>http://localhost:8080/actuator/refresh<strong> while you have added management.endpoints.web.exposure.include=*</li>
    <li>To refresh the configuraiton. (commit must be done)</li>
    <li>It will update the config for specific port number</li>
</ol>

<h2>here comes spring cloud bus</h2>
<ol>
    <li>add dep: spring-cloud-starter-bus-amqp in Config server as well as limits service</li>
    <li>management.endpoints.web.exposure.include=* add in prop both</li>
    <li>post http://localhost:8080/actuator/bus-refresh to refresh all the instances (with out any commit)</li>
</ol>

<h2>Most Important Note About Networking<h2>
<ol>
    <h3>These three lines helps te maintain ip:port correct </h3>
    <li>eureka.instance.prefer-ip-address=true</li>
    <li>eureka.instance.instance-id=${spring.cloud.client.ip-address}:${server.port}</li>
    <li>eureka.instance.hostname=${spring.cloud.client.ip-address}</li>
</ol>
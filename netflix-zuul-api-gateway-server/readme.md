<h2>Netflix Zuul API Gateway Server</h2>
<ol>
	<li>Dependencies: </li>
	<ol>
		<li>Zuul Server as we are building API gateway server</li>
		<li>Eureka Discovery to connect Eureka naming server</li>
		<li>Actuator and Devtools stuff</li>		
	</ol>
	<li>Annotated Application with @EnableZuulProxy and @EnableDiscoveryClient</li>
	<li>In application.properties</li>
	<ol>
		<li>write application name and port</li>
		<li>connect with eureka naming server using <strong>eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka</strong></li>
	</ol>
	<li>Create a Filter extending with ZuulFilter</li>
	<ol>
		<li>Implement methods as here <strong>/netflix-zuul-api-gateway-server/src/main/java/com/ubaid/ms/logging/ZuulLogginFilter.java</strong></li>
	</ol>
	<li>So How we can call a service through this api gateway</li>
	<li>localhost:api-gateway-port/serviceName/url</li>
	<li>http://localhost:8755/currency-exchange-service/currency-exchange/from/USD/to/PKR</li>
</ol>


<h2 align="center">Spring Cloud Sleuth</h2>
<ol>
	<li>Sleuth will assigne a unique id to each request for tracing</li>
	<li>Add dependency <strong>spring-cloud-starter-sleuth</strong></li>
	<li>Add dependency <strong>spring-cloud-starter-netflix-zuul</strong></li>
	<li>Create a bean which return <strong>Sampler.ALWAYS_SAMPLE</strong></li>
	<li>Get Response using ZUUL API as <strong>HttpServletRequest request = RequestContext.getCurrentContext().getResponse();
	</strong> in the controller</li>
	<li>Logged the response using slf4j logger</li>
</ol>

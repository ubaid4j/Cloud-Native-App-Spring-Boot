<h2 align="center">Configuration</h2>
<ol>
	<li>Dependencies: Client Config, JPA Data, Web, mySQL connector, dev tools, actuator</li>
	<li>spring.application.name=currency-exchange-service</li>
	<li>server.port=8000</li>
	<li>Do datasource and JPA config</li>
	<li>create simple getMappign of /currency-exchange/from/{from}/to/{to}<li>
	<li>To get Port, we can add Environment.getProperty("local.server.port")</li>
</ol>

<h2 align="center">Register with Eureka Server</h2>
<ol>
	<li>Add <strong>spring-cloud-starter-netflix-eureka-client</strong></li>
	<li>Annotate app <strong>@EnableDiscoveryClient</strong></li>
	<li>Add in application.properties <strong>eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka</strong></li>
</ol>


<h2 align="center">Run on different port</h2>
<ol>
	<li>Right Click -> run configuration -> argumetns -> vm arguments -> add <strong>-Dserver.port=port-number</strong></li>
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




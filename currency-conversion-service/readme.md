<h2 align="center">Adding Netflix Eureka Naming server Client</h2>
<ol>
	<li>Add <strong>spring-cloud-starter-netflix-eureka-client</strong></li>
	<li>Annotate Application with <strong>@EnableDiscoveryClient</strong></li>
	<li>Add in applicaiton.properties <strong>eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka</strong></li>
	<li>You can remove ribbon.listOfServers after registering with Eureka Naming server</li>
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


<h2 align="center">Notes: </h2>
<ol>
	<li>For deserialization of POJO, we can use @JsonAlias for different names of a field</li>
</ol>

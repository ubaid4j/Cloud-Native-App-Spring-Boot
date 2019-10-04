<h2 align="center">Configuration</h2>
<ol>
	<li>Dependencies: Web, Dev tools, Actuator, Config Client, OpenFeign</li>
	<li>application.name = currency-conversion-service</li>
	<li>server.port=8100</li>
	<li>create a controller for this value <strong>http://localhost:8100/currency-conversion/from/USD/to/PKR/quantity/1000</strong></li>
</ol>

<h2 align="center">RestTemplate</h2>
<ol>
	<li>RestTemplate is a wrapper which provide Http methods</li>
	<li>here we used getEntity, give url, response type and url map</li>
</ol>

<h2 align="center">Fiegn Rest Client</h2>
<ol>
	<li>Feign is a declarative web service client.</li>
	<li>add @EnableFeignClients at application level</li>
	<li>Create an interface and annotate it with @FeignClient</li>
	<li>Now give two arguments</li>
	<ol>
		<li>name = "the name of of the service, which you want to talk"</li>
		<li>url = "localhost:8000" the port number</li>
	</ol>
	<li>Now: create a any mapping for this service</li>
</ol>

<h2 align="center">Netflix-Ribbon</h2>
<ol>
	<li>@RibbonClient(name="name of service which you want to talk")</li>
	<li>Remove the url from @FiegnClient</li>
	<li>Add `name of the service which you want to talk from this service`.ribbon.listofServers=http://localhost:`port of service which you want to talk', more and, more</li>
</ol>

<h2 align="center">Adding Netflix Eureka Naming server Client</h2>
<ol>
	<li>Add <strong>spring-cloud-starter-netflix-eureka-client</strong></li>
	<li>Annotate Application with <strong>@EnableDiscoveryClient</strong></li>
	<li>Add in applicaiton.properties <strong>eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka</strong></li>
	<li>You can remove ribbon.listOfServers after registering with Eureka Naming server</li>
</ol>


<h2 align="center">Calling currency-exchange-service from API gateway </h2>
<ol>
	<li>We will change the @FeignClient name param to API gateway</li>
	<li>As well change the getMapping in FiegnProxy and append the application name (targeted service name)</li>
	<li>our API gateway talk the eureka naming server and get the service which is mentioned</li>
	<li>Simply call this service, then this service call api gate-way server to call the currency exchange service</li>
	<li>To call this service from the api gateway server, simply change the port and append service name</li>
	<li>http://localhost:8755/currency-conversion-service/currency-conversion-feign/from/USD/to/PKR/quantity/1000</li>
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

<h2 align="center">com.netflix.discovery.shared.transport.TransportException</h2>
<ol>
	<h4>When we add dependency of spring-cloud-starter-netflix-eureka-client (Eureka Client) but did not </h4>
	<li>Cannot execute request on any known server</li>
</ol>

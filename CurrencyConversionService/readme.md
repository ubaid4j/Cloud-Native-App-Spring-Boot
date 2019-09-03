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



<h2 align="center">Notes: </h2>
<ol>
	<li>For deserialization of POJO, we can use @JsonAlias for different names of a field</li>
</ol>
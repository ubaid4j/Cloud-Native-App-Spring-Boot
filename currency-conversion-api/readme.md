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


<h2 align="center">Calling currency-exchange-service from API gateway </h2>
<ol>
	<li>We will change the @FeignClient name param to API gateway</li>
	<li>As well change the getMapping in FiegnProxy and append the application name (targeted service name)</li>
	<li>our API gateway talk the eureka naming server and get the service which is mentioned</li>
	<li>Simply call this service, then this service call api gate-way server to call the currency exchange service</li>
	<li>To call this service from the api gateway server, simply change the port and append service name</li>
	<li>http://localhost:8755/currency-conversion-service/currency-conversion-feign/from/USD/to/PKR/quantity/1000</li>
</ol>

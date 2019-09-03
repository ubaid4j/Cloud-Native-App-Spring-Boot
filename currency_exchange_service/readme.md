<h2 align="center">Configuration</h2>
<ol>
	<li>Dependencies: Client Config, JPA Data, Web, mySQL connector, dev tools, actuator</li>
	<li>spring.application.name=currency-exchange-service</li>
	<li>server.port=8000</li>
	<li>Do datasource and JPA config</li>
	<li>create simple getMappign of /currency-exchange/from/{from}/to/{to}<li>
	<li>To get Port, we can add Environment.getProperty("local.server.port")</li>
</ol>

<h2 align="center">Run on different port</h2>
<ol>
	<li>Right Click -> run configuration -> argumetns -> vm arguments -> add <strong>-Dserver.port=port-number</strong></li>
</ol>

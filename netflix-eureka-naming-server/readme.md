<h1 center="align">Eureka Naming Server</h1>

<h2 center="align">Configurations</h2>
<ol>
	<li>Dependencies</li>
	<ol>
		<li>Eureka Server</li>
		<li>Client Config</li>
		<li>Actuator</li>
		<li>Dev Tools</li>		
	</ol>
	<li>Annotate Application with @EnableEurekaServer</li>
</ol>

<h2 center="align">application.properties</h2>
<ol>
	<li>Write application name and port</li>
	<li>Now make them false</li>
	<ol>
		<li>eureka.client.register-with-eureka</li>
		<li>eureka.client.fetch-registry</li>
	</ol>
</ol>

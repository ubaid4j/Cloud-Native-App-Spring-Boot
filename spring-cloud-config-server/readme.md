<h1 align="center">Spring Cloud Configuration Server</h1>
<ol>
	<li>Dependencies: Server Config and Dev Tools</li>
	<li>In application.properties add application.name and server.port</li>
	<li>Add @EnableConfigServer at main class</li>
	<li>Link a local repository as Source</li>
	<li>Create a file in local repository about limits-service.properties</li>
	<li>Add limits-service.max and limits-service.min in this file</li>
	<li>Add spring.cloud.config.server.git.uri=location of /path/to/git/repo/properties/file</li>
	<li>Now we can navigate http://localhost:8888/limits-service/default to check the properties of limits-service.properties<li>
	<li>Now we can create files such as limits-service-dev.properties and limits-service-qa and we have options to navigate to</li>
	<li>http://localhost:8888/limits-service/dev or http://localhost:8888/limits-service/qa</li>
</ol>
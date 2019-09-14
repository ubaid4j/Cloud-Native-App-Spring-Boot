<h2 align="center">Configuration</h2>
<ol>
	<li>Client Config POM dependency</li>
	<li>spring.application.name to set the name</li>
	<li>We can create our custom pairs in the appliction.properties</li>
	<li>We get them using @ConfigurationProperties and defining its prefix</li>
	<li>and then create the same name fields to retrieve the same entities defined in the application.properties</li>
</ol>

<h2 align="center">Connecting limits service to Spring Cloud Config Server</h2>
<ol>
	<li>Change name of application.properties to bootstrap.properties</li>
	<li>Add spring.cloud.uri.config=http://localhost:8888</li>
	<li>It will fetch default profile</li>
	<li>To change profile add spring.profiles.active=profile_name in the bootstrap.properties file</li>
</ol>

<h2 align="center">Registering Eureka Client</h2>
<ol>
	<li>Add dependency <strong>spring-cloud-starter-netflix-eureka-client</strong></li>
	<li>Annotate application with <strong>@EnableDiscoveryClient</strong></li>
	<li>Add in bootstrap.properties <strong>eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka/</strong></li>
</ol>

<h2 align="Cloud Sleuth">Spring Cloud Sleuth</h2>
<ol>
	<li>Sleuth will assigne a unique id to each request for tracing</li>
	<li>Add dependency <strong>spring-cloud-starter-sleuth</strong></li>
	<li>Add dependency <strong>spring-cloud-starter-netflix-zuul</strong></li>
	<li>Create a bean which return <strong>Sampler.ALWAYS_SAMPLE</strong></li>
	<li>Get Response using ZUUL API as <strong>HttpServletRequest request = RequestContext.getCurrentContext().getResponse();
	</strong> in the controller</li>
	<li>Logged the response using slf4j logger</li>
</ol>



<h1>Spring Boot Web Service</h1>

<h2 align="center">Exception Handling</h2>
<ol>
    <li>Create a class extending from Exception and annotate it with @ResponseStatus(status)</li>
    <li>Whenever you throw this exception then it will give the status which you have annotated</li>
</ol>

<h2 align="center">Implementing Generic Exception</h2>
<ol>
    <li>Create a Exception Response</li>
    <li>Create an ExceptionHandler annotated with RestController, and ControllerAdvice </li>
    <li>Create a method of signature ResponseEntity<Object> methodName(Exception exp, WebRequest req) annotated with @HandleException(exception.class)</li>
    <li>Create a response and return in ResponseEntity wrapper</li>
</ol>

<h2 align="center">Validation</h2>
<ol>
    <li>For validation of an Object use, @Valid in the parameter</li>
    <li>Then use different validation annotations in the Object such as @Size, @Past etc</li>
    <li>In the custom Exception handler, override handleMethodArgumentNotValid method</li>
    <li>create a exception response and return in ResponseEntity wrapper</li>    
</ol>

<h2 align="center">Hypermedia As The Engine Of Application State (HATEOAS)</h2>
<ol>
    <li>Simply Adding Links in the response</li>
    <li>import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*;
    so we can expose all static methods of this class</li>
    <li>Create a link using</li>
    <ol>
    	<li>Create a resource<Object> of Hateous ~simply do new</li>
    	<li>ControllerBuilder linkto = linkto(methodOn(class).methodName)</li>
    	<li>now create link using Link link = linkto.withRel("name")</li>
    	<li>Now add in the resource<li>
    </ol>
</ol>



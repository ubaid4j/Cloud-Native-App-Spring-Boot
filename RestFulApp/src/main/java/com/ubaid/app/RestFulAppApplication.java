package com.ubaid.app;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@Configuration
@EnableSwagger2
public class RestFulAppApplication
{

	public static void main(String[] args)
	{
		SpringApplication.run(RestFulAppApplication.class, args);
	}

	/**
	 * 
	 * @return LocateResolver It actually 
	 */
	
	@Bean
	public LocaleResolver localeResolver()
	{
//		SessionLocaleResolver resolver = new SessionLocaleResolver();

		AcceptHeaderLocaleResolver resolver = new AcceptHeaderLocaleResolver();
		resolver.setDefaultLocale(Locale.US);
		return resolver;
	}
	
	@Bean
	public Docket api()
	{
		return new Docket(DocumentationType.SWAGGER_2)
			.apiInfo(apiInfo()).consumes(produces_consumes()).produces(produces_consumes())
			.select()                                  
			.apis(RequestHandlerSelectors.any())              
			.paths(PathSelectors.any())
			.build();  
	}
	
	private Set<String> produces_consumes()
	{
		Set<String> prodeces = new HashSet<String>(Arrays.asList("application/json"));
		return prodeces;
	}
	
	
//	   * @param title title
//	   * @param description description
//	   * @param version version
//	   * @param termsOfServiceUrl terms of service
//	   * @param contactName contact name
//	   * @param license licence text
//	   * @param licenseUrl license url
	private ApiInfo apiInfo()
	{
		ApiInfo apiInfo = new ApiInfoBuilder()
				.title("Basic RestFul API")
				.description("I am exploring it")
				.version("0.0.2")
				.termsOfServiceUrl("www.fakeURL.com")
				.contact(new Contact("Ubaid ur Rehman", "www.ubaidurrehman.com", "urehman.bese16seecs@seecs.edu.pk"))
				.license("MIT")
				.licenseUrl("www.mit.com")
				.build();
		return apiInfo;
	}


//Stead we use spring.messages.basename	
	
//	@Bean
//	public ResourceBundleMessageSource resourceBundleMessageSource()
//	{
//		ResourceBundleMessageSource source = new ResourceBundleMessageSource();
//		source.setBasename("msg");
//		return source;
//	}
	
}

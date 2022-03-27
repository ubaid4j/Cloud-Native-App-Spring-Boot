package com.ubaid.ms.common.util;

public class Constants {
    public static final String APP_ROOT_PACKAGE = "com.ubaid.ms";
    public static final String API_DOCS_PATH = "/v3/api-docs";
    public static final String HEALTH_ENDPOINT = "/actuator/health/**";
    public static final String INFO_ENDPOINT = "/actuator/info/**";

    public static final String AUTHOR_NAME = "Ubaid ur Rehman";
    public static final String AUTHOR_EMAIL = "urehman.bese16seecs@seecs.edu.pk";
    public static final String AUTHOR_LINKEDIN_URL = "https://www.linkedin.com/in/ubaid4j/";

    public static final String LICENSE = "MIT";
    public static final String LICENSE_URL = "https://github.com/UbaidurRehman1/Cloud-Native-App-Spring-Boot/blob/master/LICENSE";

    public static final String APP_VERSION = "0.0.3-SNAPSHOT";
    public static final String VERSION_1 = "/v1";

    public static final String GLOBAL = "global";
    public static final String ACCESS_EVERYTHING = "accessEverything";

    public static final String BEARER_TOKEN = "Bearer Token";
    public static final String HEADER = "header";

    public static final String API_GATEWAY = "api-gateway";
    public static final String COUNTRY_SERVICE = "country-service";
    public static final String CURRENCY_CONVERSION_SERVICE = "currency-conversion-service";
    public static final String CURRENCY_EXCHANGE_SERVICE = "currency-exchange-service";
    public static final String MATH_SERVICE = "math-service";

    public static final String EMPTY_STRING = "";
    public static final String SINGLE_SPACE = " ";
    public static final String BEARER = "Bearer";

    public static final String INVALID_TOKEN = "invalid_token";

    public static final String AUTHORIZATION = "Authorization";

    public static final int HTTP_OK = 200;
    public static final int HTTP_UNAUTHORIZED = 401;

    public static final String APPLICATION_JSON = "application/json";
    public static final String TEXT_PLAIN = "text/plain";

    public static final String AUDIT_QUEUE = "auditQueue";

    public static final String UNKNOWN = "unknown";

    public static final String[] MICROSERVICES_API_DOCS_PATHS = {
        "/user/v3/api-docs", "/audit/v3/api-docs",
        "/country/v3/api-docs", "/currency-conversion/v3/api-docs",
        "/math/v3/api-docs", "/currency-exchange/v3/api-docs"
    };

    public static final String[] SWAGGER_PATHS = {
        "/configuration/ui", "/swagger-resources/**", "/configuration/security", "/swagger-ui/index.html", "/webjars/**", "/swagger-ui/**"
    };

    public static final String[] ACCESS_TOKEN_PATHS = {"/user/oauth/token", "/user/v1/oauth/token"};
}

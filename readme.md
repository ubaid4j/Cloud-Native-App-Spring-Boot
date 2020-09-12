Note
---
For now: It only converts USD to PKR as there is only one entry in a database.
I will populate a database with all available exchange rates each 15 minutes using another micro-service.

About
----
- Cloud Native App which convert currency from given counter to targeted counter. 
- Client Service is actual responsible to interact with micro-services using api-gateway-server. 
- We send a request to client service, it interacts with *CURRENCY-EXCHANGE-SERVICE* to get exchange rate and then *CURRENCY-CONVERSION-SERVICE* to convert this currency
- For more info see wiki.

Requirements
-----------
- Maven 3.6.3 or later
- Docker 19.03.8 or later
- JDK 14 or later

How to Run
----------
-   ``` git clone https://github.com/UbaidurRehman1/SpringServices_Rest_Micro```
-   ``` cd SpringServices_Rest_Micro ```
-   ```./compile.sh```
-   ```./envcn/run.sh``` (it will run all tools which our services needs such as naming server, db, zipkin etc)
-   ``` ./run.sh ``` 

How it works
------------
```
GET http://localhost:5200/exchange/USD/to/PKR/q/20

HTTP/1.1 200 
Content-Type: application/json
Transfer-Encoding: chunked
Date: Sat, 12 Sep 2020 19:04:46 GMT
Keep-Alive: timeout=60
Connection: keep-alive

{
  "id": 1,
  "from": "USD",
  "quantity": 20,
  "to": "PKR",
  "exchangeRate": 166,
  "exchangedCurrencyQuantity": 3320,
  "port": 8000
}

Response code: 200; Time: 107ms; Content length: 110 bytes
```

Swagger UI
----------
- [Go here to check API docs about Client Service](http://localhost:5200/swagger-ui.html#/exchange-controller)



Naming Server
-------------
- [Go Here to see All Micro-Services associated to this Cloud Native App](http://localhost:8761)

Zipkin Server
------------
- [Go Here to see tracing of micro-services](http://localhost:9411/zipkin/)

Micro-Services
--------
-   NETFLIX-ZUUL-API-GATEWAY-SERVER
-   LIMITS-SERVICE
-   CURRENCY-EXCHANGE-SERVICE
-   CURRENCY-CONVERSION-SERVICE
-   CLIENT-SERVICE




[To get More info about this repo](./moreinfo.md)

Please follow these steps:
- [Go to Swagger UI](http://localhost:5200/swagger-ui/index.html)
- Authorize Yourself in Swagger by following Steps:
    - Execute login request with body `{"username": "ubaid", "password":"changeme"}` like below
      ![Execute Login Request](execute-login-reqeust.png)
    - Copy the Access Token
       ![Copy Access Token](copy-access-token.png)
    - Click on Authorize button and paste Access Token in Authorization popup prepending with `Bearer ` (Note there is space between Bearer and Access Token)
       ![Paste Access Token](pase-acces-token.png)
    - Execute a protected request like below
       ![Execute a Protected Request](execute-exchnage-request.png)
    - See the Response
       ![See the Response](see-the-response.png) 
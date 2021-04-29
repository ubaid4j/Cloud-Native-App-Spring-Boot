![Auth Flow](auth-flow-v1.png)

Detail:
======
1. For User End Clients (Like web browser), We have registered a public client in KC auth server like blow. When a user login into the web browser and access this 3cn app, then first it redirects to KC server login page to authorize itself.
It authorizes the user on its user roles.
![3CN React Client](3cn-react-client.png)
![3CN React Client Access Type](3cn-react-client-access-type.png)
   
2. When user access protected resource, then this client request to `api-composer` to get processed protected resource. 
3. `api-composer` first validate this request using the `Keycloak Adpater`. `api-composer` then check the user-role for the protected resource.
4. After validating the request and validate the user-role, `api-composer` get the required resource from the protected resource-server hidden behind the `api-gateway-server`.
5. `api-composer` request first goes to `api-gateway-server` which validate the request and re-route this request to respective `resource server`

Validation
==========
1. #### User Role Validation
In 3cn App, we are validating User Roles at `Clients` and `api-composer` level
2. #### Scope Validation
In 3cn App, we are validating Scopes in `resource-server` level only.
3. #### Audience Validation
In 3cn App, we are validating Audience in `resource-server` level only.
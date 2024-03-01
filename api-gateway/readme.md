### About
- An edge service which is primarily responsible to route request to the downstream services.

### How to Run
#### Local In IDE (dev mode + hot reload)
- Start API-GATEWAY BE (Shift+F10 in IntelliJ idea)
- START UI by `npm start`
- navigate to http://localhost:40000
#### Docker (go the deployment directory)
- `docker compose up -d api-gateway`
- navigate to http://localhost:40000

#### K8s (minikube)
- `kubectl apply -k k8s/`
- navigate to http://social-app.ai
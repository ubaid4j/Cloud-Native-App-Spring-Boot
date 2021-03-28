import Keycloak from 'keycloak-js';
// Setup Keycloak instance as needed
// Pass initialization options as required or leave blank to load from 'keycloak-dev.json'
const env = process.env.NODE_ENV === 'development';
console.log(process.env.NODE_ENV);
let keycloakPath;
if (env) {
    keycloakPath = 'keycloak-dev.json';
} else {
    keycloakPath = 'keycloak.json';
}
const kc = new Keycloak(keycloakPath);
kc.redirectUri='http://localhost:3000';
export default kc;

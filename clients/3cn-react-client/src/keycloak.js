import Keycloak from 'keycloak-js';

// Setup Keycloak instance as needed
// Pass initialization options as required or leave blank to load from 'keycloak.json'
const kc = new Keycloak();
kc.redirectUri='http://localhost:3000';
export default kc;

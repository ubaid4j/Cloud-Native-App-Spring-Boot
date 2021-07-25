import Keycloak from 'keycloak-js';
// Setup Keycloak instance as needed
// Pass initialization options as required or leave blank to load from 'keycloak-dev.json'
const env = process.env.REACT_APP_ENV;
console.log('-----------Environment---------------: ', env);
let keycloakPath;
let redirectUri;
if (env === 'dev') {
    keycloakPath = 'keycloak-dev.json';
    redirectUri = 'http://localhost:3000';
} else if (env === 'prod') {
    keycloakPath = 'keycloak-prod.json';
    redirectUri = 'http://currency-converter.io/';
} else {
    keycloakPath = 'keycloak-local.json';
    redirectUri = 'http://localhost:3000';
}

const kc = new Keycloak(keycloakPath);
kc.redirectUri=redirectUri;

export default kc;

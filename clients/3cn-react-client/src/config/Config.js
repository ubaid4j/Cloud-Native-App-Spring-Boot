import Keycloak from 'keycloak-js';
const keyCloakConfFilePath = process.env.PUBLIC_URL + '/keycloak.json';
const keycloak = new Keycloak(keyCloakConfFilePath);
keycloak.redirectUri='http://localhost:3000/Cloud-Native-App-Spring-Boot';
export default keycloak;

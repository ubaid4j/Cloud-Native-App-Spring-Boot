import axios from 'axios';


const env = process.env.REACT_APP_ENV;
let baseURL;
if (env === 'prod') {
    baseURL = 'http://currency-converter.api-gateway.io/api';
} else {
    baseURL = 'http://localhost:8755/api';
}

const RequestHandler = axios.create({
    baseURL: baseURL,
    headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
    }
});
export default RequestHandler;

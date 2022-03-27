import axios from 'axios';


const env = process.env.REACT_APP_ENV;
let baseURL;
if (env === 'prod') {
    baseURL = 'http://currency-converter.api-gateway.io';
} else {
    baseURL = 'http://localhost:8755';
}

const RequestHandler = axios.create({
    baseURL: baseURL,
    headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
    }
});
export default RequestHandler;

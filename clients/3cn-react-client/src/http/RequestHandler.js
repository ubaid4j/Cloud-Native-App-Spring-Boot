import axios from 'axios';


const env = process.env.NODE_ENV === 'development';
let baseURL;
if (env) {
    baseURL = 'http://localhost:8755';
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

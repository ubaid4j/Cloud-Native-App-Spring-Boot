import axios from 'axios';


const env = process.env.NODE_ENV === 'development';
let baseURL;
if (env) {
    baseURL = 'http://localhost:5200/api/';
} else {
    baseURL = 'https://b5ada40c55b9.ngrok.io/api/';
}

const RequestHandler = axios.create({
    baseURL: baseURL,
    headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
    }
});
export default RequestHandler;

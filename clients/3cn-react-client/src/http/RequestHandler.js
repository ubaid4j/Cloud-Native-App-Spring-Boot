import axios from 'axios';
const RequestHandler = axios.create({
    baseURL: 'http://localhost:5200/api/',
    headers: {'Access-Control-Allow-Origin': '*'}
});
export default RequestHandler;

import {createStore} from 'redux';
import {AuthReducer} from 'store/reducers/AuthReducer';
const store = createStore(AuthReducer);
export default store;

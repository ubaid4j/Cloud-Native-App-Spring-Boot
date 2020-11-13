import React from 'react';
import ReactDOM from 'react-dom';
import {applyMiddleware, combineReducers, createStore} from 'redux';
import {Provider} from 'react-redux';
import thunk from 'redux-thunk';
import {composeWithDevTools} from 'redux-devtools-extension';
import 'index.css';
import App from 'App';
import reportWebVitals from 'reportWebVitals';
import CountryReducer from 'store/reducers/CountryReducer';


const env = process.env.NODE_ENV === 'development';

const rootReducer = combineReducers(
    {
        country: CountryReducer
    }
);

let store;
if (env) {
    store = createStore(rootReducer, composeWithDevTools(applyMiddleware(thunk)));
} else {
    store = createStore(rootReducer, applyMiddleware(thunk));
}


ReactDOM.render(
    <Provider store={store}>
        <React.StrictMode>
            <App/>
        </React.StrictMode>,
    </Provider>,
    document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

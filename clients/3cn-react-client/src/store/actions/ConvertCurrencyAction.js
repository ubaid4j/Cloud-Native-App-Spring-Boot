import {
    CONVERT_CURRENCY_START,
    CONVERT_CURRENCY_COMPLETE,
    CONVERT_CURRENCY_ERROR
} from 'store/ActionTypes';

import RequestHandler from 'http/RequestHandler';

export const ConvertCurrency = ({fromCountryCode, toCountryCode, amount, accessToken}) => {
    let config = {
        headers: {
            'Authorization': 'Bearer ' + accessToken,
        }
    };
    return dispatch => {
        dispatch(convertCurrencyStart());
        RequestHandler.get(`currency-conversion/v1/${fromCountryCode}/to/${toCountryCode}/q/${amount}`, config)
            .then(res => {
                console.log(res);
                dispatch(convertCurrencyComplete(res.data));
            })
            .catch(err => {
                console.log(err);
                dispatch(convertCurrencyError(err));
            });
    };
};

const convertCurrencyStart = () => {
    return {
        type: CONVERT_CURRENCY_START
    };
};

const convertCurrencyComplete = (data) => {
    return {
        type: CONVERT_CURRENCY_COMPLETE,
        data: data
    };
};

const convertCurrencyError = (error) => {
    return {
        type: CONVERT_CURRENCY_ERROR,
        error: error
    };
};

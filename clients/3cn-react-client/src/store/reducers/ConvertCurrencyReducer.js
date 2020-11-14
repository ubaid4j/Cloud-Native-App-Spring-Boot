import {
    CONVERT_CURRENCY_ERROR,
    CONVERT_CURRENCY_COMPLETE,
    CONVERT_CURRENCY_START
} from 'store/ActionTypes';

const initialState = {
    convertedData: null,
    loading: false,
    error: false
};

const ConvertCurrencyReducer = (state = initialState, action) => {
    switch (action.type) {
    case CONVERT_CURRENCY_COMPLETE:
        return {...state, convertedData: action.data, loading: false};
    case CONVERT_CURRENCY_START:
        return {...state, loading: true, error: false};
    case CONVERT_CURRENCY_ERROR:
        return {...state, loading: false, error: true};
    default:
        return state;
    }
};
export default ConvertCurrencyReducer;

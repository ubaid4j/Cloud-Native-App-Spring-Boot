import {SELECT_FROM_COUNTRY, SELECT_TO_COUNTRY} from 'store/ActionTypes';

const initialState = {
    fromCountry: null,
    toCountry: null
};

export const SelectCountryReducer = (state = initialState, action) => {
    switch (action.type) {
    case SELECT_FROM_COUNTRY:
        return {...state, fromCountry: action.country};
    case SELECT_TO_COUNTRY:
        return {...state, toCountry: action.country};
    default:
        return state;
    }
};

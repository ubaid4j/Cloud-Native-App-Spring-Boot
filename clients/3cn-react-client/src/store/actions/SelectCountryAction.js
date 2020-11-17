import {SELECT_TO_COUNTRY, SELECT_FROM_COUNTRY} from 'store/ActionTypes';

export const SelectFromCountry = (country) => {
    console.log('SelectFromCountry: country ----> ', country);
    return {
        type: SELECT_FROM_COUNTRY,
        country: country
    };
};

export const SelectToCountry = (country) => {
    console.log('SelectToCountry: country ----> ', country);
    return {
        type: SELECT_TO_COUNTRY,
        country: country
    };
};

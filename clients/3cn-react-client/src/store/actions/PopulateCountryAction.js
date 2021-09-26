import {
    POPULATE_COUNTRIES_ERROR,
    POPULATE_COUNTRIES_FINISHED,
    POPULATE_COUNTRIES_START
} from 'store/ActionTypes';
import RequestHandler from 'http/RequestHandler';

export const PopulateCountryCodes = (accessToken) => {

    let config = {
        headers: {
            'Authorization': 'Bearer ' + accessToken,
        }
    };

    return dispatch => {
        dispatch(populateCountryCodeStart());
        RequestHandler.get('country/v1/code', config)
            .then(res => {
                console.log(res);
                dispatch(populateCountryFinished(res.data));
            })
            .catch(err => {
                console.log(err);
                dispatch(error());
            });
    };
};

const populateCountryFinished = (countries) => {
    return {
        type: POPULATE_COUNTRIES_FINISHED,
        countries: countries
    };
};

const populateCountryCodeStart = () => {
    console.log('Populating Country Codes Start');
    return {
        type: POPULATE_COUNTRIES_START
    };
};

const error = () => {
    console.log('There is some error in populating country codes');
    return {
        type: POPULATE_COUNTRIES_ERROR
    };
};

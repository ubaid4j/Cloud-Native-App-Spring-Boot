import {
    POPULATE_COUNTRIES_ERROR,
    POPULATE_COUNTRIES_FINISHED,
    POPULATE_COUNTRIES_START
} from 'store/ActionTypes';

const initialState = {
    countries: [],
    error: null,
    loading: false
};

const PopulateCountryReducer = (state = initialState, action) => {

    switch (action.type) {
    case POPULATE_COUNTRIES_FINISHED:
        return {...state, countries: action.countries, error: false, loading: false};
    case POPULATE_COUNTRIES_START:
        return {...state, loading: true, error: false};
    case POPULATE_COUNTRIES_ERROR:
        return {...state, error: true, loading: false};
    default:
        return state;
    }
};
export default PopulateCountryReducer;

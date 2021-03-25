import {ADD_ACCESS_TOKEN} from 'store/ActionTypes';

const initialState = {
    accessToken: null
};

export const AuthReducer = (state = initialState, action) => {
    switch (action.type) {
    case ADD_ACCESS_TOKEN:
        return {...state, accessToken: action.accessToken};
    default:
        return state;
    }
};

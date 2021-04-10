import {ADD_ACCESS_TOKEN} from 'store/ActionTypes';

export const AddAccessToken = (accessToken) => {
    return {
        type: ADD_ACCESS_TOKEN,
        accessToken: accessToken
    };
};

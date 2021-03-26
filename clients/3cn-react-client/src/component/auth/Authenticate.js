import React, {useCallback} from 'react';
import {useKeycloak} from '@react-keycloak/web';
import {Redirect} from 'react-router-dom';
import {useDispatch} from 'react-redux';
import {AddAccessToken} from 'store/actions/AuthAction';

const Authenticate = () => {
    console.log('--------------------------------------------Authenticate-----------------------------------');

    const {initialized, keycloak} = useKeycloak();
    const dispatch = useDispatch();
    const addAccessToken = useCallback((accessToken) => dispatch(AddAccessToken(accessToken)), []);

    console.log('In Authenticate: initialized', initialized);
    console.log('In Authenticate: keycloak', keycloak);

    if (initialized && keycloak && !keycloak.authenticated) {
        console.log('In Authenticate: Login called');
        keycloak.login();
    }

    if (!initialized || !keycloak || !keycloak.authenticated) {
        return (
            <div>
                Authenticating, please wait....
            </div>
        );
    }

    if (initialized && keycloak && keycloak.authenticated) {
        console.log('-----------------------In Authenticate---------------', keycloak);
        addAccessToken(keycloak.token);

        return (
            <Redirect to={'/home'} />
        );
    }
};

export default Authenticate;

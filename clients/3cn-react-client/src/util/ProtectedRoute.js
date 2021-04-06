import { useKeycloak } from '@react-keycloak/web';
import React from 'react';
import { Redirect, Route } from 'react-router-dom';
import PropTypes from 'prop-types';


const ProtectedRoute = ({ component: Component, roles, ...rest }) => {
    const {initialized, keycloak} = useKeycloak();

    const isAuthorized = (roles) => {
        if (keycloak && roles) {
            const isAuth = roles.some(r => {
                const realm =  keycloak.hasRealmRole(r);
                const resource = keycloak.hasResourceRole(r);
                return realm || resource;
            });
            console.log('Is Current User is Authorized: ------------------------------- ', isAuth);
            return isAuth;
        }
        return false;
    };

    if (initialized && keycloak && !keycloak.authenticated) {
        console.log('---------------------------Login called ----------------------------');
        keycloak.login();
    }

    return (
        <Route
            {...rest}
            render={props => {
                return isAuthorized(roles)
                    ? <Component {...props} />
                    : <Redirect to={'/'} />;
            }}
        />
    );
};
ProtectedRoute.propTypes = {
    roles: PropTypes.any,
    component: PropTypes.any,
};
export default ProtectedRoute;

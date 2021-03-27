import {useKeycloak} from '@react-keycloak/web';
import {Redirect} from 'react-router-dom';
import React from 'react';

const UserInfo = () => {
    const { keycloak, initialized } = useKeycloak();

    if (keycloak && initialized && keycloak.authenticated) {
        return (
            <div>
                Hello {keycloak.tokenParsed.preferred_username}
                <div>
                    <a href='/converter'>Click here to go for Converter</a>
                </div>
            </div>
        );
    } else {
        return (<Redirect to={{ pathname: '/', }} />);
    }
};
export default UserInfo;

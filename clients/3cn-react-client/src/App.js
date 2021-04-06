import 'App.css';
import React, {Suspense} from 'react';
import {Route, Switch} from 'react-router';
import Layout from 'hoc/Layout/Layout';
import CurrencyConverter from 'container/CurrencyConverter/CurrencyConverter';
import UserInfo from 'component/userinfo/UserInfo';
import ServiceDown from 'component/down/ServiceDown';
import ProtectedRoute from 'util/ProtectedRoute';
import Authenticate from 'component/auth/Authenticate';
import {ReactKeycloakProvider} from '@react-keycloak/web';
import keycloak from 'keycloak';

const App = () => {

    let routes = (
        <Switch>
            <Suspense fallback={<p>Loading.....</p>}>
                <Route path={'/'} component={Authenticate} />
                <ProtectedRoute path={'/home'} exact component={UserInfo} roles={['user']}/>
                <ProtectedRoute path={'/converter'} exact component={CurrencyConverter} roles={['user']}/>
                <Route path={'/down'} exact component={ServiceDown} />
            </Suspense>
        </Switch>
    );

    return (
        <ReactKeycloakProvider authClient={keycloak}>
            <div className='App'>
                <Layout>
                    {routes}
                </Layout>
            </div>
        </ReactKeycloakProvider>
    );
};
export default App;

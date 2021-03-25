import 'App.css';
import React, {Suspense} from 'react';
import {Redirect, Route, Switch} from 'react-router';
import Layout from 'hoc/Layout/Layout';
import CurrencyConverter from 'container/CurrencyConverter/CurrencyConverter';
import ServiceDown from 'component/down/ServiceDown';
import ProtectedRoute from './util/ProtectedRoute';
import Authenticate from './component/auth/Authenticate';
import {ReactKeycloakProvider} from '@react-keycloak/web';
import keycloak from 'config/Config';

const App = () => {

    let routes = (
        <Switch>
            <Suspense fallback={<p>Loading.....</p>}>
                <Route path={'/auth'} exact component={Authenticate} />
                <ProtectedRoute path='/' exact component={CurrencyConverter} roles={['user', 'offline_access']}/>
                <Route path='/down' exact component={ServiceDown} />
                <Route render={() => <Redirect to='/' />}/>
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

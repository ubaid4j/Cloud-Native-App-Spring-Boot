import 'App.css';
import React, {Suspense} from 'react';
import {Redirect, Route, Switch} from 'react-router';
import Layout from 'hoc/Layout/Layout';
import CurrencyConverter from 'container/CurrencyConverter/CurrencyConverter';
import ServiceDown from 'component/down/ServiceDown';

const App = () => {

    let routes = (
        <Switch>
            <Suspense fallback={<p>Loading.....</p>}>
                <Route path='/' exact component={CurrencyConverter}/>
                <Route path='/down' exact component={ServiceDown} />
                <Route render={() => <Redirect to='/' />}/>
            </Suspense>
        </Switch>
    );

    return (
        <div className='App'>
            <Layout>
                {routes}
            </Layout>
        </div>
    );
};
export default App;

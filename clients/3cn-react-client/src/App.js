import 'App.css';
import React from 'react';
import Layout from 'hoc/Layout/Layout';
import CurrencyConverter from 'container/CurrencyConverter/CurrencyConverter';

const App = () => {
    return (
        <div className='App'>
            <Layout>
                <CurrencyConverter />
            </Layout>
        </div>
    );
};
export default App;

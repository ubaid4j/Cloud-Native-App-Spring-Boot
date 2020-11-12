import React from 'react';
import {Grid} from '@material-ui/core';
import CountrySelect from 'component/selectCountry/CountrySelect';

const CurrencyConverter = () => {
    return (
        <>
            <Grid container spacing={3} style={{marginTop: '16px'}} justify={'center'}>
                <Grid item lg={3} md={4} sm={6} xs={12}>
                    <CountrySelect/>
                </Grid>
                <Grid item lg={3} md={4} sm={6} xs={12}>
                    <CountrySelect/>
                </Grid>
            </Grid>
        </>
    );
};
export default CurrencyConverter;

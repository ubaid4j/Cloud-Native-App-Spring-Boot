import React, {useCallback, useEffect, useState} from 'react';
import {Button, Grid} from '@material-ui/core';
import CheckIcon from '@material-ui/icons/Check';
import CountrySelect from 'component/selectCountry/CountrySelect';
import TextField from '@material-ui/core/TextField';
import {useDispatch, useSelector} from 'react-redux';
import {PopulateCountryCodes} from 'store/actions/PopulateCountryAction';
import ConversionPaper from 'component/convertionPaper/ConversionPaper';
import {SelectFromCountry, SelectToCountry} from 'store/actions/SelectCountryAction';
import {ConvertCurrency} from 'store/actions/ConvertCurrencyAction';
import {Redirect} from 'react-router';
import {useKeycloak} from '@react-keycloak/web';

const CurrencyConverter = () => {
    const { keycloak, initialized } = useKeycloak();

    const dispatch = useDispatch();

    const accessToken = useSelector(state => state.auth.accessToken);

    const populateCountryCodes = useCallback((accessToken) => dispatch(PopulateCountryCodes(accessToken)), []);
    const selectFromCountry = useCallback((country) => dispatch(SelectFromCountry(country)), []);
    const selectToCountry = useCallback((country) => dispatch(SelectToCountry(country)), []);
    const convertCurrency = useCallback(({fromCountryCode, toCountryCode, amount, accessToken}) => dispatch(ConvertCurrency({fromCountryCode, toCountryCode, amount, accessToken})), []);

    const toCountry = useSelector(state => state.selectCountry.toCountry);
    const fromCountry = useSelector(state => state.selectCountry.fromCountry);
    const convertedData = useSelector(state => state.convertCurrency.convertedData);
    const populateCountriesError = useSelector(state => state.countries.error);

    const [amount, setAmount] = useState(0);

    useEffect(() => {
        populateCountryCodes(accessToken);
    }, []);

    if (populateCountriesError) {
        return <Redirect to='/down' />;
    }

    if (keycloak && initialized && keycloak.authenticated) {
        return (
            <>
                <Grid container spacing={3} style={{marginTop: '16px'}} justify={'center'}>
                    <Grid item lg={3} md={4} sm={6} xs={12}>
                        <CountrySelect id={'fromCountry'} value={fromCountry} onChangeValue={selectFromCountry}/>
                    </Grid>
                    <Grid item lg={3} md={4} sm={6} xs={12}>
                        <CountrySelect id={'toCountry'} value={toCountry} onChangeValue={selectToCountry}/>
                    </Grid>
                </Grid>
                <Grid container spacing={3} style={{marginTop: '8px'}} justify={'center'}>
                    <TextField type={'number'} id="outlined-basic" label="Enter Amount" variant="outlined"
                        value={amount} onChange={(event) => setAmount(event.target.value)}/>
                </Grid>
                <Grid container spacing={3} style={{marginTop: '32px'}} justify={'center'}>
                    <Grid item lg={6} md={8} sm={12} xs={12}>
                        <ConversionPaper convertedAmount={convertedData} fromCountry={fromCountry}
                            toCountry={toCountry}/>
                    </Grid>
                </Grid>
                <Grid container spacing={3} style={{marginTop: '8px'}} justify={'center'}>
                    <Button
                        variant={'contained'}
                        color={'primary'}
                        endIcon={<CheckIcon/>}
                        onClick={() => {
                            const fromCountryCode = fromCountry['currencyCode'];
                            const toCountryCode = toCountry['currencyCode'];
                            convertCurrency({fromCountryCode, toCountryCode, amount, accessToken});
                        }}
                    >
                        Convert
                    </Button>
                </Grid>
            </>
        );
    } else {
        return (<Redirect to={{ pathname: '/converter', }} />);
    }
};
export default CurrencyConverter;

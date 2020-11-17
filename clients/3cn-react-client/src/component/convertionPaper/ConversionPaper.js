import PropTypes from 'prop-types';
import React from 'react';
import {Container, Typography} from '@material-ui/core';

const ConversionPaper = ({fromCountry, toCountry, convertedAmount}) => {
    return (
        <Container>
            <Typography>{fromCountry ? fromCountry.currencyName + ' ' + fromCountry.country + '(' + fromCountry.currencyCode + ')' : ''} to {toCountry ? toCountry.currencyName + ' ' + toCountry.country + '(' + toCountry.currencyCode + ')' : ''}</Typography>
            <br/>
            <Typography> The Converted Amount is: {convertedAmount ? convertedAmount.exchangedCurrencyQuantity : ''}</Typography>
        </Container>
    );
};

export default ConversionPaper;

ConversionPaper.propTypes = {
    fromCountry : PropTypes.object,
    toCountry : PropTypes.object,
    convertedAmount: PropTypes.object
};


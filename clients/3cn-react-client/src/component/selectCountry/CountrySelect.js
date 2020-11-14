import PropTypes from 'prop-types';
import React from 'react';
import TextField from '@material-ui/core/TextField';
import Autocomplete from '@material-ui/lab/Autocomplete';
import { makeStyles } from '@material-ui/core/styles';
import {useSelector} from 'react-redux';

// ISO 3166-1 alpha-2
// ⚠️ No support for IE 11
function countryToFlag(isoCode) {
    return typeof String.fromCodePoint !== 'undefined'
        ? isoCode !== null ?
            isoCode
                .toUpperCase()
                .replace(/./g, (char) => String.fromCodePoint(char.charCodeAt(0) + 127397))
            : isoCode : null;
}

const useStyles = makeStyles({
    option: {
        fontSize: 15,
        '& > span': {
            marginRight: 10,
            fontSize: 18,
        },
    },
});

// const countries = [
//     { code: 'AD', label: 'Andorra', phone: '376' },
//     { code: 'AE', label: 'United Arab Emirates', phone: '971' },
// ];

const CountrySelect = ({id, value, onChangeValue}) => {
    const classes = useStyles();

    const countries = useSelector(state => state.countries.countries);


    return (
        <Autocomplete
            id={id}
            value={value}
            onChange={(event, newValue) => {console.log(newValue); onChangeValue(newValue);}}
            style={{ width: 300 }}
            options={countries}
            classes={{
                option: classes.option,
            }}
            autoHighlight
            getOptionLabel={option => option.country}
            renderOption={option => (
                <>
                    <span>{countryToFlag(option.isoCode)}</span>
                    {option.currencyName} ({option.currencyCode})
                </>
            )}
            renderInput={params => (
                <TextField
                    {...params}
                    label="Choose a country"
                    variant="outlined"
                    inputProps={{
                        ...params.inputProps,
                        autoComplete: 'new-password', // disable autocomplete and autofill
                    }}
                />
            )}
        />
    );
};
export default CountrySelect;

CountrySelect.propTypes = {
    id: PropTypes.string,
    value: PropTypes.object,
    onChangeValue: PropTypes.func
};



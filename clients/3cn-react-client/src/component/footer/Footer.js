import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import BottomNavigation from '@material-ui/core/BottomNavigation';
import BottomNavigationAction from '@material-ui/core/BottomNavigationAction';
import InfoIcon from '@material-ui/icons/Info';
import RestoreIcon from '@material-ui/icons/Restore';

const useStyles = makeStyles({
    root: {
        flexGrow: 1,
        width: '100%',
        position: 'fixed',
        bottom: 0
    },
});


const Footer = () => {

    const classes = useStyles();
    const [value, setValue] = React.useState('Recents');

    const handleChange = (event, newValue) => {
        setValue(newValue);
    };
    return (
        <BottomNavigation value={value} onChange={handleChange} className={classes.root}>
            <BottomNavigationAction label='Recents' value='recents' icon={<RestoreIcon />} />
            <BottomNavigationAction label='About' value='About' icon={<InfoIcon />} />
        </BottomNavigation>
    );
};
export default Footer;

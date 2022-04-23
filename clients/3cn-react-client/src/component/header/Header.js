import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import { useKeycloak } from '@react-keycloak/web';
import {IconButton, Typography} from '@material-ui/core';

const useStyles = makeStyles((theme) => ({
    menuButton: {
        marginRight: theme.spacing(2),
    },
    title: {
        flexGrow: 1,
        textAlign: 'start'
    },
    root: {
        flexGrow: 1,
    },
}));

const Header = () => {

    const classes = useStyles();
    const { keycloak, } = useKeycloak();

    const loggedInUserName = keycloak.authenticated ? keycloak.tokenParsed.preferred_username.toUpperCase() : '';
    
    return (
        <div className={classes.root}>
            <AppBar position="static">
                <Toolbar>
                    <Typography
                        variant="h6"
                        noWrap
                        component="div"
                        sx={{ mr: 2, display: { xs: 'none', md: 'flex' }, flexGrow: 1 }}
                        className={classes.title}
                    >
                        {!!keycloak.authenticated && (
                            <>
                                Welcome {loggedInUserName} in&nbsp;
                            </>
                        )}
                        Currency Converter
                    </Typography>
                    {!!keycloak.authenticated && (
                        <IconButton 
                            edge="end"
                            color="inherit"
                            aria-label="menu"
                            sx={{flexGrow: 1}}
                            onClick={() => keycloak.logout()}>
                            Sign out
                        </IconButton>
                    )}
                </Toolbar>
            </AppBar>
        </div>
    );
};
export default Header;

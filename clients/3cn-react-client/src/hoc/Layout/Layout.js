import React from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Container from '@material-ui/core/Container';
import PropTypes from 'prop-types';
import Header from 'component/header/Header';
import Footer from 'component/footer/Footer';

const Layout = props => {
    return (
        <>
            <CssBaseline/>
            <Header />
            <Container maxWidth={'lg'}>
                {props.children}
            </Container>
            <Footer />
        </>
    );
};
export default Layout;

Layout.propTypes = {
    children: PropTypes.any
};


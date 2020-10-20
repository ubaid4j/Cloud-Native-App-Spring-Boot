-- liquibase formatted sql
-- changeset  ubaid:20Oct2020_2157
-- comment creating exchange rate table
create table exchange_rate(
    id varchar(255) primary key,
    timestamp datetime,
    from_currency varchar(255),
    to_currency varchar(255),
    exchange_rate double
);
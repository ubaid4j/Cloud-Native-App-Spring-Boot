-- liquibase formatted sql
-- changeset  ubaid:18Oct2020_2144

create table country_code (
    id bigint primary key auto_increment,
    country varchar(255),
    country_code varchar(255),
    currency_name varchar(255),
    number int
);

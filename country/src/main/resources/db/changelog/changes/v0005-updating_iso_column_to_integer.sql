-- liquibase formatted sql
-- changeset  ubaid:12Nov2020_1958
-- comment add column iso code in country code table
alter table country_code
    modify iso_code varchar(2);
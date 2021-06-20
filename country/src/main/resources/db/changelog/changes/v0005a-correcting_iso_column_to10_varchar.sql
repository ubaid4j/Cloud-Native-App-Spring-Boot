-- liquibase formatted sql
-- changeset  ubaid:12Nov2020_2001
-- comment add column iso code in country code table
alter table country_code
    modify iso_code varchar(10);
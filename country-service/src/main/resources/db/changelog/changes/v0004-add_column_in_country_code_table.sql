-- liquibase formatted sql
-- changeset  ubaid:12Nov2020_1847
-- comment add column iso code in country code table
alter table country_code
add iso_code int;
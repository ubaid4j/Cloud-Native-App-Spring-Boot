-- liquibase formatted sql
-- changeset  ubaid:18Oct2020_2005
-- comment changing name of column
alter table country_code
    rename column country_code to currency_code;

alter table audit
modify column exchange_rate double;

alter table audit
modify column from_currency_value double;

alter table audit
modify column to_currency_value double;

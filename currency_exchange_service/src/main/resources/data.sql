SET FOREIGN_KEY_CHECKS = 0; 
-- TRUNCATE TABLE  post;
TRUNCATE TABLE exchange_value;
SET FOREIGN_KEY_CHECKS = 1;

insert into 
	exchange_value(currency_from, currency_to, exchange_rate)
values
	('USD', 'PKR', 156.75),
	('EUR', 'PKR', 171.88),
	('AUD', 'PKR', 105.38);

create table audit (
    id bigint primary key auto_increment,
    created_at timestamp,
    currency_conversion_port int,
    currency_conversion_url varchar(255),
    currency_exchange_port int,
    currency_exchange_url varchar(255),
    exchange_rate float,
    from_currency varchar(255),
    from_currency_value float,
    to_currency varchar(255),
    to_currency_value float,
    is_deleted boolean,
    last_updated timestamp,
    user_ip_address varchar(255),
    user_uuid varchar(255)
)
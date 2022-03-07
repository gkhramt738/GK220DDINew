create table customers
(
    customerId int auto_increment
        primary key,
    firstname  varchar(20) null,
    lastname   varchar(20) null,
    constraint customerId
        unique (customerId)
);

create table orders
(
    orderId    int auto_increment
        primary key,
    product    varchar(20) null,
    cost       int         null,
    customerId int         null,
    constraint orderId
        unique (orderId),
    constraint orders_ibfk_1
        foreign key (customerId) references customers (customerId)
);

create index customerId
    on orders (customerId);


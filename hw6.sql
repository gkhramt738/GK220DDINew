create table customers
(
    customerID int auto_increment,
    constraint customerID
        unique (customerID)
);

create table orders
(
    orderId    int auto_increment,
    cost       decimal(9, 2) null,
    customerId int           null,
    constraint orderId
        unique (orderId),
    constraint orders_ibfk_1
        foreign key (customerId) references customers (customerID)
);

create index customerId
    on orders (customerId);

create table products
(
    productId   int auto_increment
        primary key,
    description char(100) null,
    constraint productId
        unique (productId)
);

create table order_product_association
(
    id        int auto_increment
        primary key,
    order_id  int not null,
    productId int not null,
    constraint id
        unique (id),
    constraint order_product_association_ibfk_1
        foreign key (order_id) references orders (orderId),
    constraint order_product_association_ibfk_2
        foreign key (productId) references products (productId)
);

create index order_id
    on order_product_association (order_id);

create index productId
    on order_product_association (productId);



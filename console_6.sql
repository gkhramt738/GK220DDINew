USE store;
DROP TABLE if exists order_product_association;
DROP TABLE if exists products;
DROP TABLE if exists orders;
DROP TABLE if exists customers;

CREATE TABLE customers(
    customerID int NOT NULL UNIQUE AUTO_INCREMENT
);

CREATE TABLE orders(
    orderId    int NOT NULL UNIQUE AUTO_INCREMENT,
    cost       decimal(9,2),
    customerId int null,
    constraint orders_ibfk_1 foreign key (customerId) references customers (customerId)
);

create index customerId
    on orders (customerId);

CREATE TABLE products (
	productId int NOT NULL UNIQUE AUTO_INCREMENT,
    description char(100),
	PRIMARY KEY (productId)
);

CREATE TABLE order_product_association (
	id int NOT NULL UNIQUE AUTO_INCREMENT,
    order_id int NOT NULL,
	productId int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (order_id) references orders (orderId),
	FOREIGN KEY (productId) references products (productId)
);

INSERT INTO customers (customerID) VALUES (1);
INSERT INTO customers (customerID) VALUES (2);
INSERT INTO customers (customerID) VALUES (3);

INSERT INTO products (productId, description) VALUES (1, 'Dog food');
INSERT INTO products (productId, description) VALUES (2, 'Cat food');
INSERT INTO products (productId, description) VALUES (3, 'Fish food');

INSERT INTO orders (orderId, cost, customerId) values (1, 9.99, 1);
INSERT INTO orders (orderId, cost, customerId) values (2, 7.99, 2);
INSERT INTO orders (orderId, cost, customerId) values (3, 4.99, 3);

INSERT INTO order_product_association (order_id, productId) VALUES (1, 1);
INSERT INTO order_product_association (order_id, productId) VALUES (2, 2);
INSERT INTO order_product_association (order_id, productId) VALUES (3, 3);

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_product_association;

SELECT * FROM orders WHERE cost >= '5.00';
SELECT * FROM products WHERE description = 'Cat food';
SELECT * FROM order_product_association WHERE order_id = '2' OR productId = '3';

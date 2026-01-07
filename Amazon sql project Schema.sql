-- -------------------------------------
-- Amazon project
-- First creating Parent tables. Table 1, 2, 3 are Parent Tables.
-- -------------------------------------
-- creating tables

Create database amazon_db;
use amazon_db;

-- -------------------------------------
-- category table (Table 1)
-- -------------------------------------

create table category(
category_id int PRIMARY KEY, 
category_name varchar(20)
);

-- -------------------------------------
-- customers table (Table 2)
-- -------------------------------------

create table customers(
Customer_id int Primary key, 
first_name varchar(20),
last_name varchar(20),
state varchar(20)
);

-- --------------------------------------
-- sellers table (Table 3)
-- --------------------------------------

create table sellers(
seller_id int Primary Key,
seller_name varchar(50),
origin varchar(50)
);

-- -------------------------------------
-- products table (Table 4)
-- -------------------------------------

create table products(
product_id int Primary Key,
product_name varchar(100),
price decimal(10,2),
cogs decimal(10,2),
category_id int,
Foreign Key(category_id) references category(category_id)
);

-- ------------------------------------
-- inventory table (Table 5)
-- ------------------------------------

create table inventory(
inventory_id int Primary Key,
product_id int,
stock int,
warehouse_id int,
last_stock_date Date,
Foreign Key (product_id) references products(product_id)
);

-- ------------------------------------
-- orders table (Table 6)
-- ------------------------------------

create table orders(
order_id int Primary Key,
order_date Date,
order_status varchar(50),
customer_id int, 
seller_id int,
Foreign Key (customer_id) references customers(customer_id),
Foreign Key (seller_id) references sellers(seller_id)
); 

-- --------------------------------------
-- orders_item table (Table 7)
-- --------------------------------------

create table orders_items(
order_item_id int Primary Key,
order_id int,
product_id int,
quantity int,
price_per_unit decimal(10,2),
Foreign Key (order_id) references orders(order_id),
Foreign key (product_id) references products(product_id)
);

-- ---------------------------------------
-- payments table (Table 8)
-- ---------------------------------------

create table payments(
payment_id int Primary Key,
payment_date Date,
payment_status varchar(50),
order_id int,
Foreign Key (order_id) references orders(order_id)
);

-- -------------------------------------
-- shipping table (Table 9)
-- -------------------------------------

create table shipping(
shipping_id int Primary Key,
order_id int,
shipping_date Date,
return_date Date,
shipping_provider varchar(50),
delivery_status varchar(50),
Foreign Key (order_id) references orders(order_id)
);


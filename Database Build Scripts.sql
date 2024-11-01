CREATE DATABASE Brazil;   #Creating the Database
USE Brazil;     #Selecting the Database
SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE customers (
	customer_id varchar(50) Primary Key Not Null,
    customer_unique_id varchar (50) Not Null,
    customer_zip_code_prefix INT (10) Not Null,
    customer_city VARCHAR(50) Not Null,
    customer_state VARCHAR (20) Not Null
);    
											 #Customer Table
CREATE TABLE order_items (
	order_id VARCHAR(50) Primary Key Not Null,
    order_item_id INT (3) Not Null,
    product_id VARCHAR(50) Not Null,
    seller_id VARCHAR(50) Not Null,
    shipping_limit_date DATETIME Not Null,
    price DECIMAL(8,2) Not Null,
    freight_value Decimal(8,2) Not Null
);													#Order items Table
CREATE Table payments (
	order_id varchar (50) Primary Key Not Null,
    payment_sequential INT(3) Not Null,
    payment_method varchar(20) Not Null,
    payment_installments INT(3) Not Null,
    payment_value DECIMAL(8,2) Not Null
);													#Payments Table
CREATE TABLE order_reviews (
	review_id varchar (50) Primary Key Not Null,
    order_id varchar (50) Not Null,
    review_score INT(1) Not Null,
    review_title varchar(50),
    review_message varchar(100),
    review_creation_date datetime,
    review_answer_date datetime
); 													#Reviews Table

CREATE TABLE oders(
	order_id varchar (50) Primary Key Not Null,
    customer_id varchar (50) Not Null,
    order_status Varchar (20) Not Null,
    purchase_date DATETIME Not Null,
    approval_date DATETIME,
    delivery_to_carrier_date DATETIME,
    estimated_date_of_delivery DATETIME,
    delivery_date DATETIME
); 													#Orders Table

CREATE TABLE products (
	product_id varchar (50) Primary Key Not Null,
    category_name varchar(50),
    product_weight_g int (8),
    product_length_cm int (8),
    product_height_cm int (8),
    product_width_cm int(8)
); 													#Products Table

CREATE TABLE sellers (
	seller_id varchar(50) Primary Key Not Null,
    zip_code_prefix INT(8) Not Null,
    city Varchar(50) Not Null,
    state Varchar (10) Not Null
);
CREATE TABLE geolocation (
	zip_code_prefix INT(8),
    latitude decimal (12, 8) Not Null,
    longitude decimal (13,8) Not Null,
    city Varchar (155) Not Null,
    state Varchar (50) Not Null
);   												#Geplocation Table

		#The Next Step is loading Data into out Tables
#Customers Table was loaded using the mysql import wizard although the process was extremely. Took 12hours to complete importation

#Geolocation Table
load data infile 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/olist_geolocation_dataset.csv'
into table geolocation
fields terminated by ','
ignore 1 lines;

#Order Items Table
load data infile 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/olist_order_items_dataset.csv'
into table order_items
fields terminated by ','
ignore 1 lines;

#Orders Table
load data infile 'C://ProgramData//MySQL/MySQL Server 9.0//Uploads//olist_orders_dataset.csv'
into table orders
fields terminated by ','
ignore 1 lines;

#payments Table
load data infile 'C://ProgramData//MySQL//MySQL Server 9.0//Uploads//olist_order_payments_dataset.csv'
into table payments
fields terminated by ','
ignore 1 lines;

#Products Table
load data infile 'C://ProgramData//MySQL//MySQL Server 9.0//Uploads//olist_products_dataset.csv'
into table products
fields terminated by ','
ignore 1 lines;

#Sellers Table
load data infile 'C://ProgramData//MySQL//MySQL Server 9.0//Uploads//olist_sellers_dataset.csv'
into table sellers
fields terminated by ','
ignore 1 lines;

#Reviews Table
load data infile 'C://ProgramData//MySQL//MySQL Server 9.0//Uploads//olist_order_reviews_dataset.csv'
into table order_reviews
fields terminated by ','
ignore 1 lines;


#Things to remember, the original csv datasets had several limitations that I worked on to ensre the data was clean to load into the database
#Removed duplicates
#Datetime formating to align with SQL's acceptable standard
#Removed comas in the comments since SQL read them new field markers (Used Excel's Find and Replace)
#Removed breaklines in the comments using (Used Excel's Find and Replace Fucntion with Ctr + J for denoting breaklines in excel)
#Saved the csv files in utf-8 format using Notepad to ensure special characters were loadable into the sql database


















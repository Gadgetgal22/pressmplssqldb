CREATE DATABASE PressMPLS;
USE PressMPLS;

CREATE TABLE users (
  userid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE sellers (
  sellerid INT NOT NULL auto_increment PRIMARY KEY,
  userid INT NOT NULL,
  username VARCHAR(255) NOT NULL,
  foreign key (userid) references users(userid)
);

CREATE TABLE brands (
brandid int not null auto_increment primary key,
brandname varchar(255)
);

CREATE TABLE designs (
  designid INT NOT NULL auto_increment primary KEY,
  sellerid  int not null,
  foreign key (sellerid) references sellers(sellerid)
);

CREATE TABLE products (
  productid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  designid INT NOT NULL,
  tshirtsize VARCHAR(255) NOT NULL,
  tshirtpic INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
 foreign key (designid) references designs(designid)
);

CREATE TABLE orders (
  orderid INT not null auto_increment primary KEY,
  productid INT NOT NULL,
  brandid int not null,
  foreign key (productid) references products(productid),
  foreign key (brandid) references brands(brandid)
);

CREATE TABLE purchase_cart (
  purchaseid INT not null PRIMARY KEY auto_increment,
  productid INT NOT NULL,
  quantity INT NOT NULL,
  orderid INT NOT NULL,
  brandid int not null,
  foreign key (productid) references products(productid),
  foreign key (brandid) references brands(brandid)
  );
  
  CREATE TABLE Order_details(
  OrderdetailsID int not null auto_increment primary key,
  productid int not null,
  purchaseid int not null,
  orderid int not null,
  brandname varchar(255) not null,
  brandid int not null,
  foreign key (productid) references products(productid),
  foreign key (purchaseid) references purchase_cart(purchaseid),
  foreign key (orderid) references orders(orderid),
  foreign key (brandid) references brands(brandid)
  );
  
  CREATE table billing (
  billingID int not null auto_increment primary key,
  billingAddress varchar(255) not null,
  purchaseMethod varchar(255) not null,
  shippingAddress varchar(255) not null,
  firstName varchar(255) not null,
  lastName varchar(255) not null,
  country varchar(255) not null,
  state varchar(255) not null
  );


CREATE DATABASE PressMPLS;
USE PressMPLS;

CREATE TABLE users (
  userid INT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE sellers (
  sellerid INT PRIMARY KEY,
  userid INT NOT NULL,
  username VARCHAR(255) NOT NULL,
  foreign key (userid) references users(userid)
);

CREATE TABLE designs (
  designid INT PRIMARY KEY,
  brandid INT NOT NULL,
  brandname VARCHAR(255) NOT NULL
);

CREATE TABLE products (
  productid INT PRIMARY KEY,
  designid INT NOT NULL,
  tshirtsize VARCHAR(255) NOT NULL,
  tshirtpic INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
 foreign key (designid) references designs(designid)
);

CREATE TABLE orders (
  orderid INT not null PRIMARY KEY,
  productid INT NOT NULL,
  foreign key (productid) references products(productid)
);

CREATE TABLE purchase_cart (
  purchaseid INT not null PRIMARY KEY,
  productid INT NOT NULL,
  quantity INT NOT NULL,
  orderid INT NOT NULL,
  foreign key (productid) references products(productid)
  );
  
  CREATE TABLE Order_details(
  OrderdetailsID int not null primary key,
  productid int not null,
  purchaseid int not null,
  orderid int not null,
  foreign key (productid) references products(productid),
  foreign key (purchaseid) references purchase_cart(purchaseid),
  foreign key (orderid) references orders(orderid)
);

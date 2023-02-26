create database IF NOT EXISTS store;

use store;

create table IF NOT EXISTS countries(
    code int primary key auto_increment,
    name varchar(20) unique,
    continent_name varchar(20) not null
);

create table IF NOT EXISTS users(
    id int primary key auto_increment,
    full_name varchar(20),
    email varchar(20) unique,
    gender char(1) check ( gender='m' or gender='f' ),
    date_of_birth varchar(15),
    created_at datetime default CURRENT_TIMESTAMP,
    country_code int,
    foreign key (country_code) references countries(code)
);

create table IF NOT EXISTS orders(
    id int primary key auto_increment,
    user_id int,
    status varchar(6) check ( status='start' or status='finish' ),
    created_at datetime default CURRENT_TIMESTAMP,
    foreign key (user_id) references users(id)
);

create table IF NOT EXISTS products(
    id int primary key auto_increment,
    name varchar(10) not null,
    price int default 0,
    status varchar(10) check ( status='valid' or status='expired' ),
    created_at datetime default CURRENT_TIMESTAMP
);

create table IF NOT EXISTS order_products(
    order_id int,
    product_id int,
    quantity int default 0,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

insert into countries(name, continent_name) values ('Saudi Arabia','SA');

insert into users(full_name, email, gender, date_of_birth, created_at, country_code) values ('rashed sharahili','rashed@gmail.com','m','1444',now(),1);

insert into orders(user_id, status,created_at) values (1, 'start', now());

insert into products(name, price, status, created_at) values ('phone', 3000, 'valid', now());

insert into order_products(order_id, product_id, quantity) values (1, 1, 1);

update countries set continent_name = 'Asia' where code = 1;

delete from order_products where product_id = 1;

delete from products where id = 1;

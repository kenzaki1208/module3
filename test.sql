CREATE DATABASE `my_db`;

DROP DATABASE `my_db`;

CREATE DATABASE `Demo`;

use Demo;

create table student (
	id int primary key,
    name varchar(200),
    age int,
    country varchar(50)
);

create table teacher (
	id int primary key,
    name varchar (50),
    age int,
    country varchar(50)
);

create table class (
	id int primary key,
    name varchar(50)
);

	
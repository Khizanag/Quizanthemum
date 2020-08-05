create table countries(
    id int primary key auto_increment,
    name varchar(100) not null unique,
    code varchar(10) unique
);
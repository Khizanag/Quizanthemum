create table countries(
    id int primary key auto_increment,
    name varchar(100) not null unique
);

drop table countries;

delete from countries where true;

select * from countries;
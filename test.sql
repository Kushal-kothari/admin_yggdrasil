
SELECT Name from sys.sysdatabase

create database edureka;

drop database edureka;

create table emp(
    id int not null (auto_increment),
    ename varchar(20),
    address varchar(20),
    primary key(id)
);
-- create a metabase database
-- create database metabase;

-- role
create role dataeng login password 'change_me';
create role viewer nologin;

-- create schemas
create schema landing;
create schema staging;
create schema prod;

-- grants
alter default privileges grant all on schemas to dataeng;

alter default privileges in schema landing grant all on tables to dataeng;
alter default privileges in schema staging grant all on tables to dataeng;
alter default privileges in schema prod grant all on tables to dataeng;
alter default privileges in schema prod grant select on tables to viewer;

alter default privileges in schema landing grant all on sequences to dataeng;
alter default privileges in schema staging grant all on sequences to dataeng;
alter default privileges in schema prod grant all on sequences to dataeng;

-- users
-- create role dataeng login password 'change_me';
grant dataeng to postgres;
create role tim with role dataeng login password 'change_me';
create role mb with role viewer login password 'change_me';

-- change owership of schemas
alter schema landing owner to dataeng;
alter schema staging owner to dataeng;
alter schema prod owner to dataeng;


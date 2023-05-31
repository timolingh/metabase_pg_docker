-- create a metabase database
-- create database metabase;

-- role
create role dataeng login password 'change_me';
create role viewer nologin;

-- Don't think I need this. It was there to get around some permission
-- problems with ORM
-- grant dataeng to postgres;

-- create schemas
create schema landing;
create schema staging;
create schema prod;

-- grants
grant all privileges on schema landing to dataeng;
grant all privileges on schema staging to dataeng;
grant all privileges on schema prod to dataeng;
grant usage on schema prod to viewer;

alter default privileges in schema landing grant all on tables to dataeng;
alter default privileges in schema staging grant all on tables to dataeng;
alter default privileges in schema prod grant all on tables to dataeng;
alter default privileges in schema prod for role dataeng 
    grant select on tables to viewer;

alter default privileges in schema landing grant all on sequences to dataeng;
alter default privileges in schema staging grant all on sequences to dataeng;
alter default privileges in schema prod grant all on sequences to dataeng;

-- users
create role mb login password 'change_me';
grant viewer to mb;

-- change owership of schemas
-- alter schema landing owner to dataeng;
-- alter schema staging owner to dataeng;
-- alter schema prod owner to dataeng;


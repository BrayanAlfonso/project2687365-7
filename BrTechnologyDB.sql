drop database brtechnology;
create database brtechnology;
use brtechnology;

create table users_tbl
(user_id int (11) auto_increment primary key, 
user_firstname varchar (50),
user_lastname varchar (50) ,
user_email varchar (60),
user_password varbinary (255));

create table category
(id_category int (11) auto_increment primary key,
name_category varchar (50));

create table product
(id_product int (11) auto_increment primary key,
name_product varchar (50),
value_product decimal,
id_category int (11));

INSERT INTO category values (null,"cargadores"),(null,"audifonos"),(null,"celulares");
ALTER TABLE product ADD CONSTRAINT FkPordCate FOREIGN KEY (id_category) REFERENCES category (id_category);

INSERT INTO brtechnology.users_tbl (user_firstname, user_lastname, user_email, user_password)
VALUES (UPPER('nombres'), UPPER('apellidos'), 'buzon@correo.com', AES_ENCRYPT('password', '$2a$12$hC77LspyLSLs9L1EGO2G3ODPNocQhIjgWlNznT//vBOz85YaOQbJu'));

SELECT *,CAST(AES_DECRYPT(user_password, '$2a$12$hC77LspyLSLs9L1EGO2G3ODPNocQhIjgWlNznT//vBOz85YaOQbJu') AS CHAR(50)) end_data FROM users_tbl WHERE user_id = 2;


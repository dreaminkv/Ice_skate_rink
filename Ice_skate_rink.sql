# Скрипт создания структуры БД
DROP DATABASE IF EXISTS ice_skating_rink;
CREATE DATABASE ice_skating_rink;
USE ice_skating_rink;

DROP TABLE IF EXISTS status_users;
CREATE TABLE status_users (
    id SERIAL PRIMARY KEY,
    category_users VARCHAR(50) UNIQUE
);

DROP TABLE IF EXISTS ice_skates;
CREATE TABLE ice_skates (
   id SERIAL PRIMARY KEY, 
   size_ice_skates VARCHAR(120) UNIQUE,
   quantity BIGINT,
   price_rent INT
);

DROP TABLE IF EXISTS discount;
CREATE TABLE discount (
    id SERIAL PRIMARY KEY,
    name_discount VARCHAR(50) UNIQUE,
    percent_discount BIGINT UNSIGNED NOT NULL  DEFAULT '0'
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    lastname VARCHAR(50), 
    firstname VARCHAR(50),
    patronymic VARCHAR(50), 
    email VARCHAR(120) UNIQUE,
    phone VARCHAR(15)
  );
 
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    ice_skate_size BIGINT UNSIGNED,
    personal_discount BIGINT UNSIGNED,
    category_users_id BIGINT UNSIGNED NOT NULL, 
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания запсии',
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата полседнего обновления записи',
    FOREIGN KEY (category_users_id) REFERENCES status_users(id),
    FOREIGN KEY (personal_discount) REFERENCES discount(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (ice_skate_size) REFERENCES ice_skates(id)
    );

DROP TABLE IF EXISTS sessions;
CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    sessions_in_day VARCHAR(255),
    price BIGINT,
    max_users_on_sessions BIGINT
);
    
DROP TABLE IF EXISTS workout;
CREATE TABLE workout (
    id SERIAL PRIMARY KEY,  
    visitors_id BIGINT UNSIGNED NOT NULL,
    instructor_id BIGINT UNSIGNED NOT NULL,
    sessions_id BIGINT UNSIGNED NOT NULL,
    data_workout DATE,
    price BIGINT,
    FOREIGN KEY (visitors_id) REFERENCES users(id),
    FOREIGN KEY (instructor_id) REFERENCES users(id),
    FOREIGN KEY (sessions_id) REFERENCES sessions(id)
);

DROP TABLE IF EXISTS unregistered_visitors;
CREATE TABLE unregistered_visitors (
    id SERIAL PRIMARY KEY,
    ice_skate_size_id BIGINT UNSIGNED,
    session_id BIGINT UNSIGNED,
    created_at DATE NOT NULL,
    FOREIGN KEY (ice_skate_size_id) REFERENCES ice_skates(id),
    FOREIGN KEY (session_id) REFERENCES sessions(id)
    );

DROP TABLE IF EXISTS discount_cards;
CREATE TABLE discount_cards (
    id SERIAL PRIMARY KEY,
    cardholder_user_id BIGINT UNSIGNED NOT NULL,
    card_number VARCHAR(120) UNIQUE,
    discount_id BIGINT UNSIGNED,
    FOREIGN KEY (cardholder_user_id) REFERENCES users(id),
    FOREIGN KEY (discount_id) REFERENCES discount(id)
    );
   

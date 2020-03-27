
create table categories
(
id int(11) PRIMARY KEY,
title varchar(45) NOT NULL ,
alias varchar(15) NOT NULL
);
CREATE UNIQUE INDEX id on categories(id);

CREATE TABLE lots (
id SMALLINT AUTO_INCREMENT  PRIMARY KEY,
name varchar(128) NOT NULL,
description TEXT NOT NULL,
image TEXT NOT NULL,
price INT NOT NULL,
date_start datetime NOT NULL,
date_final datetime NOT NULL,
step SMALLINT NOT NULL,
user_id INT,
category_id int(11),
winner_id INT
);
CREATE UNIQUE INDEX id on lots(id);

CREATE TABLE bets (
id INT AUTO_INCREMENT PRIMARY KEY,
lot_id  SMALLINT,
user_id INT,

bet_date datetime NOT NULL,
sum MEDIUMINT NOT NULL
);
CREATE UNIQUE INDEX id on bets(id);

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
reg_date datetime NOT NULL,
email varchar(50) NOT NULL,
name varchar(45) NOT NULL,
password varchar(50) NOT NULL,
avatar text NOT NULL,
contacts TEXT

);
CREATE UNIQUE INDEX id on users(id);

ALTER TABLE bets
ADD CONSTRAINT bets_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id),
ADD CONSTRAINT bets_ibfk_2 FOREIGN KEY (lot_id) REFERENCES  lots (id);

ALTER TABLE lots
ADD CONSTRAINT lots_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id),
ADD CONSTRAINT lots_ibfk_2 FOREIGN KEY (category_id) REFERENCES categories (id),
ADD CONSTRAINT lots_ibfk_3 FOREIGN KEY (user_id) REFERENCES users (id);
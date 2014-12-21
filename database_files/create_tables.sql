--Drop tabkes
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS STORES;
DROP TABLE IF EXISTS LAYOUTS;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS AISLES;
DROP TABLE IF EXISTS AISLES_LOCATIONS;

CREATE TABLE USERS (
    user_id     INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(15) UNIQUE NOT NULL,
    firstname   VARCHAR(30) NOT NULL,
    lastname    VARCHAR(30) NOT NULL,
    email       VARCHAR(50) UNIQUE NOT NULL,
    password    VARCHAR(50) NOT NULL
) ENGINE=InnoDB; 

CREATE TABLE STORES (
    stores_id   INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(30) NOT NULL
) ENGINE=InnoDB; 

CREATE TABLE LAYOUTS (
    layouts_id  INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    stores_id   INT(32)     NOT NULL,
    imagePath   VARCHAR(50),
    FOREIGN KEY (stores_id) REFERENCES STORES.stores_id
) ENGINE=InnoDB; 

CREATE TABLE LOCATIONS (
) ENGINE=InnoDB; 

CREATE TABLE ITEMS (
) ENGINE=InnoDB; 

CREATE TABLE CATEGORIES (
) ENGINE=InnoDB; 

CREATE TABLE AISLES (
) ENGINE=InnoDB; 

CREATE TABLE AISLES_LOCATIONS (
) ENGINE=InnoDB;

INSERT INTO USERS (username, firstname, lastname, email, password)
    VALUES ("test", "Jason", "Malutich", "jmalutich@gmail.com", PASSWORD("test"));

INSERT INTO USERS (username, firstname, lastname, email, password)
    VALUES ("test1", "Danny", "Malutich", "danoonez@gmail.com", PASSWORD("test1"));

INSERT INTO USERS (username, firstname, lastname, email, password)
    VALUES ("test2", "Mary", "Malutich", "mary.malutich@gmail.com", PASSWORD("test2"));

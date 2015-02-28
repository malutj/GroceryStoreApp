/*****************************
*    Drop tables
*****************************/
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS LOCATIONS;
DROP TABLE IF EXISTS LAYOUTS;
DROP TABLE IF EXISTS STORES;
DROP TABLE IF EXISTS ITEMS;
DROP TABLE IF EXISTS CATEGORIES;
DROP TABLE IF EXISTS AISLES;

/*****************************
*     Create USERS
*****************************/
CREATE TABLE USERS (
    user_id     INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(15) UNIQUE NOT NULL,
    firstname   VARCHAR(30) NOT NULL,
    lastname    VARCHAR(30) NOT NULL,
    email       VARCHAR(50) UNIQUE NOT NULL,
    password    VARCHAR(50) NOT NULL
) ENGINE=InnoDB; 

/*****************************
*    Create STORES
*****************************/
CREATE TABLE STORES (
    store_id   INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    companyName VARCHAR(30) NOT NULL
) ENGINE=InnoDB; 



/*****************************
*    Create LAYOUTS
*****************************/
CREATE TABLE LAYOUTS (
    layout_id  INT(32)     UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id   INT(32)     UNSIGNED NOT NULL,
    imagePath   VARCHAR(50),
    FOREIGN KEY (store_id) REFERENCES STORES (store_id) ON DELETE CASCADE
) ENGINE=InnoDB;


/*****************************
*    Create LOCATIONS
*****************************/
CREATE TABLE LOCATIONS (
    location_id INT(32)    UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id    INT(32)    UNSIGNED NOT NULL,
    layout_id   INT(32)    UNSIGNED,
    address     VARCHAR(50)    NOT NULL,
    city        VARCHAR(30)    NOT NULL,
    state       VARCHAR(2)     NOT NULL,
    zipcode     VARCHAR(10)    NOT NULL,
    FOREIGN KEY (store_id) REFERENCES STORES (store_id) ON DELETE CASCADE,
    FOREIGN KEY (layout_id) REFERENCES LAYOUTS (layout_id)
) ENGINE=InnoDB;


/*****************************
*    Create CATEGORIES
*****************************/
CREATE TABLE CATEGORIES (
    category_id    INT(32) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category    VARCHAR(30) NOT NULL
) ENGINE=InnoDB;

/*****************************
*    Create ITEMS
*****************************/
CREATE TABLE ITEMS (
    item_id    INT(32)    UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_id INT(32)   UNSIGNED,
    UPC        VARCHAR(50) NOT NULL,
    name       VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CATEGORIES (category_id)
) ENGINE=InnoDB;


/*****************************
*    Create AISLES
*****************************/
/*CREATE TABLE AISLES (
    aisleNumber    INT(16) UNSIGNED NOT NULL,
    layout_id    INT(32) NOT NULL,
    PRIMARY KEY (aisleNumber, layout_id),
    FOREIGN KEY (layout_id) REFERENCES LAYOUTS.layout_id    
) ENGINE=InnoDB; */


/*****************************
*    Create ITEMS_AISLES
*****************************/
/*CREATE TABLE ITEMS_AISLES (
    item_aisle_id    INT(32)    UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    
) ENGINE=InnoDB;*/


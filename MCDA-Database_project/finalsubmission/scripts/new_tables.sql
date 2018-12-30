set foreign_key_checks=0;
Drop TABLE if exists Books;
Drop TABLE if exists ARTICLE_AUTHOR;
Drop TABLE if exists ARTICLE;
Drop TABLE if exists MAGAZINE_VOLUME;
DROP TABLE if exists MAGAZINE;
Drop TABLE if exists TRANSACTION_ITEMS;
DROP TABLE if exists ITEM;

DROP TABLE if exists AUTHOR;
Drop TABLE if exists TRANSACTION;
Drop TABLE if exists CUSTOMERS;

Drop TABLE if exists Employee_Daily_log ;
Drop TABLE if exists MONTHLYEXPENSES;
Drop TABLE if exists Rent;
Drop TABLE if exists Employee;



create table if not exists ITEM (
  _id INT not null,
  price FLOAT(8,2) not null,
  primary key(_id)
) engine = innodb;

CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT NOT NULL ,
    book_name VARCHAR(15) NOT NULL,
    PRIMARY KEY (book_id),
    CONSTRAINT fk_books FOREIGN KEY (book_id)
        REFERENCES ITEM(_id)
)  ENGINE=INNODB;

create table if not exists MAGAZINE (
  _id INT not null ,
  name varchar(50) not null,
  primary key(_id),
  CONSTRAINT fk_magazines FOREIGN KEY (_id)
        REFERENCES ITEM(_id)
) engine = innodb;

CREATE TABLE IF NOT EXISTS MAGAZINE_VOLUME(
    vol_id INT NOT NULL,
    publication_year INT,
    magazine_id INT NOT NULL,
    PRIMARY KEY (vol_id),
    CONSTRAINT fk_mag_volumes FOREIGN KEY (magazine_id)
        REFERENCES MAGAZINE (_id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS ARTICLE (
    article_id INT NOT NULL AUTO_INCREMENT,
    vol_id INT NOT NULL,
    article_title VARCHAR(1000) NOT NULL,
    page_num varchar(20) NOT NULL,
    PRIMARY KEY (article_id),
    CONSTRAINT fk_article_volumes FOREIGN KEY (vol_id)
        REFERENCES MAGAZINE_VOLUME(vol_id)
)  ENGINE=INNODB;

create table if not exists AUTHOR (
  _id INT not null auto_increment,
  lname varchar(30) not null,
  fname varchar(30),
  email varchar(50),
  primary key(_id)
) engine = innodb;

CREATE TABLE IF NOT EXISTS ARTICLE_AUTHOR (
    art_auth_id INT NOT NULL AUTO_INCREMENT,
    author_id INT NOT NULL,
    article_id INT NOT NULL,
    PRIMARY KEY (art_auth_id),
    CONSTRAINT fk_aa_author FOREIGN KEY (author_id)
        REFERENCES AUTHOR (_id),
    CONSTRAINT fk_aa_article FOREIGN KEY (article_id)
        REFERENCES ARTICLE (article_id)
)  ENGINE=INNODB;



CREATE TABLE IF NOT EXISTS CUSTOMERS (
    cid INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    telephone VARCHAR(10) NOT NULL,
    address VARCHAR(100),
    discount_code INT ,
    PRIMARY KEY (cid)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS TRANSACTION (
    trans_id BIGINT NOT NULL AUTO_INCREMENT,
    cid INT NOT NULL,
    trans_date DATETIME NOT NULL,
    total_price VARCHAR(30) NOT NULL,
    PRIMARY KEY (trans_id),
    CONSTRAINT fk_trans_customers FOREIGN KEY (cid)
        REFERENCES CUSTOMERS (cid)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS TRANSACTION_ITEMS (
    transitem_id INT NOT NULL AUTO_INCREMENT,
    trans_id BIGINT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    quantity_price INT NOT NULL,
    PRIMARY KEY (transitem_id),
    CONSTRAINT fk_transactionsitem FOREIGN KEY (trans_id)
      REFERENCES TRANSACTION (trans_id),
    CONSTRAINT fk_tiitem FOREIGN KEY (item_id)
        REFERENCES ITEM (_id)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS Rent(
    Year INT NOT NULL AUTO_INCREMENT,
    rent_rate FLOAT NOT NULL,
    PRIMARY KEY (Year)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS MONTHLYEXPENSES (
    month INT NOT NULL,
    year INT NOT NULL,
    heat FLOAT NOT NULL,
    water FLOAT NOT NULL,
    electricity FLOAT NOT NULL,
    total_employee_expense FLOAT NOT NULL,
    PRIMARY KEY (month,year),
    CONSTRAINT fk_rent FOREIGN KEY (year)
        REFERENCES Rent (year)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS Employee (
    SIN INT NOT NULL,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    Hour_wage FLOAT NOT NULL,
    PRIMARY KEY (SIN)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS Employee_Daily_log (
    day  INT  NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    SIN  INT NOT NULL,
    Hours_Worked FLOAT NOT NULL,
    day_expense FLOAT NOT NULL,
    PRIMARY KEY (day,month,year),
    CONSTRAINT fk_monthlyexpense FOREIGN KEY (month)
        REFERENCES monthlyexpenses (month),
    CONSTRAINT fk_year FOREIGN KEY (year)
        REFERENCES monthlyexpenses (year),
    CONSTRAINT fk_employee FOREIGN KEY (SIN)
        REFERENCES employee (SIN)
)  ENGINE=INNODB;



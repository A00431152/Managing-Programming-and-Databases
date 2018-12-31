create table if not exists person (
	_id INT not null auto_increment,
	lname VARCHAR(50),
	fname VARCHAR(50),
	email VARCHAR(50),
	city VARCHAR(50),
	country VARCHAR(50),
	postalcode VARCHAR(50),
	streetnum VARCHAR(50),
	streetname VARCHAR(50),
	mainjob VARCHAR(50),
    primary key(_id)
) engine = innodb;

load data local infile 'persons.tsv' into table person;

create table if not exists history (
	pid INT,
	eyear INT,
	emonth INT,
	city VARCHAR(50),
	country VARCHAR(50),
    foreign key (pid) references person(_id)
) engine = innodb;

load data local infile 'phistory.tsv' into table history;

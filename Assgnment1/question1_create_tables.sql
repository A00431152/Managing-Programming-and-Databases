create table if not exists s (
int sno not null,
varchar(50) sname not null,
int status,
varchar(50) city,
primary key (sno)
) engine=innodb;
 
create table if not exists p (
int pno not null,
varchar(50) pname not null,
float weight,
varchar(30) color,
varchar(50) city,
primary key (pno)
) engine=innodb;
 
create table if not exists sp (
int sno not null,
int pno not null,
int qty,
primary key (sno,pno),
foreign key (sno) references s(sno),
foreign key (pno) references p(pno)
) engine=innodb;
 
insert into s values
(1,'sn1',10,'London'),
(2,'sn2',20,'Paris'),
(3,'sn3',10,'London'),
(4,'sn4',10,'Rome');
  
insert into p values
(1,'pn1',1.50,'red', 'London'),
(2,'pn2',2.50,'blue', 'Rome'),
(3,'pn3',3.50,'green', 'Rome'),
(4,'pn4',4.50,'red', 'Paris'),
(5,'pn5',5.50,'blue', 'London');
  
insert into sp values
(1,1,100),
(1,2,200),
(1,3,300),
(1,4,400),
(1,5,500),
(2,1,100),
(2,2,200),
(2,3,300),
(2,4,400),
(3,1,100),
(3,2,200),
(3,3,300),
(4,1,100);

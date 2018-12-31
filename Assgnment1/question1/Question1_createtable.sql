create table if not exists s (
sno int(2)  not null,
sname varchar(50) not null,
status int(3),
city varchar(50),
primary key (sno)
) ;

 
create table if not exists p (
pno int not null,
pname varchar(50) not null,
weight float ,
color varchar(30) ,
city varchar(50) ,
primary key (pno)
);
 
create table if not exists sp (
sno int not null,
pno int not null,
qty int,
primary key (sno,pno),
foreign key (sno) references s(sno),
foreign key (pno) references p(pno)
);
 
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
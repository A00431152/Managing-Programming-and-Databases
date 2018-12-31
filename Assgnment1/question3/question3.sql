select count(*) from customers;
select count(*) from customers where Gender='M';
select count(*) from customers where Gender='F';



select Country, sum(Gender="M") as Male ,sum(Gender ="F") as Female, sum(Gender="M")*100/count(*) as percentMale from customers group by country order by percentMale;


select p.product_id,p.product_name ,sum(o.Quantity)as "totalsold"from product_dim p  join order_fact o 
on p.product_id=o.product_id group by p.product_id,p.product_name order by totalsold desc; 

select * from order_fact;
select * from product_dim;


select distinct e.employee_ID, e.employee_Name, s.Job_Title,s.Manager_ID, e2.employee_Name as Manager_Name 
from employee_addresses e ,employee_addresses e2 ,staff s  where e.employee_ID = s.employee_ID and 
e2.employee_ID= s.Manager_ID and s.Job_Title in ('Trainee','Temp. Sales Rep.') order by e.employee_ID;



select e.employee_ID, e.employee_Name, s.Job_Title,s.Manager_ID, e.employee_Name as Manager_Name 
from employee_addresses e JOIN staff s on s.Manager_ID = e.employee_ID join staff s2 on s2.employee_ID=e.employee_ID join on s.job_title= 'Trainee' ;


SELECT  Employee_ID, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY Employee_ID) AS "Salary_prev"  , salary -LAG(Salary,1,0) over (order by Employee_ID) as Difference
FROM employee_payroll;

SELECT  Employee_ID, salary as "Salary",
       LEAD(salary, 1,0) OVER (ORDER BY Employee_ID) AS "Salary_Next" , salary -LEAD(Salary,1,0) over (order by Employee_ID) as Difference
FROM employee_payroll;





SELECT sname,city FROM S,SP WHERE S.sno = SP.sno AND SP.pno = 3;

SELECT P.pno,pname FROM P,S,SP WHERE P.pno = SP.pno AND S.sno = SP.sno AND S.city = "Paris" AND S.status >= 20;

SELECT P.pno,pname,count(*) AS TotalSuppliers FROM P,SP WHERE P.pno = SP.pno GROUP BY SP.pno;

select s.sname , s.city from  S,P,SP where P.pno=SP.pno and S.sno =SP.sno and P.weight < 4 ;
SELECT sname,sum(SP.qty) AS TotalQuantity FROM S,SP WHERE S.sno = SP.sno AND S.city = "London" 
 GROUP BY SP.sno HAVING TotalQuantity >= 1000;


SELECT 
    Country,
    SUM(Gender = 'M') AS Male,
    SUM(Gender = 'F') AS Female,
    SUM(Gender = 'M') * 100 / COUNT(*) AS percentMale
FROM
    customers
GROUP BY country
ORDER BY percentMale;


SELECT 
    p.product_id, p.product_name, SUM(o.Quantity) AS 'totalsold'
FROM
    product_dim p
        JOIN
    order_fact o ON p.product_id = o.product_id
GROUP BY p.product_id , product_name
ORDER BY totalsold DESC , p.product_name;


SELECT distinct
    e.employee_ID,
    e.employee_Name,
    s.Job_Title,
    s.Manager_ID,
    e1.employee_Name AS Manager_Name
FROM
    employee_addresses e,
    employee_addresses e1,
    staff s
WHERE
    e.employee_ID = s.employee_ID
        AND e1.employee_ID = s.Manager_ID
        AND s.Job_Title IN ('Trainee' , 'Temp. Sales Rep.')
ORDER BY e.employee_ID;


SELECT  Employee_ID, salary as "Salary",
       LAG(salary, 1,0) OVER (ORDER BY Employee_ID) AS "Salary_prev"  ,
       LEAD(salary, 1,0) OVER (ORDER BY Employee_ID) AS "Salary_Next" ,
       Salary -LAG(Salary,1,0) over (order by Employee_ID) as "Lag_Difference",
       Salary -LEAD(Salary,1,0) over (order by Employee_ID) as "LEAD_Difference"
FROM employee_payroll;


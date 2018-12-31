

CREATE TABLE CUSTOMERS ( 
                          No  CHAR(5) NOT NULL,
						  Customer_ID CHAR(9) NOT NULL,
                          Country Char(8),
                          Gender Char(4),
						  Personal_ID VARCHAR(20),
						  Customer_Name  VARCHAR(20) ,
						  First_Name VARCHAR(15),
                          Last_Name VARCHAR(15),
                          Birth_Date  date ,
                          Customer_Address Varchar(30),
                          Street_ID VARCHAR(20),
                          Street_Num Varchar(20),
                          Customer_Type_ID Varchar(10),
                          PRIMARY KEY (Customer_ID));
                  
                  
                  select * from customers;
                  
                  SET SQL_SAFE_UPDATES=0;
                  Delete from customers;
           
CREATE TABLE Employee_addresses ( 
                           No CHAR(5) NOT NULL,
                           Employee_ID CHAR(9) NOT NULL,
                           Employee_Name VARCHAR(15),
                           Street_ID VARCHAR(20),
                           Street_Num Varchar(20),
                           Steet_Name Varchar(20),
                           City Varchar(15),
                           State Varchar(20),
                           Postal_Code Varchar(20),
                           Country Varchar(15),
                           PRIMARY KEY (Employee_ID));
                           


CREATE TABLE Employee_payroll (
                              No Char(5) Not Null,
                              Employee_ID Char(9) NOT NULL,
                              Gender Char(4),
                              Salary Varchar(15),
                              Birth_Date date,
                              Employee_Hire_Date date,
                              Employee_Term_Date date,
                              Marital_Status char(2),
                              Dependents char(2));

                   
CREATE TABLE Order_fact ( 
                           No char(5) Not null,
                           Customer_ID Char(9) not null,
							Street_ID Varchar(20),
                             Order_date date,
                             Delivery_date date,
                             Order_ID char(9),
                             Order_type char(2),
							Product_ID varchar(15),
                            Quantity char(5),
                            Quantiy varchar(4),
                            Total_Retail_Price varchar(5),
                            CostPrice_per_Unit varchar(5),
                            Discount char(4));
                            
CREATE TABLE Product_dim( 
                           No char(5) Not null,
                           Product_ID Char(9) not null,
							Product_Line Varchar(20),
                             Product_Category varchar(20),
                             Product_Group varchar(20),
                             Product_Name varchar(20),
                             Supplier_Country varchar(30),
                             Supplier_Name varchar(20),
                             Supplier_ID varchar(15));
                             
CREATE TABLE Staff( 
                           No char(5) Not null,
                           Employee_ID Char(9) not null,
							Start_Date date,
                            End_Date date,
                            Job_Title varchar(20),
                            Salary Varchar(20),
                            Gender char(3),
                            Birth_Date date,
                            Employee_Hire_Date date,
                            Employee_Term_date date,
                            Manager_ID char(9));
                             
                           

               
                          
					     
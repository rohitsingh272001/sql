--- MYSQL---
--1 DATABASE
create database mydb;              -- TO CREATE DATABASE 
use mydb;                          -- TO USE DATABASE 
ALTER DATABASE MYDB READ ONLY = 1; -- TO READ ONLY DATABASE MODE
ALTER DATABASE MYDB READ ONLY = 0; -- TO READ AND EDIT MODE
DROP database mydb;                -- TO DELETE DATABASE 

--- TABLES---
--- CREATING A TABLES NAME JOB WITH DIFFERENT COLUMN ---

CREATE TABLE JOB (
 empolyee_id int,
 empolyee_name varchar(30),
 lastname      varchar(30),
 hourly_pay decimal(5,2),
 date_hired   date
 );                           
 
 rename TABLE JOB TO WORKER;  -- TO rename TABLE 
 rename TABLE WORKER TO JOB;
 
 DROP TABLE JOB;              -- TO delete table
 
 ALTER table JOB 
 ADD phone_number varchar(15);  -- to add new column 
 
 ALTER table job 
 rename column phone_number to email; -- to rename column 
 
 ALTER TABLE JOB 
 modify column email varchar(100); -- to modify column
 
 -- to move column from one place to another--
 Alter table job 
 modify column email varchar(100)
  after lastname ;
  
  Alter table job 
  modify column email varchar(100)
  first ;                         -- to move to first 
  
  -- to delete the column
  alter table job 
  drop column email;
  
  
  ---INSERT ROWS---
  insert into job 
  value(1,"thomos", "jelly", 20.60, "2023-02-05" ); -- TO insert single row
 
 -- to insert multiple row at once --
  insert into job 
  value (2,"just ", "jelly", 21.60,"2023-02-15" ),
	    ( 3, "squre", "singh", 28.50,"2023-02-05"),
	    ( 4, "tringle", "singh", 32.50,"2023-02-06"),
	    ( 5, "cube", "singh", 26.50, "2023-02-08");  
  
  --- insert into selected column in row ---
  insert into job ( empolyee_id, empolyee_name, lastname)
  value( 6,"tom", "bom");
  
  
  --- SELECT---
  select* 
  from job;                   -- to see all colomn in table
  
  select empolyee_name, lastname
  from job;                     -- to see specific colomn from table
  
  select * 
  from job 
  where empolyee_id >1 ;  -- conditional select statment 
  
   select * 
   from job 
   where date_hired is null
   
   --- UPDATE AND DELETE---
   
   update job
   set hourly_pay= 22.90,
       date_hired = "2023-06-12"
   where empolyee_id = 6;          -- to update in table
   
   delete from job 
   where empolyee_id = 6;  -- to delete from table 
  
  
--- autocommit commit and rollback---
set autocommit = off; -- now we have to safe manualy 
commit;              -- it will autosave 
delete from  job;
rollback;         -- rollback deleted files 

--- current_date and current_time---

create table tt(
  my_date date,
  my_time time,
  my_datetime datetime);
   insert into tt 
   value(current_date(),current_time(),now());
  
drop table tt;
 
 
 --- unique---
 
 create table product (
         product_id int,
         product_name varchar(30),
         price decimal 
         )
  alter table product
  modify column  price decimal (5,2);
   
   alter table product 
   add constraint
   unique(product_name);
  
  insert into product
  value (101,"milk",50.60)
        -- (102,"chips",56.60),
        (106,"chips",57.60),
        (103,"discut",58.60),
        (104,"milktea",55.60);
	
        select * from product
         
--- NOT NULL ---
 CREATE TABLE PRODUCTS2 (
     product_id int,
     product_name varchar(30),
     price decimal(5,2) not null)
        
     insert into products2
     value(1 ,"milk", null); 
  
  --- check---
  
  
  
  
  
  --- default ---
  create table product3 (
         product_id int,
         product_name varchar(30),
         price decimal (5,2) default 0
         );
alter table product
alter price set default 0;
use productproduct3
insert into product3 
value -- (108,"water"),
      (101, "milk",15.55),
      (102, "coffe",25.60),
      (103, "sugar",22.64),
      (104, "soda",55.99);
      (109, "spoon"),
      (110, " napkine"),
      (111, "flower");
      
      
      trancreate table tran(
       tran_id int,
       trsn_amount decimal(5,2),
       tran_datetime datetime default now());
      
      insert into tran( tran_id, trsn_amount) 
      value ( 1,44.5), (2,55.5);
	
      
--- primary key ---
create table store(
    cus_id int primary key,
    price decimal(5,2));
    
    insert into store 
    value (1005,25.5);
     
  
  --- auto_increment---
  create table ammount(
    cus_id int primary key auto_increment,
    ammount decimal(5,2));
    
    insert into ammount(ammount)
    value(7.55);
  select* from ammount
  
  --- foreign key ---
    create table table1
    (  customer_id int primary key auto_increment,
	    tran int ,
        ammount decimal(5,2));
        
        insert into table1 (tran, ammount)
         value(1001,null),
              (1002,55.68),
              (1003,88.96),
              (1004,68.22);
              select * from table1
              
 create table table2(
   customer_id int primary key auto_increment,
   first_name varchar(30),
   last_name varchar (30));
   
   insert into table2(first_name, last_name)
   value("raju", "singh"),
        ("babu","singh");
        ("babu","gupta"),
        ("ramu","kumar");
        select * from table2 ; 
        select * from table1 ;
        
        --- JOIN ---
        ---INNER JOIN---
        SELECT  * 
        FROM TABLE1 inner JOIN TABLE2
        ON TABLE1.customer_id = table2.customer_id
        
        --- right join---
        SELECT  * 
        FROM TABLE1 right JOIN TABLE2
        ON TABLE1.customer_id = table2.customer_id
        
        ---left join ---
        SELECT  * 
        FROM TABLE1 left JOIN TABLE2
        ON TABLE1.customer_id = table2.customer_id
   
   --- function---
   Aggregate Functions:
AVG()
COUNT()
SUM()
MIN()
MAX()
GROUP_CONCAT()
String Functions:
CONCAT()
SUBSTR()
LENGTH()
TRIM()
UPPER()
LOWER()
Date and Time Functions:
NOW()
CURDATE()
CURTIME()
DATE()
YEAR()
MONTH()
DAY()
Mathematical Functions:
ROUND()
CEILING()
FLOOR()
ABS()
Conversion Functions:
CAST()
CONVERT()
TO_CHAR()
TO_DATE()
Conditional Functions:
IFNULL()
COALESCE()
NULLIF()
Other Functions:
 COERCIBILITY()
-- CASE()
  ROW_NUMBER()
  LAG()
  LEAD()
  
  select count(tran)
  from table1
  
  
   --- and or and not ---
   alter table job
   add column jab varchar(25) after hourly_pay;
   select * from job
   
   update job
   set  jab = "doctor"
   where empolyee_id = 6;
   
   select * from job
   where  date_hired <"23-06-12" and jab = "cook"
   
   --- wild card charecter ---  %  and _
     
     select * from job
     where jab like "%r"
     
      select * from job
     where jab like "_ook"
     
      select * from job
     where jab like "__r%"
     
     --- order by ---
     select * from job
     order by lastname desc;
     
     
     --- limit ---
     select * from job
     limit 2;
     
      --- union ---
      select * from table2 
      union
      select * from table1
      
      --- view ---
      create view  job_data as
      select empolyee_name, lastname from job ;
      
      select * from job_data
      
      --- index ---
      
      show index from job
      
       create index lastname_idx
       on job(lastname)
       show index from job
       
       select * from job 
       where lastname= "jelly"
       
       --- subquery---
       select * from job
       
       select avg(hourly_pay) as aver from job 
       
       select * from job
       where hourly_pay<( select avg(hourly_pay) as aver from job )
       
       --- group by---
       select * from tran
       insert into tran (tran_id,trsn_amount)
       value (5,69.55),
             (4,99.3),
             (7,66.5),
             (8,73.2),
             (9,26.4);
     
     select sum(trsn_amount), tran_datetime
      from tran 
      group by tran_datetime;
      
      --- rollup---
      select sum(trsn_amount), tran_datetime
      from tran 
      group by tran_datetime with rollup;
      
      --- store procedures ---
      DELIMITER $$
      create procedure get_data()
      begin 
       select * from job;
	 end $$
  DELIMITER ;
  CALL get_data();
  
  DELIMITER $$
      create procedure get_empolyhee(in id int)
      begin 
       select * from job
       where empolyee_id = id ;
	 end $$
  DELIMITER ;
  
  call get_empolyhee(3);
       
      
      
      
      
     
   
  
  
       
  


 
 
 
 



 

use dataengineer;
SELECT * FROM customers;
SELECT * FROM items;
SELECT * FROM orders;
SElECT * FROM sales;

SELECT s.*,c.age  FROM
sales s left join customers c
ON s.customer_id=c.customer_id; 

SELECT o.*,i.item_name FROM 
orders o  join items i
ON o.item_id=i.item_id;

CREATE VIEW company_details AS
SELECT T1.*,T2.customer_id,T2.age FROM 
(SELECT o.*,i.item_name FROM 
orders o  join items i
ON o.item_id=i.item_id) T1 
LEFT JOIN (SELECT s.*,c.age  FROM
sales s left join customers c
ON s.customer_id=c.customer_id) T2
ON T1.sales_id = T2.sales_id;

SELECT * FROM company_details;

SELECT customer_id as customer ,age, item_name as item,sum(quantity) as quantity FROM company_details
WHERE AGE BETWEEN 18 AND 36
GROUP BY customer_id, item_name,age
HAVING quantity >0;


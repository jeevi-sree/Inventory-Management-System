create database inventory_management;
use inventory_management

create table inventory_data(
Product_id int,
supplier_id int,
Product_name varchar(100),
Supplier_name varchar(100),
Category varchar(100),
Warehouse_location varchar(125),
Product_status varchar(100),
Date_received date,
Last_orderdate date,
Expiration_date date,
Stock_quantity int,
Reorder_level int,
Reorder_Quantity int,
Unit_price int,
Sales_volume int,
Inventory_turnover_rate int,
primary key(Product_id)
)

select*from inventory_data

select count(*) from inventory_data
select count(distinct Product_name) as total_Product_name from inventory_data
select count(Product_name) as total_Product_name from inventory_data
select count(distinct category) as total_category from inventory_data
select distinct category as types_of_category from inventory_data
select distinct Product_status as types_of_Product_status from inventory_data
select distinct Supplier_name as number_of_suppliers  from inventory_data
select count(distinct Supplier_name) as total_supplier_name from inventory_data


select*from inventory_data
#data cleaning
SELECT*FROM inventory_data WHERE Product_id IS NULL
SELECT*FROM inventory_data WHERE supplier_id IS NULL
SELECT*FROM inventory_data WHERE Product_name IS NULL
SELECT*FROM inventory_data WHERE Supplier_name IS NULL
SELECT*FROM inventory_data WHERE Category IS NULL
SELECT*FROM inventory_data WHERE Warehouse_location IS NULL
SELECT*FROM inventory_data WHERE Product_Status IS NULL
SELECT*FROM inventory_data WHERE Date_received IS NULL
SELECT*FROM inventory_data WHERE last_orderdate IS NULL
SELECT*FROM inventory_data WHERE Expiration_date IS NULL
SELECT*FROM inventory_data WHERE Stock_quantity IS NULL
SELECT*FROM inventory_data WHERE Reorder_level IS NULL
SELECT*FROM inventory_data WHERE Reorder_Quantity IS NULL
SELECT*FROM inventory_data WHERE Unit_Price IS NULL
SELECT*FROM inventory_data WHERE Sales_volume IS NULL
SELECT*FROM inventory_data WHERE Inventory_turnover_rate IS NULL


SELECT*FROM inventory_data WHERE Product_id IS NULL or supplier_id IS NULL or
 supplier_name IS NULL or Category IS NULL or Warehouse_location IS NULL or 
 Product_status IS NULL or Date_received IS NULL or Last_orderdate IS NULL or 
 Expiration_date IS NULL or Stock_quantity IS NULL or Reorder_level IS NULL or
 Reorder_quantity IS NULL or Unit_price IS NULL or Sales_volume IS NULL or Inventory_turnover_rate IS NULL
select*from inventory_data

#My analysis

-- 1.List all the products with product_id ,category,product_name,stockquantity and unit price
SELECT DISTINCT Product_id,Product_name,Category,Stock_quantity,Unit_Price FROM inventory_data;

-- 2.List all item under specific category
SELECT DISTINCT Product_name,Category as types_of_category FROM inventory_data;

-- 3.List all the products that are discontinued
SELECT DISTINCT Product_name,category,Product_status from inventory_data where Product_status= 'Discontinued'

-- 4.List all the product that are active
SELECT DISTINCT Product_name,Product_status from inventory_data where Product_status= 'Active'

-- 5. Query to Sorting all items by price (high to low)
SELECT DISTINCT product_name,Unit_Price FROM inventory_data order by Unit_Price desc;

-- 6. Query to sort all items by price(low to high)
SELECT DISTINCT Product_Name,Unit_Price from inventory_data order by Unit_Price asc;

-- 7.query to calculate total inventory values
SELECT SUM(Stock_Quantity*Unit_Price) as Total_inventory_data From Inventory_data;

-- 8.top 10 products with highest sales volume
SELECT Product_name,Sales_volume from Inventory_data order by sales_volume desc limit 10;

-- 9.List products whose expiration date is in the next 30 days
SELECT Product_id, Product_name, Expiration_date FROM inventory_data
WHERE Expiration_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- 10.List all products which are already expired
SELECT Product_id,Product_name,Expiration_date from inventory_data where Expiration_date<curdate();

SELECT*FROM INVENTORY_DATA;

-- 11.products where reorder level is greater than stock quantity
SELECT distinct Product_name,reorder_level,stock_quantity from inventory_data where reorder_level > stock_quantity;

-- 12.List the products that are supplied by specific supplier
SELECT Product_id,Product_name,Supplier_id,Supplier_name from inventory_data where supplier_name='Geba'

-- 13.Count how many products each supplier provides.
SELECT SUPPLIER_NAME ,COUNT(PRODUCT_NAME) AS TOTAL_PRODUCT FROM Inventory_data Group by supplier_name;

-- 14.list supplier supplied more than 5 products
select supplier_name,count(product_name) as total_product from inventory_data group by supplier_name having count(product_name)>5;

-- 15.list no.of products in each category
select count(Distinct Product_name,category) from inventory_data where category='Grains & Pulses'
select Distinct Product_name,category from inventory_data where category='Grains & Pulses'

-- 16.List the Products that stayed longest in inventory (current date − date_received)
SELECT 
    product_id,
    product_name,
    DATEDIFF(CURDATE(), date_received) AS days_in_inventory
FROM inventory_data
ORDER BY days_in_inventory DESC
LIMIT 1;

-- 17. Show the products stored in specific warehouse locations
select product_name,product_id,category,Warehouse_location from inventory_data where Warehouse_location IN ('402 Kings Road','31 Loomis Park');

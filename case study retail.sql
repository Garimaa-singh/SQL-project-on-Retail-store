SELECT * FROM `study case`.`tr_orderdetails[1]`;
select * from `study case`.`tr_products[1]`;
select * from `study case`.`tr_propertyinfo[1]`;
-- maximum quantity sold and how many qunatity present in transaction
select max(quantity),count(*)
from `study case`.`tr_orderdetails[1]`;

-- unique products and quantity where quantity is 3 in transaction
select distinct productid,quantity from
`study case`.`tr_orderdetails[1]`
where quantity=3
order by productid asc,quantity desc;


-- unique properties in transaction

select distinct(propertyid) from
`study case`.`tr_orderdetails[1]`;

-- product category that has maximum product

select productcategory,count(*)as product_count from
`study case`.`tr_products[1]`
group by productcategory
order by product_count desc;

-- states where most stores are present

select propertystate, count(*) as property_count from
`study case`.`tr_propertyinfo[1]`
group by propertystate
order by property_count desc;

-- top 5 productid that did maximum sales in terms of quantity

select productid,sum(quantity)as total_quantity from
`study case`.`tr_orderdetails[1]`
group by productid
order by total_quantity desc
limit 5;

-- top 5 propertyid that did maximum sales in terms of quantity

select propertyid,sum(quantity)as total_quantity from
`study case`.`tr_orderdetails[1]`
group by propertyid
order by total_quantity desc
limit 5;

-- top 5 product name that did maximum sales in terms of quantity

select sum(a.quantity)as total_quantity,a.productid,b.productname
from `study case`.`tr_orderdetails[1]` as a
inner join `study case`.`tr_products[1]` as b
on a.productid=b.productid
group by productname
order by total_quantity desc
limit 5;

-- top 5 products in terms of sales(price*quantity)

select sum(a.quantity*b.price)as sales,a.productid,b.productname
from `study case`.`tr_orderdetails[1]` as a
inner join `study case`.`tr_products[1]` as b
on a.productid=b.productid
group by productname
order by sales desc
limit 5;

-- top 5 cities in terms of sales(price*quantity)

select sum(a.quantity*b.price)as sales,c.propertycity
from `study case`.`tr_orderdetails[1]` as a
inner join `study case`.`tr_products[1]` as b
on a.productid=b.productid
inner join `study case`.`tr_propertyinfo[1]` as c
on a.propertyid=c.`Prop ID`
group by propertycity
order by sales desc
limit 5;

-- top 5 product in Arlington 

select sum(a.quantity*b.price)as sales,c.propertycity,b.productname
from `study case`.`tr_orderdetails[1]` as a
inner join `study case`.`tr_products[1]` as b
on a.productid=b.productid
inner join `study case`.`tr_propertyinfo[1]` as c
on a.propertyid=c.`Prop ID`
where c.propertycity='Arlington'
group by c.propertycity,b.productname
order by sales desc
limit 5;


select * from car_dekho;

select * from car_dekho 
where year=2007 and selling_price > 150000 and owner = 'First Owner';

select * from car_dekho
where name like 'honda city%'; 

select * from car_dekho
where fuel in ('cng', 'lpg'); 

select * from car_dekho
where year between 2017 and 2019; 

select * from car_dekho
where selling_price IS NULL 

select * from car_dekho
where selling_price > 1000000 or km_driven = 30000 
order by year ;


select * from car_dekho
where selling_price >= 1200000 
AND seller_type not like '%Dealer%' and owner like '%First Owner%';  

# if we want to  check how many data are there in table
select count(*) from car_dekho;


select count(owner) from car_dekho;


select distinct( owner ) from car_dekho ;

#select count(owner) from car_dekho
#where ( select distinct(owner) from car_dekho )

select avg(km_driven) from car_dekho;


select count(owner) from car_dekho


select * from car_dekho
where (select min(km_driven) from car_dekho);

select min(km_driven) from car_dekho;

select * from car_dekho where km_driven = 1; 

select max(selling_price) from car_dekho;

select count(selling_price) from car_dekho
group by selling_price;

select * from car_dekho limit 5 ;

select count(year)  from car_dekho
group by year ;

select avg(selling_price) from car_dekho 
where (select count(year) from car_dekho
group by year) ;


# avg price per year of car

select distinct (year) , count(year) , avg(selling_price)  from car_dekho
group by year order by year ;

select * from car_dekho;

# no of car by there model and year

select name ,year , count(*) as count from car_dekho
group by name, year ;
 
 
 # Using GROUP BY with ORDER BY
 
select name, year , count(*) as count from car_dekho
group by name, year
order by year , name;

 
select name, year , count(*) as count from car_dekho
group by name, year limit 10;

#However, you'll often encounter datasets where GROUP BY isn't enough to get what you're looking for. 
#Let's say that it's not enough just to know aggregated stats by month. After all, there are a lot of months in this dataset. 
#Instead, you might want to find every month during which AAPL stock worked its way over $400/share. 
#The WHERE clause won't work for this because it doesn't allow you to filter on aggregate columns—that's where the HAVING clause comes in:

select * from car_dekho limit 5;

select name , year ,owner, MAX(selling_price) as MAX_price from car_dekho
group by name, year , owner
having (MAX_price) > 200000
order by name , year;

/* Note: HAVING is the "clean" way to filter a query that has been aggregated, 
but this is also commonly done using a subquery, which you will learn about in a later lesson. */

-- Query clause order
/* As mentioned in prior lessons, the order in which you write the clauses is important. Here's the order for everything you've learned so far:

SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY  */ 

-- The SQL CASE statement --

select * from car_dekho;

select name , year , fuel ,
case when fuel = 'Petrol' then 'YES'
else 'NO' end as 'LPG is capable' 
from car_dekho;

select * from car_dekho limit 5;
select distinct(year) from car_dekho order by year;


select name , year ,
case 
when year between 1990 and 1995 then 'Vintage car'
when year between 1995 and 2000 then 'it ready to scrap'
when year between 2000 and 2005 then 'it ready to scrap'
when year between 2005 and 2010 then 'it Deu to scrap'
when year between 2010 and 2015 then 'it has 5 year'
else 'car is Brand new' end as 'RTO rule 15+ year car' 
from car_dekho
order by year desc;

select name , year , selling_price ,owner ,
case
when selling_price < 100000 and owner = 'Third Owner' then 'Cheap_prce'
when selling_price < 200000 and owner = 'first Owner' then 'good_prce'
when selling_price > 200000 and owner = 'first Owner' then 'not_too_good_prce'
when selling_price > 150000 and owner = 'Second Owner' then "reasneble_price"
when selling_price >= 200000 and owner = 'Second Owner' then 'ok_price'
when selling_price >= 500000 and owner = 'First Owner' then 'High_price'
when selling_price >= 1000000 and owner = 'First Owner' then 'expensive_price'
else null END as 'car+price'
from car_dekho; 



















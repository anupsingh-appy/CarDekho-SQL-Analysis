use da_offline ;

select * from cardekho_dataset ;

-- Display brand, car_name, and model
select brand, car_name, model
from cardekho_dataset;

-- Show all unique car brands
select distinct car_name
from cardekho_dataset ;

-- Display all cars sorted by selling_price (highest first)
select car_name, selling_price
from cardekho_dataset 
order by selling_price desc ;

-- Show top 10 most expensive cars.
select car_name
from cardekho_dataset 
order by selling_price desc
limit 10;

-- 	Show cars where brand = 'Hyundai'.
select car_name
from cardekho_dataset 
where brand = 'Hyundai' ;

-- Find cars where fuel_type = 'Petrol'
select car_name, fuel_type
from cardekho_dataset
where fuel_type = 'Petrol' ;

-- Display cars with transmission_type = 'Manual'.
select car_name, transmission_type
from cardekho_dataset
where transmission_type = 'Manual' ;

-- Show cars with selling_price between 5,00,000 and 10,00,000.
select car_name, selling_price 
from cardekho_dataset 
where
selling_price between 500000 and 1000000 ;

-- 	Find cars whose car_name starts with letter M 
select car_name
from cardekho_dataset
where car_name like 'M%' ;

-- Show cars with km_driven less than 40,000.
select car_name, km_driven 
from cardekho_dataset
where km_driven < 40000 ;

-- Find total number of cars.
select
count(car_name) as Cnt_cars
from cardekho_dataset ;

-- Find average selling price of all cars.
select 
avg(selling_price) as average_price
from cardekho_dataset ;

-- Find maximum and minimum selling price.
select 
max(selling_price) as Maximum_price,
min(selling_price) as Minimum_price 
from cardekho_dataset ;

-- 	Count number of cars for each fuel_type.
select fuel_type, count(car_name)
from cardekho_dataset
group by fuel_type ;

-- 16.	Find average km_driven for each brand.
select brand, avg(km_driven) as avg_driven 
from cardekho_dataset
group by brand ;

-- What is the total selling price for each brand 
select 
brand, sum(selling_price) as Total_selling_Price 
from cardekho_dataset
group by brand ;

select brand, car_name,
max(selling_price),
 count(car_name)
from cardekho_dataset 
group by brand, car_name ;

-- Find the brand which has sold the most number of cars
select brand, count(car_name) as cnt_cars 
from cardekho_dataset 
group by brand 
order by cnt_cars desc 
limit 1 ;

-- Find the brand whose name start with 'M
select distinct brand 
from cardekho_dataset
where brand like 'M%' ;

-- Find the brand whose name end with 'i'
select distinct brand 
from cardekho_dataset 
where brand like '%i' ;

-- Find the brand which contains the alphabet 'a'
select distinct brand 
from cardekho_dataset 
where brand like '%a%' ;

-- Find the brand which contains the alphabet 'ag'
select distinct brand 
from cardekho_dataset 
where lower(brand) like '%ag%' ; 

-- Brand start with either 'a' or 'm'
select distinct brand 
from cardekho_dataset 
where brand like 'a%' 
or brand like 'm%' ;

-- Car brand start with M and end with I 
select distinct brand 
from cardekho_dataset
where brand like 'm%i' ;

-- The brand which contain all the vowels 
select brand
from cardekho_dataset 
where brand like '%a%'
and brand like '%e%' 
and brand like '%o%'
and brand like '%i%'
and brand like '%u%' ;

-- Tell the brand which doesn't contain any the vowels
select distinct brand 
from cardekho_dataset
where
brand not like '%a%'and 
brand not like '%e%' and 
brand not like '%i%' and 
brand not like '%o%' and 
brand not like '%u%' ; 

-- Brand which has 'a' in the second position 
select distinct brand 
from cardekho_dataset 
where brand like '_a%' ;

-- Brand which has 'a' in the third position 
select distinct brand 
from cardekho_dataset 
where brand like '__a%' ;

-- Brand start with M and fifth is T
select distinct brand 
from cardekho_dataset 
where brand like 'm___ t%' ;

-- Brand which contain A and E 
select distinct brand 
from cardekho_dataset 
where brand like '%a%e%'
or brand like '%e%a%';

select distinct brand 
from cardekho_dataset 
where brand like '%a%'
and brand like '%e%' ; -- Both the query works 

-- Brand which start with vowel and also end with a vowel 
select distinct brand 
from cardekho_dataset 
where 
(brand like 'a%' or
brand like 'e%' or
brand like 'i%' or
brand like 'o%' or
brand like 'u%') 
and 
(brand like '%a' or 
brand like '%e' or 
brand like '%i' or 
brand like '%o' or 
brand like '%u') ;

-- HAVING CLAUSE 
-- Which brand have sold more than 500 cars 
select brand, count(car_name)
from cardekho_dataset
group by brand 
having count(car_name) > 500 ;

-- Which brand have done more than 1cr of sale
 select brand, sum(selling_price)
 from cardekho_dataset 
 group by brand 
 having sum(selling_price) > 10000000 ;
 
 -- Which Maruti car have done the more than 2cr of sale 
 select car_name , sum(selling_price)
 from cardekho_dataset 
 where brand = 'Maruti'
group by car_name 
having sum(selling_price) > 20000000 ;

-- Wirte all the brand which are duplicate 
select brand 
from cardekho_dataset 
group by brand 
having count(brand) > 1 ;

-- Find the brand which have atleast 5 Car
select brand, count(distinct car_name)
from cardekho_dataset 
group by brand 
having count(distinct car_name) >= 5 ;

-- 17.	Show total number of cars brand-wise.
select brand, count(car_name)
from cardekho_dataset
group by brand ;

-- 18.	Find average selling price for each brand.
select brand, avg(selling_price)
from cardekho_dataset 
group by brand ;

-- 19.	Show brands having more than 100 cars.
select brand, count(car_name)
from cardekho_dataset 
group by brand 
having count(car_name) > 100 ;

-- 20.	Find fuel types whose average selling price is greater than 7,00,000
select fuel_type
from cardekho_dataset
group by fuel_type 
having avg(selling_price) > 700000 ;


-- GROUP BY & HAVING

-- LEVEL 1: GROUP BY (Basics)
	-- 1.	Count number of cars for each brand.
    
    select brand, count(car_name)
    from cardekho_dataset 
    group by brand ;
    
	-- 2.Find average selling_price for each fuel_type.
    select fuel_type, avg(selling_price) 
    from cardekho_dataset 
    group by fuel_type ;

	-- 3.Find average km_driven for each transmission_type.
    select transmission_type, avg(km_driven)
    from cardekho_dataset 
    group by transmission_type ;
    
    -- 4.Count number of cars for each seller_type.
	select seller_type, count(car_name)
    from cardekho_dataset 
    group by seller_type ;
    
    -- 5.Find maximum selling price for each brand.
    select brand, max(selling_price) as Maximum_selling_price
    from cardekho_dataset 
    group by brand;
    
-- GROUP BY + ORDER BY

	-- 6.Show brand-wise total number of cars, sorted by count (highest first).
    select brand, count(car_name) as cnt_cars
    from cardekho_dataset 
    group by brand
    order by cnt_cars desc ;
    
	-- 7.Find fuel_type-wise average selling price, sorted from highest to lowest.
    select fuel_type, avg(selling_price) as average_selling_price
    from cardekho_dataset
    group by fuel_type
    order by average_selling_price desc ;
    
	-- 8.Show model-wise average selling price, sorted by price.
    select model, avg(selling_price) as average_selling_price
    from cardekho_dataset
    group by model 
    order by average_selling_price ;
    
    
-- GROUP BY + HAVING (INTERVIEW FAVORITE)

	-- 9.Show brands having more than 50 cars.
    select brand 
    from cardekho_dataset
    group by brand 
    having count(car_name) > 50 ;
    
	-- 10.Find fuel types whose average selling price > 7,00,000.
    select fuel_type 
    from cardekho_dataset 
    group by fuel_type
    having avg(selling_price) > 700000 ;
    
	-- 11.Show transmission types having more than 100 cars.
    select transmission_type
    from cardekho_dataset
    group by transmission_type
    having count(car_name) > 100 ;
    
	-- 12.Find brands whose average km_driven < 40,000.
    select brand 
    from cardekho_dataset 
    group by brand
    having avg(km_driven) < 40000 ;
    
	-- 13.Show seller types where average selling price > 6,00,000.
    select seller_type 
    from cardekho_dataset
    group by seller_type
    having avg(selling_price) > 600000 ;
    
    -- LEVEL 4: MULTI-COLUMN GROUP BY + HAVING
    
	-- 14.Count number of cars for each brand and fuel_type.
    select brand, fuel_type,
    count(car_name) as count_of_cars
    from cardekho_dataset
    group by brand, fuel_type ;
   
	-- 15.Find average selling price for each brand + transmission_type.
    select brand,
    transmission_type,
    avg(selling_price) as average_selling_price
    from cardekho_dataset
    group by brand, transmission_type ;
    
	-- 16.Show brand + fuel_type combinations having more than 30 cars.
    select brand, fuel_type,
    count(car_name) as cnt_cars
    from cardekho_dataset 
    group by brand, fuel_type 
    having count(car_name) > 30 ;
    
	-- 17.Find fuel_type + transmission_type combinations where average selling price > 8,00,000.
    select fuel_type, transmission_type,
    avg(selling_price) as average_selling_price
    from cardekho_dataset
    group by fuel_type, transmission_type
    having avg(selling_price) > 800000 ;
    
    
    -- INTERVIEW-STYLE THINKING QUESTIONS
    -- 18.Find brands that have both Petrol and Diesel cars. (Hint: GROUP BY + HAVING COUNT DISTINCT)
	select brand
    from cardekho_dataset
    where fuel_type in ('Petrol', 'Diesel')
    group by brand
    having count(distinct fuel_type) = 2;

    
    -- 19.Find brands having at least 3 different fuel types.
    select brand 
    from cardekho_dataset 
    group by brand 
    having count(distinct fuel_type) >= 3;

	-- 20.Show brands where maximum selling price > 20,00,000.
    select brand, max(selling_price) as maximum_selling_price
    from cardekho_dataset 
    group by brand 
    having max(selling_price) > 2000000 ;
    
    
    select car_name
    from cardekho_dataset 
    order by selling_price desc
    limit 1 ;
    
    use da_offline; 
    
    

-- Sub Query 

-- Finding the car which is most expensive (by normal and simple query) 
select car_name 
from cardekho_dataset 
order by selling_price desc 
limit 1 ; 

-- Finding highest selling price
select max(selling_price)
from cardekho_dataset ;

-- Now we will use the query of highest selling_price as sub-query to fetch the same result 
select car_name 
from cardekho_dataset 
where selling_price = (select max(selling_price) from cardekho_dataset);

-- Find the brand which has sold more than 1000 cars 
select brand, count(car_name) as cnt_cars
from cardekho_dataset 
group by brand 
having count(car_name) > 1000  ; 

-- using as sub-query
select * from
 (select brand, count(car_name) as cnt_cars
from cardekho_dataset 
group by brand ) as a
where cnt_cars > 1000 ;

-- Give me data of all the cars of the Top 3 brands based on the sale

-- First we will find the top 3 brands based on sale
 select brand, sum(selling_price) as total_sales
 from cardekho_dataset 
 group by brand 
 order by total_sales desc 
 limit 3 ;
 
 -- Now we will select the brand (using as table)
 select brand 
 from ( select brand, sum(selling_price) as total_sales
 from cardekho_dataset 
 group by brand 
 order by total_sales desc 
 limit 3 ) as a ;
 
 -- Now we will fetch the data of all the cars 
 select * from cardekho_dataset
 where brand in 
(select brand 
 from ( select brand, sum(selling_price) as total_sales
 from cardekho_dataset 
 group by brand 
 order by total_sales desc 
 limit 3 ) as a );


-- Give me the most expensive car for each brand, whose avg max_power is more than 100 HP


select brand,  max(selling_price) 
from cardekho_dataset 
where brand in
(select brand   
from
(select brand
from cardekho_dataset 
group by brand 
having avg(max_power) > 100 ) as a) 
group by brand ; 


-- Window Function 
-- Ranking Function 
-- Row_number 
select *, row_number ()
over (order by selling_price desc) as rnk
from cardekho_dataset ;

-- Rank 
select car_name, selling_price,
rank() over(order by selling_price desc) as RNK
from cardekho_dataset ;

-- Dense Rank
select car_name, selling_price,
dense_rank() over (order by selling_price desc) as RNK_1
from cardekho_dataset ;


























































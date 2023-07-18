CREATE DEFINER=`root`@`localhost` PROCEDURE `citywiseinfo`(cityname varchar(30),type char(3))
BEGIN
if(type='MAX') then
create temporary table if not exists countingtable as (
Select City,Item_Name,Count(Item_Name) as item_count from zomatodata.zomatodata where city=cityname group by City,Item_Name order by item_count desc limit 1);
with citytable as(
SELECT City,ROUND(AVG(Dining_rating),2) as Avg_Dining_Rating,ROUND(AVG(Delivery_rating),2) as Avg_Delivery_Rating,ROUND(SUM(Dining_Votes),2)as Sum_Dining_Votes,ROUND(SUM(Delivery_Votes),2)as Sum_Delivery_Votes FROM zomatodata.zomatodata where city=cityname group by City)
select citytable.*,countingtable.Item_Name from citytable join countingtable using(City);
end if;
if(type='MIN') then
create temporary table if not exists countingasctable as (
Select City,Item_Name,Count(Item_Name) as item_count from zomatodata.zomatodata where city='Kolkata' group by City,Item_Name order by item_count asc limit 1);
with citytable as(
SELECT City,ROUND(AVG(Dining_rating),2) as Avg_Dining_Rating,ROUND(AVG(Delivery_rating),2) as Avg_Delivery_Rating,ROUND(SUM(Dining_Votes),2)as Sum_Dining_Votes,ROUND(SUM(Delivery_Votes),2)as Sum_Delivery_Votes FROM zomatodata.zomatodata where city='Kolkata' group by City)
select citytable.*,countingasctable.Item_Name from citytable join countingasctable using(City);
end if;
END

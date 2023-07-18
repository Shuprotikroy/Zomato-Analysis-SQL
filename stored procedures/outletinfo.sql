CREATE DEFINER=`root`@`localhost` PROCEDURE `outletinfo`(category varchar(30),orderset varchar(5),limitqty int,cityview boolean)
BEGIN
IF(category= 'Outlet Count' && orderset='DESC' && cityview=false) then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as 'Average Delivery Rating',ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name order by Outlet_Count desc LIMIT limitqty;
else IF(category= 'Delivery & Dining' && orderset='DESC'&& cityview=false) then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name order by Average_Delivery_Rating desc LIMIT limitqty;
else IF(category='Item Price'&& orderset='DESC'&& cityview=false) then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as Average_Item_Price FROM zomatodata.zomatodata group by Restaurant_Name order by Average_Item_Price desc LIMIT limitqty;
end if;
end if;
end if;

IF(category= 'Outlet Count' && orderset='ASC') then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as 'Average Delivery Rating',ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name order by Outlet_Count asc LIMIT limitqty;
else IF(category= 'Delivery & Dining' && orderset='ASC') then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name order by Average_Delivery_Rating asc LIMIT limitqty;
else IF(category='Item Price'&& orderset='ASC') then
SELECT Restaurant_Name,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as Average_Item_Price FROM zomatodata.zomatodata group by Restaurant_Name order by Average_Item_Price asc LIMIT limitqty;
end if;
end if;
end if;

if (cityview=true && category= 'Delivery & Dining' && orderset='DESC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from datatable where Average_Delivery_Rating>(select avg(Average_Delivery_Rating) from datatable) order by Average_Delivery_Rating desc limit limitqty;
end if;
if (cityview=true && category= 'Outlet Count' && orderset='DESC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from testtable where Outlet_Count>(select avg(Outlet_Count) from datatable) order by Outlet_Count desc limit limitqty;
end if;
if (cityview=true && category= 'Item Price' && orderset='DESC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as Average_Item_Price FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from datatable where Average_Item_Price>(select avg(Average_Item_Price) from datatable) order by Average_Item_Price desc limit limitqty;
end if;

if (cityview=true && category= 'Delivery & Dining' && orderset='ASC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from datatable where Average_Delivery_Rating>(select avg(Average_Delivery_Rating) from datatable) order by Average_Delivery_Rating ASC limit limitqty;
end if;
if (cityview=true && category= 'Outlet Count' && orderset='ASC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as 'Average Item Price' FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from datatable where Outlet_Count>(select avg(Outlet_Count) from datatable) order by Outlet_Count ASC limit limitqty;
end if;
if (cityview=true && category= 'Item Price' && orderset='ASC')
then 
with datatable as(
SELECT Restaurant_Name,City,count(Restaurant_Name) as Outlet_Count,ROUND(AVG(Delivery_Rating),2) as Average_Delivery_Rating,ROUND(AVG(Delivery_Rating),2) as 'Average Dining Rating',Round(AVG(Prices),2) as Average_Item_Price FROM zomatodata.zomatodata group by Restaurant_Name,City)
select * from datatable where Average_Item_Price>(select avg(Average_Item_Price) from datatable) order by Average_Item_Price ASC limit limitqty;
end if;


END

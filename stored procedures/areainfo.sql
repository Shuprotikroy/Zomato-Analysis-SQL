CREATE DEFINER=`root`@`localhost` PROCEDURE `areainfo`(cityname varchar(30), category varchar(30))
BEGIN
IF(cityname!=''&&category!='') then
SELECT City,Best_seller,count(Best_seller) as count,Place_Name FROM zomatodata.zomatodata where city=cityname and Best_Seller=category group by Best_seller,City,Place_Name order by count desc;
else
SELECT City,Best_seller,count(Best_seller) as count,Place_Name FROM zomatodata.zomatodata group by Best_seller,City,Place_Name order by count desc;
end if;
END

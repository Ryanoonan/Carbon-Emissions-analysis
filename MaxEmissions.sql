CREATE TABLE country_carbon_table as  
(select * from  carbon_table
#Sort through entities that are not countries
where entity != "World" 
and entity not like "Non-%" 
and entity not like "Asia%" 
and entity not like "%income%"
and entity not like "%OECD%"
and entity not like "%Europe%"
and entity not like "%North America%")
;

SELECT main.entity, main.year, main.`Annual CO2 emissions`
FROM country_carbon_table main
INNER JOIN (
    SELECT year, MAX(`Annual CO2 emissions`) AS MaxEmissions
    FROM country_carbon_table
    GROUP BY year
) subquery ON main.year = subquery.year AND main.`Annual CO2 emissions` = subquery.MaxEmissions
ORDER BY main.year;














# SQL_Project
Data source : https://ourworldindata.org

Fuction : Aggregations, Joins, CTEs,  CASE WHEN statements, subqueries, DATETIME functions

## Total cases vs Total deaths

``` 
SELECT location, 
  date,
  total_cases, 
  new_cases, 
  total_deaths , 
  population,
  (total_deaths/total_cases)*100 as DeathPercentage
FROM covid
WHERE continent is not null
ORDER by 1;
````

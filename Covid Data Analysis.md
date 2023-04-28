## Death Percentage and Populainfected Percentage

``` 
SELECT location,
  date,
  total_cases,
  total_deaths, 
  population,
  round((total_deaths/total_cases)*100,2) as DeathPercentage,
  (total_cases/population)*100 as PercentPoppulationinfected
FROM covid
WHERE continent is not null
	AND total_deaths is not null
ORDER by 1;

````
![image](https://user-images.githubusercontent.com/124046836/235060870-8dcd059a-a62f-4ea7-81a4-a7d012436020.png)

## Infection rate compared to population

```
SELECT location,
  population,
  max(total_cases) as Total_infection,
  max((total_cases/population))*100 as PercentPoppulationinfected
FROM covid 
WHERE continent is not null
GROUP by location,population
ORDER by PercentPoppulationinfected DESC;

```

![image](https://user-images.githubusercontent.com/124046836/235062142-d3b22b01-4bfe-4f16-a29c-80d6539c1e82.png)

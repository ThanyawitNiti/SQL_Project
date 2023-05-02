## Global number of Covid

```

SELECT sum(new_cases) as total_cases,  
	   sum(cast(new_deaths as REAL)) as total_deaths, 
	   sum(cast (new_deaths as REAL))/sum(new_cases)*100 as DeathPercentage
FROM covid

```
![image](https://user-images.githubusercontent.com/124046836/235063868-763b9332-ba41-440f-a7f6-6b1abf098aac.png)

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

## Highest Death count per population

```

SELECT location,
	max(cast(total_deaths as int)) as TotaldeathsCount   
FROM covid 
WHERE continent is not null
GROUP by location
ORDER by TotaldeathsCount DESC;

```
![image](https://user-images.githubusercontent.com/124046836/235063322-c9ff1d23-979b-4e7d-a40c-cab80570f527.png)

## Totoal deaths by continent

```

SELECT continent,
	max(cast(total_deaths as int)) as TotaldeathsCount   
FROM covid 
WHERE continent is not null
GROUP by continent
ORDER by TotaldeathsCount DESC;

```

![image](https://user-images.githubusercontent.com/124046836/235063583-3180245e-4019-4195-ab2d-2dcce8a217e1.png)


![link image](https://public.tableau.com/static/images/Co/CovidDashboard_16830078731020/Dashboard1/4_3.png)

[link](https://public.tableau.com/views/CovidDashboard_16830078731020/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)

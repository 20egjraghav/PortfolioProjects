select * from PortfolioProject..CovidDeaths$ order by 3,4;

select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidDeaths$ order by 1,2;

select Location,date,total_cases, total_deaths, 
round((total_deaths/total_cases)*100,2) as Death_Percentage 
from PortfolioProject..CovidDeaths$ 
where location like '%states%' order by 1,2;


select Location,Date, total_cases ,Population, round((total_cases/population)*100,2) as 
Total_Deaths_Percentage from 
PortfolioProject..CovidDeaths$ 
where location Like '%states' 
order by 1,2;


select location, max(total_cases) as HighestInfection, Population, Max((total_cases/population))*100 as 
Infection_Percentage from 
PortfolioProject..CovidDeaths$
--where location Like '%states' 
group by location,population
order by Infection_Percentage desc ;


select location, max(cast(total_deaths as int)) as HighestDeaths 
--Round(Max((total_deaths/population))*100,2) as Deaths_Percentage 
from 
PortfolioProject..CovidDeaths$
--where location Like '%states' 
where continent is not null
group by location
order by HighestDeaths desc ;

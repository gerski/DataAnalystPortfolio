Select *
From [Portfolio Project]..coviddeaths$
order by 3,4

--when it is null location is an entire continent


-- Select Data that we are going to be using

Select location, date, total_cases, new_cases, total_deaths, population
From [Portfolio Project]..coviddeaths$
order by 1,2

-- Looking at Total Cases vs Total Deaths
-- Death Percentage

Select location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
From [Portfolio Project]..coviddeaths$
Where location like '%states%'
order by 1,2

-- Total Cases vs Population
-- Percentage of population got covid

Select location, date, total_cases,population,(total_cases/population)* 100 as Contracted_Covid
From [Portfolio Project]..coviddeaths$
Where location like '%state%'
order by 1,2

-- Countries with highest infection rate compared to population
Select location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as PercentPopulationInfected
From [Portfolio Project]..coviddeaths$
Group by location, population
order by PercentPopulationInfected desc

Select location,MAX(cast(total_deaths as int)) as HighestDeath
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by location
order by HighestDeath desc

-- By Continent

Select continent, Max(cast(total_deaths as int)) as HighestDeath
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by continent
Order by HighestDeath desc

-- Showing continents with highgest death per pop

Select continent, Max(population) as MaxPop, Max(cast(total_deaths as int)) as HighestDeath, Max((total_deaths/population))*100 as PercentPopulationInfected
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by continent
Order by PercentPopulationInfected desc

-- continent with highest new cases

Select continent, Max(new_cases) as NewCases
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by continent
Order by NewCases desc

-- country with highest new cases

Select location, Max(new_cases) as NewCases
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by location
+
+




-- number of deaths by day

Select date, MAX(cast(total_deaths as int)) as TotalDeaths
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by date
Order by TotalDeaths

-- number of new death by day

Select date, SUM(cast(new_deaths as int)) as TotalNewDeaths
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by date
Order  by date


--Global numbers

Select date,SUM(new_cases), SUM(cast(new_deaths as int)), SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From [Portfolio Project]..coviddeaths$
Where continent is not null
Group by date
order by 1,2


--


Select SUM(new_cases), SUM(cast(new_deaths as int)), SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From [Portfolio Project]..coviddeaths$
Where continent is not null

order by 1,2


Select *
From  [Portfolio Project]..covidvaccine$


Select *
From [Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project].. covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date



-- Total Population vs Vaccinations

Select dea.continent, dea.location, dea.population, vac.total_vaccinations, dea.date
From[Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project]..covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null

-- new vaccinations per day globally
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From [Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project]..covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3

-- Looking at Total Pop vs New Vaccination

Select dea.continent, dea.location,dea.date,
 dea.population, vac.new_vaccinations, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.date) as SumofVaccinated
 
From [Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project]..covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
order by 2,3


With PopvsVac (continent, location, date, population, new_vaccinations, SumofVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as BIGINT)) OVER (Partition by dea.location Order by dea.location, dea.date) as SumofVaccinated
From [Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project]..covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date
Where dea.continent is not null
)

Select*,(SumofVaccinated/population)*100 as Percentage_of_Vaccinated
From PopvsVac


-- Temp table


DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
SumofVaccinated numeric
)

Insert into #PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as SumofVaccinated

From [Portfolio Project]..coviddeaths$ dea
Join [Portfolio Project]..covidvaccine$ vac
	On dea.location = vac.location
	and dea.date = vac.date


Select *, (SumofVaccinated/Population)*100
From #PercentPopulationVaccinated



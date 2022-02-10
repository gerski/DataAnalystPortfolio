Select *
From [Portfolio Project]..['netflix price in different coun$']

Select Country, [Total Library Size]
From [Portfolio Project]..['netflix price in different coun$']
Order by [Total Library Size] desc 

-- Over 5k

Select Country, [Total Library Size]
From [Portfolio Project]..['netflix price in different coun$']
Where [Total Library Size] > 5000
Order by [Total Library Size] desc

-- Max library

Select Country , [Total Library Size]
From [Portfolio Project]..['netflix price in different coun$']
Where [Total Library Size] = (Select Max([Total Library Size]) From [Portfolio Project]..['netflix price in different coun$'])

-- Min library

Select Country, [Total Library Size]
From [Portfolio Project]..['netflix price in different coun$']
Where [Total Library Size] = (Select Min([Total Library Size]) From [Portfolio Project]..['netflix price in different coun$'])

-- TV Shows
Select Country, [No# of TV Shows]
From [Portfolio Project]..['netflix price in different coun$']
Order by [No# of TV Shows] desc

-- TV over 2k

Select Country, [No# of TV Shows]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of TV Shows] > 2000
Order by [No# of TV Shows] desc


-- Max # of TV Shows
Select Country,[No# of TV Shows]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of TV Shows] = (Select Max([No# of TV Shows]) From [Portfolio Project]..['netflix price in different coun$'])

-- Min # of TV Shows
Select Country, [No# of TV Shows]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of TV Shows] = (Select Min([No# of TV Shows]) From [Portfolio Project]..['netflix price in different coun$'])

-- Movies

Select Country, [No# of Movies]
From [Portfolio Project]..['netflix price in different coun$']
Order by [No# of Movies] desc

--  Movies Over 2k

Select Country, [No# of Movies]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of Movies] > 2000


-- Max Movie
Select Country, [No# of Movies]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of Movies] = (Select Max([No# of Movies]) From [Portfolio Project]..['netflix price in different coun$'])

--Min Movie
Select Country, [No# of Movies]
From [Portfolio Project]..['netflix price in different coun$']
Where [No# of Movies] = (Select Min([No# of Movies]) From [Portfolio Project]..['netflix price in different coun$'])

-- Avg Cost Per Month- Basic

Select AVG([Cost Per Month - Basic ($)])
From [Portfolio Project]..['netflix price in different coun$']
-- cheap or expensive
Select Country,
CASE 
	WHEN ([Cost Per Month - Basic ($)] > 8.00  ) THEN 'expensive'

	ELSE 'cheap'

	END as Cost

	From [Portfolio Project]..['netflix price in different coun$']
	Group by [Cost Per Month - Basic ($)], Country


-- Max Cost Per Month- Basic

Select Country, [Cost Per Month - Basic ($)]
From [Portfolio Project]..['netflix price in different coun$']
Where [Cost Per Month - Basic ($)] = (Select Max([Cost Per Month - Basic ($)]) From [Portfolio Project]..['netflix price in different coun$'])

-- Min Cost Per Month - Basic

Select Country, [Cost Per Month - Basic ($)]
From [Portfolio Project]..['netflix price in different coun$']
Where [Cost Per Month - Basic ($)] = (Select Min([Cost Per Month - Basic ($)]) From [Portfolio Project]..['netflix price in different coun$'])

-- Avg Cost Per Month- Standard

Select AVG([Cost Per Month - Standard ($)]) As [Avg for Standard]
From [Portfolio Project]..['netflix price in different coun$']

-- Avg Cost Per Month- Premium

Select AVG([Cost Per Month - Premium ($)]) As [Avg for Standard]
From [Portfolio Project]..['netflix price in different coun$']

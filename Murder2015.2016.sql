Select *
From [Portfolio Project]..murder_2016_prelim$

-- 2015  max murders city
Select city, [2015_murders]
From [Portfolio Project]..murder_2016_prelim$
Where [2015_murders] = (Select MAX([2015_murders]) From [Portfolio Project]..murder_2016_prelim$)

-- 2016  max murders city
Select city, [2016_murders]
From [Portfolio Project]..murder_2016_prelim$
Where [2016_murders] = (Select MAX([2016_murders]) From [Portfolio Project]..murder_2016_prelim$)

--  2015 min
Select city , [2015_murders]
From [Portfolio Project]..murder_2016_prelim$
Where [2015_murders] = (Select MIN([2015_murders]) From [Portfolio Project]..murder_2016_prelim$)  


--2016 min
Select city, [2016_murders] 
From [Portfolio Project]..murder_2016_prelim$
Where [2016_murders] = (Select MAX([2016_murders]) From [Portfolio Project]..murder_2016_prelim$)

-- 2015 Total Murders
Select SUM([2015_murders]) as [Total 2015 Murders]
From [Portfolio Project]..murder_2016_prelim$

-- 2016 Total Murders

Select SUM([2016_murders]) as [Total 2016 Murders]
From [Portfolio Project]..murder_2016_prelim$



--New York

Select city, [2015_murders], [2016_murders]
From [Portfolio Project]..murder_2016_prelim$
Where city like '%New York%'

-- 2015 less than 100

Select city, [2015_murders]
From [Portfolio Project]..murder_2016_prelim$
Where [2015_murders] < 100
Order by [2015_murders] desc

-- 2016 between 100 and 200

Select city, [2016_murders]
From [Portfolio Project]..murder_2016_prelim$
Where [2016_murders] BETWEEN 100 and 200
Order by [2016_murders] desc


-- Avg number of murders

Select AVG([2016_murders])
From [Portfolio Project]..murder_2016_prelim$

-- murders above avg

Select city, [2016_murders],
CASE 
			WHEN([2016_murders] > (Select AVG([2016_murders]) From [Portfolio Project]..murder_2016_prelim$)) THEN 'Dangerous'
			Else 'Not Dangerous'
			END as [City Safety]
From [Portfolio Project]..murder_2016_prelim$
Group by [2016_murders], city
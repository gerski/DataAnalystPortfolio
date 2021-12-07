Select *
From[Portfolio Project]..NYPD_Hate_Crimes$

-- year highest complaints
Select Complaint_Year_Number,
COUNT(Complaint_Year_Number) as Total
From [Portfolio Project]..NYPD_Hate_Crimes$
Group by Complaint_Year_Number

-- month  highest complaints

Select Month_Number,
COUNT(Month_Number) as Total
From [Portfolio Project]..NYPD_Hate_Crimes$
Group by Month_Number 
Order by Month_Number desc
 
 -- county  highest complaints

 Select County,
 COUNT(County) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 Group by County
 Order by County desc

 -- offense category

 Select Offense_Category,
 Count(Offense_Category)as Total
 FROM [Portfolio Project]..NYPD_Hate_Crimes$
 Group by Offense_Category
 Order by Offense_Category desc

 -- law code

 Select Law_Code, Complaint_Year_Number,
 Count(Law_Code) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 Group by Law_Code, Complaint_Year_Number
 Order by Complaint_Year_Number

 -- 2019 stats

 Select Complaint_Year_Number, Offense_Description,
 Count(Offense_Description) as Total
 FROM [Portfolio Project]..NYPD_Hate_Crimes$
 Where Complaint_Year_Number = 2019
 Group by Offense_Description, Complaint_Year_Number
 Order by Total desc;

 Select Complaint_Year_Number, Bias_Motive_Description,
 Count(Bias_Motive_Description) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 WHERE Complaint_Year_Number = 2019
 Group by Complaint_Year_Number, Bias_Motive_Description
 Order by Total desc;

 Select Complaint_Year_Number,Complaint_Precinct_Code,
 Count(Complaint_Precinct_Code) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 Where Complaint_Year_Number = 2019
 Group by Complaint_Year_Number, Complaint_Precinct_Code
 Order by Total desc;

 -- toal crimes sorted by law code for 2019
 Select Complaint_Year_Number, Law_Code,
 Count(Law_Code) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 Where Complaint_Year_Number = 2019
 Group by Complaint_Year_Number, Law_Code
 Order by Total desc;

 -- total complaints by month for 2019

 Select Complaint_Year_Number, Month_Number,
 Count(Law_Code) as Total
 From [Portfolio Project]..NYPD_Hate_Crimes$
 Where Complaint_Year_Number = 2019
 Group by Complaint_Year_Number, Month_Number
 Order by Month_Number;

 
 
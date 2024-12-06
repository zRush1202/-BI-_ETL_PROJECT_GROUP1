create database DDS;
go
use DDS;
go

create table dimGeography (
	CountyID_SK int primary key,
	CountyName nvarchar(255),
    CountyAscii nvarchar(255),
    CountyFull nvarchar(255),
    CountyCode int, 
    Lat float,
    Lng float,
    PopulationCounty int,
	StateID_SK int,
	StateName nvarchar(255),
    StateCode int
)
go

create table dimTime (
	TimeID_SK int primary key,
	Date datetime,
	Day int,
	Month int,
	Quarter int,
	Year int
)
go

create table factAnalysis (
	CountyID_SK int,
	TimeID_SK int,
    AQI int,
    Category nvarchar(255),
	foreign key (CountyID_SK) references dimGeography (CountyID_SK),
	foreign key (TimeID_SK) references dimTime (TimeID_SK)
)
go

drop table dimState;
drop table dimCounty;
drop table dimTime;

--Phân tích max, min AQI của mỗi state theo mỗi quý trong năm
select f.StateID_SK, t.Quarter as 'Quarter', max(f.AQI) as 'Max AQI', min(f.AQI) as 'MinAQI'
from factAnalysis f, dimTime t
where f.TimeID_SK = t.TimeID_SK
group by f.StateID_SK, t.Quarter
order by f.StateID_SK asc


--Report the mean and the standard deviation of AQI value for each State during each quarter of years.
SELECT ds.StateName, dt.Year, dt.Quarter, AVG(fa.AQI) AS MeanAQI, STDEV(fa.AQI) AS StdDevAQI
FROM factAnalysis fa
JOIN dimState ds ON fa.StateID_SK = ds.StateID_SK
JOIN dimTime dt ON fa.TimeID_SK = dt.TimeID_SK
GROUP BY ds.StateName, dt.Year, dt.Quarter
ORDER BY ds.StateName, dt.Year, dt.Quarter;

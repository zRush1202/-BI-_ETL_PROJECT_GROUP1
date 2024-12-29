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

create table dimAQCategory (
	CategoryID int primary key,
	CategoryName nvarchar(255),
)
go

create table factAnalysis (
	CountyID_SK int,
	TimeID_SK int,
    AQI int,
    CategoryID int,
	foreign key (CountyID_SK) references dimGeography (CountyID_SK),
	foreign key (TimeID_SK) references dimTime (TimeID_SK),
	foreign key (CategoryID) references dimAQCategory (CategoryID),
)
go
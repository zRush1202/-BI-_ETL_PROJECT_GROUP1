create database AirQualityStage;

use AirQualityStage;	

create table stgAirQuality (
	stgID nvarchar(255) primary key,
	stgStateName nvarchar(255),
	stgCountyName nvarchar(255),
	stgStateCode int,
	stgCountyCode int,
	stgDate datetime,
	stgAQI int, 
	stgCategory nvarchar(255) check (stgCategory in ('Good', 'Moderate', 'Unhealthy for Sensitive Groups', 'Unhealthy', 'Very Unhealthy', 'Hazardous')),
	stgDefiPara nvarchar(255),
	stgDefiSite nvarchar(255),
	stgNoSR int, 
	stgCreated datetime,
	stgLastUpdated datetime,
	SourceID int,
);

select * from stgAirQuality;

truncate table stgAirQuality;

create table stgUSCounty (
	stgUSCID int identity(1,1) primary key,
	stgCounty nvarchar(255),
	stgCountyAscii nvarchar(255),
	stgCountyFull nvarchar(255),
	stgCountyFips int,
	stgStateID nvarchar(255),
	stgStateName nvarchar(255),
	stgLat float,
	stgLng float, 
	stgPopulation bigint,
	state_code int,
	county_code int,
);

select * from stgUSCounty where stgUSCID = 1;
select * from stgAirQuality where stgCountyName = 'Los Angeles';
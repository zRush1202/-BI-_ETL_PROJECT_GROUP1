truncate table StateNDS;
truncate table CountyNDS;
truncate table AirQualityNDS;

create table StateNDS
(
    StateID_SK int identity(1,1) primary key,
    StateID_NK nvarchar(255),
    StateName nvarchar(255),
    StateCode int,
    CreatedAt datetime,
    UpdatedAt datetime,
    SourceID int
)

create table CountyNDS
(
    CountyID_SK int identity(1,1) primary key,
    CountyName nvarchar(255),
    CountyAscii nvarchar(255),
    CountyFull nvarchar(255),
    CountyFips_NK int,
    CountyCode int, 
    StateID_SK int,
    Lat float,
    Lng float,
    PopulationCounty int,
    CreatedAt datetime,
    UpdatedAt datetime,
    SourceID int,
    CONSTRAINT FK_CountyNDS_StateNDS FOREIGN KEY (StateID_SK) REFERENCES StateNDS(StateID_SK)
)

create table AirQualityNDS
(
    AQID_SK int identity(1,1) primary key,
    AQID_NK nvarchar(255),
    DateAirQuality datetime,
    AQI int,
    Category nvarchar(255) check (Category in ('Good', 'Moderate', 'Unhealthy for Sensitive Groups', 'Unhealthy', 'Very Unhealthy', 'Hazardous')),
    DefiningParameter nvarchar(255),
    DefiningSite nvarchar(255),
    NumberOfSitesReporting int,
    CountyID_SK int,
    CreatedAt datetime,
    UpdatedAt datetime,
    SourceID int,
    CONSTRAINT FK_AirQualityNDS_CountyNDS FOREIGN KEY (CountyID_SK) REFERENCES CountyNDS(CountyID_SK)
)




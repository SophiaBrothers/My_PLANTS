-- This statement creates the MyPlants database.

CREATE DATABASE MyPlants;
GO

--This script creates the tables and relates the tables via Foreign and Primary keys)

USE MyPlants;

CREATE TABLE Plants
(PlantID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
PlantName varchar(50) NOT NULL,
Environment varchar(50) NOT NULL,
Flowering varchar(10) NOT NULL,
Edible varchar(10) NULL,
LightRequirements varchar(20) NULL,
WaterRequirements varchar(20) NULL,
DatePlanted DATE NULL,
PlantPrice smallmoney NULL,
Quantity int NULL);

CREATE TABLE Season
(SeasonID INT NOT NULL IDENTITY(101,1) PRIMARY KEY,
SeasonName varchar(50) NOT NULL,
Reblooms varchar(10) NULL );

CREATE TABLE GrowthHabit
(GrowthHabitID INT NOT NULL IDENTITY(4001,1) PRIMARY KEY,
GrowthHabitType varchar(50) NOT NULL,
MaxHeight_ft FLOAT NULL,
MaxWidth_ft FLOAT NULL);

CREATE TABLE US_Zone
(US_ZoneID INT NOT NULL IDENTITY(5001,1) PRIMARY KEY,
US_ZoneCode varchar(50) NOT NULL,
Avg_LowTemp_F DECIMAL NOT NULL,
Avg_HighTemp_F DECIMAL NOT NULL);

CREATE TABLE Climate
(ClimateID INT NOT NULL IDENTITY(2,2) PRIMARY KEY,
ClimateName varchar(50) NOT NULL,
Characteristic_1 varchar(100) NULL,
Characteristic_2 varchar(100) NULL);

CREATE TABLE Origins
(OriginID INT NOT NULL IDENTITY(500,1) PRIMARY KEY,
OriginName varchar(100) NULL,
ClimateID INT FOREIGN KEY REFERENCES Climate(ClimateID),
Hemisphere1 varchar(100) NULL,
Hemisphere2 varchar(100) NULL);

CREATE TABLE PlantOrigins
(PlantID INT PRIMARY KEY REFERENCES Plants(PlantID),
OriginID INT FOREIGN KEY REFERENCES Origins(OriginID));


ALTER TABLE PLANTS
ADD SeasonID INT FOREIGN KEY REFERENCES Season(SeasonID);

ALTER TABLE Plants
ADD GrowthHabitID INT FOREIGN KEY REFERENCES GrowthHabit(GrowthHabitID);

ALTER TABLE Plants
ADD US_ZoneID INT FOREIGN KEY REFERENCES US_Zone(US_ZoneID);

GO


--This script inserts data into tables.

USE MyPlants;


INSERT INTO Season (SeasonName, Reblooms)
VALUES ('Perrenial', 'Y')

INSERT INTO Season (SeasonName, Reblooms)
VALUES ('Annual', 'N')

INSERT INTO Season (SeasonName, Reblooms)
VALUES ('Bieenial', 'Y')

GO


INSERT INTO Climate (ClimateName, Characteristic_1, Characteristic_2)
VALUES ('Tropical', 'Warm', 'Wet');

INSERT INTO Climate (ClimateName, Characteristic_1, Characteristic_2)
VALUES ('Arid', 'Hot', 'Dry');

INSERT INTO Climate (ClimateName, Characteristic_1, Characteristic_2)
VALUES ('Polor', 'Cold', 'Windy');

INSERT INTO Climate (ClimateName, Characteristic_1, Characteristic_2)
VALUES ('Continental', 'Hot', 'Cold');

INSERT INTO Climate (ClimateName, Characteristic_1, Characteristic_2)
VALUES ('Mediterranean', 'Mild', 'Humid');

GO


INSERT INTO GrowthHabit (GrowthHabitType, MaxHeight_ft, MaxWidth_ft)
VALUES ('Shrub', '15', '10');

INSERT INTO GrowthHabit (GrowthHabitType, MaxHeight_ft, MaxWidth_ft)
VALUES ('Tree', '426', '79');

INSERT INTO GrowthHabit (GrowthHabitType, MaxHeight_ft)
VALUES ('Creeper', '1');

INSERT INTO GrowthHabit (GrowthHabitType, MaxHeight_ft)
VALUES ('Vine', '115');

INSERT INTO GrowthHabit (GrowthHabitType, MaxHeight_ft, MaxWidth_ft)
VALUES ('Herb', '3', '1');

GO


INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('NorthAmerica', '8', 'Northern', 'Western');

INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('SouthAmerica', '2', 'Southern', 'Western');

INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('Asia', '2', 'Northern', 'Eastern');

INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('Africa', '4', 'Multiple', 'Eastern');
 
INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('Europe', '10', 'Northern', 'Eastern');

INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('Australia', '4', 'Southern', 'Eastern');

INSERT INTO Origins (OriginName, ClimateID, Hemisphere1, Hemisphere2)
VALUES ('Antarctica', '6', 'Southern', 'Multiple');

GO



INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('1a', '-10', '42')

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('2a', '-5', '59') 

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('3a', '0', '62')

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('4a', '11 ', '67')

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('5a', '19', '74') 

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('6a', '22', '83')

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('7a','24', '85')

INSERT INTO US_Zone (US_ZoneCode, Avg_LowTemp_F, Avg_HighTemp_F)
VALUES ('8a','32', '91')

GO


INSERT INTO Plants (PlantName, Environment, Flowering, Edible, LightRequirements, WaterRequirements, DatePlanted, PlantPrice, Quantity, SeasonID, GrowthHabitID, US_ZoneID)
VALUES ('lupine', 'Outdoor', 'Y', 'N', 'FullSun', 'Medium', '2020-05-07', '6.98', '1', '101', '4001', '5004');

INSERT INTO Plants (PlantName, Environment, Flowering, Edible, LightRequirements, WaterRequirements, DatePlanted, PlantPrice, Quantity, SeasonID, GrowthHabitID, US_ZoneID)
VALUES ('Jane Magnolia', 'Outdoor', 'Y', 'N', 'FullSun', 'Medium', '2017-04-11', '27.50', '2', '101', '4002', '5007');

INSERT INTO Plants (PlantName, Environment, Flowering, Edible, LightRequirements, WaterRequirements, DatePlanted, PlantPrice, Quantity, SeasonID, GrowthHabitID, US_ZoneID) 
VALUES ('Butterfly Bush', 'Outdoor', 'Y', 'N', 'FullSun', 'Medium', '2017-04-21', '12.98', '4', '101', '4001', '5005');

INSERT INTO Plants (PlantName, Environment, Flowering, Edible, LightRequirements, WaterRequirements, DatePlanted, PlantPrice, Quantity, SeasonID, GrowthHabitID, US_ZoneID)
VALUES ('Creeping Jenny', 'Outdoor', 'Y', 'N', 'Shade', 'Medium', '2019-08-05', '3.49', '1', '101', '4003', '5006');

INSERT INTO Plants (PlantName, Environment, Flowering, Edible, LightRequirements, WaterRequirements, DatePlanted, PlantPrice, Quantity, SeasonID, GrowthHabitID, US_ZoneID)
VALUES ('Aloe Vera', 'Indoor', 'Y', 'N', 'PartSun', 'Light', '2020-05-15', '5.00', '2', '101', '4001', '5008');

Go


INSERT INTO PlantOrigins (PlantID, OriginID)
VALUES ('1', '500');

INSERT INTO PlantOrigins (PlantID, OriginID)
VALUES ('2', '500');

INSERT INTO PlantOrigins (PlantID, OriginID)
VALUES ('3', '502');

INSERT INTO PlantOrigins (PlantID, OriginID)
VALUES ('4', '504');

INSERT INTO PlantOrigins (PlantID, OriginID)
VALUES ('5', '502');

GO

--This code creates a view for each table in the MyPlants Database

USE MyPlants;
GO

CREATE VIEW FullSunPlants AS
SELECT PlantID, PlantName, Environment, Flowering
FROM Plants
WHERE LightRequirements = 'FullSun';
GO

CREATE VIEW ColdClimates AS
SELECT ClimateID, ClimateName
FROM Climate
WHERE Characteristic_1 = 'cold';
GO

CREATE VIEW ShortGrowers AS
SELECT GrowthHabitID, GrowthHabitType
FROM GrowthHabit
WHERE MaxHeight_ft < 21;
GO

CREATE VIEW EasternContinents AS
SELECT OriginID, OriginName, ClimateID
FROM Origins
WHERE Hemisphere2 = 'Eastern';
GO

CREATE VIEW CertifiedPlantOrigins AS
SELECT PlantID
FROM PlantOrigins
WHERE OriginID IS NOT NULL;
GO

CREATE VIEW RebloomingSeason AS
SELECT SeasonID, SeasonName
FROM Season
WHERE Reblooms = 'Yes';
GO

CREATE VIEW BelowZero AS
SELECT US_ZoneCode, Avg_LowTemp_F
FROM US_Zone
WHERE Avg_LowTemp_F < 0;
GO

--This code creates a view that shows column information from two related tables using a join.

CREATE VIEW OriginsInDetail AS
SELECT OriginID, OriginName, Characteristic_1, Characteristic_2
FROM Origins JOIN Climate ON Origins.ClimateID = Climate.ClimateID;
GO


--This is just an additonal view which may or may not be used later.

CREATE VIEW PerfectPlantWeather AS
SELECT p.PlantID, p.PlantName, c.ClimateID, c.Characteristic_1, c.Characteristic_2
FROM Plants p JOIN PlantOrigins po ON p.PlantID = po.PlantID
	JOIN Origins o ON po.OriginID = o.OriginID
	JOIN Climate c ON o.ClimateID = c.ClimateID;
GO


-- This query combines two tables and calculates the stabletemp for each plant.

SELECT 
	p.PlantID,
	p.PlantName,
	z.US_ZoneCode,
	(z.Avg_HighTemp_F + z.Avg_LowTemp_F) / 2 AS StableTemp
FROM Plants p, US_Zone z
WHERE p.US_ZoneID = z.US_ZoneID;
GO

--This query combines tables, calculates, and uses the GROUP BY and HAVING functions.

SELECT
	p.PlantID,
	p.PlantName,
	P.Environment,
	g.GrowthHabitType,
	p.Quantity,
	(p.PlantPrice * p.quantity) AS TotalSpent
FROM Plants AS p 
	JOIN GrowthHabit AS g ON p.GrowthHabitID = g.GrowthHabitID
GROUP BY p.PlantID, p.PlantName, P.Environment, g.GrowthHabitType, p.Quantity, (p.PlantPrice * p.quantity)
HAVING P.Environment LIKE 'Indoor';
GO


--This code creates a Procedure

CREATE PROCEDURE PlantCountByYear
AS
SELECT
	SUM(Quantity) AS TotalCount,
	YEAR(dateplanted) AS Year
FROM Plants
GROUP BY YEAR(dateplanted)
ORDER BY SUM(Quantity) DESC;
GO
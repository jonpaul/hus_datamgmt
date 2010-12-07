TRUNCATE TABLE MLS_Listings
TRUNCATE TABLE MLS_Images
TRUNCATE TABLE MLS_Agents
TRUNCATE TABLE MLS_Offices


--Import the Listings File
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Listings
FROM "C:\MLS Data\gcmls\Listings.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 1,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)

--Import the Images File
declare @sqlImportMedia varchar(8000)
select @sqlImportMedia =
'BULK
INSERT MLS_Images
FROM "C:\MLS Data\gcmls\Media.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 1,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportMedia)

--Import the Agents File
declare @sqlImportAgents varchar(8000)
select @sqlImportAgents =
'BULK
INSERT MLS_Agents
FROM "C:\MLS Data\gcmls\Active Agents.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 1,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportAgents)

--Import the Offices File
declare @sqlImportOffices varchar(8000)
select @sqlImportOffices =
'BULK
INSERT MLS_Offices
FROM "C:\MLS Data\gcmls\All Offices.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 1,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportOffices)
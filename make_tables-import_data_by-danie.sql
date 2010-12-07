--Create CPMLImage Table
DROP TABLE MLS_Images
PRINT 'Dropped OLD CPMLImage Table'
CREATE TABLE MLS_Images
(
FKL_XML_CLIENT_ID BIGINT,
import_status INT,
fkl_Property_ID varchar(max),
sdescription varchar(MAX),
sLarge_url varchar(500),
sThumb_url varchar(500),
bPrimary nvarchar(max)
)
PRINT 'Created NEW CPMLImage Table'

--Create CPML Office Table
Drop TABLE MLS_Offices
PRINT 'Dropped OLD CPMLOffices Table'
CREATE TABLE MLS_Offices
(
FKL_XML_CLIENT_ID bigint,
import_status int,
Office_ID varchar(max),
MLSName nvarchar(max),
sOffice_Name varchar(200),
fkl_country_ID nvarchar(MAX),
sPhy_street nvarchar(MAX),
fkl_phy_province_ID nvarchar(MAX),
fkl_phy_town_ID nvarchar(MAX),
fkl_phy_suburb_ID nvarchar(MAX),
sPos_street nvarchar(MAX),
fkl_pos_province_ID nvarchar(MAX),
fkl_pos_town_ID nvarchar(MAX),
fkl_pos_suburb_ID nvarchar(MAX),
sTel_Code varchar(3),
sTel varchar(7),
sEmail varchar(200),
sFax_Code varchar(3),
sFax varchar(7),
sUrl nvarchar(MAX),
sProfile TEXT,
imgLogo nvarchar(MAX), 
fkl_Group_ID nvarchar(max),
sIM nvarchar(MAX)
)
PRINT 'Created NEW CPMLOffices Table'

--Create CPML Agent Table
DROP TABLE MLS_Agents
PRINT 'Dropped OLD CPMLAgent Table'
CREATE TABLE MLS_Agents
(
FKL_XML_CLIENT_ID bigint,
import_status int,
Agent_ID varchar(max),
sAgent_Name varchar(max),
sAgent_SurName varchar(max),
imgProfile_Image nvarchar(max),
sProfile varchar(100),
sIM varchar(100),
fkl_Office_ID varchar(max),
sTel_Code varchar(3),
sTel varchar(7),
sEmail varchar(60)
)
PRINT 'Created NEW CPMLAgents Table'

--Create CPML Listing Table
DROP TABLE MLS_Listings
PRINT 'Dropped OLD CPMLListings Table'
CREATE TABLE MLS_Listings
(fkl_Office_ID varchar(Max),
fkl_Agent_ID varchar(Max),
fkl_Property_ID varchar(max),
MLS_ID nvarchar(30),
dLng decimal(9,6),
dLat decimal(9,6),
sStreetNumber varchar(10),
sStreetName varchar(100), 
sUnitNumber varchar(10),
sComplexName varchar(100),
fkl_Property_Class varchar(max),
fkl_Property_type_ID nvarchar(max),
nPrice numeric(10,0),
dtList_Date datetime,
dtExp_Date datetime,
fkl_Property_status_ID nvarchar(max),
sDescription varchar(MAX),
iBeds int,
iBaths decimal(3,1),
iGarages int,
bPool varchar(max),
iLiving_Area int,
iStaff_Q int,
iStudy int,
sDirect_url varchar(200),
iLand_Size decimal(10,3),
fkl_Land_size_Unit_ID varchar(max),
iStand_Size decimal(10,3),
fkl_Stand_Size_Unit_ID varchar(max),
sVT_URL varchar(MAX),
fkl_Suburb_ID varchar(max),
fkl_Town_ID varchar(max),
fkl_Province_ID varchar(max),
fkl_Country_ID varchar(max)) 
PRINT 'Created NEW CPMLListings Table'
END

--Import the Listings File
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Listings
FROM '''+ @ListingFileName +'''
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Listings
FROM 'C:\MLSData\Listings\<MLS>\ListingData.txt'
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'

--Import the Images File
EXEC (@sqlImportListings)
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Images
FROM 'C:\MLSData\Images\<MLS>\ImageData.txt'
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)

--Import the Agents File
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Agents
FROM 'C:\MLSData\Agents\<MLS>\AgentData.txt'
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)

--Import the Offices File
declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Offices
FROM 'C:\MLSData\Offices\<MLS>\OfficeData.txt'
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)
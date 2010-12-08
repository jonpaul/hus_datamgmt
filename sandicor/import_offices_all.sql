declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Offices_All_Sandicor
FROM "C:\MLS Data\Sandicor\All Offices.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)
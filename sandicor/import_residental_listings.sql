declare @sqlImportListings varchar(8000)
select @sqlImportListings =
'BULK
INSERT MLS_Listings_Residential_Sandicor
FROM "C:\MLS Data\Sandicor\all_residential_listings.txt"
WITH
(
FIELDTERMINATOR = ''\t'',
FIRSTROW = 2,
ROWTERMINATOR = ''\n''
)'
EXEC (@sqlImportListings)
DROP OMS_Agent_All_Sandicor
PRINT 'Destroyed Table OMS_Agent_All_Sandicor'
SELECT 
# Define, MLS-Column-Header to OMS-Column-Header
Agent_Public_ID AS Agent_ID, 
COLUMN_HEADER AS OMS_COLUMN_HEADER, 
# End the Define process
INTO OMS_Agent_All_Sandicor 
FROM MLS_Agent_All_Sandicor
PRINT 'Exported Selected Content from MLS table to OMS table'

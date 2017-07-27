--First Truncate tables
TRUNCATE TABLE History_temp1
TRUNCATE TABLE History_temp2
TRUNCATE TABLE History
-- Verify the TABLE IS EMPTY AFTER truncation
SELECT COUNT(*) FROM History_temp1
SELECT COUNT(*) FROM History_temp2
SELECT COUNT(*) FROM History

-- Load June data to temp1
BULK insert dbo.History_temp1
from 'path\file.txt'
WITH
(
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
)

-- Load July data to temp2
BULK insert dbo.History_temp2
from 'path\file2.txt'
WITH
(
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
)

-- Use this to select from temp1 into target_table, then repeat for temp2
INSERT INTO target_table (
     
) 
SELECT * FROM History_temp1
 
-- Update the date for June data
UPDATE History SET CreateDt = '2015-06-01 00:00:00.000'

-- REPEAT above data load for temp2

-- Update the date for July data
UPDATE History SET CreateDt = '2015-08-01 00:00:00.000'
WHERE CreateDt <> '2015-06-01 00:00:00.000'


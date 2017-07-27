WITH proc_codes AS (
SELECT DISTINCT procedurecode, count(*) as totals
FROM input_table
WHERE procedurecode IS NOT NULL
GROUP BY procedurecode
)
SELECT procedurecode FROM proc_codes t1
LEFT JOIN codeset_all t2
ON (t1.procedurecode = t2.cd)
WHERE t2.cd IS NULL
ORDER BY totals desc
;
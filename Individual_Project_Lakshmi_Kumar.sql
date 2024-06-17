USE KansasCityRequests
GO

--Q1
--Validation by Year
SELECT
    YEAR([DATE_CREATED]) AS RequestYear,
    COUNT(*) AS RequestCount
FROM
    stg_kansascityrequests
WHERE
    YEAR([DATE_CREATED]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([DATE_CREATED])
ORDER BY
    RequestYear;

--Q1
--Validation by Month
SELECT
    YEAR([DATE_CREATED]) AS RequestYear,
    MONTH([DATE_CREATED]) AS RequestMonth,
    COUNT(*) AS RequestCount
FROM
    stg_kansascityrequests
WHERE
    YEAR([DATE_CREATED]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([DATE_CREATED]),
    MONTH([DATE_CREATED])
ORDER BY
    RequestYear, RequestMonth;

--Q2
SELECT
    [SOURCE],
    COUNT(*) AS RequestCount
FROM
    stg_kansascityrequests
GROUP BY
    [SOURCE]
ORDER BY
    RequestCount DESC;

--Q3
SELECT
    [DEPARTMENT],
    COUNT(*) AS RequestCount
FROM
    stg_kansascityrequests
GROUP BY
    [DEPARTMENT]
ORDER BY
    RequestCount DESC;

--Q4
--Can't be validated due to the presence of NULL values

--Q5
SELECT TOP 10
    [NEIGHBORHOOD],
    COUNT(*) AS RequestCount
FROM
    stg_kansascityrequests
GROUP BY
    [NEIGHBORHOOD]
ORDER BY
    RequestCount DESC;

--Q6
SELECT
    [DEPARTMENT],
    [WORK GROUP],
    COUNT(*) AS WorkloadCount
FROM
    stg_kansascityrequests
GROUP BY
    [DEPARTMENT],
    [WORK GROUP]
ORDER BY
    WorkloadCount DESC , [DEPARTMENT] ;

--Q7
--Can't be validated due to the presence of NULL values

--Q8
SELECT
    YEAR([CREATION DATE]) AS RequestYear,
    [STATUS],
    COUNT(*) AS StatusCount
FROM
    stg_kansascityrequests
WHERE
    YEAR([CREATION DATE]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([CREATION DATE]),
    [STATUS]
ORDER BY
    RequestYear, [STATUS];

--Q9
SELECT TOP 10
    [CATEGORY1],
    AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM
    stg_kansascityrequests
WHERE
    [DAYS TO CLOSE] IS NOT NULL
GROUP BY
    [CATEGORY1]
ORDER BY
    AvgDaysToClose DESC;

--Q10
SELECT
    [DEPARTMENT],
    COUNT(DISTINCT [CASE ID]) AS CaseCount,
    COUNT(*) AS Workload,
    AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM
    stg_kansascityrequests
WHERE
    [DAYS TO CLOSE] IS NOT NULL 
GROUP BY
    [DEPARTMENT];














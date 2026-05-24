WITH hl AS (
    SELECT
        name,
        CASE
            WHEN indepyear < 1900 THEN 'Early Independence'
            WHEN indepyear >= 1900 THEN 'Later Independence'
        END AS independence_category,
        gnp,
        surfacearea
    FROM country
    WHERE indepyear IS NOT NULL
      AND gnp IS NOT NULL
)

SELECT 
    independence_category,
    ROUND(AVG(gnp), 2) AS avg_gnp,
    ROUND(AVG(surfacearea), 2) AS avg_surfacearea
FROM hl
GROUP BY independence_category;
-- =====================================================
-- TASK 6: Independent vs. Non-Independent Country Analysis
-- =====================================================
--
-- BUSINESS QUESTION:
-- Do countries that gained independence before 1900 have 
-- significantly different average GNPs compared to those after 1900?
--
-- REQUIREMENTS:
-- - Group into: 'Early Independence' (IndepYear < 1900) 
--              'Later Independence' (IndepYear >= 1900)
-- - Calculate average GNP and average SurfaceArea for each group
-- - Exclude NULL IndepYear and NULL GNP
-- - Round averages to 2 decimal places
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

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

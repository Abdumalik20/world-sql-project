-- =====================================================
-- TASK 4: Life Expectancy Gaps by Government Form
-- =====================================================
--
-- BUSINESS QUESTION:
-- The analytics team is investigating if different forms of government 
-- are associated with higher life expectancy.
--
-- REQUIREMENTS:
-- - Calculate MIN, MAX, and AVG life expectancy for each GovernmentForm
-- - Only include government forms that appear in at least 5 countries
-- - Exclude NULL LifeExpectancy
-- - Order by average life expectancy from highest to lowest
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

SELECT
    governmentform,
    MIN(lifeexpectancy) AS min_life,
    MAX(lifeexpectancy) AS max_life,
    AVG(lifeexpectancy) AS avg_life
FROM country
WHERE lifeexpectancy IS NOT NULL
GROUP BY governmentform
HAVING COUNT(*) >= 5
ORDER BY avg_life DESC;

-- =====================================================
-- TASK 1: Capital Population Concentration
-- =====================================================
-- 
-- BUSINESS QUESTION:
-- Your manager wants to identify which countries have extreme 
-- population concentration in their largest city (a common risk 
-- for supply chain or sales strategy).
--
-- REQUIREMENTS:
-- - Show: Country Name, Capital Name, Capital Population
-- - Calculate: Percentage of country's population living in capital
-- - Filter: Only countries where capital population > 1,000,000
-- - Round percentage to 2 decimal places
-- - Order by percentage descending
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

SELECT 
    c.Name AS country_name,
    ci.Name AS capital_name,
    ci.Population AS capital_population,
    ROUND((ci.Population / c.Population) * 100, 2) AS capital_population_percentage
FROM country c
JOIN city ci ON c.Capital = ci.ID
WHERE ci.Population > 1000000
  AND c.Population > 0
ORDER BY capital_population_percentage DESC;

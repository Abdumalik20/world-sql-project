-- =====================================================
-- TASK 7: Cities with Same Name as Country
-- =====================================================
--
-- BUSINESS QUESTION:
-- Data quality check required. There might be inconsistencies 
-- where a city shares its name with its parent country.
--
-- REQUIREMENTS:
-- - Find all instances where city.Name exactly equals country.Name
-- - Return: city name, country name, city population, country population
-- - Calculate city population as percentage of country population
-- - Exclude cases where city is the capital (avoid false positives)
-- - Order by percentage descending
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

SELECT 
    ci.Name AS city_name,
    c.Name AS country_name,
    ci.Population AS city_population,
    c.Population AS country_population,
    ROUND((ci.Population / c.Population) * 100, 2) AS city_percentage_of_country
FROM city ci
JOIN country c ON ci.CountryCode = c.Code
WHERE ci.Name = c.Name
  AND ci.ID != c.Capital
  AND c.Population > 0
ORDER BY city_percentage_of_country DESC;

-- =====================================================
-- TASK 3: Top N Cities per Continent
-- =====================================================
--
-- BUSINESS QUESTION:
-- A product launch team needs to know the top 3 most populous 
-- cities on each continent (based on the country's continent, not city region).
--
-- REQUIREMENTS:
-- - Use window function to rank cities by population within their continent
-- - Return: Continent, CityName, CountryName, Population
-- - Only include top 3 cities per continent
-- - Exclude cities with population less than 1,000,000
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

WITH ranking AS (
    SELECT 
        ci.Name AS CityName,
        co.Name AS CountryName,
        co.Continent AS Continent,
        ci.Population AS CityPopulation,
        ROW_NUMBER() OVER (
            PARTITION BY co.Continent 
            ORDER BY ci.Population DESC
        ) AS top_three
    FROM city AS ci
    INNER JOIN country AS co
        ON ci.CountryCode = co.Code
    WHERE ci.Population >= 1000000
)

SELECT 
    Continent,
    CityName,
    CountryName,
    CityPopulation
FROM ranking
WHERE top_three <= 3
ORDER BY Continent, top_three;

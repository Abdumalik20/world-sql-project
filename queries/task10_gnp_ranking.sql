-- =====================================================
-- TASK 10: GNP per Person Correlation Suggestion
-- =====================================================
--
-- BUSINESS QUESTION:
-- Provide data for a scatter plot comparing economic output to population size.
--
-- REQUIREMENTS:
-- - Only countries with GNP > 0 and Population > 0
-- - Create column: gnp_per_capita (GNP / Population)
-- - Rank countries within their continent by gnp_per_capita (highest = rank 1)
-- - Return: Continent, Country Name, gnp_per_capita (rounded to 6 decimals), rank
-- - Only show top 5 ranked countries per continent
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================


SELECT * FROM country;

WITH GNPPerCapitaRanked AS (
    SELECT 
        Continent,
        Name,
        ROUND(GNP / Population, 6) AS gnp_per_capita,
        RANK() OVER (PARTITION BY Continent ORDER BY (GNP / Population) DESC) AS gnp_rank
    FROM country
    WHERE GNP > 0 
      AND Population > 0
)
SELECT 
    Continent,
    Name,
    gnp_per_capita,
    gnp_rank
FROM GNPPerCapitaRanked
WHERE gnp_rank <= 5
ORDER BY Continent, gnp_rank;

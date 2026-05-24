-- =====================================================
-- TASK 2: Official Language vs. Population Analysis
-- =====================================================
--
-- BUSINESS QUESTION:
-- The marketing team wants to know if there is a relationship 
-- between a country having English as an official language and 
-- its total population size.
--
-- REQUIREMENTS:
-- - Compare average population of countries where English is official (IsOfficial = 'T')
-- - VS countries where English is NOT official
-- - Exclude NULL population or population = 0
-- - Return as single row with two columns:
--   avg_population_official_english and avg_population_non_official_english
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================


SELECT 
    AVG(CASE WHEN cl.IsOfficial = 'T' THEN c.Population END) AS avg_population_official_english,
    AVG(CASE WHEN cl.IsOfficial = 'F' THEN c.Population END) AS avg_population_non_official_english
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.Language = 'English'
  AND c.Population IS NOT NULL
  AND c.Population > 0;

-- =====================================================
-- TASK 5: Language Diversity Hotspots
-- =====================================================
--
-- BUSINESS QUESTION:
-- Find countries that speak more than 5 distinct languages, 
-- as these markets require more localization effort.
--
-- REQUIREMENTS:
-- - Return: CountryCode, Country Name, count of distinct languages, sum of percentages
-- - Only countries with more than 5 languages
-- - Order by language count descending
--
-- =====================================================
-- MY SOLUTION:
-- =====================================================

SELECT 
    cl.CountryCode,
    c.Name AS CountryName,
    COUNT(DISTINCT cl.Language) AS language_count,
    SUM(cl.Percentage) AS total_percentage_sum
FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
GROUP BY cl.CountryCode, c.Name
HAVING COUNT(DISTINCT cl.Language) > 5
ORDER BY language_count DESC;

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
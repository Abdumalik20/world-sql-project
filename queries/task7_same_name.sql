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
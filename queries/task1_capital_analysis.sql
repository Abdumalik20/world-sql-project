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
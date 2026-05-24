SELECT 
    AVG(CASE WHEN cl.IsOfficial = 'T' THEN c.Population END) AS avg_population_official_english,
    AVG(CASE WHEN cl.IsOfficial = 'F' THEN c.Population END) AS avg_population_non_official_english
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.Language = 'English'
  AND c.Population IS NOT NULL
  AND c.Population > 0;
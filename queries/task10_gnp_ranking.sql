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
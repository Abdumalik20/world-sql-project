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
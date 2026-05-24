WITH RegionalDensity AS (
    SELECT 
        Region,
        SUM(Population) AS total_population,
        SUM(SurfaceArea) AS total_surface_area,
        (SUM(Population) / SUM(SurfaceArea)) AS population_density
    FROM country
    WHERE Population > 0 AND SurfaceArea > 0
    GROUP BY Region
    HAVING population_density > 200
),
LargestCountryPerRegion AS (
    SELECT 
        Region,
        Name AS largest_country_name,
        Population AS largest_country_population,
        ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Population DESC) AS rn
    FROM country
    WHERE Population > 0
)

SELECT 
    rd.Region,
    lc.largest_country_name,
    lc.largest_country_population,
    ROUND(rd.population_density, 2) AS region_density
FROM RegionalDensity rd
JOIN LargestCountryPerRegion lc ON rd.Region = lc.Region
WHERE lc.rn = 1
ORDER BY region_density DESC;
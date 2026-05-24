WITH calculation AS (
    SELECT
        CASE
            WHEN co.GovernmentForm LIKE '%Monarchy%' THEN 'Monarchy'
            WHEN co.GovernmentForm LIKE '%Republic%' THEN 'Republic'
        END AS Government_Type,
        
        COUNT(ci.ID) AS total_number_of_cities,
        AVG(ci.Population) AS average_city_population

    FROM country AS co
    INNER JOIN city AS ci
        ON co.Code = ci.CountryCode

    WHERE co.GovernmentForm LIKE '%Monarchy%'
       OR co.GovernmentForm LIKE '%Republic%'

    GROUP BY Government_Type
)

SELECT *
FROM calculation;
SELECT
    governmentform,
    MIN(lifeexpectancy) AS min_life,
    MAX(lifeexpectancy) AS max_life,
    AVG(lifeexpectancy) AS avg_life
FROM country
WHERE lifeexpectancy IS NOT NULL
GROUP BY governmentform
HAVING COUNT(*) >= 5
ORDER BY avg_life DESC;
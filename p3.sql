SELECT 
  Entity_id, AVG(Number_rabies), MIN(Number_rabies), MAX(Number_rabies), SUM(Number_rabies)
FROM InfectiousCases
WHERE Number_rabies IS NOT NULL
GROUP BY 1
ORDER BY 2
LIMIT 10;
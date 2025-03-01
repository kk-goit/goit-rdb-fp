DROP FUNCTION IF EXISTS CalculateYearDiff;
DELIMITER //
CREATE FUNCTION CalculateYearDiff(p_Year YEAR)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    SET result = TIMESTAMPDIFF(YEAR, MAKEDATE(p_Year, 1), CURDATE());
    RETURN result;
END //
DELIMITER ;

SELECT
  `Year`,
  CalculateYearDiff(`Year`)
FROM InfectiousCases;
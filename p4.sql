SELECT
  `Year`,
  MAKEDATE(`Year`, 1),
  CURDATE(),
  TIMESTAMPDIFF(YEAR, MAKEDATE(`Year`, 1), CURDATE())
FROM InfectiousCases;
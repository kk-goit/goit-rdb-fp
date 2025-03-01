CREATE TABLE `Entities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Code` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Code_UNIQUE` (`Code` ASC) VISIBLE);

CREATE TABLE `InfectiousCases` (
  `Entity_id` int NOT NULL,
  `Year` year DEFAULT NULL,
  `Number_yaws` text DEFAULT NULL,
  `polio_cases` int DEFAULT NULL,
  `cases_guinea_worm` int DEFAULT NULL,
  `Number_rabies` float DEFAULT NULL,
  `Number_malaria` float DEFAULT NULL,
  `Number_hiv` float DEFAULT NULL,
  `Number_tuberculosis` float DEFAULT NULL,
  `Number_smallpox` text DEFAULT NULL,
  `Number_cholera_cases` int DEFAULT NULL,
  KEY `fk_InfectiousCases_Entity_idx` (`Entity_id`),
  CONSTRAINT `fk_InfectiousCases_Entity` FOREIGN KEY (`Entity_id`) REFERENCES `Entities` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

INSERT INTO `Entities` (Name, Code) 
SELECT ic.Entity, ic.Code 
FROM infectious_cases AS ic
GROUP BY 1,2;

INSERT INTO `InfectiousCases` (
  Entity_id, 
  `Year`, Number_yaws, polio_cases, cases_guinea_worm,
  Number_rabies, Number_malaria, Number_hiv,
  Number_tuberculosis, Number_smallpox,
  Number_cholera_cases
  )
SELECT 
  (SELECT e.id FROM Entities AS e WHERE e.Code = ic.CODE),
  ic.Year, ic.Number_yaws, ic.polio_cases, ic.cases_guinea_worm,
  CASE WHEN ic.Number_rabies != '' THEN ic.Number_rabies ELSE NULL END, 
  CASE WHEN ic.Number_malaria != '' THEN ic.Number_malaria ELSE NULL END, 
  CASE WHEN ic.Number_hiv != '' THEN ic.Number_hiv ELSE NULL END,
  CASE WHEN ic.Number_tuberculosis != '' THEN ic.Number_tuberculosis ELSE NULL END, 
  ic.Number_smallpox,
  CASE WHEN ic.Number_cholera_cases != '' THEN ic.Number_cholera_cases ELSE NULL END
FROM infectious_cases AS ic;
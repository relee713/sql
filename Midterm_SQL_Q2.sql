USE HAFH;
/* Midterm Question 2 */
SELECT BuildingID AS 'building', 
InsID AS 'inspector name', 
DateLast AS 'date of last inspection' 
FROM inspecting
WHERE DateLast IN
(SELECT MAX(DateLast) FROM inspecting GROUP BY buildingID);

SELECT b.BuildingID, m.mfname, m.mlname
FROM manager m
LEFT JOIN building b
ON b.buildingid = m.mresbuildingid;

SELECT mlname 
FROM manager
WHERE mlname LIKE ('%a%');

SELECT buildingid, bnooffloors
FROM building 
ORDER BY bnooffloors DESC;
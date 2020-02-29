--FIND DUPLICATE ROWS
WITH CTE AS(
   SELECT firstname, lastname,
       RN = ROW_NUMBER()OVER(PARTITION BY firstname,lastname ORDER BY lastname)
   FROM dbo.member
)
SELECT * from CTE WHERE RN > 1

GO

--DELETE DUPLICATE ROWS
WITH CTE AS(
   SELECT firstname, lastname,
       RN = ROW_NUMBER()OVER(PARTITION BY firstname,lastname ORDER BY lastname)
   FROM dbo.member
)
DELETE FROM CTE WHERE RN > 1

GO

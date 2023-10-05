CREATE OR REPLACE PROCEDURE AVERAGEPRICE (
averageVal out number)
AS 
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;
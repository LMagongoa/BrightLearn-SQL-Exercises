SELECT*
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
LIMIT 100;

-----checking for the minimum and maximum age in the table
SELECT MAX(Age) AS MAXAGE, MIN(Age)AS MINAGE
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`

-----checking for types of genders in the table

SELECT DISTINCT Gender
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`

----Q1 Filter all transactions that occurred in the year 2023. Expected output: All columns

SELECT *
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
WHERE EXTRACT(YEAR FROM Date) = 2023;

----Q2 Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset. Expected output: All columns

SELECT *
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
WHERE`Total Amount` >(
  SELECT AVG(`Total Amount`)
  FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
);

----Q3 Calculate the total revenue (sum of Total Amount). Expected output: Total_Revenue

SELECT SUM(`Total Amount`)AS `Total Revenue`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`

----Q4 Display all distinct Product Categories in the dataset. Expected output: Product_Category

SELECT DISTINCT`Product Category`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`

----Q5 Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+). Expected output: Customer_ID, Age, Age_Group

SELECT `Product Category`,SUM(`Total Amount`)AS `Total Quantity`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
GROUP BY `Product Category`;

----Q6 Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+). Expected output: Customer_ID, Age, Age_Group

SELECT
  COUNT (`Customer ID`)AS `Customer Count`,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age between 30 AND 50 THEN 'Adult'
    ELSE 'Senior'
    END 
    AS `Age Group`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
GROUP BY `Age Group`;

----Q7 For each Gender, count how many high-value transactions occurred (where Total Amount > 500). Expected output: Gender, High_Value_Transactions

SELECT
  Gender,
  COUNT(`Total Amount`)AS `High Value Transaction`
 FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
 GROUP BY Gender
 HAVING COUNT(`Total Amount`) >500;


 ----Q8 For each Product Category, show only those categories where the total revenue exceeds 5,000. Expected output: Product_Category, Total_Revenue

SELECT
  `Product Category`,
  SUM(`Total Amount`)AS `Total Revenue`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

----Q9 Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200 Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

SELECT
  COUNT(`Transaction ID`) AS `Transaction ID` ,
    CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
    END AS `Unit Cost Category`
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
GROUP BY
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    ELSE 'Expensive'
    END;

----Q10 Display all transactions from customers aged 40 or older and add a column Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’. Expected output: Customer_ID, Age, Total_Amount, Spending_Level

SELECT
  `Customer ID`,
  Age,
  `Total Amount`,
  CASE WHEN `Total Amount` > 1000 THEN 'High' ELSE 'Low' END AS Spending_Level
FROM `angular-glyph-480013-r3`.`retailsales`.`brightretailsales`
WHERE Age >= 40


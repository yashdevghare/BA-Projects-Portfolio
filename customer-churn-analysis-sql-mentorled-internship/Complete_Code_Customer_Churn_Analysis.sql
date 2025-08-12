-- Creating Table in postgres Database

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    RowNumber INTEGER,
    CustomerId BIGINT PRIMARY KEY,
    Surname VARCHAR(100),
    CreditScore INTEGER,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INTEGER,
    Tenure INTEGER,
    Balance NUMERIC(15, 2),
    NumOfProducts INTEGER,
    HasCrCard INTEGER,
    IsActiveMember INTEGER,
    EstimatedSalary NUMERIC(15, 2),
    Exited INTEGER
);

SELECT * from Customers;



-- Total Customers vs. Churned

SELECT 
    Exited, 
    COUNT(*) AS customer_count 
FROM Customers 
GROUP BY Exited;



-- Churn by Geography

SELECT 
    Geography, 
    Exited, 
    COUNT(*) AS count 
FROM customers 
GROUP BY Geography, Exited 
ORDER BY Geography, Exited; 



-- Churn Rate by Age Group

SELECT 
    CASE 
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Above 50'
    END AS age_group,
    Exited,
    COUNT(*) AS count
FROM Customers
GROUP BY age_group, Exited
ORDER BY age_group, Exited;



-- Churn Based on Balance

SELECT 
    CASE 
        WHEN Balance = 0 THEN 'Zero Balance'
        WHEN Balance < 50000 THEN 'Low Balance'
        WHEN Balance BETWEEN 50000 AND 150000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_group,
    Exited,
    COUNT(*) AS count
FROM Customers
GROUP BY balance_group, Exited
ORDER BY balance_group, Exited;



-- Gender vs. Churn

SELECT 
    Gender, 
    Exited, 
    COUNT(*) AS count 
FROM Customers 
GROUP BY Gender, Exited;



-- Product Holding vs. Churn

SELECT 
    NumOfProducts, 
    Exited, 
    COUNT(*) AS count 
FROM Customers 
GROUP BY NumOfProducts, Exited;



-- Summary statistics for CreditScore and Balance

SELECT 
    'CreditScore' AS metric,
    ROUND(AVG(CreditScore), 2) AS mean,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY CreditScore) AS median,
    MIN(CreditScore) AS min,
    MAX(CreditScore) AS max,
    ROUND(STDDEV(CreditScore), 2) AS stddev,
    COUNT(*) AS total_customers
FROM Customers

UNION ALL

SELECT 
    'Balance' AS metric,
    ROUND(AVG(Balance), 2) AS mean,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Balance) AS median,
    MIN(Balance) AS min,
    MAX(Balance) AS max,
    ROUND(STDDEV(Balance), 2) AS stddev,
    COUNT(*) AS total_customers
FROM Customers;



--FINAL QUERY TO IDENTIFY THE TOP-5 CHURNED/NON-CHURNED CUSTOMERS


-- Top 5 High-Value Loyal Customers (Non-Churned)

--Criteria:
--Still with us (Exited = 0)
--Active Members (IsActiveMember = 1)
--Sorted by Balance (then CreditScore)

SELECT *
FROM (
    SELECT 
        CustomerId,
        Surname,
        Geography,
        Balance,
        CreditScore,
        Age,
        EstimatedSalary,
        RANK() OVER (ORDER BY Balance DESC, CreditScore DESC) AS rank_loyal
    FROM Customers
    WHERE Exited = 0 AND IsActiveMember = 1
) ranked
WHERE rank_loyal <= 5;


-- Top 5 Churned Customers (High Lost Value)

SELECT *
FROM (
    SELECT 
        CustomerId,
        Surname,
        Balance,
        CreditScore,
        Geography,
        RANK() OVER (ORDER BY Balance DESC) AS rank_churned
    FROM Customers
    WHERE Exited = 1
) ranked
WHERE rank_churned <= 5;




-- Credit Card Fraud Detection SQL Analysis
-- Analyst: Hamna Maqbool

-- Query 1: Fraud rate by hour
SELECT hour,
COUNT(*) as total_transactions,
SUM(Class) as fraud_cases,
ROUND(SUM(Class)*100.0/COUNT(*), 4) as fraud_rate_pct,
ROUND(SUM(CASE WHEN Class=1 THEN Amount ELSE 0 END),2) 
as total_fraud_amount
FROM transactions
GROUP BY hour
ORDER BY fraud_rate_pct DESC;

-- Query 2: Fraud vs Normal comparison (CTE)
WITH fraud_transactions AS (
    SELECT * FROM transactions WHERE Class = 1
),
normal_transactions AS (
    SELECT * FROM transactions WHERE Class = 0
)
SELECT 
'Fraud' as type,
COUNT(*) as count,
ROUND(AVG(Amount),2) as avg_amount,
ROUND(MAX(Amount),2) as max_amount,
ROUND(SUM(Amount),2) as total_amount
FROM fraud_transactions
UNION ALL
SELECT 
'Normal' as type,
COUNT(*) as count,
ROUND(AVG(Amount),2) as avg_amount,
ROUND(MAX(Amount),2) as max_amount,
ROUND(SUM(Amount),2) as total_amount
FROM normal_transactions;

-- Query 3: Window function - running total fraud
SELECT hour,
COUNT(*) as transactions,
SUM(Class) as fraud_cases,
SUM(SUM(Class)) OVER (ORDER BY hour) 
as running_total_fraud,
ROUND(AVG(Amount) OVER (
    ORDER BY hour 
    ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING),2) 
as rolling_avg_amount
FROM transactions
GROUP BY hour
ORDER BY hour;

-- Query 4: Risk ranking by hour
SELECT 
hour,
COUNT(*) as total,
SUM(Class) as fraud_count,
ROUND(SUM(Class)*100.0/COUNT(*),4) as fraud_rate,
RANK() OVER (ORDER BY SUM(Class)*100.0/COUNT(*) DESC) 
as risk_rank
FROM transactions
GROUP BY hour
ORDER BY risk_rank;

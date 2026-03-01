# Show cust_id, age, and occupation for customers living in Tier 1 cities
SELECT cust_id,age,occupation
FROM customers
WHERE city_tier = 'Tier_1';

# Find the average income by city_tier
SELECT city_tier,avg(income) AS avg_income
FROM customers
GROUP BY city_tier;

# Show cust_id, income, and total_expenses for each customer
SELECT c.cust_id,c.income,e.total_expenses
FROM customers c JOIN expenses e ON c.cust_id = e.cust_id;

# Show average desired_savings and average actual_savings by occupation
SELECT 
	c.occupation,
	avg(s.desired_savings) AS avg_desired_savings, 
    avg(f.actual_savings) AS avg_actual_savings
FROM customers c 
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id
GROUP BY c.occupation;

# Show customers whose total_expenses are greater than their desired_savings
SELECT
	c.cust_id,
    e.total_expenses,
    s.desired_savings
FROM customers c
JOIN expenses e ON c.cust_id = e.cust_id
JOIN savings_targets s ON c.cust_id = s.cust_id
WHERE e.total_expenses > s.desired_savings;

# Show customers who spend more than 30% of income on rent
SELECT 
	c.cust_id,
    c.income,
    e.rent
FROM customers c
JOIN expenses e ON c.cust_id = e.cust_id
WHERE e.rent > 0.3 * c.income;

# Which expense category has the highest average spending?
SELECT x.category, avg(x.amount) AS avg_amount
FROM
(
SELECT 'rent' AS category, rent AS amount FROM expenses
UNION ALL
SELECT 'loan_repayment',loan_repayment FROM expenses
UNION ALL
SELECT 'insurance',insurance FROM expenses
UNION ALL
SELECT 'groceries', groceries FROM expenses
UNION ALL
SELECT 'transport',transport FROM expenses
UNION ALL
SELECT 'eating_out',eating_out FROM expenses
UNION ALL
SELECT 'entertainment',entertainment FROM expenses
UNION ALL
SELECT 'utilities',utilities FROM expenses
UNION ALL
SELECT 'healthcare',healthcare FROM expenses
UNION ALL
SELECT 'education',education FROM expenses
UNION ALL
SELECT 'miscellaneous',miscellaneous FROM expenses
) x
GROUP BY category
ORDER BY avg_amount DESC
LIMIT 1;

# Which occupation has the highest gap between desired_savings and actual_savings?
SELECT c.occupation, AVG(s.desired_savings - f.actual_savings) AS avg_gap
FROM customers c
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id
GROUP BY c.occupation
ORDER BY avg_gap DESC
LIMIT 1;

# Find customers who save less than the average savings_rate
SELECT c.cust_id,f.savings_rate
FROM customers c 
JOIN financial_summary f ON c.cust_id = f.cust_id
WHERE f.savings_rate < (
	SELECT avg(savings_rate) AS avg_savings_rate
	FROM financial_summary
);
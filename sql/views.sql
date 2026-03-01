CREATE VIEW vw_customer_financials AS
SELECT
	c.cust_id,
    c.age,
    c.occupation,
    c.city_tier,
    c.income,
    e.total_expenses,
    f.actual_savings,
    s.desired_savings,
    p.total_potential_savings
FROM customers c
JOIN expenses e ON c.cust_id = e.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN potential_savings p ON c.cust_id = p.cust_id;

CREATE VIEW vw_savings_goals AS
SELECT
	c.cust_id,
    c.city_tier,
    c.occupation,
    s.desired_savings,
    f.actual_savings,
    s.desired_savings - f.actual_savings AS savings_gap
FROM customers c
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id;

CREATE VIEW vw_risk_indicators AS
SELECT
	c.cust_id,
    c.age,
    c.occupation,
    c.city_tier,
    c.income,
    e.total_expenses / c.income AS exp_ratio,
    s.desired_savings - f.actual_savings AS savings_gap,
    f.savings_rate
FROM customers c
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id
JOIN expenses e ON c.cust_id = e.cust_id;

CREATE VIEW vw_summary AS
SELECT
	avg(c.income) AS avg_income,
    avg(e.total_expenses) AS avg_expenses,
    avg(f.savings_rate) AS avg_savings_rate,
    avg(s.desired_savings - f.actual_savings) AS avg_gap,
    sum(p.total_potential_savings) AS total_potential_savings
FROM customers c
JOIN savings_targets s ON c.cust_id = s.cust_id
JOIN financial_summary f ON c.cust_id = f.cust_id
JOIN expenses e ON c.cust_id = e.cust_id
JOIN potential_savings p ON c.cust_id = p.cust_id;
    
    
    

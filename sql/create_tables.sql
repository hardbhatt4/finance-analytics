CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    age INT,
    dependents INT,
    occupation VARCHAR(50),
    city_tier VARCHAR(20),
    income DECIMAL(10,2)
);

INSERT INTO customers
SELECT DISTINCT
    Cust_ID, Age, Dependents, Occupation, City_Tier, Income
FROM staging_finance;

CREATE TABLE expenses (
    cust_id INT PRIMARY KEY,
    rent DECIMAL(10,2),
    loan_repayment DECIMAL(10,2),
    insurance DECIMAL(10,2),
    groceries DECIMAL(10,2),
    transport DECIMAL(10,2),
    eating_out DECIMAL(10,2),
    entertainment DECIMAL(10,2),
    utilities DECIMAL(10,2),
    healthcare DECIMAL(10,2),
    education DECIMAL(10,2),
    miscellaneous DECIMAL(10,2),
    total_expenses DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO expenses
SELECT
    Cust_ID, Rent, Loan_Repayment, Insurance, Groceries, Transport,
    Eating_Out, Entertainment, Utilities, Healthcare, Education,
    Miscellaneous, total_expenses
FROM staging_finance;

CREATE TABLE savings_targets (
    cust_id INT PRIMARY KEY,
    desired_savings_percentage DECIMAL(5,2),
    desired_savings DECIMAL(10,2),
    disposable_income DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO savings_targets
SELECT
    Cust_ID, Desired_Savings_Percentage, Desired_Savings, Disposable_Income
FROM staging_finance;

CREATE TABLE potential_savings (
    cust_id INT PRIMARY KEY,
    ps_groceries DECIMAL(10,2),
    ps_transport DECIMAL(10,2),
    ps_eating_out DECIMAL(10,2),
    ps_entertainment DECIMAL(10,2),
    ps_utilities DECIMAL(10,2),
    ps_healthcare DECIMAL(10,2),
    ps_education DECIMAL(10,2),
    ps_miscellaneous DECIMAL(10,2),
    total_potential_savings DECIMAL(10,2),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO potential_savings
SELECT
    Cust_ID,
    Potential_Savings_Groceries,
    Potential_Savings_Transport,
    Potential_Savings_Eating_Out,
    Potential_Savings_Entertainment,
    Potential_Savings_Utilities,
    Potential_Savings_Healthcare,
    Potential_Savings_Education,
    Potential_Savings_Miscellaneous,
    total_potential_savings
FROM staging_finance;

CREATE TABLE financial_summary (
    cust_id INT PRIMARY KEY,
    actual_savings DECIMAL(10,2),
    savings_rate DECIMAL(6,4),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

INSERT INTO financial_summary
SELECT
    Cust_ID, actual_savings, savings_rate
FROM staging_finance;


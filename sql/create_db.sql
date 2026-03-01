CREATE DATABASE finance_db;
USE finance_db;
CREATE TABLE staging_finance (
    Cust_ID INT,
    Income DECIMAL(10,2),
    Age INT,
    Dependents INT,
    Occupation VARCHAR(50),
    City_Tier VARCHAR(20),

    Rent DECIMAL(10,2),
    Loan_Repayment DECIMAL(10,2),
    Insurance DECIMAL(10,2),
    Groceries DECIMAL(10,2),
    Transport DECIMAL(10,2),
    Eating_Out DECIMAL(10,2),
    Entertainment DECIMAL(10,2),
    Utilities DECIMAL(10,2),
    Healthcare DECIMAL(10,2),
    Education DECIMAL(10,2),
    Miscellaneous DECIMAL(10,2),

    Desired_Savings_Percentage DECIMAL(5,2),
    Desired_Savings DECIMAL(10,2),
    Disposable_Income DECIMAL(10,2),

    Potential_Savings_Groceries DECIMAL(10,2),
    Potential_Savings_Transport DECIMAL(10,2),
    Potential_Savings_Eating_Out DECIMAL(10,2),
    Potential_Savings_Entertainment DECIMAL(10,2),
    Potential_Savings_Utilities DECIMAL(10,2),
    Potential_Savings_Healthcare DECIMAL(10,2),
    Potential_Savings_Education DECIMAL(10,2),
    Potential_Savings_Miscellaneous DECIMAL(10,2),

    total_expenses DECIMAL(10,2),
    total_potential_savings DECIMAL(10,2),
    actual_savings DECIMAL(10,2),
    savings_rate DECIMAL(6,4)
);


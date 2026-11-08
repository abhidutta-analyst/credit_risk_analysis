DROP TABLE IF EXISTS financial_loan;
CREATE TABLE financial_loan (
    id                    INTEGER         NOT NULL PRIMARY KEY,
    address_state         CHAR(2)         NOT NULL,
    application_type      VARCHAR(20)     NOT NULL DEFAULT 'INDIVIDUAL',
    emp_length            VARCHAR(12)     NOT NULL,
    emp_title             VARCHAR(80)     NOT NULL,
    grade                 CHAR(1)         NOT NULL,
    home_ownership        VARCHAR(10)     NOT NULL,
    issue_date            DATE            NOT NULL,
    last_credit_pull_date DATE            NOT NULL,
    last_payment_date     DATE            NOT NULL,
    loan_status           VARCHAR(20)     NOT NULL,
    next_payment_date     DATE            NOT NULL,
    member_id             INTEGER         NOT NULL,
    purpose               VARCHAR(30)     NOT NULL,
    sub_grade             VARCHAR(5)      NOT NULL,
    term                  VARCHAR(15)     NOT NULL,
    verification_status   VARCHAR(20)     NOT NULL,
    annual_income         INTEGER         NOT NULL,
    dti                   NUMERIC(5,4)    NOT NULL,
    installment           NUMERIC(8,2)    NOT NULL,
    int_rate              NUMERIC(5,4)    NOT NULL,
    loan_amount           INTEGER         NOT NULL,
    total_acc             INTEGER         NOT NULL,
    total_payment         NUMERIC(10,2)   NOT NULL
);


SELECT * FROM financial_loan

-- Total Loan Applications
SELECT COUNT(id) AS total_loan_applications FROM financial_loan

-- Month To Date Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12

-- Previous Month To Date Loan Application
SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan

-- Month To Date Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12

-- Previous Month To Date Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan

-- Month To Date Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12

-- Previous Month To Date Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11

-- Average Interest Rate
SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Int_Rate FROM financial_loan

-- Month To Date Average Interest
SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Int_Rate FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12

-- Previous Month To Date Average Interest
SELECT ROUND(AVG(int_rate) * 100, 2) AS PMTD_Avg_Int_Rate FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11

-- Average DTI
SELECT ROUND(AVG(dti)*100, 2) AS Avg_DTI FROM financial_loan

-- Month To Date Average DTI
SELECT ROUND(AVG(dti)*100, 2) AS MTD_Avg_DTI FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12

-- Previous Month To Date Average DTI
SELECT ROUND(AVG(dti)*100, 2) AS PMTD_Avg_DTI FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 11


-- Good Loan Issued
-- Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


-- BAD LOAN ISSUED
-- Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'


-- Loan Status
SELECT
      loan_status,
      COUNT(id) AS Loan_Count,
      SUM(total_payment) AS Total_Amount_Received,
      SUM(loan_amount) AS Total_Funded_Amount,
      AVG(int_rate * 100) AS Interest_Rate,
      AVG(dti * 100) AS DTI
FROM
     financial_loan
GROUP BY
     loan_status
ORDER BY Loan_Count DESC

-- Loan Status Of Month To Date
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE EXTRACT(MONTH FROM issue_date) = 12 
GROUP BY loan_status

-- BANK LOAN REPORT | OVERVIEW
-- MONTH
SELECT 
    EXTRACT(MONTH FROM issue_date) AS Month_Number, 
    TO_CHAR(issue_date, 'Month') AS Month_name, 
    COUNT(id) AS Total_Loan_Applications, 
    SUM(loan_amount) AS Total_Funded_Amount, 
    SUM(total_payment) AS Total_Amount_Received 
FROM 
    financial_loan 
GROUP BY 
    EXTRACT(MONTH FROM issue_date), 
    TO_CHAR(issue_date, 'Month') 
ORDER BY 
    EXTRACT(MONTH FROM issue_date);

-- STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

-- TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

-- EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length


--PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose


-- HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership

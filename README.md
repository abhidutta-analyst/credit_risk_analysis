# 🏦 Bank Loan Analytics & Credit Risk Prediction Platform

![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458.svg)
![Scikit-Learn](https://img.shields.io/badge/Scikit--Learn-Machine%20Learning-F7931E.svg)
![SQL](https://img.shields.io/badge/SQL-Data%20Cleaning-4479A1.svg)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 📋 Table of Contents
1. [Project Overview](#-project-overview)
2. [Problem Statement](#-problem-statement)
3. [Dataset Description](#-dataset-description)
4. [Tech Stack](#-tech-stack)
5. [Project Workflow](#-project-workflow)
6. [SQL Data Cleaning & Transformation](#-sql-data-cleaning--transformation)
7. [Power BI Dashboard Architecture](#-power-bi-dashboard-architecture)
8. [Credit Risk Prediction Model (Notebook Only)](#-credit-risk-prediction-model-notebook-only)
9. [Repository Folder Structure](#-repository-folder-structure)
10. [How to Run & Setup](#-how-to-run--setup)
11. [Key Terminologies Glossary](#-key-terminologies-glossary)
12. [Key Insights & Conclusions](#-key-insights--conclusions)
13. [Limitations & Future Work](#-limitations--future-work)
14. [Author & License](#-author--license)

---

## 🎯 1. Project Overview

The **Bank Loan Analytics & Credit Risk Prediction Platform** is an end-to-end data analytics and machine learning solution designed to monitor, evaluate, and predict loan portfolio performance. Financial institutions face constant exposure to credit defaults; hence, robust tracking of lending KPIs, historical trends, and predictive risk scoring is essential for optimizing profitability and mitigating default losses.

[[https://github.com/abhidutta-analyst/credit_risk_analysis/blob/main/Overview.jpg]]

This project delivers:
- **An Interactive Power BI Dashboard (`.pbix`)**: Providing executive-level visibility into loan volume, funded amounts, cash inflows, regional risk distribution, and good vs. bad loan performance across three comprehensive pages.
- **A Predictive Credit Risk Machine Learning Model (`.ipynb`)**: Built using Python and `scikit-learn`, utilizing Logistic Regression and Random Forest classifiers to predict loan default (`Charged Off`) based on borrower financial profiles and loan attributes.

---

## 📌 2. Problem Statement

To monitor and assess lending activities, the executive leadership team required a comprehensive Bank Loan Report. The objectives are divided into three operational views:

### Dashboard 1: Summary (KPIs & Portfolio Health)
- **Total Loan Applications**: Track overall application volume, Month-to-Date (MTD), and Month-over-Month (MoM) growth.
- **Total Funded Amount**: Monitor capital disbursement, MTD, and MoM capital deployment.
- **Total Amount Received**: Assess cash flow and repayment efficiency, tracking MTD receipts and MoM progress.
- **Average Interest Rate & DTI**: Monitor portfolio cost and borrower financial leverage (Debt-to-Income).
- **Good Loan vs. Bad Loan Segmentation**: Distinguish portfolio health where:
  - **Good Loans**: `Fully Paid` and `Current` status.
  - **Bad Loans**: `Charged Off` status (high default risk).
- **Loan Status Grid View**: Granular summary by loan status showing application counts, funded amounts, received amounts, average interest rates, and average DTI.

### Dashboard 2: Overview (Visual Trends & Parameters)
- **Monthly Trends by Issue Date (Line Chart)**: Seasonality and long-term trajectory of applications, funding, and collections.
- **Regional Analysis by State (Filled Map)**: Geographic concentration of risk and loan demand.
- **Loan Term Analysis (Donut Chart)**: Distribution across 36-month vs. 60-month terms.
- **Employee Length Analysis (Bar Chart)**: Correlation between job tenure stability and borrowing volume.
- **Loan Purpose Breakdown (Bar Chart)**: Categorization of loan utilization (e.g., debt consolidation, credit card refinancing).
- **Home Ownership Analysis (Tree Map)**: Impact of housing status on loan allocation and risk.

### Dashboard 3: Details (Comprehensive Grid View)
- Deep-dive tabular view providing borrower-level attributes, financial metrics, and repayment tracking.

---

## 📊 3. Dataset Description

The analysis is performed on historical loan data (`financial_loan.csv`) containing **38,576 records** and **24 distinct columns**.

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `id` | Integer | Unique identifier for each loan application (Primary Key). |
| `member_id` | Integer | Unique borrower member identifier. |
| `loan_amount` | Numeric | The listed amount of the loan applied for by the borrower. |
| `funded_amount` | Numeric | The total amount committed to that loan at that point in time. |
| `term` | String | The number of payments on the loan (36 months or 60 months). |
| `int_rate` | Numeric | Interest rate on the loan. |
| `installment` | Numeric | Monthly payment owed by the borrower. |
| `grade` | String | LC assigned loan grade (A through G). |
| `sub_grade` | String | LC assigned loan subgrade (A1 through G5). |
| `emp_title` | String | Job title supplied by the borrower. |
| `emp_length` | String | Employment length in years (< 1 year to 10+ years). |
| `home_ownership` | String | Homeownership status (RENT, OWN, MORTGAGE, OTHER). |
| `annual_income` | Numeric | Self-reported annual income provided by the borrower. |
| `verification_status` | String | Indicates if income was verified by LC (Verified, Source Verified, Not Verified). |
| `issue_date` | Date | The month which the loan was funded. |
| `loan_status` | String | Current status of the loan (`Fully Paid`, `Current`, `Charged Off`). |
| `purpose` | String | Category provided by the borrower for the loan request. |
| `address_state` | String | State provided by the borrower in the loan application. |
| `dti` | Numeric | Debt-to-Income ratio calculated using monthly debt payments. |
| `total_acc` | Integer | Total number of credit lines currently in the borrower's credit file. |
| `total_payment` | Numeric | Payments received to date for total amount funded. |
| `last_credit_pull_date` | Date | Most recent credit pull date. |
| `last_payment_date` | Date | Last payment date received. |
| `next_payment_date` | Date | Next scheduled payment date. |

---

## 🛠️ 4. Tech Stack

- **Raw Data Layer**: CSV (`financial_loan.csv`) containing 38,576 raw lending records.
- **Data Engineering & Cleaning**: SQL (`financial_loan.sql`) for ETL, metric aggregation, KPI calculation, and data integrity checks.
- **Predictive Modeling Layer**: Jupyter Notebook (`Credit_Risk_Prediction_Model.ipynb`) powered by Python (`pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`) implementing credit risk classification.
- **Business Intelligence Layer**: Power BI (`Bank_loan_dashboard.pbix.zip`) for executive visualization and interactive stakeholder reporting.

---

## 🔄 5. Project Workflow

```
[ Raw CSV Data (38,576 rows) ]
            │
            ▼
[ SQL Data Cleaning & Transformation (financial_loan.sql) ]
            │
            ├──────────────────────────────────────────┐
            ▼                                          ▼
[ Power BI Dashboard (.pbix) ]         [ Jupyter Notebook Model (.ipynb) ]
 - Summary KPI Page                    - Data Loading & Preprocessing
 - Overview Trends Page                - Train/Test Stratified Split
 - Detail Grid View                    - Baseline Logistic Regression
                                       - Random Forest Classifier
                                       - Evaluation (ROC-AUC, F1, CM)
                                       - Feature Importance Analysis
```

---

## 🗄️ 6. SQL Data Cleaning & Transformation

Data cleaning and metric aggregations were executed in SQL (`financial_loan.sql`). Key SQL routines include:

1. **KPI Aggregations**:
   - Total Applications: `SELECT COUNT(id) FROM bank_loan_data`
   - MTD Funded Amount: `SELECT SUM(loan_amount) FROM bank_loan_data WHERE MONTH(issue_date) = 12`
2. **Good vs. Bad Loan Segmentation**:
   - Good Loan Percentage: `(COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / COUNT(id)`
   - Bad Loan Percentage: `(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id)`
3. **Portfolio Groupings**:
   - Grouping by `loan_status`, `address_state`, `term`, `emp_length`, and `issue_date` to feed reporting structures.

---

## 📈 7. Power BI Dashboard Architecture

The Power BI dashboard (`Bank_loan_dashboard.pbix.zip`) is structured into three dedicated interactive pages:

- **Page 1: Summary View**
  - Features KPI cards for Total Loan Applications, Funded Amount, Amount Received, Interest Rate, and DTI.
  - Dedicated Good Loan vs. Bad Loan breakdown cards (applications, funded amounts, received amounts).
  - Interactive Loan Status Grid View.
- **Page 2: Overview Trends**
  - Line chart showing monthly issuance trends.
  - Filled map illustrating state-wise geographic risk and volume.
  - Donut and bar charts breaking down performance by term, employee length, purpose, and home ownership.
- **Page 3: Details View**
  - Comprehensive granular data grid for auditors and loan officers.

*Note: As per project specifications, the Power BI dashboard focuses exclusively on descriptive analytics and operational reporting; predictive modeling outputs reside solely within the Jupyter Notebook.*

---

## 🤖 8. Credit Risk Prediction Model (Notebook Only)

To provide predictive capabilities, a machine learning pipeline was constructed in `Credit_Risk_Prediction_Model.ipynb`.

- **Target Definition**: Binary classification where `is_default = 1` for `Charged Off` loans, and `is_default = 0` for `Fully Paid` / `Current` loans.
- **Preprocessing**: Numerical scaling (`StandardScaler`) and categorical encoding (`OneHotEncoder`) embedded in a scikit-learn `ColumnTransformer` pipeline.
- **Algorithms Trained**:
  1. **Logistic Regression** (Baseline model with `class_weight='balanced'`).
  2. **Random Forest Classifier** (`n_estimators=100`, `class_weight='balanced'`).
- **Evaluation Metrics**:
  - **ROC-AUC**: Evaluates ranking capability across decision thresholds (Achieved **~0.69** on Logistic Regression, **~0.66** on Random Forest).
  - **Precision, Recall, F1-Score**: Handled severe class imbalance (~13.8% default rate) with balanced weighting, yielding robust recall for high-risk defaults.
- **Feature Importance**: Random Forest feature importance identified interest rate (`int_rate`), debt-to-income ratio (`dti`), loan amount, and annual income as top default drivers.

---

## 📁 9. Repository Folder Structure

```
Bank_loan/
├── Bank_loan_dashboard.pbix.zip       # Power BI Dashboard (.pbix compressed)
├── financial_loan.csv                 # Cleaned dataset (38,576 rows, 24 columns)
├── financial_loan.sql                 # SQL cleaning and aggregation scripts
├── Credit_Risk_Prediction_Model.ipynb # Jupyter Notebook (Credit Risk ML Model)
├── Problem Statement.docx             # Business requirements and dashboard specifications
├── Query Doc.docx                     # SQL queries and metric definitions documentation
├── Terminologies in Data.docx         # Data dictionary and glossary definitions
└── README.md                          # Comprehensive project documentation
```

---

## 🚀 10. How to Run & Setup

### Prerequisites
- Python 3.8+
- Jupyter Notebook / Jupyter Lab
- Power BI Desktop (for viewing `.pbix` dashboard)
- SQL Server / compatible SQL environment (for running `.sql` scripts)

### Setup & Execution Steps
1. **Clone or Download Repository**:
   ```bash
   git clone https://github.com/your-username/bank-loan-analytics.git
   cd Bank_loan
   ```
2. **Install Python Dependencies**:
   ```bash
   pip install pandas numpy scikit-learn matplotlib seaborn jupyter
   ```
3. **Run the Credit Risk Prediction Notebook**:
   ```bash
   jupyter notebook Credit_Risk_Prediction_Model.ipynb
   ```
4. **Explore the Power BI Dashboard**:
   - Extract `Bank_loan_dashboard.pbix.zip` and open `Bank_loan_dashboard.pbix` in Power BI Desktop.
5. **Review SQL Scripts**:
   - Open `financial_loan.sql` in your preferred SQL management studio to inspect data cleaning and KPI query logic.

---

## 📖 11. Key Terminologies Glossary

| Term | Purpose & Definition | Use for Banks |
| :--- | :--- | :--- |
| **Loan ID** | Unique identifier assigned to each loan application/account. | Efficiently track loans throughout their lifecycle and organize records. |
| **Address State** | Borrower's geographic location. | Assess regional risk factors, regulatory compliance, and default probability. |
| **Employee Length** | Borrower's employment duration in years. | Gauge job security and stability to assess repayment capacity. |
| **Employee Title** | Borrower's occupation or job title. | Verify income sources and assess professional financial capacity. |
| **Grade / Sub-Grade** | Risk classification assigned based on creditworthiness (A-G, 1-5). | Price loans, determine interest rates, and manage risk-adjusted returns. |
| **Home Ownership** | Borrower's housing status (RENT, OWN, MORTGAGE). | Assess collateral availability and personal financial stability. |
| **Issue Date** | Origination date when the loan was funded. | Track loan aging, interest accruals, and portfolio maturity. |
| **Last Credit Pull Date**| Timestamp of the borrower's most recent credit report pull. | Monitor ongoing creditworthiness changes and delinquency risk. |
| **Last Payment Date** | Most recent payment receipt date. | Assess payment behavior, calculate delinquency, and project cash flows. |
| **Loan Status** | Current state of the loan (`Fully Paid`, `Current`, `Charged Off`). | Monitor portfolio health and categorize non-performing assets. |
| **Next Payment Date** | Estimated date of the upcoming loan payment. | Assist in liquidity planning and revenue projections. |
| **Purpose** | Stated reason for borrowing (e.g., debt consolidation). | Segment loan offerings and align loan terms with borrower needs. |
| **Term** | Repayment duration in months (36 or 60 months). | Structure loan agreements and calculate interest schedules. |
| **Verification Status** | Indicates whether borrower financial info was verified. | Gauge data reliability and evaluate application credibility. |
| **Annual Income** | Borrower's total yearly earnings. | Determine loan eligibility and calculate debt-to-income ratios. |
| **DTI (Debt-to-Income)**| Borrower's monthly debt burden relative to income. | Gauge capacity to handle additional debt obligations. |
| **Instalment** | Fixed monthly payment amount (principal + interest). | Structure repayment terms and forecast cash inflows. |
| **Total Accounts** | Total credit lines in borrower's credit history. | Evaluate overall credit maturity and borrowing exposure. |
| **Total Payment** | Cumulative payments received to date. | Track actual capital recovered against funded amounts. |

---

## 💡 12. Key Insights & Conclusions

- **Portfolio Quality**: The vast majority (~86.2%) of issued loans fall under the "Good Loan" category (`Fully Paid` or `Current`), with a 13.8% default rate (`Charged Off`).
- **Risk Pricing**: Higher interest rates and higher DTI ratios strongly correlate with default probability (`Charged Off`), validating the risk-based pricing strategy reflected in loan grades.
- **Predictive Modeling**: Machine learning models successfully identify high-risk applicants prior to default, enabling proactive risk mitigation during underwriting.

---

## ⚠️ 13. Limitations & Future Work

- **Class Imbalance**: The dataset exhibits class imbalance (~13.8% default rate), which was mitigated using balanced class weights; future iterations could explore advanced resampling techniques like SMOTE.
- **Feature Expansion**: Incorporating macroeconomic indicators (unemployment rate, inflation, interest rate hikes) could further enhance prediction accuracy.
- **Real-time Scoring API**: Deploying the trained model as a REST API (FastAPI / Flask) for real-time loan origination decisioning.

---

## 👤 14. Author & License

- **Author**: [Your Name / Data Science Team]
- **License**: This project is licensed under the [MIT License](LICENSE).

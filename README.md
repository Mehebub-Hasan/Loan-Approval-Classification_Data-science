# Loan-Approval-Classification_Data-science
An R project for cleaning, preprocessing, and analyzing loan data. Includes steps for missing value imputation, outlier handling, feature engineering, and data balancing to predict loan status.

### 📌 **Overview**

This project demonstrates practical data science preprocessing techniques, including:

✅ Data Cleaning and Imputation

✅ Outlier Detection and Handling

✅ Feature Engineering and Standardization

✅ Data Balancing for Machine Learning

### 🚀 **Project Description & Features**

The R script cleans, preprocesses, and prepares a loan dataset. The goal is to build a clean, balanced dataset ready for machine learning tasks, such as predicting loan_status.

Key processing steps include:

✅ Missing Value Imputation: Fills missing values using mean (person_age, loan_percent_income), median (person_income), or mode (loan_status, person_gender, person_education).

✅ Outlier Handling: Identifies and replaces outliers in person_age, person_income, person_emp_exp, and credit_score using the 1.5 * IQR rule.

✅ Data Standardization: Standardizes categorical values (e.g., "rentt" -> "RENT").

✅ Feature Engineering: Creates new features: gender_numeric (binary) and income_normalized (Min-Max scaling).

✅ Duplicate Removal: Removes duplicate rows using distinct().

✅ Data Balancing: Performs undersampling on the loan_status target variable to create a balanced dataset.

✅ Train/Test Split: Splits the balanced data into stratified 70% training and 30% testing sets.

✅ Descriptive Statistics: Calculates and prints statistics (mean, median, mode, range, etc.) for key features.


### 🛠 **Technologies Used**

💻 Programming Language: R

📚 Core Libraries:

readxl: For reading Excel files.

dplyr: For data manipulation.

caTools: For splitting data.


### ▶️ **How to Run the Project**

Follow these steps to run the script locally:

1. Get Data: Ensure the loan_data.xlsx file is available locally.

2. Install Dependencies: Run the following command in your R console:

3. install.packages(c("readxl", "dplyr", "caTools"))


Update File Path: You must change the file path in the script to point to your loan_data.xlsx:

data <- read_excel("C:\\Users\\Mehebub Hasan\\Documents\\Data Science project\\Project\\loan_data.xlsx")


4. Run Script: Execute ids_mid_project_group_10.R in an R environment (like RStudio). This will process the data, print statistics, and create train_data and test_data for modeling.

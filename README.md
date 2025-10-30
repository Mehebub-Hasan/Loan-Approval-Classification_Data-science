# Loan-Approval-Classification_Data-science
An R project for cleaning, preprocessing, and analyzing loan data. Includes steps for missing value imputation, outlier handling, feature engineering, and data balancing to predict loan status.

##Loan Data Preprocessing and Analysis in R
This repository contains the R script ids_mid_project_group_10.R, which cleans, preprocesses, and prepares a loan dataset. The goal is to build a clean, balanced dataset ready for machine learning tasks, such as predicting loan_status.

##Project Workflow
The R script performs the following data processing steps:
Dependency Installation: Installs necessary R packages (readxl, dplyr, caTools).
Data Loading: Reads data from loan_data.xlsx.
Missing Value Imputation: Fills missing values using mean (person_age, loan_percent_income), median (person_income), or mode (loan_status, person_gender, person_education).
Outlier Handling: Identifies outliers in person_age, person_income, person_emp_exp, and credit_score using the 1.5 * IQR rule and replaces them with the median.
Data Standardization: Standardizes categorical values, such as in the person_home_ownership column (e.g., "rentt" -> "RENT").
Feature Engineering: Creates new features: gender_numeric (binary) and income_normalized (Min-Max scaling).
Duplicate Removal: Removes duplicate rows using distinct().
Data Balancing: Performs undersampling on the loan_status target variable to create a balanced dataset.
Train/Test Split: Splits the balanced data into stratified 70% training and 30% testing sets.
Descriptive Statistics: Calculates and prints statistics (mean, median, mode, range, etc.) for key features.

##Dependencies
The project requires the following R packages:
readxl: Reading Excel files.
dplyr: Data manipulation.
caTools: Splitting data.
You can install them by running the following command in your R console:
install.packages(c("readxl", "dplyr", "caTools"))


##How to Use
Get Data: Ensure loan_data.xlsx is available locally.
Update Path: You must change the file path in the script to point to your loan_data.xlsx:
data <- read_excel("C:\\Users\\Mehebub Hasan\\Documents\\Data Science project\\Project\\loan_data.xlsx")


Run Script: Execute ids_mid_project_group_10.R in an R environment. This processes the data, prints statistics, and creates train_data and test_data for modeling.
nvironment for further modeling.

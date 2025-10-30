# Loan-Approval-Classification_Data-science
An R project for cleaning, preprocessing, and analyzing loan data. Includes steps for missing value imputation, outlier handling, feature engineering, and data balancing to predict loan status.

Loan Data Preprocessing and Analysis in R

This repository contains an R script (ids_mid_project_group_10.R) for a data science project focused on cleaning, preprocessing, and preparing a loan dataset for analysis. The primary goal of the script is to build a clean, balanced dataset ready for machine learning tasks, likely to predict loan_status.

Project Workflow

The R script performs the following data processing steps:

Dependency Installation: Checks for and installs necessary R packages (readxl, dplyr, caTools).

Data Loading: Reads the dataset from an Excel file (loan_data.xlsx).

Missing Value Imputation:

person_age: Imputed with the mean age.

person_income: Imputed with the median income.

loan_percent_income: Imputed with the mean.

loan_status: Imputed with the mode (most frequent value).

person_gender: Imputed with the mode.

person_education: Imputed with the mode.

Outlier Handling:

Identifies outliers using the 1.5 * IQR (Interquartile Range) rule for the following features:

person_age

person_income

person_emp_exp

credit_score

Outliers in these columns are replaced with the median value of the respective column.

Data Cleaning & Standardization:

The person_home_ownership column is standardized (e.g., "rentt" -> "RENT", "oown" -> "OWN").

Feature Engineering:

gender_numeric: Converts person_gender to a binary numeric feature (male = 1, female = 0).

income_normalized: Creates a new column by scaling person_income using Min-Max normalization.

Duplicate Removal:

Checks for and removes duplicate rows from the dataset using distinct().

Data Balancing:

To address class imbalance in the loan_status target variable, the script performs undersampling. It creates a new balanced_data dataframe by randomly sampling the majority class to have the same number of observations as the minority class.

Train/Test Split:

The balanced dataset is split into training (70%) and testing (30%) sets, stratified by the loan_status variable.

Descriptive Statistics:

The script concludes by calculating and printing various descriptive statistics for key features like person_age and person_income (mean, median, mode, range, IQR, variance, standard deviation).

Dependencies

The project requires the following R packages:

readxl: For reading Excel files.

dplyr: For data manipulation and transformation.

caTools: For the sample.split function used in splitting data.

You can install them by running the following command in your R console:

install.packages(c("readxl", "dplyr", "caTools"))


How to Use

Download Data: This script assumes you have a file named loan_data.xlsx in a specific local directory.

Update File Path: Before running, you must update the file path in this line to point to the location of your loan_data.xlsx file:

data <- read_excel("C:\\Users\\Mehebub Hasan\\Documents\\Data Science project\\Project\\loan_data.xlsx")


Run Script: Execute the ids_mid_project_group_10.R script in your R environment (like RStudio). The script will process the data and print the final descriptive statistics to the console. The train_data and test_data dataframes will be available in your R environment for further modeling.

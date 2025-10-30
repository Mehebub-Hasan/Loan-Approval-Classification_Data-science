install.packages(c("readxl", "dplyr"))
install.packages("caTools")
library(readxl)
library(dplyr)
install.packages("dplyr")
library(dplyr)       

data <- read_excel("C:\\Users\\Mehebub Hasan\\Documents\\Data Science project\\Project\\loan_data.xlsx")

str(data)
summary(data) 
colSums(is.na(data)) 

data_clean <- data

colSums(is.na(data_clean)) 

data_clean$person_age[is.na(data_clean$person_age)] <-
  round(mean(data_clean$person_age, na.rm = TRUE))

data_clean$person_income[is.na(data_clean$person_income)] <-
  median(data_clean$person_income, na.rm = TRUE)

data_clean$loan_percent_income[is.na(data_clean$loan_percent_income)] <-
  mean(data_clean$loan_percent_income, na.rm = TRUE)

data_clean$loan_status[is.na(data_clean$loan_status)] <- 
  as.numeric(names(which.max(table(data_clean$loan_status))))

data_clean$person_gender[is.na(data_clean$person_gender)] <-
  names(which.max(table(data_clean$person_gender)))

mode_education <- names(which.max(table(data_clean$person_education)))
data_clean$person_education[is.na(data_clean$person_education)] <- mode_education

colSums(is.na(data_clean))


boxplot(data_clean$person_age)
quantile(data_clean$person_age)

Q1_age <- quantile(data_clean$person_age, 0.25)
Q3_age <- quantile(data_clean$person_age, 0.75)
IQR_age <- Q3_age - Q1_age

lower_bound_age <- Q1_age - 1.5 * IQR_age
upper_bound_age <- Q3_age + 1.5 * IQR_age


median_age <- median(data_clean$person_age)
data_clean$person_age[data_clean$person_age < lower_bound_age | data_clean$person_age > upper_bound_age] <- median_age

boxplot(data_clean$person_age)

Q1_income <- quantile(data_clean$person_income, 0.25, na.rm = TRUE)
Q3_income <- quantile(data_clean$person_income, 0.75, na.rm = TRUE)
IQR_income <- Q3_income - Q1_income

lower_bound_income <- Q1_income - 1.5 * IQR_income
upper_bound_income <- Q3_income + 1.5 * IQR_income

median_income <- median(data_clean$person_income, na.rm = TRUE)
data_clean$person_income[data_clean$person_income < lower_bound_income | data_clean$person_income > upper_bound_income] <- median_income

boxplot(data_clean$person_income)

boxplot(data_clean$person_emp_exp)
Q1_exp <- quantile(data_clean$person_emp_exp, 0.25, na.rm = TRUE)
Q3_exp <- quantile(data_clean$person_emp_exp, 0.75, na.rm = TRUE)
IQR_exp <- Q3_exp - Q1_exp

lower_bound_exp <- Q1_exp - 1.5 * IQR_exp
upper_bound_exp <- Q3_exp + 1.5 * IQR_exp

median_exp <- median(data_clean$person_emp_exp, na.rm = TRUE)
data_clean$person_emp_exp[data_clean$person_emp_exp < lower_bound_exp | data_clean$person_emp_exp > upper_bound_exp] <- median_exp

boxplot(data_clean$person_emp_exp)
median_exp <- median(data_clean$person_emp_exp, na.rm = TRUE)
data_clean$person_emp_exp[data_clean$person_emp_exp < lower_bound_exp | data_clean$person_emp_exp > upper_bound_exp] <- median_exp


boxplot(data_clean$person_emp_exp)

boxplot(data_clean$credit_score)
Q1_score <- quantile(data_clean$credit_score, 0.25, na.rm = TRUE)
Q3_score <- quantile(data_clean$credit_score, 0.75, na.rm = TRUE)
IQR_score <- Q3_score - Q1_score

lower_bound_score <- Q1_score - 1.5 * IQR_score
upper_bound_score <- Q3_score + 1.5 * IQR_score


median_score <- median(data_clean$credit_score, na.rm = TRUE)
data_clean$credit_score[data_clean$credit_score < lower_bound_score | data_clean$credit_score > upper_bound_score] <- median_score
boxplot(data_clean$credit_score)


data_clean <- data_clean %>%
  mutate(
    person_home_ownership_clean = case_when(
      tolower(as.character(person_home_ownership)) %in% c("rent", "rentt") ~ "RENT",
      tolower(as.character(person_home_ownership)) %in% c("own", "oown") ~ "OWN", # Changed "OOWN" to "oown"
      TRUE ~ as.character(person_home_ownership)
    )
  )

data_clean$person_home_ownership <- data_clean$person_home_ownership_clean
data_clean$person_home_ownership_clean <- NULL
table(data_clean$person_home_ownership)
data_clean$person_home_ownership_clean <- NULL

unique(data_clean$person_home_ownership)

data_clean$gender_numeric <- ifelse(data_clean$person_gender == "male", 1, 0)

head(data_clean[c("person_gender", "gender_numeric")])

data_clean$income_normalized <- (data_clean$person_income - min(data_clean$person_income)) /
  (max(data_clean$person_income) - min(data_clean$person_income))

head(data_clean[c("person_income", "income_normalized")])

summary(data_clean$income_normalized)

sum(duplicated(data_clean))

data_clean <- distinct(data_clean)

sum(duplicated(data_clean))

filtered_data <- data_clean %>%
  filter(person_age > 25, loan_intent == "EDUCATION")

nrow(filtered_data)

head(filtered_data)

table(data_clean$loan_status)

min_class_size <- min(table(data_clean$loan_status))

balanced_data <- data_clean %>%
  group_by(loan_status) %>%
  slice_sample(n = min_class_size) %>%
  ungroup()

table(balanced_data$loan_status)

library(caTools)

set.seed(123)

split <- sample.split(balanced_data$loan_status, SplitRatio = 0.7)

train_data <- subset(balanced_data, split == TRUE)

test_data <- subset(balanced_data, split == FALSE)

cat("Rows in Training Data:", nrow(train_data), "\n")
cat("Rows in Testing Data:", nrow(test_data), "\n")

mean_age <- mean(data_clean$person_age)
cat("Mean Age:", mean_age, "\n")

median_age <- median(data_clean$person_age)
cat("Median Age:", median_age, "\n")

get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

mode_age <- get_mode(data_clean$person_age)
cat("Mode Age:", mode_age, "\n")


mean_income <- mean(data_clean$person_income)
cat("Mean Income:", mean_income, "\n")

median_income <- median(data_clean$person_income)
cat("Median Income:", median_income, "\n")

get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Calculate the mode
mode_income <- get_mode(data_clean$person_income)
cat("Mode Income:", mode_income, "\n")

mode_education <- get_mode(data_clean$person_education)
cat("Mode Education Level:", mode_education, "\n")

table(data_clean$person_education)

mode_intent <- get_mode(data_clean$loan_intent)
cat("Mode Loan Intent:", mode_intent, "\n")

table(data_clean$loan_intent)

age_range <- max(data_clean$person_age) - min(data_clean$person_age)
cat("Age Range:", age_range, "\n")

age_iqr <- IQR(data_clean$person_age)
cat("Age IQR:", age_iqr, "\n")

age_variance <- var(data_clean$person_age)
cat("Age Variance:", age_variance, "\n")

age_sd <- sd(data_clean$person_age)
cat("Age Standard Deviation:", age_sd, "\n")

income_range <- max(data_clean$person_income) - min(data_clean$person_income)
cat("Income Range:", income_range, "\n")

income_iqr <- IQR(data_clean$person_income)
cat("Income IQR:", income_iqr, "\n")

income_variance <- var(data_clean$person_income)
cat("Income Variance:", income_variance, "\n")

income_sd <- sd(data_clean$person_income)
cat("Income Standard Deviation:", income_sd, "\n")


# Loading required libraries
library(ranger)
library(caret)
library(data.table)
library(caTools)

# loading data set
creditcard_data <- read.csv("C:/Users/sshai/Desktop/Northeastern University/Credit-Card-Fraud-Detection/creditcard.csv")

# Quick glance at the data set (Data Exploration)
dim(creditcard_data)
head(creditcard_data,6)
table(creditcard_data$Class)
summary(creditcard_data$Amount)
names(creditcard_data)
var(creditcard_data$Amount)

# Data Manipulation (Scaling)
creditcard_data$Amount=scale(creditcard_data$Amount)
NewData=creditcard_data[,-c(1)]
head(NewData)

# Splitting Data set into 75:25 ratio
set.seed(123)
data_sample = sample.split(NewData$Class,SplitRatio=0.75)
train_data = subset(NewData,data_sample==TRUE)
test_data = subset(NewData,data_sample==FALSE)
dim(train_data)
dim(test_data)

# Logistic Regression
Logistic_Model=glm(Class~.,test_data,family=binomial())
summary(Logistic_Model)


#loading useful library
library(ggplot2)
library(dplyr)
library(rpart)
library(caret)
library(glmnet)

#Set a seed
set.seed(826)
#read data and changing level of the column to predict
source('readAndClean.R')

#Preliminary test: Let's predict that no one won over 50k
prediction = rep(0, nrow(census_income_learn))
computeError(testSetToGuessColumn=census_income_learn$toGuess, predictedValue=prediction)
#We only have 6.2 % of error


#improving data [thanks to the visualisation of the variables in simpleVizualisation.R]
source('enhancedData.R')

#Removing NA --> to improve
source('removingNA.R')

#Binarizing categorical variable
source('binarizingCatVar.R')

#model fitting [decision trees, logistic regression, lasso regression, ridge regression]

#Have to go to model.R and choose which model to use


#Regarding the results, the best model seems to be the Lasso Regression. 
#I tried this model because, according to the simple data visualization I
# did at the beginning, a lot of variables didn't seem to have an impact on the salary.
#Then, I let Lasso select the useful var: I ordered them descending.
coefLasso 



#To conclude the most important variables seemed to be : the education, the occupation and indus codes, 
#the sex, the age and the weeks worked in year. 
#Even if their coefficient is low the capGain and divStocks have their importance (high value)

#The result is 4.64% of empirical error on the test set.

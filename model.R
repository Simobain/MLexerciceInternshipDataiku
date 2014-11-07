#Trying different models

#Data frame containing all errors
errors = as.data.frame(matrix(data = NA, nrow = 4, ncol = 4))
colnames(errors) = c('directDataLearn', 'directDataTest', 'enhancedLearn', 'enhancedTest')
rownames(errors) = c('Decesion Tree', 'Logistic regression', 'Lasso Regression', 'Ridge Regression')

#Function to compute errors
source('computeError.R')

#######Decision Tree##########

source('decisionTrees.R')

########Logistic Regression #########
#on only few variables [the one describes as useful with decision trees]

source('logregModel.R')

########Cross validated Lasso regression######

source('lassoModel.R')

########Cross validated Ridge regression######

source('ridgeModel.R')
#Logistic Regression Model

#On few variables
train.glm <- glm(toGuess~age + capGain + divStocks + indusCode + occupCode +  education + sex  , family=binomial, data = enhancedLearn)
summary(train.glm)
predictionLogRegTrain= ifelse(predict.glm(train.glm, newdata = enhancedLearn, type = "response") > 0.5, 1, 0)
errors[2,3] = computeError(testSetToGuessColumn=enhancedLearn$toGuess, predictionLogRegTrain)
#error: 5.02%

predictionLogRegTest= ifelse(predict.glm(train.glm, newdata = enhancedTest, type = "response") > 0.5, 1, 0)
errors[2,4] = computeError(testSetToGuessColumn=enhancedTest$toGuess, predictionLogRegTest)
#error: 4.94% [hmmm better than on the training set] (high bias ?)

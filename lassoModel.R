#Cross validated Lasso regression
library(glmnet)
lassoModel=cv.glmnet(as.matrix(decategorizedLearn), as.numeric(enhancedLearn$toGuess), alpha=1,family="binomial")
#Long.... 40-60 min
plot(lassoModel)
lassoModel$lambda.min
coefLasso = as.data.frame(as.matrix(coef(lassoModel, s="lambda.min")))
coefLasso$coefNames = as.character(rownames(coefLasso))
colnames(coefLasso) = c('coefValue', 'coefNames')
coefLasso = arrange(coefLasso, desc(abs(coefValue)))
#To see which coef are the most important


predictionLassoResponse= predict(lassoModel, newx =as.matrix(decategorizedLearn), type="response", s="lambda.min")
class = ifelse(as.numeric(predictionLassoResponse) > 0.5, 1, 0)
errors[3,3]= computeError(testSetToGuessColumn=enhancedLearn$toGuess, class)
#error :  4.68%

predictionLassoResponseTest= predict(lassoModel, newx = as.matrix(decategorizedTest), type="response", s="lambda.min")
classT = ifelse(as.numeric(predictionLassoResponseTest) > 0.5, 1, 0)
errors[3,4]= computeError(testSetToGuessColumn=enhancedTest$toGuess, classT)
#error :  4.64%
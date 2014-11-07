#Cross validated Ridge regression
ridgeModel=cv.glmnet(as.matrix(decategorizedLearn), as.numeric(enhancedLearn$toGuess), alpha=0,family="binomial")
#Long.... 40-60 min
plot(ridgeModel)
ridgeModel$lambda.min
coef(ridgeModel, s="lambda.min")

predictionRidgeResponse= predict(ridgeModel, newx =as.matrix(decategorizedLearn), type="response", s="lambda.min")
classRidgeLearn = ifelse(as.numeric(predictionRidgeResponse) > 0.5, 1, 0)
errors[4,3]= computeError(testSetToGuessColumn=enhancedLearn$toGuess, classRidgeLearn)
#error :  4.68%

predictionRidgeResponseTest= predict(ridgeModel, newx = as.matrix(decategorizedTest), type="response", s="lambda.min")
classT = ifelse(as.numeric(predictionRidgeResponseTest) > 0.5, 1, 0)
errors[4,4]= computeError(testSetToGuessColumn=enhancedTest$toGuess, classT)
#error :  4.64%
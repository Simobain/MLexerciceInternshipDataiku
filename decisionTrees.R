#Decision Tree Model
library(rpart)

##on data not enhanced at all##

fitDTDirectData<-rpart(toGuess~.,census_income_learn, method='class')
printcp(fitDTDirectData) 
#No need to prune our tree has the smallest error 
#plotcp(fitDTDirectData) 
#summary(fitDTDirectData) 

# plot tree 
#plot(fitDTDirectData, uniform=TRUE, 
#     main="Decision Tree for census_income_learn")
#text(fitDTDirectData, use.n=TRUE, all=TRUE, cex=.8)

#Computes error 
predictedDTLearn= ifelse(predict(fitDTDirectData,census_income_learn)[,2] > 0.5, 1, 0)
errors[1,1] = computeError(testSetToGuessColumn=census_income_learn$toGuess, predictedDTLearn)
# error: 5.15% 

predictedDTTest= ifelse(predict(fitDTDirectData, census_income_test)[,2]> 0.5, 1, 0)
errors[1,2] = computeError(testSetToGuessColumn=census_income_test$toGuess, predictedDTTest)
# error: 5.20% 

##on the learning set enhanced##
fitDTEnhancedLearn<-rpart(toGuess~.,enhancedLearn, method='class')
printcp(fitDTEnhancedLearn)
# Most important variables: age capGain divStocks education occupCode sex
#plotcp(fitDTEnhancedLearn) 
#summary(fitDTEnhancedLearn) 

# plotting tree 
#plot(fitDTEnhancedLearn, uniform=TRUE, 
#     main="Decision Tree for census_income")
#text(fitDTEnhancedLearn, use.n=TRUE, all=TRUE, cex=.8)


#Computes error 
predictedDTLearn= ifelse(predict(fitDTEnhancedLearn,enhancedLearn)[,2] > 0.5, 1, 0)
errors[1,3] = computeError(testSetToGuessColumn=enhancedLearn$toGuess, predictedDTLearn)
# error: 4.97% ---> a bit better

predictedDTTest= ifelse(predict(fitDTEnhancedLearn,enhancedTest)[,2] > 0.5, 1, 0)
errors[1,4] = computeError(testSetToGuessColumn=enhancedTest$toGuess, predictedDTTest)
# error: 5.00% ---> still a bit better

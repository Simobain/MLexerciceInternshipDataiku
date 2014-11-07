#Binarizing categorical variable
dummies <- dummyVars(toGuess ~ ., data = enhancedLearn)
decategorizedLearn = predict(dummies, newdata = enhancedLearn)

dummies <- dummyVars(toGuess ~ ., data = enhancedLearn)
decategorizedTest = predict(dummies, newdata = enhancedTest)
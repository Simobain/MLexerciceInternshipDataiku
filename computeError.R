computeError = function(testSetToGuessColumn, predictedValue){
  errorCount = sum(testSetToGuessColumn != predictedValue)
  errorPercentage = errorCount/length(testSetToGuessColumn)
  errorPercentage
}
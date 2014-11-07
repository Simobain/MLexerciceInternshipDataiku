#Modifying data for decision tree

#Combining to have the same factor
combineData = rbind(census_income_learn, census_income_test)

#Adding column child
combineData$child = ifelse(combineData$age < 15, 1, 0)
summary(combineData$child)

#IndusCode and Occup as factors
combineData$indusCode = factor(combineData$indusCode)
combineData$occupCode = factor(combineData$occupCode)

#WagePerHour becoming a factor : 0 if wagePerHour < 2000, 1 in the other case

combineData$wagePerHour = ifelse(combineData$wagePerHour < 2000 ,  0, 1)
  combineData$wagePerHour = factor(combineData$wagePerHour)
summary(combineData$wagePerHour)

#ownBusisnessSE into factors
combineData$ownBusisnessSE = factor(combineData$ownBusisnessSE)

#benefVet into factors
combineData$benefVet = factor(combineData$benefVet)

#year into factors
combineData$year = factor(combineData$year)

#Removing the major occupation code, major indus code region previous residence [redundent]

combineData$majorOccupationCode = NULL
combineData$majorIndustryCode = NULL
combineData$regionPreviousResidence = NULL

#Splitting data
enhancedLearn = combineData[1: nrow(census_income_learn),]
enhancedTest = combineData[(nrow(census_income_learn))+1 : nrow(census_income_test),]
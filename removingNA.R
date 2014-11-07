#Merging false NA and Do not know in hispOrigin into real NA

combineData$hispOrigin[combineData$hispOrigin == ' Do not know'] <- NA
combineData$hispOrigin[combineData$hispOrigin == ' NA'] <- NA
sum(is.na(combineData$hispOrigin))

#Changing ' ?' into NA
combineData$MSAMigrationCodeChange[combineData$MSAMigrationCodeChange == ' ?'] <- NA
combineData$REGMigrationCodeChange[combineData$REGMigrationCodeChange == ' ?'] <- NA
combineData$REGMigrationCodeChangeWithin[combineData$REGMigrationCodeChangeWithin == ' ?'] <- NA
combineData$sunbelt[combineData$sunbelt == ' ?'] <- NA
combineData$fatherBirthCountry[combineData$fatherBirthCountry == ' ?'] <- NA
combineData$motherBirthCountry[combineData$motherBirthCountry == ' ?'] <- NA
combineData$selfBirthCountry[combineData$selfBirthCountry == ' ?'] <- NA

#ToDo: replacing all the NA values by their most likely value
#for the moment : #Removing column with NA (not that useful according to my decision tree)
combineData$hispOrigin = NULL
combineData$MSAMigrationCodeChange = NULL
combineData$REGMigrationCodeChange = NULL
combineData$REGMigrationCodeChangeWithin = NULL
combineData$sunbelt = NULL
combineData$fatherBirthCountry = NULL
combineData$motherBirthCountry = NULL
combineData$selfBirthCountry = NULL

#Resplitting Data
enhancedLearn = combineData[1: nrow(census_income_learn),]
enhancedTest = combineData[(nrow(census_income_learn))+1 : nrow(census_income_test),]

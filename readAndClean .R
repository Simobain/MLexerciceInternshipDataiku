#Reading the train set
census_income_learn <- read.csv("us_census_full/census_income_learn.csv", header=F)
census_income_test <- read.csv("us_census_full/census_income_test.csv", header=F)
#giving name to column [hard to find in the file]
colnames(census_income_learn) <-c("age", "classOfWorker", "indusCode", "occupCode", "education", "wagePerHour",
                                  "enrollEduInstLastWk", "maritalStatus", "majorIndustryCode", "majorOccupationCode",
                                  "race", "hispOrigin", "sex",
                                  "laborUnion", "reasonUnemployment", "FTPTEmployement", "capGain", "capLoss", "divStocks",
                                  "taxFiler", "regionPreviousResidence",
                                  "statePreviousResidence", "detailedHousehold", "householder", "instanceWeight",
                                  "MSAMigrationCodeChange", "REGMigrationCodeChange",
                                  "REGMigrationCodeChangeWithin", "House1YearAgo", "sunbelt", "numPersonsWorkedForEmployer",
                                  "parentsIfUnder18", "fatherBirthCountry",
                                  "motherBirthCountry", "selfBirthCountry", "citizenship", "ownBusisnessSE", "questionnaireVet",
                                  "benefVet", "weeksWorkedInYear", "year", "toGuess")

colnames(census_income_test) <-c("age", "classOfWorker", "indusCode", "occupCode", "education", "wagePerHour",
                                  "enrollEduInstLastWk", "maritalStatus", "majorIndustryCode", "majorOccupationCode",
                                  "race", "hispOrigin", "sex",
                                  "laborUnion", "reasonUnemployment", "FTPTEmployement", "capGain", "capLoss", "divStocks",
                                  "taxFiler", "regionPreviousResidence",
                                  "statePreviousResidence", "detailedHousehold", "householder", "instanceWeight",
                                  "MSAMigrationCodeChange", "REGMigrationCodeChange",
                                  "REGMigrationCodeChangeWithin", "House1YearAgo", "sunbelt", "numPersonsWorkedForEmployer",
                                  "parentsIfUnder18", "fatherBirthCountry",
                                  "motherBirthCountry", "selfBirthCountry", "citizenship", "ownBusisnessSE", "questionnaireVet",
                                  "benefVet", "weeksWorkedInYear", "year", "toGuess")

# changing levels
levels(census_income_learn$toGuess)  <- c(0, 1)
levels(census_income_test$toGuess)  <- c(0, 1)

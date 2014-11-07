#Choosing the data to visualize (enhanced or not)
dataToVisualizeL = enhancedLearn #or census_income_learn
dataToVisualizeT = enhancedTest #or census_income_test

#Counting NA or ' NA', or ' ?'
summary(dataToVisualizeL)

numberOfFakeNA = rep(0, length(dataToVisualizeL))
numberOfNA = rep(0, length(dataToVisualizeL))
numberOfQuestionMark = rep(0, length(dataToVisualizeL))

for(i in 1:length(dataToVisualizeL)){
  numberOfFakeNA[i] = numberOfFakeNA[i] + sum(dataToVisualizeL[i] ==' NA', na.rm=T)
  numberOfQuestionMark[i] = numberOfQuestionMark[i] + sum(dataToVisualizeL[i] ==' ?', na.rm=T)
  numberOfNA[i] = numberOfNA[i] + sum(is.na(dataToVisualizeL[i]))
}
percentFakeNA = numberOfFakeNA/nrow(dataToVisualizeL)
percentNA = numberOfNA/nrow(dataToVisualizeL)
percentQuestionMark = numberOfQuestionMark/nrow(dataToVisualizeL)
#To Fix in enhanced data

#Simple visualization of all variables
head(dataToVisualizeL)
str(dataToVisualizeL)
summary(dataToVisualizeL)
library(ggplot2)

#Age
summary(dataToVisualizeL$age)
str(dataToVisualizeL$age)
sum(is.na(dataToVisualizeL$age))
ggplot(dataToVisualizeL, aes(x = age)) + geom_density(color = "red", fill = "red", alpha = 0.2);

dataToVisualizeL$child = (dataToVisualizeL$age < 15)
prop.table(table(dataToVisualizeL$child, dataToVisualizeL$toGuess),1)
filter(dataToVisualizeL, child == 1,  toGuess == 1)
#children doesn't won more than 50k (except for two that have 15 and 16)
#I added a new column so it will be clearer. 

#class of worker 
summary(dataToVisualizeL$classOfWorker)
str(dataToVisualizeL$classOfWorker)
#Not in the universe corresponding to 0 [kids, and not working and... 99% under 50k]
sum((as.character(dataToVisualizeL$classOfWorker) != " Not in universe"))

prop.table(table(dataToVisualizeL$classOfWorker, dataToVisualizeL$toGuess),1) #Self employed incorporated -> 34.7%
ggplot(dataToVisualizeL, aes(x = classOfWorker)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#indus code

#Transform numbers into factors
dataToVisualizeL$indusCode = factor(dataToVisualizeL$indusCode)

summary(dataToVisualizeL$indusCode)
str(dataToVisualizeL$indusCode)
# 0 probably means unknown and not working [and kid](99,1% under 50k)
#http://www.census.gov/cgi-bin/sssd/naics/naicsrch?chart=2007 not the same...
sum(as.character(dataToVisualizeL$indusCode) == '0')
prop.table(table(dataToVisualizeL$indusCode, dataToVisualizeL$toGuess),1) 
ggplot(dataToVisualizeL, aes(x = indusCode)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#occup Code
#Transform numbers into factors
dataToVisualizeL$occupCode = factor(dataToVisualizeL$occupCode)

summary(dataToVisualizeL$occupCode)
str(dataToVisualizeL$occupCode)
# 0 probably means unknown and not working [and kid](99,1% under 50k)  so probably just NA...
#http://www.bls.gov/soc/soc_2010_definitions.pdf
sum(as.character(dataToVisualizeL$occupCode) == '0')
prop.table(table(dataToVisualizeL$occupCode, dataToVisualizeL$toGuess),1) 
ggplot(dataToVisualizeL, aes(x = occupCode)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#education
summary(dataToVisualizeL$education)
str(dataToVisualizeL$education) #no missing value
ggplot(dataToVisualizeL, aes(x = education)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
prop.table(table(dataToVisualizeL$education, dataToVisualizeL$toGuess),1)
#more than 54% of Prof school degree (MD DDS DVM LLB JD) over 50k !
# More than 47000 children... 

#wagePerHour

summary(dataToVisualizeL$wagePerHour)
str(dataToVisualizeL$wagePerHour)
sum(dataToVisualizeL$wagePerHour == 0) 
#188k people

sum(dataToVisualizeL$wagePerHour == 0 & dataToVisualizeL$toGuess == 1)/
  sum(dataToVisualizeL$wagePerHour == 0)
#Minimum wage per hour is more than 4$ in 1994-1995 http://www.infoplease.com/ipa/A0774473.html
#a lot of data is missing here (about 88k because we already know 99 000 people that do not won more than 50k)
#http://www.dol.gov/dol/topic/wages/minimumwage.htm

ggplot(dataToVisualizeL, aes(x = wagePerHour)) + geom_density(color = "red", fill = "red", alpha = 0.2);

#Some tests
sum(dataToVisualizeL$wagePerHour >= 4000 & dataToVisualizeL$toGuess == 1)/
  sum(dataToVisualizeL$wagePerHour >= 4000)
#about 15.5% > 50k 
sum(dataToVisualizeL$wagePerHour >= 2000 & dataToVisualizeL$wagePerHour < 4000 & dataToVisualizeL$toGuess == 1)/
  sum(dataToVisualizeL$wagePerHour >= 2000 & dataToVisualizeL$wagePerHour < 4000)
#about 42%
sum(dataToVisualizeL$wagePerHour < 1000 & dataToVisualizeL$toGuess == 1)/
  sum(dataToVisualizeL$wagePerHour < 1000)
#about 6.1%
#Need to make category with this column (see enhancedData)


#enroll in education least wk 
summary(dataToVisualizeL$enrollEduInstLastWk)
str(dataToVisualizeL$enrollEduInstLastWk)
prop.table(table(dataToVisualizeL$enrollEduInstLastWk, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = enrollEduInstLastWk)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#marital status
summary(dataToVisualizeL$maritalStatus)
str(dataToVisualizeL$maritalStatus)
prop.table(table(dataToVisualizeL$maritalStatus, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = maritalStatus)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#Seems that ones who are married-civilian or divorced are more likely to win more thn 50k

#major industry code
summary(dataToVisualizeL$majorIndustryCode)
str(dataToVisualizeL$majorIndustryCode)
str(dataToVisualizeL$indusCode)
#Less levels than indusCode... More general then ?
#But some are the same -> construction and number 04
sqldf('select indusCode, majorIndustryCode from dataToVisualizeL where indusCode = 25')
sqldf('select indusCode, majorIndustryCode from dataToVisualizeL where indusCode = 27')
#for instance 25 and 27 are related to the same majorIndustryCode
#So I will not take the majorIndustryCode in my model. (but keeping it to make sense of the number)
prop.table(table(dataToVisualizeL$majorIndustryCode, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = majorIndustryCode)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#major occupation code
summary(dataToVisualizeL$majorOccupationCode)
str(dataToVisualizeL$majorOccupationCode)
str(dataToVisualizeL$occupCode)
#Less levels than indusCode... More general then ?
#But some are the same -> construction and number 04
sqldf('select occupCode, majorOccupationCode from dataToVisualizeL where occupCode = 25')
sqldf('select occupCode, majorOccupationCode from dataToVisualizeL where occupCode = 24')
#for instance 24 and 24 are related to the same majorOccupationCode
#So I will not take the majorOccupationCode in my model. (but keeping it to make sense of the number)
prop.table(table(dataToVisualizeL$majorOccupationCode, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = majorOccupationCode)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#race
summary(dataToVisualizeL$race)
str(dataToVisualizeL$race)
ggplot(dataToVisualizeL, aes(x = race, fill=factor(race))) + geom_histogram();
prop.table(table(dataToVisualizeL$race, dataToVisualizeL$toGuess),1)

#hispOrigin
summary(dataToVisualizeL$hispOrigin) #874,  NA, 306 Do not know Need to merge them ?
sum(is.na(dataToVisualizeL$hispOrigin))/length(dataToVisualizeL$hispOrigin)
#0.59 % de NA (do not know included)
#Not exactly the same proba of winning more than 50k but put them together anyway

str(dataToVisualizeL$hispOrigin)
ggplot(dataToVisualizeL, aes(x = hispOrigin, fill=factor(hispOrigin))) + geom_histogram();
prop.table(table(dataToVisualizeL$hispOrigin, dataToVisualizeL$toGuess),1)

#sex
summary(dataToVisualizeL$sex)
str(dataToVisualizeL$sex)
ggplot(dataToVisualizeL, aes(x = sex, fill=factor(sex))) + geom_histogram();
prop.table(table(dataToVisualizeL$sex, dataToVisualizeL$toGuess),1)
#Seems that men won more than women

#labor union
summary(dataToVisualizeL$laborUnion)
str(dataToVisualizeL$laborUnion)
prop.table(table(dataToVisualizeL$laborUnion, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = laborUnion)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#labor union
summary(dataToVisualizeL$laborUnion)
str(dataToVisualizeL$laborUnion)
prop.table(table(dataToVisualizeL$laborUnion, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = laborUnion)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#yes and no similar probability but can depend on other variables

#reason of unemployment
summary(dataToVisualizeL$reasonUnemployment)
str(dataToVisualizeL$reasonUnemployment)
prop.table(table(dataToVisualizeL$reasonUnemployment, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = reasonUnemployment)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#Adding a unemployed column ?

#fulltime, part time employement
summary(dataToVisualizeL$FTPTEmployement)
str(dataToVisualizeL$FTPTEmployement)
prop.table(table(dataToVisualizeL$FTPTEmployement, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = FTPTEmployement)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#Too much Children or Armed Forces... only 55k child so about 65k armed forces.
sum(dataToVisualizeL$FTPTEmployement == ' Children or Armed Forces' & !dataToVisualizeL$child)
#exactly 72106 armed forces

#capGain
summary(dataToVisualizeL$capGain)
str(dataToVisualizeL$capGain)
#took off the zero value to see the distribution
dataToVisualizeLWithoutcapGainZero = filter(dataToVisualizeL, capGain !=0)
ggplot(dataToVisualizeLWithoutcapGainZero, aes(x = capGain)) + geom_density(color = "red", fill = "red", alpha = 0.2);

#capLoss
summary(dataToVisualizeL$capLoss)
str(dataToVisualizeL$capLoss)
#took off the zero value to see the distribution
dataToVisualizeLWithoutcapLossZero = filter(dataToVisualizeL, capLoss !=0)
ggplot(dataToVisualizeLWithoutcapLossZero, aes(x = capLoss)) + geom_density(color = "red", fill = "red", alpha = 0.2);

#divStock
summary(dataToVisualizeL$divStocks)
str(dataToVisualizeL$divStocks)
#took off the zero value to see the distribution
dataToVisualizeLWithoutdivStocksZero = filter(dataToVisualizeL, divStocks !=0)
ggplot(dataToVisualizeLWithoutdivStocksZero, aes(x = divStocks)) + geom_density(color = "red", fill = "red", alpha = 0.2);

#taxFiler
summary(dataToVisualizeL$taxFiler)
str(dataToVisualizeL$taxFiler)
prop.table(table(dataToVisualizeL$taxFiler, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = taxFiler)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#region Previous residence
summary(dataToVisualizeL$regionPreviousResidence)
str(dataToVisualizeL$regionPreviousResidence)
prop.table(table(dataToVisualizeL$regionPreviousResidence, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = regionPreviousResidence)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#state Previous residence
summary(dataToVisualizeL$statePreviousResidence)
str(dataToVisualizeL$statePreviousResidence)
prop.table(table(dataToVisualizeL$statePreviousResidence, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = statePreviousResidence)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#States give more details than regions -> Only keep states for the model

#detailed household
summary(dataToVisualizeL$detailedHousehold)
str(dataToVisualizeL$detailedHousehold)
prop.table(table(dataToVisualizeL$detailedHousehold, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = detailedHousehold)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

# relation to householder
summary(dataToVisualizeL$householder)
str(dataToVisualizeL$householder)
prop.table(table(dataToVisualizeL$householder, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = householder)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#instanceWeigth
summary(dataToVisualizeL$instanceWeight)
ggplot(dataToVisualizeL, aes(x = instanceWeight)) + geom_density(color = "red", fill = "red", alpha = 0.2);
#No idea of what it could be for a person

#MSAMigrationCodeChange
summary(dataToVisualizeL$MSAMigrationCodeChange)
str(dataToVisualizeL$MSAMigrationCodeChange)
prop.table(table(dataToVisualizeL$MSAMigrationCodeChange, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = MSAMigrationCodeChange)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#need to transform the ' ?' into NA

#REGMigrationCodeChange
summary(dataToVisualizeL$REGMigrationCodeChange)
str(dataToVisualizeL$REGMigrationCodeChange)
prop.table(table(dataToVisualizeL$REGMigrationCodeChange, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = REGMigrationCodeChange)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#need to transform the ' ?' into NA

#REGMigrationCodeChangeWithin
summary(dataToVisualizeL$REGMigrationCodeChangeWithin)
str(dataToVisualizeL$REGMigrationCodeChangeWithin)
prop.table(table(dataToVisualizeL$REGMigrationCodeChangeWithin, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = REGMigrationCodeChangeWithin)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#need to transform the ' ?' into NA

#House1YearAgo
summary(dataToVisualizeL$House1YearAgo)
str(dataToVisualizeL$House1YearAgo)
prop.table(table(dataToVisualizeL$House1YearAgo, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = House1YearAgo)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#previous residence in sunbelt
summary(dataToVisualizeL$sunbelt)
str(dataToVisualizeL$sunbelt)
prop.table(table(dataToVisualizeL$sunbelt, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = sunbelt)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#need to transform the ' ?' into NA

#numPersonsWorkedForEmployer
summary(dataToVisualizeL$numPersonsWorkedForEmployer)
str(dataToVisualizeL$numPersonsWorkedForEmployer)
prop.table(table(dataToVisualizeL$numPersonsWorkedForEmployer, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = numPersonsWorkedForEmployer)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
#need to turn them into factors

#parentsIfUnder18
summary(dataToVisualizeL$parentsIfUnder18)
str(dataToVisualizeL$parentsIfUnder18)
prop.table(table(dataToVisualizeL$parentsIfUnder18, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = parentsIfUnder18)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#fatherBirthCountry
summary(dataToVisualizeL$fatherBirthCountry)
str(dataToVisualizeL$fatherBirthCountry)
prop.table(table(dataToVisualizeL$fatherBirthCountry, dataToVisualizeL$toGuess),1)
#' ?' to change into NA
#ggplot(dataToVisualizeL, aes(x = fatherBirthCountry)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#motherBirthCountry
summary(dataToVisualizeL$motherBirthCountry)
str(dataToVisualizeL$motherBirthCountry)
prop.table(table(dataToVisualizeL$motherBirthCountry, dataToVisualizeL$toGuess),1)
#' ?' to change into NA

#selfBirthCountry
summary(dataToVisualizeL$selfBirthCountry)
str(dataToVisualizeL$selfBirthCountry)
prop.table(table(dataToVisualizeL$selfBirthCountry, dataToVisualizeL$toGuess),1)
# ' ?' to change into NA

#citizenship
summary(dataToVisualizeL$citizenship)
str(dataToVisualizeL$citizenship)
prop.table(table(dataToVisualizeL$citizenship, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = citizenship)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#ownBusisnessSE
summary(dataToVisualizeL$ownBusisnessSE)
#to change into factors
str(dataToVisualizeL$ownBusisnessSE)
prop.table(table(dataToVisualizeL$ownBusisnessSE, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = ownBusisnessSE)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#questionnaireVet
str(dataToVisualizeL$questionnaireVet)
summary(dataToVisualizeL$questionnaireVet)
prop.table(table(dataToVisualizeL$questionnaireVet, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = questionnaireVet)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);

#benefVet
summary(dataToVisualizeL$benefVet)
#to change into factors
str(dataToVisualizeL$benefVet)
prop.table(table(dataToVisualizeL$benefVet, dataToVisualizeL$toGuess),1)
ggplot(dataToVisualizeL, aes(x = benefVet)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
# 2 probably means 'Not in the universe'

#weeksWorkedInYear
summary(dataToVisualizeL$weeksWorkedInYear)
str(dataToVisualizeL$weeksWorkedInYear)
ggplot(dataToVisualizeL, aes(x = weeksWorkedInYear)) + geom_density(color = "red", fill = "red", alpha = 0.2);

#year
summary(dataToVisualizeL$year)
ggplot(dataToVisualizeL, aes(x = year)) + geom_histogram(color = "red", fill = "red", alpha = 0.2);
prop.table(table(dataToVisualizeL$year))
prop.table(table(dataToVisualizeL$year, dataToVisualizeL$toGuess),1)
#Not sure if that's a real difference or purely hazard... Anyway need to "factor" them with two levels


#weeksWorkedInYear
summary(dataToVisualizeL$weeksWorkedInYear)
str(dataToVisualizeL$weeksWorkedInYear)
ggplot(dataToVisualizeL, aes(x = weeksWorkedInYear)) 
+ geom_histogram(aes(y = ..density..), alpha = 0.7) 
+ geom_density( alpha = 0.2, fill = "red");


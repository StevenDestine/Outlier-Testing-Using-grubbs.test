#clear environment
rm(list = ls())

#Load in the data - this lets me pick the file from my file explorer
Crimedata <- read.delim(file.choose(), header=TRUE)

#Check how the data looks
#At first I wrote header=FALSE and it read the headers as a variable
#So I had 48 variables instead of the correct 47 
head(Crimedata)

#I always like to check the structure of the data
str(Crimedata)

#This is plotting all of the data, not  useful to me for this question
plot(Crimedata)

#This plots the final column of the data, helpful for me to see visual outliers
plot(Crimedata$Crime)

#This plot helps me to see a theoretical distribution of the data
qqnorm(Crimedata$Crime)


install.packages("outliers")
library(outliers)

set.seed(99)

#Ran the grubbs.test function to determine if there were any outliers 
#this is testing for one outlier
CrimeOutliers <- grubbs.test(Crimedata$Crime, type = 10, opposite = FALSE, two.sided = FALSE)

CrimeOutliers

#This is testing for two outliers, lowest value and highest value
CrimeOutliers_two <- grubbs.test(Crimedata$Crime, type = 11, opposite = FALSE, two.sided = FALSE)

CrimeOutliers_two

#Removing the outlier of 1993 
CrimedataOut <- Crimedata$Crime[-26]


#Distribution looks a bit better but I still see an outlier, visually
qqnorm(CrimedataOut)

#Now I see that other outlier that I visually saw with a very low P-value
CrimedataOUt_outliers <- grubbs.test(CrimedataOut, type =  10)
CrimedataOUt_outliers

#Removing another outlier of 1969
finalCrimedata <- CrimedataOut[-4]

#Again checking the distribution of my new data with outliers - that I saw - removed
qqnorm(finalCrimedata)


### Question 6.2
#clear environment
rm(list = ls())

#Load in the data - this lets me pick the file from my file explorer
Atl_Weather <- read.delim(file.choose(), header=TRUE)

#Check how the data looks
head(Atl_Weather)
str(Atl_Weather)

Atl_Weather_x <- Atl_Weather[-1]
Atl_Weather_x

row.names(Atl_Weather_x) <- Atl_Weather$DAY
Atl_Weather_x

x <- c(Atl_Weather[ ,26])

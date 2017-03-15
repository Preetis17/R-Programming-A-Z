
#Method 1:
data <- read.csv(file.choose())

#Method 2:
setwd('/home/kunkler/git/R-Programming-A-Z/')
getwd()
data <- read.csv('datasets/DemographicData.csv')

#--------------
nrow(data)
# Imported 195 rows

ncol(data)
#Imported 5 columns

head(data)
tail(data)
str(data) # Structure Information
summary(data)

runif(10) # randomly distributed uniform variables
#--------------

data[data$Country.Name == 'Germany',]
levels(data$Income.Group)

data[data$Country.Name == "Malta",]

#-------------
library(ggplot2)
qplot(data=data, x=Internet.users)
qplot(data=data, x=Income.Group, y=Birth.rate,
      size=I(2),
      color=I("blue"))
qplot(data=data, x=Income.Group, y=Birth.rate, geom="boxplot")

#-------------

qplot(data=data, x=Internet.users, y=Birth.rate)
qplot(data=data, x=Internet.users, y=Birth.rate,
      size=I(2),
      color=Income.Group)

#-------------
mydf <- data.frame(Country=Countries_2012_Dataset, 
                   Code=Codes_2012_Dataset, 
                   Region=Regions_2012_Dataset)
head(mydf)

summary(mydf$Region)

#------------

merged <- merge(data, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)
merged$Country <- NULL
str(merged)

#-----------
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      color=Region,
      shape=Income.Group,
      size=I(3),
      alpha=I(0.6),
      main = "Birth Rate vs. Internet Users by Income Group")

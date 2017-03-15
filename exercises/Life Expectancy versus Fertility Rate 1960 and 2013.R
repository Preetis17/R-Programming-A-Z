
# Remember to import Vectors from S5 Homework Exercise Vectors file!!
#---------------------------

#setwd("...")
#df <- read.csv("")

df <- read.csv(file.choose())

head(df)
str(df)

le.1960 <- data.frame(Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_1960)
le.2013 <- data.frame(Code=Country_Code, Life.Expectancy=Life_Expectancy_At_Birth_2013)

df.1960 <- df[df$Year == "1960",]
df.2013 <- df[df$Year == "2013",]

total.1960 <- merge(df.1960, le.1960, by.x = "Country.Code", by.y = "Code")
total.2013 <- merge(df.2013, le.2013, by.x = "Country.Code", by.y = "Code")

#--------------------------- PLOTS

library(ggplot2)
# 1960
qplot(data=total.1960, x=Fertility.Rate, y=Life.Expectancy,
      color=Region,
      size=I(2),
      alpha=I(0.6),
      main = "Fertility vs. Life Expectancy in 1960")

# 2013
qplot(data=total.2013, x=Fertility.Rate, y=Life.Expectancy,
      color=Region,
      size=I(2),
      alpha=I(0.6),
      main = "Fertility vs. Life Expectancy in 2013")

#--------------------------- COMPARISON

# Side by Side
#install.packages("gridExtra") IF NOT ALREADY INSTALLED
require(gridExtra)
p1 <- qplot(data=total.1960, x=Fertility.Rate, y=Life.Expectancy,
      color=Region,
      size=I(2),
      alpha=I(0.6),
      main = "Fertility vs. Life Expectancy in 1960")

# 2013
p2 <- qplot(data=total.2013, x=Fertility.Rate, y=Life.Expectancy,
      color=Region,
      size=I(2),
      alpha=I(0.6),
      main = "Fertility vs. Life Expectancy in 2013")

# Arrange both plots side by side for comparison 
grid.arrange(p1, p2, ncol=2)

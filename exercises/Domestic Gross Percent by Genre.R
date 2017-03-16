# Import data
#setwd('/home/kunkler/git/R-Programming-A-Z/')
#movies <- read.csv("datasets/Section6-Homework-Data.csv")
movies <- read.csv(file.choose())
View(movies)

# Check data
head(movies)
summary(movies)
str(movies)

#---------------------------- Prepare Data

# Filter data only for top 6 studios and top 5 genres
movies.filtered <- movies[movies$Studio == "Buena Vista Studios" | movies$Studio == "Fox" | movies$Studio == "WB" | movies$Studio == "Sony" | movies$Studio == "Paramount Pictures" | movies$Studio == "Universal",]
movies.filtered <- movies.filtered[movies.filtered$Genre == "action" | movies.filtered$Genre == "adventure" | movies.filtered$Genre == "comedy" | movies.filtered$Genre == "drama" | movies.filtered$Genre == "animation",]

colnames(movies.filtered) <- c("Weekday", "Director", "Genre", "Title", "ReleaseDate", "Studio", "AdjustedGross", "Budget", "Gross", "IMDb",
                               "MovieLens", "Overseas", "OverseasPercent", "Profit", "ProfitPercent", "Runtime", "USA", "GrossUSA")
head(movies.filtered)
summary(movies.filtered)

movies.filtered[movies.filtered$Runtime < 60,]
#----------------------------- Explore Data
library(ggplot2)

#install.packages("extrafont") #needed for Comic Sans MS Font
library(extrafont)
font_import()
loadfonts(device = "win")

# Check on which days most movies are released
p <- ggplot(data=movies.filtered, aes(x=Weekday))
p + geom_bar()
#>>> No movies release on monday!

#---------------------------- Create wanted Plot

g <- ggplot(data=movies.filtered, aes(x=Genre, 
                                      y=GrossUSA,
                                      size=Budget))

sc_plot <- g + geom_jitter(aes(color=Studio)) + geom_boxplot(alpha=0.5)

sc_plot$labels$size = "Budget $M" #Change legend label

sc_plot + 
  xlab("Genre") +
  ylab("Gross % USA") + 
  ggtitle("Domestic Gross % by Genre") + 
  theme(text = element_text(family="Comic Sans MS"),
        axis.title = element_text(size=20, color="Blue"),
        axis.text = element_text(size=12),
        plot.title = element_text(size=25, color="Black"),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=12))


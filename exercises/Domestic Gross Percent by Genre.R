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

# Check on which days most movies are released
p <- ggplot(data=movies.filtered, aes(x=Day.of.Week))
p + geom_bar()
#>>> No movies release on monday!

#---------------------------- Create wanted Plot

g <- ggplot(data=movies.filtered, aes(x=Genre, 
                                      y=GrossUSA.Percent,
                                      size=Budget))

sc_plot <- g + geom_jitter(aes(color=Studio)) + geom_boxplot(alpha=0.5)

sc_plot + 
  xlab("Genre") +
  ylab("Gross % USA") + 
  ggtitle("Domestic Gross % by Genre") + 
  theme(axis.title = element_text(size=20, color="Blue", family="Palatino"),
        axis.text = element_text(size=12, family="Palatino"),
        plot.title = element_text(size=25, color="Black", family="Palatino"),
        
        legend.title = element_text(size=15, family="Palatino"),
        legend.text = element_text(size=12, family="Palatino"),
        
        )

setwd('/home/kunkler/git/R-Programming-A-Z')
movies <- read.csv('datasets/Movie-Ratings.csv')

head(movies)

# Rename columns
colnames(movies) <- c("Film", "Genre", "CriticsRating", "AudienceRating", "BudgetMillions", "Year")

# Check structure
str(movies)

# Refactor variable Year
movies$Year <- factor(movies$Year)

str(movies)

#--------------------------------
library(ggplot2)

# Scatter plot of Ratings
p <- ggplot(data=movies, aes(x=CriticsRating, y=AudienceRating, color=Genre))
p + geom_point()

# Histogram of Budget by Genre
hist <- ggplot(data=movies, aes(x=BudgetMillions))
hist + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

# Facets by Genre
hist + geom_histogram(binwidth = 10, 
                      aes(fill=Genre), 
                      color="Black") +
  facet_grid(Genre~.)

# Facets by Genre and Year
hist + geom_histogram(binwidth = 10, 
                      aes(fill=Genre), 
                      color="Black") +
  facet_grid(Genre~Year, scale="free")

# Scatter plot by Year and genre
p + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(se=F) +
  facet_grid(Genre~Year)

#--------------------------------
# limits

hist + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
  ylim(0,50)

# better way to zoom in: (without cutt-off!)
hist + geom_histogram(binwidth=10, aes(fill=Genre), color="Black") +
  coord_cartesian(ylim=c(0,50))


# Plot ordered by CEO:
p + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#--------------------------------

h <- hist + geom_histogram(binwidth=10, aes(fill=Genre), color="Black")

# Themed histogram
h + 
  xlab("Budget in Million USD") +
  ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="DarkGreen", size=15), 
        axis.title.y = element_text(color="Red", size=15),
        axis.text = element_text(size=12),
        
        panel.background = element_rect(color="Black"),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=12),
        legend.position = c(0.99,0.98),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue", 
                                  size=30,
                                  family="Courier")) 

# box plots of Audience Rating by Genre
t <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, color=Genre))

bp <- t + geom_jitter() + geom_boxplot(alpha=0.5)

bp + xlab("Movie Genre") +
  ylab("Rating by Audience") + 
  ggtitle("Audience Rating by Genre") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text = element_text(size=12),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=12),
        
        plot.title = element_text(size=20, color="DarkBlue", family="Courier"))

# same for CriticsRating
bp <- t + geom_jitter(aes(y=CriticsRating)) + geom_boxplot(alpha=0.5, aes(y=CriticsRating))

bp + xlab("Movie Genre") +
  ylab("Rating by Critics") + 
  ggtitle("Critics Rating by Genre") +
  theme(axis.title.x = element_text(color="DarkGreen", size=20),
        axis.title.y = element_text(color="Red", size=20),
        axis.text = element_text(size=12),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=12),
        
        plot.title = element_text(size=20, color="DarkBlue", family="Courier"))

# IMFO: Load s4-BasketballData.R first to access the relevant data!

PPG <- Points/Games

# Per default, plot for all Athletes in 'Players' Vector
myplot <- function(dataset=PPG, player=Players){
  label.y = deparse(substitute(dataset))
  Data <- dataset[player,, drop=F]
  matplot(t(Data), type="b", pch=19:25, col=10:20, xlab='Year', ylab=label.y)
  legend("topright", inset=0.01, legend=player, pch=19:25, col=10:20)
}

# Plot Minutes Played per Game for Kobe, LeBron and DRose
myplot(MinutesPlayed/Games, c("KobeBryant", "LeBronJames", "DerrickRose"))

PPG[c("KobeBryant", "LeBronJames", "DerrickRose"),]

#Plot last 3 Players PPG
myplot(players=Players[8:10])

# Salary
myplot(Salary)
myplot(Salary/Games)
myplot(Salary/FieldGoals)

# Ingame Metrics
myplot(MinutesPlayed)
myplot(Points)

# InGame Metrics Normalized
myplot(MinutesPlayed/Games)
myplot(Points/Games)
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)

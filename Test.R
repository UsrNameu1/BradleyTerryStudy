
install.packages("BradleyTerry2", dependencies = TRUE)
library("BradleyTerry2")

# citations
data("citations", package = "BradleyTerry2")
citations

citations.sf <- countsToBinomial(citations) 
names(citations.sf)[1:2] <- c("journal1", "journal2")

citeModel <- BTm(outcome = cbind(win1, win2), journal1, journal2, ~ journal, id = "journal", data = citations.sf)
citeModel

summary(citeModel)
BTabilities(citeModel)

# citations
data("baseball", package = "BradleyTerry2")
head(baseball)

baseballModel <- BTm(
  outcome = cbind(home.wins, away.wins), 
  player1 = home.team, player2 = away.team, 
  data = baseball, id = "team")
baseballModel
BTabilities(baseballModel)

baseball$home.team <- data.frame(team = baseball$home.team, at.home = 1)
baseball$away.team <- data.frame(team = baseball$away.team, at.home = 0)

baseballModel2 <- BTm(cbind(home.wins, away.wins), home.team, away.team, data = baseball, id = "team", formula = ~ team + at.home) 
baseballModel2
BTabilities(baseballModel2)
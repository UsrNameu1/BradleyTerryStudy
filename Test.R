
install.packages("BradleyTerry2", dependencies = TRUE)
library("BradleyTerry2")
data("citations", package = "BradleyTerry2")
citations
citations.sf <- countsToBinomial(citations)

citeModel <- Btm(cbind(win1, win2), journal1, journal2, ~ journal, id = "journal", data = citations.sf)
citeModel
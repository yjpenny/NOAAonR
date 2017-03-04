library(rnoaa)
library(dplyr)

rm(list=ls())

# isd stations with valid country and state
stations <- isd_stations()
stations <- dplyr::filter(stations, grepl("US", ctry))
stations <- dplyr::filter(stations, !nchar(state)==0)

"# make plot
df <- stations[complete.cases(stations$lat, stations$lon), ]
df <- df[df$lat != 0, ]
leaflet(data = df) %>%
  addTiles() %>%
  addCircles()"

res <- isd(usaf=stations[1,1], wban=stations[1,2], year=1990)

  
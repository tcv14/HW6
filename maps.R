# load libraries
library(ggmap)
library(tidyverse)

# find points of interest
cricket <- geocode("bude north cornwall cricket club")
beach1 <- geocode("crooklets beach")
beach2 <- geocode("summerleaze beach")
pub <- geocode("the barrel at bude")
route_cp <- route("bude north cornwall cricket club", "the barrel at bude", structure = "route")

# hybrid map
map.road <- get_map(cricket, maptype = "roadmap", zoom = 15)

roadmap <- ggmap(map.road, extent = 'device') +
  geom_point(
    data = cricket,
    aes(x = lon, y = lat),
    color = "red", size = 3) +
  geom_text(
    data = cricket,
    aes(label = "Bude North Cornwall Cricket Club"),
    hjust = 1, size = 3) +
  geom_point(
    data = beach1,
    aes(x = lon, y = lat), 
    color = "blue", size = 3) +
  geom_point(
    data = beach2,
    aes(x = lon, y = lat), 
    color = "blue", size = 3) +
  geom_point(
    data = pub,
    aes(x = lon, y = lat), 
    color = "green", size = 3) +
  geom_text(
    data = pub,
    aes(label = "The Barrel at Bude"),
    hjust = 1, size = 3) +
  geom_path(
    data = route_cp,
    aes(x = lon, y = lat), colour = "brown", 
    lineend = "round", size = 1.5)

# watercolor map
map.watercolor <- get_map(cricket, maptype = "watercolor", zoom = 15)

watercolor <- ggmap(map.watercolor, extent = 'device') +
  geom_point(
    data = cricket,
    aes(x = lon, y = lat),
    color = "red", size = 3) +
  geom_text(
    data = cricket,
    aes(label = "Bude North Cornwall Cricket Club"),
    hjust = 1, size = 3) +
  geom_point(
    data = beach1,
    aes(x = lon, y = lat), 
    color = "blue", size = 3) +
  geom_text(
    data = beach1,
    aes(label = "Crooklets Beach"),
    hjust = 1, size = 3) +
  geom_point(
    data = beach2,
    aes(x = lon, y = lat), 
    color = "blue", size = 3) +
  geom_text(
    data = beach2,
    aes(label = "Summerleaze Beach"),
    hjust = 1, size = 3) +
  geom_point(
    data = pub,
    aes(x = lon, y = lat), 
    color = "green", size = 3) +
  geom_text(
    data = pub,
    aes(label = "The Barrel at Bude"),
    hjust = 1, size = 3) +
  geom_path(
    data = route_cp,
    aes(x = lon, y = lat), colour = "brown", 
    lineend = "round", size = 1.5)

# save workspace into .RData file
# save.image(file="mapdata.RData") # uncomment when changes are made

# load workspace from .RData file
# load("mapdata.RData") # uncomment to load data

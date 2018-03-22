# load libraries
library(ggmap)
library(tidyverse)

# find points of interest
cricket <- geocode("bude north cornwall cricket club")
beach1 <- geocode("crooklets beach")
beach2 <- geocode("summerleaze beach")
pub <- geocode("crooklets inn")
route_cp <- route("bude north cornwall cricket club", "crooklets inn", structure = "route")

# hybrid map
map.hybrid <- get_map(cricket, zoom = 15)

hybrid <- ggmap(map.hybrid, extent = 'device') +
  geom_point(
    data = cricket,
    aes(x = lon, y = lat),
    color = "red", size = 3) +
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
  geom_path(
    data = route_cp,
    aes(x = lon, y = lat), colour = "brown", 
    lineend = "round", size = 1.5)

# watercolor map
map.watercolor <- get_map(cricket, maptype = "watercolor", zoom = 15)

watercolor <- ggmap(map.watercolor, extent = 'device') +
  geom_point(
    aes(x = lon, y = lat), data = cricket,
    color = "red", size = 3) +
  geom_point(
    aes(x = lon, y = lat), data = beach1, 
    color = "blue", size = 3) +
  geom_point(
    aes(x = lon, y = lat), data = beach2, 
    color = "blue", size = 3) +
  geom_point(
    aes(x = lon, y = lat), data = pub, 
    color = "green", size = 3) +
  geom_path(
    aes(x = lon, y = lat), colour = "brown", data = route_cp, 
    lineend = "round", size = 1.5)

# save workspace into .RData file
save.image(file="mapdata.RData")

# load workspace from .RData file
load("mapdata.RData")

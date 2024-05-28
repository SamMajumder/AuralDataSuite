
library(rnaturalearth)
library(here)
library(terra)
library(sf)
library(RColorBrewer)
library(leaflet)
library(tidyverse)
library(shiny)
library(shinyWidgets)
library(htmlwidgets)
library(leaflet.providers)

raster <- terra::rast(here::here("Data","RawData","2022_1.nc"))

# Prepare the color palette
pal <- colorNumeric(palette = "RdYlBu", domain = range(values(raster), na.rm = TRUE), reverse = TRUE)

# Create the Leaflet map
m <- leaflet() %>%
  addProviderTiles(provider = "OpenStreetMap") %>%
  addRasterImage(raster, colors = pal, opacity = 1, layerId = "rasterLayer") %>%
  addLegend(pal = pal, values = values(raster), title = "2 metre temperature (K)", opacity = 0.7)

# Print the map
m

# To save the map as an HTML file
saveWidget(m, "myRasterMap.html", selfcontained = TRUE)

library(rgdal)
library(leaflet)
library(dplyr)


  summary(data)
  head(data)

  
  Country.name <- data$Country.Name
  women.labour.2019 <- data$X2019
  data_2019 <- data.frame(Country.name, women.labour.2019)
  data_2019
  
  
  summary(data_spatial)
  

  
  spatial_dataframe <- merge(data_spatial, data_2019, by.x="NAME", by.y="Country.name" )
  summary(spatial_dataframe)
  

  
  map <- leaflet()%>%
    addCircleMarkers(data=spatial_dataframe,
                     lng = longitude,
                     lat= latitude,
                     radius=3)%>%
    addTiles()%>%
    addPolygons(data=spatial_dataframe,
                weight =1,
                fillOpacity = 0.7,
                smoothFactor = 0.5,
                fillColor  = variance(range),
                label = range,
                color  = "grey")%>%
    addLegend("bottomleft", pal = variance_legend, value = spatial_dataframe$women.labour.2019,
              opacity = 15
    )
    
    
    addLegend(position="bottomright", 
              pal=variance_legend(),
              values=spatial_dataframe$women.labour.2019
    )
  
  position <- "bottomright"
  scale <- variance
  value <- spatial_dataframe$
  title <- "%age of women in workforce"
  opacity <- 35
  
  
  color_palette <- ("inferno")
  bins <- 20
  if.na <- "#808080"
  range <- spatial_dataframe$women.labour.2019

  variance_legend <- colorBin(color_palette, range, bins = 5, na.color = if.na)
  

  
  
  
  
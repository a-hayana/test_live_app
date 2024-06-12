library(shiny)
library(leaflet)

# UI
ui <- fluidPage(
  titlePanel("Mapa Interativo do Brasil com Google Maps"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      leafletOutput("map", width = "100%", height = "600px")
    )
  )
)

# Server
server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() |>
      addTiles() |>  
      addProviderTiles(providers$GoogleMaps) |>
      setView(lng = -51.9253, lat = -14.2350, zoom = 4) 
  })
}

shinyApp(ui = ui, server = server)


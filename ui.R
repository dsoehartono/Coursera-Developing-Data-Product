library(shiny)

shinyUI(fluidPage(
  pageWithSidebar(
  headerPanel("Population Pyramid for a Province in Indonesia"),
  
  sidebarPanel(
    selectInput("province", "Province: ",
                choices=c("Prov. Nanggroe Aceh Darussalam", 
                          "Prov. Sumatera Utara",
                          "Prov. Sumatera Barat",
                          "Prov. Riau",
                          "Prov. Kepulauan Riau",
                          "Prov. Jambi",
                          "Prov. Sumatera Selatan",
                          "Prov. Kepulauan Bangka Belitung",
                          "Prov. Bengkulu",
                          "Prov. Lampung",
                          "Prov. Banten",
                          "Prov. DKI Jakarta",
                          "Prov. Jawa Barat",
                          "Prov. Jawa Tengah",
                          "Prov. D I Yogyakarta",
                          "Prov. Jawa Timur",
                          "Prov. Kalimantan Barat",
                          "Prov. Kalimantan Tengah",
                          "Prov. Kalimantan Selatan",
                          "Prov. Kalimantan Timur",
                          "Prov. Bali",
                          "Prov. Nusa Tenggara Barat",
                          "Prov. Nusa Tenggara Timur",
                          "Prov. Sulawesi Selatan",
                          "Prov. Sulawesi Barat",
                          "Prov. Sulawesi Tengah",
                          "Prov. Sulawesi Tenggara",
                          "Prov. Gorontalo",
                          "Prov. Sulawesi Utara",
                          "Prov. Maluku",
                          "Prov. Maluku Utara",
                          "Prov. Papua Barat",
                          "Prov. Papua")
                ),
    
    helpText("This is an input to select a Province.", br(),
             "Based on the selected Province, a pyramid graph of the population will be generated on the right side.")
  ),
  
  mainPanel(
    plotOutput("plot1")
  )
)))
library(shiny)
library(XML)
library(reshape2)
library(ggplot2)
library(plyr)
library(dplyr)

data_population <- read.csv("data_population.csv", header = TRUE)

## Define a server for the Shiny app
shinyServer(function(input, output) {

  get_data <- function(province_name) {
    df <- data_population %>% filter(province == province_name)
    df <- df[,2:4]
    df$male <- -1*df$male
    df$age <- factor(df$age, levels = df$age, labels = df$age)
    
    df.melt <- melt(df, 
                    value.name='population', 
                    variable.name = 'gender', 
                    id.vars='age' )
    
    return(df.melt)
  }
  
  data_plot <- reactive({ get_data(input$province)})
  
  output$plot1 <- renderPlot({
  
    ggplot(data_plot(), aes(x = age, y = population, fill = gender)) +
      geom_bar(data = subset(data_plot(), gender == "female"), stat = "identity") +
      geom_bar(data = subset(data_plot(), gender == "male"), stat = "identity") +
      scale_y_continuous(breaks = seq(-2500000,2500000,500000), 
                         labels = paste0(as.character(c(seq(2.5,0,-0.5),seq(0.5,2.5,0.5))),"m")) +
      coord_flip() +
      scale_fill_brewer(palette = "Set1") + theme_bw()
    
  })
})
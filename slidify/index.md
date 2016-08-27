---
title       : Coursera Developing Data Product Project
subtitle    : Slidify Presentation
author      : Djoko Soehartono
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Description


The Shiny Apps I wrote shows the pyramid chart of the population for a province in Indonesia.

I intend to show the input to select a province on the left side and then showing the pyramid chart on the right side.

--- 

## Datasets


The original data set I used for this project was from `data.go.id`.
I modified the data and stored in a file named `data_population.csv` in the same folder with the program files.

This data set has four columns:

1. `province` - Name of the 33 provinces

2. `male` - number of population for male gender

3. `female` - number of population for female gender

4. `age` - age groups of the population

---

## Data Exploration

In the `server.R` file, I included code below:
```r
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
```
To select the population data for a province and modify the resulting data with `melt` function to assign `male` and `female` values in rows instead of column headers.

---

## Main Program Code

Main code is to get the data ready for plotting and I put this in `reactive` function:
```r
  data_plot <- reactive({ get_data(input$province)})
    output$plot1 <- renderPlot({
    ggplot(data_plot(), aes(x = age, y = population, fill = gender)) +
      geom_bar(data = subset(data_plot(), gender == "female"), 
               stat = "identity") +
      geom_bar(data = subset(data_plot(), gender == "male"), 
               stat = "identity") +
      scale_y_continuous(breaks = seq(-2500000,2500000,500000), 
                         labels = paste0(as.character(c(seq(2.5,0,-0.5),
                                                        seq(0.5,2.5,0.5))),"m")) +
      coord_flip() +
      scale_fill_brewer(palette = "Set1") + theme_bw()
  })
```
Then we plot the resulting data using `ggplot`.

<!-- --- -->

<!-- ## Lesson Learned -->


<!-- Lesson learned and conclusion: -->

<!-- 1. Modification of data using `melt` is important to enable 2 sides pyramid plotting for `male` and `female` -->
<!-- 2. `reactive` function is necessary. Error message was returned if we don't use this -->

<!-- --- -->



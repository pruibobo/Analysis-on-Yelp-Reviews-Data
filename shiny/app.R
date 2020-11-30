# Shiny App

library(shiny)
library(ggplot2)
library(shinythemes)
library(tidytext)
library(dplyr)
library(data.table)

word_frec=read.csv('../data/word_freq.csv')
colnames(word_frec)=c('word','freq')
data=fread('../data/steak_cleaned.csv')
choice<-c('filet','ribeye','strip','sirloin','porterhouse','tomahawk','skirt','flank','hanger','round','cube')


ui = fluidPage(theme = shinytheme("yeti"),
  shinyUI(
  navbarPage("Steak House Review",
             
    tabPanel("Reviews",
             
      titlePanel("Visualize the Yelp views about steak house."),
      
          sidebarLayout(
            sidebarPanel(
              helpText("Please select the type of steak you serve at your restaurant to see the plot"),
              
              selectInput("type" ,"Type:",choices = choice),
                        ),
            mainPanel(
                h5("Here is the plot of review stars of your type of steak"),
                plotOutput("Starsplot"),
                      )
                         )
              ),
                              
                              tabPanel("Instruction",
                                       h3("Advice on opening a new steak restaurant:"),
                                       h4("In the aspect of steaks:"),
                                       p("1.Focus on tomahawk, skirt, hanger and flank steaks at first and emphasize them on your menu"),
                                       p("2.Filet, ribeye, strip and porterhouse steaks are not bad to consider"),
                                       p("3.Make sirloin, round and cube steaks inconspicuous on your menu or avoid offering them"),
                                       h4("In the aspect of non-food items:"),
                                       p("1.Set up a proper reservation system is important"),
                                       p("2.Offer well-designed attire to your waiters/waitresses"),
                                       p("3.Look for possible locations with outdoor seating"),
                                       p("4.Don’t provide food delivery service"),
                                       p("5.Avoid investing in WiFi or soundproof materials at the beginning"),
                                       p("6.Allocating too much spaces for groups specially is unnecessary"),
                                       br(),
                                       br(),
                                       h3("Advice on improving an existed steak restaurant:"),
                                       h4("In the aspect of steaks:"),
                                       p("1.Try to improve tomahawk, skirt, hanger and flank steaks if one of them has brought your restaurant
many low-star comments since the customers are not so picky about them"),
                                       p("2.Advertise your sirloin, round and cube steaks if one of them has brought your restaurant high-star
comments. It is very praiseworthy to have highly rated sirloin, round and cube steaks"),
                                       h4("In the aspect of non-food items:"),
                                       p("1.Improve or set up your reservation system"),
                                       p("2.Pay attention to the attire of your waiters/waitresses"),
                                       p("3.Check if it’s possible to offer outdoor seating"),
                                       p("4.Don’t provide food delivery service"),
                                       p("5.Allocating too much spaces for groups specially is unnecessary"),
                                  
                              ),
    
  
                              tabPanel("About",
                                       p('This Shiny App is designed by:Peibin Rui'),
                                       p('All questions and suggestions are welcome. Contact these maintainers:'),
                                       p('Huitong Kou (hkou2@wisc.edu) '),
                                       p('Peibin Rui (prui@wisc.edu)'),
                                       p('Zihang Wang (zwang2547@wisc.edu)')
                                      )
)
)
)
server = function(input, output){
  output$Starsplot <- renderImage({
    filename <- normalizePath(file.path('../image',
                                        paste(input$type, '.png', sep='')))
    list(src = filename)
  })
}

shinyApp(ui = ui, server = server)

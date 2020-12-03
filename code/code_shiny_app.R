# Codes for Shiny App

library(shiny)
library(ggplot2)
library(shinythemes)
library(tidytext)
library(dplyr)
library(data.table)

choice<-c('filet','ribeye','strip','sirloin','porterhouse','tomahawk','skirt','flank','hanger','round','cube')
times<-c('breakfast','brunch','lunch','dinner')
others<-c('bread','burger','cake','cheese','lobster','salad','salmon','sandwich','shrimp','sushi')
nonfood<-c('ambiance','parking','price','recommend','reservation','wait')
ui = fluidPage(theme = shinytheme("yeti"),
  shinyUI(
  navbarPage("Steak House Review",
             
    tabPanel("Reviews of differernt cuts of steak",
      
          sidebarLayout(
            sidebarPanel(
              helpText("Please select the cut of steak served at your restaurant to see the plot"),
              
              selectInput("type" ,"Type:",choices = choice),
                       
            
              helpText("Reviews are from restaurants in Madison (U.S.), Cleveland (U.S.)", 
                      "Pittsburgh (U.S.) and Urbana-Champaign (U.S.) released by Yelp."),
              helpText("'corr' is a mathematical measure of how two things associated with each other, 
                        the value is between -1 and 1, -1 and 1 mean they have very strong association 
                        and 0 means they have little association"),
            ),
            mainPanel(
                h5("Here is the plot of review stars of certain cut of steak"),
                plotOutput("Starsplot"),
                br(),
                br(),
                br(),
                br(),
                br(),
                textOutput("steaktext")
                      )
                         )
              ),
    tabPanel("Does time matter?",
             
    sidebarLayout(
      sidebarPanel(
        helpText("Please select the time of the day"),
        
        selectInput("time" ,"Time:",choices = times),
        
        
        helpText("Reviews are from restaurants in Madison (U.S.), Cleveland (U.S.)", 
                 "Pittsburgh (U.S.) and Urbana-Champaign (U.S.) released by Yelp."),
        helpText("'corr' is a mathematical measure of how two things associated with each other, 
                        the value is between -1 and 1, -1 and 1 mean they have very strong association 
                        and 0 means they have little association"),
      ),
      mainPanel(
        h5("Here is the plot of different time of the day"),
        plotOutput("timeplot"),
        br(),
        br(),
        br(),
        br(),
        br(),
        textOutput("timetext")
      )
    )
    ),
    tabPanel("What about other food",

             sidebarLayout(
               sidebarPanel(
                 helpText("Please select the type of other food"),
                 
                 selectInput("foods" ,"Type of food:",choices = others),
                 
                 
                 helpText("Reviews are from restaurants in Madison (U.S.), Cleveland (U.S.)", 
                          "Pittsburgh (U.S.) and Urbana-Champaign (U.S.) released by Yelp."),
                 helpText("'corr' is a mathematical measure of how two things associated with each other, 
                        the value is between -1 and 1, -1 and 1 mean they have very strong association 
                        and 0 means they have little association"),
               ),
               
             
               mainPanel(
                 h5("Here is the plot of how other food related to the reivews"),
                 plotOutput("otherfoodplot"),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 textOutput("otherfoodtext")
               )
             )
    ),
    tabPanel("Non-food factors",
             
             sidebarLayout(
               sidebarPanel(
                 helpText("Please select the aspect"),
                 
                 selectInput("nonfood" ,"Non-food factors:",choices = nonfood),
                 
                 
                 helpText("Reviews are from restaurants in Madison (U.S.), Cleveland (U.S.)", 
                          "Pittsburgh (U.S.) and Urbana-Champaign (U.S.) released by Yelp."),
                 helpText("'corr' is a mathematical measure of how two things associated with each other, 
                        the value is between -1 and 1, -1 and 1 mean they have very strong association 
                        and 0 means they have little association"),
               ),
               
               
               mainPanel(
                 h5("Here is the plot of how non-food factors related to the reivews"),
                 plotOutput("nonfoodplot"),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 textOutput("nonfoodtext")
               )
             )
    ),
                              
      tabPanel("Advice",
                                       h3("Advice on opening a new steak restaurant:"),
                                       h4("In the aspect of steaks:"),
                                       p("1.Focus on tomahawk, skirt, hanger and flank steaks at first and emphasize them on your menu"),
                                       p("2.Filet, ribeye, strip and porterhouse steaks are not bad to consider"),
                                       p("3.Make sirloin, round and cube steaks inconspicuous on your menu or avoid offering them"),
                                       h4("For food other than steaks:"),
                                       p("1.Set a more varied range of wines and beers offered at your restaurant"),
                                       p("2.Make sure the egg and cheese served at your restaurant taste great"),
                                       p("3.Consider hiring patissiers and serve desserts"),
                                       p("4.Salad is important"),
                                       h4("In the aspect of non-food factors:"),
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
                                       h4("For food other than steaks:"),
                                       p("1.Improve the quality of wines and beers"),
                                       p("2.Cheese and salad are always focus points"),
                                       p("3.Start serving desserts may help"),
                                       p("Salad is important"),
                                       h4("In the aspect of non-food factors:"),
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
    filename <- normalizePath(file.path('plots2/steak_type/',
                                        paste(input$type, '.png', sep='')))
    list(src = filename)
  })
  output$steaktext <- renderText({
    filename <- normalizePath(file.path('plots2/steak_type/',
                                        paste(input$type, '.txt', sep='')))
    print(scan(file=filename, what = character(0), sep = "\n"))
  })

  output$timeplot <- renderImage({
    filename <- normalizePath(file.path('plots2/meal_time/',
                                        paste(input$time, '.png', sep='')))
    list(src = filename)
  })
  output$timetext <- renderText({
    filename <- normalizePath(file.path('plots2/meal_time/',
                                        paste(input$time, '.txt', sep='')))
    print(scan(file=filename, what = character(0), sep = "\n"))
  })
  output$otherfoodplot <- renderImage({
    filename <- normalizePath(file.path('plots2/side_order/',
                                        paste(input$foods, '.png', sep='')))
    list(src = filename)
  })
  output$otherfoodtext <- renderText({
    filename <- normalizePath(file.path('plots2/side_order/',
                                        paste(input$foods, '.txt', sep='')))
    print(scan(file=filename, what = character(0), sep = "\n"))
  })
  output$nonfoodplot <- renderImage({
  filename <- normalizePath(file.path('plots2/non_food/',
                                      paste(input$nonfood, '.png', sep='')))
  list(src = filename)
  })
  output$nonfoodtext <- renderText({
  filename <- normalizePath(file.path('plots2/non_food/',
                                      paste(input$nonfood, '.txt', sep='')))
  print(scan(file=filename, what = character(0), sep = "\n"))
  })
}
shinyApp(ui = ui, server = server)

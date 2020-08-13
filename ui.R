library(shiny)

shinyUI(fluidPage(

    titlePanel("Titanic Data"),

    sidebarLayout(
        sidebarPanel(
            checkboxInput("details", "Show Details", value = TRUE),
            selectInput("sex", "Select Sex", choices = c("All", "Male","Female")),
            selectInput("age", "Select Age", choices = c("All", "Child","Adult")),
            selectInput("class", "Select Class", 
                        choices = c("All", "3rd","2nd","1st","Crew")),
            submitButton("Submit")
        ),

        mainPanel(
            plotOutput("plot1"),
            conditionalPanel(condition = "input.details==true",
                             h3("Total number of persons:"),
                             textOutput("total"),
                             h3("Number of Deaths:"),
                             textOutput("dead"),
                             h3("Number of survivors:"),
                             textOutput("survived"))
        )
    )
))

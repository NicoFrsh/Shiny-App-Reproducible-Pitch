library(shiny)

shinyServer(function(input, output) {
    
    data("Titanic")
    
    Titanic <- as.data.frame(Titanic)
    Titanic <- Titanic[rep(1:nrow(Titanic), Titanic$Freq), -5]
    
    output$plot1 <- renderPlot({
        sex <- input$sex
        age <- input$age
        class <- input$class
        
        fillCol <- ifelse(sex == "Male", "#00BFC4", "#F8766D")
        
        library(ggplot2)
        
        
        data <- Titanic
        
        if (sex != "All")
            data <- data[data$Sex == sex, ]
        if (age != "All")
            data <- data[data$Age == age, ]
        if (class != "All")
            data <- data[data$Class == class, ]
        
        if (sex == "All"){
            gg <- ggplot(data = data) + 
                geom_histogram(aes(x = Survived, fill = Sex), stat = "count")
        }
        
        else {
        gg <- ggplot(data = data) +
            geom_histogram(aes(x = Survived), stat = "count", fill = fillCol)
        }
        
        gg <- gg + ggtitle("Deaths on the Titanic")
        gg
    })
    
    output$total <- renderText({
        
        sex <- input$sex
        age <- input$age
        class <- input$class
        
        data <- Titanic
        
        if (sex != "All")
            data <- data[data$Sex == sex, ]
        if (age != "All")
            data <- data[data$Age == age, ]
        if (class != "All")
            data <- data[data$Class == class, ]
        
        nrow(data)
        
    })
    
    output$dead <- renderText({
        
        sex <- input$sex
        age <- input$age
        class <- input$class
        
        data <- Titanic
        
        if (sex != "All")
            data <- data[data$Sex == sex, ]
        if (age != "All")
            data <- data[data$Age == age, ]
        if (class != "All")
            data <- data[data$Class == class, ]
        
        table(data$Survived)[2]
        
    })
    
    output$survived <- renderText({
        
        sex <- input$sex
        age <- input$age
        class <- input$class
        
        data <- Titanic
        
        if (sex != "All")
            data <- data[data$Sex == sex, ]
        if (age != "All")
            data <- data[data$Age == age, ]
        if (class != "All")
            data <- data[data$Class == class, ]
        
        table(data$Survived)[1]
        
    })
    
})

library(DT)

function(input, output, session){
  
  observe({
    print(input$inputulb)
    x <- ulb %>% filter(District == input$inputulb) %>% select(Municipal)
    
    updateSelectInput(session, "inputulb1", "select municipal", choices = unique(x))
  })
  
  dataset <- reactive({ulb %>% filter(District == input$inputulb, Municipal == input$inputulb1)})
  output$data <-  renderTable({
    dataset()
  })
  
  
  dataset1 <- reactive(data %>% filter(district == input$YearSelect))
  output$data1 <-  renderTable({
    dataset1()
  })
  
  dataset2 <- reactive(data_zptc %>% filter(district == input$inputzptc))
  output$data2 <-  renderTable({
    dataset2()
  })
  #structure
  output$structure <- renderPrint(data %>% str())
  
  #table
  output$table1 <- renderDataTable(data %>% filter(district == input$YearSelect))
  
  output$table2 <- renderDataTable(data_zptc %>% filter(district == input$inputzptc))
  
  output$table3 <- renderDataTable(ulb %>% filter(District == input$inputulb, Municipal == input$inputulb1))

 
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(dataset(), file)
    }
  )
  
  
  output$downloading <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(dataset1(), file)
    }
  )
  
  output$downloadit <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(dataset2(), file)
    }
  )
  
  output$map <- renderPlot({plot(shapeData)})
  
  
  output$plots <- renderPlot({data %>% filter(district == input$plotinput) %>% ggplot(aes(x = `Result Status`)) + geom_bar()})
  
}

 

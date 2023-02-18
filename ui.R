
## ui.R ##
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Data", tabName = "data", icon = icon("dashboard"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "data",
        tabBox(width = 12,
         tabPanel(title ="MPTC Elections", icon = icon("address-card"), selectInput(inputId = "YearSelect",label="districts",
                                                                                           
                                                                                       choices = unique(data$district),
                selected = unique(data$district)) ,
                downloadButton("downloading", "Download"),
                  dataTableOutput("table1")),
         
         tabPanel(title ="ZPTC Elections", icon = icon("address-card"), selectInput(inputId = "inputzptc",label="districts",
                                                                                    
                                                                                    choices = unique(data_zptc$district),
                  
                                                                                                                                                   selected = unique(data_zptc$district)) ,
                  downloadButton("downloadit", "Download"),dataTableOutput("table2")),
         
         tabPanel(title ="ULB", icon = icon("address-card"), selectInput(inputId = "inputulb",label="districts",
                                                                                    
                                                                                    choices = unique(ulb$District),
                                                                                    selected = unique(ulb$District)) ,
                  selectInput(inputId = "inputulb1",label="municipal",
                                                                                                                                  
                    choices = NULL),
            downloadButton("downloadData", "Download"),
          dataTableOutput("table3")),
         tabPanel(title="Map", icon = icon("address-card"),  plotOutput("map")), 
         
         
         tabPanel(title = "Visualisation", icon = icon("address-card"),  selectInput(inputId = "plotinput",label="districts",
                                                                                     
                                                                                     choices = unique(data$district)), plotOutput("plots"))
             
    ))
    )
  )


# Put them together into a dashboardPage
dashboardPage(
  dashboardHeader(title = "Telangana Data"),
  sidebar,
  body
)

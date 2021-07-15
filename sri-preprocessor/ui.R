tp1 <- tabPanel('Data Upload', 
                sidebarPanel(
                  fluidRow(
                    fileInput("data_input", "File input:",
                              accept = c("text/csv", 
                                         "text/comma-separated-values,text/plain",".csv"))),
                  fluidRow(
                    conditionalPanel(
                      condition = "output.show_stats",
                      actionButton("stats_preview", "Preview")
                      )
                  )
                  ),
                mainPanel(dataTableOutput("raw_data"))
              )
tp2 <- tabPanel('Analysis')
tp3 <- tabPanel('Models')



fluidPage(
  navbarPage('Yet to be named',
  theme = shinytheme('flatly'),
  tp1,
  tp2,
  tp3))


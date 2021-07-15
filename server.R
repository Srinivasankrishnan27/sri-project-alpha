
# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  

  
  data <- reactiveValues(raw_input = NULL)
  observeEvent(input$data_input,{
    output$show_stats <- reactive({FALSE})
    output$raw_data <- renderDataTable({
    inFile <- input$data_input
    if (is.null(inFile)){
      return(NULL)
    }
    else{
      
      data$raw_input<-read.csv(inFile$datapath)
      output$show_stats <- reactive({nrow(data$raw_input)> 0})
      outputOptions(output, 'show_stats', suspendWhenHidden = FALSE)
      
      datatable(data$raw_input, 
                options = list(orderClasses = TRUE,
                               scrollX = TRUE,
                               scrollY = '65vh',
                               ajax = list(serverSide = TRUE, processing = TRUE)),
                editable='cell')
    }
    
  })
  
  })
  
  observeEvent(input$stats_preview, {
    print(summary.data.frame(data$raw_input))
    showModal(modalDialog(
      title = "Summary",
      output$no_of_records<- renderText({paste0('No. records: ', nrow(data$raw_input))}),
      output$no_of_cols<- renderText({paste0('No. columns: ', length(colnames(data$raw_input)))}),
      
      output$raw_data_summary <- renderTable({
        summary.data.frame(data$raw_input)
      }),
      easyClose = TRUE,
      footer = NULL
    ))
    
  })
  

  
})

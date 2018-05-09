library(shiny)
library(ggplot2)
source("./cleanAndChart.R") 

function(input, output) {
  
  output$plot = renderPlot(
    
    ggplot(formatData(searchParam(input$burst,input$dip)), aes(action, average)) + geom_bar(aes(fill = layer),width = 0.8, position = position_dodge(), stat="identity")+ggtitle(paste0("D1 receptor binding = ",input$burst,"\nD2 receptor binding = ",input$dip))+ theme(plot.title = element_text(size = 20))
  )
  
  
  output$bug = renderDataTable(reusltData)
  output$preImage <- renderImage({
    dip = input$dip
    burst = input$burst
    if(dip == (1 || 2))
    {
      if (dip == 1)
      {
        dip = "1.0"
      }
      else
      {
        dip = "2.0"
      }
    }
    if(burst == (1 || 2))
    {
      if (burst == 1)
      {
        burst = "1.0"
      }
      else
      {
        burst = "2.0"
      }
    }
    filename <- normalizePath(file.path('./img',paste0('Dip', dip," Gain",burst,'.png')),winslash = "/")
    
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image number", input$burst))
    
  }, deleteFile = FALSE)

  
  
  
}
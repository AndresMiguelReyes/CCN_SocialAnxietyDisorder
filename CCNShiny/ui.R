library(shiny)

fluidPage(
  
  titlePanel("Activation Averages of D1 and D2 receptors after 50 epochs"),
  
  sidebarPanel(
    sliderInput('burst', 'D1 Receptor Binding', .1,2.0,1.0,.1),
    sliderInput('dip', 'D2 Receptor Binding', .1,2.0,1.0,.1)
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("plot",plotOutput('plot')),
      tabPanel("output layer",imageOutput("preImage",width = "75%",height="75%"))
    )
  )
)
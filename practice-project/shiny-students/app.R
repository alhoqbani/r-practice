library(shiny)
load('data/students.rda')

ui <- fluidPage(
  title = 'Students Grades Lookup',
  
  h1('Students Shiny Web App', align = 'center'),
  titlePanel('Testing Shiny App'),
  
  fluidRow(column(
    width = 6,
    offset = 3,
    tabsetPanel(
      type = "tabs",
      id = 'tabSet',
      selected = 'quizesInfo',
      
      tabPanel(
        title = 'Look Up By ID',
        value = 'lookUp',
        br(),
        br(),
        
        sidebarLayout(
          sidebarPanel = sidebarPanel(
            textInput('studentId', label = 'Enter Student Id')

          ),
          mainPanel = mainPanel(tableOutput("table"))
        )
      ),
      
      tabPanel(
        title = 'Quizes Info',
        value = 'quizesInfo',
        h3('Data about this semester quizes'),
        hr(),
        radioButtons(
          inputId = 'selectedQuiz',
          label = 'Choose a quiz to show information',
          inline = T,
          choiceNames = paste0('Quiz ', 1:4),
          choiceValues = paste0('quiz.', 1:4, '.score')
        ),
        verbatimTextOutput('quizSummary'),
        plotOutput('quizPlot')
        
      ),
      tabPanel(title = 'Another Thing', value = 'lookUp')
    )
  ))
)


server <- function(input, output, session) {

  output$table <- renderTable({
    
  })
  
  output$quizPlot <- renderPlot({
    quiz <- input$selectedQuiz
    hist(students[[quiz]])
  })
  
  output$quizSummary <- renderPrint({
    summary(students[input$selectedQuiz])
  })
  
  
  
  
  
}

shinyApp(ui, server)
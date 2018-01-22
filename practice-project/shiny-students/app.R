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
      selected = 'lookUp',
      
      tabPanel(
        title = 'Look Up By ID',
        value = 'lookUp',
        br(),
        br(),
        
        fluidRow(
          textInput('studentId', label = 'Enter Student Id'),
          helpText('Example: 17625, 17880, 17575, 17508'),
          actionButton('gotstudentId', 'Go!')
          
        ),
        
        fluidRow(
          tableOutput("st1"), 
          tableOutput('st2'),
          htmlOutput('noresult')
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
  
  observeEvent(input$gotstudentId, {
    
    student <- students[students$student.id == input$studentId,]
    
    if(nrow(student) > 0) {
      output$st1 <-
        renderTable(student[c('name', 'city', 'gender', 'age')])
      output$st2 <-
        renderTable(student[paste0('quiz.', 1:4, '.score')])
    } else {
      output$noresult <- renderText('<h1>No student with this id !!</h1>')
    }
    
  })
  

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
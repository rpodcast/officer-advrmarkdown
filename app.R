# load packages ----
library(shiny)
library(nessy) # remotes::install_github("ColinFay/nessy")
library(officer)
library(magrittr)

# load functions ----
source("utils.R")

# define global vars ----
robot_masters <- c("Metal Man", "Quick Man", "Bubble Man", "Air Man", "Wood Man", "Crash Man", "Flash Man", "Heat Man")
robot_values <- c("metalman", "quickman", "bubbleman", "airman", "woodman", "crashman", "flashman", "heatman")
template_file <- "templates/megaman.pptx"

# user interface ----
ui <- cartridge(
  title = "Megaman Slide Generator!",
  subtitle = "Complete the simple form below",
  footer = "Using the {nessy} package for theme: github.com/ColinFay/nessy",
  tagList(
    container_with_title(
      title = "Basic Information",
      text_input(id = "user_name", label = "Your name")
    ),
    container_with_title(
      title = "Easiest Robot Master",
      radio_buttons("easy_master", NULL, choiceNames = robot_masters, choiceValues = robot_values),
      text_input(id = "easy_attempts", label = "Number of attempts"),
      text_input(id = "easy_why", label = ".input.is-success", type = "success", inline = TRUE, placeholder = "Explain please!")
    ),
    container_with_title(
      title = "Most Difficult Robot Master",
      radio_buttons("difficult_master", NULL, choiceNames = robot_masters, choiceValues = robot_values),
      text_input(id = "difficult_attempts", label = "Number of attempts"),
      text_input(id = "difficult_why", label = ".input.is-success", type = "success", inline = TRUE, placeholder = "Explain please!")
    ),
    container_with_title(
      title = "Generate Slide!",
      downloadButton("download_slide", label = "Download Slide")
      #button_primary("download_slide", "Download your slides!")
    )
  )
)

# server processing ----
server <- function(input, output, session) {
  
  output$download_slide <- downloadHandler(
    filename = function() {
      "megaman_slide_filled.pptx"
    },
    
    content = function(file) {
      my_pres <- create_slides(customer = input$user_name,
                               easy_master = input$easy_master,
                               easy_text = input$easy_why,
                               difficult_master = input$difficult_master,
                               difficult_text = input$difficult_why)
      
      # print object for download
      print(my_pres, target = file)
      
    }
  )
}

shinyApp(ui, server)

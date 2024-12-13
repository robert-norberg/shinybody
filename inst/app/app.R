library(shiny)
library(shinybody)

# read in data
data_path <- system.file("data", "cancer_dataset.csv", package = "shinybody")
df <- read.csv(data_path, header = TRUE)

distinct_patients <- unique(df$sample_id)

ui <- function() {
  fluidPage(
    tags$head(
    tags$style(HTML("
        body {
          font-family: 'Roboto', Arial, sans-serif;
          background-color: #f7f7f7;
          margin: 0;
          padding: 20px;
        }
        .container {
          background-color: #ffffff;
          border-radius: 8px;
          padding: 20px;
          box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
          margin-bottom: 20px;
        }
        h2, h3 {
          color: #2c3e50;
          font-weight: bold;
        }
        label {
          font-weight: bold;
          color: #34495e;
        }
      "))
    ),
    div(
      class = "container",
      h2("Patient Selection"),
      div(
        style = "width: 100%; max-width: 400px;",
        selectInput(
          inputId = "select_patient",
          label = "Select a Patient",
          choices = distinct_patients,
          multiple = FALSE,
          selected = distinct_patients[1]
        )
      )
    ),
    div(
      class = "container",
      h2("Human Body Viewer"),
      humanOutput(outputId = "human")
    ),
  )
}

server <- function(input, output, session) {
  patient_rows <- reactive({
    df[df$sample_id == input$select_patient,]
  })

  output$human <- renderHuman({
    g <- ifelse(unique(patient_rows()$gender) == "F", "female", "male")
    primary_tumor <- unique(patient_rows()$cancer_origin)
    metastases <- unique(patient_rows()$metastasis_area)
    colors <- c("red", rep("blue", length(metastases)))
    names(colors) <- c(primary_tumor, metastases)
    hovertext <- c("Primary Tumor", rep("Metastais", length(metastases)))
    names(hovertext) <- c(primary_tumor, metastases)
    human(
      gender = g,
      shown = c(primary_tumor, metastases),
      selected = primary_tumor,
      show_color = colors,
      select_color = "red",
      hovertext = hovertext
    )
  })

  output$debug <- renderPrint({
    primary_tumor <- unique(patient_rows()$cancer_origin)
    paste(
      "Selected patient's cancer originates from",
      primary_tumor
    )
  })

  observeEvent(input$selected_body_parts, {
    selected_parts <- input$selected_body_parts

    if (length(selected_parts) == 1 && selected_parts == "empty") {
      output$additional_data <- renderPrint({
        "No organs selected."
      })

      session$sendCustomMessage("organ_data_response", list())
      return()
    }

    generated_data <- lapply(selected_parts, function(part) {
      list(
        part = part,
        info = paste("This is additional data for", part),
        description = paste("Description for", part, "goes here."),
        risk_level = sample(c("Low", "Medium", "High"), 1)
      )
    })

    generated_data_df <- do.call(rbind, lapply(generated_data, as.data.frame))

    output$additional_data <- renderPrint({
      generated_data_df
    })

    session$sendCustomMessage("organ_data_response", generated_data)
  })

  observeEvent(input$select_patient, {
    print("meh")
    session$sendCustomMessage("clear_selected_organs", list())
  })
}

shinyApp(ui = ui, server = server)

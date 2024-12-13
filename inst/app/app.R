library(shiny)
library(shinybody)

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
          choices = patients$patient_id,
          multiple = FALSE,
          selected = patients$patient_id[1]
        )
      )
    ),
    div(
      class = "container",
      h2("Patient Information"),
      uiOutput("patient_info")
    ),
    div(
      class = "container",
      h2("Human Body Viewer"),
      humanOutput(outputId = "human")
    ),
  )
}

server <- function(input, output, session) {
  patient_tumors <- reactive({
    tumors[tumors$patient_id == input$select_patient,]
  })
  patient_info <- reactive({
    patients[patients$patient_id == input$select_patient,]
  })

  output$human <- renderHuman({
    g <- patient_info()$gender
    primary_tumor <- patient_tumors()$tumor_location[patient_tumors()$is_primary_tumor]
    metastases <- unique(patient_tumors()$tumor_location[!patient_tumors()$is_primary_tumor])
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
    primary_tumor <- patient_tumors()$tumor_location[patient_tumors()$is_primary_tumor]
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

    filtered_data <- patient_tumors()[patient_tumors()$tumor_location %in% input$selected_body_parts, ]

    generated_data <- lapply(1:nrow(filtered_data), function(i) {
      as.list(filtered_data[i, ])
    })

    output$additional_data <- renderPrint({
      filtered_data
    })
    
    session$sendCustomMessage("organ_data_response", generated_data)
  })

  observeEvent(input$select_patient, {
    session$sendCustomMessage("clear_selected_organs", list())

    output$patient_info <- renderUI({
      info <- patient_info()
      if (nrow(info) == 0) {
        return(div(class = "info-box", p("No patient information available.")))
      }
      exclude_cols <- c("patient_id")
      info <- info[ , !(names(info) %in% exclude_cols), drop = FALSE]

      div(
        class = "info-box",
        style = "margin-top: 20px; padding: 15px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);",
        lapply(1:ncol(info), function(i) {
          column_name <- tools::toTitleCase(colnames(info)[i])
          value <- info[[1, i]]

          div(
            style = "display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;",
            h4(
              style = "margin: 0; color: #2c3e50; font-size: 16px; font-weight: bold;",
              paste(column_name, ":")
            ),
            p(
              style = "margin: 0; font-size: 14px; color: #7f8c8d;",
              value
            )
          )
        })
      )
    })
  })
}

shinyApp(ui = ui, server = server)

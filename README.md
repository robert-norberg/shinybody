
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinybody

<!-- badges: start -->
<!-- badges: end -->

`shinybody` is an `htmlwidget` of the human body that allows you to
hide/show and assign colors to 79 different body parts. The `human`
widget is an `htmlwidget`, so it works in Quarto documents, R Markdown
documents, or anything other HTML medium. It also functions as an
input/output widget in a `shiny` app.

## Installation

You can install the development version of `shinybody` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("robert-norberg/shinybody")
```

## Example

Here is a simple example of using the `human` widget in an R Markdown
document:

``` r
library(shinybody)

example_organs <- c("brain", "eye", "heart", "stomach", "bladder")
my_organ_df <- subset(shinybody::shinybody_organs, organ %in% example_organs)
my_organ_df$show <- TRUE
my_organ_df$color <- grDevices::rainbow(nrow(my_organ_df))
my_organ_df$selected[1] <- TRUE
my_organ_df$hovertext <- mapply(
  function(o, clr) htmltools::strong(tools::toTitleCase(o), style = paste("color:", clr)),
  my_organ_df$organ,
  my_organ_df$color,
  SIMPLIFY = FALSE
)
human(gender = "female", organ_df = my_organ_df)
```

<img src="man/figures/README-demo-1.png" width="100%" />

Here is a complete list of the organs that are available:

    #>                           Male Female
    #> adipose_tissue              ✅     ✅
    #> adrenal_gland               ✅     ✅
    #> amygdala                    ✅     ✅
    #> aorta                       ✅     ✅
    #> appendix                    ✅     ✅
    #> atrial_appendage            ✅     ✅
    #> bladder                     ✅     ✅
    #> bone                        ✅     ✅
    #> bone_marrow                 ✅     ✅
    #> brain                       ✅     ✅
    #> breast                      ✅     ✅
    #> bronchus                    ✅     ✅
    #> caecum                      ✅     ✅
    #> cartilage                   ✅     ✅
    #> cerebellar_hemisphere       ✅     ✅
    #> cerebellum                  ✅     ✅
    #> cerebral_cortex             ✅     ✅
    #> circulatory_system          ✅     ✅
    #> colon                       ✅     ✅
    #> coronary_artery             ✅     ✅
    #> diaphragm                   ✅     ✅
    #> duodenum                    ✅     ✅
    #> ectocervix                  ❌     ✅
    #> endometrium                 ❌     ✅
    #> epididymis                  ✅     ❌
    #> esophagus                   ✅     ✅
    #> eye                         ✅     ✅
    #> fallopian_tube              ❌     ✅
    #> frontal_cortex              ✅     ✅
    #> gall_bladder                ✅     ✅
    #> gastroesophageal_junction   ✅     ✅
    #> heart                       ✅     ✅
    #> ileum                       ✅     ✅
    #> kidney                      ✅     ✅
    #> left_atrium                 ✅     ✅
    #> left_ventricle              ✅     ✅
    #> liver                       ✅     ✅
    #> lung                        ✅     ✅
    #> lymph_node                  ✅     ✅
    #> mitral_valve                ✅     ✅
    #> nasal_pharynx               ✅     ✅
    #> nasal_septum                ✅     ✅
    #> nerve                       ✅     ✅
    #> nose                        ✅     ✅
    #> oral_cavity                 ✅     ✅
    #> ovary                       ❌     ✅
    #> pancreas                    ✅     ✅
    #> parotid_gland               ✅     ✅
    #> penis                       ✅     ❌
    #> pituitary_gland             ✅     ✅
    #> placenta                    ❌     ✅
    #> pleura                      ✅     ✅
    #> prefrontal_cortex           ✅     ✅
    #> prostate_gland              ✅     ❌
    #> pulmonary_valve             ✅     ✅
    #> rectum                      ✅     ✅
    #> renal_cortex                ✅     ✅
    #> salivary_gland              ✅     ✅
    #> seminal_vesicle             ✅     ❌
    #> skeletal_muscle             ✅     ✅
    #> skin                        ✅     ✅
    #> small_intestine             ✅     ✅
    #> smooth_muscle               ✅     ✅
    #> spinal_cord                 ✅     ✅
    #> spleen                      ✅     ✅
    #> stomach                     ✅     ✅
    #> submandibular_gland         ✅     ✅
    #> temporal_lobe               ✅     ✅
    #> testis                      ✅     ❌
    #> throat                      ✅     ✅
    #> thyroid_gland               ✅     ✅
    #> tongue                      ✅     ✅
    #> tonsil                      ✅     ✅
    #> trachea                     ✅     ✅
    #> tricuspid_valve             ✅     ✅
    #> uterine_cervix              ❌     ✅
    #> uterus                      ❌     ✅
    #> vagina                      ❌     ✅
    #> vas_deferens                ✅     ❌

Here is a very simple shiny app using the `human` widget:

``` r
library(shiny)
library(shinybody)

ui <- function() {
  fluidPage(
    selectInput(
      inputId = "gender",
      label = "Select Gender",
      choices = c("male", "female"),
      multiple = FALSE,
      selected = "male"
    ),
    selectInput(
      inputId = "body_parts",
      label = "Select Body Parts to Show",
      choices = names(shinybody:::organ_to_id[["male"]]),
      multiple = TRUE,
      selected = names(shinybody:::organ_to_id[["male"]])[1:5]
    ),
    humanOutput(outputId = "human_widget"),
    verbatimTextOutput(outputId = "clicked_body_part_msg"),
    verbatimTextOutput(outputId = "selected_body_parts_msg")
  )
}

server <- function(input, output, session) {
  observe({
    g <- input$gender
    
    updateSelectInput(
      session = session,
      inputId = "body_parts",
      choices = names(shinybody:::organ_to_id[[g]]),
      selected = names(shinybody:::organ_to_id[[g]])[1:5]
    )
  })
  
  output$human_widget <- renderHuman({
    selected_organ_df <- subset(shinybody::shinybody_organs, organ %in% input$body_parts)
    selected_organ_df$show <- TRUE
    human(
      organ_df = selected_organ_df,
      select_color = "red"
    )
  })
  output$clicked_body_part_msg <- renderPrint({
    paste("You Clicked:", input$clicked_body_part)
  })
  output$selected_body_parts_msg <- renderPrint({
    paste("Selected:", paste(input$selected_body_parts, collapse = ", "))
  })
}

shinyApp(ui = ui, server = server)
```

<img src="man/figures/README-demo-2.png" width="100%" />

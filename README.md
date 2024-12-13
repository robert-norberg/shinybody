
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinybody

<!-- badges: start -->
<!-- badges: end -->

`shinybody` is an `htmlwidget` of the human body that allows you to
hide/show and assign colors to 80 different body parts. The `human`
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

human(
  gender = "female",
  shown = c("trachea", "stomach", "duodenum", "esophagus", "small_intestine"),
  selected = c("esophagus", "duodenum"),
  hovertext = NULL,
  show_color = "black",
  select_color = "yellow"
)
```

<img src="man/figures/README-demo-1.png" width="100%" />

Here is a complete list of the organs that are available:

``` r
organ_names <- sort(union(
  names(shinybody:::organ_to_id[["male"]]),
  names(shinybody:::organ_to_id[["female"]])
))
all_organs <- data.frame(
  row.names = organ_names,
  Male = ifelse(organ_names %in% names(shinybody:::organ_to_id[["male"]]), "✅", "❌"),
  Female = ifelse(organ_names %in% names(shinybody:::organ_to_id[["female"]]), "✅", "❌")
)

all_organs
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
#> leukocyte                   ✅     ❌
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
```

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
    verbatimTextOutput(outputId = "clicked_body_part_msg")
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
    human(
      gender = input$gender,
      shown = input$body_parts,
      selected = NULL,
      show_color = "black",
      select_color = "red",
      hovertext = NULL
    )
  })
  output$clicked_body_part_msg <- renderPrint({
    paste("You Clicked:", input$clicked_body_part)
  })
}

shinyApp(ui = ui, server = server)
```

<img src="man/figures/README-demo-2.png" width="100%" />

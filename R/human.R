organ_to_id <- list(
  male = c(
    "cerebral_cortex" = "UBERON_0000956",
    "pleura" = "UBERON_0000977",
    "brain" = "UBERON_0000955",
    "heart" = "UBERON_0000948",
    "breast" = "UBERON_0000310",
    "thyroid_gland" = "UBERON_0002046",
    "adrenal_gland" = "UBERON_0002369",
    "lymph_node" = "UBERON_0000029",
    "bone_marrow" = "UBERON_0002371",
    "adipose_tissue" = "UBERON_0001013",
    "skeletal_muscle" = "UBERON_0001134",
    "circulatory_system" = "CL_0000738",
    "frontal_cortex" = "UBERON_0001870",
    "temporal_lobe" = "UBERON_0001871",
    "prefrontal_cortex" = "UBERON_0000451",
    "pituitary_gland" = "UBERON_0000007",
    "atrial_appendage" = "UBERON_0006618",
    "aorta" = "UBERON_0000947",
    "coronary_artery" = "UBERON_0001621",
    "gastroesophageal_junction" = "UBERON_0007650",
    "left_ventricle" = "UBERON_0002084",
    "caecum" = "UBERON_0001153",
    "ileum" = "UBERON_0002116",
    "rectum" = "UBERON_0001052",
    "nose" = "UBERON_0000004",
    "tongue" = "UBERON_0001723",
    "left_atrium" = "UBERON_0002079",
    "pulmonary_valve" = "UBERON_0002146",
    "mitral_valve" = "UBERON_0002135",
    "penis" = "UBERON_0000989",
    "vas_deferens" = "UBERON_0001000",
    "seminal_vesicle" = "UBERON_0000998",
    "testis" = "UBERON_0000473",
    "epididymis" = "UBERON_0001301",
    "eye" = "UBERON_0000970",
    "nasal_septum" = "UBERON_0001706",
    "oral_cavity" = "UBERON_0000167",
    "tonsil" = "UBERON_0002372",
    "nasal_pharynx" = "UBERON_0001728",
    "lung" = "UBERON_0002048",
    "spinal_cord" = "UBERON_0002240",
    "amygdala" = "UBERON_0001876",
    "trachea" = "UBERON_0003126",
    "throat" = "UBERON_0000341",
    "bronchus" = "UBERON_0002185",
    "tricuspid_valve" = "UBERON_0002134",
    "diaphragm" = "UBERON_0001103",
    "liver" = "UBERON_0002107",
    "stomach" = "UBERON_0000945",
    "spleen" = "UBERON_0002106",
    "duodenum" = "UBERON_0002114",
    "gall_bladder" = "UBERON_0002110",
    "pancreas" = "UBERON_0001264",
    "colon" = "UBERON_0001155",
    "small_intestine" = "UBERON_0002108",
    "appendix" = "UBERON_0001154",
    "smooth_muscle" = "UBERON_0001135",
    "bladder" = "UBERON_0001255",
    "prostate_gland" = "UBERON_0002367",
    "nerve" = "UBERON_0001021",
    "cerebellum" = "UBERON_0002037",
    "cerebellar_hemisphere" = "UBERON_0002245",
    "kidney" = "UBERON_0002113",
    "renal_cortex" = "UBERON_0001225",
    "bone" = "UBERON_0002481",
    "cartilage" = "UBERON_0007844",
    "esophagus" = "UBERON_0001043",
    "salivary_gland" = "UBERON_0001044",
    "parotid_gland" = "UBERON_0001831",
    "submandibular_gland" = "UBERON_0001736",
    "skin" = "UBERON_0000014"
  ),
  female = c(
    "parotid_gland" = "UBERON_0001831",
    "adipose_tissue" = "UBERON_0001013",
    "heart" = "UBERON_0000948",
    "smooth_muscle" = "UBERON_0001135",
    "brain" = "UBERON_0000955",
    "breast" = "UBERON_0000310",
    "adrenal_gland" = "UBERON_0002369",
    "pancreas" = "UBERON_0001264",
    "liver" = "UBERON_0002107",
    "colon" = "UBERON_0001155",
    "lymph_node" = "UBERON_0000029",
    "bone_marrow" = "UBERON_0002371",
    "skeletal_muscle" = "UBERON_0001134",
    "circulatory_system" = "CL_0000738",
    "ovary" = "UBERON_0000992",
    "bladder" = "UBERON_0001255",
    "stomach" = "UBERON_0000945",
    "duodenum" = "UBERON_0002114",
    "esophagus" = "UBERON_0001043",
    "gall_bladder" = "UBERON_0002110",
    "spleen" = "UBERON_0002106",
    "small_intestine" = "UBERON_0002108",
    "placenta" = "UBERON_0001987",
    "salivary_gland" = "UBERON_0001044",
    "endometrium" = "UBERON_0001295",
    "fallopian_tube" = "UBERON_0003889",
    "uterus" = "UBERON_0000995",
    "uterine_cervix" = "UBERON_0000002",
    "vagina" = "UBERON_0000996",
    "aorta" = "UBERON_0000947",
    "nerve" = "UBERON_0001021",
    "pituitary_gland" = "UBERON_0000007",
    "atrial_appendage" = "UBERON_0006618",
    "ectocervix" = "UBERON_0012249",
    "gastroesophageal_junction" = "UBERON_0007650",
    "caecum" = "UBERON_0001153",
    "appendix" = "UBERON_0001154",
    "ileum" = "UBERON_0002116",
    "left_atrium" = "UBERON_0002079",
    "left_ventricle" = "UBERON_0002084",
    "pulmonary_valve" = "UBERON_0002146",
    "mitral_valve" = "UBERON_0002135",
    "diaphragm" = "UBERON_0001103",
    "pleura" = "UBERON_0000977",
    "bone" = "UBERON_0002481",
    "cartilage" = "UBERON_0007844",
    "bronchus" = "UBERON_0002185",
    "trachea" = "UBERON_0003126",
    "lung" = "UBERON_0002048",
    "spinal_cord" = "UBERON_0002240",
    "throat" = "UBERON_0000341",
    "rectum" = "UBERON_0001052",
    "nasal_septum" = "UBERON_0001706",
    "nasal_pharynx" = "UBERON_0001728",
    "oral_cavity" = "UBERON_0000167",
    "tongue" = "UBERON_0001723",
    "tonsil" = "UBERON_0002372",
    "eye" = "UBERON_0000970",
    "cerebellum" = "UBERON_0002037",
    "cerebellar_hemisphere" = "UBERON_0002245",
    "prefrontal_cortex" = "UBERON_0000451",
    "frontal_cortex" = "UBERON_0001870",
    "nose" = "UBERON_0000004",
    "temporal_lobe" = "UBERON_0001871",
    "cerebral_cortex" = "UBERON_0000956",
    "amygdala" = "UBERON_0001876",
    "kidney" = "UBERON_0002113",
    "renal_cortex" = "UBERON_0001225",
    "coronary_artery" = "UBERON_0001621",
    "submandibular_gland" = "UBERON_0001736",
    "tricuspid_valve" = "UBERON_0002134",
    "thyroid_gland" = "UBERON_0002046",
    "skin" = "UBERON_0000014"
  )
)

#' Interactive Human Body Widget
#'
#' This widget visualizes an SVG-based human body, highlights specific body
#' parts, and displays associated participant data.
#'
#' @param gender One of "male" or "female"
#' @param organ_df A data.frame with at least an `organ` column, and optionally
#' the following columns:
#' * `show`: A logical (Boolean) column indicating whether or not each organ
#' should be visible. If absent, all organs will be shown.
#' * `selected`: A logical (Boolean) column indicating whether or not each
#' organ should be in a "selected" state. If absent, no organs will be selected.
#' * `hovertext`: A character column or a column containing `shiny.tag`
#' objects. This will be the contents of the tooltip that appears when the organ
#' is hovered over. If absent, the tooltip will contain the title-cased name of
#' the organ (underscores replaced with spaces).
#' * `color`: A character column indicating the color of the organ. If absent,
#' all organs will be shown in black.
#' If `organ_df` has other columns, these will be ignored.
#' @param select_color The color that should be applied to organs with the
#' "selected" state (activated by clicking the organ and deactivated by clicking
#' again).
#' @param width Widget width
#' @param height Widget height
#' @param elementId ID of the widget
#'
#' @returns An object of class `human` and class `htmlwidget`.
#'
#' @import htmlwidgets
#'
#' @export
#'
#' @examples
#' example_organs <- c("brain", "eye", "heart", "stomach", "bladder")
#' my_organ_df <- subset(shinybody_organs, organ %in% example_organs)
#' my_organ_df$show <- TRUE
#' my_organ_df$color <- grDevices::rainbow(nrow(my_organ_df))
#' my_organ_df$selected[1] <- TRUE
#' my_organ_df$hovertext <- mapply(
#'   function(o, clr) htmltools::strong(
#'     tools::toTitleCase(o),
#'     style = paste("color:", clr)
#'   ),
#'   my_organ_df$organ,
#'   my_organ_df$color,
#'   SIMPLIFY = FALSE
#' )
#' human(gender = "female", organ_df = my_organ_df)
human <- function(
    gender = c("male", "female"),
    organ_df,
    select_color = "yellow",
    width = NULL,
    height = NULL,
    elementId = NULL) {
  gender <- match.arg(gender, choices = c("male", "female"), several.ok = FALSE)
  organ_to_id_map <- organ_to_id[[gender]]
  if (crosstalk::is.SharedData(organ_df)) {
    key <- organ_df$key()
    group <- organ_df$groupName()
    organ_df <- organ_df$origData()
  } else if (is.data.frame(organ_df)) {
    key <- NULL
    group <- NULL
  } else {
    stop("organ_df must be a data.frame or a crosstalk sharedData object")
  }
  stopifnot("organ" %in% names(organ_df))
  if (anyDuplicated(organ_df$organ)) {
    duplicated_organs <- organ_df$organ[duplicated(organ_df$organ)]
    err_msg <- paste(
      "The following organs appear in `organ_df` more than once:",
      paste(duplicated_organs, collapse = ", ")
    )
    stop(err_msg)
  }

  if ("show" %in% names(organ_df)) {
    stopifnot(is.logical(organ_df$show))
    organs_to_show <- organ_df$organ[organ_df$show]
  } else {
    organ_df$show <- TRUE
    organs_to_show <- organ_df$organ
  }
  stopifnot(all(organs_to_show %in% names(organ_to_id_map)))

  if ("selected" %in% names(organ_df)) {
    stopifnot(is.logical(organ_df$selected))
    organs_selected <- organ_df$organ[organ_df$selected]
    selected_not_shown <- organs_selected[!organs_selected %in% organs_to_show]
    if (length(selected_not_shown) > 0) {
      warning_msg <- paste(
        "The following organs are selected, but not shown:",
        paste(selected_not_shown, collapse = ", ")
      )
      warning(warning_msg)
      organs_selected <- organs_selected[organs_selected %in% organs_to_show]
      organ_df$selected[organ_df$organ %in% selected_not_shown] <- FALSE
    }
  } else {
    organs_selected <- c()
    organ_df$selected <- FALSE
  }

  if ("hovertext" %in% names(organ_df)) {
    if (is.list(organ_df$hovertext)) {
      organ_df$hovertext <- sapply(organ_df$hovertext, as.character)
    }
  } else {
    organ_df$hovertext <- tools::toTitleCase(gsub("_", " ", organ_df$organ))
  }

  if ("color" %in% names(organ_df)) {
    set_colors <- TRUE
    organ_df$color <- htmltools::parseCssColors(organ_df$color, mustWork = FALSE)
    organs_w_invalid_color <- organ_df$organ[is.na(organ_df$color)]
    if (length(organs_w_invalid_color) > 0) {
      warning_msg <- paste(
        "The following organs have invalid colors specified:",
        paste(organs_w_invalid_color, collapse = ", ")
      )
      warning(warning_msg)
      organ_df$color[is.na(organ_df$color)] <- "#A9A9A9" # dark grey
    }

  } else {
    set_colors <- FALSE
    organ_df$color <- "#000000" # black
  }

  organ_df$organ_id <- sapply(organ_df$organ, function(o) organ_to_id_map[[o]])

  if (gender == "male") {
    svg_file <- system.file("svgs", "homo_sapiens_male.svg", package = "shinybody")
  } else {
    svg_file <- system.file("svgs", "homo_sapiens_female.svg", package = "shinybody")
  }
  svg_text <- paste(readLines(svg_file), collapse = "\n")

  x = list(
    organs = organ_df,
    select_color = select_color,
    settings = list(
      crosstalk_key = key,
      crosstalk_group = group
    ),
    svg_text = svg_text
  )

  htmltools::browsable(
    htmlwidgets::createWidget(
      name = 'human',
      x,
      width = width,
      height = height,
      package = 'shinybody',
      dependencies = crosstalk::crosstalkLibs(),
      elementId = elementId
    )
  )
}

#' Shiny bindings for human
#'
#' Output and render functions for using human within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a human
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @returns A `shiny.tag.list` object (in the case of `humanOutput`) or a
#' `shiny.render.function` object (in the case of `renderHuman`).
#'
#' @name human-shiny
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   ui <- function() {
#'     fluidPage(
#'       selectInput(
#'         inputId = "gender",
#'         label = "Select Gender",
#'         choices = c("male", "female"),
#'         multiple = FALSE,
#'         selected = "male"
#'       ),
#'       selectInput(
#'         inputId = "body_parts",
#'         label = "Select Body Parts to Show",
#'         choices = names(shinybody:::organ_to_id[["male"]]),
#'         multiple = TRUE,
#'         selected = names(shinybody:::organ_to_id[["male"]])[1:5]
#'       ),
#'       humanOutput(outputId = "human_widget"),
#'       verbatimTextOutput(outputId = "clicked_body_part_msg"),
#'       verbatimTextOutput(outputId = "selected_body_parts_msg")
#'     )
#'   }
#'
#'   server <- function(input, output, session) {
#'     observe({
#'       g <- input$gender
#'
#'       updateSelectInput(
#'         session = session,
#'         inputId = "body_parts",
#'         choices = names(shinybody:::organ_to_id[[g]]),
#'         selected = names(shinybody:::organ_to_id[[g]])[1:5]
#'       )
#'     })
#'
#'     output$human_widget <- renderHuman({
#'       selected_organ_df <- subset(
#'         shinybody::shinybody_organs,
#'         organ %in% input$body_parts
#'       )
#'       selected_organ_df$show <- TRUE
#'       human(
#'         organ_df = selected_organ_df,
#'         select_color = "red"
#'       )
#'     })
#'     output$clicked_body_part_msg <- renderPrint({
#'       paste("You Clicked:", input$clicked_body_part)
#'     })
#'     output$selected_body_parts_msg <- renderPrint({
#'       paste("Selected:", paste(input$selected_body_parts, collapse = ", "))
#'     })
#'   }
#'
#'   shinyApp(ui = ui, server = server)
#' }
humanOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'human', width, height, package = 'shinybody')
}

#' @rdname human-shiny
#' @export
renderHuman <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, humanOutput, env, quoted = TRUE)
}

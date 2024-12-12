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
    "leukocyte" = "CL_0000738",
    "frontal_cortex" = "UBERON_0001870",
    "temporal_lobe" = "UBERON_0001871",
    "prefrontal_cortex" = "UBERON_0000451",
    "pituitary_gland" = "UBERON_0000007",
    "atrial_appendage" = "UBERON_0006618",
    "aorta" = "UBERON_0000947",
    "coronary_artery" = "UBERON_0001621",
    "gastroesophageal_junction" = "UBERON_0007650",
    "left_ventricle" = "UBERON_0002084",
    "hippocampus" = "UBERON_0002421",
    "title120" = "UBERON_0001954",
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
    "urinary_bladder" = "UBERON_0001255",
    "prostate_gland" = "UBERON_0002367",
    "nerve" = "UBERON_0001021",
    "cerebellum" = "UBERON_0002037",
    "cerebellar_hemisphere" = "UBERON_0002245",
    "kidney" = "UBERON_0002113",
    "renal_cortex" = "UBERON_0001225",
    "bone" = "UBERON_00024818",
    "cartilage" = "UBERON_0007844",
    "esophagus" = "UBERON_0001043",
    "salivary_gland" = "UBERON_0001044",
    "parotid_gland" = "UBERON_0001831",
    "submandibular_gland" = "UBERON_0001736",
    "skin" = "UBERON_0000014"
  ),
  female = c(
    "parotid" = "gland UBERON_0001831",
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
    "ovary" = "UBERON_0000992",
    "leukocyte" = "CL_0000738",
    "blood" = "UBERON_0000178",
    "artery" = "UBERON_0001637",
    "B_cell" = "CL_0000236",
    "T_cell" = "CL_0000084",
    "natural_killer_cell" = "CL_0000623",
    "monocyte" = "CL_0000576",
    "platelet" = "CL_0000233",
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
    "hippocampus" = "UBERON_0002421",
    "title315" = "UBERON_0001954",
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
    "throat" = "UBERON_0000341",
    "rectum" = "UBERON_0001052",
    "nasal_septum" = "UBERON_0001706",
    "nasal_pharynx" = "UBERON_0001728",
    "oral_cavity" = "UBERON_0000167",
    "tongue" = "UBERON_0001723",
    "tonsil" = "UBERON_0002372",
    "eye" = "UBERON_0000970",
    "retina" = "UBERON_0000966",
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
    "coronary" = "artery UBERON_0001621",
    "submandibular_gland" = "UBERON_0001736",
    "tricuspid_valve" = "UBERON_0002134",
    "thyroid_gland" = "UBERON_0002046",
    "skin" = "UBERON_0000014"
  )
)

#' Interactive Human Body Widget
#'
#' This widget visualizes an SVG-based human body, highlights specific body parts,
#' and displays associated participant data.
#'
#' @import htmlwidgets
#'
#' @export
human <- function(
    gender = c("male", "female"),
    shown = "thyroid_gland",
    highlighted = "adrenal_gland",
    selected = c(),
    width = NULL,
    height = NULL,
    elementId = NULL) {
  gender <- match.arg(gender, choices = c("male", "female"), several.ok = FALSE)
  organ_to_id_map <- organ_to_id[[gender]]
  shown <- match.arg(shown, choices = names(organ_to_id_map), several.ok = TRUE)
  highlighted <- match.arg(highlighted, choices = names(organ_to_id_map), several.ok = TRUE)
  selected <- match.arg(selected, choices = names(organ_to_id_map), several.ok = TRUE)

  if (gender == "male") {
    svg_file <- system.file("svgs", "homo_sapiens_male.svg", package = "shinybody")
  } else {
    svg_file <- system.file("svgs", "homo_sapiens_female.svg", package = "shinybody")
  }
  svg_text <- paste(readLines(svg_file), collapse = "\n")

  shown_ids <- organ_to_id_map[shown]
  names(shown_ids) <- NULL
  highlighted_ids <- organ_to_id_map[highlighted]
  names(highlighted_ids) <- NULL
  selected_ids <- organ_to_id_map[selected]
  names(selected_ids) <- NULL

  x = list(
    shown = list(shown_ids),
    highlighted  = list(highlighted_ids),
    selected = list(selected_ids),
    svg_text = svg_text
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'human',
    x,
    width = width,
    height = height,
    package = 'shinybody',
    elementId = elementId
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
#' @name human-shiny
#'
#' @export
humanOutput <- function(outputId, width = '100%', height = '400px') {
  htmlwidgets::shinyWidgetOutput(outputId, 'human', width, height, package = 'shinybody')
}

#' @rdname human-shiny
#' @export
renderHuman <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, humanOutput, env, quoted = TRUE)
}


displayParticipants <- function(participants) {

  if (!"data.frame" %in% class(participants)) {
    stop("'participants' must be a data frame.")
  }

  if (!all(c("id", "gender", "selected_parts") %in% colnames(participants))) {
    stop("The data frame must contain 'id', 'gender', and 'selected_parts' columns.")
  }

  to_ret <- tagList()
  for (i in seq_len(nrow(participants))) {
    id <- participants$id[i]
    gender <- participants$gender[i]
    selected_parts <- unlist(strsplit(participants$selected_parts[i], ", "))
    info_widget <- tagList(
      tags$b(paste("Participant ID:", id)),
      tags$b(paste("Gender:", gender)),
      tags$b(paste("Affected Body Parts:", participants$selected_parts[i]))
    )
    body_widget <- human(gender = gender, shown = selected_parts, elementId = paste0("participant_", id))

    participant_panel <- tagList(info_widget, body_widget)
    to_ret[[length(to_ret) + 1]] <- participant_panel
  }
  to_ret
}


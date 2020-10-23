#' Launch a shiny app about Australia coronavirus 
#' 
#' @return A shiny app contains case data about Australia coronavirus 
#' 
#' @export
launch_app <- function() {
  appDir <- system.file("app", package = "AustraliaCOVID19")
  if (appDir == "") {
    stop("Could not find app directory. Try re-installing `AustraliaCOVID19`.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}

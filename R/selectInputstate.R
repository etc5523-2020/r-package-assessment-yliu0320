#' Get the different states in Australia
#'
#' @return The name list of different states 
#' 
#' @export
selectInputstate <- function(id) {
  selectInput(id,
              label=id,
              choices = c("Australian Capital Territory",
                                      "New South Wales", 
                                      "Northern Territory",
                                      "Queensland", 
                                      "South Australia", 
                                      "Tasmania",
                                      "Victoria", 
                                      "Western Australia"),
              selected = "Victoria")
}
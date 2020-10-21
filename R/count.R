#' Count the number of states in a dataset
#'
#' @param data A dataset containing a `State` column.
#' 
#' 
#' @export
n_states <- function(data) {
  dplyr::n_distinct(data$State)
}
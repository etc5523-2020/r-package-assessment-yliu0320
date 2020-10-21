#' Count the number of states in a dataset
#'
#' @param data A dataset containing a `State` column.
#' 
#' @examples 
#' n_states(coronavirus_region)
#' 
#' @export
n_states <- function(data) {
  dplyr::n_distinct(data$State)
}
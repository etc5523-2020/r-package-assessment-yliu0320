globalVariables("dateRangeInput")
#' Create a date range input
#' 
#' @return It shows a date range input in shiny app and related interactive plots and table.
#' @return If the input in user interface does not satisfy the condition,the shiny app will not display the plots and table. 
#' @param starttime the beginning of the date
#' @param endtime   the end of the date
#' 
#' @export
dateselection <- function(starttime,endtime){
  if (starttime<endtime){
    dateRangeInput(
    "date", 
    label = "Date", 
    start = starttime,
    end = endtime
  ) 
  }
 
}

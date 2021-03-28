
#' tableRtoNamedList function
#'
#' This function uses the \code{\link{tableR}}, or \code{\link{NHStableR}} parent function to return a table of elements
#' and returns the table as a named list. Named vector can be used with functions such as fct_rename from the forcats package to
#' name a coded list with factor names that are meaningful, without needing to add addition data columns using 'join'.  Additional factor
#' functions can then be applied to group factors.
#'
#' @param ... Function forwarding to parent function to pass additional arguments to function (e.g. url, xpath, data_element, title, add_zero_prefix)
#' @param table_method The function to be called (either "\code{\link{tableR}}" or "\code{\link{NHStableR}}"), defaults to tableR
#' @param code the name of the data item that contains the code, defaults to "Code" as used in the NHS data dictionary
#' @param description the name of the data item that contains the description, defaults to "Description" as used in the NHS data dictionary
#' @importFrom magrittr %>%
#' @importFrom dplyr tibble
#' @importFrom purrr set_names
#' @include tableR.R
#' @include NHStableR.R
#' @return A named vector (class vector) output from the results of the web scrape
#' \itemize{
#'   \item result - a named vector of codes and descriptions.
#' }
#' @examples
#' tableRtoNamedList("ACCOMMODATION STATUS CODE", table_method="NHStableR")
#' # Returns a named with the Code and Description from https://datadictionary.nhs.uk/data_elements/accommodation_status_code.html
#'
#'
#' @export
#'

tableRtoNamedList <- function(..., table_method = "tableR", code = "Code", description = "Description"){

  callfunc <- match.fun(table_method)
  callfunc(...) -> result
  purrr::set_names(result[[code]], result[[description]]) -> return_list

  try(return(return_list), silent=F)
}



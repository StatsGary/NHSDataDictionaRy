#' openSafely_listR function
#'
#' This function uses the \code{\link{tableR}} parent function to return a table of elements, specifically from the OpenSafely Code List
#' \url{https://codelists.opensafely.org/}
#'
#' @param list_name The code list ID from \url{https://codelists.opensafely.org/} for which to return the National table of elements, for example
#' "opensafely/ace-inhibitor-medications"
#' @param version The version of the code list if not the most recent
#' @param ... Function forwarding to parent function to pass additional arguments to function (e.g. title, add_zero_prefix)
#' @importFrom magrittr %>%
#' @importFrom dplyr tibble
#' @importFrom rvest html_node html_text
#' @importFrom xml2 read_html
#' @include tableR.R right_xl.R left_xl.R mid_xl.R
#' @return A tibble (class data.frame) output from the results of the web scrape
#' \itemize{
#'   \item type - the OpenSafely type
#'   \item id - the id for the OpenSafely element
#'   \item bnf_code - British Nationa Formulary - NICE guidelines code
#'   \item nm - medicine type, dosage and manufacturer
#'   \item Dict_type - title specified for dictionary
#'   \item DttmExtracted - the date and time the code set was extracted
#' }
#' @examples
#' openSafely_listR("opensafely/ace-inhibitor-medications")
#' #Pull back current list
#' openSafely_listR("opensafely/ace-inhibitor-medications", "2020-05-19")
#' #Pull back list with date
#'
#' @export
#'

openSafely_listR <- function(list_name, version = "", ...){

  if (is.null(list_name) | list_name == "" | length(list_name)==0){
    stop("The list name name must be specified. The list name can be obtained from https://codelists.opensafely.org/")
  }

  if (!is.character(list_name)){
    stop("The list name is not of data type character. Please make sure data type characters are used.")
  }

  if ((list_name)!= tolower(list_name)){
    warning("The list name is not all in lowercase. The element name has been changed to lower case to match OpenSafety url structure.")
    list_name <- tolower(list_name)
  }

  if (right_xl(list_name, 1) == "/"){
    #list_names should not have a trailing / - so remove it.
    list_name <- left_xl(list_name, len_xl(list_name) -1)
  }

  tableR(url= paste0("https://codelists.opensafely.org/codelist/", list_name, "/", version),
         xpath = '//*[@id="js-codelist-table"]', ...
         ) -> return_df

  # Open safely table structure does not put the <th> inside a <tr> tag so the colums are given as X1, X2 etc.  Load them and
  # fix it
  xml2::read_html(paste0("https://codelists.opensafely.org/codelist/", list_name, "/", version)) %>%
    rvest::html_nodes(xpath = '//*[@id="js-codelist-table"]//th') %>%
    rvest::html_text() -> header

  colnames(return_df) <- c(header, colnames(return_df)[length(header)+1:length(colnames(return_df))])

  try(return(return_df), silent=F)

}


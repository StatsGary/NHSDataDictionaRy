
#' NHStableR function
#'
#' This function uses the tableR parent function to return a table of elements, specifically from the NHS Data Dictionary
#'
#' @param link_name The URL of the website to scrape the table element from
#' @param ... Function forwarding to parent function to pass additional arguments to function (e.g. title, add_zero_prefix)
#' @importFrom magrittr %>%
#' @importFrom dplyr tibble
#' @include tableR.R
#' @return A tibble (class data.frame) output from the results of the web scrape
#' \itemize{
#'   \item result - the extracted html table from url and xpath passed
#'   \item DictType - defaults to Not Specified if nothing passed, however allows for custom dictionary / data frame tags to be created
#'   \item DttmExtracted - a date and time stamp
#' }
#' @export
#'

NHStableR <- function(data_element_name, ...){

  if (is.null(data_element_name) | data_element_name == "" | length(data_element_name)==0){
    stop("The data element name must be specified. The element name can be obtained from https://datadictionary.nhs.uk/data_elements")
  }

  if (!is.character(data_element_name)){
    stop("The data element name is not of data type character. Please make sure data type characters are used.")
  }

  if ((data_element_name)!= toupper(data_element_name)){
    warning("The data element name is not all in uppercase. The element name has been capitalised to match the NHS datadictionary standard.")
  }

  nhs_data_lookup <- nhs_data_elements()

  tableR(nhs_data_lookup$full_url[nhs_data_lookup$link_name == data_element_name],
         nhs_data_lookup$xpath_nat_code[nhs_data_lookup$link_name == data_element_name] ) -> return_df

  try(return(return_df), silent=F)

}



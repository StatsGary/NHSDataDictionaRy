
#' nhs_table_findeR function
#'
#' This function uses the \code{\link{tableR}} parent function to return a table of elements, specifically from the NHS Data Dictionary
#'
#' @param data_element_name The data element name from NHS Data Dictionation i.e. ACCOMMODATION STATUS CODE
#' @param ... Function forwarding to parent function to pass additional arguments to function (e.g. title, add_zero_prefix)
#' @importFrom magrittr %>%
#' @importFrom dplyr tibble
#' @include tableR.R nhs_data_elements.R
#' @return A tibble (class data.frame) output from the results of the web scrape
#' \itemize{
#'   \item result - the extracted national HTML code table from the element page of the NHS Data Dictionary
#'   \item DictType - defaults to Not Specified if nothing passed, however allows for custom dictionary / data frame tags to be created
#'   \item DttmExtracted - a date and time stamp
#' }
#' @examples
#' #Returns a tibble from tableR parent function
#' nhs_table_findeR("ACCOMMODATION STATUS CODE", title="ACCOM_STATUS")
#' nhs_table_findeR("accommodation status code") #Changes case to match

#'
#' @export
#'

nhs_table_findeR <- function(data_element_name, ...){

  if (is.null(data_element_name) | data_element_name == "" | length(data_element_name)==0){
    stop("The data element name must be specified. The element name can be obtained from https://datadictionary.nhs.uk/data_elements")
  }

  if (!is.character(data_element_name)){
    stop("The data element name is not of data type character. Please make sure data type characters are used.")
  }
  #Bring back the data elements required
  nhs_data_lookup <- NHSDataDictionaRy::nhs_data_elements()
  # Bring back the data element names
  data_element_name <- toupper(data_element_name)

  NHSDataDictionaRy::tableR(nhs_data_lookup$full_url[nhs_data_lookup$link_name == data_element_name],
         nhs_data_lookup$xpath_nat_code[nhs_data_lookup$link_name == data_element_name],
         ... ) -> return_df

  return(return_df)

}



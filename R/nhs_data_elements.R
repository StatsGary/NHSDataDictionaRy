

#' NHS data elements method
#'
#' Searches all the data elements in the data element index of the NHS data dictionary and returns the links.
#'
#' This function has no input parameters and returns the
#'
#' @include linkScrapeR.R
#' @importFrom rvest html_nodes html_table html_text
#' @importFrom dplyr tibble filter
#' @importFrom magrittr %>%
#' @importFrom stringr str_detect str_locate
#' @return A tibble (class data frame) with the results of scraping the NHS Data Dictionary website for the data elements look ups, if no return this will produce an appropriate informational message.
#' \itemize{
#'   \item link_name - the name of the scraped link. This relates to the actual name of the data element from the NHS Data Dictionary.
#'   \item url - the url passed to the parameter
#'   \item full_url - the full url of where the data element is on the NHS Data Dictionary website
#'   \item xpath_nat_code - utilises the element in the website and appends the link_short - to pull back only national codes from the dictionary site. NOTE: not all of the returns will have national code tables.
#'   \item xpath_default_codes - pulls back the data dictionary default codes - these can be then used with the national codes
#'   \item xpath_also_known - pulls back the data dictionary elements alias table - this will be available for all data elements
#'
#' }
#' @export
#' @examples
#' nhs_data_lookup <- nhs_data_elements()
#' head(nhs_data_lookup, 10)

nhs_data_elements <- function(){
  link_name <- NULL
  mainweb <- "https://datadictionary.nhs.uk/data_elements_overview.html#dataElement_overview"
  list_links <- NHSDataDictionaRy::linkScrapeR(mainweb) #Returns the results of the linkScraperR

  if(nrow(list_links) <1){
    print("The list links has not been successful on this occassion. There is an issue with the linkScrapeR function")
    stop()
  }

  list_links <- list_links %>%
    dplyr::filter(link_name!="Data Elements",
                  stringr::str_detect(url, "data_elements"),
                  !stringr::str_detect(url, "https"),
                  nchar(link_name) > 1) #This code is needed to filter out spurious results
  # Create a composite string from the url
  extracted_string <- substr(list_links$url,
                             stringr::str_locate(list_links$url,"/")[1]+1,
                             as.numeric(length(list_links$url)))
  html_loc <- as.integer(unlist(as.data.frame(stringr::str_locate(extracted_string, ".html"))[1]))
  extracted_string_amend <- substr(extracted_string,1, html_loc-1)
  list_links$full_url <- as.character(paste0("https://datadictionary.nhs.uk/", list_links$url))
  list_links$xpath_nat_code <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.national_codes\"]/div/div/table')
  list_links$xpath_default_codes <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.default_codes\"]/div/div/table')
  list_links$xpath_also_known <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.also_known_as\"]/div/div/table')


  # Pull back default codes if there are national codes available

  return(list_links)
}








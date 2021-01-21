

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
#'   \item link_short - extracted from the data_elements top level, returning the level down from the data_elements level in the website DOM
#'   \item full_url - the full url of where the data element is on the NHS Data Dictionary website
#'   \item xpath_perm_code - utilises the element in the website and appends the link_short - to pull back only permitted codes from the website. This will produce an appropriate error if there is no return.
#' }
#' @export
#' @examples
#' nhs_data_lookup <- nhs_data_elements()
#' head(nhs_data_lookup, 10)

nhs_data_elements <- function(){
  link_name <- NULL
  mainweb <- "https://datadictionary.nhs.uk/data_elements_overview.html#dataElement_overview"
  list_links <- linkScrapeR(mainweb) %>%
    dplyr::filter(stringr::str_detect(url, 'data_elements'), #Filters out links in table that are not data elements
                  link_name!= "Data Elements", #Filters out the link of the website
                  nchar(link_name) > 1)

  extracted_string <- substr(list_links$url,
                             stringr::str_locate(list_links$url,"/")[1]+1,
                             as.numeric(length(list_links$url)))
  html_loc <- as.integer(unlist(as.data.frame(stringr::str_locate(extracted_string, ".html"))[1]))
  extracted_string_amend <- substr(extracted_string,1, html_loc-1)
  list_links$link_short <- extracted_string_amend
  list_links$full_url <- as.character(paste0("https://datadictionary.nhs.uk/data_elements/", extracted_string))

  list_links$xpath_perm_code <- paste0("//*[@id=", "\"element_",extracted_string_amend, '.permitted_codes\"]/div/div/table')

  return(list_links)
}









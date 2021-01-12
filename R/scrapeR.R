
#' ScrapeR - scrape web information with scrapeR
#'
#' Takes the url and xpath and scrapes HTML table elements from a website.
#'
#' This function is specifically designed to work with HTML tables and x path links through to direct HTML elements.
#' The function is versatile and can be used on any URL where an xpath can be obtained through the URL and HTML inspection process.
#'
#' @param url Website address to connect to
#' @param xpath Xpath obtained through inspecting the individual HTML elements
#' @param ... Function to pass additional function forwarding options
#' @import dplyr xml2 rvest magrittr
#' @importFrom magrittr %>%
#' @return
#' @export
#'
#' @examples
#' permitted_codes <- scrapeR(url= "https://datadictionary.nhs.uk/data_elements/abdominal_x-ray_performed_reason.html",
#                             xpath = '//*[@id="element_abdominal_x-ray_performed_reason.permitted_codes"]/div/div/table')
#
scrapeR <- function(url, xpath, ...){
  xpath <- xpath
  website <- xml2::read_html(url)
  simple_lookup_table_scraped <- website %>%
    rvest::html_nodes(xpath=xpath) %>%
    rvest::html_table() %>%
    purrr::pluck(1)


  if (length(simple_lookup_table_scraped) > 0){
    simple_lookup_table_scraped <- simple_lookup_table_scraped %>%
      apply(., 2, function(x) gsub('\\s+', ' ', x)) %>%
      as.data.frame()
  } else{
    warning(paste0("HTML Table does not exist for this URL.\n",
                "Check the URL online at:\n", url,".", "\n"))

  }

  invisible(simple_lookup_table_scraped)

}






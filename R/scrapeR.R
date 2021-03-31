
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
#' @importFrom purrr pluck
#' @importFrom rvest html_nodes html_table html_text
#' @importFrom magrittr %>%
#' @importFrom xml2 read_html
#' @return Returns the results of the scraping operation and the relevant fields from the html table - the xpath should make reference to an html table, otherwise an error is returned advising the user to check the xpath and url are correct.
#' @export
#'
#
scrapeR <- function(url, xpath, ...){
  tryCatch(
        expr = {
          xpath <- xpath
          url <- url
          content <- url %>%
            httr::GET(config = httr::config(ssl_verifypeer= FALSE))
          website <- xml2::read_html(content)

          simple_lookup_table_scraped <- website %>%
            rvest::html_nodes(xpath=xpath) %>%
            rvest::html_table() %>%
            purrr::pluck(1)


          if (length(simple_lookup_table_scraped) > 0){
            simple_lookup_table_scraped <- simple_lookup_table_scraped
            simple_lookup_table_scraped <- as.data.frame(apply(simple_lookup_table_scraped, 2, function(x) gsub('\\s+', ' ', x)))
            # apply(., 2, function(x) gsub('\\s+', ' ', x)) %>%
          } else{
            message(paste0("HTML Table does not exist for this URL.\n",
                           "Check the URL online at:\n", url,".", "\n"))

          }

          return(simple_lookup_table_scraped)

    },
    error = function(e){

          message(paste("Please make sure url or xpath are correctly specified.", as.character(e)))


    }

  )

}



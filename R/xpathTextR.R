
#' xpathTextR function
#'
#' Returns xpath text from websites and can be used to access specific HTML nodes
#'
#' @param url The link for the website
#' @param xpath The xpath string derived by using the Inspect functionality in a web browser.
#' @param ssl_needed Default - FALSE - Boolean to indicate whether to need a SSL certificate
#' @importFrom rvest html_nodes html_table html_text
#' @importFrom magrittr %>%
#' @importFrom xml2 read_html
#' @return A list with the results of scraping the specific xpath element
#' \itemize{
#'   \item result - the extracted text from the website element that has been scraped
#'   \item website_passed - a copy of the input url for the website
#'   \item html_node_result - returns the extracted html node result
#'   \item datetime_access - returns a timestamp of when the results of the scraping operation have been completed
#'   \item person_accessed - retrieves the system environment stored username and domain - this is concatenated together to form a mixed charatcer string
#'
#' }
#' @export
#'
#'
#'
xpathTextR <- function(url, xpath, ssl_needed = FALSE){

  tryCatch(
    expr = {
      xpath <- xpath
      content <- url %>%
        httr::GET(config = httr::config(ssl_verifypeer= ssl_needed))
      website <- xml2::read_html(content)
      results <- website %>%
        rvest::html_nodes(xpath=xpath) %>%
        rvest::html_text()

      return(list(result = results,
                  website_passed = url,
                  xpath_passed = xpath,
                  html_node_result = website,
                  datetime_access = Sys.time(),
                  person_accessed = paste0(toupper(Sys.getenv("USERNAME")), " - ", Sys.getenv("USERDOMAIN"))))

    },
      error = function(e){
        message("Please make sure the url and xpath are specified correctly and make sure you are connected to the internet. ")
  }
  )


}




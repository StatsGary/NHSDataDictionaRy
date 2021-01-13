
#' xpathTextR function
#'
#' Returns xpath text from websites and can be used to access specific HTML nodes
#'
#' @param url The link for the website
#' @param xpath The xpath string derived by using the Inspect functionality in a web browser.
#' @importFrom rvest html_nodes html_table html_text
#' @importFrom magrittr %>%
#' @importFrom xml2 read_html
#' @return
#' @export
#'
#'
#'
xpathTextR <- function(url, xpath){
  xpath <- xpath
  website <- xml2::read_html(url)
  results <- website %>%
    rvest::html_nodes(xpath=xpath) %>%
    rvest::html_text()

  return(list(result = results,
              website_passed = url,
              xpath_passed = xpath,
              html_node_result = website,
              datetime_access = Sys.time(),
              person_accessed = paste0(toupper(Sys.getenv("USERNAME")), " - ", Sys.getenv("USERDOMAIN")))
  )
}




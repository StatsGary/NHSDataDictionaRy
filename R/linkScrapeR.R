#' linkScrapeR
#'
#' This is used to scrape all hyperlinks from a specific web page.
#'
#' Once the links have been scraped they will be outputted into a tibble for exploration.
#'
#' This can be used on any website to pull back the hyperlink content of a web page.
#'
#'
#' @param url The website URL to detect active anchor hyperlink tags and extract them into a tibble
#' @importFrom rvest html_nodes html_table html_text html_attr
#' @importFrom magrittr %>%
#' @importFrom xml2 read_html
#' @return A tibble (class data.frame) with all active hyperlinks on the website for the URL (uniform resource locator) passed to the function.
#' \itemize{
#'   \item result - the extracted html table from url and xpath passed
#'   \item link_name - the name of the link
#'   \item url - the full url of the active href tag from HTML
#' }
#' @examples linkScrapeR("https://nhsrcommunity.com/")
#' @export
#'
linkScrapeR <- function(url){
  wp <- xml2::read_html(url)
  url_ <- wp %>%
    rvest::html_nodes("a") %>%
    rvest::html_attr("href")
  link_ <- wp %>%
    rvest::html_nodes("a") %>%
    rvest::html_text()
  return(tibble(
    link_name = link_,
    url = url_))
}



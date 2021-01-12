#' linkScrapeR
#'
#' This is used to scrape all hyperlinks from a specific webpage.
#'
#' Once the links have been scraped they will be outputted into a tibble for exploration.
#'
#' This can be used on any website to pull back the hyperlink content of a web page.
#'
#'
#' @param url The website URL to detect active anchor hyperlink tags and extract them into a tibble
#' @import dplyr xml2 rvest magrittr
#' @importFrom magrittr %>%
#' @return
#' @export
#'
#' @examples linkScrapeR("https://nhsrcommunity.com/")
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



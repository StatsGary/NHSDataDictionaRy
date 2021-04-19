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
#' @param SSL_needed Default - FALSE - Boolean to indicate whether to need a SSL certificate
#' @importFrom rvest html_nodes html_table html_text html_attr
#' @importFrom magrittr %>%
#' @importFrom xml2 read_html
#' @importFrom httr GET config
#' @return A tibble (class data.frame) with all active hyperlinks on the website for the URL (uniform resource locator) passed to the function.
#' \itemize{
#'   \item result - the extracted html table from url and xpath passed
#'   \item link_name - the name of the link
#'   \item url - the full url of the active href tag from HTML
#' }
#' @examples linkScrapeR("https://nhsrcommunity.com/")
#' @export

linkScrapeR <- function(url, SSL_needed = FALSE){
  tryCatch(
      expr = {
          url <- url
          content <- url %>%
            httr::GET(config = httr::config(ssl_verifypeer= SSL_needed))
          read_con <- xml2::read_html(content)

          url_ <- read_con %>%
            rvest::html_nodes("a") %>%
            rvest::html_attr("href")

          link_return <- read_con %>%
            rvest::html_nodes("a") %>%
            rvest::html_text()

          return(tibble(
            link_name = link_return,
            url = url_))
      },

      error = function(e){
        message(cat
                ("There has been an issue with the return.\n","Please check url passed to the function, or set the SSL_needed parameter to FALSE, as the sites SSL certificate may have expired. Additionally, please make sure you are connected to the internet."))
      }

    )



}






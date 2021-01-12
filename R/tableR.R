
#' tableR function
#'
#' This function uses the scapeR parent function to return a table of elements
#'
#' @param url The URL of the website to scrape the table element from
#' @param xpath The unique xpath of the HTML element to be scraped
#' @param title Unique name for the relevant HTML table that has been scraped
#' @param add_zero_prefix Adds zero prefixes to certain codes that get converted by native functions
#' @param ... Function forwarding to parent function to pass additional arguments to function
#' @import dplyr xml2 rvest magrittr
#' @importFrom magrittr %>%
#' @include scrapeR.R
#' @return
#' @export
#'
#' @examples
#' permitted_codes <- tableR(url= "https://datadictionary.nhs.uk/data_elements/abdominal_x-ray_performed_reason.html", xpath = '//*[@id="element_abdominal_x-ray_performed_reason.permitted_codes"]/div/div/table', title = "x-ray performed", add_zero_prefix = TRUE)

tableR <- function(url, xpath, title, add_zero_prefix = FALSE, ...){


  if (is.null(url) | url == ""){
    stop("The URL of the specific NHS Data Dictionary page needs to be entered")
  }

  if (is.null(xpath) | xpath==""){
    stop(cat("The xpath of the HTML element needs to be specified.\n",
             "This can be obtained by using the Inspect function in most web browsers.\n", sep=""))
  }

  if (!is.character(url) | !is.character(xpath)){
    stop("The inputs for this function are character strings. Please make sure data type characters are used.")
  }

  if (add_zero_prefix==FALSE){
    return_df <- dplyr::tibble(
      scrapeR(url, xpath, ...),
      Dict_Type = title,
      DttmExtracted = Sys.time()
    )
  } else{
    return_df <- dplyr::tibble(
      scrapeR(url, xpath, ...),
      Dict_Type = title,
      DttmExtracted = Sys.time()
    )


      return_df$Code <- paste0("0", trimws(return_df$Code))
      return_df$Code <- ifelse(nchar(return_df$Code) > 2, substr(return_df$Code, 2,nchar(return_df$Code)),
                               return_df$Code)

  }

  try(return(return_df), silent=F)

}




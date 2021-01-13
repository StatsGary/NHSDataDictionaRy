
#' len_xl function
#'
#' This function replicates the LEN function in Excel and is utilised for finding the length of character strings.
#'
#' @param text The text to get the numeric length of
#' @param ... Function forwarding to work with the base nchar method
#' @return
#' @export
#'
#' @examples
#' len_xl("Guess the length of me!")
#'
#'
len_xl <- function(text, ...) {
  nchar(text, ...)
}




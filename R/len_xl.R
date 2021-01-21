
#' len_xl function
#'
#' This function replicates the LEN function in Excel and is utilised for finding the length of character strings.
#'
#' @param text The text you want to calculate the length
#' @param ... Function forwarding to work with the base nchar method
#' @return An integer value calculating the length of the text passed
#' @export
#'
#' @examples
#' len_xl("Guess the length of me!")
#'
#'
len_xl <- function(text, ...) {
  nchar(text, ...)
}





#' right_xl function
#'
#' This function replicates the RIGHT function in Excel and is utilised for right trimming
#' of character strings.
#'
#' This has been included as a convenience function for working with text and string data.
#'
#' @param text The text you want to RIGHT trim
#' @param num_char The number of characters your want to trim by. This field needs to be numeric.
#' @return The trimmed string from the text parameter and trimming by the number of characters num_char passed to the parameter.
#' @export
#'
#' @examples
#' right_xl(text= "This is some example text", num_char = 10)
#'
#' \donttest{
#' right_xl(text= "This is some example text", num_char = 10)
#' }
#'
right_xl <- function(text, num_char=0) {

  if (num_char ==0){
    stop("Please enter the number of characters to left trim the text by.")
  }

  if(!is.numeric(num_char)){
    stop("The number of characters fields needs numeric inputs")
  }

  substr(text, nchar(text) - (num_char-1), nchar(text))
}



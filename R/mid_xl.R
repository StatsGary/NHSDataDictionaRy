
#' mid_xl function 
#' 
#' This function replicates the MID function in Excel and is utilised for left trimming
#' of character strings.
#' 
#' This has been included as a convenience function for working with text and string data.
#' 
#' @param text The text you want to MID trim
#' @param start_num The start number to start the trim. This needs to be numeric.
#' @param num_char The number of characters your want to trim by. This field needs to be numeric. 
#' @return
#' @export
#'
#' @examples 
#' mid_xl(text= "This is some example text", start_num = 6, num_char = 10)
#' 
#' \donttest{
#' mid_xl(text= "This is some example text", start_num = 6, num_char = 10)
#' }
#' 
mid_xl <- function(text, start_num=1, num_char=0) {
  
  if (num_char ==0){
    stop("Please enter the number of characters to left trim the text by.")
  }
  
  if (start_num ==0) {
    stop("Please enter the start index to search the text string.")
  }
  
  if(!is.numeric(start_num)| !is.numeric(num_char)){
    stop("The start number and number of characters fields need numeric inputs")
  }
  
  substr(text, start_num, start_num + num_char - 1)
}



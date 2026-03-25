#' show column names 
#'
#' @description
#' A convenience function to show column names 
#' 
#' @param 
#' x = a data.frame
#'
#' @return a matrix with `data.frame` names
#' @export
#' @family utilities
#' @examples
#' dat = data.frame(matrix(rnorm(100), ncol=10))
#' names(dat) = letters[1:length(dat)]
#' cn(dat)

cn <- function(df) {
as.matrix(colnames(df))
return(df)
}



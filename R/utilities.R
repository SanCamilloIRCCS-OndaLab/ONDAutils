#' Show column names as a one-column matrix
#'
#' @description
#' A convenience function to list the column names of a data frame as a
#' one-column matrix, so that each name is printed on its own numbered row.
#' This makes it quick to find a column's position.
#'
#' @param df A data.frame (or any object with column names).
#'
#' @return A one-column character matrix with the column names of `df`.
#' @export
#' @family utilities
#' @examples
#' dat = data.frame(matrix(rnorm(100), ncol=10))
#' names(dat) = letters[1:length(dat)]
#' cn(dat)

cn <- function(df) {
  return(as.matrix(colnames(df)))
}

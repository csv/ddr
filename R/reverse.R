#' reverse wave objects
#'
#' @param object a wave object
#'

#' @return
#' a reversed wave object
#'
#' @export
#'
#' @examples
#' #not run
reverse <- function(object) {
    if (!is(object, "Wave")) {
        stop("'object' needs to be of class 'Wave'")
    }
    validObject(object)
    n <- length(object)
    object[n:0]
}
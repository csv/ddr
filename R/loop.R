#' loop a wave x times
#'
#' @param object a sound of wave format
#' @param times the number of times to loop the wave
#'
#' @return
#' a looped wave
#'
#' @export
#'
#' @examples
#' #not run

loop <- function(object, times=2) {
  if (!is(object, "Wave"))
        stop("'object' needs to be of class 'Wave' or 'list'")
  validObject(object)
  if (!is.integer(times)) {
    times <- round(times, digits=0)
  }
  # populate list
  sounds <- llply(1:times, function(x) { return(object) } )

  # reduce
  Reduce(function(x, y) {bind(x, y)}, sounds)
}

#' create a major scale given a base note
#'
#' @param note the root note of the scale (eg "C3")
#'
#' @return
#' a data.frame of the notes in a scale
#'
#' @export
#'
#' @examples
#' #not run

major_scale <- function(instrument = piano, root="C3") {
  notenames <- names(instrument)
  i <- which(notenames==root)
  scale_notes <-c(i,
                  i + 2,
                  i + 4,
                  i + 5,
                  i + 7,
                  i + 9,
                  i + 11,
                  i + 12)
  instrument[[scale_notes]]
}
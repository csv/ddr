#' select a major scale from an instrument given a root note
#'
#' @param instrument a built-in instrument object (eg "piano")
#' @param note the root note of the scale (eg "C3")
#'
#' @return
#' a data.frame of the notes in a scale
#'
#' @export
#'
#' @examples
#' #not run

minor_scale <- function(instrument = piano, root="C3") {
  notenames <- names(instrument)
  i <- which(notenames==root)
  scale_notes <-c(i,
                  i + 2,
                  i + 3,
                  i + 5,
                  i + 7,
                  i + 9,
                  i + 10,
                  i + 12)
  instrument[[scale_notes]]
}
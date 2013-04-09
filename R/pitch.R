#' change the pitch of a wav object.
#'
#' @param object a wav object
#' @param semitones the semitones with which to pitch the wav up(positive) or down(negative)
#' @param equal whether the outuputted wave object should be the same length as the original
#'
#' @return
#' a repitched wave object
#'
#' @export
#'
#' @examples
#' #not run

pitch <- function(object, semitones, equal=TRUE) {
    if (!is(object, "Wave"))
        stop("'object' needs to be of class 'Wave'")
    validObject(object)
    re_pitched <- object[as.integer(seq(0, length(object), by = 2^(semitones/12)))]
    if (equal) {
        lo <- length(object)
        re_pitched <- chop(re_pitched, to=lo)
    }
    return(re_pitched)
}
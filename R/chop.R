#' chop a wave form to a desired length
#'
#' @param object a wave object
#' @param bpm desired bpm
#' @param from where to start the chop from the beginning of sound (in samples)
#' @param count the count to chop by.
#' @param to an optional parameter. only use if you want to set a custom length for the wave (in samples)
#' @param stero whether to convert the input wave to stereo
#'
#' @return
#' a chopped wave
#'
#' @export
#'
#' @examples
#' #not run
chop <- function (object, bpm=120, count="four", from=0, to=NULL, stereo=TRUE) {
    require("plyr")
    require("tuneR")
    if (!is(object, "Wave")) {
        stop("'object' needs to be of class 'Wave'")
    }
    validObject(object)

    #calculate note length using bpmTime and sample rates
    sr <- object@samp.rate
    if(is.null(to)) {
        to <- bpm_time(bpm, count) * sr
    }
    lo <- length(object)
    if (lo < to) {
        silence_wave <- silence(duration = to-lo, xunit ="samples")
        if(stereo) {
          require("seewave")
          silence_wave <- stereo(silence_wave, silence_wave)
        }
        object <- bind(object, silence_wave)
        return(object)
    } else {
        return(object[from:to])
    }

}
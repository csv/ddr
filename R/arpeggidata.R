#' scale apeggiate data.
#'
#' @param x a numeric vector
#' @param low_note the lowest note to scale to
#' @param high_note the highest note to scale to
#' @param descending should numbers going up correspond with notes going down?
#' @param scale what scale the notes should fall in
#' @param remove an optional note / regex of mulitiple notes to remove
#' @param bpm the beats per minute of the arpeggiator
#' @param count the count that each data point gets.
#'
#' @return
#' an arpeggiated waveform
#'
#' @export
#'
#' @examples
#' #not run

arpeggidata <- function(x,
                       inst,
                       low_note="",
                       high_note="",
                       descending = FALSE,
                       scale="Emajor",
                       remove=NULL,
                       bpm=120,
                       count="sixteen_") {
    require("plyr")
    require("tuneR")


    # select scales
    cat("assigning notes", "\n")
    instrument <- select_scale(inst, scale=scale)

    # optionally remove notes

    if(!is.null(remove)){
      to_remove <- grep(remove, names(instrument))
      instrument <- instrument[-to_remove]
    }

    # create variables for scaling function
    notenames <- names(instrument)
    low <- which(notenames==low_note)
    if (length(low) == 0) {
      low <- 1
    }

    high <- which(notenames==high_note)
    if (length(high) == 0) {
      high <- length(instrument)
    }

    # filter instrument
    instrument <- instrument[low:high]

    # redefine low and high
    low <- 1
    high <- length(instrument)

    # if descending
    if(descending) {
      instrument <- instrument[high:low]
    }

    MIN <- min(x)
    MAX <- max(x)


    # assign notes
    o <- llply(x, function(y) {
      z <- ceiling((y - MIN)*(high-low) / (MAX - MIN))
      if(z==0){
        z <- 1
      }
      note <- chop(instrument[z][[1]], bpm=bpm, count=count)
      return(note)
    }, .progress="text")

    bind_list_of_waves <- function(x, y) {
        bind(x, y)
    }

    reduce_waves <- function(list_of_waves) {
        Reduce(bind_list_of_waves, list_of_waves)
    }
    cat("lets hope this will sound cool...", "\n")
    reduce_waves(o)
}
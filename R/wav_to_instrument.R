#' This function will take in a single wave file of notes A0 to C7, and split it into a list of individual wav files, with names corresponding to its given note names
#'
#' @param object a single wave object
#' @param wave_length how long each note plays for (in seconds)
#' @param rest_length the length of silence between each note (in seconds)
#' @param wavnames a character vector of names to assign each note (in the order they appear)
#'
#' @return
#' a wave object
#'
#' @export
#'
#' @examples
#' #not run

wav_to_instrument <- function(object,
                              wave_length=8,
                              rest_length=2,
                              wavnames=names(notes)) {

    require("tuneR")
    require("plyr")


    n <- length(wavnames) # number of waveforms to parse
    wave_length <- object@samp.rate * wave_length # the length of the waves
    rest_length <- object@samp.rate * rest_length # the lenght of the rests
    total_length <- wave_length + rest_length # lenght of each wave_chunk

    # generate split key
    # this will equal 0 if the waveform should be silent,
    # and a number from 1:n if the wave_form should be one

    # create one of these keys
    split_key <- vector("numeric", total_length)
    split_key[1:wave_length]  <- 1

    # stack n of these keys on top of eachother
    split_key <- rep(split_key, n)

    # identify the start of each key
    wave_splits <- seq(1, length(split_key), total_length)
    for(i in 1:n) {
        wave_index <- wave_splits[i]:(wave_splits[i] + wave_length)
        split_key[wave_index] <- split_key[wave_index] + (i-1)
    }

    # split waves along these keys
    cat("splitting waves", "\n")
    split_waves <- function(i) {
        object[which(split_key==i)]
    }
    waves <- llply(1:n, split_waves, .progress="text")

    # name the waves
    names(waves) <- wavnames

    # output
    return(waves)
}

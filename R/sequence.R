#' sequence wave objects
#'
#' @param waves a list of wave objects
#' @param sequences a list of binary vectors indicating when notes turn on and off
#' @param bpm the bpm of the sequence
#' @param count the count each note recieves
#' @param unit the resolution of the wave file

#' @return
#' a wave object
#'
#' @export
#'
#' @examples
#' #not run

sequence <- function(waves, sequences, bpm=120, count="sixteen_", unit="16") {

    # meta variables
    step_time <- bpm_time(bpm=bpm, count=count)
    silence_wave <- silence(step_time, xunit="time")
    silence_wave <- stereo(silence_wave, silence_wave)

    n_layers <- length(waves)
    if(n_layers!=length(sequences)) {
        stop("there must be the same number of waves as sequences")
    }

    steps <- as.numeric(unique(laply(sequences, length)))
    if(length(steps)!=1) {
        stop("sequences must be of all the same length")
    }

    # helper functions
    sound_or_silence <- function(step, wave, silence_wave) {
        if(step <= 1 & step > 0){
            wave <- normalize(wave, level=(step^3)*32767)
            return(wave)
        } else if (step==0) {
            return(silence_wave)
        } else {
            stop("sequence steps must be between 0 and 1")
        }
    }

    bind_list_of_waves <- function(x, y) {
        bind(x, y)
    }

    reduce_waves <- function(list_of_waves) {
        Reduce(bind_list_of_waves, list_of_waves)
    }
    construct_sequence <- function(i) {
        list_of_waves <- llply(sequences[[i]], sound_or_silence, waves[[i]], silence_wave)
        layer <- reduce_waves(list_of_waves)
        return(layer)
    }
    # prepare input waves
    waves <- llply(waves, function(x) {chop(x, bpm=bpm, count=count) })

    # construct layers
    layers <- llply(1:n_layers, construct_sequence, .progress="text")

    # combine layers into one sound
    output <- combine(layers)
}
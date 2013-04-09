#' create a chord given an instrument list, base note, and chord name
#'
#' @param root the root note
#' @param instrument a instrument object, default=piano
#' @param chord the type of chord
#' @param inversion an inversion to apply, first, second, first_down, or second_down
#' @param bpm the bpm to dictate the length of the chord
#' @param count the count of the chord note
#' @param to an optional value indicating the number of samples to cut the chord by.
#'
#' @return
#' a data.frame of the notes in a scale
#'
#' @export
#'
#' @examples
#' #not run


chord <- function(root="C3",
                  instrument = piano,
                  chord="maj",
                  inversion=NULL,
                  bpm=120,
                  count=1/4,
                  to=NULL) {

  # identiy the index of the root chord
  notenames <- names(instrument)
  i <- which(notenames==root)

  # generate chord indexes
  if(chord=="maj") {
    c <- list(i, i+4, i+7)
  }
  if(chord=="min") {
    c <- list(i, i+3, i+7)
  }
  if(chord=="susp2") {
    c <- list(i, i+2, i+7)
  }
  if(chord=="susp4") {
    c <- list(i, i+5, i+7)
  }
  if(chord=="dim") {
    c <- list(i, i+4, i+6)
  }
  if(chord=="maj7") {
    c <- list(i, i+4, i+7, i+11)
  }
  if(chord=="min7") {
    c <- list(i, i+3, i+7, i+10)
  }
  if(chord=="maj9") {
    c <- list(i, i+4, i+7, i+14)
  }
  if(chord=="min9") {
    c <- list(i, i+3, i+7, i+14)
  }
  # apply inversions
  if(!is.null(inversion)) {
    if (inversion=="first") {
      c[[1]] <- c[[1]] + 12
    } else if (inversion=="second") {
      c[[2]] <- c[[2]] + 12
    } else if (inversion=="first_down") {
      c[[2]] <- c[[2]] - 12
    } else if (inversion=="second_down") {
      c[[3]] <- c[[3]] - 12
    } else {
      stop("inversion must equal \n \"first\", \"second\",\n\"first_down\" or \"second_down\"")
    }
  }

  # select notes
  select_notes <- function(note) {
    if(note<1 | note>88) {
      stop("notes must be in the range of A0 and C7")
    }
    instrument[[note]]
  }
  notes <- llply(c, select_notes)

  # chop notes
  notes <- llply(notes, chop, bpm=bpm, count=count)

  # combine
  combine(notes)
}
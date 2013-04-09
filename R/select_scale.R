#' select a scale of note frequencies
#'
#' @param instrument a built-in instrument object (eg "piano") with notenames ranging from A0 to C7
#' @param scale what scale the notes should fall in, none= all notes
#'
#' @return
#' an instrument with wave objects only corresponding to notes in the given scale
#'
#' @export
#'
#' @examples
#' #not run

select_scale <- function(instrument, scale="Cmajor") {
    require("ddr")

    if(scale=="Amajor") {
      regex <- "(A[0-9])|(B[0-9])|(C\\.[0-9])|(D[0-9])|(E[0-9])|(F\\.[0-9])|(G\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]

    }
    else if(scale=="Aminor") {
      regex <- "\\."
      scale_notes <- notes[1, -grep(regex, names(notes))]
    }

    else if(scale=="A.major") {
      regex <- "(A\\.[0-9])|(C[0-9])|(D[0-9])|(D\\.[0-9])|(F[0-9])|(G[0-9])|(A[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="A.minor") {
      regex <- "(A\\.[0-9])|(C[0-9])|(C\\.[0-9])|(D\\.[0-9])|(F[0-9])|(G[0-9])|(G\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Bmajor") {
      regex <- "(B[0-9])|(C\\.[0-9])|(D\\.[0-9])|(E[0-9])|(F\\.[0-9])|(G\\.[0-9])|(A\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Bminor") {
      regex <- "(B[0-9])|(C\\.[0-9])|(D[0-9])|(E[0-9])|(F\\.[0-9])|(G\\.[0-9])|(A[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Cmajor") {
      regex <- "\\."
      scale_notes <- notes[1, -grep(regex, names(notes))]
    }

    else if(scale=="Cminor") {
      regex <- "(C[0-9])|(D[0-9])|(D\\.[0-9])|(E[0-9])|(F[0-9])|(G[0-9])|(A[0-9])|(A\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="C.major") {
      regex <- "(C\\.[0-9])|(D\\.[0-9])|(F[0-9])|(G\\.[0-9])|(A\\.[0-9])|(A\\.[0-9])|(B[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="C.minor") {
      regex <- "(C\\.[0-9])|(D\\.[0-9])|(F\\.[0-9])|(G\\.[0-9])|(A\\.[0-9])|(A\\.[0-9])|(B[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Dmajor") {
      regex <- "(D[0-9])|(E[0-9])|(F\\.[0-9])|(G[0-9])|(A[0-9])|(B[0-9])|(C\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Dminor") {
      regex <- "(D[0-9])|(E[0-9])|(F[0-9])|(G[0-9])|(A[0-9])|(B[0-9])|(C[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="D.major") {
      regex <- "(D\\.[0-9])|(F[0-9])|(G[0-9])|(G\\.[0-9])|(A\\.[0-9])|(C[0-9])|(D[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="D.minor") {
      regex <- "(D\\.[0-9])|(F[0-9])|(F\\.[0-9])|(G\\.[0-9])|(A\\.[0-9])|(C[0-9])|(C\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Emajor") {
      regex <- "(E[0-9])|(F\\.[0-9])|(G\\.[0-9])|(A[0-9])|(B[0-9])|(C\\.[0-9])|(D\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Eminor") {
      regex <- "(E[0-9])|(F\\.[0-9])|(G[0-9])|(A[0-9])|(B[0-9])|(C\\.[0-9])|(D[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Fmajor") {
      regex <- "(F[0-9])|(G[0-9])|(A[0-9])|(A\\.[0-9])|(C[0-9])|(D[0-9])|(E[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Fminor") {
      regex <- "(F[0-9])|(G[0-9])|(G\\.[0-9])|(A\\.[0-9])|(C[0-9])|(D[0-9])|(D\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="F.major") {
      regex <- "(F\\.[0-9])|(G\\.[0-9])|(A\\.[0-9])|(B[0-9])|(C\\.[0-9])|(D\\.[0-9])|(F[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="F.minor") {
      regex <- "(F\\.[0-9])|(G\\.[0-9])|(A[0-9])|(B[0-9])|(C\\.[0-9])|(D\\.[0-9])|(E[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Gmajor") {
      regex <- "(G[0-9])|(A[0-9])|(B[0-9])|(B[0-9])|(C[0-9])|(D[0-9])|(E[0-9])|(F\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="Gminor") {
      regex <- "(G[0-9])|(A[0-9])|(A\\.[0-9])|(B[0-9])|(C[0-9])|(D[0-9])|(E[0-9])|(F[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="G.major") {
      regex <- "(G\\.[0-9])|(A\\.[0-9])|(C[0-9])|(C\\.[0-9])|(D\\.[0-9])|(F[0-9])|(G[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if(scale=="G.minor") {
      regex <- "(G\\.[0-9])|(A\\.[0-9])|(B[0-9])|(C\\.[0-9])|(D\\.[0-9])|(F[0-9])|(F\\.[0-9])"
      scale_notes <- notes[1, grep(regex, names(notes))]
    }

    else if (scale=="none"){
      scale_notes <- notes
    }

    else if (scale==""){
      stop("You must provide a valid scale name")
    }
    instrument[as.character(scale_notes[1,])]
}
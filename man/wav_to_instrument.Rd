\name{wav_to_instrument}
\alias{wav_to_instrument}
\title{This function will take in a single wave file of notes A0 to C7, and split it into a list of individual wav files, with names corresponding to its given note names}
\usage{
  wav_to_instrument(object, wave_length = 8,
    rest_length = 2, wavnames = names(notes))
}
\arguments{
  \item{object}{a single wave object}

  \item{wave_length}{how long each note plays for (in
  seconds)}

  \item{rest_length}{the length of silence between each
  note (in seconds)}

  \item{wavnames}{a character vector of names to assign
  each note (in the order they appear)}
}
\value{
  a wave object
}
\description{
  This function will take in a single wave file of notes A0
  to C7, and split it into a list of individual wav files,
  with names corresponding to its given note names
}
\examples{
#not run
}


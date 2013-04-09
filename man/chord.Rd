\name{chord}
\alias{chord}
\title{create a chord given an instrument list, base note, and chord name}
\usage{
  chord(root = "C3", instrument = piano, chord = "maj",
    inversion = NULL, bpm = 120, count = 1/4, to = NULL)
}
\arguments{
  \item{root}{the root note}

  \item{instrument}{a instrument object, default=piano}

  \item{chord}{the type of chord}

  \item{inversion}{an inversion to apply, first, second,
  first_down, or second_down}

  \item{bpm}{the bpm to dictate the length of the chord}

  \item{count}{the count of the chord note}

  \item{to}{an optional value indicating the number of
  samples to cut the chord by.}
}
\value{
  a data.frame of the notes in a scale
}
\description{
  create a chord given an instrument list, base note, and
  chord name
}
\examples{
#not run
}


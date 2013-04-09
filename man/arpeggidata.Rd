\name{arpeggidata}
\alias{arpeggidata}
\title{scale apeggiate data.}
\usage{
  arpeggidata(x, inst, low_note = "", high_note = "",
    descending = FALSE, scale = "Emajor", remove = NULL,
    bpm = 120, count = "sixteen_")
}
\arguments{
  \item{x}{a numeric vector}

  \item{low_note}{the lowest note to scale to}

  \item{high_note}{the highest note to scale to}

  \item{descending}{should numbers going up correspond with
  notes going down?}

  \item{scale}{what scale the notes should fall in}

  \item{remove}{an optional note / regex of mulitiple notes
  to remove}

  \item{bpm}{the beats per minute of the arpeggiator}

  \item{count}{the count that each data point gets.}
}
\value{
  an arpeggiated waveform
}
\description{
  scale apeggiate data.
}
\examples{
#not run
}


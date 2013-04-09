\name{select_scale}
\alias{select_scale}
\title{select a scale of note frequencies}
\usage{
  select_scale(instrument, scale = "Cmajor")
}
\arguments{
  \item{instrument}{a built-in instrument object (eg
  "piano") with notenames ranging from A0 to C7}

  \item{scale}{what scale the notes should fall in, none=
  all notes}
}
\value{
  an instrument with wave objects only corresponding to
  notes in the given scale
}
\description{
  select a scale of note frequencies
}
\examples{
#not run
}


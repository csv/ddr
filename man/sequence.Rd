\name{sequence}
\alias{sequence}
\title{sequence wave objects}
\usage{
  sequence(waves, sequences, bpm = 120, count = "sixteen_",
    unit = "16", stereo = TRUE)
}
\arguments{
  \item{waves}{a list of wave objects}

  \item{sequences}{a list of binary vectors indicating when
  notes turn on and off}

  \item{bpm}{the bpm of the sequence}

  \item{count}{the count each note recieves}

  \item{unit}{the resolution of the wave file}

  \item{stereo}{whether or not any of the waves are in
  stereo}
}
\value{
  a wave object
}
\description{
  sequence wave objects
}
\examples{
#not run
}


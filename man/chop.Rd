\name{chop}
\alias{chop}
\title{chop a wave form to a desired length}
\usage{
  chop(object, bpm = 120, count = "four", from = 0,
    to = NULL, stereo = TRUE)
}
\arguments{
  \item{object}{a wave object}

  \item{bpm}{desired bpm}

  \item{from}{where to start the chop from the beginning of
  sound (in samples)}

  \item{count}{the count to chop by.}

  \item{to}{an optional parameter. only use if you want to
  set a custom length for the wave (in samples)}

  \item{stero}{whether to convert the input wave to stereo}
}
\value{
  a chopped wave
}
\description{
  chop a wave form to a desired length
}
\examples{
#not run
}


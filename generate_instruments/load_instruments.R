rm(list=ls())
library("devtools")
library("seewave")
load_all(".")
ddr_init(shut_up=TRUE, player="/usr/bin/env mplayer")

file_paths <- list.files("drums/moog")
note_names <- gsub("\\.WAV|\\.wav", "", file_paths)
moog <- vector("list", length=length(note_names))
names(moog) <- note_names
moog
for (i in 1:length(file_paths)) {
    w <- readWave(paste0("drums/moog/", file_paths[i]))
    moog[[i]] <- stereo(w,w)
    cat(i, "\n")
}
save(moog, file="data/moog.rda")

# one wave file of every note to instrument
raw <- readWave("sounds/sine.wav")
sinewave <- wav_to_instrument(raw)
save(sinewave, file="data/sinewave.rda")

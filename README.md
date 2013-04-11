```
#===========================#
|          _     _          |
|       __| | __| |_ __     |
|      / _` |/ _` | '__|    |
|     | (_| | (_| | |       |
|      \__,_|\__,_|_|       |
|                           |
|  data-driven rhythms in R |
#===========================#
```

## Installation
`ddr` has ~ 1 GB of built-in instruments. It will take awhile to install from github.
```
library("devtools")
install_github("ddr", "csv")
library("ddr")
```

## Getting started
The way `ddr` makes noises is by creating temporary wave files and playing them through an audio player of your preference.  You can set your desired audio player as follows:
```
ddr_init(player="path_to_player")
```
By default, `ddr` is set to look for `QuickTime` on Mac OSX, eg:
```
ddr_init(player="/Applications/'QuickTime Player.app'/Contents/MacOS/'QuickTime Player'")
```
However, you might want to use `mplayer`, eg:
```
ddr_init(player="/usr/bin/env mplayer'")
```
One weird thing about using `QuickTime` is that, when it plays a temporary file, it will freeze the R console until you press `esc`. So, if you see this:
```
> play(piano$C3)

```
just press `esc` and `ddr` will move on to the next task.


## Built-in sounds

`ddr` comes with 5 instruments and 2 drum kits:

```
# Instruments:
blip -- a sinewave with a quick attack
piano -- a classic-sounding grand piano
rhodes -- a fender rhodes
sinewave -- a simple sinewave
sweeplow -- a cheesy synth

# Drums:
moog -- moog drum hits
roland -- a roland 707
```
Instruments and drum kits are simply R lists with each element being a separate wave file. For instance, you can select middle C on a piano as follows:
```
piano$C3
# or, alternatively:
piano[["C3"]]
```
If you want to see the names of the wave file in a given instrument, just type: `names(instrument)`, eg: `names(piano)` or `names(moog)`

## Sound manipulation

Slice 'em up!
```
chop(piano$C3, bpm=100, count=1/8)
```
Reverse too!
```
reverse(piano$C3)
```
Chop and screw!
```
chop(pitch(piano$C3, -36), bpm=100, count=2)
```
Loop!
```
loop(chop(piano$C3, bpm=100, count=1/8), 16)
```
Generate chords!
```
chord(C3, piano, "maj", bpm=100, count=4)
```

## Sound sequencing
`ddr` comes with a simple sound sequencing engine. This is best explained through an example:

```
# let's make a four-on-the-floor drum loop!

# first, let's put our drum sounds in a list:
wavs <- list(roland$HHO, roland$SD1, roland$BD1)

# now let's write a series of 1's and 0's indicating when we want each sound to play
# when we're done, let's also put these in a list:
hihat <- c(0,1,0,1)
kick <- c(1,0,1,0)
snare <- c(0,0,1,0)
seqs <- list(hihat, snare, kick)

# now lets put these lists into our sequence function and include a bpm and the count each note recieves
four_on_the_floor <- sequence(wavs, seqs, bpm=120, count=1/8)
play(loop(four_on_the_floor, 10))
```
Now lets take this logic and include chords to generate the chorus of _Call Me Maybe_

```
c1 <- chord(A4, sweeplow, "maj", bpm=119, count=1)
c2 <- chord(E4, sweeplow, "maj", bpm=119, count=1)
c3 <- chord(B4, sweeplow, "maj", bpm=119, count=1)
c4 <- chord(C.4, sweeplow, "min", bpm=119, count=1)
wavs <- list(c1, c2, c3, c4, roland$HHC, roland$TAM, roland$HHO, roland$BD1, roland$SD1)

A <- c(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0)
E <- c(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0)
B <- c(0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0)
C.m<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
H <- c(0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1)
T <- c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0)
O <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1)
K <- c(1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0)
S <- c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0)
seqs <- list(A, E, B, C.m, H, T, O, K, S)

callmemaybe <- sequence(wavs, seqs, bpm=59.5, count=1/16)
play(loop(callmemaybe, 4))
```
But wait, there's more! `ddr` can also generate sequences that include amplitude changes. Here, any number between 0 and 1 simply corresponds with the relative amplitude of the wave:
```
wavs <- list(roland$HHC)
seqs <- list(c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8))

hihats <- sequence(wavs, seqs, bpm=59.5, count=1/16)
play(loop(hihats, 4))
```
BUT NOW IM REALLY GOING TO BLOW YOUR MIND. Since sequences are (mostly) binomial distributions, you can use built-in R functions to generate random music!
```
wavs <- list(roland$HHC, roland$TAM, roland$HHO, roland$BD1, roland$SD1)

H <- rnorm(32, mean=0.5, sd=0.15)
T <- rbinom(32, 1, prob=0.05)
O <- rbinom(32, 1, prob=0.075)
K <- rbinom(32, 1, prob=0.2)
S <- rbinom(32, 1, prob=0.3)
seqs <- list(H, T, O, K, S)

random_loop <- sequence(wavs, seqs, bpm=59.5, count=1/16)
play(loop(random_loop, 4))
```

## Data Sonification
Finally, `ddr` has a function for creating silly data sonifications. It's called `arpeggidata`. `arpeggidata` works by scaling a numeric vector onto a musical scale.  YOU HAVE TO HEAR IT TO BELIEVE IT!

```
# Let's use ChickWeight - Iris is so played out...
data('ChickWeight')
cw <- ChickWeight

chicks <- arpeggidata(sqrt(sw$weight),
                      blip,
                      scale="Emajor",
                      bpm=200,
                      count=1/32)
play(chicks)
```

### [FMS Symphony](http://fms.csvsoundsystem.com)
I used `ddr` to make the music in [FMS Symphony](http://fms.csvsoundsystem.com).  Here's the code (fms_data is built-in to `ddr`):

```
bpm <- 280
ct <- 1/4

rate <- arpeggidata(fms_data$rate,
            sinewave,
            low_note="",
            high_note="",
            descending = FALSE,
            scale="Cmajor",
            remove=NULL,
            bpm=bpm,
            count=ct)
writeWave(rate, "rate.wav")

ceil <- arpeggidata(fms_data$dist_to_ceiling,
            sinewave,
            low_note="",
            high_note="",
            descending = TRUE,
            scale="Emajor",
            remove=NULL,
            bpm=bpm,
            count=ct)
writeWave(ceil, "ceiling.wav")

gen_chords <- function(z) {
    if (z < 0) {
        if (z <= -0.5) {
            c <- chord(A3, sinewave,
                       "min", bpm=bpm,
                       count=ct)
        } else {
            c <- chord(A4, sinewave,
                       "min", bpm=bpm,
                       count=ct)
        }
    } else {
        if (z >= 0.5) {
            c <- chord(C4, sinewave,
                       "maj", bpm=bpm,
                       count=ct)
        } else {
            c <- chord(C3, sinewave,
                       "maj", bpm=bpm,
                       count=ct)
        }
    }
    return(c)
}

chords <- llply(fms_data$z_change, gen_chords, .progress="text")
bind_list_of_waves <- function(x, y) {
    bind(x, y)
}

reduce_waves <- function(list_of_waves) {
    Reduce(bind_list_of_waves, list_of_waves)
}
chords <- reduce_waves(chords)
writeWave(chords, "chords.wav")
```

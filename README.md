```
     _     _
  __| | __| |_ __
 / _` |/ _` | '__|
| (_| | (_| | |
 \__,_|\__,_|_|

```
data-driven rhythms in R

## Installation
```
library("devtools")
install_github("ddr", "csv")
library("ddr")
ddr_init()
```

### Basics
Instruments and notes:
```
piano$C3
piano[["C3"]]
```
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
chop(pitch(piano$C3, -36, FALSE), bpm=100, count=2)
```
Loop!
```
loop(chop(piano$C3, bpm=100, count=1/8), 16)
```
Play a chord!
```
chord(C3, piano, "maj", bpm=100, count=4)
```

### Sound Sequencing - _Call Me Maybe_

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

### Randomly Generated Drums
```
wavs <- list(roland$HHC, roland$TAM, roland$HHO, roland$BD1, roland$SD1)

H <- rnorm(32, mean=0.5, sd=0.15)
T <- rbinom(32, 1, prob=0.05)
O <- rbinom(32, 1, prob=0.075)
K <- rbinom(32, 1, prob=0.2)
S <- rbinom(32, 1, prob=0.3)
seqs <- list(H, T, O, K, S)

drum_loop <- sequence(wavs, seqs, bpm=59.5, count=1/16)
play(loop(drum_loop, 4))
```

### Data Sonification
Let's use ChickWeight - Iris is so played out...
```
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
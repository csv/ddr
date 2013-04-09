#' initialize wave player and attaches note variables
#'
#' @param path_to_player the path to your wave player, defaults to Mac OSX settings.

#' @return
#' initializes the wave player, attaches note variables
#'
#' @export
#'
#' @examples
#' #not run

ddr_init <- function(player="/Applications/'QuickTime Player.app'/Contents/MacOS/'QuickTime Player'",
                     shut_up=TRUE) {
    setWavPlayer(player)
    attach(notes, warn.conflicts=FALSE)
    cat("      __     __       ", "\n")
    cat("  .--|  |.--|  |.----.", "\n")
    cat("  |  _  ||  _  ||   _|", "\n")
    cat("  |_____||_____||__|", "\n")
    cat("\n")
    cat("data-driven rhythms in R")
    cat("\n")
    cat("\n")
    if(!shut_up) {
        system("say d,d,r")
    }
}
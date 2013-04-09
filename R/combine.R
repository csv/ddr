#' combine multiple waves objects together
#'
#' @param objects a list of wave objects of the same length to be combined
#' @param the bit rate of the objects

#' @return
#' a single wave object
#'
#' @export
#'
#' @examples
#' #not run
combine <- function (objects, unit="16") {
    if(class(objects)!="list"){
        stop("the waves you'd like to combine need to be formatted as a single list, ie list(wave1, wave2)")
    }
    level <- 1/length(objects)

    combine_function <- function(x,y){
        lx <- length(x)
        ly <- length(y)
        if(lx!=ly) {
            if(lx>ly) {
                x <- x[0:ly]
            } else {
                y <- y[0:lx]
            }
        }
        normalize(x, unit=unit, level=level) + normalize(y, unit=unit, level=level)
    }
    output <- Reduce(combine_function, objects)
}

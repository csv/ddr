#' get the time in seconds for a given bpm / count
#'
#' @param bpm beats per minute desired
#' @param count "thirtytwo" = 32 bars (or simply, 32 as numeric) "thirtytwo_" = 1/32nd note, or simpy 1/32 as numeric

#' @return
#' time(in seconds) of a given note
#'
#' @export
#'
#' @examples
#' #not run
bpm_time <- function(bpm=120, count=1) {
	options(digits=20)
	onebar <- (60/bpm)*4

	if(is.character(count)) {
		key	 <-	list(
				  thirtytwo = onebar*32,
				  twentyfour = onebar*24,
				  sixteen = onebar*16,
				  twelve = onebar*12,
				  eleven = onebar*11,
				  ten = onebar*10,
				  nine = onebar*9,
				  eight = onebar*8,
				  seven = onebar*7,
				  six = onebar*6,
				  four = onebar*5,
				  four = onebar*4,
				  three = onebar*3,
				  two = onebar*2,
				  one = onebar,
				  two_ = onebar/2,
				  three_ = onebar/3,
				  four_ = onebar/4,
				  five_ = onebar/5,
				  six_ = onebar/6,
				  seven_ = onebar/7,
				  eight_ = onebar/8,
				  nine_ = onebar/9,
				  ten_ = onebar/10,
				  eleven_ = onebar/11,
				  twelve_ = onebar/12,
				  sixteen_ = onebar/16,
				  twentyfour_ = onebar/24,
				  thirtytwo_ = onebar/32
				)
		if(count=="all"){
			return(key)
		} else {
			return(as.numeric(key[count]))
		}

	} else {
		return(as.numeric(onebar*count))
	}

}

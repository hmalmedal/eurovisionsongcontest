#' Scoreboards of the Eurovision Song Contest
#'
#' Scoreboards of the Eurovision Song Contest scraped from the official website.
#'
#' @name eurovisionsongcontest
#' @docType package
"eurovisionsongcontest"

globalVariables(c("key", "value", "Participant", "Event", "%>%"))

.req <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(sQuote(pkg), " needed. Please install it.", call. = FALSE)
  }
}

.reqs <- function() {
  .req("rvest")
  .req("dplyr")
  .req("stringr")
  .req("tidyr")
}

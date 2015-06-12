#' Scrape an Event
#'
#' @param event_url The event URL
#' @param sleep Amount of seconds to sleep
#'
#' @return A data frame
#' @export
#'
#' @examples
#' \dontrun{
#' scrape("http://www.eurovision.tv/page/history/by-year/contest?event=2083")
#' }
#' @keywords internal
scrape <- function(event_url, sleep = 0) {
  Sys.sleep(sleep)
  .reqs()

  event_html <- rvest::html(event_url)
  event_title <- rvest::html_node(event_html, "title") %>%
    rvest::html_text() %>%
    stringr::str_extract("^.+?(?= \\|)")
  event_date <- rvest::html_node(event_html, ".info:nth-child(2)") %>%
    rvest::html_text() %>%
    lubridate::dmy(locale = "C") %>%
    as.Date()
  scoreboard_node <- rvest::html_nodes(event_html, "table") %>%
    getElement(2)
  scoreboard_header <- rvest::html_nodes(scoreboard_node, "th") %>%
    rvest::html_nodes("img") %>%
    rvest::html_attr("title")
  scoreboard <- rvest::html_table(scoreboard_node)
  i <- which(names(scoreboard) == "")
  names(scoreboard)[i] <- scoreboard_header
  scoreboard$Points <- suppressWarnings(as.integer(scoreboard$Points))
  scoreboard[is.na(scoreboard)] <- 0
  scoreboard %>%
    dplyr::tbl_df() %>%
    dplyr::mutate(Event = event_title, Date = event_date) %>%
    tidyr::gather(key, value, -Participant, -Event, -Date)
}

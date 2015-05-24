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
scrape <- function(event_url, sleep = 0) {
  assert_that(is.number(sleep), sleep >= 0)
  Sys.sleep(sleep)
  assert_that(is.string(event_url))

  event_html <- rvest::html(event_url)
  event_title <- rvest::html_nodes(event_html, "title") %>%
    rvest::html_text() %>%
    stringr::str_extract("^.+?(?= \\|)")
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
    tbl_df() %>%
    mutate(Event = event_title) %>%
    gather(key, value, -Participant, -Event)
}

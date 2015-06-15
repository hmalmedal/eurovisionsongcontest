scrape <- function(event_url, sleep = 0) {
  Sys.sleep(sleep)

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

library(dplyr)
library(stringr)

base_url <- "http://www.eurovision.tv/page/history/by-year/contest?event="
events <- c(
  273:286,
  223,
  287:308,
  235,
  309:315,
  266,
  316,
  217,
  9:8,
  157,
  159,
  333:334,
  434:435,
  1468,
  1470,
  1469,
  1480:1482,
  1503,
  1513,
  1493,
  1533,
  1543,
  1553,
  1573,
  1583,
  1593,
  1783,
  1793,
  1773,
  1883,
  1873,
  1893,
  2073,
  2063,
  2083)
urls <- str_c(base_url, events)
scraped_events <- lapply(urls, scrape, sleep = 10)
eurovisionsongcontest <- bind_rows(scraped_events) %>%
  filter(!str_detect(Event, "1956") | key != "Points") %>%
  distinct() %>%
  filter(!str_detect(Event, "1956") | value != 2 | Participant != "Switzerland")
devtools::use_data(eurovisionsongcontest, overwrite = TRUE)

library(dplyr)
library(stringr)

devtools::load_all()

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
scraped_events <- lapply(urls, scrape, sleep = 1)
eurovisionsongcontest <- bind_rows(scraped_events) %>%
  filter(!str_detect(Event, "1956") | key != "Points") %>%
  distinct() %>%
  filter(!str_detect(Event, "1956") | value != 2 | Participant != "Switzerland")
devtools::use_data(eurovisionsongcontest, overwrite = TRUE)

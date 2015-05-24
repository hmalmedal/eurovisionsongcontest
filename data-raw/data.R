devtools::load_all()

base_url <- "http://www.eurovision.tv/page/history/by-year/contest?event="
events <- c(
  2073,
  2063,
  2083)
urls <- stringr::str_c(base_url, events)
eurovisionsongcontest <- dplyr::bind_rows(lapply(urls, scrape, sleep = 1))
devtools::use_data(eurovisionsongcontest, overwrite = TRUE)

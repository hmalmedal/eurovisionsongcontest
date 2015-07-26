<!-- README.md is generated from README.Rmd. Please edit that file -->
Scoreboards of the Eurovision Song Contest
==========================================

Scoreboards of the Eurovision Song Contest scraped from the official website.

Installation
------------

Install from GitHub:

``` r
devtools::install_github("hmalmedal/eurovisionsongcontest")
```

Usage
-----

Which participants have received zero points in the final the most times?

``` r
library(eurovisionsongcontest)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
eurovisionsongcontest %>%
  spread(key, value) %>%
  select(Participant, Event, Date, Points) %>%
  mutate(Year = year(Date)) %>%
  filter(Points == 0, !str_detect(Event, "Semi")) %>%
  group_by(Participant) %>%
  summarise(n = n(), `Year(s)` = list(Year)) %>%
  arrange(desc(n)) %>%
  knitr::kable()
```

| Participant     |    n| Year(s)                |
|:----------------|----:|:-----------------------|
| Austria         |    4| 1962, 1988, 1991, 2015 |
| Norway          |    4| 1963, 1978, 1981, 1997 |
| Finland         |    3| 1963, 1965, 1982       |
| Germany         |    3| 1964, 1965, 2015       |
| Spain           |    3| 1962, 1965, 1983       |
| Switzerland     |    3| 1964, 1967, 1998       |
| Belgium         |    2| 1962, 1965             |
| Portugal        |    2| 1964, 1997             |
| The Netherlands |    2| 1962, 1963             |
| Turkey          |    2| 1983, 1987             |
| Iceland         |    1| 1989                   |
| Italy           |    1| 1966                   |
| Lithuania       |    1| 1994                   |
| Luxembourg      |    1| 1970                   |
| Monaco          |    1| 1966                   |
| Sweden          |    1| 1963                   |
| United Kingdom  |    1| 2003                   |
| Yugoslavia      |    1| 1964                   |

How often does Greece receive 12 points from Cyprus in the final?

``` r
eurovisionsongcontest %>%
  spread(key, value) %>%
  select(Participant, Event, Cyprus = ends_with("Cyprus")) %>%
  filter(Participant == "Greece", !str_detect(Event, "Semi"),
         Cyprus == 12) %>%
  arrange(Event) %>%
  knitr::kable()
```

| Participant | Event                                    |  Cyprus|
|:------------|:-----------------------------------------|-------:|
| Greece      | Eurovision Song Contest 1983             |      12|
| Greece      | Eurovision Song Contest 1987             |      12|
| Greece      | Eurovision Song Contest 1989             |      12|
| Greece      | Eurovision Song Contest 1992             |      12|
| Greece      | Eurovision Song Contest 1993             |      12|
| Greece      | Eurovision Song Contest 1994             |      12|
| Greece      | Eurovision Song Contest 1995             |      12|
| Greece      | Eurovision Song Contest 1997             |      12|
| Greece      | Eurovision Song Contest 1998             |      12|
| Greece      | Eurovision Song Contest 2002             |      12|
| Greece      | Eurovision Song Contest 2003             |      12|
| Greece      | Eurovision Song Contest 2004 Final       |      12|
| Greece      | Eurovision Song Contest 2005 Final       |      12|
| Greece      | Eurovision Song Contest 2006 Final       |      12|
| Greece      | Eurovision Song Contest 2007 Final       |      12|
| Greece      | Eurovision Song Contest 2008 Final       |      12|
| Greece      | Eurovision Song Contest 2009 Final       |      12|
| Greece      | Eurovision Song Contest 2010 Final       |      12|
| Greece      | Eurovision Song Contest 2011 Final       |      12|
| Greece      | Eurovision Song Contest 2012 Grand Final |      12|
| Greece      | Eurovision Song Contest 2013 Grand Final |      12|

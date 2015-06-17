<!-- README.md is generated from README.Rmd. Please edit that file -->
Scoreboards of the Eurovision Song Contest
==========================================

Install from GitHub:

``` r
devtools::install_github("hmalmedal/eurovisionsongcontest")
```

Which participants have received zero points in the final?

``` r
library(eurovisionsongcontest)
library(dplyr)
library(tidyr)
library(stringr)
eurovisionsongcontest %>%
  spread(key, value) %>%
  select(Participant, Event, Points) %>%
  filter(Points == 0, !str_detect(Event, "Semi")) %>% 
  arrange(Event) %>%
  knitr::kable()
```

| Participant     | Event                                    |  Points|
|:----------------|:-----------------------------------------|-------:|
| Austria         | Eurovision Song Contest 1962             |       0|
| Belgium         | Eurovision Song Contest 1962             |       0|
| Spain           | Eurovision Song Contest 1962             |       0|
| The Netherlands | Eurovision Song Contest 1962             |       0|
| Finland         | Eurovision Song Contest 1963             |       0|
| Norway          | Eurovision Song Contest 1963             |       0|
| Sweden          | Eurovision Song Contest 1963             |       0|
| The Netherlands | Eurovision Song Contest 1963             |       0|
| Germany         | Eurovision Song Contest 1964             |       0|
| Portugal        | Eurovision Song Contest 1964             |       0|
| Switzerland     | Eurovision Song Contest 1964             |       0|
| Yugoslavia      | Eurovision Song Contest 1964             |       0|
| Belgium         | Eurovision Song Contest 1965             |       0|
| Finland         | Eurovision Song Contest 1965             |       0|
| Germany         | Eurovision Song Contest 1965             |       0|
| Spain           | Eurovision Song Contest 1965             |       0|
| Italy           | Eurovision Song Contest 1966             |       0|
| Monaco          | Eurovision Song Contest 1966             |       0|
| Switzerland     | Eurovision Song Contest 1967             |       0|
| Luxembourg      | Eurovision Song Contest 1970             |       0|
| Norway          | Eurovision Song Contest 1978             |       0|
| Norway          | Eurovision Song Contest 1981             |       0|
| Finland         | Eurovision Song Contest 1982             |       0|
| Spain           | Eurovision Song Contest 1983             |       0|
| Turkey          | Eurovision Song Contest 1983             |       0|
| Turkey          | Eurovision Song Contest 1987             |       0|
| Austria         | Eurovision Song Contest 1988             |       0|
| Iceland         | Eurovision Song Contest 1989             |       0|
| Austria         | Eurovision Song Contest 1991             |       0|
| Lithuania       | Eurovision Song Contest 1994             |       0|
| Norway          | Eurovision Song Contest 1997             |       0|
| Portugal        | Eurovision Song Contest 1997             |       0|
| Switzerland     | Eurovision Song Contest 1998             |       0|
| United Kingdom  | Eurovision Song Contest 2003             |       0|
| Austria         | Eurovision Song Contest 2015 Grand Final |       0|
| Germany         | Eurovision Song Contest 2015 Grand Final |       0|

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

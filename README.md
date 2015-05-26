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
  print(n = Inf)
#> Source: local data frame [36 x 3]
#> 
#>        Participant                                    Event Points
#> 1          Austria             Eurovision Song Contest 1962      0
#> 2          Belgium             Eurovision Song Contest 1962      0
#> 3            Spain             Eurovision Song Contest 1962      0
#> 4  The Netherlands             Eurovision Song Contest 1962      0
#> 5          Finland             Eurovision Song Contest 1963      0
#> 6           Norway             Eurovision Song Contest 1963      0
#> 7           Sweden             Eurovision Song Contest 1963      0
#> 8  The Netherlands             Eurovision Song Contest 1963      0
#> 9          Germany             Eurovision Song Contest 1964      0
#> 10        Portugal             Eurovision Song Contest 1964      0
#> 11     Switzerland             Eurovision Song Contest 1964      0
#> 12      Yugoslavia             Eurovision Song Contest 1964      0
#> 13         Belgium             Eurovision Song Contest 1965      0
#> 14         Finland             Eurovision Song Contest 1965      0
#> 15         Germany             Eurovision Song Contest 1965      0
#> 16           Spain             Eurovision Song Contest 1965      0
#> 17           Italy             Eurovision Song Contest 1966      0
#> 18          Monaco             Eurovision Song Contest 1966      0
#> 19     Switzerland             Eurovision Song Contest 1967      0
#> 20      Luxembourg             Eurovision Song Contest 1970      0
#> 21          Norway             Eurovision Song Contest 1978      0
#> 22          Norway             Eurovision Song Contest 1981      0
#> 23         Finland             Eurovision Song Contest 1982      0
#> 24           Spain             Eurovision Song Contest 1983      0
#> 25          Turkey             Eurovision Song Contest 1983      0
#> 26          Turkey             Eurovision Song Contest 1987      0
#> 27         Austria             Eurovision Song Contest 1988      0
#> 28         Iceland             Eurovision Song Contest 1989      0
#> 29         Austria             Eurovision Song Contest 1991      0
#> 30       Lithuania             Eurovision Song Contest 1994      0
#> 31          Norway             Eurovision Song Contest 1997      0
#> 32        Portugal             Eurovision Song Contest 1997      0
#> 33     Switzerland             Eurovision Song Contest 1998      0
#> 34  United Kingdom             Eurovision Song Contest 2003      0
#> 35         Austria Eurovision Song Contest 2015 Grand Final      0
#> 36         Germany Eurovision Song Contest 2015 Grand Final      0
```

How often does Greece receive 12 points from Cyprus in the final?

``` r
eurovisionsongcontest %>%
  spread(key, value) %>%
  select(Participant, Event, Cyprus = ends_with("Cyprus")) %>%
  filter(Participant == "Greece", !str_detect(Event, "Semi"),
         Cyprus == 12) %>%
  arrange(Event) %>%
  print(n = Inf)
#> Source: local data frame [21 x 3]
#> 
#>    Participant                                    Event Cyprus
#> 1       Greece             Eurovision Song Contest 1983     12
#> 2       Greece             Eurovision Song Contest 1987     12
#> 3       Greece             Eurovision Song Contest 1989     12
#> 4       Greece             Eurovision Song Contest 1992     12
#> 5       Greece             Eurovision Song Contest 1993     12
#> 6       Greece             Eurovision Song Contest 1994     12
#> 7       Greece             Eurovision Song Contest 1995     12
#> 8       Greece             Eurovision Song Contest 1997     12
#> 9       Greece             Eurovision Song Contest 1998     12
#> 10      Greece             Eurovision Song Contest 2002     12
#> 11      Greece             Eurovision Song Contest 2003     12
#> 12      Greece       Eurovision Song Contest 2004 Final     12
#> 13      Greece       Eurovision Song Contest 2005 Final     12
#> 14      Greece       Eurovision Song Contest 2006 Final     12
#> 15      Greece       Eurovision Song Contest 2007 Final     12
#> 16      Greece       Eurovision Song Contest 2008 Final     12
#> 17      Greece       Eurovision Song Contest 2009 Final     12
#> 18      Greece       Eurovision Song Contest 2010 Final     12
#> 19      Greece       Eurovision Song Contest 2011 Final     12
#> 20      Greece Eurovision Song Contest 2012 Grand Final     12
#> 21      Greece Eurovision Song Contest 2013 Grand Final     12
```

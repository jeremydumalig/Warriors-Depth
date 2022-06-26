library(tidyverse)
library(gt)
rm(list=ls())

looney <- 
  read_csv(file="looney.csv") %>%
  select(`...1`, `+/-_x`, `2ND PTS`, OREB, DREB, REB, `REB DIFF`, `OPP PTS`, `OPP 2ND PTS`) %>%
  gt() %>%
  tab_style(
    style = list(cell_text(weight = "bold")),
    locations = cells_body(columns = `...1`)
  ) %>%
  tab_spanner(
    label = "Offense",
    columns = c(`+/-_x`, `2ND PTS`)
  ) %>%
  tab_spanner(
    label = "Rebounds",
    columns = c(OREB, DREB, REB, `REB DIFF`)
  ) %>%
  tab_spanner(
    label = "Opponent",
    columns = c(`OPP PTS`, `OPP 2ND PTS`)
  ) %>%
  tab_footnote(
    footnote = "Warriors Rebounds - Opponent Rebounds",
    locations = cells_column_labels(columns=`REB DIFF`)
  ) %>%
  tab_footnote(
    footnote = "Second-Chance Points",
    locations = cells_column_labels(columns=`2ND PTS`)
  ) %>%
  cols_label(
    `...1` = "",
    REB = "TOT",
    OREB = "OFF",
    DREB = "DEF",
    `REB DIFF` = "DIFF",
    `+/-_x` = "+/-",
    `OPP 2ND PTS` = "2ND PTS",
    `OPP PTS` = "PTS"
  ) %>%
  tab_header( 
    title = md("**Kevon Looney**"),
    subtitle = "Per-48 Minutes")

payton <-
  read_csv(file="payton.csv") %>%
  select(`...1`, `+/-_x`, `PTS OFF TO`, STL,
         `OPP PTS`, `OPP FBPS`, `OPP PITP`) %>%
  gt() %>%
  tab_style(
    style = list(cell_text(weight = "bold")),
    locations = cells_body(columns = `...1`)
  ) %>%
  tab_spanner(
    label = "Offense",
    columns = c(`PTS OFF TO`, `+/-_x`)
  ) %>%
  tab_spanner(
    label = "Defense",
    columns = c(STL)
  ) %>%
  tab_spanner(
    label = "Opponent",
    columns = c(`OPP PTS`, `OPP FBPS`, `OPP PITP`)
  ) %>%
  cols_label(
    `...1` = "",
    `OPP PTS` = "PTS",
    `OPP FBPS` = "FBPS",
    `OPP PITP` = "PITP",
    `+/-_x` = "+/-"
  ) %>%
  tab_footnote(
    footnote = "Fastbreak Points",
    locations = cells_column_labels(columns=`OPP FBPS`)
  ) %>%
  tab_footnote(
    footnote = "Points in the Paint",
    locations = cells_column_labels(columns=`OPP PITP`)
  ) %>%
  tab_header( 
    title = md("**Gary Payton II**"),
    subtitle = "Per-48 Minutes")

looney
payton

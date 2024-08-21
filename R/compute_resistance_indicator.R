compute_resistance_indicator <- function(raw_data) {

  indicator <- raw_data$Resistance |>
    dplyr::rename(
      country = region_name,
      value = resistance,
    )

  return(indicator)

}

compute_AMR_burden_indicator <- function(raw_data) {

  indicator <- raw_data$IHME |>
    dplyr::rename(
      country = Location,
      value = Value,
      year = Year
    )

  return(indicator)

}

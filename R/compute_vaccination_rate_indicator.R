compute_vaccination_rate_indicator <- function(raw_data) {

  indicator <- raw_data$GHO |>
    dplyr::select(IndicatorCode, SpatialDim, ParentLocation, TimeDim, NumericValue) |>
    dplyr::filter(IndicatorCode %in% c("PCV3", "WHS4_129")) |>
    tidyr::pivot_wider(names_from = IndicatorCode, values_from = NumericValue) |>
    dplyr::mutate(value = pmax(PCV3, WHS4_129)) |>
    dplyr::select(-c("PCV3", "WHS4_129")) |>
    dplyr::rename(
      country_code = SpatialDim,
      year = TimeDim
    )

  return(indicator)

}

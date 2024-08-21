compute_health_staff_indicator <- function(raw_data) {

  indicator <- raw_data$GHO |>
    dplyr::select(IndicatorCode, SpatialDim, ParentLocation, TimeDim, NumericValue) |>
    dplyr::filter(IndicatorCode %in% c("HWF_0001", "HWF_0006")) |>
    tidyr::pivot_wider(names_from = IndicatorCode, values_from = NumericValue) |>
    dplyr::mutate(value = HWF_0001 + HWF_0006) |>
    dplyr::select(-c("HWF_0001", "HWF_0006")) |>
    dplyr::rename(
      country_code = SpatialDim,
      year = TimeDim
    )

  return(indicator)

}

#' Computes the vaccination rate indicator based on raw AMR surveillance data
#'
#' The indicator is defined as the maximum of the GHO indicators PCV3 and
#' WHS4_129, with a few variables renamed for coherence across indicators.
#'
#' @param raw_data A list of data frames.
#' @returns A data frame.
#' @export
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

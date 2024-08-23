#' Computes the health staff indicator based on raw AMR surveillance data
#'
#' The indicator is the sum of the GHO indicators HWF_0001 and HWF_0006, with a
#' few variables renamed for coherence across indicators.
#'
#' @param raw_data A list of data frames.
#' @returns A data frame.
#' @export
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

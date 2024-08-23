#' Computes the UHC service coverage indicator based on raw AMR surveillance data
#'
#' The indicator is the GHO indicator UHC_SCI_INFECT with a few variables
#' renamed for coherence across indicators.
#'
#' @param raw_data A list of data frames.
#' @returns A data frame.
#' @export
compute_UHC_service_coverage_indicator <- function(raw_data) {

  indicator <- raw_data$GHO |>
    dplyr::select(IndicatorCode, SpatialDim, ParentLocation, TimeDim, NumericValue) |>
    dplyr::filter(IndicatorCode == "UHC_SCI_INFECT") |>
    dplyr::rename(
      country_code = SpatialDim,
      year = TimeDim,
      value = NumericValue
    )

  return(indicator)

}

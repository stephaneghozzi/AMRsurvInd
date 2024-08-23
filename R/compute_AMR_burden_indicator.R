#' Computes the AMR indicator based on raw AMR surveillance data
#'
#' The indicator is composed of the four combinations of DALY's and deaths rates,
#' associated and attributable, with a few variables renamed for coherence
#' across indicators.
#'
#' @param raw_data A list of data frames.
#' @returns A data frame.
#' @export
compute_AMR_burden_indicator <- function(raw_data) {

  indicator <- raw_data$IHME |>
    dplyr::rename(
      country = Location,
      value = Value,
      year = Year
    )

  return(indicator)

}

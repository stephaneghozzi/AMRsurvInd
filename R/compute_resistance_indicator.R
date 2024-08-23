#' Computes the resistance indicator based on raw AMR surveillance data
#'
#' The indicator is the resistance rate from the WHO EURO AMR dashboard with a
#' few variables renamed for coherence across indicators.
#'
#' @param raw_data A list of data frames.
#' @returns A data frame.
#' @export
compute_resistance_indicator <- function(raw_data) {

  indicator <- raw_data$Resistance |>
    dplyr::rename(
      country = region_name,
      value = resistance,
    )

  return(indicator)

}

get_gho_raw_data <- function(gho_api, gho_indicators) {

  raw_data_df <- lapply(
    gho_indicators,
    \(x) get_gho_indicator_data(gho_api, x)
  ) |>
    dplyr::bind_rows() |>
    tibble::as_tibble()

  raw_data <- list(GHO = raw_data_df)

  return(raw_data)

}

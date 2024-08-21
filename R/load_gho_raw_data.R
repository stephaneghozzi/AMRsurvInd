# rda's for GHO with name the indicator
# downloaded using `download_gho_data()`
load_gho_raw_data <- function(data_file_names_full) {

  raw_data_df <- lapply(
    data_file_names_full,
    \(x) get(load(x))
  ) |>
    dplyr::bind_rows() |>
    tibble::as_tibble()

  raw_data <- list(GHO = raw_data_df)

  return(raw_data)

}

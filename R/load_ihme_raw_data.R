# CSV's for IHME no specific name format
# # how to download them manually
load_ihme_raw_data <- function(data_file_names_full) {

  raw_data_df <- lapply(
    data_file_names_full,
    \(x) read.csv(x) |> tibble::as_tibble()
  ) |>
    dplyr::bind_rows() |>
    tibble::as_tibble()

  raw_data <- list(IHME = raw_data_df)

  return(raw_data)

}


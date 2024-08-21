# expects CSV's for EURO with a specific name format
# how to download them manually
load_euro_raw_data <- function(data_file_names_full) {

  raw_data <- lapply(
    data_file_names_full,
    \(x) read.csv(x) |> tibble::as_tibble()
  )
  names(raw_data) <- sapply(
    basename(data_file_names_full),
    \(x) strsplit(x, "_")[[1]][1]
  )

  return(raw_data)

}

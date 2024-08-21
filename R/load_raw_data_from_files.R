# three data sources
load_raw_data_from_files <- function(data_directories, data_source) {

  if (is.null(data_directories[[data_source]])) {

    stop(
      "Please speicify a directory where to find the raw data for ",
      data_source,
      " data."
    )

  } else {

    data_file_names_full <- list.files(
      data_directories[[data_source]],
      full.names = TRUE
    )

  }

  if (data_source == "EURO") {

    raw_data <- load_euro_raw_data(data_file_names_full)

  } else if (data_source == "GHO") {

    raw_data <- load_gho_raw_data(data_file_names_full)

  } else if (data_source == "IHME") {

    raw_data <- load_ihme_raw_data(data_file_names_full)

  } else {

    stop("I don't know how to deal with data source ", data_source, ".")

  }

  return(raw_data)

}

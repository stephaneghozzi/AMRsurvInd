download_gho_data <- function(data_directories, gho_api, gho_indicator) {

  if (is.null(data_directories[["GHO"]])) {

    stop("Please specify the directory where GHO data should be downloaded.")

  } else {

    dir_path <- data_directories[["GHO"]] |> add_trailing_slash()
    dir.create(dir_path, recursive = TRUE, showWarnings = FALSE)

  }

  gho_data <- get_gho_indicator_data(gho_api, gho_indicator)
  save(gho_data, file = paste0(dir_path, gho_indicator,".rda"))

  return(TRUE)

}

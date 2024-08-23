#' Load raw AMR surveillance data
#'
#' `load_raw_data()` loads raw AMR surveillance data from files or download them. Currently only GHO has an accessible API.
#'
#' @param data_directories List of directories where the data to load from files are located.
#' @param data_source_list List of data sources, currently "EURO", "GHO", or "IHME"
#' @param API_accessible Boolean: whether a source has an API from which one can download the data. (If not, it means one has to download data manually.)
#' @param download_from_API Whether to download data from the API's. Applies to all sources with accessible API's.
#' @param gho_api GHO API address.
#'
#' @return A list of data frames.
#' @export
#'
#' @examples
#' \dontrun{
#' data_directories <- c(
#'   EURO = "../AMR-raw-data/EURO",
#'   GHO = "../AMR-raw-data/GHO",
#'   IHME = "../AMR-raw-data/IHME"
#' )
#' data_source_list <- c("EURO", "GHO", "IHME")
#' API_accessible <- c(EURO = FALSE, GHO = TRUE, IHME = FALSE)
#' download_from_API <- FALSE
#' gho_api <- "https://ghoapi.azureedge.net/api/"
#' raw_AMR_surv_data <- load_raw_data(data_directories, data_source_list,
#'   API_accessible, download_from_API, gho_api)
#'}
load_raw_data <- function(data_directories, data_source_list, API_accessible,
  download_from_API, gho_api) {

  raw_data <- list()

  for (data_source in data_source_list) {

    if (download_from_API & API_accessible[[data_source]]) {

      if (data_source == "GHO" & !is.null(gho_api)) {

        raw_data <- raw_data |>
          append(get_gho_raw_data(gho_api, gho_indicators))

      } else {

        stop("I don't know how to download data from ", data_source, "API.")

      }

    } else {

      raw_data <- raw_data |>
        append(
          load_raw_data_from_files(data_directories, data_source)
        )

    }

  }

  return(raw_data)

}

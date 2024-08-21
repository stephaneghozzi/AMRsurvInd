get_gho_indicator_data <- function(gho_api, gho_indicator) {

  gho_api <- add_trailing_slash(gho_api)
  jsonlite::fromJSON(paste0(gho_api, gho_indicator))$value

}

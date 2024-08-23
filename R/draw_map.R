#' Draws a map of the indicator chosen for the last year data are available.
#'
#' @param indicator A data frame. The indicator to be plotted: the variable plotted has to be named `value`, the time variable is `year`, the regions are `region_code_iso3`.
#' @param plot_title A string. The title of the plot.
#' @returns A ggplot object.
#' @export
draw_map <- function(indicator, geo_shapes, plot_title) {

  geo_shapes_indicator <- geo_shapes |>
    dplyr::left_join(
      indicator,
      by = c("ISO_3_CODE" = "region_code_iso3")
    ) |>
    dplyr::filter(!is.na(year) & year == max(year, na.rm = TRUE))

  ggplot2::ggplot() +
    ggplot2::geom_sf(data = geo_shapes_indicator, ggplot2::aes(fill = value)) +
    ggplot2::coord_sf(crs = sf::st_crs("ESRI:54030")) +
    ggplot2::ggtitle(
      paste0(plot_title, " for the year ", unique(geo_shapes_indicator$year))
    )

}

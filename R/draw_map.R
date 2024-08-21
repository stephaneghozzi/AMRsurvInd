# indicator <- resistance_indicator
# plot_title <- "Resistance map"

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

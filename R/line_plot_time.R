# indicator <- vaccination_rate_indicator
# plot_title <- "Vccination rates"
line_plot_time <- function(indicator, plot_title) {

  ggplot2::ggplot(
      indicator |> dplyr::filter(ParentLocation == "Europe"),
      ggplot2::aes(year, value, color = country_code)) +
    ggplot2::geom_line() +
    ggplot2::ggtitle(plot_title) +
    ggplot2::theme(legend.position = "none")

}

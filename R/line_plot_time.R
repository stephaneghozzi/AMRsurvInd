#' Draws a line plot of the indicator against time
#'
#' @param indicator A data frame. The indicator to be plotted: the variable plotted has to be named `value`, the time variable is `year`.
#' @param plot_title A string. The title of the plot.
#' @returns A ggplot object.
#' @export
draw_line_plot_time <- function(indicator, plot_title) {

  ggplot2::ggplot(
      indicator |> dplyr::filter(ParentLocation == "Europe"),
      ggplot2::aes(year, value, color = country_code)) +
    ggplot2::geom_line() +
    ggplot2::ggtitle(plot_title) +
    ggplot2::theme(legend.position = "none")

}

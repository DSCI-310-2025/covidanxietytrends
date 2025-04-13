#' Plot anxiety search trends over time
#'
#' @param df A data frame with at least `date` and `search_trends_anxiety` columns
#' @param output_file Path to save the output figure.
#' @return A ggplot object
#' @importFrom ggplot2 ggplot aes geom_line labs theme element_text ggsave
#' @importFrom rlang .data
#' @export
#' @examples
#' # Create sample data
#' sample_data <- data.frame(
#'   date = as.Date("2020-01-01") + 0:2,
#'   search_trends_anxiety = c(10, 15, 20)
#' )
#'
#' # Create the plot
#' plot <- plot_anxiety_time_series(sample_data, tempfile(fileext = ".png"))
#' print(plot)
#'
#' \dontrun{
#' # Save the plot to a file
#' plot_anxiety_time_series(sample_data, "anxiety_trends.png")
#' }

plot_anxiety_time_series <- function(df, output_file) {
  plot <- ggplot(df, aes(x = .data$date, y = .data$search_trends_anxiety)) +
    geom_line(color = "cornflower blue") +
    labs(
      title = "Google Searches Regarding Anxiety over Time",
      x = "Date",
      y = "Normalized Search Volume"
    ) +
    theme(text = element_text(size = 13))

  # Save the plot using ggsave
  ggsave(output_file, plot = plot, width = 10, height = 6)

  return(plot) # Optional, if you want to return the plot object itself
}

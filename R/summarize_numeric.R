# R/summary_numeric.R

#' Compute Summary Statistic for Numeric Columns
#'
#' @param data A data frame with description with numeric columns to be
#'        summarized (assumed to have no NAs)
#' @return A data frame in wide format with summary stats.
#' @examples
#' # data <- data.frame(a = c(1,2,3), b = c(4,5,6))
#' # summarize_numeric(data)
#' @importFrom dplyr summarize across where everything
#' @importFrom tidyr pivot_longer pivot_wider
#' @importFrom stats quantile median
#' @export
#' @examples
#' # Create sample data
#' sample_data <- data.frame(
#'   search_trends_anxiety = c(10, 12, 15),
#'   new_confirmed = c(100, 120, 130),
#'   non_numeric = c("a", "b", "c")
#' )
#'
#' # Summarize numeric columns
#' summary_stats <- summarize_numeric(sample_data)
#' print(summary_stats)

summarize_numeric <- function(data) {
  requireNamespace("dplyr", quietly = TRUE) # requireNamespace allows for :: operator
  requireNamespace("tidyr", quietly = TRUE)
  Statistic <- value <- NULL
  data |>
    dplyr::summarize(dplyr::across(dplyr::where(is.numeric), list(
      Min = ~min(.x, na.rm = TRUE),
      Q25 = ~quantile(.x, 0.25, na.rm = TRUE),
      Mean = ~mean(.x, na.rm = TRUE),
      Median = ~median(.x, na.rm = TRUE),
      Q75 = ~quantile(.x, 0.75, na.rm = TRUE),
      Max = ~max(.x, na.rm = TRUE)),
      .names = "{.col}_{.fn}")) |>
        tidyr::pivot_longer(     cols = dplyr::everything(),
                             names_to = c("Variable", "Statistic"),
                            names_sep = "_(?=[^_]+$)") |>
        tidyr::pivot_wider(names_from = Statistic, values_from = value)
}

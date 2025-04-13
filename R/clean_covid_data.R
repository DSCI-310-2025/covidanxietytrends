#' Clean and select variables from COVID dataset
#'
#' This function selects relevant columns and removes rows with missing values.
#'
#' @param df A data frame containing the raw COVID dataset
#' @return A cleaned data frame
#' @importFrom dplyr select
#' @importFrom tidyr drop_na
#' @export
#' @examples
#' # Create sample data
#' sample_data <- data.frame(
#'   date = as.Date("2020-01-01") + 0:2,
#'   search_trends_anxiety = c(10, NA, 20),
#'   new_persons_vaccinated = c(1000, 1200, 1500),
#'   new_hospitalized_patients = c(50, 60, 70),
#'   new_confirmed = c(100, 120, 150),
#'   new_intensive_care_patients = c(10, 15, 20),
#'   other_col = c(1, 2, 3)
#' )
#'

clean_covid_data <- function(df) {
  df |>
    dplyr::select(
      dplyr::all_of(c(
        "date",
        "search_trends_anxiety",
        "new_persons_vaccinated",
        "new_hospitalized_patients",
        "new_confirmed",
        "new_intensive_care_patients"
      ))
    ) |>
    tidyr::drop_na()
}

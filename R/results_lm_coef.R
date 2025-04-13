#' create the regression coefficent table and writes it to a csv in the resulte folder as well.
#'
#' @param lm_model A lm model
#' @param output_file  Path to save the output
#' @return returns the lm coefficients and a csv with the data saved onto it
#' @importFrom broom tidy
#' @importFrom readr write_csv
#' @export
#' @examples
#' # Create sample data and fit a model
#' sample_data <- data.frame(
#'   date = as.Date("2020-01-01") + 0:3,
#'   search_trends_anxiety = c(10, 12, 15, 14),
#'   new_persons_vaccinated = c(1000, 1200, 1300, 1100),
#'   new_hospitalized_patients = c(50, 60, 55, 65)
#' )
#' model <- lm(search_trends_anxiety ~ new_persons_vaccinated + new_hospitalized_patients + date,
#'             data = sample_data)
#'
#' # Extract coefficients
#' coef_table <- results_lm_coef(model, tempfile(fileext = ".csv"))
#' print(coef_table)
#'
#' \dontrun{
#' # Save coefficients to a file
#' results_lm_coef(model, "lm_coefficients.csv")
#' }

results_lm_coef <- function(lm_model, output_file) {

    if (!all(class(lm_model) == 'lm')) {
    stop("Please provide a lm model")
    }

    lm_coef <- tidy(lm_model)

    write_csv(lm_coef, output_file)

}


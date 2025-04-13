#' Create results linear regression model with the selected features
#'
#' @param df A data frame with at least `date`,
#'                                      `new_persons_vaccinated`,
#'                                      `new_confirmed`,
#'                                      `new_intensive_care_patients`,
#'                                      `new_hospitalized_patients`
#'                                      `search_trends_anxiety` columns
#' @importFrom stats lm
#' @return returns the final regression model from our results
#' @export
#' @examples
#' # Create sample data
#' sample_data <- data.frame(
#'   date = as.Date("2020-01-01") + 0:3,
#'   search_trends_anxiety = c(10, 12, 15, 14),
#'   new_persons_vaccinated = c(1000, 1200, 1300, 1100),
#'   new_hospitalized_patients = c(50, 60, 55, 65),
#'   new_confirmed = c(100, 120, 130, 110),
#'   new_intensive_care_patients = c(10, 12, 15, 13)
#' )
#'
#' # Fit the model
#' model <- make_final_lm_model(sample_data)
#' summary(model)

make_final_lm_model <- function(df) {

    # Input validation
    required_cols <- c("date", "search_trends_anxiety", "new_persons_vaccinated",
                    "new_hospitalized_patients", "new_confirmed", "new_intensive_care_patients")

    if (!all(required_cols %in% names(df))) {
        missing <- setdiff(required_cols, names(df))
        stop("Missing required columns: ", paste(missing, collapse = ", "))
        }

    lm(search_trends_anxiety ~ new_persons_vaccinated + new_hospitalized_patients + date,
    data = df)

}

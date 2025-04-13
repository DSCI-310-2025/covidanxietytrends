#' predicts the model's R^2 and RMSE and then saves it to a table
#'
#' @param final_model A lm model
#' @param test_df The test split of the data we will be verifying against. This should have date as a numeric value
#' @param output_file  Path to save the output
#' @importFrom stats predict
#' @importFrom Metrics rmse
#' @importFrom tibble tibble
#' @importFrom readr write_csv
#' @return returns a table with the R^2 and RMSE values
#' @export
#' @examples
#' # Create sample training and test data
#' train_data <- data.frame(
#'   date = as.numeric(as.Date("2020-01-01") + 0:3),
#'   search_trends_anxiety = c(10, 12, 15, 14),
#'   new_persons_vaccinated = c(1000, 1200, 1300, 1100),
#'   new_hospitalized_patients = c(50, 60, 55, 65),
#'   new_confirmed = c(100, 120, 130, 110),
#'   new_intensive_care_patients = c(10, 12, 15, 13)
#' )
#' test_data <- data.frame(
#'   date = as.numeric(as.Date("2020-01-05") + 0:1),
#'   search_trends_anxiety = c(16, 18),
#'   new_persons_vaccinated = c(1400, 1500),
#'   new_hospitalized_patients = c(70, 75),
#'   new_confirmed = c(140, 150),
#'   new_intensive_care_patients = c(14, 16)
#' )
#'
#' # Fit a model
#' model <- lm(search_trends_anxiety ~ new_persons_vaccinated + new_hospitalized_patients + date,
#'             data = train_data)
#'
#' # Compute metrics
#' metrics <- model_predictions(model, test_data, tempfile(fileext = ".csv"))
#' print(metrics)
#'
#' \dontrun{
#' # Save metrics to a file
#' model_predictions(model, test_data, "model_metrics.csv")
#' }

model_predictions <- function(final_model, test_df, output_file) {
    # Input validation
    required_cols <- c("date", "search_trends_anxiety", "new_persons_vaccinated",
                     "new_hospitalized_patients", "new_confirmed", "new_intensive_care_patients")

    if (!all(required_cols %in% names(test_df))) {
        missing <- setdiff(required_cols, names(test_df))
        stop("Missing required columns: ", paste(missing, collapse = ", "))
        }


    if (!all(is.numeric(test_df$date))) {
        stop("Date is not numeric")
        }

    # apply the model to predict test data:
    final_model_predictions <- predict(final_model, newdata = test_df)

    # find the RMSE between the model's prediction and the actual values
    final_model_RMSPE = Metrics::rmse(actual = test_df$search_trends_anxiety,
                             predicted = final_model_predictions)

    # create dataframe with RMSPE and R-squared, store it as csv and return it
    metrics_results <- tibble(RMSPE = final_model_RMSPE, R_square = summary(final_model)$r.squared)

    write_csv(metrics_results, output_file)
}

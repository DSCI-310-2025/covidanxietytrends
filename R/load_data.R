#' Load covid data
#'
#' This function takes the path to the raw US COVID-19 tabular data and loads the data.
#' @param file_path Path to CSV file or URL
#' @return A tibble with the loaded data
#' @importFrom readr read_csv
#' @importFrom tibble as_tibble
#' @export
#' @examples
#' \dontrun{
#' # Create a temporary CSV file with sample data
#' temp_file <- tempfile(fileext = ".csv")
#' sample_data <- data.frame(
#'   date = as.Date("2020-01-01") + 0:2,
#'   search_trends_anxiety = c(10, 15, 20),
#'   new_confirmed = c(100, 120, 150)
#' )
#' readr::write_csv(sample_data, temp_file)
#'
#' # Load the data
#' data <- load_data(temp_file)
#' print(data)
#'
#' # Clean up
#' unlink(temp_file)
#' }

load_data <- function(file_path) {
  # Check if the file exists
  if (!file.exists(file_path)) {
    stop("File does not exist: ", file_path)
  }

  # Check if the file is empty
  if (file.size(file_path) == 0) {
    stop("File is empty: ", file_path)
  }

  readr::read_csv(file_path, show_col_types = FALSE)
}

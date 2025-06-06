% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/results_lm_coef.R
\name{results_lm_coef}
\alias{results_lm_coef}
\title{create the regression coefficent table and writes it to a csv in the resulte folder as well.}
\usage{
results_lm_coef(lm_model, output_file)
}
\arguments{
\item{lm_model}{A lm model}

\item{output_file}{Path to save the output}
}
\value{
returns the lm coefficients and a csv with the data saved onto it
}
\description{
create the regression coefficent table and writes it to a csv in the resulte folder as well.
}
\examples{
# Create sample data and fit a model
sample_data <- data.frame(
  date = as.Date("2020-01-01") + 0:3,
  search_trends_anxiety = c(10, 12, 15, 14),
  new_persons_vaccinated = c(1000, 1200, 1300, 1100),
  new_hospitalized_patients = c(50, 60, 55, 65)
)
model <- lm(search_trends_anxiety ~ new_persons_vaccinated + new_hospitalized_patients + date,
            data = sample_data)

# Extract coefficients
coef_table <- results_lm_coef(model, tempfile(fileext = ".csv"))
print(coef_table)

\dontrun{
# Save coefficients to a file
results_lm_coef(model, "lm_coefficients.csv")
}
}

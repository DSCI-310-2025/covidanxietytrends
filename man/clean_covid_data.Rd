% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean_covid_data.R
\name{clean_covid_data}
\alias{clean_covid_data}
\title{Clean and select variables from COVID dataset}
\usage{
clean_covid_data(df)
}
\arguments{
\item{df}{A data frame containing the raw COVID dataset}
}
\value{
A cleaned data frame
}
\description{
This function selects relevant columns and removes rows with missing values.
}
\examples{
# Create sample data
sample_data <- data.frame(
  date = as.Date("2020-01-01") + 0:2,
  search_trends_anxiety = c(10, NA, 20),
  new_persons_vaccinated = c(1000, 1200, 1500),
  new_hospitalized_patients = c(50, 60, 70),
  new_confirmed = c(100, 120, 150),
  new_intensive_care_patients = c(10, 15, 20),
  other_col = c(1, 2, 3)
)

}

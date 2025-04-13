# **covidanxietytrends**
<div style="text-align: right;">
  <a href="https://github.com/yvinc/covidanxietytrends/releases">
    <img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version: 1.0.0">
  </a>
</div>

[![R-CMD-check.yaml](https://github.com/DSCI-310-2025/covidanxietytrends/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/covidanxietytrends/actions/workflows/R-CMD-check.yaml) [![test-coverage.yaml](https://github.com/DSCI-310-2025/covidanxietytrends/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/DSCI-310-2025/covidanxietytrends/actions/workflows/test-coverage.yaml) [![codecov](https://codecov.io/gh/DSCI-310-2025/covidanxietytrends/graph/badge.svg?token=QU0JQ90FKB)](https://codecov.io/gh/DSCI-310-2025/covidanxietytrends)

## R package for COVID-19 and anxiety trends correlation analysis:

The **`covidanxietytrends`** R package provides tools to analyze relationships between COVID-19 public health metrics (hospitalizations, vaccinations) and anxiety-related Google search trends. It includes functions for **data cleaning, visualization, feature selection, and statistical modeling.** Originally designed for the [Google COVID-19 Open Data](https://github.com/GoogleCloudPlatform/covid-19-open-data/blob/main/docs/table-vaccinations.md) vaccination dataset, its modular design allows for extension to other pandemic-related datasets.

## Installation

Install the development version from GitHub:

> **Dependency** package `devtools` is required to use `install_github()`.

> Please use `install.packages("devtools")` to first install the `devtools` library, then run the following code in R:

``` r
# install.packages("devtools")
devtools::install_github("DSCI-310-2025/covidanxietytrends")
```

------------------------------------------------------------------------

## Main Functionality

Key features include:

-   `clean_covid_data()` - Prepares raw COVID-19/anxiety trend data for analysis
-   `eda_viz()` - Generates time-series visualizations of anxiety trends vs COVID metrics
-   `feature_selection()` - Identifies significant pandemic indicators
-   `make_final_lm_model()` - Builds predictive linear models
-   `plot_anxiety_time_series()` - Creates publication-ready trend plots All functions include error handling and automated testing.

## Example Usage

``` r
library(covidanxietytrends)

# Clean sample data
clean_data <- clean_covid_data(covid_df)

# Visualize trends
eda_viz(clean_data)

# Select significant features
selected <- feature_selection(clean_data)

# Build predictive model
model <- make_final_lm_model(clean_data)
```

## Background

This package was made as a part of the curriculum for the University of British Columbia's Data Science 310 course to support our project on the correlation of COVID-19 hospitalization rates, vaccine numbers and Google search trends with the key term of anxiety. The **project repository** can be found [**here**](https://github.com/DSCI-310-2025/dsci-310-group-14) as a usage reference for the functions within this package. The package was developed based on the data found for the [Google COVID-19 Open Data](https://github.com/GoogleCloudPlatform/covid-19-open-data/blob/main/docs/table-vaccinations.md).

------------------------------------------------------------------------

## Testing and CI

-   All functions include unit and integration tests using `testthat`.

## License

Function code base in this project is licensed under the [MIT License](LICENSE.md).

## Dependencies

The `covidanxietytrends` package is built and tested under **R version 4.4.2 (2024-10-31) -- "Pile of Leaves"**. Below are the package dependencies required or recommended for its functionality, testing, and documentation.

### Imports

These packages are required for the core functionality of `covidanxietytrends`:

-   [**dplyr**](https://CRAN.R-project.org/package=dplyr)

-   [**GGally**](https://CRAN.R-project.org/package=GGally)

-   [**ggplot2**](https://CRAN.R-project.org/package=ggplot2)

-   [**readr**](https://CRAN.R-project.org/package=readr)

-   [**stats**](https://CRAN.R-project.org/package=stats)

-   [**tibble**](https://CRAN.R-project.org/package=tibble)

-   [**tidyr**](https://CRAN.R-project.org/package=tidyr)

-   [**leaps**](https://CRAN.R-project.org/package=leaps)

-   [**broom**](https://CRAN.R-project.org/package=broom)

-   [**Metrics**](https://CRAN.R-project.org/package=Metrics)

-   [**lubridate**](https://CRAN.R-project.org/package=lubridate)

-   [**rlang**](https://CRAN.R-project.org/package=rlang)

    > Installing the current `covidanxietytrends` package will also install all the above listed imports.

### Suggested packages

-   [**testthat**](https://CRAN.R-project.org/package=testthat) (\>= 3.0.0)

-   [**knitr**](https://CRAN.R-project.org/package=knitr)

-   [**rmarkdown**](https://CRAN.R-project.org/package=rmarkdown)

-   [**covr**](https://CRAN.R-project.org/package=covr)

-   [**tidymodels**](https://CRAN.R-project.org/package=tidymodels)

-   [**tidyverse**](https://CRAN.R-project.org/package=tidyverse)

-   [**here**](https://CRAN.R-project.org/package=here)

    ------------------------------------------------------------------------

## Contributors

-   Alina Hameed
-   Vincy Huang
-   Alan Lee
-   Charlotte Ren


<!-- README.md is generated from README.Rmd. Please edit that file -->

# AMRsurvInd

<!-- badges: start -->
<!-- badges: end -->

The goal of AMRsurvInd is to compute and visualize AMR surveillance
indicators.

## Installation

You can install the development version of AMRsurvInd like so:

``` r
devtools::install_github("stephaneghozzi/AMRsurvInd")
```

Or download the package files (this repository) and install from source:

``` r
install.packages(path_to_this_folder, repos = NULL, type = "source")
```

## Example

``` r
library(AMRsurvInd)

# Configuration and admin data
config <- yaml::read_yaml("data/config.yml")
geo_shapes <- sf::read_sf(config$shape_file)

# Raw data
raw_data <- load_raw_data(config$data_directories, config$data_source_list,
  config$API_accessible, config$download_from_API, config$gho_api)

# Indicators
resistance_indicator <- compute_resistance_indicator(raw_data)
AMR_burden_indicator <- compute_AMR_burden_indicator(raw_data)
vaccination_rate_indicator <- compute_vaccination_rate_indicator(raw_data)
UHC_service_coverage_indicator <- compute_UHC_service_coverage_indicator(raw_data)
health_staff_indicator <- compute_health_staff_indicator(raw_data)

# Plots
resistance_indicator_map <- draw_map(resistance_indicator, geo_shapes, 
  "Resistance map")
vaccination_rate_time_plot <- draw_line_plot_time(vaccination_rate_indicator, 
  "Vaccination rates")
```

``` r
resistance_indicator_map
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r
vaccination_rate_time_plot
#> Warning: Removed 610 rows containing missing values or values outside the scale range
#> (`geom_line()`).
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

## Data licenses

To be added.

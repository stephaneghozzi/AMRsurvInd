% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_health_staff_indicator.R
\name{compute_health_staff_indicator}
\alias{compute_health_staff_indicator}
\title{Computes the health staff indicator based on raw AMR surveillance data}
\usage{
compute_health_staff_indicator(raw_data)
}
\arguments{
\item{raw_data}{A list of data frames.}
}
\value{
A data frame.
}
\description{
The indicator is the sum of the GHO indicators HWF_0001 and HWF_0006, with a
few variables renamed for coherence across indicators.
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_AMR_burden_indicator.R
\name{compute_AMR_burden_indicator}
\alias{compute_AMR_burden_indicator}
\title{Computes the AMR indicator based on raw AMR surveillance data}
\usage{
compute_AMR_burden_indicator(raw_data)
}
\arguments{
\item{raw_data}{A list of data frames.}
}
\value{
A data frame.
}
\description{
The indicator is composed of the four combinations of DALY's and deaths rates,
associated and attributable, with a few variables renamed for coherence
across indicators.
}

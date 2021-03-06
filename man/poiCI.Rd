% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CIDists.R
\name{poiCI}
\alias{poiCI}
\title{Confidence interval for Poisson counts.}
\usage{
poiCI(x, conf.level = 0.95, type = c("exact", "daly", "byar",
  "asymptotic"), verbose = FALSE)
}
\arguments{
\item{x}{A single number or vector that represents the number of observed successes.}

\item{conf.level}{A number that indicates the level of confidence to use for constructing confidence intervals (default is \code{0.95}).}

\item{type}{A string that identifies the type of method to use for the calculations.  See details.}

\item{verbose}{A logical that indicates whether \code{x} should be included in the returned matrix (\code{=TRUE}) or not (\code{=FALSE}; DEFAULT).}
}
\value{
A #x2 matrix that contains the lower and upper confidence interval bounds as columns and, if \code{verbose=TRUE} \code{x}.
}
\description{
Computes a confidence interval for the Poisson counts.
}
\details{
Computes a CI for the Poisson counts using the \code{exact}, gamma distribution (\code{daly}`), Byar's (\code{byar}), or normal approximation (\code{asymptotic}) methods.  This is largely a wrapper to \code{pois.exact}, \code{pois.daly}, \code{pois.byar}, and \code{pois.approx} functions documented in \code{\link[epitools]{pois.conf.int}}in \pkg{epitools}.
}
\examples{
## Demonstrates using all types at once
poiCI(12)

## Selecting types
poiCI(12,type="daly")
poiCI(12,type="byar")
poiCI(12,type="asymptotic")
poiCI(12,type="asymptotic",verbose=TRUE)
poiCI(12,type=c("exact","daly"))
poiCI(12,type=c("exact","daly"),verbose=TRUE)

## Demonstrates use with multiple inputs
poiCI(c(7,10),type="exact")
poiCI(c(7,10),type="exact",verbose=TRUE)

}
\seealso{
See \code{pois.exact}, \code{pois.daly}, \code{pois.byar}, and \code{pois.approx} (documented in \code{\link[epitools]{pois.conf.int}}) in \pkg{epitools} for more description and references.
}
\author{
Derek H. Ogle, \email{derek@derekogle.com}
}
\keyword{htest}

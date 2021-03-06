\name{summary.glmdr}
\alias{summary.glmdr}
\alias{print.summary.glmdr}
\title{Summarizing Generalized Linear Model Fits}
\usage{
\method{summary}{glmdr}(object, correlation = FALSE,
    symbolic.cor = FALSE, \dots)

\method{print}{summary.glmdr}(x, digits = max(3, getOption("digits") - 3),
      symbolic.cor = x$symbolic.cor,
      signif.stars = getOption("show.signif.stars"), \dots)
}
\arguments{
  \item{object}{an object of class \code{"glmdr"}, usually, a result of a
    call to \code{\link{glmdr}}.}
  \item{x}{an object of class \code{"summary.glmdr"}, usually, a result of a
    call to \code{summary.glmdr}.}
  \item{correlation}{logical; if \code{TRUE}, the correlation matrix of
    the estimated parameters is returned and printed.}
  \item{digits}{the number of significant digits to use when printing.}
  \item{symbolic.cor}{logical. If \code{TRUE}, print the correlations in
    a symbolic form (see \code{\link{symnum}}) rather than as numbers.}
  \item{signif.stars}{logical. If \code{TRUE}, \sQuote{significance stars}
    are printed for each coefficient.}
  \item{\dots}{further arguments passed to or from other methods.}
}
\description{
  These functions are all \code{\link{methods}} for class \code{glmdr} or
  \code{summary.glmdr} objects.
}
\details{
  These functions call \code{\link[stats]{summary.glm}} and
  \code{\link[stats]{print.summary.glm}} to do their work.
  See the details for those functions.

  There are three cases.
  \itemize{
    \item The MLE exists in the original model (OM), in which case
    a note is printed saying this and otherwise the output is the
    same as if one had called \code{\link[stats]{glm}} instead of
    \code{\link{glmdr}}.  This is the case where \code{\link[stats]{glm}}
    does the right thing.
    \item The MLE in the Barndorff-Nielsen completion is completely degenerate,
    concentrated at the observed value of the response vector, in which case
    a note is printed saying this and there is no other output since a
    completely degenerate model has no identifiable parameters.
    \item The MLE in the Barndorff-Nielsen completion is not completely
    degenerate, the limiting conditional model (LCM) conditions on
    the cases such that \code{object$linearity} is \code{FALSE}, in which case
    a note is printed saying this and the output is the
    same as if one had called \code{\link[stats]{glm}} with argument
    \code{subset} that produces this conditioning.
  }
}
\value{
  \code{summary.glmdr} returns an object of class \code{"summary.glmdr"}, a
  list with components

  \item{overview}{the note explaining whether the MLE is in the OM or LCM
    and whether the MLE model is completely degenerate.}
  \item{type}{one of \code{"original"}, \code{"lcm"}, or \code{"degenerate"}.
    A machine readable form of the overview.}
  \item{linearity}{The linearity vector (see Details).  Not present if
    \code{type} is \code{"original"}.}
  \item{summary}{the result of calling \code{\link[stats]{summary.glm}}
    on the fit done by \code{\link[stats]{glm}} on either the OM or the LCM
    as the case may be.  Not present if \code{type} is \code{"degenerate"}.}
}
\seealso{
  \code{\link{glmdr}, \link{glm}}, \code{\link{summary}}.
}
\examples{
## For examples see example(glmdr)
}
\keyword{models}
\keyword{regression}


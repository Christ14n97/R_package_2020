% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Project_Script.R
\name{Clust.Function}
\alias{Clust.Function}
\title{Clust.Function}
\usage{
Clust.Function(df, col1, col2, tag, pc1, pc2)
}
\arguments{
\item{df}{A data frame}

\item{col1}{Numeric parameter, integer, first value of the range of columns to remove}

\item{col2}{Numeric parameter, integer, second value of the range of columns to remove}

\item{tag}{Variable form the data frame which serves as label the data}

\item{pc1}{Numeric parameter, integer, first principal component of interest}

\item{pc2}{Numeric parameter, integer, second principal component of interest}
}
\value{
A dendrogram graph
}
\description{
Clust.Function carries a PCA analysis and generates a cluster dendrogram using
by default the method 'ward.D2'. Clust.Function needs the number of principal components
to be specified.
}
\examples{
Clust.Function(df = MS, col1 = 1, col2 = 5, tag = "Sample", pc1 = 1, pc2 = 23)
}

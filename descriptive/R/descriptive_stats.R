# =============================================================================
# ONDAutils — Basic Descriptive Statistics Functions
# Author : OndaLab

# Dependencies: dplyr, ggplot2, moments, scales, knitr

# Functions overview:
#   pos_index()             – Position indices (mean, median, min, Q1, Q3, max)
#   cv_fun()                – Coefficient of Variation (CV%)
#   var_index()             – Variability indices (SD, Range, IQR, CV)
#   forma_index()           – Shape indices (skewness, excess kurtosis)
#   distr_freq_fun()        – Frequency distribution table    WORK IN PROGRESS!
#   plot_density()          – Density plot with mean & median lines WORK IN PROGRESS!



# Dependencies - What do you need!
if (!requireNamespace("moments", quietly = TRUE))
  stop("Package 'moments' is required. Install it with: install.packages('moments')")
if (!requireNamespace("ggplot2", quietly = TRUE))
  stop("Package 'ggplot2' is required. Install it with: install.packages('ggplot2')")
if (!requireNamespace("dplyr", quietly = TRUE))
  stop("Package 'dplyr' is required. Install it with: install.packages('dplyr')")
if (!requireNamespace("scales", quietly = TRUE))
  stop("Package 'scales' is required. Install it with: install.packages('scales')")

library(moments)
library(ggplot2)
library(dplyr)
library(scales)


# POSITION INDICES


# Compute position indices for a numeric vector
#
#Returns mean, median, minimum, first quartile (Q1), third quartile (Q3)
# and maximum for a numeric vector

# @param x   A numeric vector.
# @param digits Integer. Number of decimal digits for rounding (default 2)

# @return A named numeric vector: Media, Mediana, Min, Q1, Q3, Max

# @examples
# pos_index(c(10, 20, 30, 40, 50)) or  from a dataframe  pos_index(dataset$Variable_name)

pos_index <- function(x, digits = 2) {
  stopifnot(is.numeric(x))
  quant <- quantile(x, na.rm = TRUE)
  c(
    Media   = round(mean(x,   na.rm = TRUE), digits),
    Mediana = round(median(x, na.rm = TRUE), digits),
    Min     = round(quant[1], digits),
    Q1      = round(quant[2], digits),
    Q3      = round(quant[4], digits),
    Max     = round(quant[5], digits)
  )
}



# COEFFICIENT OF VARIATION
#Coefficient of Variation (CV%)

#Computes CV = (sd / mean) * 100.  Returns NA when mean is zero or missing

#@param x      A numeric vector
# @param digits Integer. Number of decimal digits (default 2)

# @return A single numeric value representing CV in percentage

# @examples cv_fun(c(10, 20, 30, 40, 50))

cv_fun <- function(x, digits = 2) {
  stopifnot(is.numeric(x))
  mu    <- mean(x, na.rm = TRUE)
  sigma <- sd(x,   na.rm = TRUE)
  if (is.na(mu) || mu == 0) return(NA_real_)
  round((sigma / mu) * 100, digits)
}



# VARIABILITY INDICES


#Compute variability indices for a numeric vector
#
# Returns standard deviation, range, interquartile range (IQR), and coefficient of variation (CV%).

# @param x  a numeric vector.
# @param digits Integer. Number of decimal digits (default 2).
#
# @return A named numeric vector: D_stand, Range, IQR, CV. 
# @examples var_index(c(10, 20, 30, 40, 50))

var_index <- function(x, digits = 2) {
  stopifnot(is.numeric(x))
  c(
    D_stand = round(sd(x, na.rm = TRUE), digits),
    Range   = round(max(x, na.rm = TRUE) - min(x, na.rm = TRUE), digits),
    IQR     = round(IQR(x, na.rm = TRUE), digits),
    CV      = cv_fun(x, digits)
  )
}



# SHAPE INDICES
# Compute shape indices for a numeric vector

# Returns skewness and excess kurtosis (kurtosis − 3), using the 'moments' package.

#  - Skewness > 0 → right-skewed (positive asymmetry)
#  - Skewness < 0 → left-skewed (negative asymmetry)
#  - Excess kurtosis > 0 → leptokurtic (peaked)
#  - Excess kurtosis < 0 → platykurtic (flat)
#  - Excess kurtosis ≈ 0 → mesokurtic (normal-like)

# @param x  A numeric vector.
# @param digits Integer. Number of decimal digits (default 3) 
# @return A named numeric vector: Asimmetria (skewness), Curtosi (excess kurtosis).
#' @examples  forma_index(c(1, 2, 2, 3, 3, 3, 10))


forma_index <- function(x, digits = 3) {
  stopifnot(is.numeric(x))
  c(
    Asimmetria = round(moments::skewness(x, na.rm = TRUE), digits),
    Curtosi    = round(moments::kurtosis(x, na.rm = TRUE) - 3, digits)
  )
}



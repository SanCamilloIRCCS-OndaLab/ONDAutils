# ONDAutils — `descriptive statistics`

A collection of generic, reusable R functions for **descriptive statistical analysis**. Born from a real dataset analysis project, these functions should work on any data frame.

---

## Installation

Clone or fork the [ONDAutils repository](https://github.com/GiovanniLazzaro/ONDAutils), then source the file:

```r
source("descriptive/R/descriptive_stats.R")
```

### Required packages

```r
install.packages(c("dplyr", "ggplot2", "moments", "scales", "knitr"))
```

---

## Functions

| Function | Description |
|---|---|
| `pos_index(x)` | Position indices: mean, median, min, Q1, Q3, max |
| `cv_fun(x)` | Coefficient of Variation (CV%) |
| `var_index(x)` | Variability indices: SD, Range, IQR, CV |
| `forma_index(x)` | Shape indices: skewness and excess kurtosis |

---

## How to start

```r
source("descriptive/R/descriptive_stats.R")

# ── Single-function usage ─────────────────────────────────────────
pos_index(dataset$Variable_name)
#  Media Mediana     Min      Q1      Q3     Max
#   5.84    5.80    4.30    5.10    6.40    7.90

var_index(dataset$Variable_name)
# D_stand   Range     IQR      CV
#    0.83    3.60    1.30   14.17

forma_index(dataset$Variable_name)
# Asimmetria   Curtosi
#      0.309    -0.606


---

## Function reference

### `pos_index(x, digits = 2)`
Computes position (location) indices for a numeric vector.

```r
pos_index(c(10, 20, 30, 40, 50))
# Media Mediana  Min    Q1    Q3  Max
#    30      30   10  17.5  42.5   50
```

---

### `cv_fun(x, digits = 2)`
Coefficient of Variation — useful for comparing dispersion across variables with different units of measurement. Returns `NA` if the mean is zero.

```r
cv_fun(c(10, 20, 30))   # 52.7 (%)
```

---

### `var_index(x, digits = 2)`
Variability indices in a single call.

```r
var_index(c(10, 20, 30, 40, 50))
# D_stand Range   IQR     CV
#   15.81    40  15.0  52.71
```



### `forma_index(x, digits = 3)`
Skewness and **excess** kurtosis (kurtosis − 3, so a normal distribution gives 0).

| Value | Interpretation |
|---|---|
| Skewness > 0 | Right-skewed distribution |
| Skewness < 0 | Left-skewed distribution |
| Excess kurtosis > 0 | Leptokurtic (peaked) |
| Excess kurtosis < 0 | Platykurtic (flat) |
| Excess kurtosis ≈ 0 | Mesokurtic (normal-like) |

---



## Notes
- Work in progress
- All functions handle `NA` values via `na.rm = TRUE`.
- `forma_index()` requires the **moments** package.
- Tables are formatted with `knitr::kable()` when `kable_out = TRUE` — ideal for R Markdown documents.


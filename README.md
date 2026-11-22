## ONDA Utils

This R package contains generic utility functions developed by the ONDA Lab
and used across its projects (e.g. `cn()`, to quickly list the column names
of a data frame). It contains no domain-specific methods.

To install it you will need `pak` installed

`pak::pak("SanCamilloIRCCS-OndaLab/ONDAutils")`

### Psychometric functions have moved to `cnp`

`simulate_scores()` and `simulate_obs()` are no longer part of `ONDAutils`.
They are now in the [`cnp`](https://github.com/giorgioarcara/cnp) package
(Clinical Neuropsychology Psychometrics), with the same names and arguments:

```r
pak::pak("giorgioarcara/cnp")
library(cnp)
simulate_obs(Ts = 10, n = 30, rel = 0.8, mu_true = 8, sd_true = 2)
```

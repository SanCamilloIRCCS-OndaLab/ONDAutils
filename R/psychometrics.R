#' Simulate scores with given reliability
#'
#' @description
#' A function to simulate scores providing reliability
#' 
#' @param 
#' n = number of observation
#' rel = reliability value (from 0 to 1)
#' mu_true = mean of population
#' sd_true = standard deviation of the population
#'
#' @returns a data frame with two columns, `true.s` and `obs.s`.
#' @export
#' @family psychometrics
#' @examples
#' simulate_scores(n = 100, rel = 0.7, mu_true = 10, sd_true = 1)

simulate_scores <- function(n, rel, mu_true = 0, sd_true = 1) {
if (rel <= 0 || rel >= 1) stop("rel must be in (0,1).")
sd_error <- sd_true * sqrt((1 - rel) / rel)

True  <- rnorm(n, mean = mu_true, sd = sd_true)
Error <- rnorm(n, mean = 0,    sd = sd_error)
Obs   <- True + Error

df = data.frame(true.s = True, obs.s = Obs)

return(df)
}


#' plot simulated scores and optional a cut-off
#'
#' @description
#' A function to simulate scores providing reliability
#' 
#' @param 
#' n = number of observations
#' Ts = the current True score (on which observed are computed)
#' rel = reliability value (from 0 to 1)
#' mu_true = mean of population
#' sd_true = standard deviation of the population
#' label = the title of the plot
#' plot_res = `logical`, a plot with the results.
#' plot_thresh = `logical`, should the threshold be plotted?
#'
#' @returns a vector with observed scores given the true. Optiomally, plot with the simulated scores.
#' @export
#' @family psychometrics
#' @examples
#' simulate_obs(Ts = 5, n = 20, rel=0.8, mu_true = 8, sd_true = 2)

simulate_obs <- function(Ts, n, rel = 0.7, mu_true, sd_true, label="True - observed relationship", plot_res = TRUE, plot_thresh=FALSE){
  
  sd_error <- sd_true * sqrt((1 - rel) / rel)
  Xs = Ts + rnorm(n, mean = 0,    sd = sd_error)

  # set cut-off as compared to the hypothetical Population mean (mu_true)
  cut_off = mu_true-1.64*sd_true
  ylims = c(min(Ts, mu_true)-3*sd_true, max(Ts, mu_true)+3*sd_true)
  
  # calculate mean of observed scores (the larger the number of repeated measurement, the better the approximation to the True score)
  #mean(Xs) 
  
  # histogram of observed scores
  #hist(Xs) 
  
  
  # set point bg (if thre)
  if (plot_thresh){
    curr_bg=ifelse(Xs<=cut_off, "black", "white")
  } else {
    curr_bg="white"
  }
  
  if (plot_res){
  # plot observed scores as compared to True Score
  plot(1:n, Xs, ylim=ylims, pch=21, bg=curr_bg, main=label)
  lines(1:n, Xs)
  abline(h=Ts)
  if (plot_thresh){
    abline(h=cut_off, lty=2) 
  }
  }
  
  # currently deactivated
  #png(paste0("Figure_true_obs_", sd_true, ".png"), res=200, height=800, width=1200)
  #plot(1:n, Xs, ylim=ylims, pch=21, bg=curr_bg, main=label)
  #lines(1:n, Xs)
  #abline(h=Ts)
  #if (plot_thresh){
  #  abline(h=cut_off, lty=2) 
  #}
  #dev.off()
  return(Xs)
  
}


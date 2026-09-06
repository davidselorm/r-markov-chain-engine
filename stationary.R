solve_stationary <- function(P) {
  ev <- eigen(t(P))
  v <- ev$vectors[, 1]
  v <- Re(v)
  return(v / sum(v))
}

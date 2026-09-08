#' Compute Stationary Distribution of an Ergodic Markov Chain
#' Solves pi * P = pi, subject to sum(pi) = 1
solve_stationary <- function(P, method = "eigen") {
  n <- nrow(P)
  if (method == "eigen") {
    ev <- eigen(t(P))
    # Select eigenvector corresponding to eigenvalue 1
    idx <- which.min(abs(ev$values - 1.0))
    v <- Re(ev$vectors[, idx])
    return(v / sum(v))
  } else if (method == "linear") {
    # System: (P^T - I) pi = 0 with constraint sum(pi) = 1
    A <- rbind(t(P) - diag(n), rep(1, n))
    b <- c(rep(0, n), 1)
    pi <- qr.solve(A, b)
    return(as.vector(pi))
  }
}

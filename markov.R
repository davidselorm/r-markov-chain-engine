#' Simulate Discrete-Time Markov Chain (DTMC) trajectory
simulate_markov <- function(transition_matrix, initial_state, steps = 100) {
  n_states <- nrow(transition_matrix)
  history <- integer(steps)
  current <- initial_state
  for (i in seq_len(steps)) {
    history[i] <- current
    current <- sample(seq_len(n_states), 1, prob = transition_matrix[current, ])
  }
  return(history)
}

#' Fundamental Matrix Analysis for Absorbing Markov Chains
#' P = [ Q  R ]
#'     [ 0  I ]
#' Fundamental matrix N = (I - Q)^(-1)
analyze_absorbing <- function(Q) {
  n <- nrow(Q)
  I <- diag(n)
  N <- solve(I - Q)
  expected_steps <- rowSums(N)
  return(list(fundamental_matrix = N, expected_steps_to_absorption = expected_steps))
}

#' Multi-step transition power matrix calculation
transition_power <- function(P, k) {
  result <- diag(nrow(P))
  base <- P
  while (k > 0) {
    if (k %% 2 == 1) result <- result %*% base
    base <- base %*% base
    k <- k %/% 2
  }
  return(result)
}

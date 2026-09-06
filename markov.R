simulate_markov <- function(transition_matrix, initial_state, steps=100) {
  n_states <- nrow(transition_matrix)
  history <- numeric(steps)
  current <- initial_state
  for (i in 1:steps) {
    history[i] <- current
    current <- sample(1:n_states, 1, prob = transition_matrix[current, ])
  }
  return(history)
}

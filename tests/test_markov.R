# Unit test verification for markov chain engine
source("markov.R")
source("stationary.R")

test_weather_chain <- function() {
  # 2-state Rainy/Sunny model
  P <- matrix(c(0.7, 0.3,
                0.4, 0.6), nrow = 2, byrow = TRUE)
  pi <- solve_stationary(P)
  expected <- c(0.4 / (0.3 + 0.4), 0.3 / (0.3 + 0.4))
  stopifnot(abs(pi[1] - expected[1]) < 1e-5)
  message("[PASS] Stationary distribution test succeeded.")
}

test_weather_chain()

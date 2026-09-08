# r-markov-chain-engine

A matrix-accelerated discrete and continuous Markov chain simulation and stationary distribution solver in R.

## Features
- **Trajectory Simulation**: High-speed stochastic state path generator.
- **Stationary Solvers**: Dual algorithms via Left Eigenvector decomposition and Augmented QR Linear Solve.
- **Absorbing Chain Analysis**: Fundamental matrix $N = (I - Q)^{-1}$ and expected steps to absorption.
- **Matrix Exponentiation**: Binary exponentiation for multi-step transition matrices in $O(\log k)$.

## Usage
```R
source("markov.R")
source("stationary.R")

P <- matrix(c(0.8, 0.2, 0.3, 0.7), nrow = 2, byrow = TRUE)
pi <- solve_stationary(P)
print(pi)
```

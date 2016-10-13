# Petite simulation
# Constante

N = 1000
M = 10

# creation du nuage de points
X <- matrix(nrow=N, ncol=M)
for (i in 1:N) {
	for (j in 1:M) {
		X[i, j] = runif(1)
	}

}

# creation du vecteur de pertubations aleatoires
E = rnorm(N) 


# sauvegarde des differentes donnees au format svg
# on doit transmettre les tailles N et M, la matrice X
# et les vecteurs B et E
dtfr <- data.frame(X = X, E = E)
write.csv(dtfr,"petite_sim.csv")

# Moyenne Simulation
# Constante

N = 100000
M = 100

# creation du nuage de points
X <- matrix(nrow=N, ncol=M)
for (i in 1:N) {
	for (j in 1:M) {
		X[i, j] = runif(1)
	}

}

# creation du vecteur de pertubations aleatoires
E = rnorm(N) 


# sauvegarde des differentes donnees au format svg
# on doit transmettre les tailles N et M, la matrice X
# et les vecteurs B et E
dtfr <- data.frame(X = X, E = E)
write.csv(dtfr,"moy_sim.csv")

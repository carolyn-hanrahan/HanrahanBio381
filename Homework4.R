# Atomic Vector Practice - Homework 4

#Assigning a variable 

x <- c(1, 2, 3, 4, 5)

x <- c("hello", "world", "how", "are", "you")

#runif(): the uniform distribution. r unif generates random deviates. Kind of a random number generator
?runif()
set.seed(0)
rand <- runif(20, min=0, max=100)
print(rand)

#Rep function: replicate the values in x
?rep()

#Seq: sequence generation 
?seq()


library(tidyverse)
data(iris)
read.csv("site_by_variables.csv")
read.csv("site_by_species.csv")
x<-iris
library(vctrs)
library(dplyr)


#Question 1
#There are 150 observations in the dataset and 5 variables. 

#Question 2: Create a new data frame iris1 that contains only the species virginica and versicolor with sepal lengths longer than 6 cm and sepal widths longer than 2.5 cm. How many observations and variables are in the data set?
iris1 <- data.frame(iris)


iris1 <- filter(iris, Species == "virginica"| Species=="versicolor", Sepal.Length > 6, Sepal.Width >2.5)

print(iris1)
# There are 56 observations and 5 variables in the Iris1 dataset. 

#Question 3: Now, create a iris2 data frame from iris1 that contains only the columns for Species, Sepal.Length, and Sepal.Width. How many observations and variables are in the data set?

iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width)
print(iris2)

# There are 56 observations and 3 variables in this dataset. 

#Question 4: Create an iris3 data frame from iris2 that orders the observations from largest to smallest sepal length. Show the first 6 rows of this data set.

iris3 <- arrange(iris2, by=desc(Sepal.Length))

head(iris3)

# Question 5: Create an iris4 data frame from iris3 that creates a column with a sepal area (length * width) value for each observation. How many observations and variables are in the data set?


iris4 <- mutate(iris3, Sepal.Area = Sepal.Length * Sepal.Width)
print(iris4)

# There are 56 observations and 4 variables in the iris4 dataset. We added a new column and did not change the row information. 

# Question 6: Create iris5 that calculates the average sepal length, the average sepal width, and the sample size of the entire iris4 data frame and print iris5.


iris5 <- summarize(iris4, avg.sepal.length=mean(Sepal.Length), avg.sepal.width=mean(Sepal.Width), TotalNumber=n())

print(iris5)

#Question 7: Finally, create iris6 that calculates the average sepal length, the average sepal width, and the sample size for each species of in the iris4 data frame and print iris6.

iris6 <- group_by(iris4, Species)
print(iris6)
summarize(iris6, avg.sepal.length=mean(Sepal.Length), avg.sepal.width=mean(Sepal.Width), TotalNumber=n())

# Question 8: In these exercises, you have successively modified different versions of the data frame iris1 iris2 iris3 iris4 iris5 iris6. At each stage, the output data frame from one operation serves as the input fro the next. A more efficient way to do this is to use the pipe operator %>% from the tidyr package. See if you can rework all of your previous statements (except for iris5) into an extended piping operation that uses iris as the input and generates irisFinal as the output.


irisfinal <- iris %>% 
  filter(Species == "virginica"| Species=="versicolor", Sepal.Length >6, Sepal.Width >2.5) %>%
  select( Species, Sepal.Length, Sepal.Width) %>%
  arrange( by=desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  group_by(Species) %>%
  summarize(avg.sepal.length=mean(Sepal.Length), avg.sepal.width=mean(Sepal.Width), TotalNumber=n())


  print(irisfinal)

  # Question 9: Create a ‘longer’ data frame using the original iris data set with three columns named “Species”, “Measure”, “Value”.
  
  


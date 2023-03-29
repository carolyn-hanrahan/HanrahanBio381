
# Functions for Homework 9 
# Carolyn Hanrahan 
# March 29th, 2023 

#Loading Libraries 

library(sqldf)
library(dplyr)
library(tidyverse)
library(ggplot2)


#######################################
# FUNCTION: get_data
# packages: none
# purpose: open a data file from R dataset
# input:
# output: 
#-------------------------------------- 
get_data <- function(file_name="ToothGrowth") {
  
  data("ToothGrowth")
  head <- head(ToothGrowth)
  print(head)
  
  return(get_data)
   
  }
  


#######################################
# FUNCTION: calculate_mean
# packages: none
# purpose: calculates mean of ToothGrowth datset
# input: x and y vectors of numeric. Must be same length
# output: entire model summary from lm
#-------------------------------------- 
calculate_mean <- function(file_name)
                                              {
                    
  treatment0.5 <- filter(file_name, dose==0.5)
  TreatmentMean0.5 <- mean(treatment0.5$len)
 

  treatment1 <- filter(file_name, dose==1)
  TreatmentMean1 <-mean(treatment1$len)

  
  treatment2 <- filter(file_name, dose==2)
  TreatmentMean2 <- mean(treatment2$len)
 
 x <- list(TreatmentMean0.5, TreatmentMean1, TreatmentMean2)
  
  return(x)
}

x <- calculate_mean(ToothGrowth)


#######################################
# FUNCTION: calculate_sd
# packages: none
# purpose: calculates standard deviation of 0.5 mg dosage for dataset "ToothGrowth"
# input:
# output: 
#-------------------------------------- 
calculate_sd <- function(file_name) {
  
    treatment0.5 <- filter(file_name, dose==0.5)
    StandardDev0.5 <- sd(treatment0.5$len)
   
    treatment1 <- filter(file_name, dose==1)  
    StandardDev1 <- sd(treatment1$len)
    
    treatment2 <- filter(file_name, dose==2)
    StandardDev2 <- sd(treatment2$len)
    
    y <- list(StandardDev0.5, StandardDev1, StandardDev2)
    
    return(y)
  
}

y <- calculate_sd(ToothGrowth)

#######################################
# FUNCTION: calculate_variance
# packages: none
# purpose: 
# input:
# output: 
#-------------------------------------- 
#calculate_variance <- function(file_name="ToothGrowth") {
  
#  VarianceTreatment0.5 <- var(treatment0.5$len)
#  print(VarianceTreatment0.5)
#}

#calculate_variance()


#######################################
 #FUNCTION: create_fake_dataset
 #packages: none
# purpose: create fake dataset composed of 60 values 
# input:
# output: 
#-------------------------------------- 
create_fake_dataset <- function(file_name) {
  
  
 NormalDistribution0.5 <- rnorm(20, mean=x[[1]], sd=y[[1]])
  NormalDistribution1 <- rnorm(20, mean=x[[2]], sd=y[[2]])
  NormalDistribution2 <- rnorm(20, mean=x[[3]], sd=y[[3]])
  
  
  DataFrame <- data.frame(Treatment0.5= NormalDistribution0.5, Treatment1= NormalDistribution1, Treatment2= NormalDistribution2)
  
return(DataFrame)
}

FakeDataFrame <- create_fake_dataset()




#######################################
# FUNCTION: pivot_dataset_longer
# packages: none
# purpose: 
# input:
# output: 
#-------------------------------------- 
pivot_dataset_longer <- function(file_name) {
  
  Pivot <- pivot_longer(FakeDataFrame,1:3, names_to = "Treatment")
  print(Pivot)
  
 Pivot$Treatment<-as.factor(Pivot$Treatment)
}

pivot_dataset_longer(ToothGrowth)


#######################################
# FUNCTION: create_boxplot
# packages: none
# purpose: 
# input:
# output: 
#-------------------------------------- 
create_boxplot <- function(file_name) {
  
  Pivot <- pivot_longer(FakeDataFrame,1:3, names_to = "Treatment")
  
 boxplot <- boxplot(formula=Pivot$value~Pivot$Treatment )
 print(boxplot)
 }

create_boxplot()

#######################################
# FUNCTION: calculate_ANOVA
# packages: none
# purpose: 
# input:
# output: 
#-------------------------------------- 
calculate_ANOVA <- function(file_name) {
  
  Pivot <- pivot_longer(FakeDataFrame,1:3, names_to = "Treatment")
  
 ANOVA <- aov(Pivot$value~Pivot$Treatment)
  
 return(ANOVA)
}


calculate_ANOVA()


#######################################
# FUNCTION: create_boxplot2
# packages: none
# purpose: 
# input:
# output: 
#-------------------------------------- 
create_boxplot2 <- function(file_name) {
  
  Pivot <- pivot_longer(FakeDataFrame,1:3, names_to = "Treatment")
  
  boxplot2 <- boxplot(formula=Pivot$value~Pivot$Treatment, 
                      col="green")
return(boxplot2)
}







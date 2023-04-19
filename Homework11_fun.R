##################################################
# function: Sum_Species_Number
# calculates the mean from the number of species (per location)
# input: fish datasets
# output: mean value! 
#------------------------------------------------- 
Sum_Species_Number <- function(d=NULL) {
  library(tidyverse)
 
   ps<-data.frame(d$Location,d$SPECIES,d$NUMBER)


ps <- drop_na(ps)

SumNumberSpecies <- sum(ps$d.NUMBER)

return(SumNumberSpecies)
}

Sum_Species_Number()
#Sum_Species_Number(d=x)

#print(c)

#reg_stats(d=c)



#print(ps)
  
  # other way 
  
  
 # library(dplyr)
  
#ps<-data.frame(c$Location,c$SPECIES,c$NUMBER)
#print(ps)
  
#ps <- drop_na(ps)
  
#print(ps)

#mean(ps$c.NUMBER)



  
## This code is to randomize people for a white elephant gift. 

randomizer <- function(input = TRUE, couples = TRUE, seed = 12){
  ## Creating input for people names
  input = TRUE
  if(input == TRUE){
    names <- data.frame(rbind("Enter Your Name","Second Name goes here"))
    colnames(names) <- "names"
    names <- edit(names)
  }

  ## Creating input for couples
  couples = FALSE
  if(couples == TRUE){
    couples <- data.frame("First Couple Name","Second Couple Name")
    colnames(couples) <- c("Boy","Girl")
    couples <- edit(couples)
  }

  ## Checking for odd number of people. If so the first name is used twice
  n <- nrow(names)
  if(n %% 2 != 0){
    names[n + 1,] <- names[1,]
    n <- nrow(names)
  }
  

  ## Random Shuffle of names to provide a larger number of possibilities
  set.seed(seed)
  ran <- sample(1:n,n)
  
  names.ran <- data.frame("names" = names[ran,])

  ## Cutting the names in half to provide matching
  match <- data.frame("first" = names,"second" = names.ran)

  return(match)
} 

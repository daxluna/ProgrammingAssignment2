## The R package 'matlib' was used for this assignment for validation. It has an
## "inv" functionfor the inversion of the matrix. It was also important to have
## an idea aboutthe determinant of matrix to avoid errors.

## Basically, I tried to use the sample code as my based code. So expect that
## this code would be similar.

## makeCacheMatrix or makeCaMax - I just shortened it. As mentioned, I mostly used
## the sample code. Here 'x' was cached or stored to m.

## storage function
makeCaMax <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
      x <<- y
      m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
      setmean = setmean,
     getmean = getmean) 
} 

## retrieve function. After getting the matrix back. The 'mean' was generated
## and was stored again to m.

cacMean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("loading cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

# start here

#install(matlib)
library(matlib)

## The matrix was created and assigned to 'A'. This will serve as the "input".
## The idea is like in forms, were there is space or box where inputs are placed.


# All inputs here

#A <- matrix(c(2:9,9), nrow = 3, ncol = 3)
A <- matrix(c(4:18,12), nrow = 4, ncol = 4)
A

#B <- inv(A)
#B

# Looking at the determinant of the matrix. After some trial, the result should 
# not be zero. An error was encountered when '0'.

D <- det(A)
print(D) 


thematrix <- makeCaMax(A)
cacMean (thematrix)
cacMean (thematrix)


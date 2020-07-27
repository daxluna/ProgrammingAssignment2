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
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
      setinv = setinv,
     getinv = getinv) 
} 

## retrieve function. After getting the matrix back. The 'mean' was generated
## and was stored again to m.

cacMean <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("loading cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}

A <- matrix(c(2:9,9), nrow = 3, ncol = 3)

D <- det(A)
print(D) 


thematrix <- makeCaMax(A)
cacMean (thematrix)
cacMean (thematrix)


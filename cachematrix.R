## Put comments here that give an overall description of what your
## functions do

## this function takes a matrix and returns an "object"
## this object has 4 functions:
##      get and getInverse: returns the original matrix and its inverse, respectively
##      set and setInverse: takes a matrix and use it as the matrix to operate on 
##        and  the inverse of that matrix, respectively  

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(newMat) {
        mat <<- newMat
        inv <<- NULL
    }
    get <- function(){
        mat
    }
    setInverse <- function(invMatrix) {
        inv <<- invMatrix
    }
    getInverse <- function(){
        inv
    }
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## takes a cachedMatrix object and returns its inverse
## the inverse is either calculated on demnand, or is actually a   
## previously stored (inverse) matrix

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}

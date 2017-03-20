##
## The following function creates a matrix that can cache its inverse.
##
## Arguments:
## x matrix to be created.
##   The inverse of this matrix can be cached using setinvmatrix().
## 
## Example:
## mcm <- makeCacheMatrix()
## mcm$set(matrix(1:4, 2, 2))
## mcm$get()
## mcm$setinvmatrix(solve(mcm$get()))
## mcm$getinvmatrix()
##
makeCacheMatrix <- function(x = matrix()) {
    #
    # set the inverse matrix to NULL as a placeholder for a future value
    #
    i <- NULL
    #
    # Function to set the matrix
    # x - set new matrix to y
    # i - resets the matrix NULL i.e. needs to be recalculated
    #
    set <- function(y) {  
        x <<- y
        i <<- NULL
    }
    #
    # return the matrix x
    #
    get <- function() x
    #
    # set the inverse matrix i to the matrix supplied
    #
    setinvmatrix <- function(matrix) i <<- matrix
    #
    # returns the invese matrix i
    #
    getinvmatrix <- function() i
    #
    # Return the vector containing the functions defined
    #
    list(set = set, get = get,
         setinvmatrix = setinvmatrix,
         getinvmatrix = getinvmatrix)
}
##
## The following function gets the inverse matrix from a cache.
##
## If the inverse matrix is not cached, it is solved using the
## matrix already created in the cache, the inverse is stored in
## the cache and returned.
##
## Arguments:
## x    the cache where the matrix to be inverted is created and the
##      inverse matrix is stored
## ...  further arguments passed to the solve function
## 
## Example:
## mcm <- makeCacheMatrix()
## mcm$set(matrix(1:4, 2, 2))
## 1st call - solve and store inverse matrix in the cache & return it
## cacheSolve(mcm)
## Subsequent calls - return the cached inverse matrix
## cacheSolve(mcm) 
##
cacheSolve <- function(x, ...) {
    #
    # Get the inverse matrix from the cache
    #
    i <- x$getinvmatrix()
    #
    # If inverse matrix is in the cache return it i.e. not null
    #
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    #
    # if the inverse matrix is not in the cache, get the stored matrix, solve
    # for the inverse of this matrix, set the inverse matrix in the cache
    # and return the inverse matrix
    #
    data <- x$get()
    i <- solve(data, ...)
    x$setinvmatrix(i)
    i
}
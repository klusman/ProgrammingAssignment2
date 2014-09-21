#### cachematrix.R ####
#### part of ProgrammingAssignment2


## Function   cacheSolve(matrix) 
## does the same als solve(matrix)
## it returns the inverse-matrix
##
## Function    makeCacheMatrix.
## Out of signt cacheSolve(matrix) uses function makeCacheMatrix.
## it stores and retrieves the last used matrix an with solve(matrix) calculated inverse.
## if function cacheSolve is used two or more times at a row with the same matrix.
## it shoud prevent solve(matrix) being use with the same matrix.
## this could be time efficient with big matrixes

## functions do


## makeCacheMatrix  function
## creates a special list containing a function to
#  1 set the value of the matrix
#  2 get the value of the matrix
#  3 set the value of the inverse matrix
#  4 get the value of the inverse matrix

makeCacheMatrix <- function(x) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## returns inverse matrix
## if possible from cache

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
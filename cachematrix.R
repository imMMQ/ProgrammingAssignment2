## Put comments here that give an overall description of what your functions do
## This function creates a special "matrix" object that can cache its inverse.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) { #Assign the input argument to the x object in the parent environment
        x <<- y
        m <<- NULL           #Assign the value of NULL to the m object in the parent environment. This line of code clears any value of m that had been cached by a prior execution of cachemean().
        }
        get <- function() x
        setsolve <- function(inverse) m <<- inverse
        getsolve <- function() m
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)  # gives the name 'set' to the set() function defined above

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
        ## Return a matrix that is the inverse of 'x'
}

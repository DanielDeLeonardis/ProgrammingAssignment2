source("cachematrix.R")
#?solve
mcm <- makeCacheMatrix(matrix(1:4, 2, 2))
mcm$set(matrix(1:4, 2, 2)) # When set is called the inverse matrix is set to null
mcm$get()
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    4
mcm$getinvmatrix()
# NULL
#mcm$setinvmatrix(solve(mcm$get()))
#mcm$getinvmatrix()
cacheSolve(mcm) # As the cached inverse matrix is NULL, the inverse is solved
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
cacheSolve(mcm)
# getting cached data
#      [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
mcm$set(matrix(5:8, 2, 2))
mcm$get()
#      [,1] [,2]
# [1,]    5    7
# [2,]    6    8
mcm$getinvmatrix()
# NULL
#mcm$setinvmatrix(solve(mcm$get()))
#mcm$getinvmatrix()
cacheSolve(mcm)
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5
cacheSolve(mcm)
# getting cached data
# [,1] [,2]
# [1,]   -4  3.5
# [2,]    3 -2.5

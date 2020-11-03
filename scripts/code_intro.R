# mechanisms
fu <- function(){}
fx <- function(u){}
fv <- function(){}
fy <- function(x, v){}
# skeleton
U <- fu()
X <- fx(U)
V <- fv()
Y <- fy(X, V)

###################
# a 'meta' function that creates
# functions based on a causal 
# skeleton

m <- function(fu, fx, fv, fy){
  function(){
    U <- fu()
    V <- fv()
    X <- fx(U)
    Y <- fy(X, V)
    
    return(c(u=U, x=X, v=V, y=Y))
  }
}
as.list(environment(m))

# system 1 is defined by these mechansims:
fu <- function(){rnorm(1)}
fx <- function(u){u}
fv <- function(){rnorm(1)}
fy <- function(x, v){1+0.5*x+v}

# s1 is a function 'running' system 1:
s1 <- m(fu=fu, fx=fx, fv=fv, fy=fy)

# system 2 is a hard intervention on 
# system 1 where the mechanism for x
# is changed to a fixed value (1):
fx <- function(u){1}

# s2 is a function 'running' system 2:
s2 <- m(fu=fu, fx=fx, fv=fv, fy=fy)

# s
s1()
s2()


# Code

## Simulate Causal Models

The R programming language (see @r2020) is a useful tool for simulating causal models and estimating casual parameters. It is particularly well suited to the task as its built-in statistical functions and its syntax allow us to easily translate causal models into code. 

The simple causal model from section xxx with two switches and a light bulb can be written as

```R
X1 <- 1
X2 <- 0
Y  <- X1 * X2
```

It might be helpful to keep the skeleton of the causal model (as defined by the causal graph) and the functional form of the causal mechanism separately:

```R
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
```


A comparison of probability distributions from several interventions on a system can be simplified by first create a "function factory" (technically a *closure*) which returns a function. 
```R
ff <- function(fu, fx, fv, fy){
  function(){
    U <- fu()
    V <- fv()
    X <- fx(U)
    Y <- fy(X, V)
    
    return(c(u=U, x=X, v=V, y=Y))
  }
}
```

The system before intervention is specified as follows:
```R
# system 1 is defined by these mechansims:
fu <- function(){rnorm(1)}
fx <- function(u){u}
fv <- function(){rnorm(1)}
fy <- function(x, v){1+0.5*x+v}

# s1 is a function 'running' system 1:
s1 <- m(fu=fu, fx=fx, fv=fv, fy=fy)
```
Note that `s1` is a function that takes no parameters

An intervention on the mechanism for $X$ is a replacement of function $f_X(U) = 1$:
```R
# system 2 is a hard intervention on 
# system 1 where the mechanism for x
# is changed to a fixed value (1):
fx <- function(u){1}

# s2 is a function 'running' system 2:
s2 <- m(fu=fu, fx=fx, fv=fv, fy=fy)
```

Each function call provides a draw from the distribution of its system:
```R
> s1()
        u         x         v         y 
0.3272407 0.3272407 1.4474576 2.6110779 
> s2()
         u          x          v          y 
1.46572184 1.00000000 0.01263931 1.51263931
```


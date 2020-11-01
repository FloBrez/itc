# Application - Epidemiology

# s = symptoms {none, minor, medium, heavy, death}
# s_reduced = {alive, death}
# e = exposure to SARS-CoV-2 {yes, no}
# t = test performed {yes, no}
# rep_i = reported as infected {yes, no}
# rep_d = reported as died {yes, no}
# i = infected with SARS-CoV-2 {yes, no}
# o = infected with other pulmonary virus {yes, no}
# age = age in years


# simuation parameters
n   <- 1000 # population
p_z <- c(0.1, 0.2, 0.4, 0.15, 0.1, 0.05); sum(p_z)
z <- rep(1:6, p_z * n)

########
# the (default) mechanisms

# reported as infected
m_rep_i <- function(t, i){
  x_num <- (t == "yes") * (i == "yes")
  x     <- if (x_num == 1) "yes" else "no"
  return(x)
}

m_rep_i("yes", "yes")
m_rep_i("yes", "no")
m_rep_i("no", "yes")
m_rep_i("no", "no")



# intro to causality
# example tutoring
library(tidyverse)
library(hrbrthemes)

# z = grade of student at the half-time of the school year {1, 2, 3, 4, 5, 6}
# x = indicator of whether the student gets tutoring the rest of the school year {0, 1}
# y = indicator of whether the student passes the test at the end of the school year {0, 1}



n   <- 1000 # population
p_z <- c(0.1, 0.2, 0.4, 0.15, 0.1, 0.05); sum(p_z)
z <- rep(1:6, p_z * n)

########
# scenario 1: deterministic, tutoring for all grades >= 4
x <- 1*(z >= 4)
y <- 1*(z < 5 | (z == 5 & x == 1))
df <- tibble(test = y, tutoring = x, grade = z)
ce1 <- df %>% group_by(grade) %>% summarize(cnt = n(), pct_tutored = mean(tutoring), pct_passing = mean(test)) %>% mutate(scm = "A")

# scenario 2: deterministic, tutoring for all grades >= 4
x <- 1*(z >= 6)
y <- 1*(z < 5 | (z == 5 & x == 1))
df <- tibble(test = y, tutoring = x, grade = z)
ce2 <- df %>% group_by(grade) %>% summarize(cnt = n(), pct_tutored = mean(tutoring), pct_passing = mean(test)) %>% mutate(scm = "B")

ce <- ce1 %>% bind_rows(ce2)

p1 <- ce %>% 
  ggplot(aes(x = grade, y = pct_passing, group = scm, color = scm)) + 
  geom_point(size = 2) + 
  scale_color_ipsum() +
  scale_x_continuous(breaks = 1:6, limits = c(1, 6), minor_breaks = FALSE) +
  scale_y_continuous(breaks = seq(0, 1, 0.2), limits = c(0.0, 1), labels = function(x) format(x * 100, scientific = FALSE)) +
  labs(x = "grade", y = "% passing the final test",
       title = "Observed E(Y|Z) in SCM xx") + 
  theme_ipsum_rc()

ggsave("./test.png", p1)


########
# scenario 3: probabilistic, tutoring for all grades >= 4
x <- 1*(z == 6 & runif(n) > 0.75) + 
     1*(z == 5 & runif(n) > 0.80) +
     1*(z == 4 & runif(n) > 0.90) +
     1*(z == 3 & runif(n) > 0.95) +
     1*(z == 2 & runif(n) > 0.95) +
     1*(z == 1 & runif(n) > 1.00) 
y <- 1*(z == 6 & x == 0 & runif(n) < 0.80) +
     1*(z == 5 & x == 0 & runif(n) < 0.85) +
     1*(z == 4 & x == 0 & runif(n) < 0.92) +
     1*(z == 3 & x == 0 & runif(n) < 0.96) +
     1*(z == 2 & x == 0 & runif(n) < 0.98) +
     1*(z == 1 & x == 0 & runif(n) < 0.99) +
     1*(z == 6 & x == 1 & runif(n) < 0.75) +
     1*(z == 5 & x == 1 & runif(n) < 0.90) +
     1*(z == 4 & x == 1 & runif(n) < 0.95) +
     1*(z == 3 & x == 1 & runif(n) < 0.98) +
     1*(z == 2 & x == 1 & runif(n) < 0.97) +
     1*(z == 1 & x == 1 & runif(n) < 0.95) 
df <- tibble(test = y, tutoring = x, grade = z)
ce3 <- df %>% group_by(grade, tutoring) %>% summarize(cnt = n(), pct_tutored = mean(tutoring), pct_passing = mean(test)) %>% 
  mutate(tutoring = if_else(tutoring == 1, "tutored", "not tutored"))
ce3 %>% 
  ggplot(aes(x = grade, y = pct_passing, group = tutoring, color = tutoring)) + 
  geom_point(size = 2) + 
  scale_color_ipsum() +
  scale_x_continuous(breaks = 1:6, limits = c(1, 6), minor_breaks = FALSE) +
  scale_y_continuous(breaks = seq(0, 1, 0.2), limits = c(0.5, 1), labels = function(x) format(x * 100, scientific = FALSE)) +
  labs(x = "grade", y = "% passing the final test",
       title = "Observed E(Y|Z) in SCM xx") + 
  theme_ipsum_rc()

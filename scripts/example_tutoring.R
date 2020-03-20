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
# conditinal expectation
ce1 <- df %>% group_by(grade) %>% summarize(cnt = n(), pct_tutored = mean(tutoring), pct_passing = mean(test))
ce1
ce1 %>% ggplot(aes(x = grade, y = pct_passing)) + geom_point() + 
  scale_x_continuous(breaks = 1:6, limits = c(1, 6), minor_breaks = FALSE) +
  scale_y_continuous(breaks = seq(0, 1, 0.2), limits = c(0, 1), labels = function(x) format(x * 100, scientific = FALSE)) +
  labs(x = "grade", y = "% passing the final test") + 
  theme_ft_rc()
df %>% group_by(tutoring) %>% summarize(cnt = n(), pct_passing = mean(test))


########
# scenario 1: deterministic, tutoring for all grades >= 4


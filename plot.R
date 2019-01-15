library(tidyverse)

attempts_df <- tibble(
  robot_master = c("Metal Man", "Quick Man", "Bubble Man", "Air Man", "Wood Man", "Crash Man", "Flash Man", "Heat Man"),
  attempts = c(1, 6, 3, 3, 4, 2, 4, 1)
)

attempts_plot <- ggplot(attempts_df, aes(x = robot_master, y = attempts)) +
  geom_bar(stat = "identity") +
  xlab("Robot Master") +
  ylab("Attempts") +
  theme_minimal()

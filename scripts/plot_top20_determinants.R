library(ggplot2)
library(dplyr)
library(viridis)

det <- read.delim("top20_determinants.tsv",
                  header = TRUE,
                  sep = "\t",
                  stringsAsFactors = FALSE)

det <- det %>%
  arrange(Detection_Records) %>%
  mutate(
    AMR_Determinant = factor(
      AMR_Determinant,
      levels = AMR_Determinant
    )
  )

p <- ggplot(det,
            aes(x = Detection_Records,
                y = AMR_Determinant,
                fill = Detection_Frequency_Percent)) +
  geom_col() +
  scale_fill_viridis_c(option = "turbo") +
  labs(
    title = "Top 20 AMR Determinants",
    x = "Number of AMR Detection Records",
    y = "AMR Determinant",
    fill = "Sample Detection\nFrequency (%)"
  ) +
  theme_minimal()

ggsave("top20_AMR_determinants.png",
       p,
       width = 11,
       height = 8,
       dpi = 300)

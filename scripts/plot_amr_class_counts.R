library(ggplot2)
library(dplyr)

amr_counts <- read.delim("sample_class_counts.tsv",
                         header = FALSE,
                         sep = "\t",
                         stringsAsFactors = FALSE)

colnames(amr_counts) <- c("Sample", "AMR_Class", "Detection_Records")

amr_counts <- amr_counts %>%
  group_by(Sample) %>%
  mutate(Total = sum(Detection_Records)) %>%
  ungroup()

p <- ggplot(amr_counts,
            aes(x = Sample,
                y = Detection_Records,
                fill = AMR_Class)) +
  geom_col() +
  scale_fill_viridis_d(option = "turbo") +
  labs(
    title = "AMR Detection Records by Sample and Resistance Class",
    x = "Sample",
    y = "Number of AMR Detection Records",
    fill = "AMR Class"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "right"
  )

ggsave("AMR_class_counts_by_sample.png",
       p,
       width = 12,
       height = 7,
       dpi = 300)

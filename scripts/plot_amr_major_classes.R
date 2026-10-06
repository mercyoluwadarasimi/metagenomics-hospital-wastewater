library(ggplot2)
library(dplyr)
library(viridis)

amr_counts <- read.delim("sample_class_counts_major.tsv",
                         header = FALSE,
                         sep = "\t",
                         stringsAsFactors = FALSE)

colnames(amr_counts) <- c("Sample", "AMR_Class", "Detection_Records")

amr_counts <- amr_counts %>%
  mutate(
    AMR_Class = factor(
      AMR_Class,
      levels = c(
        "BETA-LACTAM",
        "AMINOGLYCOSIDE",
        "TETRACYCLINE",
        "MACROLIDE",
        "TRIMETHOPRIM",
        "PHENICOL",
        "QUATERNARY AMMONIUM",
        "Other"
      )
    )
  )

p <- ggplot(amr_counts,
            aes(x = Sample,
                y = Detection_Records,
                fill = AMR_Class)) +
  geom_col() +
  scale_fill_viridis_d(option = "turbo") +
  labs(
    title = "Major AMR Classes by Sample",
    x = "Sample",
    y = "Number of AMR Detection Records",
    fill = "AMR Class"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "right"
  )

ggsave("AMR_major_classes_by_sample.png",
       p,
       width = 11,
       height = 7,
       dpi = 300)

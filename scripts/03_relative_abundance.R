# Relative abundance analysis
# Hospital wastewater metagenomics project

# Load packages
library(dplyr)
library(tidyr)
library(ggplot2)

# Read genus-level abundance table
genus_abundance <- read.delim(
  "genus_abundance.tsv",
  header = TRUE,
  sep = "\t",
  check.names = FALSE
)

# Convert abundance counts to relative abundance (%)
relative_abundance <- genus_abundance %>%
  mutate(
    across(
      S1:S6,
      ~ .x / sum(.x) * 100
    )
  )

# Convert to long format
relative_long <- relative_abundance %>%
  pivot_longer(
    cols = S1:S6,
    names_to = "Sample",
    values_to = "Relative_Abundance"
  )

# Identify the top 20 genera based on mean abundance
top20_all <- relative_long %>%
  group_by(Genus) %>%
  summarise(
    Mean_Abundance = mean(Relative_Abundance),
    .groups = "drop"
  ) %>%
  arrange(desc(Mean_Abundance)) %>%
  slice_head(n = 20)

# Keep the top 20 genera
top20_long <- relative_long %>%
  semi_join(top20_all, by = "Genus")

# Order genera by mean abundance
top20_long <- top20_long %>%
  mutate(
    Genus = factor(
      Genus,
      levels = top20_all$Genus
    )
  )

# Top-20 grouped bar plot
png(
  "results/top20_relative_abundance.png",
  width = 1600,
  height = 1000,
  res = 150
)

ggplot(
  top20_long,
  aes(
    x = Genus,
    y = Relative_Abundance,
    fill = Sample
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Relative Abundance of the Top 20 Genera Across Samples",
    x = "Genus",
    y = "Relative Abundance (%)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

dev.off()

# Top-20 heatmap
png(
  "results/top20_relative_abundance_heatmap.png",
  width = 1400,
  height = 1200,
  res = 150
)

ggplot(
  top20_long,
  aes(
    x = Sample,
    y = Genus,
    fill = Relative_Abundance
  )
) +
  geom_tile() +
  labs(
    title = "Relative Abundance of the Top 20 Genera",
    x = "Sample",
    y = "Genus",
    fill = "Relative Abundance (%)"
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_text(size = 9)
  )

dev.off()

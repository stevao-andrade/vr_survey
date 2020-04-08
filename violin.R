# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)

# Load dataset from github
data <- read.table("VR_survey.csv", header=TRUE, sep=",")
data <- data %>% 
  gather(key="text", value="value") %>%
  mutate(text = gsub("\\.", " ",text)) %>%
  mutate(value = round(as.numeric(value),0)) %>%
  filter(text %in% c("Almost Certainly","Very Good Chance","We Believe","Likely","About Even", "Little Chance", "Chances Are Slight", "Almost No Chance"))

# Plot
data %>%
  mutate(text = fct_reorder(text, value)) %>%
  ggplot( aes(x=text, y=value, fill=text, color=text)) +
    geom_violin(width=2.1, size=0.2) +
    scale_fill_viridis(discrete=TRUE) +
    scale_color_viridis(discrete=TRUE) +
    theme_ipsum() +
    theme(
      legend.position="none"
    ) +
    coord_flip() +
    xlab("") +
    ylab("Assigned Probability (%)")
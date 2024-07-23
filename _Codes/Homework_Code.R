# Load required packages
library(ggplot2)
library(dplyr)
library(car)  # For ANOVA
library(stats)  # For correlation

# Set working directory --------------
setwd("/Users/carlosmartinez/Documents/Scholaship BIO/Research Methods/Homework in R") #(you change it to the path to your folder)
# read file --------------------------
Photosurvey<-read.csv("Photosurvey.csv")

# Basic structure of the data
str(Photosurvey)

# Data exploration --------------------

# 1. Summary of live coverage by site and season
  summary_data <- Photosurvey %>%
  group_by(site, season) %>%
  summarize(mean_live_coverage = mean(live_coverage, na.rm = TRUE), .groups = 'drop')

print(summary_data)

# Two-way ANOVA for Algae by site and season
anova_site_season <- aov(Algae ~ site * season, data = Photosurvey)
summary(anova_site_season)

# Plot data ---------------------------

# 2. Plotting Algae by site and season
ggplot(Photosurvey, aes(x = site, y = Algae, fill = season)) +
  geom_boxplot(width = 0.5) +
  labs(
    title = "Algae by Site and Season",
    x = "Site",
    y = "Algae (#)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, hjust = 0.5),  # Adjust size as needed, hjust = 0.5 centers the title
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 12),               # Adjust size for axis text
    panel.grid.major = element_line(color = "grey50"),  # Darker major grid lines
    panel.grid.minor = element_line(color = "grey70"),   # Darker minor grid lines
  )

# 3. Plotting Algae by depth
ggplot(Photosurvey, aes(x = factor(depth), y = Algae, fill = season)) +
  geom_boxplot(width = 0.5) +
  labs(
    title = "Algae by Depth and Season",
    x = "Depth (m)",
    y = "Algae (#)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, hjust = 0.5),  # Adjust size as needed, hjust = 0.5 centers the title
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 12),               # Adjust size for axis text
    panel.grid.major = element_line(color = "grey50"),  # Darker major grid lines
    panel.grid.minor = element_line(color = "grey70"),   # Darker minor grid lines
  )

# One-way ANOVA for Algae by depth
anova_depth <- aov(Algae ~ factor(depth), data = Photosurvey)
summary(anova_depth)

# 4. Plotting Algae by year
ggplot(Photosurvey, aes(x = factor(Year), y = Algae, fill = site)) +
  geom_boxplot(width = 0.5) +
  labs(
    title = "Algae by Year and Site",
    x = "Year",
    y = "Algae (#)"
  ) +
  theme_minimal()+
  theme(
    plot.title = element_text(size = 20, hjust = 0.5),  # Adjust size as needed, hjust = 0.5 centers the title
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 12),               # Adjust size for axis text
    panel.grid.major = element_line(color = "grey50"),  # Darker major grid lines
    panel.grid.minor = element_line(color = "grey70"),   # Darker minor grid lines
  )


# One-way ANOVA for Algae by year
anova_year <- aov(Algae ~ factor(Year), data = Photosurvey)
summary(anova_year)

# 5. Plotting mean live coverage by taxonomic groups Algae and Bryozoa
ggplot(Photosurvey, aes(x = Algae, y = Bryozoa, color = site)) +
  geom_point(size=4) +
  labs(
    title = "Relationship between Algae and Bryozoa Coverage",
    x = "Algae Coverage (%)",
    y = "Bryozoa Coverage (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, hjust = 0.5),  # Adjust size as needed, hjust = 0.5 centers the title
    axis.title = element_text(size = 15),
    axis.text = element_text(size = 12),               # Adjust size for axis text
    panel.grid.major = element_line(color = "grey50"),  # Darker major grid lines
    panel.grid.minor = element_line(color = "grey70"),   # Darker minor grid lines
  )

# Pearson correlation test between Algae and Bryozoa coverage
cor_test <- cor.test(Photosurvey$Algae, Photosurvey$Bryozoa)
print(cor_test)


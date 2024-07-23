---
layout: post
title: Photosurvey Homework
date: '2024-07-17'
categories: Homeworks
tags: R
---
# Data Analysis of Photosurvey
## Objective
The objective of this analysis is to explore and understand the variation in algae coverage across different sites, seasons, depths, and years. The data was processed using R, and various statistical analyses were conducted to determine the significance of these factors. The complete code can be found here: ![Code in R](https://github.com/DieGrungeDie/CarlosNotebook/blob/main/_Codes/Homework_Code.R)

### Data Loading and Structure
First, the necessary libraries were loaded, and the working directory was set. The dataset Photosurvey.csv, the data set was obtained from a previous class exercise. was then read into R and its structure was examined:

~~~R
# Load required packages
library(ggplot2)
library(dplyr)
library(car)  # For ANOVA
library(stats)  # For correlation

# Set working directory
setwd("/Users/carlosmartinez/Documents/Scholaship BIO/Research Methods/Homework in R")

# Load the dataset
Photosurvey <- read.csv("Photosurvey.csv")

# Basic structure of the data
str(Photosurvey)
~~~
The dataset contains 340 observations and 23 variables, including Year, site, depth, season, Algae, Bryozoa, and live_coverage.

### Data Exploration
Summary of Live Coverage by Site and Season
A summary of live coverage by site and season was calculated:

~~~R
# Summary of live coverage by site and season
summary_data <- Photosurvey %>%
  group_by(site, season) %>%
  summarize(mean_live_coverage = mean(live_coverage, na.rm = TRUE), .groups = 'drop')

print(summary_data)
~~~

The results showed:

|Site|	Season|	Mean Live Coverage (%)|
|----|-------|------------------|
|Achziv|	Fall|	71.0|
|Achziv|	Spring	|72.6|
|SdotYam|	Fall	|62.0|
|SdotYam	|Spring|	67.9|

### Statistical Analysis
#### Two-Way ANOVA for Algae by Site and Season
A two-way ANOVA was conducted to examine the effects of site and season on algae coverage:

~~~R
# Two-way ANOVA for Algae by site and season
anova_site_season <- aov(Algae ~ site * season, data = Photosurvey)
summary(anova_site_season)
~~~

The results indicated that the site has a significant effect on algae coverage (p < 0.001), while the season showed a trend towards significance (p = 0.062). The interaction between site and season was not significant (p = 0.300).

#### One-Way ANOVA for Algae by Depth
A one-way ANOVA was performed to determine the effect of depth on algae coverage:

~~~R
# One-way ANOVA for Algae by depth
anova_depth <- aov(Algae ~ factor(depth), data = Photosurvey)
summary(anova_depth)
~~~
The depth had a highly significant effect on algae coverage (p < 0.001).

#### One-Way ANOVA for Algae by Year
A one-way ANOVA was conducted to assess the effect of year on algae coverage:

~~~R
# One-way ANOVA for Algae by year
anova_year <- aov(Algae ~ factor(Year), data = Photosurvey)
summary(anova_year)
~~~

The year also had a significant effect on algae coverage (p < 0.001).

#### Correlation between Algae and Bryozoa Coverage
The relationship between algae and bryozoa coverage was examined using a Pearson correlation test:

~~~r
# Pearson correlation test between Algae and Bryozoa coverage
cor_test <- cor.test(Photosurvey$Algae, Photosurvey$Bryozoa)
print(cor_test)
~~~

Results: 

~~~R
	Pearson's product-moment correlation

data:  Photosurvey$Algae and Photosurvey$Bryozoa
t = -19.131, df = 338, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.7684608 -0.6657249
sample estimates:
       cor 
-0.7210323
~~~

The Pearson correlation test showed a strong negative correlation between algae and bryozoa coverage (r = -0.721, p < 2.2e-16), indicating that as algae coverage increases, bryozoa coverage tends to decrease.

###Data Visualization

The following plots were created to visualize the data:

#### Algae by Site and Season:

~~~R
ggplot(Photosurvey, aes(x = site, y = Algae, fill = season)) +
  geom_boxplot() +
  labs(
    title = "Algae by Site and Season",
    x = "Site",
    y = "Algae (#)"
  ) +
  theme_minimal()

~~~
![Algae by Site and Season](https://raw.githubusercontent.com/DieGrungeDie/CarlosNotebook/8fbe4f36b0043feda79620a69855ebd870e99d5e/_images/Research_Methods_Homework_images/Algaesiteseason.svg)

#### Algae by Depth and Season:

~~~R
ggplot(Photosurvey, aes(x = factor(depth), y = Algae, fill = season)) +
  geom_boxplot() +
  labs(
    title = "Algae by Depth and Season",
    x = "Depth (m)",
    y = "Algae (#)"
  ) +
  theme_minimal()

~~~
![Algae by Depth and Season](https://raw.githubusercontent.com/DieGrungeDie/CarlosNotebook/8fbe4f36b0043feda79620a69855ebd870e99d5e/_images/Research_Methods_Homework_images/Algaedepthseason.svg)

#### Algae by Year and Site:

~~~R
ggplot(Photosurvey, aes(x = factor(Year), y = Algae, fill = site)) +
  geom_boxplot() +
  labs(
    title = "Algae by Year and Site",
    x = "Year",
    y = "Algae (#)"
  ) +
  theme_minimal()

~~~
![Algae by Year and Site](https://raw.githubusercontent.com/DieGrungeDie/CarlosNotebook/8fbe4f36b0043feda79620a69855ebd870e99d5e/_images/Research_Methods_Homework_images/Algae_year_site.svg)

#### Relationship between Algae and Bryozoa Coverage:
~~~R
ggplot(Photosurvey, aes(x = Algae, y = Bryozoa, color = site)) +
  geom_point() +
  labs(
    title = "Relationship between Algae and Bryozoa Coverage",
    x = "Algae Coverage (%)",
    y = "Bryozoa Coverage (%)"
  ) +
  theme_minimal()

~~~
![Relationship between Algae and Bryozoa Coverage](https://raw.githubusercontent.com/DieGrungeDie/CarlosNotebook/66b39d76ece727fc235a5ef6bade7b59566d5b81/_images/Research_Methods_Homework_images/AlgaeBryozoa.svg)

## Conclusion
The analysis revealed significant effects of site, depth, and year on algae coverage. The interaction between site and season was not significant, indicating that the effect of the season might not differ significantly between sites. The strong negative correlation between algae and bryozoa coverage suggests a competitive relationship between these taxonomic groups.

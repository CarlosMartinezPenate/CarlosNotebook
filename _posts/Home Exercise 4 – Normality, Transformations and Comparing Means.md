# Home Exercise 4 – Normality, Transformations and Comparing Means
Presented by: Carlos Martinez

Collect data to run the following tests and statistical analyses
Normality and Transformations

1.	Normality test before and after log transformation
2.	Normality test before and after sqrt transformation
3.	Normality test before and after arcsin transformation of proportion
4. Single sample t-test
5. Parametric Two sample t-test [independent samples]
6. Parametric Paired t-test [dependent samples]
7. Non-parametric test [2 independent samples]

## Introduction

### Normality Testing

Normality tests asses whether a data set follows a normal distribution, a probability distribution that is symmetric about the mean, showing that data near the mean are more frequent in occurrence than data far from the mean. The normal distribution appears as a "bell curve" when graphed. This test aims to validate whether parametric tests (which assume normality) can be used.

#### Shapiro-Wilk Test
The Shapiro-Wilk test uses pre-computed weights, the relationship between the actual data, and a perfect normal distribution. By comparing the weighted sum of the data to its overall variance, the test determines if the data deviates from normality. The result is a test statistic  𝑊 and a p-value, which help decide whether to reject the null hypothesis that the data is normal.

#### Data Transformations
When data does not meet normality, transformations stabilize variance and reshape the distribution. The goal is to make the data suitable for parametric tests.

##### Hypothesis:
Null Hypothesis (H₀): The data follows a normal distribution.

Alternative Hypothesis (Hₐ): The data does NOT follow a normal distribution.

If the p-value > 0.05 → Fail to reject H₀ → The data follows a normal distribution.

If the p-value ≤ 0.05 → Reject H₀ → The data does NOT follows a normal distribution.


### Single Sample t-test
It is used to compare the mean of a single sample to a known or hypothesized population mean, it tests whether the sample mean is significantly different from the population mean.
##### Hypothesis:

Null Hypothesis (H₀): The sample mean is equal to the hypothesized population mean.

Alternative Hypothesis (Hₐ): The sample mean is NOT equal to the hypothesized population mean

A p-value less than the significance level ( 𝛼 = 0.05) means the sample mean is significantly different from the hypothesized mean.

### Parametric Two Sample t-test (Independent Samples)

It compares two related samples to test if the mean difference is significantly different from zero.

##### Hypothesis:
Null Hypothesis (H₀): The mean difference between paired observations is zero.

Alternative Hypothesis (Hₐ): The mean difference between paired observations is NOT zero.

### Non-Parametric Test for Two Independent Samples

Used to compare the medians of two independent groups when the assumptions of the parametric t-test are not met. It is a rank-based test and does not rely on the normal distribution of the data.

##### Hypothesis:
Null Hypothesis (H₀): The two independent groups have the same distribution (no significant difference in medians).

Alternative Hypothesis (Hₐ): The two independent groups DON'T have the same distribution (significant difference in medians).

## Methods

The data set is extracted from Kaggle, the data set used can be found at: [Dataset](https://www.kaggle.com/datasets/unsdsn/world-happiness?select=2019.csv). 

### About dataset:
The World Happiness Report is a landmark survey of the state of global happiness. The first report was published in 2012, the second in 2013, the third in 2015, and the fourth in the 2016 Update. The World Happiness 2017, which ranks 155 countries by their happiness levels, was released at the United Nations at an event celebrating International Day of Happiness on March 20th. The report continues to gain global recognition as governments, organizations and civil society increasingly use happiness indicators to inform their policy-making decisions. Leading experts across fields – economics, psychology, survey analysis, national statistics, health, public policy and more – describe how measurements of well-being can be used effectively to assess the progress of nations. The reports review the state of happiness in the world today and show how the new science of happiness explains personal and national variations in happiness.

## Results

### 1. Normality test before and after log transformation
For this test the data of Happiness score was used: 
#### Before Transformation:

![Score Before Log](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.06.33 PM.png)
The p-value is bigger than 0.05. this means the data for happiness score is normally distributed and the null hypothesis fails to be rejected

#### After log transformation:
![Score after Log](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.12.06 PM.png)

The p-value is smaller than 0.05 after the transformation. this means the data for the happiness score is not normally distributed and the null hypothesis rejected.


### 2. Normality test before and after sqrt transformation
For this test, the data of GDP per capita was used:

#### Before squrt transformation:
![Before sqrt transformation](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.17.57 PM.png)

p-value is less than 0.05, the null hypothesis is rejected. This means the data for GDP per capita does not follow a normal distribution.

#### After sqrt transformation:
![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.24.12 PM.png)
Again we reject the null hypothesis due to a small p-value. The data is not normally distributed

### 3. Normality test before and after acrsin transformation:
For this test, the data for the perception of corruption in the dataset was used.

#### Before arcsin transformation:
![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.29.33 PM.png)
Again we reject the null hypothesis due to a small p-value. The data is not normally distributed.

#### After arcsin transformation:
![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.33.26 PM.png)
Once again, even after the transformation the null hypothesis is rejected, the data is not normally distributed

### 4. Single sample t-test
The test will be applied to the hypothesis:  "The average GDP per capita differs from 1.0."


Null Hypothesis (H₀): The mean DGP is equal to 1.0

$ H_0: μ_{GDP} = 1 $

Alternative Hypothesis (Hₐ): The mean GDP is NOT equal 1.0

$ H_1: μ_{GDP} ≠ 1 $


####Result of the test: 
![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 3.45.31 PM.png)

Since the significance level is below 0.05, we reject the null hypothesis and conclude that the sample mean of GDP differs significantly from 1.0.

### 5. Parametric Two sample t-test [independent samples]

For this test, a variable was added to group the regions in Latin American and non-Latin American countries, and the happiness score was used to test if the means were different.

#### Hypothesis:

Null Hypothesis (H₀):
There is no significant difference in the happiness scores between Latin American and Non-Latin American countries.

$ H_0: μ_{Happiness_{LA}} = μ_{Happiness_{non-LA}}$

Alternative Hypothesis (H₁):
There is a significant difference in the happiness scores between Latin American and Non-Latin American countries.

$ H_1: μ_{Happiness_{LA}} ≠ μ_{Happiness_{non-LA}}$
#### Results:

![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 4.03.00 PM.png)

Based on the output, we can conclude there is a statistically significant difference in happiness scores between Latin American and non-Latin American countries. The happiness score in Latin American countries is lower than in non-Latin American countries. The result is statistically significant, with a p-value of less than 0.001, indicating a strong likelihood that the observed difference is not due to random chance.

### 6. Parametric Paired t-test [dependent samples]

For this test the happiness score for 2018 was compared to the happiness score for 2019 was used.
#### Hypothesis:
Null Hypothesis (H₀): There is no significant difference between the median of the happiness scores in 2018 and 2019

$ H_0: μ_{2018} = μ_{2019}$

Alternative Hypothesis (H₁):
There is a significant difference between the median of the happiness scores in 2018 and 2019.


$ H_1: 𝜇_{ 2018} ≠ 𝜇_{2019}$

#### Result:
![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 4.35.24 PM.png)

Since the p-value (0.568) is greater than 0.05, we fail to reject the null hypothesis. This means that there is no statistically significant difference between the happiness scores for 2018 and 2019.
Thus, based on this analysis, we can conclude that the happiness scores in 2018 and 2019 are not significantly different.

### 7. Non-parametric test [2 independent samples]

For this test, we will use the corruption perception data and the groups of Latin American and non-Latin-American countries:

#### Hypothesis:
Null Hypothesis (H₀): There is no significant difference in corruption perception scores between Latin American and Non-Latin American countries.

$ H_0: μ_{corruption_{LA}} = μ_{corruption_{non-LA}}$

Alternative Hypothesis (H₁): There is a significant difference in corruption perception scores between Latin American and Non-Latin American countries.

$ H_1: μ_{corruption_{LA}} ≠ μ_{corruption_{non-LA}}$


#### Result:

![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 4.43.45 PM.png)


The Asymp. Sig. (2-tailed) value is 0.086, Since 0.086 > 0.05, the result is not statistically significant at the 0.05 level. We fail to reject the null hypothesis There is no statistically significant difference in perceptions of corruption between Latin American and Non-Latin American countries based on this test.



### 8. Exercise: 

The research objective is to test the hypothesis that cats that feed on La-Cat dietetic food lose weight. 7 overweight cats were sampled, once before feeding with the dietetic food, and again after 5 weeks on the dietetic food only. Here are the results: 

| Cat No.           | 1   | 2   | 3   | 4   | 5   | 6   | 7   |
|-------------------|-----|-----|-----|-----|-----|-----|-----|
| Regular Food      | 7.2 | 10.5| 8   | 7.3 | 6.5 | 7.5 | 9.5 |
| After Dietetic Food | 8.5 | 8.9 | 8.3 | 6.4 | 7.2 | 6.9 | 8.4 |


Assume non normal distribution of the difference between measurements and test the hypothesis, at a significance level of 5% [define hypotheses, explain the analysis you chose to perform and why, run the analysis and explain the results]. 

#### Solution

First we transform the data so it is ordered in raws and not in columns, then we introduce it to SSPS data sheet. 

#### Hypothesis

Null Hypothesis (H₀): 

Cats that feed on the dietetic food do not lose weight

$ H_0: \text{Median(regular food Weight)} = \text{Median(Weight after dietetic food)} $

Alternative Hypothesis (H₁):

Cats that feed on dietetic food lose weight
$ H_1: \text{Median(Weight before)} \neq \text{Median(Weight after)}$

Since the data is paired and the difference between the weights does not follow a normal distribution, we use a Parametric Paired t-test, in SPSS we go to Analyze > Nonparametric Tests > Legacy Dialogs > 2 Related Samples...

#### Result:

![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 5.56.00 PM.png)

![](/Users/carlosmartinez/Desktop/Screenshot 2024-12-16 at 5.56.16 PM.png)




Since \( p = 0.499 > 0.05 \), we fail to reject the null hypothesis $ H_0 $. There is no statistically significant difference in the weights of cats before and after feeding on the La-Cat dietetic food.


# Title: Assignment 2
# Subtitle: Crim 250: Statistics for the Social Sciences
# Name: Sophie Faircloth
# Date: 09/27/2021


# Instructions: Copy your code, paste it into a Word document, and turn it into Canvas. You can turn in a .docx or .pdf file. Show any EDA (graphical or non-graphical) you have used to come to this conclusion.


# Problem 1: Load data

# Set your working directory to the folder where you downloaded the data.
setwd("~/Documents/GitHub/SophieCRIM250")

# Read the data
dat <- read.csv(file = 'dat.nsduh.small.1.csv')

# What are the dimensions of the dataset? 

names(dat)
dim(dat)

- The dimensions are 171 x 7

## Problem 2: Variables

# Describe the variables in the dataset.
- mjage is a variable that denotes how old someone was the first time they used marijuana or hashish
- cigage is a variable that denotes how old someone was when they first started smoking cigarettes every day
- iralcage is a variable that denotes how old someone was when they first tried alcohol, numbers greater than 900 implying never used or lack of answer
- age2 is a variable that splits people up into groups based on respondent age
- sexatract is a variable that splits people into groups based on sexual attraction, each number denoting a different sexual preference
- speakengl is a variable that splits people into groups based off of their english literacy
- irsex is a variable that splits people into two different groups based on a binary gender system, 1 being male and 2 being female

# What is this dataset about? Who collected the data, what kind of sample is it, and what was the purpose of generating the data?
- This dataset is about the health and drug use statistics of the United States. 
- This data is from the National Survey on Drug Use and Health, conducted by The Substance Abuse and Mental Health Services Administration in the US Department of Health and Human Services.
- This is a random sample.
- The data was generated for the sake of government agencies, private organizations, individual researchers, and the public at large for a number of different purposes.
- This data is used mainly to provide more information on substance use and demographic statistics in the United States.

## Problem 3: Age and gender

# What is the age distribution of the sample like? Make sure you read the codebook to know what the variable values mean.
hist(dat$age2)
summary(dat$age2)
- The age distribution is left skewed, with a mean of 13.98 (representing ages 26-29) and median of 15 (representing ages 35-49). 
# Do you think this age distribution representative of the US population? Why or why  not?
- I do feel like this sample is representative. The distribution of ages in the age set are misleading; the ages of 18-49 (as represented by groups 7-15) are the majority of the sample, which is consistent with the most recent US Census. 
# Is the sample balanced in terms of gender? If not, are there more females or males?
summary(dat$irsex)
- This sample is fairly balanced in terms of gender. The mean for the irsex variable is 1.468, meaning the sample is fairly balanced in terms of sex.
# Use this code to draw a stacked bar plot to view the relationship between sex and age. What can you conclude from this plot?
tab.agesex <- table(dat$irsex, dat$age2)
barplot(tab.agesex,
        main = "Stacked barchart",
        xlab = "Age category", ylab = "Frequency",
        legend.text = rownames(tab.agesex),
        beside = FALSE) # Stacked bars (default)
- This plot demonstrates that the distribution is fairly balanced in age, with the majority of participants on either tail of the data being mainly males.

## Problem 4: Substance use

# For which of the three substances included in the dataset (marijuana, alcohol, and cigarettes) do individuals tend to use the substance earlier?
par(mfrow=c(3,1))
hist(dat$mjage, col = 'red', ylab = 'Frequency', xlab = 'Age category', main = 'Histogram of Marijuana Usage')
hist(dat$cigage , col = 'red', ylab = 'Frequency', xlab = 'Age category', main = 'Histogram of Cigarette Usage')
hist(dat$iralcage, col = 'red', ylab = 'Frequency', xlab = 'Age category', main = 'Histogram of Alcohol Consumption')
- Individuals tend to use marijuana at the youngest age out of the three substances.

## Problem 5: Sexual attraction
library(ggplot2)
# What does the distribution of sexual attraction look like? Is this what you expected?
hist(dat$sexatract)
summary(dat$sexatract)
table(dat$sexatract)
- According to the numeric system for sexual attraction, this gives the distribution a strong right skew.
- This is not a necessarily surprising result, considering there is generally a strong heterosexual representation in the United States, especially on representative surveys.
- While I do not feel this is truly representative of the United States, there are many people who may feel uncomfortable correctly identifying sexual preference on a survey used by government organizations and regarding personal information (even if it is later encoded).

# What is the distribution of sexual attraction by gender? 
genatt <- table(dat$irsex, dat$sexatract)
barplot(genatt,
        main = "Stacked barchart",
        xlab = "Gender", ylab = "Frequency",
        legend.text = rownames(genatt),
        beside = FALSE) # Stacked bars (default)
sum(dat$sexatract == 1 & dat$irsex == 1)
- 82
sum(dat$sexatract == 1 & dat$irsex == 2)
- 54
- The distribution of sexual attraction is highly populated by those who identified (via the codebook) as only being attracted to the opposite gender.
- A smaller number of women identify as being heterosexual than men, thought this could be slightly biased due to a smaller sample size of women.
## Problem 6: English speaking

# What does the distribution of English speaking look like in the sample? Is this what you might expect for a random sample of the US population?
summary(dat$speakengl)
table(dat$speakengl)
- Majority of the sample are English speakers, with 169 of the 171 respondents self-identifying as speaking English well or very well and only two respondents not speaking English well.
- This is not what I would expect from a random sample of the US, but makes sense in the fact that this is a survey administered in English, probably leading to some sampling bias in a high yield of English speakers.
# Are there more English speaker females or males?
sum(dat$speakengl == 1 & dat$irsex == 1)
- 84
sum(dat$speakengl == 1 & dat$irsex == 2)
- 77
sum(dat$speakengl == 2 & dat$irsex == 1)
- 7
sum(dat$speakengl == 2 & dat$irsex == 2)
- 1
sum(dat$speakengl == 3 & dat$irsex == 1)
- 0
sum(dat$speakengl == 3 & dat$irsex == 2)
- 2
- Assuming that we say that "not an English speaker" is characterized by someone self-assessing themselves as speaking English "not well," there is a higher number of female non-English speakers.
- This means that, from this very limited data set, there is a higher number of male English speakers.



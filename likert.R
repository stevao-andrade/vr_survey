library(googlesheets)
library(dplyr)
library(likert)

sheet <- read.csv("/home/stevao/workspace/vr_survey/VR_Survey.csv", header=TRUE)
vr_survey <- as.data.frame(sheet)
vr_survey <- vr_survey[-(1:13)]
vr_survey <- vr_survey[-(8:17)]

my_levels <- c("Strongly disagree",
               "Disagree",
               "Neither agree nor disagree",
               "Agree",
               "Strongly agree")

a <-colnames(vr_survey)

names(vr_survey)[names(vr_survey) == a[1]] <- "Q1"
names(vr_survey)[names(vr_survey) == a[2]] <- "Q2"
names(vr_survey)[names(vr_survey) == a[3]] <- "Q3"
names(vr_survey)[names(vr_survey) == a[4]] <- "Q4"
names(vr_survey)[names(vr_survey) == a[5]] <- "Q5"
names(vr_survey)[names(vr_survey) == a[6]] <- "Q6"
names(vr_survey)[names(vr_survey) == a[7]] <- "Q7"

colsummary <- likert(vr_survey)
summary(colsummary)
p <- plot(colsummary,
          legend.position = "top",
          legend = "",
          text.size = 4,
          low.color = "lightblue",
          high.col = "lightgreen")
p

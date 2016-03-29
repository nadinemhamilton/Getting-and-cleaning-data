---
title: "Getting anc Cleaning Data Course Project by Nadine Hamilton"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Background
The purpose of this assignment is to take a suite of data files containing measurements captured by activity monitors and produce a clean data set as an output. It takes as input the following files:
- features.txt
- activity_labels.txt
- test/y_test.txt
- test/subject_test.txt
- train/y_train.txt
- train/subject_train.txt

and produces 2 output files:
1. a file called "combined_mean_signal_data.txt" containing the summarised data by activity (WALKING, STANDING etc.) and subject ID (1-30) for all mean() and std() measurements in the original files
2 a file called "clean_signal_data.txt" containing mean and standard deviation measurements merged with activity labels and subject IDs.

The input data files are downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and are delimited format files.

The script run_analysis.R assumes the dyplr package has been previously installed. 

## Instructions
(@) Download the input data files as .zip and unpack into a directory called "UCI HAR Dataset"
(@) Set your working directory to the folder containing UCI HAR Dataset using the command setwd
```
> setwd("your path")
```
(@) Execute the script run_analysis.R
```
> source(run_analysis.R)
```
(@) Verify two output files have been created in the working directory called "combined_mean_signal.txt" (10299 rows  and 68 columns) and "clean_signal_data.txt" (180 rows and 68 columns).
```
> clean_data <- read.table("clean_signal_data.txt", header = TRUE)
> clean_mean_data <- read.table("combined_mean_signal_data.txt", header = TRUE)
```

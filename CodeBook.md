---
title: "CodeBook.md"
output: html_document
---


## Variables
The following variables are contained in the output file "combined_mean_signal_data.txt" produced by the run_analysis.R programme.

These measures represent averages for each measure by activity and subject and are split by body and gravity acceleration. The base measures are limited to mean or standard deviation (before summarisation) of data captured from 30 test subjects wearning a smartphone device for six activities of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. The built-in accelerometer and gyroscope was used to capture the data.

Abbreviations used:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
'Body' is used to indicate body acceleration measure
'Gyro' is used to indicate gyroscope acceleration measure

Variable Name|Description
-------------|-----------
tBodyAcc-XYZ| Time based signal of body acceleration
tGravityAcc-XYZ| Time based signal of gravity acceleration
tBodyAccJerk-XYZ| Time based signal of acceleration jerk
tBodyGyro-XYZ| Time based signal of gyroscope movement
tBodyGyroJerk-XYZ| Time based signal of gyroscope jerk
tBodyAccMag| Time based signal of body acceleration magnitude
tGravityAccMag| Time based signal of gravity acceleration magnitude
tBodyAccJerkMag| Time based signal of body acceleration jerk magnitude
tBodyGyroMag| Time based signal of body gyroscope magnitude
tBodyGyroJerkMag | Time based signal of body gyroscope jerk magnitude
fBodyAcc-XYZ | Fast Fourier Transform (FFT) applied to the body acceleration signal
fBodyAccJerk-XYZ| Fast Fourier Transform (FFT) applied to the body acceleration jerk signal
fBodyGyro-XYZ| Fast Fourier Transform (FFT) applied to the gyroscope signal
fBodyAccMag| Fast Fourier Transform (FFT) applied to the body acceleration magnitude
fBodyAccJerkMag| Fast Fourier Transform (FFT) applied to the body acceleration jerk magnitude
fBodyGyroMag| Fast Fourier Transform (FFT) applied to the body gyroscope magnitude
fBodyGyroJerkMag| Fast Fourier Transform (FFT) applied to the body gyroscope jerk magnitude

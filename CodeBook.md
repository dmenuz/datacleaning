---
title: "CodeBook"
author: "DMenuz"
date: "December 23, 2015"
output: html_document
---

#Data
Data is from a project entitled Human Activity Recognition Using Smartphones Data Set 
see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more information

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This codebook describes variables derived from the above experiment. Training and testing data has been combined together and then mean values were taken for all of the mean and standard deviation variables in the dataset.

#Variables
Variables in the tidydata.txt dataset are derived from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.The original dataset included many values for each variable, subject, activity combination, whereas the tidydata.txt dataset includes only the mean values per subject and activity. 

The accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

There are a total of 66 columns in the dataset.A simplified list of column names is displayed below and described above. The suffix mean() or std() indicates that a column represented the mean per subject and per activity of the mean or standard deviation of a variable. The suffices -X, -Y or -Z is used to denoate 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

#Analysis Steps

1. Data was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", stored locally and unzipped
2. Testing and training data were read in, including activities, subjects, and results. Labels for the activities and colnames for the results were also read in.
3. Final testing and training datasets were created by binding the activites, subjects and results together for each. The activity labels were used to convert the activity codes to descriptive names.
4. Final testing and training datasets were merged together with a variable called "test" or "train" indicating the source of the data
5. The merged dataset was substted to obtain only those columns representing the mean and standard deviation, as well as the activity and subject columns
6. Updated the column names of the subset dataset to the appropriate names, from the results labels read in for step 2
7. Obtained the mean value for all of the mean and standard deviation values, by subject and activity level
8. Saved new file as tidydata.csv
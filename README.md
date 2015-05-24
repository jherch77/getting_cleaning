### Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
You will be graded by your peers on a series of yes/no questions related to the project.
You will be required to submit:
1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

You should also include a README.md in the repo with your scripts.
This repo explains how all of the scripts work and how they are connected. 

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### What the script does 

You should create one R script called run_analysis.R that does the following.
1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### What is in this repository 

1.  README.md - This file
2.  run_analysis.R - The R script to create the tidy data set.
3.  codebook.md - The codebook for the data set 

### Instructions

1.  Download the data files
2.  Extract on your working directory
3.  clone this repository
4.  Set repository root as working directory 
5.  run the script `source("run_anaylsis.R")`

You can find the tidy_data.txt file on your working directory. 

You can view it as follows:

```
data <- read.table("tidy_data.txt", header = TRUE)
    View(data)
```
This repo was generated to get and clean the data from experiment of Human Activity Recognition Using Smartphones Dataset.

1. Download and unzip the data file.
2. Read the data tables into R studio
3. Write R sourse code and download into R working directory.
4. Execute R code to generate tidy data file.


Data description

Data are collected from 30 subjects wearing waist-mounted Samsung Galaxy S smartphoneThe. variables in the data X are sensor signals collected from wearable smartphone. The variable in the data Y are activity type the subjects performed during recording. The 30 subjucts are andomly grouped into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


This repository contains the following files:

1. README.md:  provides an overview of the data set and how it was created. 
2. CodeBook.md: Shows information about the data, variables and transformations used to generate the data). 
3. run_analysis.R: the R script that was used to create the data set.
4. tidydata.csv, which contains the generated data set. 

Code explaination

The code naned the columns in the new dataset and combined training data and test data. Then extracted partial variables to create a new dataset with the averages of each variable for grouped data by subject and activity.

New dataset

The new generated dataset contained variables are calculated based on mean and standard deviation, each row is an average of each variable for each activity and each subject. 

Th Run_analysis.R contains all the code to perform the analyses described in the 5 steps.
1. Appropriately labels the data set with descriptive variable names.
2. Merge the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


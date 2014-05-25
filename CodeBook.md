Codebook for the "Getting and Cleaning Data" Course Project
========================================================

This file details the data, transformations used to clean the data, and variables used in the course project

### Data Description
* The data for this project were obtained from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* A description of the purpose of the data can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* All of the actions performed on the data assume the data have been downloaded, unzipped, and that the "test" and "train" folders are in the working directory.

### Data Transformations

* The full R code for performing the transformations and cleaning the data can be found in the "run_analysis.R" script. It takes some time to run. The run_analysis.R file does the following transformations. More detailed information about the code can be found in the README.md file.

* Listed below are the sequential steps used to transform and clean the data. 

#### Cleaning and Transforming Steps

1. The "X_test.txt" file from the test data folder is read and stored in a dataframe called *raw_test_data*

2. The "X_test.txt" file from the train data folder is read and stored in a separate dataframe called *raw_train_data*

3. Column names are assigned to these two data frames by reading the "features.txt" file and assigning its rows to the names of the raw testing and training dataframes.

4. The subject id numbers (1-30) are extracted from the "subject_test.txt" files in the test and train folders and assigned to the frames *test.subjectID* and *train.subjectID*

5. The task id numbers (1-6) are extracted from the "y_test.txt" and "y_train.txt" files in the test and training folders are are assigned to the frames *test.task* and *train.taskID* respectively

6. Two new data frames are created:
  1. The *test* dataframe (2947 obs. of 564 variables), which contains the data from raw_test_data with the subject id, task id, and the label "test" in the first three columns 
  2. The *train* dataframe (7352 obs. of 564 variables), which contains the data from raw_train_data with the subject id, task id, and the label "train" in th first three columns.
  * Note: The "condition" column, containing the labels "test" and "train", were inserted as a way of tracking whether the obeservations were merged correctly later. The "condition" column is removed in the final data set.
  
7. The *test* and *train* data frames are merged together by subject ID into the new *merged.raw* frame.

8. The variables containing the strings "mean" or "std" were found and those columns, along with the subjectID, taskID, and condition columns were put into the new *merged* frame

9. The numbers corresponding to the activities in the taskID column were then relabled using the activities strings (i.e. "Walking", "Walking_Upstairs", etc.)

10. The "." are stripped from the relevant column names and replaced with an empty string.

11. A new data frame, *new.df* is created, with six instances of each subject id (1-30), and 81 columns containing the subject id, the type of task and the relevant observations of the means and standard deviations

12. Using nested "for" loops, the table is populated with the means of each combination of subject, task type, and measurement.

13. Finally, the completed data set is written out to a file called "final_set.txt"

### Variable Description

The Variables used in the final data set are listed below next their corresponding column number. The first column is a number between 1 and 30 representing the id number for each of the 30 subjects. 

The second column, "taskID" is one of the following representing the type of activity:
"Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"

The rest of the variables can be classified as follows:
* The lower case t or f at the beginning of the variable names represent whether the measurement comes from the time or frequency domains.

* The string following the t or f is a description of the measurement

* Next, following the "." character is either the string "mean" or "std", representing whether it's a measurement of mean or standard deviation. If an X,Y, or Z follows, it represents the axial direction of the measurement


|    | Variable Name                 |
|----|-------------------------------|
| 1  | subjectID                     |
| 2  | taskID                        |
| 3  | tBodyAcc.meanX                |
| 4  | tBodyAcc.meanY                |
| 5  | tBodyAcc.meanZ                |
| 6  | tBodyAcc.stdX                 |
| 7  | tBodyAcc.stdY                 |
| 8  | tBodyAcc.stdZ                 |
| 9  | tGravityAcc.meanX             |
| 10 | tGravityAcc.meanY             |
| 11 | tGravityAcc.meanZ             |
| 12 | tGravityAcc.stdX              |
| 13 | tGravityAcc.stdY              |
| 14 | tGravityAcc.stdZ              |
| 15 | tBodyAccJerk.meanX            |
| 16 | tBodyAccJerk.meanY            |
| 17 | tBodyAccJerk.meanZ            |
| 18 | tBodyAccJerk.stdX             |
| 19 | tBodyAccJerk.stdY             |
| 20 | tBodyAccJerk.stdZ             |
| 21 | tBodyGyro.meanX               |
| 22 | tBodyGyro.meanY               |
| 23 | tBodyGyro.meanZ               |
| 24 | tBodyGyro.stdX                |
| 25 | tBodyGyro.stdY                |
| 26 | tBodyGyro.stdZ                |
| 27 | tBodyGyroJerk.meanX           |
| 28 | tBodyGyroJerk.meanY           |
| 29 | tBodyGyroJerk.meanZ           |
| 30 | tBodyGyroJerk.stdX            |
| 31 | tBodyGyroJerk.stdY            |
| 32 | tBodyGyroJerk.stdZ            |
| 33 | tBodyAccMag.mean              |
| 34 | tBodyAccMag.std               |
| 35 | tGravityAccMag.mean           |
| 36 | tGravityAccMag.std            |
| 37 | tBodyAccJerkMag.mean          |
| 38 | tBodyAccJerkMag.std           |
| 39 | tBodyGyroMag.mean             |
| 40 | tBodyGyroMag.std              |
| 41 | tBodyGyroJerkMag.mean         |
| 42 | tBodyGyroJerkMag.std          |
| 43 | fBodyAcc.meanX                |
| 44 | fBodyAcc.meanY                |
| 45 | fBodyAcc.meanZ                |
| 46 | fBodyAcc.stdX                 |
| 47 | fBodyAcc.stdY                 |
| 48 | fBodyAcc.stdZ                 |
| 49 | fBodyAcc.meanFreqX            |
| 50 | fBodyAcc.meanFreqY            |
| 51 | fBodyAcc.meanFreqZ            |
| 52 | fBodyAccJerk.meanX            |
| 53 | fBodyAccJerk.meanY            |
| 54 | fBodyAccJerk.meanZ            |
| 55 | fBodyAccJerk.stdX             |
| 56 | fBodyAccJerk.stdY             |
| 57 | fBodyAccJerk.stdZ             |
| 58 | fBodyAccJerk.meanFreqX        |
| 59 | fBodyAccJerk.meanFreqY        |
| 60 | fBodyAccJerk.meanFreqZ        |
| 61 | fBodyGyro.meanX               |
| 62 | fBodyGyro.meanY               |
| 63 | fBodyGyro.meanZ               |
| 64 | fBodyGyro.stdX                |
| 65 | fBodyGyro.stdY                |
| 66 | fBodyGyro.stdZ                |
| 67 | fBodyGyro.meanFreqX           |
| 68 | fBodyGyro.meanFreqY           |
| 69 | fBodyGyro.meanFreqZ           |
| 70 | fBodyAccMag.mean              |
| 71 | fBodyAccMag.std               |
| 72 | fBodyAccMag.meanFreq          |
| 73 | fBodyBodyAccJerkMag.mean      |
| 74 | fBodyBodyAccJerkMag.std       |
| 75 | fBodyBodyAccJerkMag.meanFreq  |
| 76 | fBodyBodyGyroMag.mean         |
| 77 | fBodyBodyGyroMag.std          |
| 78 | fBodyBodyGyroMag.meanFreq     |
| 79 | fBodyBodyGyroJerkMag.mean     |
| 80 | fBodyBodyGyroJerkMag.std      |
| 81 | fBodyBodyGyroJerkMag.meanFreq |

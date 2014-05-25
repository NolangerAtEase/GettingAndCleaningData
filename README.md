Course Project Readme
======================

Project for Cousera Getting and Cleaning Data Course


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

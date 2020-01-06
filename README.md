# Getting-and-Cleaning-Data-Project

Description: This README file explains how all of the scripts work and how they are connected.

This is my end-of-course project for Getting and Cleaning Data.
There is only one script: run_analysis.R.

Here is what the script does: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is how it accomplishes these things:

1. The author reads in the text data from his local repository, in 'table' format. He creates two tables -- one for the training data, the other for the test data -- by column-binding the subject, activity, and feature data. He then assigns the two tables the same column names using the feature names data (read in from the same local repo). Once this is down, the two tables have the same column names and are merged into one table by row-binding.

2. The author selects the mean and std features -- first, by grepping "mean", "std" (as well as "subject" and "activity"), and then by using the 'dplyr' package's "select" function to select the appropriate columns. Only one line of code is needed. This reduces the number of columns to about 80.

3. The author uses the "gsub" function to rename the activities in the data set.

4. This step is already done by the author in step 1.

5. The author strips the feature names of numbers, whitespace and punctuation; then groups the data by subject and activity; finally, summarizes the data according to the mean of each feature.

Note on data: The original data was downloaded from the coursera course website and saved in one of the author's local directories. Anyone who wishes to run this code must download the data and provide their own read-in statements.

The code is fully commented.

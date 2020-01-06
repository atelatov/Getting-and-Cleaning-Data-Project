CodeBook.md

Description: This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

Variables (listed in order of appearance):


1. 'test_sub': test data for subject, 2947 element vector
2. 'test_x': test data for features, 2947 by 561
3. 'test_y': test data for activities, 2947 element vector  # All are read in locally as tables from text files.

4. 'feature_names': vector of feature names, 561 elements. # Read in locally from a text file

5. 'test_merged': table resulting from column-binding the subect, features and activities for the test data ('test_sub', 'test_x', 'test_y')
      - dimensions 2947 by 563
      
6. 'train_sub': train data for subject, 7352 element vector
7. 'train_x': train data for features, 7352 by 561
8. 'train_y': train data for activities, 7352 element vector. # All read in locally as tables from text files.
9. 'train_merged': table resulting from column-binding the subject, features and activities for the train data ('train_sub', 'train_x', 'train_y')
    - dimensions 7352 by 563  
10. 'merged': data-frame resulting from row-binding the test and train merged tables ('test_merged' and 'train_merged')
      - dimensions 10299 by 563
11. 'mer': data-table derived from 'merged'

12. 'both_table': table 'mer' grouped by subject and activity, and summarized by mean
      - dimensions 180 by 81

Data:


1. Test data - 3 files (subject, activity, features)
2. Training data - 3 files (subject, activity, features)
3. Feature names


Transformations (listed in order of appearance):


1. 'test_sub' and 'train_sub' name is changed from "V1" to "Subject"
2. 'test_y' and 'train_y' name is changed from "V1" to "Activity"
3. 'feature_names' is transformed into a character list
4. 'test_sub', 'test_x', 'test_y' are bound (by column) to make 'test_merged', and similarly for the training data
5. The names of 'test_merged' and 'train_merged' are set to "Subject", "Activity", and the feature names from 'feature_names'
6. 'mer' is created to coerce 'merged' into a data-table
7. Columns of 'mer' that contain 'mean' or 'std' are selected, using "grep" and "select" functions
8. The "Activities" labels in 'mer' are changed using "gsub", according to the description of the data given by the coursera instructors
9. The feature names (for columns 3 to 81) of 'mer' are cleaned to remove numbers, whitespace and punctuation, using "gsub"
10. 'mer' is grouped by "Subject" and "Activity", summarized by the function "mean", and stored in a new variable 'both_table'

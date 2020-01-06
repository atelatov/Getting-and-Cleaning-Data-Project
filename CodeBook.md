CodeBook.md

Description: This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

Variables:

test_sub: test data for subject, 2947 element vector
test_x: test data for features, 2947 by 561
test_y: test data for activities, 2947 element vector  # All are read in locally as tables from text files.

feature_names: vector of feature names, 561 elements. # Read in locally from a text file

test_merged: table resulting from column-binding the subect, features and activities for the test data (test_sub, test_x, test_y)
      - dimensions 2947 by 563
      
train_sub: train data for subject, 7352 element vector
train_x: train data for features, 7352 by 561
train_y, train data for activities, 7352 element vector. # All read in locally as tables from text files.
train_merged: table resulting from column-binding the subject, features and activities for the train data (train_sub, train_x, train_y)
    - dimensions 7352 by 563
    
mer: table resulting from row-binding the test and train merged tables (test_merged and train_merged).

both_table: table 'mer' grouped by subject and activity, and summarized by mean

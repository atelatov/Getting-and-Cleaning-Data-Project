##########################################################################
# 1. Merge the training and the test sets to create one data set.

# Do this by cbind-ing the test data (subject, x, y), 
# cbind-ing the train data (sub, x, y), then
# rbind-ing the test and train data

# Load library
library(dplyr)

rm(list=ls())
setwd("/Users/jessihuffer/Desktop/coursera/getAndClean/UCI HAR Dataset/")

# Read in test data
test_sub <- read.table("test/subject_test.txt", sep = "", header = FALSE)
test_x <- read.table("test/X_test.txt", sep = "", header = FALSE)
test_y <- read.table("test/y_test.txt", sep = "", header = FALSE)

# Rename column of subject ids
test_sub <- rename(test_sub, Subject = V1)

# Rename column of activities
test_y <- rename(test_y, Activity = V1)

# Read in feature names
feature_names <- read.csv("features.txt", sep="\n", header = FALSE, col.names = "Features")
# Clean up feature names
feature_names <- feature_names$Features 
feature_names <- as.character(feature_names)

# cbind test data
test_merged <- cbind(test_sub, test_y, test_x)

# Give names to the features
names(test_merged) <- c("Subject", "Activity", feature_names)
rm("test_x","test_sub","test_y")  # Don't need these anymore

# Now read in training data and do the same thing
train_sub <- read.table("train/subject_train.txt", sep = "", header = FALSE)
train_x <- read.table("train/X_train.txt", sep = "", header = FALSE)
train_y <- read.table("train/y_train.txt", sep = "", header = FALSE)

# Give appropriate column names
train_sub <- rename(train_sub, Subject = V1)
train_y <- rename(train_y, Activity = V1)

# cbind train data
train_merged <- cbind(train_sub, train_y, train_x)

# Give names to the features
names(train_merged) <- c("Subject", "Activity", feature_names)
rm("train_sub", "train_x", "train_y")  # Don't need these anymore

# Merge the training and test set by row-binding
merged <- rbind(train_merged, test_merged)

# Coerce merged to tbl_df for select, filter, arrange, mutate
mer <- tbl_df(merged)
rm("test_merged","train_merged", "feature_names")  # Don't need these anymore

####################################################################
# 2. Extract only the measurements on the 
# mean and standard deviation for each measurement.
mer <- select(mer, grep("Subject|Activity|mean|std", names(mer)) )

#######################################################################
# 3. Uses descriptive activity names to name the activities in the data set.
mer$Activity <- gsub(1, "Walking", mer$Activity)
mer$Activity <- gsub(2, "Walking_Upstairs", mer$Activity)
mer$Activity <- gsub(3, "Walking_Downstairs", mer$Activity)
mer$Activity <- gsub(4, "Sitting", mer$Activity)
mer$Activity <- gsub(5, "Standing", mer$Activity)
mer$Activity <- gsub(6, "Laying", mer$Activity)

#####################################################################
# 4. Appropriately labels the data set with descriptive variable names.

# Already did this in step 1, lines 35 and 51.

######################################################################
# 5. From the data set in step 4, create a second, 
# independent tidy data set with the average of each variable for 
# each activity and each subject.

# Strip names of the first number, whitespace, and punctuation
names(mer)[3:81] <- gsub("^[0-9]{1,3} ", "", names(mer)[3:81])
names(mer)[3:81] <- gsub("-", "", names(mer)[3:81])
names(mer)[3:81] <- gsub("\\(\\)", "", names(mer)[3:81])

# Activity and subject
both_table <-
        mer %>%
        group_by(Subject, Activity) %>%
        summarize_at(vars(tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq), mean)

# View final table, if desired.
# This table contains all the required information.
View(both_table)

# Write data to txt file
write.table(both_table, file = "both_table.txt", row.names = FALSE)

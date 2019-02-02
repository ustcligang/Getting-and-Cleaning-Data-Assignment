# Getting-and-Cleaning-Data-Assignment
This repo includes run_analysis.R, which is used to process the data set from Samsung Galaxy S smartphone, obtained from https://d396qusza40orc.cloudfront.net/getdata%2FprojectÒles%2FUCI%20HAR%20Dataset.zip

Unzip the downloaded data, gives a folder "UCI HAR Dataset".

The script "run_analysis.R" and the folder "UCI HAR Dataset" should be put in the same directory.  

The run_analysis.R reads the "UCI HAR Dataset" and generates output.txt, as required by the assignment:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The most challenging aspect of this assignment is trying to guess what we are asked to do. The description (above 1-5) of this assignment on Coursera is extremely ambiguous. The majority time on this assignment was spend on guess what is the assignment. Once we know what we are asked to do, the rest of the work is straightforward. Therefore, the main purpose of this README.md is to explain what are asked to do in the assignment.

Many thanks are given to David Hood, on discussion forum (https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/). Apparently, many people are struggling to understand the literal meanings of this assignment. David Hood provides a good explanation. Here I explain these again in another way. 

Step 1. Merges the training and the test sets to create one data set.
Firstly, there is an "inertial" folder within test and training. Delete the "Inertial Signals" folder, which is not useful and is confusing.

There are three .txt files under each of the folder "test" and "training". We are asked to combine these six files, into one single data frame. This data frame should have 563 columns, of which 1 column from subject_test(or train).txt, 1 column from y_test(or train).txt, and 561 columns from X_test(or train).txt.

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
There are 561 columns in file X_test.txt and X_train.txt. Each column corresponds to a measurement described in features.txt, which has 561 rows. We are asked to find out which rows in features.txt include "mean" or "std", and only extract the columns with these corresponding rows. Of course, this extraction should be applied to the single data frame generated by step 1.
 
Step 3. Uses descriptive activity names to name the activities in the data set.
Files "y_test.txt" and "y_train.txt" only has one column, with numbers (1-6). These two files are merged as one column in the data frame created in step 1. The numbers (1-6) in this column are the "activities" mentioned in step 3. File "activity_lables.txt" lists the activity names for activity (1-6). Step 3 is asking to replace these numbers (1-6) in the data frame with activity names described in "activity_lables.txt".

Step 4. Appropriately labels the data set with descriptive variable names.
The data frame created in step 1, does not has intuitive column names. The column names may be empty, or may be generated by default in R. Step 4 is asking to give an intuitive column name for each column. The column names can be referred in "features.txt". 

Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

One column in the current data frame has numbers 1 to 30. This column is the "subject" mentioned in step 5. Another column in the current data frame has activities names, and this is the "activity" mentioned in step 5. For 30 subjects and 6 activities, there are 180 combinations, but there are 10299 rows in the data frame. For any combination, there are still many rows correspond to it. Step 5 is asking to group the current data frame into these 180 combinations, and calculate the average of each column within each combination. 



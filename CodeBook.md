
Step 1. Merges the training and the test sets to create one data set.

(1) Combine subject_train.txt and subject_test.txt into one column.
(2) Combine y_train.txt and y_test.txt into one column.
(3) Row combine X_train.txt and X_test.txt. 
(4) Column combine above 3, into one single data frame called "data" in the script. 

Using "run_anlysis.R", column 1-561 of "data" are measurements corresponding to the descriptions in row 1-561 of "features.txt". Column 562 of "data" is named as "subject", column 563 is named as "Activity". 

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Find out which rows in features.txt include "mean" or "std", generate a vector including the row positions in feature.txt, and extract columns in data corresponding to these positions. The last two columns should be kept as the way they are. After the extraction, column 1-79 are extracted measurements. Column 80 is subject, and column 81 is Activity.
 
Step 3. Uses descriptive activity names to name the activities in the data set.
Replace the number (1-6) is column data$Activity, with characters according to "features.txt".

Step 4. Appropriately labels the data set with descriptive variable names.
Change each column name according to "features.txt". 

Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Group "data" by column data$subject and data$Activity, and calculate the average of all other columns, the results are passed to a data frame called "output". Then put the values from data frame "output" into a text file output.txt. The first column of the output is subject, the second column is Activity, and the rest columns are the average of each measurement. 

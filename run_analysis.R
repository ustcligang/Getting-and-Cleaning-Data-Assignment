
#library(dplyr)

#Task 1: Merges the training and the test sets to create one data set.

#read the train and test data sets 
subject_train=read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
subject_test =read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)

X_train=read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
X_test= read.table("UCI HAR Dataset/test/X_test.txt",  header=FALSE)

y_train=read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
y_test= read.table("UCI HAR Dataset/test/y_test.txt",  header=FALSE)

#combine the two data sets into one data sets
subject=rbind(subject_train,subject_test)
X=rbind(X_train,X_test)
y=rbind(y_train,y_test)

#combine this one data sets(which includes several files) into one data frame
data=cbind(X,subject,y)

#remove objects which will not be used anymore
rm("subject","subject_train","subject_test","X","X_train","X_test","y","y_train","y_test");

# ------- Task 1 completed----------

#Task 2: Extrats only the measurements on the mean and standard deviation for each measurement.
colnames(data)[562]="subject"
colnames(data)[563]="Activity"
feature=read.table("UCI HAR Dataset/features.txt")
feature=as.character(feature[,2])
meanAndStd=grep("mean|std",feature)
feature=feature[meanAndStd]
data=data[c(meanAndStd,562,563)]

# ------- Task 2 completed----------

#Task 3: Uses descriptive activity names to name the activities in the data set 
data$Activity=sub("1","walking",data$Activity)
data$Activity=sub("2","walking_upstairs",data$Activity)
data$Activity=sub("3","walking_downstairs",data$Activity)
data$Activity=sub("4","sitting",data$Activity)
data$Activity=sub("5","standing",data$Activity)
data$Activity=sub("6","laying",data$Activity)

# ------- Task 3 completed----------

#Task 4: Appropriately labels the data set with descriptive variable names

for (i in 1:length(feature)) colnames(data)[i]=feature[i]

# ------- Task 4 completed----------
output=aggregate(data[,1:79],list(data$subject,data$Activity),mean)
colnames(output)[1]="subject"
colnames(output)[2]="Activity"

#Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
write.table(output,file="output.txt",row.name=FALSE)

# ------- Task 5 compieted----------

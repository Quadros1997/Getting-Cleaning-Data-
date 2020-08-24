## Read all of the data files into R 

features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code","activity"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <-  read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")


## Task 1: Merge the training and the test sets to create one data set. 

X_data <- rbind(X_test,X_train)
Y_data <- rbind(y_test,y_train)
Subjects_data <- rbind(subject_test, subject_train)
MergedData <- cbind(Subjects_data,X_data,Y_data)


## Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.

mean_stdData <- MergedData %>% select(subject, code, contains("mean"), contains("std"))


## Task 3: Uses descriptive activity names to name the activities in the data set. 

mean_stdData$code <- activities[mean_stdData$code,2]


## Task 4: Appropriately labels the data set with descriptive variable names.

names(mean_stdData)[2] = "activity"
names(mean_stdData) <- gsub("Acc","Accelerometer",names(mean_stdData))
names(mean_stdData) <- gsub("Gyro","Gyroscope",names(mean_stdData))
names(mean_stdData) <- gsub("BodyBody", "Body",names(mean_stdData))
names(mean_stdData) <- gsub("Mag", "Magnitude",names(mean_stdData))
names(mean_stdData) <- gsub("^t", "Time",names(mean_stdData))
names(mean_stdData) <- gsub("^f", "Frequency",names(mean_stdData))
names(mean_stdData) <- gsub("tBody", "TimeBody",names(mean_stdData))
names(mean_stdData) <- gsub("-mean()", "Mean",names(mean_stdData), ignore.case = TRUE)
names(mean_stdData) <- gsub("-std()", "STD",names(mean_stdData), ignore.case = TRUE)
names(mean_stdData) <- gsub("-freq()", "Frequency",names(mean_stdData), ignore.case = TRUE)
names(mean_stdData) <- gsub("angle", "Angle",names(mean_stdData))
names(mean_stdData) <- gsub("gravity", "Gravity",names(mean_stdData))


## Task 5: From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

Final_Data <- mean_stdData %>% group_by(subject,activity) %>% summarise_all(funs(mean))
write.table(Final_Data,"FinalData.txt", row.name= FALSE)


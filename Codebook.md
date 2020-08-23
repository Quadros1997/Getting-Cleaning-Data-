The run_analysis.R script performs the necessary steps as asked in order to get the data, clean it and create a new dataset from it. 

## 1. Download dataset 

The dataset was downlaoded and extracted under the file name UCI HAR Dataset. 

## 2. Each dataset were assigned to variables 

features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)

subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed

X_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data

y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels

subject_train <- train/subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed

X_train <- train/X_train.txt : 7352 rows, 561 columns
contains recorded features train data

y_train <- train/y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels

## 3. Merge the training and test datasets to create one data set. 

X_data :- Created by merging X_test and X_train datasets using rbind. 
Y_data :- Created by merging y_test and y_train datasets using rbind. 
Subjects_data :- Created by merging subject_test and subject_train datasets using rbind. 
MergedData :- All the three, X_data, Y_data and Subjects_data combined using cbind. rows = 10299 & cols = 563 

## 4. Extracting measurements only on mean and std deviation. 

mean_stdData (10299 rows, 88 columns) is created by subsetting MergedData, selecting only columns: subject, code and the measurements on the mean and 
standard deviation (std) for each measurement. 

## 5. Using descriptive activity names to name the activities in the dataset. 

Entire numbers in code column of the mean_stdData replaced with corresponding activity taken from second column of the activities variable

## 6. Approprialtley labelling the dataset

All Acc in the data column name replaced with Accelerometer
All Mag in the data column name replaced with Magnitude 
All Gyro in the data column name replaced with Gyroscope
All column names starting with 't' (^t) were replaced with Time
All column names staring with 'f' (^f) were replaced with Frequency 

## 7. Creating a second independent tidy data set. 
The Final_Data has been created by grouping subject and activity and then summarizing by taking the means of each variable for each activity and each subject. 
It has 180 rows and 80 columns. 

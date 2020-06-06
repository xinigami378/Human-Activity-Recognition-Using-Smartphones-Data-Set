# This R script called run_analysis.R includes the following.

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject.

#1. Get the Data
#1.1 Set the working directory
library(plyr)
library(data.table)

setwd("E:/DataScience/Coursera/Getting_and_Cleaning_Data/CourseProject")

#1.2 Download the files
filename <- "SamSung.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(filename)){
  download.file(fileUrl, destfile = filename, method = "curl")}

#1.3 Unzip the files
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

#1.4 Get the list of files in the directory
path <- file.path("UCI HAR Dataset")
file_list <- list.files(path, recursive = TRUE)
file_list


#From the picture and the related files, we can see:
  
#Values of Varible Activity consist of data from "Y_train.txt" and "Y_test.txt"
#values of Varible Subject consist of data from "subject_train.txt" and subject_test.txt"
#Values of Varibles Features consist of data from "X_train.txt" and "X_test.txt"
#Names of Varibles Features come from "features.txt"
#levels of Varible Activity come from "activity_labels.txt"
#So we will use Activity, Subject and Features as part of descriptive variable names 
#for data in data frame.


#2. Read the Data

activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featureTest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featureTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#3. Merge the Data
#3.1 Concatenate the data tables by rows
Subject <- rbind(subjectTest, subjectTrain)
Activity <- rbind(activityTest, activityTrain)
Feature <- rbind(featureTest, featureTrain)

#3.2 Set the labels to variables
names(Subject) <- c("Subject")
names(Activity) <- c("Activity")
FeatureNames <- read.table("UCI HAR Dataset/features.txt", head = FALSE)
names(Feature) <- FeatureNames$V2

#3.3 Merge columns into one entire data frame
all <- cbind(Subject, Activity, Feature)

#4. Extracts only the measurements on the mean and standard deviation for each measurement
#4.1 Subset Name of Features by measurements to get the mean and standard deviation

WantedFeatureNames <- FeatureNames$V2[grep('-(mean|std)\\(\\)', FeatureNames$V2)]

#4.2 Subset the data by the wanted feature names
selectedNames <- c(as.character(WantedFeatureNames), "Subject", "Activity")
selected_data <- subset(all, select = selectedNames)
View(head(selected_data))

#5 Appropriately label the variables
#5.1 Turn activities & subjects into factors
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
selected_data$Activity <- factor(selected_data$Activity, levels = activityLabels$V1, 
                                 labels = activityLabels$V2)
selected_data$Subject <- as.factor(selected_data$Subject)

#5.2 Use desdcriptive variables names to name the features
names(selected_data) <- gsub("^t", "time", names(selected_data))
names(selected_data) <- gsub("^f", "frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitutde", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
View(head(selected_data))

#6. Create a second,independent tidy data set and ouput it, 
#with the average of each variable for each activity and each subject

tidydata <- aggregate(.~Subject + Activity, selected_data, mean)
tidydata <- tidydata[order(tidydata$Subject, tidydata$Activity), ]
write.table(tidydata, file = "tidydata.txt", row.name = FALSE)

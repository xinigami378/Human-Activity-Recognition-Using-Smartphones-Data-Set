# The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

### The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Note: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

# Variables:

Each row contains, for a given subject and activity, 79 averaged signal measurements.
Identifiers 

•	subject
Subject identifier, integer, ranges from 1 to 30.

•	activity
Activity identifier, string with 6 possible values:
o	WALKING: subject was walking
o	WALKING_UPSTAIRS: subject was walking upstairs
o	WALKING_DOWNSTAIRS: subject was walking downstairs
o	SITTING: subject was sitting
o	STANDING: subject was standing
o	LAYING: subject was laying

•	Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used) 
o	tBodyAcc-XYZ
o	tGravityAcc-XYZ
o	tBodyAccJerk-XYZ
o	tBodyGyro-XYZ
o	tBodyGyroJerk-XYZ
o	tBodyAccMag
o	tGravityAccMag
o	tBodyAccJerkMag
o	tBodyGyroMag
o	tBodyGyroJerkMag
o	fBodyAcc-XYZ
o	fBodyAccJerk-XYZ
o	fBodyGyro-XYZ
o	fBodyAccMag
o	fBodyAccJerkMag
o	fBodyGyroMag
o	fBodyGyroJerkMag

# Transformations

* Download the provided source data and upzip the file.
*	Read and merge the test and train data into one data frame.
*	Relabel the data frame and extract required measurements.
*	Clean the data set and export.
*	Values of Varible Activity consist of data from "Y_train.txt" and "Y_test.txt"
*	values of Varible Subject consist of data from "subject_train.txt" and subject_test.txt"
*	Values of Varibles Features consist of data from "X_train.txt" and "X_test.txt"
*	Names of Varibles Features come from "features.txt"
*	Levels of Varible Activity come from "activity_labels.txt"

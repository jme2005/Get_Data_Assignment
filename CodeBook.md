The data set used for this analysis can be found:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

More details about the data can be found from the above site and in the downloaded package. In short (from the above site):
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

From the features_info.txt file obtained from the download package:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

The variables in the tidy dataset are:

Subject  
Activity  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

where the average mean (denoted: -mean()) and average standard deviation (denoted: -std()) for each subject,activity, and measurement are presented as indicated.

The tidy dataset was obtained by running the script "run_analysis.R". This script requires that the dataset found on:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
 

is in your working directory either by having the "UCI HAR Dataset" directory and it's subdirectories unzipped or located in your working directory or that all these files:

X_train.txt, features.txt, y_train.txt, activity_labels.txt, X_test.txt, y_test.txt, subject_test.txt, subject_train.txt

are in your working directory.

The script contain 2 functions that will:

	1. Read the data into the global environment. - "ReadData"
	2. Combine the test and training dataset. - "ProcessData"
	3. Rename the variables according to the features.txt file. - "ProcessData"
	4. Extract the measurements of mean and standard deviation for each measurement. - "ProcessData"
	5. Add the subject and activity info to the measurements. - "ProcessData"
	6. Create a tidy data set, containing the average mean and std for each activity and subject. - "ProcessData"
	7. Return this data set in the data frame "tidyData".  - "ProcessData"
	8. If you desire to remove the rawdata files you can also run the "DeleteRawData" function remove the "#" from the last line in the script.

Also find this tidy Data set in this repo as "tidyData.csv"

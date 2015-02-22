CodeBook for run_analysis.R
#################################################################################################################
1) THE DATA and VARIABLES
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

1- 'README.txt'

2- 'features_info.txt': Shows information about the variables used on the feature vector.

3- 'features.txt': List of all features.

4- 'activity_labels.txt': Links the class labels with their activity name.

5- 'train/X_train.txt': Training set.

6- 'train/y_train.txt': Training labels.

7- 'test/X_test.txt': Test set.

8- 'test/y_test.txt': Test labels.


**************************************************************************************************************
******N.B.: that the following are NOT NECESSARY to understand and run the script "run_analysis.R"******

##
The following files are available for the train and test data. Their descriptions are equivalent. 

9- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

10- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

11- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

12- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
##
**************************************************************************************************************

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



------
#################################################################################################################
2)GETTING THE DATA:
In an R session, the download the file of the data described above, issue the following command:

      > download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "samsungdata.zip", method = "curl")

This will now place the data in a file called samsungdata.zip" into your current working directory.
Now you need to unzip the file, which is taken care of in the "run_analysis.R" script.
#################################################################################################################
3) DATA CLEANING:

a)In order to eliminate excessive information, you can ignore the directories named "Inertial Signals", which are directories located in both the "test" and "train" directories. Simply ignoring them is enough. 

b)In Section (1) of this codebook, the listed numbers 3-8 are the only data files that are necessary for this project.

c)To make things more sensible, the column names of the "x_train" and "x_test" data are changed to those of the "features" file, as the number of columns in the features.txt file is exactly the same as the number of rows in the x_train.txt and x_test.txt data.
#################################################################################################################
4)OTHER:
The complete list of variables of each feature vector is available in "features.txt" and helpful information in "features_info.txt" to understand each name in features.txt.

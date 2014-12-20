======================================================================================
Summarized Tidy Dataset based on Human Activity Recognition Using Smartphones Dataset
======================================================================================
Summarized Data Project as part of the Data Science Course - Getting and Cleaning Data
https://class.coursera.org/getdata-016

Panagiotis Stathakos
https://github.com/pstathakos
======================================================================================

This R script is designed to create a clean, summarized data set data based upon the 
initial data provided in the course. The data provided was obtained as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.



The github repository includes the following files:
++++++++++=========================================

- 'README.txt' - This document describing the data and script used to manipulate the raw data

- 'CodeBook.md' - Lists all of the values in the output file and describes their function

- 'run_analysis.R' - R script which manipulates the raw data set



The raw dataset includes the following files:
=============================================

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.


The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample.
Its range is from 1 to 30. 



Functionality of run_analysis.R
===============================
This script performs the following tasks on the raw data set in order to create a summarized, tidy data set:

1. Open the features and activity_labels files to obtain the label data.

2. Open the features, subject and activity data files to obtain the raw data for each subject and activity and 
acceleration feature data. This is done for both the test and training data sets.

3. The test data is then bound together to align the subject/activity/feature acceleration data. 
The same is then done to the train data.

4. The column names are added using the features label data obtained in Step 1.

5. The test and train data are then bound together in one data table named alldata.

6. The activity_id is then mapped to the corresponding activity label, which was obtained in step 1.

7. A subset of this overall data set is then obtained, which is contains only the  following:
	- activity_id
	- subject_id
	- activity_name
	- All measurements which are the mean or standard deviation measurements (mean and std).

8. The subset of data is then summarized into the alldatafinalsummarized data table using the melt() and dcast() functions.
	- The data set is summarized to contain the average of each activity measurement by activity and subject.

9. The column names for the summarized data set are then updated to reflect that they are the mean values of the measurements.

10. Both the complete subset of data (alldata) and the summarized data set (alldatafinalsummarized) are exported to .txt files
	- AllData_Final.txt
	- AllDataSummarized_Final.txt




License:
========
The license of this dataset is inherited from the original work:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
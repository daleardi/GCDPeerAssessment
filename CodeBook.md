GCDPeerAssessment
=================

Coursera Getting and Cleaning Data Peer Assesment

This code book that describes the variables, the data, and any transformations that I performed to clean up the data

## The Clean Data

This data shows the averages for any mean or standard deviation variable for each subject in the test and training groups for each activity they performed. So each row in the data set will be the average for single subject doing a single activity. For more information on the different variables please see the 'Original Data' section.

### Transformations 

The data comes in several separate files.  

1. The first task the script does is to load all of these separate files into one data frame.   
2. Next only the columns with names containing "-std" and "-mean" were kept and the others removed  
3. Then the data was aggregated by subject and activity and the mean of each variable was taken  
4. The data is finally printed into a text file with comma separation.   
(please see the comments in run_analysis.R and README.md to see how this is done.)   


## Original Data

[This is the description page for the original data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Source

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


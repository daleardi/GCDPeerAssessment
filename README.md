GCDPeerAssessment
=================

Coursera Getting and Cleaning Data Peer Assesment

The script assumes you have downloaded and unzipped the "UCI HAR Dataset" folder into your working directory. The following steps are then used to create the final tidy data set. 

1. Read column names from the features.txt file   
2. Read descriptive activity labels from the activity_labels.txt file    
3. Create Test Data Frame
   1. Read in test data from the files subject_test.txt, x_test.txt, and y_test.txt  
   2. Create a column of descriptive activiyt labels from the activity_labels.txt file 
   3. Combine the columns for complete test data frame
   4. Name the data frame columns "Subject", "Activity_Code", "Activity_Label", column names from features.txt
4. Create Train Data Frame
   1. Read in train data from the files subject_train.txt, x_train.txt, and y_train.txt  
   2. Create a column of descriptive activiyt labels from the activity_labels.txt file 
   3. Combine the columns for complete test data frame
   4. Name the data frame columns "Subject", "Activity_Code", "Activity_Label", column names from features.txt
5. Create Full Data Frame by binding the rows of the Test and Train data frames
6. Get only mean and standard devistion columns. Do this by only keeping columns that includ the string '-mean' and '-std'
7. Get the average of each column by subject and activity type
8. Print the tidy data to file called Tidy_Data.text separated by a ','

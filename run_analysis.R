 ######    ######  ########     ########  ######## ######## ########  
##    ##  ##    ## ##     ##    ##     ## ##       ##       ##     ## 
##        ##       ##     ##    ##     ## ##       ##       ##     ## 
##  ##### ##       ##     ##    ########  ######   ######   ########  
##    ##  ##       ##     ##    ##        ##       ##       ##   ##   
##    ##  ##    ## ##     ##    ##        ##       ##       ##    ##  
 ######    ######  ########     ##        ######## ######## ##     ## 

   ###     ######   ######  ########  ######  ##     ## ######## ##    ## ######## 
  ## ##   ##    ## ##    ## ##       ##    ## ###   ### ##       ###   ##    ##    
 ##   ##  ##       ##       ##       ##       #### #### ##       ####  ##    ##    
##     ##  ######   ######  ######    ######  ## ### ## ######   ## ## ##    ##    
#########       ##       ## ##             ## ##     ## ##       ##  ####    ##    
##     ## ##    ## ##    ## ##       ##    ## ##     ## ##       ##   ###    ##    
##     ##  ######   ######  ########  ######  ##     ## ######## ##    ##    ##  

## This code assume you have downloaded and unzipped the "UCI HAR Dataset" 
## folder into your working directory. 
##

#Read Column names
features<-read.table("./UCI HAR Dataset/features.txt")

#Read descriptive activity labels
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

#Create Test Data Frame

#Read in test data
stest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtest<-read.table("./UCI HAR Dataset/test/x_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")

#Create a column of descriptive activiyt labels
act_labs_test<-factor(activity_labels$V2) #initialize as factor
#loop over data matching activity code to the activity label
for(i in 1:length(ytest$V1)){
        act_labs_test[i]<-activity_labels$V2[ytest$V1[i]]
}

#combine the columns for complete test data frame
test<-cbind(stest,ytest,act_labs_test,xtest)
#Name the data frame
names(test)<-c("Subject",
               "Activity_Code",
               "Activity_Label",
               as.character(features$V2))


#Create Train Data Frame

#Read in train data
strain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
xtrain<-read.table("./UCI HAR Dataset/train/x_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")

#Create a column of descriptive activiyt labels
act_labs_train<-factor(activity_labels$V2) #initialize as factor
#loop over data matching activity code to the activity label
for(i in 1:length(ytrain$V1)){
        act_labs_train[i]<-activity_labels$V2[ytrain$V1[i]]
}

#combine the columns for complete test data frame
train<-cbind(strain,ytrain,act_labs_train,xtrain)
#Name the data frame
names(train)<-c("Subject",
                "Activity_Code",
                "Activity_Label",
                as.character(features$V2))

#Create Full Data Frame
data<-rbind(test,train)

#Get only mean and standard devistion columns
mn_std_col<-sort(c(grep("-std",names(data)),
                   grep("-mean",names(data))))
mn_std_data<-data[,c(1:3,mn_std_col)]

#Get the average of each column by activity type
by<-list(Subject = mn_std_data$Subject, 
         Activity_Label = mn_std_data$Activity_Label)
tidy_data<-aggregate(mn_std_data[,4:ncol(mn_std_data)],by,mean)
 
#Print the tidy data to file 
write.table(tidy_data,"Tidy_Data.txt", sep=",")
 

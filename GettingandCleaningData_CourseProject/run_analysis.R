##Load needed package for data manipulation and plotting data.
library(plyr)

#Download source dataset and load this file into R.
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

#Unzip file and access files only for rest of program.
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

#Create variables from files.
#First-Activity column.
ActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

#Second-Subject column.
SubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

#Third-Features column.
FeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#Merges the training and the test sets to create one data set.
dataSubject <- rbind(SubjectTrain, SubjectTest)
dataActivity<- rbind(ActivityTrain, ActivityTest)
dataFeatures<- rbind(FeaturesTrain, FeaturesTest)

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

Combine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, Combine)

#Extracts only measurements on the mean and standard deviation for each measurement.
subFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

chosenNames<-c(as.character(subFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=chosenNames)

#Uses descriptive activity names to name the activities in the data set. 

#1:Read descriptive activity names from "activity_labels.txt" file.
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

#2:Factorize variable 'activity' in the data fame 'Data' using descriptive activity names.
Data$activity<-factor(Data$activity, labels=activityLabels$V2)

#Appropriately label the data set with descriptive variable names.
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#From the data set in step 4, create a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(plyr);
DATA<-aggregate(. ~subject + activity, Data, mean)
DATA<-DATA[order(DATA$subject,DATA$activity),]
write.table(DATA, file = "tidydata.txt",row.name=FALSE)


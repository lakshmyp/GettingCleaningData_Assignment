
## Scripts to transform the UCI HAR dataset to a tidy dataset 
# Getting & Cleaning Data - Assignment
#------------------------------------------
# Author : Lakshmy Priya
#-------------------------------------------

# Extracting files
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
## set working directory to /UCI HAR Dataset (assumed done as per instructions)
list.files()

#Required libraries
library(dplyr)
library(tidyr)

##---------------------------------------------------------------------
## Step 1 :Merge the training and the test sets to create one data set.
##---------------------------------------------------------------------

## 6 Activity labels (1-6)

activity_labels <- read.csv("activity_labels.txt", header = FALSE)
splitAct <- strsplit(as.character(activity_labels[,])," ")
activities <- data.frame()
for (i in 1:6) { 
  activities[i,1] <- splitAct[[i]][1]
  activities[i,2] <- splitAct[[i]][2] }
activities$V2 <- tolower(activities$V2)

## 561 variable names 
features <- read.csv("features.txt", header = FALSE, sep = " ")


#TEST DATA
## 2947 observations - 561 variables
X_test<-tbl_df(read.table("./test/X_test.txt",sep="",stringsAsFactors=F,header=F))
## 2947 observations identifying the activity (1-6)
y_test<-tbl_df(read.table("./test/y_test.txt",sep="",stringsAsFactors=F,header=F))
## 2947 observations identifying the subject 
subject_test<-tbl_df(read.table("./test/subject_test.txt",sep="",stringsAsFactors=F,header=F))


## Name test data with features, activity  & subject

names(subject_test) <- c("subjects")
names(y_test) <- c("activity")
names(X_test) <- features[,2]
testdata <- cbind(subject_test, y_test, X_test)
testdata$subjects <- as.factor(testdata$subjects)


#TRAINING DATA
## 7352 observations - 561 variables
X_train<-tbl_df(read.table("./train/X_train.txt",sep="",stringsAsFactors=F,header=F))
## 7352 observations identifying the activity (1-6)
y_train<-tbl_df(read.table("./train/y_train.txt",sep="",stringsAsFactors=F,header=F))
## 7352 observations identifying the subject 
subject_train<-tbl_df(read.table("./train/subject_train.txt",sep="",stringsAsFactors=F,header=F))


##Name training data with features, activity  & subject

names(subject_train) <- c("subjects")
names(y_train) <- c("activity")
names(X_train) <- features[,2]
traindata <- cbind(subject_train, y_train, X_train)
traindata$subjects <- as.factor(traindata$subjects)

##Merging test data and training data into one data frame with 10299 obs, 563 vars

alldata <- rbind(traindata, testdata)

#clean up the environment
rm(subject_test, subject_train, testdata, traindata, X_test, X_train, y_test, y_train)

##---------------------------------------------------------------------
## Step 2 :Extract only the measurements on the mean 
##  and standard deviation for each measurement.
##---------------------------------------------------------------------


names <- names(alldata)
req <- grep("-mean\\(\\)|-std\\(\\)", names)
alldata <- alldata[,c(1,2,req)]

rm(req)

##---------------------------------------------------------------------
## Step 3 : Use descriptive activity names to name the activities in the data set
##----------------------------------------------------------------------

#Add activity labels 

for (j in 1:nrow(alldata)){
    alldata$activity[alldata$activity == activities[j, 1]] <- activities[j, 2]
  
  }

alldata$activity <- as.factor(alldata$activity)

##---------------------------------------------------------------------
## Step 4 : Appropriately label the data set with descriptive variable names.
##----------------------------------------------------------------------

names <- names(alldata)

names <- gsub("-",".", names)
names <- gsub("\\(\\)", "", names)
names <- gsub("Acc", "-acceleration", names)
names <- gsub("Mag", "-magnitude", names)
names <- gsub("BodyBody", "Body", names)
names <- gsub("tBody", "time-body", names)
names <- gsub("fBody", "freq-body", names)
names <- gsub("Gyro", "-Gyro", names)
names <- gsub("tGravity", "time-gravity", names)
names <- tolower(names)

names(alldata) <- names


#clean environment
rm(activities, activity_labels, features)

##---------------------------------------------------------------------
## Step 5 : Create a second, independent tidy data set with 
## the average of each variable for each activity and each subject.
##----------------------------------------------------------------------


tidydata <- tbl_df(alldata) %>% group_by(subjects, activity) %>% summarise_each(funs(mean))
tidydata$subjects <- as.numeric(tidydata$subjects)
tidydata$activity <- as.character(tidydata$activity)
tidydata <- arrange(tidydata, subjects, activity)
tidydata$subjects <- as.factor(tidydata$subjects)
tidydata$activity <- as.factor(tidydata$activity)

write.table(tidydata, file = "tidydata.txt", row.names = FALSE)

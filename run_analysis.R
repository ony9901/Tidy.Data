##########################################################################################
# This Script File does the following tasks                                                   #
# 1. Merges training and test data from                                                  #
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip #
# 2. Create a tidy data set with average values by activity                              # 
#########################################################################################

#Checking and creating work directory
if (!file.exists("rProject")) {
  dir.create("rProject")
}

#Loading data using the faster "data.table" package
library(data.table)
X.test<-read.table("./rProject/test/X_test.txt")
X.train<-read.table("./rProject/train/X_train.txt")  
Y.test<-read.table("./rProject/test/y_test.txt")
Y.train<-read.table("./rProject/train/y_train.txt")
subjectTest<-read.table("./rProject/test/subject_test.txt")
subjectTrain<-read.table("./rProject/train/subject_train.txt")
variableLabels<-read.table("./rProject/features.txt")
activityLabels<-read.table("./rProject/activity_labels.txt")

####  1. Merge datasets
testData<-rbind(X.test, X.train)
trainData<-rbind(Y.test, Y.train)
subjects<-rbind(subjectTest, subjectTrain)

#Add column names <- features
names(testData)<-variableLabels[,2]

### 2.Extracting only the measurements on the mean and standard deviation for each measurement
featureSummary<-testData[,grep("(-mean\\(\\)|-std\\(\\))", variableLabels[,2])]

### 3.Uses descriptive activity names to name the activities in the data set
library(plyr)
activities<-join(trainData, activityLabels)
names(activities)<-c("Code", "activity")

### 4.Appropriately labels the data set with descriptive activity names

names(subjects)<-"subject"
tidyDataSetA<-cbind(subjects,activities[2],featureSummary)

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Function to calculate mean for each variable
DoTidyData <- function(dataset) {
  tidy <- ddply(dataset, .(subject, activity), function(x) colMeans(x[,3:68]))
}

#fucntion to change variables'name texts 
Renaming<-function(x) {
  df<-gsub('\\(\\)', '', x)
  df<-gsub('-', '.\\', df)
  df<-tolower(gsub('([[:upper:]])', '.\\1', df))
  df<-gsub('\\.\\.', '.\\', df)
}

#Running fuction to calculate means for each variable
tidyDataSetB<-DoTidyData(tidyDataSetA)

#Naming variables 
names(tidyDataSetB)<-Renaming(names(tidyDataSetB))

# Create a file into fixed width format with tidy data containing means for each variable 
# and good names
write.table(tidyDataSetB,"./rProject/activityAverage.txt", row.names=FALSE)
 

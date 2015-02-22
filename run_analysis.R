##aborgia - 02222015
##run_analysis.R
##This is a script to run over data in the https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip file.
##
##Unzip the data
data <- unzip("samsungdata.zip")

##get activity labels, each as a string.
activitylabels <- read.table(data[1], stringsAsFactors=F)

## reads in features.txt file elements, each as a string
featurelabels <- read.table(data[2], stringsAsFactors =F)

## reads in subject_test.txt file, x_test.txt file and y_test.txt file 
subject_test <- read.table(data[14]) 
x_testdata <- read.table(data[15]) 
y_testdata <- read.table(data[16]) 

 ## reads in subject_train.txt file, x_train.txt file and y_train.txt file.
subject_train <- read.table(data[26])
x_traindata <- read.table(data[27])
y_traindata <- read.table(data[28])

## sets the column names of the x_test.txt and x_train.txt to be the string values from the features.txt file.
colnames(x_testdata) <- featurelabels[,2] 
colnames(x_traindata) <- featurelabels[,2]


##Combine test set information. Combine training sets information.
##Basically: smoosh together the subject file, activity file, and the x_test data file,
##such that in the end, you get 2 new columns on the LHS of the x_test data
##Similarly done for the train data set.
xytest <- cbind(subject_test, y_testdata, x_testdata)
xytrain <- cbind(subject_train, y_traindata,x_traindata) 


##Rename the first column from V1 -> Subjects and the second column from V1 -> Activity
##for both test and train data sets.
colnames(xytest)[1]<- "Subjects" 
colnames(xytest)[2]<- "Activity" 

colnames(xytrain)[1]<- "Subjects"
colnames(xytrain)[2]<- "Activity"


### At this point, you have 2 data frames: 1 for test and 1 for train. Each of them should be identical in structure,
##with the test having dim(xytest) = 2947  563 (rows, cols)
##            and the dim(xytrain) = 7352  563 (rows, cols)

##Combine test and training sets together.
totaldataset <- rbind(xytest, xytrain)

##Only 
reduce1stds <- totaldataset[,grep("std", colnames(totaldataset), fixed=T)]
reduce1means <- totaldataset[,grep("mean", colnames(totaldataset), fixed=T)]

##Only grab the columns in the new dataset that have the words "mean", "std", "Activity" and "Subjects" in the titles.
reduce1meansandstdsandothers<- totaldataset[,(grepl("mean", colnames(totaldataset), fixed=T) | grepl("std", colnames(totaldataset), fixed =T)) | (grepl("Subjects", colnames(totaldataset)) | grepl("Activity", colnames(totaldataset), fixed=T))]


##Grab the activity labels columns 1 and 2 (number of activity, and corresponding activity label)
##and set them to new labels - for ease of reading
activitylabelscol1<-activitylabels[,1]
activitylabelscol2 <-activitylabels[,2]


##Loop from 1 to the last element in the table (6 here), and substitute the number with the corresponding activity.
for(i in 1:length(activitylabelscol2)){
  reduce1meansandstdsandothers[,2]<-sub(activitylabelscol1[i], activitylabelscol2[i], reduce1meansandstdsandothers[,2])
}

##From the data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.
FinalDataSet<- aggregate(reduce1meansandstdsandothers[3:length(reduce1meansandstdsandothers)],list(Subjects = reduce1meansandstdsandothers$Subjects, Activity = reduce1meansandstdsandothers$Activity), mean)

##180 rows

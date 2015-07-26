# Part 1.
# Read the respective training and test datasets, and merge into single dataset
# Assumes that the unzipped source files exist inside a directory called "data"
# in the working directory.

trainData <- read.table("./data/train/X_train.txt")
trainLabel <- read.table("./data/train/y_train.txt")
trainSubject <- read.table("./data/train/subject_train.txt")
testData <- read.table("./data/test/X_test.txt")
testLabel <- read.table("./data/test/y_test.txt")
testSubject <- read.table("./data/test/subject_test.txt")
Data <- rbind(trainData,testData)
Label <- rbind(trainLabel,testLabel)
Subject <- rbind(trainSubject,testSubject)

# Part 2.
# Read in the features.txt data, and determine which variables contain mean and 
# standard deviation data. Subset data to mean and standard deviation data.
features <- read.table("./data/features.txt")
MeanStDev <- grep("mean|std",features[,2])
Data <- Data[,MeanStDev]


# Part 3.
# Read in activity names from activity_labels.txt file
activity <- read.table("./data/activity_labels.txt")
activityLabel <- activity[Label[,1],2]
Label[,1] <- activityLabel
names(Label) <- "activity"
names(Subject) <- "subject"

# Part 4.
# Give variable appropriate names, consolidate into single dataset.
names(Data) <- features[MeanStDev,2]
finalData <- cbind(Subject,Label,Data)

# Part 5.
library(dplyr)
meanData <- finalData %>% group_by(subject, activity) %>% summarise_each(funs(mean(., na.rm=TRUE)))
write.table(meanData, "Data_with_Means.txt")
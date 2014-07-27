## This script produces a tidy data set from the Smartphones Data Set available at
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Check whether the unzipped data already exist in your working directory. 
## If data exist, the function below skips downloading and unpacking these data.
## Otherwise, it downloads a ZIP file with all data for the project into your
## working directory and unzips it.

if(!file.exists("UCI HAR Dataset")) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(url, destfile = "samsung.zip", method = "curl")
        unzip("samsung.zip")
}

## Read files for the test data set into R and assign data frames created from
## these files to the corresponding variables:

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## Combine data frames for the test set into a single data frame:

test <- cbind(subject_test, y_test, X_test)

## Read files for the training data set into R and assign data frames created from
## these files to the corresponding variables:

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Combine data frames for the training set into a single data frame:

train <- cbind(subject_train, y_train, X_train)

## Merge the training and the test sets to create one data set:

data <- rbind(test,train)

## Read the file, which contains names for the feature variables into R:

features <- read.table("UCI HAR Dataset/features.txt", 
                       stringsAsFactors = F)

## Rename the variables of the merged data set with some descriptive names:

names(data) <- c("subject","activity", features$V2)

## Read the file with activity labels into R:

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                              stringsAsFactors = F)

## Use descriptive activity names (activity labels) to name the activities 
## in the data set:

data$activity <- factor(data$activity, 
            levels = activity_labels$V1, 
            labels = activity_labels$V2)

## Extract the measurements on the mean and standard deviation for each signal 
## (along with subject and activity variables):

datanew <- data[,grep("mean\\(\\)|std\\(\\)|subject|activity", names(data))]

## Clean up the variable names:

names(datanew) <- gsub("^t", "Time_", names(datanew))
names(datanew) <- gsub("^f", "Freq_", names(datanew))
names(datanew) <- gsub("BodyBody", "Body", names(datanew))
names(datanew) <- gsub("-mean\\(\\)-", "_Mean_", names(datanew))
names(datanew) <- gsub("-mean\\(\\)", "_Mean", names(datanew))
names(datanew) <- gsub("-std\\(\\)-", "_Std_", names(datanew))
names(datanew) <- gsub("-std\\(\\)", "_Std", names(datanew))

## Create a tidy data set with the mean of each extracted feature variable for each 
## activity and each subject:

tidy <- aggregate(. ~ activity + subject, data = datanew, FUN = mean)


## Change the column oder a little bit (now subject variable is in the first column 
## and activity variable is in the second one):

tidy_final <- cbind(tidy[,c("subject","activity")], tidy[,3:68])

## Write a TXT file with a tidy data set:

write.table(tidy_final, "tidy_final.txt", row.names=FALSE)

## Or, alternatively, write a CSV file (if you prefer CSV rather than TXT, just 
## uncomment the line below and comment out the one with the write.table function 
## above):

## write.csv(tidy_final, "tidy_final.csv", row.names=FALSE)
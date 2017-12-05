
# Load dplyr library
library(dplyr)

# Reading train data set
x_train_dataset <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train_dataset <- read.table("UCI HAR Dataset/train/y_train.txt")
sub_train_dataset <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Reading test data set
x_test_dataset <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test_dataset <- read.table("UCI HAR Dataset/test/y_test.txt")
sub_test_dataset <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Reading data description
variable_names <- read.table("UCI HAR Dataset/features.txt")

# Reading activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Instruction #1: Merges the training and the test sets to create one data set.
x_total <- rbind(x_train_dataset, x_test_dataset)
y_total <- rbind(y_train_dataset, y_test_dataset)
sub_total <- rbind(sub_train_dataset, sub_test_dataset)

# Instruction #2:  Extracts only the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
x_total <- x_total[,selected_var[,1]]

# Instruction #3:  Uses descriptive activity names to name the activities in the data set
colnames(y_total) <- "activity"
y_total$activitylabel <- factor(y_total$activity, labels = as.character(activity_labels[,2]))
activitylabel <- y_total[,-1]

# Instruction #4:  Appropriately labels the data set with descriptive variable names.
colnames(x_total) <- variable_names[selected_var[,1],2]

# Instruction #5:  From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(sub_total) <- "subject"
total <- cbind(x_total, activitylabel, sub_total)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarise_all(funs(mean))
write.table(total_mean, file = "tidydata.txt", row.names = FALSE, col.names = TRUE)

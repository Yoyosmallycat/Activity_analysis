library(dplyr)
setwd ("C:/Users/wenju/OneDrive/Documents/R/get_clean_data/qize/week4/Activity_analysis")

# read test data 
x_test   <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test   <- read.table("./UCI HAR Dataset/test/Y_test.txt") 
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


#merge of test data with y_test(activity_labels) and subject label
merge_test<- cbind(x_test, y_test, sub_test)

# get a example to test the result of merge
merge_test[5, c(562,563)]

#read train data
x_train   <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train   <- read.table("./UCI HAR Dataset/train/Y_train.txt") 
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train
#merge of train data with y_train(activity_labels) and subject label
merge_train<- cbind(x_train, y_train, sub_train)

# get a example to test the result of merge
merge_train[1, c(562,563)]
merge_train[10, c(562,563)]

# merge of training and test sets
total<- rbind(merge_train, merge_test)

# read features description 
features <- read.table("./UCI HAR Dataset/features.txt") 


# read activity labels 
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 


#name columns
colnames(total)<- c(features[,2],"activity", "subject") 

total[1,c(560:563)]




# Extracts only the measurements on the mean and std. 

sel_features <- grep("mean\\(\\)|std\\(\\)", features[,2], value = TRUE)
length(sel_features)

total<- total %>% select(c(all_of(sel_features), "activity", "subject"))
ncol(total)
# test the result of column extraction
total[1, ]


#Uses descriptive activity names to name the activities in the data set
colnames(activity_labels) <- c("activity", "act_label")
str(activity_labels)
total_a <- left_join(total, activity_labels, by = "activity")
total_b <- total_a %>% select(-activity) %>%
  rename(activity = act_label)

#creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
total_mean <- total_b %>% group_by(activity, subject)%>%
  summarise_all(funs(mean)) 

# export summary data
write.csv(total_mean, file = "./tidydata.csv", row.names = FALSE, col.names = TRUE) 


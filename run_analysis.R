# Assumes the train and test folders in working directory
# Loads raw test and train data into two frames
raw_test_data <- read.table("test/X_test.txt")
raw_train_data <- read.table("train/X_train.txt")

# Loads the features list and assigns names
# to the columns of the test and train data frames
col.names <- read.table("features.txt")
names(raw_test_data) <- col.names[,2]
names(raw_train_data) <- col.names[,2]

# Reads in subjectID and assigns inserts it in the first column
test.subjectID <- read.table("test/subject_test.txt")
test.taskID <- read.table("test/y_test.txt")
train.subjectID <- read.table("train/subject_train.txt")
train.taskID <- read.table("train/y_train.txt")

test <- data.frame(subjectID = test.subjectID[,1],condition = "test", taskID=test.taskID[,1],
                   raw_test_data)
train <- data.frame(subjectID = train.subjectID[,1], condition = "train",taskID=train.taskID[,1],
                         raw_train_data)

#Merge into one dataframe with both test and train data, sorted by participant ID
merged.raw <- merge(train, test, all = T)

# Look for columns with names featuring "mean" or "std"
# While keeping the IDs, condition, and taskIDs
good.cols <- grepl("mean|std", names(merged.raw))
good.cols[c(1,2,3)] <- T

# Gets only the relevant data columns
merged <- merged.raw[,good.cols == T]

# renaming task IDs
merged$taskID <- as.character(merged$taskID)
merged$taskID[merged$taskID == "1"] <- "Walking"
merged$taskID[merged$taskID == "2"] <- "Walking_Upstairs"
merged$taskID[merged$taskID == "3"] <- "Walking_Downstairs"
merged$taskID[merged$taskID == "4"] <- "Sitting"
merged$taskID[merged$taskID == "5"] <- "Standing"
merged$taskID[merged$taskID == "6"] <- "Laying"

# Renaming Column (Variable) Headings
names(merged) <- gsub("[.]{2,3}", "", names(merged))

# Creating a new data frame and sorting to get in a nice format,
# as well as getting column names from "merged" set
new.df <- data.frame(subjectID = rep.int(1:30,6))
new.df$subjectID <- sort(new.df$subjectID)

taskVector <- c("Walking", 
                "Walking_Upstairs", 
                "Walking_Downstairs", 
                "Sitting",
                "Standing",
                "Laying")
new.df$taskID <- rep(taskVector, 30)
new.df[names(merged)[-c(1:3)]] <- NA


#This fills in the second data set
for(i in c(3:81)) {
  for(j in new.df$subjectID) {
    for(k in 1:6){
    new.df[j*6 - (6 - k),i] <- mean(merged[,i+1][merged$subjectID == j & merged$taskID == taskVector[k]])
    }
  }
}

#Writes the final tidy data set to a txt file
write.table(new.df, file = "final_set.txt")


##
## run_Analysis.R

# We need the plyr library for the ddply function
library(plyr)

#Our main data directory
dataset_dir <- "UCI HAR Dataset"

#Build the strings for the file names
stest_file <- paste(dataset_dir, "test", "subject_test.txt", sep = "/")
strain_file <- paste(dataset_dir, "train", "subject_train.txt", sep = "/")
xtest_file <- paste(dataset_dir, "test", "X_test.txt", sep = "/")
ytest_file <- paste(dataset_dir, "test", "y_test.txt", sep = "/")
xtrain_file <- paste(dataset_dir, "train", "X_train.txt", sep = "/")
ytrain_file <- paste(dataset_dir, "train", "y_train.txt", sep = "/")
features_file <- paste(dataset_dir, "features.txt", sep = "/")
activities_file <- paste(dataset_dir, "activity_labels.txt", sep = "/")


# Read the activities file
activities <- read.table(activities_file)

# Read the features file
features <- read.table(features_file)
# Save the features rows as a vector 
xcols <- as.vector(features$V2)

# Read the Test Subject table
stest <- read.table(stest_file,col.names = c("Subject"))

# Read the Train Subject table
strain <- read.table(strain_file,col.names = c("Subject"))

# Read the Test Y table
ytest <- read.table(ytest_file,col.names = c("Activity"))

# Read the Train Y table
ytrain <- read.table(ytrain_file,col.names = c("Activity"))

# Read the Test X table
xtest <- read.table(xtest_file, col.names = xcols)

# Read the Train Y table
xtrain <- read.table(xtrain_file, col.names = xcols)


## STEP 1. Merge train and test datasets
merge_s <- rbind(stest, strain)
merge_x <- rbind(xtest, xtrain)
merge_y <- rbind(ytest, ytrain)

## STEP 2. Get only mean/std columns
meanstd <- grep("-(mean|std)\\(\\)", xcols)
merge_x <- merge_x[,meanstd]

## STEP 3. Activity labels
# Loop through the merged Y rows
for(i in 1:nrow(merge_y)){
  # Save the activities row number from the value of the current Y row
  rownum <- merge_y[i,1]
  
  # Set the Y value as the corresponding Activity label
  merge_y[i,1] <- as.character(activities[rownum,2])
}

## STEP 4. Appropriate labels 
## Already done when reading tables (above) using col.names

# Merge the subject, activity and readings tables
merged_data <- cbind(merge_s, merge_y, merge_x)


## STEP 5. Create tidy dataset 

# Create the tidy dataset using the ddply function using the colwise(mean) subfunction
tidy_data <- ddply(merged_data, .(Subject, Activity), colwise(mean))

# Write the data table using row.name FALSE 
write.table(tidy_data,"tidy_data.txt", row.name = FALSE)



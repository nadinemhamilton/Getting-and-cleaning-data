# different files
# features.txt = contains labels for all observations delimited by a space
# activity_labels.txt = contains grouping (1-6) of activity categories, delimited by a space

library(dplyr)

setwd("C:/Nadine Hamilton/Coursera/Data Science Toolkit/datasciencecoursera/Getting and cleaning data")




# load variables names for the observation rows. Variable names are NOT unique so not loaded as factors
df_var_names <- read.table("UCI HAR Dataset/features.txt", col.names = c("ID","varname"), stringsAsFactors = FALSE)

# load names associated with each activity ID
df_activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityID","activity_name"))

# load activity ids for each test observation row/train observation row
df_test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activityID")
df_train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activityID")

# load test/train subject ids for each observation row
df_test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subjectID")
df_train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subjectID")

# measures (against each activity) and rename columns to ensure uniqueness
df_test_obs <- read.table("UCI HAR Dataset/test/X_test.txt")
names(df_test_obs) <- make.unique(df_var_names$varname)

df_train_obs <- read.table("UCI HAR Dataset/train/X_train.txt")
names(df_train_obs) <- make.unique(df_var_names$varname)

# Verify each of the df to be combined have the same number of rows, if not, raise a warning
if ((nrow(df_test_subjects) != nrow(df_test_activity)) | (nrow(df_test_subjects)) != nrow(df_test_obs)) {warning("mismatched number of rows between TEST datasets")}

# Verify each of the df to be combined have the same number of rows, if not, raise a warning
if ((nrow(df_train_subjects) != nrow(df_train_activity)) | (nrow(df_train_subjects)) != nrow(df_train_obs)) {warning("mismatched number of rows between TRAIN datasets")}


#create a subset containing only columns for "mean()" (mean) and "std" (standard deviation) and combine the two together
df_test_subset <- bind_cols(df_test_subjects,
                     df_test_activity,
                     select(df_test_obs, contains("mean()")), 
                     select(df_test_obs, contains("std"))
                    )

df_train_subset <- bind_cols(df_train_subjects,
                             df_train_activity,
                             select(df_train_obs, contains("mean()")),
                             select(df_train_obs, contains("std"))
                             ) 
df_subset <- bind_rows(df_test_subset, df_train_subset)

#remove temporary subsets no longer required
rm(df_test_subset)
rm(df_train_subset)
rm(df_var_names)

# change the labels of Activity ID from a number to the descriptive label (e.g. 1 = WALKING)
df_subset["activityID"] <- inner_join(df_subset, df_activity_labels, by = "activityID") %>% select(activity_name)

# Modify the column names to remove "()"
v_names <- names(df_subset)
v_names <- sub("\\(\\)","",v_names)
names(df_subset) <- v_names

# create an output file containing the reformatted, clean data called "clean_signal_data.txt"
df_subset %>% write.table(file = "clean_signal_data.txt", row.names = FALSE)

# create a tidy dataset which contains the average for each measurement by subject and activity and write this out to a
# text file called "combined_mean_signal_data.txt" in the working directory
df_subset %>% 
    group_by(subjectID, activityID) %>% 
        summarise_each(funs(mean)) -> df_mean_signals

# rename columns to highlight that these are averages
v_names <- names(df_mean_signals)
v_names <- sub("Body","MeanBody", v_names)
v_names <- sub("Gravity", "MeanGravity", v_names)

names(df_mean_signals) <- v_names

df_mean_signals %>% write.table(file = "combined_mean_signal_data.txt", row.names = FALSE)




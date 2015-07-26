# Getting_And_Cleaning_Data_Project

The script contained in this repo is called run_analysis.R.

This script assumes that:
* A working directory has been correctly specified.
* The script file itself is in the working directory.
* The Samsung data has been unzipped into the working directory, and the encolsing directory name for the datafiles is "data".

1. The script first reads in the six individual source files. The source files from the training and test directories are merged into three dataframes.
2. The script reads the features.txt data, and uses a grep search to determine which variables contain mean and standard deviation data.  The script creates a list of variables with mean or standard deviation data, and subsets the main data with this list.
3. In order to generate the activity names, the script reads the activity_labels file, and assigns the corresponding names to the labels data read in step 1. The variable name "subject" and "activity" are assigned to the columns in the subject and label data read in step 1.
4. The script assigns the appropriate variable names to the dataset, then consolidates the three separate dataframes created in step 1.
5. The script uses the summarize_each function of the dplyr package to generate means data for each column, grouped by subject and activity.

The first of the resulting data contains the subject ID, the second clumn contains the activity, and the subsequent columns contains the mean of each parameter.

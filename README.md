# Getting and Cleaning Data Course Project

This project is part of the Getting and Cleaning Data of Data Science Specialization Course via Coursera.
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The R script, run_analysis.R, describes the following process below:

1. The script assumes that the assigned required datasets (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are located in the working directory where the script is located.
2. It loads the required library, dplyr.
3. Next, both the test and training datasets are loaded, with only the mean or standard deviation fields filtered.
4. It then loads the the subject and activity data for each dataset, afterwhich it merges these columns with the dataset.
5. The two datasets are merged.
6. Finally, the script creates a tidy (clean) dataset with the average (mean) value of each variable for each subject and activity pair.
7. It will then create a file, tinydata.txt, and saved in the working directy.

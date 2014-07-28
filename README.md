The R script created within the course project produces a tidy data set from the Smartphones Data Set available at the UC Irvine Machine Learning Repository.

List of files
run_analysis.R ！ the R script that can be used to obtain a tidy data set from the Smartphone Data
README.md describing how the script works and providing some other useful information
CodeBook.md describing the variables, the data, and all the transformations that were performed to clean up the data

Description of the R script
The R script written for this project can be used to create a tidy data set from the Smartphone Data.
The run_analysis.R script:
Merges the training and the test sets into a single data set.
Renames the variables of the merged data set with descriptive names (data from the features.txt are used to name feature variables in the merged data set, however some changes ！ described in detail in the CodeBook.md ！ are made in order to obtain somewhat more descriptive variable names, correct minor errors in variable names that were present in the original data set and get rid of some undesirable symbols that may cause problems while performing analysis in R).
Uses activity labels from activity_labels.txt to name the activities in the data set.
Extracts the measurements on the mean and standard deviation for each signal (along with subject and activity variables).
Creates a tidy data set with the mean of each feature variable for each activity and each subject, which is written into a TXT file (although you may choose writing data into a CSV file ！ just follow the instructions in the script).
 
How does the script work:
run the script via
source("run_analysis.R")
Now wait until the script stops running. The output will be the tidy data set I submitted for the first part of the assignment.
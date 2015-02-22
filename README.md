# coursera-getdata001-courseproject
# aborgia
##
0)In an R session, to download the file of the data described above, issue the following command:

      > download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "samsungdata.zip", method = "curl")

1) The script is named "run_analysis.R". It takes a zipped file name "samsungdata.zip," which should be located in your current working directory. 

2) The script unzips this file and then sets 8 of the text files to 8 separate variables, some as strings, and the rest as numbers.

3) The column names of the x_test.txt and x_train.txt are set to be the string values from the features.txt file.

4) The test set information (x and y data) are combined. Similarly with the training data set. Basically, the subject file, activity file, and the x_test data file, are smooshed together such that in the end, you get 2 new columns on the LHS of the x_test data. Again similarly done for the training dataset.

5)The first and second columns are now the subject and activity columns, however their titles are V1 and V1. They are renamed now.

6)Now, the datasets are combined together with rbind, such that the rows of the test- and training dataset form one combined dataset.

7)Now for the purposes of this analysis, I want to grab only grab the columns in this new combined dataset that have the words "mean", "std", "Activity" and "Subjects" in the titles, i.e. get a subset of the dataset of just the mean and std quantities. However, we need to remember the Activity and Subjects columns, since we need them later.

8)Since it has not been done, the activity labels columns 1 and 2 (number of activity, and corresponding activity label) are set to new variables - for ease of reading and using in the enxt step.

9)Now, loop from 1 to the last element in the activity table (6 rows, here), and substitute the number of the activity (column 1) with the corresponding activity name (column 2), which was read in earlier as strings. The "sub" function will search within the "Activty" column of the newly reduced dataset for the number and replace it with the name.

10)From the data set in setp 9, a second, independent tidy data is created with only the average (mean) of each variable for each activity and each subject. This is done with the "aggregate" function. 180 rows are left in this final dataset, which is expected as there are 30 subjects and 6 activities -> 30*6=180.
##

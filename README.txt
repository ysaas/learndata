README

run_analysis.R does the steps 1-5 for the Course Project.

It assumes that data is downloaded and unzipped.

It loads the following files.(Descriptions for these files are found in the
README.txt of the original data.)

  test/X_test.txt
  test/y_test.txt
  
  train/X_train.txt
  train/y_train.txt
  
  test/subject_test.txt
  train/subject_train.txt
  
  activity_labels.txt
  features.txt
  
It does the steps out of order.  

First does step 3. Putting in the Activity names by joining the y_test.txt with activity_labels 
and does the same for the training data.

Step 4.  Uses features.txt as column names for the rest of the data.

Step 1. Merges the data with the appropriate column names and activity labels.

Step 2. Uses regular expression to extract out the columns for mean and standard deviation.

Step 5. Sorts and groups the data by Subject then by Activity.  Finally uses summarize_each to get the averages.



Data Dictionary

Layout of dataset:

Data (all under variable names): 
X_train.txt, X_test.txt, subject_test.txt, subject_train.txt, 
y_train.txt, y_test.txt (y_train.txt, y_test.txt stored in activity_labels.txt)

Variable Names (separate data files into separate groups):
features.txt, Subject, Activity 

Definitions:
activity_labels.txt applies descriptive activity names to name the activities in the data set:

walking
walkingupstairs
walkingdownstairs
sitting
standing
laying

Feature names (attributes) and activity names are converted.
Subject IDs are integers between 1 and 30. The names of the attributes are similar to the following:

tbodyacc-mean-x 
tbodyacc-mean-y 
tbodyacc-mean-z 
tbodyacc-std-x 
tbodyacc-std-y 
tbodyacc-std-z 
tgravityacc-mean-x 
tgravityacc-mean-y

Sensor accelerator used to capture measurements off of subject IDs has sensor acceleration signal (bodyacc), which has gravitational and body motion (gravityacc) components.

Summary:
Tidy data sets are made by:
-combining training and test sets into one data set
-extracting only the measurements on the mean and standard deviation for each measurement 
-using descriptive activity names to name the activities in the data set
-Appropriately labeling the data set with descriptive variable names
-from the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject
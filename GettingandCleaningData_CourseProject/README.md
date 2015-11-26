What This Script Does:

Downloads two data sets from UCI's Machine Learning repository for "Human Activity Recognition Using Smartphones Data Set".

The source link is:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

A zip file is obtained from this source, unzipped into a local directory and loaded into R.

Two files/data sets are used in this script. They are called the training and test sets. 

They are used to create tidy data sets all combined in 'run_analysis.R'.

This new file can be loaded into R with the working directory set for where the training and test set files are located.

Package that needs to be loaded before running script is:
library(plyr)
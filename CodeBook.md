### Code Book

Coursera Data Science Specialization by Johns Hopkins University/Getting and Cleaning Data Course 3/Week4 Assignment code book i.e detailed descripton od data processing.

### Source Datasets
Source Datasets are located in ./UCI HAR Dataset directory
They were downloaded from location as follows :
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Cleaning & Processing
All necessary processing is performed by run_analysis.R script.
Script run_analysis.R defines only one function run_analysis 
with only one input parameter path with default value as follows "./UCI HAR Dataset"

Function run_analysis requires dplyr package.
Function checks whether necessary dplyr package is attached in working environment and if not it attaches dplyr.


### Output tidy Datasets
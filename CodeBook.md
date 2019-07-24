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
Function checks current working environment whether necessary dplyr package is attached and if not it attaches dplyr.

Processing consists of 9 steps :
1) Loading ./test/X_test.txt and ./train/X_train.txt files into two separate tibbles (tbl_df) data structures => tbl1, tbl2
2) Labeling columns based on features.txt file; because of some variables have the same names in features.txt extra ordinal number is concatenated at the end of labels
3) Enrichment of tibbles with flag test/train to indicate source file from where data originates
4) Enrichment of tibbles with subject and activity variables based on ./test/subject_test.txt, ./train/subject_train, ./test/y_test.txt, ./train/y_train.txt files
5) Merging test and train tibbles together using union_all function => tbl3
6) Enrichment of tibble tbl3 with activity label based on ./activity_labels.txt file
7) Reordering columns and writing tbl3 into out_dset1.csv file
8) Grouping tibble from step 7 and creating new tibble tbl4 
9) Creating new summary dataset in accordance with assignment requiremets and writing it into out_dset2.csv file and out_dset2.txt file


### Output tidy Datasets
Script produces two output files in csv format:
out_dset1.csv
out_dset2.csv
and on in txt format :
out_dset2.txt
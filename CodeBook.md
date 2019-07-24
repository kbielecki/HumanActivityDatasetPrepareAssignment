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

### Dataset Variables in out_dset2.csv & out_dset2.txt files
"activity" - number decribing activity 
"subject"  - number decribing subject of activity
"tBodyAcc-mean()-X_1" - average number of given feature per activity+subject group
"tBodyAcc-mean()-Y_2" - average number of given feature per activity+subject group
"tBodyAcc-mean()-Z_3" "tBodyAcc-std()-X_4" "tBodyAcc-std()-Y_5" "tBodyAcc-std()-Z_6" "tGravityAcc-mean()-X_41" "tGravityAcc-mean()-Y_42" "tGravityAcc-mean()-Z_43" "tGravityAcc-std()-X_44" "tGravityAcc-std()-Y_45" "tGravityAcc-std()-Z_46" "tBodyAccJerk-mean()-X_81" "tBodyAccJerk-mean()-Y_82" "tBodyAccJerk-mean()-Z_83" "tBodyAccJerk-std()-X_84" "tBodyAccJerk-std()-Y_85" "tBodyAccJerk-std()-Z_86" "tBodyGyro-mean()-X_121" "tBodyGyro-mean()-Y_122" "tBodyGyro-mean()-Z_123" "tBodyGyro-std()-X_124" "tBodyGyro-std()-Y_125" "tBodyGyro-std()-Z_126" "tBodyGyroJerk-mean()-X_161" "tBodyGyroJerk-mean()-Y_162" "tBodyGyroJerk-mean()-Z_163" "tBodyGyroJerk-std()-X_164" "tBodyGyroJerk-std()-Y_165" "tBodyGyroJerk-std()-Z_166" "tBodyAccMag-mean()_201" "tBodyAccMag-std()_202" "tGravityAccMag-mean()_214" "tGravityAccMag-std()_215" "tBodyAccJerkMag-mean()_227" "tBodyAccJerkMag-std()_228" "tBodyGyroMag-mean()_240" "tBodyGyroMag-std()_241" "tBodyGyroJerkMag-mean()_253" "tBodyGyroJerkMag-std()_254" "fBodyAcc-mean()-X_266" "fBodyAcc-mean()-Y_267" "fBodyAcc-mean()-Z_268" "fBodyAcc-std()-X_269" "fBodyAcc-std()-Y_270" "fBodyAcc-std()-Z_271" "fBodyAcc-meanFreq()-X_294" "fBodyAcc-meanFreq()-Y_295" "fBodyAcc-meanFreq()-Z_296" "fBodyAccJerk-mean()-X_345" "fBodyAccJerk-mean()-Y_346" "fBodyAccJerk-mean()-Z_347" "fBodyAccJerk-std()-X_348" "fBodyAccJerk-std()-Y_349" "fBodyAccJerk-std()-Z_350" "fBodyAccJerk-meanFreq()-X_373" "fBodyAccJerk-meanFreq()-Y_374" "fBodyAccJerk-meanFreq()-Z_375" "fBodyGyro-mean()-X_424" "fBodyGyro-mean()-Y_425" "fBodyGyro-mean()-Z_426" "fBodyGyro-std()-X_427" "fBodyGyro-std()-Y_428" "fBodyGyro-std()-Z_429" "fBodyGyro-meanFreq()-X_452" "fBodyGyro-meanFreq()-Y_453" "fBodyGyro-meanFreq()-Z_454" "fBodyAccMag-mean()_503" "fBodyAccMag-std()_504" "fBodyAccMag-meanFreq()_513" "fBodyBodyAccJerkMag-mean()_516" "fBodyBodyAccJerkMag-std()_517" "fBodyBodyAccJerkMag-meanFreq()_526" "fBodyBodyGyroMag-mean()_529" "fBodyBodyGyroMag-std()_530" "fBodyBodyGyroMag-meanFreq()_539" "fBodyBodyGyroJerkMag-mean()_542" "fBodyBodyGyroJerkMag-std()_543" "fBodyBodyGyroJerkMag-meanFreq()_552" "angle(tBodyAccMean,gravity)_555" "angle(tBodyAccJerkMean),gravityMean)_556" "angle(tBodyGyroMean,gravityMean)_557" "angle(tBodyGyroJerkMean,gravityMean)_558" 
"angle(X,gravityMean)_559" - average number of given feature per activity+subject group
"angle(Y,gravityMean)_560" - average number of given feature per activity+subject group
"angle(Z,gravityMean)_561" - average number of given feature per activity+subject group
"activity_label" - character string describing label of activity according to ./activity_labels.txt dictionary file

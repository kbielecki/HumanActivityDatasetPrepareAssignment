run_analysis<-function(path="./UCI HAR Dataset") {
        if (!file.exists(path)) message("path does not exist")
        setwd(path)
        # sep ="" means one or more white characters
        df1<-read.table("./test/X_test.txt",sep ="",stringsAsFactors = FALSE,header = FALSE,strip.white=TRUE)
        # dplyr requaired
        if (sum(grep("dplyr",library()))==0) library(dplyr)
        tbl1<-tbl_df(df1)
        print(tbl1)
        names(tbl1)
}
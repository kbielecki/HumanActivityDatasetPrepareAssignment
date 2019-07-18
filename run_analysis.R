run_analysis<-function(path="./UCI HAR Dataset") {
        if (!file.exists(path)) message("path does not exist")
        setwd(path)
        # sep ="" means one or more white characters
        df1<-read.table("./test/X_test.txt",sep ="",stringsAsFactors = FALSE,header = FALSE,strip.white=TRUE)
        # dplyr requaired
        if (sum(grep("dplyr",library()))==0) library(dplyr)
        tbl1<-tbl_df(df1)
        
        df2<-read.table("./features.txt",stringsAsFactors = FALSE)
        
        # names(tbl1) <-df2$V2
        # some columns have the same feature name so i expand variable name with ordinal number from features.txt file!!!
        names(tbl1) <-paste0(df2$V2,"_",df2$V1)
        
        
        # select apprioprate variables
        # and expand dataset with "test" flag to indicate file origin
        tbl1<-tbl1 %>% select(matches("mean|std")) %>% mutate(file="test")
        
        print(tbl1)
        names(tbl1)
}
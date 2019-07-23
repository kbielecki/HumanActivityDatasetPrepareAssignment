run_analysis<-function(path="./UCI HAR Dataset") {
        # Change working directory to demanded path
        if (!file.exists(path)) message("path does not exist")
        setwd(path)

        # dplyr required so check and load if needed
        if (sum(grep("dplyr",search()))==0) library(dplyr)
        
                
        # Load file with raw data to tbl_df structure
        # sep ="" means one or more white characters
        df1<-read.table("./test/X_test.txt",sep ="",stringsAsFactors = FALSE,header = FALSE,strip.white=TRUE)
        tbl1<-tbl_df(df1)
        df1<-read.table("./train/X_train.txt",sep ="",stringsAsFactors = FALSE,header = FALSE,strip.white=TRUE)
        tbl2<-tbl_df(df1)
        
        
        # Assign appropriate column names based on features.txt data
        # some columns have the same feature name !!!  
        # so i expand variable name with ordinal number from features.txt file
        df2<-read.table("./features.txt",stringsAsFactors = FALSE)
        names(tbl1) <-paste0(df2$V2,"_",df2$V1)
        names(tbl2) <-paste0(df2$V2,"_",df2$V1)
        
        # Select appropriate variables &
        # Expand dataset with test/train flag to indicate file origin
        tbl1<-tbl1 %>% select(matches("mean|std")) %>% mutate(file="test")
        tbl2<-tbl2 %>% select(matches("mean|std")) %>% mutate(file="train")
        
        # Expand dataset with subject and activity columns
        tbl1<-mutate(tbl1,subject=read.table("./test/subject_test.txt",stringsAsFactors = FALSE)[,1],activity=read.table("./test/y_test.txt",stringsAsFactors = FALSE)[,1])
        tbl2<-mutate(tbl2,subject=read.table("./train/subject_train.txt",stringsAsFactors = FALSE)[,1],activity=read.table("./train/y_train.txt",stringsAsFactors = FALSE)[,1])
        
        # merge test and train data
        tbl3<-union_all(tbl1,tbl2)
        
        # Expand dataset with activity label and reorder columns
        tbl3<-merge(tbl3,read.table("./activity_labels.txt",stringsAsFactors = FALSE),by.x="activity",by.y="V1")
        tbl3<-tbl3 %>% tbl_df() %>% select(activity,activity_label=V2,subject,file,everything())
        # alternative versions :
        # tbl3<-tbl3 %>% tbl_df() %>% select(activity,activity_label=V2,subject,file,matches("mean|std"))
        # tbl3<-tbl3 %>% tbl_df() %>% select(activity,activity_label=V2,subject,file,grep("activity|V2|subject|file",names(tbl3),invert = TRUE,value = TRUE))
                
        print(tbl3)
        names(tbl3)
        
        # Create a second, independent tidy data set with the average of each variable for each activity and each subject
        tbl4<-group_by(tbl3,activity,subject)
        tbl4<-inner_join(summarize_if(tbl4,is.numeric,mean),summarize(tbl4,activity_label=min(activity_label )))
        #ungroup(tbl4)
        
        print(tbl4)
        names(tbl4)
        
}
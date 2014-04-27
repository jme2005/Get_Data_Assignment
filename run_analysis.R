#Reads in the data, process it and returns a tidy data set. 
#Requires that either the "UCI HAR Dataset" directory and it's subdirectories 
#is located in your working directory or that all the files are in your working directory

library(stats)

ReadData<- function() { #Read the data into R
        if(file.exists("./UCI HAR Dataset")){
                Xtrain<<-read.table("./UCI HAR Dataset/train/X_train.txt")
                cnames<<-read.table("./UCI HAR Dataset/features.txt")
                Ytrain<<-read.table("./UCI HAR Dataset/train/y_train.txt")
                Ylabels<<-read.table("./UCI HAR Dataset/activity_labels.txt")
                Xtest<<-read.table("./UCI HAR Dataset/test/X_test.txt")
                Ytest<<-read.table("./UCI HAR Dataset/test/y_test.txt")
                test_sub<<-read.table("./UCI HAR Dataset/test/subject_test.txt")
                train_sub<<-read.table("./UCI HAR Dataset/train/subject_train.txt")
        }else{
                Xtrain<<-read.table("X_train.txt")
                cnames<<-read.table("features.txt")
                Ytrain<<-read.table("y_train.txt")
                Ylabels<<-read.table("activity_labels.txt")
                Xtest<<-read.table("X_test.txt")
                Ytest<<-read.table("y_test.txt")
                test_sub<<-read.table("subject_test.txt")
                train_sub<<-read.table("subject_train.txt")
        }
        
}





ProcessData <- function() { # Process the Data According to the Instructions of the Assignment and return a tidy dataset
        # combine the test and train datasets
        Xdata<-rbind(Xtrain,Xtest) 
        Ydata<-rbind(Ytrain,Ytest)
        SubData<-rbind(train_sub,test_sub)
        # rename the 'subject' and 'activity' columns 
        names(SubData)="Subject"
        names(Ydata)="Activity"
        # set 'subject' and 'activity' as factors and change the activity labels to discriptive labels
        SubData$Subject<-factor(SubData$Subject)
        Ydata$Activity=factor(Ydata$Activity,labels=c(as.character(Ylabels$V2)))
        # extract only the mean and std of each measurement and combine with the 'activity' and 'subject' labels
        keep1<-grepl("-mean()", cnames$V2,fixed=T)
        keep2<-grepl("-std()", cnames$V2,fixed=T)
        extractedData<-Xdata[,keep1 | keep2]
        names(extractedData)=cnames$V2[keep1 | keep2]
        comb_data<-cbind(SubData,extractedData,Ydata)
        # create a tidy dataset with the average of the mean and std for each activity and subject
        drops<-c('Subject','Activity') # since the means will be aggreagated by these factors they will be excluded
        tidyData<-aggregate(comb_data[,!(names(comb_data) %in% drops)],by=list(comb_data$Subject,comb_data$Activity),FUN=mean)
        names(tidyData)[1]=drops[1] #rename the "Group.1" and " Group.2" columns to their proper names. 
        names(tidyData)[2]=drops[2]
        # return the tidy dataset
        tidyData
}




ReadData()
tidyData<-ProcessData()
#rm("Xtrain","Ytrain","cnames","Xtest","Ytest","Ylabels","test_sub","train_sub")








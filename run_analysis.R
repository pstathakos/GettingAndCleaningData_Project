analysis<-function()
{
    ## Load required packages
    library(data.table)
    library(plyr)
    library(dplyr)
    library(tidyr)
    library(reshape2)
    
    ## Read features and activity files
    directory<-paste(getwd(), "/R/3 - GettingAndCleaningData/CourseProject/UCI HAR Dataset/", sep="")
    featuresfile<-paste(directory, "features.txt", sep="")
    activitiesfile<-paste(directory, "activity_labels.txt", sep="")
    
    featuresdatatable<-read.table(featuresfile, stringsAsFactors = FALSE)
    featuresdata<-c(featuresdatatable[,2])

    ## Read activities file and create table
    activitiesdata<-read.table(activitiesfile)
    colnames(activitiesdata)<-c("activity_id", "activity_name")
    
    ## Create directory variables
    testtrain<-c("test", "train")
    
    ## Read data files and add data to frames
    for(i in 1:2)
    {
            ## Read features data and place in data frame
            datafile<-paste(directory, testtrain[i], "/X_", testtrain[i], ".txt", sep="")
            featuresdata<-read.table(datafile)
            colnames(featuresdata)<-c(featuresdatatable[,2])

            ## Read subject data and place in data frame
            datafile<-paste(directory, testtrain[i], "/subject_", testtrain[i], ".txt", sep="")
            subjectdata<-read.table(datafile)
            colnames(subjectdata)<-c("subject_id")
                                    
            ## Read activity data and place in data frame
            datafile<-paste(directory, testtrain[i], "/y_", testtrain[i], ".txt", sep="")
            activitydata<-read.table(datafile)
            colnames(activitydata)<-c("activity_id")
        
        if(i == 1)
        {
            ## Bind test data together
            alldata1<-cbind(subjectdata, activitydata, featuresdata)
        }
        else
        {
            ## Bind train data together
            alldata2<-cbind(subjectdata, activitydata, featuresdata)
        }
        
    }

    ## Bind the test and train data
    alldata<-rbind(alldata1, alldata2)

            

    ## Subset the data frame to obtain only the mean and standard deviation data
    ## Map activity_id to activity labels
    alldata = merge(alldata, activitiesdata, by.x = "activity_id")
    
    
    ## Extract the subject and activity data
    alldatafinal<-subset(alldata, select = c(1, 2, 564))

    ## Extract only mean and standard deviation data
    alldatasub1<-grep("mean", names(alldata), ignore.case=TRUE)
    alldatasub2<-grep("std", names(alldata), ignore.case=TRUE)

    ## Bind all final data together
    alldatafinal1<-subset(alldata, select = alldatasub1)
    alldatafinal2<-subset(alldata, select = alldatasub2)
    
    alldatafinal<-cbind(alldatafinal, alldatafinal1, alldatafinal2)


    ## Create table of summarized data
    alldatamelt<-melt(alldatafinal, id=c("activity_id", "subject_id", "activity_name"))
    alldatafinalsummarized<-dcast(alldatamelt, activity_id + subject_id + activity_name ~ variable, fun = mean)
    
    ## Update column names to reflect the mean data
    for(m in 4:ncol(alldatafinalsummarized))
    {
        colnames(alldatafinalsummarized)[m]<-paste("mean_", colnames(alldatafinalsummarized)[m], sep="")
    }
    
    
    ## Export compete data to a file (just for review)
    filename<-paste(getwd(), "/R/3 - GettingAndCleaningData/CourseProject/AllData_Final.txt", sep="")
    write.table(alldatafinal, file = filename, quote = FALSE, row.names = FALSE)


    ## Export summarized data to file
    filename<-paste(getwd(), "/R/3 - GettingAndCleaningData/CourseProject/AllDataSummarized_Final.txt", sep="")
    write.table(alldatafinalsummarized, file = filename, quote = FALSE, row.names = FALSE)
        
}
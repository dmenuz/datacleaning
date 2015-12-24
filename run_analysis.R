#Script for downloading, merging, and summarizing Human Activity Recognition Data
#See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more information

############################################################################
#Step 1: Download data, unzipe, and create list of all files in zipped file
#Steps that do not need to be repeated more than once are commented out
setwd("C:\\Users\\Diane\\Desktop\\workingDirectory")
#file="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile="dat.zip"
#download.file(file, destfile)
zipList=unzip(destfile, list=TRUE)
#unzip(destfile)

############################################################################
#Step 2: Read in necessary data
#reading training data
X_train=read.table(zipList$Name[31])
y_train=read.table(zipList$Name[32])
subject_train=read.table(zipList$Name[30])
#reading test data
X_test=read.table(zipList$Name[17])
y_test=read.table(zipList$Name[18])
subject_test=read.table(zipList$Name[16])
#reading in misc. data
activity_labels=read.table(zipList$Name[1])
features=read.table(zipList$Name[2])

############################################################################
#Step 3 merge data sets together
#prepping data for merge by adding variable to determine data source
#(train or test data), adding descriptive variable for activity codes, 
#and then creating final test and train data sets
library(dplyr)
xtrain=mutate(X_train, subjectType="train")
ytrain=merge(y_train, activity_labels, by="V1", all=TRUE)
colnames(ytrain)=c("activityCode", "activityName")
colnames(subject_train)="subject"
traindat=data.frame(xtrain, ytrain,subject_train)

xtest=mutate(X_test, subjectType="test")
ytest=merge(y_test, activity_labels, by="V1", all=TRUE)
colnames(ytest)=c("activityCode", "activityName")
colnames(subject_test)="subject"
testdat=data.frame(xtest, ytest,subject_test)
#merge datasets together
mergedat=rbind(traindat, testdat)

############################################################################
#Step 4 select out variables of interest
meanMatch=grep("mean()",features$V2)
meanFreqMatch=grep("meanFreq()",features$V2)
meanMatchFin=setdiff(meanMatch, meanFreqMatch)
sdMatch=grep("std()",features$V2)
#test that we got the correct values
features$V2[meanMatchFin]
features$V2[sdMatch]

#get index values for columns we want to keep in addition to those above
keepcols=which(colnames(mergedat) %in% 
        c("subjectType", "activityCode", "activityName", "subject"))

meanstd=mergedat[,c(keepcols, meanMatchFin, sdMatch)]

############################################################################
#Step 5 Update column labels to something more descriptive
#(activity labels were added to datasets before they were merged)
colnames(meanstd)[(length(keepcols)+1):ncol(meanstd)]=
    c(as.character(features$V2[meanMatchFin]), 
      as.character(features$V2[sdMatch]))

############################################################################
#Step 6 Create tidy dataset with mean value per activity and per subject
splitdat2=split(meanstd[,(length(keepcols)+1):ncol(meanstd)], f=list(meanstd$activityName, meanstd$subject), drop=TRUE)
summarydat=sapply(splitdat2, function(x) colMeans(x), simplify=T)
tidydat=t(summarydat)

#splitting out subject and activity values from row names to add as column
# x=strsplit(row.names(tidydat), split=".", fixed=TRUE)
# activity=sapply(x, function(x) x[1])
# subject=sapply(x, function(x) x[2])
# fintidydat=data.frame(activity, subject, tidydat)
# rownames(fintidydat)=NULL
# colnames(fintidydat)=gsub("...", ".", colnames(fintidydat), fixed=TRUE)

write.table(tidydat, "C:\\Users\\Diane\\Documents\\gitRepo\\datacleaning\\tidydata.txt", row.names=FALSE)


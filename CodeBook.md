---
title: "CodeBook"
author: "DMenuz"
date: "December 23, 2015"
output: html_document
---

#Variables


#Data
#description of data  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Analysis Steps

1. Data was downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", stored locally and unzipped
2. Testing and training data were read in, including activities, subjects, and results. Labels for the activities and colnames for the results were also read in.
3. Final testing and training datasets were created by binding the activites, subjects and results together for each. The activity labels were used to convert the activity codes to descriptive names.
4. Final testing and training datasets were merged together with a variable called "test" or "train" indicating the source of the data
5. The merged dataset was substted to obtain only those columns representing the mean and standard deviation, as well as the activity and subject columns
6. Updated the column names of the subset dataset to the appropriate names, from the results labels read in for step 2
7. Obtained the mean value for all of the mean and standard deviation values, by subject and activity level
8. Saved new file as tidydata.csv




This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

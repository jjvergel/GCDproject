url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data.zip")

setwd("./ds/3gcd/project")
data2 <- read.table("./UCI HAR Dataset/test/X_test.txt" )
data5 <- read.table("./UCI HAR Dataset/train/X_train.txt" )

features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.character(features[,2])
features <- gsub("-", "", features, fixed=TRUE)
features <- gsub("()", "", features, fixed=TRUE)

colnames(data2) <- features
colnames(data5) <- features

data <- rbind(data2, data5)

library(dplyr)

d <- tbl_df(data)
da <- summarize(d, mean(tBodyAccmeanX:tBodyAccJerkiqrX))

desv <- select(d, contains("std()"))


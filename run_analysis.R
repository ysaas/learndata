library(plyr)
library(dplyr)
library(reshape2)

#This Script assumes data has been downloaded and unzipped

#read data
xtestdata = read.table('test/X_test.txt', stringsAsFactors=FALSE)
ytestdata = read.table('test/y_test.txt',stringsAsFactors=FALSE)
xtraindata = read.table('train/X_train.txt', stringsAsFactors=FALSE)
ytraindata = read.table('train/y_train.txt', stringsAsFactors=FALSE)

sub_test = read.table('test/subject_test.txt',stringsAsFactors=FALSE)
sub_train = read.table('train/subject_train.txt', stringsAsFactors=FALSE)

alabels = read.table('activity_labels.txt')

flist = read.table('features.txt')

#no. 3 Uses descriptive activity names to name the activities in the data set
#join activity label with y data
aytestjoin = join(ytestdata, alabels, by='V1')
aytrainjoin = join(ytraindata,alabels, by='V1')

# no. 4 Appropriately labels the data set with descriptive variable names. 
colnames(aytestjoin)<- c("code", "Activity")
colnames(aytrainjoin)<- c("code", "Activity")

colnames(sub_test)<-c("Subject")
colnames(sub_train)<-c("Subject")

colnames(xtestdata)<- flist$V2
colnames(xtraindata)<- flist$V2



# no 1.Merges the training and the test sets to create one data set.
#merge data

testdata = cbind(sub_test, aytestjoin, xtestdata)
traindata = cbind(sub_train,aytrainjoin, xtraindata)

mergedata = rbind(traindata, testdata)

# no2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#extract only mean and std measurements
mdata = mergedata[, grep("*mean\\(\\)*|*std\\(\\)*",colnames(mergedata))]
mdata = cbind(mergedata$Subject, mergedata$Activity, mdata)
colnames(mdata)[1] <- "Subject"
colnames(mdata)[2] <- "Activity"

#no.6 From the data set in step 4, creates a second,
# independent tidy data set with the average of each variable for each activity and each subject.

###########################
sorted_mdata = mdata[order(mdata$Subject,mdata$A),]
part5_results <- sorted_mdata %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))


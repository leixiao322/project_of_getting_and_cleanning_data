#1.Merges the training and the test sets to create one data set.
features=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
testx=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
testy=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
testsubject=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
trainx=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
trainy=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
trainsubject=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
dataset=rbind(cbind(testx,testy,testsubject),cbind(trainx,trainy,trainsubject))
#2.Extracts only the measurements on the mean and standard deviation for 
#each measurement. 
extract=c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,
          266:271,345:350,424:429,503,504,516,517,529,530,542,543)
extractdata=dataset[,extract]

#3.Uses descriptive activity names to name the activities in the data set
activity=read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(dataset)){
  j=which(activity[,1]==dataset[i,562])
  dataset[i,564]=activity[j,2]
}
#4.Appropriately labels the data set with descriptive variable names. 
names(dataset)=c(as.character(features[,2]),"labels","subject","activity")
#5.Creates a second, independent tidy data set with the average of each variable 
#for each activity and each subject. 
library(reshape2)
melt=melt(dataset,id.vars=c("subject","activity"))
newdata=dcast(melt,subject+activity~variable,mean)
write.table(newdata,file="new_dataset.txt")
#use read.table("new_dataset.txt") to load the dataset

#load libraries
library(dplyr)

#unzip data set
unzip(zipfile = "C:/.../Documents/getdata_projectfiles_UCI HAR Dataset.zip")

#in your working directory there should now be the UCI HAR Dataset file

#list files in UCI HAR Dataset
list.files("C:/.../Documents/UCI HAR Dataset")
#should report out 
[1] "activity_labels.txt" "features.txt"        "features_info.txt"  
[4] "README.txt"          "test"                "train"  

#set file path for UCI HAR Dataset folder
pathfile = file.path("C:/.../Documents", "UCI HAR DATASet")
files = file.path(pathfile, recursive=TRUE)

#list files to view contents
files
#should report out
"activity_labels.txt"                         
 [2] "features.txt"                                
 [3] "features_info.txt"                           
 [4] "README.txt"                                  
 [5] "test/Inertial Signals/body_acc_x_test.txt"   
 [6] "test/Inertial Signals/body_acc_y_test.txt"   
 [7] "test/Inertial Signals/body_acc_z_test.txt"   
 [8] "test/Inertial Signals/body_gyro_x_test.txt"  
 [9] "test/Inertial Signals/body_gyro_y_test.txt"  
[10] "test/Inertial Signals/body_gyro_z_test.txt"  
[11] "test/Inertial Signals/total_acc_x_test.txt"  
[12] "test/Inertial Signals/total_acc_y_test.txt"  
[13] "test/Inertial Signals/total_acc_z_test.txt"  
[14] "test/subject_test.txt"                       
[15] "test/X_test.txt"                             
[16] "test/y_test.txt"                             
[17] "train/Inertial Signals/body_acc_x_train.txt" 
[18] "train/Inertial Signals/body_acc_y_train.txt" 
[19] "train/Inertial Signals/body_acc_z_train.txt" 
[20] "train/Inertial Signals/body_gyro_x_train.txt"
[21] "train/Inertial Signals/body_gyro_y_train.txt"
[22] "train/Inertial Signals/body_gyro_z_train.txt"
[23] "train/Inertial Signals/total_acc_x_train.txt"
[24] "train/Inertial Signals/total_acc_y_train.txt"
[25] "train/Inertial Signals/total_acc_z_train.txt"
[26] "train/subject_train.txt"                     
[27] "train/X_train.txt"                           
[28] "train/y_train.txt"                           

# read train data
 xtrain = read.table(file.path(pathfile, "train", "X_train.txt"), header=FALSE)
 ytrain = read.table(file.path(pathfile, "train", "y_train.txt"), header=FALSE)
 subject_train = read.table(file.path(pathfile, "train", "subject_train.txt"), header = FALSE)
 
 #read test data
 xtest = read.table(file.path(pathfile, "test", "X_test.txt"), header=FALSE)
 ytest = read.table(file.path(pathfile, "test", "y_test.txt"), header=FALSE)
 subject_test = read.table(file.path(pathfile, "test", "subject_test.txt"), header=FALSE)
 
 #read feature descriptions
 features = read.table(file.path(pathfile, "features.txt"), header=FALSE)
 
 #read activity lables
 activitylables = read.table(file.path(pathfile, "activity_labels.txt"), header=FALSE)
 
 #set column names
colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"
colnames(xtest) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_test) = "subjectId"
colnames(activitylables) <- c('activityId', 'activityType')

#merge data together
mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)
setAllInOne = rbind(mrg_train, mrg_test)

#read all the values
colNames = colnames(setAllInOne)

# get subset of the mean and standard deviaton data
mean_and_std = (grepl("activityId", colNames) | grepl("subjectId", colNames) | grepl("mean..", colNames) | grepl("std..", colNames))

#create data subset with the mean and standard deviation data.
setForMeansAndStd <- setAllInOne[ , mean_and_std == TRUE]

#use descriptive activities names to the names in the dataset
setwithActivityNames = merge(setForMeansAndStd, activitylables, by='activityId', all.x=TRUE)

#create Tidy new dataset
secTidySet <- aggregate(. ~subjectId + activityId, setwithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

#save tidy data set to working directory
write.table(secTidySet, "secTidySet.txt", row.name=FALSE)

#in working directory, file secTidySet.txt is available.





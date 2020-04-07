# tidydata
Getting-and-Cleaning-Data_Week-4-Project
 This repository contains the submission for the assignmet for week 4 of Getting and Cleaning Data Course by Coursera.
  - First download and unzip the data file into your R working directory
  - Second download the R soucre code into your working directory
  - Lastly, execute R source code to generate a tidy data file
  
  Data descriptionn
   The variables in the X data set are from sensor signals obtained from 30 volunteers (ages 19 - 48) using the waist mounted Samsung Galaxy S II phone.  
   The variables in the Y data set indicates the different activity types (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed.
   
   Code explaination
    The code combined the training and test dataset, extracted partical variables to create a dataset that was the average of each variable for each activity.
    
    New Dataset
      The new dataset contained variables calculated based on the mean and standard devitation.  Each row of the dataset is an average of each activity type for all subjects.
      
      The code was writen based on instructions of this assignment
      
      The R scrip called run_analysis.R does the following. 1. Merges the trainng and test sets to create one data set. 2. Extracts only the measurements on the mean and standard deviation for each measurement. 3. Uses descritive activity names to name the activities in the data set. 4. Labels the data set with descriptive variable names. 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
      
   

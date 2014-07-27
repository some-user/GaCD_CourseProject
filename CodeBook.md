Code Book
=========

Data
----

The course project is based on the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

For more detailed information about the raw data see `README.md`.


Transformations
---------------

In this project some transformations were made in order to clean up the data (to perform these transformations one just needs to run the `run_analysis.R` script on the original data set):

* The training and the test data sets were merged.

* Descriptive activity names (i.e., activity labels from the `activity_labels.txt` file)&nbsp;— except for numbers without corresponding labels as in the original data set&nbsp;— were used to name the activities in the merged data set.

* Feature variables of the merged data set were renamed with the names from the `features.txt` file. Then some further changes were made:
    
    * `BodyBody` in some variable names was replaced by `Body` (there are no such variables as `fBodyBodyAccJerkMag-mean()` and `fBodyBodyAccJerkMag-std()` in the original documentation — according to `features_info.txt`, these variables should be named `fBodyAccJerkMag-mean()` and `fBodyAccJerkMag-std()` correspondingly).
    
    * `t` and `f` at the beginning of variable names were replaced by `Time` and `Freq` correspondingly as far as their meaning does not seem to be evident to someone looking at the data set.
    
    * Some undesirable symbols such as parentheses (`(`, `)`) that may cause problems while performing the analysis in R were removed from variable names, while some other undesirable symbols such as dashes (`-`) were replaced by underscores (`_`), which are commonly used in variable names and cause no problems while performing the analysis.
    
* The measurements on the mean and standard deviation for each signal (along with subject and activity variables) were extracted.
    
* The mean of each extracted feature variable for each activity and each subject was calculated.

Variables
---------

The tidy data set includes the following variables:

* `subject` **(integer)** Identifier of the subject who performed the activity. Its range is from 1 to 30. 

* `activity` **(factor)** Type of the activity that was performed:
    1. `WALKING`
    2. `WALKING_UPSTAIRS`
    3. `WALKING_DOWNSTAIRS`
    4. `SITTING`
    5. `STANDING`
    6. `LAYING`

* 66 variables **(numeric)** that represent the average of each feature that was extracted for each activity and each subject. Namely, the average of:
    1. Measurements on the mean of each signal (for the description and full list of signals see below) for each activity and each subject (33 variables). 
    2. Measurements on the standard deviation of each signal for each activity and each subject (33 variables).

    Each of these variables is normalized and bounded within [-1,1].

    #### Description of signals 
    [Source: `features_info.txt`]


    The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals `Time_Acc_XYZ` and `Time_Gyro_XYZ`. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`Time_BodyAcc_XYZ` and `Time_GravityAcc_XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`Time_BodyAccJerk_XYZ` and `Time_BodyGyroJerk_XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`Time_BodyAccMag`, `Time_GravityAccMag`, `Time_BodyAccJerkMag`, `Time_BodyGyroMag`, `Time_BodyGyroJerkMag`). 

    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `Freq_BodyAcc_XYZ`, `Freq_BodyAccJerk_XYZ`, `Freq_BodyGyro_XYZ`, `Freq_BodyAccJerkMag`, `Freq_BodyGyroMag`, `Freq_BodyGyroJerkMag`.

    #### List of signals

    Here is the list of all signals ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):

    * `Time_BodyAcc_XYZ` (i.e., `tBodyAcc-X`, `tBodyAcc-Y`, `tBodyAcc-Z`)
    * `Time_GravityAcc_XYZ`
    * `Time_BodyAccJerk_XYZ`
    * `Time_BodyGyro_XYZ`
    * `Time_BodyGyroJerk_XYZ`
    * `Time_BodyAccMag`
    * `Time_GravityAccMag`
    * `Time_BodyAccJerkMag`
    * `Time_BodyGyroMag`
    * `Time_BodyGyroJerkMag`
    * `Freq_BodyAcc_XYZ`
    * `Freq_BodyAccJerk_XYZ`
    * `Freq_BodyGyro_XYZ`
    * `Freq_BodyAccMag`
    * `Freq_BodyAccJerkMag`
    * `Freq_BodyGyroMag`
    * `Freq_BodyGyroJerkMag`

    #### Variable names

    Variable names in the tidy data set are as follows: `Time_BodyAcc_Mean_X`, `Time_BodyAcc_Std_X`, ..., `Time_BodyAccMag_Mean`, `Time_BodyAccMag_Std`, ..., `Freq_BodyGyroMag_Mean`, `Freq_BodyGyroMag_Std`, ... (i.e, signal name + type of measurement: either mean, `Mean`, or standard deviation, `Std`).

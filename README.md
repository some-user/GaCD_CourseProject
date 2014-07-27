Getting and Cleaning Data Course Project
========================================

The R script created within the course project produces a tidy data set from the Smartphones Data Set available at the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

List of files
-------------
The GaCD_CourseProject repo contains the following files:

* `run_analysis.R` — the R script that can be used to obtain a tidy data set from the Smartphone Data
* `README.md` describing how the script works and providing some other useful information
* `CodeBook.md` describing the variables, the data, and all the transformations that were performed to clean up the data

Description of the raw data
---------------------------

The raw data set was built from the recordings of 30 volunteers performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% — the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. [[Source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)]

Description of the R script
---------------------------

The R script written for this project can be used to create a tidy data set from the Smartphone Data. 

The `run_analysis.R` script:

* Merges the training and the test sets into a single data set.

* Renames the variables of the merged data set with descriptive names (data from the `features.txt` are used to name feature variables in the merged data set, however some changes — described in detail in the `CodeBook.md` — are made in order to obtain somewhat more descriptive variable names, correct minor errors in variable names that were present in the original data set and get rid of some undesirable symbols that may cause problems while performing analysis in R).

* Uses activity labels from `activity_labels.txt` to name the activities in the data set.

* Extracts the measurements on the mean and standard deviation for each signal (along with subject and activity variables).

* Creates a tidy data set with the mean of each feature variable for each activity and each subject, which is written into a TXT file (although you may choose writing data into a CSV file — just follow the instructions in the script).

Instructions
------------

Note that in order to run this script it is not obligatory to have the Samsung data downloaded and unzipped into your working directory. If there are no Samsung data downloaded and unzipped, the script will download them from the Internet and unzip into your working directory (so you'll need an Internet connection). Otherwise it will skip these two steps.

In R, use the following code to download the `run_analysis.R` script into your working directory:

```
url <- "https://raw.githubusercontent.com/some-user/GaCD_CourseProject/master/run_analysis.R"
download.file(url, destfile = "run_analysis.R", method = "curl")
```

Then run the script via

```
source("run_analysis.R")
```

Now wait until the script stops running. The output will be the tidy data set I submitted for the first part of the assignment.

To read this data set into R you may use

```
data <- read.table("tidy_final.txt", header = TRUE)
```

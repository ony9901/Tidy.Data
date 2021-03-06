Codebook for activityAverage.txt dataset
========================================================

#####Data Origen 
The **Human Activity Recognition Using Smartphones**[^1] is an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (see _activities names_ below) wearing a smartphone  on the waist. Using its embedded accelerometer and gyroscope was  captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. For further information about this experiment, visit this [web page ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

(1):Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#####Data Source
The original dataset is available in the [Machine Learning Repository](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/) web page.
The data are available in a zip file (61,091 kb) containing two folders (test and training) and files with documentation about features and activities.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#####Data Transformation
1. The sets of test (x-test.txt, y-test.txt)  and training (x-test.txt, y-test.txt) were read using the _read.table_ command from the  _data.table_ R package, both sets were merge in a large data.frame (_rbind command_). Variables' names for this large data set (10,299*561) were obtained from the file features.txt. The inertial signal information was not used in this project.
2. A first data set (10299*68) was created by extracting only the measurements on the mean and standard deviation for each measurement; this task was performed with the grep command and using regular expression to identify the variables containing the text "-mean ()" or "-std ()".
3. The activity names availables at "activity\_labels.txt" were used to name the activities in the data set; the command _join_  from the _plyr_ R package was used for merge the activity names.
4. The original names of the variables do not meet the style guide, the command _gsub_ was used for improve the variables names: changing hyphens by dots, remove parentheses and convert to lowercases.
5. A second data set (**independent tidy data set**) was created by calculate the average of each variable for each activity and each subject. The averages were obteined by using the command _ddply_ from  the _plyr_ R package combined with ghe _colMeans_ command.
6. Finally the independent tidy data set (180*68) was exported into fixed width format (_activityAverage.txt_) by using the command _write.table_, setting the parameter row.names to FALSE.

#####Variable Description

The following are the variables on the tidy data set submitted as final result of the activity

**Contains data** "_activityAverage.txt_"

**Observations:** 180

**Variables:** 68

**Size:** 219 kb

**the conventions used to name the variables are:**

- _body_: body motion component
- _gravity_: gravitational component
- _acc_: accelerometer sensor signal
- _gyro_: gyroscope sensor signal
- _mean_: mean
- _std_: standard deviation

######List of variables

*subject*    : Identification number

*activity*    : Name of activity	  

|Activity |Frequency |Percent|
---|---|---|
LAYING                   |30    |16.7
SITTING                   |30    |16.7
STANDING                  |30    |16.7
WALKING                   |30    |16.7
WALKING_DOWNSTAIRS        |30    |16.7
WALKING_UPSTAIRS          |30    |16.7

*t.body.acc.mean.x*

*t.body.acc.mean.y*

*t.body.acc.mean.z*

*t.body.acc.std.x*

*t.body.acc.std.y* 

*t.body.acc.std.z*

*t.gravity.acc.mean.x*

*t.gravity.acc.mean.y*

*t.gravity.acc.mean.z*

*t.gravity.acc.std.x*

*t.gravity.acc.std.y*

*t.gravity.acc.std.z*

*t.body.acc.jerk.mean.x*

*t.body.acc.jerk.mean.y*

*t.body.acc.jerk.mean.z*

*t.body.acc.jerk.std.x*

*t.body.acc.jerk.std.y*

*t.body.acc.jerk.std.z*

*t.body.gyro.mean.x*

*t.body.gyro.mean.y*

*t.body.gyro.mean.z*

*t.body.gyro.std.x*

*t.body.gyro.std.y*

*t.body.gyro.std.z*

*t.body.gyro.jerk.mean.x*

*t.body.gyro.jerk.mean.y*

*t.body.gyro.jerk.mean.z*

*t.body.gyro.jerk.std.x*

*t.body.gyro.jerk.std.y*

*t.body.gyro.jerk.std.z*

*t.body.acc.mag.mean*

*t.body.acc.mag.std*

*t.gravity.acc.mag.mean*

*t.gravity.acc.mag.std*

*t.body.acc.jerk.mag.mean*

*t.body.acc.jerk.mag.std*

*t.body.gyro.mag.mean*

*t.body.gyro.mag.std*

*t.body.gyro.jerk.mag.mean*

*t.body.gyro.jerk.mag.std*

*f.body.acc.mean.x*

*f.body.acc.mean.y*

*f.body.acc.mean.z*

*f.body.acc.std.x*

*f.body.acc.std.y*

*f.body.acc.std.z*

*f.body.acc.jerk.mean.x*

*f.body.acc.jerk.mean.y*

*f.body.acc.jerk.mean.z*

*f.body.acc.jerk.std.x*

*f.body.acc.jerk.std.y*

*f.body.acc.jerk.std.z*

*f.body.gyro.mean.x*

*f.body.gyro.mean.y*

*f.body.gyro.mean.z*

*f.body.gyro.std.x*

*f.body.gyro.std.y*

*f.body.gyro.std.z*

*f.body.acc.mag.mean*

*f.body.acc.mag.std*

*f.body.body.acc.jerk.mag.mean*

*f.body.body.acc.jerk.mag.std*

*f.body.body.gyro.mag.mean*

*f.body.body.gyro.mag.std*

*f.body.body.gyro.jerk.mag.mean*

*f.body.body.gyro.jerk.mag.std*

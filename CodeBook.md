Study design
------------

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial
linear acceleration and 3-axial angular velocity at a constant rate of
50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

Variables included
------------------

    1 subjects - 1:30, id that identifies the subject  

    2 activity - identifies the activity - laying, sitting, standing, walking,         walking_downstairs, walking_upstairs

For each of these measures, there is a separate X, Y & Z axis measure
and a mean & std. deviation for each.

    3-8 Time Body Acceleration - Body acceleration signals (captured at 50Hz, passed through filters)

    9-14 Time Gravity Acceleration - Gravity acceleration signals (captured at 50Hz, passed 

through filters)

    15-20 Time Body Acceleration Jerk - Body linear acceleration signals

    21-26 Time Body Gyro - Body Gyroscope signals

    27-32 Time Body Gyro Jerk - Body Angular velocity signals

    43-48 Frequency Body Acceleration - Body acceleration signals (Fast Fourier Transformed)

    49-54 Frequency Body Acceleration Jerk - Body linear acceleration signals (Fast Fourier Transformed)

    55-60 Frequency Body Gyro - Body Gyroscope signals (Fast Fourier Transformed)

These measures do not have an XYZ component

33-42 : Magnitude of the 3 axis signals (Euclidean norm) for each of

            Time Body Acceleration Magnitude

            Time Gravity Acceleration Magnitude
            
            Time Body Acceleration Jerk Magnitude
            
            Time Body Gyro Magnitude 
            
            Time Body Gyro Jerk Magnitude 

61:68 : Magnitude of the 3 axis signals (Euclidean norm) for each of

            Frequency Body Acceleration Magnitude
            
            Frequency Body Acceleration Jerk Magnitude
            
            Frequency Body Gyro Magnitude 
            
            Frequency Body Gyro Jerk Magnitude

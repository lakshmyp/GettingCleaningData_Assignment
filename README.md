The scripts in this repo are meant to read through and tidy up the UCI
HAR dataset that contains data collected from the accelerometers from
the Samsung Galaxy S smartphone.

Original Data source :
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

-   Unzip the UCI HAR Dataset.zip into your working directory. The
    folder will contain a Test folder and a Training folder.

-   "run\_analysis.R" : Run the tidying script once you are in UCI HAR
    Dataset folder. The script will merge the test and training datasets
    and add the appropriate labels. The script will extract just the
    means and std deviation variables from the raw dataset. The script
    will then create a separate tidy dataset - "tidydata.txt" that
    contains the averages of the means and standard deviations across
    all the activity variables in the raw data per subject.

-   "tidydata.txt" : This is the tidy dataset of 180 observations for 30
    subjects & 6 activities. Each subject & activity contains the mean &
    std deviations in 66 different measures.

-   CodeBook.md file contains the details of the variables in the tidy
    dataset.

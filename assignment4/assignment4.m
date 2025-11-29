% Noel Locher
% November 19, 2024
% Assignment 4 KINE 6203
% Main script that takes subject data and isokinetic strength 
% measurements over 3 days and returns a table with analyzed data. Table
% results include individual male isometric means, individual female isometric
% means, male group mean, female group mean, subjects that improved from 
% day 1 to day 2, subjects that improved from day 2 to day 3, and a 
% normalized mean for each day of isometric strength data. 
% Uses functions importfile.m, genderIsoCalc.m, and dayComparer.m
%
% Created and tested on MacBook Pro


% Import file function that imports data from 'isokData6203.csv' as column
% vectors
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile("isokData6203.csv");

% Gets male and female isokinetic strength means and gender group means.
[maleIsoIndMeans,femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, Day1, Day2, Day3);


% Outputs subject IDs that improved from day1 to day2 and that improved
% from day2 to day3.
day1toDay2 = dayComparer (SubjectID, Day1, Day2);
day2toDay3 = dayComparer(SubjectID, Day2, Day3); 

% Calculates the normalized means for the 3 days of isokinetic strength
% data.
normDay1mean = (mean(Day1))/(mean(Weight));
normDay2mean = mean(Day2)/mean(Weight);
normDay3mean = mean(Day3)/mean(Weight);

% Determines the longest column vector. (Only 4 variables used because 
% others wouldn't be the longest vector.)
maxLengthVec = max([length(maleIsoIndMeans), length(femaleIsoIndMeans), length(day1toDay2), length(day2toDay3)]);

% Adds NaN in rows after the last data point to columns shorter than the 
% longest column vector. Makes all the column vectors the same length for
% table creation.
% Works by getting desired variable at the top of the column then subtracts 
% the length of the variable from the longest vector length to get the 
% amount of rows it needs to input NaN for. 
maleIsoIndMeans = [maleIsoIndMeans; NaN(maxLengthVec - length(maleIsoIndMeans), 1)];
femaleIsoIndMeans = [femaleIsoIndMeans; NaN(maxLengthVec - length(femaleIsoIndMeans), 1)];
maleGroupIsoMean = [maleGroupIsoMean; NaN(maxLengthVec-length(maleGroupIsoMean), 1)];
femaleGroupIsoMean = [femaleGroupIsoMean; NaN(maxLengthVec-length(femaleGroupIsoMean),1)];
day1toDay2 = [day1toDay2; NaN(maxLengthVec - length(day1toDay2), 1)];
day2toDay3 = [day2toDay3; NaN(maxLengthVec - length(day2toDay3), 1)];
normDay1mean = [normDay1mean; NaN(maxLengthVec - length(normDay1mean), 1)];
normDay2mean = [normDay2mean; NaN(maxLengthVec - length(normDay2mean), 1)];
normDay3mean = [normDay3mean; NaN(maxLengthVec - length(normDay3mean), 1)];


% Creates a table with all analyzed variables. 
results = table (maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean, day1toDay2, day2toDay3, normDay1mean, normDay2mean, normDay3mean);

% Writes the results table to a csv file called iso_results.csv.
writetable(results, 'iso_results.csv')
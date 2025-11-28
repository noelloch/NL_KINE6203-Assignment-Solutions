function [maleIsoIndMeans,femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(SubjectID, Gender, Day1, Day2, Day3)
% genderIsoCalc Calculates mean isometric strength scores for males and
% females as well as mean strength for all males and all females.
% Requires 5 inputs and returns 4 outputs
% A for loop is used to go through each subject and calculate their mean 
% isometric strength over 3 days. 
%
% Ran on Macbook Pro

numSubjects = length(SubjectID); %determines amount of subjects
maleSub = 1; % sets initial male subject to 1
femaleSub = 1; % sets initial female subject to 1
maleIsoIndMeans = []; % sets up an array for the variable
femaleIsoIndMeans = []; % sets up an array for the variable

for i= 1:numSubjects % for loop to go through each subject
    if Gender(i) == "M" % if gender is male
        maleIsoIndMeans (maleSub) = mean([Day1(i), Day2(i), Day3(i)]); %calculates mean for each male
        maleSub = maleSub + 1; % to go to the next male subject
    elseif Gender(i) == "F" % if gender is female
        femaleIsoIndMeans(femaleSub) = mean([Day1(i), Day2(i), Day3(i)]); %calculates mean for each female
        femaleSub = femaleSub + 1; % to go to the next female subject
    end
end

maleGroupIsoMean = mean(maleIsoIndMeans, "all"); % takes mean of all individual male means
maleIsoIndMeans = maleIsoIndMeans'; % transposes male means into column vector
femaleGroupIsoMean = mean(femaleIsoIndMeans, "all"); % takes the mean of all individual female means
femaleIsoIndMeans = femaleIsoIndMeans'; % transposes female means into column vector
end
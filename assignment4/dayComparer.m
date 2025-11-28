function [isoIncrease] = dayComparer (SubjectID, firstDay, secondDay)
% dayComparer Returns the subject IDs that had an increase in 
% isokinetic strength data from the firstDay to the secondDay.
% 3 inputs of SubjectID, firstDay, and secondDay
% If the second day is greater than the first day, the subject ID
% is output.


improvedIso = secondDay > firstDay; % determines subjects that improved

isoIncrease = SubjectID(improvedIso); % extracts subjectIDs that improved

end
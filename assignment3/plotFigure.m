function plotFigure(vector1, vector2) 
% plots a figure using 2 vectors
% if the input vectors are not the same length, an error message will appear
if length(vector1)~=length(vector2) 
    error('Vectors are not the same length.');
end
% this plots the vectors and labels the x-axis, y-axis, and title
plot(vector1, vector2);
    xlabel('Vector 1');
    ylabel('Vector 2');
    title('Plot of Vector 1 vs Vector 2');
end
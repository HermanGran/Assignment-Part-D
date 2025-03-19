%% 
clc
clear

%%

% Reads the FIS
classification = readfis("Exercise 1");

% Load the iris dataset
load fisheriris 

% Evaluate the FIS for all samples 
outputs = evalfis(classification, meas);

% Convert continuous outputs to class indices.
predictedIndices = round(outputs);  % Rounding to nearest whole value

% Map numeric indices to species names
speciesMap = {'setosa', 'versicolor', 'virginica'};
predictedLabels = cell(size(predictedIndices));
for i = 1:length(predictedIndices)
    if predictedIndices(i) >= 1 && predictedIndices(i) <= 3
        predictedLabels{i} = speciesMap{predictedIndices(i)};
    else
        predictedLabels{i} = 'unknown'; % In case the output doesn't fall into 1-3
    end
end

% Calculate the number of correct predictions
correctCount = sum(strcmp(predictedLabels, species));

% Calculate accuracy as the ratio of correct predictions to total samples
accuracy = correctCount / length(species);

% Display the accuracy
fprintf('Classification Accuracy: %.2f%%\n', accuracy * 100);

function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

possibleCVal = [0.01 0.03 0.1 0.3 1 3 10 30];
possibleSigVal = [0.01 0.03 0.1 0.3 1 3 10 30];
minValue = 1000000;

%cCol= {[0.5,0.5,0.6]; "green"; "blue"; "yellow"; "cyan"; "magenta"; "black"};
errorBySig = zeros(length(possibleSigVal),1);
%hold off;
%figure();


for cIdx = 1:length(possibleCVal)
	for sigIdx = 1:length(possibleSigVal)
		model= svmTrain(X, y, possibleCVal(cIdx), @(x1, x2) gaussianKernel(x1, x2, possibleSigVal(sigIdx)));
		predictions = svmPredict(model, Xval);
		error = mean(double(predictions ~= yval));
		errorBySig(sigIdx) = error;
		if ( minValue >=  error)
			%minValue
			%error
			minValue = error;
			C = possibleCVal(cIdx);
			sigma = possibleSigVal(sigIdx);
		endif
	end
	%errorBySig
	%plot(possibleSigVal, errorBySig, sprintf(';C=%f;',possibleCVal(cIdx)), 'Color', cCol{cIdx});
	%xlabel("sigma")
	%ylabel("error")
	%axis([0 5 0 0.5])
	%drawnow()
	%hold on;
	%C
	%sigma
end
C
sigma
%legend();
%figure()





% =========================================================================

end

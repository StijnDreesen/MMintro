% For more info, read from page 10. onwards.

% OLS can easily be viewed as an MM estimator, where rather than minimizing
% the quadratic distance, we simply set each moment to zero instead.
% Indeed, the sample moment should be equal to zero (and it is precisely of
% the form in 3.4). Effectively, coding this estimator boils down to
% stripping GMMobjective.m of the parts referring to quadratic distance.
% Indeed, we can much more simply use the fsolve function to solve
% MMobjective.m for Beta, setting m = 0 as in (3.4.). Notice the output of
% the function MMobjective.m is now simply m.

clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);

[Beta] = fsolve(@(Beta) MMobjective(Beta, y, X), [10,0,0]')

% Indeed, we arrive at the same solution as our previous estimators.

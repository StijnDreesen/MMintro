% In this exercise, we use our new probitML.m function to replicate the
% results of a probit analysis carried out in Stata. Specifically, a probit
% analysis has been run for a car being foreign or not, depending on its
% length and weight (and a constant). Run 'probit foreign length weight' in
% Stata and take note of its results.

% Note that a new file (we call it auto2.csv) needs to be exported from 
% Stata with these variables using: 'export delimited foreign length weight using auto2.csv, novarnames nolabel'. 
% That last option is important, because otherwise we would have the labels 
% of the 'foreign' variable instead of the actual values, which would result 
% in an error in line 16. 

% We can then read-in the data. 

clear;
DataIn = dlmread('auto2.csv');
whos('DataIn')
y = DataIn(:,1); % Take first column and call it y.
X = [DataIn(:, 2:3), ones(74,1)]; % Take second and third column and join them with a vector of ones. : denotes that every row is taken (a constant is included). 

% Some initial guesses for the Betas: 

Beta0 = [0, 0, 0]; % Set up some initial guess.

% Define a domain to search over: 

lb = [-1000, -1000, -1000];
ub = [1000, 1000, 1000];

% Define the options:

opt = optimset('TolFun',1E-20,'TolX',1E-20, 'MaxFunEvals',1000); % Set up the options. We keep the function running until the changes in the objective function AND the optimands are very small. The objective function is evaluated for a maximum 1000 number of times.

fmincon(@(Beta)ProbitML(Beta,y,X), Beta0, [], [], [], [], lb, ub, [], opt) 

% Check that the estimates correspond to Stata's output (the output should
% be 0.0016   -0.0015    3.4895).
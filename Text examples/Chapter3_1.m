% We use fmincon to maximize the likelihood function (3.1). We are looking
% for a vector Beta, Var which maximizes this function (remember that
% fmincon only accepts a vector to optimize. See the function NormalML how
% the likelihood function is calculated. 

% We again use the auto.csv example from Chapter 1:

clear;
DataIn = dlmread('auto.csv'); % We import the data sheet. We name this imported data DataIn.
whos('DataIn')
y = DataIn(:,1); % Take first column and call it y.
X = [DataIn(:, 2:3), ones(74,1)]; % Take second and third column and join them with a vector of ones. : denotes that every row is taken.

% There are no real upper or lower bounds, but we can restrict a domain
% over which the function searches. Here, we estimate the three betas from
% auto.csv and the variance. Remember that the variance is larger than 0. 

lb = [-1000, -1000, -1000, 0];
ub = [1000, 1000, 1000, 100];
theta0 = [0, 0, 0, 1]; % Set up some initial guess.

opt = optimset('TolFun',1E-20,'TolX',1E-20, 'MaxFunEvals',1000, 'algorithm', 'sqp', 'PlotFcns', 'optimplotfval'); % Set up the options. We keep the function running until the changes in the objective function AND the optimands are very small. The objective function is evaluated for a maximum 1000 number of times.

fmincon(@(theta)NormalML(theta,y,X), theta0, [], [], [], [], lb, ub, [], opt) % No non-linear constraints, no strict constraints and no regular constraints. The constraint of var>0 is contained within the lower and upper bounds.

% Note that we now declare one of the function inputs to be a choice
% variable; theta. We minimize the function NormalML GIVEN y and X with
% choice variable theta. Note we included the PlotFcns as the text
% suggested, which shows the function value (the log-likelihood) as a
% function of the iterations. 




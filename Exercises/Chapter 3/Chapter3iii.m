% In this exercise, we do a two-step GMM. The first step is performed by
% GMMObjective.m and supplies the first-stage estimates to be used in the
% second step's optimal weighting matrix, handled by the function GMM2step.

clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta,Q] = fminsearch(@(B) GMMObjective(B,y,X), [10,0,0]', optimset('TolX',1e-9))

% We are now supplied with new Betas. Use these new ones by minimizing the
% objective function GMM2STEP. 

[Beta2,Q] = fminsearch(@(Beta) GMM2STEP(Beta,y,X), [10,0,0]', optimset('TolX',1e-9))

% The same results are found, which is logical (remember that if Z=X, then 
% the moment equation is exactly equal to least squares (just like in one-step GMM). 



% Using GMM, we define population moments that are true in the model. GMM
% again requires optimizing the objective function. (3.4) is the moment
% vector, which is equal to zero. The estimated betas should drive the
% quadratic distance (mWm') as close to zero as possible. The weight matrix
% W needs to be positive semidefinite. 

% Let's put GMMobjective.m to use. 
clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta,Q] = fminsearch(@(B) GMMObjective(B,y,X), [10,0,0]', optimset('TolX',1e-9)) % The choice variable is Beta. No constraints are imposed, but initial values are given for the Betas.

% Note Q comes very close to zero. We have exactly as many moments as
% unknown, so Q should be zero (otherwise, the optimization needs some
% finetuning.




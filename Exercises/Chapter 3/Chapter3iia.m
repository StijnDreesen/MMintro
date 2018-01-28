% As is well-known, the variance of an ML estimator is the inverse of the
% Information matrix, which is the negative of the expected value of the
% Hessian matrix. Luckily, the function fmincon provides the Hessian matrix
% for us by specifically requesting it (see line 18). The standard errors
% are therefore simply the square roots of the diagonal terms of the
% inverted Hessian matrix. If a refresher for this is needed, read through
% the following document: 

% https://jdemeritt.weebly.com/uploads/2/2/7/7/22771764/mle_introduction1.pdf

% Simply retake the code from Chapter 3.1. and add code to request the
% Hessian and compute the square root of the diagonals of its inverse. 

clear;
DataIn = dlmread('auto.csv'); 
whos('DataIn')
y = DataIn(:,1); 
X = [DataIn(:, 2:3), ones(74,1)]; 


lb = [-1000, -1000, -1000, 0];
ub = [1000, 1000, 1000, 100];
theta0 = [0, 0, 0, 1]; 

opt = optimset('TolFun',1E-20,'TolX',1E-20, 'MaxFunEvals',1000, 'algorithm', 'sqp', 'PlotFcns', 'optimplotfval');  
[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(@(theta)NormalML(theta,y,X), theta0, [], [], [], [], lb, ub, [], opt) 

err = sqrt(diag(inv(hessian)))

% The standard errors are roughly equal but a bit smaller than the results
% reported by OLS on page 6. Econometrically, the variance of the estimator
% is in fact the lowest variance an unbiased estimator of theta can achieve
% (partakers in econometrics courses will remember this lower bound being
% called the 'Cramer-Rao lower bound'. Maximum likelihood estimation is
% therefore efficient.



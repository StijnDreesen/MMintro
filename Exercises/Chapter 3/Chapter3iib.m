% We retake the code from Chapter 3.2:

clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta,Q] = fminsearch(@(B) GMMObjective(B,y,X), [10,0,0]', optimset('TolX',1e-9))

% If Beta is calculated, calculating the standard errors is
% straightforward: 

[N, K] = size(X)
yhat = X*Beta;
u = y - yhat;
VarHat = inv(X'*X)*inv(N-K)*(u'*u);
BetaSE = diag(sqrt(VarHat)) % Note that we only need the diagonal elements.

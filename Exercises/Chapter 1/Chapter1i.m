% The goal is to replicate the standard errors as generated in
% Chapter1_2.m by the OLS.m function.

clear;

DataIn = dlmread('auto.csv'); % Read in the data again.
y = DataIn(:,1); % Take first column and call it y.
X = [DataIn(:, 2:3), ones(74,1)]; % Take second and third column and join them with a vector of ones. : denotes that every row is taken.
size(X) % Check that the size of our matrix X is as needed. 

BetaHat = inv(X'*X)*X'*y % Calculate BetaHat according to the well-known matrix notation. These are the same as OLS_beta.

% We can then again make the relatively easy transition from the matrix
% notation of standard errors to MATLAB code.
% We need a value N (number of observations) and K (number of independent
% variables):

[N, K] = size(X);
yhat = X*BetaHat;
u = y - yhat;
VarHat = inv(X'*X)*inv(N-K)*(u'*u);
BetaSE = diag(sqrt(VarHat)) % Note that we only need the diagonal elements.

% Compare with the results from OLS.m: 

[OLS_Beta, OLS_se] = OLS(y, X)

% They are the same! In fact, the code above is roughly the same as the one
% in OLS.m.


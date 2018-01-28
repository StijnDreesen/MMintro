% We retake the code from Chapter 3.2. The method follows page 19 on
% https://www.stata.com/manuals13/rgmm.pdf.

clear; 
DataIn = dlmread('auto.csv');
X = [ones(74,1) DataIn(:,2:3)];
y = DataIn(:,1);
[Beta,Q] = fminsearch(@(B) GMMObjective(B,y,X), [10,0,0]', optimset('TolX',1e-9))

% Our weight matrix is not the optimal one. The covariance matrix is then:

[N, K] = size(X)

V = inv(X'*X)

% Calculate covariance of residuals:

yhat = X*Beta;
u = y - yhat;

C = cov(u)

COV = C*V

SE = sqrt(COV)

% The standard errors are a bit different than the ones reported on p.6
% (this is because the betas are also slightly off).

% Note that GMM is efficient in the class of asymptotically normal estimators.
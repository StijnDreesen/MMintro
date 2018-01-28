% Assuming auto.dta is still in the memory as done in Chapter1_1.m:

OLS(y, X) % Results are the same.

% We can save these results in a matrix:

OLS_Beta = OLS(y, X)

% But where are the standard errors? 

[OLS_Beta, OLS_se] = OLS(y, X)
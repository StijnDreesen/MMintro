% In this exercise, we check our-self written function SIGN.m, which
% calculates the confidence interval, p-value and t-statistic of the
% coefficients calculated in OLS.m. To demonstrate its functionality,
% we can compare our results with the results in the table of page 6.

clear; 

DataIn = dlmread('auto.csv'); 
whos('DataIn')
y = DataIn(:,1); 
X = [DataIn(:, 2:3), ones(74,1)]; 

[Beta, se] = OLS(y, X) 
% Note that we call the output of OLS.m 'Beta' and 'se', same as the input
% arguments of SIGN.m.

% Since the function OLS.m only outputs Beta and se, we also need to
% calculate N and K and use them as input:

[N, K] = size(X)

% We now have everything necessary to test our function:

SIGN(Beta, se, N, K) % Note it only gives the very first output which is supposed to be returned: the t-statistic (see also page 12).

% We can, however, easily request all output:

[BetaT, CI, BetaP] = SIGN(Beta, se, N, K)

% Compare to the table on page 6: the results are exactly the same.
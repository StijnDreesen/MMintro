% In this exercise, we write a function to be used AFTER OLS.m which
% calculates a 95 confidence interval for the betas as well as t and
% p-values. Remember that the function OLS.m returns Beta and se. The
% function therefore uses these values as input and returns confidence
% intervals, p-values and t-values. We call this function simply 'SIGN'
% after significance.

function [BetaT, CI, BetaP] = SIGN(Beta, se, N, K)

% Remembering the formula for the t-statistic of beta (simply Beta divided
% by its standard error (se), which have been calculated in OLS.m), testing
% for beta = 0).

BetaT = Beta./se;

% And the confidence interval:
invT= -tinv(0.025,N); % Calculate the 97.5% critical value.
CI = [Beta-invT.*se, Beta+invT.*se]; % Classic formula for the 95 CI.

% Finally, the p-value:

BetaP = 2*(1-tcdf(abs(BetaT),N))

return








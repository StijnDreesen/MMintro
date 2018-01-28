clear; 

% In this exercise, both the price of good 1 and income vary. However, they 
% are not independent: using the function mvnrnd, we can specify covariance 
% between these two variables: 

mu     = [50,1];                         % Income has mean 50, price (of good 1) has mean 1. 
sigma  = [10,-0.9;-0.9,0.1];             % Correlation is set negative (-0.9), so a negative relationship is established between income and prices.
rng default                              % For reproducibility of the results.
r = mvnrnd(mu,sigma,100)                 % The columns of r are negatively correlated.

plot(r(:,1),r(:,2),'+');                 % Plot shows the negative relationship.
reps   = 100;

price  = [r(:,2), ones(reps, 1)];        % First column has mean 1 and variance 0.1, second price does not vary.
c      = NaN(reps, 2);                   % Allocate a matrix c to gather the consumption bundles.
opts   = optimset('algorithm', 'sqp', 'display', 'off');
x0     = [1, 1]                          % Starting value.
lb     = [0, 0]                          % Lower bound.

for i = 1:reps 
    TempI   = r(i,1);                    % Take the first column of r, the income with mean 50 and variance.
    TempP   = price(i,:)                 % Simply take the price matrix, both columns (first varies, second does not).
    ub      = TempI./TempP;              % Upper bound on the amount of goods that can be bought with income I.
    c(i, :) = fmincon(@CobbDouglas, x0, TempP, TempI, [], [], lb, ub, [], opts)
end

% Note: results are in scientific notation. 

% Note, SimulateBinaryLogit is missing the Utility output in its function.
% i.e. it has been changed to [y,utility]=SimulateBinaryLogit(x,Beta) for
% this exercise. The augmented beta has also been removed. The expected
% value of y is then simply 0.5.

clear;
                         
N      = 10000;                 
Beta   = [0.5, 0.5]';            % Our true Betas.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).


% Taking a look at SimulateBinaryLogit.m, we get an output (y) and the
% utility as dictated by the equations on page 43. Notice line 17:
% epsilon = -log(-log(rand(N, J)));
% It draws from the Type 1 extreme value distribution (compare with
% Equation (4.5). We can test this estimator on our simulated data:

[y, utility] = SimulateBinaryLogit(x, Beta); % Notice we simply receive the y-values here.

mu = mean(y)
sigma = var(y)

% For smaller N's, the mean is not always close to the expected value of y.
% For larger N's, the mean gets closer to 0.61, the expected value. The 
% variance stays about the same for larger sample sizes. This is in
% accordance with the law of large numbers and CLT. 



% We can simply adapt the author's code (SimulateMNlogit2). It has been 
% adjusted slightly such that another input is necessary: J choices.

clear;                           
rng(50)                          % We set the seed.
N      = 1000;                   % 1000 observations.
Beta   = [0.5, 0.5, 0.5]';       % Our true Betas. Note we now also add a third 0.5 (say, alpha_13 in (4.17)). Adding another fourth choice requires adding another true value for beta.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).

[y, utility] = SimulateMNlogit2(x, Beta, 3)

% The function works, as it now returns a value of 1, 2 or 3 for y,
% referring to the three choices. If one wants to extend for more choices,
% simply increase J and add a beta.

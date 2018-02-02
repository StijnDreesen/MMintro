function [y, utility] = SimulateMNlogit2(x, betavec, J) % The function extends to J choices. It returns y, one of three choices.

N           = size(x, 1);
K           = size(x, 2);


% First, simulate values for epsilon...

epsilon     = -log(-log(rand(N, J)));

% Second, simulate the utility for more than two options....

beta_augmented  = [betavec, zeros(J, 1)];
utility         = x * beta_augmented' + epsilon;

% Third, simulate the choice for each individual...

[junk, y]       = max(utility, [], 2);

return
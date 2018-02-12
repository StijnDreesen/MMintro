% Note, remember to use the fixed version of BinaryLogitLL.

clear;                           

rng(1)
N      = 1000;                   % 1000 observations.
Beta   = [0.5, 0.5]';            % Our true Betas.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).

y = SimulateBinaryLogit(x, Beta) % Notice we simply receive the y-values here.

options = optimset('Algorithm', 'sqp', 'Display', 'iter'); % We set up some options: iter displays output at each iteration, and the iterative method is a sequential quadratic programming algorithm (see https://en.wikipedia.org/wiki/Sequential_quadratic_programming).
Beta_init = [0; 0];    % Initial Betas.
lb = [-10; -10];       % Here we simply restrict the domain over which the function searched.
ub = [10; 10];         % Because of these upper and lower bounds, we have to use fmincon.


[EstBetaML, LL, exitflag] = fmincon(@(beta) BinaryLogitLL(beta, y, x), Beta_init, [], [], [], [], lb, ub, [], options)

% A challenge actually lies in retrieving LL_i from fmincon. There is no
% command in its syntax for retrieving it. However, remember that we can
% simply use the objective function itself with the estimated betas (under
% these betas, the sum of likelihoods is minimal!). 

[LL, ll_i] = BinaryLogitLL(EstBetaML, y, x)

% There should now be a 1000x1 matrix with all individual likelihoods
% called ll_i. This is ll_i under the analytical expression (4.9). Now call
% ll_i from the simulated function:

R = 1000;       % Set the number of replications.
opts2 = optimset('Algorithm', 'sqp', 'DiffMinChange', 1e-2); % Set the algorithm to SQP (see above) and the smallest change the function can make (the SLL is flat in the local domain).

[EstBetaMSL, LL, exitflag] = fmincon(@(beta) BinaryLogitSimulatedLL(beta, y, x, R), Beta_init, [], [], [],[], lb, ub, [], opts2)

% Extract Sll_i:

[LL, Sll_i] = BinaryLogitSimulatedLL(EstBetaMSL, y, x, R)

% Produce scatterplot. 

scatter(ll_i, Sll_i)

% Note that the relationship is near linear with a bit of dispersion. 

% Try increasing R to say, 2000. Notice how this dispersion becomes
% smaller; the analytical likelihood and the simulated likelihood will be
% more equal. 


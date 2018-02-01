% We generate our own fake dataset to test of binary logit estimator.
% Notice we seed the random number generator, meaning that a predictable
% sequence of random numbers is generated each time. 

clear;                           
rng(1)                           % We set the seed.
N      = 100000;                 % 1000 observations.
Beta   = [0.5, 0.5]';            % Our true Betas.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).


% Taking a look at SimulateBinaryLogit.m, we get an output (y) and the
% utility as dictated by the equations on page 43. Notice line 17:
% epsilon = -log(-log(rand(N, J)));
% It draws from the Type 1 extreme value distribution (compare with
% Equation (4.5). We can test this estimator on our simulated data:

y = SimulateBinaryLogit(x, Beta) % Notice we simply receive the y-values here.

% We can now proceed to estimation. The function BinaryLogitLL.m evaluates
% Equation (4.9). Notice that in its code, we define the logistic cdf as in
% Equation (4.6). We can now try to find the ML paramaters of such a binary
% logit model. Warning: the author's code for BinaryLogitLL is incomplete,
% use the updated one from Github.

options = optimset('Algorithm', 'sqp', 'Display', 'iter'); % We set up some options: iter displays output at each iteration, and the iterative method is a sequential quadratic programming algorithm (see https://en.wikipedia.org/wiki/Sequential_quadratic_programming).
Beta_init = [0; 0];    % Initial Betas.
lb = [-10; -10];       % Here we simply restrict the domain over which the function searched.
ub = [10; 10];         % Because of these upper and lower bounds, we have to use fmincon.


[EstBetaML, LL, exitflag] = fmincon(@(parameters) BinaryLogitLL(parameters, y, x), Beta_init, [], [], [], [], lb, ub, [], options)

% Notice we look for the optimal parameters (Beta in BinaryLogitLL). Seeing
% as the numbers are randomly generated, you will get different results
% than the ones on page 45. Removing the seed on line 6 will give different
% results each time. 

% Next, suppose an analytical expression is not possible for the
% log-likelihood as in equation (4.9). The solution is estimating by
% simulation. The choice in y depends on observable behaviour (x) and the
% parameters associated with it (Beta). We can try and estimate B such that
% the simulated data x will look like real data. We assume here to have a
% fully parametric model (we know the distribution of our unobservable, in
% fact, we know it has a logistic distribution as given in (4.6). With
% this assumption in mind, we can estimate by Maximum Simulated
% likelihood. Instead of then using the analytical expression (4.9) to
% calculate probabilities, we instead use sample probabilities generated
% from the simulated data. We define a new scalar, R, which tells us the
% number of replications of such a simulation algorithm. Note for a
% respondent i we simulate conditional on the values of x and receive a
% binary outcome y (up until replication R). The simulated expression is
% then (4.10). The BinaryLogitSimulatedLL.m function achieves this (note,
% the code is a bit messier than the one in the book, but it works):

R = 1000;       % Set the number of replications.
opts2 = optimset('Algorithm', 'sqp', 'DiffMinChange', 1e-2); % Set the algorithm to SQP (see above) and the smallest change the function can make (the SLL is flat in the local domain).

[EstBetaMSL, LL, exitflag] = fmincon(@(parameters) BinaryLogitSimulatedLL(parameters, y, x, R), Beta_init, [], [], [],[], lb, ub, [], opts2)







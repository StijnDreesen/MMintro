% Exercise iii %
%--------------%

% We can simply adapt use the author's code, SimulateMNlogit. An oft-made
% mistake here is having 6 elements in Beta, while in fact there should be
% only 4 (remember we defined utility in relative terms. For some reason, 
% readers also sometimes use 3 Betas. This will 
% give an error, specifically when using the reshape-function in the code. 
% Notice that the calculation for J in that code (line 5)
% gives J = 3, the number of choices we are considering.

clear;                           
rng(50)                          % We set the seed.
N      = 2000;                   % 2000 observations.
Beta   = [0.5, 0.5, 0.5, 0.5]';  % Our true Betas. Note we now also add a third 0.5 (say, alpha_13 in (4.17)). Adding another fourth choice requires adding another true value for beta.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).

% Calculating the y's and respective utilities is straightforward.

[y, utility] = SimulateMNLogit(x, Beta)

% To be sure, check that y is indeed 1, 2 or 3.

%%% Exercise iv %%%
%-----------------%
% Now we can estimates the coefficients from ML. We use the author's code,
% MNlogitLL.m. Doing this is 
% straightforward, it simply requires using the function MNLogitLL.m.
% Remember to rewrite the initial Betas, the lower and upper bounds.

options = optimset('Algorithm', 'sqp', 'Display', 'iter'); % We set up some options: iter displays output at each iteration, and the iterative method is a sequential quadratic programming algorithm (see https://en.wikipedia.org/wiki/Sequential_quadratic_programming).
Beta_init = [0; 0; 0; 0];    % Initial Betas.
lb = [-10; -10; -10; -10];       % Here we simply restrict the domain over which the function searched.
ub = [10; 10; 10; 10];         % Because of these upper and lower bounds, we have to use fmincon.

[EstBetaML, LL, exitflag] = fmincon(@(parameters) MNLogitLL(parameters, y, x), Beta_init, [], [], [], [], lb, ub, [], options)

% If everything went well, you should get something close to 0.50 for every
% Beta. 

% Exercise v %
%------------%

% Finally, use MNLogitSimulatedLL.m to recover the parameters of a
% simulated likelihood function. Again,adapting the author's code is
% straightforward. NOTE: WE ARE DOING 1000 REPLICATIONS ON 2000
% OBSERVATIONS FOR 4 PARAMETERS: THIS FUNCTION WILL TAKE QUITE A LONG TIME
% TO GENERATE OUTPUT. 

R = 1000;       % Set the number of replications.
opts2 = optimset('Algorithm', 'sqp', 'DiffMinChange', 1e-2); % Set the algorithm to SQP (see above) and the smallest change the function can make (the SLL is flat in the local domain).

[EstBetaMSL, LL, exitflag] = fmincon(@(beta) MNLogitSimulatedLL(beta, y, x, R), Beta_init, [], [], [],[], lb, ub, [], opts2)





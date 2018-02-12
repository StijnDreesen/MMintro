% Retake the code from 4.1 
clear;                           
rng(50)                          % We set the seed.
N      = 1000;                   % 1000 observations.
Beta   = [0.5, 0.5]';            % Our true Betas.
income = randn(N, 1)             % Generate normally distributed random numbers for income.
x      = [ones(N, 1), income]    % Conjoin them with a vector of constants (ones).
[y, utility] = SimulateBinaryLogit(x, Beta) % Notice we simply receive the y-values here.

R = 2000;       % Set the number of replications.
Beta_init = [0; 0];    % Initial Betas.
lb = [-10; -10];       % Here we simply restrict the domain over which the function searched.
ub = [10; 10];         % Because of these upper and lower bounds, we have to use fmincon.
opts2 = optimset('Algorithm', 'sqp', 'DiffMinChange', 1e-2); % Set the algorithm to SQP (see above) and the smallest change the function can make (the SLL is flat in the local domain).

[EstBetaMSL, LL, exitflag] = fmincon(@(parameters) BinaryLogitSimulatedLL(parameters, y, x, R), Beta_init, [], [], [],[], lb, ub, [], opts2)

% Now try adjusting the values for N and R. Note, it may take a while
% before MATLAB returns EstBetaMSL. The results for this particular seed
% were:

% N = 1000 and R = 1000
%     0.4709 0.4625
% N = 2000 and R = 1000
%     0.4994     0.4555
% N = 1000 and R = 2000
%     0.5346     0.4322

% It seems the number of observations is numerically the most important: it
% appears to closely approximate the true parameter. Increasing the number
% of simulations does not appear to help much (by stroke of bad luck, it
% even worsens the estimates). 

% We simulate a random variation of income to be allocated across goods x1
% and x2. We take p1=1 and p2=1.

clear;

reps    = 100;                                            % Choices of 100 individuals.
Ishock  = rand(reps, 1)*50                                % Model the shock to income.
x0      = [1, 1];                                         % Starting values for good 1 and good 2. 
P       = [1, 1];                                         % Fixed prices.
lb      = [0, 0];                                         % Lower bound.
c       = NaN(reps, 2)                                    % Where optimized consumption will end up in.
I       = 50                                              % Income is set to 50, so when the shock is applied, the income is U[50,100] (similar to the textbook).
opts    = optimset('algorithm', 'sqp', 'display', 'off'); % Same options as ConsumptionSim.
Inc     = NaN(reps, 1)                                    % Allocate space to save the income variation in.

for i = 1:reps                                            % For each individual (1 to 100).
    TempI   = I + Ishock(i, :);                           % Introduce the shock to the income.
    Inc(i)  = TempI                                       % We save the income for later use in the Engel curves.
    ub      = TempI./P                                    % Define the upper bound.
    c(i, :) = fmincon(@CobbDouglas, x0, P, TempI, [], [], lb, ub, [], opts)
end

% The result should be optimized amounts of consumption. Note that their
% sums add up to an income between 50 and 100 (since prices are taken to be
% unity).

% Plot the Engel curves for both goods, which shows how demand changes
% (holding prices fixed) when income changes.

% Engel curve for x1:

subplot(1, 2, 1)
scatter(c(:,1), Inc)
xlabel('Good 1 Consumption')
ylabel('Income')

% Engel curve for x2: 

subplot(1, 2, 1)
scatter(c(:,2), Inc)
xlabel('Good 2 Consumption')
ylabel('Income')

% These of course look exactly the same. 










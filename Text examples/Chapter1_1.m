DataIn = dlmread('auto.csv'); % We import the data sheet. We name this imported data DataIn.
whos('DataIn')
y = DataIn(:,1); % Take first column and call it y.
X = [DataIn(:, 2:3), ones(74,1)]; % Take second and third column and join them with a vector of ones. : denotes that every row is taken.

OLS(y,X) % Two matrices are now generated, one for the estimated betas and one for SEs, t

BetaHat = inv(X'*X)*X'*y % Calculate BetaHat according to the well-known matrix notation.


% We can then again make the relatively easy transition from the matrix
% notation of standard errors.



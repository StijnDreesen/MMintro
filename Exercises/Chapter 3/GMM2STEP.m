function Q = GMM2STEP(Beta,y,X) % Where Beta are the results from the first-stage estimates.

N = length(y);
K = size(X,2);

u = y - X*Beta;

% Here we implement the second step of the estimator (defining a new
% optimal weight matrix based on our first-stage estimates supplied by
% GMMobjective.m


A = (X'*(y-X*Beta))'*(X'*(y-X*Beta))
W = 1/N*sum(A)

m = 1/N*u'*X;
Q = m*W*m';


return

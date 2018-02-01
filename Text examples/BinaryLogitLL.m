function [LL, ll_i] = BinaryLogitLL(Beta, y, x) % Fixed code.

Lambda_xb = exp(x * Beta)./(1 + exp(x * Beta)); % Logistic CDF (4.6).

ll_i = y .* log(Lambda_xb) + (1 - y) .* log(1 - Lambda_xb); % Likelihood function (4.9).

LL          = -sum(ll_i);

return
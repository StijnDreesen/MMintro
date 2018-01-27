% (a): This is a constant absolute risk aversion function (also called the
% negative exponential utility function).
% The parameter r measures the agent's/consumer's risk aversion. 
% It determines how risk averse the agent is (assuming r>0). The higher
% r, the greater the concavity of this function and the more risk averse 
% the consumer user is. Interesting reads on this function: 

% https://www.tau.ac.il/~spiegel/teaching/corpfin/mean-variance.pdf
% http://static.luiss.it/hey/microeconomia/book/Ch24.pdf (part 24.5)


% (b): The certainty equivalent is the guaranteed return (utility) that the
% consumer would accept rather than taking the risk for a higher (but
% uncertain) utility. In other words, it is the amount of good x consumed
% which gives the same utility as taking the risk. The exercise asks for
% the value of this certainty equivalent if no insurance product (no risk)
% is involved.

% To find the CE, equalize the expected utility with the utility function
% and derive x: 

% - exp[0.5*s²*r²-mu*r] = - exp(-rx) <=> x =  -(0.5*s²*r) - mu <=> 

% x = mu -0.5r*s² --> the certainty equivalent.

% Note that the value of x is the certainty equivalent depends on how risk
% averse the consumer is, but als on the mean and variance of x (be it a
% good or even income).

% (c) Remember that when x>g, the consumer receives simply x. So it also
% gets utility associated with that x. Also remember that there is a
% certain probability that x<g and that the consumer then simply receives g.
% The expected utility when the insurance product exists is therefore:

% E(U) = p*E(U|x<g) + (1-p)*E(U|x>g) <=> E(U) = -p(exp(-r*g) +
% (1-p)*E[u|x>g]

% (d) We now assume x is instead drawn from a standard normal distribution
% with mean 0 and variance 1. Remember that the consumer need not pay
% anything for the product. We now use the function surplus.m:

[g, r] = meshgrid([-3:0.1:3], [0:0.1:1.5])




function LL = ProbitML(Beta,y,x) % Note: Defining a theta is not necessary: we just need Beta.
%----------------------------------------------
% PURPOSE: calculates the likelihood function
% for probit estimation.
%---------------------------------------------- 
% USAGE: LL = NormalML(theta,y,x)
% where: Beta : parameter vector 
%        y : N-by-1 dependent variable
%        x : N-by-K independent variable
%----------------------------------------------
% OUTPUT: LL = log-likelihood value
%----------------------------------------------
% Translate the text's formula from exercise i in a log-likelihood
% function. I broke up the code in several parts for clarity. Some often
% overlooked mistakes that might occur are doing element-by-element
% multiplication (not necessary) or not transposing y and Beta. 

a  = y'*log(normcdf(x*Beta'))
b  = (1-y)'*log(1-normcdf(x*Beta'))
c  = -sum(a+b)
LL = c

